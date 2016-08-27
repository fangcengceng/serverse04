//
//  AViewController.m
//  属性_通知_代理
//
//  Created by codygao on 16/8/15.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()<BViewControllerDelegate>
@property(nonatomic,weak) UITextField *tx;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *lb = [[UITextField alloc] init];
    lb.bounds = CGRectMake(0, 0, 200, 100);
    lb.backgroundColor = [UIColor redColor];
    lb.center = self.view.center;
     [self.view addSubview:lb];
    _tx= lb;
}
-(void)bviewcontroller:(BViewController *)b andpass:(NSString *)pass{
    NSLog(@"%@",pass);
}
- (IBAction)bu:(id)sender {
    BViewController *b = [[BViewController alloc] init];
    
    b.str = _tx.text;
    b.delegate = self;
    
    
    [self presentViewController:b animated:YES completion:nil];
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
