//
//  MMRouteItem.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 19.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWRouteItem : NSObject <NSCoding>

@property (strong, nonatomic) NSString *metroMapIdentifier;
@property (strong, nonatomic) NSString *stationIdentifier1;
@property (strong, nonatomic) NSString *stationIdentifier2;
// 0 - Последний маршрут, 1 - избранный маршрут, 2 - избранная станция
@property int type;
// Дата добавления
@property (strong, nonatomic) NSDate *added;

@end
