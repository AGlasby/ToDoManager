//
//  MyViewController.h
//  ToDoManager
//
//  Created by Alan Glasby on 24/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGMOCHandler.h"

@interface MyViewController : UIViewController<AGMOCHandler>
@property (weak, nonatomic) IBOutlet UITextField *toDoTitleTxtFld;
@property (weak, nonatomic) IBOutlet UITextView *toDoDetailsTxtView;
@property (weak, nonatomic) IBOutlet UIDatePicker *toDoDueDatePkr;

-(void)receiveMOC:(NSManagedObjectContext *)incommingMOC;

@end
