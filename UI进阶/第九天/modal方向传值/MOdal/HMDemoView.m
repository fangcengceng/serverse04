//
//  HMDemoView.m
//  MOdal
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"

@interface HMDemoView ()

@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UITextField *mima;

@end

@implementation HMDemoView

-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title=@"登录";
    UIBarButtonItem *leftitem=[[UIBarButtonItem alloc] initWithTitle:@"quxian" style:UIBarButtonItemStylePlain target:self action:@selector(quxiao)];
    self.navigationItem.leftBarButtonItem=leftitem;
}
-(void)quxiao{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)clickButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if([self.delegate respondsToSelector:@selector(demoViewControllerdidFinish:userName:)]){
        [self.delegate demoViewControllerdidFinish:self userName:@{@"name":_textfield.text,@"mima":_mima.text}];
    }
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
