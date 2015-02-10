//
//  SetAlarmViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-08.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "SetAlarmViewController.h"

@interface SetAlarmViewController ()
@property (nonatomic, copy) NSArray *notificationArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSDate * time;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@end

@implementation SetAlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notificationArray = [[UIApplication sharedApplication]scheduledLocalNotifications];
    [self.tableView reloadData];
}

- (IBAction)datePicker:(UIDatePicker *)sender {
    
    self.time = sender.date;
    NSLog(@"Alarm will go off at %@", self.time);
    
}

- (IBAction)saveButton:(id)sender {
    [self.textField resignFirstResponder];
    
    
    //register notifications
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings * mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication]registerUserNotificationSettings:mySettings];
    
    
    //create and save local notification
    
    UILocalNotification * localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = self.time;
    localNotification.alertBody = [self.textField text];
    localNotification.soundName = @"cudi.wav";
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.repeatInterval = 0;
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    
    
    [self.tableView reloadData];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return self.notificationArray.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UILocalNotification * notif = [self.notificationArray objectAtIndex:indexPath.row];

    
    [cell.textLabel setText:notif.alertBody];

    
    //set detail text label
    NSDateFormatter * detailTimeFormat = [[NSDateFormatter alloc]init];
    [detailTimeFormat setDateFormat:@"EEEE h:mm a"];
    cell.detailTextLabel.text = [detailTimeFormat stringFromDate:notif.fireDate];

    return cell;
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSMutableArray * mutableNotificationArray = [self.notificationArray mutableCopy];
    NSMutableArray * mutableNotificationArray = [NSMutableArray arrayWithArray:self.notificationArray];
    
    UILocalNotification *deletedNotification = self.notificationArray[indexPath.row];
    [UIApplication.sharedApplication cancelLocalNotification:deletedNotification];
    
    [mutableNotificationArray removeObjectAtIndex:indexPath.row];
    
    [tableView beginUpdates];
    self.notificationArray = mutableNotificationArray;
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
    
    
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
