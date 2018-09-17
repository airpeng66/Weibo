//
//  WBStatusResult.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/16.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface WBStatusResult : NSObject<MJKeyValue>

//微博内容数组
@property (nonatomic, strong) NSArray *statuses;

//用户最近微博总数
@property (nonatomic, assign) int total_number;

@end
