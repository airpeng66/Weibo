//
//  WBBadgeView.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/1/22.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBBadgeView.h"
#import "UIView+Frame.h"
#define WBBadgeViewFont [UIFont systemFontOfSize:11]
@implementation WBBadgeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = WBBadgeViewFont;
        [self sizeToFit];
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = badgeValue;
    if (badgeValue.length == 0 ||[badgeValue isEqualToString:@"0"]) {
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
    CGSize size =[badgeValue sizeWithFont:WBBadgeViewFont];
    if (size.width > self.width) {
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
    
}
@end
