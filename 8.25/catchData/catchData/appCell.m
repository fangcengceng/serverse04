//
//  appCell.m
//  catchData
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "appCell.h"
#import "shopModel.h"
#import "Masonry.h"
@interface appCell ()

@end
@implementation appCell

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setupUI];
        
    }
    return self;
}
-(void)setupUI{
  

    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.backgroundColor = [UIColor redColor];
    UIImageView *imag = [[UIImageView alloc] init];
    nameLabel.numberOfLines = 0;
    [self.contentView addSubview:nameLabel];
    [self.contentView addSubview:imag];
    self.nameLabel = nameLabel;
    self.imgView = imag;
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(self.contentView.frame.size.width*0.5);
    }];
}
-(void)setShop:(shopModel *)shopmodel{
    self.shop = shopmodel;
    self.nameLabel.text = shopmodel.shop_name;
    
}
@end
