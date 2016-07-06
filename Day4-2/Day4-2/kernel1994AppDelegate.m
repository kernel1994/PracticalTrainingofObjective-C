//
//  kernel1994AppDelegate.m
//  Day4-2
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
    
    [self initData];
    
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
    
    // create plane
    const int planeInitX = ([self.window bounds].size.width - self.planeW) / 2;
    const int planeInitY = [self.window bounds].size.height - self.planeH;
    
    self.planeView.frame = CGRectMake(planeInitX, planeInitY, self.planeW, self.planeH);
    self.planeView.tag = 3;
    self.planeView.image = [UIImage imageNamed:@"plane1.png"];
    
    NSMutableArray * arrPlane = [[NSMutableArray alloc] init];
    for (int i = 0; i < 2; i++) {
        UIImage * img = [UIImage imageNamed: [NSString stringWithFormat:@"plane%d.png", (i + 1)]];
        [arrPlane addObject: img];
    }
    
    self.planeView.animationDuration = 0.5;
    self.planeView.animationImages = arrPlane;
    [self.planeView startAnimating];
    
    // create bullet
    for (int i = 0; i < 20; i++) {
        UIImageView * bullet = [[UIImageView alloc] init];
        // initial out of screen
        bullet.frame = CGRectMake(0, -10, self.bulletW, self.bulletH);
        bullet.image = [UIImage imageNamed: @"zidan"];
        bullet.tag = self.goodTag;
        
        [self.window addSubview: bullet];
        [self.arrBullet addObject: bullet];
    }

    // bullet move timer
    NSTimer * bulletTimer = [NSTimer scheduledTimerWithTimeInterval: 0.03 target:self selector:@selector(bulletTimerFunc) userInfo:nil repeats:YES];
    
    // TODO BUG
    // plane below bullet, because there are two bullet always show in same place above of plane, I hide them after plane
    [self.window addSubview: self.planeView];
    
    // create enemy
    for (int i = 0; i < 10; i++) {
        UIImage * img = [UIImage imageNamed: [NSString stringWithFormat:@"diji.png"]];
        UIImageView * enemy = [[UIImageView alloc] init];
        enemy.frame = CGRectMake([self getRandomEnemyLocation], 0 - self.enemyH, self.enemyW, self.enemyH);
        enemy.image = img;
        enemy.tag = self.goodTag;
        
        NSMutableArray * arrExplode = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            UIImage * img = [UIImage imageNamed: [NSString stringWithFormat:@"bz%d.png", (i + 1)]];
            [arrExplode addObject: img];
        }
        enemy.animationDuration = 0.5;
        enemy.animationImages = arrExplode;
        enemy.animationRepeatCount = 1;
        
        [self.window addSubview: enemy];
        [self.arrEnemy addObject: enemy];
    }
    
    // enemy move timer
    NSTimer * enemyTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target:self selector:@selector(enemyMove) userInfo:nil repeats:YES];
    
    // collision detection timer
    NSTimer * collisionDetectionTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target:self selector:@selector(fight) userInfo:nil repeats:YES];
    
    return YES;
}

- (void)initData
{
    self.planeView = [[UIImageView alloc] init];
    
    self.arrBullet = [[NSMutableArray alloc] init];
    self.arrEnemy = [[NSMutableArray alloc] init];
    
    self.planeW = 80;
    self.planeH = 100;
    
    self.bulletW = 7;
    self.bulletH = 10;
    
    self.enemyW = 40;
    self.enemyH = 50;
    
    self.explodeW = self.enemyW;
    self.explodeH = self.enemyH;
    
    self.goodTag = 5;
    self.badTag = 6;
}

- (void) bgMove
{
    static int y = 0;
    
    UIView * bg1 = [self.window viewWithTag: 1];
    UIView * bg2 = [self.window viewWithTag: 2];
    
    bg1.frame = CGRectMake(0, y, 320, 480);
    bg2.frame = CGRectMake(0, -480 + y, 320, 480);
    
    y += 5;
    
    if (y > 480) {
        y = 0;
    }
}

