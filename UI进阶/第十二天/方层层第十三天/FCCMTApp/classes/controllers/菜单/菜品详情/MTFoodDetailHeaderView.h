//
//  MTFoodDetailHeaderView.h
//  MT_waimai[007]
//
//  Created by HM on 16/8/10.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTBaseView.h"
#import "MTFoodsModel.h"




@interface MTFoodDetailHeaderView : MTBaseView
@property(nonatomic,weak)MTFoodsModel *model;

+ (instancetype)foodDetailHeaderView;

@end
