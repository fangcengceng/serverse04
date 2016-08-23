//
//  DownLoadOP.m
//  block传值
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "DownLoadOP.h"

@implementation DownLoadOP
-(void)main{
    
    
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        if(self.myblock !=nil){
            self.myblock(self.name);
        }
    }];
    NSString *delegatstr = @"xxxx.png";
    if([self.delegate respondsToSelector:@selector(downloadDidFinishdownload:)]){
        [self.delegate downloadDidFinishdownload:delegatstr];
    }
    
}


@end
