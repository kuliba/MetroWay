//
//  MMDrawFillCircle.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 03.01.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWDrawFillCircle.h"

@implementation MWDrawFillCircle

@synthesize center, radius, fillColor, frame;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeCGPoint:center forKey:@"center"];
    [aCoder encodeDouble:radius forKey:@"radius"];
    [aCoder encodeObject:fillColor forKey:@"fillColor"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setCenter:[aDecoder decodeCGPointForKey:@"center"]];
        [self setRadius:[aDecoder decodeDoubleForKey:@"radius"]];
        [self setFillColor:[aDecoder decodeObjectForKey:@"fillColor"]];
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
