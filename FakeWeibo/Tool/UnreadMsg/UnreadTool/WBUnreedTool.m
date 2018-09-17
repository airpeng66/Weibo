//
//  WBUnreedTool.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/17.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBUnreedTool.h"
#import "WBUnreadMsgParam.h"
#import "WBAccountTool.h"
#import "WBAccount.h"
#import "WBHttpTool.h"
#import "MJExtension.h"
#import "WBUnreadResult.h"

@implementation WBUnreedTool

+ (void)UnreadWithSuccess:(void (^)(WBUnreadResult *))success failure:(void (^)(NSError *))failure{
    
    WBUnreadMsgParam *param = [WBUnreadMsgParam param];
    
    param.uid = [WBAccountTool account].uid;
    
    [WBHttpTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:param.mj_keyValues success:^(id responseObject) {
        WBUnreadResult *result = [WBUnreadResult mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
