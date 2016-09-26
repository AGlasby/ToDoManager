//
//  MyNavigationControllerViewController.h
//  ToDoManager
//
//  Created by Alan Glasby on 24/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGMOCHandler.h"

@interface MyNavigationControllerViewController : UINavigationController<AGMOCHandler>

-(void)receiveMOC:(NSManagedObjectContext *)incommingMOC;

@end
