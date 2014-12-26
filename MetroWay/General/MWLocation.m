//
//  MMLocation.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 16.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWLocation.h"
#import <CoreLocation/CoreLocation.h>
#import "MWEdge.h"
#import "MWStorage.h"
#import "MWStation.h"
#import "MWHaul.h"

@implementation MWLocation

// Реализуем синглетон
+ (MWLocation *)location
{
    static MWLocation *location = nil;
    if (!location) {
        location = [[super allocWithZone:nil] init];
    }
    return location;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    // Реализуем синглетон
    return [self location];
}

- (id)init
{
    self = [super init];
    return self;
}

// Быстрый алгоритм нахождения расстояния между двумя точками взять отсюда:
// http://hashcode.ru/questions/289889/c-расстояние-между-двумя-точками-на-карте-заданными-с-помощью-географических-координат
+ (CLLocationDistance) squareGeodesicDistance:(CLLocationCoordinate2D)point1 toPoint:(CLLocationCoordinate2D)point2
{
    const CLLocationDistance EarthRadiusInMetersSquared = 40612548751652.179688;
    static const double DegreeesToRad = 0.017453292519943295769236907684886;
    
    CLLocationDegrees dtheta = (point1.latitude - point2.latitude) * DegreeesToRad;
    CLLocationDegrees dlambda = (point1.longitude - point2.longitude) * DegreeesToRad;
    CLLocationDegrees mean_t = (point1.latitude + point2.latitude) * DegreeesToRad / 2.0;
    CLLocationDegrees cos_meant = cos(mean_t);
    
    return EarthRadiusInMetersSquared * (dtheta * dtheta + cos_meant * cos_meant * dlambda * dlambda);
}

+ (CLLocationDistance) geodesicDistance:(CLLocationCoordinate2D)point1 toPoint:(CLLocationCoordinate2D)point2
{
    const CLLocationDistance EarthRadiusInMeters = 6372797.560856;
    static const double DegreeesToRad = 0.017453292519943295769236907684886;
    
    CLLocationDegrees dtheta = (point1.latitude - point2.latitude) * DegreeesToRad;
    CLLocationDegrees dlambda = (point1.longitude - point2.longitude) * DegreeesToRad;
    CLLocationDegrees mean_t = (point1.latitude + point2.latitude) * DegreeesToRad / 2.0;
    CLLocationDegrees cos_meant = cos(mean_t);
    
    return EarthRadiusInMeters * sqrt(dtheta * dtheta + cos_meant * cos_meant * dlambda * dlambda);
}

+ (MWStation *)searchNearestStation:(MWMetroMap *)metroMap coordinate:(CLLocationCoordinate2D)coordinate accuracyInMeters:(int)accuracy
{
    MWStation *foundStation = nil;
    MWStation *station = [[MWStation alloc] init];
    CLLocationDistance minimalDistance = 100000000;
    CLLocationDistance distance;
    CLLocationCoordinate2D stationCoordinate;

    for (MWEdge *edge in metroMap.edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:station.class]) {
                station = (MWStation *)element;
                stationCoordinate.latitude = station.geoLocation.x;
                stationCoordinate.longitude = station.geoLocation.y;
                distance = [self geodesicDistance:coordinate toPoint:stationCoordinate];
                if ((distance < minimalDistance) && (distance < accuracy)) {
                    minimalDistance = distance;
                    foundStation = station;
                }
            }
        }
    }
    
    return foundStation;
}

// Сортировка станций по удаленности от текущей точки
// Сортировка схем по приближенности к текущему месторасположению (для массивов)
NSInteger stationsDistanceSort(id station1, id station2, void *context)
{
    MWStation *st1 = (MWStation *)station1;
    MWStation *st2 = (MWStation *)station2;
    if (st1.distance < st2.distance)
        return NSOrderedAscending;
    else if (st1.distance > st2.distance)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

+ (NSArray *)searchNearestStations:(CLLocationCoordinate2D)coordinate accuracyInMeters:(int)accuracy limit:(int)limit
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWStation *station;
    CLLocationDistance distance;
    CLLocationCoordinate2D stationCoordinate;
    
    for (MWEdge *edge in metroMap.edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[MWStation class]]) {
                station = (MWStation *)element;
                stationCoordinate.latitude = station.geoLocation.x;
                stationCoordinate.longitude = station.geoLocation.y;
                distance = [self geodesicDistance:coordinate toPoint:stationCoordinate];
                station.distance = distance;
                if (distance < accuracy && ![result containsObject:station]) {
                    [result addObject:station];
                }
            }
        }
    }
    result = (NSMutableArray *)[result sortedArrayUsingFunction:stationsDistanceSort context:nil];
    return result.count > limit ? [result subarrayWithRange:NSMakeRange(0, limit)] : result;
}

+ (void)correctZeroDistances:(MWMetroMap *)metroMap
{
    MWHaul *haul;
    MWStation *station1, *station2;
    NSObject *element;
    CLLocationCoordinate2D station1Coordinate, station2Coordinate;
    
    for (MWEdge *edge in metroMap.edges) {
        for (int i = 0 ; i < edge.elements.count; i++) {
            element = [edge.elements objectAtIndex:i];
            if ([element isKindOfClass:[MWHaul class]]) {
                haul = (MWHaul *)element;
                if (haul.length == 0) {
                    station1 = (MWStation *)[edge.elements objectAtIndex:i-1];
                    station2 = (MWStation *)[edge.elements objectAtIndex:i+1];
                    station1Coordinate.latitude = station1.geoLocation.x;
                    station1Coordinate.longitude = station1.geoLocation.y;
                    station2Coordinate.latitude = station2.geoLocation.x;
                    station2Coordinate.longitude = station2.geoLocation.y;
                    haul.length = (int)[self geodesicDistance:station1Coordinate toPoint:station2Coordinate];
                    NSLog(@"Длина между станциями %@ и %@ составляет %d метров", station1.identifier, station2.identifier, haul.length);
                }
            }
        }
    }
}

@end
