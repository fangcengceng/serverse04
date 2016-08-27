//
//  AppDelegate.m
//  加载控制器的三种方法
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "AppDelegate.h"
#import "redViewController.h"
#import "lightViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//  //方法一：使用code形式
//    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    UIViewController *vc=[[UIViewController alloc]init];
//    self.window.rootViewController=vc;
//    [self.window makeKeyAndVisible];
    
    
    //方法二：使用storyboard
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard *storyboard=[UIStoryboard   storyboardWithName:@"MYStoryBoard" bundle:[NSBundle mainBundle]];
  //  UITableViewController *vc= [storyboard instantiateViewControllerWithIdentifier:@"redsb"];
    UITableViewController *vc=[storyboard instantiateViewControllerWithIdentifier:@"tab"];
    UIViewController *red=[storyboard instantiateViewControllerWithIdentifier:@"redsb"];
    UINavigationController *redvc=[[UINavigationController alloc] initWithRootViewController:red];
    //要想实现跳转控制器必须是导航控制器
    

    self.window.rootViewController=redvc;
    [self.window makeKeyAndVisible];
    
  
    
    
   
    return YES;
}


@end
