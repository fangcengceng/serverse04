//
//  ViewController.m
//  酷我
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMPlayController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button=[[UIButton alloc] init];;
    button.bounds=CGRectMake(0, 0, 40, 20);
    button.backgroundColor=[UIColor blueColor];
    [button setTitle:@"播放" forState:UIControlStateNormal];
    button.center=self.view.center;
    [button addTarget:self action:@selector(clickPlay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}
-(void)clickPlay{
    HMPlayController *playController=[[HMPlayController alloc] init];
    [self presentViewController:playController animated:YES completion:nil];
    
    
    
}
@end
