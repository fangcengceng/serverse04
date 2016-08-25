//
//  HMPerson.h
//  jason演练
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMPerson : NSObject
@property(nonatomic,strong)NSString *name ,*age ,*sex;
+(instancetype)personWithdic :(NSDictionary *)dic;
@end
