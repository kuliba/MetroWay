//
//  MMRouteItem.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 19.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWRouteItem.h"

@implementation MWRouteItem

@synthesize metroMapIdentifier, stationIdentifier1, stationIdentifier2, type, added;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:metroMapIdentifier forKey:@"metroMapIdentifier"];
    [aCoder encodeObject:stationIdentifier1 forKey:@"stationIdentifier1"];
    [aCoder encodeObject:stationIdentifier2 forKey:@"stationIdentifier2"];
    [aCoder encodeInt:type forKey:@"type"];
    [aCoder encodeObject:added forKey:@"added"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setMetroMapIdentifier:[aDecoder decodeObjectForKey:@"metroMapIdentifier"]];
        [self setStationIdentifier1:[aDecoder decodeObjectForKey:@"stationIdentifier1"]];
        [self setStationIdentifier2:[aDecoder decodeObjectForKey:@"stationIdentifier2"]];
        [self setType:[aDecoder decodeIntForKey:@"type"]];
        [self setAdded:[aDecoder decodeObjectForKey:@"added"]];
    }
    return self;
}


@end
