//
//  kernel1994AppDelegate.m
//  Day10-2
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
    
    [self.signinBtn addTarget:self action:@selector(goSignin) forControlEvents:UIControlEventTouchUpInside];
    [self.signupBtn addTarget:self action:@selector(goSignup) forControlEvents:UIControlEventTouchUpInside];
    
    return YES;
}

- (void)initView
{
    [self createSignupView];
    [self createSigninView];
    
    self.signinBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    self.signupBtn = [UIButton buttonWithType: UIButtonTypeCustom];

    self.signinBtn.frame = CGRectMake(240, 300, 80, 40);
    self.signinBtn.backgroundColor = [UIColor orangeColor];
    [self.signinBtn setTitle:@"signin" forState:UIControlStateNormal];
    [self.signupView addSubview:self.signinBtn];
    
    self.signupBtn.frame = CGRectMake(0, 300, 80, 40);
    self.signupBtn.backgroundColor = [UIColor greenColor];
    [self.signupBtn setTitle:@"signup" forState:UIControlStateNormal];
    [self.signinView addSubview:self.signupBtn];
}

- (void)createSigninView
{
    self.signinView = [[UIView alloc] init];
    self.signinView.frame = CGRectMake(0, 0, 320, 480);
    self.signinView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:self.signinView];
}

-(void)createSignupView
{
    self.signupView = [[UIView alloc] init];
    self.signupView.frame = CGRectMake(0, 0, 320, 480);
    self.signupView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:self.signupView];
}

- (void) goSignin
{
    [self.signupView removeFromSuperview];
    [self.window addSubview: self.signinView];
}

- (void) goSignup
{
    [self.signinView removeFromSuperview];
    [self.window addSubview: self.signupView];
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
