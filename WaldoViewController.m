//
//  WaldoViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-12.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "WaldoViewController.h"
#import "HomeViewController.h"

@interface WaldoViewController ()

@property (strong, nonatomic) IBOutlet UILabel *foundWaldoLabel;
@property (strong, nonatomic) NSArray * waldoBackgroundArray;
@property (nonatomic) int randomIndexNumber;
@property (strong, nonatomic) IBOutlet UIImageView *background;
@property (nonatomic) NSInteger randomX;
@property (nonatomic) NSInteger randomY;
@property (nonatomic, strong) UIButton * waldoButton;

@end

@implementation WaldoViewController


-(void)viewWillAppear:(BOOL)animated {

    
    [self.view setUserInteractionEnabled:YES];
    
    
     // set background image
    
    NSString * wheresWaldoWallPaper = [self wheresWaldoWallpaper];
    
    self.background.image = [UIImage imageNamed:wheresWaldoWallPaper];
    
    
    // set waldo
    
    self.waldoButton = [UIButton buttonWithType:UIButtonTypeCustom];

    
    [self.waldoButton sizeToFit];
    
    [self.waldoButton setBackgroundImage:[UIImage imageNamed:@"waldoWalking"]forState:UIControlStateNormal];
    
    // x = 320 y = 480

    
    self.waldoButton.frame = [self randomWaldoPosition];
    
    [self.view addSubview:self.waldoButton];
    
    [self.waldoButton addTarget:self action:@selector(foundWaldo) forControlEvents:UIControlEventTouchUpInside];
    
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(positionWaldoOnScreen) userInfo:nil repeats:YES];
    
}

-(void)positionWaldoOnScreen {
    
    self.waldoButton.frame = [self randomWaldoPosition];
    
    
}


-(CGRect)randomWaldoPosition{
    
    self.randomX = arc4random()%320;
    self.randomY = arc4random()%480;
    
    return CGRectMake(self.randomX, self.randomY, 75, 75);
    
}


-(NSString*)wheresWaldoWallpaper {
    
    self.waldoBackgroundArray = [NSArray arrayWithObjects:@"wheresWaldo1",@"wheresWaldo2", @"wheresWaldo3", nil];
                                 
    self.randomIndexNumber = arc4random()%self.waldoBackgroundArray.count;
                                 
    NSString * randomBackground = [self.waldoBackgroundArray objectAtIndex:self.randomIndexNumber];
                                 
    return randomBackground;
    
}


-(void)foundWaldo{
    
   [[UIApplication sharedApplication]cancelAllLocalNotifications];
    
    [self performSegueWithIdentifier:@"homeSegue" sender:self];
    
}

#pragma mark - Navigation




@end
