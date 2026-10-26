# Day 4 内容（函数、结构体、排序）Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 按设计规格（`docs/superpowers/specs/2026-10-26-day4-functions-struct-sort-design.md`）新建 4 篇原子笔记 + `DAY 4.md` 课程页，并同步索引、大纲与旧预告，使学生课后可按页自测刷题。

**Architecture:** 纯 Markdown 内容（Obsidian 原子笔记 + `[[双链]]`），沿用 Day 1–3 模板（一句话 callout → 正文 → 易错点 → 竞赛提示 → 练一练 → 相关笔记）。验证靠 Quartz 构建（`site/` 子目录）确认解析数与页面生成。

**Tech Stack:** Markdown / Obsidian wikilinks / Quartz 4 构建 / 洛谷题目链接（外部域名 `www.luogu.com.cn`；站内链接一律用 `[[wikilink]]`，不用相对路径）。

## 执行须知（先读）

- **提交策略**：按仓库既定惯例，所有笔记改动**攒到用户过目后一次性提交**（Day 3 同款流程）——用户明确偏好优先于"每任务提交"。计划执行期间只建文件、不 commit。
- **暂存纪律**：最终提交只列明确路径，**绝不用 `git add -A` / `git add .`**。
- **不碰**：`02-C语言基础/第一个C程序.md`（用户自己的未完成改动，不读不写不提交）；`讲课稿/`（本次无讲课稿）。
- **文风**：全中文；`一句话` callout 用 `> [!info] 一句话`；技巧用 `> [!tip] 竞赛提示`，警告用 `> [!warning]`；正文代码块统一 ` ```cpp `。文中出现的"Day 4"字面保留（课程页标题惯例）。

---

### Task 1: 新建 `02-C语言基础/函数.md`

**Files:**
- Create: `02-C语言基础/函数.md`

- [ ] **Step 1: 写入文件**

frontmatter：

```yaml
---
tags:
  - C语言
  - 基础语法
aliases:
  - 自定义函数
---
```

正文结构（按顺序）：

1. `# 函数`
2. 一句话 callout，原文：`函数是把一段代码打包起名字，用的时候"调用"它——重复的逻辑写一次就够。`
3. `## 为什么要有函数`：举例"判断质数"要在程序里写三遍 → 抽成 `isPrime`，写一次、到处调用。
4. `## 定义与调用`，代码块：

```cpp
int add(int a, int b) {   // 返回类型 函数名(参数表)
    return a + b;         // return 把结果交回去
}

int main() {
    int s = add(3, 5);    // 调用：实参 3、5 复制给形参 a、b
    printf("%d\n", s);    // 8
}
```

5. `## 参数与返回值`：
   - 形参 / 实参术语；**值传递**：实参复制给形参，函数里改形参不影响外面（配一段小例子：`void f(int x) { x = 100; }` 调用后原变量不变）。
   - `void` 表示没有返回值；有返回值就必须 `return`。
6. `## 定义的位置`：函数写在 `main` 前面（先定义后使用）；`main` 也是最普通的函数（链 [[竞赛代码模板]]）。
7. `## 数组作为函数参数`，代码块：

```cpp
int sum(int a[], int n) {   // 数组和长度必须一起传
    int s = 0;
    for (int i = 0; i < n; i++) s += a[i];
    return s;
}
```

   - 要点：传的是**首地址**、长度必须另传（函数里 `sizeof` 量不出长度）；**函数里改 `a[i]`，外面的数组跟着变**（和普通变量不同，因为操作的是同一块内存）。
8. `## 常见错误`（每条配一句说明）：忘写返回类型；有返回值的函数忘了 `return`；把函数定义写在 `main` 里面（C++ 不允许嵌套定义）；参数个数/类型对不上。
9. `> [!tip] 竞赛提示`：把重复逻辑抽成函数（`isPrime` 判质数、`gcd` 求最大公约数）；函数名用动词；先想清楚"进什么、出什么"再写。
10. `## 练一练`：
    - `[P5735 距离函数](https://www.luogu.com.cn/problem/P5735)：写第一个函数。`
    - `[P5736 质数筛](https://www.luogu.com.cn/problem/P5736)：函数 + 数组遍历。`
11. `## 相关笔记`：`[[变量]]`、`[[数组]]`、`[[竞赛代码模板]]`、`[[结构体]]`、`[[排序]]`

- [ ] **Step 2: 检查链接目标都存在**

