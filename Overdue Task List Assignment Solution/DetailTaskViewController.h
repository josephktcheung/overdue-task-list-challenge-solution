//
//  DetailTaskViewController.h
//  Overdue Task List Assignment Solution
//
//  Created by Joseph Cheung on 5/8/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTTask.h"

@interface DetailTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *taskNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *taskDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) OTTask *task;

- (IBAction)editBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
