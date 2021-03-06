### 前言

Java 应用性能优化是一个老生常谈的话题，典型的性能问题如页面响应慢、接口超时，服务器负载高、并发数低，数据库频繁死锁等。尤其是在“糙快猛”的互联网开发模式大行其道的今天，随着系统访问量的日益增加和代码的臃肿，各种性能问题开始纷至沓来。

Java 应用性能的瓶颈点非常多，比如磁盘、内存、网络 I/O 等系统因素，Java 应用代码，JVM GC，数据库，缓存等。笔者根据个人经验，将 Java 性能优化分为 4 个层级：应用层、数据库层、框架层、JVM 层
+ 一:应用层
+ 二:数据库层
+ 三:框架层
+ 四:JVM层
```
每层优化难度逐级增加，涉及的知识和解决的问题也会不同。比如应用层需要理解代码逻辑，通过 Java 线程栈定位有问题代码行等；数据库层面需要分析 SQL、定位死锁等；框架层需要懂源代码，理解框架机制；JVM 层需要对 GC 的类型和工作机制有深入了解，对各种 JVM 参数作用了然于胸。

围绕 Java 性能优化，有两种最基本的分析方法：现场分析法和事后分析法。

现场分析法通过保留现场，再采用诊断工具分析定位。现场分析对线上影响较大，部分场景（特别是涉及到用户关键的在线业务时）不太合适。

事后分析法需要尽可能多收集现场数据，然后立即恢复服务，同时针对收集的现场数据进行事后分析和复现。下面我们从性能诊断工具出发，分享一些案例与实践。
```
### 性能诊断工具

```
性能诊断一种是针对已经确定有性能问题的系统和代码进行诊断，还有一种是对预上线系统提前性能测试，确定性能是否符合上线要求。

本文主要针对前者，后者可以用各种性能压测工具（例如 JMeter）进行测试，不在本文讨论范围内。

```

针对 Java 应用，性能诊断工具主要分为两层：OS 层面和 Java 应用层面（包括应用代码诊断和 GC 诊断）。

#### OS 诊断

OS 的诊断主要关注的是 CPU、Memory、I/O 三个方面。

##### CPU
```
对于 CPU 主要关注平均负载（Load Average），CPU 使用率，上下文切换次数（Context Switch）。

通过 top 命令可以查看系统平均负载和 CPU 使用率，图 2 为通过 top 命令查看某系统的状态。
```
##### Memory
##### I/O
