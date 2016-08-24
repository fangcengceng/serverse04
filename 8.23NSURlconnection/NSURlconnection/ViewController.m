//
//  ViewController.m
//  NSURlconnection
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     //1、获取URL
    NSURL * url  = [NSURL URLWithString:@"https://www.baidu.com"];
    //2、获取请求
#pragma   NSURLRequest 方案一：默认时长是60s
    NSURLRequest *request  = [NSURLRequest requestWithURL:url];
#pragma NSURLRequest 方案二，设置缓存时长和缓存策略
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url cachePolicy:    NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
#pragma NSURLRequest 方案三
    NSMutableURLRequest *request2  = [NSMutableURLRequest requestWithURL:url];
    [request2 addValue:@"iphone AppleWebKit" forHTTPHeaderField:@"User-Agent"];
#pragma NSURLRequest 方案四
    NSMutableURLRequest *request3 = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    
#pragma mark异步发送请求事件,关键字是send

    //3.异步发送请求事件,关键字是send
  [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
      //4、处理响应
      //开发中，一定要处理错误信息
      if(connectionError == nil && data!=nil){
          NSLog(@"%@%@",response,data);
          //服务器返回的是二进制码，需要转化为nsstring,因为刷新的时候，self.webview 需要string
          NSString * str  =[[NSString  alloc ] initWithData:data encoding:    NSUTF8StringEncoding];
          [self.webView loadHTMLString:str baseURL:url];
          
          
      }else{
          NSLog(@"%@",connectionError);
      }
     
      
      
  }];
}

@end
