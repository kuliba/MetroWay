//
//  MMDrawGradientArc.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 04.01.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MWDrawGradientArc : NSObject

// Начальный цвет линии
@property UIColor *startColor;
// Конечный цвет линии
@property UIColor *endColor;
// Толщина линии
@property int width;
// Центр дуги
@property CGPoint center;
// Начальная точка градиентной заливки
@property CGPoint startGradient;
// Конечная точка градиентной заливки
@property CGPoint endGradient;
// Радиус
@property float radius;
// Начальный угол (радианы)
@property float startRadians;
// Конечный угол (радианы)
@property float endRadians;
// Приблизительная(!) область, занимаемая фигурой
@property (readonly) CGRect frame;

@end
