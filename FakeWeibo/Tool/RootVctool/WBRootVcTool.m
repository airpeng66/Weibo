//
//  WBRootVcTOOL.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/10.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBRootVcTool.h"
#import "WBTabBarController.h"
#import "WBNewFeatureController.h"

@implementation WBRootVcTool

#define WBVersionKey @"Version"

+ (void)chooseRootViewController:(UIWindow *)window{
    //获取当前版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    //获取上一次的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults]objectForKey:WBVersionKey];
    //判断当前是否有新版本
    if ([currentVersion isEqualToString:lastVersion]) {
        //没有新版本
        WBTabBarController *tabVc = [[WBTabBarController alloc]init];
        window.rootViewController = tabVc;
    }else{
        WBNewFeatureController *newFeatureVc = [[WBNewFeatureController alloc]init];
        //保存当前版本
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:WBVersionKey];
        window.rootViewController = newFeatureVc;
    }
}

@end
