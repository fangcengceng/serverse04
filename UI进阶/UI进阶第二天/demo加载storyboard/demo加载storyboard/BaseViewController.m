//
//  BaseViewController.m
//  demo加载storyboard
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidLoad];
    
    NSLog(@"%@%s",self.navigationController.navigationBar,self.class);
   
    
    
}


@end
