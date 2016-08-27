//
//  ViewController.m
//  NSTread创建线程的三种方式
//
//  Created by codygao on 16/8/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self demo1];
    //[self demo2];
     // [self demo3];
    //[self demo];
}

#pragma mark 创建线程的第一种方式,对象创建
-(void)demo1{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(test1:) object:@"anothe controller"];
   
    NSLog(@"%@",[NSThread currentThread]);

    thread.name = @"sdjfs";
    [thread start];
    
}
-(void)test1:(NSString*) pragma{
    
       NSLog(@"%@%@",pragma,[NSThread currentThread]);
    
}
#pragma mark 创建线程的第二种方式，直接创建
-(void)demo2{
    [self performSelectorInBackground:@selector(test2:) withObject:@"想传什么传什么"];
    NSLog(@"%@",[NSThread currentThread]);
    
}
-(void)test2:(NSString * )str{
    NSLog(@"%@,%@",str,[NSThread currentThread]);

}
#pragma mark 创建线程的第三种方式，类方法创建
-(void)demo3{
    [NSThread detachNewThreadSelector:@selector(test3:) toTarget:self withObject:@"dlkf"];
   
}
-(void)test3:(NSString *)str{
    //会不断的创建新线程
    NSLog(@"%@%@",str,[NSThread currentThread]);
    
}
#pragma mark self 和 target 的关系
-(void)demo{
    AViewController * a = [[AViewController alloc] init];
    NSThread  *tread =[[NSThread alloc] initWithTarget:a selector:@selector(try:) object:@"tryanythingyouwant"];
     tread.name = @"ajkdf;lsd";
    [tread start];
    
}





@end
