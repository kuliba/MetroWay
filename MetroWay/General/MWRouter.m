//
//  MMRouter.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 24.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWRouter.h"
#import "MWVertex.h"
#import "MWEdge.h"
#import "MWStorage.h"
#import "MWRoute.h"

@implementation MWRouter

@synthesize routes;

// Все найденные маршруты
NSArray *foundRoutes;

// Линия, по которой расположены начальная и конечная станции
MWLine *directLine = nil;

// Реализуем синглетон
+ (MWRouter *)router
{
    static MWRouter *router = nil;
    if (!router) {
        router = [[super allocWithZone:nil] init];
    }
    return router;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    // Реализуем синглетон
    return [self router];
}

// Инициализация
- (id)init
{
    self = [super init];
    if (self) {
        foundRoutes = nil;
        routes = nil;
    }
    return self;
}

// Возвращаем массив маршрутов
- (NSArray *)routes
{
    NSMutableArray *result = [NSMutableArray array];
    
    for (int i = 0; i < foundRoutes.count && (i < 3); i++) {
        [result addObject:foundRoutes[i]];
    }

    return [NSArray arrayWithArray:result];
}

- (void)clearRoutes
{
    foundRoutes = nil;
}

- (void)initRoutes
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] init];

    // Делаем все ребра активными
    for (MWEdge *edge in metroMap.edges) {
        edge.enable = TRUE;
        if (edge.sinthetic)
            [indexSet addIndex:[metroMap.edges indexOfObject:edge]];
    }
    
    // Удаляем виртуальные ребра
    [metroMap.edges removeObjectsAtIndexes:indexSet];
    
    // Если начало и конец маршрута не являются вершинами графа, делаем их такими
    [self createVertex:metroMap.startStation];
    [self createVertex:metroMap.finishStation];
}

// Проверяем, лежат ли начальная и конечная станции на одной линии. Если так, то корректируем их, если маршруты пролегают через одну платформу
- (void)preCorrectStations
{
    directLine = nil;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (metroMap.startStation.platformIndex + metroMap.finishStation.platformIndex == 0) return;
    
    [self initRoutes];
    
    directLine = nil;
    MWLine *startLine, *finishLine;
    MWVertex *startVertex = [self vertexByStation:metroMap.startStation];
    MWVertex *finishVertex = [self vertexByStation:metroMap.finishStation];
    
    NSMutableArray *startStations = [NSMutableArray array];
    NSMutableArray *finishStations = [NSMutableArray array];
    NSArray *stations;
    
    stations = [self stationsForVertex:startVertex];
    for (MWStation *station in stations) {
        if (station.platformIndex == metroMap.startStation.platformIndex) {
            [startStations addObject:station];
        }
    }

    stations = [self stationsForVertex:finishVertex];
    for (MWStation *station in stations) {
        if (station.platformIndex == metroMap.finishStation.platformIndex) {
            [finishStations addObject:station];
        }
    }

    startLine = [MWRouter lineByStation:metroMap.startStation];
    finishLine = [MWRouter lineByStation:metroMap.finishStation];
    
    if (startLine == finishLine) {
        directLine = startLine;
        return;
    }
    
    for (MWStation *sstation in startStations) {
        startLine = [MWRouter lineByStation:sstation];
        for (MWStation *fstation in finishStations) {
            finishLine = [MWRouter lineByStation:fstation];
            if (startLine == finishLine) {
                metroMap.startStation = sstation;
                metroMap.finishStation = fstation;
                directLine = startLine;
                return;
            }
        }
    }
}

// После расчета маршрута корректируем начальные и конечные станции
- (int)postCorrectStations
{
    MWRoute *route = [foundRoutes firstObject];
    if (route.path.count < 3) return 0;

    MWMetroMap *metroMap = [MWStorage currentMetroMap];
 
    MWStation *startStation = metroMap.startStation;
    MWStation *finishStation = metroMap.finishStation;

    MWVertex *vertex = [route.path firstObject];
    if (startStation.platformIndex > 0) {
        // Делаем начальную станцию ту, которая примыкает к узлу
        MWEdge *edge = [route.path objectAtIndex:1];
        if (edge.startVertex == vertex) {
            metroMap.startStation = [edge.elements firstObject];
        } else {
            metroMap.startStation = [edge.elements lastObject];
        }
    }
    
    vertex = [route.path lastObject];
    if (finishStation.platformIndex > 0) {
        // Делаем конечной станцией ту, которая примыкает к узлу
        MWEdge *edge = [self latestEdge:route.path];
        if (edge.finishVertex == vertex) {
            metroMap.finishStation = [edge.elements lastObject];
        } else {
            metroMap.finishStation = [edge.elements firstObject];
        }
    }
    
    int result = 0;
    
    if ((metroMap.startStation != startStation) && (metroMap.finishStation != finishStation)) {
        result = 3;
    } else if (metroMap.startStation != startStation) {
        result = 1;
    } else if (metroMap.finishStation != finishStation) {
        result = 2;
    }
    
    return result;
}

// Поиск кратчайших маршрутов
- (void)searchRoutes
{
    // Инициализация
    foundRoutes = nil;
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    if ((!metroMap.startStation || !metroMap.finishStation) || [metroMap.startStation isEqual:metroMap.finishStation]) return;
    
    int i = 0;
    
    [self initRoutes];

    // Очищаем все переходы
    for (MWVertex *vertex in metroMap.vertices) {
        [vertex.transfers removeAllObjects];
    }

    BOOL nextIteration;
    
    do {
        nextIteration = NO;
        MWRoute *route = [self searchNextShortestRoute:[foundRoutes lastObject]];
        i++;
        if (route.path.count > 0) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:foundRoutes];
            [array addObject:route];
            foundRoutes = [NSArray arrayWithArray:array];
            nextIteration = route.transfers > 0;
        }
        // Ограничиваем число найденных маршрутов
    } while (nextIteration && (i < 4));

