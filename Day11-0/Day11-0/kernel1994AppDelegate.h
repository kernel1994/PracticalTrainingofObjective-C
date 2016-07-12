//
//  kernel1994AppDelegate.h
//  Day11-0
//
//  Created by kernel1994 on 16/7/12.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kernel1994DataSource.h"

@interface kernel1994AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property kernel1994DataSource * dataSource;

@property UIColor * mainColor;

@property UITextField * qq;
@property UITextField * pwd;

@property UITextField * phone;
@property UITextField * pwd2;
@property UITextField * pwdConfirm;

@property UIButton * signinBtn;
@property UIButton * signupBtn;
@property UIButton * goSignupBtn;
@property UIButton * backToSigninBtn;
@property UIButton * logout;

@property UIImageView * avator;

@property UILabel * welcome;

@property UIView * signinView;
@property UIView * signupView;
@property UIView * indexView;

- (void) initView;

- (void) createSigninView;

- (void) createSignupView;

- (void) createIndexView;

- (void) bundTaget;

@end
