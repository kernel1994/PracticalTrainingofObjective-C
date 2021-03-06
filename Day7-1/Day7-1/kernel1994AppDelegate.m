//
//  kernel1994AppDelegate.m
//  Day7-1
//
//  Created by kernel1994 on 16/7/8.
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
    
    UIView * view = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 320, 480)];
    view.tag = 1;
    view.backgroundColor = [UIColor orangeColor];
    [self.window addSubview: view];
    
    [self animationBegin: view];
    
    return YES;
}

- (void) zoomOut: (id) sender
{
    UIView * v = (UIView *) sender;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1.0];
    
    v.bounds = CGRectMake(0, 0, 320, 480);
    
    [UIView commitAnimations];
    
    [self performSelector:@selector(animationBegin:) withObject:v afterDelay:1.0];
}

- (void) animationBegin: (id) sender
{
    UIView * v = (UIView *) sender;
    
    // zoom in
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1.0];
    
    v.bounds = CGRectMake(0, 0, 32, 48);
    
    [UIView commitAnimations];
    
    // 延迟执行方法
    // 需要传参需要:
    // 第二个参数是传的值
    [self performSelector:@selector(zoomOut:) withObject:v afterDelay:1.0];
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
