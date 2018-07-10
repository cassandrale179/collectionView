#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

// Performs any clean up necessary to prepare the view for use again.
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.imageView.image = nil;
}

@end
