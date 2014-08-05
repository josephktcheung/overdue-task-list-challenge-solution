//
//  AddTaskViewController.m
//  Overdue Task List Assignment Solution
//
//  Created by Joseph Cheung on 5/8/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - helper methods

- (OTTask *)returnTask
{
    OTTask *task = [[OTTask alloc] init];
    task.taskTitle = self.taskNameTextField.text;
    task.taskDescription = self.taskDetailTextView.text;
    task.taskDate = self.datePicker.date;
    task.taskCompletion = NO;
    
    return task;
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButtonPressed:(UIButton *)sender
{
    [self.delegate didCancel];
}

- (IBAction)addTaskButtonPressed:(UIButton *)sender
{
    [self.delegate didAddTask:[self returnTask]];
}

@end
