//
//  DownLoadOpertion.m
//  仿NSwebOperation
//
//  Created by codygao on 16/8/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "DownLoadOpertion.h"
@interface DownLoadOpertion()
//这两个是用来实现快速定义类方法的，只需要给外界提供一个借口，完成图片下载，和回调，外界可以直接调用。不用关心内部怎么实现的
@property(nonatomic,copy) NSString *strName;

@property(nonatomic,copy)void(^finishblock)(UIImage * image);


@end;
@implementation DownLoadOpertion{
    
    NSOperationQueue * _queue;
}
//
-(void)main{
#pragma 定义对外的属性，实现异步图片的下载；
   // [self demo1];
#pragma 定义方法，提供给外界借口，实现异步图片的下载；
    //能这样直接赋值给self.strName ，是因为先走类方法；
   
        NSURL *url = [NSURL URLWithString:self.strName];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *imag = [UIImage imageWithData:data];
        NSLog(@"刷新之前 == %@",[NSThread currentThread]);
        //回到主函数主刷新UI；
    if(self.finishblock !=nil){
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.finishblock(imag);
        }];
    }
   
    
    
}
//#pragma 定义方法，提供给外界借口，实现异步图片的下载；

+(instancetype)dodownload:(NSString*)str finishedBlock:(void(^)(UIImage *imag))finishblock{
    DownLoadOpertion *op = [[DownLoadOpertion alloc] init];
    
    op.strName = str;
    op.finishblock =finishblock;
    
    return op;
}

-(void)demo1{
    
    //在自定义操作中下载图片；
    NSURL *url = [NSURL URLWithString:self.urlName];
    NSData *data = [NSData dataWithContentsOfURL:url];
    //UIimage在UIKit框架中，所以需要添加UIKit框架；
    UIImage *image = [UIImage imageWithData:data];
    NSAssert(self.myblock != nil, @"代码块不能为空",self.myblock);
    //if(self.myblock !=nil){
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.myblock(image);
    }];
    //}
}
@end
