//
//  PageViewController.m
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-03-30.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController.h"
@interface PageViewController ()
{
    NSArray *about;
}
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    about = @[@"page-1",@"page-2", @"page-3" ];
    self.dataSource = self;
    
    ViewController *intialVC = (ViewController *)[self viewControllerAtIndex:0];
    NSArray *viewControllors = [NSArray arrayWithObjects:intialVC, nil];
    [self setViewControllers:viewControllors direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//helper method
- (UIViewController *) viewControllerAtIndex: (NSUInteger)index{
    //creating instance
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.strImage = about[index];
    viewController.pageIndex = index;
    
    return viewController;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--; // or index = index - 1;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:( UIViewController *)viewController {
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index++; // or index = index + 1;
    
    if (index == about.count) {
        return nil;
    }
    
     return [self viewControllerAtIndex:index];
}


// fixed problem, button didn't appear on the screen.
// indicator button get called by using presentationCountForPageViewController methods
- (void) setupPageControl
{
    [[UIPageControl appearance] setPageIndicatorTintColor: [UIColor lightGrayColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor: [UIColor greenColor]];
    [[UIPageControl appearance] setTintColor: [UIColor greenColor]];
    [[UIPageControl appearance] setBackgroundColor:  [UIColor whiteColor]];

    
}

- (NSInteger) presentationCountForPageViewController: (UIPageViewController *) pageViewController
{
    [self setupPageControl];
    return [about count];
}

- (NSInteger) presentationIndexForPageViewController: (UIPageViewController *) pageViewController
{
    return 0;
}


@end
