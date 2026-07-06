param(
  [Parameter(Mandatory = $true)]
  [string]$RepositoryUrl,

  [string]$RemoteName = "origin"
)

$ErrorActionPreference = "Stop"

function Invoke-Git {
  param(
    [Parameter(Mandatory = $true)]
    [string[]]$Arguments
  )

  & git @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "git $($Arguments -join ' ') failed with exit code $LASTEXITCODE"
  }
}

if (-not (Test-Path ".git")) {
  Invoke-Git @("init")
  Invoke-Git @("branch", "-M", "main")
}

$currentBranch = (& git branch --show-current).Trim()
if ($currentBranch -ne "main") {
  Invoke-Git @("branch", "-M", "main")
}

$hasRemote = & git remote | Where-Object { $_ -eq $RemoteName }
if ($hasRemote) {
  Invoke-Git @("remote", "set-url", $RemoteName, $RepositoryUrl)
} else {
  Invoke-Git @("remote", "add", $RemoteName, $RepositoryUrl)
}

Invoke-Git @("add", ".")
$pending = & git status --porcelain
if ($pending) {
  Invoke-Git @("commit", "-m", "Update Ling Shan AI guide frontend")
}

Invoke-Git @("push", "-u", $RemoteName, "main")

Write-Host ""
Write-Host "Pushed to $RepositoryUrl"
Write-Host "Open the GitHub repository Settings -> Pages and choose GitHub Actions, or wait for the bundled Pages workflow."
