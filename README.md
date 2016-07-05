# PracticalTrainingofObjective-C
Practical Training code of Objective-C

# 实训记录

## 2016-07-02
老师讲了很多关于苹果一些知识，我收获很多。嘻嘻

## 2016-07-03
+ 基本知识
    + Objective-C 面向对象的 C 
    + 创建 Command Line Tool 项目
        + Product Name 产品名，英文首字母大写
        + Type 用 Foundation
    + 左侧导航区
    + 右侧可视化编程
    + 下面控制台
    + pch 文件是预编译文件
    + main 是主文件
    + @autoreleasepool 内存管理中的自动释放池
    + 在 OC 中，字符串使用 **@“xxx”** 的形式
    + NSLog 中的 **NS** 是 **Next Step**
+ 类
    + 属性格式 
        + @property 类型 属性名
    + 方法格式
        + 静态方法：**+ (返回值类型) 方法名: (形参类型) 形参名;**
        + 调用格式：**[类名 静态方法名: 实参1 实参2]**
        + 多个参数：**+ (返回值类型) 方法名: (形参1类型) 形参名1 形参2别名:  (形参2类型) 形参名2**
        + 实例方法：**- (返回值类型) 方法名: (形参类型) 形参名;**
    + 创建对象：**类名 * 对象名 = [类名 alloc];**
    + 初始化对象：**对象名 = [对象名 init];**
    + 上两个可以合写为：**类名 * 对象名 = [[类名 alloc] init];**

## 2016-07-04
+ 屏幕尺寸
  + 4x  | 3.5inch | 320 * 480pt
  + 5x  | 4.0inch | 320 * 568pt
  + 6x  | 4.7inch | 337 * 667pt
  + 6px | 5.5inch | 414 * 736pt
+ 坐标原点在屏幕左上角
+ 使用控件3 步骤
    + 创建对象
    + 设置大小
    + 显示对象
+ 随机数函数：**arc4random()**;
+ 求 [a, b] 范围的随机数：与 ((b - a) + 1) 取余，然后加 a

## 2016-07-05
+ 九宫格公式
    + 列间距：父宽 - (列数 * 间距) / (列数 + 1)
    + 行间距：父高 - (行数 * 间距) / (行数 + 1)
    + X 坐标：列间距 + 列号 * (间距 + 视图宽度)
    + Y 坐标：行间距 + 行号 * (间距 + 视图高度)
+ 视图标签
    + 设置：view.tag = intTag;
    + 获取：UIView * view = [self.window viewWithTag: intTag];
+ 定时器
    + 开启定时器：
        + NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval: floatTime target: self selector: @selector(funcName) userInfo: nil repeats: ture]
    + 关闭定时器：
        + [timer invalidate];
        + timer = nil;
    


