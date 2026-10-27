---
tags:
  - C语言
  - 基础语法
  - STL
aliases:
  - 动态数组
  - vector容器
---

# vector（动态数组）

> [!info] 一句话
> `vector` 是"会自己变长的数组"：往里加、随时看长度、还能直接交给 `sort`。

## 常用操作

```cpp
vector<int> v;              // 一个空的 int 动态数组
v.push_back(5);             // 在末尾追加 5
v.push_back(3);
v.size();                   // 2：当前元素个数
v[0];                       // 5：像数组一样按下标访问（别越界）
v.clear();                  // 清空
```

声明语法是 `vector<类型> 名字;`——尖括号里写要装的类型。`push_back` 负责"在末尾追加一个"。

读完 n 个数想直接存，也可以先开好 n 个位置：

```cpp
int n;
scanf("%d", &n);
vector<int> a(n);                     // 直接开 n 个位置
for (int i = 0; i < n; i++) scanf("%d", &a[i]);
```

## 遍历

```cpp
for (int i = 0; i < (int)v.size(); i++) ...   // 按下标
for (int x : v) ...                           // 范围 for：逐个取出，读的场景更省事
```

## 排序

```cpp
sort(v.begin(), v.end());        // 从小到大
```

`begin()` / `end()` 就是"从头到尾"，和数组的 `sort(a, a + n)` 一个意思；要降序还是写 `cmp`（见 [[排序]]）。

## 什么时候用 vector

- 长度运行时才知道、或者需要中途追加（比如 P3613 寄包柜：寄一次包就多一行）；
- 想少写"长度参数"时（`.size()` 自带长度）；
- 定长 + 简单场景，普通数组更直接——怎么顺手怎么来。

> [!tip] 竞赛提示
> `v.size()` 返回的是**无符号数**，和 `int` 比较时养成写 `(int)v.size()` 的习惯；也要小心 `v.size() - 1` 这种写法——v 为空时它会变成一个天文数字。

## 练一练

- [P3156 询问学号](https://www.luogu.com.cn/problem/P3156)：`vector` 读入 + 按下标查询。
- [P3613 寄包柜](https://www.luogu.com.cn/problem/P3613)：需要动态追加的场景。

## 相关笔记

- [[数组]]
- [[排序]]
- [[pair]]
- [[STL常用函数]]