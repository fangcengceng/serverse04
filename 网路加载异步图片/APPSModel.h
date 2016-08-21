//
//  APPSModel.h
//  网路加载异步图片
//
//  Created by codygao on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPSModel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy) NSString *download;
@property(nonatomic,copy) NSString *icon;
//"name" : "捕鱼达人2",
//"download" : "9982万",
//"icon" : "http:\

+(instancetype)appsModelWithDic:(NSDictionary *)dic;
@end
