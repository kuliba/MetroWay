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
#import "MWTransfer.h"

@implementation MWMetroMap

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identifier forKey:@"identifier"];
    [aCoder encodeObject:UIImagePNGRepresentation(_image) forKey:@"image"];
    [aCoder encodeObject:UIImagePNGRepresentation(_backgroundImage) forKey:@"backgroundImage"];
    [aCoder encodeBool:_englishTextDrawn forKey:@"englishTextDrawn"];
    [aCoder encodeObject:_edges forKey:@"edges"];
    [aCoder encodeObject:_vertices forKey:@"vertices"];
    [aCoder encodeObject:_lines forKey:@"lines"];
    [aCoder encodeObject:_stationsWithoutTransfer forKey:@"stationsWithoutTransfer"];
    [aCoder encodeObject:_transfers forKey:@"transfers"];
    [aCoder encodeInt:_middleSpeed forKey:@"middleSpeed"];
    [aCoder encodeObject:_drawLinesOrder forKey:@"drawLinesOreder"];
    [aCoder encodeObject:_additionalEnglishTextPrimitives forKey:@"additionalEnglishTextPrimitives"];
    [aCoder encodeObject:_additionalUnderMapPrimitives forKey:@"additionalUnderMapPrimitives"];
    [aCoder encodeObject:_additionalOverMapPrimitives forKey:@"additionalOverMapPrimitives"];
    [aCoder encodeFloat:_minimumZoomScale forKey:@"minimumZoomScale"];
    [aCoder encodeFloat:_maximumZoomScale forKey:@"maximumZoomScale"];
    [aCoder encodeFloat:_initialZoomScale forKey:@"initialZoomScale"];
    [aCoder encodeCGPoint:_contentOffset forKey:@"contentOffset"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init]; 
    if (self) {
        _backgroundImage = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"backgroundImage"]];
        _image = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"image"]];
        
        if (_backgroundImage) {
            [self setDefaultConstrains];
        }
        
        float tempFloat = [aDecoder decodeFloatForKey:@"minimumZoomScale"];
        if (tempFloat > 0) {
            _minimumZoomScale = tempFloat;
        }
        
        tempFloat = [aDecoder decodeFloatForKey:@"maximumZoomScale"];
        if (tempFloat > 0) {
            _maximumZoomScale = tempFloat;
        }

        tempFloat = [aDecoder decodeFloatForKey:@"initialZoomScale"];
        if (tempFloat > 0) {
            _initialZoomScale = tempFloat;
        }

        CGPoint tempPoint = [aDecoder decodeCGPointForKey:@"contentOffset"];
        if (fabs(tempPoint.x) + fabs(tempPoint.y) > 1) {
            _contentOffset = tempPoint;
        }
        
        _identifier = [aDecoder decodeObjectForKey:@"identifier"];
        _englishTextDrawn = [aDecoder decodeBoolForKey:@"englishTextDrawn"];
        _middleSpeed = [aDecoder decodeIntForKey:@"middleSpeed"];
        _edges = [aDecoder decodeObjectForKey:@"edges"];
        if (!_edges)
            _edges = [NSMutableArray array];
        
        _vertices = [aDecoder decodeObjectForKey:@"vertices"];
        if (!_vertices)
            _vertices = [NSMutableArray array];
        
        _lines = [aDecoder decodeObjectForKey:@"lines"];
        if (!_lines) {
            _lines = [NSMutableArray array];
        }
        
        _stationsWithoutTransfer = [aDecoder decodeObjectForKey:@"stationsWithoutTransfer"];
        if (!_stationsWithoutTransfer) {
            _stationsWithoutTransfer = [NSMutableArray array];
        }
        
        _transfers = [aDecoder decodeObjectForKey:@"transfers"];
        if (!_transfers) {
            _transfers = [NSMutableArray array];
        }
        
        _drawLinesOrder = [aDecoder decodeObjectForKey:@"drawLinesOrder"];
        if (!_drawLinesOrder) {
            _drawLinesOrder = [NSMutableArray array];
        }

        _additionalEnglishTextPrimitives = [aDecoder decodeObjectForKey:@"additionalEnglishTextPrimitives"];
        if (!_additionalEnglishTextPrimitives) {
            _additionalEnglishTextPrimitives = [NSMutableArray array];
        }
        
        _additionalUnderMapPrimitives = [aDecoder decodeObjectForKey:@"additionalUnderMapPrimitives"];
        if (!_additionalUnderMapPrimitives) {
            _additionalUnderMapPrimitives = [NSMutableArray array];
        }

        _additionalOverMapPrimitives = [aDecoder decodeObjectForKey:@"additionalOverMapPrimitives"];
        if (!_additionalOverMapPrimitives) {
            _additionalOverMapPrimitives = [NSMutableArray array];
        }
    }
    return self;
}

