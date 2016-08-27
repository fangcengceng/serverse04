//
//  MTFoodViewController.m
//  FCCMTApp
//
//  Created by codygao on 16/8/5.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "MTFoodViewController.h"
#import "MTCAtagoryModel.h"
#import "MTFoodsModel.h"
#import "MTCatagoryCell.h"
#import "MTFoodCell.h"
#import "MTHeaderFooterView.h"
//#import "MTBottomCarView.h"


static NSString *cellID=@"cellID";
static NSString *headerID =@"headerID";
@interface MTFoodViewController ()<UITableViewDelegate,UITableViewDataSource,MTFoodCellDelegate>
@property(nonatomic,weak) UITableView  *leftTableView;
@property(nonatomic,weak) UITableView *rightTableView;
//@property (nonatomic,weak) UIImageView *imgV;

@end

@implementation MTFoodViewController{
    NSArray<MTCAtagoryModel*> *_catagoryList;
}

-(void)viewDidLoad{
    [super viewDidLoad];
     [self loadData];
    //设置左侧cell选中的状态
    NSIndexPath *path =[NSIndexPath indexPathForRow:0 inSection:0];
    [_leftTableView selectRowAtIndexPath:path animated:YES scrollPosition: UITableViewScrollPositionTop];
    
    
}

#pragma mark 实现cell的代理
-(void)foodCell:(MTFoodCell *)foodCell didFinishIncreaseFood:(MTFoodsModel *)foodModel andStartPoin:(CGPoint)statPoint{
    
    //开始动画
    UIImageView *imgV =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_food_count_bg"]];
    imgV.center = statPoint;
    UIWindow *keyW = [UIApplication sharedApplication].keyWindow;
    [keyW addSubview:imgV];
    //开启核心动画，让图片框运动
    CAKeyframeAnimation *anim =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    [anim setValue:imgV forKey:@"imgV"];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:statPoint];
    CGPoint endP = CGPointMake(60,keyW.bounds.size.height-55);
    CGPoint controlP = CGPointMake(statPoint.x-130, statPoint.y-120);
    [path addQuadCurveToPoint:endP controlPoint:controlP];
    anim.path = path.CGPath;
    anim.removedOnCompletion =NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = 1;
    anim.delegate = self;
    [imgV.layer addAnimation:anim forKey:nil];
}
//核心动画的代理方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    UIImageView *imageview = [anim valueForKey:@"imgV"];
    [imageview.layer removeAllAnimations];
    
    [imageview removeFromSuperview];
}


-(void)foodCell:(MTFoodCell *)foodCell didFinishDecreaseFood:(MTFoodsModel *)foodModel{
    
    
    
    
    
}
#pragma mark 自定义头部试图，tableview的高级用法
//必须设置表头高度。
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //步骤类似tableView 的数据源方法
    //注册；
    
    
    if (tableView == _leftTableView) {
        return nil;
    }
    MTHeaderFooterView *headrView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    headrView.str = _catagoryList[section].name;

    return headrView;
}
#pragma mark 实现数据源方法
//联动，滚动菜品，让分类移动
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == _leftTableView){
        return;
    }
    
    
    if(!(_rightTableView.isTracking||_rightTableView.isDragging||_rightTableView.isDecelerating)){
        return;
    }
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
        
    [_leftTableView selectRowAtIndexPath:path animated:NO scrollPosition:UITableViewScrollPositionTop];
    
}

//联动，点击分类让菜品滚动
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView == _leftTableView){
    //获取菜品的选中的行的索引
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
    //让菜单列表滚动
    [_rightTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
        return;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // 判断列表是谁?
    // 分类列表
    if (tableView == _leftTableView) {
        
        return 1;
    }
    
    // 菜品列表 -> 有几个分类,就有几组菜品!
    return _catagoryList.count;
}

// 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 分类列表
    if (tableView == _leftTableView) {
        
        return _catagoryList.count;
    }
    
    // 菜品列表 -> 得知道是哪组?
    // 获取组内所有数据
    NSArray *foodsArr = _catagoryList[section].spus;
    
    return foodsArr.count;
    
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
  
    
    // 2.设置数据
    if(tableView == _leftTableView){
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.textLabel.text = _catagoryList[indexPath.row].name;
        return cell;
    }
    
   
    MTFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    NSArray *array = _catagoryList[indexPath.section].spus;
    MTFoodsModel *foodModel =array[indexPath.row];
   cell.delegate = self;
    cell.foodmodel = foodModel;
    
     
    
    return cell;
    
}

- (void)setupUI{
   
    self.view.backgroundColor=[UIColor blueColor];
    UITableView *leftView=[[UITableView alloc] init];
   
    
    
    [self.view addSubview:leftView];
    [leftView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-46);
        make.width.mas_equalTo(86);
    }];
    
    UITableView *rightView=[[UITableView alloc]  init];
    [self.view addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.view);
        make.left.equalTo(leftView.mas_right);
        make.bottom.equalTo(leftView);
        
    }];

  
    
    //设置属性
    leftView.dataSource=self;
    leftView.delegate=self;
    leftView.tableFooterView = [[UIView alloc] init];
    rightView.dataSource=self;
    rightView.delegate=self;
    rightView.tableFooterView =[[UITableView alloc] init];
    leftView.rowHeight = 55;
    rightView.estimatedRowHeight =120;
    rightView.rowHeight = UITableViewAutomaticDimension;
   
    
    leftView.showsVerticalScrollIndicator= NO;
    leftView.showsHorizontalScrollIndicator = NO;
    
    leftView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    
    
    //注册
    [leftView registerClass:[MTCatagoryCell class] forCellReuseIdentifier:cellID];
     [rightView registerClass:[MTFoodCell class] forCellReuseIdentifier:cellID];
    //分组头部信息
   //系统提供了数据源方法；
    [rightView registerClass:[MTHeaderFooterView  class] forHeaderFooterViewReuseIdentifier:headerID];
    rightView.sectionHeaderHeight =23;
    
    //下边的购物车
   
    UIView *carView=[[UIView alloc] init];
    carView.backgroundColor=[UIColor clearColor];
    [self.view addSubview: carView];
    [carView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftView);
        make.right.equalTo(rightView);
        make.bottom.equalTo(self.view);
        make.top.equalTo(leftView.mas_bottom);
    }];
    
    
   //记录成员变量.不可以赋值相反。
    _leftTableView=leftView;
    _rightTableView=rightView;
    
    
}
-(void)loadData{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *allData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:0];
    //取出关键字
    NSArray<NSDictionary*> *bigArray = allData[@"data"][@"food_spu_tags"];
    
    //创建数组接收模型
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    //遍历字典转模型
    [bigArray enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MTCAtagoryModel *catagoryModel = [[MTCAtagoryModel alloc] init];
        [catagoryModel setValuesForKeysWithDictionary:obj];
    
        [tempArray addObject:catagoryModel];
        
    }];
    
    _catagoryList = tempArray.copy;
    
    
    
}
@end
