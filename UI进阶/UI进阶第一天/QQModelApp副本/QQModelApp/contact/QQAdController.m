//
//  QQAdController.m
//  QQModelApp
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQAdController.h"
#import "QQFuncModel.h"

@interface QQAdController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QQAdController
 
-(void)viewDidLoad{
    [super viewDidLoad ];
    [ self loadDataWithPlistName:@"QQAddFunction.plist" ];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    if([self.delegate respondsToSelector:@selector(addViewController:didSelectModel:)]){
        [self.delegate addViewController:self didSelectModel:self.selFun];
    }
        
    [self.navigationController pushViewController:self animated:YES];
   
    
    
}

@end
