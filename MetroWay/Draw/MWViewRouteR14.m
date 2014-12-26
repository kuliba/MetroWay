//
//  MMViewRouteR14.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 02.06.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWViewRouteR14.h"
#import "MWDrawArc.h"
#import "MWDraw.h"
#import "MWDrawFillCircle.h"
#import "MWDrawLine.h"

@implementation MWViewRouteR14

@synthesize color1, color2;

- (id)initWithFrame:(CGRect)frame
{
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, 14, 35.5);
    self = [super initWithFrame:newFrame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)init
{
    CGRect frame = CGRectMake(0, 0, 14, 35.5);
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
    drawArc.color = color1;
    [MWDraw drawArc:drawArc inContext:context];

    drawArc.center = CGPointMake(7, 28.5);
    drawArc.startRadians = M_PI * 2;
    drawArc.endRadians = 0;
    drawArc.radius = 4.8;
    drawArc.width = 4.9;
    drawArc.color = color2;
    [MWDraw drawArc:drawArc inContext:context];
    
    MWDrawFillCircle *drawFillCircle = [[MWDrawFillCircle alloc] init];
    drawFillCircle.center = CGPointMake(7, 17.5);
    drawFillCircle.radius = 2;
    drawFillCircle.fillColor = color1;
    [MWDraw drawFillCircle:drawFillCircle inContext:context];
    
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];
    drawLine.startPoint = CGPointMake(7, 13);
    drawLine.endPoint = CGPointMake(7, 17.5);
    drawLine.width = 4;
    drawLine.color = color1;
    [MWDraw drawLine:drawLine inContext:context];
}

- (void)setColor1:(UIColor *)c
{
    color1 = c;
    [self.layer setNeedsDisplay];
}

- (UIColor *)color1
{
    return color1;
}

- (void)setColor2:(UIColor *)c
{
    color2 = c;
    [self.layer setNeedsDisplay];
}

- (UIColor *)color2
{
    return color2;
}

@end