//    [self printAllRoutes];
    
    [self initRoutes];
//    [self printAllRoutes];

    [self sort];
//    [self printAllRoutes];

    [self postFilter];
    
//    [self printAllRoutes];
}

// Возвращаем истину, если количество пересадок, время поездки и длина маршрута совпадают
- (BOOL)isIdenticalRoute:(MWRoute *)firstRoute secondRoute:(MWRoute *)secondRoute
{
    if (!(firstRoute.path.count == secondRoute.path.count)) return false;
    if (!(firstRoute.tripTime == secondRoute.tripTime)) return false;
    if (!(firstRoute.transfers == secondRoute.transfers)) return false;
    if (!(firstRoute.length == secondRoute.length)) return false;
    
    return true;
}

- (void)postFilter
{
    if (foundRoutes.count < 1) return;

    MWRoute *firstRoute, *lastRoute;
    
    if ([[MWSettings settings].currentMetroMapIdentifier isEqualToString:@"amsterdam_metro"]) {
        while (foundRoutes.count > 1) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:foundRoutes];
            [array removeObject:[array lastObject]];
            foundRoutes = [NSArray arrayWithArray:array];
        }
    } else if ([[MWSettings settings].currentMetroMapIdentifier isEqualToString:@"moscow_metro"]) {
        if (([MWSettings settings].sortingType == 0) && (foundRoutes.count > 1)) { // По времени поездки
            firstRoute = (MWRoute *)[foundRoutes firstObject];
            lastRoute = (MWRoute *)[foundRoutes lastObject];
            while ((foundRoutes.count > 1) && (lastRoute.tripTime > firstRoute.tripTime * 1.5)) {
                NSMutableArray *array = [NSMutableArray arrayWithArray:foundRoutes];
                [array removeObject:[array lastObject]];
                foundRoutes = [NSArray arrayWithArray:array];
                firstRoute = (MWRoute *)[foundRoutes firstObject];
                lastRoute = (MWRoute *)[foundRoutes lastObject];
            }
        }
    } else if ([[MWSettings settings].currentMetroMapIdentifier isEqualToString:@"boston_subway"]) {
        // Удаляем все маршруты, у которых совпадают количество пересадок, время поездки и длина
        NSMutableArray *tempArray = [NSMutableArray array];
        
        BOOL found = false;
        for (MWRoute *route in foundRoutes) {
            for (MWRoute *tempRoute in tempArray) {
                if ([self isIdenticalRoute:route secondRoute:tempRoute]) {
                    found = true;
                }
            }
            if (!found) {
                [tempArray addObject:route];
            }
            found = false;
        }

        foundRoutes = nil;
        foundRoutes = [NSArray arrayWithArray:tempArray];
    } else if ([[MWSettings settings].currentMetroMapIdentifier isEqualToString:@"prague_metro"]) { // Максимальное число пересадок - одна
        NSArray *tempArray = [NSArray arrayWithArray:foundRoutes];
        foundRoutes = nil;
        
        for (MWRoute *route in tempArray) {
            if (route.transfers < 2) {
                NSMutableArray *array = [NSMutableArray arrayWithArray:foundRoutes];
                [array addObject:route];
                foundRoutes = [NSArray arrayWithArray:array];
            }
        }
    } else if ([[MWSettings settings].currentMetroMapIdentifier isEqualToString:@"los_angeles_metro"]) { // Удаляем маршруты, у которых вершины совпадают
        while ((foundRoutes.count > 1) && [self areVertexesEqual:[foundRoutes objectAtIndex:foundRoutes.count - 2] path2:[foundRoutes lastObject]]) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:foundRoutes];
            [array removeObject:[array lastObject]];
            foundRoutes = [NSArray arrayWithArray:array];
        }
    } else if ([[MWSettings settings].currentMetroMapIdentifier isEqualToString:@"recife_metro"]) { // Максимальное число пересадок - одна
        NSArray *tempArray = [NSArray arrayWithArray:foundRoutes];
        foundRoutes = nil;
        
        for (MWRoute *route in tempArray) {
            if (route.transfers < 2) {
                NSMutableArray *array = [NSMutableArray arrayWithArray:foundRoutes];
                [array addObject:route];
                foundRoutes = [NSArray arrayWithArray:array];
            }
        }
    }

    // В случае сортировки по количеству пересадок фильтруем все маршруты, где количество пересадок больше, чем на одну превышает первый маршрут
    if ([MWSettings settings].sortingType == MWSortingTypeByTransfers) { // Сортировка по количеству пересадок
        firstRoute = (MWRoute *)[foundRoutes firstObject];
        lastRoute = (MWRoute *)[foundRoutes lastObject];
        int firstRouteTransfers = firstRoute.transfers;
        while (foundRoutes.count > 0 && lastRoute.transfers > firstRouteTransfers + 1) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:foundRoutes];
            [array removeObject:[array lastObject]];
            foundRoutes = [NSArray arrayWithArray:array];
            lastRoute = (MWRoute *)[foundRoutes lastObject];
        }
    }
    
    // Отфильтровываем результаты, если он отличается от предыдущего больше, чем в 1.4 раза
    if (foundRoutes.count > 1) {
        lastRoute = (MWRoute *)[foundRoutes lastObject];
        firstRoute = (MWRoute *)[foundRoutes objectAtIndex:foundRoutes.count - 2];
        while (foundRoutes.count > 1 && lastRoute.tripTime > firstRoute.tripTime * 1.4) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:foundRoutes];
            [array removeObject:[array lastObject]];
            foundRoutes = [NSArray arrayWithArray:array];
            lastRoute = (MWRoute *)[foundRoutes lastObject];
            firstRoute = (MWRoute *)[foundRoutes objectAtIndex:foundRoutes.count - 2];
        }
    }
}

