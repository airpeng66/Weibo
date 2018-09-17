//
//  WBUnreedTool.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/17.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBUnreadResult;

@interface WBUnreedTool : NSObject

+ (void)UnreadWithSuccess:(void(^)(WBUnreadResult *result)) success failure:(void(^)(NSError *error))failure;

@end
