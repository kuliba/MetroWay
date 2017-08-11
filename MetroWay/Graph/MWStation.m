//
//  MMStation.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWStation.h"
#import "MWLanguage.h"
#import "MWGraphStatus.h"

@implementation MWStation

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identifier forKey:@"identifier"];
    [aCoder encodeObject:_nameOriginal forKey:@"nameOriginal"];
    [aCoder encodeObject:_nameEnglish forKey:@"nameEnglish"];
    [aCoder encodeCGPoint:_mapLocation forKey:@"mapLocation"];
    [aCoder encodeCGPoint:_geoLocation forKey:@"geoLocation"];
    [aCoder encodeObject:_drawPrimitives forKey:@"drawPrimitivesStation"];
    [aCoder encodeObject:_nameOriginalTextPrimitives forKey:@"nameOriginalTextPrimitives"];
    [aCoder encodeObject:_nameEnglishTextPrimitives forKey:@"nameEnglishTextPrimitives"];
    [aCoder encodeBool:_showNameOnMap forKey:@"showNameOnMap"];
    [aCoder encodeInt:_platformIndex forKey:@"platformIndex"];
    [aCoder encodeObject:_states forKey:@"states"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _identifier = [aDecoder decodeObjectForKey:@"identifier"];
        _nameOriginal = [aDecoder decodeObjectForKey:@"nameOriginal"];
        _nameEnglish = [aDecoder decodeObjectForKey:@"nameEnglish"];
        _mapLocation = [aDecoder decodeCGPointForKey:@"mapLocation"];
        _geoLocation = [aDecoder decodeCGPointForKey:@"geoLocation"];
        _drawPrimitives = [aDecoder decodeObjectForKey:@"drawPrimitivesStation"];
        _platformIndex = [aDecoder decodeIntForKey:@"platformIndex"];
        _showNameOnMap = [aDecoder decodeBoolForKey:@"showNameOnMap"];
        if (!_drawPrimitives) {
            _drawPrimitives = [NSMutableArray array];
        }
        _nameOriginalTextPrimitives = [aDecoder decodeObjectForKey:@"nameOriginalTextPrimitives"];
        if (!_nameOriginalTextPrimitives) {
            _nameOriginalTextPrimitives = [NSMutableArray array];
        }
        _nameEnglishTextPrimitives = [aDecoder decodeObjectForKey:@"nameEnglishTextPrimitives"];
        if (!_nameEnglishTextPrimitives) {
            _nameEnglishTextPrimitives = [NSMutableArray array];
        }
        // Все вершины изначально непосещенные
        _routeVisited = FALSE;
        // Число в 100 000 километров считается в программе бесконечным
        _routeDistance = HUGE;
        // Инициализируем массив для хранения маршрута
        _route = [NSMutableArray array];
        
        _distance = 0;
        
        _states = [aDecoder decodeObjectForKey:@"states"];
        if (!_states) {
            _states = [NSMutableArray array];
        }
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        _drawPrimitives = [NSMutableArray array];
        _nameOriginalTextPrimitives = [[NSMutableArray alloc] init];
        _nameEnglishTextPrimitives = [[NSMutableArray alloc] init];
        _states = [NSMutableArray array];
        _showNameOnMap = true;
        _routeVisited = FALSE;
        _routeDistance = HUGE;
        _route = [[NSMutableArray alloc] init];
        _distance = 0;
        _platformIndex = 0;
        _listLocation = CGPointMake(-100, -100);
    }
    return self;
}

- (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;
    
    if ([date compare:endDate] == NSOrderedDescending)
        return NO;
    
    return YES;
}

- (BOOL)isStatusClosed:(MWGraphStatus *)status
{
    NSDate *new = [NSDate new];

    if (status.status == MWGraphObjectStatusClosed) {
        if (status.fromDate && status.toDate) {
            return [self date:new isBetweenDate:status.fromDate andDate:status.toDate];
        } else if (status.fromDate) {
            return [status.fromDate compare:new] == NSOrderedAscending;
        } else if (status.toDate) {
            return [status.toDate compare:new] == NSOrderedDescending;
        } else return true;
    }
    
    return false;
}

- (BOOL)isClosed
{
    for (MWGraphStatus *status in _states) {
        if ([self isStatusClosed:status]) {
            return true;
        }
    }
    
    return false;
}

- (NSString *)closedText
{
    NSString *result;
 
    for (MWGraphStatus *status in _states) {
        if ([self isStatusClosed:status]) {
            result = [MWLanguage localizedStringForKey:@"MetroMap_Closed"];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterShortStyle]; // Set date and time styles
            [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
            NSString *fromString = [dateFormatter stringFromDate:status.fromDate];
            NSString *toString = [dateFormatter stringFromDate:status.toDate];

            if (status.fromDate && status.toDate) {
                result = [NSString stringWithFormat:@"%@ %@ %@ %@ %@", result, [MWLanguage localizedStringForKey:@"MetroMap_From"].lowercaseString, fromString, [MWLanguage localizedStringForKey:@"MetroMap_To"].lowercaseString, toString];
            } else if (status.fromDate) {
                result = [NSString stringWithFormat:@"%@ %@ %@", result, [MWLanguage localizedStringForKey:@"MetroMap_From"].lowercaseString, fromString];
                
            } else if (status.toDate) {
                result = [NSString stringWithFormat:@"%@ %@ %@", result, [MWLanguage localizedStringForKey:@"MetroMap_Until"].lowercaseString, toString];
            }
            
            return result;
        }
    }
    
    return nil;
}

@end
