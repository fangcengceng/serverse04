//
//  HMDraw.m
//  核心绘图
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDraw.h"

@implementation HMDraw


- (void)drawRect:(CGRect)rect {
    //[self demo1];
   // [self demo2];
    //[self demo3];
    

}
#pragma mark 绘制文字,不需要获取绘图上下文环境
-(void)demo1{
    
    NSString *str = @"正在进行绘制文字";
    NSDictionary *dic = @{
                          NSFontAttributeName:[UIFont systemFontOfSize:20],
                          NSForegroundColorAttributeName:[UIColor redColor]
                          };
    [str drawInRect:self.frame withAttributes:dic];

}
#pragma mark 绘制image 不需要获取绘图的上下文环境
-(void)demo2{
    
    UIImage *imag = [UIImage imageNamed:@"Snip20160724_10"];
    [imag drawAtPoint:CGPointMake(0, 0) blendMode: kCGBlendModeNormal alpha:0.5];
}
#pragma   绘制图形，图画，需要回去图形上下文环境
-(void)demo3{
//    //获取图形上下文
//    CGContextRef ref = UIGraphicsGetCurrentContext();
//    CGContextMoveToPoint(ref, 100, 100);
//    CGContextAddLineToPoint(ref, 100, 200);
//    CGContextAddLineToPoint(ref, 200, 200);
//    CGContextClosePath(ref);
//    CGContextSetLineCap(ref,   kCGLineCapRound);
//    CGContextSetLineWidth(ref, 30);
//    
//    [[UIColor redColor] setFill];
//      CGContextStrokePath(ref);
//    CGContextFillPath(ref);
//    CGContextDrawPath(ref,  kCGPathEOFillStroke);
    
    
//    CGContextRef ref = UIGraphicsGetCurrentContext();
//    CGContextMoveToPoint(ref, 100, 100);
//    CGContextAddLineToPoint(ref, 300, 300);
//    CGContextAddLineToPoint(ref, 200, 200);
//    CGContextClosePath(ref);
//    [[UIColor redColor] setFill];
//    [[UIColor yellowColor] setStroke];
//    CGContextFillPath(ref);
//    CGContextStrokePath(ref);
//    CGContextDrawPath(ref,  kCGPathEOFillStroke);
    
//    
}
@end
