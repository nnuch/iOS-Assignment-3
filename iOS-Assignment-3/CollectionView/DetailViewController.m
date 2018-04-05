//
//  DetailViewController.m
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-31.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize  imageFile, myimageFile;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.largeTitleDisplayMode = NO;
    [myimageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            NSLog(@"%@", data);
            imageFile.image = [UIImage imageWithData:data];
        }
    }];
 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
