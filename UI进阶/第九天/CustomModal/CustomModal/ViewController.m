//
//  ViewController.m
//  CustomModal
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMSecondModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}


- (IBAction)clickToSecondController:(id)sender {
    HMSecondModel *seconController=[[HMSecondModel alloc] init];
    [self presentViewController:seconController animated:YES completion:nil];
}



@end
