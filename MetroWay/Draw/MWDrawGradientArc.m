//
//  MMDrawGradientArc.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 04.01.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWDrawGradientArc.h"

@implementation MWDrawGradientArc

@synthesize startColor, endColor, width, center, startGradient, endGradient, radius, startRadians, endRadians, frame;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:startColor forKey:@"startColor"];
    [aCoder encodeObject:endColor forKey:@"endColor"];
    [aCoder encodeInt:width forKey:@"width"];
    [aCoder encodeCGPoint:center forKey:@"center"];
    [aCoder encodeCGPoint:startGradient forKey:@"startGradient"];
    [aCoder encodeCGPoint:endGradient forKey:@"endGradient"];
    [aCoder encodeFloat:radius forKey:@"radius"];
    [aCoder encodeFloat:startRadians forKey:@"startRadians"];
    [aCoder encodeFloat:endRadians forKey:@"endRadians"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setStartColor:[aDecoder decodeObjectForKey:@"startColor"]];
        [self setEndColor:[aDecoder decodeObjectForKey:@"endColor"]];
        [self setWidth:[aDecoder decodeIntForKey:@"width"]];
        [self setCenter:[aDecoder decodeCGPointForKey:@"center"]];
        [self setStartGradient:[aDecoder decodeCGPointForKey:@"startGradient"]];
        [self setEndGradient:[aDecoder decodeCGPointForKey:@"endGradient"]];
        [self setRadius:[aDecoder decodeFloatForKey:@"radius"]];
        [self setStartRadians:[aDecoder decodeFloatForKey:@"startRadians"]];
        [self setEndRadians:[aDecoder decodeFloatForKey:@"endRadians"]];
    }
    return self;
}

- (CGRect)frame
{
    float x1, x2, y1, y2;
    
    x1 = center.x - radius;
    x2 = center.x + radius;
    y1 = center.y - radius;
    y2 = center.y + radius;
    
    return CGRectMake(x1, y1, x2 - x1, y2 - y1);
}

@end