```bash
cd /home/uret64bit/cp-tutorial && grep -oh '\[\[[^]|#]*' "02-C语言基础/函数.md" | sed 's/\[\[//' | sort -u | while read -r l; do find . -name "$l.md" -not -path './.git/*' -not -path './site/*' | grep -q . || echo "MISSING: $l"; done; echo checked
```

预期：只输出 `checked`（无 MISSING）——注意 `[[结构体]]`、`[[排序]]` 此刻尚未创建，会报 MISSING，属预期；Task 3、4 完成后消失。

---

### Task 2: 新建 `02-C语言基础/为什么要用结构体.md`

**Files:**
- Create: `02-C语言基础/为什么要用结构体.md`

- [ ] **Step 1: 写入文件**

frontmatter：

```yaml
---
tags:
  - C语言
  - 基础语法
aliases:
  - 结构体好处
---
```

正文结构（按顺序）：

1. `# 为什么要用结构体`
2. 一句话 callout，原文：`一个人的名字和分数本该是一个整体；拆成两个数组存，一排序就"散架"。`
3. `## 平行数组的麻烦`，代码块：

```cpp
char name[3][20] = {"Tom", "Amy", "Bob"};
int  score[3]    = { 90,   95,   88 };

// 想按分数排序？交换 score[i] 和 score[j] 时，
// 必须记得同时交换 name[i] 和 name[j]——
// 忘一次，名字和分数就对不上了
```

   然后文字点出第二个麻烦：交换要用临时变量、两处一起动，手写排序写一遍错一遍。
4. `## 打包成一条记录`，代码块：

```cpp
struct Student { char name[20]; int score; };

Student a[3] = { {"Tom", 90}, {"Amy", 95}, {"Bob", 88} };
// 交换 a[i] 和 a[j]：名字和分数整体一起动，不会散
```

5. `## 什么时候该用`：多个字段总是一起出现、说的是"一条记录"——学生、商品、日期、坐标。
6. `## 这还只是开始`：结构体的真正威力在排序——给 `cmp` 一个字段就能按分数排（见 [[排序]]）；结构体 + 排序是"排行榜""成绩单"类题目的标准解法。
7. `## 相关笔记`：`[[结构体]]`、`[[排序]]`、`[[数组]]`、`[[typedef类型别名]]`

- [ ] **Step 2: 检查链接目标都存在**

```bash
cd /home/uret64bit/cp-tutorial && grep -oh '\[\[[^]|#]*' "02-C语言基础/为什么要用结构体.md" | sed 's/\[\[//' | sort -u | while read -r l; do find . -name "$l.md" -not -path './.git/*' -not -path './site/*' | grep -q . || echo "MISSING: $l"; done; echo checked
```

预期：`[[结构体]]`、`[[排序]]` 暂报 MISSING（Task 3、4 创建后消失），其余无 MISSING。

---

### Task 3: 新建 `02-C语言基础/结构体.md`

**Files:**
- Create: `02-C语言基础/结构体.md`

- [ ] **Step 1: 写入文件**

frontmatter：

```yaml
---
tags:
  - C语言
  - 基础语法
aliases:
  - struct
  - 结构体数组
---
```

正文结构（按顺序）：

1. `# 结构体`
2. 一句话 callout，原文：`结构体把几个不同类型的数据打包成一种新类型，用 . 访问成员。`
3. `## 定义`，代码块（强调末尾分号）：

```cpp
struct Student {
    char name[20];   // 成员：名字
    int  score;      // 成员：分数
};                   // 千万别忘了这个分号！
```

4. `## 声明变量与访问成员`，代码块：

```cpp
Student s;
s.score = 90;                       // 用 . 访问成员

scanf("%s%d", s.name, &s.score);    // name 是数组，不加 &；score 要加 &
printf("%s %d\n", s.name, s.score);
```

5. `## 初始化`：`Student s = {"Tom", 90};`（按成员顺序）。
6. `## 结构体数组`，代码块：

```cpp
Student a[1005];
for (int i = 0; i < n; i++) {
    scanf("%s%d", a[i].name, &a[i].score);
}
```

   补一句：定义在 `main` 外面的全局结构体数组自动清零（链 [[数组]]）。
