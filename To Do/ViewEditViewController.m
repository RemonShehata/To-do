//
//  ViewEditViewController.m
//  To Do
//
//  Created by Remon Gerges Shehata on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "ViewEditViewController.h"

@interface ViewEditViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@end

@implementation ViewEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _nameLabel.text = _viewItem.iName;
    _descLabel.text = _viewItem.iDescription;
    _priorityLabel.text = _viewItem.iPriority;
    _statusLabel.text = _viewItem.iStatus;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
