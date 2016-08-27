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
    [self loadDataWithPlistName:@"QQQzoneFunction.plist"];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
