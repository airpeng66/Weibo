//
//  WBTabbarButton.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/1/22.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBTabbarButton.h"
#import "WBBadgeView.h"
#import "UIView+Frame.h"
#define WBImageRatio 0.7

@interface WBTabbarButton()
@property (nonatomic, weak) WBBadgeView *badgeView;

@end
@implementation WBTabbarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(WBBadgeView *)badgeView{
    if (_badgeView == nil) {
        WBBadgeView *btn = [WBBadgeView buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _badgeView = btn;
    }
    return _badgeView;
}
#pragma mark 设置图片和标题文字居中
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}
#pragma mark 重写set方法

-(void)setItem:(UITabBarItem *)item{
    _item = item;
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    self.badgeView.badgeValue = _item.badgeValue;
}
#pragma mark
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = self.bounds.size.width;
    
    CGFloat imageHeight = self.bounds.size.height * WBImageRatio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
    
    CGFloat titleX = 0;
    CGFloat titleY = imageHeight - 3;
    CGFloat titleWidth = self.bounds.size.width;
    CGFloat titleHeight = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleWidth, titleHeight);
    
    self.badgeView.x = self.width - self.badgeView.width -10;
    self.badgeView.y = 0;
}

@end
