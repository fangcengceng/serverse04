//
//  xmlModel.h
//  SAXAnylasysXml
//
//  Created by codygao on 16/8/26.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xmlModel : NSObject
@property(nonatomic,copy)NSString *videoId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *length;
@property(nonatomic,copy)NSString *videoURL;
@property(nonatomic,copy)NSString *imageURL;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *teacher;
/*
 <video videoId="1">
 <name>01.C语言-语法预览</name>
 <length>320</length>
 <videoURL>/itcast/videos/01.C语言-语法预览.mp4</videoURL>
 <imageURL>/itcast/images/head1.png</imageURL>
 <desc>C语言-语法预览</desc>
 <teacher>李雷</teacher>
 </video>
 */
@end
