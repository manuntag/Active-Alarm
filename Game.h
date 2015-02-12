//
//  Game.h
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


typedef NS_ENUM(int, GAMESTATE)
{
    uninitialized,
    running
} gamestate;

@protocol Game <NSObject>

@optional

- (void)animate;

@end

@interface Game : NSObject

@property (nonatomic, strong) NSString *gameType;

@property (nonatomic) NSInteger score;

@property enum GAMESTATE *gameState;

- (instancetype)initWithGameType:(NSString *)gameType;

// Game state stuff


@end
