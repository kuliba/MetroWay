//
//  MWAlgiersMetro.m
//  MetroWay
//
//  Created by Valentin Ozerov on 02.07.15.
//  Copyright (c) 2015 Valentin Ozerov. All rights reserved.
//

#import "MWAlgiersMetro.h"
#import "MWHaul.h"
#import "MWDrawTextLine.h"
#import "MWDrawLine.h"
#import "MWDrawFillCircle.h"

@implementation MWAlgiersMetro

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"algiers_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"(الخط 1 (اللون الأزرق";
    line0001.nameEnglish = @"Line 1";
    line0001.color = [UIColor colorWithRed:(77/255.0) green:(120/255.0) blue:(201/255.0) alpha:1];
    [self.lines addObject:line0001];
    
    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Tafourah - Grande Poste
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Tafourah - Grande Poste";
    [self.vertices addObject:vertex0001];
    
    // Haï El Badr
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Haï El Badr";
    [self.vertices addObject:vertex0002];

    ////////////////////////////////////////////////////////////////
    // Line 1
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Tafourah - Grande Poste - Haï El Badr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Tafourah - Grande Poste - Haï El Badr";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Tafourah - Grande Poste
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"تافورة-البريد المركزي";
    station0001.nameEnglish = @"Tafourah - Grande Poste";
    station0001.mapLocation = CGPointMake(220.5, 247.5);
    station0001.geoLocation = CGPointMake(36.771944, 3.058056);

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(213, 240);
    drawLine0001.endPoint = CGPointMake(229, 255);
    drawLine0001.width = 22;
    drawLine0001.color = line0001.color;
    [station0001.drawPrimitives addObject:drawLine0001];

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 28;
    drawTextLine0001.degrees = 0;
    drawTextLine0001.origin = CGPointMake(5, 229);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = @"Grande Poste";
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor grayColor];
    drawTextLine0002.fontSize = 18;
    drawTextLine0002.degrees = 0;
    drawTextLine0002.origin = CGPointMake(91, 210);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 733;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(224, 247.5);
    drawLine0002.endPoint = CGPointMake(186, 326.5);
    drawLine0002.width = 10;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию Khelifa Boukhalfa
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"خليفة بوخالفة";
    station0002.nameEnglish = @"Khelifa Boukhalfa";
    station0002.mapLocation = CGPointMake(186, 326.5);
    station0002.geoLocation = CGPointMake(36.766389, 3.053611);

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = station0002.mapLocation;
    fillCircle0001.radius = 12;
    fillCircle0001.fillColor = line0001.color;
    [station0002.drawPrimitives addObject:fillCircle0001];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0002.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 28;
    drawTextLine0003.degrees = 0;
    drawTextLine0003.origin = CGPointMake(43, 308);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0002.nameEnglish;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor grayColor];
    drawTextLine0004.fontSize = 18;
    drawTextLine0004.degrees = 0;
    drawTextLine0004.origin = CGPointMake(40, 289);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0004];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 665;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(186, 326);
    drawLine0003.endPoint = CGPointMake(200.5, 374);
    drawLine0003.width = 10;
    drawLine0003.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0003];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(199.5, 372.5);
    drawLine0004.endPoint = CGPointMake(219.5, 394.5);
    drawLine0004.width = 10;
    drawLine0004.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию 1er Mai
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"شارع 1 ماي";
    station0003.nameEnglish = @"1er Mai";
    station0003.mapLocation = CGPointMake(219.5, 394.5);
    station0003.geoLocation = CGPointMake(36.760556, 3.055278);

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0003.mapLocation;
    fillCircle0002.radius = 12;
    fillCircle0002.fillColor = line0001.color;
    [station0003.drawPrimitives addObject:fillCircle0002];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0003.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 28;
    drawTextLine0005.degrees = 0;
    drawTextLine0005.origin = CGPointMake(77, 380);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0003.nameEnglish;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor grayColor];
    drawTextLine0006.fontSize = 18;
    drawTextLine0006.degrees = 0;
    drawTextLine0006.origin = CGPointMake(125, 361);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 524;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(219, 394);
    drawLine0005.endPoint = CGPointMake(268.5, 434.5);
    drawLine0005.width = 10;
    drawLine0005.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0005];

    // Добавляем станцию Aïssat Idir
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"شارع عيسات إيدير";
    station0004.nameEnglish = @"Aïssat Idir";
    station0004.mapLocation = CGPointMake(268.5, 434.5);
    station0004.geoLocation = CGPointMake(36.756667, 3.058611);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0004.mapLocation;
    fillCircle0003.radius = 12;
    fillCircle0003.fillColor = line0001.color;
    [station0004.drawPrimitives addObject:fillCircle0003];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0004.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 28;
    drawTextLine0007.degrees = 0;
    drawTextLine0007.origin = CGPointMake(75, 437);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0004.nameEnglish;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor grayColor];
    drawTextLine0008.fontSize = 18;
    drawTextLine0008.degrees = 0;
    drawTextLine0008.origin = CGPointMake(158, 418);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 801;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(268, 434);
    drawLine0006.endPoint = CGPointMake(327.5, 482.5);
    drawLine0006.width = 10;
    drawLine0006.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Hamma
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"الحامة";
    station0005.nameEnglish = @"Hamma";
    station0005.mapLocation = CGPointMake(327.5, 482.5);
    station0005.geoLocation = CGPointMake(36.753056, 3.066389);

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0005.mapLocation;
    fillCircle0004.radius = 12;
    fillCircle0004.fillColor = line0001.color;
    [station0005.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0005.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 28;
    drawTextLine0009.degrees = 0;
    drawTextLine0009.origin = CGPointMake(254, 490);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0009];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0005.nameEnglish;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor grayColor];
    drawTextLine0010.fontSize = 18;
    drawTextLine0010.degrees = 0;
    drawTextLine0010.origin = CGPointMake(242, 471);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 855;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(327, 482);
    drawLine0007.endPoint = CGPointMake(383.5, 544.5);
    drawLine0007.width = 10;
    drawLine0007.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Jardin d'essai
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"حديقة التجارب";
    station0006.nameEnglish = @"Jardin d'essai";
    station0006.mapLocation = CGPointMake(383.5, 544.5);
    station0006.geoLocation = CGPointMake(36.746944, 3.072222);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0006.mapLocation;
    fillCircle0005.radius = 12;
    fillCircle0005.fillColor = line0001.color;
    [station0006.drawPrimitives addObject:fillCircle0005];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0006.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 28;
    drawTextLine0011.degrees = 0;
    drawTextLine0011.origin = CGPointMake(232, 540);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0011];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0006.nameEnglish;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor grayColor];
    drawTextLine0012.fontSize = 18;
    drawTextLine0012.degrees = 0;
    drawTextLine0012.origin = CGPointMake(240, 521);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0012];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1099;
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(383, 544);
    drawLine0008.endPoint = CGPointMake(455.5, 584.5);
    drawLine0008.width = 10;
    drawLine0008.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0008];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(454, 584);
    drawLine0009.endPoint = CGPointMake(478, 589);
    drawLine0009.width = 10;
    drawLine0009.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Les Fusillés
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"المعدومين";
    station0007.nameEnglish = @"Les Fusillés";
    station0007.mapLocation = CGPointMake(478, 589);
    station0007.geoLocation = CGPointMake(36.742222, 3.083056);

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0007.mapLocation;
    fillCircle0006.radius = 12;
    fillCircle0006.fillColor = line0001.color;
    [station0007.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0007.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 28;
    drawTextLine0013.degrees = 0;
    drawTextLine0013.origin = CGPointMake(377, 591);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0013];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0007.nameEnglish;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor grayColor];
    drawTextLine0014.fontSize = 18;
    drawTextLine0014.degrees = 0;
    drawTextLine0014.origin = CGPointMake(330, 572);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 1106;
    [edge0001.elements addObject:haul0007];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(477.5, 589);
    drawLine0010.endPoint = CGPointMake(533, 601);
    drawLine0010.width = 10;
    drawLine0010.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0010];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(531.5, 600.5);
    drawLine0011.endPoint = CGPointMake(603, 633);
    drawLine0011.width = 10;
    drawLine0011.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0011];

    // Добавляем станцию Cité Amirouche
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"حي عميروش";
    station0008.nameEnglish = @"Cité Amirouche";
    station0008.mapLocation = CGPointMake(603, 633);
    station0008.geoLocation = CGPointMake(36.737778, 3.094167);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0008.mapLocation;
    fillCircle0007.radius = 12;
    fillCircle0007.fillColor = line0001.color;
    [station0008.drawPrimitives addObject:fillCircle0007];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0008.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 28;
    drawTextLine0015.degrees = 0;
    drawTextLine0015.origin = CGPointMake(470, 641);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0015];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0008.nameEnglish;
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor grayColor];
    drawTextLine0016.fontSize = 18;
    drawTextLine0016.degrees = 0;
    drawTextLine0016.origin = CGPointMake(435, 622);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0016];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 792;
    [edge0001.elements addObject:haul0008];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(602.5, 632.5);
    drawLine0012.endPoint = CGPointMake(668, 681);
    drawLine0012.width = 10;
    drawLine0012.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию Cité Mer et Soleil
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"حي البحر والشمس";
    station0009.nameEnglish = @"Cité Mer et Soleil";
    station0009.mapLocation = CGPointMake(668, 681);
    station0009.geoLocation = CGPointMake(36.733333, 3.101111);

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0009.mapLocation;
    fillCircle0008.radius = 12;
    fillCircle0008.fillColor = line0001.color;
    [station0009.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0009.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 28;
    drawTextLine0017.degrees = 0;
    drawTextLine0017.origin = CGPointMake(665, 631);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0017];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0009.nameEnglish;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor grayColor];
    drawTextLine0018.fontSize = 18;
    drawTextLine0018.degrees = 0;
    drawTextLine0018.origin = CGPointMake(665, 612);
    [station0009.nameEnglishTextPrimitives addObject:drawTextLine0018];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 901;
    [edge0001.elements addObject:haul0009];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(667.5, 681);
    drawLine0013.endPoint = CGPointMake(678, 757.5);
    drawLine0013.width = 10;
    drawLine0013.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0013];

    // Добавляем станцию Haï El Badr
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0001.elements addObject:station0010];
    
    station0010.nameOriginal = @"حي البدر";
    station0010.nameEnglish = @"Haï El Badr";
    station0010.mapLocation = CGPointMake(678, 757.5);
    station0010.geoLocation = CGPointMake(36.725278, 3.102222);
    
    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(671, 749);
    drawLine0014.endPoint = CGPointMake(686, 765);
    drawLine0014.width = 22;
    drawLine0014.color = line0001.color;
    [station0010.drawPrimitives addObject:drawLine0014];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0010.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 28;
    drawTextLine0019.degrees = 0;
    drawTextLine0019.origin = CGPointMake(565, 734);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0019];
    
    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0010.nameEnglish;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor grayColor];
    drawTextLine0020.fontSize = 18;
    drawTextLine0020.degrees = 0;
    drawTextLine0020.origin = CGPointMake(565, 715);
    [station0010.nameEnglishTextPrimitives addObject:drawTextLine0020];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    //////////////////////
    
    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = @"1 باش الجراح";
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 18;
    drawTextLine0021.degrees = 0;
    drawTextLine0021.origin = CGPointMake(670, 820);
    [self.additionalOverMapPrimitives addObject:drawTextLine0021];
    
    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = @"Bachdjara 1";
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor grayColor];
    drawTextLine0022.fontSize = 12;
    drawTextLine0022.degrees = 0;
    drawTextLine0022.origin = CGPointMake(684, 844);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0022];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = @"2 باش جراح";
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 18;
    drawTextLine0023.degrees = 0;
    drawTextLine0023.origin = CGPointMake(770, 800);
    [self.additionalOverMapPrimitives addObject:drawTextLine0023];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"Bachdjara 2";
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor grayColor];
    drawTextLine0024.fontSize = 12;
    drawTextLine0024.degrees = 0;
    drawTextLine0024.origin = CGPointMake(779, 824);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"الحراش-محطة";
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 18;
    drawTextLine0025.degrees = 0;
    drawTextLine0025.origin = CGPointMake(835, 777);
    [self.additionalOverMapPrimitives addObject:drawTextLine0025];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = @"El Harrach Gare";
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor grayColor];
    drawTextLine0026.fontSize = 12;
    drawTextLine0026.degrees = 0;
    drawTextLine0026.origin = CGPointMake(870, 801);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0026];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = @"وسط الحراش";
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 18;
    drawTextLine0027.degrees = 0;
    drawTextLine0027.origin = CGPointMake(835, 717);
    [self.additionalOverMapPrimitives addObject:drawTextLine0027];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"El Harrach Centre";
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor grayColor];
    drawTextLine0028.fontSize = 12;
    drawTextLine0028.degrees = 0;
    drawTextLine0028.origin = CGPointMake(832, 703);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0028];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = @"1 عين النعجة";
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 18;
    drawTextLine0029.degrees = 0;
    drawTextLine0029.origin = CGPointMake(502, 901);
    [self.additionalOverMapPrimitives addObject:drawTextLine0029];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"Aïn Naâdja 1";
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor grayColor];
    drawTextLine0030.fontSize = 12;
    drawTextLine0030.degrees = 0;
    drawTextLine0030.origin = CGPointMake(508, 887);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0030];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"2 عين النعجة";
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 18;
    drawTextLine0031.degrees = 0;
    drawTextLine0031.origin = CGPointMake(405, 948);
    [self.additionalOverMapPrimitives addObject:drawTextLine0031];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = @"Aïn Naâdja 2";
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor grayColor];
    drawTextLine0032.fontSize = 12;
    drawTextLine0032.degrees = 0;
    drawTextLine0032.origin = CGPointMake(408, 934);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0032];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = @"علي بومنجل";
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 18;
    drawTextLine0033.degrees = 0;
    drawTextLine0033.origin = CGPointMake(115, 123);
    [self.additionalOverMapPrimitives addObject:drawTextLine0033];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = @"Ali Boumendjel";
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor grayColor];
    drawTextLine0034.fontSize = 12;
    drawTextLine0034.degrees = 0;
    drawTextLine0034.origin = CGPointMake(108, 109);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0034];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = @"ساحة الشهداء";
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 18;
    drawTextLine0035.degrees = 0;
    drawTextLine0035.origin = CGPointMake(63, 48);
    [self.additionalOverMapPrimitives addObject:drawTextLine0035];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = @"Place des Martyrs";
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor grayColor];
    drawTextLine0036.fontSize = 12;
    drawTextLine0036.degrees = 0;
    drawTextLine0036.origin = CGPointMake(60, 34);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0036];

    return self;
}

@end
