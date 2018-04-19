//
//  shopModel.h
//  catchData
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shopModel : NSObject
@property(nonatomic,copy)NSString *shop_name;
@property(nonatomic,copy)NSString *logo_url;
@property(nonatomic,assign) NSInteger *saled_month;
+(instancetype)shopWithdic:(NSDictionary *)dic;
@end
