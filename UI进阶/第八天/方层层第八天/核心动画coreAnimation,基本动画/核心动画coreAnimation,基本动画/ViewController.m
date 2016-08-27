//
//  ViewController.m
//  核心动画coreAnimation,基本动画
//
//  Created by codygao on 16/8/2.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIButton *_button;
}

- (void)viewDidLoad {
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 100, 100);
    button.center=self.view.center;
    [self.view addSubview:button];
    button.backgroundColor=[UIColor grayColor];
     button.layer.anchorPoint=CGPointMake(0.3, 0.7);
    [button  addTarget:self action:@selector(animated:) forControlEvents:UIControlEventTouchUpInside];
    _button=button;
}
-(void)animated:(UIButton *)sender{
    //创建基本动画
    CABasicAnimation *base=[CABasicAnimation animationWithKeyPath:@"position"];
    //设置属性
    base.toValue=[NSValue valueWithCGPoint:CGPointMake(50, 100)];
    base.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, 600)];
  //动画后不要闪回去,特点是只移动了layer,没有移动button.导致doabutton,扔可点
    base.fillMode=kCAFillModeForwards;
    base.removedOnCompletion=NO;
    //添加到layer上
       base.delegate=self;
    [sender.layer addAnimation:base forKey:@"base"];
    
    //方法二。不闪回去
 //在caanimation 中的代理。有两个方法一个是start,一个是stop
}

#pragma mark animation 的代理方法 
-(void)animationDidStart:(CAAnimation *)anim{
    _button.layer.cornerRadius=10;
    _button.layer.masksToBounds=YES;
    NSLog(@"xx");
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"jjksd");
   // _button.transform=CGAffineTransformScale(_button.transform, 0.5, 0.5);
}
@end
