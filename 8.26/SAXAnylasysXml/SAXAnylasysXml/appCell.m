//
//  appCell.m
//  SAXAnylasysXml
//
//  Created by codygao on 16/8/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "appCell.h"
#import "xmlModel.h"
@interface appCell()


@end
@implementation appCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setModeldata:self.modeldata];
    }
    return self;
}
//-(void)awakeFromNib{
//    [super awakeFromNib];
//    [self setModeldata:self.modeldata];
//}

-(void)setModeldata:(xmlModel *)modeldata{
    self.modeldata = modeldata;
    self.nameLabel.text = modeldata.name;
    self.descLabel.text = modeldata.desc;
    self.teacherLabel.text = modeldata.teacher;
}
@end
