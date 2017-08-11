//
//  MMRouteStorage.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 19.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWRouteStorage.h"
#import "MWStorage.h"
#import "MWRouteItem.h"

@implementation MWRouteStorage

@synthesize items;

int maxLastRoutes = 3;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:items forKey:@"items"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setItems:[aDecoder decodeObjectForKey:@"items"]];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        items = [[NSMutableArray alloc] init];
        // Для теста добавляем три избранных станции и маршрута
        //[self addFavoriteRoute:@"station0010" station2:@"station0020"];
        //[self addFavoriteRoute:@"station0030" station2:@"station0040"];
        //[self addFavoriteRoute:@"station0050" station2:@"station0060"];
        //[self addFavoriteStation:@"station0070"];
        //[self addFavoriteStation:@"station0080"];
        //[self addFavoriteStation:@"station0090"];
    }
    return self;
}

- (void)save
{
    // Возврат успеха или сбоя
    NSString *cachesDirectory = [MWStorage cachesDirectory];
    
    // Получаем имя файла
    NSString *fileName = @"route_storage";
    
    // Добавляем расширение
    NSString *fileExt = [fileName stringByAppendingPathExtension:@"data"];
    
    // Получаем полный путь
    NSString *path = [cachesDirectory stringByAppendingPathComponent:fileExt];
    
    // Записываем файл со списком
    [NSKeyedArchiver archiveRootObject:self toFile:path];
    
    //NSLog(@"Список записан по следующему пути: %@, схем: %d", path, items.count);
}

- (void)addLastRoute:(NSString *)stationIdentifier1 station2:(NSString *)stationIdentifier2
{
    MWRouteItem *routeItem;
    NSArray *lastRoutes = [self lastRoutes];
    
    // Если в первых трех последних маршрутах уже есть добавляемый, то стираем его
    for (int i = 0; i < 3 && i < lastRoutes.count; i++) {
        routeItem = [lastRoutes objectAtIndex:i];
        if (routeItem && [routeItem.stationIdentifier1 isEqual:stationIdentifier1] && [routeItem.stationIdentifier2 isEqual:stationIdentifier2]) {
            [items removeObject:routeItem];
        }
    }
    
    // Если количество последних маршрутов больше, чем их должно быть, удаляем лишние
    int count = 0;
    for (MWRouteItem *routeItem in lastRoutes) {
        if (routeItem.type == 0) {
            count++;
        }
        if (count >= maxLastRoutes) {
            [items removeObject:routeItem];
        }
    }
    
    routeItem = [[MWRouteItem alloc] init];
    routeItem.metroMapIdentifier = [MWStorage currentMetroMap].identifier;
    routeItem.stationIdentifier1 = stationIdentifier1;
    routeItem.stationIdentifier2 = stationIdentifier2;
    routeItem.type = 0;
    routeItem.added = [NSDate date];
    
    [self.items insertObject:routeItem atIndex:0];
    [self save];
}

- (void)addFavoriteRoute:(NSString *)stationIdentifier1 station2:(NSString *)stationIdentifier2
{
    MWRouteItem *routeItem = [[MWRouteItem alloc] init];
    routeItem.metroMapIdentifier = [MWStorage currentMetroMap].identifier;
    routeItem.stationIdentifier1 = stationIdentifier1;
    routeItem.stationIdentifier2 = stationIdentifier2;
    routeItem.type = 1;
    routeItem.added = [NSDate date];
    
    [self.items insertObject:routeItem atIndex:0];
    [self save];
}

- (void)addFavoriteStation:(NSString *)stationIdentifier
{
    MWRouteItem *routeItem = [[MWRouteItem alloc] init];
    routeItem.metroMapIdentifier = [MWStorage currentMetroMap].identifier;
    routeItem.stationIdentifier1 = stationIdentifier;
    routeItem.type = 2;
    routeItem.added = [NSDate date];
    
    [self.items insertObject:routeItem atIndex:0];
    [self save];
}

- (NSArray *)lastRoutes
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (MWRouteItem *routeItem in items) {
        if (routeItem.type == 0 && [[MWSettings currentMetroMapIdentifier] isEqualToString:routeItem.metroMapIdentifier]) {
            [result addObject:routeItem];
        }
    }
    return (NSArray *)result;
}

- (NSArray *)favoriteRoutes
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (MWRouteItem *routeItem in items) {
        if (routeItem.type == 1 && [[MWSettings currentMetroMapIdentifier] isEqualToString:routeItem.metroMapIdentifier]) {
            [result addObject:routeItem];
        }
    }
    return (NSArray *)result;
}

- (NSArray *)favoriteStations
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (MWRouteItem *routeItem in items) {
        if (routeItem.type == 2 && [[MWSettings currentMetroMapIdentifier] isEqualToString:routeItem.metroMapIdentifier]) {
            [result addObject:routeItem];
        }
    }
    return (NSArray *)result;
}

NSInteger favoritesSort(id routeItem1, id routeItem2, void *context)
{
    MWRouteItem *ri1 = (MWRouteItem *)routeItem1;
    MWRouteItem *ri2 = (MWRouteItem *)routeItem2;
    
    if (ri1.type < ri2.type)
        return NSOrderedAscending;
    else if (ri1.type > ri2.type)
        return NSOrderedDescending;
    else return [ri2.added compare:ri1.added];
}

- (NSArray *)allFavorites
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (MWRouteItem *routeItem in items) {
        if ((routeItem.type == 1 || routeItem.type == 2) && [[MWSettings currentMetroMapIdentifier] isEqualToString:routeItem.metroMapIdentifier]) {
            [result addObject:routeItem];
        }
    }
    return [result sortedArrayUsingFunction:favoritesSort context:nil];
}

@end
