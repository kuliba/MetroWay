//
//  MMDrawRoundedRect.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 05.03.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWDrawRoundedRect.h"

@implementation MWDrawRoundedRect

@synthesize rect, cornerRadius, color, frame;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeCGRect:rect forKey:@"rect"];
    [aCoder encodeFloat:cornerRadius forKey:@"cornerRadius"];
    [aCoder encodeObject:color forKey:@"color"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setRect:[aDecoder decodeCGRectForKey:@"rect"]];
        [self setCornerRadius:[aDecoder decodeFloatForKey:@"cornerRadius"]];
        [self setColor:[aDecoder decodeObjectForKey:@"color"]];
    }
    return self;
}

- (CGRect)frame
{
    return rect;
}

@end
