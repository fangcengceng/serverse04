//
//  CZBBaseViewController.m
//  viewLoad模拟列表控制器
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "CZBBaseViewController.h"

@interface CZBBaseViewController ()

@end
//设置自己的根视图为列表视图
@implementation CZBBaseViewController
-(void)loadView{
    self.tableView=[[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource=self;
    
    self.view=self.tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
@end
