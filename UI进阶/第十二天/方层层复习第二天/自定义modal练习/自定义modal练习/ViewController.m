//
//  ViewController.m
//  自定义modal练习
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "AnimaTion.h"

@interface ViewController ()
@property(nonatomic,strong)AnimaTion *ani;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = self.view.center;
    [button addTarget:self action:@selector(clickToJump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}
-(void)clickToJump{
    SecondViewController *second = [[SecondViewController alloc] init];
     second.modalPresentationStyle = UIModalPresentationCustom;
    _ani = [[AnimaTion alloc] init];
    second.transitioningDelegate = _ani;
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//    });
//    
    [self presentViewController:second animated:YES completion:nil];
    
    
    
}
@end
