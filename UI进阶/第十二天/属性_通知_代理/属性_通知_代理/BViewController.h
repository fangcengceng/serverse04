//
//  BViewController.h
//  属性_通知_代理
//
//  Created by codygao on 16/8/15.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BViewController;
@protocol BViewControllerDelegate <NSObject>
@optional
-(void)bviewcontroller:(BViewController*)b andpass:(NSString *) pass;

@end
@interface BViewController : UIViewController
@property(nonatomic,weak) id<BViewControllerDelegate> delegate;
@property(nonatomic,copy) NSString *str;
@end
