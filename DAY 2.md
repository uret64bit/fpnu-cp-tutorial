---
tags:
  - 导航
  - 课程
aliases:
  - Day2
  - 第二天
---

# Day 2：switch、循环与数组

> [!info] 本页说明
> 本页是**课程索引**，按上课顺序把笔记串起来；每篇笔记只讲一个概念。对应 [[教学大纲]] 第 4 讲。

## 学习目标

- 会用 `switch` 写值相等的多分支，并知道什么时候该用 `if-else`。
- 会写 `for`、`while`、`do-while` 三种循环，并能说出各自适合的场景。
- 会用 `break` / `continue` 控制循环流程。
- 会用嵌套循环枚举数对、输出图形，并初步感知 $O(n^2)$ 的代价。
- 会声明、初始化和遍历一维数组，不越界，能写批量读入、求和、最值、计数。

## 路线一：switch 多分支

- [ ] [[switch选择语句]]：`case`、`break`、贯穿（fall-through）、限制
- [ ] 复习 [[if-else条件分支]]：区间判断仍用它

## 路线二：循环

- [ ] [[for循环]]：次数明确的循环，三个竞赛套路
- [ ] [[while循环]]：靠条件停止，数位拆分、读到 0、读到 EOF
- [ ] [[do-while循环]]：先执行再判断，知道即可
- [ ] [[break与continue]]：结束整个循环 vs 跳过本轮
- [ ] [[循环嵌套]]：双重循环、复杂度 $O(n^2)$

## 路线三：数组

- [ ] [[数组]]：声明、初始化、下标、遍历、批量处理
- [ ] 拓展：[[为什么数组下标从0开始]]
- [ ] 拓展：[[时间复杂度入门]]，看懂数据范围再决定嵌套层数

## 拓展（选读）

- [ ] [[为什么数组下标从0开始]]：下标 = 偏移量
- [ ] [[时间复杂度入门]]：$O(n)$、$O(n^2)$、数据范围倒推算法
- [ ] [[ASCII码]]：做字符题之前再看

## 课后作业

### 必做

1. [P1424 小鱼的航程(改进版)](https://www.luogu.com.cn/problem/P1424)：`switch` 或 `if-else` + `for` 循环。
2. [P5718 找最小值](https://www.luogu.com.cn/problem/P5718)：循环求最值。
3. [P5720 一尺之棰](https://www.luogu.com.cn/problem/P5720)：`while` 循环。
4. [P1035 级数求和](https://www.luogu.com.cn/problem/P1035)：`for` 或 `while`。
5. [P5721 数字直角三角形](https://www.luogu.com.cn/problem/P5721)：嵌套循环。
6. [P1046 陶陶摘苹果](https://www.luogu.com.cn/problem/P1046)：数组遍历。
7. [P1047 校门外的树](https://www.luogu.com.cn/problem/P1047)：标记数组。
8. [P1428 小鱼比可爱](https://www.luogu.com.cn/problem/P1428)：数组 + 嵌套循环。

### 选做

- [P1307 数字反转](https://www.luogu.com.cn/problem/P1307)：`while` 拆位，注意负数。
- [P1423 小玉在游泳](https://www.luogu.com.cn/problem/P1423)：`while` 循环。
- [P1980 计数问题](https://www.luogu.com.cn/problem/P1980)：嵌套循环拆位。
- [P2141 珠心算测验](https://www.luogu.com.cn/problem/P2141)：计数数组。
- [P1008 三连击](https://www.luogu.com.cn/problem/P1008)：三重循环枚举。

## 学完自检

- [ ] 能用 `switch` 写完并检查每个分支的 `break`。
- [ ] 能说出 `for` / `while` / `do-while` 三者的区别和适用场景。
- [ ] 能解释 `break` 和 `continue` 的区别，以及嵌套循环里 `break` 只跳出一层。
- [ ] 会估算双重循环的执行次数，知道 $n \le 10^5$ 时 $O(n^2)$ 大概率超时。
- [ ] 数组下标从 0 开始，遍历 n 个元素用 `i < n`，不越界。
- [ ] 能独立写出：批量读入、求和、求最大值、计数四个套路。

## 相关索引

- [[语言基础索引]]
- [[DAY 1]]
- [[教学大纲]]
