//
//  MTButtonView.m
//  FCCMTApp
//
//  Created by codygao on 16/8/6.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTButtonView.h"
@interface MTButtonView()
@property(nonatomic,weak) UIButton *firstButton;
@property(nonatomic,weak) UIView *yellowView;
@property(nonatomic,weak) UIButton *selectedButton;
@end

@implementation MTButtonView{
    NSArray<UIButton*> *_buttonArray;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self setupUI];
        self.backgroundColor=[UIColor grayColor];
    }
    return self;
}
#pragma mark 按钮的监听事件
-(void)buttonclick:(UIButton *)sender{
    //获取按钮的索引，传给scrollview的【scrollinvisible]方法
    _numPage  = [_buttonArray indexOfObject:sender];
    //试图而不是按钮发送值改变事件
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    //修改按钮的选中状态
    _selectedButton.selected=NO;
    sender.selected=YES;
    _selectedButton=sender;
    //修改黄色试图的状态
    [_yellowView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_numPage*self.bounds.size.width/3);
    }];
    //开启动画,让试图以动画的方式更新约束
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }]; 
}


//重写set方法；完成黄条的移动和按钮的状态
-(void)setOffset_X:(CGFloat )offset_X{
    //mark 让黄条移动
    _offset_X=offset_X;
   [_yellowView mas_updateConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(_firstButton).offset(offset_X);
   }];
    //每次只要子控件布局有所改变，就要重新计算布局；
    [self layoutIfNeeded];
    //MARK 改变按钮的状态
    NSInteger idx=offset_X/_firstButton.bounds.size.width+0.5;
    _selectedButton.selected=NO;
    _buttonArray[idx].selected=YES;
    _selectedButton=_buttonArray[idx];
    
    //MARK 点击按钮的监听事件；

}
-(void)setupUI{
    NSArray<NSString*> *str=@[@"点菜",@"点评",@"商家"];
    [str enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button=[UIButton cz_textButton:obj fontSize:14 normalColor:[UIColor cz_colorWithHex:0x555555] selectedColor:[UIColor cz_colorWithHex:0x000000]];
 
        [self addSubview:button];
        //给按钮添加监听事件
        [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];

        //作为黄色条的参照。
        if(idx==0){
        _firstButton=button;
            _firstButton.selected = YES;
 
        }
    }];
    //保存3个按钮布局,续写在黄色条之前。
    _buttonArray=self.subviews;
    
    //添加约束
    //取出所有的子控件
    [self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
    }];
    UIView *yellowView=[[UIView alloc] init];
    yellowView.backgroundColor=[UIColor yellowColor];
    [self addSubview:yellowView];
    _yellowView=yellowView;
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(_firstButton);
        make.width.equalTo(_firstButton);
        make.height.mas_equalTo(4);
        
        
        
    }];

    
    
}
@end
