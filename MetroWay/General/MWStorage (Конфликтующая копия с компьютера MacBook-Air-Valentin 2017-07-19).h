//
//  MMStorage.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 10.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWMetroMap.h"
#import "MWList.h"
#import "MWDownload.h"	
#import "MWRouteStorage.h"

@interface MWStorage : NSObject

+ (MWStorage *)storage;
+ (NSString *)documentDirectory;
+ (NSString *)cachesDirectory;
+ (void)deleteMetroMap:(NSString *)identifier;
+ (BOOL)saveMetro:(MWMetroMap *)metroMap;
// Функия, проверяющая необходимость перерисовки схемы метро, если установки английского языка программы не соответствуют нарисованной схеме
+ (BOOL)needChangeEnglishSet:(MWMetroMap *)metroMap;
// Перерисовка и сохранение новой схемы метро согласно установкам английского языка
+ (void)changeEnglishSet:(MWMetroMap *)metroMap;
+ (void)changeEnglishSet;
// Проверка необходимости обновления списка
- (void)checkListUpdate;
- (void)reloadCurrentMetroMap;
+ (MWMetroMap *)loadMetroMap:(NSString *)identifier;
+ (void)initForFirstRun;
+ (MWMetroMap *)currentMetroMap;
+ (MWList *)metroMapList;
+ (MWRouteStorage *)routeStorage;
+ (unsigned long long)metroMapSize:(NSString *)identifier;
+ (UIImage *)thumbnail:(NSString *)identifier;
+ (void)deleteThumbnail:(NSString *)identifier;

@end
