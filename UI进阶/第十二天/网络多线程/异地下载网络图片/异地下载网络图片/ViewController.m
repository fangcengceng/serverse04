//
//  ViewController.m
//  异地下载网络图片
//
//  Created by codygao on 16/8/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,weak)UIImageView *imgV;
@end

@implementation ViewController

-(void)loadView{
   
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.scrollView.backgroundColor = [UIColor redColor];
    self.view = self.scrollView;
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIImageView *imageV = [[UIImageView alloc ] init];
    [self.view addSubview:imageV];
    _imgV = imageV;
    //创建多线程
    [self performSelectorInBackground:@selector(loadPicture) withObject:nil];
    
}
-(void)loadPicture{
    //加载网络图片
    NSLog(@"%@",[NSThread currentThread]);
    NSURL *url = [NSURL URLWithString:@"http://scimg.jb51.net/allimg/160716/105-160G61F250436.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage * imag = [UIImage imageWithData:data];
    [self performSelectorOnMainThread:@selector(mainUI:) withObject:imag waitUntilDone:NO];
    
}
-(void)mainUI:(UIImage *)param{
    NSLog(@"%@",[NSThread currentThread]);
    self.imgV.image = param;
    [self.imgV sizeToFit];
    self.scrollView.contentSize =param.size;
}

@end
