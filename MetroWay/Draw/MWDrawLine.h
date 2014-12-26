//
//  MMDrawLine.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 09.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>

@interface MWDrawLine : NSObject <NSCoding>

// Цвет линии
@property UIColor *color;
// Толщина линии
@property int width;
// Начальная точка линии
@property CGPoint startPoint;
// Конечная точка линии
@property CGPoint endPoint;
// Приблизительная(!) область, занимаемая линией
@property (readonly) CGRect frame;

@end
