//
//  ViewController.m
//  post请求登陆
//
//  Created by codygao on 16/8/28.
//  Copyright © 2016年 HM. All rights reserved.
//
//需求是使用post请求给后台发送用户名和密码，匹配登陆
//开发需要用到后台提供的数据有url,//http://localhost/php/login/login.php
//httpbody中需要的拼接字符串关键字，此处为username和passworld


#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usertextField;
@property (weak, nonatomic) IBOutlet UITextField *passworlField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)clicklogin:(UIButton *)sender {
//    NSString *userstr = self.usertextField.text;
//    NSString *passstr = self.passworlField.text;
    NSURL *URL = [NSURL URLWithString:@"http://localhost/php/login/login.php"];
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:URL];
    //网络开发方案之NSURLSession
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil & data !=nil){
            NSLog(@"respond =%@ request = %@ request class = %@",response, request ,[request class]);
            NSLog(@"登陆失败");
        }else{
            NSLog(@"登陆成功");
        }
    }] resume];
}
@end
