//
//  GameOneViewController.m

/// The whole point is to sustain the users attention for x minutes to ensure they are in fact awake.
/// must receive touch events that match with the dots location at a given time for a duration of x minutes.
/// if user has not responded with a tap in a correct location of the object then it is assumed that the user fell back asleep and the notification/sound/alarm will continue until the attention test has been passed

#import "GameOneViewController.h"


@interface GameOneViewController ()

@property (nonatomic, strong) SetAlarmViewController * setAlarmViewController;

@property (nonatomic) CGRect dotViewFrame;
@property (nonatomic, strong) UIView *dotView;

//@property (nonatomic) CGRect dotFrame;
@property (nonatomic) CGPoint dotLocation;
@property (nonatomic) CGPoint dotSize;
@property (nonatomic) CGRect current;

@property CGFloat xVelocity;
@property CGFloat yVelocity;
@end

@implementation GameOneViewController

- (IBAction)offButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
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
    self.dotView.center = [self randomLocation];
    
    self.xVelocity = 10;
    self.yVelocity = 10;

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Begin animating the dot
    [self moveDot];
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

-(CGPoint)randomLocation
{
    CGFloat xrand = arc4random_uniform(self.view.bounds.size.width);
    CGFloat yrand = arc4random_uniform(self.view.bounds.size.height);
    return CGPointMake(xrand, yrand);
}

-(void)moveDot
{
    [UIView animateWithDuration:0.00001
                          delay:0
                        options:UIViewAnimationCurveLinear |UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{

                         // Move the dot to a new position
                         CGFloat newX = self.dotView.center.x + self.xVelocity;
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
                         
                         
                     }
                     completion:^(BOOL finished) {
                         // Trigger the next animation
                         [self moveDot];
                     }];
}

- (void) update:(NSTimer*)timer
{

    // score ++
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [myTouch locationInView:self.view];
    
    NSLog(@"touches began. TOUCH LOCATION (x,y) = (%f,%f)",touchLocation.x, touchLocation.y);
    NSLog(@"dot location: %f, %f",self.dotView.center.x, self.dotView.center.y );

    // check if the user tapped on a 50x50 area where the dot was present
    if (abs(touchLocation.x - self.dotView.center.x) < 50 &&
       (abs(touchLocation.y - self.dotView.center.y) < 50))
    {
        NSLog(@"user tapped within the range of the circle");
        //score ++;
    }
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches Ended");
    // give the user ten seconds to respond. if the user gets a certain score, they move on. If they dont respond within 10 seconds, alarm sound continues and score resets.
    /*
    NSTimer *timer = [NSTimer timerWithTimeInterval:10 target:self selector:@selector(update:) userInfo:nil repeats:NO];
    */
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