// Проверка найденных маршрутов на необходимость дальнейшего поиска
- (BOOL)doSearch
{
    BOOL result = YES;
    
    MWRoute *lastRoute = [foundRoutes lastObject];

    int transfers = [self routeTransfers:lastRoute];
  
    // Если маршрут без пересадок, заканчиваем поиск
    if (transfers == 0) {
        return NO;
    }
    
    return result;
}

// Сортируем результаты
- (void)sort
{
    NSArray *sortedArray = [foundRoutes sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2) {
        float parameter1, parameter2;
        MWRoute *route1 = (MWRoute *)obj1;
        MWRoute *route2 = (MWRoute *)obj2;
        switch ([MWSettings settings].sortingType) {
            case MWSortingTypeByTransfers:
                parameter1 = route1.transfers;
                parameter2 = route2.transfers;
                if (parameter1 == parameter2) {
                    parameter1 = route1.tripTime;
                    parameter2 = route2.tripTime;
                }
                break;
            case MWSortingTypeByTripTime:
                parameter1 = route1.tripTime;
                parameter2 = route2.tripTime;
                if (parameter1 == parameter2) {
                    parameter1 = route1.transfers;
                    parameter2 = route2.transfers;
                }
                break;
            case MWSortingTypeByLength:
                parameter1 = route1.length;
                parameter2 = route2.length;
            default:
                break;
        }
        if (parameter1 > parameter2) {
            return (NSComparisonResult)NSOrderedDescending;
        } else if (parameter1 < parameter2) {
            return (NSComparisonResult)NSOrderedAscending;
        } else return (NSComparisonResult)NSOrderedSame;
    }];
    
    foundRoutes = [NSArray arrayWithArray:sortedArray];
}

/*
// Получение длины маршрута
- (int)routeLength:(NSArray *)path
{
    int length = 0;
    MWEdge *edge = [[MWEdge alloc] init];

    // Организуем цикл по всем ребрам маршрута
    for (NSObject *element in path) {
        if ([element isKindOfClass:edge.class]) {
            length += ((MWEdge *)element).length;
        }
    }
    
    return length;
}*/

// Ищем следующий самый короткий маршрут после предыдущего. После нахождения делаем неактивным ребро, при убирании которого получается самый короткий маршрут
- (MWRoute *)searchNextShortestRoute:(MWRoute *)previousShortestRoute
{
    // Если запускаем процедуру первый раз, то просто ищем кратчайший маршрут
    if (!previousShortestRoute) return [self searchRoute];

    // Все новые найденные маршруты будем добавлять в массив allNewRoutes
    NSMutableArray *allNewRoutes = [[NSMutableArray alloc] init];

    MWEdge *currentEdge;
    MWEdge *edge = [[MWEdge alloc] init];
    // Массив для хранения ребер, для которых были найдены маршруты. Сохраняем на них ссылки для того, чтобы потом найти ребро, при отсутствии которого был найден кратчайший маршрут.
    NSMutableArray *edges = [NSMutableArray array];
    
    // Организуем цикл по всем ребрам маршрута previousShortestRoute
    for (NSObject *element in previousShortestRoute.path) {
        // Получаем очередное ребро
        if ([element isKindOfClass:edge.class]) {
            currentEdge = (MWEdge *)element;
        
            if (currentEdge.enable) {
                // Делаем ребро неактивным
                currentEdge.enable = FALSE;
                // Просчитываем новый маршрут
                NSMutableArray *path = [NSMutableArray array];
                [path addObjectsFromArray:[self searchRoute].path];
                // Если маршрут создан, включаем его в список
                if (path.count > 0) {
                    MWRoute *route = [[MWRoute alloc] init];
                    route.path = [NSArray arrayWithArray:path];
                    [allNewRoutes addObject:route];
                    [edges addObject:currentEdge];
                }
                // Делаем ребро активным
                currentEdge.enable = TRUE;
            }
        }
    }

    // Ищем самый короткий маршрут
    int minValue = 1000000000;
    int edgeIndex = -1;
    int value = 0;
    MWRoute *route;
    
    for (int i = 0; i < allNewRoutes.count; i++) {
        route = (MWRoute *)[allNewRoutes objectAtIndex:i];
        switch ([MWSettings settings].sortingType) {
            case MWSortingTypeByLength: // Сортировка по длине маршрута
                value = route.length;
            break;
            case MWSortingTypeByTripTime: // Сортировка по времени поездки
                value = route.tripTime;
            break;
            case MWSortingTypeByTransfers: // Сортировка по количеству пересадок
                value = route.transfers;
            break;
        default:
            break;
        }
        if (value < minValue) {
            minValue = value;
            edgeIndex = i;
        }
    }

    // Маршрут не найден
    if (minValue == HUGE) return nil;

    // Если сортировка по количеству пересадок, выбираем все маршруты с минимальным количеством пересадок и среди них ищем самый быстрый
    int minTransfers = minValue;
    int transfers;
    minValue = HUGE;
    if ([MWSettings settings].sortingType == MWSortingTypeByTransfers) {
        for (int i = 0; i < allNewRoutes.count; i++) {
            route = (MWRoute *)[allNewRoutes objectAtIndex:i];
            transfers = [self routeTransfers:[allNewRoutes objectAtIndex:i]];
            if (transfers == minTransfers) {
                value = route.tripTime;
                if (value < minValue) {
                    minValue = value;
                    edgeIndex = i;
                }
            }
        }
    }
    
    route = [allNewRoutes objectAtIndex:edgeIndex];
    
    // Делаем неактивным ребро, при котором новый маршрут оказывается самым коротким
    edge = (MWEdge *)[edges objectAtIndex:edgeIndex];
    edge.enable = FALSE;
    return route;
}

