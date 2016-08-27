
//
//  HMCatogryModel.m
//  JASON数据
//
//  Created by codygao on 16/8/6.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMCatogryModel.h"
#import "MTSpusModel.h"
@implementation HMCatogryModel{
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if([key isEqualToString:@"spus"]){
        NSArray<NSDictionary *> *foodArray=value;
        NSMutableArray *array=[NSMutableArray array];
        [foodArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            MTSpusModel *model=[[MTSpusModel alloc] init];
            [model setValuesForKeysWithDictionary:obj];
            [array addObject:model];
            
            
        }];
        [super setValue:array forKey:@"spus"];
    }
    

}
@end
