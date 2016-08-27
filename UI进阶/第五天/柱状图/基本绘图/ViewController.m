//
//  ViewController.m
//  基本绘图
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDemoView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HMDemoView *demoView;

@end

@implementation ViewController
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //柱状图
//    //生成5个随机数
    CGFloat a=arc4random_uniform(3)/3.0+0.1;
     CGFloat b=arc4random_uniform(5)/5.0+0.1;
     CGFloat c=arc4random_uniform(10)/10.0+0.1;
     CGFloat d=arc4random_uniform(20)/20.0+0.1;
     CGFloat e=arc4random_uniform(5)/5.0+0.1;
////    UITextField *t1=[[UITextField alloc] init];
////    t1.text =[NSString stringWithFormat:@"%f",arc4random_uniform(10)*0.1];
//    
//    
////    _demoView.data=[@a,@b,@c,d,e];
   _demoView.data=@[@(a),@(b),@(c),@(d),@(e)];
}
@end
