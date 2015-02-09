//
//  WeatherViewController.m
//  Active Alarm
//
//  Created by Veronica Baldys on 2015-02-08.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherData.h"

@interface WeatherViewController ()

@property (nonatomic, strong) NSMutableArray *weatherDataArray;

@end

@implementation WeatherViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    NSString *urlString = @"https://api.forecast.io/forecast/faa591179c581a50641d8973978dbaff/49.282729,-123.120738";
    NSURLSession *session = [NSURLSession sharedSession ];
    
    [[session dataTaskWithURL:[NSURL URLWithString:urlString]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          NSDictionary *weatherDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
          NSDictionary *currentForecast = weatherDictionary[@"currently"];
          //NSDictionary *dailyForecast = weatherDictionary[@"daily"];
          WeatherData *weather = [[WeatherData alloc] init];
          //weather.currentForecast = currentForecast;
          weather.summary = currentForecast[@"summary"];
          //weather.cityName = cityWeatherDictionary[@"name"];
          //NSLog(@"%@", weather.cityName);
          NSLog(@"current weather for Vancouver:  %@", weather.summary);
        
          [self.weatherDataArray addObject:weather];
          
          
      }] resume];
    

}

@end
