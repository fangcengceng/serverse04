//
//  HMBDetailController.m
//  作业联系人
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMBDetailController.h"
#import "HMBContactModel.h"

@interface HMBDetailController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *telField;

@end

@implementation HMBDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      self.nameField.text=_selmodel.name;//self.ageField.text=[NSString
    if(_selmodel.name.length>0){
    self.ageField.text=@(_selmodel.age).description;
          //stringWithFormat:@"%zd",_selmodel.age;
       
    }
     self.telField.text=self.selmodel.tel;
    if(_selmodel!=nil){
    self.navigationItem.title=@"联系人详情";
    
    //要给右侧item代理，所以不直接复制
    UIBarButtonItem  *saveItem=[[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveItemClick:)];
     
    self.navigationItem.rightBarButtonItem=saveItem;
           return;
    }
    self.navigationItem.title=@"添加联系人";
    UIBarButtonItem  *addItem=[[UIBarButtonItem alloc]initWithTitle:@"添加 "style:UIBarButtonItemStylePlain target:self action:@selector(addItemClick)];
    self.navigationItem.rightBarButtonItem=addItem;
    [_nameField becomeFirstResponder];
    
}
#pragma mark----右侧添加按钮的代理
-(void)addItemClick{
    HMBContactModel *newModel=[[HMBContactModel alloc]init];
    newModel.name=_nameField.text;
    newModel.tel=_telField.text;
    newModel.age=[_ageField.text integerValue];
    if([self.delegate respondsToSelector:@selector(detailControllerAddModel:model:)]){
        [self.delegate detailControllerAddModel:self model:newModel];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


#pragma mark ---右侧保存item的传值代理；（6步）
//功能，是点击右侧按钮的时候，实现跳转，反向传智，需要代理
-(void)saveItemClick:(UIBarButtonItem *)sender{
    
    //创建新模型
    _selmodel.name=_nameField.text;
    _selmodel.tel=_telField.text;
    _selmodel.age=[_ageField.text integerValue];
        if([self.delegate respondsToSelector:@selector(detailControllerDidFinishEditingContact:)]){
        [self.delegate detailControllerDidFinishEditingContact:self];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
