//
//  MMHaul.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWHaul : NSObject <NSCoding>

// Идентификатор
@property (nonatomic) NSString *identifier;
// длина перегона в метрах
@property (nonatomic) int length;
// Массив примитивов для рисования перегона
@property (nonatomic) NSMutableArray *drawPrimitives;
// Отображаем ли перегон на карте
@property BOOL showOnMap;

@end
