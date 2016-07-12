# PracticalTrainingofObjective-C
Practical Training code of Objective-C

# 实训记录

## 2016-07-02
老师讲了很多关于苹果一些知识，我收获很多。下课我就去买了一斤。

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
+ 图像
    + UIImageVIew * imgView.image = [UIImage imageNamed: @"xxx.jpg"];
    + 帧动画：UIImageView 的功能
        + 图像数组：imgView.animationImages = UIImageArray;
        + 持续时间：imgView.animationDuration = ;
        + 重复次数：imgView.animationRepeatCount = ;
        + 开启动画：[imgView startAnimating];

## 2016-07-06
+ 只更改视图的位置大小中的一个值：
```Objective-C
CGRect rect = view.frame;
rect.origin.y += 5;
view.frame = rect;
```
+ 触摸坐标
    + UITouch * touch = [touchs anyObject];
    + CGPoint point = [touch locationInView: self.window];
+ 碰撞检测
    + CGRectIntersectsRect(Rect1, Rect2)

## 2016-07-07
+ 按钮
    + UIButton
    + 设置标题：[btn setTitle: @"xxx" forState: UIControlStateNormal]
    + 绑定事件：
        + 无参：[btn addTarget: self action: @selector(funcName) forControlEvents: UIControlEventTouchUpInside]
        + 带参：[btn addTarget: self action: @selector(funcName:) forControlEvents: UIControlEventTouchUpInside], 此处只需要:，不需要传入实参，参数是按钮对象本身，id 类型的 sender，使用时需要类型强转
    + 设置背景：[btn setBackgroundImage: [UIImage: imageNamed: @"xxx"], forState: UIControlStateNOrmal]
    + 将 UIButton 添加到 UIImageView 上时，UIButton 将获取不到事件，需要将 UIImageView 的 userIteractionEnabled 的属性设置为 YES
+ 零补齐格式化：%02d，两位整数，0补齐 

## 2016-07-08
+ UIView 基础动画
    + 动画开始：[UIView beginAnimatiins: nil context: nil];
    + 持续时间：[UIView setAnimationDuration: 1.0];
    + 提交动画：[UIView commitAnimations];
    + 动画目标代码写在动画提交之前
+ 延迟执行
    + 不带参：[self performSelector:@selector(funcName) withObject:nil afterDelay: 1.0];
    + 带参数：[self performSelector:@selector(funcName:) withObject:argument afterDelay: 1.0];
+ 动画回调
    + 设置代理：[UIView setAnimationDelegate: self];
    + 绑定无参数：[UIView setAnimationDidStopSelector: @selector(funcName)];
    + 绑定多参数：[UIView setAnimationDidStopSelector: @selector(animationDidStop:rinished:context:)];
    + - (void) animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
+ 仿射变换角度
    + view.transform = CGAffineTransFormMakeRotation(), 参数是弧度
+ 改变中心点：view.center = CGPointMake(x, y);

## 2016-07-11
+ 输入框：UITextField
    + 设置边框样式：textField.borderStyle = UITextBorderStyleLine;
    + 成为第一响应状态：[textField becomeFirstResponder];
    + 文本框结束编辑
        + 结束所有编辑状态：[self.window endEditing: YES];
        + 取消第一响应状态：[textField resignFirstResponder];
        + 绑定事件，点击键盘上 return 退出：[self.nameInput addTarget:self action:@selector(keyboardGone) forControlEvents:UIControlEventEditingDidEndOnExit];
    + 设置占位内容：textField.placeholder = @"xxx";
    + 清除上次内容：textField.clearsContextBeforeDrawing = YES;
    + 设置清除内容：textField.clearButtonMode = UITextFieldViewModeAlways;
    + 设置键盘样式：textField.keyBoardType = UIKeyboardTypeNumberPad;
    + 文本显示方式：textField.secureTextEntry = YES;
+ 创建按钮另一种方法：btn = [UIButton buttonWithType: UIButtonTypeCustom];
+ 页面切换
    + 先移除页面：[subview removeFromSuperview];
    + 再添加页面：[self.window addSubview: subview];
+ 页面传值：
    + ?
+ 数据存储
    + 存储位置：沙盒
    + 沙盒目录
        + Documents：用户数据
        + Libarary：系统数据
            + Caches：缓存
            + Preferences：系统数据
        + tmp：临时数据
        + xxx.app：应用程序资源，只读
    + 获取沙盒路径
        + NSHomeDirectory()
        + 路径拼接：[NSHomeDirectory() stringByAppendingPathComponent: @"Documents"];
        + 搜索路径：NSArray * stringArray =  NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        + 获取主资源束，当前应用的目录：
            + NSBundle * bundle = [NSBundle mainBundle];
            + [bundle pathForResource:@"bg" ofType:@"png"];
    + 存储数据
        + NSUserDefaults
            + 存
```Objective-C
// NSUserDefaults， 单例类，存储用户信息
NSUserDefaults * userDef = [NSUserDefaults standardUserDefaults];
// 使用键值对
[userDef setObject:self.username.text forKey:@"name"];
[userDef setObject:self.password.text forKey:@"pwd"];
// 立即写入
[userDef synchronize];
```
            + 读
```Objective-C
NSUserDefaults * userDef = [NSUserDefaults standardUserDefaults];
NSString * name = [userDef objectForKey:@"name"];
NSString * pwd = [userDef objectForKey:@"pwd"];
```
        + [string writeToFile]
            + 存
```Objective-C
NSString * str = [NSString stringWithFormat:@"%@-%@", self.username.text, self.password.text];
NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/textSave"];
if ([str writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil]) {
    NSLog(@"success");
} else {
    NSLog(@"fail");
}
```
            + 读
```Objective-C
NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/textSave"];
NSString * str = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
NSArray * arr = [str componentsSeparatedByString:@"-"];
NSString * name = arr[0];
NSString * pwd = arr[1];
```
        + 还可以存数组，我就不写了

## 2016-07-12
+ UIImageView 圆角：
```Objective-C
imageView.layer.masksToBounds = YES;
imageView.layer.cornerRadius = 40;
```
+ 正则表达式：
```Objective-C
- (BOOL) isValidPhone: (NSString *) phone
{
    NSString * phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate * phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject: phone];
}
```

