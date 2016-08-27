//
//  CZBViewController.m
//  viewLoad模拟列表控制器
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "CZBViewController.h"

@interface CZBViewController ()

@end

@implementation CZBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellid"];
    cell.textLabel.text=@"xxxx";
    return cell;
    
    
}

@end
