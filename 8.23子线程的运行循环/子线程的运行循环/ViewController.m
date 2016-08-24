//
//  ViewController.m
//  子线程的运行循环
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建子线程，在子线成功中开启定时器，模拟运行循环
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"start");
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runtimer) userInfo:nil repeats:YES];
        //子线程的消息循环默认不开启，如果开启的话需要调用run方法，一旦开启，就是死循环 ，开启以后的代码将不再执行
        //注销这句话，只是执行两句打印star和结束；
        [[NSRunLoop currentRunLoop] run];
        
        //这句代码开启子线程循环执行时间，时间过后，子线程将不再开启运行循环，以后的代码依然可以实现
        //[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
        //由于死循环将不再执行这句代码
        NSLog(@"结束");
    });

}

-(void)runtimer{
    NSLog(@"%@",[NSRunLoop currentRunLoop].currentMode);
  
}
@end
