---
tags:
  - 导航
  - 课程
aliases:
  - Day2
  - 第二天
---

# Day 2：运算符、分支、switch、循环与数组

> [!info] 本页说明
> 本页是**课程索引**，对应新 [[教学大纲]] 第 2 讲。内容较多，建议分 2 次课：第一次运算符与分支，第二次 switch、循环与数组。

## 学习目标

- 会写算术、关系、逻辑、自增自减、条件运算符，知道整数除法与取模的坑。
- 会用 `if-else` 和 `switch` 写多分支。
- 会写 `for`、`while`、`do-while`，会用 `break` / `continue`。
- 会声明、初始化和遍历一维数组，能写批量读入、求和、最值、计数。
- 初步感知嵌套循环的 $O(n^2)$ 代价（复杂度在 Day 6 细讲）。

## 路线一：运算符与分支

- [ ] [[算术运算符]]：整数除法、取模、溢出
- [ ] [[赋值运算符]]：复合赋值
- [ ] [[关系运算符]]：`=` 与 `==`
- [ ] [[逻辑运算符]]：`&&`、`||`、短路
- [ ] [[自增自减运算符]]：`i++` 与 `++i`
- [ ] [[条件运算符]]：三目运算符
- [ ] [[类型转换]]：强制转换 `(类型)` 的写法
- [ ] [[运算符优先级]]：不确定就加括号
- [ ] [[if-else条件分支]]：多分支与常见错误

## 路线二：switch 多分支

- [ ] [[switch选择语句]]：`case`、`break`、贯穿（fall-through）、限制
- [ ] 复习 [[if-else条件分支]]：区间判断仍用它

## 路线三：循环

- [ ] [[for循环]]：次数明确的循环，三个竞赛套路
- [ ] [[while循环]]：靠条件停止，数位拆分、读到 0、读到 EOF
- [ ] [[do-while循环]]：先执行再判断，知道即可
- [ ] [[break与continue]]：结束整个循环 vs 跳过本轮
- [ ] [[循环嵌套]]：双重循环、复杂度 $O(n^2)$

## 路线四：数组

- [ ] [[数组]]：声明、初始化、下标、遍历、批量处理
- [ ] 拓展：[[为什么数组下标从0开始]]
- [ ] 预告：嵌套循环的代价在 Day 6 的 [[时间复杂度入门]] 细讲

## 拓展（选读）

- [ ] [[为什么数组下标从0开始]]：下标 = 偏移量

## 课后作业

### 必做

1. [P5710 数的性质](https://www.luogu.com.cn/problem/P5710)：条件判断。
2. [P5711 闰年判断](https://www.luogu.com.cn/problem/P5711)：多分支。
3. [P1424 小鱼的航程(改进版)](https://www.luogu.com.cn/problem/P1424)：`switch` 或 `if-else` + `for` 循环。
4. [P5718 找最小值](https://www.luogu.com.cn/problem/P5718)：循环求最值。
5. [P5720 一尺之棰](https://www.luogu.com.cn/problem/P5720)：`while` 循环。
6. [P5721 数字直角三角形](https://www.luogu.com.cn/problem/P5721)：嵌套循环。
7. [P1046 陶陶摘苹果](https://www.luogu.com.cn/problem/P1046)：数组遍历。

### 选做

- [P5717 三角形分类](https://www.luogu.com.cn/problem/P5717)：多分支 + 边界。
- [P1035 级数求和](https://www.luogu.com.cn/problem/P1035)：`for` 或 `while`。
- [P1047 校门外的树](https://www.luogu.com.cn/problem/P1047)：标记数组。
- [P1428 小鱼比可爱](https://www.luogu.com.cn/problem/P1428)：数组 + 嵌套循环。
- [P1980 计数问题](https://www.luogu.com.cn/problem/P1980)：嵌套循环拆位。
- [P2141 珠心算测验](https://www.luogu.com.cn/problem/P2141)：计数数组。

### 挑战

- [P1307 数字反转](https://www.luogu.com.cn/problem/P1307)：`while` 拆位，注意负数。
- [P1423 小玉在游泳](https://www.luogu.com.cn/problem/P1423)：`while` 循环。
- [P1008 三连击](https://www.luogu.com.cn/problem/P1008)：三重循环枚举（Day 6 会正式讲枚举）。

## 学完自检

- [ ] 能区分 `=` 和 `==`，会写 `if-else if-else` 多分支。
- [ ] 能用 `switch` 写完并检查每个分支的 `break`。
- [ ] 能说出 `for` / `while` / `do-while` 三者的区别和适用场景。
- [ ] 能解释 `break` 和 `continue` 的区别，以及嵌套循环里 `break` 只跳出一层。
- [ ] 数组下标从 0 开始，遍历 n 个元素用 `i < n`，不越界。
- [ ] 能独立写出：批量读入、求和、求最大值、计数四个套路。
- [ ] 会估算双重循环的大致执行次数（复杂度 Day 6 细讲）。

## 相关索引

- [[语言基础索引]]
- [[DAY 1]]
- [[DAY 3]]
- [[教学大纲]]