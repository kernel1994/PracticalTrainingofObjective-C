//
//  People2.h
//  Day2
//
//  Created by kernel1994 on 16/7/3.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People2 : NSObject

@property float height;
@property float weight;
@property NSString* gender;
@property int salary;
@property int age;

- (NSString*) isFat;
- (float) payTax;

+ (NSString*) findObject: (People2*) one;

@end
