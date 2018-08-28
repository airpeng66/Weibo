//
//  WBCover.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/3/15.
//  Copyright © 2018年 曹鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBCover;
@protocol WBCoverDelegate<NSObject>

@optional
- (void)coverDidClick:(WBCover *)cover;
@end

@interface WBCover : UIView

+ (instancetype)show;
@property (nonatomic, weak)id<WBCoverDelegate> delegate;

@end
