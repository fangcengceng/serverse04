//
//  HMDemoView.m
//  图形上下文栈操作和矩形操作
//
//  Created by codygao on 16/8/1.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"

@implementation HMDemoView{
    CGContextRef *_ref;
}

- (void)drawRect:(CGRect)rect {
    
    //获取图形上下文
    
    //栈操作
    
#pragma mark 矩阵操作
    
    //
    CGContextRef ref=UIGraphicsGetCurrentContext();
    
    for(NSInteger i=0;i<30;i++){
        
        CGContextSaveGState(ref);
        
        CGContextRotateCTM(ref, M_PI_4/6);
        
        CGContextScaleCTM(ref, 0.5, 0.5);
        CGContextTranslateCTM(ref, 200, 50);
        
        
        //添加路径
        
        
        UIBezierPath *path1=[UIBezierPath bezierPathWithArcCenter:CGPointMake(100,300) radius:70 startAngle:0 endAngle:M_PI*2 clockwise:YES];
        
        UIBezierPath *paht2=[UIBezierPath bezierPathWithArcCenter:CGPointMake(100,100) radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];
        
        CGContextAddPath(ref, paht2.CGPath);
        
        CGContextAddPath(ref, path1.CGPath);
        
        UIBezierPath *path=[UIBezierPath bezierPathWithRect:rect];
        CGContextAddPath(ref, path.CGPath);
        
        //设置属性
        
        
        
        CGContextSetLineWidth(ref, 10);
        [[UIColor yellowColor] setStroke];
        CGContextStrokePath(ref);
        
        CGContextRestoreGState(ref);
    }
}

@end
