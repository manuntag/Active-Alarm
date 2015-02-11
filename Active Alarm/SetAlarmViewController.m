//
//  SetAlarmViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-08.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "SetAlarmViewController.h"
#import "Alarm.h"

@interface SetAlarmViewController ()

//@property (nonatomic, copy) NSArray *notificationArray;


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSDate * fireDate;
@property (strong, nonatomic) IBOutlet UITextField *textField;


@end

@implementation SetAlarmViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.fetchedResultsController performFetch:nil];
    [self.tableView reloadData];
}

- (NSManagedObjectContext*)managedObjectContext
{
    return [CoreDataStack defaultStack].managedObjectContext;
}

- (NSFetchRequest *)scheduledAlarmsFetchRequest
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Alarm"];
    
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"fireDate" ascending:NO]];
    
    return fetchRequest;
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil)
    {
        return _fetchedResultsController;
    }
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    NSFetchRequest *fetchRequest = [self scheduledAlarmsFetchRequest];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:coreDataStack.managedObjectContext sectionNameKeyPath:nil cacheName:@"Alarms"];
    _fetchedResultsController.delegate = self;
    
    /*
     if (_fetchedResultsController != nil) {
     return _fetchedResultsController;
     }
     
     CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
     
     // Edit the entity name as appropriate.
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"Alarm" inManagedObjectContext:self.managedObjectContext];
     [scheduledAlarmsFetchRequest setEntity:entity];
     
     // Set the batch size to a suitable number.
     [fetchRequest setFetchBatchSize:20];
     
     // Edit the sort key as appropriate.
     NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"fireDate" ascending:NO];
     NSArray *sortDescriptors = @[sortDescriptor];
     
     [fetchRequest setSortDescriptors:sortDescriptors];
     
     // Edit the section name key path and cache name if appropriate.
     // nil for section name key path means "no sections".
     NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Alarms"];
     aFetchedResultsController.delegate = self;
     self.fetchedResultsController = aFetchedResultsController;
     */
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    if (type == NSFetchedResultsChangeInsert)
    {
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    
    else if (type == NSFetchedResultsChangeDelete)
    {
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    
    
    else if (type == NSFetchedResultsChangeUpdate)
    {
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    
    
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

- (IBAction)datePicker:(UIDatePicker *)sender {
    
    self.fireDate = sender.date;
    NSLog(@"Alarm will go off at %@", self.fireDate);
    
}

-(void)insertToDoItem
{
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    Alarm *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"Alarm" inManagedObjectContext:coreDataStack.managedObjectContext];
    //    alarm.fireDate = self.fireDate;
    //    alarm.alertBody = [self.textField text];
    //    alarm.soundName = @"cudi.wav";
    //
    
    [coreDataStack saveContext];
}

- (IBAction)saveButton:(id)sender {
    [self.textField resignFirstResponder];
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    Alarm *alarm = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:coreDataStack.managedObjectContext];
    
    alarm.fireDate = self.fireDate;
    alarm.alertBody = [self.textField text];
    alarm.soundName = @"cudi.wav";
    
    [coreDataStack saveContext];
    
    [self.tableView reloadData];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.fetchedResultsController.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    id<NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[section];
    
    return [sectionInfo numberOfObjects];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Alarm *alarm = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // configure cell
    [cell.textLabel setText:alarm.alertBody];
    
    //set detail text label
    NSDateFormatter * detailTimeFormat = [[NSDateFormatter alloc]init];
    [detailTimeFormat setDateFormat:@"EEEE h:mm a"];
    cell.detailTextLabel.text = [detailTimeFormat stringFromDate:alarm.fireDate];
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
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
