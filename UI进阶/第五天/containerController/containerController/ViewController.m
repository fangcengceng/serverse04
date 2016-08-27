//
//  ViewController.m
//  containerController
//
//  Created by codygao on 16/7/29.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *MaincontrollerView;

@end

@implementation ViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupUI];
}
-(void)setupUI{
    
    UIPanGestureRecognizer *panG=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [_MaincontrollerView addGestureRecognizer:panG];
    UITapGestureRecognizer *tapG=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [_MaincontrollerView addGestureRecognizer:tapG];
    
}
-(void)tapAction:(UITapGestureRecognizer *)recognizer{
    //方法二[
    if(CGAffineTransformIsIdentity(_MaincontrollerView.transform)){
        return;
        
    }
    [UIView animateWithDuration:0.3 animations:^{
        _MaincontrollerView.transform=CGAffineTransformIdentity;
    }];
    //方法一；
//    if(_MaincontrollerView.frame.origin.x==self.view.frame.size.width-60){
//        
//        _MaincontrollerView.transform=CGAffineTransformIdentity;
//    }
//    
}
-(void)panAction:(UIPanGestureRecognizer*)recognizer{
    //获取偏移量
    CGPoint translate=[recognizer translationInView:_MaincontrollerView];
    //重置偏移量
    [recognizer  setTranslation:CGPointZero inView:_MaincontrollerView];
    
    //根据手势的状态做不同的操作
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
        { //禁用向左移动
            CGFloat translateX=translate.x;
            CGFloat ViewX=_MaincontrollerView.frame.origin.x;
            if(translateX+ViewX<0){
                return;
            }
            _MaincontrollerView.transform=CGAffineTransformTranslate(_MaincontrollerView.transform, translate.x, 0);
            
           
            
        }
           break;
        case UIGestureRecognizerStateEnded:
        {
            CGFloat des=60;
            CGFloat offsetX=_MaincontrollerView.frame.origin.x;
            CGFloat widthX=_MaincontrollerView.frame.size.width*0.5;
            if(offsetX >widthX){
                [UIView animateWithDuration:0.3 animations:^{
                     _MaincontrollerView.transform=CGAffineTransformMakeTranslation(widthX*2-des, 0);
                }];
                break;

            }
        }

        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:{
            
            [UIView animateWithDuration:0.2 animations:^{
                _MaincontrollerView.transform=CGAffineTransformIdentity;
            }];
             
            
        }
            break;
            
        default:
            break;
    }
    
    
}


    @end
