//
//  ViewController.m
//  zuoyeprocess
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDemoView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *process;
@property (weak, nonatomic) IBOutlet HMDemoView *demoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)valuechage:(UISlider *)sender {
    _process.progress=sender.value;
    _demoView.percent=sender.value;
}

@end
