//
//  MMEdge.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

//  Класс, представляющий собой ребро графа (участок линии с перегонами и станциями)
//  Ребром считается участоли линии от узла до узла, без промежуточных узлов. Например, от станции метро "Новоясеневская" до "Октябрьская"

#import <Foundation/Foundation.h>
#import "MWStation.h"
#import "MWVertex.h"
#import "MWLine.h"

@interface MWEdge : NSObject <NSCoding>

// Идентификатор
@property (nonatomic, strong) NSString *identifier;
// Элементы цепи (перегоны и станции). Важен порядок следования!
@property NSMutableArray *elements;
// обозначаем направление перегона. Если он односторонний, то указываем стартовую станцию. В противном случае nil
@property (nonatomic, weak) MWStation *directionFromStation;
// Начальная вершина
@property (nonatomic, weak) MWVertex *startVertex;
// Конечная вершина
@property (nonatomic, weak) MWVertex *finishVertex;
// Линия, которой принадлежит ребро
@property (nonatomic, weak) MWLine *line;

// Длина участка в метрах
@property (nonatomic, readonly) float length;
// Флаг, показывающий включенность участка (используется для расчетов кратчайших маршрутов)
@property (nonatomic) BOOL enable;
// Флаг, показывающий что ребро создано для просчета маршрута (когда начальная или конечные станции не явлются вершинами)
@property (nonatomic) BOOL sinthetic;
// Имя ребра. Используется только для разработки
@property NSString *developmentName;



- (BOOL)containsStation:(MWStation *)station;
- (int)stationIndex:(MWStation *)station;
- (MWVertex *)vertexByStation:(MWStation *)station;
- (int)stationsCount;
- (NSArray *)stations;

@end
