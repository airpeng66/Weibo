//
//  WBAccountTool.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/10.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBAccountTool.h"
#import "WBAccount.h"



@implementation WBAccountTool

#define WBAccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

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


@end
