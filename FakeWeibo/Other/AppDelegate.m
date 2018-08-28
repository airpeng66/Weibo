//
//  AppDelegate.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/1/20.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "AppDelegate.h"
#import "WBTabBarController.h"
#import "WBNewFeatureController.h"
#import "WBOAuthViewController.h"
#define WBVersion @"version"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    /*NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults]objectForKey:WBVersion];
    if ([currentVersion isEqualToString:lastVersion]) {
        //创建tabBarviewController
        WBTabBarController *tabBarVc = [[WBTabBarController alloc]init];
        
        //设置窗口的根视图控制器
        self.window.rootViewController = tabBarVc;
    }else {
        WBNewFeatureController *newFeature = [[WBNewFeatureController alloc]init];
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:WBVersion];
        self.window.rootViewController = newFeature;
    }
    //将窗口背景色设为黄色
    //self.window.backgroundColor = [UIColor yellowColor];
     
     */
    
    WBOAuthViewController *OAuthVC = [[WBOAuthViewController alloc]init];
    self.window.rootViewController = OAuthVC;
  
    
    //显示窗口
    [self.window makeKeyAndVisible];
    
    
    return YES;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
