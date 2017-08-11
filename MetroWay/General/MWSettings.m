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

@synthesize currentMetroMapIdentifier, sortingType, showEnglishTitles, interfaceLanguage, automaticUpdates, runCount, showAllMapsInList, areAdsRemoved;

- (void)initialize
{
    // Задаем настройки по-умолчанию
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    
    NSString *test = [userDefaults objectForKey:@"isFirstRun"];
   // NSLog(@"%@, %d", test, (int)test.length);
    if (!(test.length)) {
        // Идентификатор текущей схемы метро
        [userDefaults setObject:@"" forKey:@"currentMetroMapIdentifier"];
        // Тип сортировки маршрутов
        [userDefaults setInteger:0 forKey:@"sortingType"]; // Сортировка по-умолчанию по длительности маршрута
        // Необходимость отрисовки английских названий станций метро около оригинальных и другого текста
        [userDefaults setBool:YES forKey:@"showEnglishTitles"];
        // Язык приложения
        [userDefaults setInteger:0 forKey:@"interfaceLanguage"];
        // Автоматическое обновление схем метро
        [userDefaults setInteger:1 forKey:@"automaticUpdates"];
        // Счетчик запуска приложения
        [userDefaults setInteger:1 forKey:@"runCount"];
        // Показ всех схем метро или только моих
        [userDefaults setBool:YES forKey:@"showAllMapsInList"];
        // Показываем ли рекламу
        [userDefaults setBool:NO forKey:@"areAdsRemoved"];
        // Показываем ли проводник до выбранной станции метро
        [userDefaults setBool:YES forKey:@"showSelectedStationExplorer"];
        
        // Пишем тестовый параметр для проверки
        [userDefaults setObject:@"isFirstRun" forKey:@"isFirstRun"];
            
        [userDefaults synchronize];
        
        [MWStorage initForFirstRun];
    } else {
        [self incRunCount];
    }
}

+ (MWSettings *)settings
{
    // Реализуем синглетон
    static MWSettings *settings = nil;
    if (!settings) {
        settings = [[super allocWithZone:nil] init];
        [settings initialize];
    }
    return settings;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self settings];
}

- (void)resetSettings
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];

    [userDefaults setObject:@"" forKey:@"test"];
    [userDefaults synchronize];
    [self initialize];
}

- (void)setCurrentMetroMapIdentifier:(NSString *)identifier
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];

    [userDefaults setObject:identifier forKey:@"currentMetroMapIdentifier"];
    [userDefaults synchronize];
}

- (NSString *)currentMetroMapIdentifier
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    
    return [userDefaults stringForKey:@"currentMetroMapIdentifier"];
}

- (void)setSortingType:(MWSortingType)st
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    
    [userDefaults setInteger:st forKey:@"sortingType"];
    [userDefaults synchronize];
}

- (MWSortingType)sortingType
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];

    return (MWSortingType)[userDefaults integerForKey:@"sortingType"];
}

- (void)setShowEnglishTitles:(BOOL)set
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    [userDefaults setBool:set forKey:@"showEnglishTitles"];
    [userDefaults synchronize];
}

- (BOOL)showEnglishTitles
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    return [userDefaults boolForKey:@"showEnglishTitles"];
}

- (void)setInterfaceLanguage:(MWInterfaceLanguage)il
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    [userDefaults setInteger:il forKey:@"interfaceLanguage"];
    [userDefaults synchronize];
}

- (MWInterfaceLanguage)interfaceLanguage
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    return (MWInterfaceLanguage)[userDefaults integerForKey:@"interfaceLanguage"];
}

- (void)setAutomaticUpdates:(BOOL)au
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    [userDefaults setBool:au forKey:@"automaticUpdates"];
    [userDefaults synchronize];
}

- (BOOL)automaticUpdates
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    return [userDefaults boolForKey:@"automaticUpdates"];
}

- (void)setRunCount:(int)rc
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    [userDefaults setInteger:rc forKey:@"runCount"];
    [userDefaults synchronize];
}

- (int)runCount
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    return (int)[userDefaults integerForKey:@"runCount"];
}

- (void)incRunCount
{
    int rc = [self runCount];
    rc++;
    [self setRunCount:rc];
}

- (void)setShowAllMapsInList:(BOOL)samil
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    [userDefaults setBool:samil forKey:@"showAllMapsInList"];
    [userDefaults synchronize];
}

- (BOOL)showAllMapsInList
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    return [userDefaults boolForKey:@"showAllMapsInList"];
}

- (void)setAreAdsRemoved:(BOOL)aar
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    [userDefaults setBool:aar forKey:@"areAdsRemoved"];
    [userDefaults synchronize];
}

- (BOOL)areAdsRemoved
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    return [userDefaults boolForKey:@"areAdsRemoved"];
}

- (void)setShowSelectedStationExplorer:(BOOL)value
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    [userDefaults setBool:value forKey:@"showSelectedStationExplorer"];
    [userDefaults synchronize];
}

- (BOOL)showSelectedStationExplorer
{
    NSUserDefaults *userDefaults = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"org.clickwood.MetroWay.id"];
    if ([userDefaults objectForKey:@"showSelectedStationExplorer"]) {
        return [userDefaults boolForKey:@"showSelectedStationExplorer"];
    } else return true;
}

@end
