//
//  QzoneController.m
//  QQModelApp
//
//  Created by codygao on 16/7/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QzoneController.h"

@interface QzoneController ()

@end

@implementation QzoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[super setupUI];
     self.navigationItem.title=@"动态";
    [self loadData:@"QQQzoneFunction.plist"];
   
}


@end
