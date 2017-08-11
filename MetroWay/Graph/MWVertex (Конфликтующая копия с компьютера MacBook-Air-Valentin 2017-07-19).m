//
//  MMVertex.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWVertex.h"

@implementation MWVertex

@synthesize drawPrimitives, visited, weight, route, developmentName, identifier, transfers;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:identifier forKey:@"identifier"];
    [aCoder encodeObject:drawPrimitives forKey:@"drawPrimitives"];
#ifdef DEBUG
    [aCoder encodeObject:developmentName forKey:@"developmentName"];
#endif
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeObjectForKey:@"identifier"];
        self.drawPrimitives = [aDecoder decodeObjectForKey:@"drawPrimitives"];
        if (!drawPrimitives) {
            drawPrimitives = [[NSMutableArray alloc] init];
        }
#ifdef DEBUG
        self.developmentName = [aDecoder decodeObjectForKey:@"developmentName"];
#endif
        // Все вершины изначально непосещенные
        visited = FALSE;
        // Число в 100 000 километров считается в программе бесконечным
        weight = HUGE;
        // Инициализируем массив для хранения маршрута
        route = [[NSMutableArray alloc] init];
        transfers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        drawPrimitives = [[NSMutableArray alloc] init];
        // Все вершины изначально непосещенные
        visited = FALSE;
        // Число в 100 000 километров считается в программе бесконечным
        weight = HUGE;
        // Инициализируем массив для хранения маршрута
        route = [[NSMutableArray alloc] init];
        transfers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    route = nil;
    transfers = nil;
}

@end
