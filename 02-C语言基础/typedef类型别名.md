---
tags:
  - C语言
  - 基础语法
aliases:
  - 类型别名
  - typedef struct
---

# typedef 类型别名

> [!info] 一句话
> `typedef` 给已有类型起一个**新名字**，不创建新类型。竞赛里两大用途：`typedef long long ll;` 简化书写，`typedef struct {...} Node;` 给结构体起名、省掉 `struct` 关键字。

> [!note] 预告
> 本笔记对应第 7 讲（结构体与 STL 入门，见 [[教学大纲]]），提前写好作预告。现在就能看懂、能用；正式讲课时会结合结构体排序一起练。

## 基本用法

```cpp
typedef long long ll;        // ll 从此就是 long long
typedef unsigned int uint;   // 同理

ll a = 1000000000000000000;  // 等价于 long long a;
```

训练队模板里的常见写法（`#define ll long long` 和 `typedef long long ll;` 二选一即可）：

```cpp
typedef long long ll;
typedef pair<int, int> pii;   // 第 7 讲配合 STL 使用
typedef vector<int> vi;
```

好处：代码短、输入快，而且看别人题解时不再被 `ll`、`pii` 这类缩写卡住。

## typedef struct：竞赛标准写法

不加 `typedef` 时，C 语言里每次声明变量都要带上 `struct`：

```cpp
struct Node { int x, y; };
struct Node a;    // 麻烦：struct 不能省
```

加上 `typedef` 后就可以直接写别名：

```cpp
typedef struct Node {
    int x, y;
} Node;

Node a;           // 不用再写 struct
Node p[1005];     // 结构体数组也顺手了
```

## 易错点

> [!warning] 别把别名当新类型
> `typedef int myint;` 之后，`myint` 和 `int` 是完全同一个类型，不是新类型（这和 `struct` 造新类型不一样）。两个 `myint` 变量随便互相赋值，"类型安全"并不存在。

- `typedef` 语句结尾的**分号别丢**，丢了报错位置往往很迷惑。
- `typedef` 只影响写法，不影响内存大小、范围和运算规则。

## 练一练

typedef 本身不用专门刷题。第 7 讲做结构体排序（[P1093 奖学金](https://www.luogu.com.cn/problem/P1093)、[P1104 生日](https://www.luogu.com.cn/problem/P1104)）时会大量使用，到时候回来对照。

## 相关笔记

- [[基本数据类型]]
- [[竞赛代码模板]]
- [[教学大纲]]