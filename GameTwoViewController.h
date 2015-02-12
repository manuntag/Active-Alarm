//
//  GameTwoViewController.h
//  Active Alarm
//
//  Created by David Manuntag on 2015-02-10.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewControllerType.h"
#import "SetAlarmViewController.h"

@interface GameTwoViewController : UIViewController <GameViewControllerType>
@property (nonatomic, strong) Game *game;
@end
