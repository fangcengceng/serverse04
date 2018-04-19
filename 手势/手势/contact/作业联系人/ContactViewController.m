//
//  ContactViewController.m
//  作业联系人
// 两个界面搭建，手动，自动segue脱线，  创建自定义模型类，加载类数据，加载假数据测试。
//实现手动segue,tabelview的代理方法中做判断

//  Created by codygao on 16/7/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ContactViewController.h"
#import "HMBContactModel.h"
#import "HMContactCell.h"
#import "HMBDetailController.h"
static NSString *reuseID=@"reuseidentifier";
@interface ContactViewController ()<HMBDetailControllerDelegate>

@end

@implementation ContactViewController{
    NSMutableArray <HMBContactModel*> *_contactList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.editing=YES;
    self.clearsSelectionOnViewWillAppear=NO;
    self.navigationItem.rightBarButtonItems=@[self.editButtonItem,self.navigationItem.rightBarButtonItem];
    _contactList=[self loadData];
    [self setupUI];
   
  }
#pragma mark --tableview自带方法，重写此方法实现对cell 的重新排序

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    //获取要移动的哪一行数据
    HMBContactModel *movModel=_contactList[fromIndexPath.row];
    //将这一行删除
    [_contactList removeObjectAtIndex:fromIndexPath.row];
    [_contactList insertObject:movModel atIndex:toIndexPath.row];
    [self.tableView reloadData];
    [self saveData];
    
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        return NO;
    }
    return YES;
}
#pragma mark  按钮的代理
//保存代理逆传6步
-(void)detailControllerDidFinishEditingContact:(HMBDetailController *)detailViewController{
    
    
    [self.tableView reloadData];
    [self saveData];
    
}
//添加代理逆传值
-(void)detailControllerAddModel:(HMBDetailController *)controller model:(HMBContactModel *)newModel{
    
    
    [_contactList insertObject:newModel atIndex:0];
    
    [self.tableView reloadData];
    //刷新。三种insert reload deleta,,,,,-----只可以选择一种，否则蹦
   // NSIndexPath *path=[NSIndexPath indexPathForRow:0 inSection:0];
     //   [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationBottom];
    [self saveData];
    
}

#pragma mark ---tabelview的代理方法的实现
//代理的高级用法 ，实现cell的侧滑效果,数组和edit
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UITableViewRowAction *delRow=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //从数组中删除
        [_contactList removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView reloadData];
        [self saveData];
        
    }];
    UITableViewRowAction *adRow=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"添加" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        HMBDetailController *adController=[[HMBDetailController alloc]init];
//        [self.navigationController pushViewController:adController animated:YES];
         //手动segue,可以调到同一个目标控制器，关键看传入的sender是谁
        [self performSegueWithIdentifier:@"main" sender:adRow];
        [self saveData];
    
    }];
    
    NSArray *array=@[delRow,adRow];
    return array;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取选中的cell的数据
    HMBContactModel *selModel=_contactList[indexPath.row];
    
    //手动segue方法perform,跳转过去
    [self performSegueWithIdentifier:@"main" sender:selModel];
}
//准备传值
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //获取目标控制器
    HMBDetailController *targetController=segue.destinationViewController;
    //属性传值，目标控制器中有一个属性用来接收传过去的数据 ,现在的sender 就代表选中的那一行。
    //注意，在此处必须将目标控制器的数据源方法给闪电，否则无法实现出现目标控制器的试图，将会是一个白板。
    
    //如果不直接给目标控制器创建对象，也可以使用UIViewConTroller父类来实现，将创建的对象强转为目标控制器类型，
//    UIViewController *targetController=segue.destinationViewController////多态
//    （ HMBDetailController*）targetController=sender;
    //属性传值，目标控制器中有一个selmodel 的属性。
    if([segue.identifier isEqualToString:@"main"]){
      targetController.selmodel=sender;
    }
//代理5步，逆传
    targetController.delegate=self;
}

#pragma  mark ---实现数据源代理方法
//数据源的方法，实现数据的，                                      //默认是none,实现此方法，可以删除，增加数据，一般用于增加数据
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取改行数据
    HMBContactModel *delModel=_contactList[indexPath.row];
    //删除改行数据
    [_contactList removeObject:delModel];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    // [self.tableView reloadData];
    [self saveData];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contactList.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HMContactCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseID];
    cell.textLabel.text = _contactList[indexPath.row].name;
    cell.detailTextLabel.text=_contactList[indexPath.row].tel;

    return cell;
}
#pragma  mark ---加载模型
//-(void)loadData{
//    
////    HMBContactModel  *m1= [[HMBContactModel alloc]init];
////    m1.name=@"zhangsan";
////    m1.age=10;
////    m1.tel=@"10086" ;
////    HMBContactModel *m2=[[HMBContactModel alloc]init];
////    m2.name=@"lisi";
////    m2.age=20;
////    m2.tel=@"10000";
////    
////    _contactList=[NSMutableArray arrayWithObjects:m1,m2, nil];
//    
//}
-(NSMutableArray *) loadData{
    NSMutableArray *tempM=[NSKeyedUnarchiver unarchiveObjectWithFile:[self dataPath]];
    if(tempM==nil){
        tempM =[NSMutableArray array];
    }
    return tempM;
}
-(void)saveData{
    [NSKeyedArchiver archiveRootObject:_contactList toFile:[self dataPath]];
}
- (NSString *)dataPath {
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"persons.abc"];
}

#pragma mark 搭建界面注册cell
-(void)setupUI{
    
    [self.tableView registerClass:[HMContactCell class] forCellReuseIdentifier:reuseID];
}

@end
