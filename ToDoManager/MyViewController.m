//
//  MyViewController.m
//  ToDoManager
//
//  Created by Alan Glasby on 24/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, assign) BOOL wasTrashed;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void) viewWillAppear:(BOOL)animated {
    self.wasTrashed = NO;
    self.toDoTitleTxtFld.text = self.localToDoEntity.toDoTitle;
    self.toDoDetailsTxtView.text = self.localToDoEntity.toDoDetails;
    NSDate *dueDate = self.localToDoEntity.toDoDueDate;
    if(dueDate != nil) {
        [self.toDoDueDatePkr setDate:dueDate];
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    }
}


- (void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidEndEditingNotification object:self];
    
    if(self.wasTrashed == NO) {
    self.localToDoEntity.toDoTitle = _toDoTitleTxtFld.text;
    self.localToDoEntity.toDoDetails = _toDoDetailsTxtView.text;
    self.localToDoEntity.toDoDueDate = _toDoDueDatePkr.date;
    [self saveToDoEntity];
    }
}


-(void)receiveMOC:(NSManagedObjectContext *)incommingMOC {
    self.managedObjectContext = incommingMOC;
}


- (void)receiveToDoEntity:(ToDoEntity *)incommingToDoEntity {
    self.localToDoEntity = incommingToDoEntity;
}


- (void)textViewDidEndEditing:(NSNotification *)notification {
    if([notification object] == self){
        self.localToDoEntity.toDoDetails = self.toDoDetailsTxtView.text;
        [self saveToDoEntity];
    }
}


-(void) saveToDoEntity {
    NSError *error = nil;
    if([[self managedObjectContext] save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}


- (IBAction)toDoTitleField:(id)sender {
        self.localToDoEntity.toDoTitle = self.toDoTitleTxtFld.text;
    [self saveToDoEntity];
}


- (IBAction)dueDateEdited:(id)sender {
    self.localToDoEntity.toDoDueDate = self.toDoDueDatePkr.date;
        [self saveToDoEntity];
}
- (IBAction)trashToDoTapped:(id)sender {
    self.wasTrashed = YES;
    [self.managedObjectContext deleteObject:self.localToDoEntity];
    [self saveToDoEntity];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
