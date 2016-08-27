//
//  MTNormalController.h
//  FCCMTApp
//
//  Created by codygao on 16/8/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTBaseViewController.h"
@class MTCAtagoryModel;
@interface MTNormalController : MTBaseViewController
@property(nonatomic,strong) NSArray<MTCAtagoryModel*> *catagoryModel;
@property(nonatomic,strong) NSIndexPath *path;
@property(nonatomic,strong) NSMutableArray * selectedfood;
@end
