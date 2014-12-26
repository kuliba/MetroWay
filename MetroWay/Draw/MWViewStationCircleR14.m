//
//  MMViewStationCircleR14.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 29.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWViewStationCircleR14.h"
#import "MWDrawArc.h"
#import "MWDraw.h"

@implementation MWViewStationCircleR14

@synthesize color;

- (id)initWithFrame:(CGRect)frame
{
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, 14, 14);
    self = [super initWithFrame:newFrame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)init
{
    CGRect frame = CGRectMake(0, 0, 14, 14);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    MWDrawArc *drawArc = [[MWDrawArc alloc] init];
    drawArc.center = CGPointMake(7, 7);
    drawArc.startRadians = M_PI * 2;
    drawArc.endRadians = 0;
    drawArc.radius = 4.8;
    drawArc.width = 4.9;
    drawArc.color = color;
    [MWDraw drawArc:drawArc inContext:context];
}

- (void)setColor:(UIColor *)c
{
    color = c;
    [self.layer setNeedsDisplay];
}

- (UIColor *)color
{
    return color;
}

@end
