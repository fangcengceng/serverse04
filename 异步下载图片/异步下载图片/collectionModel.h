//
//  collectionModel.h
//  异步下载图片
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface collectionModel : NSObject
@property(nonatomic,copy)NSString *name,*icon,*download;
+(instancetype)collectionWithdic:(NSDictionary *)dic;

@end
