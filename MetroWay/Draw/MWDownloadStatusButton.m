//
//  MMDrawDownloadStatusButton.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.08.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWDownloadStatusButton.h"

@implementation MWDownloadStatusButton

@synthesize progress, pause;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        progress = 0;
    }
    return self;
}

// Отрисовка кнопки
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    float offset = M_PI * 2 * progress;
    MWDrawArc *drawArc = [[MWDrawArc alloc] init];
    
    if (progress == 0) {
        drawArc.center = CGPointMake(32.5, 32.5);
        drawArc.startRadians = 0;
        drawArc.endRadians = M_PI * 2;
        drawArc.radius = 13.5;
        drawArc.width = 2;
        drawArc.color = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
        [MWDraw drawArc:drawArc inContext:context];
    } else {
        MWDrawArc *drawArc = [[MWDrawArc alloc] init];
        drawArc.center = CGPointMake(32.5, 32.5);
        drawArc.startRadians = offset - 90 * M_PI / 180;
        drawArc.endRadians = - 90 * M_PI / 180;
        drawArc.radius = 13.5;
        drawArc.width = 2;
        drawArc.color = [UIColor colorWithRed:(204/255.0) green:(204/255.0) blue:(204/255.0) alpha:1];
        [MWDraw drawArc:drawArc inContext:context];
    }
    
    drawArc.center = CGPointMake(32.5, 32.5);
    drawArc.startRadians = - 90 * M_PI / 180;
    drawArc.endRadians = offset - 90 * M_PI / 180;
    drawArc.radius = 13.5;
    drawArc.width = 2;
    drawArc.color = [UIColor colorWithRed:(247/255.0) green:(90/255.0) blue:(73/255.0) alpha:1];
    [MWDraw drawArc:drawArc inContext:context];
    
    MWDrawLine *drawLine = [[MWDrawLine alloc] init];

    drawLine.startPoint = CGPointMake(32.5, 27.5);
    drawLine.endPoint = CGPointMake(32.5, 37.5);
    drawLine.width = 10.5;
    drawLine.color = [UIColor colorWithRed:(141/255.0) green:(141/255.0) blue:(141/255.0) alpha:1];
    [MWDraw drawLine:drawLine inContext:context];

    if (pause) {
        drawLine.startPoint = CGPointMake(32.5, 27.5);
        drawLine.endPoint = CGPointMake(32.5, 37.5);
        drawLine.width = 3.5;
        drawLine.color = [UIColor whiteColor];
        [MWDraw drawLine:drawLine inContext:context];
    }
    
    drawLine = nil;
    drawArc = nil;
}

- (float)progress
{
    return progress;
}

- (void)setProgress:(float)p
{
    progress = p;

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [self setNeedsDisplay];
    });
}

- (BOOL)pause
{
    return pause;
}

- (void)setPause:(BOOL)p
{
    pause = p;
    [self setNeedsDisplay];
}

@end
