//
//  AppDelegate.m
//  侧滑练习
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "AppDelegate.h"
#import "RESideMenu.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "ContainerViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ContainerViewController *containerController = [[ContainerViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:containerController];
    //注意：target并不一定非得是自己：这个方法在viewController的分类中，只要是继承自uiviewController 的类都可以实现分类的方法
    containerController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleDone target:containerController action:@selector(presentLeftMenuViewController:)];
    containerController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStyleDone target:containerController action:@selector(presentRightMenuViewController:)];
  
    LeftViewController *left = [[LeftViewController alloc] init];
    RightViewController *right = [[RightViewController alloc] init];
    RESideMenu * menu = [[RESideMenu alloc] initWithContentViewController:nav leftMenuViewController:left rightMenuViewController:right];
    
    self.window.rootViewController = menu;
    
    [self.window makeKeyAndVisible];

    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
