//
//  appCell.m
//  NewsDaily
//
//  Created by codygao on 16/8/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "appCell.h"
#import "Masonry.h"
#import "appModel.h"
#import "UIImageView+WebCache.h"
@interface appCell()
@property(nonatomic,weak)UIImageView *imagView;
@property(nonatomic,weak) UILabel *titleLabel;
@property(nonatomic,weak)UILabel *summaryLabel;
@end
@implementation appCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    UIImageView *imageView = [[UIImageView alloc] init];
    //self.backgroundColor = [UIColor redColor];
    imageView.contentMode =  UIViewContentModeScaleToFill;
    [self.contentView addSubview:imageView];
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines= 0;
    [self.contentView addSubview:titleLabel];
    UILabel *summaryLabel = [[UILabel alloc] init];
    summaryLabel.numberOfLines = 0;
    [self.contentView addSubview:summaryLabel];
   [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.left.equalTo(self).offset(10);
       make.bottom.equalTo(self).offset(-10);
       make.width.mas_equalTo(self.frame.size.width/4);
   }];
  [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(imageView);
      make.right.equalTo(self);
      make.height.equalTo(imageView);
      make.left.equalTo(imageView.mas_right);
  }];
   [summaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(titleLabel);
       make.top.equalTo(titleLabel).offset(8);
       make.bottom.equalTo(imageView);
       make.right.equalTo(titleLabel);
   }];
    
    self.titleLabel = titleLabel;
    self.summaryLabel = summaryLabel;
    self.imagView = imageView;

}
-(void)setAppmodel:(appModel *)appmodel{
    _appmodel = appmodel;
    self.titleLabel.text = appmodel.title;
    self.summaryLabel .text =appmodel.summary;
    NSString *urlStr = [appmodel.img stringByRemovingPercentEncoding];
    [self.imageView  sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil];
}
@end
