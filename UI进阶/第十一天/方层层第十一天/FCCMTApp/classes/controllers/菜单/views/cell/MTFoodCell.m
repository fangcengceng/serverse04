//
//  MTFoodCell.m
//  FCCMTApp
//
//  Created by codygao on 16/8/8.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTFoodCell.h"
#import "MTFoodsModel.h"
#import "UIImageView+WebCache.h"
#import "MTFoodOrderControl.h"

@interface MTFoodCell()
@property(nonatomic,weak) UIImageView *iconViews;

@property(nonatomic,weak) UILabel *nameLabel;
@property(nonatomic,weak) UILabel  *monthLabel;
@property(nonatomic,weak) UILabel  *praiseLabel;
@property(nonatomic,weak) UILabel *priceaLabel;
@property(nonatomic,weak) UILabel *descLabel;
@property(nonatomic,weak) MTFoodOrderControl *orderControl;
@end;
@implementation MTFoodCell

//监听值改变事件
-(void)orderControlValueChanged:(MTFoodOrderControl*) sender{
    NSLog(@"%@",@(sender.count).description);
    _foodmodel.orderCount = sender.count;
    if(sender.isIncrease){
        if([self.delegate respondsToSelector:@selector(foodCell:didFinishIncreaseFood: andStartPoin:)]){
            [self.delegate foodCell:self didFinishIncreaseFood:_foodmodel andStartPoin:sender.startP];
            
        }
    }else{
        if([self.delegate respondsToSelector:@selector(foodCell:didFinishDecreaseFood:)]){
            [self.delegate foodCell:self didFinishDecreaseFood:_foodmodel];
        }
    }
    
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;
    
}
-(void)setupUI{
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.backgroundColor = [UIColor redColor];
    iconView.contentMode =   UIViewContentModeScaleAspectFill;
    iconView.layer.cornerRadius = 5;
    iconView.layer.masksToBounds= YES;
    
    [self.contentView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.top.mas_equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView);
    }];
    
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"天堂饭";
    nameLabel.textColor = [UIColor cz_colorWithHex:0x000000];
    nameLabel.font =[UIFont boldSystemFontOfSize:13];
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.equalTo(iconView.mas_right).offset(10);
    }];
    
    UILabel *monthLabel = [UILabel cz_labelWithText:@"sfdfsdl" fontSize:12 color:[UIColor cz_colorWithHex:0x7e7e7e]];
    [self.contentView addSubview:monthLabel];
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(10);
        make.left.equalTo(nameLabel);
    }];
    
    
    UIImageView *praiseView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_food_review_praise"]];
    [self.contentView addSubview:praiseView];
    [praiseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(monthLabel);
        make.left.equalTo(monthLabel.mas_right).offset(10);
        
    }];
    
    UILabel *praiseLabel = [UILabel cz_labelWithText:@"109" fontSize:11 color:[UIColor cz_colorWithHex:0x7e7e7e]];
    [self.contentView addSubview:praiseLabel];
    [praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(praiseView);
        make.left.equalTo(praiseView.mas_right).offset(10);
    }];
    
    UILabel *priceLabel = [UILabel cz_labelWithText:@"¥1.9" fontSize:14 color:[UIColor cz_colorWithHex:0xfa2a09]];
    [self.contentView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(monthLabel.mas_bottom).offset(10);
        make.left.equalTo(monthLabel);
        
        
    }];
    UILabel *desLabel = [UILabel cz_labelWithText:@"lsdjflskjdlksjdf" fontSize:11 color:[UIColor cz_colorWithHex:0x848484]];
    [self.contentView addSubview:desLabel];
    [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconView.mas_bottom).offset(32);
        make.left.equalTo(self.contentView);
        
        make.right.equalTo(self.contentView).offset(-10);

    }];
    //创建点击按钮的视图；
    MTFoodOrderControl *orderControl = [[MTFoodOrderControl alloc] init];
   // orderControl.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:orderControl];
    //添加值改变事件
    [orderControl addTarget:self action:@selector(orderControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
    
    [orderControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(priceLabel);
        make.size.mas_equalTo(CGSizeMake(96,27));
    }];
    

    //记录成员变量
    _iconViews = iconView;
    _nameLabel =nameLabel;
    _monthLabel =monthLabel;
    _praiseLabel = praiseLabel;
    _priceaLabel = priceLabel;
    _descLabel = desLabel;
    _orderControl = orderControl;
   
    [self layoutSubviews];
   
}
-(void)setFoodmodel:(MTFoodsModel *)foodmodel{
    _foodmodel = foodmodel;
    //图片信息
    
    NSString *urlStr = [foodmodel.picture stringByDeletingPathExtension];
    NSURL *url = [NSURL URLWithString:urlStr];
    [_iconViews sd_setImageWithURL:url];
   
    _descLabel.text= foodmodel.desc ;
     _monthLabel.text =foodmodel.month_saled_content ;
  _praiseLabel.text = foodmodel.praise_num.description;
    _priceaLabel.text = [@"¥" stringByAppendingFormat:@"%.2f",foodmodel.min_price.floatValue];
    
    _descLabel.text = foodmodel.desc;
    
    _nameLabel.text = foodmodel.name;
  
    _orderControl.count = foodmodel.orderCount;
    
    //重新结算行高；
    if(foodmodel.desc.length >0){
        [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.bottom.equalTo(_descLabel.mas_bottom).offset(10);
            
        }];
        return;
    }
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.bottom.equalTo(_priceaLabel.mas_bottom).offset(10);
        
    }];
    
    
}
@end
