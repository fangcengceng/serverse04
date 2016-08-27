//
//  UIView+HMView.m
//  button控件内部的布局
//
//  Created by codygao on 16/8/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "UIView+HMView.h"

@implementation UIView (HMView)
-(void)setH:(CGFloat)h{
    CGRect rect = self.frame;
    rect.size.height = h;
    self.frame = rect;
    
}
-(CGFloat)h{
    
    return self.frame.size.height;
    
}
-(void)setW:(CGFloat)w{
    CGRect rect = self.frame;
    rect.size.width = w ;
    self.frame = rect;
    
    
}
-(CGFloat)w{
    return  self.frame.size.width;
    
    
}
-(void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame =rect;
    
}
-(CGFloat)x{
    return  self.frame.origin.x;
}
-(void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y =y;
    self.frame  =rect;
    
}
-(CGFloat)y{
    return self.frame.origin.y;
    
}
//-(void)setCenter:(CGPoint)center{
//    CGPoint center1 = self.center;
//    center1 =center;
//    self.center = center1;
//}
//-(CGPoint)center{
//    return self.center;
//
//}
@end
