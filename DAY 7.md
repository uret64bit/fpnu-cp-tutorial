---
tags:
  - 导航
  - 课程
aliases:
  - Day7
  - 第七天
---

# Day 7：排序与二分

> [!info] 本页说明
> 本页是**课程索引**，对应新 [[教学大纲]] 第 7 讲。先复习 `sort` 与自定义 `cmp`，再把“有序”这个前提接到二分查找上；二分答案作为拓展。

## 学习目标

- 会用 `sort` 排序数组，会写自定义 `cmp`，包括按结构体字段多关键字排序。
- 能说出二分的前提（有序/单调）和为什么是 $O(\log n)$。
- 会手写“第一个 ≥ x”的二分模板，能把边界讲清楚。
- 会用 `lower_bound` / `upper_bound`，会处理常见的边界与死循环。
- （拓展）理解二分答案“把求最值变成判可行”的思路。

## 路线一：排序

- [ ] [[排序]]：`sort` 基本用法、自定义 `cmp`、按结构体字段排序
- [ ] 复习 [[结构体]]：`cmp` 的参数换成结构体
- [ ] 复习 [[STL常用函数]]：`sort` + `unique`、`lower_bound`

## 路线二：二分查找

- [ ] [[二分查找]]：前提、手写模板、常见坑
- [ ] 复习 [[排序]]：二分之前必须先有序
- [ ] 复习 [[STL常用函数]]：`lower_bound` / `upper_bound`

## 路线三：二分答案（拓展）

- [ ] [[二分答案]]：把“求最大/最小”变成“判断可行”

## 课后作业

### 必做

1. [P1177 快速排序](https://www.luogu.com.cn/problem/P1177)：`sort` 一行过（模板题）。
2. [P2249 查找](https://www.luogu.com.cn/problem/P2249)：二分模板题。
3. [P1102 A-B 数对](https://www.luogu.com.cn/problem/P1102)：排序 + 二分 / 双指针。
4. [P1678 烦恼的高考志愿](https://www.luogu.com.cn/problem/P1678)：二分找最接近的分数。

### 选做

- [P1093 奖学金](https://www.luogu.com.cn/problem/P1093)：多关键字排序，本讲集大成。
- [P1104 生日](https://www.luogu.com.cn/problem/P1104)：日期排序。
- [P1873 砍树](https://www.luogu.com.cn/problem/P1873)：二分答案入门。
- [P1024 一元三次方程求解](https://www.luogu.com.cn/problem/P1024)：二分求根。

### 挑战

- [P2678 跳石头](https://www.luogu.com.cn/problem/P2678)：二分答案经典。
- [P1163 银行贷款](https://www.luogu.com.cn/problem/P1163)：二分答案 + 小数。

## 学完自检

- [ ] 会用 `sort`，知道区间左闭右开。
- [ ] 会写 `cmp` 按结构体字段排序，能说清“返回 true 表示谁排前面”。
- [ ] 能说出二分为什么每次能丢掉一半。
- [ ] 能在白纸上写出“第一个 ≥ x”的模板，并解释 `l`、`r` 每一步怎么动。
- [ ] 知道二分之前必须先排序，`lower_bound` 同理。
- [ ] 会用 `lower_bound` / `upper_bound` 求出下标和出现次数。
- [ ] 知道二分答案的适用信号：“最大的最小值 / 最小的最大值”。

## 相关索引

- [[算法索引]]
- [[DAY 6]]
- [[DAY 8]]
- [[教学大纲]]