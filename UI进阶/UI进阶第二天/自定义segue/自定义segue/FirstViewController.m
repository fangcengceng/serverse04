
//
//  ViewController.m
//  自定义segue
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@property(nonatomic,weak) IBOutlet UITextField *text;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController *second = segue.destinationViewController;
    second.str = _text.text;
    
    
}

@end
