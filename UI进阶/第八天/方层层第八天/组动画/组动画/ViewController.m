//
//  ViewController.m
//  组动画
//
//  Created by codygao on 16/8/3.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    CALayer *_layer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *heroView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    heroView.layer.contents=(__bridge id)[UIImage imageNamed:@"user02_icon"].CGImage;
    [self.view addSubview:heroView];
    _layer=heroView.layer;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //基本动画修改旋转和缩放
    CABasicAnimation *base=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    base.toValue=@2;
    
    [_layer addAnimation:base forKey:nil];
    CABasicAnimation *base1=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    base1.toValue=@(M_PI*2);
    CAKeyframeAnimation *keyAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnim.path=[UIBezierPath bezierPathWithArcCenter:self.view.center radius:150 startAngle:0 endAngle:M_PI*2 clockwise:YES].CGPath;
    
    keyAnim.calculationMode=kCAAnimationPaced;
    
    //创建组动画
    CAAnimationGroup *group=[CAAnimationGroup animation];
    group.animations=@[base,base1,keyAnim];
    group.duration=4;
    group.repeatCount=CGFLOAT_MAX;
    
    [_layer addAnimation:group forKey:nil];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    
}
@end
