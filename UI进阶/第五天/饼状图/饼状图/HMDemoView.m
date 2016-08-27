//
//  HMDemoView.m
//  饼状图
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"
#import "HMAdditonal.h"
@implementation HMDemoView
-(void)setArr:(NSArray *)arr{
    _arr=arr;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
  
    CGFloat starA=0;
    for (NSNumber *num in _arr) {
        CGPoint center=CGPointMake(rect.size.width*0.5,rect.size.height*0.5);
        CGFloat radius=rect.size.width*0.4;
        CGFloat value= num.floatValue;
        //自己需要的角度
        CGFloat angel=value*M_PI*2;
        CGFloat endA=angel+starA;
        UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:starA endAngle:endA clockwise:YES];
        
                path.lineJoinStyle=kCGLineJoinRound;
                path.lineCapStyle=kCGLineCapRound;
                [[UIColor hm_randomColor] setFill];
                [path stroke];
                [path fill];
                starA=endA;
    }
    

}


@end
