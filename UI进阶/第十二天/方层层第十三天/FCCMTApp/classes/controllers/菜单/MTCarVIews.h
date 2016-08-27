//
//  MTCarVIews.h
//  FCCMTApp
//
//  Created by codygao on 16/8/11.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTFoodsModel,MTCarVIews;
@protocol MTCarVIewsDelegate <NSObject>

-(void)bottomCarView:(MTCarVIews*)bottomCarView needsDisplay:(NSMutableArray<MTFoodsModel*> *)selectedModel;

@end
@interface MTCarVIews : UIView
//声明一个属性，用来接受控制器传递过来的数据
@property (nonatomic,assign ) NSMutableArray<MTFoodsModel*> *shoplist;
@property(nonatomic,weak) id<MTCarVIewsDelegate> delegate;
@end
