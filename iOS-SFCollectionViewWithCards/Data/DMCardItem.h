//
//  DMCardItem.h
//  iOS-SFCollectionViewWithCards
//
//  Created by Scott Freschet on 8/11/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMCardItem : NSObject

@property (strong, nonatomic) NSString* xType;
@property (strong, nonatomic) UIImage* xImage;
@property (strong, nonatomic) NSString* xString_Title;
@property (strong, nonatomic) NSString* xString_Description;

@end
