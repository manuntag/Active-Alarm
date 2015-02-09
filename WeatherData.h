//
//  WeatherData.h
//  Active Alarm
//
//  Created by Veronica Baldys on 2015-02-09.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property (nonatomic, strong) NSDictionary *currentForecast;

@property (nonatomic, strong) NSString *summary;

@end
