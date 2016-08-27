//
//  GREenViewController.m
//  逆向传值，代理方法传值
/*思路分析：
界面搭建：  红色push..绿色pop
 
 按钮添加点击事件：红色监听push, 绿色监听pop...绿色监听传值事件。   方法二：代理传智
 
 


*/
//Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "GREenViewController.h"
#import "REDViewController.h"

@interface GREenViewController ()
@property(nonatomic,weak)UITextField *textField;
@end

@implementation GREenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    [self setupUI];


}

-(void)popToController{

    if([self.delegate respondsToSelector:@selector(greenViewController:withUserName:)]){
    
        [self.delegate greenViewController:self withUserName:_textField.text];
        
    }

 [self.navigationController popViewControllerAnimated:YES];
}
-(void)setupUI{
    UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(40, 100, 200, 40)];
    textField.borderStyle=UITextBorderStyleRoundedRect;
    
    [self.view addSubview:textField];
    self.textField = textField;
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button sizeToFit];
    button.center=self.view.center;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(popToController) forControlEvents:UIControlEventTouchUpInside];
}

@end
