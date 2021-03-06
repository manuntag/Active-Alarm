//
//  GameOneViewController.m
//
/// The whole point is to sustain the users attention for x minutes to ensure they are in fact awake.
/// must receive touch events that match with the dots location at a given time for a duration of x minutes.
/// if user has not responded with a tap in a correct location of the object then it is assumed that the user fell back asleep and the notification/sound/alarm will continue until the attention test has been passed

//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//


#import "GameOneViewController.h"


@interface GameOneViewController ()

@property (nonatomic) CGRect dot;
@property (nonatomic, strong) UIView *dotView;
@property (nonatomic, strong) UIImageView *dotImgView;
//@property (nonatomic) CGRect dotFrame;

@property (nonatomic) CGPoint dotLocation;
@property (nonatomic) CGPoint dotSize;
@property (nonatomic) CGRect current;
@end

@implementation GameOneViewController
- (IBAction)offButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // initial location in center of view

    /// location: (x,y) = (100,100) width=20 height=20
    
    if (!self.dotView)
    {
        [self setInitialConfiguration];
        [self.view addSubview:self.dotView];
         self.dotView.center = CGPointMake(1, 1);
    }
    
    // Location of the center of the square in the view.
    CGPoint startPosition = CGPointMake(self.view.center.x, self.view.center.y);
    [self startAtLocation:startPosition];
}


- (void) setInitialConfiguration
{
    self.dotSize = CGPointMake(20,20);
    // initial location of the dot in the center of the view
    CGPoint startPosition = CGPointMake(self.view.center.x, self.view.center.y);
    self.dotLocation = startPosition;
    
    CGRect dotViewFrame = CGRectMake(self.dotLocation.x,self.dotLocation.y,20,20);
    
    self.dotView = [[UIView alloc] initWithFrame:dotViewFrame];
    self.dotView.backgroundColor = [UIColor blackColor];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startAtLocation:(CGPoint)initialPosition
{
    CGFloat xrand = arc4random_uniform(self.view.bounds.size.width);
    CGFloat yrand = arc4random_uniform(self.view.bounds.size.height);
    CGPoint finalPositon = CGPointMake(xrand, yrand);
    
    [UIView animateWithDuration:5
                          delay:0
                        options:UIViewAnimationCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.dotView.center = initialPosition;
                     }
                     completion:^(BOOL finished) {
                          // set the final position to the new location
                         self.dotView.center = finalPositon;
                         [self startAtLocation:finalPositon];
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
    
    if (abs(touchLocation.x-self.dotView.center.x)<50 && (abs(touchLocation.y-self.dotView.center.y)))
    {
        NSLog(@"user tapped within the range of the circle");
        //score ++;
    }
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches Ended");
    NSTimer *timer = [NSTimer timerWithTimeInterval:8 target:self selector:@selector(update:) userInfo:nil repeats:NO];
    
}
-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
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
