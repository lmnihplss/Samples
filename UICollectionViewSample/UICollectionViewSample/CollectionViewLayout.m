#import "CollectionViewLayout.h"

@implementation CollectionViewLayout
- (void)prepareLayout {
    _cellCount = [self.collectionView numberOfItemsInSection:0];
}

- (CGSize)collectionViewContentSize {
    CGSize size =  CGSizeMake(3600, 320);
    return size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(200, 300);
    
    CGFloat x =  150 + 250 * indexPath.row;
    attributes.center = CGPointMake(x, 320/2);
    
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i = 0; i < self.cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

@end
