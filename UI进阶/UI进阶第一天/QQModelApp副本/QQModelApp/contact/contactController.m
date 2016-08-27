//
//  contactController.m
//  QQModelApp
//
//  Created by codygao on 16/7/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "contactController.h"
#import "QQAdController.h"
#import "QQFuncModel.h"

static NSString *cellID=@"cellID";
@interface contactController ()<UITableViewDataSource,QQAdControlleDelegate>

@end

@implementation contactController{
    NSInteger _indexRow;
}
-(void)setupUI{
    
    //创建一个uisegmentController
    
    UISegmentedControl *segController=[[UISegmentedControl alloc]initWithItems:@[@"分组",@"全部"]];
    [segController setWidth:40 forSegmentAtIndex:0];
    [segController setWidth:40 forSegmentAtIndex:1];
    //监听事件
    [segController addTarget:self action:@selector(segmentValueChage:) forControlEvents:UIControlEventValueChanged];
    //设置选中因为默认是两个都不选中,设置第一个Wie选中。
    segController.selectedSegmentIndex=0;
    
    
    self.navigationItem.titleView=segController;
    
    UIImage*image=[UIImage imageNamed:@"header_icon_add"];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickToJumeController)];
    self.navigationItem.rightBarButtonItem=item;
    
    
    UITableView *tv=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tv.dataSource=self;
    
    [tv registerClass:[UITableViewCell class]forCellReuseIdentifier:cellID];
    [self.view addSubview:tv];
    self.tableView=tv;
    //让views去地啊哟用这个方法
    [self segmentValueChage:segController];
    
}

-(void)clickToJumeController{
    QQAdController *advc=[[QQAdController alloc]init];
    [self.navigationController pushViewController:advc animated:YES];
    advc.hidesBottomBarWhenPushed=YES;
 
}
//

-(void)segmentValueChage:(UISegmentedControl*)sender{
    _indexRow=(sender.selectedSegmentIndex+1)*10;
    //tableViews的重新加载数据方法
    [self.tableView reloadData];
    
    
}

#pragma mark 代理方法

-(void)addViewController:(QQAdController *)addvc didSelectModel:(QQAdFunctionModel *)selModel{
   
    
    
}
#pragma mark 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _indexRow;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",@(indexPath.row)];
    return cell;
}
@end
