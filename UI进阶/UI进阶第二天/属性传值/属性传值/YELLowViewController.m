//
//  YELLowViewController.m
//  属性传值

/**
 思路：界面搭建。
      监听按钮的点击事件
     属性传值，要想传值，必须在目标控制器中声明一个公有属性，让其他类进行访问，用来接收传递进来的值。
     监听事件时给目标对象属性赋值。
 
 */
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "YELLowViewController.h"

@interface YELLowViewController ()
@property(nonatomic,weak)UILabel *label;

@end

@implementation YELLowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    [self setupUI];

}
-(void)setupUI{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 300,40)];
    label.backgroundColor=[UIColor whiteColor];
    label.textAlignment=NSTextAlignmentCenter;//枚举。(0,1,2)
    [self.view addSubview:label];
    self.label = label;
    self.label.text=self.context;
    
}

@end
