//
//  WBStatus.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/10.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBUser.h"
#import "WBPhoto.h"
#import "MJExtension.h"

@interface WBStatus : NSObject<MJKeyValue>

//created_at    string    微博创建时间
//idstr    string    字符串型的微博ID
//text    string    微博信息内容
//source    string    微博来源
//user    object    微博作者的用户信息字段 详细
//retweeted_status    object    被转发的原微博信息字段，当该微博为转发微博时返回 详细
//reposts_count    int    转发数
//comments_count    int    评论数
//attitudes_count        int    表态数
//pic_urls  配图数组

//微博创建时间
@property (nonatomic, copy)NSString* created_at;

//微博id
@property (nonatomic, copy)NSString *idstr;

//微博文字内容
@property (nonatomic, copy)NSString *text;

//微博来源
@property (nonatomic, copy)NSString *source;

//转发数
@property (nonatomic, assign)int reposts_count;

//评论数
@property (nonatomic, assign)int comments_counts;

//表态数
@property (nonatomic, assign)int attitudes_count;

//配图数组
@property (nonatomic, strong) NSArray *pic_urls;

//用户
@property (nonatomic, strong) WBUser *user;

//转发微博

@property (nonatomic, strong) WBStatus *retweeted_status;

@end
