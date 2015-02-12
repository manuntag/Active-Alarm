//  GameTwoViewController.m
//
//  Created by Veronica Baldys on 2015-02-11.
//  Copyright (c) 2015 Veronica Baldys. All rights reserved.
//

#import "GameTwoViewController.h"

@interface GameTwoViewController ()

//@property (nonatomic, strong) DotGameView *gameView;

@property (nonatomic, strong) UIImageView *dotImageView;
@property (nonatomic, strong) SetAlarmViewController * setAlarmViewController;

//@property (nonatomic, strong) Dot *dot;

@end

@implementation GameTwoViewController

- (IBAction)offButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
    
}


-(BOOL)gameStatus:(SetAlarmViewController *)setAlarmViewController {
    
    return YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //CGPoint startPosition = CGPointMake(self.view.center.x, self.view.center.y);
    //self.dot = [[Dot alloc] initWithLocation:[self randomPoint]];
    if (!self.dotImageView) [self setUpView];
    //[self animationLoop];
}


- (void) setUpView
{
    // Location of the center of the dot in the view.
    self.dotImageView = [[UIImageView alloc] initWithFrame:CGRectMake([self randomPoint].x, [self randomPoint].y, 80, 80)];
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
    //[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(update:) userInfo:nil repeats:YES];

}

- (void) update:(NSTimer*)timer
{
    [self setDotToRandomPoint];
    // gamescore++
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [myTouch locationInView:self.view];
    NSLog(@"touches began. TOUCH LOCATION (x,y) = (%f,%f)",touchLocation.x, touchLocation.y);
    
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
