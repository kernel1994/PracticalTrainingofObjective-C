//
//  kernel1994AppDelegate.h
//  Day10-4
//
//  Created by kernel1994 on 16/7/11.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kernel1994AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property UITextField * username;
@property UITextField * password;

@property UIButton * save;
@property UIButton * read;

- (void) initView;

@end
