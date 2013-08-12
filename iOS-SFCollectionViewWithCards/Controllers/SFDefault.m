//
//  SFDefault.m
//  iOS-SFCollectionViewWithCards
//
//  Created by Scott Freschet on 8/11/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "SFDefault.h"

@interface SFDefault ()

@end

@implementation SFDefault

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Setup Nibs for different collectionViewCells
    UINib* cardNib1 = [UINib nibWithNibName:@"SFDefault_Cell1" bundle:nil];
    [self.xCollectionView registerNib:cardNib1 forCellWithReuseIdentifier:@"SFDefault_Cell1"];
    UINib* cardNib2 = [UINib nibWithNibName:@"SFDefault_Cell2" bundle:nil];
    [self.xCollectionView registerNib:cardNib2 forCellWithReuseIdentifier:@"SFDefault_Cell2"];
    
    // Initialize variables.
    self.xMutableArray = [[NSMutableArray alloc]init];
    
    DMCardItem* item = [[DMCardItem alloc]init];
    item.xType = @"1";
    item.xImage = [UIImage imageNamed:@"Pix_Duck.jpg"];
    item.xString_Title = @"Card #1";
    [self.xMutableArray addObject:item];
    
    DMCardItem* item2 = [[DMCardItem alloc]init];
    item2.xType = @"2";
    item2.xImage = [UIImage imageNamed:@"Pix_UCLA.jpeg"];
    item2.xString_Title = @"Card #2";
    [self.xMutableArray addObject:item2];
    
    DMCardItem* item3 = [[DMCardItem alloc]init];
    item3.xType = @"1";
    item3.xImage = [UIImage imageNamed:@"Pix_Duck.jpg"];
    item3.xString_Title = @"Card #3";
    [self.xMutableArray addObject:item3];
    
    DMCardItem* item4 = [[DMCardItem alloc]init];
    item4.xType = @"2";
    item4.xImage = [UIImage imageNamed:@"Pix_UCLA.jpeg"];
    item4.xString_Title = @"Card #4";
    [self.xMutableArray addObject:item4];
    
    DMCardItem* item5 = [[DMCardItem alloc]init];
    item5.xType = @"2";
    item5.xImage = [UIImage imageNamed:@"Pix_UCLA.jpeg"];
    item5.xString_Title = @"Card #5";
    [self.xMutableArray addObject:item5];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


