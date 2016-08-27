//
//  QQTabBarController.m
//  QQModelApp
//
//  Created by codygao on 16/7/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQTabBarController.h"

@interface QQTabBarController ()

@end

@implementation QQTabBarController{
    UITapGestureRecognizer *_tapGesture;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加底部标签
    [self setUpChildControllers];
    
   //添加手势
    [self setupPanGesture];
 
}
#pragma mark 添加手势监听事件
-(void)panAction:(UIPanGestureRecognizer *)recognizer{
    //获取偏移量
    CGPoint translate=[recognizer translationInView:recognizer.view];
    //重置偏移量
    [recognizer setTranslation:CGPointZero inView:recognizer.view];
    //根据不同的手势设置状态不同的方法
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
        {
            //禁止向左
            if(translate.x + recognizer.view.frame.origin.x<0){
                return;
            }
            self.view.transform=CGAffineTransformTranslate(self.view.transform, translate.x, 0);
            
            
        }
            break;
        case UIGestureRecognizerStateEnded:{
            CGFloat desDistance=50;
            CGFloat widthW=recognizer.view.frame.size.width;
            if(recognizer.view.frame.origin.x >widthW *0.5){
              recognizer.view.transform =CGAffineTransformMakeTranslation(widthW-desDistance, 0);
                //点按手势如果没有条件直接添加到试图总，会影响底部的标签栏的使用，因为此时点击底部蓝的话，会调用添加手势的方法，父类的点按手势的作为被重写，会无法进行点击
                [self setupTapGesture];
            }
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:{
            [UIView animateWithDuration:0.2 animations:^{
        
                recognizer.view.transform=CGAffineTransformIdentity;
                
            }];
        }
            break;

        default:
            break;
    }


}
-(void)tapAction:(UITapGestureRecognizer *)recognizer{
    //添加tap的作用是为了恢复形变
    if(CGAffineTransformIsIdentity(recognizer.view.transform)){
        return;
    }
    [UIView animateWithDuration:0.2 animations:^{
        recognizer.view.transform=CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        
        [self removeTap:_tapGesture];
    }];
    
    
}
//移除手势
-(void)removeTap:(UITapGestureRecognizer *)recognizer{
    
    [recognizer.view removeGestureRecognizer:_tapGesture];
}
#pragma mark 添加手势
-(void)setupTapGesture{
    UITapGestureRecognizer *tapGesture= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesture];
    _tapGesture=tapGesture;
}
//添加长安
-(void)setupPanGesture{
    UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc] init];
    [panGesture addTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:panGesture];

}

#pragma mark 搭建界面
-(void)setUpChildControllers{
    UIViewController *messageController =  [self controllerWithClassName:@"messageViewController" title:@"消息" image:@"tab_recent_nor"];
    UIViewController *contactController=[self controllerWithClassName:@"contactController" title:@"联系人" image:@"tab_buddy_nor"];
    UIViewController *meController=[self controllerWithClassName:@"SettingController" title:@"设置" image:@"tab_me_nor"];
    UIViewController *qwordController=[self controllerWithClassName:@"QzoneController" title:@"动态" image:@"tab_qworld_nor"];
    
    self.viewControllers=@[messageController,contactController,qwordController,meController];


}
-(UIViewController *)controllerWithClassName:(NSString*)className title:(NSString*)title image:(NSString*)imageName{
    Class cls=NSClassFromString(className);
    UIViewController *vc=[[cls alloc]init];
    
      //增加一个断言，类名写错会在原因中报告出来
    NSAssert([vc isKindOfClass:[UIViewController class]], @"控制器不正确%@",className);
        vc.tabBarItem.title=title;
        vc.tabBarItem.image=[UIImage imageNamed:imageName];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    return nav;
    
}

@end
