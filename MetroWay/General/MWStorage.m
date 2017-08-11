//
//  MMStorage.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 10.12.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWStorage.h"
#import "MWMetroMap.h"
#import "MWSettings.h"
#import "MWDraw.h"

@implementation MWStorage

+ (MWStorage *)storage
{
    // Реализуем синглетон
    static MWStorage *storage = nil;
    if (!storage) {
        storage = [[super allocWithZone:nil] init];
    }
    return storage;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    // Реализуем синглетон
    return [self storage];
}

- (id)init
{
    self = [super init];
    return self;
}

+ (NSString *)documentDirectory
{
    // Получаем путь к каталогу Documents
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // Получение из списка только каталога документов
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return documentDirectory;
}

+ (NSString *)cachesDirectory
{
    // Получаем путь к каталогу Cashe. Там мы будем хранить все схемы
    NSArray *cachesDirectories = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    // Получение из списка только каталога документов
    NSString *cachesDirectory = [cachesDirectories objectAtIndex:0];
    return cachesDirectory;
}

- (void)reloadCurrentMetroMap
{
    currentMetroMapStatic = nil;
}

+ (BOOL)needChangeEnglishSet:(MWMetroMap *)metroMap
{
    return [MWSettings settings].showEnglishTitles != metroMap.englishTextDrawn;
}

+ (void)changeEnglishSet
{
    MWMetroMap *metroMap = [MWStorage currentMetroMap];
    NSString *startStationIdentifier = metroMap.startStation.identifier;
    NSString *finishStationIdentifier = metroMap.finishStation.identifier;
    [MWStorage changeEnglishSet:metroMap];
    if (![metroMap.startStation.identifier isEqualToString:startStationIdentifier]) {
        metroMap.startStation = [metroMap stationByIdentifier:startStationIdentifier];
    }
    if (![metroMap.finishStation.identifier isEqualToString:finishStationIdentifier]) {
        metroMap.finishStation = [metroMap stationByIdentifier:finishStationIdentifier];
    }
}

+ (void)changeEnglishSet:(MWMetroMap *)metroMap
{
    metroMap.image = [MWDraw createMetroMapImage:metroMap];
    [MWStorage saveMetro:metroMap];
}

+ (BOOL)saveMetro:(MWMetroMap *)metroMap
{
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    // Получаем имя файла
    NSString *identifier = metroMap.identifier;
    
    // Добавляем расширение
    NSString *fileName = [identifier stringByAppendingPathExtension:@"mm"];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    //NSLog(@"Записываем схему метро %@ по следующему пути: %@", metroMap.identifier, path);
    
    // Записываем файл со схемой
    return [NSKeyedArchiver archiveRootObject:metroMap toFile:path];
}

+ (MWMetroMap *)loadMetroMap:(NSString *)identifier
{
    MWMetroMap *mm = nil;

    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    // Добавляем расширение
    NSString *fileName = [identifier stringByAppendingPathExtension:@"mm"];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    
    bool fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    
    if (fileExists) {
        @try {
            mm = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        }
        @catch (NSException *exception) {
            // Схема не загружена. Делаем ее недоступной
            MWList *list = [[MWList alloc] init];
            [list setUnavailable:identifier];
            // Если метро было текущим, то удаляем его из текущих
            if ([[MWSettings settings].currentMetroMapIdentifier isEqualToString:identifier]) {
                [MWSettings settings].currentMetroMapIdentifier = @"";
            }
        }
        @finally {
            //
        }
    } else {
        // Схема не найдена на устройстве. Делаем ее недоступной
        MWList *list = [[MWList alloc] init];
        [list setUnavailable:identifier];
        // Если метро было текущим, то удаляем его из текущих
        if ([[MWSettings settings].currentMetroMapIdentifier isEqualToString:identifier]) {
            [MWSettings settings].currentMetroMapIdentifier = @"";
        }
    }
    
    return mm;
}

+ (BOOL)metroMapExists:(NSString *)identifier
{
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    // Добавляем расширение
    NSString *fileName = [identifier stringByAppendingPathExtension:@"mm"];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    
    bool fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    
    return fileExists;
}

+ (MWMetroMap *)loadCurrentMetroMap
{
    MWMetroMap *metroMap = nil;
    if ([MWSettings settings].currentMetroMapIdentifier.length) {
        metroMap = [MWStorage loadMetroMap:[MWSettings settings].currentMetroMapIdentifier];
    }
    return metroMap;
}

static MWMetroMap *currentMetroMapStatic = nil; // Текущая схема метро

