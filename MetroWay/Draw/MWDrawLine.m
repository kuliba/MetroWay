//
//  MMDrawLine.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 09.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWDrawLine.h"

@implementation MWDrawLine

@synthesize color, width, startPoint, endPoint, frame;

// Упаковка объекта
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:color forKey:@"color"];
    [aCoder encodeInt:width forKey:@"width"];
    [aCoder encodeCGPoint:startPoint forKey:@"startPoint"];
    [aCoder encodeCGPoint:endPoint forKey:@"endPoint"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setColor:[aDecoder decodeObjectForKey:@"color"]];
        [self setWidth:[aDecoder decodeIntForKey:@"width"]];
        [self setStartPoint:[aDecoder decodeCGPointForKey:@"startPoint"]];
        [self setEndPoint:[aDecoder decodeCGPointForKey:@"endPoint"]];
    }
    return self;
}

- (CGRect)frame
{
    float x1, x2, y1, y2;
    
    x1 = startPoint.x < endPoint.x ? startPoint.x : endPoint.x;
    x2 = startPoint.x > endPoint.x ? startPoint.x : endPoint.x;
    y1 = startPoint.y < endPoint.y ? startPoint.y : endPoint.y;
    y2 = startPoint.y > endPoint.y ? startPoint.y : endPoint.y;
    
    x1 -= width / 2;
    x2 += width / 2;
    y1 -= width / 2;
    y2 += width / 2;
    
    return CGRectMake(x1, y1, x2 - x1, y2 - y1);
}

@end
