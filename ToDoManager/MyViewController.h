//
//  MyViewController.h
//  ToDoManager
//
//  Created by Alan Glasby on 24/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGMOCHandler.h"
#import "AGToDoEntryHandler.h"
#import "ToDoEntity+CoreDataClass.h"
#import "defs.h"

@interface MyViewController : UIViewController<AGMOCHandler, AGToDoEntryHandler>

@property (weak, nonatomic) IBOutlet UITextField *toDoTitleTxtFld;
@property (weak, nonatomic) IBOutlet UITextView *toDoDetailsTxtView;
@property (weak, nonatomic) IBOutlet UIDatePicker *toDoDueDatePkr;
@property (strong, nonatomic) ToDoEntity *localToDoEntity;

-(void)receiveMOC:(NSManagedObjectContext *)incommingMOC;
-(void)receiveToDoEntity:(ToDoEntity *)incommingToDoEntity;

@end
