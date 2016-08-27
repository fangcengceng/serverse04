//
//  ViewController.m
//  GCD常用的代码
//
//  Created by codygao on 16/8/17.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self GCDdemo1];
}
-(void)GCDdemo1{
    //核心：将任务添加到队列中
    //1、创建队列
    dispatch_queue_t queue =dispatch_get_global_queue(0, 0);
    //创建任务：用block指定的，无参无返回值
    dispatch_block_t  block = ^{
        NSLog(@"%@",[NSThread currentThread]);
    };
    dispatch_async(queue,block);
}

@end
