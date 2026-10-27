---
tags:
  - C语言
  - 基础语法
  - STL
aliases:
  - 二元组
  - make_pair
---

# pair（二元组）

> [!info] 一句话
> `pair` 把两个值捆成一组（`first`、`second`），自带比较规则：排序时先比 `first`，再比 `second`。

## 声明与访问

```cpp
pair<int, int> p;              // 准备装两个 int
p = make_pair(3, 5);           // 赋值
// 也可以一步写完：pair<int, int> p = {3, 5};

p.first;                       // 3
p.second;                      // 5
```

## 自带排序规则

```cpp
pair<int, int> a[3] = {{2, 9}, {1, 5}, {2, 3}};
sort(a, a + 3);
// 结果：{1,5}、{2,3}、{2,9}
// 先按 first 从小到大；first 相同的，再按 second 从小到大
```

很多"按两个关键字排序"的题，用 pair 连 `cmp` 都不用写。

## pair 还是结构体？

| | pair | 结构体 |
| --- | --- | --- |
| 字段数 | 两个 | 任意多个 |
| 可读性 | `p.first` 比较抽象 | `stu.score` 一眼看懂 |
| 排序 | 自带规则 | 要写 `cmp` |

两个字段、顺序就是优先级 → 用 pair；三个以上字段、或者字段含义重要 → 用结构体（见 [[结构体]]、[[为什么要用结构体]]）。

> [!tip] 竞赛提示
> 坐标 `(x, y)`、区间 `(l, r)`、分数和学号 `(score, id)` 这类"天生一对"的数据，用 pair 最顺手；把 pair 数组丢给 `sort`，就是"先按第一关键字、再按第二关键字"。

## 练一练

- 用 pair 重做 [P1104 生日](https://www.luogu.com.cn/problem/P1104)：把出生日期捆成 pair 排序。

## 相关笔记

- [[vector]]
- [[结构体]]
- [[排序]]
- [[STL常用函数]]