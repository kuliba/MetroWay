//
//  MMHaul.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWHaul.h"

@implementation MWHaul

@synthesize length, drawPrimitives, identifier, showOnMap;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:identifier forKey:@"identifier"];
    [aCoder encodeInt:length forKey:@"length"];
    [aCoder encodeObject:drawPrimitives forKey:@"drawPrimitives"];
    [aCoder encodeBool:showOnMap forKey:@"showOnMap"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeObjectForKey:@"identifier"];
        self.length = [aDecoder decodeIntForKey:@"length"];
        self.drawPrimitives = [aDecoder decodeObjectForKey:@"drawPrimitives"];
        if (!drawPrimitives) {
            drawPrimitives = [NSMutableArray array];
        }
        self.showOnMap = [aDecoder decodeBoolForKey:@"showOnMap"];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        length = 0;
        drawPrimitives = [NSMutableArray array];
        showOnMap = YES;
    }
    return self;
}

@end
