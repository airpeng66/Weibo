//
//  WBStatusTool.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/16.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBStatusTool.h"
#import "WBStatusParam.h"
#import "WBAccountTool.h"
#import "WBAccount.h"
#import "WBStatusResult.h"
#import "WBHttpTool.h"
#import "MJExtension.h"

@implementation WBStatusTool

+ (void)newStausWithSinceId:(NSString *)sinceId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    WBStatusParam *param = [[WBStatusParam alloc]init];
    param.access_token = [WBAccountTool account].access_token;
    if (sinceId) {
        param.since_id = sinceId;
    }
    
    [WBHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.mj_keyValues success:^(id responseObject) {
        WBStatusResult *result = [WBStatusResult mj_objectWithKeyValues:responseObject];
        if (success) {
            success(result.statuses);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    WBStatusParam *param = [[WBStatusParam alloc]init];
    param.access_token = [WBAccountTool account].access_token;
    if (maxId) {
        param.max_id = maxId;
    }
    [WBHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.mj_keyValues success:^(id responseObject) {
        WBStatusResult *result = [WBStatusResult mj_objectWithKeyValues:responseObject];
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
