//
//  ViewController.m
//  XYPieChatPractice
//
//  Created by codygao on 16/8/15.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "XYPieChart.h"

@interface ViewController ()<XYPieChartDataSource>
@property(nonatomic,assign)NSArray * array;
@property(nonatomic,weak)XYPieChart *chat;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@2,@34,@67,@1,@33,@77];
    _array = array;
    XYPieChart *chat = [[XYPieChart alloc] initWithFrame:CGRectMake(0, 0, 300, 300) Center:self.view.center Radius:100];
    chat.dataSource = self;
    chat.showLabel  = YES;
    chat.startPieAngle  = M_PI_4;
    chat.animationSpeed = 10;
    
    
    
    [self.view addSubview:chat];
    _chat = chat;
    [chat reloadData];

}
- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index{
    if(index == 1){
      return   _chat.labelColor = [UIColor yellowColor];
    }else{
        return nil;
    }
}
- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index{
    if(index ==2){
        _chat.labelFont = [UIFont systemFontOfSize:20];
    }
    return nil;
}

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart{
    return _array.count;
    
}
- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index{
    return [_array[index] intValue];
    
    
}

@end