- (void)setDefaultConstrains
{
    CGPoint offset = CGPointZero;
    CGRect screenBound = [UIScreen mainScreen].bounds;
    screenBound.size.height -= 75;
    float initialZoom = screenBound.size.width / _backgroundImage.size.width;
    if (_backgroundImage.size.height * initialZoom < screenBound.size.height) {
        initialZoom = screenBound.size.height / _backgroundImage.size.height;
    }

    float minimumZoom = screenBound.size.width / _backgroundImage.size.width;
    if (_backgroundImage.size.height * initialZoom > screenBound.size.height) {
        initialZoom = screenBound.size.height / _backgroundImage.size.height;
    }
    
    offset.x = - (screenBound.size.width - _backgroundImage.size.width * initialZoom) / 2;
    offset.y = - (screenBound.size.height - _backgroundImage.size.height * initialZoom) / 2;
    
    _minimumZoomScale = minimumZoom;
    _maximumZoomScale = 1.2;
    _initialZoomScale = initialZoom;
    _contentOffset = offset;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        _edges                           = [NSMutableArray array];
        _vertices                        = [NSMutableArray array];
        _lines                           = [NSMutableArray array];
        _stationsWithoutTransfer         = [NSMutableArray array];
        _transfers                       = [NSMutableArray array];
        _drawLinesOrder                  = [NSMutableArray array];
        _additionalEnglishTextPrimitives = [NSMutableArray array];
        _additionalUnderMapPrimitives    = [NSMutableArray array];
        _additionalOverMapPrimitives     = [NSMutableArray array];
        _middleSpeed = 41;
        _englishTextDrawn = true;
    }
    return self;
}

- (BOOL)englishTextExists
{
    MWStation *station = [[MWStation alloc] init];
    
    if (_additionalEnglishTextPrimitives.count)
        return true;
    
    for (MWEdge *edge in _edges) {
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
    
    for (MWEdge *edge in _edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[MWStation class]]) {
                station = (MWStation *)element;

                if ([self checkConstains:station.nameOriginalTextPrimitives coordinate:coordinate]) return station;
                if ([self checkConstains:station.nameEnglishTextPrimitives coordinate:coordinate]) return station;

                distance = sqrt(powf(fabs(coordinate.x - station.mapLocation.x), 2) + powf(fabs(coordinate.y - station.mapLocation.y), 2));
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
    for (MWEdge *edge in _edges) {
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
    
    for (MWEdge *edge in _edges) {
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
    for (MWEdge *edge in _edges) {
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

- (void)clearListLocations
{
    // Получаем станции
    MWStation *station;
    
    for (MWEdge *edge in _edges) {
        for (NSObject *element in edge.elements) {
            if ([element isKindOfClass:[MWStation class]]) {
                station = (MWStation *)element;
                station.listLocation = CGPointMake(-100, -100);
            }
        }
    }
}

- (float)transferTime:(NSString *)station1Identifier toStation:(NSString *)station2Identifier
{
    if (!station1Identifier || !station2Identifier) return 4;
    
    for (MWTransfer *transfer in _transfers) {
        if ([transfer.station1Identifier isEqualToString:station1Identifier] && [transfer.station2Identifier isEqualToString:station2Identifier]) {
            return transfer.time;
        }
        if (transfer.roundTrip && [transfer.station2Identifier isEqualToString:station1Identifier] && [transfer.station1Identifier isEqualToString:station2Identifier]) {
            return transfer.time;
        }
    }
    
    return 4;
}

@end
