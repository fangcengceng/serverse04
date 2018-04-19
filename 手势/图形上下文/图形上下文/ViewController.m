//
//  ViewController.m
//  图形上下文
//
//  Created by codygao on 16/8/3.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    HMDrawView *drawView=[[HMDrawView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:drawView];
}
@end
