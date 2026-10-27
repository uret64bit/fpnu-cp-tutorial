# Day 5～7 内容（字符串与二维数组 / STL / 递归）Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 按规格 `docs/superpowers/specs/2026-10-27-day5-7-strings-stl-recursion-design.md` 一次性建 9 篇原子笔记 + 3 个课程页，并同步索引/大纲/README/旧预告，补齐入门阶段（大纲第 1～7 讲）。

**Architecture:** 纯 Markdown（Obsidian 原子笔记 + `[[双链]]`），沿用 Day 1–4 模板；验证靠 Quartz 构建。

**Tech Stack:** Markdown / Obsidian wikilinks / Quartz 4 / 洛谷题目链接。

## 执行须知（先读）

- **提交策略**：全部改动攒到用户过目后一次性提交（Day 4 同款流程）；执行期间只建文件、不 commit。
- **暂存纪律**：只列明确路径，绝不用 `git add -A`。
- **不碰**：`02-C语言基础/第一个C程序.md`、`sdf.md`（用户自己的文件）；`讲课稿/`。
- **文风**：全中文；`> [!info] 一句话` / `> [!warning]` / `> [!tip] 竞赛提示` / `练一练` / `相关笔记`。

---

### Task 1: 新建 `02-C语言基础/C风格字符串.md`

**Files:** Create: `02-C语言基础/C风格字符串.md`

frontmatter：tags `[C语言, 基础语法]`，aliases `[字符数组, char数组]`

正文结构：
1. 一句话：`字符串就是一连串字符，最后跟一个 \0 收尾；读单词用 scanf("%s")，读一整行要另想办法。`
2. `## char 数组与 \0`：`char s[10] = "hello";` 实际占 6 个位置（末尾 `\0`）；遍历写法 `for (int i = 0; s[i] != '\0'; i++)`。
3. `## scanf("%s", s) 的三个坑`：
   - 遇到空格/换行就停（读不了带空格的句子）；
   - **不加 `&`**（数组名就是地址）；
   - 不检查边界，数组要按题目上限开够（比如句子 100 字符就开 `char s[105]`）。
4. `## 读一整行：fgets`，代码块：

```cpp
char s[100];
fgets(s, sizeof(s), stdin);      // 最多读 sizeof(s)-1 个字符，自动补 '\0'
int len = strlen(s);
if (len > 0 && s[len - 1] == '\n') s[len - 1] = '\0';   // 去掉末尾换行
```

5. `## strlen / strcmp：知道即可`：`strlen(s)` 数到 `\0`；`strcmp(a, b)` 相等返回 0；**两个 char 数组不能用 `==` 比较**（比的是地址）；竞赛里建议直接用 C++ `string` 代替（见 [[C++字符串]]）。
6. `## 逐字符处理`：大小写转换写法 `s[i] = s[i] - 'A' + 'a';`（或 `tolower(s[i])`），链 [[ASCII码]]。
7. `> [!tip] 竞赛提示`：题目说"一个单词"用 `%s`；说"一行/一句话"用 `fgets`（C 风格）或 `getline`（string）；输入含空格时先用错方法会读到一半就停。
8. `## 练一练`：P5704 字母转换、P5015 标题统计。
9. `## 相关笔记`：`[[字符与字符串]]`、`[[C++字符串]]`、`[[ASCII码]]`、`[[scanf输入]]`、`[[数组]]`

---

### Task 2: 新建 `02-C语言基础/C++字符串.md`

**Files:** Create: `02-C语言基础/C++字符串.md`

frontmatter：tags `[C语言, 基础语法, STL]`，aliases `[string, C++ string]`

正文结构：
1. 一句话：`C++ 的 string 是一个"会自己管理长度"的字符串，拼接、比较、取子串都是一行——比 char 数组省心得多。`
2. `## 声明与常用操作`，代码块（配注释逐行讲）：

```cpp
string s = "hello";
s.size();        // 5：长度（返回无符号数，和 int 比较时小心，建议 (int)s.size()）
s[0];            // 'h'：像数组一样按下标访问
s += " world";   // 拼接
s = "abc";
if (s == "abc") ...   // 直接用 == 比较内容（char 数组不行）
s.substr(1, 3);  // 从下标 1 开始取 3 个字符："bc"（越界会报错，别超）
```

