//
//  MMDrawArc.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 10.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWDrawArc : NSObject <NSCoding>

// Цвет линии
@property UIColor *color;
// Толщина линии
@property int width;
// Начальная точка линии
@property CGPoint center;
// Радиус
@property float radius;
// Начальный угол (радианы)
@property float startRadians;
// Начальный угол (градусы)
@property float startDegrees;
// Конечный угол (радианы)
@property float endRadians;
// Конечный угол (градусы)
@property float endDegrees;
// Приблизительная(!) область, занимаемая дугой
@property (readonly) CGRect frame;

@end
