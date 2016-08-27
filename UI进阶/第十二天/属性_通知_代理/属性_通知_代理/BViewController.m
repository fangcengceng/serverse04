//
//  BViewController.m
//  属性_通知_代理
//
//  Created by codygao on 16/8/15.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [bu addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    bu.center = self.view.center;
    [self.view addSubview:bu];

}
-(void)click{
    if([self.delegate respondsToSelector:@selector(bviewcontroller:andpass:)]){
        [self.delegate bviewcontroller:self andpass:@"hhhh"];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",self.str);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
