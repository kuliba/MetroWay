//
//  MMLine.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 30.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWLine : NSObject <NSCoding>

// Идентификатор линии
@property (nonatomic, strong) NSString *identifier;
// Имя линии на оригинальном языке
@property (nonatomic, strong) NSString *nameOriginal;
// Имя линии на английском языке
@property (nonatomic, strong) NSString *nameEnglish;
// Цвет линии
@property (nonatomic, strong) UIColor *color;
// Тип линии - метро, автобус, троллейбус и пр...
@property (nonatomic) int type;
// Отображаются ли в списке станции?
@property BOOL collapsed;

@end
