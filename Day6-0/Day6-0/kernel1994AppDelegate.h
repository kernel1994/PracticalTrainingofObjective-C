//
//  kernel1994AppDelegate.h
//  Day6-0
//
//  Created by kernel1994 on 16/7/7.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kernel1994AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property NSMutableArray * headArr, * stomachArr, * footLeftArr, * footRightArr, * tailArr;

@property UIButton * cymbal, * fart, * larry, * milk, * pawn, * pie;

@property UIButton * btnHead, * btnStomach, * btnFootLeft, * btnFootRight, * btnTail;

@property UIImageView * bg;

- (void) initData;

- (void) initView;

@end
