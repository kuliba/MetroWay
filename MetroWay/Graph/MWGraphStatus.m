//
//  MWGraphStatus.m
//  MetroWay
//
//  Created by Valentin Ozerov on 17.06.16.
//  Copyright © 2016 Valentin Ozerov. All rights reserved.
//

#import "MWGraphStatus.h"

@implementation MWGraphStatus

- (id)init
{
    self =[super init];
    if (self) {
        _status = MWGraphObjectStatusNone;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:_status forKey:@"status"];
    [aCoder encodeObject:_fromDate forKey:@"fromDate"];
    [aCoder encodeObject:_toDate forKey:@"toDate"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _status = (MWGraphObjectStatus)[aDecoder decodeIntForKey:@"status"];
        _fromDate = [aDecoder decodeObjectForKey:@"fromDate"];
        _toDate = [aDecoder decodeObjectForKey:@"toDate"];
    }
    return self;
}

@end
