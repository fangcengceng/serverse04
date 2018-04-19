//
//  ViewController.m
//  NSOperation代理传值
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "downLoadOperation.h"

@interface ViewController () <downLoadOperationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *fistImagView;

@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;

@end

@implementation ViewController{
    NSOperationQueue *_queue ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   NSString *urlName1 =  @"http://img2.3lian.com/2014/c7/12/d/77.jpg";
    NSString *urlName2 = @"http://img04.tooopen.com/images/20130701/tooopen_20083555.jpg";
    if(_queue == nil){
        _queue =[[NSOperationQueue alloc] init];
        
    }
    downLoadOperation *op = [[downLoadOperation alloc] init];
    op.urlName1 = urlName1;
    op.urlName2 = urlName2;
    op.delegate = self;
    [_queue addOperation:op];
    
}
-(void)downLoadOperationdidfinishidown:(downLoadOperation*)downop image:(UIImage *) imag1 andImag:(UIImage *)imag2{
    self.fistImagView.image = imag1;
    self.secondImageView.image = imag2;
    
    
    
}
@end
