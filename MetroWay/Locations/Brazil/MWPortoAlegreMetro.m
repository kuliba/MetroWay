//
//  MMPortoAlegreMetro.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 14.03.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWPortoAlegreMetro.h"
#import "MWLine.h"
#import "MWVertex.h"
#import "MWEdge.h"
#import "MWHaul.h"
#import "MWDrawFillCircle.h"
#import "MWDrawLine.h"
#import "MWDrawArc.h"
#import "MWDrawTextLine.h"

@implementation MWPortoAlegreMetro

- (id)init
{
    UIColor *stationCircleColor = [UIColor colorWithRed:(255/255.0) green:(242/255.0) blue:(0/255.0) alpha:1];
    UIColor *stationRingColor = [UIColor colorWithRed:(237/255.0) green:(28/255.0) blue:(36/255.0) alpha:1];
    
    // Инициализируем
    self = [super init];
    
    self.identifier = @"porto_alegre_metro";
    
    // 1 Azul
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"1 Azul";
    line0001.color = [UIColor colorWithRed:(0/255.0) green:(166/255.0) blue:(81/255.0) alpha:1];
    [self.lines addObject:line0001];
    
    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Mercado
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Mercado";
    [self.vertices addObject:vertex0001];
    
    // Novo Hamburgo
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Novo Hamburgo";
    [self.vertices addObject:vertex0002];
    
    ////////////////////////////////////////////////////////////////
    // 1 Azul
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Mercado - Novo Hamburgo
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Перегон Mercado - Novo Hamburgo";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Mercado
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Mercado";
    station0001.mapLocation = CGPointMake(559, 1974.5);
    station0001.geoLocation = CGPointMake(-30.026288, -51.228642);
    
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(559, 1974.5);
    fillCircle0001.radius = 6;
    fillCircle0001.fillColor = stationCircleColor;
    [station0001.drawPrimitives addObject:fillCircle0001];
    
    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(559, 1974.5);
    drawArc0001.startRadians = 0 * M_PI / 180;
    drawArc0001.endRadians = 360 * M_PI / 180;
    drawArc0001.radius = 8;
    drawArc0001.width = 4;
    drawArc0001.color = stationRingColor;
    [station0001.drawPrimitives addObject:drawArc0001];
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 36;
    drawTextLine0001.origin = CGPointMake(393, 1947);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 965;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(559, 1974.5);
    drawLine0001.endPoint = CGPointMake(597.5, 1952);
    drawLine0001.width = 10;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];
    
    // Добавляем станцию Rodoviária
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Rodoviária";
    station0002.mapLocation = CGPointMake(597.5, 1952);
    station0002.geoLocation = CGPointMake(-30.022131, -51.219685);

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = CGPointMake(597.5, 1952);
    fillCircle0002.radius = 6;
    fillCircle0002.fillColor = stationCircleColor;
    [station0002.drawPrimitives addObject:fillCircle0002];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(597.5, 1952);
    drawArc0002.startRadians = 0 * M_PI / 180;
    drawArc0002.endRadians = 360 * M_PI / 180;
    drawArc0002.radius = 8;
    drawArc0002.width = 4;
    drawArc0002.color = stationRingColor;
    [station0002.drawPrimitives addObject:drawArc0002];
    
    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0002.nameOriginal;
    drawTextLine0002.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 36;
    drawTextLine0002.kernSpacing = 0.45;
    drawTextLine0002.origin = CGPointMake(406, 1905.5);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0002];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 2096;
    [edge0001.elements addObject:haul0002];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(571.5, 1909);
    drawArc0003.startRadians = 20 * M_PI / 180;
    drawArc0003.endRadians = 60 * M_PI / 180;
    drawArc0003.radius = 50;
    drawArc0003.width = 10;
    drawArc0003.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(618.5, 1927);
    drawLine0002.endPoint = CGPointMake(645, 1852.5);
    drawLine0002.width = 10;
    drawLine0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию São Pedro
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"São Pedro";
    station0003.mapLocation = CGPointMake(645, 1852.5);
    station0003.geoLocation = CGPointMake(-30.006565, -51.209464);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = CGPointMake(645, 1852.5);
    fillCircle0003.radius = 6;
    fillCircle0003.fillColor = stationCircleColor;
    [station0003.drawPrimitives addObject:fillCircle0003];
    
    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(645, 1852.5);
    drawArc0004.startRadians = 0 * M_PI / 180;
    drawArc0004.endRadians = 360 * M_PI / 180;
    drawArc0004.radius = 8;
    drawArc0004.width = 4;
    drawArc0004.color = stationRingColor;
    [station0003.drawPrimitives addObject:drawArc0004];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0003.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 36;
