//
//  MTCarVIews.m
//  FCCMTApp
//
//  Created by codygao on 16/8/11.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTCarVIews.h"
#import "MTFoodsModel.h"
@interface MTCarVIews()
@property (weak, nonatomic) IBOutlet UIButton *numButton;
@property (weak, nonatomic) IBOutlet UIButton *carButton;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) IBOutlet UILabel *shopLabel;

@end

@implementation MTCarVIews
-(void)awakeFromNib{
    [super awakeFromNib];
    
    
}

- (IBAction)checkButton:(UIButton *)sender {
    NSLog(@"还差多少元");
    
    
}

- (IBAction)carButton:(UIButton *)sender {
    //点击跳转到购物车详情列表，这里是modal,需要找代理
    if([self.delegate respondsToSelector:@selector(bottomCarView:needsDisplay:)]){
        [self.delegate bottomCarView:self needsDisplay:_shoplist];
    }
    
  
    
}
-(void)setShoplist:(NSMutableArray<MTFoodsModel *> *)shoplist{
    
    _shoplist = shoplist;
    //在数据传递过来以后开始利用数据更改购物车视图的具体显示。因为这个状态是根据数据而变的，所以要写在set方法里面；
      __block NSInteger count = 0;
    __block float money = 0;
  
    [shoplist enumerateObjectsUsingBlock:^(MTFoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        count += obj.orderCount;
        money += obj.orderCount *obj.min_price.floatValue;
    }];
    if(count == 0){
        _numButton.hidden = YES;
        _carButton.selected = NO;
    }else{
        [_numButton setTitle:@(count).description forState:UIControlStateNormal];
       
        _numButton.hidden  = NO;
        _carButton.selected = YES;
    }
    if(money>0){
        _shopLabel.text = [@"¥ " stringByAppendingFormat:@"%.2f", money];
        _shopLabel.textColor = [UIColor redColor];

    }else{
        _shopLabel.textColor = [UIColor cz_colorWithHex:0x808080];
        _shopLabel.text = @"购物车空空如也";
    }
    if(money>20){
        _checkButton.backgroundColor = [UIColor yellowColor];
        [_checkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_checkButton setTitle:@"结账" forState:UIControlStateNormal];
    }else{
        _checkButton.backgroundColor = [UIColor cz_colorWithHex:0xcccccc];
        float shortMoney = 20 - money;
        NSString *shortTitle = [@"还差 " stringByAppendingFormat:@"%.2f", shortMoney];
        [_checkButton setTitle:shortTitle forState:UIControlStateNormal];
        [_checkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    
    
    
}
@end
