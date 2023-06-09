# Chapter 1. An Introduction to Java

## 1.1 Java as a Programming Platform
Java是一个完整的平台。

一个提供诸如安全性、跨操作系统的可移植性以及自动垃圾收集等服务的执行环境。

## 1.2 The Java “White Paper” Buzzwords
### 1.2.1 Simple

- 去除了C++语法中复杂的语法：头文件、指针运算、结构、联合、操作符重载、虚基类等
- 基本的解释器以及类支持大约仅为40KB,再加上基础的标准类库和对线程的支持（基本上是一个自包含的微内核），大约需要增加175KB

### 1.2.2 Object-Oriented

- Java和C++的主要不同点在于多重继承，在Java中，取而代之的是更简单的接口概念
- 与C++相比，Java提供了更丰富的运行时自省功能

### 1.2.3 Distributed

- Java有一个丰富的例程库，用于处理像HTTP和FTP之类的TCP/IP协议
- Java应用程序能够通过URL打开和访问网络上的对象，其便捷程度就好像访问本地文件一样

### 1.2.4 Robust

Java非常强调进行早期的问题检测、后期动态的（运行时）检测，以及消除容易出错的情况

### 1.2.5 Secure

从一开始，Java就设计成能够防范各种攻击，其中包括：
- 运行时堆栈溢出，这是蠕虫和病毒常用的攻击手段
- 破坏自己的进程空间之外的内存
- 未经授权读写文件

现在看来，尽管Java安全模型没有原先预想的那么成功，但Java在那个时代确实相当超前

### 1.2.6 Architecture-Neutral（体系结构中立）

编译器生成一个体系结构中立的目标文件格式，这是一种编译过的代码，只要有Java运行时系统，这些编译后的代码可以在许多处理器上运行

### 1.2.7 Portable（可移植性）

- Java标准中对于基本数据类型给的大小以及有关运算的行为都有明确的说明
- 二进制数据以固定的格式进行存储和传输，消除了字节顺序的困扰
- 字符串则采用标准的Unicode格式存储

### 1.2.8 Interpreted（可解释性）

直到Java9才提供了jshell工具支持快捷而且具有探索性的编程

### 1.2.9 High-Performance

尽管对解释后的字节码性能已经比较满意，但在有些场合下还需要更高的性能。

字节码可以（在运行时）动态地转换成对应运行这个应用的特定CPU的机器码。

### 1.2.10 Multithreaded

多线程可以带来更快的交互响应和实时行为

### 1.2.11 Dynamic

库中可以自由地添加新方法和实例变量，而对客户端却没有任何影响

## 1.3 Java Applets and the Internet
在网页上运行的Java程序称为applet。要使用applet,只需要一个启用Java的Web浏览器，它会为你执行字节码。

## 1.4 A Short History of Java
|版本|年份|新语言特性|类与接口的数量|
|---|---|---|---|
|1.0|1996|语言本身|211|
|1.1|1997|内部类|477|
|1.2|1998|strictfp修饰符|1524|
|1.3|2000|无|1840|
|1.4|2002|断言|2723|
|5.0|2004|泛型类、“for each”循环、可变元参数、自动装箱、元数据、枚举、静态导入|3279|
|6|2006|无|3793|
|7|2011|基于字符串的选择语句、菱形运算符、二进制字面量、异常处理增强|4024|
|8|2014|lambda表达式、包含默认方法的接口、流和日期/时间库|4240|
|9|2017|模块、其他的语言和类库增强|6005|
|11|20178|本地变量类型推断（var）、HTTP客户端、Java FX的移除、Java网络启动协议、Java EE的精简和整合以及CORBA|6005|
|17|2021|Switch表达式、文本块、instanceof模式匹配、记录、密封类|6005|

## 1.5 Common Misconceptions about Java
略。详见原文。

需要提到的一点是，现在Java虚拟机使用了即时编译器（Just-In-Time Compiler，JIT），因此采用Java编写的“热点”代码运行速度与C++相差无几，有些情况下可能甚至更快。
