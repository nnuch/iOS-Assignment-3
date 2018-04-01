//
//  TableViewController.h
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-29.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "TableViewCell.h"



@interface TableViewController : UIViewController <UITableViewDelegate> {
    NSArray *imagesArray;
    NSArray *messagesArray;
    NSArray *searchResults;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
