//
//  kernel1994DataSource.m
//  Day11-0
//
//  Created by kernel1994 on 16/7/12.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import "kernel1994DataSource.h"

@implementation kernel1994DataSource

- (id)init
{
    self.path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/users.plist"];
    
    return self;
}

- (BOOL) saveUser: (NSMutableDictionary *) mdUser
{
    NSMutableDictionary * mdRead = [self readUser];
    // save the new one, need to save all ready have, otherwise 
    // FBI WARRING: there need add valued to the other which maybe empty
    [mdRead setDictionary: mdUser];

    return [mdRead writeToFile:self.path atomically:YES];
}

- (NSMutableDictionary *) readUser
{
    NSMutableDictionary * md = [[NSMutableDictionary alloc] initWithContentsOfFile:self.path];
    NSLog(@"%@", md);
    
    return md;
}

@end
