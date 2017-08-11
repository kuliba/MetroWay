//
//  MMListItem.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 13.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWListItem.h"
#import "MWStorage.h"

@implementation MWListItem

@synthesize versionNumberOnSite, versionNumberOnDevice, versionDate, identifier, geoLocation, countryNameEnglish, countryNameRussian, cityNameEnglish, cityNameRussian, metroMapNameEnglish, metroMapNameRussian, stationsCount, length, isNewVersionAvailable, showStatus, downloadProgress, linesCount, favorited, size;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:versionNumberOnSite forKey:@"versionNumberOnSite"];
    [aCoder encodeInt:versionNumberOnDevice forKey:@"versionNumberOnDevice"];
    [aCoder encodeObject:versionDate forKey:@"versionDate"];
    [aCoder encodeObject:identifier forKey:@"identifier"];
    [aCoder encodeCGPoint:geoLocation forKey:@"geoLocation"];
    [aCoder encodeObject:countryNameEnglish forKey:@"countryNameEnglish"];
    [aCoder encodeObject:countryNameRussian forKey:@"countryNameRussian"];
    [aCoder encodeObject:cityNameEnglish forKey:@"cityNameEnglish"];
    [aCoder encodeObject:cityNameRussian forKey:@"cityNameRussian"];
    [aCoder encodeObject:metroMapNameEnglish forKey:@"metroMapNameEnglish"];
    [aCoder encodeObject:metroMapNameRussian forKey:@"metroMapNameRussian"];
    [aCoder encodeInt:linesCount forKey:@"linesCount"];
    [aCoder encodeInt:stationsCount forKey:@"stationsCount"];
    [aCoder encodeInt:length forKey:@"length"];
    [aCoder encodeBool:favorited forKey:@"favorited"];
    [aCoder encodeObject:[NSString stringWithFormat:@"%llu", size] forKey:@"size"];
}

// Инициализация и загрузка сохраненного ранее элемента, описывающего схему метро
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.versionNumberOnSite = [aDecoder decodeIntForKey:@"versionNumberOnSite"];
        self.versionNumberOnDevice = [aDecoder decodeIntForKey:@"versionNumberOnDevice"];
        self.versionDate = [aDecoder decodeObjectForKey:@"versionDate"];
        self.identifier = [aDecoder decodeObjectForKey:@"identifier"];
        self.geoLocation = [aDecoder decodeCGPointForKey:@"geoLocation"];
        self.countryNameEnglish = [aDecoder decodeObjectForKey:@"countryNameEnglish"];
        self.cityNameEnglish = [aDecoder decodeObjectForKey:@"cityNameEnglish"];
        self.metroMapNameEnglish = [aDecoder decodeObjectForKey:@"metroMapNameEnglish"];
        self.linesCount = [aDecoder decodeIntForKey:@"linesCount"];
        self.stationsCount = [aDecoder decodeIntForKey:@"stationsCount"];
        self.length = [aDecoder decodeIntForKey:@"length"];
        self.favorited = [aDecoder decodeBoolForKey:@"favorited"];
        NSString *sizeString = [aDecoder decodeObjectForKey:@"size"];
        if (sizeString) {
            self.size = strtoull([sizeString UTF8String], NULL, 0);
        }
        
        if (self.size == 0) {
            self.size = [MWStorage metroMapSize:self.identifier];
        }
        
        // Localization
        [self setCountryNameRussian:[aDecoder decodeObjectForKey:@"countryNameRussian"]];
        if (countryNameRussian.length == 0) {
            countryNameRussian = countryNameEnglish;
        }
        [self setCityNameRussian:[aDecoder decodeObjectForKey:@"cityNameRussian"]];
        if (cityNameRussian.length == 0) {
            cityNameRussian = cityNameEnglish;
        }
        [self setMetroMapNameRussian:[aDecoder decodeObjectForKey:@"metroMapNameRussian"]];
        if (metroMapNameRussian.length == 0) {
            metroMapNameRussian = metroMapNameEnglish;
        }
        showStatus = 0;
        downloadProgress = 0;
        
        [self setSizeText];
        [self setVersionDateText];
    }
    return self;
}

- (BOOL)isNewVersionAvailable
{
    return (versionNumberOnDevice > 0) && (versionNumberOnSite > versionNumberOnDevice);
}

- (BOOL)isDeleteEnabled
{
    // Если схема загружена и она не текущая, то ее можно удалить
    return versionNumberOnDevice > 0 && ![identifier isEqualToString:[MWSettings currentMetroMapIdentifier]];
}

- (void)setSizeText
{
    self.sizeText = [NSByteCountFormatter stringFromByteCount:self.size countStyle:NSByteCountFormatterCountStyleFile];
}

- (void)setVersionDateText
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    self.versionDateText = [dateFormatter stringFromDate:self.versionDate];
}

@end
