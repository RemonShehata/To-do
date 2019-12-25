//
//  AddTaskViewController.m
//  To Do
//
//  Created by Jets39 on 12/14/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController{
    
    NSArray *priorities;
    NSArray *status;
    NSString *selectedPriority;
    NSString *selectedStatus;
    
    NSMutableArray *returnedItems;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if(_isEditable)
    {
        _nameText.text = _editItem.iName;
        _descText.text = _editItem.iDescription;
        [_addEditButton setTitle:@"Edit" forState:UIControlStateNormal];
        
        [self.priorityPicker selectRow:
         [priorities indexOfObject:_editItem.iPriority] inComponent:0 animated:YES];
        
        [self.statusPicker selectRow:
         [status indexOfObject:_editItem.iStatus] inComponent:0 animated:YES];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    priorities = @[@"low", @"medium", @"high"];
    status = @[@"in progress", @"done", @"to do"];
    
    self.statusPicker.dataSource = self;
    self.statusPicker.delegate = self;
    
    self.priorityPicker.dataSource = self;
    self.priorityPicker.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    int rows = 0;
    switch (pickerView.tag) {
        case 1:
            rows = [priorities count];
            break;
        case 2:
            rows = [status count];
            break;
        default:
            break;
    }
    
    if (pickerView.tag == 1) {
        rows = [priorities count];
    } else if (pickerView.tag == 2) {
        rows = [status count];
    }
    
    return rows;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = @"";
    
    switch (pickerView.tag) {
        case 1:
            title = [priorities objectAtIndex:row];
            break;
        case 2:
            title = [status objectAtIndex:row];
            break;
            
        default:
            break;
    }
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    switch (pickerView.tag) {
        case 1:
            selectedPriority = [priorities objectAtIndex:row];
            break;
        case 2:
            selectedStatus = [status objectAtIndex:row];
            break;
            
        default:
            break;
    }
}

- (IBAction)addNewTask:(id)sender {
    
    ToDoItem *newItem = [ToDoItem new];
    
    newItem.iName = _nameText.text;
    newItem.iDescription = _descText.text;
    newItem.iPriority = selectedPriority != nil? selectedPriority : @"low";
    newItem.iStatus = selectedStatus != nil? selectedStatus : @"in progress";
    
    if (_isEditable)
    {
        [_protocol editExsitingToDoItem:newItem :_indexForObject];
        [self.navigationController popViewControllerAnimated:YES];
    } else
    {
        
        [_protocol addNewToDoItems:newItem];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
}


@end
