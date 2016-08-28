//
//  ViewController.m
//  post请求登陆
//
//  Created by codygao on 16/8/28.
//  Copyright © 2016年 HM. All rights reserved.
//
//需求是使用post请求给后台发送用户名和密码，匹配登陆
//MARK: 开发需求，与后台互动

//开发需要用到后台提供的数据有url,//http://localhost/php/login/login.php
//httpbody中需要的 username跟password是后台给的字段，
//判断密码账号是否正确的方式是根据httpbody中的data数据跟后台的给的关键字的userId指向的结果1进行匹配
// 后台提供的userId 跟 成功与否的value值 1



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
    //网络开发方案之NSURLSession
    //post请求本质是将敏感信息以请求体的方式发送，请求体要求是二进制；这样，网络记录不记录请求体中的内容，是安全的
    //get请求的本质是将信息（包括敏感信息）以传递URL的方式发送，不能有中文、空格； 网路记录会记录下来URL的内容，是不安全的
    NSURL *URL = [NSURL URLWithString:@"http://localhost/php/login/login.php"];
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [self getHttpData] ;
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil & data !=nil){
            //根据传递进来的data 数据，跟后台数据库进行匹配；
            //匹配方式是将二进制数据
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            if([dic[@"userId"] integerValue ] == 1){
            NSLog(@"登陆成功");
            }else{
                NSLog(@"请重试");
            }
        }else{
            NSLog(@"%@",error);
        }
    }] resume];
}
-(NSData *)getHttpData{
#pragma 请求体的创建，要求最终格式是二进制数
    //MARK:pragma 请求体的创建，要求最终格式是二进制数
    NSString *userstr = self.usertextField.text;
    NSString *passstr = self.passworlField.text;
    //MARK: 拼接请求体内容, username跟password是后台给的字段
    NSString *httpbodystr = [NSString stringWithFormat:@"username=%@&password=%@",userstr,passstr];
    NSData *HTTPdata = [httpbodystr dataUsingEncoding:NSUTF8StringEncoding];
    
    return HTTPdata;
}
@end
