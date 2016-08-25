//
//  ViewController.m
//  tableview网络异步下载图片
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableVIew;

@end

@implementation ViewController
-(void)loadView{
    [super loadView];
    self.view  = self.tableVIew;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableVIew.dataSource  = self;
    [self.tableVIew registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = @"xxx";
    return cell;
    
}
@end
