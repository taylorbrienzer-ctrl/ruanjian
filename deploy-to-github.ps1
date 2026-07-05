param(
  [Parameter(Mandatory = $true)]
  [string]$RepositoryUrl,

  [string]$RemoteName = "origin"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path ".git")) {
  git init
  git branch -M main
}

$currentBranch = (git branch --show-current).Trim()
if ($currentBranch -ne "main") {
  git branch -M main
}

$hasRemote = git remote | Where-Object { $_ -eq $RemoteName }
if ($hasRemote) {
  git remote set-url $RemoteName $RepositoryUrl
} else {
  git remote add $RemoteName $RepositoryUrl
}

git add .
$pending = git status --porcelain
if ($pending) {
  git commit -m "Update Ling Shan AI guide frontend"
}

git push -u $RemoteName main

Write-Host ""
Write-Host "Pushed to $RepositoryUrl"
Write-Host "Open the GitHub repository Settings -> Pages and choose GitHub Actions, or wait for the bundled Pages workflow."
