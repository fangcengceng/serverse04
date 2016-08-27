//
//  HMCatogryModel.h
//  JASON数据
//
//  Created by codygao on 16/8/6.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MTSpusModel;

@interface HMCatogryModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign)NSArray <MTSpusModel*> *spus;
@end
