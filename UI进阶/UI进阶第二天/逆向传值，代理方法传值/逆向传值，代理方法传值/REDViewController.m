//
//  REDViewController.m
//  逆向传值，代理方法传值
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "REDViewController.h"
#import "GREenViewController.h"


@interface REDViewController ()<GREenViewControllerdelegate>

@property(nonatomic,weak)UILabel *label;
@property(nonatomic,weak)UIButton *button;

@end

@implementation REDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    
    [self setupUI];
    
     
}
-(void)setupUI{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 100, 200, 40)];
    label.backgroundColor=[UIColor whiteColor];

 
    [self.view addSubview:label];
    self.label=label;
    
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
   
    [button sizeToFit];
    button.center=self.view.center;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickToJump) forControlEvents:UIControlEventTouchUpInside];
    self.button=button;
}

//实现协议方法

-(void)greenViewController:(UIViewController *)greenController withUserName:(NSString *)name{
    
    self.label.text=name;
    
    
}
-(void)clickToJump{
    GREenViewController *greenController = [[GREenViewController alloc]init];
    greenController.delegate=self;//指定代理
    [self.navigationController pushViewController:greenController animated:YES];
    
}

@end
