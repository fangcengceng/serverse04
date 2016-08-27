//
//  ContactModel.m
//  联系人列表
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ContactModel.h"

@implementation ContactModel
-(instancetype)initContactWithDic:(NSDictionary *)dic{
    if(self= [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
    
    
}
+(instancetype)contactWithDic:(NSDictionary *)dic{
    
    return [[self alloc]initContactWithDic:dic];
    
}

@end
