//
//  MTFoodCell.h
//  FCCMTApp
//
//  Created by codygao on 16/8/8.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  MTFoodsModel,MTFoodCell;
@protocol MTFoodCellDelegate <NSObject>
@optional
-(void)foodCell:(MTFoodCell *)foodCell didFinishIncreaseFood:(MTFoodsModel *)foodModel andStartPoin:(CGPoint) statPoint;
-(void)foodCell:(MTFoodCell *)foodCell didFinishDecreaseFood:(MTFoodsModel *)foodModel;


@end

@interface MTFoodCell : UITableViewCell

@property(nonatomic,strong)MTFoodsModel* foodmodel;

@property(nonatomic,weak) id <MTFoodCellDelegate>delegate;
@end
