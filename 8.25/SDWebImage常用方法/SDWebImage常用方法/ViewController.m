//
//  ViewController.m
//  SDWebImage常用方法
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
@interface ViewController ()
@property(nonatomic,weak) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    self.imageView = imageView;
#pragma 加载动图
    [self demo1];
#pragma 监听下载速度
    [self demo2];
#pragma 渐进式下载
    [self demo3];
#pragma 管理者单例实现下载；
    [self demo4];
}
-(void)demo4{
    SDWebImageManager *manage = [SDWebImageManager sharedManager];
    [manage downloadImageWithURL:[NSURL URLWithString:@"http://image.nihaowang.com/news/2015-04-27/c30f866d-9300-4f6e-86f6-58f408630e14.gif"] options: SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"%ld",receivedSize/expectedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        self.imageView.image = image;
        
    }];
}
-(void)demo3{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://image.nihaowang.com/news/2015-04-27/c30f866d-9300-4f6e-86f6-58f408630e14.gif"] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"%zd" , receivedSize/expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"下载已完成");
        
    }];
    
}
-(void)demo2{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://image.nihaowang.com/news/2015-04-27/c30f866d-9300-4f6e-86f6-58f408630e14.gif"] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        CGFloat downloadPercent =(CGFloat) receivedSize/expectedSize;
        NSLog(@"%zd",downloadPercent);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        
    }];
}
-(void)demo1{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://image.nihaowang.com/news/2015-04-27/c30f866d-9300-4f6e-86f6-58f408630e14.gif"]];
    
}

@end
