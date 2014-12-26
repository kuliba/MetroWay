//
//  MMMetroMap.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 04.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWMetroMap.h"
#import "MWVertex.h"
#import "MWEdge.h"
#import "MWDrawTextLine.h"

@implementation MWMetroMap

@synthesize image, edges, vertices, lines, startStation, finishStation, middleSpeed, switchTime, stationsWithoutTransfer, drawLinesOrder, additionalEnglishTextPrimitives, additionalOverMapPrimitives, additionalUnderMapPrimitives, minimumZoomScale, maximumZoomScale, initialZoomScale, contentOffset, identifier, backgroundImage, englishTextDrawn;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:identifier forKey:@"identifier"];
    [aCoder encodeObject:UIImagePNGRepresentation(image) forKey:@"image"];
    [aCoder encodeObject:UIImagePNGRepresentation(backgroundImage) forKey:@"backgroundImage"];
    [aCoder encodeBool:englishTextDrawn forKey:@"englishTextDrawn"];
    [aCoder encodeObject:edges forKey:@"edges"];
    [aCoder encodeObject:vertices forKey:@"vertices"];
    [aCoder encodeObject:lines forKey:@"lines"];
    [aCoder encodeObject:stationsWithoutTransfer forKey:@"stationsWithoutTransfer"];
    [aCoder encodeInt:middleSpeed forKey:@"middleSpeed"];
    [aCoder encodeInt:switchTime forKey:@"switchTime"];
    [aCoder encodeObject:drawLinesOrder forKey:@"drawLinesOreder"];
    [aCoder encodeObject:additionalEnglishTextPrimitives forKey:@"additionalEnglishTextPrimitives"];
    [aCoder encodeObject:additionalUnderMapPrimitives forKey:@"additionalUnderMapPrimitives"];
    [aCoder encodeObject:additionalOverMapPrimitives forKey:@"additionalOverMapPrimitives"];
    [aCoder encodeFloat:minimumZoomScale forKey:@"minimumZoomScale"];
    [aCoder encodeFloat:maximumZoomScale forKey:@"maximumZoomScale"];
    [aCoder encodeFloat:initialZoomScale forKey:@"initialZoomScale"];
    [aCoder encodeCGPoint:contentOffset forKey:@"contentOffset"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init]; 
    if (self) {
        self.backgroundImage = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"backgroundImage"]];
        self.image = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"image"]];
        
        if (backgroundImage) {
            [self setDefaultConstrains];
        }
        
        float tempFloat = [aDecoder decodeFloatForKey:@"minimumZoomScale"];
        if (tempFloat > 0) {
            self.minimumZoomScale = tempFloat;
        }
        
        tempFloat = [aDecoder decodeFloatForKey:@"maximumZoomScale"];
        if (tempFloat > 0) {
            self.maximumZoomScale = tempFloat;
        }

        tempFloat = [aDecoder decodeFloatForKey:@"initialZoomScale"];
        if (tempFloat > 0) {
            self.initialZoomScale = tempFloat;
        }

        CGPoint tempPoint = [aDecoder decodeCGPointForKey:@"contentOffset"];
        if (fabsf(tempPoint.x) + fabsf(tempPoint.y) > 1) {
            self.contentOffset = tempPoint;
        }
        
        self.identifier = [aDecoder decodeObjectForKey:@"identifier"];
        self.englishTextDrawn = [aDecoder decodeBoolForKey:@"englishTextDrawn"];
        self.middleSpeed = [aDecoder decodeIntForKey:@"middleSpeed"];
        self.switchTime = [aDecoder decodeIntForKey:@"switchTime"];
        self.edges = [aDecoder decodeObjectForKey:@"edges"];
        if (!edges)
            edges = [[NSMutableArray alloc] init];
        self.vertices = [aDecoder decodeObjectForKey:@"vertices"];
        if (!vertices)
            vertices = [[NSMutableArray alloc] init];
        self.lines = [aDecoder decodeObjectForKey:@"lines"];
        if (!lines) {
            lines = [[NSMutableArray alloc] init];
        }
        self.stationsWithoutTransfer = [aDecoder decodeObjectForKey:@"stationsWithoutTransfer"];
        if (!stationsWithoutTransfer) {
            stationsWithoutTransfer = [[NSMutableArray alloc] init];
        }
        self.drawLinesOrder = [aDecoder decodeObjectForKey:@"drawLinesOrder"];
        if (!drawLinesOrder) {
            drawLinesOrder = [[NSMutableArray alloc] init];
        }
        self.additionalEnglishTextPrimitives = [aDecoder decodeObjectForKey:@"additionalEnglishTextPrimitives"];
        if (!additionalEnglishTextPrimitives) {
            additionalEnglishTextPrimitives = [[NSMutableArray alloc] init];
        }
        self.additionalUnderMapPrimitives = [aDecoder decodeObjectForKey:@"additionalUnderMapPrimitives"];
        if (!additionalUnderMapPrimitives) {
            additionalUnderMapPrimitives = [[NSMutableArray alloc] init];
        }
        self.additionalOverMapPrimitives = [aDecoder decodeObjectForKey:@"additionalOverMapPrimitives"];
        if (!additionalOverMapPrimitives) {
            additionalOverMapPrimitives = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (void)setDefaultConstrains
{ // 640x1136
    CGPoint offset = CGPointZero;
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    screenBound.size.height -= 75;
    float initialZoom = screenBound.size.width / self.backgroundImage.size.width;
    if (self.backgroundImage.size.height * initialZoom < screenBound.size.height) {
        initialZoom = screenBound.size.height / self.backgroundImage.size.height;
    }

    float minimumZoom = screenBound.size.width / self.backgroundImage.size.width;
    if (self.backgroundImage.size.height * initialZoom > screenBound.size.height) {
        initialZoom = screenBound.size.height / self.backgroundImage.size.height;
    }
    
//    if (initialZoom < 0.25) initialZoom = 0.25;
    
    offset.x = - (screenBound.size.width / 2 - self.backgroundImage.size.width * initialZoom / 2);
    offset.y = - (screenBound.size.height / 2 - self.backgroundImage.size.height * initialZoom / 2);
    
    self.minimumZoomScale = minimumZoom;
    self.maximumZoomScale = 1.5;
    self.initialZoomScale = initialZoom;
    self.contentOffset = offset;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        edges                            = [[NSMutableArray alloc] init];
        vertices                         = [[NSMutableArray alloc] init];
        lines                            = [[NSMutableArray alloc] init];
        stationsWithoutTransfer          = [[NSMutableArray alloc] init];
        drawLinesOrder                   = [[NSMutableArray alloc] init];
        additionalEnglishTextPrimitives  = [[NSMutableArray alloc] init];
        additionalUnderMapPrimitives     = [[NSMutableArray alloc] init];
        additionalOverMapPrimitives      = [[NSMutableArray alloc] init];
        middleSpeed = 41;
        switchTime = 4;
        englishTextDrawn = true;
    }
    return self;
}

