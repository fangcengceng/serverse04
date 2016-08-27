//
//  ViewController.m
//  JASON数据
//
//  Created by codygao on 16/8/6.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMCatogryModel.h"

@interface ViewController ()

@end

@implementation ViewController{
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];

}
-(void)loadData{
    NSURL *url=[[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //取出关键字
    NSDictionary *datadicc=dic[@"data"];
    NSArray<NSDictionary*> *array=datadicc[@"food_spu_tags"];
    
    
    //for循环遍历
    NSMutableArray <HMCatogryModel*> *bigArray=[NSMutableArray array];
  [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      HMCatogryModel *model = [[HMCatogryModel alloc] init];
      [model setValuesForKeysWithDictionary:obj];
      
      [bigArray addObject:model];
      
      
  }];
                            
   
    //NSLog(@"%@",bigArray[1].spus);
    
}

-(void)demo2{
    //遍历转模型
    NSURL *url=[[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil];
    //转成二进制数
    NSData *data=[NSData dataWithContentsOfURL:url];
    //反序列化
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //写入文件

    //取出关键数据
    
    NSDictionary *allData=dic[@"data"];
    NSArray<NSDictionary*> *allCatagory=allData[@"food_spu_tags"];
    //数据转模型
    NSMutableArray<HMCatogryModel*> *array = [[NSMutableArray alloc] init];
    
    [allCatagory enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        HMCatogryModel *model= [[HMCatogryModel alloc] init];
        [model setValuesForKeysWithDictionary:obj];
      
        [array addObject:model];
         NSLog(@"%@",model);
        
    
        
    }];
    
         //_listArray=array;
}
-(void)demo1{
    //加载URL
    NSURL *url=[[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil];
    //生成二进制shuju
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    
    //反序列化
    
    
   NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers  error:nil];
    //遍历数组的关键字
    
    //写入文件/Users/codygao/Desktop/01-UI进阶-第10天(美团02)
    [dic writeToFile:@"/Users/codygao/Desktop/.plist" atomically:YES];
   
    //取出所有的关键数据
    NSDictionary *allData=dic[@"data"];
    NSArray *array=allData[@"food_spu_tags"];
    //遍历数组
    for (NSDictionary *dic in array) {
        NSLog(@"%@",dic[@"name"]);
    }
                          
    
}

@end
