//
//  MMDevelopment.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 14.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWDevelopment.h"

@implementation MWDevelopment

// Получаем случайное число в заданном диапазоне
+ (u_int32_t)randomInRangeLo:(u_int32_t)loBound toHi:(u_int32_t)hiBound
{
    int32_t range = hiBound - loBound + 1;
    return loBound + arc4random_uniform(range);
}

// Тестирование случайного маршрута. Случайный выбор схемы и станций
+ (void)createRandomRoute
{
    // Выбираем случайную схему
    MWList *list = [MWStorage metroMapList];
    int randomNumber = [self randomInRangeLo:0 toHi:(u_int32_t)list.items.count - 1];
    MWListItem *listItem = [list.items objectAtIndex:randomNumber];

    // Загружаем схему метро
    MWMetroMap *metroMap = [MWStorage loadMetroMap:listItem.identifier];

    if (!metroMap) {
        NSLog(@"Не все схемы доступны. Предварительно создайте все схемы метро функцией createAllMetro или закачайте их вручную из программы");
        return;
    }
    
    // Получаем станции
    NSArray *stations = metroMap.stations;
    
    int randomNumber1 = [self randomInRangeLo:0 toHi:(u_int32_t)stations.count - 1];
    MWStation *startStation = [stations objectAtIndex:randomNumber1];
    int randomNumber2 = [self randomInRangeLo:0 toHi:(u_int32_t)stations.count - 1];
    MWStation *finishStation = [stations objectAtIndex:randomNumber2];
    int randomNumber3 = [self randomInRangeLo:0 toHi:2];
    NSString *language;
    switch (randomNumber3) {
        case 0:
            language = @"automatic";
            break;
        case 1:
            language = @"english";
            break;
        case 2:
            language = @"русский";
            break;
        default:
            break;
    }
    int randomNumber4 = [self randomInRangeLo:0 toHi:1];
    NSString *englishTitle = randomNumber4 ? @"Английские надписи включены" : @"Английские надписи выключены";

    int randomNumber5 = [self randomInRangeLo:0 toHi:1];
    NSString *sort = randomNumber5 ? @"по времени поездки" : @"по числу пересадок";
    
    NSLog(@"Метро: %@", metroMap.identifier);
    NSLog(@"%@: %@ (%@)", startStation.identifier, startStation.nameEnglish, startStation.nameOriginal);
    NSLog(@"%@: %@ (%@)", finishStation.identifier, finishStation.nameEnglish, finishStation.nameOriginal);
    NSLog(@"Язык интерфейса %@", language);
    NSLog(@"%@", englishTitle);
    NSLog(@"Сортировка маршрутов %@", sort);
}

// Упаковка изображения со схемой метро в файл
+ (void)packMapImageIntoMetroMap:(MWMetroMap *)metroMap
{
    NSString *fileName = [metroMap.identifier stringByAppendingString:@"_background.png"];
    metroMap.backgroundImage = [UIImage imageNamed:fileName];
    metroMap.image = [MWDraw createMetroMapImage:metroMap];
    
    /*
    NSString *cachesDirectory = [MMStorage cachesDirectory];
    
    fileName = [NSString stringWithFormat:@"%@.png", metroMap.identifier];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];

    NSData *binaryImageData = UIImagePNGRepresentation(metroMap.metroMapImage);
    [binaryImageData writeToFile:path atomically:YES];
    
    [MMUpload uploadFileSynchronous:fileName]; */
}

+ (void)createNewList:(BOOL)uploadToServer;
{
    MWList *list = [[MWList alloc] init];
    [list createNewList];
    [list save];
    if (uploadToServer) {
        [list createNewListTXTVersion];
        [MWUpload uploadFileSynchronous:@"list.data"];
        [MWUpload uploadFileSynchronous:@"list.txt"];
    }
}

