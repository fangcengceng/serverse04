//
//  MTPresentationController.m
//  FCCMTApp
//
//  Created by codygao on 16/8/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTPresentationController.h"

@implementation MTPresentationController
-(void)containerViewDidLayoutSubviews{
    //固定步骤
    //获取容器试图
    UIView *containtView = self.containerView;
  // self.containerView.backgroundColor = [UIColor redColor];
  // 获取想要展示的试图
    UIView *presentView = self.presentedView;
  //  presentView.backgroundColor = [UIColor yellowColor];
   // 添加到容器试图
    [containtView addSubview:presentView];
   // 布局子控件
    [presentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo (self.containerView);
        make.height.mas_equalTo (300);
    }];
    
  //添加点按手势，销毁自定义modal.
    //方法一。需要判断点按手势的位置，如果在tableview 上，就直接返回，如果不在tableview上，就dismiss。。。。。将手势添加给containtView .需要转换点按手势的父控件坐标；
    //方法二：添加一个遮照试图、写在containtViewWillLayoutSubview中。
    
    
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickToDismiss:)];
    [containtView  addGestureRecognizer:tapG];
}
-(void)clickToDismiss:(UITapGestureRecognizer *) recognizer{
    //如果不进行判断的直接开始，会在点击tableView的时候也dismiss
    CGPoint translate = [recognizer locationInView:recognizer.view];
    
    [self.presentedView convertPoint:translate toView:self.containerView];
    NSLog(@"%@",NSStringFromCGPoint(translate));
    if(translate.y>444){
        return;
    }
    
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    
    
    
}
@end
