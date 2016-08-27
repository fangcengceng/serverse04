//
//  AppDelegate.m
//  作业联系人
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"ContactViewController" bundle:nil];
    UIViewController *viewController=[storyBoard instantiateInitialViewController];
   
    
    self.window.rootViewController=viewController;
    [self.window makeKeyAndVisible];

    
    
    return YES;
}


@end
