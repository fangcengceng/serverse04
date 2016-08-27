//
//  ViewController.m
//  THReadLifeDurition
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
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self demo];
}
-(void)demo{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(test1) object:nil];
   
    [thread start];
    
    [NSThread sleepForTimeInterval:8];
    [thread cancel];
   // NSLog(@"%@",[NSThread currentThread]);
    
    
}

-(void)test1{
    for(NSInteger i =0;i<10;i++){
           NSLog(@"%zd%@",i,[NSThread currentThread]);
        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        if(i==4){
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"我睡了");
        }
        if([NSThread currentThread].isCancelled){
            NSLog(@"线程被取消了");
            //return;
        }
        if(i==5){
            [NSThread exit];
        
        }
    }
  
}
@end
