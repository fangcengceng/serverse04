//
//  appModel.h
//  AF和SB
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface appModel : NSObject
@property(nonatomic,copy)NSString *icon,*name,*download;
+(instancetype)appWithdic:(NSDictionary *)dic;
@end
