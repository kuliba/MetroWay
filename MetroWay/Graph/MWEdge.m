//
//  MMEdge.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWEdge.h"
#import "MWHaul.h"

@implementation MWEdge

@synthesize elements, directionFromStation, startVertex, finishVertex, line, enable, sinthetic, developmentName, identifier;

- (id)init
{
    self =[super init];
    if (self) {
        elements = [[NSMutableArray alloc] init];
        enable = TRUE;
        sinthetic = FALSE;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:identifier forKey:@"identifier"];
    [aCoder encodeObject:elements forKey:@"elements"];
    [aCoder encodeObject:directionFromStation forKey:@"directionFromStation"];
    [aCoder encodeObject:startVertex forKey:@"startVertex"];
    [aCoder encodeObject:finishVertex forKey:@"finishVertex"];
    [aCoder encodeObject:line forKey:@"line"];
#ifdef DEBUG
    [aCoder encodeObject:developmentName forKey:@"developmentName"];
#endif
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setIdentifier:[aDecoder decodeObjectForKey:@"identifier"]];
        [self setElements:[aDecoder decodeObjectForKey:@"elements"]];
        if (!elements)
            elements = [[NSMutableArray alloc] init];
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
    
    return [elements containsObject:station];
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
        result = startVertex;
    } else if ([[self.elements lastObject] isEqual:station]) {
        result = finishVertex;
    }
    return result;
}

- (int)length
{
    int result = -1;
    for (NSObject *element in elements) {
        if ([element isMemberOfClass:[MWHaul class]])
            result += [(MWHaul *)element length];
    }
    return result;
}

// Возвращаем количество станций в участке
- (int)stationsCount
{
    return ((int)elements.count - 1) / 2 + 1;
}

- (NSArray *)stations
{
    MWStation *station;
    
    NSMutableArray *stations = [[NSMutableArray alloc] init];
    for (NSObject *element in elements) {
        if ([element isKindOfClass:[MWStation class]]) {
            station = (MWStation *)element;
            [stations addObject:station];
        }
    }
    
    return stations;
}

@end
