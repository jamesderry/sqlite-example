//
//  MasterViewController.h
//  SQLiteExample1
//
//  Created by James Derry on 4/9/14.
//  Copyright (c) 2014 James Derry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "DBAccess.h"

@interface MasterViewController : UITableViewController

@property(nonatomic, strong) NSMutableArray *employees;

@end
