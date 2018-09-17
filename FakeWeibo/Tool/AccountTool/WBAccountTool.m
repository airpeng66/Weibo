//
//  WBAccountTool.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/10.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBAccountTool.h"
#import "WBAccount.h"
#import "WBAccountParam.h"
#import "WBHttpTool.h"
#import "MJExtension.h"



@implementation WBAccountTool

#define WBAccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

#define WBAuthorizeBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define WBClient_id @"837419852"
#define WBRedirect_uri @"http://www.baidu.com"
#define WBClient_Secret @"b1bd879928928fc4a146625ed8892522"

static WBAccount *_account;

+ (void)saveAccount:(WBAccount *)account{
    [NSKeyedArchiver archiveRootObject:account toFile:WBAccountFileName];
}

+ (WBAccount *)account{
    if (_account == nil) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:WBAccountFileName];
        //判断账号是否过期
        if ([[NSDate date] compare:_account.expires_date] != NSOrderedAscending) {
            return nil;
        }
    }
    return  _account;
}

+ (void)accessTokenWithCode:(NSString *)code success:(void(^)())success failure:(void (^)(NSError *))failure{
    WBAccountParam *param = [[WBAccountParam alloc]init];
    param.client_id = WBClient_id;
    param.client_secret = WBClient_Secret;
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri = WBRedirect_uri;
    
    [WBHttpTool Post:@"https://api.weibo.com/oauth2/access_token" parameters:param.mj_keyValues success:^(id responseObjec) {
        //字典转模型
        NSLog(@"%@",responseObjec);
        
        WBAccount *account = [WBAccount accountWithDict:responseObjec];
        [WBAccountTool saveAccount:account];
        
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
