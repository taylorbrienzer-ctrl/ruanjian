# 灵山 AI 数字人导览前端演示

这是面向第十五届中国软件杯 A5《景区导览服务AI数字人》的静态前端演示项目。

## 文件结构

```text
lingshan-ai-guide/
  index.html
  assets/
    lingshan-hero.png
  docs/
    00_requirement_constraints.md
    01_function_matrix.md
    02_ui_research.md
    03_api_design.md
    04_github_pages_deployment.md
  .github/
    workflows/
      pages.yml
  .nojekyll
  deploy-to-github.ps1
  official/
    scenic-package.zip
    scenic-package/
```

## 本地预览

在本目录运行：

```bash
python -m http.server 8080
```

然后访问：

```text
http://localhost:8080/
```

## GitHub Pages 托管

当前已部署仓库：

```text
https://github.com/taylorbrienzer-ctrl/ruanjian
```

线上页面：

```text
https://taylorbrienzer-ctrl.github.io/ruanjian/
```

将 `lingshan-ai-guide` 文件夹中的内容放到 GitHub Pages 仓库根目录，或放到仓库的 `docs/` 目录后在仓库 Settings -> Pages 中选择对应分支和目录。

推荐方式：

1. 仓库根目录托管：把 `index.html`、`assets/`、`docs/` 上传到仓库根目录。
2. `docs/` 目录托管：把本项目内容整体放入仓库 `docs/`，并在 Pages Source 选择 `docs`。
3. GitHub Actions 托管：把本项目内容放入仓库根目录后启用 Pages 的 GitHub Actions，本项目已包含 `.github/workflows/pages.yml`。

详细步骤见 `docs/04_github_pages_deployment.md`。

如果已有目标仓库地址，可在本目录运行：

```powershell
.\deploy-to-github.ps1 -RepositoryUrl "https://github.com/<your-name>/<repo>.git"
```

## 说明

当前交付以“前端界面 + 后端接口设计”为边界。真实后端可按 `docs/03_api_design.md` 实现 REST、SSE 或 WebSocket 接口。
