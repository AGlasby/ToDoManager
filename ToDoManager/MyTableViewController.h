//
//  MyTableViewController.h
//  ToDoManager
//
//  Created by Alan Glasby on 24/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AGMOCHandler.h"
#import "AGToDoEntryHandler.h"
#import "AGToDoCell.h"
#import "MyViewController.h"
#import "defs.h"



@interface MyTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, AGMOCHandler, NSFetchedResultsControllerDelegate>

-(void)receiveMOC:(NSManagedObjectContext *)incommingMOC;

@property (strong, nonatomic) IBOutlet UITableView *toDoTableView;
@property (strong, nonatomic) MyViewController *myViewController;



@end
