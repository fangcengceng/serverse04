//
//  ViewController.m
//  三维透视效果
//
//  Created by codygao on 16/8/1.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,weak) CALayer *_layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *layer=[CALayer layer];
    layer.frame=CGRectMake(0,0,200, 200);
    layer.position=self.view.center;
    layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"user01_icon"].CGImage);
    [self.view.layer addSublayer:layer];
    layer.borderWidth=2;
    layer.borderColor=[UIColor redColor].CGColor;
    layer.backgroundColor=[UIColor redColor].CGColor;
    layer.cornerRadius=20;
    layer.masksToBounds=YES;

    __layer=layer;
 
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //动画有属性动画transform,透视动画，3D动画
   // __layer.transform=CATransform3DRotate(__layer.transform, M_PI_4, 1, 1, 0);
    [self D3];
}
-(void)D3{
        CATransform3D  transform=CATransform3DIdentity;
        transform.m34=-1.0/500;
        //trans=CATransform3DScale(__layer.transform, 0.9, 0.9, 0.9);
        transform=CATransform3DRotate(transform, M_PI_4, 1, 1, 0);
        __layer.transform=transform;
}
@end
