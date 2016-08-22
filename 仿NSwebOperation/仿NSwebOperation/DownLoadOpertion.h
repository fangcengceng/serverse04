//
//  DownLoadOpertion.h
//  仿NSwebOperation
//
//  Created by codygao on 16/8/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@interface DownLoadOpertion : NSOperation
@property(nonatomic,copy)NSString *urlName;
@property(nonatomic,copy)void(^myblock)(UIImage *image);
@end
