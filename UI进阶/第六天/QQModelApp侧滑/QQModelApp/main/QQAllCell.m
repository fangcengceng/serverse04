//
//  QQAllCell.m
//  QQModelApp
//
//  Created by codygao on 16/7/31.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQAllCell.h"

@implementation QQAllCell
-(instancetype )initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self =[super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]){
        self.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
