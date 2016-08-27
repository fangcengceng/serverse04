//
//  RedViewController.m
//  containerView
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "RedViewController.h"
#import "GreenViewController.h"
#import "AnmiTranslate.h"
@interface RedViewController ()
@property(nonatomic,strong)AnmiTranslate * anmi;
@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark 自定义modal
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    GreenViewController *green = [[NSBundle mainBundle] loadNibNamed:@"Green" owner:nil options:nil].lastObject;
    
    [self presentViewController:green animated:YES completion:nil];
    
    
    
    
    
}
@end
