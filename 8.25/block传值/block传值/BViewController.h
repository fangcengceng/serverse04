//
//  BViewController.h
//  block传值
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BViewController : UIViewController
@property (nonatomic,copy) void(^block)(NSString *str);
@property(nonatomic,copy)NSString *str;

@end
