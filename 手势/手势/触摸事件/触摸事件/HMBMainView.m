//
//  HMBMainView.m
//  触摸事件
//
//  Created by codygao on 16/7/28.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMBMainView.h"

@implementation HMBMainView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  //  touches 是nssetde 实例对象
//    UITouch *touch=touches.anyObject;
//    UIView *touchView=touch.view;
//    NSInteger count=touch.tapCount;
//    NSLog(@"\ntouch==%@----\nview==%@---\ncount==%zd",touch,touchView,count);
//    
    
//   // NSLog(@"%@---%s",self.class,__FUNCTION__);
//    //NSArray *array=[NSArray arrayWithObjects:@"jskd", @11,nil];
////    NSLog(@"%@",array);
////    for(NSInteger i=0;i<2;i++){
////        NSLog(@"%@",array[i]);
////    }
////    for (NSObject *obj in array) {
////         NSLog(@"%@",obj);
////    }
////    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
////        NSLog(@"%@",obj);
////        NSLog(@"%@",array);
////        
////    }];
//    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    view.backgroundColor=[UIColor redColor];
//    [self addSubview:view];
//    NSSet *set=[NSSet setWithObjects:@[@"kddj",@12], view,nil];
//   // NSLog(@"%@",set);
//    //获取其中的元素
//    NSObject *obj=set.anyObject;
//    NSLog(@"%@",obj);
////    for (NSObject *obj in set) {
////        NSLog(@"%@",obj);
////    }
//    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSLog(@"%@",obj);
//    }];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
     NSLog(@"%@---%s",self.class,__FUNCTION__);
    //获取触摸对象,触摸对象只可以获取不可以创建
    UITouch *touch=touches.anyObject;
    CGPoint previoP=[touch previousLocationInView:self];
    CGPoint currentP=[touch locationInView:self];
    NSLog(@"%@   %@",NSStringFromCGPoint(previoP),NSStringFromCGPoint(currentP));
    
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   NSLog(@"%@---%s",self.class,__FUNCTION__);
    
}
//电话进来的时候
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
      NSLog(@"%@---%s",self.class,__FUNCTION__);
}
-(void)touchesEstimatedPropertiesUpdated:(NSSet *)touches{
      NSLog(@"%@---%s",self.class,__FUNCTION__);
    
    
}

@end
