//
//  HMPerson.h
//  归档存档
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMPerson : NSObject<NSCoding>
@property(nonatomic,weak)NSString *name;
@property(nonatomic,assign)float tel;
@property(nonatomic,assign)NSInteger  age;


@end
