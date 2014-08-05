//
//  OTTask.h
//  Overdue Task List Assignment Solution
//
//  Created by Joseph Cheung on 5/8/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTTask : NSObject

@property (strong, nonatomic) NSString *taskTitle;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSDate *taskDate;
@property (nonatomic) BOOL taskCompletion;

@end
