//
//  WBUnreadResult.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/17.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUnreadResult : NSObject

//status    int    新微博未读数
//follower    int    新粉丝数
//cmt    int    新评论数
//dm    int    新私信数
//mention_status    int    新提及我的微博数
//mention_cmt    int    新提及我的评论数
//group    int    微群消息未读数
//private_group    int    私有微群消息未读数
//notice    int    新通知未读数
//invite    int    新邀请未读数
//badge    int    新勋章数
//photo    int    相册消息未读数

@property (nonatomic, assign) int status;

@property (nonatomic, assign) int follower;

@property (nonatomic, assign) int cmt;

@property (nonatomic, assign) int dm;

@property (nonatomic, assign) int mention_status;

@property (nonatomic, assign) int mention_cmt;

- (int)messageCount;

- (int)totalCount;
@end
