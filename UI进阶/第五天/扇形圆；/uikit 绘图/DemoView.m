//
//  DemoView.m
//  uikit 绘图
//
//  Created by codygao on 16/7/29.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView


//-(void)awakeFromNib{
//    [super awakeFromNib];
//    
//}
-(void)setAngelF:(CGFloat)angelF{
    _angelF=angelF;
    [self setNeedsDisplay];
}

// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat pathWidth=10;
    //如果传进来的角度为0，什么也不做返回。就没有中间的那一个连线；细节处理
    
    //画扇形圆；
    //获取圆心
    CGPoint center=CGPointMake(rect.size.width*0.5, rect.size.height*0.5);
    //获取半径,获取两个数中较小的数
    CGFloat radius=MIN(rect.size.width,rect.size.height)*0.5-pathWidth*0.5;
    //设置起始点
    CGFloat startA=-M_PI_2;
    CGFloat endA=_angelF*(M_PI*2)-M_PI_2;

  //获取路径
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    if(_angelF==0){
        return;
    }
    
   
    

   [path addLineToPoint:center];
     [path closePath];
    //关闭路径
      //线宽，线头
    path.lineCapStyle =kCGLineCapSquare;
    path.lineJoinStyle=kCGLineCapRound;
    [path setLineWidth:pathWidth*0.5];
    //渲染
    [[UIColor redColor] setFill];
    [[UIColor blueColor] setStroke];
    [path fill];
    [path stroke];

}


@end
