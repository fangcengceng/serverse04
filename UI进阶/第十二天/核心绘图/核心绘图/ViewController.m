//
//  ViewController.m
//  核心绘图
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddArc(ref, 0, 0, 50, 0, M_PI*2, 0);
    CGContextStrokePath(ref);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    
    
    
}

@end
