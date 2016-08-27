
//
//  CZViewController.m
//  loadView方法的使用
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "CZViewController.h"

@interface CZViewController ()

@end

@implementation CZViewController
//在loadView 中尽量不要使用self.view，因为系统默认是在viewDidLoad 中才会有大小。如果要在loadView 中使用self.view 必须要给self.view赋值
//-(void)loadView{
//    [super loadView];//如果不调用这个方法会造成死循环。
//}
-(void)loadView{
    //多态，父类执行子类
    
    self.view=[[UIView alloc]initWithFrame:CGRectMake(200, 0, 200, 200)];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
                      
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
}



@end
