//
//  Game.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "Game.h"

@implementation Game


-(instancetype)initWithGameType:(NSString *)gameType {
    
    if (self = [super init]) {
        
        _gameType = gameType;
    }
    return self;
}
/*
- (instancetype) initWithGameType:(NSString *)gameType andCurrentScore:(NSInteger *)score
{
    if (self = [super init]) {
        
        _gameType = gameType;
        self.score = score;
    }
    return self;

}
*/
/*
-(CGPoint)randomLocation
{
    CGFloat xrand = arc4random_uniform(self.view.bounds.size.width);
    CGFloat yrand = arc4random_uniform(self.view.bounds.size.height);
    return CGPointMake(xrand, yrand);
}
*/



@end
