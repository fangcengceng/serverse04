//
//  CommanView.m
//  普通视图控制器的生命周期
//
//  Created by codygao on 16/7/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "CommanView.h"
//生命周期之后调用，willmoveTowindow四个方法。
@implementation CommanView
-(void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview: newSuperview];
    NSLog(@"%s%@",__FUNCTION__,self.class);
}
-(void)didMoveToSuperview{
      NSLog(@"%s%@",__FUNCTION__,self.class);
}
-(void)willMoveToWindow:(UIWindow *)newWindow{
      NSLog(@"%s%@",__FUNCTION__,self.class);
    
}
-(void)didMoveToWindow{
    [super didMoveToWindow];
      NSLog(@"%s%@",__FUNCTION__,self.class);
}
//- (void)didAddSubview:(UIView *)subview{
//    [super didAddSubview:subview];
//      NSLog(@"%s%@",__FUNCTION__,self.class);
//}
//-(void)bringSubviewToFront:(UIView *)view{
//     NSLog(@"%s%@",__FUNCTION__,self.class);
//}

@end
