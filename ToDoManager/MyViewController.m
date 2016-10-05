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
@property (nonatomic, assign) BOOL closing;
@property (nonatomic, assign) BOOL toDoChanged;
@property (nonatomic, assign) BOOL newToDo;
@property (nonatomic, assign) BOOL urgentChecked;
@property (weak, nonatomic) IBOutlet UIButton *urgentCheckBox;
@property (weak, nonatomic) IBOutlet UISegmentedControl *catSegmentedControl;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void) viewWillAppear:(BOOL)animated {
    self.closing = NO;
    self.toDoChanged = NO;
    self.urgentChecked = NO;

    self.toDoTitleTxtFld.text = self.localToDoEntity.toDoTitle;
    self.toDoDetailsTxtView.text = self.localToDoEntity.toDoDetails;
    self.urgentCheckBox.highlighted = self.localToDoEntity.toDoUrgent;
    switch (self.localToDoEntity.toDoCategory) {
        case CAT_CAR:
            self.catSegmentedControl.selectedSegmentIndex = CAT_CAR;
            break;
        case CAT_HOME:
             self.catSegmentedControl.selectedSegmentIndex = CAT_HOME;
            break;
        case CAT_WORK:
            self.catSegmentedControl.selectedSegmentIndex = CAT_WORK;
            break;
        default:
            break;
    }
    
    NSDate *dueDate = self.localToDoEntity.toDoDueDate;
    if(dueDate != nil) {
        [self.toDoDueDatePkr setDate:dueDate];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.toDoTitleTxtFld];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self.toDoDetailsTxtView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:self.toDoDetailsTxtView];
}


- (void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidEndEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];

    if((self.newToDo != YES) && (self.toDoChanged == YES)) {
        self.localToDoEntity.toDoTitle = _toDoTitleTxtFld.text;
        self.localToDoEntity.toDoDetails = _toDoDetailsTxtView.text;
        self.localToDoEntity.toDoUrgent = _urgentChecked;
        self.localToDoEntity.toDoDueDate = _toDoDueDatePkr.date;
        [self saveToDoEntity];
        self.closing = YES;
    } else {
        if((self.newToDo == YES) && (self.toDoChanged == NO)) {
            [self.managedObjectContext deleteObject:self.localToDoEntity];
            [self saveToDoEntity];
        }
    }
}


-(void)receiveMOC:(NSManagedObjectContext *)incommingMOC {
    self.managedObjectContext = incommingMOC;
}


- (void)receiveToDoEntity:(ToDoEntity *)incommingToDoEntity {
    self.localToDoEntity = incommingToDoEntity;
    if([self.localToDoEntity.toDoTitle  isEqual: @""]) {
        self.newToDo = YES;
    }
}


- (void)textViewDidEndEditing:(NSNotification *)notification {
    if(([notification object] == self.toDoDetailsTxtView) && (self.toDoChanged == YES)){
        self.localToDoEntity.toDoDetails = self.toDoDetailsTxtView.text;
        [self saveToDoEntity];
        self.toDoChanged = NO;
    }
}


-(void)textViewDidChange:(NSNotification *)notification {
    if([notification object] == self.toDoDetailsTxtView) {
        self.toDoChanged = YES;
    }
}


-(void) saveToDoEntity {
    NSError *error = nil;
    if([[self managedObjectContext] save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}


-(void)textFieldDidChange:(NSNotification *)notification {
    if([notification object] == self.toDoTitleTxtFld) {
        self.toDoChanged = YES;
        self.newToDo = NO;
    }
}


- (IBAction)toDoTitleField:(id)sender {
    if((self.closing != YES) && (self.toDoChanged == YES)) {
        self.newToDo = NO;
            self.localToDoEntity.toDoTitle = self.toDoTitleTxtFld.text;
        NSLog(@"Ltd: %@, Ttf: %@", self.localToDoEntity.toDoTitle, self.toDoTitleTxtFld.text);
        [self saveToDoEntity];
        self.toDoChanged = NO;
    }
}


- (IBAction)dueDateEdited:(id)sender {

    self.localToDoEntity.toDoDueDate = self.toDoDueDatePkr.date;
    [self saveToDoEntity];
}


- (IBAction)urgentTapped:(id)sender {
    if(!_urgentChecked) {
        [self.urgentCheckBox setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        _urgentChecked = YES;
        self.localToDoEntity.toDoUrgent = YES;
    } else {
        [self.urgentCheckBox setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        _urgentChecked = YES;
        self.localToDoEntity.toDoUrgent = NO;
    }
    [self saveToDoEntity];
}


- (IBAction)categorySelected:(UISegmentedControl *)sender {
    
    switch ([sender selectedSegmentIndex]) {
        case 0:
            self.localToDoEntity.toDoCategory = CAT_CAR;
            break;
        case 1:
            self.localToDoEntity.toDoCategory = CAT_HOME;
            break;
        case 2:
            self.localToDoEntity.toDoCategory = CAT_WORK;
            break;
        default:
            break;
    }
        [self saveToDoEntity];
}




@end
