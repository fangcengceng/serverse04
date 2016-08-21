//
//  ViewController.m
//  网路加载异步图片
//
//  Created by codygao on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "APPSModel.h"
#import "APPsTableViewCell.h"
static NSString *appsCell = @"appsCell";
@interface ViewController ()<UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;
@end

@implementation ViewController{
    NSArray *_arrayList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setupUI];
}
-(void)loadData{
    
    NSString *str = @"https://raw.githubusercontent.com/zhangxiaochuZXC/ServerFile20/master/apps.json";
    //获取网络图片
 
    AFHTTPSessionManager *manage  = [AFHTTPSessionManager manager];
    [manage GET:@"https://raw.githubusercontent.com/fangcengceng/serverse04/master/apps.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray* responseObject) {
        //遍历数组
        
        NSMutableArray *tempM = [[NSMutableArray alloc]initWithCapacity:responseObject.count];

     [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
       //  obj转模型
         APPSModel *model = [APPSModel appsModelWithDic:obj];
         [tempM addObject:model];
     }];
        _arrayList = tempM.copy;
//        NSLog(@"%@",_arrayList);
        [_tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
    }];
}
-(void)setupUI{
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableview.backgroundView .backgroundColor= [UIColor redColor];
    tableview.dataSource = self;
    tableview.rowHeight = 70;
   
    [tableview registerClass:[APPsTableViewCell class] forCellReuseIdentifier:appsCell];
     [self.view addSubview:tableview];
    self.tableView = tableview;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    APPsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:appsCell forIndexPath:indexPath];
    APPSModel *model = _arrayList[indexPath.row];
   //建立关系
    cell.app = model;
    return cell;
}
@end
