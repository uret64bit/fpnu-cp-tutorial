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