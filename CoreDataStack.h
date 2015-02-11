//
//  CoreDataStack.h
//  Active Alarm
//
//  Created by Veronica Baldys on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h> 

@interface CoreDataStack : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


+ (instancetype) defaultStack;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
