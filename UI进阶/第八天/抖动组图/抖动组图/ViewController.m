//
//  ViewController.m
//  抖动组图
//
//  Created by codygao on 16/8/3.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
static NSString *cellID = @"cellid";
@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController{
    UICollectionView *_collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setupUI];
}
-(void)shakeItemClick:(UIBarButtonItem *) sender{
    
    //判断在拖动，减速，手指在屏幕上的时候，什么也不做
    if(_collectionView.isTracking||_collectionView.isDragging ||_collectionView.isTracking){
        return;
    }
    
     if([sender.title isEqualToString:@"开抖"]){
         [self  clickstart:sender];
         sender.title=@"停止";
     }else{
         [self clickStop:sender];
         sender.title=@"开抖";
  
     }
}
-(void)clickStop:(UIBarButtonItem *)sender{
    NSLog(@"xxll");
    _collectionView.scrollEnabled=YES;
    //获取可见范围内的cell;
    NSArray<UICollectionViewCell*> *visibelCell=[_collectionView visibleCells];
    for (UICollectionViewCell *cell in visibelCell) {
      //让cell恢复到原来的位置,移除东画
        [cell.layer removeAllAnimations];
        
           }
    
    
    
}
-(void)clickstart:(UIBarButtonItem *) sender{
    _collectionView.scrollEnabled=NO;
    //获取试图范围内可见的cell
    NSArray <UICollectionViewCell *>  *visibleArray=[_collectionView visibleCells];
    
   [ visibleArray enumerateObjectsUsingBlock:^(UICollectionViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
       UICollectionViewCell *cell=obj;
       
       //是每个cell抖动，而不是整个collctionView抖动
       CAKeyframeAnimation *keyAnim=[CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
       keyAnim.values=@[@(-M_PI_4/6),@(M_PI_4/6),@(-M_PI_4/6)];
       keyAnim.repeatCount=CGFLOAT_MAX;
       keyAnim.duration=2;
       keyAnim.removedOnCompletion=NO;
      
       [cell.layer addAnimation:keyAnim forKey:nil];
   }];
}


#pragma mark 数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath ];
    cell.backgroundColor =[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0  alpha:1];
    
    return cell;
}
-(void)setupUI{
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.headerReferenceSize=CGSizeMake(self.view.frame.size.width,20);
    layout.itemSize=CGSizeMake(80, 80);
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor=[UIColor grayColor];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    collectionView.dataSource=self;
    [self.view addSubview:collectionView];
    _collectionView =collectionView;
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithTitle:@"开抖" style: UIBarButtonItemStylePlain target:self action:@selector(shakeItemClick:)];
    
    
    self.navigationItem.rightBarButtonItem=item;
    
}

@end
