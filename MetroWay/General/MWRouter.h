//
//  MMRouter.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 24.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>
#import "MWLine.h"
#import "MWStation.h"

typedef enum {
    sortByTripTime,              // = 0, сортировка по времени прохождения маршрута (по умолчанию)
    sortByTransferCount,         // = 1, сортировка по количеству пересадок
    sortByLength} MMsortingType; // = 2, сортировка по длине маршрута

@interface MWRouter : NSObject

// Список кратчайших маршрутов
@property (nonatomic, strong, readonly) NSMutableArray *routes;

// Поиск кратчайших маршрутов. Их максимальное количество ограничено переменной "maximumOfRoutes"
- (void)searchRoutes;
// Получение длины маршрута
- (int)routeLength:(NSArray *)path;
// Определение времени поездки по маршруту (от входа в вестибюль до выхода на улицу)
- (int)routeTripTime:(NSArray *)path;
// Получение количества пересадок на маршруте
- (int)routeTransfers:(NSArray *)path;
// Получение линии по станции
+ (MWLine *)lineByStation:(MWStation *)station;
// Журналирование маршрута. Только для теста
- (void)printRoute:(NSArray *)route;
// Создание копии маршрута, адаптированной для показа списком
+ (NSArray *)compactRoute:(NSArray *)route;
- (void)clearRoutes;
- (void)preCorrectStations;
- (int)postCorrectStations;

+ (MWRouter *)router;

@end
