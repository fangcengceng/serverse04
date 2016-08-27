//
//  ViewController.m
//  关于nav
//
//  Created by codygao on 16/8/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Blur.h"
#import "UIImage+Additions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self demo1];
    
   // [self demo2];
    [self demo3];
}

#pragma mark 利用imageview 的分类
-(void)demo3{
    
    UIImageView *v1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"20000780_contactA"]];
    //v1.center =self.view.center;
    [self.view addSubview:v1];
    UIImageView  *v2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4982229_103856887335_2"]];
    
    v2.frame = CGRectMake(100, 200, 200, 200);
    [self.view addSubview:v2];

    v1.image = [UIImage imageWithColor:[UIColor redColor]];
    // v1.image = [[UIImage alloc] tintImageWithColor:[UIColor redColor]];
    
    v2.image = [[UIImage imageNamed:@"4982229_103856887335_2"] blur];
}


#pragma mark navigationitemd的titleview属性
-(void)demo2{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    lab.text = @"这是一个很长很长的标题";
    lab.textColor = [UIColor redColor];
    [lab sizeToFit];
    self.navigationItem.titleView = lab;
    
    
}

-(void)demo1{
    self.navigationItem.title = @"title";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStyleDone target:self action:nil];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName :[UIColor redColor]}];
    //
    //    [self.navigationController.navigationBar setBackgroundColor:[UIColor yellowColor]];
    //    UIView * redv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    redv.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:redv];
    //   //取消半透明效果之后，self.view的大小就减去64的部分
    //
    //   self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self. navigationController.navigationBar setBarTintColor:[UIColor yellowColor]];
    
}
@end
