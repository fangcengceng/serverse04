//
//  HMDemoView.m
//  核心绘图
//
//  Created by codygao on 16/7/31.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"

@implementation HMDemoView


- (void)drawRect:(CGRect)rect {
    [self sanjiaoxing];
    //扇形
//    CGContextRef ref=UIGraphicsGetCurrentContext();
//    //0是顺时针。
//    CGContextAddArc(ref, 100, 100, 30, 0, M_PI_2, 0);
//    
//    
//   
//    CGContextStrokePath(ref);
    }
//三角形
-(void)sanjiaoxing{
    //本质是多条线相连。然后关闭路径。
    CGContextRef ref=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ref, 50, 50);
    CGContextAddLineToPoint(ref, 100, 100);
    CGContextAddLineToPoint(ref,100,200);
    //关闭路径
    CGContextClosePath(ref);
    //设置属性
    CGContextSetLineWidth(ref, 10);
    CGContextSetLineCap(ref,  kCGLineCapRound);
    CGContextSetLineJoin(ref, kCGLineJoinBevel);

    [[UIColor redColor] setFill];
    [[UIColor yellowColor] setStroke];
    //渲染路径
  //  CGContextFillPath(ref);
    CGContextDrawPath(ref,  kCGPathFillStroke);
}


//椭圆
-(void)ellipse{
    CGContextRef ref=UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ref, CGRectMake(100, 100, 100, 100));
    
    
    CGContextFillPath(ref);
    

}
//矩形
-(void)rect{
    CGContextRef ref=UIGraphicsGetCurrentContext();
    CGContextAddRect(ref, CGRectMake(100, 100, 100, 100));
    
    CGContextFillPath(ref);
    
    CGContextStrokePath(ref);
}

-(void)line{
    
    //获取图形上线文
    CGContextRef ref=UIGraphicsGetCurrentContext();
    //移动到一个点
    CGContextMoveToPoint(ref, 50, 60);
    CGContextAddLineToPoint(ref, 100, 300);
    
    //渲染路径
    CGContextStrokePath(ref);
}

@end
