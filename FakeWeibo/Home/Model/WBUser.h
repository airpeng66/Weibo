//
//  WBUser.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/10.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUser : NSObject

//用户名称
@property (nonatomic, copy) NSString *name;

//用户头像
@property (nonatomic, strong) NSURL *profile_image_url;

@end
