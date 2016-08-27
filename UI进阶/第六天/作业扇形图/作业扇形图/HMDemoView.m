//
//  HMDemoView.m
//  作业扇形图
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"
#import "HMAdditonal.h"

@implementation HMDemoView

- (void)drawRect:(CGRect)rect {
    NSArray *array=@[@0.5,@0.3,@0.2];
    CGPoint center=CGPointMake(150, 150);
    CGFloat radius=rect.size.width*0.3;
    CGFloat startA=-M_PI_2;
    
    for (NSUInteger i=0; i<array.count; i++) {
        CGFloat value=[array[i] floatValue];
            CGFloat endA=value*M_PI*2 +startA;
        
        UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [[UIColor hm_randomColor] setFill];
        [path addLineToPoint:center];
       // [path closePath];
        [path fill];
        startA=endA;
    }

}

    


@end
