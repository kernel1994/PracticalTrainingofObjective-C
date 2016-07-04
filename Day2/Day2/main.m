//
//  main.m
//  Day2
//
//  Created by kernel1994 on 16/7/3.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
#import "People2.h"

int main(int argc, const char * argv[])
{

    NSLog(@"----- Home work 1 -----");
    People* p1 = [[People alloc] init];
    p1.weight = 60;
    
    [p1 eat:1.0];
    
    
    NSLog(@"----- Home work 2 -----");
    People2* pWangFeng = [[People2 alloc] init];
    pWangFeng.salary = 10000;
    pWangFeng.age = 28;
    pWangFeng.height = 180;
    pWangFeng.weight = 80;
    pWangFeng.gender = @"male";
    
    NSLog(@"WangFeng is %@", [pWangFeng isFat]);
    NSLog(@"WangFeng will pay %.2f", [pWangFeng payTax]);
    
    
    People2* pZhangZiyi = [[People2 alloc] init];
    pZhangZiyi.salary = 3000;
    pZhangZiyi.age = 18;
    pZhangZiyi.height = 165;
    pZhangZiyi.weight = 50;
    pZhangZiyi.gender = @"female";
    
    NSLog(@"ZhangZiyi is %@", [pZhangZiyi isFat]);
    NSLog(@"ZhangZiyi will pay %.2f", [pZhangZiyi payTax]);
    
    
    NSLog(@"WangFeng get that reply %@", [People2 findObject:pWangFeng]);
    
    return 0;
}

