//
//  ViewController.m
//  NSTimer暂停和取消
//
//  Created by codygao on 16/8/23.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeplayLabel;
@property(nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController{
    NSInteger _num ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _num = 20;
    

}
- (IBAction)starttime:(id)sender {
    if(!_timer){

        _timer= [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(displaytime) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop ] addTimer:_timer  forMode:NSDefaultRunLoopMode]
        ;

            }
    NSLog(@"%@",[NSThread currentThread]);
}
- (IBAction)endtimer:(id)sender {
   if(_timer !=nil){
       _num = 20;

       if([_timer isValid]){
           [_timer invalidate];
       }
       _timer  =nil;
    }
}


-(void)displaytime{
    if(_num-- != 0){
    _timeplayLabel.text =@(_num--).description;
    }
}
@end
