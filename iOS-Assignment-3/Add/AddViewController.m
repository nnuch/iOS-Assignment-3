//
//  AddViewController.m
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-30.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "AddViewController.h"
#import <Parse/Parse.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h> //Cicle button


@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) IBOutlet UIButton *buttonAdd;

@end

@implementation AddViewController

UIImage *originalImage, *editedImage, *imageToUse;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: Navigation
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    _buttonAdd.layer.cornerRadius = 10;
    _buttonAdd.clipsToBounds = true;
    
}



- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO) || (delegate == nil) || (controller == nil))
        return NO;
    
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // Displays saved pictures and movies, if both are available, from the Camera Roll album.
    mediaUI.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    
    mediaUI.allowsEditing = NO;
    mediaUI.delegate = delegate;
    [controller presentModalViewController: mediaUI animated: YES];
    
    return YES;
    
}


//MARK: ImagePicker
- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    //UIImage *originalImage, *editedImage, *imageToUse;
    
    
    // Handle a still image picked from a photo album
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)== kCFCompareEqualTo) {
        editedImage = (UIImage *) [info objectForKey: UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey: UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToUse = editedImage;
        } else {
            imageToUse = originalImage;
        }
        
        // Do something with imageToUse
        [_myImageView setImage:originalImage];
    }
    
    
    // Handle a movied picked from a photo album
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0)  == kCFCompareEqualTo) {
        NSString *moviePath = [[info objectForKey: UIImagePickerControllerMediaURL] path];
        
        // Do something with the picked movie available at moviePath
    }
    [self dismissModalViewControllerAnimated:YES];
    
}

- (IBAction)addImage:(id)sender {
    [self startMediaBrowserFromViewController: self usingDelegate: self];
}


- (IBAction)post:(id)sender {
    
    if ((_myImageView.image != nil) && (_myTextField.text != nil)) {
        
        // Sync to cloud.
        // Create a new Parse Object
        PFObject *MyPostObject = [PFObject objectWithClassName:@"MyPost"];
        MyPostObject[@"message"] = _myTextField.text;
        
        PFFile *imageFile = [PFFile fileWithName:@"image.png" data:UIImageJPEGRepresentation(originalImage, 0.05f)];
        
        MyPostObject[@"imageFile"] = imageFile;
        [MyPostObject save];
        [MyPostObject saveInBackground];    // Send the parse object to the cloud
        [MyPostObject pinInBackground];
        [MyPostObject saveEventually];      //Save
      
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hooley!" message:@"Uploaded Successfully" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
        
        _myTextField.text = nil;
        _myImageView.image = nil;
        
    } else {
        
        NSLog(@"Something To Print");
        UIAlertController *noDataalertController = [UIAlertController alertControllerWithTitle:@"Oooop!" message:@"Please,enter your message and choose image!" preferredStyle:UIAlertControllerStyleAlert];
        [noDataalertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:noDataalertController animated:YES completion:nil];
        
    }
    
}



//Keyboard show and hide
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

