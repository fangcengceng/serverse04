//
//  appCell.h
//  catchData
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class shopModel;
@interface appCell : UICollectionViewCell
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak) UIImageView *imgView;
@property(nonatomic,strong) shopModel *shopmodel;
@end
