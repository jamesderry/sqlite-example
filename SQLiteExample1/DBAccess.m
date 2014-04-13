//
//  DBAccess.m
//  SQLiteExample1
//
//  Created by James Derry on 4/9/14.
//  Copyright (c) 2014 James Derry. All rights reserved.
//

#import "DBAccess.h"


@implementation DBAccess
{
    sqlite3 *database;
}

- (id)init
{
    if (self = [super init]) {
        
        //set reference to database
        [self initializeDatabase];
    }
    return self;
}

// Open the database connection
- (void)initializeDatabase
{
    // Get the database from the application bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HumanResources" ofType:@"db"];
    
    //Open the database
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        NSLog(@"Opening database.");
    } else {
        //Call close to properly clean up
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database: '%s'.", sqlite3_errmsg(database));
    }
}

// Close the database connection
-(void)closeDatabase
{
    if (sqlite3_close(database) != SQLITE_OK) {
        NSAssert1(0, @"Error: failed to close database: '%s'.", sqlite3_errmsg(database));
    }
}

- (NSMutableArray *)getAllEmployees
{
    // The array of employees
    NSMutableArray *employees = [[NSMutableArray alloc] init];
    
    // our SQL statement to execute against the database
    const char *sql = "SELECT FirstName, LastName, Age, DeptName FROM Employees, Department where Employees.DepartmentID=Department.DepartmentID";
    
    sqlite3_stmt *statement;
    
    //Prepare the statement to compile SQL query into byte-code
    int sqlResult = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
    
    if (sqlResult == SQLITE_OK) {
        //step through the results - once for each row.
        while (sqlite3_step(statement) == SQLITE_ROW) {
            // for each row, allocate an Employee object
            Employee *employee = [[Employee alloc] init];
            
            // the second parameter is the column index (zero based) in the result set
            char *fname = (char *)sqlite3_column_text(statement, 0);
            char *lname = (char *)sqlite3_column_text(statement, 1);
            int     age = sqlite3_column_int(statement, 2);
            char *dept  = (char *)sqlite3_column_text(statement, 3);
            
            employee.firstName = fname ? [NSString stringWithUTF8String:fname] : @"";
            employee.lastName = lname ? [NSString stringWithUTF8String:lname] : @"";
            employee.age = age;
            employee.deptName = dept ? [NSString stringWithUTF8String:dept] : @"";
            
            // add employee to employee array
            [employees addObject:employee];
        }
        // Finalize the statement to release its resources
        sqlite3_finalize(statement);
    } else {
        NSLog(@"Problem with the database.");
        NSLog(@"%d", sqlResult);
    }
    
    return employees;
}


@end
