//
//  HMBDetailController.h
//  作业联系人
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMBContactModel,HMBDetailController;
//代理1步
@protocol HMBDetailControllerDelegate <NSObject>
@optional
//保存代理方法
-(void)detailControllerDidFinishEditingContact:(HMBDetailController*)detailViewController;
//添加代理方法
-(void)detailControllerAddModel:(HMBDetailController *)controller model:(HMBContactModel *)newModel;
//一个代理可以拥有多个代理方法，保存和添加本质上都是逆向传值。
@end



@interface HMBDetailController : UITableViewController
//代理2步
@property(nonatomic,weak)id<HMBDetailControllerDelegate> delegate;
//属性传值，正向传值
@property(nonatomic,strong)HMBContactModel *selmodel;
@end