7. `## 配合 typedef`：C++ 里 `struct Student {...};` 之后可以直接写 `Student s;`；但题解和模板里常见 `typedef struct {...} Stu;` 写法，两种等价，比赛跟着模板走即可 —— 详见 [[typedef类型别名]]。
8. `## 整体操作的限制`：可以整体赋值（`s2 = s1;`）；**不能**整条 `scanf`/`printf`（得逐字段）；**不能**用 `==` 比较（要逐字段比）。
9. `## 易错点`（`> [!warning]` 或列表）：定义末尾忘分号；`scanf` 里 `name` 多加了 `&`（或 `score` 漏了 `&`）；比较两个结构体写了 `==`。
10. `> [!tip] 竞赛提示`：排行榜/成绩单题 = 结构体数组 + `sort` + 自定义 `cmp`，Day 4 作业会整套用到。
11. `## 练一练`：
    - `[P5740 最厉害的学生](https://www.luogu.com.cn/problem/P5740)：结构体读入与比较。`
    - `[P5742 评等级](https://www.luogu.com.cn/problem/P5742)：结构体 + 条件判断。`
12. `## 相关笔记`：`[[为什么要用结构体]]`、`[[排序]]`、`[[typedef类型别名]]`、`[[数组]]`、`[[函数]]`

- [ ] **Step 2: 检查链接目标都存在**

```bash
cd /home/uret64bit/cp-tutorial && grep -oh '\[\[[^]|#]*' "02-C语言基础/结构体.md" | sed 's/\[\[//' | sort -u | while read -r l; do find . -name "$l.md" -not -path './.git/*' -not -path './site/*' | grep -q . || echo "MISSING: $l"; done; echo checked
```

预期：若 Task 4 未做，`[[排序]]` 报 MISSING；其余无 MISSING。

---

### Task 4: 新建 `02-C语言基础/排序.md`

**Files:**
- Create: `02-C语言基础/排序.md`

- [ ] **Step 1: 写入文件**

frontmatter：

```yaml
---
tags:
  - C语言
  - 基础语法
aliases:
  - sort
  - 自定义排序
---
```

正文结构（按顺序）：

1. `# 排序`
2. 一句话 callout，原文：`sort 一行就能把数组排好序，默认从小到大；给它一个 cmp，就能按你定的规则排。`
3. `## 基本用法`，代码块：

```cpp
#include <algorithm>         // 竞赛模板的 bits/stdc++.h 已包含

int a[5] = {3, 1, 4, 2, 5};
sort(a, a + 5);              // 1 2 3 4 5
```

   要点：区间是**左闭右开** `[a, a+n)`，排序 n 个数写 `a` 和 `a + n`；1-based 数组写 `sort(a + 1, a + n + 1)`。
4. `## 为什么不用自己写排序`：冒泡排序是 $O(n^2)$，$n$ 到 $10^5$ 就超时；`sort` 是 $O(n\log n)$（链 [[时间复杂度入门]]）。竞赛里**一律用 `sort`**。
5. `## 降序：自定义 cmp`，代码块：

```cpp
bool cmp(int a, int b) {
    return a > b;        // "a 比 b 更该排在前面"
}
sort(a, a + n, cmp);     // 从大到小
```

   口诀：**`cmp(a, b)` 返回 true，就表示 a 排在 b 前面**；`return a > b` 即降序。
6. `## 按结构体字段排序（多关键字）`，代码块：

```cpp
bool cmp(Student x, Student y) {
    if (x.score != y.score) return x.score > y.score;  // 总分高的在前
    return x.id < y.id;                                 // 同分，学号小的在前
}
sort(a, a + n, cmp);
```

   这就是 [[为什么要用结构体]] 的兑现：一个字段一个字段地比，排行榜题都这么写（P1093 奖学金同款规则）。
7. `## 易错点`：
   - `cmp` 必须"严格"：只能用 `<` 或 `>`，写成 `<=`/`>=` 可能乱序甚至运行时错误；
   - 区间写错：`sort(a, a + n - 1)` 会漏掉最后一个元素；
   - `sort` 排的是"区间里的元素"，不返回新数组。
8. `> [!tip] 竞赛提示`：多关键字排序 = `if` 链逐字段比较；输出前注意题目要求的格式。
9. `## 练一练`：
   - `[P1177 快速排序](https://www.luogu.com.cn/problem/P1177)：sort 一行过（模板题）。`
   - `[P1093 奖学金](https://www.luogu.com.cn/problem/P1093)：多关键字排序，本讲集大成。`
   - `[P1104 生日](https://www.luogu.com.cn/problem/P1104)：日期排序。`
10. `## 相关笔记`：`[[为什么要用结构体]]`、`[[结构体]]`、`[[函数]]`、`[[时间复杂度入门]]`

- [ ] **Step 2: 检查链接目标都存在**

