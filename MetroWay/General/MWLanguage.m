//
//  MMLanguage.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 05.04.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWLanguage.h"
#import "MWSettings.h"

@implementation MWLanguage

static NSBundle* saved_language_bundle = nil;
static int saved_language = -1;

+ (NSString *)localizedStringForKey:(NSString *)key
{
    NSString *result = nil;
 
    if ([MWSettings language] == saved_language) {
        if (saved_language == 0) {
            result = NSLocalizedString(key, nil);
        } else {
            result = [saved_language_bundle localizedStringForKey:key value:@"" table:nil];
        }
    } else {
        saved_language = [MWSettings language];
        if (saved_language == 0) { //  Automatic
            result = NSLocalizedString(key, nil);
        } else if (saved_language == 1) { // English
            NSString *path = [[NSBundle mainBundle] pathForResource:@"Base" ofType:@"lproj"];
            saved_language_bundle = [NSBundle bundleWithPath:path];
            result = [saved_language_bundle localizedStringForKey:key value:@"" table:nil];
        } else if (saved_language == 2) { // Русский
            NSString *path = [[NSBundle mainBundle] pathForResource:@"ru" ofType:@"lproj"];
            saved_language_bundle = [NSBundle bundleWithPath:path];
            result = [saved_language_bundle localizedStringForKey:key value:@"" table:nil];
        }
    }
    
    return result;
}

+ (NSString *)localizedMetroMapName:(MWListItem *)listItem
{
    NSString *result = nil;
    NSString *language;
    
    switch ([MWSettings language]) {
        case 1:
            result = listItem.metroMapNameEnglish;
            break;
        case 2:
            result = listItem.metroMapNameRussian;
            if (listItem.metroMapNameRussian.length == 0 && listItem.metroMapNameEnglish.length > 0) {
                result = listItem.metroMapNameEnglish;
            }
            break;
        default:
            language = [[NSLocale preferredLanguages] objectAtIndex:0];
            if ([language isEqualToString:@"ru"]) {
                result = listItem.metroMapNameRussian;
                if (listItem.metroMapNameRussian.length == 0 && listItem.metroMapNameEnglish.length > 0) {
                    result = listItem.metroMapNameEnglish;
                }
            } else {
                result = listItem.metroMapNameEnglish;
            }
            break;
    }
    return result;
}

+ (NSString *)localizedCity:(MWListItem *)listItem
{
    NSString *result = nil;
    NSString *language;
    
    switch ([MWSettings language]) {
        case 1:
            result = listItem.cityNameEnglish;
            break;
        case 2:
            result = listItem.cityNameRussian;
            break;
        default:
            language = [[NSLocale preferredLanguages] objectAtIndex:0];
            if ([language isEqualToString:@"ru"]) {
                result = listItem.cityNameRussian;
            } else {
                result = listItem.cityNameEnglish;
            }
            break;
    }
    
    return result;
}

+ (NSString *)localizedCountry:(MWListItem *)listItem
{
    NSString *result = nil;
    NSString *language;
    
    switch ([MWSettings language]) {
        case 1:
            result = listItem.countryNameEnglish;
            break;
        case 2:
            result = listItem.countryNameRussian;
            break;
        default:
            language = [[NSLocale preferredLanguages] objectAtIndex:0];
            if ([language isEqualToString:@"ru"]) {
                result = listItem.countryNameRussian;
            } else {
                result = listItem.countryNameEnglish;
            }
            break;
    }
    
    return result;
}

+ (NSString *)localizedCityNameFieldName
{
    NSString *result = nil;
    NSString *language;
    
    switch ([MWSettings language]) {
        case 1:
            result = @"cityNameEnglish";
            break;
        case 2:
            result = @"cityNameRussian";
            break;
        default:
            language = [[NSLocale preferredLanguages] objectAtIndex:0];
            if ([language isEqualToString:@"ru"]) {
                result = @"cityNameRussian";
            } else {
                result = @"cityNameEnglish";
            }
            break;
    }
    
    return result;
}

+ (NSString *)LocalizedCurrentMetroMapName:(MWListItem *)listItem
{
    NSString *result;
    NSString *cityName = [MWLanguage localizedCity:listItem];
    NSString *metroMapName = [MWLanguage localizedMetroMapName:listItem];
    if (metroMapName.length > 0) {
        result = [NSString stringWithFormat:@"%@ (%@)", cityName, metroMapName];
    } else {
        result = cityName;
    }
    return result;
}

@end
