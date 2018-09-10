//
//  WBAccountTool.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/10.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WBAccount;

@interface WBAccountTool : NSObject

+ (void)saveAccount: (WBAccount *)account;

+ (WBAccount *)account;

@end
