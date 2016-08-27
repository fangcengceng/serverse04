//
//  ViewController.m
//  jason数据练习
//
//  Created by codygao on 16/8/7.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "MTCatagoryModel.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray<MTCatagoryModel*> *_catagoryList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}
-(void)loadData{
    NSURL *url=[[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *datadic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //写入文件
    [datadic writeToFile:@"/Users/codygao/Desktop/test.plist "atomically:YES];
    //
    NSArray<NSDictionary*> *bigArray=datadic[@"data"][@"food_spu_tags"];
    
    //定义一个数组，用来保存模型
    NSMutableArray<MTCatagoryModel*> *array = [NSMutableArray array];
    //遍历数组转模型
   [bigArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
       //用模型来接保存的数据。
       MTCatagoryModel *catagoryModel = [[MTCatagoryModel alloc] init];
       [catagoryModel setValuesForKeysWithDictionary:obj];
       [array addObject:catagoryModel];
       
       
   }];
    _catagoryList = array.copy;
    
  
}
@end
