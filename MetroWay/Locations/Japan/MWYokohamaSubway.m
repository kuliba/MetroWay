//
//  MMYokohamaSubway.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 08.09.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWYokohamaSubway.h"

@implementation MWYokohamaSubway

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"yokohama_subway";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Blue Line
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"ブルーライン";
    line0001.nameEnglish = @"Blue Line";
    line0001.color = [UIColor colorWithRed:(0/255.0) green:(107/255.0) blue:(240/255.0) alpha:1];
    [self.lines addObject:line0001];

    // 1. Green Line
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"ブルーライン";
    line0002.nameEnglish = @"Green Line";
    line0002.color = [UIColor colorWithRed:(64/255.0) green:(204/255.0) blue:(64/255.0) alpha:1];
    [self.lines addObject:line0002];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0001];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Azamino
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Azamino";
    [self.vertices addObject:vertex0001];

    // Center Kita
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Center Kita";
    [self.vertices addObject:vertex0002];

    // Center Minami
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Center Minami";
    [self.vertices addObject:vertex0003];

    // Shonandai
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Shonandai";
    [self.vertices addObject:vertex0004];

    // Nakayama
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Nakayama";
    [self.vertices addObject:vertex0005];

    // Hiyoshi
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Hiyoshi";
    [self.vertices addObject:vertex0006];

    ////////////////////////////////////////////////////////////////
    // 1. Blue Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Azamino - Center Kita
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Azamino - Center Kita";
    [self.edges addObject:edge0001];

    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Azamino
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"あざみ野";
    station0001.nameEnglish = @"Azamino";
    station0001.geoLocation = CGPointMake(35.568708, 139.55345);
    station0001.mapLocation = CGPointMake(1523, 151);
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 38;
    drawTextLine0001.origin = CGPointMake(1340, 144);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0001.nameEnglish;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 38;
    drawTextLine0002.origin = CGPointMake(1343, 99);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0002];

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = station0001.mapLocation;
    fillCircle0001.radius = 16.75;
    fillCircle0001.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0001.mapLocation;
    fillCircle0002.radius = 13.5;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1500;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(1523, 151);
    drawLine0001.endPoint = CGPointMake(1560.5, 156);
    drawLine0001.width = 34;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(1549, 235.5);
    drawArc0001.startRadians = 277.5 * M_PI / 180;
    drawArc0001.endRadians = 296 * M_PI / 180;
    drawArc0001.radius = 80;
    drawArc0001.width = 34;
    drawArc0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(1583, 163);
    drawLine0002.endPoint = CGPointMake(1620, 182);
    drawLine0002.width = 34;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(1652, 108.75);
    drawArc0002.startRadians = 100 * M_PI / 180;
    drawArc0002.endRadians = 115 * M_PI / 180;
    drawArc0002.radius = 80;
    drawArc0002.width = 34;
    drawArc0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0002];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(1637, 187.5);
    drawLine0003.endPoint = CGPointMake(1685.5, 196);
    drawLine0003.width = 34;
    drawLine0003.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0003];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(1671, 274.5);
    drawArc0003.startRadians = 280 * M_PI / 180;
    drawArc0003.endRadians = 310 * M_PI / 180;
    drawArc0003.radius = 80;
    drawArc0003.width = 34;
    drawArc0003.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(1722, 212.5);
    drawLine0004.endPoint = CGPointMake(1757, 241.5);
    drawLine0004.width = 34;
    drawLine0004.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Nakagawa
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"中川";
    station0002.nameEnglish = @"Nakagawa";
    station0002.geoLocation = CGPointMake(35.562972, 139.569847);
    station0002.mapLocation = CGPointMake(1757, 241.5);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0002.mapLocation;
    fillCircle0003.radius = 13.5;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0003];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0002.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 38;
    drawTextLine0003.origin = CGPointMake(1650, 276);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0002.nameEnglish;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 38;
    drawTextLine0004.origin = CGPointMake(1545, 232);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0004];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1600;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(1756.5, 241);
    drawLine0005.endPoint = CGPointMake(1820.5, 292);
    drawLine0005.width = 34;
    drawLine0005.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0005];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(1870, 229);
    drawArc0004.startRadians = 115 * M_PI / 180;
    drawArc0004.endRadians = 129 * M_PI / 180;
    drawArc0004.radius = 80;
    drawArc0004.width = 34;
    drawArc0004.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(1834, 300.5);
    drawLine0006.endPoint = CGPointMake(1856, 309.5);
    drawLine0006.width = 34;
    drawLine0006.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0006];
    
    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(1835, 344);
    drawArc0005.startRadians = 295 * M_PI / 180;
    drawArc0005.endRadians = 14 * M_PI / 180;
    drawArc0005.radius = 40;
    drawArc0005.width = 34;
    drawArc0005.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(1874, 353);
    drawLine0007.endPoint = CGPointMake(1863, 400);
    drawLine0007.width = 34;
    drawLine0007.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Center Kita
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"センター北";
    station0003.nameEnglish = @"Center Kita";
    station0003.geoLocation = CGPointMake(35.5534, 139.5785);
    station0003.mapLocation = CGPointMake(1863, 399);

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0003.mapLocation;
    fillCircle0004.radius = 13.5;
    fillCircle0004.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0003.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 38;
    drawTextLine0005.origin = CGPointMake(1629, 391);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0003.nameEnglish;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 38;
    drawTextLine0006.origin = CGPointMake(1624, 343);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0006];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    // Создаем участок линии Center Kita - Center Minami
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Center Kita - Center Minami";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;

    // Добавляем станцию Center Kita
    [edge0002.elements addObject:station0003];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 900;
    [edge0002.elements addObject:haul0003];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(1864, 397.5);
    drawLine0008.endPoint = CGPointMake(1808, 537);
    drawLine0008.width = 34;
    drawLine0008.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Center Minami
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0002.elements addObject:station0004];
    
    station0004.nameOriginal = @"センター南";
    station0004.nameEnglish = @"Center Minami";
    station0004.geoLocation = CGPointMake(35.545475, 139.574289);
    station0004.mapLocation = CGPointMake(1808, 537);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0004.mapLocation;
    fillCircle0005.radius = 13.5;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0005];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0004.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 38;
    drawTextLine0007.origin = CGPointMake(1581, 524);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0004.nameEnglish;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 38;
    drawTextLine0008.origin = CGPointMake(1521, 478);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0008];

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;

    // Создаем участок линии Center Minami - Shonandai
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Center Minami - Shonandai";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;

    // Добавляем станцию Center Minami
    [edge0003.elements addObject:station0004];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 2300;
    [edge0003.elements addObject:haul0004];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(1808.5, 536.5);
    drawLine0009.endPoint = CGPointMake(1783.5, 594);
    drawLine0009.width = 34;
    drawLine0009.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0009];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(1839, 617);
    drawArc0006.startRadians = 99 * M_PI / 180;
    drawArc0006.endRadians = 203 * M_PI / 180;
    drawArc0006.radius = 60;
    drawArc0006.width = 34;
    drawArc0006.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawArc0006];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(1828, 676);
    drawLine0010.endPoint = CGPointMake(1898.5, 684);
    drawLine0010.width = 34;
    drawLine0010.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0010];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(1881, 803);
    drawArc0007.startRadians = 277.5 * M_PI / 180;
    drawArc0007.endRadians = 286 * M_PI / 180;
    drawArc0007.radius = 120;
    drawArc0007.width = 34;
    drawArc0007.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(1913.5, 687.5);
    drawLine0011.endPoint = CGPointMake(2037.5, 723.5);
    drawLine0011.width = 34;
    drawLine0011.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0011];

    // Добавляем станцию Nakamachidai
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0003.elements addObject:station0005];
    
    station0005.nameOriginal = @"仲町台";
    station0005.nameEnglish = @"Nakamachidai";
    station0005.geoLocation = CGPointMake(35.535308, 139.589483);
    station0005.mapLocation = CGPointMake(2037, 723.5);

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0005.mapLocation;
    fillCircle0006.radius = 13.5;
    fillCircle0006.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0005.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 38;
    drawTextLine0009.origin = CGPointMake(1928, 786);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0009];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0005.nameEnglish;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 38;
    drawTextLine0010.origin = CGPointMake(1799, 741);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 2300;
    [edge0003.elements addObject:haul0005];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(2036, 723);
    drawLine0012.endPoint = CGPointMake(2118, 739);
    drawLine0012.width = 34;
    drawLine0012.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0012];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(2091, 856);
    drawArc0008.startRadians = 282 * M_PI / 180;
    drawArc0008.endRadians = 287 * M_PI / 180;
    drawArc0008.radius = 120;
    drawArc0008.width = 34;
    drawArc0008.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(2125.5, 741);
    drawLine0013.endPoint = CGPointMake(2322, 803);
    drawLine0013.width = 34;
    drawLine0013.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0013];

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(2309, 841);
    drawArc0009.startRadians = 288 * M_PI / 180;
    drawArc0009.endRadians = 345 * M_PI / 180;
    drawArc0009.radius = 40;
    drawArc0009.width = 34;
    drawArc0009.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawArc0009];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(2347.5, 830);
    drawLine0014.endPoint = CGPointMake(2356.5, 862);
    drawLine0014.width = 34;
    drawLine0014.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0014];

    // Добавляем станцию Nippa
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0003.elements addObject:station0006];
    
    station0006.nameOriginal = @"新羽";
    station0006.nameEnglish = @"Nippa";
    station0006.geoLocation = CGPointMake(35.527589, 139.611783);
    station0006.mapLocation = CGPointMake(2356.5, 860);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0006.mapLocation;
    fillCircle0007.radius = 13.5;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0007];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0006.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 38;
    drawTextLine0011.origin = CGPointMake(2243, 869.5);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0011];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0006.nameEnglish;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 38;
    drawTextLine0012.origin = CGPointMake(2220, 826);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0012];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1000;
    [edge0003.elements addObject:haul0006];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(2356, 858.5);
    drawLine0015.endPoint = CGPointMake(2367.5, 1004.5);
    drawLine0015.width = 34;
    drawLine0015.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0015];

    // Добавляем станцию Kita Shin-yokohama
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0003.elements addObject:station0007];
    
    station0007.nameOriginal = @"北新横浜";
    station0007.nameEnglish = @"Kita Shin-yokohama";
    station0007.geoLocation = CGPointMake(35.519167, 139.612778);
    station0007.mapLocation = CGPointMake(2367.5, 1004.5);

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0007.mapLocation;
    fillCircle0008.radius = 13.5;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0007.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 38;
    drawTextLine0013.origin = CGPointMake(2183, 1005);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0013];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0007.nameEnglish;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 38;
    drawTextLine0014.origin = CGPointMake(1990, 958);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 1300;
    [edge0003.elements addObject:haul0007];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(2367.5, 1004);
    drawLine0016.endPoint = CGPointMake(2373, 1109);
    drawLine0016.width = 34;
    drawLine0016.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0016];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(2413, 1106);
    drawArc0010.startRadians = 135 * M_PI / 180;
    drawArc0010.endRadians = 177 * M_PI / 180;
    drawArc0010.radius = 40;
    drawArc0010.width = 34;
    drawArc0010.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawArc0010];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(2384, 1133.5);
    drawLine0017.endPoint = CGPointMake(2440, 1189.5);
    drawLine0017.width = 34;
    drawLine0017.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0017];

    // Добавляем станцию Shin-Yokohama
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0003.elements addObject:station0008];
    
    station0008.nameOriginal = @"新横浜";
    station0008.nameEnglish = @"Shin-Yokohama";
    station0008.geoLocation = CGPointMake(35.5075, 139.6175);
    station0008.mapLocation = CGPointMake(2439.5, 1189);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0008.mapLocation;
    fillCircle0009.radius = 13.5;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0009];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0008.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 38;
    drawTextLine0015.origin = CGPointMake(2285, 1208);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0015];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0008.nameEnglish;
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 38;
    drawTextLine0016.origin = CGPointMake(2132, 1162);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0016];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 1600;
    [edge0003.elements addObject:haul0008];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(2438.5, 1188);
    drawLine0018.endPoint = CGPointMake(2453, 1207);
    drawLine0018.width = 34;
    drawLine0018.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0018];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(2404, 1242);
    drawArc0011.startRadians = 320 * M_PI / 180;
    drawArc0011.endRadians = 340 * M_PI / 180;
    drawArc0011.radius = 60;
    drawArc0011.width = 34;
    drawArc0011.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(2460, 1220.5);
    drawLine0019.endPoint = CGPointMake(2473.5, 1265);
    drawLine0019.width = 34;
    drawLine0019.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0019];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(2416, 1282);
    drawArc0012.startRadians = 343 * M_PI / 180;
    drawArc0012.endRadians = 30 * M_PI / 180;
    drawArc0012.radius = 60;
    drawArc0012.width = 34;
    drawArc0012.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawArc0012];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(2468.5, 1311);
    drawLine0020.endPoint = CGPointMake(2446, 1344);
    drawLine0020.width = 34;
    drawLine0020.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0020];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(2498, 1374);
    drawArc0013.startRadians = 198.5 * M_PI / 180;
    drawArc0013.endRadians = 212 * M_PI / 180;
    drawArc0013.radius = 60;
    drawArc0013.width = 34;
    drawArc0013.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawArc0013];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(2441.5, 1354);
    drawLine0021.endPoint = CGPointMake(2423.5, 1410);
    drawLine0021.width = 34;
    drawLine0021.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0021];

    // Добавляем станцию Kishine-kōen
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0003.elements addObject:station0009];
    
    station0009.nameOriginal = @"岸根公園";
    station0009.nameEnglish = @"Kishine-kōen";
    station0009.geoLocation = CGPointMake(35.496042, 139.617064);
    station0009.mapLocation = CGPointMake(2424, 1409);

    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0009.mapLocation;
    fillCircle0010.radius = 13.5;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0009.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 38;
    drawTextLine0017.origin = CGPointMake(2244, 1368);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0017];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0009.nameEnglish;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 38;
    drawTextLine0018.origin = CGPointMake(2172, 1324);
    [station0009.nameEnglishTextPrimitives addObject:drawTextLine0018];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 1200;
    [edge0003.elements addObject:haul0009];
    
    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(2424.5, 1407.5);
    drawLine0022.endPoint = CGPointMake(2415, 1426.5);
    drawLine0022.width = 34;
    drawLine0022.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0022];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(2380, 1407);
    drawArc0014.startRadians = 28 * M_PI / 180;
    drawArc0014.endRadians = 86.5 * M_PI / 180;
    drawArc0014.radius = 40;
    drawArc0014.width = 34;
    drawArc0014.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(2346, 1449);
    drawLine0023.endPoint = CGPointMake(2383, 1447);
    drawLine0023.width = 34;
    drawLine0023.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0023];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(2351, 1509);
    drawArc0015.startRadians = 209 * M_PI / 180;
    drawArc0015.endRadians = 266 * M_PI / 180;
    drawArc0015.radius = 60;
    drawArc0015.width = 34;
    drawArc0015.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(2299, 1479.5);
    drawLine0024.endPoint = CGPointMake(2281, 1511);
    drawLine0024.width = 34;
    drawLine0024.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Katakurachō
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0003.elements addObject:station0010];
    
    station0010.nameOriginal = @"片倉町";
    station0010.nameEnglish = @"Katakurachō";
    station0010.geoLocation = CGPointMake(35.490206, 139.606511);
    station0010.mapLocation = CGPointMake(2281, 1511);

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0010.mapLocation;
    fillCircle0011.radius = 13.5;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0011];
    
    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0010.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 38;
    drawTextLine0019.origin = CGPointMake(2117, 1499);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0019];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0010.nameEnglish;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 38;
    drawTextLine0020.origin = CGPointMake(2016, 1455);
    [station0010.nameEnglishTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1900;
    [edge0003.elements addObject:haul0010];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(2281.5, 1510.5);
    drawLine0025.endPoint = CGPointMake(2233.2, 1594.5);
    drawLine0025.width = 34;
    drawLine0025.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0025];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(2407, 1693);
    drawArc0016.startRadians = 170 * M_PI / 180;
    drawArc0016.endRadians = 210 * M_PI / 180;
    drawArc0016.radius = 200;
    drawArc0016.width = 34;
    drawArc0016.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawArc0016];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(2209.2, 1725);
    drawLine0026.endPoint = CGPointMake(2211.5, 1734.5);
    drawLine0026.width = 34;
    drawLine0026.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0026];

    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(2231, 1729);
    drawArc0017.startRadians = 90 * M_PI / 180;
    drawArc0017.endRadians = 170 * M_PI / 180;
    drawArc0017.radius = 20;
    drawArc0017.width = 34;
    drawArc0017.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawArc0017];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(2230.5, 1749);
    drawLine0027.endPoint = CGPointMake(2263.5, 1749.5);
    drawLine0027.width = 34;
    drawLine0027.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0027];

    // Добавляем станцию Mitsuzawa-kamichō
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0003.elements addObject:station0011];
    
    station0011.nameOriginal = @"三ツ沢上町";
    station0011.nameEnglish = @"Mitsuzawa-kamichō";
    station0011.geoLocation = CGPointMake(35.476525, 139.605394);
    station0011.mapLocation = CGPointMake(2263.5, 1749.5);

    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0011.mapLocation;
    fillCircle0012.radius = 13.5;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0012];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0011.nameOriginal;
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 38;
    drawTextLine0021.origin = CGPointMake(2080, 1814);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0021];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0011.nameEnglish;
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 38;
    drawTextLine0022.origin = CGPointMake(1924, 1767);
    [station0011.nameEnglishTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 900;
    [edge0003.elements addObject:haul0011];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(2263, 1749.5);
    drawLine0028.endPoint = CGPointMake(2397.5, 1748);
    drawLine0028.width = 34;
    drawLine0028.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0028];

    // Добавляем станцию Mitsuzawa-shimochō
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0003.elements addObject:station0012];
    
    station0012.nameOriginal = @"三ツ沢下町";
    station0012.nameEnglish = @"Mitsuzawa-shimochō";
    station0012.geoLocation = CGPointMake(35.476511, 139.614794);
    station0012.mapLocation = CGPointMake(2397.5, 1748);

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0012.mapLocation;
    fillCircle0013.radius = 13.5;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0013];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0012.nameOriginal;
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 38;
    drawTextLine0023.origin = CGPointMake(2390, 1676);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0023];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = station0012.nameEnglish;
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 38;
    drawTextLine0024.origin = CGPointMake(2390, 1630);
    [station0012.nameEnglishTextPrimitives addObject:drawTextLine0024];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1400;
    [edge0003.elements addObject:haul0012];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(2397, 1748);
    drawLine0029.endPoint = CGPointMake(2411, 1748);
    drawLine0029.width = 34;
    drawLine0029.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0029];

    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(2411, 1788);
    drawArc0018.startRadians = 270 * M_PI / 180;
    drawArc0018.endRadians = 358 * M_PI / 180;
    drawArc0018.radius = 40;
    drawArc0018.width = 34;
    drawArc0018.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(2451, 1786);
    drawLine0030.endPoint = CGPointMake(2453, 1867.5);
    drawLine0030.width = 34;
    drawLine0030.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0030];

    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(2653, 1863);
    drawArc0019.startRadians = 164 * M_PI / 180;
    drawArc0019.endRadians = 179 * M_PI / 180;
    drawArc0019.radius = 200;
    drawArc0019.width = 34;
    drawArc0019.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawArc0019];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(2476, 1950);
    drawLine0031.endPoint = CGPointMake(2460.1, 1915.5);
    drawLine0031.width = 34;
    drawLine0031.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0031];

    // Добавляем станцию Yokohama
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0003.elements addObject:station0013];
    
    station0013.nameOriginal = @"横浜";
    station0013.nameEnglish = @"Yokohama";
    station0013.geoLocation = CGPointMake(35.465444, 139.622836);
    station0013.mapLocation = CGPointMake(2476, 1950);
    
    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0013.mapLocation;
    fillCircle0014.radius = 13.5;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0014];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = station0013.nameOriginal;
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 38;
    drawTextLine0025.origin = CGPointMake(2360, 1947);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0025];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0013.nameEnglish;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 38;
    drawTextLine0026.origin = CGPointMake(2258, 1899);
    [station0013.nameEnglishTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 900;
    [edge0003.elements addObject:haul0013];

    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(2388.5, 1998.5);
    drawArc0020.startRadians = 330 * M_PI / 180;
    drawArc0020.endRadians = 347 * M_PI / 180;
    drawArc0020.radius = 100;
    drawArc0020.width = 34;
    drawArc0020.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawArc0020];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(2485.75, 1975);
    drawLine0032.endPoint = CGPointMake(2493.5, 2006);
    drawLine0032.width = 34;
    drawLine0032.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0032];

    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(2590, 1979);
    drawArc0021.startRadians = 145 * M_PI / 180;
    drawArc0021.endRadians = 164.7505 * M_PI / 180;
    drawArc0021.radius = 100;
    drawArc0021.width = 34;
    drawArc0021.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawArc0021];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(2507, 2034.5);
    drawLine0033.endPoint = CGPointMake(2525, 2064);
    drawLine0033.width = 34;
    drawLine0033.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0033];

    // Добавляем станцию Takashimachō
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0003.elements addObject:station0014];
    
    station0014.nameOriginal = @"高島町";
    station0014.nameEnglish = @"Takashimachō";
    station0014.geoLocation = CGPointMake(35.4586, 139.6239);
    station0014.mapLocation = CGPointMake(2525, 2064);

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0014.mapLocation;
    fillCircle0015.radius = 13.5;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0015];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0014.nameOriginal;
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 38;
    drawTextLine0027.origin = CGPointMake(2383, 2094);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0027];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = station0014.nameEnglish;
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 38;
    drawTextLine0028.origin = CGPointMake(2255, 2049);
    [station0014.nameEnglishTextPrimitives addObject:drawTextLine0028];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1200;
    [edge0003.elements addObject:haul0014];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(2524.5, 2063.5);
    drawLine0034.endPoint = CGPointMake(2621.5, 2213.5);
    drawLine0034.width = 34;
    drawLine0034.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию Sakuragichō
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0003.elements addObject:station0015];
    
    station0015.nameOriginal = @"桜木町";
    station0015.nameEnglish = @"Sakuragichō";
    station0015.geoLocation = CGPointMake(35.450833, 139.631111);
    station0015.mapLocation = CGPointMake(2621, 2213);

    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0015.mapLocation;
    fillCircle0016.radius = 13.5;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0015.nameOriginal;
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 38;
    drawTextLine0029.origin = CGPointMake(2481, 2244);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0029];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = station0015.nameEnglish;
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 38;
    drawTextLine0030.origin = CGPointMake(2383, 2197);
    [station0015.nameEnglishTextPrimitives addObject:drawTextLine0030];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 700;
    [edge0003.elements addObject:haul0015];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(2620, 2212);
    drawLine0035.endPoint = CGPointMake(2658, 2256);
    drawLine0035.width = 34;
    drawLine0035.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0035];

    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(2774, 2161);
    drawArc0022.startRadians = 128 * M_PI / 180;
    drawArc0022.endRadians = 141 * M_PI / 180;
    drawArc0022.radius = 150;
    drawArc0022.width = 34;
    drawArc0022.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawArc0022];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(2680, 2278);
    drawLine0036.endPoint = CGPointMake(2706.5, 2294.75);
    drawLine0036.width = 34;
    drawLine0036.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0036];

    // Добавляем станцию Kannai
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0003.elements addObject:station0016];
    
    station0016.nameOriginal = @"関内";
    station0016.nameEnglish = @"Kannai";
    station0016.geoLocation = CGPointMake(35.443333, 139.637222);
    station0016.mapLocation = CGPointMake(2706, 2294);

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0016.mapLocation;
    fillCircle0017.radius = 13.5;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0017];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = station0016.nameOriginal;
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 38;
    drawTextLine0031.radians = 35 * M_PI / 180;
    drawTextLine0031.origin = CGPointMake(2732, 2345);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0031];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0016.nameEnglish;
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 38;
    drawTextLine0032.radians = 35 * M_PI / 180;
    drawTextLine0032.origin = CGPointMake(2762, 2306);
    [station0016.nameEnglishTextPrimitives addObject:drawTextLine0032];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 700;
    [edge0003.elements addObject:haul0016];

    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(2692, 2309);
    drawArc0023.startRadians = 309 * M_PI / 180;
    drawArc0023.endRadians = 47 * M_PI / 180;
    drawArc0023.radius = 20;
    drawArc0023.width = 34;
    drawArc0023.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawArc0023];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(2706, 2323);
    drawLine0037.endPoint = CGPointMake(2655, 2368.5);
    drawLine0037.width = 34;
    drawLine0037.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0037];

    // Добавляем станцию Isezakichōjamachi
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0003.elements addObject:station0017];
    
    station0017.nameOriginal = @"伊勢佐木長者町";
    station0017.nameEnglish = @"Isezakichōjamachi";
    station0017.geoLocation = CGPointMake(35.441044, 139.633175);
    station0017.mapLocation = CGPointMake(2656, 2367.5);

    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0017.mapLocation;
    fillCircle0018.radius = 13.5;
    fillCircle0018.fillColor = [UIColor whiteColor];
    [station0017.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0017.nameOriginal;
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 38;
    drawTextLine0033.radians = 35 * M_PI / 180;
    drawTextLine0033.origin = CGPointMake(2667, 2418);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0033];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0017.nameEnglish;
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 38;
    drawTextLine0034.radians = 35 * M_PI / 180;
    drawTextLine0034.origin = CGPointMake(2694, 2381);
    [station0017.nameEnglishTextPrimitives addObject:drawTextLine0034];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 900;
    [edge0003.elements addObject:haul0017];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(2658.5, 2366.5);
    drawLine0038.endPoint = CGPointMake(2539.5, 2430);
    drawLine0038.width = 34;
    drawLine0038.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0038];

    // Добавляем станцию Bandōbashi
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0003.elements addObject:station0018];
    
    station0018.nameOriginal = @"阪東橋";
    station0018.nameEnglish = @"Bandōbashi";
    station0018.geoLocation = CGPointMake(35.437361, 139.625);
    station0018.mapLocation = CGPointMake(2539.5, 2430);

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0018.mapLocation;
    fillCircle0019.radius = 13.5;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0019];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0018.nameOriginal;
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 38;
    drawTextLine0035.radians = 35 * M_PI / 180;
    drawTextLine0035.origin = CGPointMake(2560, 2469);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0035];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = station0018.nameEnglish;
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 38;
    drawTextLine0036.radians = 35 * M_PI / 180;
    drawTextLine0036.origin = CGPointMake(2585, 2432);
    [station0018.nameEnglishTextPrimitives addObject:drawTextLine0036];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 500;
    [edge0003.elements addObject:haul0018];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(2540, 2429.5);
    drawLine0039.endPoint = CGPointMake(2448.5, 2467.5);
    drawLine0039.width = 34;
    drawLine0039.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0039];

    // Добавляем станцию Yoshinochō
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0003.elements addObject:station0019];
    
    station0019.nameOriginal = @"吉野町";
    station0019.nameEnglish = @"Yoshinochō";
    station0019.geoLocation = CGPointMake(35.435489, 139.618456);
    station0019.mapLocation = CGPointMake(2448.5, 2467.5);

    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0019.mapLocation;
    fillCircle0020.radius = 13.5;
    fillCircle0020.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = station0019.nameOriginal;
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 38;
    drawTextLine0037.origin = CGPointMake(2342, 2403);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0037];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = station0019.nameEnglish;
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 38;
    drawTextLine0038.origin = CGPointMake(2259, 2358.5);
    [station0019.nameEnglishTextPrimitives addObject:drawTextLine0038];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1100;
    [edge0003.elements addObject:haul0019];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(2449, 2467);
    drawLine0040.endPoint = CGPointMake(2429, 2474.9);
    drawLine0040.width = 34;
    drawLine0040.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0040];

    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(2457, 2527.8);
    drawArc0024.startRadians = 228 * M_PI / 180;
    drawArc0024.endRadians = 244 * M_PI / 180;
    drawArc0024.radius = 60;
    drawArc0024.width = 34;
    drawArc0024.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawArc0024];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(2419, 2481.2);
    drawLine0041.endPoint = CGPointMake(2329.5, 2561);
    drawLine0041.width = 34;
    drawLine0041.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0041];

    // Добавляем станцию Maita
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0003.elements addObject:station0020];
    
    station0020.nameOriginal = @"蒔田";
    station0020.nameEnglish = @"Maita";
    station0020.geoLocation = CGPointMake(35.43, 139.61);
    station0020.mapLocation = CGPointMake(2329.5, 2561);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0020.mapLocation;
    fillCircle0021.radius = 13.5;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0021];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = station0020.nameOriginal;
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 38;
    drawTextLine0039.origin = CGPointMake(2254, 2499);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0039];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = station0020.nameEnglish;
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 38;
    drawTextLine0040.origin = CGPointMake(2233, 2454);
    [station0020.nameEnglishTextPrimitives addObject:drawTextLine0040];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 1100;
    [edge0003.elements addObject:haul0020];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(2330, 2560.5);
    drawLine0042.endPoint = CGPointMake(2246, 2625);
    drawLine0042.width = 34;
    drawLine0042.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0042];

    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(2286, 2670);
    drawArc0025.startRadians = 203 * M_PI / 180;
    drawArc0025.endRadians = 230 * M_PI / 180;
    drawArc0025.radius = 60;
    drawArc0025.width = 34;
    drawArc0025.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawArc0025];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(2231, 2646);
    drawLine0043.endPoint = CGPointMake(2218, 2678);
    drawLine0043.width = 34;
    drawLine0043.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0043];

    // Добавляем станцию Gumyōji
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0003.elements addObject:station0021];
    
    station0021.nameOriginal = @"弘明寺";
    station0021.nameEnglish = @"Gumyōji";
    station0021.geoLocation = CGPointMake(35.423056, 139.602083);
    station0021.mapLocation = CGPointMake(2218, 2678);

    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0021.mapLocation;
    fillCircle0022.radius = 13.5;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0021.nameOriginal;
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 38;
    drawTextLine0041.origin = CGPointMake(2087, 2625);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0041];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = station0021.nameEnglish;
    drawTextLine0042.fontName = @"HelveticaNeue";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 38;
    drawTextLine0042.origin = CGPointMake(2060, 2581);
    [station0021.nameEnglishTextPrimitives addObject:drawTextLine0042];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 1600;
    [edge0003.elements addObject:haul0021];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(2218.5, 2677.5);
    drawLine0044.endPoint = CGPointMake(2160.25, 2806);
    drawLine0044.width = 34;
    drawLine0044.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0044];

    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(2346, 2880);
    drawArc0026.startRadians = 192 * M_PI / 180;
    drawArc0026.endRadians = 202 * M_PI / 180;
    drawArc0026.radius = 200;
    drawArc0026.width = 34;
    drawArc0026.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawArc0026];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(2150.5, 2837.5);
    drawLine0045.endPoint = CGPointMake(2147, 2857);
    drawLine0045.width = 34;
    drawLine0045.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0045];

    MWDrawArc *drawArc0027 = [[MWDrawArc alloc] init];
    drawArc0027.center = CGPointMake(2050, 2833);
    drawArc0027.startRadians = 13 * M_PI / 180;
    drawArc0027.endRadians = 22 * M_PI / 180;
    drawArc0027.radius = 100;
    drawArc0027.width = 34;
    drawArc0027.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawArc0027];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(2143, 2869);
    drawLine0046.endPoint = CGPointMake(2133.75, 2897);
    drawLine0046.width = 34;
    drawLine0046.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0046];

    MWDrawArc *drawArc0028 = [[MWDrawArc alloc] init];
    drawArc0028.center = CGPointMake(2229, 2927);
    drawArc0028.startRadians = 186 * M_PI / 180;
    drawArc0028.endRadians = 200 * M_PI / 180;
    drawArc0028.radius = 100;
    drawArc0028.width = 34;
    drawArc0028.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawArc0028];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(2130, 2913);
    drawLine0047.endPoint = CGPointMake(2129.5, 2921);
    drawLine0047.width = 34;
    drawLine0047.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0047];

    // Добавляем станцию Kami-Ōoka
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0003.elements addObject:station0022];
    
    station0022.nameOriginal = @"上大岡";
    station0022.nameEnglish = @"Kami-Ōoka";
    station0022.geoLocation = CGPointMake(35.409208, 139.596598);
    station0022.mapLocation = CGPointMake(2129.5, 2921);

    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0022.mapLocation;
    fillCircle0023.radius = 13.5;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0022.drawPrimitives addObject:fillCircle0023];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = station0022.nameOriginal;
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 38;
    drawTextLine0043.origin = CGPointMake(1994, 2883);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0043];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = station0022.nameEnglish;
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 38;
    drawTextLine0044.origin = CGPointMake(1913, 2838);
    [station0022.nameEnglishTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 1100;
    [edge0003.elements addObject:haul0022];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(2129.5, 2920);
    drawLine0048.endPoint = CGPointMake(2124.5, 2961);
    drawLine0048.width = 34;
    drawLine0048.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawLine0048];

    MWDrawArc *drawArc0029 = [[MWDrawArc alloc] init];
    drawArc0029.center = CGPointMake(2065, 2953);
    drawArc0029.startRadians = 7 * M_PI / 180;
    drawArc0029.endRadians = 32 * M_PI / 180;
    drawArc0029.radius = 60;
    drawArc0029.width = 34;
    drawArc0029.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawArc0029];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(2116.5, 2984.5);
    drawLine0049.endPoint = CGPointMake(2080.5, 3043);
    drawLine0049.width = 34;
    drawLine0049.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawLine0049];

    MWDrawArc *drawArc0030 = [[MWDrawArc alloc] init];
    drawArc0030.center = CGPointMake(2030, 3010.5);
    drawArc0030.startRadians = 32 * M_PI / 180;
    drawArc0030.endRadians = 64.5 * M_PI / 180;
    drawArc0030.radius = 60;
    drawArc0030.width = 34;
    drawArc0030.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawArc0030];

    // Добавляем станцию Kōnan-Chūō
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0003.elements addObject:station0023];
    
    station0023.nameOriginal = @"港南中央";
    station0023.nameEnglish = @"Kōnan-Chūō";
    station0023.geoLocation = CGPointMake(35.40105, 139.590958);
    station0023.mapLocation = CGPointMake(2056.5, 3064.5);

    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0023.mapLocation;
    fillCircle0024.radius = 13.5;
    fillCircle0024.fillColor = [UIColor whiteColor];
    [station0023.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = station0023.nameOriginal;
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 38;
    drawTextLine0045.origin = CGPointMake(1906, 3004);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0045];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = station0023.nameEnglish;
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 38;
    drawTextLine0046.origin = CGPointMake(1843, 2959);
    [station0023.nameEnglishTextPrimitives addObject:drawTextLine0046];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 1700;
    [edge0003.elements addObject:haul0023];

    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(2056.5, 3064.5);
    drawLine0050.endPoint = CGPointMake(2022.5, 3080.5);
    drawLine0050.width = 34;
    drawLine0050.color = line0001.color;
    [haul0023.drawPrimitives addObject:drawLine0050];

    MWDrawArc *drawArc0031 = [[MWDrawArc alloc] init];
    drawArc0031.center = CGPointMake(1999, 3025);
    drawArc0031.startRadians = 66 * M_PI / 180;
    drawArc0031.endRadians = 86 * M_PI / 180;
    drawArc0031.radius = 60;
    drawArc0031.width = 34;
    drawArc0031.color = line0001.color;
    [haul0023.drawPrimitives addObject:drawArc0031];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(1863.5, 3095);
    drawLine0051.endPoint = CGPointMake(2004, 3085);
    drawLine0051.width = 34;
    drawLine0051.color = line0001.color;
    [haul0023.drawPrimitives addObject:drawLine0051];

    MWDrawArc *drawArc0032 = [[MWDrawArc alloc] init];
    drawArc0032.center = CGPointMake(1860, 3035);
    drawArc0032.startRadians = 86 * M_PI / 180;
    drawArc0032.endRadians = 131 * M_PI / 180;
    drawArc0032.radius = 60;
    drawArc0032.width = 34;
    drawArc0032.color = line0001.color;
    [haul0023.drawPrimitives addObject:drawArc0032];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(1794.5, 3058);
    drawLine0052.endPoint = CGPointMake(1821.5, 3081);
    drawLine0052.width = 34;
    drawLine0052.color = line0001.color;
    [haul0023.drawPrimitives addObject:drawLine0052];

    // Добавляем станцию Kaminagaya
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0003.elements addObject:station0024];
    
    station0024.nameOriginal = @"上永谷";
    station0024.nameEnglish = @"Kaminagaya";
    station0024.geoLocation = CGPointMake(35.401389, 139.572639);
    station0024.mapLocation = CGPointMake(1796, 3059);

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0024.mapLocation;
    fillCircle0025.radius = 13.5;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [station0024.drawPrimitives addObject:fillCircle0025];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = station0024.nameOriginal;
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 38;
    drawTextLine0047.radians = 35 * M_PI / 180;
    drawTextLine0047.origin = CGPointMake(1688, 2922);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0047];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0024.nameEnglish;
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 38;
    drawTextLine0048.radians = 35 * M_PI / 180;
    drawTextLine0048.origin = CGPointMake(1632, 2829);
    [station0024.nameEnglishTextPrimitives addObject:drawTextLine0048];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 1300;
    [edge0003.elements addObject:haul0024];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(1797, 3060);
    drawLine0053.endPoint = CGPointMake(1771, 3044);
    drawLine0053.width = 34;
    drawLine0053.color = line0001.color;
    [haul0024.drawPrimitives addObject:drawLine0053];

    MWDrawArc *drawArc0033 = [[MWDrawArc alloc] init];
    drawArc0033.center = CGPointMake(1747, 3099);
    drawArc0033.startRadians = 262.1 * M_PI / 180;
    drawArc0033.endRadians = 295.5 * M_PI / 180;
    drawArc0033.radius = 60;
    drawArc0033.width = 34;
    drawArc0033.color = line0001.color;
    [haul0024.drawPrimitives addObject:drawArc0033];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(1674.5, 3048.5);
    drawLine0054.endPoint = CGPointMake(1740.5, 3039.25);
    drawLine0054.width = 34;
    drawLine0054.color = line0001.color;
    [haul0024.drawPrimitives addObject:drawLine0054];

    MWDrawArc *drawArc0034 = [[MWDrawArc alloc] init];
    drawArc0034.center = CGPointMake(1667, 2989);
    drawArc0034.startRadians = 82 * M_PI / 180;
    drawArc0034.endRadians = 101 * M_PI / 180;
    drawArc0034.radius = 60;
    drawArc0034.width = 34;
    drawArc0034.color = line0001.color;
    [haul0024.drawPrimitives addObject:drawArc0034];

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(1607, 3038.5);
    drawLine0055.endPoint = CGPointMake(1656.5, 3048);
    drawLine0055.width = 34;
    drawLine0055.color = line0001.color;
    [haul0024.drawPrimitives addObject:drawLine0055];

    // Добавляем станцию Shimonagaya
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0003.elements addObject:station0025];
    
    station0025.nameOriginal = @"下永谷";
    station0025.nameEnglish = @"Shimonagaya";
    station0025.geoLocation = CGPointMake(35.402678, 139.559389);
    station0025.mapLocation = CGPointMake(1608, 3039.5);
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0025.mapLocation;
    fillCircle0026.radius = 13.5;
    fillCircle0026.fillColor = [UIColor whiteColor];
    [station0025.drawPrimitives addObject:fillCircle0026];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0025.nameOriginal;
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 38;
    drawTextLine0049.radians = 35 * M_PI / 180;
    drawTextLine0049.origin = CGPointMake(1550, 2922);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0049];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = station0025.nameEnglish;
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 38;
    drawTextLine0050.radians = 35 * M_PI / 180;
    drawTextLine0050.origin = CGPointMake(1477, 2818);
    [station0025.nameEnglishTextPrimitives addObject:drawTextLine0050];

    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 700;
    [edge0003.elements addObject:haul0025];

    MWDrawArc *drawArc0035 = [[MWDrawArc alloc] init];
    drawArc0035.center = CGPointMake(1557, 3232);
    drawArc0035.startRadians = 262 * M_PI / 180;
    drawArc0035.endRadians = 285 * M_PI / 180;
    drawArc0035.radius = 200;
    drawArc0035.width = 34;
    drawArc0035.color = line0001.color;
    [haul0025.drawPrimitives addObject:drawArc0035];

    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(1498, 3038.5);
    drawLine0056.endPoint = CGPointMake(1530, 3033.75);
    drawLine0056.width = 34;
    drawLine0056.color = line0001.color;
    [haul0025.drawPrimitives addObject:drawLine0056];

    // Добавляем станцию Maioka
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0003.elements addObject:station0026];
    
    station0026.nameOriginal = @"舞岡";
    station0026.nameEnglish = @"Maioka";
    station0026.geoLocation = CGPointMake(35.4025, 139.551111);
    station0026.mapLocation = CGPointMake(1498, 3038.5);

    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0026.mapLocation;
    fillCircle0027.radius = 13.5;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0027];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = station0026.nameOriginal;
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 38;
    drawTextLine0051.radians = 35 * M_PI / 180;
    drawTextLine0051.origin = CGPointMake(1437, 2950);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0051];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0026.nameEnglish;
    drawTextLine0052.fontName = @"HelveticaNeue";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 38;
    drawTextLine0052.radians = 35 * M_PI / 180;
    drawTextLine0052.origin = CGPointMake(1419, 2886);
    [station0026.nameEnglishTextPrimitives addObject:drawTextLine0052];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 1600;
    [edge0003.elements addObject:haul0026];

    MWDrawArc *drawArc0036 = [[MWDrawArc alloc] init];
    drawArc0036.center = CGPointMake(1515.5, 3157.25);
    drawArc0036.startRadians = 222 * M_PI / 180;
    drawArc0036.endRadians = 262 * M_PI / 180;
    drawArc0036.radius = 120;
    drawArc0036.width = 34;
    drawArc0036.color = line0001.color;
    [haul0026.drawPrimitives addObject:drawArc0036];

    MWDrawArc *drawArc0037 = [[MWDrawArc alloc] init];
    drawArc0037.center = CGPointMake(1386, 3032.5);
    drawArc0037.startRadians = 46 * M_PI / 180;
    drawArc0037.endRadians = 105 * M_PI / 180;
    drawArc0037.radius = 60;
    drawArc0037.width = 34;
    drawArc0037.color = line0001.color;
    [haul0026.drawPrimitives addObject:drawArc0037];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(1307.5, 3074);
    drawLine0057.endPoint = CGPointMake(1371, 3090.5);
    drawLine0057.width = 34;
    drawLine0057.color = line0001.color;
    [haul0026.drawPrimitives addObject:drawLine0057];

    MWDrawArc *drawArc0038 = [[MWDrawArc alloc] init];
    drawArc0038.center = CGPointMake(1275, 3168.5);
    drawArc0038.startRadians = 263 * M_PI / 180;
    drawArc0038.endRadians = 290 * M_PI / 180;
    drawArc0038.radius = 100;
    drawArc0038.width = 34;
    drawArc0038.color = line0001.color;
    [haul0026.drawPrimitives addObject:drawArc0038];

    // Добавляем станцию Totsuka
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0003.elements addObject:station0027];      
    
    station0027.nameOriginal = @"戸塚";
    station0027.nameEnglish = @"Totsuka";
    station0027.geoLocation = CGPointMake(35.400556, 139.534167);
    station0027.mapLocation = CGPointMake(1264.5, 3069);

    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0027.mapLocation;
    fillCircle0028.radius = 13.5;
    fillCircle0028.fillColor = [UIColor whiteColor];
    [station0027.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = station0027.nameOriginal;
    drawTextLine0053.fontName = @"HelveticaNeue";
    drawTextLine0053.fontColor = [UIColor blackColor];
    drawTextLine0053.fontSize = 38;
    drawTextLine0053.radians = 325 * M_PI / 180;
    drawTextLine0053.origin = CGPointMake(1219, 3162);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0053];

    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = station0027.nameEnglish;
    drawTextLine0054.fontName = @"HelveticaNeue";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 38;
    drawTextLine0054.radians = 325 * M_PI / 180;
    drawTextLine0054.origin = CGPointMake(1145, 3156);
    [station0027.nameEnglishTextPrimitives addObject:drawTextLine0054];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 1700;
    [edge0003.elements addObject:haul0027];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(1218, 3076);
    drawLine0058.endPoint = CGPointMake(1264.5, 3069);
    drawLine0058.width = 34;
    drawLine0058.color = line0001.color;
    [haul0027.drawPrimitives addObject:drawLine0058];

    MWDrawArc *drawArc0039 = [[MWDrawArc alloc] init];
    drawArc0039.center = CGPointMake(1200, 2957);
    drawArc0039.startRadians = 81 * M_PI / 180;
    drawArc0039.endRadians = 121.75 * M_PI / 180;
    drawArc0039.radius = 120;
    drawArc0039.width = 34;
    drawArc0039.color = line0001.color;
    [haul0027.drawPrimitives addObject:drawArc0039];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(1030, 2984);
    drawLine0059.endPoint = CGPointMake(1138, 3059.75);
    drawLine0059.width = 34;
    drawLine0059.color = line0001.color;
    [haul0027.drawPrimitives addObject:drawLine0059];

    // Добавляем станцию Odoriba
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0003.elements addObject:station0028];
    
    station0028.nameOriginal = @"踊場";
    station0028.nameEnglish = @"Odoriba";
    station0028.geoLocation = CGPointMake(35.405556, 139.518611);
    station0028.mapLocation = CGPointMake(1030, 2984);
    
    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0028.mapLocation;
    fillCircle0029.radius = 13.5;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0029];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = station0028.nameOriginal;
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 38;
    drawTextLine0055.radians = 325 * M_PI / 180;
    drawTextLine0055.origin = CGPointMake(945, 3056);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0055];

    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = station0028.nameEnglish;
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor blackColor];
    drawTextLine0056.fontSize = 38;
    drawTextLine0056.radians = 325 * M_PI / 180;
    drawTextLine0056.origin = CGPointMake(867, 3055);
    [station0028.nameEnglishTextPrimitives addObject:drawTextLine0056];

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 900;
    [edge0003.elements addObject:haul0028];

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(1000, 2959.5);
    drawLine0060.endPoint = CGPointMake(1031, 2985);
    drawLine0060.width = 34;
    drawLine0060.color = line0001.color;
    [haul0028.drawPrimitives addObject:drawLine0060];

    MWDrawArc *drawArc0040 = [[MWDrawArc alloc] init];
    drawArc0040.center = CGPointMake(1040, 2915);
    drawArc0040.startRadians = 131 * M_PI / 180;
    drawArc0040.endRadians = 140 * M_PI / 180;
    drawArc0040.radius = 60;
    drawArc0040.width = 34;
    drawArc0040.color = line0001.color;
    [haul0028.drawPrimitives addObject:drawArc0040];

    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(968, 2921);
    drawLine0061.endPoint = CGPointMake(995, 2954.5);
    drawLine0061.width = 34;
    drawLine0061.color = line0001.color;
    [haul0028.drawPrimitives addObject:drawLine0061];

    MWDrawArc *drawArc0041 = [[MWDrawArc alloc] init];
    drawArc0041.center = CGPointMake(922, 2960);
    drawArc0041.startRadians = 304 * M_PI / 180;
    drawArc0041.endRadians = 320.5 * M_PI / 180;
    drawArc0041.radius = 60;
    drawArc0041.width = 34;
    drawArc0041.color = line0001.color;
    [haul0028.drawPrimitives addObject:drawArc0041];

    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(917, 2884.5);
    drawLine0062.endPoint = CGPointMake(956, 2910.5);
    drawLine0062.width = 34;
    drawLine0062.color = line0001.color;
    [haul0028.drawPrimitives addObject:drawLine0062];

    // Добавляем станцию Nakada
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0003.elements addObject:station0029];
    
    station0029.nameOriginal = @"中田";
    station0029.nameEnglish = @"Nakada";
    station0029.geoLocation = CGPointMake(35.411153, 139.511411);
    station0029.mapLocation = CGPointMake(917.5, 2885);

    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0029.mapLocation;
    fillCircle0030.radius = 13.5;
    fillCircle0030.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0030];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = station0029.nameOriginal;
    drawTextLine0057.fontName = @"HelveticaNeue";
    drawTextLine0057.fontColor = [UIColor blackColor];
    drawTextLine0057.fontSize = 38;
    drawTextLine0057.radians = 325 * M_PI / 180;
    drawTextLine0057.origin = CGPointMake(842, 2969);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0057];

    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = station0029.nameEnglish;
    drawTextLine0058.fontName = @"HelveticaNeue";
    drawTextLine0058.fontColor = [UIColor blackColor];
    drawTextLine0058.fontSize = 38;
    drawTextLine0058.radians = 325 * M_PI / 180;
    drawTextLine0058.origin = CGPointMake(771, 2965);
    [station0029.nameEnglishTextPrimitives addObject:drawTextLine0058];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 1100;
    [edge0003.elements addObject:haul0029];

    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(825.5, 2839.5);
    drawLine0063.endPoint = CGPointMake(919, 2885.75);
    drawLine0063.width = 34;
    drawLine0063.color = line0001.color;
    [haul0029.drawPrimitives addObject:drawLine0063];

    MWDrawArc *drawArc0042 = [[MWDrawArc alloc] init];
    drawArc0042.center = CGPointMake(800, 2894);
    drawArc0042.startRadians = 269 * M_PI / 180;
    drawArc0042.endRadians = 296 * M_PI / 180;
    drawArc0042.radius = 60;
    drawArc0042.width = 34;
    drawArc0042.color = line0001.color;
    [haul0029.drawPrimitives addObject:drawArc0042];

    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(768.5, 2835);
    drawLine0064.endPoint = CGPointMake(800, 2834);
    drawLine0064.width = 34;
    drawLine0064.color = line0001.color;
    [haul0029.drawPrimitives addObject:drawLine0064];

    // Добавляем станцию Tateba
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0003.elements addObject:station0030];
    
    station0030.nameOriginal = @"立場";
    station0030.nameEnglish = @"Tateba";
    station0030.geoLocation = CGPointMake(35.414297, 139.500247);
    station0030.mapLocation = CGPointMake(768.5, 2835);

    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0030.mapLocation;
    fillCircle0031.radius = 13.5;
    fillCircle0031.fillColor = [UIColor whiteColor];
    [station0030.drawPrimitives addObject:fillCircle0031];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = station0030.nameOriginal;
    drawTextLine0059.fontName = @"HelveticaNeue";
    drawTextLine0059.fontColor = [UIColor blackColor];
    drawTextLine0059.fontSize = 38;
    drawTextLine0059.origin = CGPointMake(678, 2773);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0059];

    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = station0030.nameEnglish;
    drawTextLine0060.fontName = @"HelveticaNeue";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 38;
    drawTextLine0060.origin = CGPointMake(639, 2728);
    [station0030.nameEnglishTextPrimitives addObject:drawTextLine0060];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 2100;
    [edge0003.elements addObject:haul0030];

    MWDrawArc *drawArc0043 = [[MWDrawArc alloc] init];
    drawArc0043.center = CGPointMake(775, 2894.75);
    drawArc0043.startRadians = 210 * M_PI / 180;
    drawArc0043.endRadians = 265 * M_PI / 180;
    drawArc0043.radius = 60;
    drawArc0043.width = 34;
    drawArc0043.color = line0001.color;
    [haul0030.drawPrimitives addObject:drawArc0043];

    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(678.5, 2939);
    drawLine0065.endPoint = CGPointMake(723.5, 2864);
    drawLine0065.width = 34;
    drawLine0065.color = line0001.color;
    [haul0030.drawPrimitives addObject:drawLine0065];

    MWDrawArc *drawArc0044 = [[MWDrawArc alloc] init];
    drawArc0044.center = CGPointMake(595, 2884);
    drawArc0044.startRadians = 30 * M_PI / 180;
    drawArc0044.endRadians = 67 * M_PI / 180;
    drawArc0044.radius = 100;
    drawArc0044.width = 34;
    drawArc0044.color = line0001.color;
    [haul0030.drawPrimitives addObject:drawArc0044];

    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(528, 3021);
    drawLine0066.endPoint = CGPointMake(635, 2976);
    drawLine0066.width = 34;
    drawLine0066.color = line0001.color;
    [haul0030.drawPrimitives addObject:drawLine0066];

    // Добавляем станцию Shimoiida
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0003.elements addObject:station0031];
    
    station0031.nameOriginal = @"下飯田";
    station0031.nameEnglish = @"Shimoiida";
    station0031.geoLocation = CGPointMake(35.403489, 139.483183);
    station0031.mapLocation = CGPointMake(528, 3021);

    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0031.mapLocation;
    fillCircle0032.radius = 13.5;
    fillCircle0032.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0032];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = station0031.nameOriginal;
    drawTextLine0061.fontName = @"HelveticaNeue";
    drawTextLine0061.fontColor = [UIColor blackColor];
    drawTextLine0061.fontSize = 38;
    drawTextLine0061.origin = CGPointMake(419, 2952);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0061];

    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = station0031.nameEnglish;
    drawTextLine0062.fontName = @"HelveticaNeue";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 38;
    drawTextLine0062.origin = CGPointMake(362, 2908);
    [station0031.nameEnglishTextPrimitives addObject:drawTextLine0062];

    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 1600;
    [edge0003.elements addObject:haul0031];

    MWDrawArc *drawArc0045 = [[MWDrawArc alloc] init];
    drawArc0045.center = CGPointMake(575.5, 3131.25);
    drawArc0045.startRadians = 210 * M_PI / 180;
    drawArc0045.endRadians = 247 * M_PI / 180;
    drawArc0045.radius = 120;
    drawArc0045.width = 34;
    drawArc0045.color = line0001.color;
    [haul0031.drawPrimitives addObject:drawArc0045];

    MWDrawArc *drawArc0046 = [[MWDrawArc alloc] init];
    drawArc0046.center = CGPointMake(368, 3010.5);
    drawArc0046.startRadians = 30 * M_PI / 180;
    drawArc0046.endRadians = 80 * M_PI / 180;
    drawArc0046.radius = 120;
    drawArc0046.width = 34;
    drawArc0046.color = line0001.color;
    [haul0031.drawPrimitives addObject:drawArc0046];

    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(292, 3147);
    drawLine0067.endPoint = CGPointMake(389.5, 3128.5);
    drawLine0067.width = 34;
    drawLine0067.color = line0001.color;
    [haul0031.drawPrimitives addObject:drawLine0067];

    // Добавляем станцию Shōnandai
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0003.elements addObject:station0032];
    
    station0032.nameOriginal = @"湘南台";
    station0032.nameEnglish = @"Shōnandai";
    station0032.geoLocation = CGPointMake(35.396185, 139.466589);
    station0032.mapLocation = CGPointMake(292, 3147);

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0032.mapLocation;
    fillCircle0033.radius = 16.75;
    fillCircle0033.fillColor = line0001.color;
    [station0032.drawPrimitives addObject:fillCircle0033];
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0032.mapLocation;
    fillCircle0034.radius = 13.5;
    fillCircle0034.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0034];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = station0032.nameOriginal;
    drawTextLine0063.fontName = @"HelveticaNeue";
    drawTextLine0063.fontColor = [UIColor blackColor];
    drawTextLine0063.fontSize = 38;
    drawTextLine0063.origin = CGPointMake(153, 3143);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0063];

    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = station0032.nameEnglish;
    drawTextLine0064.fontName = @"HelveticaNeue";
    drawTextLine0064.fontColor = [UIColor blackColor];
    drawTextLine0064.fontSize = 38;
    drawTextLine0064.origin = CGPointMake(85, 3100);
    [station0032.nameEnglishTextPrimitives addObject:drawTextLine0064];

    // Добавляем вершину
    edge0003.finishVertex = vertex0004;

    ////////////////////////////////////////////////////////////////
    // 2. Green Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Nakayama - Center Minami
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Nakayama - Center Minami";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0002;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0005;

    // Добавляем станцию Nakayama
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0004.elements addObject:station0033];
    
    station0033.nameOriginal = @"中山";
    station0033.nameEnglish = @"Nakayama";
    station0033.geoLocation = CGPointMake(35.514832, 139.54025);
    station0033.mapLocation = CGPointMake(1334, 1085);

    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0033.mapLocation;
    fillCircle0035.radius = 16.75;
    fillCircle0035.fillColor = line0002.color;
    [station0033.drawPrimitives addObject:fillCircle0035];

    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0033.mapLocation;
    fillCircle0036.radius = 13.5;
    fillCircle0036.fillColor = [UIColor whiteColor];
    [station0033.drawPrimitives addObject:fillCircle0036];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = station0033.nameOriginal;
    drawTextLine0065.fontName = @"HelveticaNeue";
    drawTextLine0065.fontColor = [UIColor blackColor];
    drawTextLine0065.fontSize = 38;
    drawTextLine0065.origin = CGPointMake(1231, 1082);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0065];

    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = station0033.nameEnglish;
    drawTextLine0066.fontName = @"HelveticaNeue";
    drawTextLine0066.fontColor = [UIColor blackColor];
    drawTextLine0066.fontSize = 38;
    drawTextLine0066.origin = CGPointMake(1123, 1038);
    [station0033.nameEnglishTextPrimitives addObject:drawTextLine0066];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 1700;
    [edge0004.elements addObject:haul0032];

    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(1334, 1085);
    drawLine0068.endPoint = CGPointMake(1468, 843.5);
    drawLine0068.width = 34;
    drawLine0068.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0068];

    // Добавляем станцию Kawawachō
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0004.elements addObject:station0034];
    
    station0034.nameOriginal = @"川和町";
    station0034.nameEnglish = @"Kawawachō";
    station0034.geoLocation = CGPointMake(35.5281, 139.5487);
    station0034.mapLocation = CGPointMake(1467, 844.5);

    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0034.mapLocation;
    fillCircle0037.radius = 13.5;
    fillCircle0037.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0037];

    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = station0034.nameOriginal;
    drawTextLine0067.fontName = @"HelveticaNeue";
    drawTextLine0067.fontColor = [UIColor blackColor];
    drawTextLine0067.fontSize = 38;
    drawTextLine0067.origin = CGPointMake(1317, 816);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0067];

    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = station0034.nameEnglish;
    drawTextLine0068.fontName = @"HelveticaNeue";
    drawTextLine0068.fontColor = [UIColor blackColor];
    drawTextLine0068.fontSize = 38;
    drawTextLine0068.origin = CGPointMake(1224, 771);
    [station0034.nameEnglishTextPrimitives addObject:drawTextLine0068];

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 1400;
    [edge0004.elements addObject:haul0033];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(1465.5, 847);
    drawLine0069.endPoint = CGPointMake(1516.5, 785.5);
    drawLine0069.width = 34;
    drawLine0069.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0069];

    MWDrawArc *drawArc0047 = [[MWDrawArc alloc] init];
    drawArc0047.center = CGPointMake(1739, 987);
    drawArc0047.startRadians = 222 * M_PI / 180;
    drawArc0047.endRadians = 241.5 * M_PI / 180;
    drawArc0047.radius = 300;
    drawArc0047.width = 34;
    drawArc0047.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawArc0047];

    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(1595.5, 723.5);
    drawLine0070.endPoint = CGPointMake(1634, 702.5);
    drawLine0070.width = 34;
    drawLine0070.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0070];

    // Добавляем станцию Tsuzuki-Fureai-no-Oka
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0004.elements addObject:station0035];
    
    station0035.nameOriginal = @"都筑ふれあいの丘";
    station0035.nameEnglish = @"Tsuzuki-Fureai-no-Oka";
    station0035.geoLocation = CGPointMake(35.5365, 139.5613);
    station0035.mapLocation = CGPointMake(1633.5, 702.5);

    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0035.mapLocation;
    fillCircle0038.radius = 13.5;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [station0035.drawPrimitives addObject:fillCircle0038];

    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = station0035.nameOriginal;
    drawTextLine0069.fontName = @"HelveticaNeue";
    drawTextLine0069.fontColor = [UIColor blackColor];
    drawTextLine0069.fontSize = 38;
    drawTextLine0069.origin = CGPointMake(1308, 648);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0069];

    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = station0035.nameEnglish;
    drawTextLine0070.fontName = @"HelveticaNeue";
    drawTextLine0070.fontColor = [UIColor blackColor];
    drawTextLine0070.fontSize = 38;
    drawTextLine0070.origin = CGPointMake(1226, 600);
    [station0035.nameEnglishTextPrimitives addObject:drawTextLine0070];

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 1700;
    [edge0004.elements addObject:haul0034];

    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(1632, 703.5);
    drawLine0071.endPoint = CGPointMake(1770, 651);
    drawLine0071.width = 34;
    drawLine0071.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0071];

    MWDrawArc *drawArc0048 = [[MWDrawArc alloc] init];
    drawArc0048.center = CGPointMake(1735, 568);
    drawArc0048.startRadians = 20 * M_PI / 180;
    drawArc0048.endRadians = 68 * M_PI / 180;
    drawArc0048.radius = 90;
    drawArc0048.width = 34;
    drawArc0048.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawArc0048];

    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(1839, 547);
    drawLine0072.endPoint = CGPointMake(1819, 599.5);
    drawLine0072.width = 34;
    drawLine0072.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0072];

    // Добавляем станцию Center-Minami
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0004.elements addObject:station0036];
    
    station0036.nameOriginal = @"センター南";
    station0036.nameEnglish = @"Center-Minami";
    station0036.geoLocation = CGPointMake(35.545475, 139.574289);
    station0036.mapLocation = CGPointMake(1839, 547);

    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0036.mapLocation;
    fillCircle0039.radius = 13.5;
    fillCircle0039.fillColor = [UIColor whiteColor];
    [station0036.drawPrimitives addObject:fillCircle0039];

    station0036.showNameOnMap = NO;
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0007];
    [station0036.nameEnglishTextPrimitives addObject:drawTextLine0008];
    
    // Добавляем вершину
    edge0004.finishVertex = vertex0003;

    // Создаем участок линии Center Minami - Center Kita
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Center Minami - Center Kita";
    [self.edges addObject:edge0005];

    // Добавляем линию
    edge0005.line = line0002;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0003;

    // Добавляем станцию Center-Minami
    [edge0005.elements addObject:station0036];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 900;
    [edge0005.elements addObject:haul0035];

    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(1839.5, 546.5);
    drawLine0073.endPoint = CGPointMake(1895, 410);
    drawLine0073.width = 34;
    drawLine0073.color = line0002.color;
    [haul0035.drawPrimitives addObject:drawLine0073];

    // Добавляем станцию Center Kita
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0005.elements addObject:station0037];
    
    station0037.nameOriginal = @"センター北";
    station0037.nameEnglish = @"Center Kita";
    station0037.geoLocation = CGPointMake(35.5534, 139.5785);
    station0037.mapLocation = CGPointMake(1895, 410);

    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0037.mapLocation;
    fillCircle0040.radius = 13.5;
    fillCircle0040.fillColor = [UIColor whiteColor];
    [station0037.drawPrimitives addObject:fillCircle0040];

    station0037.showNameOnMap = NO;
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0005];
    [station0037.nameEnglishTextPrimitives addObject:drawTextLine0006];
    
    // Добавляем вершину
    edge0005.finishVertex = vertex0002;

    // Создаем участок линии Center Kita - Hiyoshi
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Center Kita - Hiyoshi";
    [self.edges addObject:edge0006];

    // Добавляем линию
    edge0006.line = line0002;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0002;

    // Добавляем станцию Center Kita
    [edge0006.elements addObject:station0037];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 1700;
    [edge0006.elements addObject:haul0036];

    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(1894.5, 410.5);
    drawLine0074.endPoint = CGPointMake(1913.5, 359.5);
    drawLine0074.width = 34;
    drawLine0074.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0074];

    MWDrawArc *drawArc0049 = [[MWDrawArc alloc] init];
    drawArc0049.center = CGPointMake(1998, 391);
    drawArc0049.startRadians = 200 * M_PI / 180;
    drawArc0049.endRadians = 245 * M_PI / 180;
    drawArc0049.radius = 90;
    drawArc0049.width = 34;
    drawArc0049.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawArc0049];

    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(1959, 309.75);
    drawLine0075.endPoint = CGPointMake(1986, 296);
    drawLine0075.width = 34;
    drawLine0075.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0075];

    MWDrawArc *drawArc0050 = [[MWDrawArc alloc] init];
    drawArc0050.center = CGPointMake(2081, 505.5);
    drawArc0050.startRadians = 245 * M_PI / 180;
    drawArc0050.endRadians = 270 * M_PI / 180;
    drawArc0050.radius = 230;
    drawArc0050.width = 34;
    drawArc0050.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawArc0050];

    // Добавляем станцию Kita-Yamata
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0006.elements addObject:station0038];
    
    station0038.nameOriginal = @"北山田";
    station0038.nameEnglish = @"Kita-Yamata";
    station0038.geoLocation = CGPointMake(35.561003, 139.5926);
    station0038.mapLocation = CGPointMake(2081, 275.5);

    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0038.mapLocation;
    fillCircle0041.radius = 13.5;
    fillCircle0041.fillColor = [UIColor whiteColor];
    [station0038.drawPrimitives addObject:fillCircle0041];

    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = station0038.nameOriginal;
    drawTextLine0071.fontName = @"HelveticaNeue";
    drawTextLine0071.fontColor = [UIColor blackColor];
    drawTextLine0071.fontSize = 38;
    drawTextLine0071.origin = CGPointMake(1986, 203);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0071];

    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = station0038.nameEnglish;
    drawTextLine0072.fontName = @"HelveticaNeue";
    drawTextLine0072.fontColor = [UIColor blackColor];
    drawTextLine0072.fontSize = 38;
    drawTextLine0072.origin = CGPointMake(1888, 160);
    [station0038.nameEnglishTextPrimitives addObject:drawTextLine0072];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 1400;
    [edge0006.elements addObject:haul0037];

    MWDrawArc *drawArc0051 = [[MWDrawArc alloc] init];
    drawArc0051.center = CGPointMake(2081, 395.5);
    drawArc0051.startRadians = 270 * M_PI / 180;
    drawArc0051.endRadians = 315 * M_PI / 180;
    drawArc0051.radius = 120;
    drawArc0051.width = 34;
    drawArc0051.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawArc0051];

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(2165, 309.5);
    drawLine0076.endPoint = CGPointMake(2172.5, 316);
    drawLine0076.width = 34;
    drawLine0076.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0076];

    MWDrawArc *drawArc0052 = [[MWDrawArc alloc] init];
    drawArc0052.center = CGPointMake(2084, 397);
    drawArc0052.startRadians = 316.5 * M_PI / 180;
    drawArc0052.endRadians = 332 * M_PI / 180;
    drawArc0052.radius = 120;
    drawArc0052.width = 34;
    drawArc0052.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawArc0052];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(2189.5, 339.5);
    drawLine0077.endPoint = CGPointMake(2202.5, 361.5);
    drawLine0077.width = 34;
    drawLine0077.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0077];

    MWDrawArc *drawArc0053 = [[MWDrawArc alloc] init];
    drawArc0053.center = CGPointMake(2254, 331);
    drawArc0053.startRadians = 97 * M_PI / 180;
    drawArc0053.endRadians = 150 * M_PI / 180;
    drawArc0053.radius = 60;
    drawArc0053.width = 34;
    drawArc0053.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawArc0053];

    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(2246, 390.5);
    drawLine0078.endPoint = CGPointMake(2260.5, 392);
    drawLine0078.width = 34;
    drawLine0078.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0078];

    // Добавляем станцию Higashi-Yamata
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0006.elements addObject:station0039];
    
    station0039.nameOriginal = @"東山田";
    station0039.nameEnglish = @"Higashi-Yamata";
    station0039.geoLocation = CGPointMake(35.5541, 139.6044);
    station0039.mapLocation = CGPointMake(2260.5, 392);

    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = station0039.mapLocation;
    fillCircle0042.radius = 13.5;
    fillCircle0042.fillColor = [UIColor whiteColor];
    [station0039.drawPrimitives addObject:fillCircle0042];

    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = station0039.nameOriginal;
    drawTextLine0073.fontName = @"HelveticaNeue";
    drawTextLine0073.fontColor = [UIColor blackColor];
    drawTextLine0073.fontSize = 38;
    drawTextLine0073.origin = CGPointMake(2168, 448);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0073];

    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = station0039.nameEnglish;
    drawTextLine0074.fontName = @"HelveticaNeue";
    drawTextLine0074.fontColor = [UIColor blackColor];
    drawTextLine0074.fontSize = 38;
    drawTextLine0074.origin = CGPointMake(2010, 403);
    [station0039.nameEnglishTextPrimitives addObject:drawTextLine0074];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 1500;
    [edge0006.elements addObject:haul0038];

    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(2259.5, 392);
    drawLine0079.endPoint = CGPointMake(2333, 401.5);
    drawLine0079.width = 34;
    drawLine0079.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0079];

    MWDrawArc *drawArc0054 = [[MWDrawArc alloc] init];
    drawArc0054.center = CGPointMake(2324, 461);
    drawArc0054.startRadians = 278 * M_PI / 180;
    drawArc0054.endRadians = 300 * M_PI / 180;
    drawArc0054.radius = 60;
    drawArc0054.width = 34;
    drawArc0054.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawArc0054];

    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(2352, 408);
    drawLine0080.endPoint = CGPointMake(2472, 474);
    drawLine0080.width = 34;
    drawLine0080.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawLine0080];

    // Добавляем станцию Takata
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0006.elements addObject:station0040];
    
    station0040.nameOriginal = @"高田";
    station0040.nameEnglish = @"Takata";
    station0040.geoLocation = CGPointMake(35.549625, 139.620136);
    station0040.mapLocation = CGPointMake(2472, 474);

    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = station0040.mapLocation;
    fillCircle0043.radius = 13.5;
    fillCircle0043.fillColor = [UIColor whiteColor];
    [station0040.drawPrimitives addObject:fillCircle0043];

    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = station0040.nameOriginal;
    drawTextLine0075.fontName = @"HelveticaNeue";
    drawTextLine0075.fontColor = [UIColor blackColor];
    drawTextLine0075.fontSize = 38;
    drawTextLine0075.origin = CGPointMake(2390, 519);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0075];

    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0040.nameEnglish;
    drawTextLine0076.fontName = @"HelveticaNeue";
    drawTextLine0076.fontColor = [UIColor blackColor];
    drawTextLine0076.fontSize = 38;
    drawTextLine0076.origin = CGPointMake(2351, 475);
    [station0040.nameEnglishTextPrimitives addObject:drawTextLine0076];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 1300;
    [edge0006.elements addObject:haul0039];

    MWDrawArc *drawArc0055 = [[MWDrawArc alloc] init];
    drawArc0055.center = CGPointMake(2531.5, 369.5);
    drawArc0055.startRadians = 98 * M_PI / 180;
    drawArc0055.endRadians = 120 * M_PI / 180;
    drawArc0055.radius = 120;
    drawArc0055.width = 34;
    drawArc0055.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawArc0055];

    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(2513, 488.25);
    drawLine0081.endPoint = CGPointMake(2564, 495);
    drawLine0081.width = 34;
    drawLine0081.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawLine0081];

    MWDrawArc *drawArc0056 = [[MWDrawArc alloc] init];
    drawArc0056.center = CGPointMake(2580, 376);
    drawArc0056.startRadians = 59.5 * M_PI / 180;
    drawArc0056.endRadians = 98 * M_PI / 180;
    drawArc0056.radius = 120;
    drawArc0056.width = 34;
    drawArc0056.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawArc0056];

    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(2640, 480);
    drawLine0082.endPoint = CGPointMake(2663.5, 466);
    drawLine0082.width = 34;
    drawLine0082.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawLine0082];

    // Добавляем станцию Hiyoshi-Honchō
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0006.elements addObject:station0041];
    
    station0041.nameOriginal = @"日吉本町";
    station0041.nameEnglish = @"Hiyoshi-Honchō";
    station0041.geoLocation = CGPointMake(35.5496, 139.6335);
    station0041.mapLocation = CGPointMake(2663.5, 466);

    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0041.mapLocation;
    fillCircle0044.radius = 13.5;
    fillCircle0044.fillColor = [UIColor whiteColor];
    [station0041.drawPrimitives addObject:fillCircle0044];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = station0041.nameOriginal;
    drawTextLine0077.fontName = @"HelveticaNeue";
    drawTextLine0077.fontColor = [UIColor blackColor];
    drawTextLine0077.fontSize = 38;
    drawTextLine0077.origin = CGPointMake(2665, 521.5);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0077];

    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = station0041.nameEnglish;
    drawTextLine0078.fontName = @"HelveticaNeue";
    drawTextLine0078.fontColor = [UIColor blackColor];
    drawTextLine0078.fontSize = 38;
    drawTextLine0078.origin = CGPointMake(2669, 478);
    [station0041.nameEnglishTextPrimitives addObject:drawTextLine0078];

    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 1400;
    [edge0006.elements addObject:haul0040];

    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(2663, 466.5);
    drawLine0083.endPoint = CGPointMake(2771.5, 402.5);
    drawLine0083.width = 34;
    drawLine0083.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawLine0083];

    MWDrawArc *drawArc0057 = [[MWDrawArc alloc] init];
    drawArc0057.center = CGPointMake(2801, 455);
    drawArc0057.startRadians = 240 * M_PI / 180;
    drawArc0057.endRadians = 287 * M_PI / 180;
    drawArc0057.radius = 60;
    drawArc0057.width = 34;
    drawArc0057.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawArc0057];

    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(2818, 397.5);
    drawLine0084.endPoint = CGPointMake(2851, 407);
    drawLine0084.width = 34;
    drawLine0084.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawLine0084];

    // Добавляем станцию Hiyoshi
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0006.elements addObject:station0042];
    
    station0042.nameOriginal = @"日吉";
    station0042.nameEnglish = @"Hiyoshi";
    station0042.geoLocation = CGPointMake(35.553062, 139.64678);
    station0042.mapLocation = CGPointMake(2851, 407);

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0042.mapLocation;
    fillCircle0045.radius = 16.75;
    fillCircle0045.fillColor = line0002.color;
    [station0042.drawPrimitives addObject:fillCircle0045];
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0042.mapLocation;
    fillCircle0046.radius = 13.5;
    fillCircle0046.fillColor = [UIColor whiteColor];
    [station0042.drawPrimitives addObject:fillCircle0046];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = station0042.nameOriginal;
    drawTextLine0079.fontName = @"HelveticaNeue";
    drawTextLine0079.fontColor = [UIColor blackColor];
    drawTextLine0079.fontSize = 38;
    drawTextLine0079.origin = CGPointMake(2876, 402);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0079];

    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = station0042.nameEnglish;
    drawTextLine0080.fontName = @"HelveticaNeue";
    drawTextLine0080.fontColor = [UIColor blackColor];
    drawTextLine0080.fontSize = 38;
    drawTextLine0080.origin = CGPointMake(2880, 358);
    [station0042.nameEnglishTextPrimitives addObject:drawTextLine0080];

    // Добавляем вершину
    edge0006.finishVertex = vertex0006;

    return self;
}

@end
