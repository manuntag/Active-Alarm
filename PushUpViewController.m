//
//  PushUpViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-11.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "PushUpViewController.h"

@interface PushUpViewController ()
@property (strong, nonatomic) IBOutlet UILabel *pushUpCountLabel;
@property (nonatomic) int pushUpCount;
@end

@implementation PushUpViewController
- (IBAction)pushUpButton:(id)sender {

    self.pushUpCount++;
    
    self.pushUpCountLabel.text = [NSString  stringWithFormat:@"%d", self.pushUpCount];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.pushUpCountLabel.text = [NSString  stringWithFormat:@"%d", self.pushUpCount];
    
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
