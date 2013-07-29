//
//  RootViewController.m
//  Locations
//
//  Created by Raj Wilhoit on 7/23/13.
//  Copyright (c) 2013 UF.rajwilhoit. All rights reserved.
//

#import "RootViewController.h"
#import "AddViewController.h"
#import "Event.h"

@interface RootViewController ()
{
    NSMutableArray *dataArray;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    dataArray = [NSMutableArray new];
    
    //Refresh data
    [self refreshData];

}

-(void) refreshData
{
    [dataArray removeAllObjects];
    NSArray *allRecords = [Event findAllSortedBy:@"name" ascending:YES];
    [dataArray addObjectsFromArray:allRecords];
    [self.tableView reloadData];
}

-(void) notificationNewPersonAdded:(NSNotification*)notification
{
    [self refreshData];
}

- (IBAction)addButtonSelected:(id)sender {
    NSLog(@"Add button IBAction selected");
    AddViewController *viewController = [[AddViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)deleteButtonSelected:(id)sender {
    [Event MR_truncateAll];
    [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
    [self refreshData];
}

// #pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // Configure the cell...
    Event *event = [dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = event.name;
    cell.detailTextLabel.text = event.date;
    
    return cell;
}

@end
