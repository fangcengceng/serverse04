//
//  MTHomeController.m
//  FCCMTApp
//
//  Created by codygao on 16/8/5.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTHomeController.h"
#import "MTShopController.h"
@interface MTHomeController ()

@end

@implementation MTHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center=self.view.center;
   
    
    [button addTarget:self action:@selector(clickToJump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self clickToJump];
    
}
-(void)clickToJump{
    MTShopController *shopVC=[[MTShopController alloc] init];
    [self.navigationController pushViewController:shopVC animated:YES];
  
    
}

@end
