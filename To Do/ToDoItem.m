//
//  ToDoItem.m
//  To Do
//
//  Created by Jets39 on 12/14/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.iName forKey:@"iName"];
    [aCoder encodeObject:self.iDescription forKey:@"iDescription"];
    [aCoder encodeObject:self.iStatus forKey:@"iStatus"];
    [aCoder encodeObject:self.iPriority forKey:@"iPriority"];

}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
        self.iName = [aDecoder decodeObjectForKey:@"iName"];
        self.iDescription = [aDecoder decodeObjectForKey:@"iDescription"];
        self.iStatus = [aDecoder decodeObjectForKey:@"iStatus"];
        self.iPriority = [aDecoder decodeObjectForKey:@"iPriority"];
    
    return self;
}


@end
