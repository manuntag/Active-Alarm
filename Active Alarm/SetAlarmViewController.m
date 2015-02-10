//
//  SetAlarmViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-08.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "SetAlarmViewController.h"

@interface SetAlarmViewController ()

@property (nonatomic, strong) NSDate * time;

@end

@implementation SetAlarmViewController

- (IBAction)datePicker:(UIDatePicker *)sender {
    
    self.time = sender.date;
    NSLog(@"Alarm will go off at %@", self.time);
    
}

- (IBAction)saveButton:(id)sender {
    
    
    //register notifications
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings * mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication]registerUserNotificationSettings:mySettings];
    
    
    //create and save local notification
    
    UILocalNotification * localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = self.time;
    localNotification.alertBody = [NSString stringWithFormat:@"Alert Fired at %@", self.time];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
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
