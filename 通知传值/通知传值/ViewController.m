//
//  ViewController.m
//  通知传值
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//
//需求是从网络下载一张图片，刷新ui界面
#import "ViewController.h"
#import "downloadOperation.h"

@interface ViewController ()
@property(nonatomic,weak)UIImageView *imgv;
@property(nonatomic,weak)UILabel *messageLabel;

@end

@implementation ViewController{
   
    NSOperationQueue *_queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setupUI];
    NSString *strName = @"http://img2.3lian.com/2014/c7/12/d/77.jpg";
    
    _queue = [[NSOperationQueue alloc] init];
    downloadOperation *op = [[downloadOperation alloc] init];
    op.urlName = strName;
    [_queue addOperation:op];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shuaxin:) name:@"download" object:nil];
}
-(void)shuaxin:(NSNotification*)centervalue{
    
    self.messageLabel.text = centervalue.userInfo[@"str"];
    self.imgv.image = [centervalue.userInfo valueForKey:@"imag"];
    
    
}
-(void)setupUI{
    UIImageView *imagv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 400)];
    imagv.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imagv];
    _imgv = imagv;
    UILabel *messageLabel  = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, 375, 267)];
    [self.view addSubview:messageLabel];
    self.messageLabel = messageLabel;
    
    
    
}
@end
