//
//  ViewController.m
//  数据存储plist文件
//
//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}
-(void)clickCun{
    //设置字典
    NSDictionary *dic=@{
                        @"name":@"zhangsan",
                        @"age":@18,
                        @"tel":@"2233"
                        };
    NSString *filePath=[self cunru:@"aaa.plist"];
    [dic writeToFile:filePath atomically:YES];
   
}
-(void)clickQu{
    //获取路径
    NSString *filePath=[self cunru:@"aaa.plist"];
    //读取数据内容
    NSDictionary *dic=[NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"%@",dic);
    
    
    
    
}
-(NSString*)cunru:(NSString*)fileName{
    //存储，获取路径写入文件,document文件
    NSString *str=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject ;
    //拼接字符串
    NSString *filePath=[str stringByAppendingString:fileName];
    //把字典写入文件中
    return filePath;
    
}
-(void)setupUI{
    
    UIButton *label =[[UIButton alloc]init];
    [label setTitle:@"cunqu" forState:UIControlStateNormal];
    [self.view addSubview:label];
    label.backgroundColor=[UIColor redColor];
    UIButton *label2=[[UIButton alloc]init];
    label2.backgroundColor=[UIColor redColor];
    [label2 setTitle:@"HHH" forState:UIControlStateNormal];
    [self.view addSubview:label2];
    
    UIButton *label3=[[UIButton alloc]init];
    [label3 setTitle:@"CC" forState:UIControlStateNormal];    label3.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:label3];
    NSArray<UIButton *> *array=[[NSArray alloc]initWithObjects:label,label2, label3,nil];
    
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:20 tailSpacing:10];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    [label2 addTarget:self action:@selector(clickCun) forControlEvents:UIControlEventTouchUpInside];
    [label3 addTarget:self action:@selector(clickQu) forControlEvents:UIControlEventTouchUpInside];
}

@end
