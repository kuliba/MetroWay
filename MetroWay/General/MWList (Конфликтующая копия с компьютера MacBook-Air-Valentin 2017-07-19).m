//
//  MMList.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWList.h"
#import "MWListItem.h"
#import "MWStorage.h"
#import "MWSettings.h"
#import "MWLanguage.h"

@implementation MWList

@synthesize items, lastUpdate, currentCoordinate, countries, nearestMetro, newVersions, favoritesMetro;

static NSMutableArray *nm; // Nearest Metro
static NSMutableArray *nv; // New versions

- (id)init
{
    self = [super init];
    if (self) {
        items = [[NSMutableArray alloc] init];
        lastUpdate = [NSDate date];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:items forKey:@"items"];
    [aCoder encodeObject:lastUpdate forKey:@"lastUpdate"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setItems:[aDecoder decodeObjectForKey:@"items"]];
        if (!items) {
            items = [[NSMutableArray alloc] init];
        }
        [self setLastUpdate:[aDecoder decodeObjectForKey:@"lastUpdate"]];
        if (!lastUpdate) {
            lastUpdate = [NSDate date];
        }
    }
    return self;
}

- (NSArray *)favoritesMetro
{
    NSMutableArray *fm = [NSMutableArray array];
    for (MWListItem *listItem in items) {
        if (listItem.favorited) [fm addObject:listItem];
    }
    return (NSArray *)fm;
}

- (NSArray *)newVersions
{
    if (!nv) {
        nv = [[NSMutableArray alloc] init];
    }
    [nv removeAllObjects];
    for (MWListItem *listItem in items) {
        if (listItem.isNewVersionAvailable) {
            [nv addObject:listItem];
            // Удаляем превьюшку, чтобы обновить ее новой
            [MWStorage deleteThumbnail:listItem.identifier];
        }
    }
    return (NSArray *)nv;
}

- (void)save
{
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    // Получаем имя файла
    NSString *fileName = @"list";
    
    // Добавляем расширение
    NSString *fileExt = [fileName stringByAppendingPathExtension:@"data"];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileExt];
    
    // Записываем файл со списком
    [NSKeyedArchiver archiveRootObject:self toFile:path];
}

- (MWListItem *)itemByIdentifier:(NSString *)identifier
{
    MWListItem *item = nil;
    for (NSObject *it in self.items) {
        item = (MWListItem *)it;
        if ([item.identifier isEqual:identifier]) {
            return item;
        }
    }
    return nil;
}

- (MWListItem *)itemByName:(NSString *)name
{
    MWListItem *item = nil;
    for (NSObject *it in self.items) {
        item = (MWListItem *)it;
        if ([item.metroMapNameEnglish isEqual:name] || [item.metroMapNameRussian isEqual:name]) {
            return item;
        }
    }
    return nil;
}

- (void)setUnavailable:(NSString *)identifier
{
    MWListItem *item = [self itemByIdentifier:identifier];
    item.versionNumberOnDevice = 0;
    [self save];
}

