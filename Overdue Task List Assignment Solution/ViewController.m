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
    
    NSArray *taskObjectsAsPropertyLists = [[NSUserDefaults standardUserDefaults] objectForKey:TASK_OBJECTS_KEY];
    for (NSDictionary *dictionary in taskObjectsAsPropertyLists) {
        OTTask *taskObject = [self taskObjectForDictionary:dictionary];
        [self.taskObjects addObject:taskObject];
    }
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
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

- (OTTask *)taskObjectForDictionary:(NSDictionary *)dictionary
{
    OTTask *taskObject = [[OTTask alloc] initWithData:dictionary];
    return taskObject;
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
    
    [self.tableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableView Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taskObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    OTTask *task = [self.taskObjects objectAtIndex:indexPath.row];
    cell.textLabel.text = task.taskTitle;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    cell.detailTextLabel.text = [formatter stringFromDate:task.taskDate];
    
    return cell;
}

@end
