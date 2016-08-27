//
//  HMAnimation.m
//  CustomModal
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMAnimation.h"
@interface HMAnimation()  <UIViewControllerAnimatedTransitioning>

@end
@implementation HMAnimation
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    //从哪里显示，大部分情况下presting和sourse都是同一个控制器。
    return self;
    
}
//返回动画的市场
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.25;
    
}

  //动画方法的具体实现
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  
    UIView *containerView = [transitionContext containerView];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVc.view.frame = containerView.bounds;

    [containerView addSubview:toVc.view];
    

    toVc.view.layer.position = CGPointMake(toVc.view.bounds.size.width * 0.5, toVc.view.bounds.size.height * 1.5);
    toVc.view.layer.anchorPoint = CGPointMake(0.5, 1.5);
    toVc.view.transform = CGAffineTransformMakeRotation(-M_PI_2);

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

        toVc.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {

        toVc.view.layer.anchorPoint = CGPointMake(0.5, 0.5);
        toVc.view.layer.position = containerView.center;
        
    }];
  
    [transitionContext completeTransition:YES];
    
}
@end
