//
//  WBBaseParam.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/17.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBBaseParam.h"
#import "WBAccountTool.h"
#import "WBAccount.h"





@implementation WBBaseParam

+ (instancetype)param{
    
    NSLog(@"ngjkewg");
    WBBaseParam *param = [[self alloc]init];
    param.access_token = [WBAccountTool account].access_token;
    return param;
    
}

@end
