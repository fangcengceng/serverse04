//
//  ViewController.m
//  专场动画相册
//
//  Created by codygao on 16/8/3.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,assign) NSInteger index;
@end

@implementation ViewController{
    NSArray<UIImage *> *_array;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.contents=(__bridge id)([UIImage imageNamed:@"image1-1"].CGImage);
    NSMutableArray *array=[[NSMutableArray alloc] init];
    for(NSInteger i=0;i<5;i++){
        UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"image%zd-1",i+1]];
        [array addObject:image];
    }
    _array=array;
    
    [self setupUI];
}
-(void)setupUI{
    UISwipeGestureRecognizer *leftG=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    leftG.direction=UISwipeGestureRecognizerDirectionLeft;
   [ self.view addGestureRecognizer:leftG];
    UISwipeGestureRecognizer *rightG=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    [self.view addGestureRecognizer:rightG];
}


-(void)gestureAction:(UISwipeGestureRecognizer *) recognizer{
    
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
          _index++;
            self.view.layer.contents=(__bridge id)_array[_index].CGImage;
            if(_index==4){
                _index=0;
            }
            break;
        case UISwipeGestureRecognizerDirectionRight:
            self.view.layer.contents=(__bridge id)_array[_index].CGImage;
            if(_index==0){
                _index=4;
            }
        
            _index--;
            
            break;
        default:
            break;
    }
    
    
    
}


@end
