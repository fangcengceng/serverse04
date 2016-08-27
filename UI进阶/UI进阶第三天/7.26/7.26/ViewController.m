//
//  ViewController.m
//  7.26
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "FCCViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFied;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickToJump:(id)sender {
    
    if([_textFied.text isEqualToString:@"1"]){
    [self performSegueWithIdentifier:@"main" sender:nil];
        NSLog(@"%@",sender);
    }
}
//自动型segue   stroryboard
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
     UIViewController *vc=segue.destinationViewController;
    if([segue.identifier isEqualToString:@"item"]){
   
    vc.navigationItem.title=@"lllll";
    }
    if ([segue.identifier isEqualToString:@"switch"] ) {
        vc.navigationItem.title=@"hhhh";
    }
}
@end
