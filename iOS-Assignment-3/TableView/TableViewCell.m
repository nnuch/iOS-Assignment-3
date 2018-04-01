//
//  TableViewCell.m
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-29.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize imageFile, cellTitle;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
