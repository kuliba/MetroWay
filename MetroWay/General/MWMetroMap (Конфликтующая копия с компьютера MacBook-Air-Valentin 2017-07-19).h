//
//  MMMetroMap.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 04.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWStation.h"
#import "MWEdge.h"

@interface MWMetroMap : NSObject <NSCoding>

// Идентификатор схемы метро
@property (nonatomic, strong) NSString *identifier;
// Изображение схемы метро
@property (nonatomic, strong) UIImage *image;
// Фон
@property (nonatomic, strong) UIImage *backgroundImage;
// Отображение английских надписей
@property (nonatomic) BOOL englishTextDrawn;
// Список участков линий
@property (nonatomic, strong) NSMutableArray *edges;
// Список вершин
@property (nonatomic, strong) NSMutableArray *vertices;
// Список линий
@property (nonatomic, strong) NSMutableArray *lines;
// Массив пар станций, которые присутствуют в узле, но у которых закрыт переход
@property (nonatomic) NSMutableArray *stationsWithoutTransfer;
// Средняя скорость движения метрополитена, км/ч
@property (nonatomic) int middleSpeed;
// Среднее время пересадки в минутах
@property (nonatomic) int switchTime;
// Порядок рисования линий на схеме метро
@property (nonatomic, strong) NSMutableArray *drawLinesOrder;
// Дополнительные надписи на английском языке
@property (nonatomic, strong) NSMutableArray *additionalEnglishTextPrimitives;
// Дополнительные объекты, рисуемые под схемой метро
@property (nonatomic, strong) NSMutableArray *additionalUnderMapPrimitives;
// Дополнительные объекты, рисуемые над схемой метро
@property (nonatomic, strong) NSMutableArray *additionalOverMapPrimitives;
// Минимальный коэффициент масштабирования
@property (nonatomic) float minimumZoomScale;
// Максимальный коэффициент масштабирования
@property (nonatomic) float maximumZoomScale;
// Начальный коэффициент масштабирования
@property (nonatomic) float initialZoomScale;
// Начальная позиция карты
@property (nonatomic) CGPoint contentOffset;

// Начальная станция маршрута - сессионная переменная
@property (nonatomic, weak) MWStation *startStation;
// Конечная станция маршрута - сессионная переменная
@property (nonatomic, weak) MWStation *finishStation;

- (BOOL)englishTextExists;
- (MWStation *)selectedStation:(CGPoint)coordinate;
- (MWStation *)stationByIdentifier:(NSString *)identifier;
- (NSArray *)stations;
- (NSArray *)lineStations:(MWLine *)line;
- (void)clearListLocations;

@end