// Главная процедура поиска маршрута
- (MWRoute *)searchRoute
{
    // Инициализация
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    for (MWVertex *vertex in metroMap.vertices) {
        // Устанавливаем, что все вершины непосещенные
        vertex.visited = FALSE;
        // Задаем дистанции, равные мнимой бесконечности
        vertex.weight = HUGE;
        // Удаляем все пути
        [vertex.path removeAllObjects];
    }
    
    MWVertex *startVertex = [self vertexByStation:metroMap.startStation];
    // Задаем вес, равный нулю
    startVertex.weight = 0;
    // Устанавливаем первоначальный путь
    [startVertex.path addObject:startVertex];
    
    // Главный цикл поиска маршрута (релаксация)
    
    MWVertex *currentVertex = nil;
    MWLine *startLine = [MWRouter lineByStation:metroMap.startStation];
    MWLine *finishLine = [MWRouter lineByStation:metroMap.finishStation];
    
    // Проходим циклом все вершины
    for (int i = 0; i < metroMap.vertices.count; i++) {
        float minWeight = HUGE;
        if (!currentVertex) currentVertex = startVertex;
        
        // находим вершину с минимальным весом
        for (MWVertex *vertex in metroMap.vertices) {
            // Если вершина не посещенная и дистанция у нее минимальная, делаем ее текущей
            if (!vertex.visited && vertex.weight < minWeight) {
                currentVertex = vertex;
                minWeight = vertex.weight;
            }
        }
        
        if (!currentVertex) continue;
        
        // Перерасчет дистанций
        NSMutableArray *edgesNearbyNewVertex = [self getNearbyEdges:currentVertex];
        for (MWEdge *edge in edgesNearbyNewVertex) {
            // Очищаем все переходы
            for (MWVertex *vertex in metroMap.vertices) {
                [vertex.transfers removeAllObjects];
            }

            // Получаем вес нового узла
            int weight;
            if ([MWSettings settings].sortingType == MWSortingTypeByLength) { // Сортировка по длине
                weight = edge.length;
            } else if ([MWSettings settings].sortingType == MWSortingTypeByTransfers) { // Сортировка по количеству пересадок
                if ((edge.line == startLine) || (edge.line == finishLine)) {
                    weight = 0;
                } else {
                    MWEdge *previousEdge = [self latestEdge:currentVertex.path];
                    float tripTime = edge.length / ((edge.line.middleSpeed > 0 ? edge.line.middleSpeed : metroMap.middleSpeed) * 1000 / 60);
                    
                    // Инициализируем количество и время переходов на узле
                    [self transfersOnVertex:currentVertex fromEdge:previousEdge toEdge:edge];
                    weight = tripTime + [self vertexTransferTime:currentVertex];
                }
            } else { // Сортировка по времени поездки
                MWEdge *previousEdge = [self latestEdge:currentVertex.path];
                float tripTime = edge.length / ((edge.line.middleSpeed > 0 ? edge.line.middleSpeed : metroMap.middleSpeed) * 1000 / 60);
                // Инициализируем количество и время переходов на узле
                [self transfersOnVertex:currentVertex fromEdge:previousEdge toEdge:edge];
                weight = tripTime + [self vertexTransferTime:currentVertex];
            }
            float newWeight = currentVertex.weight + weight;
            // Если новая дистанция меньше старой, записываем ее вместо старой
            MWVertex *vertex = [self getOtherVertex:edge firstVertex:currentVertex];
            if (vertex && newWeight < vertex.weight) {
                vertex.weight = newWeight;
                // Обновляем лучший путь до вершины. Стираем предыдущий
                [vertex.path removeAllObjects];
                // Добавляем путь из предыдущей вершины
                [vertex.path addObjectsFromArray:currentVertex.path];
                // Добавляем себя в конец пути
                [vertex.path addObject:edge];
                [vertex.path addObject:vertex];
              }
        }

        // Пометим вершину как посещенную
        currentVertex.visited = TRUE;
    }
    
    MWVertex *finishVertex = [self vertexByStation:metroMap.finishStation];
    
//    [self printRoute:finishVertex.route];
    
    MWRoute *route = [[MWRoute alloc] init];
    route.path = [NSArray arrayWithArray:finishVertex.path];
    
    return route;
}

// Проверяем маршрут на возможность прохождения
- (BOOL)checkRoute:(NSMutableArray *)path
{
    @try {
        for (int i = 1; i < path.count; i += 2) {
            MWEdge *edge = (MWEdge *)[path objectAtIndex:i];
            if ([edge.directionFromStation isEqual:[edge.elements firstObject]]) {
                return false;
            }
        }
    }
    @catch (NSException *exception) {
        //
    }
    @finally {
        //
    }
    
    return true;
}

// Получение из маршрута последнего участка
- (MWEdge *)latestEdge:(NSArray *)path
{
    MWEdge *result = nil;
    if (path.count < 2) return result;
    NSObject *element;
    
    for (int i = (int)path.count - 2; i >= 0; i--) {
        element = [path objectAtIndex:i];
        if ([element isKindOfClass:[MWEdge class]]) {
            return (MWEdge *)element;
        }
    }
    
    return result;
}

// Получение ребра между двумя вершинами
- (MWEdge *)edgeBetweenTwoVertices:(MWVertex *)vertex1 secondVertex:(MWVertex *)vertex2
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    for (MWEdge *edge in metroMap.edges) {
        if (([edge.startVertex isEqual:vertex1] && [edge.finishVertex isEqual:vertex2]) ||
            ([edge.startVertex isEqual:vertex2] && [edge.finishVertex isEqual:vertex1])) {
            return edge;
        }
    }
    return nil;
}

