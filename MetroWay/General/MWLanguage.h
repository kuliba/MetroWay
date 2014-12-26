//
//  MMLanguage.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 05.04.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

// Для добавления нового языка нужно:
// 1. Добавить его в проекте
// 2. Перевести файл с ресурсами
// 3. Добавить для нового языка и перевести параметры countryName..., cityName... и metroMapName... для каждого объекта MMListIndex

#import <Foundation/Foundation.h>
#import "MWListItem.h"

@interface MWLanguage : NSObject

+ (NSString *)localizedStringForKey:(NSString *)key;
+ (NSString *)localizedMetroMapName:(MWListItem *)listItem;
+ (NSString *)localizedCity:(MWListItem *)listItem;
+ (NSString *)localizedCountry:(MWListItem *)listItem;
+ (NSString *)localizedCityNameFieldName;
+ (NSString *)LocalizedCurrentMetroMapName:(MWListItem *)listItem;

@end
