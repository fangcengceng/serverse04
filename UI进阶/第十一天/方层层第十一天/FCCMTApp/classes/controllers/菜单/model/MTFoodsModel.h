//
//  MTFoodsModel.h
//  FCCMTApp
//
//  Created by codygao on 16/8/7.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTFoodsModel : NSObject
//增加一个记录数量变化的属性。因为不将值变化传递给模型的话，由于cell复用的关系，会导致值得混乱；
@property(nonatomic,assign) NSInteger orderCount;

@property(nonatomic,copy) NSString *desc;
@property(nonatomic,strong) NSNumber *min_price,*praise_num;
@property(nonatomic,copy) NSString *name,*picture,*month_saled_content;
@end

