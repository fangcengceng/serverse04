//
//  ViewController.m
//  tableView
//
//  Created by codygao on 16/8/2.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "HMDemoCell.h"
#import "HMDemoLayout.h"
 static NSString *cellID=@"cell";
@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController{
    NSArray<UIImage*> *_pictureList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setupUI];


}
#pragma mark 数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    HMDemoCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    //数组越界，因为总共有4张，item属于30，所以取余
    cell.image=_pictureList[indexPath.item%4];
    
    
    return cell;
}
-(void)loadData{
    NSArray *array=@[
                     [UIImage imageNamed:@"01"],
                     [UIImage imageNamed:@"02"],
                     [UIImage imageNamed:@"03"],
                     [UIImage imageNamed:@"yr"]
                     
                     
                     ];
    _pictureList =array.copy;
    
}
-(void)setupUI{
    HMDemoLayout *layout=[[HMDemoLayout alloc] init];
    UICollectionView *cv=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 150) collectionViewLayout:layout];
 

    cv.backgroundColor=[UIColor grayColor];
    cv.dataSource=self;
    [cv registerClass:[HMDemoCell class] forCellWithReuseIdentifier:cellID];
    [self.view addSubview:cv];
  
}

@end
