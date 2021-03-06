//
//  kernel1994AppDelegate.m
//  Day3-1
//
//  Created by kernel1994 on 16/7/4.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import "kernel1994AppDelegate.h"

@implementation kernel1994AppDelegate

const int itemXCount = 9;
const int itemYCount = 12;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    int c = 0;
    const int gap = 20;
    const int itemWidth = [self.window bounds].size.width / itemXCount;
    const int itemHeight = [self.window bounds].size.height / itemYCount;
    
    for (int i = 0; i < itemYCount; i++) {
        for (int j = 0; j < itemXCount; j++) {
            UIView * v = [[UIView alloc] init];
            // start and end bounds size of x need to calculate, different from the gap
            v.frame = CGRectMake(j * itemWidth + ([self.window bounds].size.width - ((itemXCount - 1) * gap + itemXCount * (itemWidth - gap))) / 2, i * itemHeight + gap, itemWidth - gap, itemHeight - gap);
            v.backgroundColor = [self createRandomColor];
            // give view a unique tag
            v.tag = ++c;

//            UILabel * label = [[UILabel alloc] init];
//            label.frame = CGRectMake(([v bounds].size.width - 20) / 2, ([v bounds].size.height - 20) / 2, 20, 20);
//            label.textAlignment = NSTextAlignmentCenter;
//            label.text = [NSString stringWithFormat:@"%d", c];
//            label.numberOfLines = 2;
//            label.textColor = [UIColor blackColor];
//            label.font = [UIFont systemFontOfSize: 15];
//            
//            [v addSubview: label];
            [self.window addSubview: v];
        }
    }
    
    // timer
    NSTimer * timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(timerFunc) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
    
    
    return YES;
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

- (void) timerFunc
{
    static int i = 1;
    const int ADD = 15;
    
    // first run flag; It make sure the last view's bounds normal when theis app run at the first time.
    static int flag = 0;

    if (flag != 0) {
        // the previous view
        UIView * vp = [self.window viewWithTag: i - 1 < 1 ? itemXCount * itemYCount : i - 1];
        // make it normal
        vp.layer.borderWidth = 0;
        vp.frame = CGRectMake(vp.frame.origin.x + ADD / 2, vp.frame.origin.y + ADD / 2, vp.frame.size.width - ADD, vp.frame.size.height - ADD);
    }
    
    UIView * v = [self.window viewWithTag: i];
    v.frame = CGRectMake(v.frame.origin.x - ADD / 2, v.frame.origin.y - ADD / 2, v.frame.size.width + ADD, v.frame.size.height + ADD);
    v.layer.borderColor = [UIColor blackColor].CGColor;
    v.layer.borderWidth = 1;
    [self.window setBackgroundColor: v.backgroundColor];
    
    // next
    i++;
    flag++;
    
    if (i > itemXCount * itemYCount) {
        i = 1;
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
