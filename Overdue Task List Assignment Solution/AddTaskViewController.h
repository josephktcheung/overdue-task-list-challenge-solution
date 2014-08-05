//
//  AddTaskViewController.h
//  Overdue Task List Assignment Solution
//
//  Created by Joseph Cheung on 5/8/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTTask.h"
@protocol AddTaskViewControllerDelegate <NSObject>

- (void)didCancel;
- (void)didAddTask:(OTTask *)task;

@end


@interface AddTaskViewController : UIViewController

@property (weak, nonatomic) id <AddTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *taskDetailTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)addTaskButtonPressed:(UIButton *)sender;

@end
