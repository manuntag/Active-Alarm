//  GameTwoViewController.m
//
//  Created by Veronica Baldys on 2015-02-11.
//  Copyright (c) 2015 Veronica Baldys. All rights reserved.
//

#import "GameTwoViewController.h"

const NSInteger passingScore = 10;

@interface GameTwoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (nonatomic, strong) UIImageView *dotView;

@property (nonatomic, strong) SetAlarmViewController * setAlarmViewController;

@end

@implementation GameTwoViewController

- (IBAction)offButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
    
}

- (void) updateScoreLabel
{
    self.scoreLabel.text = [NSString stringWithFormat:@"SCORE: %ld", (long)self.game.score];
}


-(BOOL)gameStatus:(SetAlarmViewController *)setAlarmViewController {
    
    return YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpView];
    [self startGame];
}

- (void)setUpView
{
    self.dotView.clipsToBounds = YES;
    // Get the circle to show up at a random location on the view.
    self.dotView = [[UIImageView alloc] initWithFrame:CGRectMake(100,100,60,60)];
    self.dotView.image = [UIImage imageNamed:@"circle"];
    [self.view addSubview:self.dotView];

}

- (void) startGame
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(update:) userInfo:nil repeats:YES];
}
- (void) update:(NSTimer*)timer
{
    
    //self.dotView.clipsToBounds = YES;
    //self.dotView.hidden = YES;
    self.dotView.center= CGPointMake(self.randomLocation.x, self.randomLocation.y);
    
    self.dotView.hidden = NO;
    // invalidate timer if score is 5.
}

- (CGPoint) randomLocation
{
    CGFloat xrand = arc4random_uniform(self.view.frame.size.width - self.dotView.frame.size.width);
    CGFloat yrand = arc4random_uniform(self.view.frame.size.height-self.dotView.frame.size.height);
    NSLog(@"~~~~~~~~ X = %f ~~~~~~~~ Y = %f ~~~~~~~~~ ", xrand, yrand);
    return CGPointMake(xrand, yrand);
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchPoint = [myTouch locationInView:self.view];
    
    NSLog(@"touches began. TOUCH LOCATION (x,y) = (%f,%f)",touchPoint.x, touchPoint.y);
    
    // check if user touched the moving circle
    if (CGRectContainsPoint(self.dotView.frame, touchPoint))
    {
        self.dotView.clipsToBounds = YES;
        //  increment number of successfully tapped on objets in the view
        self.game.score++;
        [self updateScoreLabel];
        // set.tapSuccessCount++;
        //[self growAnimationForView:self.dotView];
        //[self shrinkAnimationForView:self.dotView];
        [self animateTouchAtPoint:touchPoint];
    }
    
    if (self.game.score == passingScore)
    {
        // move on to the next game.
        NSLog(@"user has passed");
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

/*
- (CGPoint) randomLocation
{
    CGFloat xrand = arc4random_uniform(self.view.frame.size.width);
    CGFloat yrand = arc4random_uniform(self.view.frame.size.height);
    NSLog(@"~~~~~~~~ X = %f ~~~~~~~~ Y = %f ~~~~~~~~~ ", xrand, yrand);
    return CGPointMake(xrand, yrand);
}
*/
- (void)animateTouchAtPoint:(CGPoint)touchPoint {
#define SCALE_FACTOR 2.0f
#define ANIMATION_DURATION_SECONDS 1.0
    
    NSLog(@"start animation blocks");
    [UIView animateWithDuration:ANIMATION_DURATION_SECONDS
                     animations:^{
                         NSLog(@"animation block 1");
                         //self.dotView.clipsToBounds = YES;
                         CGAffineTransform transform = CGAffineTransformMakeScale(SCALE_FACTOR, SCALE_FACTOR);
                         //CGAffineTransform translation =CGAffineTransformMakeTranslation(self.randomLocation.x, self.randomLocation.y);
                         self.dotView.transform = transform;
                         //self.dotView.transform = translation;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:(NSTimeInterval)ANIMATION_DURATION_SECONDS animations:^{
                             
                             NSLog(@"animation block 2");
                             
                             self.dotView.transform = CGAffineTransformMakeScale(0,0);
                             self.dotView.transform =
                             CGAffineTransformIdentity;
                         }];
                         
                     }];
    
    [UIView animateWithDuration:(NSTimeInterval)ANIMATION_DURATION_SECONDS animations:^{
        self.dotView.clipsToBounds = YES;
        NSLog(@"animation block 3");
        self.dotView.hidden = YES;
        //self.dotView.transform = CGAffineTransformIdentity;
        
    }];
    
}

@end