//
//  QQSelectController.m
//  QQModelApp
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQSelectController.h"
static NSString *funcID=@"funcID";
#import "QQZoneModel.h"
@interface QQSelectController ()<UITableViewDataSource>

@end

@implementation QQSelectController{
    NSArray<NSArray*> * _zoneList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title=@"动态";
    [self loadData];
    
    
}
#pragma mark  实现数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  _zoneList.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array=_zoneList[section];
    return  array.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出组
    NSArray *array=_zoneList[indexPath.section];
    
    //取出行
    QQZoneModel *model=array[indexPath.row];
    //取出cell传值
    //
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:funcID];
    cell.textLabel.text=model.name;
    cell.imageView.image=[UIImage imageNamed:model.icon];
    
    return  cell;
    
}
#pragma mark 加载数据  1
-(void)loadData{
    NSURL *url=[[NSBundle mainBundle]URLForResource:@"QQQzoneFunction.plist" withExtension:nil];
    NSArray *arr=[NSArray arrayWithContentsOfURL:url];
    NSMutableArray *firstArray=[NSMutableArray array];
    for (NSArray *array in arr) {
        NSMutableArray *secondArray=[NSMutableArray array];
        for (NSDictionary *dic in array) {
            QQZoneModel *model=[[QQZoneModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [secondArray addObject:model];
        }
        [firstArray addObject:secondArray];
    }
    
    _zoneList=firstArray.copy;
    
}
#pragma mark 搭建界面  2
-(void)setupUI{
    [super setupUI];
    UITableView *tabView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
  
    tabView.dataSource=self;
    [tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:funcID];
    [self.view addSubview:tabView];
    self.tableView=tabView;
    
    
}

@end
