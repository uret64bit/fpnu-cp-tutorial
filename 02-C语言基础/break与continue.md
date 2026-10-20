---
tags:
  - C语言
  - 基础语法
aliases:
  - break
  - continue
---

# break 与 continue

> [!info] 一句话
> `break` 直接结束**整个循环**；`continue` 跳过**本轮剩下**的语句，进入下一轮。

## break：跳出循环

```cpp
for (int i = 1; i <= 100; i++) {
    if (i * i > 1000) {
        printf("%d\n", i);
        break;   // 找到第一个就结束整个循环
    }
}
```

常见用途：找到第一个满足条件的数就不再找了。

## continue：跳过本轮

```cpp
for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
        continue;   // 偶数直接进入下一轮
    }
    printf("%d\n", i);   // 只输出奇数
}
```

## 嵌套循环里的 break

`break` 只跳出**最内层**那一层循环：

```cpp
for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
        if (a[i][j] == target) {
            found = true;
            break;   // 只跳出内层 j 循环，外层 i 循环还在跑
        }
    }
}
```

想连外层一起结束，可以用一个标志变量：

```cpp
bool found = false;
for (int i = 0; i < n && !found; i++) {
    for (int j = 0; j < m; j++) {
        if (a[i][j] == target) {
            found = true;
            break;
        }
    }
}
```

## 易错点

- `break` 和 `continue` 只作用于**它所在的那一层循环**。
- 把 `continue` 当成 `break` 用：前者还在循环里，后者已经出去了。
- 用 `break` 提前结束后，别忘了循环外可能依赖的变量（比如累加了一半的和）。
- 不要写出“永远执行不到的代码”：`break;` 后面的语句在同一轮里不会执行。

> [!tip] 竞赛提示
> `break` 能省不少无用计算：比如有序数据里找到目标就停。但注意，提前退出时**输入必须已经读完**——如果后面还有数据没读，程序提前结束会导致 RE 或结果错乱。

## 相关笔记

- [[for循环]]
- [[while循环]]
- [[循环嵌套]]
