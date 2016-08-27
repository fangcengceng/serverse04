//
//  MTCAtagoryModel.m
//  FCCMTApp
//
//  Created by codygao on 16/8/7.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTCAtagoryModel.h"
#import "MTFoodsModel.h"
@implementation MTCAtagoryModel
-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if([key isEqualToString:@"spus"]){
        NSArray<NSDictionary*> *smallArray = value;
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        [smallArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
          
            MTFoodsModel *foodModel = [[MTFoodsModel alloc] init];
            [foodModel setValuesForKeysWithDictionary:obj];
            
            [tempArray addObject:foodModel];
            
            
        }];
        [super setValue:tempArray forKey:@"spus"];
        
    }
    
    
    
    
    
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
@end
