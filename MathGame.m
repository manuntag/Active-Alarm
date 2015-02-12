//
//  MathGame.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "MathGame.h"


@implementation MathGame

-(instancetype)init {
    
    return [super initWithGameType:@"mathGameSegue"];
}


-(int)randomMathQuestion {
    
    self.number1 = arc4random()%10;
    self.number2 = arc4random()%10;
    
    self.answer = self.number1 + self.number2;
    
    NSNumber * nsNumber1 = [NSNumber numberWithInt:self.number1];
    NSNumber * nsNumber2 = [NSNumber numberWithInt:self.number2];

    NSNumberFormatter * spellOutNumberFormat = [[NSNumberFormatter alloc]init];
    
    [spellOutNumberFormat setNumberStyle:NSNumberFormatterSpellOutStyle];
    
    self.number1String = [spellOutNumberFormat stringFromNumber:nsNumber1];
    self.number2String = [spellOutNumberFormat stringFromNumber:nsNumber2];
    
    self.mathQuestion = [NSString stringWithFormat:@"%@\n+\n%@?", self.number1String, self.number1String];
    
    return self.answer;
    
}

-(BOOL)checkUserAnswer:(int)correctAnswer userAnswer:(int)userAnswer {
    
    BOOL pass = NO;
    
    
    if(correctAnswer==userAnswer) {
        
        self.userScore++;
        
    }else {
        
        self.userScore--;
        
    }
    
    if(self.userScore>3) {
    
        pass = YES;

    }
    return pass;
    
}


@end
