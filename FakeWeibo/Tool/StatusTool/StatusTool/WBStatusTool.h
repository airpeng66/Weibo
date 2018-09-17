//
//  WBStatusTool.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/16.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBStatusTool : NSObject
/* 请求更新的微博
 since_id: 返回比这个id更大的微博
 success: 请求成功时返回的回调
 failure: 失败时返回的回调 错误传递给外界
 
*/

+ (void)newStausWithSinceId:(NSString *)sinceId success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure;

/* 请求旧微博
 
 maxId: 返回小于或者等于这个id的微博
 success: 请求成功时的回调
 failure： 请求失败时的回调
 
 */

+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure;
@end
