//
//  ViewController.m
//  SAXAnylasysXml
//
//  Created by codygao on 16/8/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "xmlModel.h"
#import "appCell.h"
@interface ViewController ()<NSXMLParserDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController{
    //模型数组
    NSMutableArray *_modelList;
    //模型
    xmlModel *_xmlModel;
    //这是用来拼接每个节点之间找到的
    NSMutableString *_str;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _modelList = [[NSMutableArray alloc] init];
    _str = [NSMutableString string];
    [self loadData];
    self.tableView.rowHeight = 120;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _modelList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    appCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    xmlModel *model = _modelList[indexPath.row];
    cell.descLabel.text =model.desc;
    cell.nameLabel.text = model.name;
    cell.teacherLabel.text= model.teacher;
    return  cell;
}
-(void)loadData{
    NSURL *url = [NSURL URLWithString:@"http://localhost/videos.xml"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //处理响应，解析XML
        if(error == nil && data != nil){
            //创建xml解析器；
            NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
            //寻找代理
            parser.delegate = self;
            //开始解析
            [parser parse];
            //找到节点就创建模型，节点结束接给模型赋值，解析结束，就利用模型给UI界面赋值
            
        }else{
            NSLog(@"%@",error);
        }
    }] resume];
}
//开始解析
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    //NSLog(@"开始解析");
}
//找开始节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
    //elementName 是开始节点  attributeDict 是节点属性；要在此处创建模型，因为只有在这个代理方法中能够拿到节点属性；
    //创建模型的时机是节点开始的时候
    if([elementName isEqualToString:@"video"]){
    //创建模型
     _xmlModel = [[xmlModel alloc] init];
    //将模型添加到可变数组里面
    [_modelList addObject:_xmlModel];
    //给模型的属性赋值此处是set方法
    _xmlModel.videoId = [attributeDict valueForKey:@"videoId"];
    }
}
//节点之间的内容，
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"%@",string);
    [_str appendString:string];
}
//在结束节点，再借点结束的时候给model赋值
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    //利用kvc给字典赋值，排除videos和video
   // NSLog(@"%@%@",qName,namespaceURI);
    if(![elementName isEqualToString:@"videos"] &&![elementName isEqualToString:@"videos"]){
        [_xmlModel setValue:_str forKey:elementName];
    }
    //每次给模型赋值后，需要将str清空，但是不能写_str = nil;
    [_str setString:@""];
}
//解析结束
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    //NSLog(@"%@",_modelList);//此时model里面放的都是模型
    //自定义cell 属性列表；
    
}
//监听解析解析是否有误的方法
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"%@",parseError);
}

@end
