---
tags:
  - C语言
  - 基础语法
aliases:
  - 条件分支
  - if语句
---

# if-else 条件分支

> [!info] 一句话
> `if` 让程序根据条件选择执行哪一段代码：条件为真走一条路，为假走另一条路。

## 基本语法

```cpp
if (条件) {
    // 条件为真时执行
} else {
    // 条件为假时执行
}
```

`else` 可以省略：

```cpp
if (score >= 60) {
    printf("Pass\n");
}
```

## 条件为真是什么意思

在 C/C++ 中：

- `0` 表示假；
- **非 0** 表示真。

所以下面两种写法等价：

```cpp
if (a) { ... }
if (a != 0) { ... }
```

初学阶段建议写清楚 `a != 0`，可读性更好。

## 多分支：else if

```cpp
if (score >= 90) {
    grade = 'A';
} else if (score >= 80) {
    grade = 'B';
} else if (score >= 70) {
    grade = 'C';
} else {
    grade = 'D';
}
```

判断从上往下进行，**先匹配到的分支执行后，后面的分支不再执行**。所以顺序很重要：如果先判断 `score >= 70`，90 分也会被分到 C。

## 常见错误

### 1. 把 `==` 写成 `=`

```cpp
if (a = 1) { ... }   // 赋值，条件永远为真
if (a == 1) { ... }  // 比较
```

### 2. 把区间写成数学式

```cpp
if (0 <= x <= 10) { ... }   // 错，永远为真
if (0 <= x && x <= 10) { ... } // 对
```

### 3. if 后面多写分号

```cpp
if (a > 0); {          // 分号让 if 提前结束
    printf("positive\n"); // 这行总会执行
}
```

### 4. 省略花括号导致 else 配对错误

```cpp
if (a > 0)
    if (b > 0)
        printf("both\n");
else
    printf("a <= 0\n");   // 这个 else 实际属于内层 if
```

> [!tip] 建议
> 即使分支只有一行，也写上花括号 `{ }`。多写两行，能避免很多“看起来对、实际错”的 bug。

## 例子：判断奇偶

```cpp
if (n % 2 == 1) {
    printf("odd\n");
} else {
    printf("even\n");
}
```

## 例子：三个数取最大

```cpp
int max_value = a;
if (b > max_value) max_value = b;
if (c > max_value) max_value = c;
printf("%d\n", max_value);
```

## 竞赛提示

- 把边界条件单独测一遍：最小值、最大值、0、负数、相等的情况。
- 多分支题先列出所有情况，再写代码，避免漏掉“else 之外”的情况。
- 如果分支太多，考虑用数组/循环或提前 `return`，不要写十几层嵌套。

## 练一练

- [P5710 数的性质](https://www.luogu.com.cn/problem/P5710)
- [P5711 闰年判断](https://www.luogu.com.cn/problem/P5711)
- [P5717 三角形分类](https://www.luogu.com.cn/problem/P5717)

## 相关笔记

- [[关系运算符]]
- [[逻辑运算符]]
- [[条件运算符]]
