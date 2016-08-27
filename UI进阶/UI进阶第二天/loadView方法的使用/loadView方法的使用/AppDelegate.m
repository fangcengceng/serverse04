//
//  AppDelegate.m
//  loadView方法的使用
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "AppDelegate.h"
#import "CZViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    CZViewController *vc=[[CZViewController alloc]init];
    self.window.rootViewController=vc;
    [self.window makeKeyAndVisible];    return YES;
}

@end