3. `## 读入：cin 与 getline`：

```cpp
string s;
cin >> s;             // 读一个"单词"：遇到空格/换行停
getline(cin, s);      // 读一整行（含空格，不含末尾换行）
```

   输出：`cout << s << "\n";` 或 `printf("%s\n", s.c_str());`（`c_str()` 知道即可）。
4. `> [!warning] scanf 和 getline 混用的坑`：`scanf` 读完数字后，换行符还留在输入里，`getline` 会立刻读到空行。处理：

```cpp
int n;
scanf("%d", &n);
getchar();              // 吃掉换行符，再 getline
string s;
getline(cin, s);
```

5. `## 遍历与排序`：`for (char c : s)`；`sort(s.begin(), s.end());` 把字符从小到大排（字典序），`begin()/end()` 先当"范围写法"记。
6. `> [!tip] 竞赛提示`：能 string 就 string（题目限 100 字符时 char 数组也行）；`scanf` 不能直接读 string，读进来要么 char 数组要么 cin/getline。
7. `## 练一练`：P1308 统计单词数（挑战）、P1598 垂直柱状图。
8. `## 相关笔记`：`[[C风格字符串]]`、`[[字符与字符串]]`、`[[排序]]`、`[[竞赛代码模板]]`

---

### Task 3: 新建 `02-C语言基础/二维数组.md`

**Files:** Create: `02-C语言基础/二维数组.md`

frontmatter：tags `[C语言, 基础语法]`，aliases `[矩阵, 多维数组]`

正文结构：
1. 一句话：`二维数组就是"一行一行的数组"：a[i][j] 表示第 i 行第 j 列，配合双重循环遍历。`
2. `## 声明与读入`，代码块：

```cpp
int a[105][105];              // 105 行 105 列
for (int i = 0; i < n; i++)
    for (int j = 0; j < m; j++)
        scanf("%d", &a[i][j]);
```

3. `## 内存估算`：`int a[1005][1005]` ≈ 4MB；`int a[2005][2005]` ≈ 16MB。开之前估算，超内存会 MLE；**大数组一律全局定义**（栈上放不下会爆栈，链 [[数组]] 的拓展段）。
4. `## 常见套路`：
   - 按行遍历/按列遍历（i、j 顺序互换）；
   - 转置：交换 a[i][j] 与 a[j][i]（只在 i < j 时做，避免换回去）；
   - 按连续段填充（P1319 压缩技术：读到一个数字就连续填这么多格）。
5. `## 下标从 0 开始`（链 [[为什么数组下标从0开始]]）；题目 1-based 时统一 `a[1][1]` 起用，别混。
6. `## 练一练`：P5731 蛇形方阵、P1319 压缩技术。
7. `## 相关笔记`：`[[数组]]`、`[[for循环]]`、`[[循环嵌套]]`、`[[为什么数组下标从0开始]]`

---

### Task 4: 新建 `DAY 5.md`（全文如下）

**Files:** Create: `DAY 5.md`

