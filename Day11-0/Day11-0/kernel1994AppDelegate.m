//
//  kernel1994AppDelegate.m
//  Day11-0
//
//  Created by kernel1994 on 16/7/12.
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
    
    self.dataSource = [[kernel1994DataSource alloc] init];
    
    self.mainColor = [[UIColor alloc] initWithRed:60 / 255.0 green:202 / 255.0 blue:255 / 255.0 alpha:1.0];
    
    [self initView];
    [self bundTaget];
    
    return YES;
}

- (void)initView
{
    [self createSignupView];
    [self createSigninView];
    [self createIndexView];
}

- (void)createSigninView
{
    self.signinView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.signinView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:self.signinView];
    
    self.avator = [[UIImageView alloc] init];
    self.avator.center = CGPointMake(160, 60);
    self.avator.bounds = CGRectMake(0, 0, 80, 80);
    self.avator.image = [UIImage imageNamed:@"av.jpg"];
    self.avator.layer.masksToBounds = YES;
    self.avator.layer.cornerRadius = 40;
    [self.signinView addSubview:self.avator];
    
    self.qq = [[UITextField alloc] initWithFrame: CGRectMake(20, 120, 280, 30)];
    self.qq.placeholder = @"QQ number";
    self.qq.keyboardType = UIKeyboardTypeNumberPad;
    self.qq.borderStyle = UITextBorderStyleLine;
    [self.signinView addSubview:self.qq];
    
    self.pwd = [[UITextField alloc] initWithFrame: CGRectMake(20, 170, 280, 30)];
    self.pwd.placeholder = @"password";
    self.pwd.borderStyle = UITextBorderStyleLine;
    [self.signinView addSubview:self.pwd];
    
    self.signinBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.signinBtn.frame = CGRectMake(30, 220, 260, 30);
    self.signinBtn.backgroundColor = [[UIColor alloc] initWithRed:60 / 255.0 green:202 / 255.0 blue:255 / 255.0 alpha:1.0];
    [self.signinBtn setTitle:@"Signin" forState:UIControlStateNormal];
    [self.signinView addSubview:self.signinBtn];
    
    self.goSignupBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.goSignupBtn.frame = CGRectMake(200, 400, 100, 30);
    [self.goSignupBtn setTitle:@"Signup" forState:UIControlStateNormal];
    [self.signinView addSubview:self.goSignupBtn];
}

- (void)createSignupView
{
    self.signupView = [[UIView alloc] initWithFrame:CGRectMake(320, 0, 320, 480)];
    self.signupView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:self.signupView];
    
    UIView * board = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
    board.backgroundColor = self.mainColor;
    [self.signupView addSubview:board];
    
    self.backToSigninBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.backToSigninBtn.frame = CGRectMake(0, 20, 50, 30);
    [self.backToSigninBtn setTitle:@"< back" forState:UIControlStateNormal];
    [self.signupView addSubview:self.backToSigninBtn];
    
    self.phone = [[UITextField alloc] initWithFrame: CGRectMake(20, 120, 280, 30)];
    self.phone.placeholder = @"phone number";
    self.phone.keyboardType = UIKeyboardTypeNumberPad;
    self.phone.borderStyle = UITextBorderStyleLine;
    [self.signupView addSubview:self.phone];
    
    self.pwd2 = [[UITextField alloc] initWithFrame: CGRectMake(20, 170, 280, 30)];
    self.pwd2.placeholder = @"password";
    self.pwd2.borderStyle = UITextBorderStyleLine;
    [self.signupView addSubview:self.pwd2];
    
    self.pwdConfirm = [[UITextField alloc] initWithFrame: CGRectMake(20, 220, 280, 30)];
    self.pwdConfirm.placeholder = @"confirm password";
    self.pwdConfirm.borderStyle = UITextBorderStyleLine;
    [self.signupView addSubview:self.pwdConfirm];
    
    
    self.signupBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.signupBtn.frame = CGRectMake(30, 280, 260, 30);
    self.signupBtn.backgroundColor = self.mainColor;
    [self.signupBtn setTitle:@"Signup" forState:UIControlStateNormal];
    [self.signupView addSubview:self.signupBtn];

}

- (void)createIndexView
{
    self.indexView = [[UIView alloc] initWithFrame: CGRectMake(320, 0, 320, 480)];
    self.indexView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:self.indexView];
    
    UIView * board = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
    board.backgroundColor = self.mainColor;
    [self.indexView addSubview:board];
    
    self.logout = [UIButton buttonWithType:UIButtonTypeSystem];
    self.logout.frame = CGRectMake(0, 20, 50, 30);
    [self.logout setTitle:@"logout" forState:UIControlStateNormal];
    [self.indexView addSubview:self.logout];
    
    self.welcome = [[UILabel alloc] init];
    self.welcome.frame = CGRectMake(20, 120, 100, 30);
    [self.indexView addSubview:self.welcome];
}

