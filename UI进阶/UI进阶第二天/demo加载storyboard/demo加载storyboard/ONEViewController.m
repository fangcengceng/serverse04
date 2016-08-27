//
//  ONEViewController.m
//  demo加载storyboard
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ONEViewController.h"

@interface ONEViewController ()

@end

@implementation ONEViewController

//会打印tablebar是因为继承了父类的viewdidload方法
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //让背景穿透
    //[self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    //取消半透明状态,跟背景穿透不一样
    self.navigationController.navigationBar.translucent=NO;
    
    //取消下面的分割线。
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
}


@end
