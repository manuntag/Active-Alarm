//
//  GameTwoViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "GameTwoViewController.h"

@interface GameTwoViewController ()
@property (nonatomic, strong) SetAlarmViewController * setAlarmViewController;

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
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
