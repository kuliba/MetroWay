//
//  MMDrawGradientRect.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 02.01.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>
@interface MWDrawGradientRect : NSObject <NSCoding>

// Координаты прямоугольника
@property CGPoint point1, point2, point3, point4;
// Начальная точка заливки
@property CGPoint startPoint;
// Конечная точка заливки
@property CGPoint endPoint;
// Начальный цвет заливки
@property UIColor *startColor;
// Конечный цвет заливки
@property UIColor *endColor;
// Приблизительная(!) область, занимаемая фигурой
@property (readonly) CGRect frame;

@end
