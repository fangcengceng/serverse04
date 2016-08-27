//
//  MTNormalController.m
//  FCCMTApp
//
//  Created by codygao on 16/8/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTNormalController.h"
#import "MTDetaliViewController.h"
#import "MTCAtagoryModel.h"
#import "MTCarVIews.h"
#import "MTBottomModalController.h"
@interface MTNormalController ()<UIPageViewControllerDataSource,MTCarVIewsDelegate>

@property(nonatomic,weak) MTCarVIews *carView;
@end

@implementation MTNormalController
-(void)viewDidLoad{
    [super viewDidLoad];
    _carView.shoplist = _selectedfood;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addToCarViewNotification:) name:MTAddFoodToCarViewNotification object:nil];
}
-(void)addToCarViewNotification:(NSNotification*) noti{
    // 需要添加的菜品
    MTFoodsModel *food = noti.userInfo[MTAddFoodKey];
    CGPoint startPoint = [noti.userInfo[MTStartPointKey] CGPointValue];
    
    // MARK: - 添加模型数据信息到集合
    if (![_selectedfood containsObject:food]) {
        [_selectedfood addObject:food];
    }
    
    //开始动画
    UIImageView *imgV =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_food_count_bg"]];
    imgV.center = startPoint;
    UIWindow *keyW = [UIApplication sharedApplication].keyWindow;
    [keyW addSubview:imgV];
    //开启核心动画，让图片框运动
    CAKeyframeAnimation *anim =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    [anim setValue:imgV forKey:@"imgV"];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    CGPoint endP = CGPointMake(60,keyW.bounds.size.height-55);
    CGPoint controlP = CGPointMake(startPoint.x-130, startPoint.y-120);
    [path addQuadCurveToPoint:endP controlPoint:controlP];
    anim.path = path.CGPath;
    anim.removedOnCompletion =NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = 1;
    anim.delegate = self;
    [imgV.layer addAnimation:anim forKey:nil];
}
//核心动画的代理方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
#warning 动画结束的时候将数据传递给购物车试图。顺传,属性传值；
    _carView.shoplist = _selectedfood;
    UIImageView *imageview = [anim valueForKey:@"imgV"];
    [imageview.layer removeAllAnimations];
    
    [imageview removeFromSuperview];
}

    
    

-(void)bottomCarView:(MTCarVIews *)bottomCarView needsDisplay:(NSMutableArray<MTFoodsModel *> *)selectedModel{
    
   
   MTBottomModalController  *listVc = [[MTBottomModalController alloc] init];
    
    [self presentViewController:listVc animated:YES completion:nil];
    
    
    
}
-(void)setupUI{
    //目标是将菜品详情控制器转化为pagecontrol 控制器
    //在前面的cell 被选中的时候跳转到本控制器
    
//    //步骤，创建pagecontrol
//    self.view.backgroundColor = [UIColor yellowColor];
    UIPageViewController *pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:    UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    
    
    [pageViewController setViewControllers:@[[self detailvcWithPath:_path]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
   //MARK 要想实现pageControl 的滚动，需要实现数据源方法 ,要求的
    pageViewController.dataSource = self;
//    
//    [self addChildViewController:pageViewController];
//    [self.view addSubview:pageViewController.view];
//    [pageViewController.view addSubview:detailVC.view];
//    [pageViewController didMoveToParentViewController:self];
     [self cz_addChildController:pageViewController intoView:self.view];
    
    
    //3.添加底部的购物车试图
    MTCarVIews *carviews= [[NSBundle mainBundle] loadNibNamed:@"MTCarVIews" owner:nil options:nil].lastObject;
    [self.view addSubview:carviews];
    carviews.delegate = self;
 
    [carviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(46);
    }];
    
    _carView = carviews;
    
    
    
}
#pragma mark 创建detailvc 的方法
-(MTDetaliViewController *) detailvcWithPath:(NSIndexPath *)indextPath{
    
    MTDetaliViewController * detailVc = [[MTDetaliViewController alloc] init];
   detailVc.selectModel = self.catagoryModel[indextPath.section].spus[indextPath.row];
    detailVc.path =indextPath;
    return detailVc;
    
}


#pragma mark 实现pageController 的数据源方法
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(MTDetaliViewController *)viewController{
  
    NSIndexPath *currentPath =viewController.path;
    NSInteger section = currentPath.section;
    NSInteger row = currentPath.row;
    row--;
    if(row<0){
        section--;
        if(section<0){
            return nil;
        }
        row = _catagoryModel[section].spus.count-1;
    }
    
    
    NSIndexPath *newPath = [NSIndexPath indexPathForRow:row inSection:section];
    return [self detailvcWithPath:newPath];
    
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(MTDetaliViewController *)viewController{

    NSIndexPath *currentPath = viewController.path;

    NSInteger section = currentPath.section;
    NSInteger row = currentPath.row;
    
    row++;
    
    if (row == _catagoryModel[section].spus.count) {
        section++;
        row = 0;
        
        if (section == _catagoryModel.count) {
    
            return nil;
        }
    }
    
    // 创建indexPath
    NSIndexPath *nextPath = [NSIndexPath indexPathForRow:row inSection:section];
    
    return [self detailvcWithPath:nextPath];

}
@end
