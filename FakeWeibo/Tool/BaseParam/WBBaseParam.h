//
//  WBBaseParam.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/17.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBBaseParam : NSObject

@property(nonatomic, copy) NSString *access_token;

+ (instancetype)param;

@end
