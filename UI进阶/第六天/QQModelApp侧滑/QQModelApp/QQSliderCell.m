//
//  QQSliderCell.m
//  QQModelApp
//
//  Created by codygao on 16/7/31.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "QQSliderCell.h"
#import "HMAdditonal.h"
@implementation QQSliderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self= [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.backgroundColor=[UIColor clearColor];
        UIView *v=[[UIView alloc] init];
        v.backgroundColor=[UIColor hm_colorWithHex:0x12B7F5 alpha:1];
        self.selectedBackgroundView=v;
      //self.backgroundColor=[UIColor hm_colorWithHex:0x12B7F5 alpha:1];
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
