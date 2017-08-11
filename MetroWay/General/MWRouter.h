//
//  MMRouter.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 24.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

@class MWVertex, MWRoute;

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>
#import "MWLine.h"
#import "MWStation.h"
#import "MWEdge.h"

typedef enum {
    sortByTripTime,              // = 0, сортировка по времени прохождения маршрута (по умолчанию)
    sortByTransferCount,         // = 1, сортировка по количеству пересадок
    sortByLength} MMsortingType; // = 2, сортировка по длине маршрута

@interface MWRouter : NSObject

// Список кратчайших маршрутов
@property (nonatomic, strong, readonly) NSArray *routes;

// Поиск кратчайших маршрутов. Их максимальное количество ограничено переменной "maximumOfRoutes"
- (void)searchRoutes;
// Получение длины маршрута
// - (int)routeLength:(NSArray *)path;
// Определение времени поездки по маршруту (от входа в вестибюль до выхода на улицу)
// - (float)routeTripTime:(NSArray *)path;
// Получение количества пересадок на маршруте
// - (int)routeTransfers:(NSArray *)path;
// Получение линии по станции
+ (MWLine *)lineByStation:(MWStation *)station;
// Журналирование маршрута. Только для теста
- (void)printRoute:(NSArray *)route;
// Создание копии маршрута, адаптированной для показа списком
+ (MWRoute *)compactRoute:(MWRoute *)route;
- (void)clearRoutes;
- (void)preCorrectStations;
- (int)postCorrectStations;
- (void)printAllRoutes;
- (NSMutableArray *)stationsForVertex:(MWVertex *)vertex;
- (float)vertexTransferTime:(MWVertex *)vertex;
// Проверяем, можно ли с одной станции напрямую перейти на другую
- (BOOL)isPossibleTransferBetweenTwoStations:(MWStation *)startStation finishStation:(MWStation *)finishStation;
// Получаем маршрут пересадки (список станций)
- (NSMutableArray *)routeOnVertex:(MWStation *)startStation finishStation:(MWStation *)finishStation onVertex:(MWVertex *)vertex;
// Получаем количество пересадок на узле
- (int)transfersOnVertex:(MWVertex *)vertex fromEdge:(MWEdge *)fromEdge toEdge:(MWEdge *)toEdge;

+ (MWRouter *)router;

@end
