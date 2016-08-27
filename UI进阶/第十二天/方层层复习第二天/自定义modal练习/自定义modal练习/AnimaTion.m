//
//  AnimaTion.m
//  自定义modal练习
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "AnimaTion.h"

typedef enum: NSInteger{
        animateprenstent,
        animatedismiss,
}animateType;
@interface AnimaTion()<UIViewControllerAnimatedTransitioning>
@property(nonatomic,assign)animateType typy;

@end
@implementation AnimaTion
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    NSLog(@"1");
    self.typy = animateprenstent;
    return self;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
      NSLog(@"2");
    _typy = animatedismiss;
    return self;
   
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 3;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //获取转场动画的环境
    UIView *containtView = [transitionContext containerView];
    //获取转场的controller
    UIViewController *fromVC= [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
   
    //[containtView addSubview:fromVC.view];
    if(self.typy == animateprenstent){
        //需要将tovc的view添加到containtvc 上面
        [containtView addSubview:toVC.view];
          toVC.view.transform = CGAffineTransformMakeTranslation(0, -containtView.bounds.size.height);
    [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
        
        toVC.view.transform = CGAffineTransformIdentity;
        
        NSLog(@"11");
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
    }else{
        //使用酷我的锚点
        fromVC.view.layer.anchorPoint = CGPointMake(0.5, 2);
        fromVC.view.layer.position = CGPointMake(containtView.bounds.size.width*0.5, containtView.bounds.size.height*2);
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            fromVC.view.transform = CGAffineTransformMakeRotation(M_PI_2);
            
        } completion:^(BOOL finished) {
           fromVC.view.transform = CGAffineTransformIdentity;
            NSLog(@"22");
           [transitionContext completeTransition:YES];
            
        }];
        
        
        
        
        
        
    }
    
}
@end
