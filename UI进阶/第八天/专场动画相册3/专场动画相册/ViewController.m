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
    [self setupUI];
    self.view.layer.contents=(__bridge id)[UIImage imageNamed:@"yr"].CGImage;
    _index=1;

}
-(void)setupUI{
    UIImageView *imagView=[[UIImageView alloc] initWithFrame:self.view.frame];
    imagView.userInteractionEnabled=YES;
    [self.view addSubview:imagView];
    _imaView =imagView;
    
    
    UISwipeGestureRecognizer *leftG=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    leftG.direction=UISwipeGestureRecognizerDirectionLeft;
    [_imaView addGestureRecognizer:leftG];
    
    
    
    UISwipeGestureRecognizer *rightG=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    rightG.direction=UISwipeGestureRecognizerDirectionRight;
    [_imaView addGestureRecognizer:rightG];

    
}
-(void)swipAction:(UISwipeGestureRecognizer *)recognizer{
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            _index++;
            if(_index>6){
                _index=0;
            }

            break;
          case UISwipeGestureRecognizerDirectionRight:
            _index--;
            if(_index<0){
                _index=6;
            }
            
            break;
        default:
            break;
    }
    
     _imaView.image =[UIImage imageNamed:[NSString stringWithFormat:@"image%zd-1",_index]];
     [UIView transitionWithView:recognizer.view duration:1 options:
   
   UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        
        recognizer.view.layer.contents=(__bridge id _Nullable)_imaView.image.CGImage ;
        
        
    } completion:nil];
}
@end
