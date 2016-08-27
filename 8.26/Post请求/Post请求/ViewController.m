//
//  ViewController.m
//  Post请求
//
//  Created by codygao on 16/8/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;
@end

@implementation ViewController


- (IBAction)clickButton:(id)sender {
    NSString *str1 = self.usernameLabel.text;
    NSString *str2 = self.passwordLabel.text;
    NSURL *url = [NSURL URLWithString:@"http://localhost/php/login/login.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString *body = [NSString stringWithFormat:@"username=%@&passworld%@",str1,str2];
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      
        if(error == nil && data != nil){
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            if ([result[@"userId"] intValue] == 1){
                NSLog(@"登录成功");
            }else{
                NSLog(@"登录失败");
            }
            
            
        }else{
            NSLog(@"%@",error);
        }
        
        
        
        
    }] resume];
    
    
    
}


@end
