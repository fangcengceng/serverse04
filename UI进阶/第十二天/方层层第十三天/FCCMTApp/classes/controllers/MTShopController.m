//
//  MTShopController.m
//  FCCMTApp
//
//  Created by codygao on 16/8/5.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTShopController.h"


#import "MTButtonView.h"
#define kHEADERHIGHT 123
#define kBUTTONVIEWHIGHT 37
@interface MTShopController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,weak) UIView *headerView;
@property(nonatomic,weak) MTButtonView *buttonView;
@property(nonatomic,weak) UIScrollView * scrollView;

@end

@implementation MTShopController{
    
    NSArray<UIViewController*> *_controllerArray;
    
    
}
#pragma  mark 监听事件
-(void)senderValueChange:(MTButtonView *) sender{
    
    CGRect rect  =  CGRectMake(sender.numPage*_scrollView.bounds.size.width, 0, _scrollView.bounds.size.width,_scrollView.bounds.size.height);
    
    //在一定的rect内显示的scrollview的内容
    [_scrollView scrollRectToVisible:rect animated:YES];
    
}

-(void)panAction:(UIPanGestureRecognizer *)recognizer{
    //获取手势的偏移量，根据偏移量计算调整顶部试图的高度
    CGPoint translate=[recognizer translationInView:self.view];
    if(ABS(translate.x>ABS(translate.y))){
        return;
    }
    
    
    
    [recognizer setTranslation:CGPointZero inView:self.view];
  CGFloat offsetY=translate.y+_headerView.bounds.size.height;
   
   //修改透明条的透明度，单位透明度的变化量
    CGFloat percent=1.0/(kHEADERHIGHT-64);
    //需要的透明度
    CGFloat alpha = (offsetY-64)*percent;
    self.navigationController.navigationBar.alpha=1-alpha;
 
    //修改顶部试图的高度
    if(offsetY >kHEADERHIGHT){
        offsetY=kHEADERHIGHT;
    }
    if(offsetY<64){
        offsetY=64;
    }
    [_headerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(offsetY);
        
    }];
    
    //强制试图布局自己的子控件,如果不需要动画，可以不写，但是如果需要动画必须得写。
      [self.view layoutIfNeeded];
    
    
}
#pragma mark 代理事件
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    if (!(scrollView.isDecelerating || scrollView.isDragging || scrollView.isTracking)) {
        return;
    }

    
    CGFloat offsetX=scrollView.contentOffset.x;
    _buttonView.offset_X=offsetX/3;
    
    
}
//多手势识别器;
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
-(void)setupUI{
     self.title=@"粮新发现（上地店）";
    self.view.backgroundColor=[UIColor magentaColor];
     self.navigationController.navigationBar.alpha=0;
    //添加三个大视图；
    UIView *headeV=[[UIView alloc] init];
    headeV.backgroundColor=[UIColor magentaColor];
    [self.view addSubview:headeV];
    [headeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(kHEADERHIGHT);
     
    }];
    MTButtonView *buttonView=[[MTButtonView alloc] init];
    
    //监听值改变事件
    [buttonView addTarget:self action:@selector(senderValueChange:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:buttonView];
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(headeV);
        make.top.equalTo(headeV.mas_bottom);
        make.height.mas_equalTo(kBUTTONVIEWHIGHT);
    }];
    
    
    UIScrollView *scrollView=[self setupScrollView];
   // scrollView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(buttonView);
        make.top.mas_equalTo(buttonView.mas_bottom);
        make.bottom.equalTo(self.view);
    }];
    
   //添加手势，修改顶部试图的高度
    UIPanGestureRecognizer *panG=[[UIPanGestureRecognizer  alloc] initWithTarget:self action:@selector(panAction:)];
    
    [self.view addGestureRecognizer:panG];
    panG.delegate=self;
    
    
    //记录成员变量
    _headerView=headeV;
    _buttonView=buttonView;
    _scrollView=scrollView;
  
  
}

-(UIScrollView*)setupScrollView{
    UIScrollView *scrV = [[UIScrollView alloc] init];
    scrV.showsVerticalScrollIndicator=NO;
    scrV.pagingEnabled=YES;
    scrV.delegate=self;
    NSArray<NSString*> *ctrolerName = @[@"MTFoodViewController",@"MTCommantViewController",@"MTStoreViewController"];
     //创建一个可变字符串，用于接收
    NSMutableArray<UIView*> *viewArray=[[NSMutableArray alloc] init];
      //根据这个数组创建控制器。
    
    [ctrolerName enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //先把字符串包成类。然后在创建控制器
        Class clz=NSClassFromString(obj);
        UIViewController *vc=[[clz alloc] init];
        NSAssert([vc isKindOfClass:[UIViewController class]], @"%@类名写的不正确",obj);
        [self addChildViewController:vc];
        [scrV addSubview:vc.view];
        [vc didMoveToParentViewController:self];
        
        
        
        [viewArray addObject:vc.view];
        
    }];
    [viewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [viewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrV);
        make.width.mas_equalTo(scrV);
        make.height.mas_equalTo(scrV);
        make.bottom.mas_equalTo(scrV);
        
        
        
    }];
    
    
    return scrV;
}



@end
