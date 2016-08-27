//
//  messageViewController.m
//  QQModelApp
//
//  Created by codygao on 16/7/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "messageViewController.h"

@interface messageViewController ()

@end

@implementation messageViewController

-(void)setupUI{
    UITableView *tabView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tabView];
    self.tableView=tabView;
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu_icon_bulb"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem=rightItem;
    self.navigationItem.title=@"消息";
}

@end