- (BOOL)englishTextExists
{
    MWStation *station = [[MWStation alloc] init];
    
    if (additionalEnglishTextPrimitives.count)
        return true;
    
    for (MWEdge *edge in edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:station.class]) {
                station = (MWStation *)element;
                if (station.nameEnglishTextPrimitives.count)
                    return true;
            }
        }
    }
    return false;
}

- (CGRect)extendFrame:(CGRect)frame add:(float)add
{
    CGRect result = frame;
    if (add > 0) {
        result.origin.x -= add;
        result.origin.y -= add;
        result.size.height += add * 2;
        result.size.width += add * 2;
    }
    return result;
}

- (BOOL)checkConstains:(NSArray *)primitives coordinate:(CGPoint)coordinate
{
    MWDrawTextLine *drawTextLine = nil;
    BOOL result = false;
    CGRect frame;
    float add = 6; // Параметр, отвечающий на сколько пикселей расширить область тапа по надписи, обозначающий имя станции
    
    for (NSObject *primitive in primitives) {
        if ([primitive isKindOfClass:[MWDrawTextLine class]]) {
            drawTextLine = (MWDrawTextLine *)primitive;
            frame = add > 0 ? [self extendFrame:drawTextLine.frame add:add] : drawTextLine.frame;
            if (drawTextLine.radians == 0) {
                if (CGRectContainsPoint(frame, coordinate)) {
                    return true;
                }
            } else {
                // Поворачиваем исходную точку на тот же угол, что и текст
                float r = 2 * M_PI / 180 - drawTextLine.radians;
                float new_x = (coordinate.x - drawTextLine.origin.x) * cos(r) - (coordinate.y - drawTextLine.origin.y) * sin(r) + drawTextLine.origin.x;
                float new_y = (coordinate.x - drawTextLine.origin.x) * sin(r) + (coordinate.y - drawTextLine.origin.y) * cos(r) + drawTextLine.origin.y;
                
                // Проверяем, лежит ли точка в неповернутой версии текста
                if (CGRectContainsPoint([self extendFrame:drawTextLine.frame_not_rotated add:add], CGPointMake(new_x, new_y))) {
                    return true;
                }
            }
        }
    }
        return result;
}

// Находим ближайшую к координате станцию
- (MWStation *)selectedStation:(CGPoint)coordinate
{
    MWStation *station, *minStation;
    float distance;
    float minDistance = HUGE;
    
    for (MWEdge *edge in edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[MWStation class]]) {
                station = (MWStation *)element;

                if ([self checkConstains:station.nameOriginalTextPrimitives coordinate:coordinate]) return station;
                if ([self checkConstains:station.nameEnglishTextPrimitives coordinate:coordinate]) return station;

                distance = sqrt(powf(abs(coordinate.x - station.mapLocation.x), 2) + powf(abs(coordinate.y - station.mapLocation.y), 2));
                if ((distance < 60) && (distance < minDistance)) { // Здесь регулируем чувствительность нажатия
                    minDistance = distance;
                    minStation = station;
                }
                
            }
        }
    }
    return minStation;
}

- (MWStation *)stationByIdentifier:(NSString *)ident
{
    MWStation *station;
    for (MWEdge *edge in self.edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[MWStation class]]) {
                station = (MWStation *)element;
                if ([station.identifier isEqualToString:ident]) {
                    return station;
                }
            }
        }
    }
    return nil;
}

- (NSArray *)stations
{
    // Получаем станции
    NSMutableArray *stations = [[NSMutableArray alloc] init];
    MWStation *station;
    
    for (MWEdge *edge in edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[MWStation class]]) {
                station = (MWStation *)element;
                if (![stations containsObject:station]) {
                    [stations addObject:station];
                }
            }
        }
    }
    return stations;
}

- (NSArray *)lineStations:(MWLine *)line
{
    NSMutableArray *stations = [NSMutableArray array];
    for (MWEdge *edge in edges) {
        if ([edge.line isEqual:line]) {
            [stations addObjectsFromArray:edge.stations];
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

@end