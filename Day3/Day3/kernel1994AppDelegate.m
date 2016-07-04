//
//  kernel1994AppDelegate.m
//  Day3
//
//  Created by kernel1994 on 16/7/4.
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
    
    // create a view need to
//     1. create a instance
    // UIView * view1 = [[UIView alloc] init];
//     2. set the bounds
    // view1.frame = CGRectMake(0, 0, [self.window bounds].size.width, 30);
//    view1.backgroundColor = [UIColor redColor];
    // 3. add view
//    [self.window addSubview:view1];
    
    
    UIView * l1 = [[UIView alloc] init];
    const int l1width = 15;
    const int l1height = [self.window bounds].size.height / 2;
    l1.backgroundColor = [UIColor blackColor];
    l1.frame = CGRectMake(([self.window bounds].size.width - l1width) / 2, ([self.window bounds].size.height - l1height) / 2, l1width, l1height + 200);
    [self.window addSubview:l1];
    
    
     for (int i = [self.window bounds].size.width; i > 1; i -= 25) {
        UIView * v = [[UIView alloc] init];
        v.frame = CGRectMake(([self.window bounds].size.width - i) / 2, ([self.window bounds].size.width - i) / 2 + 20, i, i);
        // set v.layer.cornerRadius as a half of its weight(or height, beacuse only squer can draw as a circle) to be a circle view
        v.layer.cornerRadius = i / 2;
        v.backgroundColor = [self createRandomColor];
        [self.window addSubview:v];
    }

    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    self.window.backgroundColor = [self createRandomColor];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesCancelled");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
}

- (UIColor *) createRandomColor
{
    float r = (arc4random() % 255) / 255.0;
    float g = (arc4random() % 255) / 255.0;
    float b = (arc4random() % 255) / 255.0;
    float a = 1.0;
    
    NSLog(@"createRandomColor - log - r: %.1f, g: %.1f, b: %.1f, a: %.1f", r, g, b, a);
    
    return [[UIColor alloc] initWithRed:r green:g blue:b alpha:a];
}






/* ************* unused ************* */

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
