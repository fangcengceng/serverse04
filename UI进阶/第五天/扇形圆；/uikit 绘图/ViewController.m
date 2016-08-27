//
//  ViewController.m
//  uikit 绘图
//
//  Created by codygao on 16/7/29.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "DemoView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *process;

@property (weak, nonatomic) IBOutlet DemoView *demoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景选择平铺一张很小的图片平铺，节省内存空间
    //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"yun"]];
}

- (IBAction)valuechage:(UISlider *)sender {
    _process.progress=sender.value;
   
    _demoView.angelF=sender.value;
    
}

@end
