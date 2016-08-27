//
//  QQAdController.h
//  QQModelApp
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//


#import "QQBaseController.h"

@class  QQAdFunctionModel,QQAdController;
@protocol QQAdControlleDelegate <NSObject>
@optional
-(void)addViewController:(QQAdController*)addvc didSelectModel:(QQAdFunctionModel*)selModel;

@end
@interface QQAdController : QQBaseController
@property(nonatomic,weak)id <QQAdControlleDelegate>delegate;


@end
