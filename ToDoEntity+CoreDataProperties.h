//
//  ToDoEntity+CoreDataProperties.h
//  ToDoManager
//
//  Created by Alan Glasby on 25/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import "ToDoEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ToDoEntity (CoreDataProperties)

+ (NSFetchRequest<ToDoEntity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *toDoDetails;
@property (nullable, nonatomic, copy) NSDate *toDoDueDate;
@property (nullable, nonatomic, copy) NSString *toDoTitle;

@end

NS_ASSUME_NONNULL_END
