//
//  kernel1994AppDelegate.m
//  Day4-1
//
//  Created by kernel1994 on 16/7/5.
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
    
    // create image view
    UIImageView * imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(0, 0, 320, 480);
    imgView.image = [UIImage imageNamed:@"1.jpg"];
    [self.window addSubview:imgView];
    
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 108; i++) {
        UIImage * img = [UIImage imageNamed: [NSString stringWithFormat:@"%d.jpg", i + 1]];
        [arr addObject: img];
    }
    
    // frame animate
    // play time, default is number image / 30
    imgView.animationDuration = 108 / 30;
    // array of image view
    imgView.animationImages = arr;
    // repeat times, default is 0 means infinite
    imgView.animationRepeatCount = 10;
    // start animate
    [imgView startAnimating];
    
    return YES;
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
