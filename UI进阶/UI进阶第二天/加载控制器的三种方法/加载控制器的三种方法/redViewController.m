//
//  redViewController.m
//  加载控制器的三种方法
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "redViewController.h"
#import "lightViewController.h"

@interface redViewController ()

@end

@implementation redViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)clickPush {
    //这样相当于又新建立一个lightViewController 的队形，跟storyboard中的没有关系，享有关系就必须加载storyboard
    //加载storybord
    UIStoryboard *lighsb=[UIStoryboard storyboardWithName:@"MYStoryBoard" bundle:nil];
    //一个storyboard有一个以上的Controller就必须制定id,//否则在push的时候无法区分。
    lightViewController *lightController=[lighsb instantiateViewControllerWithIdentifier:@"tab"];
    

    [self.navigationController pushViewController:lightController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
