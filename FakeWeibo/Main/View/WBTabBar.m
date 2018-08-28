//
//  WBTabBar.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/1/21.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBTabBar.h"
#import "WBTabbarButton.h"
@interface WBTabBar()
@property (weak, nonatomic) UIButton *plusButton;
@property (strong, nonatomic) NSMutableArray *buttons;
@property (weak, nonatomic) UIButton *selectedButton;

@end

@implementation WBTabBar

-(NSMutableArray *)buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
#pragma mark 中间添加按钮懒加载

-(UIButton *)plusButton{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        _plusButton = btn;
        [self addSubview:_plusButton];
    }
    return _plusButton;
}

-(void)setItems:(NSArray *)items{
    _items = items;
    
    for (UITabBarItem *item in _items) {
        WBTabbarButton *btn = [WBTabbarButton buttonWithType:UIButtonTypeCustom];
        btn.item = item;
        btn.tag = self.buttons.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        [self addSubview:btn];
        [self.buttons addObject:btn];
    }
}

-(void)btnClick:(UIButton *)button{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat tabBarWidth = self.bounds.size.width;
    CGFloat tabBarHeight = self.bounds.size.height;
    
    CGFloat barButtonX = 0;
    CGFloat barButtonY = 0;
    CGFloat barButtonWidth = tabBarWidth /(self.items.count + 1);
    CGFloat barButtonHeight = self.bounds.size.height;
    
    int i = 0;
    for (UIView *tabBarButton in self.buttons) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UIButton")]) {
            if (i == 2) {
                i = 3;
            }
            barButtonX = i *barButtonWidth;
            NSLog(@"%d %f",i,barButtonX);
            tabBarButton.frame = CGRectMake(barButtonX, barButtonY, barButtonWidth, barButtonHeight);
            i++;
        }
    }
    self.plusButton.center = CGPointMake(tabBarWidth *0.5, tabBarHeight*0.5);
}

@end
