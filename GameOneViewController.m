//
//  GameOneViewController.m

/// The whole point is to sustain the users attention for x minutes to ensure they are in fact awake.
/// must receive touch events that match with the dots location at a given time for a duration of x minutes.
/// if user has not responded with a tap in a correct location of the object then it is assumed that the user fell back asleep and the notification/sound/alarm will continue until the attention test has been passed

#import "GameOneViewController.h"
//#import "AnimatedObject.h"

const NSInteger passingScore1 = 3;

@interface GameOneViewController ()

@property (nonatomic, strong) SetAlarmViewController * setAlarmViewController;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel1;

@property (nonatomic, strong) UIView *dotView;
@property (nonatomic) CGPoint dotLocation;
//@property (nonatomic) CGPoint dotSize;

@property (nonatomic) CGRect dotViewFrame;
@property (nonatomic) CGRect dotFrame;
//@property (nonatomic) CGRect current;

@property (nonatomic) CGFloat dotWidth;
@property (nonatomic) CGFloat dotHeight;

@property (nonatomic) CGFloat xVelocity;
@property (nonatomic) CGFloat yVelocity;

@end

@implementation GameOneViewController

- (IBAction)offButton:(id)sender {
    
    NSLog(@"off pressed \n \n \n /n /n /n ");
    [self performSelectorOnMainThread:@selector(stopAnimation) withObject:self waitUntilDone:NO];
    
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)stopAnimation {
    NSLog(@"renmoved anim");
    [self.view.layer removeAllAnimations];
}

- (void) updateScoreLabel1
{
    self.scoreLabel1.text = [NSString stringWithFormat:@"SCORE: %ld", (long)self.game.score];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.dotView){

        [self setInitialConfiguration];
        [self.view addSubview:self.dotView];
        self.dotView.center = CGPointMake(1, 1);
        [self.dotView.layer setCornerRadius:self.dotView.frame.size.width/2];

    }
//    CGPoint startPosition = CGPointMake(self.view.center.x, self.view.center.y);
    
    // Put the dot in a random location
    CGAffineTransform transform =CGAffineTransformMakeTranslation(1, 1);
    transform = self.dotView.transform;
    self.xVelocity = 5;
    self.yVelocity = 5;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Begin animating the dot
    [self moveDot];
}
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"disappear");
    
}

- (void) setInitialConfiguration
{
    //self.dotSize = CGPointMake(50,50);
    // initial location of the dot in the center of the view
    CGPoint startPosition = CGPointMake(self.view.center.x, self.view.center.y);
    self.dotLocation = startPosition;
    
    self.dotViewFrame = CGRectMake(self.dotLocation.x,self.dotLocation.y,50,50);
    
    self.dotView = [[UIView alloc] initWithFrame:self.dotViewFrame];
    self.dotView.backgroundColor = [UIColor blackColor];
    
}

/// inherit
-(CGPoint)randomLocation
{
    CGFloat xrand = arc4random_uniform(self.view.bounds.size.width);
    CGFloat yrand = arc4random_uniform(self.view.bounds.size.height);
    return CGPointMake(xrand, yrand);
}
///

/// override
-(void)moveDot
{
    [UIView animateWithDuration:0.001
                          delay:0
                        options:UIViewAnimationCurveLinear |UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{

                         // Move the dot to a new position
                         CGFloat newX = self.dotView.center.x + self.xVelocity;
                         NSLog(@"%f",newX);
                         
                         CGFloat newY = self.dotView.center.y + self.yVelocity;
                         
                         
                         // Check if new location is within bounds
                         if(newX >= self.view.bounds.size.width) {
                             self.xVelocity = self.xVelocity * -1;
                             newX = self.dotView.center.x + (2 * self.xVelocity);
                         }
                         if(newY >= self.view.bounds.size.height) {
                             self.yVelocity = self.yVelocity * -1;
                             newY = self.dotView.center.y + (2 * self.yVelocity);
                         }
                         
                         if(newX <= 0) {
                             self.xVelocity = self.xVelocity * -1;
                             newX = self.dotView.center.x + (2 * self.xVelocity);
                         }
                         if(newY <= 0) {
                             self.yVelocity = self.yVelocity * -1;
                             newY = self.dotView.center.y + (2 * self.yVelocity);
                         }
                         
                         self.dotView.center = CGPointMake(newX, newY);
                         
                         NSLog(@"%f xVelocity", self.xVelocity);

                     }
                     completion:^(BOOL finished) {
                         // Trigger the next animation
                         [self moveDot];
                     }];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [myTouch locationInView:self.view];
    
    NSLog(@"touchLocation: (x=%f,y=%f)", touchLocation.x, touchLocation.y);
    NSLog(@"dot location: %f, %f",self.dotView.center.x, self.dotView.center.y );
    
    //abs(touchLocation.x - self.dotView.center.x) < self.view.frame.size.width
    
    // check if the user tapped within the area of the dot
    // it can be caught if the touch location is +- width from the center location
    if (abs(touchLocation.x - self.dotView.center.x) <= 50 &&
       (abs(touchLocation.y - self.dotView.center.y) <= 50))
    {
        NSLog(@"user tapped within the range of the circle");
        // useer gets a point if they catch the dot
        self.game.score++;
        [self updateScoreLabel1];
        NSLog(@"%ld", (long)self.game.score);
        
        // next: update the UI when score is updated.
        if (self.game.score == 3)
        {
            NSLog(@"user has passed");
        }
        
    }
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches Ended");
    
    NSLog(@"%s",__func__);
}
-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
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