// Сортировка схем по приближенности к текущему месторасположению (для массивов)
NSInteger metroMapsDistanceSort(id listItem1, id listItem2, void *context)
{
    MWListItem *li1 = (MWListItem *)listItem1;
    MWListItem *li2 = (MWListItem *)listItem2;
    
    if (li1.distance < li2.distance)
        return NSOrderedAscending;
    else if (li1.distance > li2.distance)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

- (void)addListItem:(MWListItem *)newListItem
{
    [self.items addObject:newListItem];
}

- (void)updateListItem:(MWListItem *)currentListItem withNew:(MWListItem *)newListItem
{
    currentListItem.versionNumberOnSite = newListItem.versionNumberOnSite;
    currentListItem.versionDate         = newListItem.versionDate;
    currentListItem.geoLocation         = newListItem.geoLocation;
    currentListItem.countryNameEnglish  = newListItem.countryNameEnglish;
    currentListItem.countryNameRussian  = newListItem.countryNameRussian;
    currentListItem.cityNameEnglish     = newListItem.cityNameEnglish;
    currentListItem.cityNameRussian     = newListItem.cityNameRussian;
    currentListItem.metroMapNameEnglish = newListItem.metroMapNameEnglish;
    currentListItem.metroMapNameRussian = newListItem.metroMapNameRussian;
    currentListItem.linesCount          = newListItem.linesCount;
    currentListItem.stationsCount       = newListItem.stationsCount;
    currentListItem.length              = newListItem.length;
    currentListItem.size                = newListItem.size;
    [currentListItem setSizeText];
    [currentListItem setVersionDateText];
}

- (void)removeItem:(NSString *)identifier
{
    [items removeObject:[self itemByIdentifier:identifier]];
}

- (void)checkVersionsOnDevice
{
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    NSString *fileName, *path;
    BOOL fileExists;
    
    for (MWListItem *listItem in self.items) {
        fileName = [NSString stringWithFormat:@"%@.mm", listItem.identifier];
        path = [cachesDirectory stringByAppendingPathComponent:fileName];
        fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
        if (fileExists && listItem.versionNumberOnDevice == 0) {
            listItem.versionNumberOnDevice = listItem.versionNumberOnSite;
        }
    }
    [self save];
}

- (void)updateList:(MWList *)newList
{
    MWListItem *foundListItem;
    
    for (MWListItem *listItem in newList.items) {
        foundListItem = [self itemByIdentifier:listItem.identifier];
        if (foundListItem) {
            // Элемент существует - обновляем описание
            [self updateListItem:foundListItem withNew:listItem];
        } else {
            // Новый элемент - добавляем в список
            [self addListItem:listItem];
        }
    }
    
    // Если есть удаленные элементы, удаляем их из основного списка
    for (MWListItem *listItem in items) {
        foundListItem = [newList itemByIdentifier:listItem.identifier];
        if (!foundListItem) {
            // Удаляем из списка
            [self removeItem:listItem.identifier];
            
            // Если удаляемый элемент был текущим, то текущий обнуляем
            if ([[MWSettings currentMetroMapIdentifier] isEqualToString:listItem.identifier])
                [MWSettings setCurrentMetroMapIdentifier:@""];
        }
    }
    
    lastUpdate = [NSDate date];
    countriesArray = nil;
    [self save];
}

- (NSArray *)nearestMetro
{
    return [nm sortedArrayUsingFunction:metroMapsDistanceSort context:nil];
}

static NSMutableArray *nm;

- (void)setCurrentCoordinate:(CLLocationCoordinate2D)_currentCoordinate
{
    currentCoordinate = _currentCoordinate;
    
    MWListItem *listItem;
    CLLocationDistance distance;
    CLLocationCoordinate2D metroMapCoordinate;

    if (!nm) {
        nm = [[NSMutableArray alloc] init];
    }
    [nm removeAllObjects];
    
    for (NSObject *element in items) {
        listItem = (MWListItem *)element;
        
        metroMapCoordinate.latitude = listItem.geoLocation.x;
        metroMapCoordinate.longitude = listItem.geoLocation.y;
        
        distance = [MWLocation geodesicDistance:_currentCoordinate toPoint:metroMapCoordinate];
        listItem.distance = distance;
        if (distance < 50000) {
            [nm addObject:listItem];
        }
    }
}

- (CLLocationCoordinate2D)currentCoordinate
{
    return currentCoordinate;
}

// Сортировка строк по алфавиту (для массивов)
NSInteger countiriesAlphabeticSort(id string1, id string2, void *context)
{
    return [string1 localizedCaseInsensitiveCompare:string2];
}

- (void)clearCountryArray;
{
    countriesArray = nil;
}

static NSMutableArray *countriesArray;
- (NSArray *)countries
{
    if (countriesArray) return countriesArray;
    
    countriesArray = [NSMutableArray array];
    BOOL found;
    NSString *countryName;
    
    for (MWListItem *listItem in items) {
        found = false;
        // Локализация
        countryName = [MWLanguage localizedCountry:listItem];
        for (NSObject *object in countriesArray) {
            if ([(NSString *)object isEqualToString:countryName]) {
                found = true;
                break;
            }
        }
        if (!found) {
            [countriesArray addObject:countryName];
        }
    }

    countriesArray = (NSMutableArray *)[countriesArray sortedArrayUsingFunction:countiriesAlphabeticSort context:nil];
    
    return countriesArray;
}

// Сортировка схем по алфавиту (для массивов)
NSInteger metroMapsAlphabeticSort(id listItem1, id listItem2, void *context)
{
    MWListItem *metroMap1 = (MWListItem *)listItem1;
    MWListItem *metroMap2 = (MWListItem *)listItem2;
    return [[MWLanguage localizedMetroMapName:metroMap1] localizedCaseInsensitiveCompare:[MWLanguage localizedMetroMapName:metroMap2]];
}

- (NSArray *)countryItems:(NSString *)country
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (MWListItem *listItem in items) {
        if ([[MWLanguage localizedCountry:listItem] isEqualToString:country]) {
            [result addObject:listItem];
        }
    }
    return [result sortedArrayUsingFunction:metroMapsAlphabeticSort context:nil];
}