// Получение количества пересадок на маршруте
- (int)routeTransfers:(MWRoute *)route
{
    int switches = 0;
    
    // Если маршрут пустой, выходим
    if (!(route.path.count > 0)) return switches;

    MWEdge *edge;
    MWVertex *vertex;
    MWStation *station;
    BOOL onePlatform;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];

    if (!metroMap.startStation || !metroMap.finishStation) {
        return 0;
    }
    
    // Очищаем все переходы
    for (NSObject *object in route.path) {
        if ([object isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)object;
            [vertex.transfers removeAllObjects];
        }
    }
    
    // Определяем, является ли начальная вершина пересадочным узлом. Для этого проверяем, принадлежит ли начальная станция маршрута первому ребру. Если принадлежит, то пересадки нет.
    
    // Получаем первое ребро маршрута
    if ((route.path.count > 1) && ([[route.path objectAtIndex:1] isKindOfClass:[MWEdge class]])) {
        vertex = [route.path firstObject];
        edge = [route.path objectAtIndex:1];
        
        if ([edge.startVertex isEqual:vertex]) {
            station = [edge.elements firstObject];
        } else {
            station = [edge.elements lastObject];
        }
    }
    
    onePlatform = (station.platformIndex + metroMap.startStation.platformIndex > 0) && (station.platformIndex == metroMap.startStation.platformIndex);

    // Проверяем, принадлежит ли ему начальная станция маршрута
    if (edge && ![edge containsStation:metroMap.startStation] && !onePlatform) {
        switches++;
        // Добавляем в первую вершину маршрут пересадки "Станция - Станция"
        [vertex.transfers addObject:metroMap.startStation];
        [vertex.transfers addObject:station];
//        [self initVertexTransferTime:vertex];
    }

    // Если маршрут состоит из одной вершины...
    if (route.path.count == 1) {
        vertex = (MWVertex *)[route.path firstObject];
        if ([self isPossibleTransferBetweenTwoStations:metroMap.startStation finishStation:metroMap.finishStation]) {
            [vertex.transfers addObject:metroMap.startStation];
            [vertex.transfers addObject:metroMap.finishStation];
//            [self initVertexTransferTime:vertex];
            return 1;
        } else {
            vertex.transfers = [self routeOnVertex:metroMap.startStation finishStation:metroMap.finishStation onVertex:vertex];
            int switches = (int)[vertex.transfers count] / 2;
            if (switches < 0)
                switches = 0;
            return switches;
        }
    }
    
    // Определяем, является ли конечная вершина пересадочным узлом. Для этого проверяем, принадлежит ли конечная станция маршрута последнему ребру. Если принадлежит, то пересадки нет.
    
    // Получаем последнее ребро маршрута
    if ((route.path.count > 1) && ([[route.path objectAtIndex:(route.path.count - 2)] isKindOfClass:[MWEdge class]])) {
        edge = [route.path objectAtIndex:(route.path.count - 2)];
        vertex = [route.path lastObject];
        if ([edge.finishVertex isEqual:vertex]) {
            station = [edge.elements lastObject];
        } else {
            station = [edge.elements firstObject];
        }
    }

    onePlatform = (station.platformIndex + metroMap.finishStation.platformIndex > 0) && (station.platformIndex == metroMap.finishStation.platformIndex);
    
    // Проверяем, принадлежит ли ему конечная станция маршрута
    if (edge && ![edge containsStation:metroMap.finishStation] && !onePlatform) {
        switches++;
        // Добавляем в конечную вершину маршрут пересадки "Станция - Станция"
        [vertex.transfers addObject:metroMap.finishStation];
        [vertex.transfers addObject:station];
//        [self initVertexTransferTime:vertex];
    }

    // Определяем сколько раз в маршруте менялась линия. Это и есть количество пересадок
    MWLine *previouslyLine = nil;
    MWEdge *previouslyEdge = nil;
    
    for (NSObject *element in route.path) {
        if ([element isKindOfClass:[MWEdge class]]) {
            edge = (MWEdge *)element;
            if (!previouslyLine) {
                previouslyLine = edge.line;
            } else if (![previouslyLine isEqual:edge.line]) {
                // switches++;
                int i = [self transfersOnVertex:vertex fromEdge:previouslyEdge toEdge:edge];
                // Если произошла пересадка на другую линию, но количество возможных пересадок со станции на станцию на вершине равно нулю, то такой маршрут невозможен. Возвращаем -1.
                if (!i) {
                    return -1;
                }
                switches += i;
                previouslyLine = edge.line;
            }
            previouslyEdge = edge;
        } else if ([element isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)element;
        }
    }

    return switches;
}

// Получение второго узла ребра
- (MWVertex *)getOtherVertex:(MWEdge *)edge firstVertex:(MWVertex *)vertex
{
    MWVertex *secondVertex;
    if (edge.startVertex == vertex) {
        secondVertex = edge.finishVertex;
    } else if (edge.finishVertex == vertex) {
        secondVertex = edge.startVertex;
    }

    /*
    // Провеяем возможность поездки из ребра firstVertex в ребро secondVertex
    if (edge.elements.count > 0 && [edge.directionFromStation isEqual:[edge.elements firstObject]]) {
        secondVertex = nil;
    } */
    
    return secondVertex;
}

