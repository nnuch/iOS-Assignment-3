//
//  DetailTableViewController.m
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-30.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "DetailTableViewController.h"
#import "TableViewController.h"
#import <UIKit/UIKit.h>



@interface DetailTableViewController ()

@end

@implementation DetailTableViewController
@synthesize labelText, labelTexts, imageFile, myimageFile;


- (void)viewDidLoad {
   // [super viewDidLoad];
    self.navigationItem.largeTitleDisplayMode = NO;
    
    labelText.text = labelTexts ;
    [myimageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                NSLog(@"%@", data);
                imageFile.image = [UIImage imageWithData:data];
            }
    }];
    
}




@end
