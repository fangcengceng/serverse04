//
//  HMBContactModel.m
//  作业联系人
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMBContactModel.h"
#define HMBName @"HMBName"
#define HMBTel  @"HMBTel"
#define HMBAge  @"HMBAge"
@implementation HMBContactModel
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:HMBName];
    [aCoder encodeObject:_tel forKey:HMBTel];
    [aCoder encodeInteger:_age forKey:HMBAge];
    
    
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        
        _name=[aDecoder decodeObjectForKey:HMBName];
        _tel=[aDecoder decodeObjectForKey:HMBTel];
        _age=[aDecoder decodeIntegerForKey:HMBAge];
        
        
    }
    return self;
    
}
@end
