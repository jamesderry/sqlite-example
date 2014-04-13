//
//  DBAccess.h
//  SQLiteExample1
//
//  Created by James Derry on 4/9/14.
//  Copyright (c) 2014 James Derry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Employee.h"

@interface DBAccess : NSObject
{
    
}

- (NSMutableArray *)getAllEmployees;
- (void)closeDatabase;
- (void)initializeDatabase;

@end