```bash
cd /home/uret64bit/cp-tutorial && grep -oh '\[\[[^]|#]*' "02-C语言基础/排序.md" | sed 's/\[\[//' | sort -u | while read -r l; do find . -name "$l.md" -not -path './.git/*' -not -path './site/*' | grep -q . || echo "MISSING: $l"; done; echo checked
```

预期：只输出 `checked`（此刻 5 篇目标笔记应已齐）。

---

### Task 5: 新建 `DAY 4.md` 课程页

**Files:**
- Create: `DAY 4.md`

- [ ] **Step 1: 写入文件（全文如下，可直接使用）**

```markdown
---
tags:
  - 导航
  - 课程
aliases:
  - Day4
  - 第四天
---

# Day 4：函数、结构体与排序

> [!info] 本页说明
> 本页是**课程索引**，按上课顺序把笔记串起来；每篇笔记只讲一个概念。对应 [[教学大纲]] 第 6～7 讲主体（函数、结构体与排序）；递归与第 5 讲（字符串、二维数组）后续单独安排。

## 学习目标

- 会定义和调用函数：参数、返回值、数组作为参数。
- 能说出为什么要用结构体；会定义结构体、结构体数组，用 `.` 访问成员。
- 会用 `sort` 排序数组，会写自定义 `cmp`，包括按结构体字段多关键字排序。

## 路线一：函数

- [ ] [[函数]]：定义、调用、参数、返回值、数组传参
- [ ] 复习 [[变量]]：作用域（局部/全局）
- [ ] 复习 [[数组]]：批量读入，等下要整体传给函数

## 路线二：结构体

- [ ] [[为什么要用结构体]]：平行数组的痛点
- [ ] [[结构体]]：定义、成员访问、结构体数组
- [ ] 复习 [[typedef类型别名]]：`struct` 的竞赛写法

## 路线三：排序

- [ ] [[排序]]：`sort` 基本用法、自定义 `cmp`、按字段排序

## 拓展（选读）

- [ ] [[时间复杂度入门]]：`sort` 的 $O(n\log n)$ 和冒泡 $O(n^2)$ 差在哪

## 课后作业

### 必做

1. [P5735 距离函数](https://www.luogu.com.cn/problem/P5735)：写第一个函数。
2. [P5736 质数筛](https://www.luogu.com.cn/problem/P5736)：函数 + 数组遍历。
3. [P5740 最厉害的学生](https://www.luogu.com.cn/problem/P5740)：结构体读入与比较。
4. [P1177 快速排序](https://www.luogu.com.cn/problem/P1177)：`sort` 一行过。

### 选做

- [P5742 评等级](https://www.luogu.com.cn/problem/P5742)：结构体 + 条件判断。
- [P5741 旗鼓相当的对手](https://www.luogu.com.cn/problem/P5741)：结构体多字段比较。
- [P5738 歌唱比赛](https://www.luogu.com.cn/problem/P5738)：结构体 + 最值/平均。

### 挑战

- [P1093 奖学金](https://www.luogu.com.cn/problem/P1093)：多关键字排序，本讲集大成。
- [P1104 生日](https://www.luogu.com.cn/problem/P1104)：日期排序。

## 学完自检

- [ ] 会写带参数和返回值的函数，并在 `main` 里调用。
- [ ] 知道数组传参要另传长度；函数里改数组元素，外面跟着变。
- [ ] 能说出平行数组的问题，解释为什么要用结构体。
- [ ] 会定义结构体（含 `typedef` 写法），声明结构体数组并读入（`name` 不加 `&`）。
- [ ] 会用 `sort`，知道区间左闭右开。
- [ ] 会写 `cmp` 按结构体字段排序，能说清"返回 true 表示谁排前面"。

## 相关索引

- [[语言基础索引]]
- [[DAY 3]]
- [[教学大纲]]
```

- [ ] **Step 2: 检查链接目标都存在**

```bash
cd /home/uret64bit/cp-tutorial && grep -oh '\[\[[^]|#]*' "DAY 4.md" | sed 's/\[\[//' | sort -u | while read -r l; do find . -name "$l.md" -not -path './.git/*' -not -path './site/*' | grep -q . || echo "MISSING: $l"; done; echo checked
```

预期：只输出 `checked`。

---

### Task 6: 同步索引、大纲与旧预告（7 个文件的修改）

