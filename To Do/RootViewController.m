//
//  RootViewController.m
//  To Do
//
//  Created by Jets39 on 12/14/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController {
    
    NSUserDefaults *def;
    NSMutableArray *toDoItems;
    NSData *myData;
    
    NSMutableArray *filteredToDoItems;
    BOOL isFiltered;
   
}

- (void)viewWillAppear:(BOOL)animated {
    
    def = [NSUserDefaults standardUserDefaults];
    myData= [def objectForKey:@"todo"];
    
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
    
    
    [self.tableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    def = [NSUserDefaults standardUserDefaults];
    
    myData = [NSData new];
    
    isFiltered = false;
    self.searchBar.delegate = self;
    
    }
 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (isFiltered) { return filteredToDoItems.count; }
    
    return [toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *imageName;
    
    if(isFiltered)
    {
        cell.textLabel.text = [[filteredToDoItems objectAtIndex:indexPath.row] iName];
        cell.detailTextLabel.text = [[filteredToDoItems objectAtIndex:indexPath.row] iName];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        if([[[filteredToDoItems objectAtIndex:indexPath.row]iPriority]
            isEqual: @"low"])
        {
            imageName = @"low.png";
        } else if ([[[filteredToDoItems objectAtIndex:indexPath.row]iPriority]
                    isEqual: @"high"]) {
            imageName = @"high.png";
        }else if ([[[filteredToDoItems objectAtIndex:indexPath.row]iPriority]
                   isEqual: @"medium"]) {
            imageName = @"medium.png";;
        }
        cell.imageView.image = [UIImage imageNamed:imageName];
        
    } else {
        
        cell.textLabel.text = [[toDoItems objectAtIndex:indexPath.row] iName];
        cell.detailTextLabel.text = [[toDoItems objectAtIndex:indexPath.row] iName];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        if([[[toDoItems objectAtIndex:indexPath.row]iPriority]  isEqual: @"low"])
        {
            imageName = @"low.png";
        } else if ([[[toDoItems objectAtIndex:indexPath.row]iPriority]  isEqual: @"high"]) {
            imageName = @"high.png";
        }else if ([[[toDoItems objectAtIndex:indexPath.row]iPriority]  isEqual: @"medium"]) {
            imageName = @"medium.png";;
        }
        cell.imageView.image = [UIImage imageNamed:imageName];
    }
     
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddTaskViewController *editVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addTask"];
    editVC.editItem = [toDoItems objectAtIndex:indexPath.row];
    editVC.isEditable = YES;
    editVC.indexForObject = indexPath.row;
    [editVC setProtocol:self];
    [self.navigationController pushViewController:editVC animated:YES];
}


-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    
    ViewEditViewController *viewVC = [self.storyboard instantiateViewControllerWithIdentifier:@"viewEdit"];
    
    viewVC.viewItem = [toDoItems objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:viewVC animated:YES];
}

- (IBAction)add:(id)sender {
    
    AddTaskViewController *add = [self.storyboard instantiateViewControllerWithIdentifier:@"addTask"];
    [add setProtocol:self];
    [self.navigationController pushViewController:add animated:YES];
}

- (void)addNewToDoItems :(ToDoItem*) item {
    
    def = [NSUserDefaults standardUserDefaults];
    [toDoItems addObject:item];
    myData = [NSKeyedArchiver archivedDataWithRootObject:toDoItems];
    [def setObject:myData forKey:@"todo"];
    [def synchronize];
    
    [self.tableView reloadData];
}

-(void)editExsitingToDoItem :(ToDoItem*) editedItem :(int) atIndex {
    
    def = [NSUserDefaults standardUserDefaults];
    [toDoItems replaceObjectAtIndex:atIndex withObject:editedItem];

    myData = [NSKeyedArchiver archivedDataWithRootObject:toDoItems];
    [def setObject:myData forKey:@"todo"];
    [def synchronize];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    if (searchText.length == 0) {
        
        isFiltered = false;
        
        [self.searchBar endEditing:YES];
        
    }
    
    else {
        
        isFiltered = true;
        
        filteredToDoItems = [[NSMutableArray alloc]init];
        
        for (ToDoItem *item in toDoItems) {
            
            NSRange range = [item.iName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (range.location != NSNotFound) {
                
                [filteredToDoItems addObject:item];
                
            }
            
        }
        
    }
    
    [self.tableView reloadData];
}

@end

