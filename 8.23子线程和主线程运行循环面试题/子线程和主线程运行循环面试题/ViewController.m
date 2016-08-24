//
//  ViewController.m
//  子线程和主线程运行循环面试题
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSTimer *timer ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _timer  = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(fiermodel) userInfo:nil repeats:YES];
    [_timer fire];
}
-(void)fiermodel{
    [NSThread detachNewThreadSelector:@selector(threaddemo) toTarget:self withObject:nil];
  
}
-(void)threaddemo{
      NSLog(@"%@",[NSThread currentThread]);
}

@end
