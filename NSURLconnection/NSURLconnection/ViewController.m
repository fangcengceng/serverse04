//
//  ViewController.m
//  NSURLconnection
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取URL
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    
 [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
     if(connectionError == nil &&data != nil){
         NSLog(@"%@",data);
         
         NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
         [self.webView  loadHTMLString:str baseURL:url];
     }
     
     
 }];

}
-(void)doSomething{
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
    
}

@end
