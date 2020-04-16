//
//  PriorityTableViewController.m
//  To Do
//
//  Created by Remon Gerges Shehata on 12/26/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "PriorityTableViewController.h"

@interface PriorityTableViewController ()

@end

@implementation PriorityTableViewController{
    NSMutableArray *priorityToDoItems;
    NSMutableArray *toDoItems;
    NSUserDefaults *def;
    NSData *myData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    priorityToDoItems = [NSMutableArray new];
    def = [NSUserDefaults standardUserDefaults];
    myData = [def objectForKey:@"todo"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    def = [NSUserDefaults standardUserDefaults];
    if(def != nil)
    {
        NSArray *savedItems = [NSKeyedUnarchiver unarchiveObjectWithData:myData];
        
        if(savedItems != nil)
        {
            toDoItems = [[NSMutableArray alloc] initWithArray:savedItems];
        } else {
            toDoItems = [NSMutableArray new];
        }
    }
    
    for (int index = 0; index < [toDoItems count]; index++) {
        ToDoItem *currentItem = [toDoItems objectAtIndex:index];
        if([currentItem.iPriority  isEqual: @"low"])
        {
            [priorityToDoItems addObject:currentItem];
        }
        
    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [priorityToDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"priorityCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString *imageName;
    
    
    cell.textLabel.text = [[priorityToDoItems objectAtIndex:indexPath.row] iName];
    cell.detailTextLabel.text = [[priorityToDoItems objectAtIndex:indexPath.row] iName];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    if([[[priorityToDoItems objectAtIndex:indexPath.row]iPriority]
        isEqual: @"low"])
    {
        imageName = @"low.png";
    } else if ([[[priorityToDoItems objectAtIndex:indexPath.row]iPriority]
                isEqual: @"high"]) {
        imageName = @"high.png";
    }else if ([[[priorityToDoItems objectAtIndex:indexPath.row]iPriority]
               isEqual: @"medium"]) {
        imageName = @"medium.png";;
    }
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)segmentChanged:(id)sender {
    
    int index = _prioritySegment.selectedSegmentIndex;
    NSString *priority;
    [priorityToDoItems removeAllObjects];
    switch (index) {
        case 0:
            priority = @"low";
            break;
            
        case 1:
            priority = @"medium";
            break;
            
        case 2:
            priority = @"high";
            break;
            
        default:
            break;
    }
    
    for (int index = 0; index < [toDoItems count]; index++) {
        ToDoItem *currentItem = [toDoItems objectAtIndex:index];
        if([currentItem.iPriority  isEqual: priority])
        {
            [priorityToDoItems addObject:currentItem];
        }
        
    }
    
    [self.tableView reloadData];
}




@end
