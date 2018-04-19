//
//  downLoadOperation.h
//  NSOperation代理传值
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@class downLoadOperation;
@protocol downLoadOperationDelegate <NSObject>

-(void)downLoadOperationdidfinishidown:(downLoadOperation*)downop image:(UIImage *) imag1 andImag:(UIImage *)imag2;

@end

@interface downLoadOperation : NSOperation
@property(nonatomic,copy) NSString *urlName1 ,*urlName2;
@property(nonatomic,weak)id <downLoadOperationDelegate>delegate;
@end
