//
//  ViewController.m
//  scrollView约束练习
//
//  Created by codygao on 16/8/6.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];

}
-(void)setupUI{
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    scrollView.backgroundColor=[UIColor redColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.equalTo(self.view);
    }];
    
    
}
@end
