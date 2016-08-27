//
//  ViewController.m
//  时钟2
//
//  Created by codygao on 16/8/2.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMClockView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];



}

-(void)setupUI{
    HMClockView *clock=[[HMClockView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    clock.center=self.view.center;
    [self.view addSubview:clock];
    
    
}
@end
