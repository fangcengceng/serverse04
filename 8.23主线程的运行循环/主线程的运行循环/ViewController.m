//
//  ViewController.m
//  主线程的运行循环
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
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self demo1];
}
-(void)demo1{
    NSLog(@"begin");
    //创建一个定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(firedemo) userInfo:nil repeats:YES];
    //主线程的运行循环默认是开着的，可以监测到每一个事件；
    //子线程的运行循环默认是关着的，一旦开启将是一个死循环，后面的代码将无法事项
    //NSRunLoopCommonModes 是定时器的model.默认是default ，有kcfrunlupdefaltmode 和UITrackingRunLoopMode针对滚动的时候定时器；
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    NSLog(@"end");
    
    
}
-(void)firedemo{
    NSLog(@"%@----%@",[NSThread currentThread],[NSRunLoop currentRunLoop].currentMode);
}
@end
