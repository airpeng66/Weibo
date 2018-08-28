//
//  WBCover.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/3/15.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "WBCover.h"

@implementation WBCover
+ (instancetype)show{
    
    WBCover *cover = [[WBCover alloc]initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor clearColor];
    [WBKeyWindow addSubview:cover];
    return cover;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
    
    if ([self.delegate respondsToSelector:@selector(coverDidClick:)]) {
        [self.delegate coverDidClick:self];
    }
}

@end
