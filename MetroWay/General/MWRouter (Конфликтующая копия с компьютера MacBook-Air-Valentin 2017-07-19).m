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

@implementation MWRouter

@synthesize routes;

// Все найденные маршруты
NSMutableArray *foundRoutes;

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
        foundRoutes = [[NSMutableArray alloc] init];
        routes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    foundRoutes = nil;
}

// Возвращаем массив маршрутов
- (NSMutableArray *)routes
{
    [routes removeAllObjects];
    for (int i = 0; (i < foundRoutes.count) && (i < 3); i++) {
        [routes addObject:foundRoutes[i]];
    }
    return routes;
}

- (void)clearRoutes
{
    [routes removeAllObjects];    
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
    NSArray *path = [foundRoutes firstObject];
    if (path.count < 3) return 0;

    MWMetroMap *metroMap = [MWStorage currentMetroMap];
 
    MWStation *startStation = metroMap.startStation;
    MWStation *finishStation = metroMap.finishStation;

    MWVertex *vertex = [path firstObject];
    if (startStation.platformIndex > 0) {
        // Делаем начальную станцию ту, которая примыкает к узлу
        MWEdge *edge = [path objectAtIndex:1];
        if (edge.startVertex == vertex) {
            metroMap.startStation = [edge.elements firstObject];
        } else {
            metroMap.startStation = [edge.elements lastObject];
        }
    }
    
    vertex = [path lastObject];
    if (finishStation.platformIndex > 0) {
        // Делаем конечной станцией ту, которая примыкает к узлу
        MWEdge *edge = [self latestEdge:path];
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
    [foundRoutes removeAllObjects];
    
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
    if ((!metroMap.startStation || !metroMap.finishStation) || [metroMap.startStation isEqual:metroMap.finishStation]) return;
    
    int i = 0;
    
    [self initRoutes];
    
    BOOL nextIteration;
    
    do {
        nextIteration = NO;
        NSMutableArray *route = [[NSMutableArray alloc] init];
        [route addObjectsFromArray:[self searchNextShortestRoute:[foundRoutes lastObject]]];
        i++;
        if (route.count > 0) {
            [foundRoutes addObject:route];
            nextIteration = [self routeTransfers:route] > 0; //[self doSearch];
        }
        // Ограничиваем число найденных маршрутов
    } while (nextIteration && (i < 4));
    
    [self initRoutes];
    [self sort];
    [self postFilter];
}

- (void)postFilter
{
    if (foundRoutes.count < 1) return;
    
    if ([[MWSettings currentMetroMapIdentifier] isEqualToString:@"amsterdam_metro"]) {
        while (foundRoutes.count > 1) {
            [foundRoutes removeObject:[foundRoutes lastObject]];
        }
    } else if ([[MWSettings currentMetroMapIdentifier] isEqualToString:@"moscow_metro"]) {
        if (([MWSettings sortingType] == 0) && (foundRoutes.count > 1)) { // По времени поездки
            while ((foundRoutes.count > 1) && ([self routeTripTime:[foundRoutes lastObject]] > [self routeTripTime:[foundRoutes firstObject]] * 1.5)) {
                [foundRoutes removeObject:[foundRoutes lastObject]];
            }
        }
    }

    // В случае сортировки по количеству пересадок фильтруем все маршруты, где количество пересадок больше, чем на одну превышает первый маршрут
    if ([MWSettings sortingType] == 1) { // Сортировка по количеству пересадок
        int firstRouteTransfers = [self routeTransfers:[foundRoutes firstObject]];
        while ([self routeTransfers:[foundRoutes lastObject]] > firstRouteTransfers + 1) {
            [foundRoutes removeObject:[foundRoutes lastObject]];
        }
    }
    
    // Отфильтровываем результаты, если он отличается от предыдущего больше, чем в 1.4 раза
    if (foundRoutes.count > 1) {
        while (([self routeTripTime:[foundRoutes lastObject]] > [self routeTripTime:[foundRoutes objectAtIndex:foundRoutes.count - 2]] * 1.4) && foundRoutes.count > 1) {
            [foundRoutes removeObject:[foundRoutes lastObject]];
        }
    }
}

// Проверка найденных маршрутов на необходимость дальнейшего поиска
- (BOOL)doSearch
{
    BOOL result = YES;
    
    NSArray *lastRoute = [foundRoutes lastObject];

    int transfers = [self routeTransfers:lastRoute];
  
    // Если маршрут без пересадок, заканчиваем поиск
    if (transfers == 0) {
        return NO;
    }
    
//    if ([[MMSettings currentMetroMapIdentifier] isEqualToString:@"amsterdam_metro"]) {
//        return NO;
//    }
    
    return result;
}

// Сортируем результаты
- (void)sort
{
    NSArray *sortedArray = [foundRoutes sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2) {
        int parameter1 = 0;
        int parameter2 = 0;
        switch ([MWSettings sortingType]) {
            case 1:
                parameter1 = [self routeTransfers:obj1];
                parameter2 = [self routeTransfers:obj2];
                if (parameter1 == parameter2) {
                    parameter1 = [self routeTripTime:obj1];
                    parameter2 = [self routeTripTime:obj2];
                }
                break;
            case 0:
                parameter1 = [self routeTripTime:obj1];
                parameter2 = [self routeTripTime:obj2];
                if (parameter1 == parameter2) {
                    parameter1 = [self routeTransfers:obj1];
                    parameter2 = [self routeTransfers:obj2];
                }
                break;
            case 2:
                parameter1 = [self routeLength:obj1];
                parameter2 = [self routeLength:obj2];
            default:
                break;
        }
        if (parameter1 > parameter2) {
            return (NSComparisonResult)NSOrderedDescending;
        } else if (parameter1 < parameter2) {
            return (NSComparisonResult)NSOrderedAscending;
        } else return (NSComparisonResult)NSOrderedSame;
    }];
    
    [foundRoutes removeAllObjects];
    [foundRoutes addObjectsFromArray:sortedArray];
}

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
}

