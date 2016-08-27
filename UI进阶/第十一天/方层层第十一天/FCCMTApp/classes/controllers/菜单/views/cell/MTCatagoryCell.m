//
//  MTCatagoryCell.m
//  FCCMTApp
//
//  Created by codygao on 16/8/7.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTCatagoryCell.h"
#import "MTCAtagoryModel.h"
@interface MTCatagoryCell()

@property (nonatomic,weak) UILabel *nameLabel;
@property(nonatomic,weak) UIView *lineV;

@end
@implementation MTCatagoryCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;

}
-(void) setupUI{
    
    self.contentView.backgroundColor=[UIColor cz_colorWithHex:0xf3f3f3];
    self.textLabel.backgroundColor = [UIColor clearColor];
    
    self.textLabel.textColor = [UIColor cz_colorWithHex:0x464646];
    self.textLabel.font = [UIFont systemFontOfSize:13];
    self.textLabel.numberOfLines = 2;
    //设置分割线的特性
    UIView *seperateView = [[UIView alloc] init];
    seperateView.backgroundColor = [UIColor cz_colorWithHex:0xe3e3e3];
    [self.contentView addSubview:seperateView];
    [seperateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
    
    //设置选中的cell的颜色
    UIView *selectView = [[UIView alloc] init];
    selectView.backgroundColor = [UIColor cz_colorWithHex:0xffffff];
    self.selectedBackgroundView = selectView;
    
    UIView *lineV = [[UIView alloc] init];
    lineV.backgroundColor = [UIColor cz_colorWithHex:0xffd900];
    //把黄色条子添加到选中的view上。
    [selectView addSubview:lineV];
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.left.equalTo(selectView);
        make.height.mas_offset(28);
        make.width.mas_equalTo(4);
    }];
   
  
}
-(void)setModel:(MTCAtagoryModel *)model{
    _model=model;
    _model.name = _nameLabel.text;
    
}
 @end
