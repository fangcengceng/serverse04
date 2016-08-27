//
//  AnmiTranslate.m
//  containerView
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "AnmiTranslate.h"
@interface AnmiTranslate()<UIViewControllerAnimatedTransitioning>

@end

@implementation AnmiTranslate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self;
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self;
    
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 3;
    
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
      //transitionContext 就是所有转场动画的上下文transitionView
    UIView *containtView = [transitionContext containerView];
    //获取需要转场的动画Controller,有两个from和to
    //   UITransitionContextToViewControllerKey
    //   UITransitionContextFromViewControllerKey
    UIViewController *fromvc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *tovc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
 

    //转场动画环境提交
    [transitionContext completeTransition:YES];
    
    
}

@end
