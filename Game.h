//
//  Game.h
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject
@property (nonatomic, strong) NSString *gameType;
@property (nonatomic) NSNumber * score;

-(instancetype)initWithGameType:(NSString*)gameType;

@end
