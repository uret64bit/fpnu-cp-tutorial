---
tags:
  - C语言
  - 基础语法
  - STL
aliases:
  - min
  - max
  - unique
  - lower_bound
---

# STL 常用函数

> [!info] 一句话
> 标准库里有一批"一行的工具"：取最值、交换、翻转、去重、二分查找——`bits/stdc++.h` 全都包含。

## 取值与交换

```cpp
min(a, b);       // 两个值里较小的（只能比两个，不能直接比数组）
max(a, b);       // 较大的
swap(a, b);      // 交换两个变量
abs(x);          // 绝对值（<cmath>）
```

> [!warning] min / max 不能整数组比
> `min(a, a + n)` 这样写编译不过；数组求最值还是要老老实实循环一遍（见 [[数组]] 的求和/最值套路）。

## reverse：翻转

```cpp
int a[5] = {1, 2, 3, 4, 5};
reverse(a, a + 5);            // 5 4 3 2 1（同样是左闭右开）

string s = "abc";
reverse(s.begin(), s.end());  // "cba"
```

## unique：去重（必须先排序）

```cpp
sort(a, a + n);
int m = unique(a, a + n) - a;   // m 是去重后的个数
// a[0] ~ a[m-1] 就是去重结果，后面的位置是"残留"，忽略即可
```

要点：`unique` 只会把**相邻**的重复合并成一个，所以**必须先用 `sort` 排序**；返回值是"去重后末尾的位置"，减去 `a`（数组头）就得到个数。

## lower_bound：有序数组里查位置

```cpp
sort(a, a + n);
int pos = lower_bound(a, a + n, x) - a;   // 第一个 ≥ x 的位置（没有就返回 n）
```

- `lower_bound(a, a + n, x)`：第一个 **≥ x** 的位置；
- `upper_bound(a, a + n, x)`：第一个 **> x** 的位置；
- 返回的是"指针"，减去 `a` 得到下标。

背后的思想（二分查找）后面会专门讲，现在会查就行。

> [!tip] 竞赛提示
> `unique` 和 `lower_bound` 都**依赖有序**：用之前先 `sort`，忘了会得到错误结果。`sort + unique` 是"排序去重"的标准两行。

## 练一练

- [P1059 明明的随机数](https://www.luogu.com.cn/problem/P1059)：`sort` + `unique` 全套用一遍。

## 相关笔记

- [[排序]]
- [[时间复杂度入门]]
- [[vector]]
- [[数组]]