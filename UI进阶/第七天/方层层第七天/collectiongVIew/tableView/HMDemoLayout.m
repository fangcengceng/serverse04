//
//  HMDemoLayout.m
//  colletion
//
//  Created by codygao on 16/8/2.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMDemoLayout.h"

@implementation HMDemoLayout
-(void)prepareLayout{
    [super prepareLayout];
    self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing=1;
    self.minimumInteritemSpacing=0;
    CGFloat itemH = self.collectionView.bounds.size.height * 0.8;
    CGFloat itemW = itemH;
    self.itemSize = CGSizeMake(itemW, itemH);
    self.minimumLineSpacing = 0;
    CGFloat inset = (self.collectionView.bounds.size.width - itemW) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
}
//计算停留在中间的cell
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    CGPoint point = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    CGRect rect;
    rect.size = self.collectionView.bounds.size;
    rect.origin = proposedContentOffset;
    NSArray<UICollectionViewLayoutAttributes *> *visibleAttrs = [self layoutAttributesForElementsInRect:rect];
    CGFloat screenCenterX = proposedContentOffset.x + self.collectionView.bounds.size.width * 0.5;
    __block CGFloat minMargin = CGFLOAT_MAX;

    __block NSInteger index = -1;
    
    [visibleAttrs enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat distance = screenCenterX - obj.center.x;
        
        if (ABS(distance) < minMargin) {
            minMargin = ABS(distance);
            index = idx;
        }
    }];
    CGFloat offsetX = screenCenterX - visibleAttrs[index].center.x;

    return CGPointMake(point.x - offsetX, point.y);}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray<UICollectionViewLayoutAttributes *> *oldAttrsArr = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *tempArrM = [NSMutableArray array];
    [oldAttrsArr enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UICollectionViewLayoutAttributes *newAttr = obj.copy;
        CGFloat screenCenterX = self.collectionView.bounds.size.width * 0.5 + self.collectionView.contentOffset.x;
        CGFloat itemCenterX = newAttr.center.x;
        CGFloat distance = screenCenterX - itemCenterX;
        CGFloat scale = 1 - ABS(distance) / self.collectionView.bounds.size.width;
        CGFloat angle = (1 - scale) * M_PI_2;
        angle *= ((distance > 0) ? 1 : -1);
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = - 1.0 / 500;
        transform = CATransform3DScale(transform, scale, scale, 1);
        transform = CATransform3DRotate(transform, angle, 0, 1, 0);
        newAttr.transform3D = transform;
        [tempArrM addObject:newAttr];
    }];
    return tempArrM;
    
}
@end
