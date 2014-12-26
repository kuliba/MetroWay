//
//  MMYekaterinburgMetro.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 26.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWYekaterinburgMetro.h"
#import "MWHaul.h"
#import "MWDrawLine.h"
#import "MWDrawTextLine.h"

@implementation MWYekaterinburgMetro

- (id)init
{
    // Инициализируем
    self = [super init];
    
    self.identifier = @"yekaterinburg_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Первая линия
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Первая линия";
    line0001.nameEnglish = @"Line 1";
    line0001.color = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0001];
    
    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Проспект Космонавтов
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Проспект Космонавтов";
    [self.vertices addObject:vertex0001];

    // Ботаническая
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Ботаническая";
    [self.vertices addObject:vertex0002];

    ////////////////////////////////////////////////////////////////
    // 1. Первая линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Проспект Космонавтов - Ботаническая
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Проспект Космонавтов - Ботаническая";
    [self.edges addObject:edge0001];

    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавлям станцию "Проспект Космонавтов"
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Проспект Космонавтов";
    station0001.nameEnglish = @"Prospect Kosmonavtov";
    station0001.mapLocation = CGPointMake(255, 77.5);
    station0001.geoLocation = CGPointMake(56.901344, 60.613838);

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(255, 52.5);
    drawLine0002.endPoint = CGPointMake(255, 103.5);
    drawLine0002.width = 60;
    drawLine0002.color = [UIColor colorWithRed:(244/255.0) green:(143/255.0) blue:(44/255.0) alpha:1];
    [station0001.drawPrimitives addObject:drawLine0002];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(255, 61.5);
    drawLine0001.endPoint = CGPointMake(255, 94.5);
    drawLine0001.width = 39;
    drawLine0001.color = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:drawLine0001];
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 38;
    drawTextLine0001.kernSpacing = 1.0;
    drawTextLine0001.origin = CGPointMake(303.5, 36.5);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];
    
    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0001.nameEnglish;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0002.fontSize = 30;
    drawTextLine0002.origin = CGPointMake(304, 79.5);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0002];
    
    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1420;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(255, 77.5);
    drawLine0003.endPoint = CGPointMake(255, 244);
    drawLine0003.width = 30;
    drawLine0003.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0003];

    // Добавлям станцию "Уралмаш"
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Уралмаш";
    station0002.nameEnglish = @"Uralmash";
    station0002.mapLocation = CGPointMake(255, 244);
    station0002.geoLocation = CGPointMake(56.888635, 60.613578);

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(255, 218.5);
    drawLine0004.endPoint = CGPointMake(255, 269.5);
    drawLine0004.width = 60;
    drawLine0004.color = [UIColor colorWithRed:(244/255.0) green:(143/255.0) blue:(44/255.0) alpha:1];
    [station0002.drawPrimitives addObject:drawLine0004];
    
    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(255, 227.5);
    drawLine0005.endPoint = CGPointMake(255, 260.5);
    drawLine0005.width = 39;
    drawLine0005.color = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:drawLine0005];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0002.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 38;
    drawTextLine0003.kernSpacing = 1.0;
    drawTextLine0003.origin = CGPointMake(303.5, 200.5);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];
    
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0002.nameEnglish;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0004.fontSize = 30;
    drawTextLine0004.origin = CGPointMake(304, 243.5);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0004];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1138;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(255, 243.5);
    drawLine0006.endPoint = CGPointMake(255, 416);
    drawLine0006.width = 30;
    drawLine0006.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0006];

    // Добавлям станцию "Машиностроителей"
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Машиностроителей";
    station0003.nameEnglish = @"Mashinostroiteley";
    station0003.mapLocation = CGPointMake(255, 416);
    station0003.geoLocation = CGPointMake(56.878850, 60.611427);

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(255, 390.5);
    drawLine0007.endPoint = CGPointMake(255, 441.5);
    drawLine0007.width = 60;
    drawLine0007.color = [UIColor colorWithRed:(244/255.0) green:(143/255.0) blue:(44/255.0) alpha:1];
    [station0003.drawPrimitives addObject:drawLine0007];
    
    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(255, 399.5);
    drawLine0008.endPoint = CGPointMake(255, 432.5);
    drawLine0008.width = 39;
    drawLine0008.color = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:drawLine0008];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0003.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 38;
    drawTextLine0005.kernSpacing = 1.0;
    drawTextLine0005.origin = CGPointMake(303.5, 373.5);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0003.nameEnglish;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0006.fontSize = 30;
    drawTextLine0006.origin = CGPointMake(304, 416.5);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 2381; // Расстояние по прямой, поскольку трассировка маршрута на Гугле-картах отсутствует
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(255, 415.5);
    drawLine0009.endPoint = CGPointMake(255, 459);
    drawLine0009.width = 30;
    drawLine0009.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0009];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(256, 454);
    drawLine0010.endPoint = CGPointMake(203.5, 588);
    drawLine0010.width = 30;
    drawLine0010.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0010];

    // Добавлям станцию "Уральская"
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Уральская";
    station0004.nameEnglish = @"Uralskaya";
    station0004.mapLocation = CGPointMake(202.5, 588);
    station0004.geoLocation = CGPointMake(56.858244, 60.600608);

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(202.5, 562.5);
    drawLine0011.endPoint = CGPointMake(202.5, 613.5);
    drawLine0011.width = 60;
    drawLine0011.color = [UIColor colorWithRed:(244/255.0) green:(143/255.0) blue:(44/255.0) alpha:1];
    [station0004.drawPrimitives addObject:drawLine0011];
    
    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(202.5, 571.5);
    drawLine0012.endPoint = CGPointMake(202.5, 604.5);
    drawLine0012.width = 39;
    drawLine0012.color = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:drawLine0012];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0004.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 38;
    drawTextLine0007.kernSpacing = 1.0;
    drawTextLine0007.origin = CGPointMake(250.5, 546.5);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];
    
    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0004.nameEnglish;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0008.fontSize = 30;
    drawTextLine0008.origin = CGPointMake(250, 589.5);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 1192; // Расстояние по прямой, поскольку трассировка маршрута на Гугле-картах отсутствует
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(203, 587.5);
    drawLine0013.endPoint = CGPointMake(161.5, 686);
    drawLine0013.width = 30;
    drawLine0013.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0013];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(163, 678);
    drawLine0014.endPoint = CGPointMake(163, 748);
    drawLine0014.width = 30;
    drawLine0014.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0014];

    // Добавлям станцию "Динамо"
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"Динамо";
    station0005.nameEnglish = @"Dinamo";
    station0005.mapLocation = CGPointMake(163, 748);
    station0005.geoLocation = CGPointMake(56.847543, 60.599905);
    
    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(163, 722.5);
    drawLine0015.endPoint = CGPointMake(163, 773.5);
    drawLine0015.width = 60;
    drawLine0015.color = [UIColor colorWithRed:(244/255.0) green:(143/255.0) blue:(44/255.0) alpha:1];
    [station0005.drawPrimitives addObject:drawLine0015];
    
    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(163, 731.5);
    drawLine0016.endPoint = CGPointMake(163, 764.5);
    drawLine0016.width = 39;
    drawLine0016.color = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:drawLine0016];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0005.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 38;
    drawTextLine0009.kernSpacing = 1.0;
    drawTextLine0009.origin = CGPointMake(206.5, 707.5);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0009];
    
    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0005.nameEnglish;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0010.fontSize = 30;
    drawTextLine0010.origin = CGPointMake(206.5, 750.5);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1265; // Расстояние по прямой, поскольку трассировка маршрута на Гугле-картах отсутствует
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(163, 747.5);
    drawLine0017.endPoint = CGPointMake(163, 912);
    drawLine0017.width = 30;
    drawLine0017.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0017];

    // Добавлям станцию "Площадь 1905 года"
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Площадь 1905 года";
    station0006.nameEnglish = @"Ploschad 1905 goda";
    station0006.mapLocation = CGPointMake(163, 912);
    station0006.geoLocation = CGPointMake(56.836360, 60.599591);

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(163, 886.5);
    drawLine0018.endPoint = CGPointMake(163, 937.5);
    drawLine0018.width = 60;
    drawLine0018.color = [UIColor colorWithRed:(244/255.0) green:(143/255.0) blue:(44/255.0) alpha:1];
    [station0006.drawPrimitives addObject:drawLine0018];
    
    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(163, 895.5);
    drawLine0019.endPoint = CGPointMake(163, 928.5);
    drawLine0019.width = 39;
    drawLine0019.color = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:drawLine0019];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0006.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 38;
    drawTextLine0011.kernSpacing = 1.0;
    drawTextLine0011.origin = CGPointMake(206.5, 813.5);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0011];
    
    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0006.nameEnglish;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0012.fontSize = 30;
    drawTextLine0012.origin = CGPointMake(206.5, 856.5);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0012];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1057; // Расстояние по прямой, поскольку трассировка маршрута на Гугле-картах отсутствует
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(163, 911.5);
    drawLine0020.endPoint = CGPointMake(163, 1132);
    drawLine0020.width = 30;
    drawLine0020.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0020];

    // Добавлям станцию "Геологическая"
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"Геологическая";
    station0007	.nameEnglish = @"Geologicheskaya";
    station0007.mapLocation = CGPointMake(163, 1132);
    station0007.geoLocation = CGPointMake(56.827068, 60.603144);
    
    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(163, 1106.5);
    drawLine0021.endPoint = CGPointMake(163, 1157.5);
    drawLine0021.width = 60;
    drawLine0021.color = [UIColor colorWithRed:(244/255.0) green:(143/255.0) blue:(44/255.0) alpha:1];
    [station0007.drawPrimitives addObject:drawLine0021];
    
    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(163, 1115.5);
    drawLine0022.endPoint = CGPointMake(163, 1148.5);
    drawLine0022.width = 39;
    drawLine0022.color = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:drawLine0022];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0007.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 38;
    drawTextLine0013.kernSpacing = 1.0;
    drawTextLine0013.origin = CGPointMake(206.5, 1126.5);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0013];
    
    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0007.nameEnglish;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0014.fontSize = 30;
    drawTextLine0014.origin = CGPointMake(206.5, 1169.5);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 2086; // Расстояние по прямой, поскольку трассировка маршрута на Гугле-картах отсутствует
    [edge0001.elements addObject:haul0007];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(163, 1131.5);
    drawLine0023.endPoint = CGPointMake(163, 1300);
    drawLine0023.width = 30;
    drawLine0023.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0023];

    // Добавлям станцию "Чкаловская"
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"Чкаловская";
    station0008.nameEnglish = @"Chkalovskaya";
    station0008.mapLocation = CGPointMake(163, 1300);
    station0008.geoLocation = CGPointMake(56.808580, 60.609966);

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(163, 1274.5);
    drawLine0024.endPoint = CGPointMake(163, 1325.5);
    drawLine0024.width = 60;
    drawLine0024.color = [UIColor colorWithRed:(244/255.0) green:(143/255.0) blue:(44/255.0) alpha:1];
    [station0008.drawPrimitives addObject:drawLine0024];
    
    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(163, 1283.5);
    drawLine0025.endPoint = CGPointMake(163, 1316.5);
    drawLine0025.width = 39;
    drawLine0025.color = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:drawLine0025];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0008.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 38;
    drawTextLine0015.kernSpacing = 1.0;
    drawTextLine0015.origin = CGPointMake(206.5, 1267.5);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0015];
    
    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0008.nameEnglish;
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0016.fontSize = 30;
    drawTextLine0016.origin = CGPointMake(206.5, 1310.5);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0016];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 1892; // Расстояние по прямой, поскольку трассировка маршрута на Гугле-картах отсутствует
    [edge0001.elements addObject:haul0008];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(163, 1299.5);
    drawLine0026.endPoint = CGPointMake(163, 1442);
    drawLine0026.width = 30;
    drawLine0026.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0026];

    // Добавлям станцию "Ботаническая"
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"Ботаническая";
    station0009.nameEnglish = @"Botanicheskay7a";
    station0009.mapLocation = CGPointMake(163, 1442);
    station0009.geoLocation = CGPointMake(56.797842, 60.633936);
    
    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(163, 1416.5);
    drawLine0027.endPoint = CGPointMake(163, 1467.5);
    drawLine0027.width = 60;
    drawLine0027.color = [UIColor colorWithRed:(244/255.0) green:(143/255.0) blue:(44/255.0) alpha:1];
    [station0009.drawPrimitives addObject:drawLine0027];
    
    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(163, 1425.5);
    drawLine0028.endPoint = CGPointMake(163, 1458.5);
    drawLine0028.width = 39;
    drawLine0028.color = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:drawLine0028];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0009.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 38;
    drawTextLine0017.kernSpacing = 1.0;
    drawTextLine0017.origin = CGPointMake(206.5, 1403.5);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0017];
    
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0009.nameEnglish;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0018.fontSize = 30;
    drawTextLine0018.origin = CGPointMake(206.5, 1447.5);
    [station0009.nameEnglishTextPrimitives addObject:drawTextLine0018];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    //-----------------------------

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(34, 912);
    drawLine0029.endPoint = CGPointMake(946, 912);
    drawLine0029.width = 30;
    drawLine0029.color = [UIColor colorWithRed:(205/255.0) green:(206/255.0) blue:(253/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0029];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(34, 1195);
    drawLine0030.endPoint = CGPointMake(946, 752);
    drawLine0030.width = 30;
    drawLine0030.color = [UIColor colorWithRed:(189/255.0) green:(253/255.0) blue:(189/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0030];
    
    return self;
}

@end
