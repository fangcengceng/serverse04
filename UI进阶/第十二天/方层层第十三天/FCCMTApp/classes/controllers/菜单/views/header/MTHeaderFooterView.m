//
//  MTHeaderFooterView.m
//  FCCMTApp
//
//  Created by codygao on 16/8/8.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTHeaderFooterView.h"
#import "MTCAtagoryModel.h"
@interface MTHeaderFooterView()
@property(nonatomic,weak) UILabel *headerLabel;

@end

@implementation MTHeaderFooterView


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    
    return self;
    
}
-(void)setStr:(NSString *)str{
    _str =str;
    _headerLabel.text =str;
    
    
}
-(void)setupUI{
    
    
    UILabel *label =[UILabel cz_labelWithText:@"销售排行" fontSize:12 color:[UIColor cz_colorWithHex:0x404040]];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    self.contentView.backgroundColor = [UIColor cz_colorWithHex:0xf8f8f8];
    _headerLabel = label;
}
@end