```markdown
---
tags:
  - 导航
  - 课程
aliases:
  - Day5
  - 第五天
---

# Day 5：字符串与二维数组

> [!info] 本页说明
> 本页是**课程索引**，按上课顺序把笔记串起来；每篇笔记只讲一个概念。对应 [[教学大纲]] 第 5 讲；STL 与递归分别在 Day 6、Day 7。

## 学习目标

- 理解 `char` 数组与 `\0`，会用 `scanf("%s")` 读单词、`fgets` 读一整行。
- 会用 C++ `string`：长度、拼接、比较、`getline` 读整行、配合 `sort`。
- 会声明和遍历二维数组，能处理矩阵类题目。

## 路线一：C 风格字符串

- [ ] [[C风格字符串]]：`\0`、`%s` 的坑、读一整行
- [ ] 复习 [[字符与字符串]]：单引号与双引号
- [ ] 拓展：[[ASCII码]]（做大小写转换之前看）

## 路线二：C++ string

- [ ] [[C++字符串]]：`size`、`+`、`==`、`getline`、配合 `sort`

## 路线三：二维数组

- [ ] [[二维数组]]：声明、遍历、矩阵套路
- [ ] 复习 [[数组]]：一维遍历与全局清零

## 课后作业

### 必做

1. [P5704 字母转换](https://www.luogu.com.cn/problem/P5704)：字符转换。
2. [P5015 标题统计](https://www.luogu.com.cn/problem/P5015)：读一整行 + 字符计数。
3. [P5731 蛇形方阵](https://www.luogu.com.cn/problem/P5731)：二维数组填充。
4. [P1319 压缩技术](https://www.luogu.com.cn/problem/P1319)：按段填充矩阵。

### 选做

- [P1125 笨小猴](https://www.luogu.com.cn/problem/P1125)：字符计数 + 判质数。
- [P1598 垂直柱状图](https://www.luogu.com.cn/problem/P1598)：字符统计 + 输出。

### 挑战

- [P1308 统计单词数](https://www.luogu.com.cn/problem/P1308)：string 处理，细节多。
- [P1320 压缩技术（续集版）](https://www.luogu.com.cn/problem/P1320)：矩阵 + 连续段统计。

## 学完自检

- [ ] 知道 `scanf("%s")` 读到空格就停，读一整行要用 `fgets` 或 `getline`。
- [ ] 会用 `string` 的 `size`/`+`/`==`/`substr`，会 `getline(cin, s)`。
- [ ] 知道 scanf 与 getline 混用时换行符的坑，知道怎么处理。
- [ ] 会声明二维数组、按行列遍历、处理矩阵题。
- [ ] 知道大数组（包括二维）要定义成全局。

## 相关索引

- [[语言基础索引]]
- [[DAY 4]]
- [[教学大纲]]
```

---

### Task 5: 新建 `02-C语言基础/vector.md`

**Files:** Create: `02-C语言基础/vector.md`

frontmatter：tags `[C语言, 基础语法, STL]`，aliases `[动态数组, vector容器]`

正文结构：
1. 一句话：`vector 是"会自己变长的数组"：往里加、随时看长度、还能直接交给 sort。`
2. `## 常用操作`，代码块：

```cpp
vector<int> v;              // 一个空的 int 动态数组
v.push_back(5);             // 在末尾追加
v.push_back(3);
v.size();                   // 2：当前元素个数
v[0];                       // 5：像数组一样按下标访问（别越界）
v.clear();                  // 清空
```

3. `## 遍历`：下标循环 `for (int i = 0; i < (int)v.size(); i++)`；范围 for `for (int x : v)`（只读遍历更省事）。
4. `## 排序`：`sort(v.begin(), v.end());`（`begin()/end()` 就是"从头到尾"，和数组的 `a, a+n` 一个意思）。
5. `## 什么时候用 vector`：长度运行时才知道、需要中途追加（P3613 寄包柜）、想少写长度参数；**定长 + 简单场景用普通数组更直接**。
6. `> [!tip] 竞赛提示`：入门阶段"数组能写就别 vector"不是铁律——怎么顺手怎么来；vector 的 `size()` 是**无符号数**，和 `int` 比较时习惯性写 `(int)v.size()`。
7. `## 练一练`：P3156 询问学号、P3613 寄包柜。
8. `## 相关笔记`：`[[数组]]`、`[[排序]]`、`[[pair]]`、`[[STL常用函数]]`

---

### Task 6: 新建 `02-C语言基础/pair.md`

**Files:** Create: `02-C语言基础/pair.md`

frontmatter：tags `[C语言, 基础语法, STL]`，aliases `[二元组, make_pair]`

正文结构：
1. 一句话：`pair 把两个值捆成一组（first、second），自带比较规则，排序时先比 first、再比 second。`
2. `## 声明与访问`，代码块：

```cpp
pair<int, int> p;        // 准备装两个 int
p = make_pair(3, 5);     // 或 pair<int,int> p = {3, 5};
p.first;                 // 3
p.second;                // 5
```

