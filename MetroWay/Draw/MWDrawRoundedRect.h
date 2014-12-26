//
//  MMDrawRoundedRect.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 05.03.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MWDrawRoundedRect : NSObject <NSCoding>

// Координаты прямоугольника
@property CGRect rect;
// Радиус углов
@property float cornerRadius;
// Цвет прямоугольника
@property UIColor *color;
// Приблизительная(!) область, занимаемая фигурой
@property (readonly) CGRect frame;

@end
