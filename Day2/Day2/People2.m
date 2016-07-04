//
//  People2.m
//  Day2
//
//  Created by kernel1994 on 16/7/3.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import "People2.h"

@implementation People2

- (NSString *)isFat
{
    NSString* result = nil;
    
    int indicate = self.height - 105;
    
    if (indicate > self.weight) {
        result = @"fat";
    }
    else if (indicate < self.weight)
    {
        result = @"thin";
    }
    else
    {
        result = @"stander";
    }
    
    return result;
}

- (float)payTax
{
    return 1.0;
}

+ (NSString *)findObject:(People2 *)one
{
    if (one.salary < 8000) {
        return @"F**k off loser!";
    }
    
    if (one.age < 25)
    {
        return @"You're too young to get married.";
    }
    
    if (one.age > 30) {
        return @"Are you second marriage?";
    }
    
    return @"Let's get married!";
}

@end
