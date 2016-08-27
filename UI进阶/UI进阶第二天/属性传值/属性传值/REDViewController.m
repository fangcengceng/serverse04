//
//  REDViewController.m
//  属性传值
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "REDViewController.h"
#import "YELLowViewController.h"

@interface REDViewController ()
@property(nonatomic,weak)UITextField *textField;
@end

@implementation REDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
     self.title=@"首页";
    [self setupUI];


}
-(void)setupUI{
    //定义文本框并添加到试图中。
    UITextField *textField=[[UITextField alloc] initWithFrame:CGRectMake(20, 100, 300,40)];
    //属性，有四种，默认是none，要想显示必须在界面上，不能为none
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    self.textField = textField;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center=self.view.center;
    
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickToJump) forControlEvents:(UIControlEventTouchUpInside)];

}
-(void)clickToJump{
    YELLowViewController *yelloewController = [[YELLowViewController alloc  ] init];
    
    [self.navigationController pushViewController:yelloewController animated:YES];
    
    yelloewController.context = self.textField.text;

    
}
@end
