//
//  BookCell.m
//  音乐下载
//
//  Created by codygao on 16/8/30.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "BookCell.h"
#import "BookModel.h"
@interface BookCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end;
@implementation BookCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle =  UITableViewCellSelectionStyleNone;
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"下载" forState:UIControlStateNormal];
    [button setTitle:@"暂停" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button sizeToFit];
    self.accessoryView = button;
    [button addTarget:self action:@selector(downloadnovel:) forControlEvents:UIControlEventTouchDown];
}
-(void)downloadnovel:(UIButton*)sender{
   //除了在cell中按钮的状态改变可以直接用下面的代码
    //sender.selected = !sender.selected;
    
}
-(void)setBook:(BookModel *)book{
    self.nameLabel.text = book.name;
}
@end