+ (void)createAllMetro:(BOOL)uploadToServer
{
    [self createMoscowMetro:uploadToServer];
    [self createBeloHorizonteMetro:uploadToServer];
    [self createMedellinMetro:uploadToServer];
    [self createAmsterdamMetro:uploadToServer];
    [self createBangkokAirport:uploadToServer];
    [self createPortoAlegreMetro:uploadToServer];
    [self createLosAngelesMetro:uploadToServer];
    [self createYekaterinburgMetro:uploadToServer];
    [self createWuhanMetro:uploadToServer];
    [self createKyotoSubway:uploadToServer];
    [self createTorontoSubway:uploadToServer];
    [self createNizhnyNovgorodMetro:uploadToServer];
    [self createYokohamaSubway:uploadToServer];
    [self createBostonSubway:uploadToServer];
    [self createPyongyangMetro:uploadToServer];
    [self createRecifeMetro:uploadToServer];
    [self createHiroshimaMetro:uploadToServer];
}

+ (void)createMetro:(MWMetroMap *)metroMap uploadToServer:(BOOL)uploadToServer
{
    #ifdef DEBUG
        if (uploadToServer) {
            NSLog(@"Выключите debug режим для аплоада на сервер!");
        }
    #endif
    
    [self packMapImageIntoMetroMap:metroMap];
    [self checkMetroMap:metroMap];
    [MWStorage saveMetro:metroMap];
    if (uploadToServer) {
        NSString *fileName = [metroMap.identifier stringByAppendingPathExtension:@"mm"];
        [MWUpload uploadFileSynchronous:fileName];

        [MWDraw createThumbnail:metroMap];
        
        fileName = [NSString stringWithFormat:@"%@_thumbnail.jpg", metroMap.identifier];
        [MWUpload uploadFileSynchronous:fileName];
    }
}

+ (void)createMoscowMetro:(BOOL)uploadToServer
{
    MWMoscowMetro *moscowMetro = [[MWMoscowMetro alloc] init];
    [self createMetro:moscowMetro uploadToServer:uploadToServer];
    moscowMetro = nil;
}

+ (void)createBeloHorizonteMetro:(BOOL)uploadToServer
{
    MWBeloHorizonteMetro *beloHorizonteMetro = [[MWBeloHorizonteMetro alloc] init];
    [self createMetro:beloHorizonteMetro uploadToServer:uploadToServer];
    beloHorizonteMetro = nil;
}

+ (void)createMedellinMetro:(BOOL)uploadToServer
{
    MWMedellinMetro *medellinMetro = [[MWMedellinMetro alloc] init];
    [self createMetro:medellinMetro uploadToServer:uploadToServer];
    medellinMetro = nil;
}

+ (void)createAmsterdamMetro:(BOOL)uploadToServer
{
    MWAmsterdamMetro *amsterdamMetro = [[MWAmsterdamMetro alloc] init];
    [self createMetro:amsterdamMetro uploadToServer:uploadToServer];
    amsterdamMetro = nil;
}

+ (void)createBangkokAirport:(BOOL)uploadToServer
{
    MWBangkokAirport *bangkokAirport = [[MWBangkokAirport alloc] init];
    [self createMetro:bangkokAirport uploadToServer:uploadToServer];
    bangkokAirport = nil;
}

+ (void)createPortoAlegreMetro:(BOOL)uploadToServer
{
    MWPortoAlegreMetro *portoAlegreMetro = [[MWPortoAlegreMetro alloc] init];
    [self createMetro:portoAlegreMetro uploadToServer:uploadToServer];
    portoAlegreMetro = nil;
}

+ (void)createLosAngelesMetro:(BOOL)uploadToServer
{
    MWLosAngelesMetro *losAngelesMetro = [[MWLosAngelesMetro alloc] init];
    [self createMetro:losAngelesMetro uploadToServer:uploadToServer];
    losAngelesMetro = nil;
}

+ (void)createYekaterinburgMetro:(BOOL)uploadToServer
{
    MWYekaterinburgMetro *yekaterinburgMetro = [[MWYekaterinburgMetro alloc] init];
    [self createMetro:yekaterinburgMetro uploadToServer:uploadToServer];
    yekaterinburgMetro = nil;
}

+ (void)createWuhanMetro:(BOOL)uploadToServer
{
    MWWuhanMetro *wuhanMetro = [[MWWuhanMetro alloc] init];
    [self createMetro:wuhanMetro uploadToServer:uploadToServer];
    wuhanMetro = nil;
}

+ (void)createKyotoSubway:(BOOL)uploadToServer
{
    MWKyotoSubway *kyotoSubway = [[MWKyotoSubway alloc] init];
    [self createMetro:kyotoSubway uploadToServer:uploadToServer];
    kyotoSubway = nil;
}