- (void) bulletTimerFunc
{
    static int count = 0;
    count++;
    if (count % 10 == 0) {
        [self bulletFind];
    }
    
    [self bulletMove];
   
}

- (void) bulletFind
{
    // 遍历数组找可用的子弹, 更改状态为准备发射状态1
    for (UIImageView * bullet in self.arrBullet) {
        if (bullet.tag == self.goodTag) {
            bullet.tag = self.badTag;
            // 重置初始坐标，放在飞机的位置
            bullet.center = CGPointMake(self.planeView.center.x, self.planeView.frame.origin.y);
            break;
        }
    }
}

- (void) bulletMove
{
    for (UIImageView * bullet in self.arrBullet) {
        if (bullet.tag == self.badTag) {
            // the way to change one value
            CGRect rect = bullet.frame;
            rect.origin.y -= 3;
            bullet.frame = rect;
            // 临界值：出屏幕重用
            if (rect.origin.y < -10) {
                bullet.tag = self.goodTag;
            }
        }
    }
}

- (void) enemyMove
{
    static int j = 0;
    
    for (int i = 0; i < self.arrEnemy.count; i++) {
        UIImageView * enemy = [self.arrEnemy objectAtIndex: i];
        enemy.frame = CGRectMake(enemy.frame.origin.x, enemy.frame.origin.y + (j++), self.enemyW, self.enemyH);
        
        if (enemy.frame.origin.y > 480) {
            enemy.frame = CGRectMake([self getRandomEnemyLocation], 0 - self.enemyH, self.enemyW, self.enemyH);
        }
    }
    
    if (j > self.arrEnemy.count) {
        j = 0;
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 返回与当前接收者有关的所有的触摸对象
    NSSet * allTouches = [event allTouches];
    // 视图中的所有对象
    UITouch * touch = [allTouches anyObject];
    // 返回触摸点在视图中的当前坐标
    CGPoint point = [touch locationInView:[touch view]];
    int x = point.x;
    int y = point.y;
//    NSLog(@"(%d, %d)", x, y);
    
    UIImageView * plane = (UIImageView *) [self.window viewWithTag: 3];
    plane.frame = CGRectMake(x - self.planeW / 2, y - self.planeH / 2, self.planeW, self.planeH);
}

- (void) fight
{
    for (UIImageView * enemy in self.arrEnemy) {
        for (UIImageView * bullet in self.arrBullet) {
            // I may wirrte collition detect like
            // enemy.frame.origin.x < (bullet.frame.origin.x + self.bulletW)
            // && (enemy.frame.origin.x + self.enemyW) > (bullet.frame.origin.x)
            // and... y detect
            // but there is a build-in funtion
            if (CGRectIntersectsRect(enemy.frame, bullet.frame)
                && enemy.tag == self.goodTag) {
                [enemy startAnimating];

                enemy.tag = self.badTag;
                bullet.frame = CGRectMake(0, -10, self.bulletW, self.bulletH);
            }
        }
        
        if ((! [enemy isAnimating]) && (enemy.tag == self.badTag)) {
            enemy.frame = CGRectMake([self getRandomEnemyLocation], 0 - self.enemyH, self.enemyW, self.enemyH);
            enemy.tag = self.goodTag;
        }
    }
    
    // plane and enemy collition detect
    [self crash];
}

- (void) crash
{
    for (UIImageView * enemy in self.arrEnemy) {
        if (CGRectIntersectsRect(self.planeView.frame, enemy.frame)
            && enemy.tag == self.goodTag) {
            [enemy startAnimating];
            enemy.tag = self.badTag;
        }
        
        if ((! [enemy isAnimating]) && (enemy.tag == self.badTag)) {
            enemy.frame = CGRectMake([self getRandomEnemyLocation], 0 - self.enemyH, self.enemyW, self.enemyH);
            enemy.tag = self.goodTag;
        }
    }
}

- (float)getRandomEnemyLocation
{
    return arc4random() % 300;
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
