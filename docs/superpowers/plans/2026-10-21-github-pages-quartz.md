# GitHub Pages 笔记网站（Quartz）实现计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 把 Obsidian vault（仓库根目录）发布为 `https://uret64bit.github.io/fpnu-cp-tutorial/` 笔记网站，push 到 master 后由 GitHub Actions 自动构建部署。

**Architecture:** Quartz v4 放在仓库 `site/` 子目录；`site/sync-content.sh` 把根目录笔记复制进 `site/content/`（README.md 复制为 index.md 当首页），CI 与本地共用同一脚本；GitHub Actions 用官方 pages 三件套（configure-pages / upload-pages-artifact / deploy-pages）部署。规格：`docs/superpowers/specs/2026-10-21-github-pages-quartz-design.md`。

**Tech Stack:** Quartz 4（Node ≥ 20）、GitHub Actions、GitHub Pages、bash/rsync。

**执行环境须知（重要）：**
- 仓库：`/home/uret64bit/cp-tutorial`，默认分支 `master`，直接提交到 master（本仓库惯例，无 PR 流程）。
- 工作区里有**用户自己未提交的笔记改动**（如 `02-C语言基础/第一个C程序.md`、`.obsidian/workspace.json`）。**任何提交都只 `git add` 计划中明确列出的路径，严禁 `git add -A` / `git add .`**，也不要把用户未提交的改动 stash 或还原。
- 本机已装 Node v24、npm 12；无 `gh` CLI，线上验证用公开 GitHub API + curl。
- 用户已在仓库 Settings → Pages 把 Source 设为 GitHub Actions，无需再配置。

---

### Task 1: 获取 Quartz 源码到 site/

**Files:**
- Create: `site/`（整个目录，来自官方仓库克隆）
- Delete: `site/.git`、`site/.github`、`site/content`（克隆自带的无关内容）

