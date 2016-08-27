//
//  ViewController.m
//  UUChatPractice
//
//  Created by codygao on 16/8/15.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "UUChart.h"

@interface ViewController ()<UUChartDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    UUChart *chart = [[UUChart alloc] initWithFrame:CGRectMake(0, 0, 375, 667) dataSource:self style:UUChartStyleLine];
  
    [chart showInView:self.view];
  
}

- (NSArray *)chartConfigAxisXLabel:(UUChart *)chart{
    return @[@"hao",@"lsdf"];
    
}
- (NSArray *)chartConfigColors:(UUChart *)chart{
    UIColor *red = [UIColor redColor];
    UIColor *yellow = [UIColor yellowColor];
    return @[red,yellow];
    
}

- (NSArray *)chartConfigAxisYValue:(UUChart *)chart{
    return @[@[@10,@20],@[@20,@9]];
    
}

@end
