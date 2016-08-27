//
//  HMDemoView.h
//  MOdal
//
//  Created by codygao on 16/8/4.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMDemoView;
@protocol HMDemoViewDelegata <NSObject>

-(void)demoViewControllerdidFinish:(HMDemoView *)demoView userName:(NSDictionary*)info;

@end
@interface HMDemoView : UIViewController
@property(nonatomic,weak)id <HMDemoViewDelegata>delegate;

@end
