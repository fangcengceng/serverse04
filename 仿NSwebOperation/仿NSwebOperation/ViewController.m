//
//  ViewController.m
//  仿NSwebOperation
//
//  Created by codygao on 16/8/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "DownLoadOpertion.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;


@end

@implementation ViewController{
    NSOperationQueue *_queue;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _queue = [[NSOperationQueue alloc] init];
//
//    //利用NSblockOperation从网络下载图片
   // [self demo1];
//    //直接定义NSOpertaiton 从网络下载图片
   //[self demo2];
//     //自定义NSOpertion从网络下载图片,利用属性和block；
      [self demo3];
    
    
  //利用自定义NSOpertaitonBlock ,仿造NSWEbimage第三方矿建；
    
    
    //需求是用jason 图片填充UIImageView;
    //下载图片需要在子线程进行，将Jason转换成一定的格式利用的是aff网络第三方框架；
    //填充图片需要在主线程进行；
//    NSString *str = @"https://raw.githubusercontent.com/fangcengceng/serverse04/master/apps.json";
    
//    NSURL *url = [NSURL URLWithString:str];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage * image = [UIImage imageWithData:data];
}
#pragma 从网络中下载一张图片，填充到子空间
//分析，下载图片是耗时操作，需要放到子线程中去，填充到子控件需要在主线程上刷续UI；
//下载图片在子线程进行，已经学习过的有三种方法，nstheard ,GCD,NSBlockOperation;
//本次利用nsblockoperatin来进行,核心是将操作添加到队列中去

-(void)demo1{
    //创建操作
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        //子线程下载图片
        NSString *str = @"http://img2.3lian.com/2014/c7/12/d/77.jpg";
        NSURL *url = [NSURL URLWithString:str];
        NSData *data =[NSData dataWithContentsOfURL:url];
        UIImage *imag = [UIImage imageWithData:data];
        //回到主队列刷新UI；
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           _imageVIew.image = imag;
        }];
    }];
    //将操作添加到队列中去;
      [_queue addOperation:op];
}
//直接定义NSOpertion下载图片
-(void)demo2{
  
    NSString *str = @"http://img2.3lian.com/2014/c7/12/d/77.jpg";

    //创建操作
    NSOperation *op =[[NSOperation alloc] init];
    
    //在子线程下载图片
    [op setCompletionBlock:^{
        NSURL *url = [NSURL URLWithString:str];
        NSData *data =[NSData dataWithContentsOfURL:url];
        UIImage *imag = [UIImage imageWithData:data];
        //回到主线程刷新界面
        NSLog(@"%@",[NSThread currentThread]);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            _imageVIew.image = imag;
        }];

    }];
    //将操作添加到队列中去；
    [_queue addOperation:op];
}
  //步骤，创建操作，创建全局队列，在子线程下载图片，回到主线程刷新界面，将操作添加到队列中；
-(void)demo3{
    DownLoadOpertion *op = [[DownLoadOpertion alloc] init];
     NSString *str = @"http://img2.3lian.com/2014/c7/12/d/77.jpg";
    op.urlName = str;
    op.myblock = ^(UIImage * img){
        self.imageVIew.image= img;
    };
   [_queue addOperation:op];
    
}
@end
