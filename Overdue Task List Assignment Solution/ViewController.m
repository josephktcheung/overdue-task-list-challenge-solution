//
//  ViewController.m
//  Overdue Task List Assignment Solution
//
//  Created by Joseph Cheung on 5/8/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lazy Instantiation
- (NSMutableArray *)taskObjects
{
    if (!_taskObjects) {
        _taskObjects = [[NSMutableArray alloc] init];
    }
    return _taskObjects;
}

#pragma mark - Controller Initialization

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[AddTaskViewController class]]) {
        AddTaskViewController *targetViewController = segue.destinationViewController;
        targetViewController.delegate = self;
    }
}


- (IBAction)addTaskBarButtonItemPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toAddTaskViewControllerSegue" sender:sender];
}

- (IBAction)reorderBarButtonItemPressed:(UIBarButtonItem *)sender {
}

#pragma mark - helper methods
-(NSDictionary *)taskObjectAsPropertyList:(OTTask *)taskObject
{
    NSDictionary *taskObjectAsPropertyList = @{TASK_TITLE : taskObject.taskTitle, TASK_DESCRIPTION : taskObject.taskDescription, TASK_DATE : taskObject.taskDate, TASK_COMPLETION : @(taskObject.taskCompletion)};
    return taskObjectAsPropertyList;
}


#pragma mark - AddTaskViewController Delegate

- (void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didAddTask:(OTTask *)task
{
    [self.taskObjects addObject:task];
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] objectForKey:TASK_OBJECTS_KEY] mutableCopy];
    
    if (!taskObjectsAsPropertyLists) taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    [taskObjectsAsPropertyLists addObject:[self taskObjectAsPropertyList:task]];
    
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
