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