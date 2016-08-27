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

@implementation QQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
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
