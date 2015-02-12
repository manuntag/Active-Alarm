//
//  GameOneViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

// the whole point is to sustain the users attention for x minutes to ensure they are in fact awake.
// must receive touch events for a duration of x minutes.
// if user has not responded with a tap in a correct location of the object (with tolerance) then it is assumed that the user fell back asleep and the notification/sound/alarm will continue until the attention test has been 
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
    

    

 
//    _collision = [[UICollisionBehavior alloc]
//              initWithItems:@[square]];
//    _collision.translatesReferenceBoundsIntoBoundary = YES;
//    _collision.action =  ^{
//        NSLog(@"%@, %@",
//              NSStringFromCGAffineTransform(square.transform),
//              NSStringFromCGPoint(square.center));
//    };
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
    //self.square.center = CGPointMake(1, 1);
    //self.square.center = CGPointMake(self.square.center.x + 20, self.square.center.y + 20);
    
    
    
    CGFloat xrand = arc4random_uniform(self.view.bounds.size.width);
    CGFloat yrand = arc4random_uniform(self.view.bounds.size.height);
    CGPoint finalPositon = CGPointMake(xrand, yrand);
    
    [UIView animateWithDuration:5
                          delay:0
                        options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         
                         
                         // set the final position to the new location
                         
                         self.dotView.center = initialPosition;
                         
                         
                         // Keep offset distance constant so dot animation speed is consistent
                    
                         //double xrand = arc4random_uniform(self.view.bounds.);
                         //CGFloat area = self.view.bounds.size.height * self.view.bounds.size.width;
                         //  CGFloat xrand = (CGFloat) (arc4random() % (int) self.view.bounds.size.width);
                         //  CGFloat yrand = (CGFloat) (arc4random() % (int) self.view.bounds.size.height);
                         //
                         // double yrand = sqrt(abs(100-xrand*xrand));
                         
                         //CGFloat xrand = arc4random_uniform(self.view.bounds.size.width);
                         
                         //CGFloat yrand = arc4random_uniform(self.view.bounds.size.height);
                         
                         
                         //CGFloat x = (CGFloat) random()/(CGFloat) RAND_MAX * self.view.bounds.size.width;
                         //CGFloat y = (CGFloat) random()/(CGFloat) RAND_MAX * self.view.bounds.size.height;
                         
                         NSLog(@"animating");
                         //CGRect frame = self.dotView.frame;
                         
                         //self.dotView.center = finalPositon ;
                         //self.dotView.frame = CGRectMake(CGFloat x, CGFloat y, CGRectGetWidth(frame), CGRectGetHeight(frame));
                        
                     }
                     completion:^(BOOL finished) {
                    
                         self.dotView.center = finalPositon;
                         [self startAtLocation:finalPositon];

                         NSLog(@"finished");
                         //[self.dotView removeFromSuperview];
                     }];
}

//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:60];
//    [UIView setAnimationBeginsFromCurrentState:YES];
//    [UIView setAnimationOptions: UIViewAnimationOptionAllowUserInteraction];
    

//         Fade out the view right awau
    /*
    [self.view animateWithDuration:1.0
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.dot = CGRectOffset(self.dot,50,50);
                     }
    
     ];
     */
//                     completion:^(BOOL finished){
//                             // Wait one second and then fade in the view
//                         [UIView animateWithDuration:1.0
//                                               delay: 1.0
//                                             options:UIViewAnimationOptionCurveEaseOut
//                                          animations:^{
//                                              
//                                          }
//                                          completion:nil];
    
    
    
    //[UIView beginAnimations:nil context:nil];
    //[UIView setAnimationDuration:1];
    // remove:
    //  [UIView setAnimationRepeatCount:1000];

    
    //CGFloat x = (CGFloat) (arc4random() % (int) self.view.bounds.size.width);
    //CGFloat y = (CGFloat) (arc4random() % (int) self.view.bounds.size.height);
    
    //CGPoint squarePostion = CGPointMake(x, y);
    
    
    
    //button.center = squarePostion;
    // add:
    //[UIView setAnimationDelegate:self]; // as suggested by @Carl Veazey in a comment
    //[UIView setAnimationDidStopSelector:@selector(animationLoop:finished:context:)];
    
    //[UIView commitAnimations];

/*
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    NSLog(@"Boundary contact occurred - %@", identifier);
}
*/
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{/*
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [myTouch locationInView:self.view];
    
    NSLog(@"touches began. TOUCH LOCATION (x,y) = (%f,%f)",touchLocation.x, touchLocation.y);
    
    
    if (!self.dotImgView) {
        self.dotImgView =[[UIImageView alloc] initWithFrame:CGRectMake(359,487,50,50)];
        self.dotImgView.image = [UIImage imageNamed:@"circle.png"];
        [self.view addSubview:self.dotImgView];
        }
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:touch.view];
        self.dotImgView.center = location;
    */
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches Ended");
    
    
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
