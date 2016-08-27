//
//  MTBaseController.m
//  FCCMTApp
//
//  Created by codygao on 16/8/5.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTBaseController.h"

@interface MTBaseController ()

@end

@implementation MTBaseController

-(instancetype)init{
    if (self=[super init]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.view.backgroundColor=[UIColor whiteColor];
}
@end
