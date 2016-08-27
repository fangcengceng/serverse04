//
//  HMDemoView.m
//  作业进度条
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"

@implementation HMDemoView
-(void)setPercent:(CGFloat)percent{
    
    _percent=percent;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    NSInteger widthW=10;
    CGPoint center=CGPointMake(rect.size.width*0.5, rect.size.height*0.5);
    CGFloat radius=rect.size.width*0.5;
    CGFloat startA=0;
    CGFloat endA=_percent*M_PI*2;
    
 UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    
    if(startA ==0){
        return;
    }
    [path addLineToPoint:center];
    [path setLineWidth:widthW];
    [path setLineJoinStyle:kCGLineJoinRound];
    [[UIColor  redColor] setFill];
    [[UIColor yellowColor] setStroke];
   
    [path fill];
    [path stroke];



}


@end
