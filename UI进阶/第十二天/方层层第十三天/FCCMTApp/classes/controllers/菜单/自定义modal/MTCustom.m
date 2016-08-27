//
//  MTCustom.m
//  FCCMTApp
//
//  Created by codygao on 16/8/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTCustom.h"
#import "MTPresentationController.h"
@interface MTCustom()


@end

@implementation MTCustom


- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{

    MTPresentationController * presentationController = [[MTPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return presentationController;
}

@end
