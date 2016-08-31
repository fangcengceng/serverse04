//
//  ViewController.m
//  NSURLSession实现单文件下载
//
//  Created by codygao on 16/8/31.
//  Copyright © 2016年 HM. All rights reserved.
//
/*
  需求，使用NSURLSession 下载文件(下载任务默认是在子线程进行）
    问题一：直接使用download下载也可以，但是内存暴涨，而且下载下来的文件保存在tep内存中
     办法：将文件保存在本地沙盒中(依然会在内存中中保存一下，内存依旧暴涨)，使用代理（同NSURLConnection一样）解决内存暴涨；
 
 
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
#pragma 监听按钮的点击下载事件

- (IBAction)downloadclick:(id)sender {
    NSURL *URL = [NSURL URLWithString:@"http://localhost/sogou.zip"];
  NSURLSessionDownloadTask *downloadTask = [[NSURLSession sharedSession] downloadTaskWithURL:URL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      if (error == nil && response != nil){
          //保存在沙盒中
          [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:[ NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingString: @"/sogou.zip"] error:NULL];
          
      }else{
          NSLog(@"失败");
      }
      
      
  }];
    [downloadTask resume];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end
