//
//  MainView.m
//  小彩灯
//
//  Created by codygao on 16/7/28.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MainView.h"

@implementation MainView{
    NSArray *_imgArry;
}

-(void)awakeFromNib{
    NSArray *imgArry = @[
                         [UIImage imageNamed:@"spark_blue"],
                         [UIImage imageNamed:@"spark_cyan"],
                         [UIImage imageNamed:@"spark_green"],
                         [UIImage imageNamed:@"spark_magenta"],
                         [UIImage imageNamed:@"spark_red"],
                         [UIImage imageNamed:@"spark_yellow"]
                         
                         ];
    _imgArry=imgArry;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获得触摸点
    for(UITouch *touch in touches){

    CGPoint loc=[touch locationInView:self];
    //添加图片框
    //产生随机数
    int randomNum=arc4random_uniform((int)_imgArry.count);
    UIImageView *imageView=[[UIImageView alloc]initWithImage:_imgArry[randomNum]];
    imageView.center=loc;
    [self addSubview:imageView];
    [UIView animateWithDuration:1 animations:^{
        imageView.alpha=0;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
    }
}
//要将用户的userinterface的multer选中
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   // CGPoint loc=[touches.anyObject locationInView:self];
    for (UITouch *touch in touches) {
        CGPoint loc=[touch locationInView:self ];
        int arNum=arc4random_uniform((int)_imgArry.count);
        UIImageView *imgeView=[[UIImageView alloc]initWithImage:_imgArry[arNum]];
        imgeView.center=loc;
        [self addSubview:imgeView];
        [UIView animateWithDuration:1 animations:^{
            imgeView.alpha=0;
        } completion:^(BOOL finished) {
             [imgeView removeFromSuperview];
        }];
        
    }
    
    
}

@end
