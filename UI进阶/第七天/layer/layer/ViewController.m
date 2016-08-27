//
//  ViewController.m
//  layer
//
//  Created by codygao on 16/8/1.
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
    layer.frame=CGRectMake(0, 0, 100, 100);
    layer.position=self.view.center;
    layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"user02_icon"].CGImage);
    layer.borderColor=[UIColor yellowColor].CGColor;
    layer.borderWidth=16;
    layer.cornerRadius=50;
    layer.masksToBounds=YES;
    layer.shadowOpacity=1.0;
    layer.shadowOffset=CGSizeMake(200, 200);
    
    layer.shadowColor=[UIColor redColor].CGColor;
    //layer.shadowPath=(__bridge CGPathRef _Nullable)[UIBezierPath bezierPathWithArcCenter:self.view.center radius:200 startAngle:0 endAngle:M_PI/3 clockwise:YES];
    
    layer.backgroundColor=[UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    _layer=layer;
    
    
}
- (IBAction)yinshidonghua:(UIButton *)sender {
    //隐式动画的类
    [CATransaction begin];
    //关闭隐士动画
    [CATransaction setDisableActions:NO];
    //动画市场
    [CATransaction setAnimationDuration:0.25];
    //设置动画技术后执行的操作
    [CATransaction setCompletionBlock:^{
        NSLog(@"XXXX");
    }];
    _layer.transform=CATransform3DScale(_layer.transform, 0.8, 0.8, 0.8);
    //设置时间曲线
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction commit];
    
}
/*-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //transform属性
   
   _layer.transform=CATransform3DRotate(_layer.transform,M_PI_4, 1, 0, 1);//旋转的时候，是以坐标点与原点的连线为中心轴进行旋转，所以任何一个坐标的改变都可以引起旋转的不同
    //在有旋转的时候，平移的作用几乎可以忽略不计。
     _layer.transform=CATransform3DTranslate(_layer.transform, 0, 20, 0);
    _layer.transform=CATransform3DScale(_layer.transform, 0.8, 0.8,0.8);
    
    
    //属性borderd
//    _layer.borderColor=[UIColor yellowColor].CGColor;
//    _layer.borderWidth=10;
   // 隐藏
   // _layer.hidden=YES;
    
    //shawdow 属性
//    _layer.shadowColor=[UIColor  blueColor].CGColor;
//    _layer.shadowOpacity=10;//阴影默认在不设置半径的时候，默认是向上偏移3个点。默认返回值为0.没有效果。
//    _layer.shadowRadius=20;
//    _layer.shadowOffset=CGSizeMake(100, 100);//以左上角为偏移原点
//    //绘制阴影路径
//    _layer.shadowPath=(__bridge CGPathRef)([UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)]);
    
    
    //圆角，二者成对出现
//    _layer.cornerRadius=50;
//    _layer.masksToBounds=YES;//让多余的圆角不显示；
    
    
    //content,内容//可以用来给试图填充背景图片，而不用在添加image；
   // _layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"user01_icon"].CGImage);
//   _layer.contentsRect=CGRectMake(0, 0, 40, 40);
//    _layer.contentsScale=10;
//    
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _layer.transform=CATransform3DIdentity;
}
*/
@end
