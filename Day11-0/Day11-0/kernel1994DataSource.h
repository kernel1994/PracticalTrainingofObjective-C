//
//  kernel1994DataSource.h
//  Day11-0
//
//  Created by kernel1994 on 16/7/12.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kernel1994DataSource : NSObject

@property NSString * path;

- (BOOL) saveUser: (NSMutableDictionary *) mdUser;

- (NSMutableDictionary *) readUser;

@end
