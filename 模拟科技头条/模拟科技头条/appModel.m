//
//  appModel.m
//  模拟科技头条
//
//  Created by codygao on 16/8/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "appModel.h"

@implementation appModel
+(instancetype)appWithdic:(NSDictionary *)dic{
    appModel *model = [[appModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@",self.title];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
