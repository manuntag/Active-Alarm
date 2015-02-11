//
//  GameOneViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "GameOneViewController.h"

@interface GameOneViewController ()
{
    UICollisionBehavior *_collision;
}

@property (nonatomic) CGRect dot;
@property (nonatomic, strong) UIView *square;

@end

@implementation GameOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dot = CGRectMake(200, 200, 5, 5);
    self.square = [[UIView alloc] initWithFrame:
                      CGRectMake(100, 100, 10, 10)];
    self.square.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.square];
    // Do any additional setup after loading the view.
    self.square.center = CGPointMake(1, 1);
    [self animationLoop];

    

 
//    _collision = [[UICollisionBehavior alloc]
//              initWithItems:@[square]];
//    _collision.translatesReferenceBoundsIntoBoundary = YES;
//    _collision.action =  ^{
//        NSLog(@"%@, %@",
//              NSStringFromCGAffineTransform(square.transform),
//              NSStringFromCGPoint(square.center));
//    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)animationLoop {
    
    //self.square.center = CGPointMake(1, 1);
    //self.square.center = CGPointMake(self.square.center.x + 20, self.square.center.y + 20);
    
    [UIView animateWithDuration:10
                          delay:0.2f
                        options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionRepeat
                     animations:^{
                         NSLog(@"HHHHHEYYY");
                         self.square.center = CGPointMake(self.square.center.x + 20, self.square.center.y + 20);
                     }
                     completion:^(BOOL completed) {
                         [self animationLoop];
                         
                     }];
    
    
}
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


- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    NSLog(@"Boundary contact occurred - %@", identifier);
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [myTouch locationInView:self];
    
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
