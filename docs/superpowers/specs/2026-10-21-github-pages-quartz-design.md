# 设计规格：GitHub Pages 笔记网站（Quartz）

- 日期：2026-10-21
- 仓库：`github.com/uret64bit/fpnu-cp-tutorial`（公开，默认分支 `master`）
- 目标网址：`https://uret64bit.github.io/fpnu-cp-tutorial/`

## 1. 背景与目标

vault 是 Obsidian 原子笔记 + `[[双链]]` + `![[图片嵌入]]` 组织的 C/C++ 竞赛教学笔记（46 篇 md，含中文与带空格文件名）。目标：用 GitHub 自带功能（Pages + Actions）把全部笔记发布为可浏览的笔记网站，push 后自动部署，无需服务器。

选定方案 A：Quartz 放在仓库 `site/` 子目录，笔记目录结构零改动。

## 2. 仓库变更清单

| 路径 | 动作 |
|---|---|
| `site/` | 新增：Quartz v4 最新版源码（克隆官方仓库后删除其 `.git`，作为普通目录提交） |
| `site/quartz.config.ts` | 修改：标题、locale、baseUrl、ignorePatterns |
| `site/sync-content.sh` | 新增：笔记同步脚本（CI 与本地共用） |
| `site/content/`、`site/public/`、`site/node_modules/` | 不入库（`.gitignore`），由脚本/构建生成 |
| `site/package-lock.json` | 提交，锁定依赖保证 CI 可复现 |
| `.github/workflows/deploy-site.yml` | 新增：构建部署工作流 |
| `.gitignore` | 追加上述生成目录 |
| `.obsidian/` | `git rm -r --cached`（退出跟踪，本地保留；`.gitignore` 已含该目录） |

## 3. sync-content.sh

单一同步逻辑来源，本地预览与 CI 都调用它：

1. 清空并重建 `site/content/`
2. 从仓库根复制全部笔记与 `图片/`，排除：`.git`、`.obsidian`、`.claude`、`.github`、`site`、`docs`、`node_modules`、`Outlines`
3. `cp README.md site/content/index.md` 作为网站首页（README 是现成入口页；Quartz 默认忽略 content 内的 README.md，复制为 index.md 绕开）

## 4. 站点配置（quartz.config.ts）

- `pageTitle`: `FPNU 编程集训队笔记归档`
- `locale`: `zh-CN`（若该版本不支持则退回 `zh`，实现时验证）
- `baseUrl`: `uret64bit.github.io/fpnu-cp-tutorial`
- `ignorePatterns`: `["node_modules"]`（同步脚本已排除杂项，保持最小化避免误伤正常笔记）
- 其余功能保留 Quartz 默认：graph、backlinks、search（中文全文可用）、darkmode、TOC

不做：自定义主题、评论、统计、自定义域名（YAGNI）。

## 5. CI 工作流（deploy-site.yml）

- 触发：`push` 到 `master` + `workflow_dispatch`
- 权限：`pages: write`、`id-token: write`、`contents: read`；concurrency group `pages`
- 步骤：checkout → setup-node（Node 22，含 npm 缓存）→ `bash site/sync-content.sh` → `npm ci`（working-directory: site）→ `npx quartz build`（working-directory: site）→ `actions/upload-pages-artifact`（path: `site/public`）→ `actions/deploy-pages`
- 前置条件（用户已完成）：仓库 Settings → Pages → Source = GitHub Actions

## 6. 错误处理

- Actions 失败：网站保持上一次成功部署版本；在 Actions 页看日志修复后重新 push
- `npm ci` 依赖 `package-lock.json`，必须随 Quartz 源码一并提交
- 中文/带空格文件名：Quartz 自动 URL 编码，无需处理
- 用户 vault 内未提交的笔记改动与本设计无关，实现时只提交本设计涉及的文件

## 7. 验证计划

1. 本地：`bash site/sync-content.sh && cd site && npx quartz build --serve`，用浏览器检查：首页（README 内容 + 双链可点）、任一笔记的反向链接、图片渲染、图谱、中文搜索
2. push 后：GitHub API 查 Actions run 状态为 completed/success
3. 线上：`curl` 目标网址返回 200，抽查一个含图片的笔记页

## 8. 发布范围

全部 46 篇笔记 + 图片，与公开仓库内容一致（用户已确认）。`docs/`（本规格所在目录）不发布。
