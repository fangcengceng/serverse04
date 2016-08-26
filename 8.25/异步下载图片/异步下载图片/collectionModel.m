//
//  collectionModel.m
//  异步下载图片
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "collectionModel.h"

@implementation collectionModel
+(instancetype)collectionWithdic:(NSDictionary *)dic{
    collectionModel *model = [[collectionModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
