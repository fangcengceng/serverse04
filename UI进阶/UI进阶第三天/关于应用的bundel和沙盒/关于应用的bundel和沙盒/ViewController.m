//
//  ViewController.m
//  关于应用的bundel和沙盒
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //都是在包中，nsbundler中获取
//    //获取bundle，获取应用的包路径，一般不对其进行操作
//    NSString *bundlePath=[[NSBundle mainBundle] bundlePath];
//    NSLog(@"%@",bundlePath);
//   //找不到路径
//    NSURL  *bundleurl=[[NSBundle mainBundle] bundleURL];
//    NSLog(@"%@",bundleurl);
//    //获取应用的info.plist文件内容，本质上是字典
//    NSDictionary *dict=[[NSBundle mainBundle] infoDictionary ];
//    NSLog(@"%@",dict);
//    
    
    //沙盒
    /**
     获取沙盒的根路径,字符串。里面有三个文件夹为一下三种
     1、获取document路径
     2、获取catches路径缓存路径
     3、获取temp临时路径
     
     
     */
//    NSString *homePath=NSHomeDirectory();
//    NSLog(@"%@",homePath);
    //document 要查询的路径           用户权限           是否展开路径 本质是一个数组，所以要取出firstObject/lastObject
//    NSString *docPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//    NSLog(@"%@",docPath);
//    NSString *docpath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
//    NSLog(@"%@",docpath);
    //获取缓存路径
    NSString *catchPath=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    //获取temp路径
    NSString *tmpPath=NSTemporaryDirectory();
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
