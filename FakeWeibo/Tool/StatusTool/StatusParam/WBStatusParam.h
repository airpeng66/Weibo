//
//  WBStatusParam.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/16.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBStatusParam : NSObject

//access_token 访问令牌
@property (nonatomic, copy) NSString *access_token;

//若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
@property (nonatomic, copy) NSString *since_id;

//若指定次参数，则返回Id小于或等于Max_id的微博
@property (nonatomic, copy) NSString *max_id;
@end
