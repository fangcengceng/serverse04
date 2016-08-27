//
//  HMButton.m
//  button控件内部的布局
//
//  Created by codygao on 16/8/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMButton.h"
#import "UIView+HMView.h"

@implementation HMButton
-(void)layoutSubviews{
    [super layoutSubviews];
//    CGRect titlerect = self.titleLabel.frame;
//    titlerect.origin.x = 0;
//    self.titleLabel.frame = titlerect;
//
//    CGRect imageViewrect = self.imageView.frame;
//    imageViewrect.origin.x = titlerect.size.width;
//    self.imageView.frame = imageViewrect;
    
    self.titleLabel.x= 60;
    self.imageView.x = self.titleLabel.frame.size.width+60;

    
    self.titleLabel.h = 100;
    self.imageView.h = 100;
    
}

@end
