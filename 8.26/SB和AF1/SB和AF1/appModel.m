//
//  appModel.m
//  AF和SB
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "appModel.h"

@implementation appModel
+(instancetype)appWithdic:(NSDictionary *)dic{
    appModel *app = [[self alloc] init];
    [app setValuesForKeysWithDictionary:dic];
    return app;
}
@end
