//
//  MMDrawFillCircle.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 03.01.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>

@interface MWDrawFillCircle : NSObject <NSCoding>

// Центр круга
@property CGPoint center;
// Радиус
@property double radius;
// Цвет заливки
@property UIColor *fillColor;
// Приблизительная(!) область, занимаемая фигурой
@property (readonly) CGRect frame;

@end
