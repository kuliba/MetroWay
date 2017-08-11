//
//  MMDrawArc.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 10.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWDrawArc.h"

@implementation MWDrawArc

@synthesize color, width, center, radius, startRadians, endRadians, frame, startDegrees, endDegrees;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:color forKey:@"color"];
    [aCoder encodeInt:width forKey:@"width"];
    [aCoder encodeCGPoint:center forKey:@"center"];
    [aCoder encodeFloat:radius forKey:@"radius"];
    [aCoder encodeFloat:startRadians forKey:@"startRadians"];
    [aCoder encodeFloat:endRadians forKey:@"endRadians"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setColor:[aDecoder decodeObjectForKey:@"color"]];
        [self setWidth:[aDecoder decodeIntForKey:@"width"]];
        [self setCenter:[aDecoder decodeCGPointForKey:@"center"]];
        [self setRadius:[aDecoder decodeFloatForKey:@"radius"]];
        [self setStartRadians:[aDecoder decodeFloatForKey:@"startRadians"]];
        [self setEndRadians:[aDecoder decodeFloatForKey:@"endRadians"]];
    }
    return self;
}

- (CGRect)frame
{
    float x1, x2, y1, y2;
    
    x1 = center.x - radius - width / 2;
    x2 = center.x + radius + width / 2;
    y1 = center.y - radius - width / 2;
    y2 = center.y + radius + width / 2;
    
    return CGRectMake(x1, y1, x2 - x1, y2 - y1);
}

- (void)setStartDegrees:(float)sd
{
    self.startRadians = sd * M_PI / 180;
}

- (float)startDegrees
{
    return self.startRadians * 180 / M_PI;
}

- (void)setEndDegrees:(float)sd
{
    self.endRadians = sd * M_PI / 180;
}

- (float)endDegrees
{
    return self.endRadians * 180 / M_PI;
}

@end
