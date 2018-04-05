//
//  TableViewController.m
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-29.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "TableViewController.h"
#import "DetailTableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.prefersLargeTitles = YES;
   
    [self retrieveFromParse];
   
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //calling ParseMethod
    [self retrieveFromParse];

    
    
}
- (void) retrieveFromParse {
    PFQuery *query = [PFQuery queryWithClassName:@"MyPost"];
    
    //and it will return object found within that class
    //and assign to Array
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error){
            messagesArray = [[NSArray alloc] initWithArray:objects];
            
            [tableView reloadData];
        }
    }];
    
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    
    //Do not let the user add if the app is in edit mode.
    if(editing)
        self.navigationItem.rightBarButtonItem.enabled = YES;
    else
        self.navigationItem.rightBarButtonItem.enabled = YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        PFObject *tempObject = [messagesArray  objectAtIndex:(messagesArray.count - indexPath.row - 1)];
        [tempObject deleteInBackground];
        [tempObject saveInBackground];
        NSLog(@"Successfully deleted!");
        [self retrieveFromParse];
        
       
    }
}

//Setup table
- (NSInteger) numberOfSectionsInTableView: (UITableView *)tableView {
    return 1;
}
//get number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [messagesArray count];
}

//Setup cells in tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    PFObject *tempObject = [messagesArray  objectAtIndex:(messagesArray.count - indexPath.row - 1)];
    cell.cellTitle.text = [tempObject objectForKey:@"message"];
    
    
    PFObject *imageObject = [messagesArray  objectAtIndex:(messagesArray.count - indexPath.row - 1)];
    PFFile *imageFile = [imageObject objectForKey:@"imageFile"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            NSLog(@"%@", data);
   
    cell.imageFile.image = [UIImage imageWithData:data];
            cell.imageFile.layer.borderColor = [UIColor lightGrayColor].CGColor;
            cell.imageFile.layer.borderWidth = 1.0f;
            cell.imageFile.layer.masksToBounds = YES;
            cell.imageFile.layer.cornerRadius = 50;
        }}];

    return cell;
            
}

//Passing Data Using Segue
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath* )indexPath{
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    DetailTableViewController *vc = [segue destinationViewController];
    
    
    NSLog(@"cell tapped");
    PFObject *tempObject = [messagesArray  objectAtIndex:(messagesArray.count - indexPath.row - 1)];
    NSLog(@"%@", tempObject.objectId);
    vc.labelTexts = [tempObject objectForKey:@"message"];

    //PFObject *imageObject = [messagesArray objectAtIndex:indexPath.row];
    PFObject *imageObject = [messagesArray  objectAtIndex:(messagesArray.count - indexPath.row - 1)];
    NSLog(@"%@", imageObject.objectId);
    vc.myimageFile = [imageObject objectForKey:@"imageFile"];

}

@end
