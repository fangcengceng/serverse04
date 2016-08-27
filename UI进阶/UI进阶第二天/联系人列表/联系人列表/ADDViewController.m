//
//  ADDViewController.m
//  联系人列表
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ADDViewController.h"

@interface ADDViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nametext;

@property (weak, nonatomic) IBOutlet UITextField *teltext;
@end

@implementation ADDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nametext.text=self.str1;
    _teltext.text=self.str2;
    
    
}


- (IBAction)clickToSave:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
 
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
