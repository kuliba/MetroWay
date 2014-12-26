//
//  MMDrawGradientRect.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 02.01.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWDrawGradientRect.h"

@implementation MWDrawGradientRect

@synthesize point1, point2, point3, point4, startPoint, endPoint, startColor, endColor, frame;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeCGPoint:point1 forKey:@"point1"];
    [aCoder encodeCGPoint:point2 forKey:@"point2"];
    [aCoder encodeCGPoint:point3 forKey:@"point3"];
    [aCoder encodeCGPoint:point4 forKey:@"point4"];
    [aCoder encodeCGPoint:startPoint forKey:@"startPoint"];
    [aCoder encodeCGPoint:endPoint forKey:@"endPoint"];
    [aCoder encodeObject:startColor forKey:@"startColor"];
    [aCoder encodeObject:endColor forKey:@"endColor"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setPoint1:[aDecoder decodeCGPointForKey:@"point1"]];
        [self setPoint2:[aDecoder decodeCGPointForKey:@"point2"]];
        [self setPoint3:[aDecoder decodeCGPointForKey:@"point3"]];
        [self setPoint4:[aDecoder decodeCGPointForKey:@"point4"]];
        [self setStartPoint:[aDecoder decodeCGPointForKey:@"startPoint"]];
        [self setEndPoint:[aDecoder decodeCGPointForKey:@"endPoint"]];
        [self setStartColor:[aDecoder decodeObjectForKey:@"startColor"]];
        [self setEndColor:[aDecoder decodeObjectForKey:@"endColor"]];
    }
    return self;
}

- (CGRect)frame
{
    float x1, x2, y1, y2;

    x1 = MIN(point1.x, point2.x);
    x1 = MIN(x1, point3.x);
    x1 = MIN(x1, point4.x);
    
    x2 = MAX(point1.x, point2.x);
    x2 = MAX(x2, point3.x);
    x2 = MAX(x2, point4.x);

    y1 = MIN(point1.y, point2.y);
    y1 = MIN(y1, point3.y);
    y1 = MIN(y1, point4.y);
    
    y2 = MAX(point1.y, point2.y);
    y2 = MAX(y2, point3.y);
    y2 = MAX(y2, point4.y);

    return CGRectMake(x1, y1, x2 - x1, y2 - y1);
}

@end