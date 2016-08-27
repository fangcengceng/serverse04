//
//  HMClockView.m
//  时钟案例
//
//  Created by codygao on 16/8/2.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMClockView.h"

@implementation HMClockView{
    CALayer *_layer;
    CADisplayLink *_link;
}
//设置一个定时器，给定时器添加一个事件达到自己的window一旦发生变化，就让秒针转动。如果不开定时器，秒针会停留在第一次的位置不动。
-(void)willMoveToWindow:(UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    //开启定时器方法一
   // [ NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    //开启定时器第二种方法,
    if(newWindow==nil){
        [_link invalidate];
        _link=nil;
        return;
    }
    CADisplayLink *link=[CADisplayLink displayLinkWithTarget:self selector:@selector(refresh)];
    //需要添加到运行循环中，因为add的添加，导致这个定时器有一个强指针引用，在windowe被销毁的时候，他并没有被销毁，所以需要进行判断。
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        //这样创建的定时器随屏幕刷新，每秒60次。他一分钟要刷新3600次。多以旋转角度要随他变化
}

-(void)refresh{
    NSLog(@"xxx");
    _layer.transform=CATransform3DRotate(_layer.transform, M_PI*2/60/60, 0, 0, 1);
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"clock"].CGImage);
    CALayer *layer=[CALayer layer];
    layer.frame=CGRectMake(0, 0, 1, 70);
    layer.position=self.center;
    layer.backgroundColor=[UIColor redColor].CGColor;
    layer.anchorPoint=CGPointMake(0.5, 0.75);
    [self.layer addSublayer:layer];
    _layer=layer;
    [self getCurrenTime];
    
}
//获取系统的当前事件
-(void)getCurrenTime{
    NSCalendar *calender=[NSCalendar currentCalendar];
    //获取当前系统时间的秒数
    NSInteger sencond=[calender component: NSCalendarUnitSecond  fromDate:[NSDate date]];
    //计算最初的旋转角度
    CGFloat angel=M_PI*2/60;
    //这样写可以让秒针从当前时间的秒数的位置来进行旋转
    _layer.transform=CATransform3DRotate(_layer.transform, sencond*angel, 0, 0, 1);
    
    
}



@end
