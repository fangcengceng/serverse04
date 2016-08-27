//
//  HMPlayController.m
//  酷我
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMPlayController.h"

@interface HMPlayController ()

@end

@implementation HMPlayController
//重写这个方法，可以让手势拖拽显示的是播放的界面。而不是黑色的一片；
//-(instancetype)init{
//    if(self =[super init]){
//        self.modalPresentationStyle= UIModalPresentationCustom ;
//    }
//    return self;
//}


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    //                   参数传nil                     参数串nil
    if(self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        self.modalPresentationStyle= UIModalPresentationCustom ;
    }
    return self;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.view.backgroundColor=[UIColor redColor];
    
}

- (void)setupUI {
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:pan];

}
-(void)panAction:(UIPanGestureRecognizer *)recognizer{
     //获取偏移量，根据偏移量计算旋转角度
    CGPoint translate = [recognizer translationInView:self.view];
    CGFloat angel=translate.x/self.view.bounds.size.width*M_PI_4;
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            //修改锚点
            //修改position
            self.view.layer.anchorPoint=CGPointMake(0.5, 1.5);
            self.view.layer.position=CGPointMake(self.view.bounds.size.width*0.5,self.view.bounds.size.height*1.5);

         case UIGestureRecognizerStateChanged:
            
          recognizer.view.transform=CGAffineTransformMakeRotation(angel);
            break;
          
         case UIGestureRecognizerStateEnded:
            if(ABS(angel)>0.32){
                //结束的时候，让viewdismiss
                [self dismissViewControllerAnimated:YES completion:nil];
                break;
            }
            
         case UIGestureRecognizerStateCancelled:
         case UIGestureRecognizerStateFailed:
        {
            //手势不能识别的时候保持停留在这个view上。也就是让leyer锚点和position恢复
           [UIView animateWithDuration:0.25 animations:^{
               self.view.transform=CGAffineTransformIdentity;
           } completion:^(BOOL finished) {
               
               recognizer.view.layer.anchorPoint = CGPointMake(0.5,0.5);
               recognizer.view.layer.position=CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5);
               
           }];
            
        }
            break;
        default:
            break;
    }
    
    
    
    
    
    
}
@end
