//
//  MMRouteStorage.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 19.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWRouteStorage : NSObject <NSCoding>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, weak, readonly) NSArray *lastRoutes;
@property (nonatomic, weak, readonly) NSArray *favoriteRoutes;
@property (nonatomic, weak, readonly) NSArray *favoriteStations;
@property (nonatomic, weak, readonly) NSArray *allFavorites;

- (void)addLastRoute:(NSString *)stationIdentifier1 station2:(NSString *)stationIdentifier2;
- (void)addFavoriteRoute:(int)routeNumber details:(NSString *)details;
- (void)addFavoriteStation:(NSString *)stationIdentifier;
- (void)save;
- (BOOL)isFavoriteRoute:(int)routeNumber;
- (void)removeFavoriteRoute:(NSString *)stationIdentifier1 station2:(NSString *)stationIdentifier2 routeNumber:(int)routeNumber;

@end
