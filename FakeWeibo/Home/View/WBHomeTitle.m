//
//  WBHomeTitle.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/3/15.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBHomeTitle.h"
#import "UIView+Frame.h"

@implementation WBHomeTitle

- (instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.currentImage == nil) return ;
    self.titleLabel.x = self.x;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self sizeToFit];
    
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