///////////////////////////////////////////////////////////////////
#pragma mark - UICollectionView Datasource
///////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.xMutableArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Get dmCardItem.
    DMCardItem* dmCardItem = [self.xMutableArray objectAtIndex:indexPath.row];
    if ([dmCardItem.xType isEqualToString:@"1"])
    {
        // Get cell.
        SFDefault_CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SFDefault_Cell1" forIndexPath:indexPath];
        
        cell.xImageView.image = dmCardItem.xImage;
        cell.xLabel_Title.text = dmCardItem.xString_Title;
        
        /*
        // Get vmThread.
        VMThread* vmThread = [vmFeedItem.primaryObjectArray objectAtIndex:0];
        
        // Setup xTTTLabel.
        cell.xTTTLabel_Message.delegate = self;
        NSString* string = [ModelHelper buildMessage:vmFeedItem.type
                                            senderId:vmFeedItem.senderId
                                          senderName:vmFeedItem.senderName
                                        senderGender:vmFeedItem.senderGender
                                         recipientId:vmFeedItem.dmFeedItem_User.userId
                                       objectOwnerId:vmFeedItem.objectOwnerId
                                     objectOwnerName:vmFeedItem.objectOwnerName];
        cell.xTTTLabel_Message.text = string;
        NSRange range = [cell.xTTTLabel_Message.text rangeOfString:vmFeedItem.senderName];
        [cell.xTTTLabel_Message addLinkToPhoneNumber:[NSString stringWithFormat:@"%@,%@", vmFeedItem.senderId, vmFeedItem.senderName] withRange:range];
        CGSize maximumLabelSize = CGSizeMake(cell.xTTTLabel_Message.frame.size.width, cell.xTTTLabel_Message.frame.size.height);
        CGSize expectedLabelSize = [string sizeWithFont:cell.xTTTLabel_Message.font constrainedToSize:maximumLabelSize lineBreakMode:cell.xTTTLabel_Message.lineBreakMode];
        CGRect newFrame = cell.xTTTLabel_Message.frame;
        newFrame.size.height = expectedLabelSize.height;
        cell.xTTTLabel_Message.frame = newFrame;
        
        
        // Setup xImageView_ObjectIcon.
        cell.xImageView_ObjectIcon.clipsToBounds = YES;
        
        // setup xLabel_TimeStamp.
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        NSString *result = [formatter stringFromDate:vmThread.dmThread.created];
        cell.xLabel_Timestamp.text = result;
        
        // Setup xProfilePictureView.
        cell.xProfilePictureview_Icon.profileID = vmThread.dmThread.creatorId;
        
        // Setup xLabel_Title & xLabel_Name.
        cell.xLabel_Titile.text = vmThread.dmThread.title;
        cell.xLabel_Name.text = [NSString stringWithFormat:@"%@ | Holds %d items", vmThread.dmThread.creatorName, vmThread.vmPhotographs.count];
        
        // Setup photographs.
        [cell.xScrollView_Photographs removeFromSuperview];
        cell.xScrollView_Photographs = [[UIScrollView alloc]initWithFrame:CGRectMake(172, 5, 120, 120)];
        cell.xScrollView_Photographs.bounces = NO;
        cell.xScrollView_Photographs.pagingEnabled = YES;
        cell.xScrollView_Photographs.backgroundColor = [UIColor clearColor];
        [cell.xView_FrontSide addSubview:cell.xScrollView_Photographs];
        [cell.xView_FrontSide sendSubviewToBack:cell.xScrollView_Photographs];
        
        int count = vmThread.vmPhotographs.count;
        for (int i = 0; i < count; i++)
        {
            // Create a view.
            UIView* view = [[UIImageView alloc]initWithFrame:CGRectMake(cell.xScrollView_Photographs.frame.size.width * i, 0, cell.xScrollView_Photographs.frame.size.width, cell.xScrollView_Photographs.frame.size.height)];
            view.backgroundColor = [UIColor clearColor];
            
            UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(2.5, 2.5, (view.frame.size.width - 5), (view.frame.size.height - 5))];
            imageView.userInteractionEnabled = YES;
            TapGestureRecognizer_Custom* imageViewTap = [[TapGestureRecognizer_Custom alloc]initWithTarget:self action:@selector(threadPhotoTapped:)];
            imageViewTap.xString_Data = [NSString stringWithFormat:@"%d,%d", indexPath.row, i];
            [imageView addGestureRecognizer:imageViewTap];
            
            [view addSubview:imageView];
            VMPhotograph* vmPhotograph = [vmThread.vmPhotographs objectAtIndex:i];
            [imageView setImageWithPhotographStorageKey:vmPhotograph.dmPhotograph.storageKeyLarge
                                          resizeToWidth:imageView.frame.size.width
                                       placeholderImage:nil];
            
            [cell.xScrollView_Photographs addSubview:view];
            
        }
        
        cell.xScrollView_Photographs.contentSize = CGSizeMake(cell.xScrollView_Photographs.frame.size.width * count, cell.xScrollView_Photographs.frame.size.height);
        cell.xScrollView_Photographs.clipsToBounds = NO;
        */
         
        return cell;
    }
    else if ([dmCardItem.xType isEqualToString:@"2"])
    {
        // Get cell.
        SFDefault_CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SFDefault_Cell2" forIndexPath:indexPath];
        
        cell.xImageView.image = dmCardItem.xImage;
        cell.xLabel_Title.text = dmCardItem.xString_Title;
        
        /*
        // Get vmClosetItem.
        VMClosetItem* vmClosetItem = [vmFeedItem.primaryObjectArray objectAtIndex:0];
        
        cell.xTTTLabel_Message.delegate = self;
        NSString* string = [ModelHelper buildMessage:vmFeedItem.type
                                            senderId:vmFeedItem.senderId
                                          senderName:vmFeedItem.senderName
                                        senderGender:vmFeedItem.senderGender
                                         recipientId:vmFeedItem.dmFeedItem_User.userId
                                       objectOwnerId:vmFeedItem.objectOwnerId
                                     objectOwnerName:vmFeedItem.objectOwnerName];
        cell.xTTTLabel_Message.text = string;
        NSRange range = [cell.xTTTLabel_Message.text rangeOfString:vmFeedItem.senderName];
        [cell.xTTTLabel_Message addLinkToPhoneNumber:[NSString stringWithFormat:@"%@,%@", vmFeedItem.senderId, vmFeedItem.senderName] withRange:range];
        CGSize maximumLabelSize = CGSizeMake(cell.xTTTLabel_Message.frame.size.width, cell.xTTTLabel_Message.frame.size.height);
        CGSize expectedLabelSize = [string sizeWithFont:cell.xTTTLabel_Message.font constrainedToSize:maximumLabelSize lineBreakMode:cell.xTTTLabel_Message.lineBreakMode];
        CGRect newFrame = cell.xTTTLabel_Message.frame;
        newFrame.size.height = expectedLabelSize.height;
        cell.xTTTLabel_Message.frame = newFrame;
        
        // Setup Photograph.
        cell.xImageView_Photgraph.clipsToBounds = YES;
        [cell.xImageView_Photgraph setImageWithPhotographId:vmClosetItem.dmClosetItem.photographId
                                              resizeToWidth:130
                                           placeholderImage:nil];
        cell.xImageView_Photgraph.tag = indexPath.row;
        UITapGestureRecognizer* closetItemTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closetItemTapped:)];
        [cell.xImageView_Photgraph addGestureRecognizer:closetItemTap];
        
        // Setup Message.
        cell.xLabel_Timestamp.text = vmFeedItem.timestamp;
        cell.xImageView_ObjectIcon.clipsToBounds = YES;
        */
         
        return cell;
    }
    else
    {
        return nil;
    }
    return nil;
}

///////////////////////////////////////////////////////////////////
#pragma mark - UICollectionView Delegate
///////////////////////////////////////////////////////////////////

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //
}

///////////////////////////////////////////////////////////////////
#pragma mark - UICollectionView Delegate (FlowLayout)
///////////////////////////////////////////////////////////////////

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Get dmCardItem.
    DMCardItem* dmCardItem = [self.xMutableArray objectAtIndex:indexPath.row];
    if ([dmCardItem.xType isEqualToString:@"1"])
    {
        CGSize cellSize = CGSizeMake(320, 250);
        return cellSize;
    }
    else if ([dmCardItem.xType isEqualToString:@"2"])
    {
        CGSize cellSize = CGSizeMake(320, 100);
        return cellSize;
    }
    else
    {
        CGSize cellSize = CGSizeMake(0, 0);
        return cellSize;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
