//
//  OTTask.m
//  Overdue Task List Assignment Solution
//
//  Created by Joseph Cheung on 5/8/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import "OTTask.h"

@implementation OTTask

- (id)init
{
    self = [self initWithData:nil];
    return self;
}

- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    self.taskTitle = data[TASK_TITLE];
    self.taskDescription = data[TASK_DESCRIPTION];
    self.taskDate = data[TASK_DATE];
    self.taskCompletion = data[TASK_COMPLETION];
    
    return self;
}

@end
