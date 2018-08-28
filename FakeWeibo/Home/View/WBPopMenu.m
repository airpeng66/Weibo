//
//  WBPopMenu.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/3/15.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBPopMenu.h"
#import "UIImage+WBimage.h"

@implementation WBPopMenu

+ (instancetype)showInRect:(CGRect)rect{
    WBPopMenu *menu = [[WBPopMenu alloc]initWithFrame:rect];
    menu.userInteractionEnabled = YES;
    menu.image = [UIImage imageWithStretchName:@"popover_background"];
    [WBKeyWindow addSubview:menu];
    return menu;
}

+ (void)hide{
    for (UIView *popview in WBKeyWindow.subviews) {
        if ([popview isKindOfClass:self]) {
            [popview removeFromSuperview];
        }
    }
}

- (void)setContentView:(UIView *)contentView{
    [_contentView removeFromSuperview];
    _contentView = contentView;
    contentView.backgroundColor = [UIColor clearColor];
    [self addSubview:contentView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat y = 9;
    CGFloat margin = 5;
    CGFloat x = margin;
    CGFloat w = self.width - 2*margin;
    CGFloat h = self.height - y -margin;
    self.contentView.frame = CGRectMake(x, y, w, h);
}

@end
