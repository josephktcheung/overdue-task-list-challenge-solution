//
//  ViewController.h
//  Overdue Task List Assignment Solution
//
//  Created by Joseph Cheung on 5/8/14.
//  Copyright (c) 2014 Reque.st. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskViewController.h"

@interface ViewController : UIViewController <AddTaskViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *taskObjects;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)addTaskBarButtonItemPressed:(UIBarButtonItem *)sender;
- (IBAction)reorderBarButtonItemPressed:(UIBarButtonItem *)sender;

@end