// Журналирование маршрута. Только для теста
- (void)printRoute:(MWRoute *)route
{
    if (!route) {
        NSLog(@" ");
        NSLog(@"Маршрут пустой");
        return;
    }
    
    MWVertex *vertex = [[MWVertex alloc] init];
    MWEdge *edge = [[MWEdge alloc] init];
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    float tripTime = 0;
    
    NSLog(@" ");
    NSLog(@"Количество пересадок: %d", route.transfers);
    NSLog(@"Длина маршрута: %f метров",route.length);
    NSLog(@"Время поездки: %f минут", route.tripTime);
    for (int i = 0; i < route.path.count ; i++) {
        NSObject *item = [route.path objectAtIndex:i];
        if ([item isKindOfClass:[vertex class]]) {
            vertex = (MWVertex *)item;
            NSLog(@"%d: %@", i+1, vertex.developmentName);
            if (vertex.transfers.count > 0) {
                NSLog(@"   Пересадок: %d", (int)vertex.transfers.count / 2);
                NSLog(@"   Время перехода: %f", [self vertexTransferTime:vertex]);
                tripTime += [self vertexTransferTime:vertex];
//                NSLog(@"   Вес: %f", vertex.weight);
            }
        } else if ([item isKindOfClass:[edge class]]) {
            edge = (MWEdge *)item;
            NSLog(@"%d: %@", i+1, [edge developmentName]);
            NSLog(@"Время поездки: %f", edge.length / ((edge.line.middleSpeed > 0 ? edge.line.middleSpeed : metroMap.middleSpeed) * 1000 / 60));
            tripTime += edge.length / ((edge.line.middleSpeed > 0 ? edge.line.middleSpeed : metroMap.middleSpeed) * 1000 / 60);
        }
    }
    NSLog(@"Calculated tripTime: %f", tripTime);
}

- (void)printAllRoutes
{
    NSLog(@" ");
    NSLog(@"Всего маршрутов: %d", (int)foundRoutes.count);
    for (NSArray *route in foundRoutes) {
        [self printRoute:route];
    }
    NSLog(@" ");
}

// Получаем массив доступных ребер, выходящих из вершины
- (NSMutableArray *)getNearbyEdges:(MWVertex *)vertex
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    if (!vertex) {
        return result;
    }

    // Проходим циклом по всем ребрам
    for (MWEdge *edge in metroMap.edges) {
        if (edge.enable) {
            // Проверяем, является ли вершина стартовой для ребра
            if ([edge.startVertex isEqual:vertex]) {
                // Проверяем можно ли из вершины достигнуть конечной для ребра вершины (directionFromStation не совпадает с последней станцией)
                MWStation *endStation = [edge.elements lastObject];
                if (![edge.directionFromStation isEqual:endStation])
                        [result addObject:edge];
                // Проверяем, является ли вершина конечной для ребра
            } else if ([edge.finishVertex isEqual:vertex]) {
                // Проверяем можно ли из вершины достигнуть начальной для ребра вершины (directionFromStation не совпадает с первой станцией)
                if (![edge.directionFromStation isEqual:[edge.elements objectAtIndex:0]])
                        [result addObject:edge];
            }
        }
    }
    return result;
}

// Получение вершины по станции. Если станция не является вершиной, то возвращаем nil;
- (MWVertex *)vertexByStation:(MWStation *)station
{
    MWVertex *result = nil;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    for (MWEdge *edge in metroMap.edges) {
        if ([edge containsStation:station]) {
            result = [edge vertexByStation:station];
        }
    }
    return result;
}

// Создаем новую вершину на основе переданной станции
// Добавляем два новых ребра к новой вершине. Старое ребро делаем неактивным
- (void)createVertex:(MWStation *)station
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    // Ищем любое ребро, где расположена станция. Если это пересадочная станция, ребер может быть несколько
    MWEdge *foundEdge = nil;
    for (MWEdge *edge in metroMap.edges) {
        if ([edge containsStation:station])
            foundEdge = edge;
    }
    
    // Если станция обнаружена в начале или конце ребра, ничего не делаем, она сама является вершиной
    if ([[foundEdge.elements firstObject] isEqual:station]) return;
    if ([[foundEdge.elements lastObject] isEqual:station])  return;
    
    // Получаем индекс станции
    int index = [foundEdge stationIndex:station];
    
    // Создаем новую вершину
    MWVertex *newVertex = [[MWVertex alloc] init];
    newVertex.developmentName = [NSString stringWithFormat:@"Виртуальная вершина: %@", station.nameOriginal];
    [metroMap.vertices addObject:newVertex];
    
    // Создаем первое ребро
    MWEdge *edge1 = [[MWEdge alloc] init];
    edge1.developmentName = @"Ребро 1 (виртуальное)";
    edge1.line = foundEdge.line;
    edge1.sinthetic = TRUE;
    [metroMap.edges addObject:edge1];
    
    // Добавляем вершины
    edge1.startVertex = [foundEdge startVertex];
    edge1.finishVertex = newVertex;
    
    NSObject *element;
    // Включаем в ребро элементы от начала до станции
    for (int i = 0; i <= index; i++) {
        element = [[foundEdge elements] objectAtIndex:i];
        if (element)
            [[edge1 elements] addObject:element];
    }
    
    // Создаем второе ребро
    MWEdge *edge2 = [[MWEdge alloc] init];
    edge2.developmentName = @"Ребро 2 (виртуальное)";
    edge2.line = foundEdge.line;
    edge2.sinthetic = TRUE;
    [metroMap.edges addObject:edge2];
    
    // Добавляем вершины
    edge2.startVertex = newVertex;
    edge2.finishVertex = [foundEdge finishVertex];
    
    // Включаем в ребро элементы от начала до станции
    for (int i = index; i < [[foundEdge elements] count]; i++) {
        [[edge2 elements] addObject:[[foundEdge elements] objectAtIndex:i]];
    }
    
    // Делаем ребро неактивным
    foundEdge.enable = FALSE;

    // Устанавливаем направления движения дня новых виртуальных ребер
