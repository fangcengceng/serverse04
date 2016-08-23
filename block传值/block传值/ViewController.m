//
//  ViewController.m
//  block传值
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "DownLoadOP.h"

@interface ViewController ()<DownLoadOPDelegate>

@end

@implementation ViewController{
    NSOperationQueue *_queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    _queue = [[NSOperationQueue alloc] init];
    DownLoadOP *op = [[DownLoadOP alloc] init];
    NSString *str = @"hellworld";
    op.name = str;
    //这一步相当于代理方法中的代理方法的实现;
    op.myblock = ^(NSString *buzhidao ){
        NSLog(@"%@",buzhidao);
    };
    
    op.delegate = self;
    
    [_queue addOperation:op];
}
-(void)downloadDidFinishdownload:(NSString *)str{
    
    NSLog(@"%@",str);
    
    
}
@end
