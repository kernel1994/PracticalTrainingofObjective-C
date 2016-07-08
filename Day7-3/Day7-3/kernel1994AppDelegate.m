//
//  kernel1994AppDelegate.m
//  Day7-3
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
    
    // small circle
//    self.small = [[UIView alloc] init];
//    self.small.center = CGPointMake(320 / 2 + 100, 480 / 2);
//    self.small.bounds = CGRectMake(0, 0, 30, 30);
//    self.small.backgroundColor = [UIColor orangeColor];
//    [self.window addSubview: self.small];
    
    self.smallArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++) {
        UIView * small = [[UIView alloc] init];
        small.center = CGPointMake(320 / 2 + 100 * cos(90 * i * M_PI / 180), 480 / 2 + 100 * sin(90 * i * M_PI / 180));
        small.bounds = CGRectMake(0, 0, 30, 30);
        small.backgroundColor = [UIColor orangeColor];
        
        [self.smallArray addObject: small];
        [self.window addSubview: small];
    }
    
    // timer change angle
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    return YES;
}

- (void) run
{
    static int angle = 0;
    angle += 5;
    
//    self.small.center = CGPointMake(320 / 2 + 100 * cos(angle * M_PI / 180), 480 / 2 + 100 * sin(angle * M_PI / 180));
    int j = 0;
    for (UIView * small in self.smallArray) {
        small.center = CGPointMake(320 / 2 + 100 * cos((angle + 90 * j) * M_PI / 180), 480 / 2 + 100 * sin((angle + 90 * j) * M_PI / 180));
        j++;
        
        // 仿射变换角度
        small.transform = CGAffineTransformMakeRotation(angle * M_PI / 180);
        
    }
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
