---
tags:
  - C语言
  - 基础语法
  - STL
aliases:
  - map
  - set
  - 计数
  - 去重
---

# map 与 set

> [!info] 一句话
> `map` 是"自带查找的记账本"（键 → 值），`set` 是"自动去重 + 自动排序的集合"。

## map：计数与查找

```cpp
map<string, int> cnt;        // 键是 string，值是 int

cnt["apple"]++;              // 键不存在会自动创建、值默认为 0，再 +1
cnt["apple"];                // 1
cnt.count("banana");         // 0：有没有这个键（0 没有，1 有）
cnt.size();                  // 1：有几个键
```

遍历（`auto` 是"让编译器自己推类型"，先知道能这么写即可）：

```cpp
for (auto &p : cnt) {
    p.first;    // 键
    p.second;   // 值
}
```

map 会自动**按 key 排序**（string 的 key 按字典序）。

## set：去重 + 有序

```cpp
set<int> s;
s.insert(3);
s.insert(1);
s.insert(3);                 // 重复插入无效
s.size();                    // 2
s.count(3);                  // 1：在不在集合里
for (int x : s) ...          // 得到 1、3：自动从小到大
```

## 什么时候用

- 统计"每个单词出现几次"（map）、判重 / 求不同元素个数（set）；
- 需要按键快速查找的场景。

`unordered_map` / `unordered_set` 更快但**不排序**，用得不多，知道有它们即可。

> [!tip] 竞赛提示
> map 每次操作大约是 $O(\log n)$，$10^5$ 级别完全没问题；但 key 是 `int`、范围又小（不超过 $10^7$）时，**普通数组当桶更快更简单**（见 [[数组]] 的计数套路）：`cnt[x]++` 一行搞定。

## 练一练

- [P1059 明明的随机数](https://www.luogu.com.cn/problem/P1059)：set 一行去重（也可以 sort + unique）。

## 相关笔记

- [[数组]]
- [[vector]]
- [[STL常用函数]]
- [[C++字符串]]