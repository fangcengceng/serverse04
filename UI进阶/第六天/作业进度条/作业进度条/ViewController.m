//
//  ViewController.m
//  作业进度条
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDemoView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *process;


@property (weak, nonatomic) IBOutlet HMDemoView *demo;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)slider:(UISlider *)sender {
    
    _process.progress=sender.value;
    _demo.percent=sender.value;
}





@end
