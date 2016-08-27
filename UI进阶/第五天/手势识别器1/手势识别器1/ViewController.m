//
//  ViewController.m
//  手势识别器1
//
//  Created by codygao on 16/7/29.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *_imageView;

@end

@implementation ViewController

-(void)tapclick{
    UITapGestureRecognizer *tapG=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
   
    [__imageView addGestureRecognizer:tapG];
    
}
-(void)tapAction:(UITapGestureRecognizer *)recognizer{
    
    
    
}

@end
