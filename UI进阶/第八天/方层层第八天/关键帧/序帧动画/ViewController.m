//
//  ViewController.m
//  序帧动画
//
//  Created by codygao on 16/8/3.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIView *_redView;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self demoValues];
    //[self demoPath];
     [self demoShake];
    //[self demoScale];
}
-(void)demoScale{
    CAKeyframeAnimation *keyAnim=[CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    keyAnim.values=@[@0.8,@0.8,@0.8];
    keyAnim.duration=4;
    [_redView.layer addAnimation:keyAnim forKey:nil];
    
    
}
-(void)demoShake{
    CAKeyframeAnimation *keyAnim=[CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    //keypath 有position,size,rect,transform.
    
    //设置属性，values是id
    keyAnim.values=@[
                     @(-M_PI_4),
                       @(M_PI_4),
                     @(-M_PI_4)

                     ];
    keyAnim.repeatCount=CGFLOAT_MAX;
    keyAnim.duration=2;
    
    [_redView.layer addAnimation:keyAnim forKey:nil];
    
}
-(void)demoValues{
    
    CAKeyframeAnimation *keyAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnim.values=@[
                     [NSValue valueWithCGPoint:CGPointMake (50, 50)],
                      [NSValue valueWithCGPoint:CGPointMake(50, 300)],
                     [NSValue valueWithCGPoint:CGPointMake(400, 300)],
                     [NSValue valueWithCGPoint:CGPointMake(300,200)]
                     ];
    keyAnim.duration=3;
   keyAnim.repeatCount=INT_MAX;
    
    [_redView.layer addAnimation:keyAnim forKey:nil];
}
-(void)demoPath{
    //创建动画
    CAKeyframeAnimation *keyAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设置属性
    keyAnim.path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 250, 200, 300)].CGPath;
    keyAnim.duration=2;
    keyAnim.repeatCount=CGFLOAT_MAX;
    //计算模式的属性
    /**
     *
     CA_EXTERN NSString * const kCAAnimationLinear
     __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
     CA_EXTERN NSString * const kCAAnimationDiscrete
     __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
     CA_EXTERN NSString * const kCAAnimationPaced
     __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
     CA_EXTERN NSString * const kCAAnimationCubic
     __OSX_AVAILABLE_STARTING (__MAC_10_7, __IPHONE_4_0);
     CA_EXTERN NSString * const kCAAnimationCubicPaced
     __OSX_AVAILABLE_STARTING (__MAC_10_7, __IPHONE_4_0);
     
     
     
     */
    
    keyAnim.calculationMode=kCAAnimationPaced;
    ///* `rotationMode' strings. */
    
    CA_EXTERN NSString * const kCAAnimationRotateAuto
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
    CA_EXTERN NSString * const kCAAnimationRotateAutoReverse
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
    
    /** Subclass for mass-spring animations. */
    //旋转模式
    keyAnim.rotationMode=kCAAnimationRotateAuto;
    //keyAnim.repeatDuration=3;
    //不闪回去，但是动画结束后会固定到一个点上。两种方式，属性和代理
//    keyAnim.removedOnCompletion=NO;
//    keyAnim.fillMode=kCAFillModeForwards;
    //添加
    [_redView.layer addAnimation:keyAnim forKey:nil];
}
#pragma mark 界面搭建
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *heroView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    heroView.backgroundColor=[UIColor redColor];
    heroView.center=self.view.center;
    heroView.layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"hero1"].CGImage);
    [self.view addSubview:heroView];
    _redView=heroView;
    
}

@end
