//
//  APPSModel.m
//  网路加载异步图片
//
//  Created by codygao on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "APPSModel.h"

@implementation APPSModel
+(instancetype)appsModelWithDic:(NSDictionary *)dic{
    APPSModel *model = [[APPSModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

@end
