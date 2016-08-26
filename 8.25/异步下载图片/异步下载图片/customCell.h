//
//  customCell.h
//  异步下载图片
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class collectionModel;
@interface customCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imagView;
@property(nonatomic,strong) collectionModel *modeldata;
@end
