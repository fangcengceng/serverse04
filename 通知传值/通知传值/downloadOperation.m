//
//  downloadOperation.m
//  通知传值
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "downloadOperation.h"

@implementation downloadOperation
-(void)main{
    
    NSURL *url = [NSURL URLWithString:self.urlName];
    //转换为二进制数
    NSData *data = [NSData dataWithContentsOfURL:url];
    //将二进制数转换为图片
    UIImage *imag = [UIImage imageWithData:data];
    //利用通知中心发送信息，即imag传递到主线程
    NSString *str = [self.urlName uppercaseString];
    NSDictionary *dic = @{@"imag":imag,@"str":str
                          };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"download" object:nil userInfo:dic];
}

@end
