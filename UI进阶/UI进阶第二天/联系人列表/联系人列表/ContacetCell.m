//
//  ContacetCell.m
//  联系人列表
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ContacetCell.h"
#import "ContactModel.h"
@interface ContacetCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;

@end

@implementation ContacetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
    
}
-(void)setModel:(ContactModel *)model{
    self.model=model;
    model.name=_nameLabel.text;
    model.tel=_telLabel.text;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
