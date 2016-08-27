//
//  ViewController.m
//  快速计算的分类
//
//  Created by codygao on 16/8/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Formula.h"
@interface ViewController ()<UITableViewDelegate>
@property(nonatomic,weak)UIImageView * tudouView;
@property(nonatomic,weak)UITableView *tv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    tv.backgroundColor = [UIColor redColor];
    tv.backgroundColor = [UIColor clearColor];
    tv.delegate = self;
    [self.view addSubview:tv];
    _tv = tv;
    UIImageView *view = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"tudu"]];
    view.frame = CGRectMake(0, -200, self.view.frame.size.width, 400);
    [self.view addSubview:view];
    _tudouView =view;
}

#pragma mark 利用分类计算
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    YHValue  resultValue = YHValueMake(1,0);
    YHValue consValue = YHValueMake(10, -375);
    NSLog(@"%f",offsetY);
    
   _tudouView.alpha = [NSObject resultWithConsult:offsetY andResultValue:resultValue andConsultValue:consValue];
}


#pragma mark 利用滚动的contentoffset计算；
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//    CGPoint offset = _tv.contentOffset; //scrollView.contentOffset;

//    
//    CGFloat offsetY = offset.y;
//    NSLog(@"%f",offsetY);
//    if(offsetY<0){
//        _tudouView.transform = CGAffineTransformMakeTranslation(0, -offsetY);
//    }
//    
//}
@end
