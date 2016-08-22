//
//  WEBModel.h
//  仿NSwebOperation
//
//  Created by codygao on 16/8/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WEBModel : NSObject
@property(nonatomic,copy)NSString *name, *download,*icon;
+(instancetype)initwebModel:(NSDictionary *)dic;

//"name" : "保卫萝卜",
//"download" : "8582万",
//"icon" :
@end
