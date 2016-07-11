//
//  kernel1994AppDelegate.m
//  Day10-0
//
//  Created by kernel1994 on 16/7/11.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import "kernel1994AppDelegate.h"

@implementation kernel1994AppDelegate

const int BALL_COUNT = 10;
const int SMALL_BALL_COUNT = 3;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.center = [[UIView alloc] init];
    self.balls = [[NSMutableArray alloc] init];
    self.smallBalls = [[NSMutableArray alloc] init];
    
    self.center.center = CGPointMake(160, 240);
    self.center.bounds = CGRectMake(0, 0, 40, 40);
    self.center.backgroundColor = [UIColor redColor];
    self.center.layer.cornerRadius = 20;
    [self.window addSubview: self.center];
    
    for (int i = 0; i < BALL_COUNT; i++) {
        UIView * ball = [[UIView alloc] init];
        
        int angle = (360 / BALL_COUNT) * i;
        
        // tag represent angle
        ball.tag = angle;
        ball.center = CGPointMake(160 + 100 * cos(angle * M_PI / 180), 240 + 100 * sin(angle * M_PI / 180));
        ball.bounds = CGRectMake(0, 0, 20, 20);
        ball.backgroundColor = [UIColor blueColor];
        ball.layer.cornerRadius = 10;
        
        [self.balls addObject: ball];
        [self.window addSubview: ball];
        
        for (int j = 0; j < SMALL_BALL_COUNT; j++) {
            UIView * smallBall = [[UIView alloc] init];
            int angleSamll = (360 / SMALL_BALL_COUNT) * j;
            
            smallBall.tag = angleSamll;
            smallBall.center = CGPointMake(ball.center.x + 20 * cos(angleSamll * M_PI / 180), ball.center.y + 20 * sin(angleSamll * M_PI / 180));

            smallBall.bounds= CGRectMake(0, 0, 10, 10);
            smallBall.backgroundColor = [UIColor grayColor];
            smallBall.layer.cornerRadius = 5;
            
            [self.smallBalls addObject: smallBall];
            [self.window addSubview: smallBall];
        }
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(transfer) userInfo:nil repeats:YES];
    
    return YES;
}

- (void) transfer
{
    for (int i = 0; i < self.balls.count; i++) {
        UIView * ball = [self.balls objectAtIndex: i];
        ball.tag += 10;
        ball.center = CGPointMake(160 + 100 * cos(ball.tag * M_PI / 180), 240 + 100 * sin(ball.tag * M_PI / 180));
        
        int k = i * SMALL_BALL_COUNT;
        for (int j = k; j < k + SMALL_BALL_COUNT; j++) {
            UIView * smallBall = [self.smallBalls objectAtIndex: j];
            smallBall.tag += 30;
            smallBall.center = CGPointMake(ball.center.x + 20 * cos(smallBall.tag * M_PI / 180), ball.center.y + 20 * sin(smallBall.tag * M_PI / 180));
       }
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
