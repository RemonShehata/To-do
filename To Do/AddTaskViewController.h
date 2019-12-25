//
//  AddTaskViewController.h
//  To Do
//
//  Created by Jets39 on 12/14/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"
#import "AddNewToDoItemsProtocol.h"

@interface AddTaskViewController : UIViewController
    <UIPickerViewDataSource, UIPickerViewDelegate>

@property id <AddNewToDoItemsProtocol> protocol;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *descText;

@property (weak, nonatomic) IBOutlet UIPickerView *priorityPicker;

@property (weak, nonatomic) IBOutlet UIPickerView *statusPicker;

@property (weak, nonatomic) IBOutlet UIButton *addEditButton;
@property ToDoItem *editItem;
@property BOOL isEditable;
@property int indexForObject;

@end
