import path from "path"
import { FilePath } from "./path"
import { globby } from "globby"

export function toPosixPath(fp: string): string {
  return fp.split(path.sep).join("/")
}

export async function glob(
  pattern: string,
  cwd: string,
  ignorePatterns: string[],
): Promise<FilePath[]> {
  const fps = (
    await globby(pattern, {
      cwd,
      ignore: ignorePatterns,
      // 本地补丁（勿在升级 Quartz 时丢失）：content/ 是 sync-content.sh 生成的目录，
      // 且被仓库根 .gitignore 的 site/content/ 规则忽略；若保留 gitignore: true，
      // globby 会据此跳过全部笔记（Parsed 0 Markdown files）。
      gitignore: false,
    })
  ).map(toPosixPath)
  return fps as FilePath[]
}
