//
//  ViewController.m
//  GCD常用代码
//
//  Created by codygao on 16/8/17.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UIScrollView *scroll;
@property(nonatomic,weak)UIImageView *imageView;

@end

@implementation ViewController
-(void)loadView{
   self.scroll = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scroll.backgroundColor = [UIColor redColor];
    self.view = self.scroll;
   
    UIImageView * imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo1];
}

-(void)demo1{
   // 创建队列，创建任务，将任务添加到队列中去
    dispatch_queue_t queue =   dispatch_get_global_queue(0, 0);
    dispatch_block_t task =^{
        NSURL *url = [NSURL URLWithString:@"http://www.5068.com/u/faceimg/20140804114111.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage * imag = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(),^{
           //添加图片一定要放在最前面，否则加载不出来；
            _imageView.image = imag;

            [_imageView sizeToFit];
               _scroll.contentSize = imag.size;
            
    
        });
        
    };
    dispatch_async(queue, task);

    
}
@end
