//
//  MMStation.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWStation.h"

@implementation MWStation

@synthesize nameOriginal, nameEnglish, nameOriginalTextPrimitives, nameEnglishTextPrimitives, showNameOnMap, geoLocation, drawPrimitives, mapLocation, routeVisited, routeDistance, route, identifier, distance, platformIndex, listLocation;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:identifier forKey:@"identifier"];
    [aCoder encodeObject:nameOriginal forKey:@"nameOriginal"];
    [aCoder encodeObject:nameEnglish forKey:@"nameEnglish"];
    [aCoder encodeCGPoint:mapLocation forKey:@"mapLocation"];
    [aCoder encodeCGPoint:geoLocation forKey:@"geoLocation"];
    [aCoder encodeObject:drawPrimitives forKey:@"drawPrimitivesStation"];
    [aCoder encodeObject:nameOriginalTextPrimitives forKey:@"nameOriginalTextPrimitives"];
    [aCoder encodeObject:nameEnglishTextPrimitives forKey:@"nameEnglishTextPrimitives"];
    [aCoder encodeBool:showNameOnMap forKey:@"showNameOnMap"];
    [aCoder encodeInt:platformIndex forKey:@"platformIndex"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.identifier = [aDecoder decodeObjectForKey:@"identifier"];
        self.nameOriginal = [aDecoder decodeObjectForKey:@"nameOriginal"];
        self.nameEnglish = [aDecoder decodeObjectForKey:@"nameEnglish"];
        self.mapLocation = [aDecoder decodeCGPointForKey:@"mapLocation"];
        self.geoLocation = [aDecoder decodeCGPointForKey:@"geoLocation"];
        self.drawPrimitives = [aDecoder decodeObjectForKey:@"drawPrimitivesStation"];
        self.platformIndex = [aDecoder decodeIntForKey:@"platformIndex"];
        self.showNameOnMap = [aDecoder decodeBoolForKey:@"showNameOnMap"];
        if (!drawPrimitives) {
            drawPrimitives = [NSMutableArray array];
        }
        self.nameOriginalTextPrimitives = [aDecoder decodeObjectForKey:@"nameOriginalTextPrimitives"];
        if (!nameOriginalTextPrimitives) {
            nameOriginalTextPrimitives = [[NSMutableArray alloc] init];
        }
        self.nameEnglishTextPrimitives = [aDecoder decodeObjectForKey:@"nameEnglishTextPrimitives"];
        if (!nameEnglishTextPrimitives) {
            nameEnglishTextPrimitives = [[NSMutableArray alloc] init];
        }
        // Все вершины изначально непосещенные
        routeVisited = FALSE;
        // Число в 100 000 километров считается в программе бесконечным
        routeDistance = 100000000;
        // Инициализируем массив для хранения маршрута
        route = [[NSMutableArray alloc] init];
        
        distance = 0;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        drawPrimitives = [[NSMutableArray alloc] init];
        nameOriginalTextPrimitives = [[NSMutableArray alloc] init];
        nameEnglishTextPrimitives = [[NSMutableArray alloc] init];
        showNameOnMap = true;
        routeVisited = FALSE;
        routeDistance = 100000000;
        route = [[NSMutableArray alloc] init];
        distance = 0;
        platformIndex = 0;
        listLocation = CGPointMake(-100, -100);
    }
    return self;
}

@end