//
//  PriorityTableViewController.h
//  To Do
//
//  Created by Remon Gerges Shehata on 12/26/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface PriorityTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegment;
@end

NS_ASSUME_NONNULL_END
