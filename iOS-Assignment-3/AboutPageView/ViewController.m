//
//  ViewController.m
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-28.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize strImage, pageIndex;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.aboutImages.image = [UIImage imageNamed:strImage];
 
}

@end