- [ ] **Step 1: 克隆 Quartz 官方仓库为 site/**

```bash
cd /home/uret64bit/cp-tutorial
git clone --depth 1 https://github.com/jackyzha0/quartz.git site
```

预期：克隆成功，出现 `site/package.json`。

- [ ] **Step 2: 去掉克隆自带的 git 历史、CI 与示例文档**

```bash
cd /home/uret64bit/cp-tutorial
rm -rf site/.git site/.github site/content
ls -a site | head -20
```

预期：`ls` 输出中不再有 `.git`、`.github`、`content`；能看到 `package.json`、`quartz.config.ts`、`quartz/` 等。

- [ ] **Step 3: 确认 package-lock.json 存在（npm ci 依赖它）**

```bash
ls /home/uret64bit/cp-tutorial/site/package-lock.json
```

预期：文件存在。若不存在（极少见）：`cd site && npm install` 生成后再继续，并把它加入 Step 4 的提交。

- [ ] **Step 4: 提交**

```bash
cd /home/uret64bit/cp-tutorial
git add site
git commit -m "build: 引入 Quartz v4 到 site/ 子目录

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

### Task 2: 同步脚本 + .gitignore + 取消跟踪 .obsidian

**Files:**
- Create: `site/sync-content.sh`
- Modify: `.gitignore`（追加生成目录）
- Modify: git index（`git rm -r --cached .obsidian`，本地文件保留）

- [ ] **Step 1: 写同步脚本**

创建 `site/sync-content.sh`，内容一字不差（实现记录：本机无 rsync，改用 tar 管道，行为等价）：

```bash
#!/usr/bin/env bash
# 把 vault 根目录的笔记同步到 site/content/，CI 与本地预览共用。
# 用 tar 管道复制（不依赖 rsync），排除工具/框架目录。
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONTENT_DIR="$REPO_ROOT/site/content"

rm -rf "$CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

tar -cf - \
  --exclude='./.git' \
  --exclude='./.obsidian' \
  --exclude='./.claude' \
  --exclude='./.github' \
  --exclude='./.gitignore' \
  --exclude='./site' \
  --exclude='./docs' \
  --exclude='./Outlines' \
  --exclude='node_modules' \
  -C "$REPO_ROOT" . | tar -xf - -C "$CONTENT_DIR"

# README 是现成的入口页，复制为 Quartz 首页
cp "$REPO_ROOT/README.md" "$CONTENT_DIR/index.md"

echo "synced: $(find "$CONTENT_DIR" -name '*.md' | wc -l) md files -> $CONTENT_DIR"
```

- [ ] **Step 2: 加执行权限并运行验证**

```bash
cd /home/uret64bit/cp-tutorial
chmod +x site/sync-content.sh
bash site/sync-content.sh
```

预期：输出 `synced: 47 md files -> .../site/content`（46 篇笔记 + index.md；若笔记数有增减，以“≥46 且含 index.md”为准）。

抽查：

```bash
ls site/content | head; test -f site/content/index.md && echo INDEX-OK; test -d "site/content/图片" && echo IMG-OK; test ! -e site/content/.obsidian && echo NO-OBSIDIAN-OK
```

预期：能看到 `DAY 1.md`、`00-导航` 等；三个标记 `INDEX-OK`、`IMG-OK`、`NO-OBSIDIAN-OK` 都输出。

- [ ] **Step 3: 更新 .gitignore**

在 `.gitignore` 末尾追加三行（保留原有 `Outlines/`、`.obsidian/` 两行）：

```
site/content/
site/public/
site/node_modules/
```

验证：`git status --short site/ | grep content` 应无输出（content/ 已被忽略；site/ 下 quartz 源码若已在 Task 1 提交则无未跟踪项）。

- [ ] **Step 4: 取消跟踪 .obsidian（本地文件保留）**

```bash
cd /home/uret64bit/cp-tutorial
git rm -r --cached .obsidian
ls .obsidian | head -3
```

预期：输出 `rm '.obsidian/...'` 若干行；`ls` 仍能看到本地文件（app.json 等）——只退出 git 跟踪，不删本地。

- [ ] **Step 5: 提交（只加列出的路径）**

```bash
cd /home/uret64bit/cp-tutorial
git add site/sync-content.sh .gitignore
git add -u .obsidian
git commit -m "build: 添加笔记同步脚本；忽略生成目录；.obsidian 退出 git 跟踪

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

### Task 3: 站点配置（标题 / 中文界面 / baseURL）

**Files:**
- Modify: `site/quartz.config.ts`

- [ ] **Step 1: 确认 zh-CN locale 受支持**

```bash
grep -o '"zh-CN"' /home/uret64bit/cp-tutorial/site/quartz/i18n.ts | head -1
```

预期：输出 `"zh-CN"`。若无输出，则后续步骤把 `zh-CN` 换成 `"zh"`（先 `grep -o '"zh"' site/quartz/i18n.ts` 确认存在）。

- [ ] **Step 2: 修改三项配置**

查看当前值：

```bash
grep -nE 'pageTitle:|locale:|baseUrl:' /home/uret64bit/cp-tutorial/site/quartz.config.ts | head -5
```

把（默认值可能随版本略有差异，以 grep 到的实际行为准做等价替换）：
- `pageTitle: "🪴 Quartz 4.0",` 改为 `pageTitle: "FPNU 编程集训队笔记归档",`
- `locale: "en-US",` 改为 `locale: "zh-CN",`
- `baseUrl: "quartz.jzhao.xyz",` 改为 `baseUrl: "uret64bit.github.io/fpnu-cp-tutorial",`

可用 sed：

```bash
cd /home/uret64bit/cp-tutorial/site
sed -i 's|^    pageTitle: .*|    pageTitle: "FPNU 编程集训队笔记归档",|' quartz.config.ts
sed -i 's|^    locale: .*|    locale: "zh-CN",|' quartz.config.ts
sed -i 's|^    baseUrl: .*|    baseUrl: "uret64bit.github.io/fpnu-cp-tutorial",|' quartz.config.ts
grep -nE 'pageTitle:|locale:|baseUrl:' quartz.config.ts
```

预期：三行均为新值。若 grep 显示某行缩进不是 4 空格导致 sed 未命中，用编辑器手工改该行。

- [ ] **Step 3: 确认 ignorePatterns 最小化**

```bash
grep -n 'ignorePatterns' /home/uret64bit/cp-tutorial/site/quartz.config.ts
```

预期与处理：
- 若无输出：Quartz 默认即 `["node_modules"]`，无需改动。
- 若该行存在且值不是 `["node_modules"]`（例如包含 `"content"` 或 `"public"`）：改为 `ignorePatterns: ["node_modules"],`，再 `grep -n ignorePatterns site/quartz.config.ts` 复核。

- [ ] **Step 4: 提交**

```bash
cd /home/uret64bit/cp-tutorial
git add site/quartz.config.ts
git commit -m "feat: 站点标题、中文界面与 Pages baseURL 配置

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

### Task 4: 本地构建验证

**Files:**
- 无入库改动（`site/node_modules/`、`site/public/`、`site/content/` 均已 gitignore）

- [ ] **Step 1: 安装依赖**

```bash
cd /home/uret64bit/cp-tutorial/site
npm install
```

预期：无 error 退出（warn 可忽略；耗时约 1 分钟）。

- [ ] **Step 2: 同步内容并构建**

```bash
cd /home/uret64bit/cp-tutorial
bash site/sync-content.sh
cd site && npx quartz build
```

预期：构建无 error，结尾打印每个页面的输出列表；生成 `site/public/`。

- [ ] **Step 3: 检查构建产物**

```bash
cd /home/uret64bit/cp-tutorial/site
test -f public/index.html && echo HOME-OK
grep -c "FPNU 编程集训队笔记归档" public/index.html
find public -name '*.html' | wc -l
grep -rl "Pasted image" public --include='*.html' | head -3
```

预期：`HOME-OK`；计数 ≥ 1；html 数 ≥ 40；能列出至少 1 个引用了 `Pasted image` 图片的页面（图片嵌入生效）。

- [ ] **Step 4: 本地起服务抽查（可选但推荐）**

```bash
cd /home/uret64bit/cp-tutorial/site
npx quartz build --serve &
SERVER_PID=$!
sleep 8
curl -s http://localhost:8080/ | grep -o '<title>[^<]*</title>'
curl -s -o /dev/null -w '%{http_code}\n' "http://localhost:8080/$(python3 -c "import urllib.parse;print(urllib.parse.quote('教学大纲'))")"
kill $SERVER_PID
```

预期：title 含站点标题；教学大纲页返回 200。若主会话有浏览器工具，可再人工/自动打开 `http://localhost:8080` 抽查双链跳转与图谱。

---

### Task 5: GitHub Actions 工作流

**Files:**
- Create: `.github/workflows/deploy-site.yml`

- [ ] **Step 1: 写工作流文件**

创建 `.github/workflows/deploy-site.yml`，内容一字不差：

```yaml
name: Deploy notes site to GitHub Pages

on:
  push:
    branches: [master]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: npm
          cache-dependency-path: site/package-lock.json
      - name: Sync notes into site/content
        run: bash site/sync-content.sh
      - name: Install dependencies
        working-directory: site
        run: npm ci
      - name: Build with Quartz
        working-directory: site
        run: npx quartz build
      - uses: actions/configure-pages@v5
      - uses: actions/upload-pages-artifact@v3
        with:
          path: site/public
  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - id: deployment
        uses: actions/deploy-pages@v4
```

- [ ] **Step 2: YAML 语法自检**

```bash
python3 -c "import yaml,sys; yaml.safe_load(open('/home/uret64bit/cp-tutorial/.github/workflows/deploy-site.yml')); print('YAML-OK')"
```

预期：输出 `YAML-OK`。（若本机无 pyyaml：`pip install pyyaml --user` 或跳过，交由 Step 3 提交后 Actions 验证。）

- [ ] **Step 3: 提交**

```bash
cd /home/uret64bit/cp-tutorial
git add .github/workflows/deploy-site.yml
git commit -m "ci: push 后自动构建并部署 Quartz 站点到 GitHub Pages

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

### Task 6: 推送并验证线上

**Files:** 无新改动（推送 Task 1–5 的提交）

- [ ] **Step 1: 推送**

```bash
cd /home/uret64bit/cp-tutorial
git log --oneline origin/master..master
git push origin master
```

预期：待推送列表包含 Task 1–5 的提交（外加此前的 docs 规格提交）；push 成功。用户未提交的笔记改动不受影响、不会被推送。

- [ ] **Step 2: 轮询 Actions 运行状态（约 2–4 分钟）**

```bash
curl -s "https://api.github.com/repos/uret64bit/fpnu-cp-tutorial/actions/runs?per_page=1" | grep -E '"(status|conclusion|html_url)"' | head -3
```

每隔约 30 秒重复，直到 `"status": "completed"`；预期 `"conclusion": "success"`。若失败：打开输出中的 `html_url` 查看日志，修复后重新提交推送（常见原因：Pages Source 未设为 GitHub Actions、lockfile 缺失）。

- [ ] **Step 3: 验证线上网站**

```bash
curl -s -o /dev/null -w '%{http_code}\n' https://uret64bit.github.io/fpnu-cp-tutorial/
curl -s https://uret64bit.github.io/fpnu-cp-tutorial/ | grep -c "教学大纲"
curl -s -o /dev/null -w '%{http_code}\n' "https://uret64bit.github.io/fpnu-cp-tutorial/$(python3 -c "import urllib.parse;print(urllib.parse.quote('教学大纲'))")"
```

预期：`200`；计数 ≥ 1；`200`。部署刚完成时 CDN 可能有约 1 分钟延迟，404 就稍候重试。

- [ ] **Step 4: 汇报**

向用户汇报网站地址、本次流水线各任务结果，以及日常使用方式（在 Obsidian 写笔记 → `git push` → 约 3 分钟后网站自动更新）。
