//  ViewController.m
//  UICollectionView

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>


@property NSArray *image_Arr;
@property NSArray *label_Arr;

@end



@implementation ViewController




// Initialize Array and Labels
- (void)viewDidLoad {
    [super viewDidLoad];
    _image_Arr = [[NSArray alloc] initWithObjects:@"image1", @"image2", @"image3", @"image4", nil];
    _label_Arr = [[NSArray alloc] initWithObjects: @"One", @"Two", @"Three", @"Four", nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


// Return number of items in array
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _image_Arr.count;
}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell_ID" forIndexPath:indexPath];
    UIImageView *Image_View = (UIImageView *)[cell viewWithTag:100];
    UILabel *Label = (UILabel *)[cell viewWithTag:101];
    Image_View.image = [UIImage imageNamed:[_image_Arr objectAtIndex:indexPath.row]];
    Label.text = [_label_Arr objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}



@end
