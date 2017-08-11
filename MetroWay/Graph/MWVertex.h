//
//  MMVertex.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

//  Класс, представляющий собой вершину графа

#import <Foundation/Foundation.h>

@interface MWVertex : NSObject <NSCoding>

// Идентификатор
@property (nonatomic, strong) NSString *identifier;
// Массив примитивов для рисования перегона
@property NSMutableArray *drawPrimitives;
// Посещенные вершины
@property BOOL visited;
// Вес от начальной вершины (станции)
@property float weight;
// Массив, содержащий кратчайший маршрут к вершине от начальной вершины в виде последовательных ссылок на вершины, начиная со стартовой
@property NSMutableArray *path;
// Имя вершины. Используется только для разработки
@property (nonatomic) NSString *developmentName;
// Идентификаторы пар станций для рисования переходов
@property NSMutableArray *transfers;

@end
