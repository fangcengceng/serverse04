//
//  HMDemoViewController.m
//  modal 的纯 手写代码
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoViewController.h"

@interface HMDemoViewController ()

@end

@implementation HMDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];


}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

// In a storyboard-based ap
@end
