//
//  Game.m
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "Game.h"

@implementation Game


-(instancetype)initWithGameType:(NSString*)gameType {
    
    if (self = [super init]) {
        
        _gameType = gameType;
        
        
    }
    
    return self;
    
}


@end
