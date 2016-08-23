//
//  ViewController.m
//  NSCache类的使用
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSCacheDelegate>
@end

@implementation ViewController{
    //用法与字典基本相同，但是字典的key和value都必须是字符串，而NSCatche 可以是id类型的对象；
    NSCache *_catch;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //必须实例化否则，否则可以存进去，但是读取的时候全部都是nil;
    _catch = [[NSCache alloc] init];
    //_catch.totalCostLimit= 4;
    //模拟最大存储数
     _catch.countLimit = 5;
    //代理方法
    _catch .delegate = self;
    
   
}
- (IBAction)save:(id)sender {
    for(NSInteger i = 0 ;i<10;i++){
        NSString *obj = [NSString stringWithFormat:@"hello%zd",i];
        NSInteger  key = i;
        [_catch setObject:obj forKey:@(key)];
        NSLog(@"存入%@",obj);
    }
}
#pragma 代理方法，只要在被对象被移除的时候就会调用
-(void)cache:(NSCache *)cache willEvictObject:(id)obj{
    NSLog(@"被移除的对象，删除%@",obj);
}
- (IBAction)read:(id)sender {
    for (NSInteger i = 0; i<10; i++) {
        NSInteger key = i;
        NSString *obj = [_catch objectForKey:@(key)];
    NSLog(@"读取%@",obj);
    
    
    }
}
- (IBAction)removeAll:(id)sender {
    
    [_catch removeObjectForKey:@(7)];
   
}
#pragma NSCache 的大坑，存在在removeallobject不可以写在内存警告方法中
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [_catch removeAllObjects];
    
}

@end
