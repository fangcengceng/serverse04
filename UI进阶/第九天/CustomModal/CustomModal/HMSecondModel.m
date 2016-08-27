//
//  HMSecondModel.m
//  CustomModal
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMSecondModel.h"
#import "HMAnimation.h"

@interface HMSecondModel ()



@end

@implementation HMSecondModel{
    HMAnimation *_anim;
}
-(instancetype)init{
    if(self=[super init]){
        self.modalPresentationStyle=UIModalPresentationCustom;
    }
    _anim=[[HMAnimation alloc] init];
    self.transitioningDelegate=_anim;
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
}


@end
