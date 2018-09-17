//
//  WBAccountParam.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/17.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBAccountParam : NSObject

@property (nonatomic, copy) NSString *client_id;

@property (nonatomic, copy) NSString *client_secret;

@property (nonatomic, copy) NSString *grant_type;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *redirect_uri;


@end
