//
//  kernel1994AppDelegate.m
//  Day10-4
//
//  Created by kernel1994 on 16/7/11.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import "kernel1994AppDelegate.h"

@implementation kernel1994AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self initView];
    
    [self.save addTarget:self action:@selector(saveFunc) forControlEvents:UIControlEventTouchUpInside];
    [self.read addTarget:self action:@selector(readFunc) forControlEvents:UIControlEventTouchUpInside];
    
    return YES;
}

-(void)initView
{
    self.username = [[UITextField alloc] initWithFrame: CGRectMake(90, 50, 200, 30)];
    self.username.borderStyle = UITextBorderStyleLine;
    [self.window addSubview: self.username];
    
    self.password = [[UITextField alloc] initWithFrame: CGRectMake(90, 100, 200, 30)];
    self.password.borderStyle = UITextBorderStyleLine;
    [self.window addSubview: self.password];
    
    self.save = [UIButton buttonWithType:UIButtonTypeSystem];
    self.save.frame = CGRectMake(100, 170, 120, 40);
    [self.save setTitle:@"save" forState:UIControlStateNormal];
    self.save.layer.borderColor = ([UIColor blackColor]).CGColor;
    self.save.layer.borderWidth = 1;
    [self.window addSubview: self.save];
    
    self.read = [UIButton buttonWithType:UIButtonTypeSystem];
    self.read.frame = CGRectMake(100, 220, 120, 40);
    self.read.layer.borderColor = ([UIColor blackColor]).CGColor;
    self.read.layer.borderWidth = 1;
    [self.read setTitle:@"read" forState:UIControlStateNormal];
    [self.window addSubview: self.read];
}

- (void) saveFunc
{
    // way 1, NSUserDefaults
//    [self userDefaultSave];
    // way 2, string
//    [self stringWrite];
    // way 3, array
    [self arrayWrite];
}

- (void) readFunc
{
//    [self userDefaultRead];
//    [self stringRead];
    [self arrayRead];
}

- (void) arrayWrite
{
    NSArray * arr = [[NSArray alloc] initWithObjects:self.username.text, self.password.text, nil];
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/arraySave.plist"];
    if ([arr writeToFile:path atomically:YES]) {
        NSLog(@"success");
    } else {
        NSLog(@"fail");
    }
}

- (void) arrayRead
{
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/arraySave.plist"];
    NSArray * arr = [[NSArray alloc] initWithContentsOfFile:path];
    NSString * name = arr[0];
    NSString * pwd = arr[1];
    
    NSLog(@"%@ - %@", name, pwd);
}

- (void) stringWrite
{
    NSString * str = [NSString stringWithFormat:@"%@-%@", self.username.text, self.password.text];
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/textSave"];
    if ([str writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil]) {
        NSLog(@"success");
    } else {
        NSLog(@"fail");
    }
}

- (void) stringRead
{
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/textSave"];
    NSString * str = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray * arr = [str componentsSeparatedByString:@"-"];
    NSString * name = arr[0];
    NSString * pwd = arr[1];
    
    NSLog(@"%@ - %@", name, pwd);
}

- (void) userDefaultSave
{
    // NSUserDefaults， 单例类，存储用户信息
    NSUserDefaults * userDef = [NSUserDefaults standardUserDefaults];
    // 使用键值对
    [userDef setObject:self.username.text forKey:@"name"];
    [userDef setObject:self.password.text forKey:@"pwd"];
    // 立即写入
    [userDef synchronize];
}

- (void) userDefaultRead
{
    NSUserDefaults * userDef = [NSUserDefaults standardUserDefaults];
    NSString * name = [userDef objectForKey:@"name"];
    NSString * pwd = [userDef objectForKey:@"pwd"];
    
    NSLog(@"%@ - %@", name, pwd);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.window endEditing: YES];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
