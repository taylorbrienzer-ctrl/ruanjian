# GitHub Pages 部署清单

当前目录已经按静态站点组织，可作为 GitHub Pages 根目录部署。

## 当前部署结果

仓库地址：

```text
https://github.com/taylorbrienzer-ctrl/ruanjian
```

Pages 地址：

```text
https://taylorbrienzer-ctrl.github.io/ruanjian/
```

部署方式：GitHub Actions，工作流文件为 `.github/workflows/pages.yml`。

## 方式一：仓库根目录部署

适合已有仓库或新建仓库。

1. 将 `lingshan-ai-guide` 目录下的所有内容复制到目标仓库根目录。
2. 提交并推送到 `main` 或 `master` 分支。
3. 进入 GitHub 仓库 `Settings -> Pages`。
4. 若使用静态分支部署，选择 `Deploy from a branch`，目录选择 `/root`。
5. 若使用 Actions 部署，选择 `GitHub Actions`，本项目已提供 `.github/workflows/pages.yml`。

## 方式二：docs 目录部署

适合目标仓库已有其他代码。

1. 将 `index.html`、`assets/`、`docs/`、`.nojekyll` 复制到目标仓库的 `docs/` 目录。
2. 进入 `Settings -> Pages`。
3. Source 选择目标分支，目录选择 `/docs`。

注意：如果使用本方式，不要把本项目的 `.github/workflows/pages.yml` 原样放入仓库，除非希望 Actions 从仓库根目录部署。

## 方式三：Actions 部署

本项目已内置 `.github/workflows/pages.yml`。若目标仓库启用 GitHub Actions Pages：

1. 将本目录内容放到目标仓库根目录。
2. 推送到 `main` 或 `master`。
3. 到 `Actions` 页面查看 `Deploy static site to GitHub Pages` 工作流。
4. 部署成功后，页面地址会显示在工作流输出和仓库 `Settings -> Pages`。

工作流会把 `index.html`、`assets/`、`docs/`、`README.md` 和 `.nojekyll` 复制到 `_site` 后部署，官方资料包仅作为本地佐证材料保留，不会进入 Pages 发布物。

## 当前限制

历史说明：最初工作区 `C:\Users\32322\Desktop\bisai` 不是 Git 仓库，本机未安装 GitHub CLI。获得目标仓库地址后，已将 `lingshan-ai-guide` 初始化为本地 Git 仓库并推送到 `taylorbrienzer-ctrl/ruanjian`。

## 已准备好的本地推送脚本

本目录已经初始化为 Git 仓库，默认分支为 `main`。拿到目标仓库地址后，可在本目录运行：

```powershell
.\deploy-to-github.ps1 -RepositoryUrl "https://github.com/<your-name>/<repo>.git"
```

脚本会执行：

1. 设置或更新 `origin` 远端。
2. 提交本地未提交变更。
3. 推送 `main` 分支。
4. 提醒在 GitHub Pages 中选择 GitHub Actions。
