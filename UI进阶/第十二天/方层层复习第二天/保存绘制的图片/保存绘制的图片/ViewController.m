//
//  ViewController.m
//  保存绘制的图片
//
//  Created by codygao on 16/8/15.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //开启创建图片类型的上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 300), NO, 0);
    //开始huitu；
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddArc(ref, 150, 150, 70, 0, 2*M_PI, 0);
    [[UIColor redColor] setFill];
    CGContextFillPath(ref);
    //通过图片类型的上下文回去图片
    UIImage *ima = UIGraphicsGetImageFromCurrentImageContext();

   //提交图片类型的上下文
    UIGraphicsEndImageContext();
    //方法-：将图片保存到相册
    UIImageWriteToSavedPhotosAlbum(ima, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    //方法二；将图片保存到沙盒，需要转化为二进制数
    NSString *docpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filepath = [docpath stringByAppendingPathComponent:@"a.doc"];
    NSLog(@"%@",filepath);
    //转化为二进制数
    NSData *data = UIImagePNGRepresentation(ima);
    [data writeToFile:filepath atomically:YES];
    
    
    
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
}
@end
