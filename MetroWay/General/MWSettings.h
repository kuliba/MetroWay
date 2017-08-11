//
//  MMSettings.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 20.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MWSortingTypeByTripTime,
    MWSortingTypeByTransfers,
    MWSortingTypeByLength
} MWSortingType;

typedef enum {
    MWInterfaceLanguageAutomatic,
    MWInterfaceLanguageEnglish,
    MWInterfaceLanguageRussian
} MWInterfaceLanguage;

@interface MWSettings : NSObject

+ (MWSettings *)settings;

// Идентификатор текущей схемы метро
@property (nonatomic, strong) NSString *currentMetroMapIdentifier;
// Тип сортировки маршрутов
@property (nonatomic) MWSortingType sortingType;
// Необходимость отрисовки английских названий станций метро около оригинальных и другого текста
@property (nonatomic) BOOL showEnglishTitles;
// Язык приложения
@property (nonatomic) MWInterfaceLanguage interfaceLanguage;
// Автоматическое обновление схем метро
@property (nonatomic) BOOL automaticUpdates;
// Счетчик запуска программы
@property (nonatomic) int runCount;
// Показ всех схем метро или только моих
@property (nonatomic) BOOL showAllMapsInList;
// Показываем ли рекламу
@property (nonatomic) BOOL areAdsRemoved;
// Показываем ли проводник до выбранное станции метро
@property (nonatomic) BOOL showSelectedStationExplorer;

- (void)initialize;
- (void)resetSettings;

@end
