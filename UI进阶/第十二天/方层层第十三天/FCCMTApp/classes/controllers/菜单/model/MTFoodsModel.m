//
//  MTFoodsModel.m
//  FCCMTApp
//
//  Created by codygao on 16/8/7.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTFoodsModel.h"

@implementation MTFoodsModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if([key isEqualToString:@"description"]){
        
        [super setValue:value forKey:@"desc"];
    }
    
}

@end
