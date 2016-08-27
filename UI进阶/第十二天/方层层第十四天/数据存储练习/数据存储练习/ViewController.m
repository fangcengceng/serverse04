//
//  ViewController.m
//  数据存储练习
//
//  Created by codygao on 16/8/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    [self demo1];
//    [self demo2];
//    [self demo3];
//    [self demo4];
     [self demo5];
     [self demo6];
}
#pragma mark plist文件存储
-(void)demo1{
    NSArray * array = @[@100,@200,@"djfskdj"];
    //存储到doc上
    NSString * docPath = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES).lastObject;
    NSString * filePath = [docPath stringByAppendingString:@"s.plist"];
    NSLog(@"%@",filePath);
    [array writeToFile:filePath atomically:YES];
    

    
}
-(void)demo2{
    NSString * docPath = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES).lastObject;
    NSString * filePath = [docPath stringByAppendingString:@"s.plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",array);
    
    
}


#pragma  mark 系统偏好设置,setVluel
-(void)demo3{
   //获取系统偏好设置
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    BOOL isright = YES;
    NSString *str = @"zhangsan";
    [def setBool:isright forKey:@"dui"];
    [def setObject:str forKey:@"name"];
  
    
}
-(void)demo4{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
   NSString * s = [def valueForKey:@"name"];
    BOOL is = [def boolForKey:@"dui"];
    NSLog(@"%@%zd",s,is);
}

#pragma mark 自定义结档，归档
-(void)demo5{
    Person *p1= [[Person alloc] init];
    p1.name = @"lisi";
    p1.array = @[@2,@"djflsjdflasjdf;l"];
    p1.age = 10;
    
    //归档结档的关键字是nskey.....
    NSString *docpath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory , NSUserDomainMask, YES).lastObject;
    NSString *filePaht = [docpath stringByAppendingPathComponent:@"c.doc"];
    [NSKeyedArchiver archiveRootObject:p1 toFile:filePaht];
    NSLog(@"%@",filePaht);
    
    
}
-(void)demo6{
    NSString *docpath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory , NSUserDomainMask, YES).lastObject;
    NSString *filePaht = [docpath stringByAppendingPathComponent:@"c.doc"];
    Person * p1 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePaht];
    NSLog(@"%@",p1.array);
    
    
}

@end
