//
//  QQSliderController.m
//  QQModelApp
//
//  Created by codygao on 16/7/31.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQSliderController.h"
#import "QQTabBarController.h"
#import "Masonry.h"
#import "HMAdditonal.h"
#import "QQsliderModel.h"
#import "QQSliderCell.h"

@interface QQSliderController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation QQSliderController{
    UIView *_imageView;
    NSArray<QQsliderModel *> *_sliderList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self mainView];

    [self setupContentVC];

    }
-(void)mainView{
    //设置头部
    
    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebar_bg"]];
    CGFloat heightH=self.view.bounds.size.width/imageView.frame.size.width*imageView.frame.size.height;
    [self.view addSubview:imageView];
    _imageView=imageView;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //高度，
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(heightH);
        
        
    }];
    
    //设置中间的tabelView
    [self setupTableView];
    
    
    //设置底部的边条
    UIView *bottomView=[[UIView alloc] init];
    bottomView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(80);
    }];
    
    
    
    
    
}
#pragma  mark 中间试图的搭建
-(void)setupTableView{
    UITableView *tv=[[UITableView alloc]  init];
    tv.backgroundColor=[UIColor clearColor];
   //tv.backgroundColor=[UIColor hm_colorWithHex:0x12B7F5 alpha:1];
    
    tv.tableFooterView=[[UIView alloc] init];
    [self.view addSubview:tv];
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_imageView.mas_bottom);
        make.bottom.equalTo(self.view).offset(80);
    }];
    [tv registerClass:[QQSliderCell class] forCellReuseIdentifier:@"slider"];
    tv.dataSource=self;
    tv.delegate=self;

}
#pragma  mark tablview数据源及代理方法的实现
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _sliderList.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QQsliderModel *model=_sliderList[indexPath.row];
    QQSliderCell *cell=[tableView dequeueReusableCellWithIdentifier:@"slider"];
    cell.textLabel.text=model.title;
    cell.imageView.image=[UIImage imageNamed:model.icon];
    return cell;
}

#pragma  mark loadData
-(void)loadData{
    
   NSURL *url=[[NSBundle mainBundle] URLForResource:@"functionSidebar.plist" withExtension:nil];
    
    _sliderList=[NSArray hm_arrayWithURL:url clasName:@"QQsliderModel"];
    
}


#pragma mark 添加侧边栏
-(void)setupContentVC{
    self.view.backgroundColor=[UIColor grayColor];
    //创建vc队形
    //将tabBarController作为contentVieController  ,
    QQTabBarController *contentVC=[[QQTabBarController alloc] init];
    [self addChildViewController:contentVC];
    contentVC.view.frame=self.view.bounds;
    [self.view addSubview:contentVC.view];
    
    [contentVC didMoveToParentViewController:self];

     }
@end
