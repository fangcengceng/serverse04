//
//  Person.h
//  数据存储练习
//
//  Created by codygao on 16/8/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "UIKit/UIKit.h"
@interface Person : NSObject<NSCoding>
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,strong) NSArray * array;
@property(nonatomic,copy) NSString  *name;

@end
