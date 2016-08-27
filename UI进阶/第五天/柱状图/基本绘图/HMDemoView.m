//
//  HMDemoView.m
//  基本绘图
//
//  Created by codygao on 16/7/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"
#import "HMAdditonal.h"

@implementation HMDemoView


-(void)setData:(NSArray *)data{
    _data=data;
    [self setNeedsDisplay];
    
    
}

  

//柱状图
- (void)drawRect:(CGRect)rect {
    
    //柱状图
    //数据
    
    //遍历数组
    NSInteger index=0;
    for (NSNumber *num in _data) {
        //2、1转为float类型的数据，方便计算。
        float number=num.floatValue;
        //2、2计算x.y.width,heigh.
        CGFloat width=rect.size.width/(2*_data.count-1);
        CGFloat height=rect.size.height*number;
        CGFloat  X=(2*width)*index;
        CGFloat Y=rect.size.height-height;
        
        //2、3创建路径，根据路径的需要计算其中的参数信息
        UIBezierPath *path=[UIBezierPath bezierPathWithRect:CGRectMake(X, Y, width, height)];
        [[UIColor hm_randomColor] setFill];
        [path fill];
        index++;
        
    }
    

    
    
    
    

    

}


@end
