//
//  MTCAtagoryModel.h
//  FCCMTApp
//
//  Created by codygao on 16/8/7.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MTFoodsModel;
@interface MTCAtagoryModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,strong) NSArray<MTFoodsModel*> *spus;
@end
