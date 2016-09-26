//
//  MyNavigationControllerViewController.m
//  ToDoManager
//
//  Created by Alan Glasby on 24/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import "MyNavigationControllerViewController.h"

@interface MyNavigationControllerViewController ()
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation MyNavigationControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)receiveMOC:(NSManagedObjectContext *)incommingMOC {
    self.managedObjectContext = incommingMOC;
    id<AGMOCHandler> child = (id<AGMOCHandler>)self.viewControllers[0];
    [child receiveMOC:self.managedObjectContext];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
