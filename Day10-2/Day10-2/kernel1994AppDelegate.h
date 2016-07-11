//
//  kernel1994AppDelegate.h
//  Day10-2
//
//  Created by kernel1994 on 16/7/11.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kernel1994AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property UIView * signinView;
@property UIView * signupView;

@property UIButton * signinBtn;
@property UIButton * signupBtn;

- (void) initView;

- (void) createSigninView;
- (void) createSignupView;

@end