if ([foundEdge.directionFromStation isEqual:[foundEdge.elements firstObject]]) {
        edge1.directionFromStation = [edge1.elements firstObject];
        edge2.directionFromStation = [edge2.elements firstObject];
    } else if ([foundEdge.directionFromStation isEqual:[foundEdge.elements lastObject]]) {
        edge1.directionFromStation = [edge1.elements lastObject];
        edge2.directionFromStation = [edge2.elements lastObject];
    }
}

- (float)vertexTransferTime:(MWVertex *)vertex
{
    float result = 0;
    MWStation *station1, *station2;
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    if (vertex.transfers.count > 0) {
        for (int i = 0; i < vertex.transfers.count - 1; i = i + 2) {
            station1 = (MWStation *)[vertex.transfers objectAtIndex:i];
            station2 = (MWStation *)[vertex.transfers objectAtIndex:i + 1];
            result += [metroMap transferTime:station1.identifier toStation:station2.identifier];
        }
    }
    
    return result;
}

// Получаем список всех станций узла
- (NSMutableArray *)stationsForVertex:(MWVertex *)vertex
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    NSMutableArray *stations = [NSMutableArray array];
    
    for (MWEdge *edge in metroMap.edges) {
        if ([edge.startVertex isEqual:vertex] && edge.elements.count) {
            [stations addObject:[edge.elements objectAtIndex:0]];
        } else if ([edge.finishVertex isEqual:vertex] && edge.elements.count) {
            [stations addObject:[edge.elements lastObject]];
        }
    }
    
    // Избавляемся от дубликатов
    NSArray *copy = [stations copy];
    NSInteger index = [copy count] - 1;
    for (id object in [copy reverseObjectEnumerator]) {
        if (([stations indexOfObject:object inRange:NSMakeRange(0, index)] != NSNotFound)) {
            [stations removeObjectAtIndex:index];
        }
        index--;
    }
    
    return stations;
}

// Проверяем, можно ли с одной станции напрямую перейти на другую
- (BOOL)isPossibleTransferBetweenTwoStations:(MWStation *)startStation finishStation:(MWStation *)finishStation
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    if (metroMap.stationsWithoutTransfer.count == 0) {
        return TRUE;
    }
    
    // Предполагаем, но не проверяем, что две станции принадлежат одному узлу
    for (int i = 0; i < metroMap.stationsWithoutTransfer.count - 1; i=i + 2) {
        if ([[metroMap.stationsWithoutTransfer objectAtIndex:i] isEqual:startStation]) {
            if (([[metroMap.stationsWithoutTransfer objectAtIndex:i+1] isEqual:finishStation])) {
                return FALSE;
            }
        }
    }
    return TRUE;
}

/* // Получаем количество пересадок между двумя станциями на одном узле
- (int)switchesBetweenTwoStations:(MWStation *)fromStation toStation:(MWStation *)toStation
{
    if ([self isPossibleTransferBetweenTwoStations:fromStation finishStation:toStation]) {
        return 1;
    } else {
        NSMutableArray *route = [self routeOnSwitch:fromStation finishStation:toStation];
        int switches = ((int)[route count] + 2) / 2;
        if (switches < 0)
            switches = 0;
        return switches;
    }
} */

// Получаем количество пересадок на узле
- (int)transfersOnVertex:(MWVertex *)vertex fromEdge:(MWEdge *)fromEdge toEdge:(MWEdge *)toEdge
{
    // Если маршрут проходит по одной линии, то пересадок нет
    if (fromEdge.line == toEdge.line) {
        return 0;
    }
    
    // Предполагаем, но не проверяем, что ребра смежные!
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    // Получаем станции пересадки
    MWStation *fromStation;
    MWStation *toStation;

    // В этой функции мы пишем маршруты пересадок в виде пары Станция - Станция
    if ([fromEdge.finishVertex isEqual:vertex]) {
        fromStation = [fromEdge.elements lastObject];
    } else fromStation = [fromEdge.elements objectAtIndex:0];

    if ([toEdge.startVertex isEqual:vertex]) {
        toStation = [toEdge.elements objectAtIndex:0];
    } else toStation = [toEdge.elements lastObject];
    
    if (!fromStation)
        fromStation = metroMap.startStation;
    
    if (!toStation)
        toStation = metroMap.finishStation;
    
    if (fromStation == toStation) {
        return 0;
    }
    
    if ([self isPossibleTransferBetweenTwoStations:fromStation finishStation:toStation]) {
        [vertex.transfers addObject:fromStation];
        [vertex.transfers addObject:toStation];
        [self vertexTransferTime:vertex];
        return 1;
    } else {
        [vertex.transfers addObjectsFromArray:[self routeOnVertex:fromStation finishStation:toStation onVertex:vertex]];
        int i = ((int)vertex.transfers.count + 2) / 2;
        
        // Если в маршруте больше одной станции, то количество переходов равно количество станций в маршруте минус один
        if (i > 1) {
            i--;
        }
        [self vertexTransferTime:vertex];
        return i;
    }
}

