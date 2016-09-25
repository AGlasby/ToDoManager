//
//  AGToDoEntryHandler.h
//  ToDoManager
//
//  Created by Alan Glasby on 25/09/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AGToDoEntryHandler <NSObject>

-(void)receiveToDoEntity:(ToDoEntity *)incommingToDoEntity;

@end
