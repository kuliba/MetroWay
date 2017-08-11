//
//  MMEdge.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWEdge.h"
#import "MWHaul.h"
#import "MWStation.h"

@implementation MWEdge

- (id)init
{
    self =[super init];
    if (self) {
        _elements = [[NSMutableArray alloc] init];
        _enable = TRUE;
        _sinthetic = FALSE;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identifier forKey:@"identifier"];
    [aCoder encodeObject:_elements forKey:@"elements"];
    [aCoder encodeObject:_directionFromStation forKey:@"directionFromStation"];
    [aCoder encodeObject:_startVertex forKey:@"startVertex"];
    [aCoder encodeObject:_finishVertex forKey:@"finishVertex"];
    [aCoder encodeObject:_line forKey:@"line"];
#ifdef DEBUG
    [aCoder encodeObject:_developmentName forKey:@"developmentName"];
#endif
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setIdentifier:[aDecoder decodeObjectForKey:@"identifier"]];
        [self setElements:[aDecoder decodeObjectForKey:@"elements"]];
        if (!_elements)
            _elements = [[NSMutableArray alloc] init];
        [self setDirectionFromStation:[aDecoder decodeObjectForKey:@"directionFromStation"]];
        [self setStartVertex:[aDecoder decodeObjectForKey:@"startVertex"]];
        [self setFinishVertex:[aDecoder decodeObjectForKey:@"finishVertex"]];
        [self setLine:[aDecoder decodeObjectForKey:@"line"]];
#ifdef DEBUG
        [self setDevelopmentName:[aDecoder decodeObjectForKey:@"developmentName"]];
#endif
    }
    return self;
}

- (BOOL)containsStation:(MWStation *)station
{
    if (!self.enable) {
        return FALSE;
    }
    
    return [_elements containsObject:station];
}

- (int)stationIndex:(MWStation *)station
{
    for (int i = 0; i < [[self elements] count]; i++) {
        if ([[[self elements] objectAtIndex:i] isEqual:station]) {
            return i;
        }
    }
    return -1;
}

- (MWVertex *)vertexByStation:(MWStation *)station
{
    MWVertex *result;
    if ([[self.elements firstObject] isEqual:station]) {
        result = _startVertex;
    } else if ([[self.elements lastObject] isEqual:station]) {
        result = _finishVertex;
    }
    return result;
}

- (float)length
{
    float result = -1;
    for (NSObject *element in _elements) {
        if ([element isMemberOfClass:[MWHaul class]])
            result += [(MWHaul *)element length];
    }
    return result;
}

// Возвращаем количество станций в участке
- (int)stationsCount
{
    return ((int)_elements.count - 1) / 2 + 1;
}

- (NSArray *)stations
{
    MWStation *station;
    
    NSMutableArray *stations = [[NSMutableArray alloc] init];
    for (NSObject *element in _elements) {
        if ([element isKindOfClass:[MWStation class]]) {
            station = (MWStation *)element;
            [stations addObject:station];
        }
    }
    
    return stations;
}

@end
