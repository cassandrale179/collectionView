// Import header files here
#import "ViewController.h"
#import "CustomImageFlowLayout.h"
#import "ImageCollectionViewCell.h"


// List of constants
const int totalImages = 9.0;

// Implementation of View Controller
@implementation ViewController

// ------------------------------------------------------------------------ //
#pragma mark - collectionView methods
// This will be called 9 times, each time for 1 cell
- (UICollectionViewCell *) collectionView:(UICollectionView *) collectionView
                   cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[_image_Arr objectAtIndex:indexPath.row]];
    return cell;
}

// Return number of items in array
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
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


// Once the cell is loaded, loop through it
- (void) viewDidLayoutSubviews {
    NSUInteger count = [[self.Collection_view visibleCells] count];
//    if (count > 0){
//        for(UICollectionView *cell in self.Collection_view.visibleCells){
//            NSLog(@"Cell %@", cell);
//        }
//    }
}

// Get the current position of a cell
//-(void)collectionView:(UICollectionView *)cv didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewLayoutAttributes *attributes = [cv layoutAttributesForItemAtIndexPath:indexPath];
//    CGRect cellRect = attributes.frame;
//    CGRect cellFrameInSuperview = [cv convertRect:cellRect toView:[cv superview]];
//    NSLog(@"%f",cellFrameInSuperview.origin.x);
//}

// Not sure what this method does
//- (BOOL)collectionView:(UICollectionView *)collectionView
//shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//




// ------------------------------------------------------------------------ //
# pragma mark - Tap Gesture Method
// Create your own custom action for the menu controller here
- (void)customAction:(id)sender {
    NSLog(@"custom action! %@", sender);
    
}

// Handle tap gesture here
-(void) handleTapGesture:(UITapGestureRecognizer *)gesture{
    // Show the menu here
    //[self.view.window.makeKeyWindow]
    
    // Know x and y coordinate of user touch gesture
    CGPoint tappedPoint = [gesture locationInView:self.view];
    CGFloat xCoordinate = tappedPoint.x;
    CGFloat yCoordinate = tappedPoint.y;
    
     // Display the menu dynamically when the user click on it
    CGRect targetRectangle = CGRectMake(tappedPoint.x-100, tappedPoint.y, 200, 100);
    [[UIMenuController sharedMenuController] setTargetRect:targetRectangle inView:self.view];
    NSLog(@"Touch Using UITapGestureRecognizer x : %f y : %f", xCoordinate, yCoordinate);
    
    // Create a custom menu controller when user long-press on a cell
    UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"View" action:@selector(customAction:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:menuItem, nil]];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
}


# pragma mark - Creating Menu Method
- (BOOL) canBecomeFirstResponder {
    return YES;
}

 // If return YES only, it will display all items on the menu (cut, copy, paste, select,...etc.)
- (BOOL) canPerformAction:(SEL)action withSender:(id)sender{
    BOOL result = NO;
    if (@selector(copy:) == action || @selector(paste:) == action || @selector(customAction:) == action){
        result = YES;
    }
    return result;
}

- (void)collectionView:(UICollectionView *)collectionView
         performAction:(SEL)action
    forItemAtIndexPath:(NSIndexPath *)indexPath
            withSender:(id)sender {
    NSLog(@"performAction sender %@", sender);
}


// ------------------------------------------------------------------------ //
#pragma mark - view methods
- (void)viewDidLoad{
    NSLog(@"View did load");
    [super viewDidLoad];

    // Dynamically create name of the images
    _image_Arr = [NSMutableArray array];
    for (int i = 1; i <= totalImages; i++){
        NSString *name =[@"image" stringByAppendingFormat:@"%d",i];
        [_image_Arr addObject:name];
    }
    
    // Customize your own collection view layout
    self.Collection_view.collectionViewLayout = [[CustomImageFlowLayout alloc] init];
    
    // Create a toolbar
    NSMutableArray *buttons = [NSMutableArray array];
    NSArray *buttonTitleArr = [NSArray arrayWithObjects: @"Home", @"Search", @"Camera", @"Dashoard", @"Profile", nil];
    for (NSString* title in buttonTitleArr){
        UIBarButtonItem *button= [[UIBarButtonItem alloc]
                                  initWithTitle:title
                                  style:UIBarButtonItemStylePlain
                                  target:self action:@selector(action)];
        [buttons addObject:button];
    }
    [self.toolBar setItems: buttons animated:NO];
    
    // TODO: set the width of the button in a grid and make it icon insteads
    
    // Tap Gesture
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.view addGestureRecognizer:tapGesture];

}

@end