- (NSArray *)metroMapNames
{
    NSMutableArray *mmi = [[NSMutableArray alloc] init];
    for (MWListItem *listItem in items) {
        [mmi addObject:[MWLanguage localizedMetroMapName:listItem]];
    }
    NSArray *result = [[NSArray alloc] initWithArray:mmi copyItems:YES];
    return result;
}

// Если прошло больше недели, то нужно обновлять список
- (BOOL)isNeedUpdate
{
    NSTimeInterval timeInterval;
    NSDate *current = [NSDate date];
    timeInterval = [current timeIntervalSinceDate:lastUpdate];
    NSInteger time = timeInterval;
    return time >= (60 * 60 * 24 * 7); // Неделя
}

- (void)clearShowStatus
{
    for (MWListItem *listItem in items) {
        listItem.showStatus = 0;
    }
}

- (void)createNewList
{
    [items removeAllObjects];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy HH:mm"];
    
    MWListItem *item0001 = [[MWListItem alloc] init];
    item0001.identifier = @"moscow_metro";
    item0001.versionNumberOnSite = 3;
    item0001.versionNumberOnDevice = 0;
    item0001.geoLocation = CGPointMake(55.751667, 37.617778);
    item0001.countryNameEnglish = @"Russia";
    item0001.countryNameRussian = @"Россия";
    item0001.cityNameEnglish = @"Moscow";
    item0001.cityNameRussian = @"Москва";
    item0001.metroMapNameEnglish = @"";
    item0001.metroMapNameRussian = @"";
    item0001.linesCount = 12;
    item0001.stationsCount = 195;
    item0001.length = 325;
    item0001.checkURL = @"https://ru.wikipedia.org/wiki/Московский_метрополитен";
    NSString *dateString = @"15.03.2015 13:05";
    NSDate *date = [dateFormatter dateFromString:dateString];
    item0001.versionDate = date;
    item0001.size = [MWStorage metroMapSize:item0001.identifier];
    [items addObject:item0001];
    
    MWListItem *item0002 = [[MWListItem alloc] init];
    item0002.identifier = @"belo_horizonte_metro"; // Медленная
    item0002.versionNumberOnSite = 1;
    item0002.versionNumberOnDevice = 0;
    item0002.geoLocation = CGPointMake(-19.816944, -43.955833);
    item0002.countryNameEnglish = @"Brazil";
    item0002.countryNameRussian = @"Бразилия";
    item0002.cityNameEnglish = @"Belo Horizonte";
    item0002.cityNameRussian = @"Белу-Оризонти";
    item0002.metroMapNameEnglish = @"";
    item0002.metroMapNameRussian = @"";
    item0002.linesCount = 1;
    item0002.stationsCount = 19;
    item0002.length = 28;
    item0002.checkURL = @"https://en.wikipedia.org/wiki/Belo_Horizonte_Metro";
    dateString = @"13.02.2014 15:20";
    date = [dateFormatter dateFromString:dateString];
    item0002.versionDate = date;
    item0002.size = [MWStorage metroMapSize:item0002.identifier];
    [items addObject:item0002];

    MWListItem *item0003 = [[MWListItem alloc] init];
    item0003.identifier = @"medellin_metro";
    item0003.versionNumberOnSite = 1;
    item0003.versionNumberOnDevice = 0;
    item0003.geoLocation = CGPointMake(6.231944, -75.568056);
    item0003.countryNameEnglish = @"Colombia";
    item0003.countryNameRussian = @"Колумбия";
    item0003.cityNameEnglish = @"Medellín";
    item0003.cityNameRussian = @"Медельин";
    item0003.metroMapNameEnglish = @"";
    item0003.metroMapNameRussian = @"";
    item0003.linesCount = 5;
    item0003.stationsCount = 34; // "27 Metro stations (+ 7 Metrocable stations)"
    item0003.length = 38;
    item0003.checkURL = @"https://en.wikipedia.org/wiki/Medellín_Metro";
    dateString = @"13.02.2014 15:20";
    date = [dateFormatter dateFromString:dateString];
    item0003.versionDate = date;
    item0003.size = [MWStorage metroMapSize:item0003.identifier];
    [items addObject:item0003];

    MWListItem *item0004 = [[MWListItem alloc] init];
    item0004.identifier = @"amsterdam_metro";
    item0004.versionNumberOnSite = 1;
    item0004.versionNumberOnDevice = 0;
    item0004.geoLocation = CGPointMake(52.383333, 4.9);
    item0004.countryNameEnglish = @"Netherlands";
    item0004.countryNameRussian = @"Нидерланды";
    item0004.cityNameEnglish = @"Amsterdam";
    item0004.cityNameRussian = @"Амстердам";
    item0004.metroMapNameEnglish = @"";
    item0004.metroMapNameRussian = @"";
    item0004.linesCount = 4;
    item0004.stationsCount = 52; // "58 (incl.toekomstige N-Zlijn)"
    item0004.length = 43;
    item0004.checkURL = @"https://nl.wikipedia.org/wiki/Amsterdamse_metro";
    dateString = @"08.03.2014 15:21";
    date = [dateFormatter dateFromString:dateString];
    item0004.versionDate = date;
    item0004.size = [MWStorage metroMapSize:item0004.identifier];
    [items addObject:item0004];

    MWListItem *item0005 = [[MWListItem alloc] init];
    item0005.identifier = @"bangkok_airport";
    item0005.versionNumberOnSite = 1;
    item0005.versionNumberOnDevice = 0;
    item0005.geoLocation = CGPointMake(13.75, 100.466667);
    item0005.countryNameEnglish = @"Thailand";
    item0005.countryNameRussian = @"Тайланд";
    item0005.cityNameEnglish = @"Bangkok";
    item0005.cityNameRussian = @"Бангкок";
    item0005.metroMapNameEnglish = @"Airport Rail Link";
    item0005.metroMapNameRussian = @"Аэроэкспресс";
    item0005.linesCount = 1;
    item0005.stationsCount = 8;
    item0005.length = 29;
    item0005.checkURL = @"https://en.wikipedia.org/wiki/Airport_Rail_Link_(Bangkok)";
    dateString = @"14.03.2014 15:21";
    date = [dateFormatter dateFromString:dateString];
    item0005.versionDate = date;
    item0005.size = [MWStorage metroMapSize:item0005.identifier];
    [items addObject:item0005];

    MWListItem *item0006 = [[MWListItem alloc] init];
    item0006.identifier = @"porto_alegre_metro";
    item0006.versionNumberOnSite = 1;
    item0006.versionNumberOnDevice = 0;
    item0006.geoLocation = CGPointMake(-30.032778, -51.23);
    item0006.countryNameEnglish = @"Brazil";
    item0006.countryNameRussian = @"Бразилия";
    item0006.cityNameEnglish = @"Porto Alegre";
    item0006.cityNameRussian = @"Порту-Алегри";
    item0006.metroMapNameEnglish = @"";
    item0006.metroMapNameRussian = @"";
    item0006.linesCount = 1;
    item0006.stationsCount = 22;
    item0006.length = 43;
    item0006.checkURL = @"https://en.wikipedia.org/wiki/Porto_Alegre_Metro";
    dateString = @"03.04.2014 15:21";
    date = [dateFormatter dateFromString:dateString];
    item0006.versionDate = date;
    item0006.size = [MWStorage metroMapSize:item0006.identifier];
    [items addObject:item0006];

    MWListItem *item0007 = [[MWListItem alloc] init];
    item0007.identifier = @"los_angeles_metro"; // Медленная
    item0007.versionNumberOnSite = 1;
    item0007.versionNumberOnDevice = 0;
    item0007.geoLocation = CGPointMake(34.033, -118.267);
    item0007.countryNameEnglish = @"USA";
    item0007.countryNameRussian = @"США";
    item0007.cityNameEnglish = @"Los Angeles";
    item0007.cityNameRussian = @"Лос-Анджелес";
    item0007.metroMapNameEnglish = @"";
    item0007.metroMapNameRussian = @"";
    item0007.linesCount = 8;
    item0007.stationsCount = 103; // Rail + Bus
    item0007.length = 143; // Rail + Bus
    item0007.checkURL = @"https://en.wikipedia.org/wiki/Los_Angeles_County_Metropolitan_Transportation_Authority";
    dateString = @"23.05.2014 15:21";
    date = [dateFormatter dateFromString:dateString];
    item0007.versionDate = date;
    item0007.size = [MWStorage metroMapSize:item0007.identifier];
    [items addObject:item0007];

    MWListItem *item0008 = [[MWListItem alloc] init];
    item0008.identifier = @"yekaterinburg_metro";
    item0008.versionNumberOnSite = 1;
    item0008.versionNumberOnDevice = 0;
    item0008.geoLocation = CGPointMake(56.833333, 60.583333);
    item0008.countryNameEnglish = @"Russia";
    item0008.countryNameRussian = @"Россия";
    item0008.cityNameEnglish = @"Yekaterinburg";
    item0008.cityNameRussian = @"Екатеринбург";
    item0008.metroMapNameEnglish = @"";
    item0008.metroMapNameRussian = @"";
    item0008.linesCount = 1;
    item0008.stationsCount = 9;
    item0008.length = 12.7;
    item0008.checkURL = @"https://ru.wikipedia.org/wiki/Екатеринбургский_метрополитен";
    dateString = @"29.05.2014 15:21";
    date = [dateFormatter dateFromString:dateString];
    item0008.size = [MWStorage metroMapSize:item0008.identifier];
    item0008.versionDate = date;
    [items addObject:item0008];

    MWListItem *item0009 = [[MWListItem alloc] init];
    item0009.identifier = @"wuhan_metro";
    item0009.versionNumberOnSite = 1;
    item0009.versionNumberOnDevice = 0;
    item0009.geoLocation = CGPointMake(30.583333, 114.283333);
    item0009.countryNameEnglish = @"China";
    item0009.countryNameRussian = @"Китай";
    item0009.cityNameEnglish = @"Wuhan";
    item0009.cityNameRussian = @"Ухань";
    item0009.metroMapNameEnglish = @"";
    item0009.metroMapNameRussian = @"";
    item0009.linesCount = 3;
    item0009.stationsCount = 62;
    item0009.length = 79.1;
    item0009.checkURL = @"https://en.wikipedia.org/wiki/Wuhan_Metro";
    dateString = @"19.07.2014 15:21";
    date = [dateFormatter dateFromString:dateString];
    item0009.versionDate = date;
    item0009.size = [MWStorage metroMapSize:item0009.identifier];
    [items addObject:item0009];

    MWListItem *item0010 = [[MWListItem alloc] init];
    item0010.identifier = @"kyoto_subway";
    item0010.versionNumberOnSite = 2;
    item0010.versionNumberOnDevice = 0;
    item0010.geoLocation = CGPointMake(35.017000, 135.750000);
    item0010.countryNameEnglish = @"Japan";
    item0010.countryNameRussian = @"Япония";
    item0010.cityNameEnglish = @"Kyoto";
    item0010.cityNameRussian = @"Киото";
    item0010.metroMapNameEnglish = @"";
    item0010.metroMapNameRussian = @"";
    item0010.linesCount = 2;
    item0010.stationsCount = 29;
    item0010.length = 28.8;
    item0010.checkURL = @"http://en.wikipedia.org/wiki/Kyoto_Municipal_Subway";
    dateString = @"28.07.2014 15:22";
    date = [dateFormatter dateFromString:dateString];
    item0010.versionDate = date;
    item0010.size = [MWStorage metroMapSize:item0010.identifier];
    [items addObject:item0010];

    MWListItem *item0011 = [[MWListItem alloc] init];
    item0011.identifier = @"toronto_subway";
    item0011.versionNumberOnSite = 1;
    item0011.versionNumberOnDevice = 0;
    item0011.geoLocation = CGPointMake(43.700000, -79.400000);
    item0011.countryNameEnglish = @"Canada";
    item0011.countryNameRussian = @"Канада";
    item0011.cityNameEnglish = @"Toronto";
    item0011.cityNameRussian = @"Торонто";
    item0011.metroMapNameEnglish = @"";
    item0011.metroMapNameRussian = @"";
    item0011.linesCount = 4;
    item0011.stationsCount = 69;
    item0011.length = 68.3;
    item0011.checkURL = @"http://en.wikipedia.org/wiki/Toronto_subway_and_RT";
    dateString = @"25.08.2014 15:22";
    date = [dateFormatter dateFromString:dateString];
    item0011.versionDate = date;
    item0011.size = [MWStorage metroMapSize:item0011.identifier];
    [items addObject:item0011];

    MWListItem *item0012 = [[MWListItem alloc] init];
    item0012.identifier = @"nizhny_novgorod_metro";
    item0012.versionNumberOnSite = 1;
    item0012.versionNumberOnDevice = 0;
    item0012.geoLocation = CGPointMake(56.326944, 44.0075);
    item0012.countryNameEnglish = @"Russia";
    item0012.countryNameRussian = @"Россия";
    item0012.cityNameEnglish = @"Nizhny Novgorod";
    item0012.cityNameRussian = @"Нижний Новгород";
    item0012.metroMapNameEnglish = @"";
    item0012.metroMapNameRussian = @"";
    item0012.linesCount = 2;
    item0012.stationsCount = 14;
    item0012.length = 18.9;
    item0012.checkURL = @"https://ru.wikipedia.org/wiki/Нижегородский_метрополитен";
    dateString = @"07.09.2014 18:00";
    date = [dateFormatter dateFromString:dateString];
    item0012.versionDate = date;
    item0012.size = [MWStorage metroMapSize:item0012.identifier];
    [items addObject:item0012];

    MWListItem *item0013 = [[MWListItem alloc] init];
    item0013.identifier = @"yokohama_subway";
    item0013.versionNumberOnSite = 1;
    item0013.versionNumberOnDevice = 0;
    item0013.geoLocation = CGPointMake(35.444167, 139.638056);
    item0013.countryNameEnglish = @"Japan";
    item0013.countryNameRussian = @"Япония";
    item0013.cityNameEnglish = @"Yokohama";
    item0013.cityNameRussian = @"Иокогама";
    item0013.metroMapNameEnglish = @"";
    item0013.metroMapNameRussian = @"";
    item0013.linesCount = 2;
    item0013.stationsCount = 42;
    item0013.length = 53.4;
    item0013.checkURL = @"https://en.wikipedia.org/wiki/Yokohama_Municipal_Subway";
    dateString = @"10.10.2014 11:01";
    date = [dateFormatter dateFromString:dateString];
    item0013.versionDate = date;
    item0013.size = [MWStorage metroMapSize:item0013.identifier];
    [items addObject:item0013];

    MWListItem *item0014 = [[MWListItem alloc] init];
    item0014.identifier = @"boston_subway";
    item0014.versionNumberOnSite = 1;
    item0014.versionNumberOnDevice = 0;
    item0014.geoLocation = CGPointMake(42.35817, -71.06369);
    item0014.countryNameEnglish = @"USA";
    item0014.countryNameRussian = @"США";
    item0014.cityNameEnglish = @"Boston";
    item0014.cityNameRussian = @"Бостон";
    item0014.metroMapNameEnglish = @"";
    item0014.metroMapNameRussian = @"";
    item0014.linesCount = 12;
    item0014.stationsCount = 122;
    item0014.length = 134;
    item0014.checkURL = @"https://en.wikipedia.org/wiki/Massachusetts_Bay_Transportation_Authority";
    dateString = @"10.03.2015 18:01";
    date = [dateFormatter dateFromString:dateString];
    item0014.versionDate = date;
    item0014.size = [MWStorage metroMapSize:item0014.identifier];
    [items addObject:item0014];

    MWListItem *item0015 = [[MWListItem alloc] init];
    item0015.identifier = @"pyongyang_metro";
    item0015.versionNumberOnSite = 1;
    item0015.versionNumberOnDevice = 0;
    item0015.geoLocation = CGPointMake(39.019444, 125.738056);
    item0015.countryNameEnglish = @"North Korean";
    item0015.countryNameRussian = @"Северная Корея";
    item0015.cityNameEnglish = @"Pyongyang";
    item0015.cityNameRussian = @"Пхеньян";
    item0015.metroMapNameEnglish = @"";
    item0015.metroMapNameRussian = @"";
    item0015.linesCount = 2;
    item0015.stationsCount = 16;
    item0015.length = 22.5;
    item0015.checkURL = @"http://en.wikipedia.org/wiki/Pyongyang_Metro";
    dateString = @"02.04.2015 17:06";
    date = [dateFormatter dateFromString:dateString];
    item0015.versionDate = date;
    item0015.size = [MWStorage metroMapSize:item0015.identifier];
    [items addObject:item0015];

    MWListItem *item0016 = [[MWListItem alloc] init];
    item0016.identifier = @"recife_metro";
    item0016.versionNumberOnSite = 1;
    item0016.versionNumberOnDevice = 0;
    item0016.geoLocation = CGPointMake(-8.05, -34.9);
    item0016.countryNameEnglish = @"Brazil";
    item0016.countryNameRussian = @"Бразилия";
    item0016.cityNameEnglish = @"Recife";
    item0016.cityNameRussian = @"Ресифи";
    item0016.metroMapNameEnglish = @"";
    item0016.metroMapNameRussian = @"";
    item0016.linesCount = 3;
    item0016.stationsCount = 29;
    item0016.length = 39.5;
    item0016.checkURL = @"http://en.wikipedia.org/wiki/Recife_Metro";
    dateString = @"31.05.2015 21:11";
    date = [dateFormatter dateFromString:dateString];
    item0016.versionDate = date;
    item0016.size = [MWStorage metroMapSize:item0016.identifier];
    [items addObject:item0016];

    MWListItem *item0017 = [[MWListItem alloc] init];
    item0017.identifier = @"hiroshima_metro";
    item0017.versionNumberOnSite = 1;
    item0017.versionNumberOnDevice = 0;
    item0017.geoLocation = CGPointMake(34.385278, 132.455278);
    item0017.countryNameEnglish = @"Japan";
    item0017.countryNameRussian = @"Япония";
    item0017.cityNameEnglish = @"Hiroshima";
    item0017.cityNameRussian = @"Хиросима";
    item0017.metroMapNameEnglish = @"";
    item0017.metroMapNameRussian = @"";
    item0017.linesCount = 1;
    item0017.stationsCount = 22;
    item0017.length = 18.4;
    item0017.checkURL = @"https://en.wikipedia.org/wiki/Astram_Line";
    dateString = @"31.05.2015 21:11";
    date = [dateFormatter dateFromString:dateString];
    item0017.versionDate = date;
    item0017.size = [MWStorage metroMapSize:item0017.identifier];
    [items addObject:item0017];

    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSTimeInterval timeInterval = - 60 * 60 * 24 * 7; // Неделя
    NSDate *current = [NSDate date];
    NSDate *newDate = [current dateByAddingTimeInterval:timeInterval];
    lastUpdate = newDate;
    
    for (MWListItem *listItem in items) {
        [listItem setSizeText];
        [listItem setVersionDateText];
    }
    
    [self save];
}

- (void)createNewListTXTVersion
{
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy HH:mm"];
    NSString *timeString = [dateFormatter stringFromDate:currentTime];
    
    NSMutableString *result = [NSMutableString stringWithFormat:@"List of metro maps. Data generation: %@\n", timeString];
    for (MWListItem *listItem in items) {
        [result appendFormat:@"\n%@\n", listItem.identifier];
        [result appendFormat:@"   versionNumberOnSite = %d\n", listItem.versionNumberOnSite];
        [result appendFormat:@"   versionDate = %@\n", [dateFormatter stringFromDate:listItem.versionDate]];
        [result appendFormat:@"   size = %@\n", listItem.sizeText];
    }
    
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    // Получаем имя файла
    NSString *fileName = @"list.txt";
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileName];
    
    // Записываем файл со списком
    [result writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
