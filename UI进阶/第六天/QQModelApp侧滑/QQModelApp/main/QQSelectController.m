//
//  QQSelectController.m
//  QQModelApp
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQSelectController.h"
#import "QQAllCell.h"
#import "AllModel.h"
static NSString *allID=@"allID";
@interface QQSelectController ()

@end

@implementation QQSelectController{
    NSArray<NSArray*> * _allistArray;
}


#pragma mark 实现数据源代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取选中的行的数据
    AllModel *selModel = _allistArray[indexPath.section][indexPath.row];
    _selModel= selModel;

    NSString *controllerName=selModel.targetVc;
    //根据字符串生成一个控制器
    if(selModel.targetVc.length>0){
    Class clz=NSClassFromString(controllerName);
    UITableViewController *aboutController=[[clz alloc] init];
    //跳转到目标控制器
        aboutController.navigationController.title=selModel.targetVc;
        aboutController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:aboutController animated:YES];
    
    }
    
    
}


#pragma mark  实现数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _allistArray.count;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _allistArray[section].count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取出组数据
    NSArray * array=_allistArray[indexPath.section];
    AllModel *model=array[indexPath.row];
    QQAllCell *cell =[tableView dequeueReusableCellWithIdentifier:allID];
    
    cell.textLabel.text = model.name;
    if(model.icon.length>0){
    cell.imageView.image=[UIImage imageNamed:model.icon];
    }
    if(model.detail.length>0){
    cell.detailTextLabel.text=model.detail;
    }
    return  cell;
    
}
#pragma mark 加载数据  1
-(void)loadData:(NSString *)plistName{
    NSURL *url=[[NSBundle mainBundle]URLForResource:plistName withExtension:nil];
    NSArray *arr=[NSArray arrayWithContentsOfURL:url];
    NSMutableArray *firstArray=[NSMutableArray array];
    for (NSArray *array in arr) {
        NSMutableArray *secondArray=[NSMutableArray array];
        for (NSDictionary *dic in array) {
            AllModel *model=[[AllModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [secondArray addObject:model];
        }
        [firstArray addObject:secondArray];
    }
    
    _allistArray=firstArray.copy;
    
}
#pragma mark 搭建界面  2
-(void)setupUI{
    [super setupUI];
    UITableView *tabView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    tabView.delegate=self;
    tabView.dataSource=self;
    [tabView registerClass:[QQAllCell class] forCellReuseIdentifier:allID];
    [self.view addSubview:tabView];
    self.tableView=tabView;
    
    
}

@end
