//
//  APPsTableViewCell.m
//  网路加载异步图片
//
//  Created by codygao on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "APPsTableViewCell.h"
#import "Masonry.h"
#import "APPSModel.h"
#import "UIImageView+WebCache.h"
@interface APPsTableViewCell()
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *downLabel;
@property(nonatomic,weak) UIImageView *imgView;

@end

@implementation APPsTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self setupUI];
    }
    return self;
}
-(void)setApp:(APPSModel *)app{
    _app = app;
    self.nameLabel.text = app.name;
    self.downLabel.text = app.download;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon] placeholderImage:[UIImage imageNamed:@"user_default"]];
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon]];

}
-(void)setupUI{
    UILabel *nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:nameLabel];
    UILabel *downloadLabel = [[UILabel alloc] init];
    downloadLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:downloadLabel];
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(20);
        make.bottom.equalTo(self.contentView).offset(-20);
        make.width.mas_equalTo(60);
    }];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView);
        make.left.equalTo(imageView.mas_right).offset(10);
        make.height.mas_equalTo(10);
        make.width.mas_equalTo(200);
     }];
    [downloadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameLabel.mas_bottom).offset(10);
        make.left.equalTo(nameLabel.mas_left);
        make.height.mas_equalTo(10);
        make.right.equalTo(self.contentView);
    }];

//记录成员变量
    self.nameLabel = nameLabel;
    self.downLabel = downloadLabel;
    self.imgView = imageView;
}

@end
