//
//  MTDetaliViewController.m
//  FCCMTApp
//
//  Created by codygao on 16/8/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTDetaliViewController.h"

#import "MTFoodDetailHeaderView.h"
#import "UIImageView+WebCache.h"
@interface MTDetaliViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tv;
@property (weak, nonatomic) IBOutlet UIImageView *imgeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgH;

@end

@implementation MTDetaliViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    _tv.backgroundColor  = [UIColor clearColor];
  
    _tv.delegate  = self;
   
   
    //实现偏移
    _tv.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    _tv.showsVerticalScrollIndicator = NO;
    _tv.tableFooterView = [[UIView alloc] init];
    
    
    //headerV.model = _selectModel;
    NSString * imageName = [_selectModel.picture stringByDeletingLastPathComponent];
    NSURL *url  = [NSURL URLWithString:imageName];
    [_imgeView sd_setImageWithURL:url];
    //添加顶部试图
    MTFoodDetailHeaderView * headerV = [MTFoodDetailHeaderView foodDetailHeaderView];
    headerV.bounds = CGRectMake(0, 0, 0, 200);
    
    //将数据传递给头部详情view
    headerV.model = _selectModel;
    
    _tv.tableHeaderView  = headerV;
}

#pragma mark 监听方法，实现图片的放大缩小功能
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    //获取偏移量，根据偏移量实现图片的放大
    CGPoint offset = _tv.contentOffset;
    CGFloat targetY =-offset.y;
    if(targetY < 0){
        targetY = 0;
        return;
    }
    _imgH.constant = targetY;
    
//    
//  [_imgeView  mas_remakeConstraints:^(MASConstraintMaker *make) {
//      
//      make.height.mas_equalTo(targetY);
//      
//  }];
//    
    
    
}

@end
