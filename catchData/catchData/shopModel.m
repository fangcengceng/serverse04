//
//  shopModel.m
//  catchData
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "shopModel.h"

@implementation shopModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
+(instancetype)shopWithdic:(NSDictionary *)dic{
    shopModel *shop = [[self alloc] init];
    [shop setValuesForKeysWithDictionary:dic];
    return shop;
}
@end
