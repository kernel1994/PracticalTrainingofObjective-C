//
//  kernel1994AppDelegate.m
//  Day4-2
//
//  Created by kernel1994 on 16/7/5.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import "kernel1994AppDelegate.h"

@implementation kernel1994AppDelegate

const int planeW = 80;
const int planeH = 100;
const int bulletW = 7;
const int bulletH = 10;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // create background
    UIImageView * bg1View = [[UIImageView alloc] init];
    bg1View.frame = CGRectMake(0, 0, 320, 480);
    bg1View.image = [UIImage imageNamed:@"bg.png"];
    bg1View.tag = 1;
    [self.window addSubview: bg1View];
    UIImageView * bg2View = [[UIImageView alloc] init];
    bg2View.frame = CGRectMake(0, -480, 320, 480);
    bg2View.image = [UIImage imageNamed:@"bg.png"];
    bg2View.tag = 2;
    [self.window addSubview: bg2View];
    
    // background move timer
    NSTimer * bgTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(bgMove) userInfo:nil repeats:YES];
    
    const int planeInitX = ([self.window bounds].size.width - planeW) / 2;
    const int planeInitY = [self.window bounds].size.height - planeH;
    
    // create plane
    UIImageView * planeView = [[UIImageView alloc] init];
    planeView.frame = CGRectMake(planeInitX, planeInitY, planeW, planeH);
    planeView.tag = 3;
    planeView.image = [UIImage imageNamed:@"plane1.png"];
    [self.window addSubview: planeView];
    
    NSMutableArray * arrPlane = [[NSMutableArray alloc] init];
    for (int i = 0; i < 2; i++) {
        UIImage * img = [UIImage imageNamed: [NSString stringWithFormat:@"plane%d.png", (i + 1)]];
        [arrPlane addObject: img];
    }
    
    planeView.animationDuration = 0.5;
    planeView.animationImages = arrPlane;
    [planeView startAnimating];
    
    // create bullet
    self.arrBullet = [[NSMutableArray alloc] init];
    for (int i = 0; i < 50; i++) {
        UIImage * img = [UIImage imageNamed: [NSString stringWithFormat:@"zidan.png"]];
        UIImageView * imgV = [[UIImageView alloc] init];
        imgV.frame = CGRectMake(planeInitX + planeW / 2 - 5, planeInitY - 35, bulletW, bulletH);
        imgV.image = img;
        
        [self.window addSubview: imgV];
        [self.arrBullet addObject: imgV];
    }

    // bullet move timer
    NSTimer * bulletTimer = [NSTimer scheduledTimerWithTimeInterval: 0.5 target:self selector:@selector(bulletMove) userInfo:nil repeats:YES];
    
    
    return YES;
}

- (void) bgMove
{
    static int y = 0;
    
    UIView * bg1 = [self.window viewWithTag: 1];
    UIView * bg2 = [self.window viewWithTag: 2];
    
    bg1.frame = CGRectMake(0, y, 320, 480);
    bg2.frame = CGRectMake(0, -480 + y, 320, 480);
    
    y++;
    
    if (y > 480) {
        y = 0;
    }
}

- (void) bulletMove
{
    static int j = 0;
    
    UIImageView * plane = (UIImageView *) [self.window viewWithTag: 3];
 
    for (int i = 0; i < self.arrBullet.count; i++) {
        UIImageView * bullet = [self.arrBullet objectAtIndex: i];
        bullet.frame = CGRectMake(bullet.frame.origin.x, bullet.frame.origin.y - (j += 25), bullet.frame.size.width, bullet.frame.size.height);
        
        if (bullet.frame.origin.y < 0 ) {
            bullet.frame = CGRectMake(plane.frame.origin.x + planeW / 2 - 5, plane.frame.origin.y - 35, bullet.frame.size.width, bullet.frame.size.height);
        }
    }

    if (j > self.arrBullet.count) {
        j = 0;
    }
   
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 返回与当前接收者有关的所有的触摸对象
    NSSet * allTouches = [event allTouches];
    // 视图中的所有对象
    UITouch *touch = [allTouches anyObject];
    // 返回触摸点在视图中的当前坐标
    CGPoint point = [touch locationInView:[touch view]];
    int x = point.x;
    int y = point.y;
//    NSLog(@"(%d, %d)", x, y);
    
    UIImageView * plane = (UIImageView *) [self.window viewWithTag: 3];
    plane.frame = CGRectMake(x - planeW / 2, y - planeH / 2, planeW, planeH);
    
    UIImageView * bullet = (UIImageView *) [self.window viewWithTag: 4];
    bullet.frame = CGRectMake(x - planeW / 2 + 30, y - (planeH / 2 + 30), bulletW, bulletH);
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
