//
//  ViewController.m
//  nsurlsession
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//


#import "ViewController.h"
@interface jasonModel :NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
+(instancetype) jasonWithdic:(NSDictionary*)dic;
@end
@implementation jasonModel
+(instancetype) jasonWithdic:(NSDictionary*)dic{
    jasonModel *model = [[jasonModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

-(void)setValue:(id)value forKey:(NSString *)key{
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end

@interface ViewController ()

@end
@implementation ViewController{
    NSArray *_arraylist ;
}
//网络开发中，发送http网络请求的第二种方案
- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://localhost/demo.json"];
    //创建NSURlsession类
    NSURLSession *session = [NSURLSession sharedSession];
    //发送网络请求
   NSURLSessionDataTask *dataTask =[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       //处理响应
       if(error == nil &&data != nil){
           NSLog(@"%@%@",[response class],data);
           NSMutableArray *array = [NSMutableArray array];
           NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
           
           //字典转模型；
           jasonModel *model = [jasonModel jasonWithdic:dic];
           [array addObject:model];
           _arraylist  = array.copy;
  
       }else{
           NSLog(@"%@",error);
       }
       
   }];
    
    [dataTask resume];
}

@end
