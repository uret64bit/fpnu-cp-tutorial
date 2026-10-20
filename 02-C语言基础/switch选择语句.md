---
tags:
  - C语言
  - 基础语法
aliases:
  - switch
  - 多分支
---

# switch 选择语句

> [!info] 一句话
> `switch` 按变量的**值**从多个分支里选一个执行。适合“值等于几就怎么办”的多分支；区间判断（`x >= 60` 这种）还是用 `if-else`。

## 基本语法

```cpp
switch (变量) {
    case 常量1:
        语句;
        break;
    case 常量2:
        语句;
        break;
    default:
        语句;
}
```

- 先计算 `变量` 的值；
- 从上往下找第一个相等的 `case` 常量，从那里开始执行；
- 遇到 `break` 跳出整个 `switch`；
- 没有匹配的 `case` 时执行 `default`（可选）。

## 例子：按星期输出

```cpp
int day;
scanf("%d", &day);   // 1 ~ 7

switch (day) {
    case 1: printf("Monday\n");   break;
    case 2: printf("Tuesday\n");  break;
    case 3: printf("Wednesday\n");break;
    case 4: printf("Thursday\n"); break;
    case 5: printf("Friday\n");   break;
    case 6: printf("Saturday\n"); break;
    case 7: printf("Sunday\n");   break;
    default: printf("error\n");
}
```

## 忘写 break 会“贯穿”

```cpp
switch (n) {
    case 1:
        printf("one\n");   // 没有 break！
    case 2:
        printf("two\n");
}
```

输入 `1` 时，会先输出 `one`，然后**继续执行** `case 2` 的内容，输出 `two`。这种“贯穿”（fall-through）有时是故意的：

```cpp
switch (c) {
    case 'a':
    case 'A':
        printf("选项 A\n");
        break;
    // 'a' 和 'A' 共用同一个分支
}
```

多个 `case` 共用一个分支是合法且常用的写法，但**不能是靠忘写 `break` 意外形成的**。

## 限制

- `switch` 括号里只能是**整数类型**：`int`、`char`、`long long` 等。`double`、字符串不行。
- `case` 后面必须是**常量**（或常量表达式），不能写变量，也不能写范围：

```cpp
case 10:        // 对
case x:         // 错，x 是变量
case 1 ... 10:  // 这不是标准 C++ 写法，不要用
```

## switch 还是 if-else？

| 情况 | 推荐 |
| --- | --- |
| 判断某个变量等于几个固定值 | `switch` |
| 区间判断、多个不同变量的组合条件 | `if-else` |

例如“电费阶梯计费”是按区间算的，用 `if-else` 更自然；菜单选择、星期几这类离散值用 `switch` 更整洁。

> [!tip] 竞赛提示
> 比赛里两种都能过题。优先选**不容易写错**的那个：分支多了之后，`switch` 忘写 `break` 和 `if-else` 条件重叠都是常见 WA 来源。写完把每个分支的值都试一遍。

## 练一练

- [P1424 小鱼的航程(改进版)](https://www.luogu.com.cn/problem/P1424)：`switch` + 循环的组合，可以先用 `if-else` 实现再对比。
- [P5712 Apples](https://www.luogu.com.cn/problem/P5712)：简单多分支，`if-else` 和 `switch` 都试试。

## 相关笔记

- [[if-else条件分支]]
- [[for循环]]
- [[关系运算符]]
