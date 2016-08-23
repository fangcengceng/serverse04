//
//  DownLoadOP.h
//  block传值
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownLoadOPDelegate <NSObject>

-(void)downloadDidFinishdownload:(NSString *)str;

@end

@interface DownLoadOP : NSOperation
@property(nonatomic,weak)id <DownLoadOPDelegate>delegate;
@property(nonatomic,copy)NSString *URLName;
@property(nonatomic,copy)void(^myblock)(NSString *mima);
@end
