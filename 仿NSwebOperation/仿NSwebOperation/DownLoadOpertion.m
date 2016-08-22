//
//  DownLoadOpertion.m
//  仿NSwebOperation
//
//  Created by codygao on 16/8/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "DownLoadOpertion.h"
@interface DownLoadOpertion()


@end;
@implementation DownLoadOpertion{
    
    NSOperationQueue * _queue;
}
//
-(void)main{
//    DownLoadOpertion *op = [[DownLoadOpertion alloc] init];
    //在自定义操作中下载图片；
    NSURL *url = [NSURL URLWithString:self.urlName];
    NSData *data = [NSData dataWithContentsOfURL:url];
    //UIimage在UIKit框架中，所以需要添加UIKit框架；
    UIImage *image = [UIImage imageWithData:data];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.myblock(image);
    }];
    
    }

@end
