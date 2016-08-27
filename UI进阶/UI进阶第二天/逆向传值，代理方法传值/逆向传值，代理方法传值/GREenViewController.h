//
//  GREenViewController.h
//  逆向传值，代理方法传值

//代理的步骤：声明协议，声明属性，判断并执行，指定代理，遵守协议，实现协议；
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GREenViewController;
@protocol GREenViewControllerdelegate <NSObject>
@optional
-(void)greenViewController:(UIViewController *)greenController  withUserName:(NSString*)name;

@end

@interface GREenViewController : UIViewController

@property(nonatomic,weak)id<GREenViewControllerdelegate> delegate;
@end
