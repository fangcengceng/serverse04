//
//  ViewController.m
//  偏好设置存储
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *cun;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)cun:(id)sender {
    //不用我们自己创建路径系统已将创建好了一个单例队形
   // NSUserDefaults
    BOOL isMan=YES;
    float fontsize=20;
    NSString *str=@"meituan";
    //获取偏好设置对象
    NSUserDefaults *de=[NSUserDefaults standardUserDefaults];
    //存储数据
    [de setBool:isMan forKey:@"HMIsMan"];
    [de setInteger:fontsize forKey:@"HMFont"];
    [de setObject:str forKey:@"HMstr"];
    //3.同步
    [de synchronize];
    
}

- (IBAction)qu:(id)sender {
    //获取路径
    NSUserDefaults *de=[NSUserDefaults standardUserDefaults];
    BOOL man =[de boolForKey:@"HMIsMan"];
    float s=[de floatForKey:@"HMFont"];
    NSString *str=[de stringForKey:@"HMstr"];
    NSLog(@"%@--%zd--%f",str,man,s);
    
    
}

@end
