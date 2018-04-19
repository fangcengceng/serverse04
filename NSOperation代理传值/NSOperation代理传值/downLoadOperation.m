//
//  downLoadOperation.m
//  NSOperation代理传值
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "downLoadOperation.h"

@implementation downLoadOperation
-(void)main{
    NSURL *url1 = [NSURL URLWithString:self.urlName1];
    NSURL *url2 = [NSURL URLWithString:self.urlName2];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    NSData *data2 = [NSData dataWithContentsOfURL:url2];
    UIImage *img1 = [UIImage imageWithData:data1];
    UIImage *ima2 =[UIImage imageWithData:data2];
    if([self.delegate respondsToSelector:@selector(downLoadOperationdidfinishidown:image:andImag:)]){
        [self.delegate downLoadOperationdidfinishidown:self image:img1 andImag:ima2];
    }
    
    
}

@end
