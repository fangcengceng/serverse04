//
//  QQSelectController.h
//  QQModelApp
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//
#import "QQBaseController.h"
@class AllModel;
//写在。h中子类才可以访问方法和属性
@interface QQSelectController :QQBaseController<UITableViewDataSource,UITableViewDelegate>
//生成一个属性，让子类访问
@property(nonatomic,weak) AllModel *selModel;

-(void)loadData:(NSString *)plistName;

@end
