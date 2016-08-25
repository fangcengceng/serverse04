//
//  APPcollectionlayout.m
//  catchData
//
//  Created by codygao on 16/8/25.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "APPcollectionlayout.h"

@implementation APPcollectionlayout
-(void)prepareLayout{
    [super prepareLayout];

    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.itemSize = CGSizeMake(200,100);
    self.minimumInteritemSpacing = 20;
   
    self.minimumLineSpacing = 10;
    }
@end
