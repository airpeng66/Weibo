//
//  WBNewFeatureViewCell.h
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/8/24.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WBNewFeatureViewCell : UICollectionViewCell

@property (nonatomic, strong)UIImage *image;

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;

@end

