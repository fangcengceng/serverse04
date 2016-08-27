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
    self.clearsSelectionOnViewWillAppear=NO;
    self.navigationItem.rightBarButtonItems=@[self.editButtonItem,self.navigationItem.rightBarButtonItem];
   
   
    [self loadData];
     [self.tableView registerClass:[HMContactCell class] forCellReuseIdentifier:reuseID];
  }
#pragma mark  按钮的代理
-(void)detailControllerDidFinishEditingContact:(HMBDetailController *)detailViewController{
    [self.tableView reloadData];
    [self loadData];
}
-(void)detailControllerAddModel:(HMBDetailController *)controller model:(HMBContactModel *)newModel{
    [_contactList insertObject:newModel atIndex:0];
    [self.tableView reloadData];
    [self loadData];
}
#pragma mark ---tabelview的代理方法的实现
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取选中的cell的数据
    HMBContactModel *selModel=_contactList[indexPath.row];
    
    //手动segue方法perform,跳转过去
    [self performSegueWithIdentifier:@"main" sender:selModel];
}
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contactList.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HMContactCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseID];
    cell.textLabel.text = _contactList[indexPath.row].name;
    cell.detailTextLabel.text=_contactList[indexPath.row].tel;

    return cell;
}
#pragma  mark -存取数据（先存，才能加载，加载的实质就是解档，存的实质是归档
-(void)loadData{
    NSString *dic=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath=[dic stringByAppendingPathComponent:@"contact.txt"];
    NSMutableArray *array=[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if(array==nil){
        array= [NSMutableArray array];
    }
    _contactList=array;
}
-(void)saveData{
    NSString *dic=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath=[dic stringByAppendingPathComponent:@"contact.txt"];
   [NSKeyedArchiver archiveRootObject:_contactList toFile:filePath];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle==UITableViewCellEditingStyleDelete){
        
        [_contactList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
    [self loadData];
    
    
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    //删除
    UITableViewRowAction *actdel=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
        [_contactList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self loadData];
        
    } ];
    UITableViewRowAction *actIns=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"插入" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"shouchang");
    }];
    return @[actdel,actIns];
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    HMBContactModel *movM=_contactList[fromIndexPath.row];
    [_contactList removeObjectAtIndex:fromIndexPath.row];
    [_contactList insertObject:movM atIndex:toIndexPath.row];
    [self loadData];
    
}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==1){
        return NO;
    }
    return YES;
}
@end