//    drawTextLine0003.kernSpacing = 0.45;
    drawTextLine0003.origin = CGPointMake(653, 1847.5);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0003];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1792;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(644.5, 1852.5);
    drawLine0003.endPoint = CGPointMake(652.2, 1831.5);
    drawLine0003.width = 10;
    drawLine0003.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0003];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(681.5, 1838.5);
    drawArc0005.startRadians = 191.7 * M_PI / 180;
    drawArc0005.endRadians = 263.5 * M_PI / 180;
    drawArc0005.radius = 30;
    drawArc0005.width = 10;
    drawArc0005.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(677.3, 1808.8);
    drawLine0004.endPoint = CGPointMake(698.5, 1807);
    drawLine0004.width = 10;
    drawLine0004.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Farrapos
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Farrapos";
    station0004.mapLocation = CGPointMake(698.5, 1807);
    station0004.geoLocation = CGPointMake(-29.997321, -51.197767);

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = CGPointMake(698.5, 1807);
    fillCircle0004.radius = 6;
    fillCircle0004.fillColor = stationCircleColor;
    [station0004.drawPrimitives addObject:fillCircle0004];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(698.5, 1807);
    drawArc0006.startRadians = 0 * M_PI / 180;
    drawArc0006.endRadians = 360 * M_PI / 180;
    drawArc0006.radius = 8;
    drawArc0006.width = 4;
    drawArc0006.color = stationRingColor;
    [station0004.drawPrimitives addObject:drawArc0006];
    
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0004.nameOriginal;
    drawTextLine0004.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 36;
    //    drawTextLine0003.kernSpacing = 0.45;
    drawTextLine0004.origin = CGPointMake(698, 1808);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0004];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 1918;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(698, 1807);
    drawLine0005.endPoint = CGPointMake(713, 1807);
    drawLine0005.width = 10;
    drawLine0005.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0005];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(711, 1777);
    drawArc0007.startRadians = 45 * M_PI / 180;
    drawArc0007.endRadians = 86.7 * M_PI / 180;
    drawArc0007.radius = 30;
    drawArc0007.width = 10;
    drawArc0007.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawArc0007];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(625, 1693.5);
    drawArc0008.startRadians = 20 * M_PI / 180;
    drawArc0008.endRadians = 44.6 * M_PI / 180;
    drawArc0008.radius = 150;
    drawArc0008.width = 10;
    drawArc0008.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawArc0008];

    // Добавляем станцию Aeroporto
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"Aeroporto";
    station0005.mapLocation = CGPointMake(765.5, 1745.5);
    station0005.geoLocation = CGPointMake(-29.987860, -51.182972);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = CGPointMake(765.5, 1745.5);
    fillCircle0005.radius = 6;
    fillCircle0005.fillColor = stationCircleColor;
    [station0004.drawPrimitives addObject:fillCircle0005];
    
    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(765.5, 1745.5);
    drawArc0009.startRadians = 0 * M_PI / 180;
    drawArc0009.endRadians = 360 * M_PI / 180;
    drawArc0009.radius = 8;
    drawArc0009.width = 4;
    drawArc0009.color = stationRingColor;
    [station0005.drawPrimitives addObject:drawArc0009];
    
    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0005.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 36;
    //    drawTextLine0003.kernSpacing = 0.45;
    drawTextLine0005.origin = CGPointMake(579, 1717);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0005];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1287;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(765.5, 1746);
    drawLine0006.endPoint = CGPointMake(781.5, 1685.5);
    drawLine0006.width = 10;
    drawLine0006.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Anchieta
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Anchieta";
    station0006.mapLocation = CGPointMake(781.5, 1685.5);
    station0006.geoLocation = CGPointMake(-29.976836, -51.178904);

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = CGPointMake(781.5, 1685.5);
    fillCircle0006.radius = 6;
    fillCircle0006.fillColor = stationCircleColor;
    [station0006.drawPrimitives addObject:fillCircle0006];
    
    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(781.5, 1685.5);
    drawArc0010.startRadians = 0 * M_PI / 180;
    drawArc0010.endRadians = 360 * M_PI / 180;
    drawArc0010.radius = 8;
    drawArc0010.width = 4;
    drawArc0010.color = stationRingColor;
    [station0006.drawPrimitives addObject:drawArc0010];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0006.nameOriginal;
    drawTextLine0006.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 36;
    //    drawTextLine0003.kernSpacing = 0.45;
    drawTextLine0006.origin = CGPointMake(799, 1657.5);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 2564;
    [edge0001.elements addObject:haul0006];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(647.5, 1630);
    drawArc0011.startRadians = 1.5 * M_PI / 180;
    drawArc0011.endRadians = 23 * M_PI / 180;
    drawArc0011.radius = 145;
    drawArc0011.width = 10;
    drawArc0011.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(792.3, 1634.2);
    drawLine0007.endPoint = CGPointMake(794, 1584);
    drawLine0007.width = 10;
    drawLine0007.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Niterói
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"Niterói";
    station0007.mapLocation = CGPointMake(794, 1584);
    station0007.geoLocation = CGPointMake(-29.954006, -51.176639);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = CGPointMake(794, 1584);
    fillCircle0007.radius = 6;
    fillCircle0007.fillColor = stationCircleColor;
    [station0007.drawPrimitives addObject:fillCircle0007];
    
    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(794, 1584);
    drawArc0012.startRadians = 0 * M_PI / 180;
    drawArc0012.endRadians = 360 * M_PI / 180;
    drawArc0012.radius = 8;
    drawArc0012.width = 4;
    drawArc0012.color = stationRingColor;
    [station0007.drawPrimitives addObject:drawArc0012];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0007.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 36;
    drawTextLine0007.origin = CGPointMake(809, 1555);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0007];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 1637;
    [edge0001.elements addObject:haul0007];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(794, 1584.5);
    drawLine0008.endPoint = CGPointMake(790, 1482.5);
    drawLine0008.width = 10;
    drawLine0008.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Fátima
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"Fátima";
    station0008.mapLocation = CGPointMake(790, 1482.5);
    station0008.geoLocation = CGPointMake(-29.939253, -51.177333);

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = CGPointMake(790, 1482.5);
    fillCircle0008.radius = 6;
    fillCircle0008.fillColor = stationCircleColor;
    [station0008.drawPrimitives addObject:fillCircle0008];
    
    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(790, 1482.5);
    drawArc0013.startRadians = 0 * M_PI / 180;
    drawArc0013.endRadians = 360 * M_PI / 180;
    drawArc0013.radius = 8;
    drawArc0013.width = 4;
    drawArc0013.color = stationRingColor;
    [station0008.drawPrimitives addObject:drawArc0013];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0008.nameOriginal;
    drawTextLine0008.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 36;
    drawTextLine0008.origin = CGPointMake(807, 1455);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 2318;
    [edge0001.elements addObject:haul0008];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(790, 1483);
    drawLine0009.endPoint = CGPointMake(789, 1454);
    drawLine0009.width = 10;
    drawLine0009.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0009];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(644, 1460);
    drawArc0014.startRadians = 344 * M_PI / 180;
    drawArc0014.endRadians = 358 * M_PI / 180;
    drawArc0014.radius = 145;
    drawArc0014.width = 10;
    drawArc0014.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(783.5, 1420.7);
    drawLine0010.endPoint = CGPointMake(765, 1349);
    drawLine0010.width = 10;
    drawLine0010.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Canoas/LaSalle
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"Canoas/La Salle";
    station0009.mapLocation = CGPointMake(765, 1349);
    station0009.geoLocation = CGPointMake(-29.918933, -51.182098);
    
    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = CGPointMake(765, 1349);
    fillCircle0009.radius = 6;
    fillCircle0009.fillColor = stationCircleColor;
    [station0009.drawPrimitives addObject:fillCircle0009];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(765, 1349);
    drawArc0015.startRadians = 0 * M_PI / 180;
    drawArc0015.endRadians = 360 * M_PI / 180;
    drawArc0015.radius = 8;
    drawArc0015.width = 4;
    drawArc0015.color = stationRingColor;
    [station0009.drawPrimitives addObject:drawArc0015];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0009.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 36;
    drawTextLine0009.origin = CGPointMake(780, 1321.5);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0009];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 1760;
    [edge0001.elements addObject:haul0009];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(1261, 1414);
    drawArc0016.startRadians = 187.3 * M_PI / 180;
    drawArc0016.endRadians = 197.5 * M_PI / 180;
    drawArc0016.radius = 500;
    drawArc0016.width = 10;
    drawArc0016.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawArc0016];

    // Добавляем станцию Mathias Velho
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0001.elements addObject:station0010];
    
    station0010.nameOriginal = @"Mathias Velho";
    station0010.mapLocation = CGPointMake(784, 1265);
    station0010.geoLocation = CGPointMake(-29.903664, -51.178784);

    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = CGPointMake(784, 1265);
    fillCircle0010.radius = 6;
    fillCircle0010.fillColor = stationCircleColor;
    [station0010.drawPrimitives addObject:fillCircle0010];

    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(784, 1265);
    drawArc0017.startRadians = 0 * M_PI / 180;
    drawArc0017.endRadians = 360 * M_PI / 180;
    drawArc0017.radius = 8;
    drawArc0017.width = 4;
    drawArc0017.color = stationRingColor;
    [station0010.drawPrimitives addObject:drawArc0017];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0010.nameOriginal;
    drawTextLine0010.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 36;
    drawTextLine0010.origin = CGPointMake(799, 1239);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1884;
    [edge0001.elements addObject:haul0010];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(784, 1265.5);
    drawLine0011.endPoint = CGPointMake(791.5, 1239);
    drawLine0011.width = 10;
    drawLine0011.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0011];

    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(752, 1232);
    drawArc0018.startRadians = 349.5 * M_PI / 180;
    drawArc0018.endRadians = 11 * M_PI / 180;
    drawArc0018.radius = 40;
    drawArc0018.width = 10;
    drawArc0018.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(791.5, 1225.5);
    drawLine0012.endPoint = CGPointMake(780, 1185.5);
    drawLine0012.width = 10;
    drawLine0012.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию São Luis/Ulbra
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0001.elements addObject:station0011];
    
    station0011.nameOriginal = @"São Luis/ULBRA";
    station0011.mapLocation = CGPointMake(780, 1185.5);
    station0011.geoLocation = CGPointMake(-29.887530, -51.179572);

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = CGPointMake(780, 1185.5);
    fillCircle0011.radius = 6;
    fillCircle0011.fillColor = stationCircleColor;
    [station0011.drawPrimitives addObject:fillCircle0011];
    
    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(780, 1185.5);
    drawArc0019.startRadians = 0 * M_PI / 180;
    drawArc0019.endRadians = 360 * M_PI / 180;
    drawArc0019.radius = 8;
    drawArc0019.width = 4;
    drawArc0019.color = stationRingColor;
    [station0011.drawPrimitives addObject:drawArc0019];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0011.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 36;
    drawTextLine0011.origin = CGPointMake(481, 1160);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0011];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 1249;
    [edge0001.elements addObject:haul0011];

    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(1156.7, 1118);
    drawArc0020.startRadians = 169.9 * M_PI / 180;
    drawArc0020.endRadians = 182 * M_PI / 180;
    drawArc0020.radius = 383;
    drawArc0020.width = 10;
    drawArc0020.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawArc0020];

    // Добавляем станцию Petrobrás
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0001.elements addObject:station0012];
    
    station0012.nameOriginal = @"Petrobrás";
    station0012.mapLocation = CGPointMake(773.5, 1105.5);
    station0012.geoLocation = CGPointMake(-29.876447, -51.180900);

    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = CGPointMake(773.5, 1105.5);
    fillCircle0012.radius = 6;
    fillCircle0012.fillColor = stationCircleColor;
    [station0012.drawPrimitives addObject:fillCircle0012];
    
    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(773.5, 1105.5);
    drawArc0021.startRadians = 0 * M_PI / 180;
    drawArc0021.endRadians = 360 * M_PI / 180;
    drawArc0021.radius = 8;
    drawArc0021.width = 4;
    drawArc0021.color = stationRingColor;
    [station0012.drawPrimitives addObject:drawArc0021];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0012.nameOriginal;
    drawTextLine0012.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 36;
    drawTextLine0012.origin = CGPointMake(788, 1080);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0012];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 2779;
    [edge0001.elements addObject:haul0012];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(773.5, 1105.5);
    drawLine0013.endPoint = CGPointMake(780, 1082);
    drawLine0013.width = 10;
    drawLine0013.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0013];

    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(751, 1075);
    drawArc0022.startRadians = 335.5 * M_PI / 180;
    drawArc0022.endRadians = 15 * M_PI / 180;
    drawArc0022.radius = 30;
    drawArc0022.width = 10;
    drawArc0022.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawArc0022];

    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(806, 1051);
    drawArc0023.startRadians = 155.5 * M_PI / 180;
    drawArc0023.endRadians = 180 * M_PI / 180;
    drawArc0023.radius = 30;
    drawArc0023.width = 10;
    drawArc0023.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawArc0023];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(776, 1051);
    drawLine0014.endPoint = CGPointMake(776, 1009);
    drawLine0014.width = 10;
    drawLine0014.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0014];

    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(876, 1009);
    drawArc0024.startRadians = 180 * M_PI / 180;
    drawArc0024.endRadians = 195 * M_PI / 180;
    drawArc0024.radius = 100;
    drawArc0024.width = 10;
    drawArc0024.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawArc0024];

    // Добавляем станцию Esteio
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0001.elements addObject:station0013];
    
    station0013.nameOriginal = @"Esteio";
    station0013.mapLocation = CGPointMake(779.5, 984);
    station0013.geoLocation = CGPointMake(-29.851970, -51.179394);

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = CGPointMake(779.5, 984);
    fillCircle0013.radius = 6;
    fillCircle0013.fillColor = stationCircleColor;
    [station0013.drawPrimitives addObject:fillCircle0013];
    
    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(779.5, 984);
    drawArc0025.startRadians = 0 * M_PI / 180;
    drawArc0025.endRadians = 360 * M_PI / 180;
    drawArc0025.radius = 8;
    drawArc0025.width = 4;
    drawArc0025.color = stationRingColor;
    [station0013.drawPrimitives addObject:drawArc0025];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0013.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 36;
    drawTextLine0013.origin = CGPointMake(793, 958.5);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0013];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 2572;
    [edge0001.elements addObject:haul0013];

    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(839, 989);
    drawArc0026.startRadians = 185 * M_PI / 180;
    drawArc0026.endRadians = 219.5 * M_PI / 180;
    drawArc0026.radius = 60;
    drawArc0026.width = 10;
    drawArc0026.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawArc0026];

    MWDrawArc *drawArc0027 = [[MWDrawArc alloc] init];
    drawArc0027.center = CGPointMake(747, 912);
    drawArc0027.startRadians = 25 * M_PI / 180;
    drawArc0027.endRadians = 41 * M_PI / 180;
    drawArc0027.radius = 60;
    drawArc0027.width = 10;
    drawArc0027.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawArc0027];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(801, 938);
    drawLine0015.endPoint = CGPointMake(825.5, 885);
    drawLine0015.width = 10;
    drawLine0015.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0015];
    
    MWDrawArc *drawArc0028 = [[MWDrawArc alloc] init];
    drawArc0028.center = CGPointMake(885, 921.8);
    drawArc0028.startRadians = 211 * M_PI / 180;
    drawArc0028.endRadians = 230 * M_PI / 180;
    drawArc0028.radius = 70;
    drawArc0028.width = 10;
    drawArc0028.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawArc0028];

    // Добавляем станцию Luís Pasteur
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0001.elements addObject:station0014];
    
    station0014.nameOriginal = @"Luís Pasteur";
    station0014.mapLocation = CGPointMake(839.5, 868.5);
    station0014.geoLocation = CGPointMake(-29.832886, -51.165779);

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = CGPointMake(839.5, 868.5);
    fillCircle0014.radius = 6;
    fillCircle0014.fillColor = stationCircleColor;
    [station0014.drawPrimitives addObject:fillCircle0014];
    
    MWDrawArc *drawArc0029 = [[MWDrawArc alloc] init];
    drawArc0029.center = CGPointMake(839.5, 868.5);
    drawArc0029.startRadians = 0 * M_PI / 180;
    drawArc0029.endRadians = 360 * M_PI / 180;
    drawArc0029.radius = 8;
    drawArc0029.width = 4;
    drawArc0029.color = stationRingColor;
    [station0014.drawPrimitives addObject:drawArc0029];
    
    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0014.nameOriginal;
    drawTextLine0014.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 36;
    drawTextLine0014.origin = CGPointMake(615, 836.5);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 2042;
    [edge0001.elements addObject:haul0014];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(839, 869);
    drawLine0016.endPoint = CGPointMake(869.2, 845.8);
    drawLine0016.width = 10;
    drawLine0016.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0016];

    MWDrawArc *drawArc0030 = [[MWDrawArc alloc] init];
    drawArc0030.center = CGPointMake(888.2, 869);
    drawArc0030.startRadians = 229 * M_PI / 180;
    drawArc0030.endRadians = 262 * M_PI / 180;
    drawArc0030.radius = 30;
    drawArc0030.width = 10;
    drawArc0030.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawArc0030];

    MWDrawArc *drawArc0031 = [[MWDrawArc alloc] init];
    drawArc0031.center = CGPointMake(875, 800);
    drawArc0031.startRadians = 43.5 * M_PI / 180;
    drawArc0031.endRadians = 78 * M_PI / 180;
    drawArc0031.radius = 40;
    drawArc0031.width = 10;
    drawArc0031.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawArc0031];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(903.5, 828);
    drawLine0017.endPoint = CGPointMake(911.5, 818.5);
    drawLine0017.width = 10;
    drawLine0017.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0017];

    // Добавляем станцию Sapucaia
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0001.elements addObject:station0015];
    
    station0015.nameOriginal = @"Sapucaia";
    station0015.mapLocation = CGPointMake(911.5, 818.5);
    station0015.geoLocation = CGPointMake(-29.823026, -51.148810);

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = CGPointMake(911.5, 818.5);
    fillCircle0015.radius = 6;
    fillCircle0015.fillColor = stationCircleColor;
    [station0015.drawPrimitives addObject:fillCircle0015];
    
    MWDrawArc *drawArc0032 = [[MWDrawArc alloc] init];
    drawArc0032.center = CGPointMake(911.5, 818.5);
    drawArc0032.startRadians = 0 * M_PI / 180;
    drawArc0032.endRadians = 360 * M_PI / 180;
    drawArc0032.radius = 8;
    drawArc0032.width = 4;
    drawArc0032.color = stationRingColor;
    [station0015.drawPrimitives addObject:drawArc0032];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0015.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 36;
    drawTextLine0015.origin = CGPointMake(738, 791);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0015];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 4687;
    [edge0001.elements addObject:haul0015];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(911.5, 818.5);
    drawLine0018.endPoint = CGPointMake(963, 761.5);
    drawLine0018.width = 10;
    drawLine0018.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0018];

    MWDrawArc *drawArc0033 = [[MWDrawArc alloc] init];
    drawArc0033.center = CGPointMake(917, 723);
    drawArc0033.startRadians = 0 * M_PI / 180;
    drawArc0033.endRadians = 41 * M_PI / 180;
    drawArc0033.radius = 60;
    drawArc0033.width = 10;
    drawArc0033.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawArc0033];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(977, 660);
    drawLine0019.endPoint = CGPointMake(977, 723);
    drawLine0019.width = 10;
    drawLine0019.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0019];

    MWDrawArc *drawArc0034 = [[MWDrawArc alloc] init];
    drawArc0034.center = CGPointMake(917, 660);
    drawArc0034.startRadians = 330 * M_PI / 180;
    drawArc0034.endRadians = 0 * M_PI / 180;
    drawArc0034.radius = 60;
    drawArc0034.width = 10;
    drawArc0034.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawArc0034];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(969.5, 630.5);
    drawLine0020.endPoint = CGPointMake(957.5, 609);
    drawLine0020.width = 10;
    drawLine0020.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0020];

    // Добавляем станцию Unisinos
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0001.elements addObject:station0016];
    
    station0016.nameOriginal = @"Unisinos";
    station0016.mapLocation = CGPointMake(957.5, 609);
    station0016.geoLocation = CGPointMake(-29.787009, -51.140457);

    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = CGPointMake(957.5, 609);
    fillCircle0016.radius = 6;
    fillCircle0016.fillColor = stationCircleColor;
    [station0016.drawPrimitives addObject:fillCircle0016];
    
    MWDrawArc *drawArc0035 = [[MWDrawArc alloc] init];
    drawArc0035.center = CGPointMake(957.5, 609);
    drawArc0035.startRadians = 0 * M_PI / 180;
    drawArc0035.endRadians = 360 * M_PI / 180;
    drawArc0035.radius = 8;
    drawArc0035.width = 4;
    drawArc0035.color = stationRingColor;
    [station0016.drawPrimitives addObject:drawArc0035];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0016.nameOriginal;
    drawTextLine0016.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 36;
    drawTextLine0016.origin = CGPointMake(972, 583);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0016];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 2084;
    [edge0001.elements addObject:haul0016];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(957.5, 609.5);
    drawLine0021.endPoint = CGPointMake(941.5, 555);
    drawLine0021.width = 10;
    drawLine0021.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0021];

    MWDrawArc *drawArc0036 = [[MWDrawArc alloc] init];
    drawArc0036.center = CGPointMake(1000, 540);
    drawArc0036.startRadians = 165 * M_PI / 180;
    drawArc0036.endRadians = 203 * M_PI / 180;
    drawArc0036.radius = 60;
    drawArc0036.width = 10;
    drawArc0036.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawArc0036];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(944.5, 518);
    drawLine0022.endPoint = CGPointMake(949.5, 509.5);
    drawLine0022.width = 10;
    drawLine0022.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0022];

    // Добавляем станцию São Leopoldo
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0001.elements addObject:station0017];
    
    station0017.nameOriginal = @"São Leopoldo";
    station0017.mapLocation = CGPointMake(949.5, 509.5);
    station0017.geoLocation = CGPointMake(-29.768995, -51.141163);

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = CGPointMake(949.5, 509.5);
    fillCircle0017.radius = 6;
    fillCircle0017.fillColor = stationCircleColor;
    [station0017.drawPrimitives addObject:fillCircle0017];
    
    MWDrawArc *drawArc0037 = [[MWDrawArc alloc] init];
    drawArc0037.center = CGPointMake(949.5, 509.5);
    drawArc0037.startRadians = 0 * M_PI / 180;
    drawArc0037.endRadians = 360 * M_PI / 180;
    drawArc0037.radius = 8;
    drawArc0037.width = 4;
    drawArc0037.color = stationRingColor;
    [station0017.drawPrimitives addObject:drawArc0037];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0017.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 36;
    drawTextLine0017.origin = CGPointMake(963, 487);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0017];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 2344;
    [edge0001.elements addObject:haul0017];

    MWDrawArc *drawArc0038 = [[MWDrawArc alloc] init];
    drawArc0038.center = CGPointMake(855, 477);
    drawArc0038.startRadians = 335 * M_PI / 180;
    drawArc0038.endRadians = 20 * M_PI / 180;
    drawArc0038.radius = 100;
    drawArc0038.width = 10;
    drawArc0038.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawArc0038];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(946, 435.5);
    drawLine0023.endPoint = CGPointMake(941, 425);
    drawLine0023.width = 10;
    drawLine0023.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0023];

    MWDrawArc *drawArc0039 = [[MWDrawArc alloc] init];
    drawArc0039.center = CGPointMake(1023, 388);
    drawArc0039.startRadians = 155 * M_PI / 180;
    drawArc0039.endRadians = 180 * M_PI / 180;
    drawArc0039.radius = 90;
    drawArc0039.width = 10;
    drawArc0039.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawArc0039];

    // Добавляем станцию Rio Dos Sinos
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0001.elements addObject:station0018];
    
    station0018.nameOriginal = @"Rio Dos Sinos";
    station0018.mapLocation = CGPointMake(933, 388.5);
    station0018.geoLocation = CGPointMake(-29.749027, -51.145075);
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = CGPointMake(933, 388.5);
    fillCircle0018.radius = 6;
    fillCircle0018.fillColor = stationCircleColor;
    [station0018.drawPrimitives addObject:fillCircle0018];
    
    MWDrawArc *drawArc0040 = [[MWDrawArc alloc] init];
    drawArc0040.center = CGPointMake(933, 388.5);
    drawArc0040.startRadians = 0 * M_PI / 180;
    drawArc0040.endRadians = 360 * M_PI / 180;
    drawArc0040.radius = 8;
    drawArc0040.width = 4;
    drawArc0040.color = stationRingColor;
    [station0018.drawPrimitives addObject:drawArc0040];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0018.nameOriginal;
    drawTextLine0018.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 36;
    drawTextLine0018.origin = CGPointMake(946, 366);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0018];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 2198;
    [edge0001.elements addObject:haul0018];

    MWDrawArc *drawArc0041 = [[MWDrawArc alloc] init];
    drawArc0041.center = CGPointMake(1233, 396);
    drawArc0041.startRadians = 180 * M_PI / 180;
    drawArc0041.endRadians = 196.5 * M_PI / 180;
    drawArc0041.radius = 300;
    drawArc0041.width = 10;
    drawArc0041.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0041];

    // Добавляем станцию Santo Afonso
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0001.elements addObject:station0019];
    
    station0019.nameOriginal = @"Santo Afonso";
    station0019.mapLocation = CGPointMake(945, 311.5);
    station0019.geoLocation = CGPointMake(-29.729755, -51.140337);
	
    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = CGPointMake(945, 313.5);
    fillCircle0019.radius = 6;
    fillCircle0019.fillColor = stationCircleColor;
    [station0019.drawPrimitives addObject:fillCircle0019];
    
    MWDrawArc *drawArc0042 = [[MWDrawArc alloc] init];
    drawArc0042.center = CGPointMake(945, 313.5);
    drawArc0042.startRadians = 0 * M_PI / 180;
    drawArc0042.endRadians = 360 * M_PI / 180;
    drawArc0042.radius = 8;
    drawArc0042.width = 4;
    drawArc0042.color = stationRingColor;
    [station0019.drawPrimitives addObject:drawArc0042];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0019.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 36;
    drawTextLine0019.origin = CGPointMake(959, 288);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0019];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1623;
    [edge0001.elements addObject:haul0019];
    
    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(945, 314);
    drawLine0024.endPoint = CGPointMake(978.5, 197.5);
    drawLine0024.width = 10;
    drawLine0024.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Industrial
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0001.elements addObject:station0020];
    
    station0020.nameOriginal = @"Industrial";
    station0020.mapLocation = CGPointMake(978.5, 197.5);
    station0020.geoLocation = CGPointMake(-29.715892, -51.134944);

    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = CGPointMake(978.5, 197.5);
    fillCircle0020.radius = 6;
    fillCircle0020.fillColor = stationCircleColor;
    [station0020.drawPrimitives addObject:fillCircle0020];
    
    MWDrawArc *drawArc0043 = [[MWDrawArc alloc] init];
    drawArc0043.center = CGPointMake(978.5, 197.5);
    drawArc0043.startRadians = 0 * M_PI / 180;
    drawArc0043.endRadians = 360 * M_PI / 180;
    drawArc0043.radius = 8;
    drawArc0043.width = 4;
    drawArc0043.color = stationRingColor;
    [station0020.drawPrimitives addObject:drawArc0043];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0020.nameOriginal;
    drawTextLine0020.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 36;
    drawTextLine0020.origin = CGPointMake(990, 175.5);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 1677;
    [edge0001.elements addObject:haul0020];

    MWDrawArc *drawArc0044 = [[MWDrawArc alloc] init];
    drawArc0044.center = CGPointMake(902.5, 172);
    drawArc0044.startRadians = 351 * M_PI / 180;
    drawArc0044.endRadians = 19 * M_PI / 180;
    drawArc0044.radius = 80;
    drawArc0044.width = 10;
    drawArc0044.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawArc0044];

    MWDrawArc *drawArc0045 = [[MWDrawArc alloc] init];
    drawArc0045.center = CGPointMake(1041, 150.5);
    drawArc0045.startRadians = 170.5 * M_PI / 180;
    drawArc0045.endRadians = 190 * M_PI / 180;
    drawArc0045.radius = 60;
    drawArc0045.width = 10;
    drawArc0045.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawArc0045];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(981.5, 140.7);
    drawLine0025.endPoint = CGPointMake(988, 107);
    drawLine0025.width = 10;
    drawLine0025.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0025];

    // Добавляем станцию Fenac
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0001.elements addObject:station0021];
    
    station0021.nameOriginal = @"Fenac";
    station0021.mapLocation = CGPointMake(988, 107);
    station0021.geoLocation = CGPointMake(-29.701065, -51.135033);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = CGPointMake(988, 107);
    fillCircle0021.radius = 6;
    fillCircle0021.fillColor = stationCircleColor;
    [station0021.drawPrimitives addObject:fillCircle0021];

    MWDrawArc *drawArc0046 = [[MWDrawArc alloc] init];
    drawArc0046.center = CGPointMake(988, 107);
    drawArc0046.startRadians = 0 * M_PI / 180;
    drawArc0046.endRadians = 360 * M_PI / 180;
    drawArc0046.radius = 8;
    drawArc0046.width = 4;
    drawArc0046.color = stationRingColor;
    [station0021.drawPrimitives addObject:drawArc0046];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0021.nameOriginal;
    drawTextLine0021.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 36;
    drawTextLine0021.origin = CGPointMake(1001, 85);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0021];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 1576;
    [edge0001.elements addObject:haul0021];

    MWDrawArc *drawArc0047 = [[MWDrawArc alloc] init];
    drawArc0047.center = CGPointMake(932, 65);
    drawArc0047.startRadians = 352.7 * M_PI / 180;
    drawArc0047.endRadians = 38 * M_PI / 180;
    drawArc0047.radius = 70;
    drawArc0047.width = 10;
    drawArc0047.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawArc0047];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(1001.7, 57);
    drawLine0027.endPoint = CGPointMake(1000, 31);
    drawLine0027.width = 10;
    drawLine0027.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0027];

    // Добавляем станцию Novo Hamburgo
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0001.elements addObject:station0022];
    
    station0022.nameOriginal = @"Novo Hamburgo";
    station0022.mapLocation = CGPointMake(1000, 31);
    station0022.geoLocation = CGPointMake(-29.687073, -51.132815);

    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = CGPointMake(1000, 31);
    fillCircle0022.radius = 6;
    fillCircle0022.fillColor = stationCircleColor;
    [station0022.drawPrimitives addObject:fillCircle0022];

    MWDrawArc *drawArc0048 = [[MWDrawArc alloc] init];
    drawArc0048.center = CGPointMake(1000, 31);
    drawArc0048.startRadians = 0 * M_PI / 180;
    drawArc0048.endRadians = 360 * M_PI / 180;
    drawArc0048.radius = 8;
    drawArc0048.width = 4;
    drawArc0048.color = stationRingColor;
    [station0022.drawPrimitives addObject:drawArc0048];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = @"Novo";
    drawTextLine0022.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 36;
    drawTextLine0022.origin = CGPointMake(1013, -3);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0022];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = @"Hamburgo";
    drawTextLine0023.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 36;
    drawTextLine0023.origin = CGPointMake(1013, 29);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0023];

    edge0001.finishVertex = vertex0002;
    
    return self;
}

@end
