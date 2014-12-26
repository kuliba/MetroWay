//
//  MMSettings.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 20.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWSettings.h"
#import "MWRouter.h"
#import "MWStorage.h"

@implementation MWSettings

+ (void)initialize
{
    // Задаем настройки по-умолчанию
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *test = [userDefaults objectForKey:@"isFirstRun"];
    if (![test length]) {
        // Идентификатор текущей схемы метро
        [userDefaults setObject:@"" forKey:@"currentMetroMapIdentifier"];
        // Тип сортировки маршрутов
        [userDefaults setInteger:0 forKey:@"sortingType"]; // Сортировка по-умолчанию по длительности маршрута
        // Необходимость отрисовки английских названий станций метро около оригинальных и другого текста
        [userDefaults setBool:YES forKey:@"showEnglishTitles"];
        // Язык приложения
        [userDefaults setInteger:0 forKey:@"language"];
        // Автоматическое обновление схем метро
        [userDefaults setInteger:1 forKey:@"automaticUpdates"];
        // Счетчик запуска приложения
        [userDefaults setInteger:1 forKey:@"runCount"];
        // Показ всех схем метро или только моих
        [userDefaults setBool:YES forKey:@"showAllMapsInList"];
        
        // Пишем тестовый параметр для проверки
        [userDefaults setObject:@"isFirstRun" forKey:@"isFirstRun"];
            
        [userDefaults synchronize];
        
        [MWStorage initForFirstRun];
    } else {
        [self incRunCount];
    }
}

+ (void)resetSettings
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"" forKey:@"test"];
    [userDefaults synchronize];
    [self initialize];
}

+ (void)setCurrentMetroMapIdentifier:(NSString *)identifier
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:identifier forKey:@"currentMetroMapIdentifier"];
    [userDefaults synchronize];
}

+ (NSString *)currentMetroMapIdentifier
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:@"currentMetroMapIdentifier"];
}

+ (void)setSortingType:(int)sortingType
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:sortingType forKey:@"sortingType"];
    [userDefaults synchronize];
}

+ (int)sortingType
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return (int)[userDefaults integerForKey:@"sortingType"];
}

+ (void)setShowEnglishTitles:(BOOL)showEnglishTitles
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:showEnglishTitles forKey:@"showEnglishTitles"];
    [userDefaults synchronize];
}

+ (BOOL)showEnglishTitles
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:@"showEnglishTitles"];
}

+ (void)setLanguage:(int)language
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:language forKey:@"language"];
    [userDefaults synchronize];
}

+ (int)language
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return (int)[userDefaults integerForKey:@"language"];
}

+ (void)setAutomaticUpdates:(BOOL)automaticUpdates
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:automaticUpdates forKey:@"automaticUpdates"];
    [userDefaults synchronize];
}

+ (BOOL)automaticUpdates
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:@"automaticUpdates"];
}

+ (void)setRunCount:(int)runCount
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:runCount forKey:@"runCount"];
    [userDefaults synchronize];
}

+ (int)runCount
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return (int)[userDefaults integerForKey:@"runCount"];
}

+ (void)incRunCount
{
    int runCount = [self runCount];
    runCount++;
    [self setRunCount:runCount];
}

+ (void)setShowAllMapsInList:(BOOL)showAllMapsInList
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:showAllMapsInList forKey:@"showAllMapsInList"];
    [userDefaults synchronize];
}

+ (BOOL)showAllMapsInList
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:@"showAllMapsInList"];
}

@end