+ (MWMetroMap *)currentMetroMap
{
    if (!currentMetroMapStatic) {
        currentMetroMapStatic = [MWStorage loadCurrentMetroMap];
    }

    if (![currentMetroMapStatic.identifier isEqualToString:[MWSettings settings].currentMetroMapIdentifier]) {
        currentMetroMapStatic = [MWStorage loadCurrentMetroMap];
    }
    
    return currentMetroMapStatic;
}

+ (MWList *)metroMapList
{
    static MWList *result;
    
    if (result)
        return result;
        
    result = [[MWList alloc] init];
    
    // Возврат успеха или сбоя
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    // Получаем имя файла
    NSString *fileName = @"list";
    
    // Добавляем расширение
    NSString *fileExt = [fileName stringByAppendingPathExtension:@"data"];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileExt];
    
    bool fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    
//    NSLog(@"%@", path);
    
    if (!fileExists) {
        [result createNewList];
    } else {
        // Считываем файл со списком
        result = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        // NSLog(@"Считали список: %@, схем: %d", path, result.items.count);
        if (!result.items.count)
            [result createNewList];
    }
    
    [result checkVersionsOnDevice];
    
    return result;
}

+ (MWRouteStorage *)routeStorage
{
    static MWRouteStorage *result;
    
    if (result)
        return result;
    
    result = [[MWRouteStorage alloc] init];
    
    // Возврат успеха или сбоя
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    // Получаем имя файла
    NSString *fileName = @"route_storage";
    
    // Добавляем расширение
    NSString *fileExt = [fileName stringByAppendingPathExtension:@"data"];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileExt];
    
    bool fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    
    if (fileExists) {
        // Считываем файл
        result = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    return result;
}

- (void)checkListUpdate
{
    // Выполняем код один раз за все время сессии
    
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        if ([MWStorage metroMapList].isNeedUpdate) {
            [MWDownload updateList];
//            [NSThread detachNewThreadSelector:@selector(updateList) toTarget:self withObject:nil];
        }
    });
}

- (void)updateList
{
    @try {
        [MWDownload updateList];
    }
    @catch (NSException *exception) {
        //
    }
    @finally {
        //
    }
}

+ (void)deleteMetroMap:(NSString *)identifier
{
    // Добавляем расширение
    NSString *fileExt = [identifier stringByAppendingPathExtension:@"mm"];
    
    // Получаем полный путь
    NSString *path = [self.cachesDirectory stringByAppendingPathComponent:fileExt];
    
    [[NSFileManager defaultManager] removeItemAtPath:path error: nil];
}

+ (void) initForFirstRun
{
    NSArray *metroMapArray = [[NSBundle mainBundle] pathsForResourcesOfType:@".mm" inDirectory:@"Metro Maps For Bundle/."];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cashDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path;
    NSError *err = nil;
    NSURL *cashDirURL;
    
    for (NSString *metroMapBundlePath in metroMapArray) {
        path = [cashDir stringByAppendingPathComponent:[metroMapBundlePath lastPathComponent]];
        cashDirURL = [NSURL fileURLWithPath:path];
        [fileManager copyItemAtURL:[NSURL fileURLWithPath:metroMapBundlePath] toURL:cashDirURL error: nil];
    }
    
    fileManager = nil;
    cashDir = nil;
    path = nil;
    err = nil;
    cashDirURL = nil;
}

+ (unsigned long long)metroMapSize:(NSString *)identifier
{
    // Добавляем расширение
    NSString *fileExt = [identifier stringByAppendingPathExtension:@"mm"];
    
    // Получаем полный путь
    NSString *path = [self.cachesDirectory stringByAppendingPathComponent:fileExt];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
//        NSLog(@"%@: для подсчета размера схемы ее необходимо создать", identifier);
    }
    
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:NULL];
    
    return attributes.fileSize;
}

+ (UIImage *)thumbnail:(NSString *)identifier
{
    UIImage *thumbnailImage = nil;
    
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    NSString *fileName = [NSString stringWithFormat:@"%@_thumbnail.jpg", identifier];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    
    bool fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];

    if (fileExists) {
        thumbnailImage = [UIImage imageWithContentsOfFile:path];
    }
    
    return thumbnailImage;
}

+ (void)deleteThumbnail:(NSString *)identifier
{
    NSString *fileName = [NSString stringWithFormat:@"%@_thumbnail.jpg", identifier];

    NSString *cachesDirectory = [MWStorage cachesDirectory];

    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    
    [[NSFileManager defaultManager] removeItemAtPath:path error: nil];
}

@end