**Files:**
- Modify: `00-导航/语言基础索引.md`
- Modify: `教学大纲.md`
- Modify: `README.md`
- Modify: `02-C语言基础/竞赛代码模板.md`
- Modify: `02-C语言基础/数组.md`
- Modify: `02-C语言基础/基本数据类型.md`
- Modify: `02-C语言基础/typedef类型别名.md`

- [ ] **Step 1: `00-导航/语言基础索引.md`——在「5. 数组」节后插入两节，删除「6. 预告（后面讲次）」整节，「调试」标题改为「8. 调试」**

插入内容（放在 `## 5. 数组` 表格之后、原 `## 6. 预告（后面讲次）` 位置）：

```markdown
## 6. 函数

| 笔记 | 一句话 |
| --- | --- |
| [[函数]] | 把重复代码打包，参数进、返回值出 |

## 7. 结构体与排序

| 笔记 | 一句话 |
| --- | --- |
| [[为什么要用结构体]] | 平行数组一排序就散架，打包成一条记录 |
| [[结构体]] | 多个字段打包成新类型，用 `.` 访问 |
| [[typedef类型别名]] | 给类型起别名，结构体的竞赛写法 |
| [[排序]] | `sort` 默认升序，`cmp` 决定谁排前面 |
```

- [ ] **Step 2: `教学大纲.md`——笔记状态 callout 与对应关系**

「笔记状态」整段替换为：

```markdown
> [!info] 笔记状态
> 目前已完成 Day 1（竞赛入门 + C 语言起步）、Day 2（switch、循环与数组）、Day 3（第 1～4 讲复习 + 当堂小测；讲课稿在本地 `讲课稿/` 目录，不发布）的原子笔记，以及 Day 4（函数、结构体与排序）。其余讲次先在大纲中规划，不提前建空笔记，避免死链。
```

「与现有笔记的对应」在 `- [[DAY 3]]：…` 一行后插入：

```markdown
- [[DAY 4]]：函数、结构体与排序（对应第 6～7 讲主体）。递归、第 5 讲（字符串与二维数组）后续单独安排。
```

- [ ] **Step 3: `README.md`——入口列表加一行**

先 Read 确认 DAY 3 行的现有格式，随后照同样格式在其后插入（若 DAY 3 行写法为 `- [[DAY 3]]：…`，则插入）：

```markdown
- [[DAY 4]]：函数、结构体与排序
```

- [ ] **Step 4: `02-C语言基础/竞赛代码模板.md`——替换预告 callout**

找到「`> [!note] 预告 · 第 6 讲`」开头的 callout（3 行），整块替换为：

```markdown
> [!note] 预告 · Day 4
> 模板里的 `main` 本身就是一个函数。Day 4 会学**自己定义函数**：参数、返回值、作用域，把重复代码抽出来复用（递归以后再单独讲）。到时候你的模板会多出几个自己的小工具函数。详见 [[函数]]。
```

- [ ] **Step 5: `02-C语言基础/数组.md`——替换预告 callout**

找到「`> [!note] 预告 · 第 5～7 讲`」开头的 callout（4 行），整块替换为：

```markdown
> [!note] 预告 · 后续讲次
> 数组还会以三种形态继续登场：
> - **数组当函数参数**（Day 4）：把求和、统计写成函数，数组交给函数处理，见 [[函数]]；
> - **结构体数组**（Day 4）：每个元素打包多个字段，配合排序解决"排队""奖学金"类问题，见 [[结构体]]、[[排序]]；
> - **二维数组**（后续讲次）：矩阵的读入与按行列遍历。
```

- [ ] **Step 6: `02-C语言基础/基本数据类型.md`——替换预告 callout**

找到「`> [!note] 预告 · 第 7 讲`」开头的 callout（2 行），整块替换为：

```markdown
> [!note] 预告 · Day 4
> 类型系统还有两个进阶工具：`typedef` 给类型起别名（`typedef long long ll;`）、`struct` 把多个字段打包成新类型。两篇笔记已写好：[[typedef类型别名]]、[[结构体]]。
```

- [ ] **Step 7: `02-C语言基础/typedef类型别名.md`——预告与练一练措辞对齐 Day 4**

「`> [!note] 预告`」callout（2 行）整块替换为：

```markdown
> [!note] 关联 · Day 4
> 现在正式讲到：[[结构体]] 里用 `typedef struct {...} Node;` 起名，[[排序]] 里按字段排序都离不开它。对应大纲第 7 讲，见 [[教学大纲]]。
```

「练一练」一句中的"第 7 讲"替换为"Day 4"，并在句尾补链接，改为：

