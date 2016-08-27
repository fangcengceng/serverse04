//
//  ViewController.m
//  通过修该锚点和position实现动画
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,weak) UIView *redView;
@end

@implementation ViewController
   
- (void)viewDidLoad {
    [super viewDidLoad];
    

    UIView *redView=[[UIView alloc] init];
    redView.bounds=CGRectMake(0, 0, 50, 100);
    redView.center=self.view.center;
    redView.backgroundColor=[UIColor redColor];
    redView.layer.anchorPoint=CGPointMake(0.5, 1.5);
    redView.layer.position=CGPointMake(self.view.center.x ,self.view.center.y+100);
    [self.view addSubview:redView];
    _redView=redView;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _redView.transform=CGAffineTransformMakeRotation(-M_PI_2);
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _redView.transform=CGAffineTransformIdentity;
    
    
}
@end
