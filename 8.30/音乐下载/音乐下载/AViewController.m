//
//  AViewController.m
//  音乐下载
//
//  Created by codygao on 16/8/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "AViewController.h"
#import "BookCell.h"
#import "BookModel.h"

@interface AViewController ()<UITableViewDataSource>

@end
@implementation AViewController{
    NSArray<BookModel*> *_bookList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loaddata];
    self.tableView.tableFooterView = [[UIView alloc] init];
}
-(void)loaddata{
    NSString *str = @"http://42.62.15.101/yyting/bookclient/ClientGetBookResource.action?bookId=30776&imei=OEVGRDQ1ODktRUREMi00OTU4LUE3MTctOUFGMjE4Q0JDMTUy&nwt=1&pageNum=1&pageSize=50&q=114&sc=acca7b0f8bcc9603c25a52f572f3d863&sortType=0&token=KMSKLNNITOFYtR4iQHIE2cE95w48yMvrQb63ToXOFc8%2A";
    NSURL *URL = [NSURL URLWithString:str];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSArray *array = dic[@"list"];
        NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:array.count];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BookModel  *book = [BookModel bookWithDic:obj];
            [tempArray addObject:book];
        }];
        _bookList = tempArray.copy;
        //回到主线程刷新UI;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
        
    }];
    [dataTask resume];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  _bookList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookID" forIndexPath:indexPath ];
    cell.book = _bookList[indexPath.row];
    return cell;
}

@end
