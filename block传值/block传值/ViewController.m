//
//  ViewController.m
//  block传值
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    BViewController *b = segue.destinationViewController;
    b.str = self.textField.text;
    b.block = ^(NSString *str){
        self.nameLabel.text = str;
    };
    
    
}
@end
