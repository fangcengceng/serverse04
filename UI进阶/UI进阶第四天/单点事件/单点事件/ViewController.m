//
//  ViewController.m
//  单点事件
//
//  Created by codygao on 16/7/28.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMBMainView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HMBMainView *blueView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 也可以实现单点事件，让试图的中心点在手的中心。
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch=touches.anyObject;
//    CGPoint currP=[touch locationInView:self.view];
//    NSLog(@"blueView.center==%@",NSStringFromCGPoint(_blueView.center));
//    _blueView.center=currP;
//    NSLog(@"blueView.center==%@",NSStringFromCGPoint(_blueView.center));
//
//}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    CGPoint curP=[touches.anyObject locationInView:self.view];
    CGPoint preP=[touches.anyObject previousLocationInView:self.view];
    CGFloat offsetX=curP.x-preP.x;
    CGFloat offsetY=curP.y-preP.y;
     CGPoint oldCenter=_blueView.center;
    
    _blueView.center=CGPointMake(oldCenter.x+offsetX,oldCenter.y+offsetY);
    
    
}
@end
