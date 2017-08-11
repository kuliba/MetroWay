//
//  MMRouteItem.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 19.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWSettings.h"

typedef enum {
    MWRouteItemTypeLastRoute,
    MWRouteItemTypeFavoriteRoute,
    MWRouteItemTypeFavoriteStation
} MWRouteItemType;

@interface MWRouteItem : NSObject <NSCoding>

@property (strong, nonatomic) NSString *metroMapIdentifier;
@property (strong, nonatomic) NSString *stationIdentifier1;
@property (strong, nonatomic) NSString *stationIdentifier2;
@property (nonatomic) int routeNumber;
@property (nonatomic) MWSortingType sortingType;
@property (nonatomic) MWRouteItemType type;
@property (strong, nonatomic) NSString *details;
// Дата добавления
@property (strong, nonatomic) NSDate *added;

@end