// Получаем маршрут пересадки (список станций)
- (NSMutableArray *)routeOnVertex:(MWStation *)startStation finishStation:(MWStation *)finishStation onVertex:(MWVertex *)vertex
{
    NSMutableArray *route = [NSMutableArray array];
    
    // Проверка валидности станций
    if (!startStation || !finishStation) {
        return route;
    }
    
    // Если станции одна, то возвращаем только ее в маршруте
    if ([startStation isEqual:finishStation]) {
        [route addObject:startStation];
        return route;
    }
    
    // Получаем узел стартовой станции
    MWVertex *startVertex = [self vertexByStation:startStation];
    
    // Получаем узел конечной станции
    MWVertex *finishVertex = [self vertexByStation:finishStation];
    
    // Если узлы разные, то это ошибка
    if (![startVertex isEqual:finishVertex]) {
        return route;
    }
    
    // Получаем список всех станций пересадочного узла
    NSMutableArray *stations = [[NSMutableArray alloc] initWithArray:[self stationsForVertex:startVertex]];
    
    // Инициализируем станции
    for (MWStation *station in stations) {
        [station.route removeAllObjects];
        station.routeVisited = FALSE;
        station.routeDistance = 100000000;
    }
    
    startStation.routeDistance = 1;
    [startStation.route addObject:startStation];
    MWStation *loopStation;
    MWStation *currentStation;
    
    for (int i = 0; i < stations.count; i++) {
        // Ищем непосещенную вершину с самой маленькой дистанцией
        int minDistance = 100000000;
        for (int j = 0; j < stations.count; j++) {
            loopStation = [stations objectAtIndex:j];
            if (!loopStation.routeVisited && loopStation.routeDistance < minDistance) {
                currentStation = loopStation;
                minDistance = loopStation.routeDistance;
            }
        }
        
        // Обновляем дистанции и пути
        for (MWStation *loopStation in stations) {
            if (!loopStation.routeVisited && [self isPossibleTransferBetweenTwoStations:currentStation finishStation:loopStation]) {
                if (loopStation.routeDistance > currentStation.routeDistance + 1) {
                    loopStation.routeDistance = currentStation.routeDistance + 1;
                    [loopStation.route removeAllObjects];
                    // Создаем пары переходов. Например, "Александровский сад - Библиотека им. Ленина"
                    [loopStation.route addObjectsFromArray:currentStation.route];
                    if (loopStation.route.count > 1) {
                        [loopStation.route addObject:[loopStation.route lastObject]];
                    }
                    [loopStation.route addObject:loopStation];
                }
            }
        }
        
        // Делаем текущую станцию посещенной
        currentStation.routeVisited = TRUE;
    }

    return finishStation.route;
}

+ (MWLine *)lineByStation:(MWStation *)station
{
    @try {
        MWMetroMap *metroMap = [MWStorage currentMetroMap];
        if (!metroMap || !station) return nil;
        
        for (MWEdge *edge in metroMap.edges) {
            for (NSObject *element in edge.elements) {
                if ([element isEqual:station]) {
                    return edge.line;
                }
            }
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        //
    }

    return nil;
}

+ (MWEdge *)concatEdges:(MWEdge *)firstEdge secondEdge:(MWEdge *)secondEdge
{
    MWEdge *result = [[MWEdge alloc] init];

    result.line = firstEdge.line;
    result.startVertex = firstEdge.startVertex;
    result.finishVertex = secondEdge.finishVertex;
    result.directionFromStation = firstEdge.directionFromStation;
    result.developmentName = [NSString stringWithFormat:@"%@ + %@", firstEdge.developmentName, secondEdge.developmentName];
    [result.elements addObjectsFromArray:firstEdge.elements];
    [result.elements addObjectsFromArray:secondEdge.elements];
    
    // Удаляем неуникальные значения
    NSArray *copy = [result.elements copy];
    NSInteger index = [copy count] - 1;
    for (id object in [copy reverseObjectEnumerator]) {
        if ([result.elements indexOfObject:object inRange:NSMakeRange(0, index)] != NSNotFound) {
            [result.elements removeObjectAtIndex:index];
        }
        index--;
    }
    return result;
}

// Соединяем участки с одинаковыми линиями
+ (MWRoute *)compactRoute:(MWRoute *)route
{
    NSMutableArray *path = [[NSMutableArray alloc] init];
    MWEdge *previousEdge = nil;
    MWEdge *edge;
    MWVertex *vertex, *tempVertex;
    NSObject *object;
    
    for (int i = 0; i < route.path.count; i++) {
        object = [route.path objectAtIndex:i];
        if ([object isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)object;
            [path addObject:vertex];
        }
        if ([object isKindOfClass:[MWEdge class]]) {
            edge = (MWEdge *)object;
            
            if ([edge.finishVertex isEqual:vertex]) {
                // Переворачиваем путь. Новый участок не создаем! <- проверить работоспособность построения маршрутов
                NSUInteger i = 0;
                NSUInteger j = edge.elements.count - 1;
                while (i < j) {
                    [edge.elements exchangeObjectAtIndex:i withObjectAtIndex:j];
                    i++;
                    j--;
                }
                tempVertex = edge.startVertex;
                edge.startVertex = edge.finishVertex;
                edge.finishVertex = tempVertex;
            }
            
            if ([edge.line isEqual:previousEdge.line]) {
                // Объединяем предыдущий и текущий участки, поскольку они принадлежат одной и той же линии
                // Удаляем предыдущую вершину
                [vertex.transfers removeAllObjects];
                [path removeLastObject];
                // Удаляем предыдущий участок
                [path removeLastObject];
                // Объединяем участки
                MWEdge *newEdge = [self concatEdges:previousEdge secondEdge:edge];
                [path addObject:newEdge];
            } else {
                [path addObject:edge];
            }
            
            previousEdge = [path lastObject];
        }
    }
    
    MWRoute *resultRoute = [[MWRoute alloc] init];
    resultRoute.path = [NSArray arrayWithArray:path];

    return resultRoute;
}

// Проверяем, проходят ли маршруты по одинаковым вершинам (порядок и количество учитываются)
- (BOOL) areVertexesEqual:(NSArray *)path1 path2:(NSArray *)path2
{
    if (!path1 || !path2) return false;
    if (path1.count != path2.count) return false;
    if (path1.count == 0) return false;
    
    for (int i = 0; i < path1.count; i++) {
        if (![[path1 objectAtIndex:i] isKindOfClass:[MWVertex class]] || ![[path2 objectAtIndex:i] isKindOfClass:[MWVertex class]]) continue;
        if (![[path1 objectAtIndex:i] isEqual:[path2 objectAtIndex:i]]) return false;
    }
    
    return true;
}

@end
