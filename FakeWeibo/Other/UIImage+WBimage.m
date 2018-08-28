//
//  UIImage+WBimage.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/1/20.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import "UIImage+WBimage.h"

@implementation UIImage (WBimage)
+(instancetype)imageWithOriginName:(NSString *)imageNmae{
    UIImage *image = [UIImage imageNamed:imageNmae];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+(instancetype)imageWithStretchName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
