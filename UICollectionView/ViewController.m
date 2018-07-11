// Import header files here
#import "ViewController.h"
#import "CustomImageFlowLayout.h"
#import "ImageCollectionViewCell.h"


// List of constants
const int totalImages = 9.0;

// Implementation of View Controller
@implementation ViewController

#pragma mark - collectionView methods
// This will be called 9 times, each time for 1 cell
- (UICollectionViewCell *) collectionView:(UICollectionView *) collectionView
                   cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[_image_Arr objectAtIndex:indexPath.row]];
    return cell;
}

// Return number of items in array
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"Return total images");
    return totalImages;
}

// Set a size for the header file first
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    NSLog(@"layout called");
    return CGSizeMake(60.0f, 60.0f);
}


// Link the header of collection view to the header we created (through the identifier) 
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
        UICollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind: kind withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        return view;
}


#pragma mark - view methods
- (void)viewDidLoad{
    NSLog(@"View did load");
    [super viewDidLoad];

    // Dynamically create name
    _image_Arr = [NSMutableArray array];
    for (int i = 1; i <= totalImages; i++){
        NSString *name =[@"image" stringByAppendingFormat:@"%d",i];
        [_image_Arr addObject:name];
    }
    
    
    // Customize your own collectionv iew layout
    self.Collection_view.collectionViewLayout = [[CustomImageFlowLayout alloc] init];

}

@end
