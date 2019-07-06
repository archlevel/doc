
一：
编译语句
gcj -fpic -shared -o libSoDemo.so SoDemo.java


二：
在环境变量设置：修改/etc下的profile文件加入这两句： 
LD_LIBRARY_PATH=libname.so的位置 
export LD_LIBRARY_PATH 
或者直接放在%JAVA_HOME%/jre/lib/i386/下面。 
或者直接输入export LD_LIBRARY_PATH=libname.so的位置 

三：

俺在LINUX下使用gcj可以把java编译到so。 
给你看看俺做的例子： 
1.   A.java   和   B.java 
      public   class   A   { 
              public   void   print()   {System.out.println( "Hello,   A ");} 
      }

      public   class   B   { 
              public   static   void   main(String[]   args)   { 
                      new   A().println(); 
              } 
      } 

2.   编译A.java   产生so 
      gcj   -shared   A.java   -o   libA.so 

3.   编译B.java   并和libA.so链接   直接生成本地码 
      gcj   B.java   --main=B   -L.   -lA 
      生成a.out 

4.   运行a.out 
      a.out,   输出：“Hello,   A” 
============================================ 

5.   生成新的so，修改A的输出为“Hello!!!” 
      gcj   -shared   A.java   -o   libA.so 

6.   再次运行a.out 
      a.out，输出：“Hello!!!”
