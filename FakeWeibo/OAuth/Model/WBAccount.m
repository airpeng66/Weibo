//
//  WBAccount.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/10.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBAccount.h"

#define WBAccountTokenKey @"token"
#define WBUidKey @"uid"
#define WBExpires_inKey @"expires"
#define WBExpires_dateKey @"date"

@implementation WBAccount

+ (instancetype)accountWithDict:(NSDictionary *)dict{
    WBAccount *account = [[self alloc]init];
    [account setValuesForKeysWithDictionary:dict];
    return account;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (void)setExpires_in:(NSString *)expires_in{
    _expires_in = expires_in;
    //计算过期时间
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
}

//归档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_access_token forKey:WBAccountTokenKey];
    [aCoder encodeObject:_expires_in forKey:WBExpires_inKey];
    [aCoder encodeObject:_expires_date forKey:WBExpires_dateKey];
    [aCoder encodeObject:_uid forKey:WBUidKey];
    
}

//解档

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:WBAccountTokenKey];
        _expires_in = [aDecoder decodeObjectForKey:WBExpires_inKey];
        _expires_date = [aDecoder decodeObjectForKey:WBExpires_dateKey];
        _uid = [aDecoder decodeObjectForKey:WBUidKey];
    }
    return self;
}

@end
