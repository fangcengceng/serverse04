//
//  CZBBaseViewController.h
//  viewLoad模拟列表控制器
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZBBaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end
