//
//  ViewController.m
//  SB和AF1
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//
#import "ViewController.h"
#import "AFNetworking.h"
#import "appModel.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController{
    NSArray<appModel*> *_arrayList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPSessionManager *manage  = [AFHTTPSessionManager manager];
    [manage GET:@"https://raw.githubusercontent.com/zhangxiaochuZXC/ServerFile01/master/apps.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray*  _Nullable responseObject) {
        NSMutableArray *tempArray = [NSMutableArray array];
        [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            appModel *app = [appModel appWithdic:obj];
            [tempArray addObject:app];
        }];
        if(_arrayList == nil){
            _arrayList = [[NSArray alloc] init];
        }
        _arrayList = tempArray.copy;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewController *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}
@end
