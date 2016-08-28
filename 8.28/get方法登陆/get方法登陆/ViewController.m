//
//  ViewController.m
//  get方法登陆
//
//  Created by codygao on 16/8/27.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)button:(id)sender {
    NSString *username = self.usernameLabel.text;
    NSString *passworldLabel = self.passwordLabel.text;
    //后台提供的接口；
    NSString *str = @"http://localhost/php/login/login.php";
    //拼接字符串
    NSString *urlName = [str stringByAppendingFormat:@"?username=%@passworld=%@",username,passworldLabel];
    //字符串转化为URL；,需要进行转码。因为如果里面有中文URL返回是空
//    2016-08-27 14:41:19.042 get方法登陆[2336:132352] request = <NSURLRequest: 0x7fcf11f31660> { URL: (null) }
//    2016-08-27 14:41:19.203 get方法登陆[2336:132882] data = (null)
//    httpbody = (null)
    //URL中？后面的查询字符不能有中文或者空格，要进行%转移；
//方法在Nnsstring的分类中，记住percent 
    urlName = [urlName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlName];
    //创建网络请求者
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"request = %@",request);
  [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      NSLog(@"data = %@\n  httpbody = %@",data,request.HTTPBody);
      if(error == nil & data !=nil){
          NSLog(@"登陆成功");
      }else {
          NSLog(@"登陆失败");
      }
  }] resume];
    
}

@end
