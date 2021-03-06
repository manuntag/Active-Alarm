//
//  HomeViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-08.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "HomeViewController.h"
#import "Alarm.h"
#import "Game.h"
#import "DotGame.h"
#import "MathGame.h"
#import "SetAlarmViewController.h"
#import "GameViewControllerType.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UILabel *clockLabel;
@property (strong, nonatomic) NSDate * currentTime;
@property (strong, nonatomic) NSMutableArray * gamesArray;
@property (strong, nonatomic) NSString * segueIdentifier ;
@property (nonatomic, strong) Game *randomGame;


@property (strong, nonatomic) IBOutlet UIView *greenSwipeView;

@property (strong, nonatomic) IBOutlet UIView *blueSwipeView;



@end

@implementation HomeViewController

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {

}


-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer {
    
  [UIView animateWithDuration:3.0 animations:^{
      
      self.blueSwipeView.frame = CGRectOffset(self.blueSwipeView.frame, 320.0, 0);

  }];
  
    
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(goToMath) userInfo:nil repeats:NO];
    
}

     -(void)goToMath {
         
         [self performSegueWithIdentifier:@"mathSegue" sender:self];
         
         [UIView animateWithDuration:3.0 animations:^{
             
             self.blueSwipeView.frame = CGRectOffset(self.blueSwipeView.frame, -320.0, 0);
         }];

         
     }

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateCurrentTime];
    
    self.gamesArray = [[NSMutableArray alloc]init];
    
    [self loadGames];
    
    UISwipeGestureRecognizer * blueSwipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(slideToRightWithGestureRecognizer:)];
    blueSwipeRight.direction = UISwipeGestureRecognizerDirectionRight;

    
    [self.blueSwipeView addGestureRecognizer:blueSwipeRight];
    
}


-(void)loadGames {
    
    MathGame * mathGame = [[MathGame alloc]init];
    DotGame  * dotGame = [[DotGame alloc]init];

    [self.gamesArray addObject:mathGame];
    [self.gamesArray addObject:dotGame];
    
    
}

- (IBAction)buttonTapped:(id)sender {
    self.randomGame = [self.gamesArray objectAtIndex:arc4random()%self.gamesArray.count];
    
    //#todo - change this (testing purposes)
    self.randomGame = self.gamesArray[0];
    self.segueIdentifier = self.randomGame.gameType;
    [self performSegueWithIdentifier:self.segueIdentifier sender:self];
}



-(void)updateCurrentTime {
    
    self.currentTime = [NSDate date];
    NSDateFormatter * clockFormat = [[NSDateFormatter alloc]init];
    
    [clockFormat setDateFormat:@"h:mm a"];
    
    self.clockLabel.text = [clockFormat stringFromDate:self.currentTime];
    
    [self performSelector:@selector(updateCurrentTime) withObject:self afterDelay:15.0];
    
}



#pragma mark - Navigation


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController conformsToProtocol:@protocol(GameViewControllerType)]) {
        UIViewController <GameViewControllerType> *viewController = (UIViewController <GameViewControllerType>*)segue.destinationViewController;
        [viewController setGame:self.randomGame];
    }
}
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.



@end
