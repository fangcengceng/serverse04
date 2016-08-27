//
//  ViewController.m
//  layer的锚点
//
//  Created by codygao on 16/8/2.
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
    CALayer *layer=[CALayer layer];
    layer.backgroundColor=[UIColor redColor].CGColor;
    layer.frame=CGRectMake(0, 0, 50, 50);
    layer.position=self.view.center;
    
    layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"user01_icon"].CGImage);
       [self.view.layer addSublayer:layer];
    layer.cornerRadius=5;
    layer.masksToBounds=YES;
    layer.borderColor=[UIColor yellowColor].CGColor;
    //注意取值范围是0-1；
    //layer.anchorPoint=CGPointMake(0.3,0.6);
 
    _layer=layer;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  [self demo1];
    //[self demo2];
      //[self demo3];
}
-(void)demo3{
    [CATransaction begin];
    [CATransaction setDisableActions:NO];//关闭隐士动画，如果是yes一次到位。
    [CATransaction setAnimationDuration:2];
    [CATransaction setCompletionBlock:^{
     //   _layer.transform=CATransform3DTranslate(_layer.transform, 20, 0, 0);
    }];
    [CATransaction setAnimationTimingFunction: [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseOut]];
  _layer.position=CGPointMake(0, 0);
    
    
    [CATransaction commit];
    
    
}
-(void)demo2{
    //transform属性
    _layer.transform=CATransform3DRotate(_layer.transform, M_PI_4, 1, 0, 0);
    _layer.transform=CATransform3DMakeScale(0.8, 0.8, 0.8);
    _layer.transform=CATransform3DTranslate(_layer.transform, 10, 10, 10);
    
    
}
-(void)demo1{
    //3D是透视效果
    CATransform3D trans=CATransform3DIdentity;
   // trans=CATransform3DScale(trans, 1, 1, 1);
    trans.m34=-1.0/1000;
    trans=CATransform3DRotate(trans, M_PI_4, 0, 0, 1);
    _layer.transform=trans;
}
@end
