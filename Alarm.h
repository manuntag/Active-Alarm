//
//  Alarm.h
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-11.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Alarm : NSManagedObject

@property (nonatomic, retain) NSString * alertBody;
@property (nonatomic, retain) NSDate * fireDate;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * soundName;
@property (nonatomic, retain) NSData * localNotification;

@end
