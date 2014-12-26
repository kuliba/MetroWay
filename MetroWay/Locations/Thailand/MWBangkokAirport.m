//
//  MMBangkokAirport.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 08.03.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWBangkokAirport.h"
#import "MWLine.h"
#import "MWVertex.h"
#import "MWEdge.h"
#import "MWStation.h"
#import "MWHaul.h"
#import "MWDrawTextLine.h"
#import "MWDrawLine.h"
#import "MWDrawFillCircle.h"
#import "MWDrawArc.h"
#import "MWDrawTextLine.h"

@implementation MWBangkokAirport

- (id)init
{
    // Инициализируем
    self = [super init];
    
    self.identifier = @"bangkok_airport";
    
    UIColor *color050 = [UIColor colorWithRed:(238/255.0) green:(196/255.0) blue:(202/255.0) alpha:1];
    UIColor *color066 = [UIColor colorWithRed:(226/255.0) green:(146/255.0) blue:(147/255.0) alpha:1];

    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // Airport Rail Link
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameEnglish = @"Airport Rail Link";
    line0001.nameOriginal = @"รถไฟฟ้าเชื่อมท่าอากาศยานสุวรรณภูมิ";
    line0001.color = [UIColor colorWithRed:(198/255.0) green:(71/255.0) blue:(63/255.0) alpha:1];
    [self.lines addObject:line0001];
    
    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Suvarnabhumi
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина Suvarnabhumi";
    [self.vertices addObject:vertex0001];
    
    // Phaya Thai
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина Phaya Thai";
    [self.vertices addObject:vertex0002];

    ////////////////////////////////////////////////////////////////
    // Airport Rail Link
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Suvarnabhumi - Phaya Thai"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Перегон Phaya Suvarnabhumi - Phaya Thai";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;

    // Добавляем станцию Suvarnabhumi
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"ท่าอากาศยานสุวรรณภูมิ";
    station0001.nameEnglish = @"Suvarnabhumi";
    station0001.mapLocation = CGPointMake(2602.5, 1105.5);
    station0001.geoLocation = CGPointMake(13.698104, 100.752265);
    
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(2602.5, 1105.5);
    fillCircle0001.radius = 22.5;
    fillCircle0001.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0001];
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 36;
    drawTextLine0001.origin = CGPointMake(2248, 1082);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0001.nameEnglish;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0002.fontSize = 24;
    drawTextLine0002.origin = CGPointMake(2384, 1122);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 4614;
    [edge0001.elements addObject:haul0001];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(2452.5, 1108.5);
    drawArc0001.startRadians = 295 * M_PI / 180;
    drawArc0001.endRadians = 0 * M_PI / 180;
    drawArc0001.radius = 150;
    drawArc0001.width = 40;
    drawArc0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0001];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(2452.5, 1108.5);
    drawArc0002.startRadians = 295 * M_PI / 180;
    drawArc0002.endRadians = 0 * M_PI / 180;
    drawArc0002.radius = 150;
    drawArc0002.width = 30;
    drawArc0002.color = color066;
    [haul0001.drawPrimitives addObject:drawArc0002];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(2452.5, 1108.5);
    drawArc0003.startRadians = 295 * M_PI / 180;
    drawArc0003.endRadians = 0 * M_PI / 180;
    drawArc0003.radius = 150;
    drawArc0003.width = 20;
    drawArc0003.color = color050;
    [haul0001.drawPrimitives addObject:drawArc0003];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(2452.5, 1108.5);
    drawArc0004.startRadians = 295 * M_PI / 180;
    drawArc0004.endRadians = 0 * M_PI / 180;
    drawArc0004.radius = 150;
    drawArc0004.width = 10;
    drawArc0004.color = [UIColor whiteColor];
    [haul0001.drawPrimitives addObject:drawArc0004];

    // Добавляем станцию Lat Krabang
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"ลาดกระบัง";
    station0002.nameEnglish = @"Lat Krabang";
    station0002.mapLocation = CGPointMake(2516.5, 973.5);
    station0002.geoLocation = CGPointMake(13.727757, 100.748631);
    
    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = CGPointMake(2516.5, 973.5);
    fillCircle0002.radius = 22.5;
    fillCircle0002.fillColor = color050;
    [station0002.drawPrimitives addObject:fillCircle0002];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(2516.5, 973.5);
    drawArc0005.startRadians = 0 * M_PI / 180;
    drawArc0005.endRadians = 360 * M_PI / 180;
    drawArc0005.radius = 21.25;
    drawArc0005.width = 3.5;
    drawArc0005.color = line0001.color;
    [station0002.drawPrimitives addObject:drawArc0005];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0002.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 36;
    drawTextLine0003.origin = CGPointMake(2448, 897);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];
    
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0002.nameEnglish;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0004.fontSize = 24;
    drawTextLine0004.origin = CGPointMake(2449, 875);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0004];
    
    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 6216;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(2516.5, 973.5);
    drawLine0001.endPoint = CGPointMake(1906.5, 912);
    drawLine0001.width = 40;
    drawLine0001.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(2516.5, 973.5);
    drawLine0002.endPoint = CGPointMake(1906.5, 912);
    drawLine0002.width = 30;
    drawLine0002.color = color066;
    [haul0002.drawPrimitives addObject:drawLine0002];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(2516.5, 973.5);
    drawLine0003.endPoint = CGPointMake(1906.5, 912);
    drawLine0003.width = 20;
    drawLine0003.color = color050;
    [haul0002.drawPrimitives addObject:drawLine0003];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(2516.5, 973.5);
    drawLine0004.endPoint = CGPointMake(1906.5, 912);
    drawLine0004.width = 10;
    drawLine0004.color = [UIColor whiteColor];
    [haul0002.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Ban Thap Chang
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"บ้านทับช้าง";
    station0003.nameEnglish = @"Ban Thap Chang";
    station0003.mapLocation = CGPointMake(1906.5, 912);
    station0003.geoLocation = CGPointMake(13.732857, 100.691468);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = CGPointMake(1906.5, 912);
    fillCircle0003.radius = 22.5;
    fillCircle0003.fillColor = color050;
    [station0003.drawPrimitives addObject:fillCircle0003];
    
    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(1906.5, 912);
    drawArc0006.startRadians = 0 * M_PI / 180;
    drawArc0006.endRadians = 360 * M_PI / 180;
    drawArc0006.radius = 21.25;
    drawArc0006.width = 3.5;
    drawArc0006.color = line0001.color;
    [station0003.drawPrimitives addObject:drawArc0006];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0003.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 36;
    drawTextLine0005.origin = CGPointMake(1833, 835);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0003.nameEnglish;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0006.fontSize = 24;
    drawTextLine0006.origin = CGPointMake(1812, 815);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 5021;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(1907, 912.5);
    drawLine0005.endPoint = CGPointMake(1408.5, 855.5);
    drawLine0005.width = 40;
    drawLine0005.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0005];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(1907, 912.5);
    drawLine0006.endPoint = CGPointMake(1408.5, 855.5);
    drawLine0006.width = 30;
    drawLine0006.color = color066;
    [haul0003.drawPrimitives addObject:drawLine0006];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(1907, 912.5);
    drawLine0007.endPoint = CGPointMake(1408.5, 855.5);
    drawLine0007.width = 20;
    drawLine0007.color = color050;
    [haul0003.drawPrimitives addObject:drawLine0007];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(1907, 912.5);
    drawLine0008.endPoint = CGPointMake(1408.5, 855.5);
    drawLine0008.width = 10;
    drawLine0008.color = [UIColor whiteColor];
    [haul0003.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Hua Mak
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"หัวหมาก";
    station0004.nameEnglish = @"Hua Mak";
    station0004.mapLocation = CGPointMake(1408.5, 855.5);
    station0004.geoLocation = CGPointMake(13.737972, 100.645349);

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = CGPointMake(1408.5, 855.5);
    fillCircle0004.radius = 22.5;
    fillCircle0004.fillColor = color050;
    [station0004.drawPrimitives addObject:fillCircle0004];
    
    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(1408.5, 855.5);
    drawArc0007.startRadians = 0 * M_PI / 180;
    drawArc0007.endRadians = 360 * M_PI / 180;
    drawArc0007.radius = 21.25;
    drawArc0007.width = 3.5;
    drawArc0007.color = line0001.color;
    [station0004.drawPrimitives addObject:drawArc0007];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0004.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 36;
    drawTextLine0007.origin = CGPointMake(1357, 783);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];
    
    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0004.nameEnglish;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0008.fontSize = 24;
    drawTextLine0008.origin = CGPointMake(1362, 763);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 4902;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(1409, 855.5);
    drawLine0009.endPoint = CGPointMake(987.5, 817.5);
    drawLine0009.width = 40;
    drawLine0009.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0009];
    
    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(1409, 855.5);
    drawLine0010.endPoint = CGPointMake(987.5, 817.5);
    drawLine0010.width = 30;
    drawLine0010.color = color066;
    [haul0004.drawPrimitives addObject:drawLine0010];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(1409, 855.5);
    drawLine0011.endPoint = CGPointMake(987.5, 817.5);
    drawLine0011.width = 20;
    drawLine0011.color = color050;
    [haul0004.drawPrimitives addObject:drawLine0011];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(1409, 855.5);
    drawLine0012.endPoint = CGPointMake(987.5, 817.5);
    drawLine0012.width = 10;
    drawLine0012.color = [UIColor whiteColor];
    [haul0004.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию Ramkhamhaeng
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"รามคำแหง";
    station0005.nameEnglish = @"Ramkhamhaeng";
    station0005.mapLocation = CGPointMake(987.5, 817.5);
    station0005.geoLocation = CGPointMake(13.742972, 100.600321);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = CGPointMake(987.5, 817.5);
    fillCircle0005.radius = 22.5;
    fillCircle0005.fillColor = color050;
    [station0005.drawPrimitives addObject:fillCircle0005];
    
    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(987.5, 817.5);
    drawArc0008.startRadians = 0 * M_PI / 180;
    drawArc0008.endRadians = 360 * M_PI / 180;
    drawArc0008.radius = 21.25;
    drawArc0008.width = 3.5;
    drawArc0008.color = line0001.color;
    [station0005.drawPrimitives addObject:drawArc0008];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0005.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 36;
    drawTextLine0009.origin = CGPointMake(980, 748);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0009];
    
    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0005.nameEnglish;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0010.fontSize = 24;
    drawTextLine0010.origin = CGPointMake(980, 728);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 4338;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(988, 817.5);
    drawLine0013.endPoint = CGPointMake(594.5, 731.5);
    drawLine0013.width = 40;
    drawLine0013.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0013];
    
    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(988, 817.5);
    drawLine0014.endPoint = CGPointMake(594.5, 731.5);
    drawLine0014.width = 30;
    drawLine0014.color = color066;
    [haul0005.drawPrimitives addObject:drawLine0014];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(988, 817.5);
    drawLine0015.endPoint = CGPointMake(594.5, 731.5);
    drawLine0015.width = 20;
    drawLine0015.color = color050;
    [haul0005.drawPrimitives addObject:drawLine0015];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(988, 817.5);
    drawLine0016.endPoint = CGPointMake(594.5, 731.5);
    drawLine0016.width = 10;
    drawLine0016.color = [UIColor whiteColor];
    [haul0005.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию Makkasan
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"มักกะสัน";
    station0006.nameEnglish = @"Makkasan";
    station0006.mapLocation = CGPointMake(594.5, 731.5);
    station0006.geoLocation = CGPointMake(13.750914, 100.561168);

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(594.5, 731.5);
    drawArc0009.startRadians = 0 * M_PI / 180;
    drawArc0009.endRadians = 360 * M_PI / 180;
    drawArc0009.radius = 21.25;
    drawArc0009.width = 3.5;
    drawArc0009.color = [UIColor blackColor];
    [station0006.drawPrimitives addObject:drawArc0009];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(601.5, 764.5);
    drawArc0010.startRadians = 0 * M_PI / 180;
    drawArc0010.endRadians = 360 * M_PI / 180;
    drawArc0010.radius = 21.25;
    drawArc0010.width = 3.5;
    drawArc0010.color = [UIColor blackColor];
    [station0006.drawPrimitives addObject:drawArc0010];

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = CGPointMake(601.5, 764.5);
    fillCircle0006.radius = 22.5;
    fillCircle0006.fillColor = [UIColor colorWithRed:(215/255.0) green:227/255.0 blue:245/255.0 alpha:1];
    [station0006.drawPrimitives addObject:fillCircle0006];

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = CGPointMake(594.5, 731.5);
    fillCircle0007.radius = 20;
    fillCircle0007.fillColor = line0001.color;
    [station0006.drawPrimitives addObject:fillCircle0007];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0006.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 36;
    drawTextLine0011.origin = CGPointMake(655, 680);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0011];
    
    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0006.nameEnglish;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0012.fontSize = 24;
    drawTextLine0012.origin = CGPointMake(655, 660);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0012];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(601, 729);
    drawLine0030.endPoint = CGPointMake(648, 703);
    drawLine0030.width = 4;
    drawLine0030.color = [UIColor blackColor];
    [station0006.nameOriginalTextPrimitives addObject:drawLine0030];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 2131;
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(595, 731.5);
    drawLine0017.endPoint = CGPointMake(441.5, 689.5);
    drawLine0017.width = 40;
    drawLine0017.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0017];
    
    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(595, 731.5);
    drawLine0018.endPoint = CGPointMake(441.5, 689.5);
    drawLine0018.width = 30;
    drawLine0018.color = color066;
    [haul0006.drawPrimitives addObject:drawLine0018];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(595, 731.5);
    drawLine0019.endPoint = CGPointMake(441.5, 689.5);
    drawLine0019.width = 20;
    drawLine0019.color = color050;
    [haul0006.drawPrimitives addObject:drawLine0019];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(595, 731.5);
    drawLine0020.endPoint = CGPointMake(441.5, 689.5);
    drawLine0020.width = 10;
    drawLine0020.color = [UIColor whiteColor];
    [haul0006.drawPrimitives addObject:drawLine0020];

    // Добавляем станцию Ratchaprarop
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"ราชปรารภ";
    station0007.nameEnglish = @"Ratchaprarop";
    station0007.mapLocation = CGPointMake(441.5, 689.5);
    station0007.geoLocation = CGPointMake(13.755152, 100.541831);

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = CGPointMake(441.5, 689.5);
    fillCircle0008.radius = 22.5;
    fillCircle0008.fillColor = color050;
    [station0007.drawPrimitives addObject:fillCircle0008];
    
    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(441.5, 689.5);
    drawArc0011.startRadians = 0 * M_PI / 180;
    drawArc0011.endRadians = 360 * M_PI / 180;
    drawArc0011.radius = 21.25;
    drawArc0011.width = 3.5;
    drawArc0011.color = line0001.color;
    [station0007.drawPrimitives addObject:drawArc0011];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0007.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 36;
    drawTextLine0013.origin = CGPointMake(435, 620);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0013];
    
    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0007.nameEnglish;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0014.fontSize = 24;
    drawTextLine0014.origin = CGPointMake(435, 600);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 2893;
    [edge0001.elements addObject:haul0007];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(442, 689.5);
    drawLine0021.endPoint = CGPointMake(329.5, 660.5);
    drawLine0021.width = 40;
    drawLine0021.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0021];
    
    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(442, 689.5);
    drawLine0022.endPoint = CGPointMake(329.5, 660.5);
    drawLine0022.width = 30;
    drawLine0022.color = color066;
    [haul0007.drawPrimitives addObject:drawLine0022];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(442, 689.5);
    drawLine0023.endPoint = CGPointMake(329.5, 660.5);
    drawLine0023.width = 20;
    drawLine0023.color = color050;
    [haul0007.drawPrimitives addObject:drawLine0023];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(442, 689.5);
    drawLine0024.endPoint = CGPointMake(329.5, 660.5);
    drawLine0024.width = 10;
    drawLine0024.color = [UIColor whiteColor];
    [haul0007.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Phaya Thai
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"พญาไท";
    station0008.nameEnglish = @"Phaya Thai";
    station0008.mapLocation = CGPointMake(329.5, 660.5);
    station0008.geoLocation = CGPointMake(13.756739, 100.534971);

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(329.5, 660.5);
    drawArc0012.startRadians = 0 * M_PI / 180;
    drawArc0012.endRadians = 360 * M_PI / 180;
    drawArc0012.radius = 21.25;
    drawArc0012.width = 3.5;
    drawArc0012.color = [UIColor blackColor];
    [station0008.drawPrimitives addObject:drawArc0012];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(296, 659.5);
    drawArc0013.startRadians = 0 * M_PI / 180;
    drawArc0013.endRadians = 360 * M_PI / 180;
    drawArc0013.radius = 21.25;
    drawArc0013.width = 3.5;
    drawArc0013.color = [UIColor blackColor];
    [station0008.drawPrimitives addObject:drawArc0013];
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = CGPointMake(296, 659.5);
    fillCircle0010.radius = 20;
    fillCircle0010.fillColor = [UIColor colorWithRed:(242/255.0) green:(248/255.0) blue:(243/255.0) alpha:1];
    [station0008.drawPrimitives addObject:fillCircle0010];

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = CGPointMake(329.5, 660.5);
    fillCircle0009.radius = 20;
    fillCircle0009.fillColor = color050;
    [station0008.drawPrimitives addObject:fillCircle0009];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0008.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 36;
    drawTextLine0015.origin = CGPointMake(165, 623);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0015];
    
    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0008.nameEnglish;
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0016.fontSize = 24;
    drawTextLine0016.origin = CGPointMake(140, 603);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0016];
    
    edge0001.finishVertex = vertex0002;

    ////////////////////////////////////////
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = @"บางซื่อ";
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 36;
    drawTextLine0018.origin = CGPointMake(239, 135);
    [self.additionalOverMapPrimitives addObject:drawTextLine0018];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = @"Bang Sue";
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0017.fontSize = 24;
    drawTextLine0017.origin = CGPointMake(220, 115);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0017];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = @"หมอชิต";
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 36;
    drawTextLine0019.origin = CGPointMake(395, 96);
    [self.additionalOverMapPrimitives addObject:drawTextLine0019];
    
    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = @"Mo Chit";
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0020.fontSize = 24;
    drawTextLine0020.origin = CGPointMake(403, 76);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0020];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = @"สวนจตุจักร";
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 36;
    drawTextLine0021.origin = CGPointMake(549, 202);
    [self.additionalOverMapPrimitives addObject:drawTextLine0021];
    
    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = @"Chatuchak";
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0022.fontSize = 24;
    drawTextLine0022.origin = CGPointMake(549, 242);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0022];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = @"Park";
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0023.fontSize = 24;
    drawTextLine0023.origin = CGPointMake(549, 266);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0023];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"สนามกีฬาแห่งชาติ";
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 36;
    drawTextLine0024.origin = CGPointMake(0, 696);
    [self.additionalOverMapPrimitives addObject:drawTextLine0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"National Stadium";
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0025.fontSize = 24;
    drawTextLine0025.origin = CGPointMake(49, 676);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0025];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = @"หัวลำโพง";
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 36;
    drawTextLine0026.origin = CGPointMake(65, 896);
    [self.additionalOverMapPrimitives addObject:drawTextLine0026];
    
    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = @"Hua Lamphong";
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0027.fontSize = 24;
    drawTextLine0027.origin = CGPointMake(42, 936);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0027];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"สะพานตากสิน";
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 36;
    drawTextLine0028.origin = CGPointMake(95, 1081);
    [self.additionalOverMapPrimitives addObject:drawTextLine0028];
    
    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = @"Saphan Taksin";
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0029.fontSize = 24;
    drawTextLine0029.origin = CGPointMake(95, 1121);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0029];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"ศาลาแดง";
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 36;
    drawTextLine0030.origin = CGPointMake(287, 996);
    [self.additionalOverMapPrimitives addObject:drawTextLine0030];
    
    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"Sala Daeng";
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0031.fontSize = 24;
    drawTextLine0031.origin = CGPointMake(286, 1036);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0031];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(301, 965);
    drawLine0025.endPoint = CGPointMake(301, 1005);
    drawLine0025.width = 4;
    drawLine0025.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0025];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = @"สีลม";
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 36;
    drawTextLine0032.origin = CGPointMake(370, 900);
    [self.additionalOverMapPrimitives addObject:drawTextLine0032];
    
    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = @"Si Lom";
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0033.fontSize = 24;
    drawTextLine0033.origin = CGPointMake(370, 880);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0033];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(341, 945);
    drawLine0026.endPoint = CGPointMake(366, 928);
    drawLine0026.width = 4;
    drawLine0026.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0026];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = @"สุขุมวิท";
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 36;
    drawTextLine0034.origin = CGPointMake(460, 880);
    [self.additionalOverMapPrimitives addObject:drawTextLine0034];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = @"Asok";
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0035.fontSize = 24;
    drawTextLine0035.origin = CGPointMake(496, 920);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0035];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(555, 858);
    drawLine0027.endPoint = CGPointMake(540, 890);
    drawLine0027.width = 4;
    drawLine0027.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0027];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = @"เพชรบุรี";
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 36;
    drawTextLine0036.origin = CGPointMake(640, 785);
    [self.additionalOverMapPrimitives addObject:drawTextLine0036];
    
    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"Phetchaburi";
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0037.fontSize = 24;
    drawTextLine0037.origin = CGPointMake(640, 825);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0037];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(605, 768);
    drawLine0028.endPoint = CGPointMake(637, 797);
    drawLine0028.width = 4;
    drawLine0028.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0028];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"สุขุมวิท";
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 36;
    drawTextLine0038.origin = CGPointMake(685, 845);
    [self.additionalOverMapPrimitives addObject:drawTextLine0038];
    
    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = @"Sukhumvit";
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0039.fontSize = 24;
    drawTextLine0039.origin = CGPointMake(685, 885);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0039];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(599, 839);
    drawLine0029.endPoint = CGPointMake(677, 880);
    drawLine0029.width = 4;
    drawLine0029.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0029];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = @"รถไฟฟ้าเฉลิมพระเกียรติ 6 รอบพระชนมพรรษา (BTS Skytrain)";
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 36;
    drawTextLine0040.origin = CGPointMake(1685, 77);
    [self.additionalOverMapPrimitives addObject:drawTextLine0040];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = @"\"Skytrain\" Bangkok BTS - Green Line";
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0041.fontSize = 24;
    drawTextLine0041.origin = CGPointMake(1685, 117);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0041];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(1534, 102);
    drawLine0031.endPoint = CGPointMake(1650, 102);
    drawLine0031.width = 40;
    drawLine0031.color = [UIColor colorWithRed:(102/255.0) green:(178/255.0) blue:(111/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0031];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(1534, 102);
    drawLine0032.endPoint = CGPointMake(1650, 102);
    drawLine0032.width = 30;
    drawLine0032.color = [UIColor colorWithRed:(129/255.0) green:(190/255.0) blue:(134/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0032];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(1534, 102);
    drawLine0033.endPoint = CGPointMake(1650, 102);
    drawLine0033.width = 20;
    drawLine0033.color = [UIColor colorWithRed:(159/255.0) green:(204/255.0) blue:(162/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0033];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(1534, 102);
    drawLine0034.endPoint = CGPointMake(1650, 102);
    drawLine0034.width = 10;
    drawLine0034.color = [UIColor colorWithRed:(198/255.0) green:(224/255.0) blue:(198/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0034];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = @"รถไฟฟ้ามหานคร สายเฉลิมรัชมงคล";
    drawTextLine0042.fontName = @"HelveticaNeue";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 36;
    drawTextLine0042.origin = CGPointMake(1685, 162);
    [self.additionalOverMapPrimitives addObject:drawTextLine0042];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = @"Metro Bangkok MRT - Blue Line";
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0043.fontSize = 24;
    drawTextLine0043.origin = CGPointMake(1685, 202);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0043];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(1534, 187);
    drawLine0035.endPoint = CGPointMake(1650, 187);
    drawLine0035.width = 40;
    drawLine0035.color = [UIColor colorWithRed:(76/255.0) green:(109/255.0) blue:(178/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0035];
    
    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(1534, 187);
    drawLine0036.endPoint = CGPointMake(1650, 187);
    drawLine0036.width = 30;
    drawLine0036.color = [UIColor colorWithRed:(130/255.0) green:(169/255.0) blue:(220/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0036];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(1534, 187);
    drawLine0037.endPoint = CGPointMake(1650, 187);
    drawLine0037.width = 20;
    drawLine0037.color = [UIColor colorWithRed:(169/255.0) green:(199/255.0) blue:(235/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0037];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(1534, 187);
    drawLine0038.endPoint = CGPointMake(1650, 187);
    drawLine0038.width = 10;
    drawLine0038.color = [UIColor colorWithRed:(215/255.0) green:(227/255.0) blue:(245/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0038];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = @"รถไฟฟ้าเชื่อมท่าอากาศยานสุวรรณภูมิ";
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 36;
    drawTextLine0044.origin = CGPointMake(1685, 247);
    [self.additionalOverMapPrimitives addObject:drawTextLine0044];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = @"Airport Rail Link Bangkok";
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0045.fontSize = 24;
    drawTextLine0045.origin = CGPointMake(1685, 287);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0045];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(1534, 277);
    drawLine0039.endPoint = CGPointMake(1650, 277);
    drawLine0039.width = 40;
    drawLine0039.color = line0001.color;
    [self.additionalOverMapPrimitives addObject:drawLine0039];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(1534, 277);
    drawLine0040.endPoint = CGPointMake(1650, 277);
    drawLine0040.width = 30;
    drawLine0040.color = color066;
    [self.additionalOverMapPrimitives addObject:drawLine0040];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(1534, 277);
    drawLine0041.endPoint = CGPointMake(1650, 277);
    drawLine0041.width = 20;
    drawLine0041.color = color050;
    [self.additionalOverMapPrimitives addObject:drawLine0041];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(1534, 277);
    drawLine0042.endPoint = CGPointMake(1650, 277);
    drawLine0042.width = 10;
    drawLine0042.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0042];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = @"สถานีเมืองแถว";
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 36;
    drawTextLine0046.origin = CGPointMake(1685, 332);
    [self.additionalOverMapPrimitives addObject:drawTextLine0046];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = @"Stations City Line";
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0047.fontSize = 24;
    drawTextLine0047.origin = CGPointMake(1685, 372);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0047];

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = CGPointMake(1627, 362);
    fillCircle0011.radius = 22.5;
    fillCircle0011.fillColor = color050;
    [self.additionalOverMapPrimitives addObject:fillCircle0011];
    
    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(1627, 362);
    drawArc0014.startRadians = 0 * M_PI / 180;
    drawArc0014.endRadians = 360 * M_PI / 180;
    drawArc0014.radius = 21.25;
    drawArc0014.width = 3.5;
    drawArc0014.color = line0001.color;
    [self.additionalOverMapPrimitives addObject:drawArc0014];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = @"สถานีสายซิตี้และสายด่วน";
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 36;
    drawTextLine0048.origin = CGPointMake(1685, 417);
    [self.additionalOverMapPrimitives addObject:drawTextLine0048];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = @"Stations City Line and Express Line";
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0049.fontSize = 24;
    drawTextLine0049.origin = CGPointMake(1685, 457);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0049];

    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = CGPointMake(1627, 447);
    fillCircle0012.radius = 22.5;
    fillCircle0012.fillColor = line0001.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0012];

    return self;
}

@end
