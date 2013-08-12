//
//  SFDefault.h
//  iOS-SFCollectionViewWithCards
//
//  Created by Scott Freschet on 8/11/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMCardItem.h"
#import "SFDefault_CollectionViewCell.h"

@interface SFDefault : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

// Variables.
@property (strong, nonatomic) NSMutableArray* xMutableArray;

// IBOutlets.
@property (strong, nonatomic) IBOutlet UICollectionView* xCollectionView;

// IBActions.

@end
