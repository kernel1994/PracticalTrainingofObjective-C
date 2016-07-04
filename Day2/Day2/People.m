//
//  People.m
//  Day2
//
//  Created by kernel1994 on 16/7/3.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import "People.h"

@implementation People

-(void)eat:(float)food
{
    NSLog(@"eat");
    
    if (self.weight > 30) {
        [self sport];
    }
    
    self.weight += food;
}

-(void)sport
{
    NSLog(@"sport");
    self.weight -= 3;
}

@end
