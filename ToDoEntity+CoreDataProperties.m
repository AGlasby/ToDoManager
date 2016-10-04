//
//  ToDoEntity+CoreDataProperties.m
//  ToDoManager
//
//  Created by Alan Glasby on 03/10/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import "ToDoEntity+CoreDataProperties.h"

@implementation ToDoEntity (CoreDataProperties)

+ (NSFetchRequest<ToDoEntity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ToDoEntity"];
}

@dynamic toDoDetails;
@dynamic toDoDueDate;
@dynamic toDoTitle;

@end
