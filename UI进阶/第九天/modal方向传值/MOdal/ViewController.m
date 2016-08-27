//
//  ViewController.m
//  MOdal
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDemoView.h"

@interface ViewController ()<HMDemoViewDelegata>
@property (weak, nonatomic) IBOutlet UITextField *pinjie;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)demoViewControllerdidFinish:(HMDemoView *)demoView userName:(NSDictionary *)info{
    NSString *name=info[@"name"];
    NSString *mima=info[@"mima"];
    _pinjie.text=[name stringByAppendingString:mima];
    
}
- (IBAction)buttonClick:(id)sender {
    
    HMDemoView *demoview=[[HMDemoView alloc] init];
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:demoview];
    [self presentViewController:nav animated:YES completion:nil];
    demoview.delegate=self;
    
}

@end
