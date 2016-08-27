
//
//  HMDemoView.m
//  作业柱状图
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"
#import "HMAdditonal.h"

@implementation HMDemoView
-(void)setArrayM:(NSArray *)arrayM{
    _arrayM=arrayM;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    //定义数组假数据
   // NSArray *arrayM=@[@0.2,@0.3,@0.7,@0.9,@0.4];
    
    //定义尺寸，计算
    NSInteger index=0;
    for (NSNumber *num in _arrayM) {
        CGFloat value=num.floatValue;
        CGFloat width=rect.size.width/(2*_arrayM.count+1);
        CGFloat height=rect.size.height*value;
       
        CGFloat x=2*index*width+width;
        CGFloat y=rect.size.height-height;
        
        //创建路径
        UIBezierPath *path=[UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
        //渲染路径
        [[UIColor hm_randomColor] setFill];
        [path fill];
        index ++;
    }
    
}


@end
