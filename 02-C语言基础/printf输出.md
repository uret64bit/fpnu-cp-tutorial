---
tags:
  - C语言
  - 基础语法
aliases:
  - printf
  - 格式化输出
---

# printf 输出

> [!info] 一句话
> `printf` 按“格式串”把变量的值输出到屏幕。格式符写错，结果就会错，甚至输出乱码。

## 基本用法

```cpp
printf("格式串", 变量1, 变量2, ...);
```

示例：

```cpp
int a = 42;
long long b = 10000000000LL;
double c = 3.14159;

printf("a = %d\n", a);
printf("b = %lld\n", b);
printf("c = %.2f\n", c);
```

输出：

```text
a = 42
b = 10000000000
c = 3.14
```

## 常用格式符

| 数据类型 | 格式符 | 示例 |
| --- | --- | --- |
| `int` | `%d` | `printf("%d", 42);` |
| `unsigned int` | `%u` | `printf("%u", 42u);` |
| `long long` | `%lld` | `printf("%lld", 1LL << 40);` |
| `unsigned long long` | `%llu` |  |
| `float` / `double`（printf） | `%f` | `printf("%f", 3.14);` |
| `char` | `%c` | `printf("%c", 'A');` |
| 字符串 | `%s` | `printf("%s", "Hi");` |
| 十六进制整数 | `%x` / `%X` | `printf("%x", 255);` → `ff` |
| `size_t` | `%zu` | `printf("%zu", sizeof(int));` |
| 百分号 `%` | `%%` | `printf("100%%");` |

> [!warning] `%f` 和 `%lf`
> - 用 `printf` 输出 `double`，写 `%f` 就可以；C99 起写 `%lf` 也有效，但没必要。
> - 用 `scanf` 读 `double`，**必须写 `%lf`**；读 `float` 才用 `%f`。
> 这两个场景不要记混。

## 控制小数位数

```cpp
printf("%f\n", 3.14);     // 3.140000，默认 6 位小数
printf("%.2f\n", 3.14159); // 3.14，保留 2 位，会四舍五入
```

题目要求“保留 2 位小数”时，用 `%.2f`，不要自己手写乘除取整，除非题目明确要求截断。

> [!abstract] 拓展 · 选读
> 格式串里还可以控制宽度和补零：
> ```cpp
> printf("%05d\n", 42);   // 00042
> printf("%8.2f\n", 3.14); //     3.14（总宽度 8）
> ```
> 做时间、编号等格式化输出时可能用到。初学阶段先掌握 `%d`、`%lld`、`%.2f` 即可。

## 易错点

- `long long` 用 `%d` 输出 → 结果错误，必须用 `%lld`。
- `double` 用 `%d` 输出 → 结果错误。
- 输出字符串里的 `%` 要写成 `%%`。
- `printf` 不需要对变量加 `&`（`scanf` 才需要）。
- 不要在 OJ 里输出“请输入”“答案是”等提示语。

> [!tip] 竞赛提示
> 先对着样例一个字符一个字符地核对输出：空格、换行、大小写、小数点位数。很多 WA 都是格式问题。

## 练一练

- [P5706 再分肥宅水](https://www.luogu.com.cn/problem/P5706)：练习读入和保留小数输出。

## 相关笔记

- [[scanf输入]]
- [[基本数据类型]]
- [[转义字符]]
