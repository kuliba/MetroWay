//
//  MMListItem.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>

@interface MWListItem : NSObject <NSCoding>

// целочисленный номер версии схемы последней схемы, имеющейся на сайте. Нумерация начинается от единицы
@property (nonatomic) int versionNumberOnSite;
// целочисленный номер версии схемы схемы, имеющейся на устройстве
@property (nonatomic) int versionNumberOnDevice;
// дата создания версии схемы
@property (nonatomic, strong) NSDate *versionDate;
// Дата создание в текстовом виде. Не сохраняется
@property (nonatomic, strong) NSString *versionDateText;
// уникальный идентификатор схемы метро
// Используется в качестве имени файла схемы, идентификатора элемента списка схем и для поиска схемы
// Первым словом всегда идет город. На втором месте - имя метро. Пример: "moscow_metro"
@property (nonatomic, strong) NSString *identifier;
// Координата местности, где располагается метро
@property (nonatomic) CGPoint geoLocation;
// Страна на английском языке
@property (nonatomic, strong) NSString *countryNameEnglish;
// Город на английском языке
@property (nonatomic, strong) NSString *cityNameEnglish;
// Название схемы метро на английском языке. Необязательный параметр, если схема в городе одна. Пример: "U-Bahn"
@property (nonatomic, strong) NSString *metroMapNameEnglish;
// Количество линий
@property (nonatomic) int linesCount;
// Количество станций
@property (nonatomic) int stationsCount;
// Протяженность линий в километрах
@property (nonatomic) int length;
// URL, по которому необходимо проверять необходимость обновления схемы
@property (nonatomic, strong) NSString *checkURL;
// Расстояние до текущей локации в метрах
@property (nonatomic) float distance;
// Проверка доступности новой версии
@property (nonatomic, readonly) BOOL isNewVersionAvailable;
// Схема метро в избранных?
@property (nonatomic) BOOL favorited;
// Размер файла с байтах
@property (nonatomic) unsigned long long size;
// Размера файла в текстовом виде. Не сохраняется
@property (nonatomic) NSString *sizeText;

// Отображение ячейки при показе в списке метро: 0 - свернута, 1 - развернута нижняя панель, 2 - развернуты кнопки при свайпе
@property int showStatus;
// Задача по загрузке схемы метро
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
// Сколько загружено? От 0 до 1
@property (nonatomic) float downloadProgress;

// Локализация
// Страна на русском языке
@property (nonatomic, strong) NSString *countryNameRussian;
// Город на русском языке
@property (nonatomic, strong) NSString *cityNameRussian;
// Название схемы метро на русском языке
@property (nonatomic, strong) NSString *metroMapNameRussian;

// Проверка возможности удаления схемы метро
- (BOOL)isDeleteEnabled;

- (void)setSizeText;
- (void)setVersionDateText;

@end