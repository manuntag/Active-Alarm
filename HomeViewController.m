//
//  HomeViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-08.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "HomeViewController.h"
#import "Alarm.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UILabel *clockLabel;
@property (strong, nonatomic) NSDate * currentTime;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateCurrentTime];
    
    Alarm * alarm = [[Alarm alloc]init];
    
    if (self.currentTime == alarm.fireDate) {
        
        
  
        
    }
    
    //1.nsarray of games. get game, 2.assign type to game  3.
    
    
//    NSArray *games = @[ game1(t1, g2(t1), g3(t2), g4(t3), g5(T4), ... ];
//    let game = games[random]
//    let segueIdentifier = game.type
    
    
    
}

-(void)updateCurrentTime {
    
    self.currentTime = [NSDate date];
    NSDateFormatter * clockFormat = [[NSDateFormatter alloc]init];
    
    [clockFormat setDateFormat:@"h:mm a"];
    
    self.clockLabel.text = [clockFormat stringFromDate:self.currentTime];
    
    [self performSelector:@selector(updateCurrentTime) withObject:self afterDelay:15.0];
    
}



#pragma mark - Navigation


-(NSString*)randomViewControllerSegue {

    NSArray * viewControllerSegueArray = [NSArray arrayWithObjects:@"gameOneSegue",@"gameTwoSegue", nil];
    
    NSString * randomSegue = [viewControllerSegueArray objectAtIndex:arc4random()%viewControllerSegueArray.count];
    
    return randomSegue;
    
    
}




// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    
    
    
}
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.



@end
