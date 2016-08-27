//
//  QQAboutController.m
//  QQModelApp
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQAboutController.h"

@interface QQAboutController ()

@end

@implementation QQAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataWithPlistName:@"QQAboutFunction"];


}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *imageview=[[UIImageView alloc]init];
    imageview.image=[UIImage imageNamed:@"setting_about_pic"];
    [self.view addSubview:imageview];
    
    return imageview;
    
}


@end
