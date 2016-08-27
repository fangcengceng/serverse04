//
//  HMDemoCell.m
//  colletion
//
//  Created by codygao on 16/8/2.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoCell.h"

@implementation HMDemoCell{
    UIImageView *_imageview;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.bounds];
    imageView.backgroundColor=[UIColor magentaColor];
       //设置tupianmodel
    imageView.contentMode= UIViewContentModeScaleAspectFill;
    //设置属性
    imageView.layer.cornerRadius=5;
    imageView.layer.masksToBounds=YES;
    imageView.layer.borderColor=[UIColor blackColor].CGColor;
    imageView.layer.borderWidth=5;
 
    
    
    [self.contentView addSubview:imageView];
    
    _imageview=imageView;
    
}
-(void)setImage:(UIImage *)image{
    _image=image;
    
    _imageview.image=image;
    
}
@end
