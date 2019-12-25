//
//  AddNewToDoItemsProtocol.h
//  To Do
//
//  Created by Jets39 on 12/14/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AddNewToDoItemsProtocol <NSObject>

@required
- (void)addNewToDoItems :(ToDoItem*) item;
- (void)editExsitingToDoItem :(ToDoItem*) editedItem :(int) atIndex;
@end
