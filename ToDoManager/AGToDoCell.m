//
//  AGToDoCell.m
//  ToDoManager
//
//  Created by Alan Glasby on 26/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import "AGToDoCell.h"

@implementation AGToDoCell

-(void)setInternalFields:(ToDoEntity *)incommingToDoEntity{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSLocale *ukLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_UK"];
    [dateFormatter setLocale:ukLocale];

    self.toDoTitle.text = incommingToDoEntity.toDoTitle;
    self.toDoDueDate.text = [dateFormatter stringFromDate:incommingToDoEntity.toDoDueDate];
    _localToDoEntity = incommingToDoEntity;

}

@end
