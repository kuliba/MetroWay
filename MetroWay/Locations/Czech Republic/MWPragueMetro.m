//
//  MWPragueMetro.m
//  MetroWay
//
//  Created by Valentin Ozerov on 09.07.15.
//  Copyright (c) 2015 Valentin Ozerov. All rights reserved.
//

#import "MWPragueMetro.h"
#import "MWHaul.h"
#import "MWDrawTextLine.h"
#import "MWDrawFillCircle.h"
#import "MWDrawRoundedRect.h"
#import "MWDrawArc.h"
#import "MWDrawLine.h"

@implementation MWPragueMetro

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"prague_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////

    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Line A"; // Green
    line0001.color = [UIColor colorWithRed:(0/255.0) green:(153/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0001];

    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"Line B"; // Yellow
    line0002.color = [UIColor colorWithRed:(252/255.0) green:(196/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0002];

    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"Line С"; // Red
    line0003.color = [UIColor colorWithRed:(227/255.0) green:(31/255.0) blue:(36/255.0) alpha:1];
    [self.lines addObject:line0003];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0003];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Nemocnice Motol
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Nemocnice Motol";
    [self.vertices addObject:vertex0001];

    // Depo Hostivar
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Depo Hostivar";
    [self.vertices addObject:vertex0002];

    // Černý Most
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Černý Most";
    [self.vertices addObject:vertex0003];

    // Zličín
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Zličín";
    [self.vertices addObject:vertex0004];

    // Letňany
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Letňany";
    [self.vertices addObject:vertex0005];

    // Háje
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Háje";
    [self.vertices addObject:vertex0006];

    // Florenc
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Florenc";
    [self.vertices addObject:vertex0007];

    MWDrawFillCircle *fillCircle0111 = [[MWDrawFillCircle alloc] init];
    fillCircle0111.center = CGPointMake(2416.5, 2108);
    fillCircle0111.radius = 43.5;
    fillCircle0111.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0111];

    MWDrawFillCircle *fillCircle0112 = [[MWDrawFillCircle alloc] init];
    fillCircle0112.center = CGPointMake(2416.5, 2108);
    fillCircle0112.radius = 36;
    fillCircle0112.fillColor = line0003.color;
    [vertex0007.drawPrimitives addObject:fillCircle0112];

    MWDrawFillCircle *fillCircle0113 = [[MWDrawFillCircle alloc] init];
    fillCircle0113.center = CGPointMake(2416.5, 2108);
    fillCircle0113.radius = 25;
    fillCircle0113.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0113];
    
    MWDrawFillCircle *fillCircle0114 = [[MWDrawFillCircle alloc] init];
    fillCircle0114.center = CGPointMake(2416.5, 2108);
    fillCircle0114.radius = 18.5;
    fillCircle0114.fillColor = line0002.color;
    [vertex0007.drawPrimitives addObject:fillCircle0114];

    // Muzeum
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Muzeum";
    [self.vertices addObject:vertex0008];

    MWDrawFillCircle *fillCircle0115 = [[MWDrawFillCircle alloc] init];
    fillCircle0115.center = CGPointMake(2392, 2502.5);
    fillCircle0115.radius = 43.5;
    fillCircle0115.fillColor = [UIColor whiteColor];
    [vertex0008.drawPrimitives addObject:fillCircle0115];
    
    MWDrawFillCircle *fillCircle0116 = [[MWDrawFillCircle alloc] init];
    fillCircle0116.center = CGPointMake(2392, 2502.5);
    fillCircle0116.radius = 36;
    fillCircle0116.fillColor = line0003.color;
    [vertex0008.drawPrimitives addObject:fillCircle0116];
    
    MWDrawFillCircle *fillCircle0117 = [[MWDrawFillCircle alloc] init];
    fillCircle0117.center = CGPointMake(2392, 2502.5);
    fillCircle0117.radius = 25;
    fillCircle0117.fillColor = [UIColor whiteColor];
    [vertex0008.drawPrimitives addObject:fillCircle0117];
    
    MWDrawFillCircle *fillCircle0118 = [[MWDrawFillCircle alloc] init];
    fillCircle0118.center = CGPointMake(2392, 2502.5);
    fillCircle0118.radius = 18.5;
    fillCircle0118.fillColor = line0001.color;
    [vertex0008.drawPrimitives addObject:fillCircle0118];

    // Můstek
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Můstek";
    [self.vertices addObject:vertex0009];

    MWDrawFillCircle *fillCircle0119 = [[MWDrawFillCircle alloc] init];
    fillCircle0119.center = CGPointMake(2156.5, 2267.5);
    fillCircle0119.radius = 43.5;
    fillCircle0119.fillColor = [UIColor whiteColor];
    [vertex0009.drawPrimitives addObject:fillCircle0119];
    
    MWDrawFillCircle *fillCircle0120 = [[MWDrawFillCircle alloc] init];
    fillCircle0120.center = CGPointMake(2156.5, 2267.5);
    fillCircle0120.radius = 36;
    fillCircle0120.fillColor = line0001.color;
    [vertex0009.drawPrimitives addObject:fillCircle0120];
    
    MWDrawFillCircle *fillCircle0121 = [[MWDrawFillCircle alloc] init];
    fillCircle0121.center = CGPointMake(2156.5, 2267.5);
    fillCircle0121.radius = 25;
    fillCircle0121.fillColor = [UIColor whiteColor];
    [vertex0009.drawPrimitives addObject:fillCircle0121];
    
    MWDrawFillCircle *fillCircle0122 = [[MWDrawFillCircle alloc] init];
    fillCircle0122.center = CGPointMake(2156.5, 2267.5);
    fillCircle0122.radius = 18.5;
    fillCircle0122.fillColor = line0002.color;
    [vertex0009.drawPrimitives addObject:fillCircle0122];

    ////////////////////////////////////////////////////////////////
    // Line A
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Nemocnice Motol - Můstek
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Nemocnice Motol - Můstek";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Nemocnice Motol
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Nemocnice Motol";
    station0001.mapLocation = CGPointMake(882, 2211);
    station0001.geoLocation = CGPointMake(50.075293, 14.3412);

    MWDrawRoundedRect *roundedRect0001 = [[MWDrawRoundedRect alloc] init];
    roundedRect0001.rect = CGRectMake(849, 2177, 66, 66);
    roundedRect0001.cornerRadius = 6;
    roundedRect0001.color = line0001.color;
    [station0001.drawPrimitives addObject:roundedRect0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(881.5, 2186);
    drawLine0001.endPoint = CGPointMake(881.5, 2235);
    drawLine0001.width = 49;
    drawLine0001.color = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:drawLine0001];

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = @"A";
    drawTextLine0001.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0001.fontColor = line0001.color;
    drawTextLine0001.fontSize = 70;
    drawTextLine0001.degrees = 0;
    drawTextLine0001.origin = CGPointMake(793, 2162);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = @"NEMOCNICE";
    drawTextLine0002.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 38;
    drawTextLine0002.degrees = 0;
    drawTextLine0002.kernSpacing = -0.4;
    drawTextLine0002.origin = CGPointMake(779, 2253);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0002];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = @"MOTOL";
    drawTextLine0003.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 38;
    drawTextLine0003.degrees = 0;
    drawTextLine0003.kernSpacing = 1.6;
    drawTextLine0003.origin = CGPointMake(818, 2292);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0003];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1267;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(882, 2211);
    drawLine0002.endPoint = CGPointMake(950, 2143);
    drawLine0002.width = 41;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(907, 2101);
    drawArc0001.startDegrees = 0;
    drawArc0001.endDegrees = 45;
    drawArc0001.radius = 60;
    drawArc0001.width = 41;
    drawArc0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(967, 2101);
    drawLine0003.endPoint = CGPointMake(967, 1882.5);
    drawLine0003.width = 41;
    drawLine0003.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию Petřiny
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Petřiny";
    station0002.mapLocation = CGPointMake(967, 1882.5);
    station0002.geoLocation = CGPointMake(50.086389, 14.345278);
    
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = station0002.mapLocation;
    fillCircle0001.radius = 25;
    fillCircle0001.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0002.mapLocation;
    fillCircle0002.radius = 18.5;
    fillCircle0002.fillColor = line0001.color;
    [station0002.drawPrimitives addObject:fillCircle0002];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0002.nameOriginal;
    drawTextLine0004.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 36;
    drawTextLine0004.degrees = 0;
    drawTextLine0004.kernSpacing = -0.0;
    drawTextLine0004.origin = CGPointMake(998, 1859.5);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0004];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1068;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(967, 1883);
    drawLine0004.endPoint = CGPointMake(967, 1717);
    drawLine0004.width = 41;
    drawLine0004.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0004];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(1027, 1717);
    drawArc0002.startDegrees = 180;
    drawArc0002.endDegrees = 225;
    drawArc0002.radius = 60;
    drawArc0002.width = 41;
    drawArc0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawArc0002];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(984, 1675 );
    drawLine0005.endPoint = CGPointMake(1001, 1658);
    drawLine0005.width = 41;
    drawLine0005.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0005];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(1043, 1701);
    drawArc0003.startDegrees = 225;
    drawArc0003.endDegrees = 270;
    drawArc0003.radius = 60;
    drawArc0003.width = 41;
    drawArc0003.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawArc0003];

    // Добавляем станцию Nádraží Veleslavín
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Nádraží Veleslavín";
    station0003.mapLocation = CGPointMake(1033, 1641.5);
    station0003.geoLocation = CGPointMake(50.0959, 14.3474);
    
    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0003.mapLocation;
    fillCircle0003.radius = 25;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0003];
    
    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0003.mapLocation;
    fillCircle0004.radius = 18.5;
    fillCircle0004.fillColor = line0001.color;
    [station0003.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = @"Nádraží";
    drawTextLine0005.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 36;
    drawTextLine0005.degrees = 0;
    drawTextLine0005.kernSpacing = 0.2;
    drawTextLine0005.origin = CGPointMake(970, 1518);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = @"Veleslavín";
    drawTextLine0006.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 36;
    drawTextLine0006.degrees = 0;
    drawTextLine0006.kernSpacing = -0.4;
    drawTextLine0006.origin = CGPointMake(950, 1556.5);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1166;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(1033, 1641);
    drawLine0006.endPoint = CGPointMake(1268, 1641);
    drawLine0006.width = 41;
    drawLine0006.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0006];
    
    // Добавляем станцию Bořislavka
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Bořislavka";
    station0004.mapLocation = CGPointMake(1268, 1641);
    station0004.geoLocation = CGPointMake(50.098561, 14.363208);
    
    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0004.mapLocation;
    fillCircle0005.radius = 25;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0005];
    
    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0004.mapLocation;
    fillCircle0006.radius = 18.5;
    fillCircle0006.fillColor = line0001.color;
    [station0004.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0004.nameOriginal;
    drawTextLine0007.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 36;
    drawTextLine0007.degrees = 0;
    drawTextLine0007.kernSpacing = 0.0;
    drawTextLine0007.origin = CGPointMake(1182, 1556.5);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 2067;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(1267.5, 1641);
    drawLine0007.endPoint = CGPointMake(1526.5, 1641);
    drawLine0007.width = 41;
    drawLine0007.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Dejvická
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"Dejvická";
    station0005.mapLocation = CGPointMake(1526.5, 1641);
    station0005.geoLocation = CGPointMake(50.100594, 14.392014);
    
    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0005.mapLocation;
    fillCircle0007.radius = 25;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0007];
    
    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0005.mapLocation;
    fillCircle0008.radius = 18.5;
    fillCircle0008.fillColor = line0001.color;
    [station0005.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0005.nameOriginal;
    drawTextLine0008.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 36;
    drawTextLine0008.degrees = 0;
    drawTextLine0008.kernSpacing = 0.4;
    drawTextLine0008.origin = CGPointMake(1572, 1556.5);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0008];
    
    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 971;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(1526, 1641);
    drawLine0008.endPoint = CGPointMake(1616, 1641);
    drawLine0008.width = 41;
    drawLine0008.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0008];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(1615.5, 1701);
    drawArc0004.startDegrees = 270;
    drawArc0004.endDegrees = 315;
    drawArc0004.radius = 60;
    drawArc0004.width = 41;
    drawArc0004.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(1657, 1657.5);
    drawLine0009.endPoint = CGPointMake(1766, 1766.5);
    drawLine0009.width = 41;
    drawLine0009.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Hradčanská
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Hradčanská";
    station0006.mapLocation = CGPointMake(1766, 1766.5);
    station0006.geoLocation = CGPointMake(50.097214, 14.404569);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0006.mapLocation;
    fillCircle0009.radius = 25;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0009];
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0006.mapLocation;
    fillCircle0010.radius = 18.5;
    fillCircle0010.fillColor = line0001.color;
    [station0006.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0006.nameOriginal;
    drawTextLine0009.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 36;
    drawTextLine0009.degrees = 0;
    drawTextLine0009.kernSpacing = -0.4;
    drawTextLine0009.origin = CGPointMake(1810, 1742);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0009];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 751;
    [edge0001.elements addObject:haul0006];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(1722, 1807.5);
    drawArc0005.startDegrees = 315;
    drawArc0005.endDegrees = 0;
    drawArc0005.radius = 60;
    drawArc0005.width = 41;
    drawArc0005.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(1782, 1807);
    drawLine0010.endPoint = CGPointMake(1782, 1990);
    drawLine0010.width = 41;
    drawLine0010.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Malostranská
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"Malostranská";
    station0007.mapLocation = CGPointMake(1782, 1994.5);
    station0007.geoLocation = CGPointMake(50.091236, 14.409492);

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0007.mapLocation;
    fillCircle0011.radius = 25;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0011];
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0007.mapLocation;
    fillCircle0012.radius = 18.5;
    fillCircle0012.fillColor = line0001.color;
    [station0007.drawPrimitives addObject:fillCircle0012];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0007.nameOriginal;
    drawTextLine0010.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 36;
    drawTextLine0010.degrees = 0;
    drawTextLine0010.kernSpacing = -0.6;
    drawTextLine0010.origin = CGPointMake(1532, 1972);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0010];
    
    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 672;
    [edge0001.elements addObject:haul0007];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(1842, 1989.5);
    drawArc0006.startDegrees = 135;
    drawArc0006.endDegrees = 180;
    drawArc0006.radius = 60;
    drawArc0006.width = 41;
    drawArc0006.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawArc0006];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(1799, 2031.5);
    drawLine0011.endPoint = CGPointMake(1891.5, 2124);
    drawLine0011.width = 41;
    drawLine0011.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0011];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(1933.5, 2081);
    drawArc0007.startDegrees = 90;
    drawArc0007.endDegrees = 135;
    drawArc0007.radius = 60;
    drawArc0007.width = 41;
    drawArc0007.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(1933, 2141);
    drawLine0012.endPoint = CGPointMake(2004, 2141);
    drawLine0012.width = 41;
    drawLine0012.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию Staroměstská
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"Staroměstská";
    station0008.mapLocation = CGPointMake(2008, 2141);
    station0008.geoLocation = CGPointMake(50.088185, 14.417633);
    
    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0008.mapLocation;
    fillCircle0013.radius = 25;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0013];
    
    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0008.mapLocation;
    fillCircle0014.radius = 18.5;
    fillCircle0014.fillColor = line0001.color;
    [station0008.drawPrimitives addObject:fillCircle0014];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(1960, 2194);
    drawLine0046.endPoint = CGPointMake(2030, 2194);
    drawLine0046.width = 26;
    drawLine0046.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.8];
    [station0008.drawPrimitives addObject:drawLine0046];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = @"á";
    drawTextLine0011.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0011.fontColor = [UIColor whiteColor];
    drawTextLine0011.fontSize = 44;
    drawTextLine0011.degrees = 0;
    drawTextLine0011.kernSpacing = -1.6;
    drawTextLine0011.origin = CGPointMake(2035, 2160);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0011];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0008.nameOriginal;
    drawTextLine0012.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 36;
    drawTextLine0012.degrees = 0;
    drawTextLine0012.kernSpacing = -0.9;
    drawTextLine0012.origin = CGPointMake(1836, 2166);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0012];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 599;
    [edge0001.elements addObject:haul0008];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(2004, 2201);
    drawArc0008.startDegrees = 270;
    drawArc0008.endDegrees = 315;
    drawArc0008.radius = 60;
    drawArc0008.width = 41;
    drawArc0008.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(2046, 2158);
    drawLine0013.endPoint = CGPointMake(2156.5, 2267.5);
    drawLine0013.width = 41;
    drawLine0013.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0013];

    // Добавляем станцию Můstek
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"Můstek";
    station0009.mapLocation = CGPointMake(2156.5, 2267.5);
    station0009.geoLocation = CGPointMake(50.0842, 14.4233);
    
    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0009.mapLocation;
    fillCircle0015.radius = 25;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0015];
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0009.mapLocation;
    fillCircle0016.radius = 18.5;
    fillCircle0016.fillColor = line0001.color;
    [station0009.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0009.nameOriginal;
    drawTextLine0013.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 36;
    drawTextLine0013.degrees = 0;
    drawTextLine0013.kernSpacing = -0.4;
    drawTextLine0013.origin = CGPointMake(1986, 2239);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0013];

    // Добавляем вершину
    edge0001.finishVertex = vertex0009;

    // Создаем участок линии Můstek - Muzeum
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Můstek - Muzeum";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0009;

    // Добавляем станцию Můstek
    [edge0002.elements addObject:station0009];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 761;
    [edge0002.elements addObject:haul0009];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(2156, 2267);
    drawLine0014.endPoint = CGPointMake(2392, 2502.5);
    drawLine0014.width = 41;
    drawLine0014.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0014];

    // Добавляем станцию Muzeum
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0002.elements addObject:station0010];
    
    station0010.nameOriginal = @"Muzeum";
    station0010.mapLocation = CGPointMake(2392, 2502.5);
    station0010.geoLocation = CGPointMake(50.0796, 14.4312);
    
    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0010.mapLocation;
    fillCircle0017.radius = 25;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0017];
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0010.mapLocation;
    fillCircle0018.radius = 18.5;
    fillCircle0018.fillColor = line0001.color;
    [station0010.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0010.nameOriginal;
    drawTextLine0014.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 36;
    drawTextLine0014.degrees = 0;
    drawTextLine0014.kernSpacing = 0.6;
    drawTextLine0014.origin = CGPointMake(2191, 2467);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0014];

    // Добавляем вершину
    edge0002.finishVertex = vertex0008;
    
    // Создаем участок линии Muzeum - Depo Hostivař
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Muzeum - Depo Hostivař";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0008;

    // Добавляем станцию Muzeum
    [edge0003.elements addObject:station0010];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 663;
    [edge0003.elements addObject:haul0010];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(2391.5, 2502);
    drawLine0015.endPoint = CGPointMake(2486, 2597);
    drawLine0015.width = 41;
    drawLine0015.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0015];

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(2528, 2554);
    drawArc0009.startDegrees = 90;
    drawArc0009.endDegrees = 135;
    drawArc0009.radius = 60;
    drawArc0009.width = 41;
    drawArc0009.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawArc0009];

    // Добавляем станцию Náměstí Míru
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0003.elements addObject:station0011];
    
    station0011.nameOriginal = @"Náměstí Míru";
    station0011.mapLocation = CGPointMake(2517.5, 2613);
    station0011.geoLocation = CGPointMake(50.075333, 14.43769);

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0011.mapLocation;
    fillCircle0019.radius = 25;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0019];
    
    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0011.mapLocation;
    fillCircle0020.radius = 18.5;
    fillCircle0020.fillColor = line0001.color;
    [station0011.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = @"Náměstí";
    drawTextLine0015.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 36;
    drawTextLine0015.degrees = 0;
    drawTextLine0015.kernSpacing = -0.8;
    drawTextLine0015.origin = CGPointMake(2485, 2510);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0015];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = @"Míru";
    drawTextLine0016.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 36;
    drawTextLine0016.degrees = 0;
    drawTextLine0016.kernSpacing = -0.8;
    drawTextLine0016.origin = CGPointMake(2515, 2548);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0016];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 941;
    [edge0003.elements addObject:haul0011];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(2517.5, 2613);
    drawLine0016.endPoint = CGPointMake(2627, 2613);
    drawLine0016.width = 41;
    drawLine0016.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0016];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(2627, 2583);
    drawArc0010.startDegrees = 45;
    drawArc0010.endDegrees = 90;
    drawArc0010.radius = 30;
    drawArc0010.width = 41;
    drawArc0010.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawArc0010];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(2647, 2606);
    drawLine0017.endPoint = CGPointMake(2655.5, 2597.5);
    drawLine0017.width = 41;
    drawLine0017.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0017];

    // Добавляем станцию Jiřího z Poděbrad
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0003.elements addObject:station0012];
    
    station0012.nameOriginal = @"Jiřího z Poděbrad";
    station0012.mapLocation = CGPointMake(2662, 2590.5);
    station0012.geoLocation = CGPointMake(50.07783, 14.450295);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0012.mapLocation;
    fillCircle0021.radius = 25;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0021];
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0012.mapLocation;
    fillCircle0022.radius = 18.5;
    fillCircle0022.fillColor = line0001.color;
    [station0012.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = @"Jiřího";
    drawTextLine0017.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0017.fontColor = [UIColor whiteColor];
    drawTextLine0017.fontSize = 44;
    drawTextLine0017.degrees = 0;
    drawTextLine0017.kernSpacing = -4.0;
    drawTextLine0017.origin = CGPointMake(2685, 2582);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0017];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = @"Jiřího";
    drawTextLine0018.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 36;
    drawTextLine0018.degrees = 0;
    drawTextLine0018.kernSpacing = -1.0;
    drawTextLine0018.origin = CGPointMake(2688, 2588);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0018];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = @"z Poděbrad";
    drawTextLine0019.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 36;
    drawTextLine0019.degrees = 0;
    drawTextLine0019.kernSpacing = -0.4;
    drawTextLine0019.origin = CGPointMake(2595, 2626);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0019];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 781;
    [edge0003.elements addObject:haul0012];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(2676, 2619.5);
    drawArc0011.startDegrees = 225;
    drawArc0011.endDegrees = 270;
    drawArc0011.radius = 30;
    drawArc0011.width = 41;
    drawArc0011.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(2676, 2589.5);
    drawLine0018.endPoint = CGPointMake(2817.5, 2589.5);
    drawLine0018.width = 41;
    drawLine0018.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0018];

    // Добавляем станцию Flora
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0003.elements addObject:station0013];
    
    station0013.nameOriginal = @"Flora";
    station0013.mapLocation = CGPointMake(2817.5, 2589.5);
    station0013.geoLocation = CGPointMake(50.077631, 14.461236);

    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0013.mapLocation;
    fillCircle0023.radius = 25;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0023];
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0013.mapLocation;
    fillCircle0024.radius = 18.5;
    fillCircle0024.fillColor = line0001.color;
    [station0013.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0013.nameOriginal;
    drawTextLine0020.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 36;
    drawTextLine0020.degrees = 0;
    drawTextLine0020.kernSpacing = 0.4;
    drawTextLine0020.origin = CGPointMake(2797, 2506);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 922;
    [edge0003.elements addObject:haul0013];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(2817, 2589.5);
    drawLine0019.endPoint = CGPointMake(2931, 2589.5);
    drawLine0019.width = 41;
    drawLine0019.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0019];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(2930.5, 2649.5);
    drawArc0012.startDegrees = 270;
    drawArc0012.endDegrees = 280;
    drawArc0012.radius = 60;
    drawArc0012.width = 41;
    drawArc0012.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawArc0012];

    // Добавляем станцию Želivského
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0003.elements addObject:station0014];
    
    station0014.nameOriginal = @"Želivského";
    station0014.mapLocation = CGPointMake(2948, 2592);
    station0014.geoLocation = CGPointMake(50.0784, 14.4741);

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0014.mapLocation;
    fillCircle0025.radius = 25;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0025];
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0014.mapLocation;
    fillCircle0026.radius = 18.5;
    fillCircle0026.fillColor = line0001.color;
    [station0014.drawPrimitives addObject:fillCircle0026];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0014.nameOriginal;
    drawTextLine0021.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 36;
    drawTextLine0021.degrees = 0;
    drawTextLine0021.kernSpacing = 0.2;
    drawTextLine0021.origin = CGPointMake(2927, 2505);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0021];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1365;
    [edge0003.elements addObject:haul0014];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(2930.5, 2649.5);
    drawArc0013.startDegrees = 279.5;
    drawArc0013.endDegrees = 315;
    drawArc0013.radius = 60;
    drawArc0013.width = 41;
    drawArc0013.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawArc0013];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(2972.5, 2606.5);
    drawLine0020.endPoint = CGPointMake(3090, 2724);
    drawLine0020.width = 41;
    drawLine0020.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0020];

    // Добавляем станцию Strašnická
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0003.elements addObject:station0015];
    
    station0015.nameOriginal = @"Strašnická";
    station0015.mapLocation = CGPointMake(3090, 2724);
    station0015.geoLocation = CGPointMake(50.072778, 14.491111);

    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0015.mapLocation;
    fillCircle0027.radius = 25;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0027];
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0015.mapLocation;
    fillCircle0028.radius = 18.5;
    fillCircle0028.fillColor = line0001.color;
    [station0015.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0015.nameOriginal;
    drawTextLine0022.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 36;
    drawTextLine0022.degrees = 0;
    drawTextLine0022.kernSpacing = 0.2;
    drawTextLine0022.origin = CGPointMake(2859, 2699);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 1282;
    [edge0003.elements addObject:haul0015];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(3089.5, 2723.5);
    drawLine0021.endPoint = CGPointMake(3146.5, 2780.5);
    drawLine0021.width = 41;
    drawLine0021.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0021];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(3188.5, 2737.5);
    drawArc0014.startDegrees = 90;
    drawArc0014.endDegrees = 135;
    drawArc0014.radius = 60;
    drawArc0014.width = 41;
    drawArc0014.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(3188, 2797.5);
    drawLine0022.endPoint = CGPointMake(3245, 2797.5);
    drawLine0022.width = 41;
    drawLine0022.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0022];

    // Добавляем станцию Skalka
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0003.elements addObject:station0016];
    
    station0016.nameOriginal = @"Skalka";
    station0016.mapLocation = CGPointMake(3245, 2797.5);
    station0016.geoLocation = CGPointMake(50.068056, 14.5075);

    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0016.mapLocation;
    fillCircle0029.radius = 25;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0029];
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0016.mapLocation;
    fillCircle0030.radius = 18.5;
    fillCircle0030.fillColor = line0001.color;
    [station0016.drawPrimitives addObject:fillCircle0030];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0016.nameOriginal;
    drawTextLine0023.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 36;
    drawTextLine0023.degrees = 0;
    drawTextLine0023.kernSpacing = -0.2;
    drawTextLine0023.origin = CGPointMake(3193, 2835);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0023];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 1038;
    [edge0003.elements addObject:haul0016];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(3244.5, 2797.5);
    drawLine0023.endPoint = CGPointMake(3254, 2797.5);
    drawLine0023.width = 41;
    drawLine0023.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0023];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(3253.5, 2737.5);
    drawArc0015.startDegrees = 45;
    drawArc0015.endDegrees = 90;
    drawArc0015.radius = 60;
    drawArc0015.width = 41;
    drawArc0015.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(3295.5, 2780.5);
    drawLine0024.endPoint = CGPointMake(3450, 2625.5);
    drawLine0024.width = 41;
    drawLine0024.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Depo Hostivař
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0003.elements addObject:station0017];
    
    station0017.nameOriginal = @"Depo Hostivař";
    station0017.mapLocation = CGPointMake(3450, 2625.5);
    station0017.geoLocation = CGPointMake(50.075833, 14.515556);
    
    MWDrawRoundedRect *roundedRect0002 = [[MWDrawRoundedRect alloc] init];
    roundedRect0002.rect = CGRectMake(3417, 2592, 66, 66);
    roundedRect0002.cornerRadius = 6;
    roundedRect0002.color = line0001.color;
    [station0017.drawPrimitives addObject:roundedRect0002];
    
    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(3450, 2601);
    drawLine0025.endPoint = CGPointMake(3450, 2650);
    drawLine0025.width = 49;
    drawLine0025.color = [UIColor whiteColor];
    [station0017.drawPrimitives addObject:drawLine0025];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"A";
    drawTextLine0024.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0024.fontColor = line0001.color;
    drawTextLine0024.fontSize = 70;
    drawTextLine0024.degrees = 0;
    drawTextLine0024.origin = CGPointMake(3500, 2576);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = station0017.nameOriginal.uppercaseString;
    drawTextLine0025.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 38;
    drawTextLine0025.degrees = 0;
    drawTextLine0025.kernSpacing = -0.4;
    drawTextLine0025.origin = CGPointMake(3436, 2667);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0025];

    // Добавляем вершину
    edge0003.finishVertex = vertex0002;

    ////////////////////////////////////////////////////////////////
    // Line B
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Černý Most - Florenc
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Cerny Most - Florenc";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0002;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0003;
    
    // Добавляем станцию Černý Most
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0004.elements addObject:station0018];
    
    station0018.nameOriginal = @"Černý Most";
    station0018.mapLocation = CGPointMake(3905.5, 1998.5);
    station0018.geoLocation = CGPointMake(50.109167, 14.5775);
    
    MWDrawRoundedRect *roundedRect0003 = [[MWDrawRoundedRect alloc] init];
    roundedRect0003.rect = CGRectMake(3872, 1965, 66, 66);
    roundedRect0003.cornerRadius = 6;
    roundedRect0003.color = line0002.color;
    [station0018.drawPrimitives addObject:roundedRect0003];
    
    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(3905.5, 1974);
    drawLine0026.endPoint = CGPointMake(3905.5, 2023);
    drawLine0026.width = 49;
    drawLine0026.color = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:drawLine0026];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = @"B";
    drawTextLine0026.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0026.fontColor = line0002.color;
    drawTextLine0026.fontSize = 70;
    drawTextLine0026.degrees = 0;
    drawTextLine0026.origin = CGPointMake(3949, 1950);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0026];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = @"Černý".uppercaseString;
    drawTextLine0027.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 38;
    drawTextLine0027.degrees = 0;
    drawTextLine0027.kernSpacing = -0.4;
    drawTextLine0027.origin = CGPointMake(3849, 2041);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0027];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"Most".uppercaseString;
    drawTextLine0028.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 38;
    drawTextLine0028.degrees = 0;
    drawTextLine0028.kernSpacing = 0.6;
    drawTextLine0028.origin = CGPointMake(3855, 2079);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0028];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 1240;
    [edge0004.elements addObject:haul0017];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(3905.5, 1998.5);
    drawLine0027.endPoint = CGPointMake(3720.5, 1998);
    drawLine0027.width = 41;
    drawLine0027.color = line0002.color;
    [haul0017.drawPrimitives addObject:drawLine0027];

    // Добавляем станцию Rajská zahrada
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0004.elements addObject:station0019];
    
    station0019.nameOriginal = @"Rajská zahrada";
    station0019.mapLocation = CGPointMake(3720.5, 1998);
    station0019.geoLocation = CGPointMake(50.106667, 14.560556);

    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0019.mapLocation;
    fillCircle0031.radius = 25;
    fillCircle0031.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0031];
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0019.mapLocation;
    fillCircle0032.radius = 18.5;
    fillCircle0032.fillColor = line0002.color;
    [station0019.drawPrimitives addObject:fillCircle0032];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = @"Rajská";
    drawTextLine0029.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 36;
    drawTextLine0029.degrees = 0;
    drawTextLine0029.kernSpacing = -0.2;
    drawTextLine0029.origin = CGPointMake(3669, 2035);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0029];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"zahrada";
    drawTextLine0030.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 36;
    drawTextLine0030.degrees = 0;
    drawTextLine0030.kernSpacing = 0.4;
    drawTextLine0030.origin = CGPointMake(3655, 2074);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0030];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1606;
    [edge0004.elements addObject:haul0018];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(3721, 1998);
    drawLine0028.endPoint = CGPointMake(3606, 1998);
    drawLine0028.width = 41;
    drawLine0028.color = line0002.color;
    [haul0018.drawPrimitives addObject:drawLine0028];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(3606.5, 1938);
    drawArc0016.startDegrees = 90;
    drawArc0016.endDegrees = 135;
    drawArc0016.radius = 60;
    drawArc0016.width = 41;
    drawArc0016.color = line0002.color;
    [haul0018.drawPrimitives addObject:drawArc0016];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(3466.5, 1883);
    drawLine0029.endPoint = CGPointMake(3564.5, 1981);
    drawLine0029.width = 41;
    drawLine0029.color = line0002.color;
    [haul0018.drawPrimitives addObject:drawLine0029];

    // Добавляем станцию Hloubětín
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0004.elements addObject:station0020];
    
    station0020.nameOriginal = @"Hloubětín";
    station0020.mapLocation = CGPointMake(3466.5, 1883);
    station0020.geoLocation = CGPointMake(50.106111, 14.538056);

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0020.mapLocation;
    fillCircle0033.radius = 25;
    fillCircle0033.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0033];
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0020.mapLocation;
    fillCircle0034.radius = 18.5;
    fillCircle0034.fillColor = line0002.color;
    [station0020.drawPrimitives addObject:fillCircle0034];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = station0020.nameOriginal;
    drawTextLine0031.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 36;
    drawTextLine0031.degrees = 0;
    drawTextLine0031.kernSpacing = 0.0;
    drawTextLine0031.origin = CGPointMake(3470, 1808);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0031];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1842;
    [edge0004.elements addObject:haul0019];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(3467, 1883.5);
    drawLine0030.endPoint = CGPointMake(3367, 1784);
    drawLine0030.width = 41;
    drawLine0030.color = line0002.color;
    [haul0019.drawPrimitives addObject:drawLine0030];

    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(3327, 1829);
    drawArc0017.startDegrees = 292;
    drawArc0017.endDegrees = 315;
    drawArc0017.radius = 60;
    drawArc0017.width = 41;
    drawArc0017.color = line0002.color;
    [haul0019.drawPrimitives addObject:drawArc0017];

    // Добавляем станцию Kolbenova
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0004.elements addObject:station0021];
    
    station0021.nameOriginal = @"Kolbenova";
    station0021.mapLocation = CGPointMake(3350.5, 1773.5);
    station0021.geoLocation = CGPointMake(50.110278, 14.513056);

    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0021.mapLocation;
    fillCircle0035.radius = 25;
    fillCircle0035.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0035];
    
    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0021.mapLocation;
    fillCircle0036.radius = 18.5;
    fillCircle0036.fillColor = line0002.color;
    [station0021.drawPrimitives addObject:fillCircle0036];
    
    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0021.nameOriginal;
    drawTextLine0032.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 36;
    drawTextLine0032.degrees = 0;
    drawTextLine0032.kernSpacing = -0.4;
    drawTextLine0032.origin = CGPointMake(3321, 1685.5);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0032];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 802;
    [edge0004.elements addObject:haul0020];

    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(3327, 1829);
    drawArc0018.startDegrees = 270;
    drawArc0018.endDegrees = 292.5;
    drawArc0018.radius = 60;
    drawArc0018.width = 41;
    drawArc0018.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(3327, 1769);
    drawLine0031.endPoint = CGPointMake(3172, 1769.5);
    drawLine0031.width = 41;
    drawLine0031.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0031];

    // Добавляем станцию Vysočanská
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0004.elements addObject:station0022];
    
    station0022.nameOriginal = @"Vysočanská";
    station0022.mapLocation = CGPointMake(3182, 1769.5);
    station0022.geoLocation = CGPointMake(50.111389, 14.501944);

    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0022.mapLocation;
    fillCircle0037.radius = 25;
    fillCircle0037.fillColor = [UIColor whiteColor];
    [station0022.drawPrimitives addObject:fillCircle0037];
    
    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0022.mapLocation;
    fillCircle0038.radius = 18.5;
    fillCircle0038.fillColor = line0002.color;
    [station0022.drawPrimitives addObject:fillCircle0038];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0022.nameOriginal;
    drawTextLine0033.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 36;
    drawTextLine0033.degrees = 0;
    drawTextLine0033.kernSpacing = -0.8;
    drawTextLine0033.origin = CGPointMake(3093, 1685.5);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0033];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 923;
    [edge0004.elements addObject:haul0021];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(3182.5, 1769.5);
    drawLine0032.endPoint = CGPointMake(2986.5, 1769.5);
    drawLine0032.width = 41;
    drawLine0032.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawLine0032];

    // Добавляем станцию Českomoravská
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0004.elements addObject:station0023];
    
    station0023.nameOriginal = @"Českomoravská";
    station0023.mapLocation = CGPointMake(2986.5, 1769.5);
    station0023.geoLocation = CGPointMake(50.106111, 14.491944);

    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0023.mapLocation;
    fillCircle0039.radius = 25;
    fillCircle0039.fillColor = [UIColor whiteColor];
    [station0023.drawPrimitives addObject:fillCircle0039];
    
    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0023.mapLocation;
    fillCircle0040.radius = 18.5;
    fillCircle0040.fillColor = line0002.color;
    [station0023.drawPrimitives addObject:fillCircle0040];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0023.nameOriginal;
    drawTextLine0034.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 36;
    drawTextLine0034.degrees = 0;
    drawTextLine0034.kernSpacing = -0.8;
    drawTextLine0034.origin = CGPointMake(2808, 1685);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0034];

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 1233;
    [edge0004.elements addObject:haul0022];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(2903, 1769.5);
    drawLine0033.endPoint = CGPointMake(2986.5, 1769.5);
    drawLine0033.width = 41;
    drawLine0033.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0033];

    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(2903.5, 1829.5);
    drawArc0019.startDegrees = 225;
    drawArc0019.endDegrees = 270;
    drawArc0019.radius = 60;
    drawArc0019.width = 41;
    drawArc0019.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawArc0019];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(2861.5, 1786);
    drawLine0034.endPoint = CGPointMake(2792.5, 1855);
    drawLine0034.width = 41;
    drawLine0034.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию Palmovka
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0004.elements addObject:station0024];
    
    station0024.nameOriginal = @"Palmovka";
    station0024.mapLocation = CGPointMake(2792.5, 1855);
    station0024.geoLocation = CGPointMake(50.103889, 14.475);

    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0024.mapLocation;
    fillCircle0041.radius = 25;
    fillCircle0041.fillColor = [UIColor whiteColor];
    [station0024.drawPrimitives addObject:fillCircle0041];
    
    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = station0024.mapLocation;
    fillCircle0042.radius = 18.5;
    fillCircle0042.fillColor = line0002.color;
    [station0024.drawPrimitives addObject:fillCircle0042];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(2800, 1795);
    drawLine0035.endPoint = CGPointMake(2870, 1795);
    drawLine0035.width = 34;
    drawLine0035.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.8];
    [station0024.drawPrimitives addObject:drawLine0035];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0024.nameOriginal;
    drawTextLine0035.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 36;
    drawTextLine0035.degrees = 0;
    drawTextLine0035.kernSpacing = -0.4;
    drawTextLine0035.origin = CGPointMake(2708, 1771);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0035];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 1171;
    [edge0004.elements addObject:haul0023];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(2793, 1854.5);
    drawLine0036.endPoint = CGPointMake(2663.5, 1983.5);
    drawLine0036.width = 41;
    drawLine0036.color = line0002.color;
    [haul0023.drawPrimitives addObject:drawLine0036];

    // Добавляем станцию Invalidovna
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0004.elements addObject:station0025];
    
    station0025.nameOriginal = @"Invalidovna";
    station0025.mapLocation = CGPointMake(2663.5, 1983.5);
    station0025.geoLocation = CGPointMake(50.096667, 14.463056);

    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = station0025.mapLocation;
    fillCircle0043.radius = 25;
    fillCircle0043.fillColor = [UIColor whiteColor];
    [station0025.drawPrimitives addObject:fillCircle0043];
    
    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0025.mapLocation;
    fillCircle0044.radius = 18.5;
    fillCircle0044.fillColor = line0002.color;
    [station0025.drawPrimitives addObject:fillCircle0044];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(2830, 2015.5);
    drawLine0038.endPoint = CGPointMake(2900, 2015.5);
    drawLine0038.width = 26;
    drawLine0038.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.8];
    [station0025.drawPrimitives addObject:drawLine0038];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = station0025.nameOriginal;
    drawTextLine0036.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 36;
    drawTextLine0036.degrees = 0;
    drawTextLine0036.kernSpacing = -0.8;
    drawTextLine0036.origin = CGPointMake(2706, 1987);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0036];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 952;
    [edge0004.elements addObject:haul0024];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(2664, 1983);
    drawLine0037.endPoint = CGPointMake(2556, 2092);
    drawLine0037.width = 41;
    drawLine0037.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0037];

    // Добавляем станцию Křižíkova
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0004.elements addObject:station0026];
    
    station0026.nameOriginal = @"Křižíkova";
    station0026.mapLocation = CGPointMake(2556, 2092);
    station0026.geoLocation = CGPointMake(50.0925, 14.451389);

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0026.mapLocation;
    fillCircle0045.radius = 25;
    fillCircle0045.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0045];
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0026.mapLocation;
    fillCircle0046.radius = 18.5;
    fillCircle0046.fillColor = line0002.color;
    [station0026.drawPrimitives addObject:fillCircle0046];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = station0026.nameOriginal;
    drawTextLine0037.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 36;
    drawTextLine0037.degrees = 0;
    drawTextLine0037.kernSpacing = -0.4;
    drawTextLine0037.origin = CGPointMake(2589, 2095);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0037];

    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 899;
    [edge0004.elements addObject:haul0025];

    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(2515, 2048);
    drawArc0020.startDegrees = 45;
    drawArc0020.endDegrees = 90;
    drawArc0020.radius = 60;
    drawArc0020.width = 41;
    drawArc0020.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawArc0020];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(2416.5, 2108);
    drawLine0039.endPoint = CGPointMake(2515, 2108);
    drawLine0039.width = 41;
    drawLine0039.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0039];

    // Добавляем станцию Florenc
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0004.elements addObject:station0027];
    
    station0027.nameOriginal = @"Florenc";
    station0027.mapLocation = CGPointMake(2416.5, 2108);
    station0027.geoLocation = CGPointMake(50.091, 14.439);

    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = station0027.mapLocation;
    fillCircle0047.radius = 25;
    fillCircle0047.fillColor = [UIColor whiteColor];
    [station0027.drawPrimitives addObject:fillCircle0047];

    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = station0027.mapLocation;
    fillCircle0048.radius = 18.5;
    fillCircle0048.fillColor = line0002.color;
    [station0027.drawPrimitives addObject:fillCircle0048];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = station0027.nameOriginal;
    drawTextLine0038.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 36;
    drawTextLine0038.degrees = 0;
    drawTextLine0038.kernSpacing = -0.0;
    drawTextLine0038.origin = CGPointMake(2449, 2135);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0038];

    // Добавляем вершину
    edge0004.finishVertex = vertex0007;

    // Создаем участок линии Florenc - Můstek
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Florenc - Můstek";
    [self.edges addObject:edge0005];
    
    // Добавляем линию
    edge0005.line = line0002;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0007;

    // Добавляем станцию Florenc
    [edge0005.elements addObject:station0027];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 595;
    [edge0005.elements addObject:haul0026];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(2417, 2108);
    drawLine0040.endPoint = CGPointMake(2292.5, 2111);
    drawLine0040.width = 41;
    drawLine0040.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0040];

    // Добавляем станцию Náměstí Republiky
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0005.elements addObject:station0028];
    
    station0028.nameOriginal = @"Náměstí Republiky";
    station0028.mapLocation = CGPointMake(2284.5, 2112);
    station0028.geoLocation = CGPointMake(50.0883, 14.4318);

    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = station0028.mapLocation;
    fillCircle0049.radius = 25;
    fillCircle0049.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0049];
    
    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = station0028.mapLocation;
    fillCircle0050.radius = 18.5;
    fillCircle0050.fillColor = line0002.color;
    [station0028.drawPrimitives addObject:fillCircle0050];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(2190, 2115.5);
    drawLine0043.endPoint = CGPointMake(2256, 2115.5);
    drawLine0043.width = 26;
    drawLine0043.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.8];
    [station0028.drawPrimitives addObject:drawLine0043];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(2190, 2153);
    drawLine0044.endPoint = CGPointMake(2260, 2153);
    drawLine0044.width = 26;
    drawLine0044.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.8];
    [station0028.drawPrimitives addObject:drawLine0044];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(2260, 2157);
    drawLine0045.endPoint = CGPointMake(2300, 2157);
    drawLine0045.width = 32;
    drawLine0045.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.8];
    [station0028.drawPrimitives addObject:drawLine0045];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = @"Náměstí";
    drawTextLine0039.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 36;
    drawTextLine0039.degrees = 0;
    drawTextLine0039.kernSpacing = -0.0;
    drawTextLine0039.origin = CGPointMake(2115, 2087);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0039];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = @"Republiky";
    drawTextLine0040.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 36;
    drawTextLine0040.degrees = 0;
    drawTextLine0040.kernSpacing = -0.0;
    drawTextLine0040.origin = CGPointMake(2115, 2126);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0040];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 758;
    [edge0005.elements addObject:haul0027];

    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(2294, 2141);
    drawArc0021.startDegrees = 200;
    drawArc0021.endDegrees = 269;
    drawArc0021.radius = 30;
    drawArc0021.width = 41;
    drawArc0021.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawArc0021];
    
    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(2253.5, 2165);
    drawLine0041.endPoint = CGPointMake(2266, 2130);
    drawLine0041.width = 41;
    drawLine0041.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0041];
    
    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(2199, 2141);
    drawArc0022.startDegrees = 22;
    drawArc0022.endDegrees = 45;
    drawArc0022.radius = 60;
    drawArc0022.width = 41;
    drawArc0022.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawArc0022];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(2156.5, 2268);
    drawLine0042.endPoint = CGPointMake(2241.5, 2183);
    drawLine0042.width = 41;
    drawLine0042.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0042];

    // Добавляем станцию Můstek
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0005.elements addObject:station0029];
    
    station0029.nameOriginal = @"Můstek";
    station0029.mapLocation = CGPointMake(2156.5, 2268);
    station0029.geoLocation = CGPointMake(50.0842, 14.4233);
    station0029.showNameOnMap = false;
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0013];
    
    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = station0029.mapLocation;
    fillCircle0051.radius = 25;
    fillCircle0051.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0051];
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = station0029.mapLocation;
    fillCircle0052.radius = 18.5;
    fillCircle0052.fillColor = line0002.color;
    [station0029.drawPrimitives addObject:fillCircle0052];

    // Добавляем вершину
    edge0005.finishVertex = vertex0009;

    // Создаем участок линии Můstek - Zličín
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Můstek - Zličín";
    [self.edges addObject:edge0006];
    
    // Добавляем линию
    edge0006.line = line0002;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0009;

    // Добавляем станцию Můstek
    [edge0006.elements addObject:station0029];

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 523;
    [edge0006.elements addObject:haul0028];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(2157, 2267.5);
    drawLine0047.endPoint = CGPointMake(2112.5, 2312);
    drawLine0047.width = 41;
    drawLine0047.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawLine0047];

    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(2159.5, 2349.5);
    drawArc0023.startDegrees = 180;
    drawArc0023.endDegrees = 225;
    drawArc0023.radius = 60;
    drawArc0023.width = 41;
    drawArc0023.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawArc0023];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(2099.5, 2349);
    drawLine0048.endPoint = CGPointMake(2099.5, 2410.5);
    drawLine0048.width = 41;
    drawLine0048.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawLine0048];

    // Добавляем станцию Národní třída
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0006.elements addObject:station0030];

    station0030.nameOriginal = @"Národní třída";
    station0030.mapLocation = CGPointMake(2099.5, 2410.5);
    station0030.geoLocation = CGPointMake(50.08, 14.42);

    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = station0030.mapLocation;
    fillCircle0053.radius = 25;
    fillCircle0053.fillColor = [UIColor whiteColor];
    [station0030.drawPrimitives addObject:fillCircle0053];
    
    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = station0030.mapLocation;
    fillCircle0054.radius = 18.5;
    fillCircle0054.fillColor = line0002.color;
    [station0030.drawPrimitives addObject:fillCircle0054];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(2070, 2332);
    drawLine0049.endPoint = CGPointMake(2120, 2332);
    drawLine0049.width = 34;
    drawLine0049.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:.8];
    [station0030.drawPrimitives addObject:drawLine0049];
    
    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = @"Národní";
    drawTextLine0041.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 36;
    drawTextLine0041.degrees = 0;
    drawTextLine0041.kernSpacing = -0.0;
    drawTextLine0041.origin = CGPointMake(1986, 2309);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0041];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = @"třída";
    drawTextLine0042.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 36;
    drawTextLine0042.degrees = 0;
    drawTextLine0042.kernSpacing = 0.2;
    drawTextLine0042.origin = CGPointMake(1986, 2348);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0042];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 467;
    [edge0006.elements addObject:haul0029];
    
    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(2099.5, 2410.5);
    drawLine0050.endPoint = CGPointMake(2099.5, 2566.5);
    drawLine0050.width = 41;
    drawLine0050.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0050];

    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(2039.5, 2566);
    drawArc0024.startDegrees = 0;
    drawArc0024.endDegrees = 45;
    drawArc0024.radius = 60;
    drawArc0024.width = 41;
    drawArc0024.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawArc0024];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(2082.5, 2608);
    drawLine0051.endPoint = CGPointMake(2035, 2655.5);
    drawLine0051.width = 41;
    drawLine0051.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0051];

    // Добавляем станцию Karlovo náměstí
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0006.elements addObject:station0031];

    station0031.nameOriginal = @"Karlovo náměstí";
    station0031.mapLocation = CGPointMake(2035, 2655.5);
    station0031.geoLocation = CGPointMake(50.076, 14.418);
    
    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = station0031.mapLocation;
    fillCircle0055.radius = 25;
    fillCircle0055.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0055];
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = station0031.mapLocation;
    fillCircle0056.radius = 18.5;
    fillCircle0056.fillColor = line0002.color;
    [station0031.drawPrimitives addObject:fillCircle0056];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = @"Karlovo";
    drawTextLine0043.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 36;
    drawTextLine0043.degrees = 0;
    drawTextLine0043.kernSpacing = 0.6;
    drawTextLine0043.origin = CGPointMake(2081, 2645);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0043];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = @"náměstí";
    drawTextLine0044.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 36;
    drawTextLine0044.degrees = 0;
    drawTextLine0044.kernSpacing = 0.0;
    drawTextLine0044.origin = CGPointMake(2081, 2684);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 954;
    [edge0006.elements addObject:haul0030];
    
    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(2012.5, 2678);
    drawLine0052.endPoint = CGPointMake(2035.5, 2655);
    drawLine0052.width = 41;
    drawLine0052.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0052];

    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(1971, 2635);
    drawArc0025.startDegrees = 45;
    drawArc0025.endDegrees = 90;
    drawArc0025.radius = 60;
    drawArc0025.width = 41;
    drawArc0025.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawArc0025];
    
    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(1868, 2695);
    drawLine0053.endPoint = CGPointMake(1971.5, 2695);
    drawLine0053.width = 41;
    drawLine0053.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0053];

    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(1868.5, 2755);
    drawArc0026.startDegrees = 225;
    drawArc0026.endDegrees = 270;
    drawArc0026.radius = 60;
    drawArc0026.width = 41;
    drawArc0026.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawArc0026];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(1798.5, 2740.5);
    drawLine0054.endPoint = CGPointMake(1829, 2710);
    drawLine0054.width = 41;
    drawLine0054.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0054];

    MWDrawArc *drawArc0027 = [[MWDrawArc alloc] init];
    drawArc0027.center = CGPointMake(1841.5, 2782.5);
    drawArc0027.startDegrees = 195;
    drawArc0027.endDegrees = 225;
    drawArc0027.radius = 60;
    drawArc0027.width = 41;
    drawArc0027.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawArc0027];

    // Добавляем станцию Anděl
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0006.elements addObject:station0032];
    
    station0032.nameOriginal = @"Anděl";
    station0032.mapLocation = CGPointMake(1782, 2761);
    station0032.geoLocation = CGPointMake(50.074, 14.405);

    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = station0032.mapLocation;
    fillCircle0057.radius = 25;
    fillCircle0057.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0057];
    
    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = station0032.mapLocation;
    fillCircle0058.radius = 18.5;
    fillCircle0058.fillColor = line0002.color;
    [station0032.drawPrimitives addObject:fillCircle0058];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = station0032.nameOriginal;
    drawTextLine0045.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 36;
    drawTextLine0045.degrees = 0;
    drawTextLine0045.kernSpacing = 0.6;
    drawTextLine0045.origin = CGPointMake(1826, 2768);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0045];

    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 1023;
    [edge0006.elements addObject:haul0031];

    MWDrawArc *drawArc0028 = [[MWDrawArc alloc] init];
    drawArc0028.center = CGPointMake(1841.5, 2782.5);
    drawArc0028.startDegrees = 180;
    drawArc0028.endDegrees = 195.5;
    drawArc0028.radius = 60;
    drawArc0028.width = 41;
    drawArc0028.color = line0002.color;
    [haul0031.drawPrimitives addObject:drawArc0028];

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(1781.5, 2782);
    drawLine0055.endPoint = CGPointMake(1782.5, 2935.5);
    drawLine0055.width = 41;
    drawLine0055.color = line0002.color;
    [haul0031.drawPrimitives addObject:drawLine0055];

    // Добавляем станцию Smíchovské nádraží
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0006.elements addObject:station0033];

    station0033.nameOriginal = @"Smíchovské nádraží";
    station0033.mapLocation = CGPointMake(1782.5, 2935.5);
    station0033.geoLocation = CGPointMake(50.065, 14.408);

    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = station0033.mapLocation;
    fillCircle0059.radius = 25;
    fillCircle0059.fillColor = [UIColor whiteColor];
    [station0033.drawPrimitives addObject:fillCircle0059];
    
    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = station0033.mapLocation;
    fillCircle0060.radius = 18.5;
    fillCircle0060.fillColor = line0002.color;
    [station0033.drawPrimitives addObject:fillCircle0060];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = @"Smíchovské";
    drawTextLine0046.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 36;
    drawTextLine0046.degrees = 0;
    drawTextLine0046.kernSpacing = 0.3;
    drawTextLine0046.origin = CGPointMake(1826, 2914);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0046];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = @"nádraží";
    drawTextLine0047.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 36;
    drawTextLine0047.degrees = 0;
    drawTextLine0047.kernSpacing = 0.3;
    drawTextLine0047.origin = CGPointMake(1826, 2953);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0047];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 1564;
    [edge0006.elements addObject:haul0032];

    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(1782.5, 2943);
    drawLine0056.endPoint = CGPointMake(1782.5, 2935);
    drawLine0056.width = 41;
    drawLine0056.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0056];

    MWDrawArc *drawArc0029 = [[MWDrawArc alloc] init];
    drawArc0029.center = CGPointMake(1722.5, 2943);
    drawArc0029.startDegrees = 0;
    drawArc0029.endDegrees = 45;
    drawArc0029.radius = 60;
    drawArc0029.width = 41;
    drawArc0029.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawArc0029];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(1767.5, 2983);
    drawLine0057.endPoint = CGPointMake(1722.5, 3028);
    drawLine0057.width = 41;
    drawLine0057.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0057];

    MWDrawArc *drawArc0030 = [[MWDrawArc alloc] init];
    drawArc0030.center = CGPointMake(1680, 2985.5);
    drawArc0030.startDegrees = 45;
    drawArc0030.endDegrees = 90;
    drawArc0030.radius = 60;
    drawArc0030.width = 41;
    drawArc0030.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawArc0030];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(1579, 3045.5);
    drawLine0058.endPoint = CGPointMake(1680, 3045.5);
    drawLine0058.width = 41;
    drawLine0058.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0058];

    // Добавляем станцию Radlická
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0006.elements addObject:station0034];

    station0034.nameOriginal = @"Radlická";
    station0034.mapLocation = CGPointMake(1579, 3045.5);
    station0034.geoLocation = CGPointMake(50.058, 14.389);

    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = station0034.mapLocation;
    fillCircle0061.radius = 25;
    fillCircle0061.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0061];
    
    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = station0034.mapLocation;
    fillCircle0062.radius = 18.5;
    fillCircle0062.fillColor = line0002.color;
    [station0034.drawPrimitives addObject:fillCircle0062];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0034.nameOriginal;
    drawTextLine0048.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 36;
    drawTextLine0048.degrees = 0;
    drawTextLine0048.kernSpacing = 0.0;
    drawTextLine0048.origin = CGPointMake(1509, 3082);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0048];

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 1337;
    [edge0006.elements addObject:haul0033];
    
    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(1579.5, 3045.5);
    drawLine0059.endPoint = CGPointMake(1393.5, 3046);
    drawLine0059.width = 41;
    drawLine0059.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0059];

    // Добавляем станцию Jinonice
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0006.elements addObject:station0035];
    
    station0035.nameOriginal = @"Jinonice";
    station0035.mapLocation = CGPointMake(1393.5, 3046);
    station0035.geoLocation = CGPointMake(50.054444, 14.371111);

    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = station0035.mapLocation;
    fillCircle0063.radius = 25;
    fillCircle0063.fillColor = [UIColor whiteColor];
    [station0035.drawPrimitives addObject:fillCircle0063];
    
    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = station0035.mapLocation;
    fillCircle0064.radius = 18.5;
    fillCircle0064.fillColor = line0002.color;
    [station0035.drawPrimitives addObject:fillCircle0064];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0035.nameOriginal;
    drawTextLine0049.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 36;
    drawTextLine0049.degrees = 0;
    drawTextLine0049.kernSpacing = 0.0;
    drawTextLine0049.origin = CGPointMake(1327, 3082);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0049];

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 1417;
    [edge0006.elements addObject:haul0034];

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(1394, 3046);
    drawLine0060.endPoint = CGPointMake(1208, 3046);
    drawLine0060.width = 41;
    drawLine0060.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0060];

    // Добавляем станцию Nové Butovice
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0006.elements addObject:station0036];
    
    station0036.nameOriginal = @"Nové Butovice";
    station0036.mapLocation = CGPointMake(1208, 3046);
    station0036.geoLocation = CGPointMake(50.051, 14.352);

    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = station0036.mapLocation;
    fillCircle0065.radius = 25;
    fillCircle0065.fillColor = [UIColor whiteColor];
    [station0036.drawPrimitives addObject:fillCircle0065];
    
    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = station0036.mapLocation;
    fillCircle0066.radius = 18.5;
    fillCircle0066.fillColor = line0002.color;
    [station0036.drawPrimitives addObject:fillCircle0066];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = @"Nové";
    drawTextLine0050.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 36;
    drawTextLine0050.degrees = 0;
    drawTextLine0050.kernSpacing = 0.0;
    drawTextLine0050.origin = CGPointMake(1163, 3082);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0050];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = @"Butovice";
    drawTextLine0051.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 36;
    drawTextLine0051.degrees = 0;
    drawTextLine0051.kernSpacing = 0.4;
    drawTextLine0051.origin = CGPointMake(1132, 3120.5);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0051];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 652;
    [edge0006.elements addObject:haul0035];

    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(1208.5, 3046);
    drawLine0061.endPoint = CGPointMake(1022, 3046);
    drawLine0061.width = 41;
    drawLine0061.color = line0002.color;
    [haul0035.drawPrimitives addObject:drawLine0061];

    // Добавляем станцию Hůrka
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0006.elements addObject:station0037];
    
    station0037.nameOriginal = @"Hůrka";
    station0037.mapLocation = CGPointMake(1022, 3046);
    station0037.geoLocation = CGPointMake(50.05, 14.343);

    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = station0037.mapLocation;
    fillCircle0067.radius = 25;
    fillCircle0067.fillColor = [UIColor whiteColor];
    [station0037.drawPrimitives addObject:fillCircle0067];
    
    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = station0037.mapLocation;
    fillCircle0068.radius = 18.5;
    fillCircle0068.fillColor = line0002.color;
    [station0037.drawPrimitives addObject:fillCircle0068];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0037.nameOriginal;
    drawTextLine0052.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 36;
    drawTextLine0052.degrees = 0;
    drawTextLine0052.kernSpacing = 0.4;
    drawTextLine0052.origin = CGPointMake(973, 3082);
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0052];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 1082;
    [edge0006.elements addObject:haul0036];
    
    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(1022.5, 3046);
    drawLine0062.endPoint = CGPointMake(836.5, 3045.5);
    drawLine0062.width = 41;
    drawLine0062.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0062];

    // Добавляем станцию Lužiny
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0006.elements addObject:station0038];
    
    station0038.nameOriginal = @"Lužiny";
    station0038.mapLocation = CGPointMake(836.5, 3045.5);
    station0038.geoLocation = CGPointMake(50.045, 14.33);

    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = station0038.mapLocation;
    fillCircle0069.radius = 25;
    fillCircle0069.fillColor = [UIColor whiteColor];
    [station0038.drawPrimitives addObject:fillCircle0069];
    
    MWDrawFillCircle *fillCircle0070 = [[MWDrawFillCircle alloc] init];
    fillCircle0070.center = station0038.mapLocation;
    fillCircle0070.radius = 18.5;
    fillCircle0070.fillColor = line0002.color;
    [station0038.drawPrimitives addObject:fillCircle0070];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = station0038.nameOriginal;
    drawTextLine0053.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0053.fontColor = [UIColor blackColor];
    drawTextLine0053.fontSize = 36;
    drawTextLine0053.degrees = 0;
    drawTextLine0053.kernSpacing = 0.6;
    drawTextLine0053.origin = CGPointMake(782, 3082);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0053];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 559;
    [edge0006.elements addObject:haul0037];

    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(779, 3045.5);
    drawLine0063.endPoint = CGPointMake(837, 3045.5);
    drawLine0063.width = 41;
    drawLine0063.color = line0002.color;
    [haul0037.drawPrimitives addObject:drawLine0063];

    MWDrawArc *drawArc0031 = [[MWDrawArc alloc] init];
    drawArc0031.center = CGPointMake(779, 2985.5);
    drawArc0031.startDegrees = 90;
    drawArc0031.endDegrees = 135;
    drawArc0031.radius = 60;
    drawArc0031.width = 41;
    drawArc0031.color = line0002.color;
    [haul0037.drawPrimitives addObject:drawArc0031];

    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(737, 3028.5);
    drawLine0064.endPoint = CGPointMake(676, 2967.5);
    drawLine0064.width = 41;
    drawLine0064.color = line0002.color;
    [haul0037.drawPrimitives addObject:drawLine0064];

    // Добавляем станцию Luka
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0006.elements addObject:station0039];
    
    station0039.nameOriginal = @"Luka";
    station0039.mapLocation = CGPointMake(676, 2967.5);
    station0039.geoLocation = CGPointMake(50.045556, 14.322222);

    MWDrawFillCircle *fillCircle0071 = [[MWDrawFillCircle alloc] init];
    fillCircle0071.center = station0039.mapLocation;
    fillCircle0071.radius = 25;
    fillCircle0071.fillColor = [UIColor whiteColor];
    [station0039.drawPrimitives addObject:fillCircle0071];
    
    MWDrawFillCircle *fillCircle0072 = [[MWDrawFillCircle alloc] init];
    fillCircle0072.center = station0039.mapLocation;
    fillCircle0072.radius = 18.5;
    fillCircle0072.fillColor = line0002.color;
    [station0039.drawPrimitives addObject:fillCircle0072];

    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = station0039.nameOriginal;
    drawTextLine0054.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 36;
    drawTextLine0054.degrees = 0;
    drawTextLine0054.kernSpacing = 0.8;
    drawTextLine0054.origin = CGPointMake(715, 2919);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0054];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 1102;
    [edge0006.elements addObject:haul0038];

    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(676.5, 2968);
    drawLine0065.endPoint = CGPointMake(571, 2862.5);
    drawLine0065.width = 41;
    drawLine0065.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawLine0065];

    // Добавляем станцию Stodůlky
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0006.elements addObject:station0040];
    
    station0040.nameOriginal = @"Stodůlky";
    station0040.mapLocation = CGPointMake(571, 2862.5);
    station0040.geoLocation = CGPointMake(50.046944, 14.306944);

    MWDrawFillCircle *fillCircle0073 = [[MWDrawFillCircle alloc] init];
    fillCircle0073.center = station0040.mapLocation;
    fillCircle0073.radius = 25;
    fillCircle0073.fillColor = [UIColor whiteColor];
    [station0040.drawPrimitives addObject:fillCircle0073];
    
    MWDrawFillCircle *fillCircle0074 = [[MWDrawFillCircle alloc] init];
    fillCircle0074.center = station0040.mapLocation;
    fillCircle0074.radius = 18.5;
    fillCircle0074.fillColor = line0002.color;
    [station0040.drawPrimitives addObject:fillCircle0074];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = station0040.nameOriginal;
    drawTextLine0055.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 36;
    drawTextLine0055.degrees = 0;
    drawTextLine0055.kernSpacing = 0.4;
    drawTextLine0055.origin = CGPointMake(609, 2814);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0055];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 1385;
    [edge0006.elements addObject:haul0039];

    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(571.5, 2863);
    drawLine0066.endPoint = CGPointMake(483.5, 2774.5);
    drawLine0066.width = 41;
    drawLine0066.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawLine0066];

    // Добавляем станцию Zličín
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0006.elements addObject:station0041];

    station0041.nameOriginal = @"Zličín";
    station0041.mapLocation = CGPointMake(483.5, 2774.5);
    station0041.geoLocation = CGPointMake(50.053611, 14.290556);

    MWDrawRoundedRect *roundedRect0004 = [[MWDrawRoundedRect alloc] init];
    roundedRect0004.rect = CGRectMake(450, 2741, 66, 66);
    roundedRect0004.cornerRadius = 6;
    roundedRect0004.color = line0002.color;
    [station0041.drawPrimitives addObject:roundedRect0004];

    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(482.5, 2750);
    drawLine0067.endPoint = CGPointMake(482.5, 2799);
    drawLine0067.width = 49;
    drawLine0067.color = [UIColor whiteColor];
    [station0041.drawPrimitives addObject:drawLine0067];

    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = @"B";
    drawTextLine0056.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0056.fontColor = line0002.color;
    drawTextLine0056.fontSize = 70;
    drawTextLine0056.degrees = 0;
    drawTextLine0056.origin = CGPointMake(399, 2725);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0056];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = station0041.nameOriginal.uppercaseString;
    drawTextLine0057.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0057.fontColor = [UIColor blackColor];
    drawTextLine0057.fontSize = 38;
    drawTextLine0057.degrees = 0;
    drawTextLine0057.kernSpacing = 0.2;
    drawTextLine0057.origin = CGPointMake(537, 2738);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0057];

    // Добавляем вершину
    edge0006.finishVertex = vertex0004;

    ////////////////////////////////////////////////////////////////
    // Line C
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Letňany - Florenc
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Letňany - Florenc";
    [self.edges addObject:edge0007];
    
    // Добавляем линию
    edge0007.line = line0003;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0005;
    
    // Добавляем станцию Letňany
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0007.elements addObject:station0042];
    
    station0042.nameOriginal = @"Letňany";
    station0042.mapLocation = CGPointMake(3461.5, 1252.5);
    station0042.geoLocation = CGPointMake(50.125, 14.514);

    MWDrawRoundedRect *roundedRect0005 = [[MWDrawRoundedRect alloc] init];
    roundedRect0005.rect = CGRectMake(3428, 1220, 66, 66);
    roundedRect0005.cornerRadius = 6;
    roundedRect0005.color = line0003.color;
    [station0042.drawPrimitives addObject:roundedRect0005];

    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(3461.5, 1229);
    drawLine0068.endPoint = CGPointMake(3461.5, 1278);
    drawLine0068.width = 49;
    drawLine0068.color = [UIColor whiteColor];
    [station0042.drawPrimitives addObject:drawLine0068];

    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = @"C";
    drawTextLine0058.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0058.fontColor = line0003.color;
    drawTextLine0058.fontSize = 70;
    drawTextLine0058.degrees = 0;
    drawTextLine0058.origin = CGPointMake(3507, 1205);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0058];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = station0042.nameOriginal.uppercaseString;
    drawTextLine0059.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0059.fontColor = [UIColor blackColor];
    drawTextLine0059.fontSize = 38;
    drawTextLine0059.degrees = 0;
    drawTextLine0059.kernSpacing = 0.2;
    drawTextLine0059.origin = CGPointMake(3382, 1159);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0059];

    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 1260;
    [edge0007.elements addObject:haul0040];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(3461.5, 1252.5);
    drawLine0069.endPoint = CGPointMake(3336.5, 1377.5);
    drawLine0069.width = 41;
    drawLine0069.color = line0003.color;
    [haul0040.drawPrimitives addObject:drawLine0069];

    MWDrawArc *drawArc0032 = [[MWDrawArc alloc] init];
    drawArc0032.center = CGPointMake(3294.5, 1334.5);
    drawArc0032.startDegrees = 45;
    drawArc0032.endDegrees = 90;
    drawArc0032.radius = 60;
    drawArc0032.width = 41;
    drawArc0032.color = line0003.color;
    [haul0040.drawPrimitives addObject:drawArc0032];

    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(3295, 1394.5);
    drawLine0070.endPoint = CGPointMake(3168, 1394.5);
    drawLine0070.width = 41;
    drawLine0070.color = line0003.color;
    [haul0040.drawPrimitives addObject:drawLine0070];

    // Добавляем станцию Prosek
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0007.elements addObject:station0043];
    
    station0043.nameOriginal = @"Prosek";
    station0043.mapLocation = CGPointMake(3168, 1394.5);
    station0043.geoLocation = CGPointMake(50.119, 14.499);

    MWDrawFillCircle *fillCircle0075 = [[MWDrawFillCircle alloc] init];
    fillCircle0075.center = station0043.mapLocation;
    fillCircle0075.radius = 25;
    fillCircle0075.fillColor = [UIColor whiteColor];
    [station0043.drawPrimitives addObject:fillCircle0075];
    
    MWDrawFillCircle *fillCircle0076 = [[MWDrawFillCircle alloc] init];
    fillCircle0076.center = station0043.mapLocation;
    fillCircle0076.radius = 18.5;
    fillCircle0076.fillColor = line0003.color;
    [station0043.drawPrimitives addObject:fillCircle0076];

    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = station0043.nameOriginal;
    drawTextLine0060.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 36;
    drawTextLine0060.degrees = 0;
    drawTextLine0060.kernSpacing = 0.3;
    drawTextLine0060.origin = CGPointMake(3112, 1431.5);
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0060];

    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 1055;
    [edge0007.elements addObject:haul0041];

    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(3168.5, 1394.5);
    drawLine0071.endPoint = CGPointMake(3125, 1394.5);
    drawLine0071.width = 41;
    drawLine0071.color = line0003.color;
    [haul0041.drawPrimitives addObject:drawLine0071];

    MWDrawArc *drawArc0033 = [[MWDrawArc alloc] init];
    drawArc0033.center = CGPointMake(3125.5, 1334.5);
    drawArc0033.startDegrees = 90;
    drawArc0033.endDegrees = 135;
    drawArc0033.radius = 60;
    drawArc0033.width = 41;
    drawArc0033.color = line0003.color;
    [haul0041.drawPrimitives addObject:drawArc0033];

    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(2952, 1246);
    drawLine0072.endPoint = CGPointMake(3083.5, 1377.5);
    drawLine0072.width = 41;
    drawLine0072.color = line0003.color;
    [haul0041.drawPrimitives addObject:drawLine0072];

    // Добавляем станцию Střížkov
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0007.elements addObject:station0044];

    station0044.nameOriginal = @"Střížkov";
    station0044.mapLocation = CGPointMake(2952, 1246);
    station0044.geoLocation = CGPointMake(50.126, 14.489);
    
    MWDrawFillCircle *fillCircle0077 = [[MWDrawFillCircle alloc] init];
    fillCircle0077.center = station0044.mapLocation;
    fillCircle0077.radius = 25;
    fillCircle0077.fillColor = [UIColor whiteColor];
    [station0044.drawPrimitives addObject:fillCircle0077];
    
    MWDrawFillCircle *fillCircle0078 = [[MWDrawFillCircle alloc] init];
    fillCircle0078.center = station0044.mapLocation;
    fillCircle0078.radius = 18.5;
    fillCircle0078.fillColor = line0003.color;
    [station0044.drawPrimitives addObject:fillCircle0078];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = station0044.nameOriginal;
    drawTextLine0061.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0061.fontColor = [UIColor blackColor];
    drawTextLine0061.fontSize = 36;
    drawTextLine0061.degrees = 0;
    drawTextLine0061.kernSpacing = 0.4;
    drawTextLine0061.origin = CGPointMake(2993, 1197);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0061];

    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 1430;
    [edge0007.elements addObject:haul0042];

    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(2952.5, 1246.5);
    drawLine0073.endPoint = CGPointMake(2871.5, 1164.1);
    drawLine0073.width = 41;
    drawLine0073.color = line0003.color;
    [haul0042.drawPrimitives addObject:drawLine0073];

    MWDrawArc *drawArc0034 = [[MWDrawArc alloc] init];
    drawArc0034.center = CGPointMake(2830, 1207.5);
    drawArc0034.startDegrees = 270;
    drawArc0034.endDegrees = 315;
    drawArc0034.radius = 60;
    drawArc0034.width = 41;
    drawArc0034.color = line0003.color;
    [haul0042.drawPrimitives addObject:drawArc0034];

    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(2672, 1147.5);
    drawLine0074.endPoint = CGPointMake(2830, 1147.5);
    drawLine0074.width = 41;
    drawLine0074.color = line0003.color;
    [haul0042.drawPrimitives addObject:drawLine0074];

    // Добавляем станцию Ládví
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0007.elements addObject:station0045];

    station0045.nameOriginal = @"Ládví";
    station0045.mapLocation = CGPointMake(2672, 1147.5);
    station0045.geoLocation = CGPointMake(50.127, 14.469);

    MWDrawFillCircle *fillCircle0079 = [[MWDrawFillCircle alloc] init];
    fillCircle0079.center = station0045.mapLocation;
    fillCircle0079.radius = 25;
    fillCircle0079.fillColor = [UIColor whiteColor];
    [station0045.drawPrimitives addObject:fillCircle0079];
    
    MWDrawFillCircle *fillCircle0080 = [[MWDrawFillCircle alloc] init];
    fillCircle0080.center = station0045.mapLocation;
    fillCircle0080.radius = 18.5;
    fillCircle0080.fillColor = line0003.color;
    [station0045.drawPrimitives addObject:fillCircle0080];

    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = station0045.nameOriginal;
    drawTextLine0062.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 36;
    drawTextLine0062.degrees = 0;
    drawTextLine0062.kernSpacing = 0.9;
    drawTextLine0062.origin = CGPointMake(2626.5, 1062.5);
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0062];

    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 1291;
    [edge0007.elements addObject:haul0043];

    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(2672.5, 1147.5);
    drawLine0075.endPoint = CGPointMake(2555, 1147.5);
    drawLine0075.width = 41;
    drawLine0075.color = line0003.color;
    [haul0043.drawPrimitives addObject:drawLine0075];

    MWDrawArc *drawArc0035 = [[MWDrawArc alloc] init];
    drawArc0035.center = CGPointMake(2555.5, 1207.5);
    drawArc0035.startDegrees = 225;
    drawArc0035.endDegrees = 270;
    drawArc0035.radius = 60;
    drawArc0035.width = 41;
    drawArc0035.color = line0003.color;
    [haul0043.drawPrimitives addObject:drawArc0035];

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(2434, 1244);
    drawLine0076.endPoint = CGPointMake(2515, 1163);
    drawLine0076.width = 41;
    drawLine0076.color = line0003.color;
    [haul0043.drawPrimitives addObject:drawLine0076];

    // Добавляем станцию Kobylisy
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0007.elements addObject:station0046];

    station0046.nameOriginal = @"Kobylisy";
    station0046.mapLocation = CGPointMake(2435, 1243);
    station0046.geoLocation = CGPointMake(50.123, 14.452);

    MWDrawFillCircle *fillCircle0081 = [[MWDrawFillCircle alloc] init];
    fillCircle0081.center = station0046.mapLocation;
    fillCircle0081.radius = 25;
    fillCircle0081.fillColor = [UIColor whiteColor];
    [station0046.drawPrimitives addObject:fillCircle0081];
    
    MWDrawFillCircle *fillCircle0082 = [[MWDrawFillCircle alloc] init];
    fillCircle0082.center = station0046.mapLocation;
    fillCircle0082.radius = 18.5;
    fillCircle0082.fillColor = line0003.color;
    [station0046.drawPrimitives addObject:fillCircle0082];
    
    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = station0046.nameOriginal;
    drawTextLine0063.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0063.fontColor = [UIColor blackColor];
    drawTextLine0063.fontSize = 36;
    drawTextLine0063.degrees = 0;
    drawTextLine0063.kernSpacing = 0.6;
    drawTextLine0063.origin = CGPointMake(2253, 1192.5);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0063];

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 1680;
    [edge0007.elements addObject:haul0044];
    
    MWDrawArc *drawArc0036 = [[MWDrawArc alloc] init];
    drawArc0036.center = CGPointMake(2476.5, 1286.5);
    drawArc0036.startDegrees = 180;
    drawArc0036.endDegrees = 226;
    drawArc0036.radius = 60;
    drawArc0036.width = 41;
    drawArc0036.color = line0003.color;
    [haul0044.drawPrimitives addObject:drawArc0036];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(2416.5, 1659);
    drawLine0077.endPoint = CGPointMake(2416.5, 1286);
    drawLine0077.width = 41;
    drawLine0077.color = line0003.color;
    [haul0044.drawPrimitives addObject:drawLine0077];

    // Добавляем станцию Nádraží Holešovice
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0007.elements addObject:station0047];
    
    station0047.nameOriginal = @"Nádraží Holešovice";
    station0047.mapLocation = CGPointMake(2416.5, 1659);
    station0047.geoLocation = CGPointMake(50.11, 14.44);
    
    MWDrawFillCircle *fillCircle0083 = [[MWDrawFillCircle alloc] init];
    fillCircle0083.center = station0047.mapLocation;
    fillCircle0083.radius = 25;
    fillCircle0083.fillColor = [UIColor whiteColor];
    [station0047.drawPrimitives addObject:fillCircle0083];
    
    MWDrawFillCircle *fillCircle0084 = [[MWDrawFillCircle alloc] init];
    fillCircle0084.center = station0047.mapLocation;
    fillCircle0084.radius = 18.5;
    fillCircle0084.fillColor = line0003.color;
    [station0047.drawPrimitives addObject:fillCircle0084];

    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = @"Nádraží";
    drawTextLine0064.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0064.fontColor = [UIColor blackColor];
    drawTextLine0064.fontSize = 36;
    drawTextLine0064.degrees = 0;
    drawTextLine0064.kernSpacing = 0.6;
    drawTextLine0064.origin = CGPointMake(2447, 1602.5);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0064];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = @"Holešovice";
    drawTextLine0065.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0065.fontColor = [UIColor blackColor];
    drawTextLine0065.fontSize = 36;
    drawTextLine0065.degrees = 0;
    drawTextLine0065.kernSpacing = 0.6;
    drawTextLine0065.origin = CGPointMake(2447, 1641.5);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0065];

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 1231;
    [edge0007.elements addObject:haul0045];

    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(2416.5, 1658.5);
    drawLine0078.endPoint = CGPointMake(2416.5, 1851);
    drawLine0078.width = 41;
    drawLine0078.color = line0003.color;
    [haul0045.drawPrimitives addObject:drawLine0078];

    // Добавляем станцию Vltavská
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0007.elements addObject:station0048];

    station0048.nameOriginal = @"Vltavská";
    station0048.mapLocation = CGPointMake(2416.5, 1851);
    station0048.geoLocation = CGPointMake(50.099, 14.438);

    MWDrawFillCircle *fillCircle0085 = [[MWDrawFillCircle alloc] init];
    fillCircle0085.center = station0048.mapLocation;
    fillCircle0085.radius = 25;
    fillCircle0085.fillColor = [UIColor whiteColor];
    [station0048.drawPrimitives addObject:fillCircle0085];
    
    MWDrawFillCircle *fillCircle0086 = [[MWDrawFillCircle alloc] init];
    fillCircle0086.center = station0048.mapLocation;
    fillCircle0086.radius = 18.5;
    fillCircle0086.fillColor = line0003.color;
    [station0048.drawPrimitives addObject:fillCircle0086];

    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = station0048.nameOriginal;
    drawTextLine0066.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0066.fontColor = [UIColor blackColor];
    drawTextLine0066.fontSize = 36;
    drawTextLine0066.degrees = 0;
    drawTextLine0066.kernSpacing = 0.0;
    drawTextLine0066.origin = CGPointMake(2450, 1828);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0066];

    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 892;
    [edge0007.elements addObject:haul0046];
    
    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(2416.5, 2108);
    drawLine0079.endPoint = CGPointMake(2416.5, 1850.5);
    drawLine0079.width = 41;
    drawLine0079.color = line0003.color;
    [haul0046.drawPrimitives addObject:drawLine0079];

    // Добавляем станцию Florenc
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0007.elements addObject:station0049];

    station0049.nameOriginal = @"Florenc";
    station0049.mapLocation = CGPointMake(2416.5, 2108);
    station0049.geoLocation = CGPointMake(50.091, 14.439);
    
    station0049.showNameOnMap = false;
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0038];
    
    MWDrawFillCircle *fillCircle0087 = [[MWDrawFillCircle alloc] init];
    fillCircle0087.center = station0049.mapLocation;
    fillCircle0087.radius = 25;
    fillCircle0087.fillColor = [UIColor whiteColor];
    [station0049.drawPrimitives addObject:fillCircle0087];
    
    MWDrawFillCircle *fillCircle0088 = [[MWDrawFillCircle alloc] init];
    fillCircle0088.center = station0049.mapLocation;
    fillCircle0088.radius = 18.5;
    fillCircle0088.fillColor = line0003.color;
    [station0049.drawPrimitives addObject:fillCircle0088];
    
    // Добавляем вершину
    edge0007.finishVertex = vertex0007;

    // Создаем участок линии Florenc - Muzeum
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Florenc - Muzeum";
    [self.edges addObject:edge0008];
    
    // Добавляем линию
    edge0008.line = line0003;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0007;

    // Добавляем станцию Florenc
    [edge0008.elements addObject:station0049];

    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 915;
    [edge0008.elements addObject:haul0047];

    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(2416.5, 2107.5);
    drawLine0080.endPoint = CGPointMake(2416.5, 2278);
    drawLine0080.width = 41;
    drawLine0080.color = line0003.color;
    [haul0047.drawPrimitives addObject:drawLine0080];

    // Добавляем станцию Hlavní nádraží
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0008.elements addObject:station0050];
    
    station0050.nameOriginal = @"Hlavní nádraží";
    station0050.mapLocation = CGPointMake(2416.5, 2278);
    station0050.geoLocation = CGPointMake(50.083, 14.436);

    MWDrawFillCircle *fillCircle0089 = [[MWDrawFillCircle alloc] init];
    fillCircle0089.center = station0050.mapLocation;
    fillCircle0089.radius = 25;
    fillCircle0089.fillColor = [UIColor whiteColor];
    [station0050.drawPrimitives addObject:fillCircle0089];
    
    MWDrawFillCircle *fillCircle0090 = [[MWDrawFillCircle alloc] init];
    fillCircle0090.center = station0050.mapLocation;
    fillCircle0090.radius = 18.5;
    fillCircle0090.fillColor = line0003.color;
    [station0050.drawPrimitives addObject:fillCircle0090];

    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = @"Hlavní";
    drawTextLine0067.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0067.fontColor = [UIColor blackColor];
    drawTextLine0067.fontSize = 36;
    drawTextLine0067.degrees = 0;
    drawTextLine0067.kernSpacing = -0.7;
    drawTextLine0067.origin = CGPointMake(2448, 2253);
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0067];

    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = @"nádraží";
    drawTextLine0068.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0068.fontColor = [UIColor blackColor];
    drawTextLine0068.fontSize = 36;
    drawTextLine0068.degrees = 0;
    drawTextLine0068.kernSpacing = -0.6;
    drawTextLine0068.origin = CGPointMake(2448, 2292);
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0068];

    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 510;
    [edge0008.elements addObject:haul0048];

    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(2416.5, 2453);
    drawLine0081.endPoint = CGPointMake(2416.5, 2278);
    drawLine0081.width = 41;
    drawLine0081.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawLine0081];

    MWDrawArc *drawArc0037 = [[MWDrawArc alloc] init];
    drawArc0037.center = CGPointMake(2356.5, 2453);
    drawArc0037.startDegrees = 0;
    drawArc0037.endDegrees = 45;
    drawArc0037.radius = 60;
    drawArc0037.width = 41;
    drawArc0037.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawArc0037];

    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(2399.5, 2495);
    drawLine0082.endPoint = CGPointMake(2392, 2502.5);
    drawLine0082.width = 41;
    drawLine0082.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawLine0082];

    // Добавляем станцию Muzeum
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0008.elements addObject:station0051];

    station0051.nameOriginal = @"Muzeum";
    station0051.mapLocation = CGPointMake(2392, 2502.5);
    station0051.geoLocation = CGPointMake(50.0796, 14.4312);
    
    station0051.showNameOnMap = false;
    [station0051.nameOriginalTextPrimitives addObject:drawTextLine0014];
    
    MWDrawFillCircle *fillCircle0091 = [[MWDrawFillCircle alloc] init];
    fillCircle0091.center = station0051.mapLocation;
    fillCircle0091.radius = 25;
    fillCircle0091.fillColor = [UIColor whiteColor];
    [station0051.drawPrimitives addObject:fillCircle0091];
    
    MWDrawFillCircle *fillCircle0092 = [[MWDrawFillCircle alloc] init];
    fillCircle0092.center = station0051.mapLocation;
    fillCircle0092.radius = 18.5;
    fillCircle0092.fillColor = line0003.color;
    [station0051.drawPrimitives addObject:fillCircle0092];

    // Добавляем вершину
    edge0008.finishVertex = vertex0008;

    // Создаем участок линии Muzeum - Háje
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: Muzeum - Háje";
    [self.edges addObject:edge0009];
    
    // Добавляем линию
    edge0009.line = line0003;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0008;

    // Добавляем станцию Muzeum
    [edge0009.elements addObject:station0051];

    // Добавляем перегон
    MWHaul *haul0049 = [[MWHaul alloc] init];
    haul0049.identifier = @"haul0049";
    haul0049.length = 518;
    [edge0009.elements addObject:haul0049];
    
    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(2375.5, 2519);
    drawLine0083.endPoint = CGPointMake(2392.5, 2502);
    drawLine0083.width = 41;
    drawLine0083.color = line0003.color;
    [haul0049.drawPrimitives addObject:drawLine0083];

    MWDrawArc *drawArc0038 = [[MWDrawArc alloc] init];
    drawArc0038.center = CGPointMake(2418.5, 2561);
    drawArc0038.startDegrees = 180;
    drawArc0038.endDegrees = 225;
    drawArc0038.radius = 60;
    drawArc0038.width = 41;
    drawArc0038.color = line0003.color;
    [haul0049.drawPrimitives addObject:drawArc0038];

    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(2358.5, 2561);
    drawLine0084.endPoint = CGPointMake(2358.5, 2676);
    drawLine0084.width = 41;
    drawLine0084.color = line0003.color;
    [haul0049.drawPrimitives addObject:drawLine0084];

    // Добавляем станцию I. P. Pavlova
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0009.elements addObject:station0052];
    
    station0052.nameOriginal = @"I. P. Pavlova";
    station0052.mapLocation = CGPointMake(2358.5, 2676);
    station0052.geoLocation = CGPointMake(50.075, 14.43);

    MWDrawFillCircle *fillCircle0093 = [[MWDrawFillCircle alloc] init];
    fillCircle0093.center = station0052.mapLocation;
    fillCircle0093.radius = 25;
    fillCircle0093.fillColor = [UIColor whiteColor];
    [station0052.drawPrimitives addObject:fillCircle0093];
    
    MWDrawFillCircle *fillCircle0094 = [[MWDrawFillCircle alloc] init];
    fillCircle0094.center = station0052.mapLocation;
    fillCircle0094.radius = 18.5;
    fillCircle0094.fillColor = line0003.color;
    [station0052.drawPrimitives addObject:fillCircle0094];

    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = station0052.nameOriginal;
    drawTextLine0069.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0069.fontColor = [UIColor blackColor];
    drawTextLine0069.fontSize = 36;
    drawTextLine0069.degrees = 0;
    drawTextLine0069.kernSpacing = -1.0;
    drawTextLine0069.origin = CGPointMake(2142, 2593);
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0069];

    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 1336;
    [edge0009.elements addObject:haul0050];

    MWDrawLine *drawLine0085 = [[MWDrawLine alloc] init];
    drawLine0085.startPoint = CGPointMake(2358.5, 2920.5);
    drawLine0085.endPoint = CGPointMake(2358.5, 2675.5);
    drawLine0085.width = 41;
    drawLine0085.color = line0003.color;
    [haul0050.drawPrimitives addObject:drawLine0085];

    // Добавляем станцию Vyšehrad
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0009.elements addObject:station0053];
    
    station0053.nameOriginal = @"Vyšehrad";
    station0053.mapLocation = CGPointMake(2358.5, 2920.5);
    station0053.geoLocation = CGPointMake(50.063, 14.431);

    MWDrawFillCircle *fillCircle0095 = [[MWDrawFillCircle alloc] init];
    fillCircle0095.center = station0053.mapLocation;
    fillCircle0095.radius = 25;
    fillCircle0095.fillColor = [UIColor whiteColor];
    [station0053.drawPrimitives addObject:fillCircle0095];
    
    MWDrawFillCircle *fillCircle0096 = [[MWDrawFillCircle alloc] init];
    fillCircle0096.center = station0053.mapLocation;
    fillCircle0096.radius = 18.5;
    fillCircle0096.fillColor = line0003.color;
    [station0053.drawPrimitives addObject:fillCircle0096];

    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = station0053.nameOriginal;
    drawTextLine0070.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0070.fontColor = [UIColor blackColor];
    drawTextLine0070.fontSize = 36;
    drawTextLine0070.degrees = 0;
    drawTextLine0070.kernSpacing = 0.6;
    drawTextLine0070.origin = CGPointMake(2168, 2896.5);
    [station0053.nameOriginalTextPrimitives addObject:drawTextLine0070];

    // Добавляем перегон
    MWHaul *haul0051 = [[MWHaul alloc] init];
    haul0051.identifier = @"haul0051";
    haul0051.length = 807;
    [edge0009.elements addObject:haul0051];
    
    MWDrawLine *drawLine0086 = [[MWDrawLine alloc] init];
    drawLine0086.startPoint = CGPointMake(2358.5, 2920);
    drawLine0086.endPoint = CGPointMake(2358.5, 2938);
    drawLine0086.width = 41;
    drawLine0086.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawLine0086];

    MWDrawArc *drawArc0039 = [[MWDrawArc alloc] init];
    drawArc0039.center = CGPointMake(2418.5, 2937.5);
    drawArc0039.startDegrees = 135;
    drawArc0039.endDegrees = 180;
    drawArc0039.radius = 60;
    drawArc0039.width = 41;
    drawArc0039.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawArc0039];

    MWDrawLine *drawLine0087 = [[MWDrawLine alloc] init];
    drawLine0087.startPoint = CGPointMake(2375.5, 2979.5);
    drawLine0087.endPoint = CGPointMake(2457, 3061);
    drawLine0087.width = 41;
    drawLine0087.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawLine0087];

    // Добавляем станцию Pražského povstání
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0009.elements addObject:station0054];
    
    station0054.nameOriginal = @"Pražského povstání";
    station0054.mapLocation = CGPointMake(2457, 3061);
    station0054.geoLocation = CGPointMake(50.056, 14.434);
    
    MWDrawFillCircle *fillCircle0097 = [[MWDrawFillCircle alloc] init];
    fillCircle0097.center = station0054.mapLocation;
    fillCircle0097.radius = 25;
    fillCircle0097.fillColor = [UIColor whiteColor];
    [station0054.drawPrimitives addObject:fillCircle0097];
    
    MWDrawFillCircle *fillCircle0098 = [[MWDrawFillCircle alloc] init];
    fillCircle0098.center = station0054.mapLocation;
    fillCircle0098.radius = 18.5;
    fillCircle0098.fillColor = line0003.color;
    [station0054.drawPrimitives addObject:fillCircle0098];

    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = @"Pražského";
    drawTextLine0071.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0071.fontColor = [UIColor blackColor];
    drawTextLine0071.fontSize = 36;
    drawTextLine0071.degrees = 0;
    drawTextLine0071.kernSpacing = 0.4;
    drawTextLine0071.origin = CGPointMake(2246, 3061);
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0071];

    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = @"povstání";
    drawTextLine0072.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0072.fontColor = [UIColor blackColor];
    drawTextLine0072.fontSize = 36;
    drawTextLine0072.degrees = 0;
    drawTextLine0072.kernSpacing = 0.6;
    drawTextLine0072.origin = CGPointMake(2274, 3100);
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0072];

    // Добавляем перегон
    MWHaul *haul0052 = [[MWHaul alloc] init];
    haul0052.identifier = @"haul0052";
    haul0052.length = 661;
    [edge0009.elements addObject:haul0052];

    MWDrawLine *drawLine0088 = [[MWDrawLine alloc] init];
    drawLine0088.startPoint = CGPointMake(2568.5, 3173);
    drawLine0088.endPoint = CGPointMake(2456.5, 3060.5);
    drawLine0088.width = 41;
    drawLine0088.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0088];

    // Добавляем станцию Pankrác
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0009.elements addObject:station0055];
    
    station0055.nameOriginal = @"Pankrác";
    station0055.mapLocation = CGPointMake(2568.5, 3173);
    station0055.geoLocation = CGPointMake(50.051, 14.439);

    MWDrawFillCircle *fillCircle0099 = [[MWDrawFillCircle alloc] init];
    fillCircle0099.center = station0055.mapLocation;
    fillCircle0099.radius = 25;
    fillCircle0099.fillColor = [UIColor whiteColor];
    [station0055.drawPrimitives addObject:fillCircle0099];
    
    MWDrawFillCircle *fillCircle0100 = [[MWDrawFillCircle alloc] init];
    fillCircle0100.center = station0055.mapLocation;
    fillCircle0100.radius = 18.5;
    fillCircle0100.fillColor = line0003.color;
    [station0055.drawPrimitives addObject:fillCircle0100];

    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = station0055.nameOriginal;
    drawTextLine0073.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0073.fontColor = [UIColor blackColor];
    drawTextLine0073.fontSize = 36;
    drawTextLine0073.degrees = 0;
    drawTextLine0073.kernSpacing = 0.6;
    drawTextLine0073.origin = CGPointMake(2394, 3174.5);
    [station0055.nameOriginalTextPrimitives addObject:drawTextLine0073];

    // Добавляем перегон
    MWHaul *haul0053 = [[MWHaul alloc] init];
    haul0053.identifier = @"haul0053";
    haul0053.length = 1056;
    [edge0009.elements addObject:haul0053];
    
    MWDrawLine *drawLine0089 = [[MWDrawLine alloc] init];
    drawLine0089.startPoint = CGPointMake(2568, 3172.5);
    drawLine0089.endPoint = CGPointMake(2680, 3284);
    drawLine0089.width = 41;
    drawLine0089.color = line0003.color;
    [haul0053.drawPrimitives addObject:drawLine0089];

    // Добавляем станцию Budějovická
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0009.elements addObject:station0056];
    
    station0056.nameOriginal = @"Budějovická";
    station0056.mapLocation = CGPointMake(2680, 3284);
    station0056.geoLocation = CGPointMake(50.044, 14.449);

    MWDrawFillCircle *fillCircle0101 = [[MWDrawFillCircle alloc] init];
    fillCircle0101.center = station0056.mapLocation;
    fillCircle0101.radius = 25;
    fillCircle0101.fillColor = [UIColor whiteColor];
    [station0056.drawPrimitives addObject:fillCircle0101];
    
    MWDrawFillCircle *fillCircle0102 = [[MWDrawFillCircle alloc] init];
    fillCircle0102.center = station0056.mapLocation;
    fillCircle0102.radius = 18.5;
    fillCircle0102.fillColor = line0003.color;
    [station0056.drawPrimitives addObject:fillCircle0102];

    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = station0056.nameOriginal;
    drawTextLine0074.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0074.fontColor = [UIColor blackColor];
    drawTextLine0074.fontSize = 36;
    drawTextLine0074.degrees = 0;
    drawTextLine0074.kernSpacing = 0.2;
    drawTextLine0074.origin = CGPointMake(2440, 3285);
    [station0056.nameOriginalTextPrimitives addObject:drawTextLine0074];

    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 816;
    [edge0009.elements addObject:haul0054];

    MWDrawLine *drawLine0090 = [[MWDrawLine alloc] init];
    drawLine0090.startPoint = CGPointMake(2721, 3325);
    drawLine0090.endPoint = CGPointMake(2680, 3284);
    drawLine0090.width = 41;
    drawLine0090.color = line0003.color;
    [haul0054.drawPrimitives addObject:drawLine0090];

    MWDrawArc *drawArc0040 = [[MWDrawArc alloc] init];
    drawArc0040.center = CGPointMake(2763, 3282);
    drawArc0040.startDegrees = 90;
    drawArc0040.endDegrees = 135;
    drawArc0040.radius = 60;
    drawArc0040.width = 41;
    drawArc0040.color = line0003.color;
    [haul0054.drawPrimitives addObject:drawArc0040];

    MWDrawLine *drawLine0091 = [[MWDrawLine alloc] init];
    drawLine0091.startPoint = CGPointMake(2762, 3342);
    drawLine0091.endPoint = CGPointMake(2834, 3342);
    drawLine0091.width = 41;
    drawLine0091.color = line0003.color;
    [haul0054.drawPrimitives addObject:drawLine0091];

    // Добавляем станцию Kačerov
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0009.elements addObject:station0057];
    
    station0057.nameOriginal = @"Kačerov";
    station0057.mapLocation = CGPointMake(2834, 3342);
    station0057.geoLocation = CGPointMake(50.042, 14.46);

    MWDrawFillCircle *fillCircle0103 = [[MWDrawFillCircle alloc] init];
    fillCircle0103.center = station0057.mapLocation;
    fillCircle0103.radius = 25;
    fillCircle0103.fillColor = [UIColor whiteColor];
    [station0057.drawPrimitives addObject:fillCircle0103];
    
    MWDrawFillCircle *fillCircle0104 = [[MWDrawFillCircle alloc] init];
    fillCircle0104.center = station0057.mapLocation;
    fillCircle0104.radius = 18.5;
    fillCircle0104.fillColor = line0003.color;
    [station0057.drawPrimitives addObject:fillCircle0104];

    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = station0057.nameOriginal;
    drawTextLine0075.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0075.fontColor = [UIColor blackColor];
    drawTextLine0075.fontSize = 36;
    drawTextLine0075.degrees = 0;
    drawTextLine0075.kernSpacing = 0.6;
    drawTextLine0075.origin = CGPointMake(2765, 3378);
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0075];

    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 1400;
    [edge0009.elements addObject:haul0055];

    MWDrawLine *drawLine0092 = [[MWDrawLine alloc] init];
    drawLine0092.startPoint = CGPointMake(2833.5, 3342);
    drawLine0092.endPoint = CGPointMake(3037.5, 3342);
    drawLine0092.width = 41;
    drawLine0092.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawLine0092];

    // Добавляем станцию Roztyly
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0009.elements addObject:station0058];
    
    station0058.nameOriginal = @"Roztyly";
    station0058.mapLocation = CGPointMake(3037.5, 3342);
    station0058.geoLocation = CGPointMake(50.037, 14.478);
    
    MWDrawFillCircle *fillCircle0105 = [[MWDrawFillCircle alloc] init];
    fillCircle0105.center = station0058.mapLocation;
    fillCircle0105.radius = 25;
    fillCircle0105.fillColor = [UIColor whiteColor];
    [station0058.drawPrimitives addObject:fillCircle0105];
    
    MWDrawFillCircle *fillCircle0106 = [[MWDrawFillCircle alloc] init];
    fillCircle0106.center = station0058.mapLocation;
    fillCircle0106.radius = 18.5;
    fillCircle0106.fillColor = line0003.color;
    [station0058.drawPrimitives addObject:fillCircle0106];
    
    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0058.nameOriginal;
    drawTextLine0076.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0076.fontColor = [UIColor blackColor];
    drawTextLine0076.fontSize = 36;
    drawTextLine0076.degrees = 0;
    drawTextLine0076.kernSpacing = 0.6;
    drawTextLine0076.origin = CGPointMake(2975, 3378);
    [station0058.nameOriginalTextPrimitives addObject:drawTextLine0076];

    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 1143;
    [edge0009.elements addObject:haul0056];
    
    MWDrawLine *drawLine0093 = [[MWDrawLine alloc] init];
    drawLine0093.startPoint = CGPointMake(3037, 3342);
    drawLine0093.endPoint = CGPointMake(3241, 3342);
    drawLine0093.width = 41;
    drawLine0093.color = line0003.color;
    [haul0056.drawPrimitives addObject:drawLine0093];

    // Добавляем станцию Chodov
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0009.elements addObject:station0059];
    
    station0059.nameOriginal = @"Chodov";
    station0059.mapLocation = CGPointMake(3241, 3341.5);
    station0059.geoLocation = CGPointMake(50.031, 14.491);
    
    MWDrawFillCircle *fillCircle0107 = [[MWDrawFillCircle alloc] init];
    fillCircle0107.center = station0059.mapLocation;
    fillCircle0107.radius = 25;
    fillCircle0107.fillColor = [UIColor whiteColor];
    [station0059.drawPrimitives addObject:fillCircle0107];

    MWDrawFillCircle *fillCircle0108 = [[MWDrawFillCircle alloc] init];
    fillCircle0108.center = station0059.mapLocation;
    fillCircle0108.radius = 18.5;
    fillCircle0108.fillColor = line0003.color;
    [station0059.drawPrimitives addObject:fillCircle0108];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = station0059.nameOriginal;
    drawTextLine0077.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0077.fontColor = [UIColor blackColor];
    drawTextLine0077.fontSize = 36;
    drawTextLine0077.degrees = 0;
    drawTextLine0077.kernSpacing = 0.6;
    drawTextLine0077.origin = CGPointMake(3177, 3378);
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0077];

    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 1259;
    [edge0009.elements addObject:haul0057];

    MWDrawLine *drawLine0094 = [[MWDrawLine alloc] init];
    drawLine0094.startPoint = CGPointMake(3240.5, 3342);
    drawLine0094.endPoint = CGPointMake(3444.5, 3342);
    drawLine0094.width = 41;
    drawLine0094.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawLine0094];

    // Добавляем станцию Opatov
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0009.elements addObject:station0060];
    
    station0060.nameOriginal = @"Opatov";
    station0060.mapLocation = CGPointMake(3444.5, 3341.5);
    station0060.geoLocation = CGPointMake(50.028, 14.508);

    MWDrawFillCircle *fillCircle0109 = [[MWDrawFillCircle alloc] init];
    fillCircle0109.center = station0060.mapLocation;
    fillCircle0109.radius = 25;
    fillCircle0109.fillColor = [UIColor whiteColor];
    [station0060.drawPrimitives addObject:fillCircle0109];
    
    MWDrawFillCircle *fillCircle0110 = [[MWDrawFillCircle alloc] init];
    fillCircle0110.center = station0060.mapLocation;
    fillCircle0110.radius = 18.5;
    fillCircle0110.fillColor = line0003.color;
    [station0060.drawPrimitives addObject:fillCircle0110];

    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = station0060.nameOriginal;
    drawTextLine0078.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0078.fontColor = [UIColor blackColor];
    drawTextLine0078.fontSize = 36;
    drawTextLine0078.degrees = 0;
    drawTextLine0078.kernSpacing = 0.6;
    drawTextLine0078.origin = CGPointMake(3384, 3378);
    [station0060.nameOriginalTextPrimitives addObject:drawTextLine0078];

    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 1397;
    [edge0009.elements addObject:haul0058];

    MWDrawLine *drawLine0095 = [[MWDrawLine alloc] init];
    drawLine0095.startPoint = CGPointMake(3444, 3342);
    drawLine0095.endPoint = CGPointMake(3616.5, 3342);
    drawLine0095.width = 41;
    drawLine0095.color = line0003.color;
    [haul0058.drawPrimitives addObject:drawLine0095];

    // Добавляем станцию Háje
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0009.elements addObject:station0061];
    
    station0061.nameOriginal = @"Háje";
    station0061.mapLocation = CGPointMake(3616.5, 3341.5);
    station0061.geoLocation = CGPointMake(50.031, 14.527);

    MWDrawRoundedRect *roundedRect0006 = [[MWDrawRoundedRect alloc] init];
    roundedRect0006.rect = CGRectMake(3583, 3308, 66, 66);
    roundedRect0006.cornerRadius = 6;
    roundedRect0006.color = line0003.color;
    [station0061.drawPrimitives addObject:roundedRect0006];

    MWDrawLine *drawLine0096 = [[MWDrawLine alloc] init];
    drawLine0096.startPoint = CGPointMake(3616.5, 3317);
    drawLine0096.endPoint = CGPointMake(3616.5, 3366);
    drawLine0096.width = 49;
    drawLine0096.color = [UIColor whiteColor];
    [station0061.drawPrimitives addObject:drawLine0096];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = @"C";
    drawTextLine0079.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0079.fontColor = line0003.color;
    drawTextLine0079.fontSize = 70;
    drawTextLine0079.degrees = 0;
    drawTextLine0079.origin = CGPointMake(3661, 3294);
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0079];

    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = station0061.nameOriginal.uppercaseString;
    drawTextLine0080.fontName = @"KohinoorDevanagari-Medium";
    drawTextLine0080.fontColor = [UIColor blackColor];
    drawTextLine0080.fontSize = 38;
    drawTextLine0080.degrees = 0;
    drawTextLine0080.kernSpacing = 1.0;
    drawTextLine0080.origin = CGPointMake(3572, 3384);
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0080];

    // Добавляем вершину
    edge0009.finishVertex = vertex0006;

    return self;
}

@end
