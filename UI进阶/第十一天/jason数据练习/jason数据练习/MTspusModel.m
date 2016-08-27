//
//  MTspusModel.m
//  jason数据练习
//
//  Created by codygao on 16/8/7.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTspusModel.h"

@implementation MTspusModel
-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if([key isEqualToString:@"description"]){
        [super setValue:value forKey:@"desc"];
    }
    
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
