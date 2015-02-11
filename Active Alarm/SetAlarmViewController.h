//
//  SetAlarmViewController.h
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-08.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CoreDataStack.h"


@interface SetAlarmViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic, readonly) NSManagedObjectContext *managedObjectContext;

@end
