//
//  ViewController.m
//  jason演练
//
//  Created by codygao on 16/8/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMPerson.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray<HMPerson*> *_arrayList;
   

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loaddata];
    [_arrayList enumerateObjectsUsingBlock:^(HMPerson * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@",_arrayList[0].name);
      
    }];
   
}
- (void)loaddata {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"demo01.json" withExtension:nil];
    
    //转成二进制
    NSData *data = [NSData dataWithContentsOfURL:url];
    //将二进制数据反序列化；
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *bigarray = [dic valueForKey:@"data"];
    NSMutableArray *tempArray = [NSMutableArray array];
   [ bigarray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //HMPerson *person = [HMPerson personWithdic:obj];
       HMPerson *person = [[HMPerson alloc] init];
       [person setValuesForKeysWithDictionary:obj];
       
        [tempArray addObject:person];
   }];
    _arrayList = tempArray.copy;
}

@end