- (void)bundTaget
{
    [self.goSignupBtn addTarget:self action:@selector(goSignupBtnTage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.backToSigninBtn addTarget:self action:@selector(backToSigninTaget) forControlEvents:UIControlEventTouchUpInside];
    
    [self.signinBtn addTarget:self action:@selector(signinBtnTaget) forControlEvents:UIControlEventTouchUpInside];
    
    [self.signupBtn addTarget:self action:@selector(signupBtnTaget) forControlEvents:UIControlEventTouchUpInside];
    
    [self.logout addTarget:self action:@selector(logoutEvent) forControlEvents:UIControlEventTouchUpInside];
}

- (void) signinBtnTaget
{
    NSString * qq = self.qq.text;
    NSString * pwd = self.pwd.text;
    
    if ([self isEmptyString:qq] || [self isEmptyString:pwd]) {
        NSLog(@"form is not completed");
        [self showDialog: @"form is not completed"];

        return;
    }
    
    NSMutableDictionary * saved = [self.dataSource readUser];
    for (NSString * keyQQ in saved) {
        if ([keyQQ isEqualToString: qq]) {
            if ([[saved objectForKey:keyQQ] isEqualToString:pwd]) {
                NSLog(@"Login success");
                [self siginSeccuss: keyQQ];
                
                return;
            } else {
                NSLog(@"wrong password");
                [self showDialog: @"wrong password"];
                
                return;
            }
        }
    }
    
    NSLog(@"wrong qq number");
    [self showDialog: @"wrong qq number"];
}

- (void) signupBtnTaget
{
    NSString * phone = self.phone.text;
    NSString * pwd = self.pwd2.text;
    NSString * pwdConfirm = self.pwdConfirm.text;
    
    if ([self isEmptyString:phone] || [self isEmptyString:pwd] || [self isEmptyString:pwdConfirm]) {
        NSLog(@"form is not completed");
        [self showDialog:@"form is not completed"];
        
        return;
    }
    
    if (![self isValidPhone: phone]) {
        NSLog(@"phone is invalid");
        [self showDialog:@"phone is invalid"];
        
        return;
    }
    
    if (![pwd isEqualToString:pwdConfirm]) {
        NSLog(@"password is not equal");
        [self showDialog:@"password is not equal"];
        
        return;
    }
    
    
    NSString * qq = [NSString stringWithFormat:@"%d", [self produceQQ]];
    
    NSMutableDictionary * saved = [[NSMutableDictionary alloc] init];
    [saved setObject:pwd forKey: qq];

    if ([self.dataSource saveUser: saved]) {
        NSLog(@"save success");
        
        [self backToSigninTaget];
        self.qq.text = qq;
    } else {
        NSLog(@"save fail");
        
    }
}

- (void) logoutEvent
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.signinView.frame = CGRectMake(0, 0, 320, 480);
    self.indexView.frame = CGRectMake(320, 0, 320, 480);
    
    [UIView commitAnimations];
    
//    self.pwd.text = @"";
}

- (void) goSignupBtnTage
{
//    [self.signinView removeFromSuperview];
//    [self.window addSubview:self.signupView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.signinView.frame = CGRectMake(-320, 0, 320, 480);
    self.signupView.frame = CGRectMake(0, 0, 320, 480);
    
    [UIView commitAnimations];
}

- (void) backToSigninTaget
{
//    [self.signupView removeFromSuperview];
//    [self.window addSubview:self.signinView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.signinView.frame = CGRectMake(0, 0, 320, 480);
    self.signupView.frame = CGRectMake(320, 0, 320, 480);
    
    [UIView commitAnimations];
}

- (void) siginSeccuss: (NSString *) qqNum
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.signinView.frame = CGRectMake(-320, 0, 320, 480);
    self.indexView.frame = CGRectMake(0, 0, 320, 480);
    
    [UIView commitAnimations];
    
    self.welcome.text = [NSString stringWithFormat:@"holle, %@.", qqNum];
    [self keyboardDown];
}

- (void) keyboardDown
{
    [self.window endEditing: YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self keyboardDown];
}

- (BOOL) isValidPhone: (NSString *) phone
{
    NSString * phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate * phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject: phone];
}

- (BOOL) isEmptyString: (NSString *) str
{
    if (str == nil) {
        return YES;
    }
    
    if ([str isEqualToString:@""]) {
        return  YES;
    }
    
    if (str.length == 0) {
        return YES;
    }
    
    return NO;
}

- (int) produceQQ
{
    return (arc4random() % 10000 + 100);
}

- (void) showDialog: (NSString *) info
{
    UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:@"Note" message:info delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil, nil];
    [alertview show];
}

@end
