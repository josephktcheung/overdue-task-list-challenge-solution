//
//  EditTaskViewController.h
//  Overdue Task List Assignment Solution
//
//  Created by Joseph Cheung on 5/8/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTTask.h"

@protocol EditTaskViewControllerDelegate <NSObject>

- (void)didEditTask;

@end

@interface EditTaskViewController : UIViewController

@property (weak, nonatomic) id <EditTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *taskDetailTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) OTTask *task;

- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
