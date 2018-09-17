//
//  WBStatusResult.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/16.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBStatusResult.h"
#import "WBStatus.h"
@implementation WBStatusResult

+ (NSDictionary *)objectClassInArray{
    return @{@"statuses":[WBStatus class]};
}
@end
