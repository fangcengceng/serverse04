//
//  MTDetaliViewController.h
//  FCCMTApp
//
//  Created by codygao on 16/8/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTFoodsModel.h"
@interface MTDetaliViewController : UIViewController
@property(nonatomic,weak)MTFoodsModel *selectModel;
@property(nonatomic,assign)NSIndexPath * path;
@end
