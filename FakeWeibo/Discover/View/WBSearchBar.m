//
//  WBSearchBar.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/8/15.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBSearchBar.h"

@implementation WBSearchBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:13];
        self.background = [UIImage imageWithStretchName:@"searchbar_textfield_background"];
        
        //设置左边的view
        //initwithimage:默认imageview的尺寸跟图片一样
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        
        //让图片两边有一定间隙
        imageV.width += 10;
        imageV.contentMode = UIViewContentModeCenter;
        
        self.leftView = imageV;
        
        self.leftViewMode = UITextFieldViewModeAlways;
                           
    }
    return self;
}

@end
