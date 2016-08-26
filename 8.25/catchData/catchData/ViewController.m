//
//  ViewController.m
//  catchData
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "shopModel.h"
#import "APPcollectionlayout.h"
#import "appCell.h"
static NSString *cellID = @"cellID";
@interface ViewController ()<UICollectionViewDataSource>
@property(nonatomic,weak)UICollectionView *colletionView;
@end

@implementation ViewController{
    NSArray<shopModel*> *_arrayList;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayList = [[NSArray alloc] init];
    [self loadjasondata];
    [self setupUI];
   }

-(void)loadjasondata{
    NSString *str = @"http://163.177.151.20/shopui/na/v1/cliententry?da_ext=&msgcuid=&return_type=refresh&net_type=wifi&aoi_id=2439504856968321549&taste=&address=%E5%8D%97%E5%BA%97%E6%96%B0%E6%9D%91&screen=320x568&cheatfrom=wmapp&cheatios=iMwjtcIQ3fweNtKCABEFQboWAy5pQgNtXAdkTirIPd1RgaF70pIlnMwdo2%2FTz8KbyyEXwOIIaXi%2BFH6GzmGEzx0Wh%2Bo%2Bf7l%2BrEAycfn%2FCeAb0DFf3zsYq%2B6WAOC2OGIsEWAB5t2AJ0%2Fnk8ys0mE4miCLTLG77YXPcPUAbvdUH0xidcFthBHq5lUbTQBQeef4MsS6eePZy%2Fzmpi5APuIbZtCuqb3qSSRGb5dnS3KHT6qm%2F%2BX62412wKU5b%2FLDEHFFhImKMIFqwXcfW2GNSFAhiL5VvY%2BuUMnMKom5olJKxgA4corAov5EOc6NlfvhN0aStvcFgJF8401KZfD4fMpggOWXyHGVepQBT2EKKgyxp9WMPG%2BzeqnbsiO0omWckMK5wWmQPmeRSfotpsYXch2eRyVv42uHAleBh4%2BvlWt%2B%2FQ%2FmTZKgVCuTh7Z0ZXBseci%2FBtdJLC5%2BQJTFWRc%2F%2FcpjvGWyOhQnR8pwrYv42mkPmhMWpH70WQoWE5Y27GqTu9RjQFuq8i8adUfEhtAVBIZWkDse91ZetyLFtz6r8JxIKJRtzFQb9%2FmJGpWAkXmJuiL%2FiTT7p0ZBtdeeRDegqCqN%2BWTinmIRWAFg0f8OpI3ItimKoMRzaQk7szRQDG6Ks%2FVwyVV6P2M%2FDBHV9BbPjsgPO9XL4dGYrQKxGOGV1neGf1%2FMZkR%2Fz9fcU%2FTrM4U538Gluz8fwPRTc2jUUBXYMJJZmg%3D%3D&sortby=&cuid=3D0A8678-18DC-4447-9611-13A411B1FCF9&hot_fix=1&uuid=C99F87B1-9588-443D-8BBA-D5DAE3CB57E1&alipay=1&sv=4.0.0&isp=46001&channel=appstore&loc_lng=12951328.778846&resid=1001&from=na-iphone&request_time=1472034210515&model=iPhone6%2C2&count=20&lng=12951333.031847&idfa=8EFD4589-EDD2-4958-A717-9AF218CBC152&page=1&os=9.3.1&lat=4847613.653197&loc_lat=4847611.463607&promotion=&city_id=131&vmgdb=&jailbreak=0&device_name=%E2%80%9C%E5%BC%A0%E6%9D%B0%E2%80%9D%E7%9A%84%20iPhone";
    NSURL *urlName = [NSURL URLWithString:str];
    NSURLSession *session = [NSURLSession sharedSession];
 
   NSURLSessionDataTask *datatask = [session dataTaskWithURL:urlName completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       //NSLog(@"%@--%@",[response class],data);
       if(error == nil && data!=nil){
       NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
       NSDictionary *dic = [result valueForKey:@"result"];
       NSArray *array = dic[@"shop_info"];
       //契机，遍历数组，字典转模型
       NSMutableArray *temparray = [NSMutableArray array];
       [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
           shopModel *shop = [shopModel shopWithdic:obj];
           [temparray addObject:shop];
       }];
       _arrayList = temparray.copy;
           //刷新数据要在主线程进行，否则会显示不出来；
           [[NSOperationQueue mainQueue] addOperationWithBlock:^{
             [self.colletionView reloadData];
           }];
       }else{
           NSLog(@"%@",error);
       }
       
   }];

    [datatask resume];

}
-(void) setupUI{
    APPcollectionlayout *layout = [[APPcollectionlayout alloc] init];
  
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, 375, 200) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor grayColor];
    [collectionView registerClass:[appCell class]
       forCellWithReuseIdentifier:cellID];
    [self.view addSubview:collectionView];
    self.colletionView = collectionView;
    
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arrayList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    appCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    cell.shopmodel = _arrayList[indexPath.item];
    cell.nameLabel.text = _arrayList[indexPath.item].shop_name;
    
    cell.imgView.image = [UIImage imageNamed:@"user_default"];
    NSURL *url = [NSURL URLWithString:_arrayList[indexPath.row].logo_url];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *imag = [UIImage imageWithData:data];
    cell.imgView.image = imag;
    return cell;
}
@end
