//
//  HMPerson.m
//  jason演练
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMPerson.h"

@implementation HMPerson
+(instancetype)personWithdic :(NSDictionary *)dic{
    HMPerson *person = [[HMPerson alloc] init];
    [person setValuesForKeysWithDictionary:dic];
    return person;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
