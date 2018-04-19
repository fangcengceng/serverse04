//
//  ViewController.m
//  NSURLSession2
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取url路径
    NSURL *url = [NSURL URLWithString:@"http://localhost/demo.json"];
    NSURLRequest *request  = [NSURLRequest requestWithURL:url];
    [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //现在已经获取响应体的二进制数据 ,需要反序列化
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        //实际开发中必须要处理错误信息
        if(error == nil && data != nil){
            NSLog(@"%@,%@",data, response);// 响应体就是服务器返回的需要的二进制数，响应头
            //接下来需要做的就是将json 数据 中的 有用数据取出来，字典转模型 ；
            
        }else{
            NSLog(@"%@", error);
        }
    }];
    
}

@end
