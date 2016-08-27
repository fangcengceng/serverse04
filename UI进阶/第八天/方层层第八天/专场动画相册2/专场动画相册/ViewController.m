//
//  ViewController.m
//  专场动画相册
//
//  Created by codygao on 16/8/3.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,assign) NSInteger index;

@property(nonatomic, weak)UIImageView *imaView;
@end

@implementation ViewController
 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.contents=(__bridge id)([UIImage imageNamed:@"image1-1"].CGImage);
    _index=1;
    [self setupUI];
}
-(void)setupUI{
    UISwipeGestureRecognizer *leftG=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    leftG.direction=UISwipeGestureRecognizerDirectionLeft;
   [ self.view addGestureRecognizer:leftG];
    UISwipeGestureRecognizer *rightG=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    [self.view addGestureRecognizer:rightG];
}


-(void)gestureAction:(UISwipeGestureRecognizer *) recognizer{
    NSString *direction;
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
          _index++;
       
            if(_index>6){
                _index=1;
            }
            direction=kCATransitionFromRight;
            break;
        case UISwipeGestureRecognizerDirectionRight:
      
            if(_index<1){
                _index=6;
            }
        
            _index--;
            direction=kCATransitionFromLeft;
            break;
        default:
            break;
    }
    //拼接字符串
    NSString *imageName=[NSString stringWithFormat:@"image%zd-1",_index];
    //控件的转换
    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [self.view addSubview:imageView];
    
    //转场动画
    CATransition *anim=[CATransition animation];
    anim.type=kCATransitionReveal;
    
    anim.subtype=direction;
    //添加到layer上
    [self.view.layer addAnimation:anim forKey:nil];

    
   }


@end
