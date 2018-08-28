//
//  WBTabBar.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/1/21.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBTabBar;
@protocol WBTabbarDelegate <NSObject>
@optional
-(void)tabBar:(WBTabBar *)tabBar didClickButton:(NSInteger)index;
@end

@interface WBTabBar : UIView

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, weak) id <WBTabbarDelegate>delegate;

@end
