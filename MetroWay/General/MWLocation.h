//
//  MMLocation.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 16.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "MWStation.h"
#import "MWMetroMap.h"

@interface MWLocation : NSObject

+ (MWLocation *)location;
+ (CLLocationDistance) squareGeodesicDistance:(CLLocationCoordinate2D)point1 toPoint:(CLLocationCoordinate2D)point2;
+ (CLLocationDistance) geodesicDistance:(CLLocationCoordinate2D)point1 toPoint:(CLLocationCoordinate2D)point2;
+ (MWStation *)searchNearestStation:(MWMetroMap *)metroMap coordinate:(CLLocationCoordinate2D)coordinate accuracyInMeters:(int)accuracy;
+ (NSArray *)searchNearestStations:(CLLocationCoordinate2D)coordinate accuracyInMeters:(int)accuracy limit:(int)limit;
// Если перегон имеет нулевую длину, то вычисляем его по координатам соседних станций
+ (void)correctZeroDistances:(MWMetroMap *)metroMap;

@end
