//
//  HomeViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-08.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UILabel *clockLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateCurrentTime];
    
    
}



-(void)updateCurrentTime {
    
    NSDate * currentTime = [NSDate date];
    NSDateFormatter * clockFormat = [[NSDateFormatter alloc]init];
    
    [clockFormat setDateFormat:@"h:mm a"];
    
    self.clockLabel.text = [clockFormat stringFromDate:currentTime];
    
    [self performSelector:@selector(updateCurrentTime) withObject:self afterDelay:15.0];
    
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
