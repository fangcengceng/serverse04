//
//  SecondViewController.m
//  自定义modal练习
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = CGPointMake(100, 100);
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];


}
-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
