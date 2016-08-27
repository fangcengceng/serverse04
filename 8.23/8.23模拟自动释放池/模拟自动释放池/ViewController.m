//
//  ViewController.m
//  模拟自动释放池
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //如果不加autoreleasepool 会造成cpu的暴涨，因为创建的对象来不及及时销毁；所以要添加自动释放池
    for(NSInteger i  =  0; i<1000000; i++){
        @autoreleasepool {
            
            NSString *str = @"hello word";
            [ str stringByAppendingFormat:@"%zd", i];
            [str uppercaseString];
            NSLog(@"%@",str);
            
        }
    }
    
    
}

@end
