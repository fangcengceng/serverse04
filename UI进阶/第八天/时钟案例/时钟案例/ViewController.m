//
//  ViewController.m
//  时钟案例
//
//  Created by codygao on 16/8/2.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMClockView.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIImageView *_imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
   
    HMClockView *cv=[[HMClockView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    cv.center=self.view.center;
    [self.view addSubview:cv];
    
    
    
    
}

-(void)setupUI{
    
}



@end
