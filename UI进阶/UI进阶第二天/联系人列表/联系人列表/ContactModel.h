//
//  ContactModel.h
//  联系人列表
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactModel : NSObject
@property(nonatomic ,weak)NSString *name, *tel;
-(instancetype)initContactWithDic:(NSDictionary *)dic;
+(instancetype )contactWithDic:(NSDictionary *)dic;
@end
