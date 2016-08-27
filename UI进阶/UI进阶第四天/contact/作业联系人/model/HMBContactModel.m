//
//  HMBContactModel.m
//  作业联系人
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMBContactModel.h"
#define kAge @"kAge"
#define kName @"kName"
#define kTel @"kTel"

@implementation HMBContactModel
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_age forKey:kAge];
    [aCoder encodeObject:_name forKey:kName];
    [aCoder encodeObject:_tel forKey:kTel];
    
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        _name = [aDecoder decodeObjectForKey:kName];
        _age=[aDecoder decodeIntegerForKey:kAge];
        _tel=[aDecoder decodeObjectForKey:kTel];
    }
    
    
    return self;
}
@end
