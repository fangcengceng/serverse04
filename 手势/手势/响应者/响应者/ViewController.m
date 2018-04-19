//
//  ViewController.m
//  响应者
//
//  Created by codygao on 16/7/28.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *secondtext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)first {
    [_textField becomeFirstResponder];
    //[_textField isFocused];
    //[_secondtext canResignFirstResponder];
    
}


- (IBAction)last:(id)sender {
    
    [_textField resignFirstResponder];
    [self.view endEditing:YES];
 
}

@end
