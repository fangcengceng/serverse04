//
//  MTBottomModalController.m
//  FCCMTApp
//
//  Created by codygao on 16/8/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTBottomModalController.h"
#import "MTCustom.h"

@interface MTBottomModalController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tV;

@end

@implementation MTBottomModalController{
    //自定义modal 的成员变量强引用
    MTCustom *_cstModal;
}

#pragma mark 自定义modal
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName: nil bundle:nil]){
        self.modalPresentationStyle = UIModalPresentationCustom;
        
    }
    
    //设置自定义modal 代理
    _cstModal  = [[MTCustom alloc] init];
    self.transitioningDelegate = _cstModal;
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //_tV.dataSource = self;
    [_tV registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = @(indexPath.row).description;
    return  cell;
}

@end
