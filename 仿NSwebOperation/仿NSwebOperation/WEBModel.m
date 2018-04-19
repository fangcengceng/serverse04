//
//  WEBModel.m
//  仿NSwebOperation
//
//  Created by codygao on 16/8/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "WEBModel.h"

@implementation WEBModel
+(instancetype)initwebModel:(NSDictionary *)dic{
    WEBModel *model =[[WEBModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
@end
