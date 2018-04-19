//
//  appModel.h
//  模拟科技头条
//
//  Created by codygao on 16/8/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface appModel : NSObject

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString * type_id;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * summary;
@property(nonatomic,copy)NSString * img;
@property(nonatomic,copy)NSString * src_img;
@property(nonatomic,copy)NSString * sitename;
+(instancetype)appWithdic:(NSDictionary*) dic;
/*
 "id": "475256",
 "type_id": "4",
 "title": "\u6c5f\u5357\u6625\uff1a\u5206\u4f17\u7684\u8bd7\u548c\u8fdc\u65b9\u5728\u4e8e\u6210\u4e2d\u56fd\u65b0\u7ecf\u6d4e\u54c1\u724c\u5f15\u7206\u8005",
 "summary": "\u96f7\u5e1d\u7f51\u4e50\u59298\u670826\u65e5\u62a5\u9053\u5206\u4f17\u4f20\u5a92CEO\u6c5f\u5357\u6625\u4eca\u65e5\u5728\u897f\u5b89\u51fa\u5e2d\u590f\u5b63\u4e9a\u5e03\u529b\u4f01\u4e1a\u5bb6\u8bba\u575b\u65f6\u6307\u51fa\uff0c\u5206\u4f17\u7535\u68af\u5a92\u4f53\u5df2\u6210\u5f53...",
 "img": "http:\/\/news.coolban.com\/Upload\/thumb\/160826\/80-60-192IV052-0.jpg",
 "src_img": "http:\/\/e.hiphotos.baidu.com\/news\/crop%3D0%2C32%2C537%2C322%3Bw%3D638\/sign=51f36f44af86c9171c4c0879f40d5cfc\/8435e5dde71190efb2ff1963c61b9d16fdfa6002.jpg",
 "sitename": "\u767e\u5bb6\u81ea\u5a92\u4f53",
 "addtime": "1472212414",
 */

@end
