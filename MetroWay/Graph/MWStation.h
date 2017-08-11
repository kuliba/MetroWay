//
//  MMStation.h
//  Metro Maps //
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWGraphStatus.h"

@interface MWStation : NSObject <NSCoding>

// Идентификатор
@property (nonatomic, strong) NSString *identifier;
// название станции на родном языке
@property (nonatomic) NSString *nameOriginal;
// Название станции на английском языке
@property (nonatomic) NSString *nameEnglish;
// Центральная точка станции на схеме
@property CGPoint mapLocation;
// Географическая локация станции
@property CGPoint geoLocation;
// Массив примитивов для рисования станции
@property NSMutableArray *drawPrimitives;
// Массив для строк названий станций на оригинальном языке
@property NSMutableArray *nameOriginalTextPrimitives;
// Массив для строк названий станций на английском языке
@property NSMutableArray *nameEnglishTextPrimitives;
// Выводим ли надписи при показе карты (чтобы исключить возможность накладывания надписей на узле, если название станций одинаково)
@property BOOL showNameOnMap;
// Группируем станции по платформам (станции на различных маршрутах могут располагаться на одних и тех же платформах)
@property (nonatomic) int platformIndex;
// Статусы станции
@property (nonatomic, strong) NSMutableArray *states;

/* Пример
 
 station0006.closed = true;
 
 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
 [dateFormatter setDateFormat:@"dd.MM.yyyy"];
 NSString *dateString = @"1.3.2017";
 NSDate *date = [dateFormatter dateFromString:dateString];
 station0006.closedUntil = date;

*/

// Посещенные станции (для поиска маршрута пересадки)
@property BOOL routeVisited;
// Вес станции (для поиска маршрута пересадки)
@property int routeDistance;
// Массив, содержащий кратчайший маршрут к вершине от начальной вершины в виде последовательных ссылок на вершины, начиная со стартовой
@property NSMutableArray *route;
// Дистанция от текущего месторасположения до станции в метрах
@property float distance;
// Центральная точка станции на маршрутном списке
@property CGPoint listLocation;

- (BOOL)isClosed;
// Текст для сообщения о том, что станция закрыта
- (NSString *)closedText;

@end
