//
//  kernel1994AppDelegate.h
//  Day4-2
//
//  Created by kernel1994 on 16/7/5.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kernel1994AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** array of bullet */
@property NSMutableArray * arrBullet;
/** array of enemy plane */
@property NSMutableArray * arrEnemy;

/** view of plane */
@property UIImageView * planeView;

/** width of plane */
@property int planeW;
/** height of plane */
@property int planeH;

/** width of bullet */
@property int bulletW;
/** height of bullet */
@property int bulletH;

/** width of enemy plane */
@property int enemyW;
/** height of enemy plane */
@property int enemyH;

/** explode width and height */
@property int explodeW;
@property int explodeH;

/** symbol of enemy status, 5 is normal, 6 is crash */
@property int enemyNormalTag;
@property int enemyCrashTag;

/** initialize peoperty */
- (void) initData;

/** return initialized x location of enemy  */
- (float) getRandomEnemyLocation;

/** fire bullet crash enemy plane, collision detection */
- (void) fight;

/** plane collide with enemy plane */
- (void) crash;

@end
