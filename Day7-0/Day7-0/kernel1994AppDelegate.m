//
//  kernel1994AppDelegate.m
//  Day7-0
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
    
    self.arr = [[NSMutableArray alloc] init];
    
    int xCount = 2;
    int yCount = 2;
    int itemW = 320 / xCount;
    int itemH = 480 / yCount;
    for (int i = 0; i < xCount; i++) {
        for (int j = 0; j < yCount; j++) {
            int k = 0;
            if (i > 0) {
                k = xCount - 1 - j;
            } else {
                k = j;
            }
            
            UIView * v = [[UIView alloc] initWithFrame:CGRectMake(k * itemW, i * itemH, itemW, itemH)];
            v.backgroundColor = [self createRandomColor];
            [self.arr addObject: v];
            [self.window addSubview: v];
        }
    }
    
    UIView * viewCenter = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 100, 100)];
    viewCenter.center = CGPointMake(320 / 2, 480 / 2);
    viewCenter.backgroundColor = [UIColor orangeColor];
    viewCenter.userInteractionEnabled = YES;
    [self.window addSubview: viewCenter];
    
    UIButton * btn = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 100, 100)];
    [viewCenter addSubview: btn];
    
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    return YES;
}

- (void) click
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1.0];
    
    UIView * vf = [self.arr objectAtIndex: 0];
    CGRect rect = vf.frame;
    for (int i = 0; i < self.arr.count; i++) {
        UIView * vNow = [self.arr objectAtIndex: i];
        UIView * vNext = [self.arr objectAtIndex: i + 1 >= self.arr.count ? 0 : i + 1];
        
        if (i == self.arr.count - 1) {
            vNow.frame = rect;
        } else {
            vNow.frame = CGRectMake(vNext.frame.origin.x, vNext.frame.origin.y, vNext.frame.size.width, vNext.frame.size.height);
        }
        
    }
    
    
    [UIView commitAnimations];

}

- (UIColor *) createRandomColor
{
    float r = (arc4random() % 255) / 255.0;
    float g = (arc4random() % 255) / 255.0;
    float b = (arc4random() % 255) / 255.0;
    float a = 1.0;
    
    return [[UIColor alloc] initWithRed:r green:g blue:b alpha:a];
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
