//
//  QQSelectController.m
//  QQModelApp
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQSelectController.h"
#import "QQFuncModel.h"
static NSString *reuseID=@"reuseidentifier";

@interface QQSelectController ()

@end

@implementation QQSelectController{
    NSArray<NSArray*> * _selectList;
}

#pragma mark 代理方法

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //组,行
    QQFuncModel *selModel=_selectList[indexPath.section][indexPath.row];
    self.selFun = selModel;
    
    //cell
    NSString *clsstr=selModel.viewController;
    if(clsstr.length==0){
        return;
    }
    Class cls=NSClassFromString(clsstr);
    UIViewController *viewController=[[cls alloc]init];
    viewController.navigationItem.title=selModel.name;
    viewController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}


#pragma mark  实现数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  _selectList.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array=_selectList[section];
    return  array.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array=_selectList[indexPath.section];
    QQFuncModel *selectModel=array[indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseID];
    cell.textLabel.text=selectModel.name;
    if(selectModel.icon.length>0){
    cell.imageView.image=[UIImage imageNamed:selectModel.icon];
    }
    return  cell;
    
    
}
#pragma mark 加载数据  1
-(void)loadDataWithPlistName:(NSString*)plistname{
    NSURL *url=[[NSBundle mainBundle]URLForResource:plistname withExtension:nil];
    NSArray *arr=[NSArray arrayWithContentsOfURL:url];
    NSMutableArray *firstArray=[NSMutableArray array];
    for (NSArray *array in arr) {
        NSMutableArray *secondArray=[NSMutableArray array];
        for (NSDictionary *dic in array) {
            QQFuncModel *model=[[QQFuncModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [secondArray addObject:model];
        }
        [firstArray addObject:secondArray];
    }
    
    _selectList=firstArray.copy;
    
}
#pragma mark 搭建界面  2
-(void)setupUI{
    [super setupUI];
    UITableView *tabView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tabView.dataSource=self;
    tabView.delegate=self;
    [tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseID];
    [self.view addSubview:tabView];
    self.tableView=tabView;
    
    
}

@end
