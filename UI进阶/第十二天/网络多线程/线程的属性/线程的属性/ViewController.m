//
//  ViewController.m
//  线程的属性
//
//  Created by codygao on 16/8/16.
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
    NSLog(@"主线程==%tu",[NSThread currentThread].stackSize/1024);
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    t1.threadPriority = 1;
    t1.name = @"线程1";
    [t1 start];
    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    t2.name =@"线程2";
    t2.threadPriority=0.3;
    [t2 start];

}
-(void)demo{
    for (NSInteger i = 0; i<20;i++){
       // NSLog(@"此线程==%tu",[NSThread currentThread].stackSize/1024);
        NSLog(@"%@",[NSThread currentThread]);
    }
    
    
    
    
    
}
@end