+ (void)createTorontoSubway:(BOOL)uploadToServer
{
    MWTorontoSubway *torontoSubway = [[MWTorontoSubway alloc] init];
    [self createMetro:torontoSubway uploadToServer:uploadToServer];
    torontoSubway = nil;
}

+ (void)createNizhnyNovgorodMetro:(BOOL)uploadToServer
{
    MWNizhnyNovgorodMetro *nizhnyNovgorodMetro = [[MWNizhnyNovgorodMetro alloc] init];
    [self createMetro:nizhnyNovgorodMetro uploadToServer:uploadToServer];
    nizhnyNovgorodMetro = nil;
}

+ (void)createYokohamaSubway:(BOOL)uploadToServer
{
    MWYokohamaSubway *yokohamaSubway = [[MWYokohamaSubway alloc] init];
    [self createMetro:yokohamaSubway uploadToServer:uploadToServer];
    yokohamaSubway = nil;
}

+ (void)createBostonSubway:(BOOL)uploadToServer
{
    MWBostonSubway *bostonSubway = [[MWBostonSubway alloc] init];
    [self createMetro:bostonSubway uploadToServer:uploadToServer];
    bostonSubway = nil;
}

+ (void)createPyongyangMetro:(BOOL)uploadToServer
{
    MWPyongyangMetro *pyongyangMetro = [[MWPyongyangMetro alloc] init];
    [self createMetro:pyongyangMetro uploadToServer:uploadToServer];
    pyongyangMetro = nil;
}

+ (void)createRecifeMetro:(BOOL)uploadToServer
{
    MWRecifeMetro *recifeMetro = [[MWRecifeMetro alloc] init];
    [self createMetro:recifeMetro uploadToServer:uploadToServer];
    recifeMetro = nil;
}

+ (void)createHiroshimaMetro:(BOOL)uploadToServer
{
    MWHiroshimaMetro *hiroshimaMetro = [[MWHiroshimaMetro alloc] init];
    [self createMetro:hiroshimaMetro uploadToServer:uploadToServer];
    hiroshimaMetro = nil;
}

