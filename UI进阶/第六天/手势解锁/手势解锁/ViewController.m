//
//  ViewController.m
//  手势解锁
//
//  Created by codygao on 16/7/31.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDemoView.h"
#import "SVProgressHUD.h"

@interface ViewController ()<HMDemoViewDelegate>
@property (weak, nonatomic) IBOutlet HMDemoView *demoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView=[[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"Home_refresh_bg"]];
    imageView.frame=self.view.bounds;
    [self.view insertSubview:imageView atIndex:0];
    _demoView.backgroundColor=[UIColor clearColor];
    _demoView.delegate=self;
    
}
-(void)makeSure:(HMDemoView *)demoView didFinishPassWord:(NSString *)pashWord{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    //读取密码
    NSString *savePass=[defaults objectForKey:@"HMDemoWord"];
    
    //判断是否是第一次
    if(savePass.length==0){
        [defaults setObject:pashWord forKey:@"HMDemoWord"];
        [SVProgressHUD showSuccessWithStatus:@"保存密码成功"];
       // [demoView clearScreen];
        //[SVProgressHUD dismiss];
        
        return;
    }
    if([savePass isEqualToString:pashWord]){
        
        [SVProgressHUD showSuccessWithStatus:@"密码正确请登录" ];
        [demoView clearScreen];
        //[SVProgressHUD dismiss];
    }else{
        [SVProgressHUD showInfoWithStatus:@"输入错误，请重试"];
       // [SVProgressHUD dismiss];
        //要想调用这个方法，需要在view的。h中声明
        [demoView clearScreen];
    }
    
    
    
}
@end
