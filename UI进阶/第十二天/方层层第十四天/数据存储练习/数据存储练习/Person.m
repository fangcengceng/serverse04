//
//  Person.m
//  数据存储练习
//
//  Created by codygao on 16/8/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeObject:_array forKey:@"array"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        _name = [aDecoder decodeObjectForKey:@"name"];
        _array = [aDecoder decodeObjectForKey:@"array"];
        _age =  [aDecoder decodeIntegerForKey:@"age"];   
    }
    return self;
}
@end
