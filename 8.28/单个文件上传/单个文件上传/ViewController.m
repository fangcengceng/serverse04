//
//  ViewController.m
//  单个文件上传
//
//  Created by codygao on 16/8/28.
//  Copyright © 2016年 HM. All rights reserved.
//
//需求是实现文件的上传，本质上是请求怎么fa,文件上传需要请求体

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取URL路径
    NSString *urlStr =@"http://localhost/php/upload/upload.php";
    NSString *serversName = @"userfile";
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"frame和bouds的区别.png" ofType:nil];
    [self uploadWithUrl:urlStr serverseName:serversName filepath:filepath];
}
-(void)uploadWithUrl:(NSString *)urlstr serverseName:(NSString*)serversName filepath:(NSString*)filepath{
    NSURL *URL = [NSURL URLWithString:urlstr];
    NSMutableURLRequest *requestM = [NSMutableURLRequest requestWithURL:URL];
    requestM.HTTPMethod = @"POST";
    //设置请求头里面的content--type
    [requestM setValue:@"multipart/form-data; boundary=hh" forHTTPHeaderField:@"Content-Type"];
    //设置请求体信息
    NSData *fromdata = [self getfromDataWithSerVerName:serversName filePath:filepath];
    [[[NSURLSession sharedSession] uploadTaskWithRequest:requestM fromData:fromdata completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil &&data !=nil){
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:fromdata options:0 error:nil];
            NSLog(@"上传成功 %@",dic);
        }else{
            NSLog(@"上传失败");
        }
        
    }] resume];
}
-(NSData*)getfromDataWithSerVerName:(NSString *)serverName filePath:(NSString*)filePath{
    /*------WebKitFormBoundaryuDzT8BojlBXlv6Qb
     Content-Disposition: form-data; name="userfile"; filename="frame和bouds的区别.png"
     Content-Type: image/png
     
     
     ------WebKitFormBoundaryuDzT8BojlBXlv6Qb--
     */
    //dataM 专门用来存放拼接好的请求体的二进制数
    NSMutableData *dataM = [NSMutableData data];
    //strM用来拼接请求体的信息
    NSMutableString *strM = [[NSMutableString alloc] init];
    [strM appendString:@"--hh\r\n"];
    //"userfile" 服务器接受文件的字段，后台提供
    [strM appendFormat:@"Content-Disposition: form-data; name=%@; filename=%@\r\n",serverName,[filePath lastPathComponent]];
    [strM appendString:@"Content-Type: image/png\r\n"];
    [strM appendString:@"\r\n"];
    //把前面的信息转化为二进制
    [dataM appendData:[strM dataUsingEncoding:NSUTF8StringEncoding]];
    //拼接文件的二进制信息
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    //把文件路径拼接到二进制数中
    [dataM appendData:fileData];
    //拼接尾巴
    NSString *end = @"\r\n--hh--";
    //把拼接好的二进制数转化为二进制是
    [dataM appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    return dataM.copy;
}
@end
