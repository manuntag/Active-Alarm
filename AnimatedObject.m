//
//  AnimatedObject.m
//  Active Alarm
//
//  Created by Veronica Baldys on 2015-02-12.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "AnimatedObject.h"

@implementation AnimatedObject

-(CGPoint)randomLocation
{
    CGFloat xrand = arc4random_uniform(self.bounds.size.width);
    CGFloat yrand = arc4random_uniform(self.bounds.size.height);
    return CGPointMake(xrand, yrand);
}


@end
