//
//  AGToDoCell.h
//  ToDoManager
//
//  Created by Alan Glasby on 26/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoEntity+CoreDataClass.h"

@interface AGToDoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *toDoTitle;
@property (weak, nonatomic) IBOutlet UILabel *toDoDueDate;
@property (strong, nonatomic) ToDoEntity *localToDoEntity;

-(void)setInternalFields:(ToDoEntity *)incommingToDoEntity;

@end
