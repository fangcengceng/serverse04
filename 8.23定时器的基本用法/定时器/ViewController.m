//
//  ViewController.m
//  定时器
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,weak)NSTimer *timer;


@end

@implementation ViewController
//停止计时器；
- (IBAction)stopTimer:(id)sender {
    [_timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self performSelectorInBackground:@selector(timerdemo1) withObject:nil];
    //类方法创建定时器，不需要添加到运行循环中。。。。对象方法创建，需要添加到运行循环中
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerdemo2) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    _timer = timer;
    
}
//在主线程开启定时器
-(void)timerdemo2{
    NSLog(@"ccc");
}
-(void)timerdemo1{
    //定时器在主线程是默认是开启的；
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerrun) userInfo:nil repeats:YES];
   [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
      //在子线程执行定时器，定时器默认是不开启的，需要开启；
    [[NSRunLoop currentRunLoop] run];
    
}
-(void)timerrun{
   NSLog(@"%@",[NSThread currentThread]);
}
@end
