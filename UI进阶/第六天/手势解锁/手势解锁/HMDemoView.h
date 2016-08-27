//
//  HMDemoView.h
//  手势解锁
//
//  Created by codygao on 16/7/31.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMDemoView;
@protocol HMDemoViewDelegate <NSObject>

-(void)makeSure:(HMDemoView *)demoView didFinishPassWord:(NSString *)pashWord;

@end

@interface HMDemoView : UIView
@property(nonatomic,weak)id <HMDemoViewDelegate> delegate;
-(void)clearScreen;
@end