// Ищем следующий самый короткий маршрут после предыдущего. После нахождения делаем неактивным ребро, при убирании которого получается самый короткий маршрут
- (NSMutableArray *)searchNextShortestRoute:(NSMutableArray *)previousShortestRoute
{
    // Если запускаем процедуру первый раз, то просто ищем кратчайший маршрут
    if (previousShortestRoute.count == 0) return [self searchRoute];

    // Все новые найденные маршруты будем добавлять в массив allNewRoutes
    NSMutableArray *allNewRoutes = [[NSMutableArray alloc] init];

    MWEdge *currentEdge;
    MWEdge *edge = [[MWEdge alloc] init];
    // Массив для хранения ребер, для которых были найдены маршруты. Сохраняем на них ссылки для того, чтобы потом найти ребро, при отсутствии которого был найден кратчайший маршрут.
    NSMutableArray *edges = [NSMutableArray array];
    
    // Организуем цикл по всем ребрам маршрута previousShortestRoute
    for (NSObject *element in previousShortestRoute) {
        // Получаем очередное ребро
        if ([element isKindOfClass:edge.class]) {
            currentEdge = (MWEdge *)element;
        
            if (currentEdge.enable) {
                // Делаем ребро неактивным
                currentEdge.enable = FALSE;
                // Просчитываем новый маршрут
                NSMutableArray *route = [NSMutableArray array];
                [route addObjectsFromArray:[self searchRoute]];
                // Если маршрут создан, включаем его в список
                if (route.count > 0) {
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
    NSMutableArray *route = [NSMutableArray array];

    for (int i = 0; i < allNewRoutes.count; i++) {
        switch ([MWSettings sortingType]) {
            case 2: // Сортировка по длине маршрута
                value = [self routeLength:[allNewRoutes objectAtIndex:i]];
            break;
            case 0: // Сортировка по времени поездки
                value = [self routeTripTime:[allNewRoutes objectAtIndex:i]];
            break;
            case 1: // Сортировка по количеству пересадок
                value = [self routeTransfers:[allNewRoutes objectAtIndex:i]];
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
    if (minValue == 1000000000) return route;

    // Если сортировка по количеству пересадок, выбираем все маршруты с минимальным количеством пересадок и среди них ищем самый быстрый
    int minTransfers = minValue;
    int transfers;
    minValue = 1000000000;
    if ([MWSettings sortingType] == 1) {
        for (int i = 0; i < allNewRoutes.count; i++) {
            transfers = [self routeTransfers:[allNewRoutes objectAtIndex:i]];
            if (transfers == minTransfers) {
                value = [self routeTripTime:[allNewRoutes objectAtIndex:i]];
                if (value < minValue) {
                    minValue = value;
                    edgeIndex = i;
                }
            }
        }
    }
    
    [route addObjectsFromArray:[allNewRoutes objectAtIndex:edgeIndex]];
    
    // Делаем неактивным ребро, при котором новый маршрут оказывается самым коротким
    edge = (MWEdge *)[edges objectAtIndex:edgeIndex];
    edge.enable = FALSE;
    return route;
}

// Главная процедура поиска маршрута
- (NSMutableArray *)searchRoute
{
    // Инициализация
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    for (MWVertex *vertex in metroMap.vertices) {
        // Устанавливаем, что все вершины непосещенные
        vertex.visited = FALSE;
        // Задаем дистанции, равные мнимой бесконечности
        vertex.weight = HUGE;
        // Удаляем все пути
        [[vertex route] removeAllObjects];
    }
    
    MWVertex *startVertex = [self vertexByStation:metroMap.startStation];
    // Задаем вес, равный нулю
    startVertex.weight = 0;
    // Устанавливаем первоначальный путь
    [[startVertex route] addObject:startVertex];
    
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
            if (!vertex.visited && (vertex.weight < minWeight)) {
                currentVertex = vertex;
                minWeight = vertex.weight;
            }
        }
        
        if (!currentVertex) continue;
        
        // Перерасчет дистанций
        NSMutableArray *edgesNearbyNewVertex = [self getNearbyEdges:currentVertex];
        for (MWEdge *edge in edgesNearbyNewVertex) {
            // Получаем вес нового узла
            int weight;
            if ([MWSettings sortingType] == 2) { // Сортировка по длине
                weight = edge.length;
            } else if ([MWSettings sortingType] == 1) { // Сортировка по количеству пересадок
                if ((edge.line == startLine) || (edge.line == finishLine)) {
                    weight = 0;
                } else {
                    MWEdge *previousEdge = [self latestEdge:currentVertex.route];
                    float tripTime = edge.length / (metroMap.middleSpeed * 1000 / 60);
                    float transferTime = metroMap.switchTime * [self transfersOnVertex:currentVertex fromEdge:previousEdge toEdge:edge];
                    weight = tripTime + transferTime;
                }
//                MMEdge *previousEdge = [self latestEdge:currentVertex.route];
//                weight = [self transfersOnVertex:currentVertex fromEdge:previousEdge toEdge:edge];
//                NSLog(@"Пересадок: %d, %@ -> %@", weight, previousEdge.developmentName, edge.developmentName);
            } else { // Сортировка по времени поездки
                MWEdge *previousEdge = [self latestEdge:currentVertex.route];
                float tripTime = edge.length / (metroMap.middleSpeed * 1000 / 60);
                float transferTime = metroMap.switchTime * [self transfersOnVertex:currentVertex fromEdge:previousEdge toEdge:edge];
                weight = tripTime + transferTime;
            }
            float newWeight = currentVertex.weight + weight;
            // Если новая дистанция меньше старой, записываем ее вместо старой
            MWVertex *vertex = [self getOtherVertex:edge firstVertex:currentVertex];
            if (newWeight < vertex.weight) {
                vertex.weight = newWeight;
                // Обновляем лучший путь до вершины. Стираем предыдущий
                [vertex.route removeAllObjects];
                // Добавляем путь из предыдущей вершины
                [vertex.route addObjectsFromArray:currentVertex.route];
                // Добавляем себя в конец пути
                [vertex.route addObject:edge];
                [vertex.route addObject:vertex];
              }
        }

        // Пометим вершину как посещенную
        currentVertex.visited = TRUE;
    }
    
    MWVertex *finishVertex = [self vertexByStation:metroMap.finishStation];
    
    // Отдаем маршрут из конечной вершины
    return finishVertex.route;
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
- (int)routeTransfers:(NSArray *)path
{
    int switches = 0;
    
    // Если маршрут пустой, выходим
    if (!path.count) {
        return switches;
    }

    MWEdge *edge;
    MWVertex *vertex;
    MWStation *station;
    BOOL onePlatform;
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    
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
        switches++;
        // Добавляем в первую вершину маршрут пересадки "Станция - Станция"
        [vertex.transfers addObject:metroMap.startStation];
        [vertex.transfers addObject:station];
    }

    // Если маршрут состоит из одной вершины, то мы ее проверили на предыдущем шаге и можем досрочно выйти из процедуры
    if (path.count == 1) {
        return [self switchesBetweenTwoStations:metroMap.startStation toStation:metroMap.finishStation];
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
        switches++;
        // Добавляем в конечную вершину маршрут пересадки "Станция - Станция"
        [vertex.transfers addObject:metroMap.finishStation];
        [vertex.transfers addObject:station];
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
    if (edge.startVertex == vertex) {
        return edge.finishVertex;
    } else if (edge.finishVertex == vertex) {
        return edge.startVertex;
    }
    return nil;
}

// Журналирование маршрута. Только для теста
- (void)printRoute:(NSMutableArray *)route
{
    if (!route) {
        NSLog(@" ");
        NSLog(@"Маршрут пустой");
        return;
    }
    
    MWVertex *vertex = [[MWVertex alloc] init];
    MWEdge *edge = [[MWEdge alloc] init];
    
    NSLog(@" ");
    NSLog(@"Длина маршрута: %d метров",[self routeLength:route]);
    NSLog(@"Время поездки: %d минут",[self routeTripTime:route]);
    NSLog(@"Количество пересадок: %d", [self routeTransfers:route]);
    for (int i = 0; i < route.count ; i++) {
        NSObject *item = [route objectAtIndex:i];
        if ([item isKindOfClass:[vertex class]]) {
            vertex = (MWVertex *)item;
            NSLog(@"%d: %@", i+1, vertex.developmentName);
            if (vertex.transfers.count > 0) {
                NSLog(@"   Пересадок: %d", (int)vertex.transfers.count / 2);
            }
        } else if ([item isKindOfClass:[edge class]]) {
            NSLog(@"%d: %@", i+1, [(MWEdge *)item developmentName]);
        }
    }
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
}

// Определение времени поездки по маршруту (от входа в вестибюль до выхода на улицу)
- (int)routeTripTime:(NSArray *)path
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    int tripTime = 0;
    
    // Добавляем время, затрачиваемое на пересадки
    tripTime += metroMap.switchTime * [self routeTransfers:path];
    
    // Добавляем время самой поездки
    tripTime += [self routeLength:path]/(metroMap.middleSpeed*1000/60);
    
    return tripTime;
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

// Получаем количество пересадок между двумя станциями на одном узле
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
}

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
        return 1;
    } else {
        [vertex.transfers addObjectsFromArray:[self routeOnSwitch:fromStation finishStation:toStation]];
        int i = ((int)vertex.transfers.count + 2) / 2;
        
        // Если в маршруте больше одной станции, то количество переходов равно количество станций в маршруте минус один
        if (i > 1) {
            i--;
        }
        return i;
    }
}

// Получаем маршрут пересадки (список станций)
- (NSMutableArray *)routeOnSwitch:(MWStation *)startStation finishStation:(MWStation *)finishStation
{
    NSMutableArray *route = [[NSMutableArray alloc] init];
    
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
    MWVertex *vertex = [self vertexByStation:startStation];
    
    // Получаем узел конечной станции
    MWVertex *finishVertex = [self vertexByStation:finishStation];
    
    // Если узлы разные, то это ошибка
    if (![vertex isEqual:finishVertex]) {
        return route;
    }
    
    // Получаем список всех станций пересадочного узла
    NSMutableArray *stations = [[NSMutableArray alloc] initWithArray:[self stationsForVertex:vertex]];
    
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

    /* for (NSObject *object in finishStation.route) {
        NSLog(@"%@", ((MMStation *)object).nameOriginal);
    }

    NSLog(@" "); */
    
    return finishStation.route;
}

+ (MWLine *)lineByStation:(MWStation *)station
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    for (MWEdge *edge in metroMap.edges) {
        for (NSObject *element in edge.elements) {
            if ([element isEqual:station]) {
                return edge.line;
            }
        }
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
+ (NSArray *)compactRoute:(NSArray *)route
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    MWEdge *previousEdge = nil;
    MWEdge *edge;
    MWVertex *vertex, *tempVertex;
    NSObject *object;
    
//    [[MMRouter router] printRoute:route];
    
    for (int i = 0; i < route.count; i++) {
        object = [route objectAtIndex:i];
        if ([object isKindOfClass:[MWVertex class]]) {
            vertex = (MWVertex *)object;
            [result addObject:vertex];
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
                edge.finishVertex = tempVertex; /*
                if ([[result lastObject] isEqual:edge.finishVertex]) {
                    [result removeLastObject];
                    [result addObject:edge.startVertex];
                } else {
                    [result removeLastObject];
                    [result addObject:edge.finishVertex];
                }*/
            }
            
            if ([edge.line isEqual:previousEdge.line]) {
                // Объединяем предыдущий и текущий участки, поскольку они принадлежат одной и той же линии
                // Удаляем предыдущую вершину
                [vertex.transfers removeAllObjects];
                [result removeLastObject];
                // Удаляем предыдущий участок
                [result removeLastObject];
                // Объединяем участки
                MWEdge *newEdge = [self concatEdges:previousEdge secondEdge:edge];
                [result addObject:newEdge];
            } else {
                [result addObject:edge];
            }
            
            previousEdge = [result lastObject];
        }
    }

//    [[MMRouter router] printRoute:result];

    
    return result;
}

@end
