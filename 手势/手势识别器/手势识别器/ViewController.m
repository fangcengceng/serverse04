//
//  ViewController.m
//  手势识别器
//
//  Created by codygao on 16/7/28.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()//<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
- (IBAction)tapclick:(id)sender {
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.numberOfTapsRequired=2;
    //tap.numberOfTouchesRequired=3;
    [_imageView addGestureRecognizer:tap];

}
-(void)tapAction:(UITapGestureRecognizer*)recognizer{
  [UIView animateWithDuration:1 animations:^{
      _imageView.transform=CGAffineTransformMakeScale(0.5, 0.5);
  } completion:^(BOOL finished) {
      _imageView.transform=CGAffineTransformIdentity;
  }];
 
}

- (IBAction)longPress:(id)sender {
    UILongPressGestureRecognizer  *longPress=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction:)];
    //longPress.numberOfTouchesRequired=2;
    longPress.minimumPressDuration=0.6;
    [_imageView addGestureRecognizer:longPress];
    
}
-(void)longAction:(UILongPressGestureRecognizer*)recognizer{
    _imageView.alpha=0.2;
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"长按");
            break;
        case UIGestureRecognizerStateChanged:
            NSLog(@"改变");
            break;
        case UIGestureRecognizerStateEnded:
            NSLog(@"结束");
            break;
        default:
            break;
    }
    
    
}
- (IBAction)swap:(id)sender {
    UISwipeGestureRecognizer *swip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipAction:)];
    swip.direction=UISwipeGestureRecognizerDirectionUp;
    UISwipeGestureRecognizer *down=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipAction:)];
    down.direction=UISwipeGestureRecognizerDirectionDown;
    [_imageView addGestureRecognizer:down];
    [_imageView addGestureRecognizer:swip];
    
}
-(void)swipAction:(UISwipeGestureRecognizer*)recognizer{
    CGFloat distance=0;
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            distance=-50;
            break;
        case UISwipeGestureRecognizerDirectionDown:
            distance=50;
            break;
        default:
            break;
    }
   [UIView animateWithDuration:0.5 animations:^{
       _imageView.transform=CGAffineTransformMakeTranslation(0, distance);
   } completion:^(BOOL finished) {
       [UIView animateWithDuration:0.5 animations:^{
           _imageView.transform=CGAffineTransformIdentity;
       }];
   }];
    
}
- (IBAction)drag:(id)sender {
    UIPanGestureRecognizer *panf=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [_imageView addGestureRecognizer:panf];
}
-(void)pan:(UIPanGestureRecognizer*)recognize{
    CGPoint translate=[recognize translationInView:recognize.view];
    _imageView.transform=CGAffineTransformTranslate(_imageView.transform, translate.x, translate.y);
    [recognize setTranslation:CGPointZero inView:recognize.view];
}
- (IBAction)rotate:(id)sender {
    UIRotationGestureRecognizer *rote=[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotateR:)];
    [_imageView addGestureRecognizer:rote];
}
-(void)rotateR:(UIRotationGestureRecognizer*)recognize{
    CGFloat ange=recognize.rotation;
    _imageView.transform=CGAffineTransformRotate(_imageView.transform, ange);
    recognize.rotation=0;
    
    
}
- (IBAction)pinch:(id)sender {
    UIPinchGestureRecognizer *pinc=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinct:)];
    [_imageView addGestureRecognizer:pinc];
}
-(void)pinct:(UIPinchGestureRecognizer*)recognizer{
    CGFloat scale=recognizer.scale;
    _imageView.transform=CGAffineTransformScale(_imageView.transform, scale, scale);
    recognizer.scale=1;
    
}

@end
