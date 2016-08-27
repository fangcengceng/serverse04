//
//  CONtactViewController.m
//  联系人列表
//
//  Created by codygao on 16/7/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "CONtactViewController.h"
#import "ContacetCell.h"
#import "ContactModel.h"
#import "ADDViewController.h"

static NSString *cellID=@"cellID";

@interface CONtactViewController ()<UITableViewDataSource>
@property (weak, nonatomic)UITableView *tableView;
@property(nonatomic,weak)UITableViewCell *cell;

@end

@implementation CONtactViewController{
   NSArray<ContactModel*>*_contactList;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
   
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource=self;
    //self.tableView.delegate=self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
  
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10000;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];

    if (indexPath.row<20) {
      
        cell.textLabel.text=[NSString stringWithFormat:@"zhangsan%03zd",indexPath.row+1];
        cell.detailTextLabel.textColor=[UIColor blueColor];
      
        _cell=cell;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    cell.textLabel.text=nil;
    cell.accessoryType=UITableViewCellAccessoryNone;
    
        return cell;
    
}

-(void)loadData{
    NSURL *url=[[NSBundle mainBundle]URLForResource:@"contact.plist" withExtension:nil];
    NSArray *array=[NSArray arrayWithContentsOfURL:url];
    NSMutableArray *arrayM=[[NSMutableArray alloc]init];
    for (NSDictionary *dic in array) {
        ContactModel *model=[ContactModel contactWithDic:dic];
        [arrayM addObject:model];
    }
    
    _contactList=arrayM.copy;
    

}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    ADDViewController *add=[[ADDViewController alloc]init];
    if([sender isEqual:@"cell"]){
        [self.navigationController pushViewController:add animated:YES];
        add.str1=_cell.textLabel.text;
        add.str2=_cell.detailTextLabel.text;
        
        
    }
    
}

@end
