//
//  HMClockView.m
//  时钟2
//
//  Created by codygao on 16/8/2.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMClockView.h"

@implementation HMClockView{
    CALayer * _layer;
    CADisplayLink *_link;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self setupUI];
        
    }
    return self;
}
-(void)willMoveToWindow:(UIWindow *)newWindow{
    if (newWindow==nil) {
        [_link invalidate];
        _link=nil;
        return;
    }
    //创建定时器，需要添加到运行循环中
    CADisplayLink *link=[CADisplayLink displayLinkWithTarget:self selector:@selector(secondrefresh)];
    link.frameInterval=60;
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    _link=link;
}
-(void)secondrefresh{
    NSLog(@"ccc");
    _layer.transform = CATransform3DRotate(_layer.transform, M_PI*2/60, 0, 0, 1);
    
    
}
//创建定时器
//-(void)willMoveToWindow:(UIWindow *)newWindow{
          
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
// 
//}
-(void)dealloc{
    NSLog(@"kkkkk");
    
    
}
//-(void)refresh{
//    _layer.transform=CATransform3DRotate(_layer.transform, M_PI*2/60, 0, 0, 1);
//    
//    
//}
-(void)addcalender{
    NSCalendar *calender=[NSCalendar currentCalendar];
    NSUInteger second=[calender component:NSCalendarUnitSecond fromDate:[NSDate date]];
    
    CGFloat angel=M_PI*2/60;
    _layer.transform=CATransform3DRotate(_layer.transform,angel*second,0,0,1);
}
-(void)setupUI{
    self.layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"clock"].CGImage);
    CALayer *layer=[CALayer layer];
    layer.backgroundColor=[UIColor redColor].CGColor;
    layer.frame=CGRectMake(0, 0, 2, 70);
    layer.position=self.center;
    layer.anchorPoint=CGPointMake(0.5, 0.75);
    [self.layer addSublayer:layer];
    _layer=layer;
    [self addcalender];
    
}


@end
