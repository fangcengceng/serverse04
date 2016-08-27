//
//  ViewController.m
//  作业柱状图
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDemoView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HMDemoView *demodata;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    float a1= arc4random_uniform(10)/10.0+0.1;
    float a2=(arc4random_uniform(20)+0.9)*0.1;
    float a3=arc4random_uniform(5)/5.0+0.1;
     float a4=arc4random_uniform(6)/6.0+0.1;
     float a5=arc4random_uniform(30)/30.0+0.1;
    
    NSArray *array=@[@(a1),@(a2),@(a3),@(a4),@(a5)];
    
    _demodata.arrayM=array;
}



@end
