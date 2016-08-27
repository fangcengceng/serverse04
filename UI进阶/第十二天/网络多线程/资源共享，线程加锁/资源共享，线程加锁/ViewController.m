//
//  ViewController.m
//  资源共享，线程加锁
//
//  Created by codygao on 16/8/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,assign) NSInteger count;
@property(nonatomic,strong)NSObject *obj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count =20;
    self.obj = [[NSObject alloc] init];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(tickit) object:nil];
    t1.name =@"线程一";
    [t1 start];
    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(tickit) object:nil];
    t2.name =@"线程二";
    [t2 start];
}
-(void)tickit{
    
    while (YES) {
          @synchronized (self.obj) {
        
            if(self.count>0){
                
                self.count--;
                NSLog(@"%zd%@",self.count,[NSThread currentThread]);
            }else{
                NSLog(@"票卖完了");
                break;
            
        }
    }
    }
    
    
    
}
@end
