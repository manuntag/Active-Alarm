//
//  MathGame.h
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface MathGame : Game

@property (nonatomic) int number1;
@property (nonatomic) int number2;
@property (nonatomic) int answer;
@property (nonatomic) NSString * number1String;
@property (nonatomic) NSString * number2String;
@property (nonatomic, strong) NSString * mathQuestion;
@property (nonatomic) int userScore;

-(int)randomMathQuestion;

-(BOOL)checkUserAnswer:(int)correctAnswer userAnswer:(int)userAnswer;

@end
