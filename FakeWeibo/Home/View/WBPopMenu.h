//
//  WBPopMenu.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/3/15.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBPopMenu : UIImageView

+ (instancetype)showInRect:(CGRect)rect;

+ (void)hide;

@property (nonatomic,weak)UIView *contentView;

@end
