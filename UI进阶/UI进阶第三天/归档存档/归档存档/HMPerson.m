//
//  HMPerson.m
//  归档存档
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMPerson.h"
#define HMKeyName @"HMKeyName"
#define HMKeyAge @"hmkeyage"
#define HMKeyTel @"hmkeytel"


@implementation HMPerson
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:HMKeyName];
    [aCoder encodeInteger:_tel forKey:HMKeyTel];
    [aCoder encodeFloat:_age forKey:HMKeyAge];
 
    
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
    _age=[aDecoder decodeIntegerForKey:HMKeyAge];
    _name=[aDecoder decodeObjectForKey:HMKeyName];
    _tel=[aDecoder decodeFloatForKey:HMKeyTel];
    }
    return self;
}

@end
