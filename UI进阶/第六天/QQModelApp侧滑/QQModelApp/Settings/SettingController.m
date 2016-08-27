//
//  SettingController.m
//  QQModelApp
//
//  Created by codygao on 16/7/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "SettingController.h"

@interface SettingController ()<UITableViewDataSource>

@end

@implementation SettingController
-(void)setupUI{
    [super setupUI];
    [self loadData:@"QQSettingFunction.plist"];
    self.title=@"设置";
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    
    
}
@end
