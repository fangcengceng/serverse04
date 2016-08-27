//
//  HMDemoView.m
//  手势解锁
//
//  Created by codygao on 16/7/31.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoView.h"

@implementation HMDemoView{
    NSMutableArray *_buttonArray;
    
    CGPoint _curentP;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}
#pragma  mark 绘图
- (void)drawRect:(CGRect)rect {
    //获取路径
    UIBezierPath *path=[UIBezierPath bezierPath];
  //遍历集合，划线
   [_buttonArray enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       if(idx==0){
           [path moveToPoint:obj.center];
           
       }
       [path addLineToPoint:obj.center];
       
   }];
    
    if(_buttonArray.count>0){
        [path addLineToPoint:_curentP];
    }
    [path setLineWidth:10];
    [path setLineCapStyle:kCGLineCapRound];
    
    path.lineJoinStyle=kCGLineJoinRound;
    [[UIColor grayColor ]  setStroke];
    //[path stroke];
    [path strokeWithBlendMode:kCGBlendModeNormal alpha:0];
    
    
}
#pragma mark 清除线
-(void)clearScreen{
    [_buttonArray enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.selected=NO;
        obj.enabled=NO;
    }];
    
    [_buttonArray removeAllObjects];
    
    //重新绘制
    [self setNeedsDisplay];
}


#pragma mark 添加手势事件
-(void)unlockAction:(UILongPressGestureRecognizer *)recoginizer{
    //获取触摸点
    CGPoint loc = [recoginizer locationInView:self];
    //根据手势的不同状态，选择不同的方法。
    switch (recoginizer.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
        {
            _curentP=loc;
           //判断当前点是在哪个点身上
           [self.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
             BOOL isContain =  CGRectContainsPoint(obj.frame, _curentP);
            if(isContain && obj.selected==NO ){
                   obj.selected=YES;
                   [_buttonArray addObject:obj];
                
               }
           }];
            [self setNeedsDisplay];
        }
            break;
        case  UIGestureRecognizerStateEnded:
        {
            //拼接密码
            NSMutableString *passStr=[NSMutableString string];
            
            //遍历数组，获得数组的下标
            [_buttonArray enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSUInteger buttonIndex=[self.subviews indexOfObject:obj];
                [passStr appendFormat:@"%@",@(buttonIndex)];

            }];
            
            //需要判断密码是否正确，有控制器进行判断，代理
            if([self.delegate respondsToSelector:@selector(makeSure:didFinishPassWord:)]){
                [self.delegate makeSure:self didFinishPassWord:passStr];
            }
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            break;
            
        default:
            break;
    }
    
}

#pragma mark 布局子控件
-(void)layoutSubviews{
  [super layoutSubviews];
    NSArray *array=self.subviews;
    int colums=3;
    CGFloat width=self.frame.size.width/(2*colums+1);
    CGFloat heigh=width;
    
   [array enumerateObjectsUsingBlock:^(UIView*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       NSInteger colum=idx%colums;
       NSInteger row=idx/colums;
       
       CGFloat x=(2*colum +1)*width;
       CGFloat y=(2*row+1) *heigh;
       obj.frame=CGRectMake(x, y, width, heigh);
       
   }];
}
#pragma mark setupUI;
-(void)setupUI{
    //添加手势
    UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(unlockAction:)];
    longPress.minimumPressDuration=0.1;
    [self addGestureRecognizer:longPress];
    _buttonArray=[NSMutableArray array];
    
    //添加按钮
    for(NSInteger i=0;i<9;i++){
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal] ;
        [button  setImage:[UIImage imageNamed:@"gesture_node_selected"] forState:UIControlStateSelected];
        [button setImage:[UIImage imageNamed:@"gesture_node_error"] forState:UIControlStateDisabled];
        button.userInteractionEnabled=NO;
        [self addSubview:button];
    }
}
@end
