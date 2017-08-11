//
//  MMDevelopment.h
//  Metro Maps
//
//  Created by Valentin Ozerov on 14.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWDownload.h"
#import "MWDraw.h"
#import "MWEdge.h"
#import "MWHaul.h"
#import "MWStorage.h"
#import "MWUpload.h"
#import "MWList.h"
#import "MWStation.h"
#import "MWRouter.h"

#import "MWMoscowMetro.h"
#import "MWBeloHorizonteMetro.h"
#import "MWMedellinMetro.h"
#import "MWAmsterdamMetro.h"
#import "MWBangkokAirport.h"
#import "MWPortoAlegreMetro.h"
#import "MWLosAngelesMetro.h"
#import "MWYekaterinburgMetro.h"
#import "MWWuhanMetro.h"
#import "MWKyotoSubway.h"
#import "MWTorontoSubway.h"
#import "MWNizhnyNovgorodMetro.h"
#import "MWYokohamaSubway.h"
#import "MWBostonSubway.h"
#import "MWPyongyangMetro.h"
#import "MWRecifeMetro.h"
#import "MWHiroshimaMetro.h"

@interface MWDevelopment : NSObject

+ (void)createAllMetro:(BOOL)uploadToServer;

+ (void)createMoscowMetro:(BOOL)uploadToServer;
+ (void)createBeloHorizonteMetro:(BOOL)uploadToServer;
+ (void)createMedellinMetro:(BOOL)uploadToServer;
+ (void)createAmsterdamMetro:(BOOL)uploadToServer;
+ (void)createBangkokAirport:(BOOL)uploadToServer;
+ (void)createPortoAlegreMetro:(BOOL)uploadToServer;
+ (void)createLosAngelesMetro:(BOOL)uploadToServer;
+ (void)createYekaterinburgMetro:(BOOL)uploadToServer;
+ (void)createWuhanMetro:(BOOL)uploadToServer;
+ (void)createKyotoSubway:(BOOL)uploadToServer;
+ (void)createTorontoSubway:(BOOL)uploadToServer;
+ (void)createNizhnyNovgorodMetro:(BOOL)uploadToServer;
+ (void)createYokohamaSubway:(BOOL)uploadToServer;
+ (void)createBostonSubway:(BOOL)uploadToServer;
+ (void)createPyongyangMetro:(BOOL)uploadToServer;
+ (void)createRecifeMetro:(BOOL)uploadToServer;
+ (void)createHiroshimaMetro:(BOOL)uploadToServer;

+ (void)checkMetroMap:(MWMetroMap *)metroMap;
// Создание случайного маршрута и выгрузка его на сервер
+ (void)createRandomRoute;
// Выгрузка изображения схемы метро на сайт
+ (void)uploadMetroMapImageToSite:(NSString *)identifier;
+ (void)createNewList:(BOOL)uploadToServer;

@end
