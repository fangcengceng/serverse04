//
//  MTCatagoryModel.m
//  jason数据练习
//
//  Created by codygao on 16/8/7.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTCatagoryModel.h"
#import "MTspusModel.h"
@implementation MTCatagoryModel
-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if([key isEqualToString:@"spus"]){
     
        NSArray<NSDictionary*>  *foodArray=value;
        NSMutableArray<MTspusModel*> *smallArray = [NSMutableArray array];
        [foodArray enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            MTspusModel *foodModel = [[MTspusModel alloc] init];
            [foodModel setValuesForKeysWithDictionary:obj];
            [smallArray addObject:foodModel];
        }];
         [super setValue:smallArray forKey:@"spus"];
        
    }
   

}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
}
@end
