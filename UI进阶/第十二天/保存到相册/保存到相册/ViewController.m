//
//  ViewController.m
//  保存到相册
//
//  Created by codygao on 16/8/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
     [super viewDidLoad];
    UIImageWriteToSavedPhotosAlbum([UIImage imageNamed:@"Snip20160724_2"], self, @selector(image:didFinishSavingWithError:contextInfo:),nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
}
@end
