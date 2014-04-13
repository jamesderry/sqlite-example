//
//  DetailViewController.m
//  SQLiteExample1
//
//  Created by James Derry on 4/9/14.
//  Copyright (c) 2014 James Derry. All rights reserved.
//

#import "DetailViewController.h"
#import "Employee.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        Employee *employee = (Employee *)self.detailItem;
        self.detailDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@\n%i\n%@", employee.firstName, employee.lastName, employee.age, employee.deptName];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
