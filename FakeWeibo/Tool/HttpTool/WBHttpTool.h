//
//  WBHttpTool.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/16.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBHttpTool : NSObject

+ (void)GET:(NSString *)URLString
        parameters:(id)parameters
        success:(void(^)(id responseObject))success
        failure:(void(^)(NSError *error))failure;

/*
 发送post请求
 
 @param URLString 请求的基本URL
 @param parameters 请求的参数字典
 @param success 请求成功的回调
 @param failure 请求失败的回调
 
 
 */

+ (void)Post:(NSString *)URLString
      parameters:(id)parameters
     success:(void(^)(id responseObjec))success
     failure:(void(^)(NSError *error))failure;

@end
