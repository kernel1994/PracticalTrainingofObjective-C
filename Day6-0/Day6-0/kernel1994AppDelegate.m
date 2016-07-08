//
//  kernel1994AppDelegate.m
//  Day6-0
//
//  Created by kernel1994 on 16/7/7.
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
    [self initData];
    
    return YES;
}

- (void)initView
{
    self.bg = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 320, 480)];
    self.bg.image = [UIImage imageNamed: @"pie_00.jpg"];
    self.bg.userInteractionEnabled = YES;
    [self.window addSubview: self.bg];
    
    self.cymbal = [[UIButton alloc] initWithFrame: CGRectMake(20, 280, 50, 50)];
    self.fart = [[UIButton alloc]  initWithFrame: CGRectMake(20, 280 + 20 + 50, 50, 50)];
    self.larry = [[UIButton alloc]  initWithFrame: CGRectMake(20, 280 + 20 * 2 + 50 * 2, 50, 50)];
    self.milk = [[UIButton alloc]  initWithFrame: CGRectMake(20 + 180 + 50, 280, 50, 50)];
    self.pawn = [[UIButton alloc]  initWithFrame: CGRectMake(20 + 180 + 50, 280 + 20 + 50, 50, 50)];
    self.pie = [[UIButton alloc]  initWithFrame: CGRectMake(20 + 180 + 50, 280 + 20 * 2 + 50 * 2, 50, 50)];
    
    [self.cymbal setBackgroundImage: [UIImage imageNamed: @"cymbal.png"]  forState: UIControlStateNormal];
    [self.fart setBackgroundImage: [UIImage imageNamed: @"fart.png"]  forState: UIControlStateNormal];
    [self.larry setBackgroundImage: [UIImage imageNamed: @"larry.png"]  forState: UIControlStateNormal];
    [self.milk setBackgroundImage: [UIImage imageNamed: @"milk.png"]  forState: UIControlStateNormal];
    [self.pawn setBackgroundImage: [UIImage imageNamed: @"pawn.png"]  forState: UIControlStateNormal];
    [self.pie setBackgroundImage: [UIImage imageNamed: @"pie.png"]  forState: UIControlStateNormal];
    
    [self.window addSubview: self.cymbal];
    [self.window addSubview: self.fart];
    [self.window addSubview: self.larry];
    [self.window addSubview: self.milk];
    [self.window addSubview: self.pawn];
    [self.window addSubview: self.pie];
    
    
    self.btnHead = [[UIButton alloc] initWithFrame: CGRectMake(70,80,175,150)];
    self.btnStomach = [[UIButton alloc] initWithFrame: CGRectMake(110,300,95,80)];
    self.btnFootLeft = [[UIButton alloc] initWithFrame: CGRectMake(110,400,45,60)];
    self.btnFootRight = [[UIButton alloc] initWithFrame: CGRectMake(160,400,45,60)];
    self.btnTail = [[UIButton alloc] initWithFrame: CGRectMake(215,360,40,70)];
    
    [self.window addSubview: self.btnHead];
    [self.window addSubview: self.btnStomach];
    [self.window addSubview: self.btnFootLeft];
    [self.window addSubview: self.btnFootRight];
    [self.window addSubview: self.btnTail];
    
    [self.btnHead addTarget:self action:@selector(headClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initData
{
    self.headArr = [[NSMutableArray alloc] init];
    self.stomachArr = [[NSMutableArray alloc] init];
    self.footLeftArr = [[NSMutableArray alloc] init];
    self.footRightArr = [[NSMutableArray alloc] init];
    self.tailArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 81; i++) {
        UIImage * img = [UIImage imageNamed: [NSString stringWithFormat: @"knockout_%02d.jpg", i]];
        [self.headArr addObject: img];
    }
}

- (void) headClick
{
    self.bg.animationDuration = 80 / 30;
    self.bg.animationImages = self.headArr;
    self.bg.animationRepeatCount = 1;
    
    [self.bg startAnimating];
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
