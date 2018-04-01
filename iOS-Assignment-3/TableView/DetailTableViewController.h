//
//  DetailTableViewController.h
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-30.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface DetailTableViewController : ViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageFile;
@property (nonatomic, strong) PFFile *myimageFile;

@property (nonatomic, strong) NSString *labelTexts;
@property (weak, nonatomic) IBOutlet UILabel *labelText;




@end
