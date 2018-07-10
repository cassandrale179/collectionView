// Import header files here
#import "ViewController.h"
#import "ImageCollectionViewCell.h"


// List of constants
const int totalImages = 9.0;

// Implementation of View Controller
@implementation ViewController

#pragma mark - collectionView methods
// This will be called 9 times, each time for 1 cell
- (UICollectionViewCell *) collectionView:(UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[_image_Arr objectAtIndex:indexPath.row]];
    return cell;
}

// Return number of items in array
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return totalImages;
}

#pragma mark - view methods
- (void)viewDidLoad{
    [super viewDidLoad];

    // Dynamically create name
    _image_Arr = [NSMutableArray array];
    for (int i = 1; i <= totalImages; i++){
        NSString *name =[@"image" stringByAppendingFormat:@"%d",i];
        [_image_Arr addObject:name];
    }
}


@end
