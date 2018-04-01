//
//  ParseViewController.h
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-29.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseCollectionViewCell.h"

@interface ParseViewController : UIViewController {
    NSArray *imageFileArray;
    
   //Define imagesArray
    NSMutableArray *imagesArray;
    
}

@property (weak, nonatomic) IBOutlet UICollectionView *imagesCollection;

@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
- (IBAction)dismissBtn:(id)sender;

@end


