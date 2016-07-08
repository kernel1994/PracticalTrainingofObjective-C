//
//  kernel1994AppDelegate.m
//  Day7-2
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
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(createSnow) userInfo:nil repeats:YES];
    
    return YES;
}

- (void) createSnow
{
    
    UIView * view = [[UIView alloc] initWithFrame: CGRectMake(arc4random() % 320, -20, 20, 20)];
    view.backgroundColor = [UIColor orangeColor];
    [self.window addSubview: view];
    
    [UIView beginAnimations:@"fallAnimation" context: (__bridge void *)(view)];
    [UIView setAnimationDuration: 3.0];
    
    view.frame = CGRectMake(arc4random() % 320, 460, 20, 20);
    
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDidStopSelector: @selector(animationDidStop:finished:context:)];
    
    [UIView commitAnimations];
}

- (void) animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    NSLog(@"callback: %@, %@", animationID, context);
    
    UIView * view = (__bridge UIView *)(context);

    if ([animationID isEqualToString: @"fallAnimation"]) {
        [UIView beginAnimations:@"metalAnimation" context: (__bridge void *)(view)];
        [UIView setAnimationDuration: 2.0];
        
        view.frame = CGRectMake(view.frame.origin.x, 475, 45, 5);
        
        [UIView setAnimationDelegate: self];
        [UIView setAnimationDidStopSelector: @selector(animationDidStop:finished:context:)];
        
        [UIView commitAnimations];
    }
    
    if ([animationID isEqualToString:@"metalAnimation"]) {
        view.frame = CGRectMake(arc4random() % 320, 0, 20, 20);
        
        [UIView beginAnimations:@"fallAnimation" context: (__bridge void *)(view)];
        [UIView setAnimationDuration: 2.0];
        
        view.frame = CGRectMake(arc4random() % 320, 460, 20, 20);
        
        [UIView setAnimationDelegate: self];
        [UIView setAnimationDidStopSelector: @selector(animationDidStop:finished:context:)];
        
        [UIView commitAnimations];
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
