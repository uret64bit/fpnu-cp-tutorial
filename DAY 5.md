---
tags:
  - 导航
  - 课程
aliases:
  - Day5
  - 第五天
---

# Day 5：结构体与 STL 入门

> [!info] 本页说明
> 本页是**课程索引**，对应新 [[教学大纲]] 第 5 讲；合并原 Day 4 的结构体与 Day 6 的 STL。内容较多，建议分 2 次课。排序与 `cmp` 的完整用法在 Day 7 讲，本页只做预告。

## 学习目标

- 能说出为什么要用结构体；会定义结构体、结构体数组，用 `.` 访问成员。
- 会用 `typedef` 简化结构体类型名。
- 会用 `vector`、`pair`、`stack`/`queue`、`map`/`set` 解决对应场景。
- 会用 `reverse` / `unique` / `lower_bound` 等常用函数，知道 `begin()` / `end()` 是迭代器。

## 路线一：结构体

- [ ] [[为什么要用结构体]]：平行数组的痛点
- [ ] [[结构体]]：定义、成员访问、结构体数组
- [ ] [[typedef类型别名]]：`struct` 的竞赛写法
- [ ] 预告：结构体排序与 `cmp` 在 Day 7 的 [[排序]] 细讲

## 路线二：常用容器

- [ ] [[vector]]：会自己变长的数组
- [ ] [[pair]]：两个值捆一起，自带排序规则
- [ ] [[栈与队列]]：后进先出与先进先出（含 `priority_queue` 拓展）
- [ ] [[map与set]]：计数、去重、查找

## 路线三：常用函数与迭代器

- [ ] [[STL常用函数]]：`reverse`、`unique`、`lower_bound`
- [ ] [[迭代器]]：`begin()` / `end()`、`*it`、`++it`

## 课后作业

### 必做

1. [P5740 最厉害的学生](https://www.luogu.com.cn/problem/P5740)：结构体读入与比较。
2. [P5742 评等级](https://www.luogu.com.cn/problem/P5742)：结构体 + 条件判断。
3. [P3156 询问学号](https://www.luogu.com.cn/problem/P3156)：`vector` 基本操作。
4. [P1739 表达式括号匹配](https://www.luogu.com.cn/problem/P1739)：栈的入门题。

### 选做

- [P5741 旗鼓相当的对手](https://www.luogu.com.cn/problem/P5741)：结构体多字段比较。
- [P5738 歌唱比赛](https://www.luogu.com.cn/problem/P5738)：结构体 + 最值/平均。
- [P3613 寄包柜](https://www.luogu.com.cn/problem/P3613)：`vector` 动态追加。
- [P1996 约瑟夫问题](https://www.luogu.com.cn/problem/P1996)：队列模拟。
- [P1059 明明的随机数](https://www.luogu.com.cn/problem/P1059)：`sort` + `unique` 去重。

### 挑战

- [P1241 括号序列](https://www.luogu.com.cn/problem/P1241)：栈的进阶。
- [P1160 队列安排](https://www.luogu.com.cn/problem/P1160)：复杂模拟（Day 10 会用链表再做）。

## 学完自检

- [ ] 能说出平行数组的问题，解释为什么要用结构体。
- [ ] 会定义结构体（含 `typedef` 写法），声明结构体数组并读入（`name` 不加 `&`）。
- [ ] 会用 `vector` 的 `push_back` / `size` / 遍历。
- [ ] 会用 `pair` 的 `first` / `second`，知道它能直接排序。
- [ ] 会 `stack` 的 `push`/`pop`/`top`、`queue` 的 `push`/`pop`/`front`。
- [ ] 知道 `pop()` 不返回元素，要先 `top()` / `front`。
- [ ] 会用 `map` 计数（`mp[s]++`）、`set` 去重。
- [ ] 会用 STL 常用函数里的 `sort` + `unique` 去重、`lower_bound` 找下标（`cmp` 在 Day 7 细讲）。

## 相关索引

- [[语言基础索引]]
- [[DAY 4]]
- [[DAY 6]]
- [[教学大纲]]