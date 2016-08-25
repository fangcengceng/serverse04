//
//  ViewController.m
//  8.23利用通知下载图片
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,weak)UIImageView *imagV;

@end

@implementation ViewController{
    NSOperationQueue *_queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imagV = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imagV];
    _imagV  = imagV;
    _queue = [[NSOperationQueue alloc] init];
    
   NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSString *str = @"http://www.5068.com/u/faceimg/20140804114111.jpg";
        NSURL *url = [NSURL URLWithString:str];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *imag = [UIImage imageWithData:data];
       
       NSDictionary *userinfo = @{@"imagkey":imag};
       
        NSLog(@"%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shuaxinuijiemian" object:nil userInfo:userinfo];
   }];
    [_queue addOperation:op];


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (quzuoshiqing:)name:@"shuaxinuijiemian" object:nil];
    
 
    
}
-(void)quzuoshiqing:(NSNotification*)info{
     UIImage *imaa = [info.userInfo valueForKey:@"imagkey"];
    //取字典的value值的两种方法；
    UIImage *immma = info.userInfo[@"imagkey"];
    _imagV.image = immma;
}
@end