// Проверка схемы метро
+ (void)checkMetroMap:(MWMetroMap *)metroMap;
{
    MWStation *station = [[MWStation alloc] init];
    MWHaul *haul = [[MWHaul alloc] init];
    
    // Получаем станции
    NSMutableArray *stations = [[NSMutableArray alloc] init];
    
    for (MWEdge *edge in metroMap.edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[MWStation class]]) {
                station = (MWStation *)element;
                if (![stations containsObject:station]) {
                    [stations addObject:station];
                }
            }
        }
    }
    
    // Проверка наличия идентификатора
    if (!metroMap.identifier.length) {
        NSLog(@"%@: отсутствует идентификатор схемы метро", metroMap.identifier);
    }
    
    // Проверка наличия изображения со схемой метро
    if (!metroMap.image.CGImage) {
        NSLog(@"%@: отсутствует изображение схемы метро", metroMap.identifier);
    }
    
    // Проверка наличия участков
    if (metroMap.edges.count == 0) {
        NSLog(@"%@: отсутствует участки", metroMap.identifier);
    }
    
    // Проверка наличия вершин
    if (metroMap.vertices.count == 0) {
        NSLog(@"%@: отсутствует вершины", metroMap.identifier);
    }
    
    // Проверка наличия линий
    if (metroMap.lines.count == 0) {
        NSLog(@"%@: отсутствует линии", metroMap.identifier);
    }
    
    // Проверка наличия пустых участков (без элементов)
    for (MWEdge *edge in metroMap.edges) {
        if (edge.elements.count == 0) {
            NSLog(@"%@: пустой участок (без элементов): %@:", metroMap.identifier, edge.developmentName);
        }
    }
    
    // Проверка наличия начальной вершины у участка
    for (MWEdge *edge in metroMap.edges) {
        if (!edge.startVertex) {
            NSLog(@"%@: участок без начальной вершины: %@:", metroMap.identifier, edge.developmentName);
        }
    }
    
    // Проверка наличия конечной вершины у участка
    for (MWEdge *edge in metroMap.edges) {
        if (!edge.finishVertex) {
            NSLog(@"%@: участок без конечной вершины: %@:", metroMap.identifier, edge.developmentName);
        }
    }
    
    // Проверка правильной последовательности элементов у участка (станция-перегон-станция)
    for (MWEdge *edge in metroMap.edges) {
        for (int i = 0; i < edge.elements.count; i++) {
            if (i % 2) {
                if ([[edge.elements objectAtIndex:i] isKindOfClass:[station class]]) {
                    NSLog(@"%@: ошибка с последовательностью элементов участка: %@:", metroMap.identifier, edge.developmentName);
                }
            } else {
                if ([[edge.elements objectAtIndex:i] isKindOfClass:[haul class]]) {
                    NSLog(@"%@: ошибка с последовательностью элементов участка: %@:", metroMap.identifier, edge.developmentName);
                }
            }
        }
    }
    
    // Проверка наличия линии у участков
    for (MWEdge *edge in metroMap.edges) {
        if (!edge.line) {
            NSLog(@"%@: участок без линии: %@:", metroMap.identifier, edge.developmentName);
        }
    }
    
    // Проверка наличия имени у линий
    for (MWLine *line in metroMap.lines) {
        if (line.nameOriginal == 0 && line.nameEnglish == 0) {
            NSLog(@"%@: имеется линия без имени", metroMap.identifier);
        }
    }
    
    // Проверка наличия цвета у линий
    for (MWLine *line in metroMap.lines) {
        if (!line.color) {
            NSLog(@"%@: линия без цвета: %@", metroMap.identifier, line.nameEnglish);
        }
    }
    
    // Проверка наличия у станций имен на оригинальном языке
    for (MWStation *station in stations) {
        if (station.nameOriginal.length == 0) {
            NSLog(@"%@: станция без названия на оригинальном языке: %@", metroMap.identifier, station.identifier);
        }
    }
    
    // Проверка наличия у станций местоположения на карте
    for (MWStation *station in stations) {
        if ((!station.mapLocation.x) || (!station.mapLocation.y)) {
            NSLog(@"%@: cтанция без привязки к карте: %@", metroMap.identifier, station.nameOriginal);
        }
    }
    
    // Проверка наличия у станций географической привязки
    for (MWStation *station in stations) {
        if ((!station.geoLocation.x) || (!station.geoLocation.y)) {
            NSLog(@"%@: cтанция без привязки к меcтности: %@", metroMap.identifier, station.nameOriginal);
        }
    }

  // Проверка наличия перегонов нулевой длины
    for (MWEdge *edge in metroMap.edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[haul class]]) {
                haul = (MWHaul *)element;
                if (!haul.length) {
                    NSLog(@"Перегон %@ имеет нулевую длину", haul.identifier);
                }
            }
        }
    }
    
    // Проверка наличия у перегонов идентификаторов
    for (MWEdge *edge in metroMap.edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[haul class]]) {
                haul = (MWHaul *)element;
                if (haul.identifier.length == 0) {
                    NSLog(@"%@: %@ имеет перегон без идентификатора", metroMap.identifier, edge.developmentName);
                }
            }
        }
    }
    
    // Проверка наличия уникальности идентификаторов перегонов
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (MWEdge *edge in metroMap.edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[haul class]]) {
                haul = (MWHaul *)element;
                if ([array containsObject:haul.identifier]) {
                    NSLog(@"%@: %@ имеет перегон с не уникальным идентификатором", metroMap.identifier, edge.developmentName);
                } else {
                    if (haul.identifier) {
                        [array addObject:haul.identifier];
                    }
                }
            }
        }
    }
    
    // Проверка наличия идентификаторов у линий
    for (MWLine *line in metroMap.lines) {
        if (line.identifier.length == 0) {
            NSLog(@"%@: линия без идентификатора: %@", metroMap.identifier, line.nameEnglish);
        }
    }
    
    // Проверка наличия уникальности идентификаторов линий
    [array removeAllObjects];
    for (MWLine *line in metroMap.lines) {
        if ([array containsObject:line.identifier]) {
            NSLog(@"%@: линия имеет не уникальный идентификатор: %@", metroMap.identifier, line.nameEnglish);
        } else {
            if (line.identifier) {
                [array addObject:line.identifier];
            }
        }
    }

    // Проверка наличия идентификаторов у участков
    for (MWEdge *edge in metroMap.edges) {
        if (edge.identifier.length == 0) {
            NSLog(@"%@: участок без идентификатора: %@:", metroMap.identifier, edge.developmentName);
        }
    }

    // Проверка наличия уникальности идентификаторов участков
    [array removeAllObjects];
    for (MWEdge *edge in metroMap.edges) {
        if ([array containsObject:edge.identifier]) {
            NSLog(@"%@: участок имеет не уникальный идентификатор: %@:", metroMap.identifier, edge.developmentName);
        } else {
            if (edge.identifier) {
                [array addObject:edge.identifier];
            }
        }
    }

    // Проверка наличия идентификаторов у вершин
    for (MWVertex *vertex in metroMap.vertices) {
        if (vertex.identifier.length == 0) {
            NSLog(@"%@: вершина без идентификатора: %@:", metroMap.identifier, vertex.developmentName);
        }
    }
    
    // Проверка наличия уникальности идентификаторов вершин
    [array removeAllObjects];
    for (MWVertex *vertex in metroMap.vertices) {
        if ([array containsObject:vertex.identifier]) {
            NSLog(@"%@: вершина имеет не уникальный идентификатор: %@:", metroMap.identifier, vertex.developmentName);
        } else {
            if (vertex.identifier) {
                [array addObject:vertex.identifier];
            }
        }
    }
    
    // Проверка наличия у станций идентификаторов
    for (MWStation *station in stations) {
        if (station.identifier.length == 0) {
            NSLog(@"%@: cтанция без идентификатора: %@", metroMap.identifier, station.nameOriginal);
        }
    }

    // Проверка наличия уникальности идентификаторов станций
    [array removeAllObjects];
    for (MWStation *station in stations) {
        if ([array containsObject:station.identifier]) {
            NSLog(@"%@: станция имеет не уникальный идентификатор: %@", metroMap.identifier, station.nameOriginal);
        } else {
            if (station.identifier) {
                [array addObject:station.identifier];
            }
        }
    }

    // Проверка четности массива stationsWithoutSwitch (Массив пар станций, которые присутствуют в узле, но у которых закрыт переход)
    if (metroMap.stationsWithoutTransfer.count % 2) {
            NSLog(@"%@: схема метро имеет нечетное количество станций с закрытым переходом (stationsWithoutSwith)", metroMap.identifier);
    }
    
    // тестирование расстояний между станциями - порог 12 км
    MWStation *previoslyStation;
    MWStation *currentStation;
    int distance;
    CLLocationCoordinate2D previouslyStationCoordinate, currentStationCoordinate;
    for (MWEdge *edge in metroMap.edges) {
        previoslyStation = nil;
        for (int i = 0; i < edge.elements.count; i++) {
            if ([[edge.elements objectAtIndex:i] isKindOfClass:[MWStation class]]) {
                currentStation = [edge.elements objectAtIndex:i];
                if (previoslyStation == nil) {
                    previoslyStation = currentStation;
                } else {
                    previouslyStationCoordinate.latitude = previoslyStation.geoLocation.x;
                    previouslyStationCoordinate.longitude = previoslyStation.geoLocation.y;
                    currentStationCoordinate.latitude = currentStation.geoLocation.x;
                    currentStationCoordinate.longitude = currentStation.geoLocation.y;
                    distance = (int)[MWLocation geodesicDistance:previouslyStationCoordinate toPoint:currentStationCoordinate];
                    if (distance > 12000) {
                        NSLog(@"%@: Дистанция между станцией %@ и %@ составляет %d метров", metroMap.identifier, previoslyStation.nameOriginal, currentStation.nameOriginal, distance);
                    }
                    previoslyStation = currentStation;
                }
            }
        }
    }
    
    [array removeAllObjects];
    array = nil;
    stations = nil;
    station = nil;
    haul = nil;
}

+ (void)uploadMetroMapImageToSite:(NSString *)identifier
{
    MWMetroMap *metroMap = [MWStorage loadMetroMap:identifier];
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    NSString *fileName = [NSString stringWithFormat:@"%@.png", metroMap.identifier];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    
    NSData *binaryImageData = UIImagePNGRepresentation(metroMap.image);
    [binaryImageData writeToFile:path atomically:YES];
    
    [MWUpload uploadFileSynchronous:fileName];
}

@end
