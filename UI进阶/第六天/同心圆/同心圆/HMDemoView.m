//
//  HMDemoView.m
//  同心圆
//
//  Created by codygao on 16/8/1.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"

@implementation HMDemoView


- (void)drawRect:(CGRect)rect {
    
    //[self strimage];
    [self kit];
    
}
-(void)strimage{
    
    NSString *str=@"lsdjflasdj";
    NSDictionary *dic=@{
                        NSFontAttributeName:[UIFont systemFontOfSize:19],
                        NSBackgroundColorDocumentAttribute :[UIColor redColor]
                        };
    
    [str drawAtPoint:CGPointMake(70,70) withAttributes:dic];
    [str drawInRect:CGRectMake(20, 20, 100, 100) withAttributes:dic];
    UIImage *image=[UIImage imageNamed:@"yun"];
    [image drawAsPatternInRect:self.frame];
    
    
}
-(void)kit{
   

    UIBezierPath  *path1=[UIBezierPath bezierPathWithArcCenter:self.center radius:150 startAngle:0 endAngle:M_PI*2 clockwise:NO];
    [[UIColor redColor] setFill];
    [path1 fill];
    UIBezierPath  *path2=[UIBezierPath bezierPathWithArcCenter:self.center radius:120 startAngle:0 endAngle:M_PI*2 clockwise:NO];
   [[UIColor whiteColor] setFill];
    [path2 fill];
}


@end
