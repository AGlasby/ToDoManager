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

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)receiveMOC:(NSManagedObjectContext *)incommingMOC {
    self.managedObjectContext = incommingMOC;
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
