//
//  DetailTaskViewController.m
//  Overdue Task List Assignment Solution
//
//  Created by Joseph Cheung on 5/8/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import "DetailTaskViewController.h"

@interface DetailTaskViewController ()

@end

@implementation DetailTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.taskNameLabel.text = self.task.taskTitle;
    self.taskDetailLabel.text = self.task.taskDescription;
    [self updateDateLabel:self.task.taskDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:[EditTaskViewController class]]) {
        EditTaskViewController *targetViewController = segue.destinationViewController;
        targetViewController.task = self.task;
        targetViewController.delegate = self;
    }
}

- (IBAction)editBarButtonItemPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toEditTaskViewControllerSegue" sender:sender];
}

#pragma mark - helper methods
- (void)updateDateLabel:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.dateLabel.text = [formatter stringFromDate:date];
}

#pragma mark - EditTaskViewController Delegate
- (void)didEditTask
{
    self.taskNameLabel.text = self.task.taskTitle;
    self.taskDetailLabel.text = self.task.taskDescription;
    [self updateDateLabel:self.task.taskDate];
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate didUpdateTask];
}

@end
