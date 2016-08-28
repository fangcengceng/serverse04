//
//  ViewController.m
//  post请求登陆
//
//  Created by codygao on 16/8/28.
//  Copyright © 2016年 HM. All rights reserved.
//
//需求是使用post请求给后台发送用户名和密码，匹配登陆
//MARK1: 开发需求，与后台互动
//开发需要用到后台提供的数据有url,//http://localhost/php/login/login.php
//httpbody中需要的 username跟password是后台给的字段，
//判断密码账号是否正确的方式是根据httpbody中的data数据跟后台的给的关键字的userId指向的结果1进行匹配
// 后台提供的userId 跟 成功与否的value值 1

//MARK2 将密码存储到系统偏好设置中
//MARK3 将密码加密处理
#define KUSERNAME @"username"
#define KPASSWORD @"passworld"

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usertextField;
@property (weak, nonatomic) IBOutlet UITextField *passworlField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //,如果将信息存储到系统偏好设置中，判断系统偏好设置中是否存有账号和姓名，如果有的话，直接加载
    // 界面展示时,自动填充账号和密码
    [self readinfos];
    
    /*
     如果要实现自动登录
     1.首先先判断输入框里面有没有值
     2.如果有值,就直接调用登录的方法
     3.如果没有值,直接手动的输入账号和密码
     */
    [self readinfos];
}
#pragma 点击事件
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
            //匹配方式是将二进制数据后台字典中的key”userId"的值进行判断；
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
#pragma 将隐私信息密码存储到系统偏好中；
-(void)saveinfo:(NSString *)info{
    [[NSUserDefaults standardUserDefaults] setObject:self.usertextField.text forKey:KUSERNAME];
    [[NSUserDefaults standardUserDefaults] setObject:self.passworlField.text forKey:KPASSWORD];//key值是自己任意起的，为了方便最好用宏
    
}
#pragma 从系统偏好中将密码读取出来
-(void)readinfos{
    self.usertextField.text =[[NSUserDefaults standardUserDefaults] objectForKey:KUSERNAME];
    self.passworlField.text = [[NSUserDefaults standardUserDefaults] objectForKey:KPASSWORD];
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
