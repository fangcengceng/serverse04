//
//  ViewController.m
//  饼状图
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDemoView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HMDemoView *dem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array=@[@0.3,@0.2,@0.5];
   _dem.arr=array;
}

@end
