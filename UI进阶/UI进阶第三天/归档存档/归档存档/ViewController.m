//
//  ViewController.m
//  归档存档
//为自定义的类存取数据系统提供的有plist(字典或数组）。nsuserdefault (系统偏好）本质上是字典，但是往往不一定全是数组或自定，所以要自定义类
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

}
- (IBAction)write:(id)sender {
    //创建模型
    HMPerson *p=[[HMPerson alloc] init];
    p.name=@"sdjf;lks";
    p.tel=[@"12" floatValue];
    p.age=[@"1222" integerValue];
    HMPerson *p11=[[HMPerson alloc] init];
    p11.name=@"sdjf;lks";
    p11.tel=[@"12" floatValue];
    p11.age=[@"1222" integerValue];
    //获取路径
    NSString *filPath=[self pathWithfileName:@"XXX.plist"];
    [NSKeyedArchiver archiveRootObject:p11 toFile:filPath];
    NSArray *arr=@[p,p11];
    [NSKeyedArchiver archiveRootObject:arr toFile:[self pathWithfileName:@"ksjfl.plist"]];
    
}
- (IBAction)read:(id)sender {
   // 获取路径
    NSString *filePath=[self pathWithfileName:@"XXX.plist"];
   
 //解当
 //用自定义类来接受
    HMPerson  *pi=[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",pi);
    NSArray *readarray=[NSKeyedUnarchiver unarchiveObjectWithFile:[self pathWithfileName:@"ksji.plist"]];
    
    
    
}

-(NSString *)pathWithfileName:(NSString*)fileName{
    NSString *str=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath=[str stringByAppendingPathComponent:fileName];
    return filePath;
    
}

@end
