//
//  HMContactCell.m
//  作业联系人
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMContactCell.h"

@implementation HMContactCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]){
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}



@end
