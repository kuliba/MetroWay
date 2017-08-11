//
//  MWTransfer.m
//  MetroWay
//
//  Created by Valentin Ozerov on 07.01.17.
//  Copyright © 2017 Valentin Ozerov. All rights reserved.
//

#import "MWTransfer.h"

@implementation MWTransfer

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_station1Identifier forKey:@"station1Identifier"];
    [aCoder encodeObject:_station2Identifier forKey:@"station2Identifier"];
    [aCoder encodeFloat:_time forKey:@"time"];
    [aCoder encodeBool:_roundTrip forKey:@"roundTrip"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _station1Identifier = [aDecoder decodeObjectForKey:@"station1Identifier"];
        _station2Identifier = [aDecoder decodeObjectForKey:@"station2Identifier"];
        _time = [aDecoder decodeFloatForKey:@"time"];
        _roundTrip = [aDecoder decodeBoolForKey:@"roundTrip"];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        _time = 4;
        _roundTrip = true;
    }
    return self;
}
@end
