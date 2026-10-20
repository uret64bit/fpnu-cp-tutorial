---
tags:
  - C语言
  - 基础语法
aliases:
  - for
  - 循环
---

# for 循环

> [!info] 一句话
> `for` 把“初始化、继续条件、每轮更新”写在一起，适合**循环次数明确**的场景。竞赛里读入 n 个数、遍历数组，几乎全用它。

## 基本语法

```cpp
for (初始化; 条件; 更新) {
    // 循环体
}
```

执行顺序：

```text
初始化 → 判断条件 →（真）执行循环体 → 更新 → 判断条件 → ... →（假）结束
```

例子：输出 1 到 5：

```cpp
for (int i = 1; i <= 5; i++) {
    printf("%d\n", i);
}
```

## 从 0 开始还是从 1 开始

两种习惯都常见：

```cpp
for (int i = 0; i < n; i++) { ... }   // 0-based，和数组下标一致
for (int i = 1; i <= n; i++) { ... }  // 1-based，和“第 i 个”对应
```

关键在于**前后一致**：循环变量和数组下标怎么对应，心里要有数。详细讨论见 [[为什么数组下标从0开始]]。

## 循环变量的作用域

```cpp
for (int i = 0; i < n; i++) { ... }
printf("%d\n", i);   // 错！i 只在循环里有效
```

在 `for` 的初始化里声明的变量，循环结束后就不能用了。如果想在循环外用到，提前声明：

```cpp
int i;
for (i = 0; i < n; i++) { ... }
```

## 三个竞赛套路

### 1. 读入 n 个数

```cpp
int n;
scanf("%d", &n);
for (int i = 0; i < n; i++) {
    int x;
    scanf("%d", &x);
    // 处理 x
}
```

### 2. 求 1 到 n 的和

```cpp
int n, sum = 0;
scanf("%d", &n);
for (int i = 1; i <= n; i++) {
    sum += i;
}
printf("%d\n", sum);
```

累加器 `sum` 在循环**外面**声明并初始化成 0，循环里不断累加。

### 3. 求最大值

```cpp
int max_value = -1;   // 注意初始化：题目没有负数时也可以从 0 开始
for (int i = 0; i < n; i++) {
    int x;
    scanf("%d", &x);
    if (x > max_value) max_value = x;
}
```

## 常见错误

| 写法 | 问题 |
| --- | --- |
| `for (int i = 0; i <= n; i++)` | n 个数应遍历 `i < n`，`<=` 会多访问一次 |
| `for (int i = 0; i < n; i++);` | 末尾多了分号，循环体是空的 |
| `for (int i = 0; i < n; i--)` | 更新写反，死循环（i 越来越小，条件永远满足） |
| 循环体里改 `i` 或 `n` | 循环次数变得不可控 |

> [!warning] 判断循环次数
> 写完循环先数一遍：会执行几次？第一次和最后一次的 `i` 是多少？边界题大多数 WA 都出在这里。

## 练一练

- [P5718 找最小值](https://www.luogu.com.cn/problem/P5718)：n 个数的最小值。
- [P1035 级数求和](https://www.luogu.com.cn/problem/P1035)：循环次数不直接给，也试试 [[while循环]]。
- [P1980 计数问题](https://www.luogu.com.cn/problem/P1980)：for 嵌套数位拆分。

## 相关笔记

- [[while循环]]
- [[do-while循环]]
- [[break与continue]]
- [[循环嵌套]]