3. `## 自带排序规则`：`sort` 一个 `pair` 数组会**先按 first 从小到大，first 相同再按 second**——很多"按两个关键字排"的题不用写 cmp。
4. `## pair 还是结构体？`：两个字段用 pair 省事；三个以上、或者字段有名字更好读（`x.score` vs `p.first`）时用结构体。链 [[为什么要用结构体]]、[[结构体]]。
5. `## 练一练`：用 pair 重做 [P1104 生日](https://www.luogu.com.cn/problem/P1104)（把日期捆成 pair 排序）。
6. `## 相关笔记`：`[[vector]]`、`[[结构体]]`、`[[排序]]`、`[[STL常用函数]]`

---

### Task 7: 新建 `02-C语言基础/栈与队列.md`

**Files:** Create: `02-C语言基础/栈与队列.md`

frontmatter：tags `[C语言, 基础语法, STL]`，aliases `[stack, queue, 先进先出]`

正文结构：
1. 一句话：`栈是"后进先出"（像叠盘子），队列是"先进先出"（像排队）；都是只在一头/两头操作的数据结构。`
2. `## 栈 stack`，代码块：

```cpp
stack<int> st;
st.push(1);          // 1 进栈（放到最上面）
st.push(2);
st.top();            // 2：看最上面的
st.pop();            // 2 出栈
st.size();           // 1
st.empty();          // 栈空时为 true
```

   示意（文字）：进 1、进 2 → 栈里从底到顶 `1 2`，先出来的是 2。
3. `## 队列 queue`，代码块：

```cpp
queue<int> q;
q.push(1);           // 1 进队（排到队尾）
q.push(2);
q.front();           // 1：队头
q.pop();             // 1 出队
q.back();            // 2：队尾
```

4. `## 什么时候用`：括号匹配、后缀表达式求值 → 栈；排队模拟、BFS 逐层扩展 → 队列。
5. `> [!abstract] 拓展 · 选读 —— priority_queue`：`priority_queue<int> pq;` 每次 `top()` 拿到**最大**的元素（大根堆）。知道有它即可，最短路等算法会用到。
6. `> [!tip] 竞赛提示`：栈/队列没有"按下标访问"；`pop()` **不返回**被删的元素——要先 `top()`/`front()` 看一眼再 `pop()`，这是最常写错的地方。
7. `## 练一练`：P1739 表达式括号匹配、P1996 约瑟夫问题。
8. `## 相关笔记`：`[[vector]]`、`[[数组]]`、`[[STL常用函数]]`

---

### Task 8: 新建 `02-C语言基础/map与set.md`

**Files:** Create: `02-C语言基础/map与set.md`

frontmatter：tags `[C语言, 基础语法, STL]`，aliases `[map, set, 计数, 去重]`

正文结构：
1. 一句话：`map 是"自带查找的记账本"（键 → 值），set 是"自动去重 + 自动排序的集合"。`
2. `## map：计数与查找`，代码块：

```cpp
map<string, int> cnt;        // 键是 string，值是 int
cnt["apple"]++;              // 没有这个键会自动创建，值默认 0，再 +1
cnt["apple"];                // 1
cnt.count("banana");         // 0：有没有这个键
cnt.size();                  // 1
```

   遍历：`for (auto &p : cnt) p.first p.second`（`auto` 先知道能这么写即可）；map 会**按 key 排序**（string 按字典序）。
3. `## set：去重 + 有序`，代码块：

```cpp
set<int> s;
s.insert(3);
s.insert(1);
s.insert(3);                 // 重复插入无效
s.size();                    // 2
s.count(3);                  // 1：在不在集合里
for (int x : s) ...          // 1 3：从小到大
```

4. `## 什么时候用`：统计单词出现次数、判重、找"是否存在"；`unordered_map` / `unordered_set` 更快但不排序，知道有即可。
5. `> [!tip] 竞赛提示`：map 每步操作是 $O(\log n)$ 级别，$10^5$ 次没问题；但 key 是 `int` 且范围小（比如 ≤ $10^7$）时，**普通数组当桶更快更简单**（链 [[数组]] 的计数套路）。
6. `## 练一练`：P1059 明明的随机数（set 一行去重）、P1308 统计单词数（选）。
7. `## 相关笔记`：`[[数组]]`、`[[vector]]`、`[[STL常用函数]]`、`[[C++字符串]]`

---

### Task 9: 新建 `02-C语言基础/STL常用函数.md`

**Files:** Create: `02-C语言基础/STL常用函数.md`

frontmatter：tags `[C语言, 基础语法, STL]`，aliases `[min, max, unique, lower_bound]`

正文结构：
1. 一句话：`algorithm 等头文件里有一批一行的"小工具"：取最值、交换、翻转、去重、二分查找——`bits/stdc++.h` 全都包含。`
2. `## 取值与交换`：`min(a, b)` / `max(a, b)`（只能比两个值，不能整个数组）；`swap(a, b)`；`abs(x)`（绝对值，`<cmath>`）。
3. `## reverse：翻转`：

```cpp
int a[5] = {1, 2, 3, 4, 5};
reverse(a, a + 5);           // 5 4 3 2 1（同样是左闭右开）

string s = "abc";
reverse(s.begin(), s.end()); // "cba"
```

4. `## unique：去重（必须先用 sort！）`：

```cpp
sort(a, a + n);
int m = unique(a, a + n) - a;   // m 是去重后的个数
// a[0..m-1] 就是去重结果，后面的内容是"残留"，忽略即可
```

   要点：unique 只"合并相邻的重复"，所以**先排序**；返回值是"去重后末尾"的位置，减去 `a` 得到个数。
5. `## lower_bound：有序数组里的二分查找`：

```cpp
sort(a, a + n);
int pos = lower_bound(a, a + n, x) - a;   // 第一个 ≥ x 的位置（没有则返回 n）
```

   `upper_bound` 是第一个 > x 的位置；配套知识（二分）后面会讲，先会查就行。
6. `> [!tip] 竞赛提示`：`lower_bound` 只能用在**已经有序**的数组上；用之前先 `sort`，忘了会得到错误结果。
7. `## 练一练`：P1059 明明的随机数（sort + unique 全套）。
8. `## 相关笔记`：`[[排序]]`、`[[时间复杂度入门]]`、`[[vector]]`、`[[数组]]`

---

### Task 10: 新建 `DAY 6.md`（全文如下）

**Files:** Create: `DAY 6.md`

```markdown
---
tags:
  - 导航
  - 课程
aliases:
  - Day6
  - 第六天
---

# Day 6：STL 入门（竞赛必备）

> [!info] 本页说明
> 本页是**课程索引**，按上课顺序把笔记串起来。对应 [[教学大纲]] 第 7 讲的 STL 部分；只讲竞赛必备的容器和函数，deque、list、迭代器细节都不涉及。

## 学习目标

- 会用 `vector` 代替数组：动态添加、遍历、排序。
- 会用 `pair` 存一对数据并直接排序；知道它和结构体的取舍。
- 会用 `stack` / `queue` 的基本操作，知道各自适合什么题。
- 会用 `map` / `set` 计数、去重、查找。
- 会用 `reverse` / `unique` / `lower_bound` 等常用小函数。

## 路线一：两个常用容器

- [ ] [[vector]]：动态数组，`push_back` 与 `sort`
- [ ] [[pair]]：两个值捆一起，自带排序规则
- [ ] 复习 [[排序]]：`sort` 与自定义 `cmp`

## 路线二：栈、队列与映射

- [ ] [[栈与队列]]：后进先出与先进先出（含 `priority_queue` 拓展）
- [ ] [[map与set]]：计数、去重、查找

## 路线三：常用函数

- [ ] [[STL常用函数]]：`reverse`、`unique`、`lower_bound`

## 课后作业

### 必做

1. [P3156 询问学号](https://www.luogu.com.cn/problem/P3156)：`vector` 基本操作。
2. [P3613 寄包柜](https://www.luogu.com.cn/problem/P3613)：`vector` 动态追加。
3. [P1739 表达式括号匹配](https://www.luogu.com.cn/problem/P1739)：栈的入门题。
4. [P1996 约瑟夫问题](https://www.luogu.com.cn/problem/P1996)：队列模拟。

### 选做

- [P1449 后缀表达式](https://www.luogu.com.cn/problem/P1449)：栈的典型应用。
- [P1540 机器翻译](https://www.luogu.com.cn/problem/P1540)：队列模拟缓存。
- [P1059 明明的随机数](https://www.luogu.com.cn/problem/P1059)：`sort` + `unique` 去重。

### 挑战

- [P1241 括号序列](https://www.luogu.com.cn/problem/P1241)：栈的进阶。
- [P1160 队列安排](https://www.luogu.com.cn/problem/P1160)：复杂模拟。

## 学完自检

- [ ] 会用 `vector` 的 `push_back` / `size` / 遍历 / `sort`。
- [ ] 会用 `pair` 的 `first` / `second`，知道它能直接排序。
- [ ] 会 `stack` 的 `push`/`pop`/`top`、`queue` 的 `push`/`pop`/`front`，能说出后进先出和先进先出的区别。
- [ ] 知道 `pop()` 不返回元素，要先 `top()` / `front()`。
- [ ] 会用 `map` 计数（`mp[s]++`）、`set` 去重。
- [ ] 会用 `sort` + `unique` 去重、`lower_bound` 找下标。

## 相关索引

- [[语言基础索引]]
- [[DAY 5]]
- [[教学大纲]]
```

---

### Task 11: 新建 `02-C语言基础/递归.md`

**Files:** Create: `02-C语言基础/递归.md`

frontmatter：tags `[C语言, 基础语法]`，aliases `[递归函数, 调用栈]`

正文结构：
1. 一句话：`递归就是"函数自己调用自己"：把大问题缩小成同样的一个小问题，缩到最小（边界）就停下。`
2. `## 三要素`：① 边界条件（最小的情况直接给答案）；② 规模缩小（每次调用离边界更近）；③ 调用自身。
3. `## 例：阶乘`，代码块：

```cpp
int fact(int n) {
    if (n <= 1) return 1;       // 边界
    return n * fact(n - 1);     // 规模缩小 + 调用自身
}
```

4. `## 例：斐波那契`（`f(n) = f(n-1) + f(n-2)`，边界 `f(1) = f(2) = 1`）；点出：朴素递归算 $f(40)$ 会慢到超时——**同一个子问题被算了很多遍**，解决办法（记忆化）后面的搜索讲次会学。
5. `## 递归与调用栈`：每次调用都会开一层"自己的"局部变量（形参 `n` 各是各的）；层数太深会**爆栈（RE）**，比如递归一万层；`main` 里开大数组爆栈也是同一个道理（链 [[数组]] 拓展段）。
6. `## 递归还是循环？`：能用循环就用循环（快、不怕深）；递归适合"问题天然拆成同样的小问题"的场景（树、搜索、分治）——搜索讲次会大量用。
7. `> [!tip] 竞赛提示`：写递归先写**边界**，再写缩小；不确定哪里错了就在函数开头 `printf` 一下当前参数，看清每一层。
8. `## 练一练`：P5739 计算阶乘、P1028 数的计算、P5743 猴子吃桃。
9. `## 相关笔记`：`[[函数]]`、`[[while循环]]`、`[[数组]]`

---

### Task 12: 新建 `DAY 7.md`（全文如下）

**Files:** Create: `DAY 7.md`

```markdown
---
tags:
  - 导航
  - 课程
aliases:
  - Day7
  - 第七天
---

# Day 7：递归

> [!info] 本页说明
> 本页是**课程索引**。对应 [[教学大纲]] 第 6 讲的递归部分；函数基础已在 Day 4 学过。

## 学习目标

- 能说出递归三要素，会写简单的递归函数。
- 理解递归和调用栈的关系，知道"爆栈"是怎么回事。
- 能判断一道题适合递归还是循环。

## 路线

- [ ] [[递归]]：三要素、阶乘与斐波那契、调用栈、爆栈
- [ ] 复习 [[函数]]：参数、返回值、调用
- [ ] 复习 [[while循环]]：循环能做到的，优先循环

## 课后作业

### 必做

1. [P5739 计算阶乘](https://www.luogu.com.cn/problem/P5739)：递归第一题。
2. [P1028 数的计算](https://www.luogu.com.cn/problem/P1028)：递推/递归思维。
3. [P5743 猴子吃桃](https://www.luogu.com.cn/problem/P5743)：递归或逆推。

### 选做

- [P1464 Function](https://www.luogu.com.cn/problem/P1464)：记忆化搜索入门（本讲只要求会背模板用）。
- [P1010 幂次方](https://www.luogu.com.cn/problem/P1010)：递归分解。

### 挑战

- [P1928 外星密码](https://www.luogu.com.cn/problem/P1928)：递归解析字符串。
- [P1228 地毯填补问题](https://www.luogu.com.cn/problem/P1228)：分治递归。

## 学完自检

- [ ] 能说出边界条件不写会发生什么（无限递归）。
- [ ] 能写出阶乘、斐波那契的递归函数。
- [ ] 知道递归太深会爆栈（RE），能大致判断多深算深。
- [ ] 能说出一道题该用递归还是循环。

## 相关索引

- [[语言基础索引]]
- [[DAY 6]]
- [[教学大纲]]
```

---

### Task 13: 同步索引、大纲、README 与旧预告

**Files:**
- Modify: `00-导航/语言基础索引.md`
- Modify: `教学大纲.md`
- Modify: `README.md`
- Modify: `02-C语言基础/字符与字符串.md`
- Modify: `02-C语言基础/数组.md`
- Modify: `02-C语言基础/typedef类型别名.md`

- [ ] **Step 1: `00-导航/语言基础索引.md`**——在「7. 结构体与排序」后、「8. 调试」前插入三节，「调试」标题改为「11. 调试」

```markdown
## 8. 字符串与二维数组

| 笔记 | 一句话 |
| --- | --- |
| [[C风格字符串]] | `\0` 收尾；读单词 `%s`，读整行 `fgets` |
| [[C++字符串]] | 会自己管长度的字符串，一行拼接比较 |
| [[二维数组]] | 一行一行的数组，矩阵题必备 |

## 9. STL 入门

| 笔记 | 一句话 |
| --- | --- |
| [[vector]] | 会自己变长的数组 |
| [[pair]] | 两个值捆一起，自带排序规则 |
| [[栈与队列]] | 后进先出与先进先出 |
| [[map与set]] | 记账本与去重集合 |
| [[STL常用函数]] | `reverse`、`unique`、`lower_bound` 一页汇总 |

## 10. 递归

| 笔记 | 一句话 |
| --- | --- |
| [[递归]] | 函数自己调用自己，别忘了边界 |
```

- [ ] **Step 2: `教学大纲.md`**——笔记状态整段替换：

```markdown
> [!info] 笔记状态
> 目前已完成 Day 1～7 的全部原子笔记：Day 1（竞赛入门 + C 语言起步）、Day 2（switch、循环与数组）、Day 3（第 1～4 讲复习 + 当堂小测；讲课稿在本地 `讲课稿/` 目录，不发布）、Day 4（函数、结构体与排序）、Day 5（字符串与二维数组）、Day 6（STL 入门）、Day 7（递归）——语言基础模块（第 1～7 讲）的笔记到此完整。后续算法模块按讲次逐步补充，不提前建空笔记，避免死链。
```

「与现有笔记的对应」把 DAY 4 那行的"递归、第 5 讲（字符串与二维数组）后续单独安排"删掉，并在其后加：

```markdown
- [[DAY 5]]：字符串与二维数组（对应第 5 讲）。
- [[DAY 6]]：STL 入门（对应第 7 讲的 STL 部分）。
- [[DAY 7]]：递归（对应第 6 讲的递归部分）。
```

- [ ] **Step 3: `README.md`**——入口列表 `[[DAY 4]]` 行后插入三行、主题索引顺延为 9：

```markdown
6. [[DAY 5]] — 第五天课程索引（字符串与二维数组）
7. [[DAY 6]] — 第六天课程索引（STL 入门：vector、pair、栈与队列、map/set）
8. [[DAY 7]] — 第七天课程索引（递归）
9. 主题索引：
```

目录结构块在 `DAY 4.md` 行后插入：

```text
├── DAY 5.md               # Day 5 课程索引（字符串与二维数组）
├── DAY 6.md               # Day 6 课程索引（STL 入门）
├── DAY 7.md               # Day 7 课程索引（递归）
```

- [ ] **Step 4: `02-C语言基础/字符与字符串.md`**——把「预告 · 第 5 讲」callout 替换为：

```markdown
> [!note] 预告 · Day 5
> C 风格字符串的完整用法（`\0`、读整行、`strlen`）和 C++ `string` 会在 Day 5 系统讲：见 [[C风格字符串]]、[[C++字符串]]。
```

- [ ] **Step 5: `02-C语言基础/数组.md`**——预告 callout 第三行"二维数组（后续讲次）"改为：

```markdown
> - **二维数组**（Day 5）：矩阵的读入与按行列遍历，见 [[二维数组]]。
```

- [ ] **Step 6: `02-C语言基础/typedef类型别名.md`**——基本用法代码块注释 `// 第 7 讲配合 STL 使用` 改为 `// Day 6 配合 STL 使用，见 [[pair]]、[[vector]]`。

- [ ] **Step 7: 全量链接检查（12 个新文件 + 6 个改动文件）**：沿用 Day 4 的批量脚本（`grep -oh '\[\[[^]|#]*'` + `find -name`），预期只输出 `checked`。

---

### Task 14: 构建验证 → 用户过目 → 提交发布

**Files:** 无新建；验证 + 提交

- [ ] **Step 1: 构建**

```bash
cd /home/uret64bit/cp-tutorial/site && bash sync-content.sh && npx quartz build 2>&1 | tail -6
```

预期：`Parsed 69 Markdown files`（若 `sdf.md` 已被删除则 68）、`Emitted ~21x files`。

- [ ] **Step 2: 抽查新页面**

```bash
cd /home/uret64bit/cp-tutorial/site && ls public/DAY-5.html public/DAY-6.html public/DAY-7.html "public/02-C语言基础/C风格字符串.html" "public/02-C语言基础/C++字符串.html" "public/02-C语言基础/二维数组.html" "public/02-C语言基础/vector.html" "public/02-C语言基础/pair.html" "public/02-C语言基础/栈与队列.html" "public/02-C语言基础/map与set.html" "public/02-C语言基础/STL常用函数.html" "public/02-C语言基础/递归.html"
```

预期：12 个文件全部存在。

- [ ] **Step 3: 请用户过目**（本次为一次性 18 个文件：12 新建 + 6 修改），确认后才提交。

- [ ] **Step 4: 提交（明确路径）**

```bash
cd /home/uret64bit/cp-tutorial && git add "DAY 5.md" "DAY 6.md" "DAY 7.md" "02-C语言基础/C风格字符串.md" "02-C语言基础/C++字符串.md" "02-C语言基础/二维数组.md" "02-C语言基础/vector.md" "02-C语言基础/pair.md" "02-C语言基础/栈与队列.md" "02-C语言基础/map与set.md" "02-C语言基础/STL常用函数.md" "02-C语言基础/递归.md" "00-导航/语言基础索引.md" "教学大纲.md" "README.md" "02-C语言基础/字符与字符串.md" "02-C语言基础/数组.md" "02-C语言基础/typedef类型别名.md" && git status --short
```

提交信息：

```text
feat: Day 5～7 笔记（字符串与二维数组、STL、递归）+ 三个课程页

- Day 5：C风格字符串、C++字符串、二维数组
- Day 6：vector、pair、栈与队列、map与set、STL常用函数（竞赛必备）
- Day 7：递归（三要素、调用栈、爆栈）
- 语言基础索引、教学大纲、README 同步；旧预告对齐
- 至此语言基础模块（第 1～7 讲）笔记完整

Co-Authored-By: Claude <noreply@anthropic.com>
```

- [ ] **Step 5: 推送并线上抽查**

```bash
cd /home/uret64bit/cp-tutorial && git push origin master
```

等 CI 后抽查 `DAY-5`、`C++字符串`（URL 编码 `C%2B%2B%E5%AD%97%E7%AC%A6%E4%B8%B2`）、`递归` 返回 200。若 push 被网络拦，请用户执行 `! git push origin master`。