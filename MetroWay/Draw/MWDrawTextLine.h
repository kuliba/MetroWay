//
//  MMDrawTextLine.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 12.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>

@interface MWDrawTextLine : NSObject <NSCoding>

// Текст
@property NSString *text;
// Шрифт
@property NSString *fontName;
// Размер шрифта
@property int fontSize;
// Цвет шрифта
@property UIColor *fontColor;
// Расстояние между символами (учитывается, если не ноль)
@property float kernSpacing;
// Точка, где должен располагаться левый верхний угол
@property CGPoint origin;
// Угол, на который следует повернуть текст (радианы)
@property float radians;
// Угол, на который следует повернуть текст (градусы)
@property float degrees;
// Область, занимаемая фигурой
@property (readonly) CGRect frame;
@property (readonly) CGRect frame_not_rotated;

@end
