//
//  ViewController.h
//  UICollectionView
//
//  Created by Cassandra Le on 7/6/18.
//  Copyright © 2018 Cassandra Le. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *Collection_view;
@property NSMutableArray *image_Arr;
@property NSArray *label_Arr;

@end

