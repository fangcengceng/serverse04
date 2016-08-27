//
//  QQSelectController.h
//  QQModelApp
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//
#import "QQBaseController.h"
@class QQFuncModel;
@interface QQSelectController :QQBaseController<UITableViewDataSource,UITableViewDelegate>//暴露出来让子类访问
@property(nonatomic,strong)QQFuncModel *selFun;
-(void)loadDataWithPlistName:(NSString*)plistname;
@end
