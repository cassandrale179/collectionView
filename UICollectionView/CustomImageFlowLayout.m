#import "CustomImageFlowLayout.h"
@implementation CustomImageFlowLayout

// Spacing between each cell
- (instancetype)init{
    self = [super init];
    if (self){
        self.minimumLineSpacing = 1.0;                                      // vertical spacing between cell
        self.minimumInteritemSpacing = 1.0;                                 // horizontal spacing between cell
        self.scrollDirection = UICollectionViewScrollDirectionVertical;     // scroll direction should be vertical
    }
    return self;
}

// Return three columns here
- (CGSize)itemSize{
    NSInteger numberOfColumns = 3;
    CGFloat itemWidth = (CGRectGetWidth(self.collectionView.frame) - (numberOfColumns)) / numberOfColumns;
    return CGSizeMake(itemWidth, itemWidth);
}

@end
