//  GameTwoViewController.m
//
//  Created by Veronica Baldys on 2015-02-11.
//  Copyright (c) 2015 Veronica Baldys. All rights reserved.
//

#import "GameTwoViewController.h"

const NSInteger passingScore = 10;

@interface GameTwoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (nonatomic, strong) UIImageView *dotImageView;
@property (nonatomic, strong) SetAlarmViewController * setAlarmViewController;

//@property (nonatomic, strong) Dot *dot;

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

    if (!self.dotImageView)
        [self setUpView];
    
    [self startGame];
}


- (void)setUpView
{
    // Get the circle to show up at a random location on the view.
    self.dotImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.randomPoint.x, self.randomPoint.y, 80, 80)];
    self.dotImageView.image = [UIImage imageNamed:@"circle"];
    [self.view addSubview:self.dotImageView];

}

- (void) setDotToRandomPoint
{
    CGFloat x = [self randomPoint].x;
    CGFloat y = [self randomPoint].y;
    self.dotImageView.center = CGPointMake(x,y);
}

- (CGPoint) randomPoint
{
    CGFloat xrand = arc4random_uniform(self.view.bounds.size.width-self.dotImageView.frame.size.width);
    CGFloat yrand = arc4random_uniform(self.view.bounds.size.height-self.dotImageView.frame.size.width);
    
    return CGPointMake(xrand, yrand);
}

- (void) startGame
{
    gamestate = running;
    
    // show a circle at every 5 second interval
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(update:) userInfo:nil repeats:YES];

}

- (void) update:(NSTimer*)timer
{
    [self setDotToRandomPoint];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [myTouch locationInView:self.view];
    NSLog(@"touches began. TOUCH LOCATION (x,y) = (%f,%f)",touchLocation.x, touchLocation.y);
    
    if (abs(touchLocation.x - self.dotImageView.center.x) <= 50 &&
        (abs(touchLocation.y - self.dotImageView.center.y) <= 50))
    {
        NSLog(@"user tapped within the range of the circle");
        // useer gets a point if they catch the dot
        self.game.score++;
        [self updateScoreLabel];
        NSLog(@"%ld", self.game.score);
        // next: update the UI when score is changed
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
    //[NSTimer scheduledTimerWithTimeInterval:10 target:self selector:<#(SEL)#> userInfo:nil repeats:NO]
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
