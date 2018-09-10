//
//  WBAccount.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/10.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WBAccount : NSObject<NSCoding>

//账号的令牌
@property (nonatomic,copy) NSString *access_token;

//账号的有效期
@property (nonatomic,copy) NSString *expires_in;

//用户唯一标识符
@property (nonatomic,copy) NSString *uid;

//过期时间:保存token的时间+有效期
@property (nonatomic,strong) NSDate *expires_date;

//账号的有效期
@property (nonatomic,copy) NSString *remind_in;



+(instancetype ) accountWithDict: (NSDictionary *)dict;

@end

