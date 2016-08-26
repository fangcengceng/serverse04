//
//  customCell.m
//  异步下载图片
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "customCell.h"
#import "collectionModel.h"
@interface customCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;


@end
@implementation customCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    
   
  
}
-(void)setModeldata:(collectionModel *)modeldata{
    _modeldata = modeldata;
    self.nameLabel.text = modeldata.name;
    self.downloadLabel.text = modeldata.download;
}
@end
