//
//  RootViewController.h
//  To Do
//
//  Created by Jets39 on 12/14/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskViewController.h"
#import "AddNewToDoItemsProtocol.h"
#import "ToDoItem.h"
#import "ViewEditViewController.h"

@interface RootViewController : UITableViewController
<AddNewToDoItemsProtocol,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
