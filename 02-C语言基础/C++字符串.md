---
tags:
  - C语言
  - 基础语法
  - STL
aliases:
  - string
  - C++ string
---

# C++ 字符串（string）

> [!info] 一句话
> C++ 的 `string` 是一个"会自己管理长度"的字符串：拼接、比较、取子串都是一行——比 char 数组省心得多。

## 声明与常用操作

```cpp
string s = "hello";

s.size();        // 5：长度
s[0];            // 'h'：像数组一样按下标访问
s += " world";   // 拼接，s 变成 "hello world"

string t = "abc";
if (t == "abc") ...       // 直接用 == 比较内容（char 数组做不到）
t.substr(1, 2);           // 从下标 1 开始取 2 个字符："bc"
```

几点注意：

- `size()` 返回的是**无符号数**，和 `int` 混着比较容易出坑，养成写 `(int)s.size()` 的习惯；
- `s[i]` 越界不会报错，会读到乱七八糟的值，和数组一个道理；
- `substr(起点, 个数)` 的起点或个数超出范围会直接报错（RE），用之前先想清楚。

## 读入：cin 与 getline

```cpp
string s;
cin >> s;             // 读一个"单词"：遇到空格/换行停
getline(cin, s);      // 读一整行：连空格一起读进来（不含末尾换行）
```

输出用 `cout << s << "\n";`，或者继续用 `printf`：

```cpp
printf("%s\n", s.c_str());   // c_str() 知道即可
```

> [!warning] scanf 和 getline 混用的坑
> `scanf` 读完数字后，输入里还留着一个换行符，`getline` 会立刻"读到"这个空行。正确做法是先吃掉换行：
>
> ```cpp
> int n;
> scanf("%d", &n);
> getchar();              // 吃掉换行符，再 getline
> string s;
> getline(cin, s);
> ```

## 遍历与排序

```cpp
for (char c : s) ...                 // 逐字符遍历，更清爽
sort(s.begin(), s.end());            // 字符从小到大排（字典序）
```

`begin()` / `end()` 现在先当"从头到尾"的范围写法记，和数组的 `sort(a, a + n)` 一个意思；Day 6 讲 [[vector]] 时还会遇到。

> [!tip] 竞赛提示
> 输入含空格、又不想碰 char 数组时，`getline(cin, s)` 是最省事的路；`scanf` **不能直接读 string**——要么读进 char 数组，要么用 `cin`。另外，`cin` 和 `scanf` 能不混就不混，非混不可时记住上面吃换行的坑。

## 练一练

- [P1308 统计单词数](https://www.luogu.com.cn/problem/P1308)：string 处理的细节题（挑战）。
- [P1598 垂直柱状图](https://www.luogu.com.cn/problem/P1598)：字符统计 + 输出。

## 相关笔记

- [[C风格字符串]]
- [[字符与字符串]]
- [[排序]]
- [[竞赛代码模板]]