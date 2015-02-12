//
//  MathViewController.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-11.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "MathViewController.h"
#import "MathGame.h"

@interface MathViewController ()
@property (strong, nonatomic) IBOutlet UILabel *mathQuestionLabel;
@property (strong, nonatomic) IBOutlet UITextField *userAnswerTextField;
@property (strong, nonatomic) IBOutlet UILabel *userScoreLabel;


@property (strong, nonatomic) MathGame * mathgame;
@property (nonatomic) int userAnswer;

@end

@implementation MathViewController
- (IBAction)sumbitButton:(id)sender {
    
  self.userAnswer = [self.userAnswerTextField.text intValue];
    
  BOOL checkAnswer = [self.mathgame checkUserAnswer:self.mathgame.answer userAnswer:self.userAnswer];
  
    if (checkAnswer) {
        
        self.mathgame.userScore++;
        self.userScoreLabel.text = [NSString stringWithFormat:@"%d", self.mathgame.userScore];
        self.userAnswerTextField.text = @"";
        self.mathgame.answer = [self.mathgame randomMathQuestion];
        self.mathQuestionLabel.text = self.mathgame.mathQuestion;
        
        if (self.mathgame.userScore>=3){
            
            [self performSegueWithIdentifier:@"pushUpSegue" sender:self];
            
        }
        
    }else if (!checkAnswer) {
        
        self.mathgame.userScore --;
        self.userScoreLabel.text = [NSString stringWithFormat:@"%d", self.mathgame.userScore];
        self.userAnswerTextField.text = @"";
        self.mathgame.answer = [self.mathgame randomMathQuestion];
        self.mathQuestionLabel.text = self.mathgame.mathQuestion;
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mathgame = [[MathGame alloc]init];
    
    self.mathgame.answer = [self.mathgame randomMathQuestion];
    
    self.mathQuestionLabel.text = self.mathgame.mathQuestion;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
