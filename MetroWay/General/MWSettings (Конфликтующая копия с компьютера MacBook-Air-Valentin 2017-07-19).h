//
//  MMSettings.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 20.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWSettings : NSObject

@property NSString *currentMetroMapIdentifier;

// Идентификатор текущей схемы метро
+ (void)setCurrentMetroMapIdentifier:(NSString *)identifier;
+ (NSString *)currentMetroMapIdentifier;
// Тип сортировки маршрутов (по времени маршрута (по умолчанию) - 0, по количеству пересадок - 1)
+ (void)setSortingType:(int)sortingType;
+ (int)sortingType;
// Необходимость отрисовки английских названий станций метро около оригинальных и другого текста
+ (void)setShowEnglishTitles:(BOOL)showEnglishTitles;
+ (BOOL)showEnglishTitles;
// Язык приложения: 0 - Automatic, 1 - английский, 2 - русский
+ (void)setLanguage:(int)language;
+ (int)language;
// Автоматическое обновление схем метро
+ (void)setAutomaticUpdates:(BOOL)automaticUpdates;
+ (BOOL)automaticUpdates;
// Счетчик запуска программы
+ (int)runCount;
// Показ всех схем метро или только моих
+ (void)setShowAllMapsInList:(BOOL)showAllMapsInList;
+ (BOOL)showAllMapsInList;

+ (void)initialize;
+ (void)resetSettings;

@end
