//
//  ViewController.m
//  模拟科技头条
//
//  Created by codygao on 16/8/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "appModel.h"
#import "appCell.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController{
    NSArray <appModel*> *_arrayList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
-(void)loadData{
    NSString *str = @"http://news.coolban.com/Api/Index/news_list/app/2/cat/0/limit/20/time/1472031475/type/0?channel=appstore&uuid=1CF3D8F1-1DFA-4F0B-8335-40F209B0E355&net=5&model=iPhone&ver=1.0.5";
    NSURL *url = [NSURL URLWithString:str];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil && data != nil){
            
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSMutableArray *temparray = [NSMutableArray arrayWithCapacity:array.count];
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                appModel *model =[appModel appWithdic:obj];
                [temparray addObject:model];
            }];
            _arrayList = temparray.copy;
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
            }];
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                [self.tableView reloadData];
                
            }];

        
        }else {
            NSLog(@"%@",error);
        }
        
        
    }] resume] ;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    appCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.textLabel.text= @"xxx";
    return cell;
    
    
}
@end
