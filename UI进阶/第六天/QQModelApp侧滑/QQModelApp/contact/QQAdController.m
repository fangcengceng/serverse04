//
//  QQAdController.m
//  QQModelApp
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQAdController.h"
#import "QQAdFunctionModel.h"

@interface QQAdController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QQAdController{
    //必须加泛型，否自在行的时候无法实现；
    NSArray<NSArray *>*_adList;
    
}
-(void)viewDidLoad{
    [super viewDidLoad];
    //试图加载完成前加载数据
    [self loadData];
    
}

#pragma mark 代理的使用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取选中的数据
    //获取组,组里是数组
    NSArray<QQAdFunctionModel*> *groupArr=_adList[indexPath.section];
    
    //获取行，行里是模型
    QQAdFunctionModel *selectmodel=groupArr[indexPath.row];
    
    //将数据传递给列表控制器。
    //代理
    //让代理实现协议
    if([self.delegate respondsToSelector:@selector(addViewController:didSelectModel:)]){
        [self.delegate addViewController:self didSelectModel:selectmodel];
    }
    [self.navigationController popViewControllerAnimated: YES];
}




#pragma mark 3 实现数据源代理
//组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _adList.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _adList[section].count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adCell" forIndexPath:indexPath];
    NSArray *arr=_adList[indexPath.section];
    QQAdFunctionModel *model=arr[indexPath.row];
    cell.textLabel.text=model.name;
    cell.imageView.image=[UIImage imageNamed:model.icon];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma  mark 加载数据  1
-(void)loadData{
    NSURL *url=[[NSBundle mainBundle]URLForResource:@"QQAddFunction.plist"withExtension:nil];
    NSArray *Array=[NSArray arrayWithContentsOfURL:url];
    NSMutableArray *firestArray=[NSMutableArray array];
    for (NSArray *array in Array) {
        NSMutableArray *secondArray=[[NSMutableArray alloc]init];
        for (NSDictionary *dic in array) {
            QQAdFunctionModel *model=[[QQAdFunctionModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [secondArray addObject:model];
        }
        [firestArray addObject:secondArray];
    }
    _adList=firestArray.copy;
}
#pragma mark 2 搭建界面
-(void)setupUI{
    [super setupUI];
    self.title=@"添加";
    UITableView *tavView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tavView.dataSource=self;
    tavView.delegate=self;
    [tavView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"adCell"];
    [self.view addSubview:tavView];
    
    self.tableView=tavView;
    
    
    
}
@end
