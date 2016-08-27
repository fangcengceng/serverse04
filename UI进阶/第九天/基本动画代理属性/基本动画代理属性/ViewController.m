//
//  ViewController.m
//  基本动画代理属性
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
@interface HMBasicAnimation:CABasicAnimation


@end;
@implementation HMBasicAnimation

//-(void)dealloc{
//    NSLog(@"cccc");
//}

@end

@interface ViewController ()

@end

@implementation ViewController{
    UIView *_redView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redview=[[UIView alloc ] init];
    redview.backgroundColor=[UIColor blueColor];
    redview.bounds=CGRectMake(0, 0, 80, 80);
    redview.layer.backgroundColor=[UIColor redColor].CGColor;
    redview.center=self.view.center;
    [self.view addSubview: redview];
   
    _redView=redview;
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    HMBasicAnimation *basA=[HMBasicAnimation animationWithKeyPath:@"position.y"];
    basA.toValue=@600;
   
    basA.delegate=self;
     [_redView.layer  addAnimation:basA forKey:nil];
   

}
-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"sdjfsjdlfjsdlfj");
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    _redView.center=CGPointMake(self.view.center.x, 600);
}
@end
