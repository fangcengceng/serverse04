//
//  QQAboutController.m
//  QQModelApp
//
//  Created by codygao on 16/7/31.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQAboutController.h"
#import "Masonry.h"
@interface QQAboutController ()

@end

@implementation QQAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData:@"QQAboutFunction.plist"];
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 180)];
    
    // 2.logo
    UIImageView *logoV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setting_about_pic"]];
    
    [headerV addSubview:logoV];
    
    [logoV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(headerV);
        make.top.equalTo(headerV).offset(10);
        
    }];
    
    // 3.版本
    UILabel *versionL = [[UILabel alloc] init];
    versionL.text = @"v 1.2.123";
    [headerV addSubview:versionL];
    
    [versionL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(logoV);
        
        make.top.equalTo(logoV.mas_bottom).offset(8);
        
    }];

    
    
    
    
    
    
    
    self.tableView.tableHeaderView=headerV;
    
    

}

@end
