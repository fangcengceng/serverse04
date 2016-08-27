//
//  ViewController.m
//  modal 的纯 手写代码
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDemoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
     [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   
    HMDemoViewController *demo=[[HMDemoViewController alloc] init];
    [self presentViewController:demo animated:YES completion:nil];
    
    
}

@end
