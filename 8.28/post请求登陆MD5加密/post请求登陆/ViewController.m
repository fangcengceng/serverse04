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
#import "NSString+Hash.h"
#import "SSKeychain.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usertextField;
@property (weak, nonatomic) IBOutlet UITextField *passworlField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //,如果将信息存储到系统偏好设置中，判断系统偏好设置中是否存有账号和姓名，如果有的话，直接加载
    // 界面展示时,自动填充账号和密码,如果仅仅想张氏登陆名，那么在读取数据的时不要给self.passworlField.text赋值就可以了
        [self readinfos];
    
    /*
     如果要实现自动登录
     1.首先先判断输入框里面有没有值
     2.如果有值,就直接调用登录的方法
     3.如果没有值,直接手动的输入账号和密码
     */
    [self readinfos];
    /*
     加密
     1.密码在网络中传输时,需要加密 (MD5...)
     2.隐私信息(密码...)保存到本地需要加密 (钥匙串)
     可以用MD5加密码?(绝对不可以,无法解密,没法取)
     解密
     1.读取本地隐私信息时,解密 (钥匙串)
     */
    
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
            //MARK:在登陆成功后应该保存账户以及密码
                NSLog(@"登陆成功");
                [self saveinfo];
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
    //MARK: 拼接请求体内容, username跟password是后台给的字段
    //MARK:pragma 请求体的创建，要求最终格式是二进制数
    //    //方案一：md5直接加密,加密后是字符串
    //    passworld = [passworld md5String];
    //方案二加盐；加盐
    //    NSString *salt = @"sls%*&AS1";
    //    passworld = [passworld stringByAppendingString:salt];
    //    passworld = [passworld md5String];
    //    NSLog(@"%@",passworld);
    //方案三 加两次盐,加两次盐之后
#pragma 到时候选择哪种算法，后台沟通，因为加密后的结果要与后台的passworld中的值对应才能登陆成功，否则一直是登陆失败
    NSString *username = [NSString stringWithFormat:@"%@",self.usertextField.text];
    
    NSString *passworld = [NSString stringWithFormat:@"%@",self.passworlField.text];
    NSString *salt = @"sls%*&AS1";
    passworld = [passworld hmacMD5StringWithKey:salt];
    NSString *httpbodystr = [NSString stringWithFormat:@"username=%@&password=%@",username,passworld];
    NSData *HTTPdata =[httpbodystr dataUsingEncoding:NSUTF8StringEncoding];
    return HTTPdata;
}

#pragma 将隐私信息密码存储到系统偏好中；
-(void)saveinfo{
    [[NSUserDefaults standardUserDefaults] setObject:self.usertextField.text forKey:KUSERNAME];
    // 钥匙串
    /*
     参数1 : 要保存的密码
     参数2 : 为哪个APP保存密码,bundleIdentifier表示唯一的APP
     参数3 : 为哪个APP保存密码的哪个账号保存密码
     */
    [SSKeychain setPassword:self.passworlField.text forService:[NSBundle mainBundle].bundleIdentifier account:self.usertextField.text];
//    [[NSUserDefaults standardUserDefaults] setObject:[self encodeMD5] forKey:KPASSWORD];//key值是自己任意起的，为了方便最好用宏
    NSLog(@"%@",self.passworlField.text);
    
}
#pragma 从系统偏好中将密码读取出来
-(void)readinfos{
    self.usertextField.text =[[NSUserDefaults standardUserDefaults] objectForKey:KUSERNAME];
//    self.passworlField.text = [[NSUserDefaults standardUserDefaults] objectForKey:KPASSWORD];
   self.passworlField.text = [SSKeychain passwordForService:[NSBundle mainBundle].bundleIdentifier account:self.usertextField.text];
   
}

@end
