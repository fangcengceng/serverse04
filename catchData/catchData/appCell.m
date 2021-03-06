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
-(void)setShop:(shopModel *)shopmodel{
    _shopmodel = shopmodel;
    self.nameLabel.text = shopmodel.shop_name;
  //  self.imgView.image = [
    
}
-(void)setupUI{
  

    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.backgroundColor = [UIColor redColor];
    UILabel *downloadLabel = [[UILabel alloc] init];
    downloadLabel.backgroundColor = [UIColor yellowColor];

    UIImageView *imag = [[UIImageView alloc] init];
    nameLabel.numberOfLines = 0;
    [self.contentView addSubview:nameLabel];
    [self.contentView addSubview:imag];
    [self.contentView addSubview:downloadLabel];
    self.nameLabel = nameLabel;
    self.imgView = imag;
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(self.contentView.frame.size.width*0.5);
    }];
}

@end
