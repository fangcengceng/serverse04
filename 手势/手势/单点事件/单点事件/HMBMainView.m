//
//  HMBMainView.m
//  单点事件
//
//  Created by codygao on 16/7/28.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMBMainView.h"
#import "red.h"
@interface HMBMainView()

@end

@implementation HMBMainView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    //获取触摸点
//    UITouch *touch=touches.anyObject;
//    CGPoint currP=[touch locationInView:self];
//     NSLog(@"self.center=%@",NSStringFromCGPoint(currP));//这个点是相对于自己而言。
//    NSLog(@"self.center=%@",NSStringFromCGPoint(self.center));
//   
//  //让视图的中心点移动到当前触摸点，需要将点转化为相对于父控件的位置而言
//    CGPoint newPoint=[self convertPoint:currP toView:self.superview];
//    NSLog(@"%@",NSStringFromCGPoint(newPoint));
////本质是修改中心点
//    self.center = newPoint;


//
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=touches.anyObject;
    CGPoint curP=[touch locationInView:self];
    CGPoint preP=[touch previousLocationInView:self];
    //偏移量
    CGFloat offsetX=curP.x-preP.x;
    CGFloat offsetY=curP.y-preP.y;
    CGPoint oldCenter=self.center;
    
    self.center = CGPointMake(oldCenter.x + offsetX, oldCenter.y + offsetY);

    
}
@end
