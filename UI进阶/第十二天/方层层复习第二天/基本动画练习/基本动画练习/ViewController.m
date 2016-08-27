//
//  ViewController.m
//  基本动画练习
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,weak)UIButton * redView;
@property(nonatomic,weak) CALayer * redLayer;
@end

@implementation ViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    CALayer *layer = [CALayer layer];
        layer.backgroundColor = [UIColor redColor].CGColor;
        layer.bounds =CGRectMake(0, 0, 50, 50);
//    layer.position  = CGPointMake(150, 150);
    layer.cornerRadius = 10;
    layer.masksToBounds  = YES;
        [self.view.layer addSublayer:layer];
    _redLayer = layer;
   
}
#pragma mark 关键帧动画
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CAKeyframeAnimation  *anim  = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anim.values  = @[@"M_PI_2",@"-M_PI_2",@"M_PI_2"];
    
    
    anim.path  = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5) radius:150 startAngle:0 endAngle:2*M_PI clockwise:1].CGPath;
    anim.repeatCount  = CGFLOAT_MAX;
    anim.duration = 1;
    anim.calculationMode = kCAAnimationPaced;
    [_redLayer addAnimation:anim forKey:nil];
    
                                   
    
    
    
    
    
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//     CATransform3D transform= CATransform3DIdentity;
//    transform.m34 = -1/500;
//    transform = CATransform3DRotate(transform, M_PI_4, 0, 0, 1);
//    _redLayer.transform = transform;
//
//}
//-(void)viewDidLoad{
//    [super viewDidLoad];
//    //关闭隐士动画
//    CALayer *layer = [CALayer layer];
//    layer.backgroundColor = [UIColor redColor].CGColor;
//    layer.bounds =CGRectMake(0, 0, 50, 100);
//    [self.view.layer addSublayer:layer];
//    
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    [CATransaction setAnimationDuration:6];
//    //设定时间曲线
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//    
//    [CATransaction setCompletionBlock:^{
//        
//        layer.transform = CATransform3DRotate(layer.transform, M_PI_4, 0, 0, 1);
//        layer.position  = CGPointMake(0.5*self.view.bounds.size.width, self.view.bounds.size.height*0.5);
//       
//        
//    }];
//    
//    [CATransaction commit];
//    
//}
//-(void)demo1{
//    
//    
//}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    UIButton *view  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    view.backgroundColor = [UIColor redColor];
//    [view addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:view];
//    _redView  = view;
//    _redView.userInteractionEnabled = NO;
//
//    //[self demo1];
//}
//-(void)click{
//    NSLog(@"xx");
//
//}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
//    
//    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake (100,100)];
//    anim.toValue  = [NSValue valueWithCGPoint:CGPointMake (300,300)];
//    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards;
//     _redView.layer.delegate = self;
//    [_redView.layer addAnimation:anim forKey:nil];
//    
//}
//-(void)animationDidStart:(CAAnimation *)anim{
//    
//    
//    
//}
//-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    _redView.transform  =CGAffineTransformIdentity;
//    
//    
//}

@end
