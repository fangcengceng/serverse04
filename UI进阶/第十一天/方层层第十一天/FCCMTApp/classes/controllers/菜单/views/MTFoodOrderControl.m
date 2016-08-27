//
//  MTFoodOrderContro.m
//  FCCMTApp
//
//  Created by codygao on 16/8/10.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTFoodOrderControl.h"
@interface MTFoodOrderControl ()
@property (nonatomic,weak)UILabel *numLabel;

@property(nonatomic,weak) UIButton *decreaseButton;

@end

@implementation MTFoodOrderControl
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        _count = 0;
    }
    return self;
}
//监听按钮的点击事件


-(void)clickIncrease:(UIButton *)sender{
    self.count ++;

    _isIncrease = YES;
    UIWindow *keyW = [UIApplication sharedApplication].keyWindow;
    _startP = [self convertPoint:sender.center toView:keyW];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
 
    
}

-(void)clickDecrease:(UIButton*) sender{
    self.count--;
 
    _isIncrease = NO;
    [self sendActionsForControlEvents:UIControlEventValueChanged];

    
}
//重写set方法,将数据传递出去
-(void)setCount:(NSInteger)count{
    _count = count;
    if (count > 0) {
        // 数量有值,可以进行减少的功能!
        _decreaseButton.hidden = NO;
        _numLabel.hidden = NO;
    } else {
        
        // 数量为0,隐藏控件!
        _decreaseButton.hidden = YES;
        _numLabel.hidden = YES;
    }

    
        _numLabel.text = @(_count).description;
}

-(void)setupUI{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 27, 27)];
    [button setImage:[UIImage imageNamed:@"icon_food_decrease_small"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_food_decrease_small_white_bg"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(clickDecrease:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    UILabel *numlabel = [[UILabel alloc] init];
   
    [self addSubview:numlabel];
    [numlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(button.mas_right);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(27);
        
        
    }];
    UIButton *increaseButton  = [[UIButton alloc] initWithFrame:CGRectMake(69, 0, 27, 27)];
    [increaseButton setImage:[UIImage imageNamed:@"icon_food_increase_small"] forState:UIControlStateNormal];
    [increaseButton setImage:[UIImage imageNamed:@"icon_food_increase_small_highlighted"] forState:UIControlStateHighlighted];
    [increaseButton addTarget:self action:@selector(clickIncrease:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:increaseButton];
    
    //记录成员变量
    _numLabel = numlabel;
    _decreaseButton = button;
}


@end
