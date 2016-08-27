//
//  MTFoodViewController.m
//  FCCMTApp
//
//  Created by codygao on 16/8/5.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTFoodViewController.h"

@interface MTFoodViewController ()

@end

@implementation MTFoodViewController



- (void)setupUI{
    self.view.backgroundColor=[UIColor blueColor];
    UITableView *leftView=[[UITableView alloc] init];
    [self.view addSubview:leftView];
    [leftView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-46);
        make.width.mas_equalTo(86);
    }];
    
    UITableView *rightView=[[UITableView alloc]  init];
    [self.view addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.view);
        make.left.equalTo(leftView.mas_right);
        make.bottom.equalTo(leftView);
        
    }];

    UIView *redView=[[UIView alloc] init];
   redView.backgroundColor=[UIColor redColor];
    [self.view addSubview: redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftView);
        make.right.equalTo(rightView);
        make.bottom.equalTo(self.view);
        make.top.equalTo(leftView.mas_bottom);
        
        
    }];
    

}

@end
