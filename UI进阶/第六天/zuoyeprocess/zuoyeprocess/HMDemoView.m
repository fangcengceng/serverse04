//
//  HMDemoView.m
//  zuoyeprocess
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"
#import "SVProgressHUD.h"
@implementation HMDemoView

-(void)setPercent:(CGFloat)percent{
     _percent=percent;
    [self setNeedsDisplay];
    
    
}
- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width*0.5, rect.size.height*0.5);
    CGFloat lineW=10;
    
    if (_percent==0) {
        return;
    }
    
    CGFloat startA=-M_PI_2;
    CGFloat radius=MIN(rect.size.width, rect.size.height)*0.5-lineW*0.5;
     CGFloat endA=_percent*M_PI*2-M_PI_2;
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    path.lineWidth=lineW*0.5;
    path.lineJoinStyle=kCGLineJoinRound;
    if(_percent!=1){
    [path closePath];
    [SVProgressHUD showProgress:_percent status:[NSString stringWithFormat:@"已绘制%.f/100",_percent*100]];
     
    }
    if(_percent ==1){
        [SVProgressHUD dismiss];
       
    }
    //[SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat: @"已绘制%.f/100",_percent*100]];
     [[UIColor yellowColor] setStroke];
    [[UIColor redColor] setFill];
    //先描线，在填充颜色，才会不显示中中间的那条线
    //新填充，在描线，那么现在颜色的上方显示，会漏出中间的那条线。
      [path stroke];
    [path fill];
 
    
    
}


@end
