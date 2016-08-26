//
//  ViewController.m
//  异步下载图片
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "collectionModel.h"
#import "customCell.h"
static NSString *collectioncellID = @"collectioncellID";
@interface ViewController ()<UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController{
    NSOperationQueue *_queue;
    NSArray<collectionModel*> *_arrayList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayList = [[NSArray alloc] init];
    _queue = [[NSOperationQueue alloc] init];
    [self loaddata];
    [self setupUI];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arrayList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    customCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectioncellID forIndexPath:indexPath];
    collectionModel *model =_arrayList[indexPath.item];
    cell.modeldata =model;

    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
 
        NSURL *url = [NSURL URLWithString:model.icon];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *imag = [UIImage imageWithData:data];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            cell.imagView.image = imag;
            
        }];
        
    }];
    [_queue addOperation:op];
    return cell;
}
-(void)setupUI{
    self.collectionView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"customCell" bundle:nil];
    //用nib 就注册nib,用class就注册class;
    [self.collectionView registerNib:nib forCellWithReuseIdentifier: collectioncellID];
}
-(void)loaddata{
    NSURL *url  =[[NSBundle mainBundle] URLForResource:@"apps.plist" withExtension:nil];
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        collectionModel *model = [collectionModel collectionWithdic:obj];
        [tempArray addObject:model];
        
    }];
    _arrayList = tempArray.copy;
    
}
@end
