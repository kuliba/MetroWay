//
//  MWRoute.m
//  MetroWay
//
//  Created by Valentin Ozerov on 25.01.17.
//  Copyright © 2017 Valentin Ozerov. All rights reserved.
//

#import "MWRoute.h"
#import "MWEdge.h"
#import "MWStorage.h"
#import "MWMetroMap.h"
#import "MWRouter.h"

@implementation MWRoute

@synthesize path;

- (id)init
{
    self = [super init];
    if (self) {
        path = nil;
        _tripTime = NAN;
        _transfers = NAN;
        _length = NAN;
    }
    return self;
}

- (void)setPath:(NSArray *)value
{
    path = value;
    [self initPath];
}

- (NSArray *)path
{
    return path;
}

- (void)initPath
{
    [self initRouteLength];
    [self initRouteTripTime];
    [self initRouteTransfers];
}

- (void)initRouteLength
{
    _length = 0;
    MWEdge *edge = [[MWEdge alloc] init];
    
    // Организуем цикл по всем ребрам маршрута
    for (NSObject *element in path) {
        if ([element isKindOfClass:edge.class]) {
            _length += ((MWEdge *)element).length;
        }
    }
}

// Определение времени поездки по маршруту (от входа в вестибюль до выхода на улицу)
- (void)initRouteTripTime
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    _tripTime = 0;
    
    MWVertex *vertex;
    MWEdge *edge;
    
    MWRouter *router = [MWRouter router];
    
    for (NSObject *item in path) {
        if ([item isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)item;
            if (vertex.transfers.count > 0) {
                _tripTime += [router vertexTransferTime:vertex];
            }
        } else if ([item isKindOfClass:[MWEdge class]]) {
            edge = (MWEdge *)item;
            _tripTime += edge.length / ((edge.line.middleSpeed > 0 ? edge.line.middleSpeed : metroMap.middleSpeed) * 1000 / 60);
        }
    }
    
    // Если время поездки составляет меньше минуты, делаем его равным одной минуте
    if (!_tripTime) _tripTime = 1;
}

// Получение количества пересадок на маршруте
- (void)initRouteTransfers
{
    _transfers = 0;
    
    // Если маршрут пустой, выходим
    if (!path.count) return;
    
    MWEdge *edge;
    MWVertex *vertex;
    MWStation *station;
    BOOL onePlatform;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    MWRouter *router = [MWRouter router];
    
    if (!metroMap.startStation || !metroMap.finishStation) return;
    
    // Очищаем все переходы
    for (NSObject *object in path) {
        if ([object isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)object;
            [vertex.transfers removeAllObjects];
        }
    }
    
    // Определяем, является ли начальная вершина пересадочным узлом. Для этого проверяем, принадлежит ли начальная станция маршрута первому ребру. Если принадлежит, то пересадки нет.
    
    // Получаем первое ребро маршрута
    if ((path.count > 1) && ([[path objectAtIndex:1] isKindOfClass:[MWEdge class]])) {
        vertex = [path firstObject];
        edge = [path objectAtIndex:1];
        
        if ([edge.startVertex isEqual:vertex]) {
            station = [edge.elements firstObject];
        } else {
            station = [edge.elements lastObject];
        }
    }
    
    onePlatform = (station.platformIndex + metroMap.startStation.platformIndex > 0) && (station.platformIndex == metroMap.startStation.platformIndex);
    
    // Проверяем, принадлежит ли ему начальная станция маршрута
    if (edge && ![edge containsStation:metroMap.startStation] && !onePlatform) {
        _transfers++;
        // Добавляем в первую вершину маршрут пересадки "Станция - Станция"
        [vertex.transfers addObject:metroMap.startStation];
        [vertex.transfers addObject:station];
        //        [self initVertexTransferTime:vertex];
    }
    
    // Если маршрут состоит из одной вершины...
    if (path.count == 1) {
        vertex = (MWVertex *)[path firstObject];
        if ([router isPossibleTransferBetweenTwoStations:metroMap.startStation finishStation:metroMap.finishStation]) {
            [vertex.transfers addObject:metroMap.startStation];
            [vertex.transfers addObject:metroMap.finishStation];
            //            [self initVertexTransferTime:vertex];
            _transfers = 1;
            return;
        } else {
            vertex.transfers = [router routeOnVertex:metroMap.startStation finishStation:metroMap.finishStation onVertex:vertex];
            int switches = (int)[vertex.transfers count] / 2;
            if (switches < 0)
                switches = 0;
            _transfers = switches;
        }
    }
    
    // Определяем, является ли конечная вершина пересадочным узлом. Для этого проверяем, принадлежит ли конечная станция маршрута последнему ребру. Если принадлежит, то пересадки нет.
    
    // Получаем последнее ребро маршрута
    if ((path.count > 1) && ([[path objectAtIndex:(path.count - 2)] isKindOfClass:[MWEdge class]])) {
        edge = [path objectAtIndex:(path.count - 2)];
        vertex = [path lastObject];
        if ([edge.finishVertex isEqual:vertex]) {
            station = [edge.elements lastObject];
        } else {
            station = [edge.elements firstObject];
        }
    }
    
    onePlatform = (station.platformIndex + metroMap.finishStation.platformIndex > 0) && (station.platformIndex == metroMap.finishStation.platformIndex);
    
    // Проверяем, принадлежит ли ему конечная станция маршрута
    if (edge && ![edge containsStation:metroMap.finishStation] && !onePlatform) {
        _transfers++;
        // Добавляем в конечную вершину маршрут пересадки "Станция - Станция"
        [vertex.transfers addObject:metroMap.finishStation];
        [vertex.transfers addObject:station];
        //        [self initVertexTransferTime:vertex];
    }
    
    // Определяем сколько раз в маршруте менялась линия. Это и есть количество пересадок
    MWLine *previouslyLine = nil;
    MWEdge *previouslyEdge = nil;
    
    for (NSObject *element in path) {
        if ([element isKindOfClass:[MWEdge class]]) {
            edge = (MWEdge *)element;
            if (!previouslyLine) {
                previouslyLine = edge.line;
            } else if (![previouslyLine isEqual:edge.line]) {
                // switches++;
                int i = [router transfersOnVertex:vertex fromEdge:previouslyEdge toEdge:edge];
                // Если произошла пересадка на другую линию, но количество возможных пересадок со станции на станцию на вершине равно нулю, то такой маршрут невозможен. Возвращаем -1.
                if (!i) {
                    _transfers = -1;
                    return;
                }
                _transfers += i;
                previouslyLine = edge.line;
            }
            previouslyEdge = edge;
        } else if ([element isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)element;
        }
    }
}

@end
