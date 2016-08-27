//
//  MTFoodDetailHeaderView.m
//  MT_waimai[007]
//
//  Created by HM on 16/8/10.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTFoodDetailHeaderView.h"

@interface MTFoodDetailHeaderView ()
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

@property (weak, nonatomic) IBOutlet UILabel *monthLbl;

@property (weak, nonatomic) IBOutlet UILabel *priceLbl;

@property (weak, nonatomic) IBOutlet UILabel *commentLbl;


@end


@implementation MTFoodDetailHeaderView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.model = nil;
    _addButton.layer.cornerRadius = 5;
    _addButton.layer.masksToBounds = YES;
}
#pragma mark 重写set方法，分发数据
-(void)setModel:(MTFoodsModel *)model{
    _model = model;
    _nameLbl.text = model.name;
    _monthLbl.text = model.month_saled_content;
    _priceLbl.text = [@"¥ " stringByAppendingFormat:@"%.2f", model.min_price.floatValue];
    _commentLbl.text = [@"好吃不贵" stringByAppendingFormat:@"%@",_priceLbl.text];
    
    
}
#pragma mark - 创建视图的类方法
+ (instancetype)foodDetailHeaderView {

    return [[NSBundle mainBundle] loadNibNamed:@"MTFoodDetailHeaderView" owner:nil options:nil].lastObject;

}


#pragma mark - 添加到购物车按钮的事件
- (IBAction)addToCarViewBtnClick:(UIButton *)sender {

    //监听事件，让控制器做动画，注册通知；
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    CGPoint startP = [self convertPoint:sender.center toView:keyWindow];
    NSDictionary * userInfo = @{
                           MTAddFoodKey : _model,
                           MTStartPointKey : [NSValue valueWithCGPoint:startP]
                           };
    _model.orderCount ++;
    [[NSNotificationCenter defaultCenter] postNotificationName:MTAddFoodToCarViewNotification object:self userInfo:userInfo];
    
    

}


@end
