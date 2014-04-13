//
//  Employee.h
//  SQLiteExample1
//
//  Created by James Derry on 4/9/14.
//  Copyright (c) 2014 James Derry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property(nonatomic, strong) NSString *firstName;
@property(nonatomic, strong) NSString *lastName;

@property int age;

@property(nonatomic, strong) NSString *deptName;

@end
