//
//  ViewController.m
//  post模拟登陆
//
//  Created by codygao on 16/8/27.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *userNameFiled;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)clickButton:(id)sender {
    NSString *usernamestr = self.userNameFiled.text;
    NSString *passworldstr = self.passwordField.text;
    NSString *urlstr =@"http://localhost/php/login/login.php";
    NSURL *url = [NSURL URLWithString:urlstr];
     //htt协议加载数据,要想发送POST请求，必须有request 对象；
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    //点击登陆按钮的时候，需要将用户名和密码，以httpbody 的形式 发送给服务器，服务器，去进行匹配，密码登录名正确，就允许登陆,httpboby 是以二进制数方式存在
    NSString *httpbodystr = [NSString stringWithFormat:@"username=%@&passworld=%@",usernamestr,passworldstr];
    NSLog(@"httpbodystr = %@",httpbodystr);
    //将字符串转换为二进制编码，后面是NSString 的方法，返回值是二进制编码
    NSData *bodydata = [httpbodystr dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = bodydata;
    NSLog(@"bodydata = %@",bodydata);
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil){
            NSLog(@"respond class = %@ \n resond = %@\n data = %@ ",[response class],response ,data);
            //将data数据转换为字符串；
//            NSString *str = [[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"%@",str);
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
          
            //判断是否登陆成功
            if([result[@"userId"] integerValue] == 1){
                NSLog(@"登陆成功%@",result);
            }else{
                NSLog(@"登陆失败%ld",[result[@"userId"] integerValue]);
            }
        }else {
            NSLog(@"%@",error);
        }
    }] resume];
}
@end
