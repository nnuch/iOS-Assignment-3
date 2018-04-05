//
//  ParseViewController.m
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-29.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "ParseViewController.h"
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface ParseViewController ()

@end

@implementation ParseViewController
@synthesize imagesCollection;

- (void)viewDidLoad {
    [super viewDidLoad];

     [self queryParseMethod];
    //self.imagesCollection.backgroundColor =  [UIColor grayColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    double width = self.imagesCollection.frame.size.width;
    width /= 3;
    
    //calling queryParseMethod
    [self queryParseMethod];
    
  
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //calling queryParseMethod
    [self queryParseMethod];

}


- (void) queryParseMethod {
     NSLog(@"start query");
   
    
    PFQuery *query = [PFQuery queryWithClassName:@"MyPost"];

    //and it will return object found within that class
    //and assign too imageFileArray
   
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error){
            NSLog(@"pass");
            imageFileArray = [[NSArray alloc] initWithArray:objects];
            NSLog(@"%@", imageFileArray);
            [imagesCollection reloadData];
        }
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // number of sections
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // number of items
    return [imageFileArray count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // the custom cell we named for the reusable identifier
    static NSString *cellIdentifier = @"cell";
    ParseCollectionViewCell *cell = (ParseCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //Here where we wanna retrieve the image object files from parse
    //display data in UITableView in reverse order
    PFObject *imageObject = [imageFileArray objectAtIndex:(imageFileArray.count - indexPath.row - 1)];
    PFFile *imageFile = [imageObject objectForKey:@"imageFile"];
    cell.loadingSpinner.hidden = NO;
    [cell.loadingSpinner startAnimating];
   
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            NSLog(@"%@", data);
            cell.parseImage.image = [UIImage imageWithData:data];
            //[imagesCollection reloadData];
            
            [cell.loadingSpinner stopAnimating];
            cell.loadingSpinner.hidden = YES;
            
        }
    }];

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    PFObject *imageObject = [imageFileArray objectAtIndex:indexPath.row];
//    PFFile *imageFile = [imageObject objectForKey:@"imageFile"];
//    NSLog(@"%@", imageObject.objectId);
//    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//        if (!error) {
//            NSLog(@"%@", data);
//             _detailImage.image = [UIImage imageWithData:data];
//        }
//    }];
//
//    [self animatieDetailView];
    
    [self performSegueWithIdentifier:@"showDetail" sender:self];
    
  
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.imagesCollection indexPathsForSelectedItems][0];
    DetailViewController *vc = [segue destinationViewController];
    
     // load the image,
    NSLog(@"cell tapped");
    PFObject *imageObject = [imageFileArray objectAtIndex:(imageFileArray.count - indexPath.row - 1)];
    NSLog(@"%@", imageObject.objectId);
    vc.myimageFile = [imageObject objectForKey:@"imageFile"];
    
}



//animated to DetailView
//- (void) animatieDetailView {
//    [UIView animateWithDuration:0.5 animations:^{
//        _detailView.frame = CGRectMake(0, 0, 375, 641);
//    }];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissBtn:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        _detailView.frame = CGRectMake(375, 0, 375, 641);
    }];
}
@end
