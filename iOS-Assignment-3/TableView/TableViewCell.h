//
//  TableViewCell.h
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-29.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageFile;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;

@end
