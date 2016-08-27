//
//  ViewController.m
//  pagecontroller练习
//
//  Created by codygao on 16/8/15.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>
@property(nonatomic,assign) NSInteger num;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.num = 0;
//    self.view.backgroundColor = [UIColor grayColor];
   //创建pagecontroller
    UIPageViewController *pageController = [[UIPageViewController alloc] initWithTransitionStyle: UIPageViewControllerTransitionStylePageCurl navigationOrientation: UIPageViewControllerNavigationOrientationHorizontal options:nil];
    //一上来就显示的控制器,必须要有否则不显示
    TestViewController *test = [[TestViewController alloc] init];
    [pageController setViewControllers:@[test] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    
    
    //建立父子关系
    [self.view addSubview:pageController.view];
    [self addChildViewController:pageController];
    [pageController didMoveToParentViewController:self];
    //设置数据源代理
    pageController.dataSource  = self;
    pageController.delegate = self;

}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
  
    TestViewController  *before = [[TestViewController alloc] init];
    before.count = self.num++;
    NSLog(@"ll");
    return before;
    
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    TestViewController *after = [[TestViewController alloc] init];
    after.count  = _num--;
    NSLog(@"xx");
    return after;

}

@end
