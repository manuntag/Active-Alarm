//
//  AnimatedObject.h
//  Active Alarm
//
//  Created by Veronica Baldys on 2015-02-12.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface AnimatedObject : UIView
{
    CGPoint *_location;
    CGPoint *_velocity;
    const CGPoint *_size;
    CGRect *_frameView;
    
}

- (CGPoint) location;
- (CGPoint) randomLocation;
- (BOOL) isWithinBounds:(CGPoint)newLocation;
- (void) configureObject;
- (void) animate;
- (void) update;




@end