```markdown
typedef 本身不用专门刷题。Day 4 做结构体排序（[P1093 奖学金](https://www.luogu.com.cn/problem/P1093)、[P1104 生日](https://www.luogu.com.cn/problem/P1104)）时会大量使用，到时候回来对照（见 [[排序]]）。
```

- [ ] **Step 8: 全局链接检查（7 个改动文件 + 5 个新文件一起）**

```bash
cd /home/uret64bit/cp-tutorial && for f in "00-导航/语言基础索引.md" "教学大纲.md" "README.md" "02-C语言基础/竞赛代码模板.md" "02-C语言基础/数组.md" "02-C语言基础/基本数据类型.md" "02-C语言基础/typedef类型别名.md" "02-C语言基础/函数.md" "02-C语言基础/为什么要用结构体.md" "02-C语言基础/结构体.md" "02-C语言基础/排序.md" "DAY 4.md"; do grep -oh '\[\[[^]|#]*' "$f" | sed 's/\[\[//' | sort -u | while read -r l; do find . -name "$l.md" -not -path './.git/*' -not -path './site/*' | grep -q . || echo "MISSING: $l (from $f)"; done; done; echo checked
```

预期：只输出 `checked`。

---

### Task 7: 构建验证 → 用户过目 → 提交发布

**Files:**
- 无新建；验证 + 提交

- [ ] **Step 1: 同步并构建站点**

```bash
cd /home/uret64bit/cp-tutorial/site && bash sync-content.sh && npx quartz build 2>&1 | tail -8
```

预期输出含：`synced: 56 md files`、`Parsed 56 Markdown files`、`Emitted ~19x files`（原 51 篇 + 5 篇新内容）。

- [ ] **Step 2: 抽查新页面 HTML 已生成**

```bash
cd /home/uret64bit/cp-tutorial/site && ls public/DAY-4.html "public/02-C语言基础/函数.html" "public/02-C语言基础/为什么要用结构体.html" "public/02-C语言基础/结构体.html" "public/02-C语言基础/排序.html" && grep -l "本讲集大成" public/DAY-4.html
```

预期：5 个文件都存在，grep 命中 `public/DAY-4.html`。

- [ ] **Step 3: 请用户在 Obsidian 里过目**

向用户汇报：新建/修改清单 + 构建结果，请其过目；**等用户确认后才进入 Step 4**。

- [ ] **Step 4: 提交（明确路径，一次性）**

```bash
cd /home/uret64bit/cp-tutorial && git add "DAY 4.md" "02-C语言基础/函数.md" "02-C语言基础/为什么要用结构体.md" "02-C语言基础/结构体.md" "02-C语言基础/排序.md" "00-导航/语言基础索引.md" "教学大纲.md" "README.md" "02-C语言基础/竞赛代码模板.md" "02-C语言基础/数组.md" "02-C语言基础/基本数据类型.md" "02-C语言基础/typedef类型别名.md" && git status --short
```

确认暂存区恰好是这 12 个文件（`第一个C程序.md` 保持未暂存 ` M` 状态）。提交信息：

```text
feat: Day 4 笔记（函数、结构体、为什么用结构体、排序）+ DAY 4 课程页

- 新增原子笔记：函数、为什么要用结构体、结构体、排序
- DAY 4 课程页：三条路线 + 必做/选做/挑战作业 + 自检
- 语言基础索引新增「函数」「结构体与排序」两节；typedef 移入正式区
- 教学大纲笔记状态与对应关系、README 入口同步
- 竞赛代码模板/数组/基本数据类型/typedef 的旧预告对齐 Day 4

Co-Authored-By: Claude <noreply@anthropic.com>
```

（若分类器抖动导致命令行提交被拦，改为把信息写入临时文件后用 `git commit -F`。）

- [ ] **Step 5: 推送并验证线上**

```bash
cd /home/uret64bit/cp-tutorial && git push origin master
```

等 CI 部署后抽查（约 2～3 分钟）：

```bash
curl -s -o /dev/null -w "DAY-4 %{http_code}\n" "https://uret64bit.github.io/fpnu-cp-tutorial/DAY-4"
curl -s -o /dev/null -w "排序 %{http_code}\n" "https://uret64bit.github.io/fpnu-cp-tutorial/02-C%E8%AF%AD%E8%A8%80%E5%9F%BA%E7%A1%80/%E6%8E%92%E5%BA%8F"
```

预期：两个 200。（若 push 被网络/分类器拦截，请用户在自己的终端执行 `! git push origin master`。）