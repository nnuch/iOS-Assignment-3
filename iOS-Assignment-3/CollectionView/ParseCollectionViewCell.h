//
//  ParseCollectionViewCell.h
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-29.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ParseCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *parseImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingSpinner;

@end
