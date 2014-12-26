//
//  MMList.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWLocation.h"
#import "MWListItem.h"

@interface MWList : NSObject <NSCoding>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSDate *lastUpdate;
@property (nonatomic) CLLocationCoordinate2D currentCoordinate;
@property (nonatomic, readonly) NSArray *nearestMetro;
@property (nonatomic, readonly) NSArray *favoritesMetro;
@property (nonatomic, readonly) NSArray *countries;
@property (nonatomic, readonly) NSArray *newVersions;

- (void)createNewList;
- (void)save;
- (MWListItem *)itemByIdentifier:(NSString *)identifier;
- (MWListItem *)itemByName:(NSString *)name;
- (void)setUnavailable:(NSString *)identifier;
// Обновляем список после получения нового
- (void)updateList:(MWList *)newList;
- (NSMutableArray *)countryItems:(NSString *)country;
- (BOOL)isNeedUpdate;
- (void)createNewListTXTVersion;
- (void)checkVersionsOnDevice;
- (void)clearShowStatus;

@end
 