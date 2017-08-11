//
//  MMVertex.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWVertex.h"

@implementation MWVertex

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identifier forKey:@"identifier"];
    [aCoder encodeObject:_drawPrimitives forKey:@"drawPrimitives"];
#ifdef DEBUG
    [aCoder encodeObject:_developmentName forKey:@"developmentName"];
#endif
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _identifier = [aDecoder decodeObjectForKey:@"identifier"];
        _drawPrimitives = [aDecoder decodeObjectForKey:@"drawPrimitives"];
        if (!_drawPrimitives) {
            _drawPrimitives = [NSMutableArray array];
        }
#ifdef DEBUG
        _developmentName = [aDecoder decodeObjectForKey:@"developmentName"];
#endif
        // Все вершины изначально непосещенные
        _visited = FALSE;
        // Число в 100 000 километров считается в программе бесконечным
        _weight = HUGE;
        // Инициализируем массив для хранения маршрута
        _path = [NSMutableArray array];
        _transfers = [NSMutableArray array];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        _drawPrimitives = [NSMutableArray array];
        // Все вершины изначально непосещенные
        _visited = FALSE;
        // Число в 100 000 километров считается в программе бесконечным
        _weight = HUGE;
        // Инициализируем массив для хранения маршрута
        _path = [NSMutableArray array];
        _transfers = [NSMutableArray array];
    }
    return self;
}

@end
