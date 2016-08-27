//
//  TWOViewController.m
//  demo加载storyboard
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "TWOViewController.h"

@interface TWOViewController ()

@end

@implementation TWOViewController


-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
    
}
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
}
-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"%@",self.class);
}
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
    
}
@end
