//
//  MWBudapestMetro.m
//  MetroWay
//
//  Created by Valentin Ozerov on 20.05.16.
//  Copyright © 2016 Valentin Ozerov. All rights reserved.
//

#import "MWBudapestMetro.h"
#import "MWHaul.h"
#import "MWDrawTextLine.h"
#import "MWDrawFillCircle.h"
#import "MWDrawLine.h"

@implementation MWBudapestMetro

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"budapest_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Yellow Line 1";
    line0001.color = [UIColor colorWithRed:(254/255.0) green:(217/255.0) blue:(50/255.0) alpha:1];
    [self.lines addObject:line0001];

    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"Red Line 2";
    line0002.color = [UIColor colorWithRed:(199/255.0) green:(28/255.0) blue:(37/255.0) alpha:1];
    [self.lines addObject:line0002];

    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"Blue Line 3";
    line0003.color = [UIColor colorWithRed:(10/255.0) green:(85/255.0) blue:(147/255.0) alpha:1];
    [self.lines addObject:line0003];

    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"Green Line 4";
    line0004.color = [UIColor colorWithRed:(70/255.0) green:(165/255.0) blue:(59/255.0) alpha:1];
    [self.lines addObject:line0004];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0004];

    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Vörösmarty tér
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Vörösmarty tér";
    [self.vertices addObject:vertex0001];

    // Mexikói út
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Mexikói út";
    [self.vertices addObject:vertex0002];

    // Déli pályaudvar
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Déli pályaudvar";
    [self.vertices addObject:vertex0003];

    // Örs vezér tere
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Örs vezér tere";
    [self.vertices addObject:vertex0004];

    // Újpest-Központ
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Újpest-Központ";
    [self.vertices addObject:vertex0005];

    // Kőbánya-Kispest
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Kőbánya-Kispest";
    [self.vertices addObject:vertex0006];

    // Kelenföld vasútállomás
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Kelenföld vasútállomás";
    [self.vertices addObject:vertex0007];

    // Keleti pályaudvar
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Keleti pályaudvar";
    [self.vertices addObject:vertex0008];

    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = CGPointMake(1766.5, 1547);
    fillCircle0061.radius = 26;
    fillCircle0061.fillColor = [UIColor blackColor];
    [vertex0008.drawPrimitives addObject:fillCircle0061];

    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = CGPointMake(1790.5, 1571);
    fillCircle0062.radius = 26;
    fillCircle0062.fillColor = [UIColor blackColor];
    [vertex0008.drawPrimitives addObject:fillCircle0062];
    
    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(1766.5, 1547);
    drawLine0056.endPoint = CGPointMake(1790.5, 1571);
    drawLine0056.width = 52;
    drawLine0056.color = [UIColor blackColor];
    [vertex0008.drawPrimitives addObject:drawLine0056];

    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = CGPointMake(1766.5, 1547);
    fillCircle0063.radius = 21;
    fillCircle0063.fillColor = [UIColor whiteColor];
    [vertex0008.drawPrimitives addObject:fillCircle0063];
    
    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = CGPointMake(1790.5, 1571);
    fillCircle0064.radius = 21;
    fillCircle0064.fillColor = [UIColor whiteColor];
    [vertex0008.drawPrimitives addObject:fillCircle0064];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(1766.5, 1547);
    drawLine0057.endPoint = CGPointMake(1790.5, 1571);
    drawLine0057.width = 42;
    drawLine0057.color = [UIColor whiteColor];
    [vertex0008.drawPrimitives addObject:drawLine0057];

    // Deák Ferenc tér
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Deák Ferenc tér";
    [self.vertices addObject:vertex0009];

    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = CGPointMake(967.5, 1463.5);
    fillCircle0065.radius = 26;
    fillCircle0065.fillColor = [UIColor blackColor];
    [vertex0009.drawPrimitives addObject:fillCircle0065];

    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = CGPointMake(967.5, 1463.5);
    fillCircle0066.radius = 21;
    fillCircle0066.fillColor = [UIColor whiteColor];
    [vertex0009.drawPrimitives addObject:fillCircle0066];

    // Kálvin tér
    MWVertex *vertex0010 = [[MWVertex alloc] init];
    vertex0010.identifier = @"vertex0010";
    vertex0010.developmentName = @"Вершина: Kálvin tér";
    [self.vertices addObject:vertex0010];
    
    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = CGPointMake(1051.5, 1765.5);
    fillCircle0067.radius = 26;
    fillCircle0067.fillColor = [UIColor blackColor];
    [vertex0010.drawPrimitives addObject:fillCircle0067];
    
    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = CGPointMake(1051.5, 1765.5);
    fillCircle0068.radius = 21;
    fillCircle0068.fillColor = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:fillCircle0068];

    ////////////////////////////////////////////////////////////////
    // Yellow Line 1
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Vörösmarty tér - Deák Ferenc tér
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Vörösmarty tér - Deák Ferenc tér";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Vörösmarty tér
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Vörösmarty tér";
    station0001.mapLocation = CGPointMake(909, 1520);
    station0001.geoLocation = CGPointMake(47.49673, 19.05037);

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(841, 1527);
    fillCircle0001.radius = 37.5;
    fillCircle0001.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = @"1";
    drawTextLine0001.fontName = @"HelveticaNeue-Bold";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 60;
    drawTextLine0001.origin = CGPointMake(823, 1489);
    [station0001.drawPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = @"Vörösmarty";
    drawTextLine0002.fontName = @"HelveticaNeue-Bold";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 40;
    drawTextLine0002.kernSpacing = 0.0;
    drawTextLine0002.origin = CGPointMake(689, 1561);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0002];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = @"tér";
    drawTextLine0003.fontName = @"HelveticaNeue-Bold";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 40;
    drawTextLine0003.kernSpacing = 0.0;
    drawTextLine0003.origin = CGPointMake(854, 1617);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0003];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0001.mapLocation;
    fillCircle0002.radius = 20;
    fillCircle0002.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 360;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(909, 1520);
    drawLine0001.endPoint = CGPointMake(967.5, 1463.5);
    drawLine0001.width = 17;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];

    // Добавляем станцию Deák Ferenc tér
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Deák Ferenc tér";
    station0002.mapLocation = CGPointMake(967.5, 1463.5);
    station0002.geoLocation = CGPointMake(47.4975, 19.055);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0002.mapLocation;
    fillCircle0003.radius = 4;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0003];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = @"Deák tér";
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 40;
    drawTextLine0004.kernSpacing = 0.2;
    drawTextLine0004.origin = CGPointMake(1001, 1399);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0004];

    // Добавляем вершину
    edge0001.finishVertex = vertex0009;

    // Создаем участок линии Deák Ferenc tér - Mexikói út
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Deák Ferenc tér - Mexikói út";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0009;

    // Добавляем станцию Deák Ferenc tér
    [edge0002.elements addObject:station0002];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 253;
    [edge0002.elements addObject:haul0002];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(967, 1464);
    drawLine0002.endPoint = CGPointMake(1151, 1287);
    drawLine0002.width = 17;
    drawLine0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию Bajcsy–Zsilinszky út
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0002.elements addObject:station0003];
    
    station0003.nameOriginal = @"Bajcsy–Zsilinszky út";
    station0003.mapLocation = CGPointMake(1151, 1287);
    station0003.geoLocation = CGPointMake(47.4994, 19.055);

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0003.mapLocation;
    fillCircle0004.radius = 19;
    fillCircle0004.fillColor = line0001.color;
    [station0003.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0003.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 40;
    drawTextLine0005.kernSpacing = -1.5;
    drawTextLine0005.origin = CGPointMake(1193, 1292);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 389;
    [edge0002.elements addObject:haul0003];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(1150.5, 1287.5);
    drawLine0003.endPoint = CGPointMake(1232, 1206);
    drawLine0003.width = 17;
    drawLine0003.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию Opera
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0002.elements addObject:station0004];
    
    station0004.nameOriginal = @"Opera";
    station0004.mapLocation = CGPointMake(1232, 1206);
    station0004.geoLocation = CGPointMake(47.5022, 19.0586);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0004.mapLocation;
    fillCircle0005.radius = 19;
    fillCircle0005.fillColor = line0001.color;
    [station0004.drawPrimitives addObject:fillCircle0005];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0004.nameOriginal;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 40;
    drawTextLine0006.kernSpacing = 0.4;
    drawTextLine0006.origin = CGPointMake(1278, 1209);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 443;
    [edge0002.elements addObject:haul0004];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(1231.5, 1206.5);
    drawLine0004.endPoint = CGPointMake(1309, 1129);
    drawLine0004.width = 17;
    drawLine0004.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Oktogon
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0002.elements addObject:station0005];
    
    station0005.nameOriginal = @"Oktogon";
    station0005.mapLocation = CGPointMake(1309, 1129);
    station0005.geoLocation = CGPointMake(47.505, 19.0633);

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0005.mapLocation;
    fillCircle0006.radius = 19;
    fillCircle0006.fillColor = line0001.color;
    [station0005.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0005.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 40;
    drawTextLine0007.kernSpacing = 0.4;
    drawTextLine0007.origin = CGPointMake(1351, 1135);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0007];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 337;
    [edge0002.elements addObject:haul0005];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(1308.5, 1129.5);
    drawLine0005.endPoint = CGPointMake(1385.5, 1052.5);
    drawLine0005.width = 17;
    drawLine0005.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0005];

    // Добавляем станцию Vörösmarty utca
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0002.elements addObject:station0006];
    
    station0006.nameOriginal = @"Vörösmarty utca";
    station0006.mapLocation = CGPointMake(1385.5, 1052.5);
    station0006.geoLocation = CGPointMake(47.5069, 19.0658);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0006.mapLocation;
    fillCircle0007.radius = 19;
    fillCircle0007.fillColor = line0001.color;
    [station0006.drawPrimitives addObject:fillCircle0007];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0006.nameOriginal;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 40;
    drawTextLine0008.kernSpacing = -0.4;
    drawTextLine0008.origin = CGPointMake(1428, 1058);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 318;
    [edge0002.elements addObject:haul0006];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(1385, 1053);
    drawLine0006.endPoint = CGPointMake(1459, 979);
    drawLine0006.width = 17;
    drawLine0006.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Kodály körönd
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0002.elements addObject:station0007];
    
    station0007.nameOriginal = @"Kodály körönd";
    station0007.mapLocation = CGPointMake(1459, 979);
    station0007.geoLocation = CGPointMake(47.5094, 19.07);

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0007.mapLocation;
    fillCircle0008.radius = 19;
    fillCircle0008.fillColor = line0001.color;
    [station0007.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0007.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 40;
    drawTextLine0009.kernSpacing = -0.5;
    drawTextLine0009.origin = CGPointMake(1496, 989);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0009];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 333;
    [edge0002.elements addObject:haul0007];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(1458.5, 979.5);
    drawLine0007.endPoint = CGPointMake(1525.5, 912.5);
    drawLine0007.width = 17;
    drawLine0007.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Bajza utca
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0002.elements addObject:station0008];
    
    station0008.nameOriginal = @"Bajza utca";
    station0008.mapLocation = CGPointMake(1525.5, 912.5);
    station0008.geoLocation = CGPointMake(47.5111, 19.0722);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0008.mapLocation;
    fillCircle0009.radius = 19;
    fillCircle0009.fillColor = line0001.color;
    [station0008.drawPrimitives addObject:fillCircle0009];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0008.nameOriginal;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 40;
    drawTextLine0010.kernSpacing = -1.5;
    drawTextLine0010.origin = CGPointMake(1561, 924);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 466;
    [edge0002.elements addObject:haul0008];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(1525, 913);
    drawLine0008.endPoint = CGPointMake(1597, 840.5);
    drawLine0008.width = 17;
    drawLine0008.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Hősök tere
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0002.elements addObject:station0009];
    
    station0009.nameOriginal = @"Hősök tere";
    station0009.mapLocation = CGPointMake(1597, 840.5);
    station0009.geoLocation = CGPointMake(47.51438, 19.0769);

    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0009.mapLocation;
    fillCircle0010.radius = 19;
    fillCircle0010.fillColor = line0001.color;
    [station0009.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0009.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 40;
    drawTextLine0011.kernSpacing = 0.4;
    drawTextLine0011.origin = CGPointMake(1632, 853);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0011];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 514;
    [edge0002.elements addObject:haul0009];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(1596.5, 841);
    drawLine0009.endPoint = CGPointMake(1666.5, 771.5);
    drawLine0009.width = 17;
    drawLine0009.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Széchenyi fürdő
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0002.elements addObject:station0010];

    station0010.nameOriginal = @"Széchenyi fürdő";
    station0010.mapLocation = CGPointMake(1666.5, 771.5);
    station0010.geoLocation = CGPointMake(47.5172, 19.0808);

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0010.mapLocation;
    fillCircle0011.radius = 19;
    fillCircle0011.fillColor = line0001.color;
    [station0010.drawPrimitives addObject:fillCircle0011];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0010.nameOriginal;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 40;
    drawTextLine0012.kernSpacing = -0.4;
    drawTextLine0012.origin = CGPointMake(1701, 784);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0012];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 828;
    [edge0002.elements addObject:haul0010];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(1666, 772);
    drawLine0010.endPoint = CGPointMake(1740.5, 698);
    drawLine0010.width = 17;
    drawLine0010.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Mexikói út
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0002.elements addObject:station0011];

    station0011.nameOriginal = @"Mexikói út";
    station0011.mapLocation = CGPointMake(1740.5, 698);
    station0011.geoLocation = CGPointMake(47.5194, 19.0911);

    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0011.mapLocation;
    fillCircle0012.radius = 19;
    fillCircle0012.fillColor = line0001.color;
    [station0011.drawPrimitives addObject:fillCircle0012];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0011.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue-Bold";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 40;
    drawTextLine0013.kernSpacing = 0.0;
    drawTextLine0013.origin = CGPointMake(1783, 712);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0013];

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = CGPointMake(1812.5, 656);
    fillCircle0013.radius = 37.5;
    fillCircle0013.fillColor = line0001.color;
    [station0011.drawPrimitives addObject:fillCircle0013];
    
    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = @"1";
    drawTextLine0014.fontName = @"HelveticaNeue-Bold";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 60;
    drawTextLine0014.origin = CGPointMake(1794.5, 618);
    [station0011.drawPrimitives addObject:drawTextLine0014];

    // Добавляем вершину
    edge0002.finishVertex = vertex0002;

    ////////////////////////////////////////////////////////////////
    // Red Line 2
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Déli pályaudvar - Deák Ferenc tér
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Déli pályaudvar - Deák Ferenc tér";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0002;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;

    // Добавляем станцию Déli pályaudvar
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0003.elements addObject:station0012];
    
    station0012.nameOriginal = @"Déli pályaudvar";
    station0012.mapLocation = CGPointMake(282, 1534.5);
    station0012.geoLocation = CGPointMake(47.500278, 19.024722);

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = CGPointMake(135, 1608);
    fillCircle0014.radius = 37.5;
    fillCircle0014.fillColor = line0002.color;
    [station0012.drawPrimitives addObject:fillCircle0014];
    
    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = @"2";
    drawTextLine0015.fontName = @"HelveticaNeue-Bold";
    drawTextLine0015.fontColor = [UIColor whiteColor];
    drawTextLine0015.fontSize = 60;
    drawTextLine0015.origin = CGPointMake(118.5, 1570);
    [station0012.drawPrimitives addObject:drawTextLine0015];

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0012.mapLocation;
    fillCircle0015.radius = 19;
    fillCircle0015.fillColor = line0002.color;
    [station0012.drawPrimitives addObject:fillCircle0015];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0012.nameOriginal;
    drawTextLine0016.fontName = @"HelveticaNeue-Bold";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 40;
    drawTextLine0016.kernSpacing = -0.8;
    drawTextLine0016.origin = CGPointMake(204, 1583);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0016];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 727;
    [edge0003.elements addObject:haul0011];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(282, 1534.5);
    drawLine0011.endPoint = CGPointMake(282, 1417);
    drawLine0011.width = 17;
    drawLine0011.color = line0002.color;
    [haul0011.drawPrimitives addObject:drawLine0011];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(279, 1423);
    drawLine0012.endPoint = CGPointMake(379, 1323);
    drawLine0012.width = 17;
    drawLine0012.color = line0002.color;
    [haul0011.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию Széll Kálmán tér
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0003.elements addObject:station0013];

    station0013.nameOriginal = @"Széll Kálmán tér";
    station0013.mapLocation = CGPointMake(379, 1323);
    station0013.geoLocation = CGPointMake(47.506944, 19.024722);

    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0013.mapLocation;
    fillCircle0016.radius = 19;
    fillCircle0016.fillColor = line0002.color;
    [station0013.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0013.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 40;
    drawTextLine0017.kernSpacing = -0.0;
    drawTextLine0017.origin = CGPointMake(132, 1240);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0017];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1123;
    [edge0003.elements addObject:haul0012];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(378.5, 1323);
    drawLine0013.endPoint = CGPointMake(597, 1323);
    drawLine0013.width = 17;
    drawLine0013.color = line0002.color;
    [haul0012.drawPrimitives addObject:drawLine0013];

    // Добавляем станцию Batthyány tér
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0003.elements addObject:station0014];
    
    station0014.nameOriginal = @"Batthyány tér";
    station0014.mapLocation = CGPointMake(597, 1323);
    station0014.geoLocation = CGPointMake(47.506389, 19.038889);

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0014.mapLocation;
    fillCircle0017.radius = 19;
    fillCircle0017.fillColor = line0002.color;
    [station0014.drawPrimitives addObject:fillCircle0017];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = @"Batthyány";
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 40;
    drawTextLine0018.kernSpacing = -0.8;
    drawTextLine0018.origin = CGPointMake(466, 1172);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0018];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = @"tér";
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 40;
    drawTextLine0019.kernSpacing = 0.8;
    drawTextLine0019.origin = CGPointMake(587, 1228);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0019];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 591;
    [edge0003.elements addObject:haul0013];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(596.5, 1323);
    drawLine0014.endPoint = CGPointMake(825, 1323);
    drawLine0014.width = 17;
    drawLine0014.color = line0002.color;
    [haul0013.drawPrimitives addObject:drawLine0014];

    // Добавляем станцию Kossuth Lajos tér
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0003.elements addObject:station0015];
    
    station0015.nameOriginal = @"Kossuth Lajos tér";
    station0015.mapLocation = CGPointMake(825, 1323);
    station0015.geoLocation = CGPointMake(47.505556, 19.046389);

    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0015.mapLocation;
    fillCircle0018.radius = 19;
    fillCircle0018.fillColor = line0002.color;
    [station0015.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = @"Kossuth";
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 40;
    drawTextLine0020.kernSpacing = -1.2;
    drawTextLine0020.origin = CGPointMake(699, 1363);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0020];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = @"tér";
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 40;
    drawTextLine0021.kernSpacing = 0.8;
    drawTextLine0021.origin = CGPointMake(785, 1417);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0021];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1121;
    [edge0003.elements addObject:haul0014];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(824.5, 1322.5);
    drawLine0015.endPoint = CGPointMake(967.5, 1463.5);
    drawLine0015.width = 17;
    drawLine0015.color = line0002.color;
    [haul0014.drawPrimitives addObject:drawLine0015];

    // Добавляем станцию Deák Ferenc tér
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0003.elements addObject:station0016];
    
    station0016.nameOriginal = @"Deák Ferenc tér";
    station0016.mapLocation = CGPointMake(967.5, 1463.5);
    station0016.geoLocation = CGPointMake(47.4975, 19.055);

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0016.mapLocation;
    fillCircle0019.radius = 4;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0019];

    station0016.showNameOnMap = false;
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0004];
    
    // Добавляем вершину
    edge0003.finishVertex = vertex0009;

    // Создаем участок линии Deák Ferenc tér - Keleti pályaudvar
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Deák Ferenc tér - Keleti pályaudvar";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0002;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0009;

    // Добавляем станцию Deák Ferenc tér
    [edge0004.elements addObject:station0016];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 609;
    [edge0004.elements addObject:haul0015];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(967, 1463);
    drawLine0016.endPoint = CGPointMake(1054, 1550);
    drawLine0016.width = 17;
    drawLine0016.color = line0002.color;
    [haul0015.drawPrimitives addObject:drawLine0016];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(1048, 1547.5);
    drawLine0017.endPoint = CGPointMake(1248, 1547.5);
    drawLine0017.width = 17;
    drawLine0017.color = line0002.color;
    [haul0015.drawPrimitives addObject:drawLine0017];

    // Добавляем станцию Astoria
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0004.elements addObject:station0017];

    station0017.nameOriginal = @"Astoria";
    station0017.mapLocation = CGPointMake(1248, 1547.5);
    station0017.geoLocation = CGPointMake(47.4944, 19.06);

    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0017.mapLocation;
    fillCircle0020.radius = 19;
    fillCircle0020.fillColor = line0002.color;
    [station0017.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0017.nameOriginal;
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 40;
    drawTextLine0022.kernSpacing = -0.8;
    drawTextLine0022.origin = CGPointMake(1188, 1464);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 838;
    [edge0004.elements addObject:haul0016];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(1247.5, 1547.5);
    drawLine0018.endPoint = CGPointMake(1504.5, 1547.5);
    drawLine0018.width = 17;
    drawLine0018.color = line0002.color;
    [haul0016.drawPrimitives addObject:drawLine0018];

    // Добавляем станцию Blaha Lujza tér
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0004.elements addObject:station0018];

    station0018.nameOriginal = @"Blaha Lujza tér";
    station0018.mapLocation = CGPointMake(1504.5, 1547.5);
    station0018.geoLocation = CGPointMake(47.496667, 19.07);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0018.mapLocation;
    fillCircle0021.radius = 19;
    fillCircle0021.fillColor = line0002.color;
    [station0018.drawPrimitives addObject:fillCircle0021];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = @"Blaha L. tér";
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 40;
    drawTextLine0023.kernSpacing = -0.6;
    drawTextLine0023.origin = CGPointMake(1397, 1464);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0023];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 988;
    [edge0004.elements addObject:haul0017];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(1504, 1547.5);
    drawLine0019.endPoint = CGPointMake(1770, 1547.5);
    drawLine0019.width = 17;
    drawLine0019.color = line0002.color;
    [haul0017.drawPrimitives addObject:drawLine0019];

    // Добавляем станцию Keleti pályaudvar
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0004.elements addObject:station0019];

    station0019.nameOriginal = @"Keleti pályaudvar";
    station0019.mapLocation = CGPointMake(1766.5, 1547);
    station0019.geoLocation = CGPointMake(47.5003, 19.0817);

    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0019.mapLocation;
    fillCircle0022.radius = 4;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"Keleti";
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 40;
    drawTextLine0024.kernSpacing = -0.8;
    drawTextLine0024.origin = CGPointMake(1834, 1568);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"pályaudvar";
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 40;
    drawTextLine0025.kernSpacing = -1.4;
    drawTextLine0025.origin = CGPointMake(1770, 1624);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0025];

    edge0004.finishVertex = vertex0008;

    // Создаем участок линии Keleti pályaudvar - Örs vezér tere
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Keleti pályaudvar - Örs vezér tere";
    [self.edges addObject:edge0010];
    
    // Добавляем линию
    edge0010.line = line0002;
    
    // Добавляем вершину
    edge0010.startVertex = vertex0008;
    
    // Добавляем станцию Keleti pályaudvar
    [edge0010.elements addObject:station0019];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1848;
    [edge0010.elements addObject:haul0018];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(1764.5, 1550);
    drawLine0020.endPoint = CGPointMake(1886, 1425.5);
    drawLine0020.width = 17;
    drawLine0020.color = line0002.color;
    [haul0018.drawPrimitives addObject:drawLine0020];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(1880, 1427.5);
    drawLine0021.endPoint = CGPointMake(2059, 1427.5);
    drawLine0021.width = 17;
    drawLine0021.color = line0002.color;
    [haul0018.drawPrimitives addObject:drawLine0021];

    // Добавляем станцию Puskás Ferenc Stadion
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0010.elements addObject:station0020];
    
    station0020.nameOriginal = @"Puskás Ferenc Stadion";
    station0020.mapLocation = CGPointMake(2059, 1427.5);
    station0020.geoLocation = CGPointMake(47.5, 19.1058);

    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0020.mapLocation;
    fillCircle0023.radius = 19;
    fillCircle0023.fillColor = line0002.color;
    [station0020.drawPrimitives addObject:fillCircle0023];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = @"Stadionok";
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 40;
    drawTextLine0026.kernSpacing = -1.0;
    drawTextLine0026.origin = CGPointMake(1976, 1480);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 978;
    [edge0010.elements addObject:haul0019];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(2058.5, 1427.5);
    drawLine0022.endPoint = CGPointMake(2262, 1427.5);
    drawLine0022.width = 17;
    drawLine0022.color = line0002.color;
    [haul0019.drawPrimitives addObject:drawLine0022];

    // Добавляем станцию Pillangó utca
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0010.elements addObject:station0021];
    
    station0021.nameOriginal = @"Pillangó utca";
    station0021.mapLocation = CGPointMake(2262, 1427.5);
    station0021.geoLocation = CGPointMake(47.5011, 19.12);

    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0021.mapLocation;
    fillCircle0024.radius = 19;
    fillCircle0024.fillColor = line0002.color;
    [station0021.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = @"Pillangó";
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 40;
    drawTextLine0027.kernSpacing = -1.6;
    drawTextLine0027.origin = CGPointMake(2204, 1270);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0027];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"utca";
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 40;
    drawTextLine0028.kernSpacing = -1.6;
    drawTextLine0028.origin = CGPointMake(2234, 1324);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0028];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 1200;
    [edge0010.elements addObject:haul0020];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(2261.5, 1427.5);
    drawLine0023.endPoint = CGPointMake(2438, 1427.5);
    drawLine0023.width = 17;
    drawLine0023.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0023];

    // Добавляем станцию Örs vezér tere
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0010.elements addObject:station0022];
    
    station0022.nameOriginal = @"Örs vezér tere";
    station0022.mapLocation = CGPointMake(2438, 1427.5);
    station0022.geoLocation = CGPointMake(47.5028, 19.1356);

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0022.mapLocation;
    fillCircle0025.radius = 19;
    fillCircle0025.fillColor = line0002.color;
    [station0022.drawPrimitives addObject:fillCircle0025];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0022.nameOriginal;
    drawTextLine0029.fontName = @"HelveticaNeue-Bold";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 40;
    drawTextLine0029.kernSpacing = 0.4;
    drawTextLine0029.origin = CGPointMake(2573, 1406);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0029];

    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = CGPointMake(2516.5, 1425.5);
    fillCircle0026.radius = 37.5;
    fillCircle0026.fillColor = line0002.color;
    [station0022.drawPrimitives addObject:fillCircle0026];
    
    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"2";
    drawTextLine0030.fontName = @"HelveticaNeue-Bold";
    drawTextLine0030.fontColor = [UIColor whiteColor];
    drawTextLine0030.fontSize = 60;
    drawTextLine0030.origin = CGPointMake(2500, 1387.5);
    [station0022.drawPrimitives addObject:drawTextLine0030];

    // Добавляем вершину
    edge0010.finishVertex = vertex0004;

    ////////////////////////////////////////////////////////////////
    // Blue Line 3
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Kőbánya-Kispest - Kálvin tér
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Kőbánya-Kispest - Kálvin tér";
    [self.edges addObject:edge0005];
    
    // Добавляем линию
    edge0005.line = line0003;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0006;

    // Добавляем станцию Kőbánya-Kispest
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0005.elements addObject:station0023];
    
    station0023.nameOriginal = @"Kőbánya-Kispest";
    station0023.mapLocation = CGPointMake(2383, 2081);
    station0023.geoLocation = CGPointMake(47.463333, 19.149167);

    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = CGPointMake(2459.5, 2075);
    fillCircle0027.radius = 37.5;
    fillCircle0027.fillColor = line0003.color;
    [station0023.drawPrimitives addObject:fillCircle0027];
    
    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"3";
    drawTextLine0031.fontName = @"HelveticaNeue-Bold";
    drawTextLine0031.fontColor = [UIColor whiteColor];
    drawTextLine0031.fontSize = 60;
    drawTextLine0031.origin = CGPointMake(2443, 2037);
    [station0023.drawPrimitives addObject:drawTextLine0031];

    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0023.mapLocation;
    fillCircle0028.radius = 19;
    fillCircle0028.fillColor = line0003.color;
    [station0023.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0023.nameOriginal;
    drawTextLine0032.fontName = @"HelveticaNeue-Bold";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 40;
    drawTextLine0032.kernSpacing = -1.8;
    drawTextLine0032.origin = CGPointMake(2517, 2055);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0032];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 1745;
    [edge0005.elements addObject:haul0021];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(2383, 2081);
    drawLine0024.endPoint = CGPointMake(2166.5, 2081);
    drawLine0024.width = 17;
    drawLine0024.color = line0003.color;
    [haul0021.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Határ út
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0005.elements addObject:station0024];

    station0024.nameOriginal = @"Határ út";
    station0024.mapLocation = CGPointMake(2166.5, 2081);
    station0024.geoLocation = CGPointMake(47.4647, 19.1264);

    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0024.mapLocation;
    fillCircle0029.radius = 19;
    fillCircle0029.fillColor = line0003.color;
    [station0024.drawPrimitives addObject:fillCircle0029];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = @"Határ";
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 40;
    drawTextLine0033.kernSpacing = -0.6;
    drawTextLine0033.origin = CGPointMake(2116, 2132);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0033];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = @"út";
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 40;
    drawTextLine0034.kernSpacing = -0.4;
    drawTextLine0034.origin = CGPointMake(2148, 2187);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0034];

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 814;
    [edge0005.elements addObject:haul0022];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(2167, 2081);
    drawLine0025.endPoint = CGPointMake(1949, 2081);
    drawLine0025.width = 17;
    drawLine0025.color = line0003.color;
    [haul0022.drawPrimitives addObject:drawLine0025];

    // Добавляем станцию Pöttyös utca
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0005.elements addObject:station0025];

    station0025.nameOriginal = @"Pöttyös utca";
    station0025.mapLocation = CGPointMake(1949, 2081);
    station0025.geoLocation = CGPointMake(47.4686, 19.1169);

    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0025.mapLocation;
    fillCircle0030.radius = 19;
    fillCircle0030.fillColor = line0003.color;
    [station0025.drawPrimitives addObject:fillCircle0030];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = @"Pöttyös";
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 40;
    drawTextLine0035.kernSpacing = -1.0;
    drawTextLine0035.origin = CGPointMake(1880, 2132);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0035];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = @"utca";
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 40;
    drawTextLine0036.kernSpacing = -1.4;
    drawTextLine0036.origin = CGPointMake(1910, 2187);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0036];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 499;
    [edge0005.elements addObject:haul0023];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(1949.5, 2081);
    drawLine0026.endPoint = CGPointMake(1732, 2081);
    drawLine0026.width = 17;
    drawLine0026.color = line0003.color;
    [haul0023.drawPrimitives addObject:drawLine0026];

    // Добавляем станцию Ecseri út
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0005.elements addObject:station0026];

    station0026.nameOriginal = @"Ecseri út";
    station0026.mapLocation = CGPointMake(1732, 2081);
    station0026.geoLocation = CGPointMake(47.4714, 19.11);

    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0026.mapLocation;
    fillCircle0031.radius = 19;
    fillCircle0031.fillColor = line0003.color;
    [station0026.drawPrimitives addObject:fillCircle0031];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"Ecseri";
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 40;
    drawTextLine0037.kernSpacing = -1.2;
    drawTextLine0037.origin = CGPointMake(1673, 2132);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0037];
    
    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"út";
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 40;
    drawTextLine0038.kernSpacing = -1.4;
    drawTextLine0038.origin = CGPointMake(1708, 2187);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0038];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 1073;
    [edge0005.elements addObject:haul0024];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(1732.5, 2081);
    drawLine0027.endPoint = CGPointMake(1506, 2081);
    drawLine0027.width = 17;
    drawLine0027.color = line0003.color;
    [haul0024.drawPrimitives addObject:drawLine0027];
    
    // Добавляем станцию Népliget
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0005.elements addObject:station0027];

    station0027.nameOriginal = @"Népliget";
    station0027.mapLocation = CGPointMake(1506, 2081);
    station0027.geoLocation = CGPointMake(47.4756, 19.0986);

    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0027.mapLocation;
    fillCircle0032.radius = 19;
    fillCircle0032.fillColor = line0003.color;
    [station0027.drawPrimitives addObject:fillCircle0032];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = station0027.nameOriginal;
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 40;
    drawTextLine0039.kernSpacing = -0.2;
    drawTextLine0039.origin = CGPointMake(1429, 2132);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0039];

    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 782;
    [edge0005.elements addObject:haul0025];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(1506.5, 2081);
    drawLine0028.endPoint = CGPointMake(1363, 2081);
    drawLine0028.width = 17;
    drawLine0028.color = line0003.color;
    [haul0025.drawPrimitives addObject:drawLine0028];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(1368, 2084);
    drawLine0029.endPoint = CGPointMake(1304, 2020);
    drawLine0029.width = 17;
    drawLine0029.color = line0003.color;
    [haul0025.drawPrimitives addObject:drawLine0029];

    // Добавляем станцию Nagyvárad tér
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0005.elements addObject:station0028];
    
    station0028.nameOriginal = @"Nagyvárad tér";
    station0028.mapLocation = CGPointMake(1304, 2020);
    station0028.geoLocation = CGPointMake(47.47911, 19.08899);

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0028.mapLocation;
    fillCircle0033.radius = 19;
    fillCircle0033.fillColor = line0003.color;
    [station0028.drawPrimitives addObject:fillCircle0033];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = station0028.nameOriginal;
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 40;
    drawTextLine0040.kernSpacing = -0.3;
    drawTextLine0040.origin = CGPointMake(1364, 1974);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0040];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 913;
    [edge0005.elements addObject:haul0026];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(1304.5, 2020.5);
    drawLine0030.endPoint = CGPointMake(1224, 1940);
    drawLine0030.width = 17;
    drawLine0030.color = line0003.color;
    [haul0026.drawPrimitives addObject:drawLine0030];

    // Добавляем станцию Klinikák
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0005.elements addObject:station0029];
    
    station0029.nameOriginal = @"Klinikák";
    station0029.mapLocation = CGPointMake(1224, 1940);
    station0029.geoLocation = CGPointMake(47.4825, 19.0789);

    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0029.mapLocation;
    fillCircle0034.radius = 19;
    fillCircle0034.fillColor = line0003.color;
    [station0029.drawPrimitives addObject:fillCircle0034];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0029.nameOriginal;
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 40;
    drawTextLine0041.kernSpacing = -1.6;
    drawTextLine0041.origin = CGPointMake(1275, 1887);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0041];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 761;
    [edge0005.elements addObject:haul0027];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(1224.5, 1940.5);
    drawLine0031.endPoint = CGPointMake(1141.5, 1855);
    drawLine0031.width = 17;
    drawLine0031.color = line0003.color;
    [haul0027.drawPrimitives addObject:drawLine0031];

    // Добавляем станцию Corvin-negyed
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0005.elements addObject:station0030];
    
    station0030.nameOriginal = @"Corvin-negyed";
    station0030.mapLocation = CGPointMake(1141.5, 1855);
    station0030.geoLocation = CGPointMake(47.4856, 19.0697);

    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0030.mapLocation;
    fillCircle0035.radius = 19;
    fillCircle0035.fillColor = line0003.color;
    [station0030.drawPrimitives addObject:fillCircle0035];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = station0030.nameOriginal;
    drawTextLine0042.fontName = @"HelveticaNeue";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 40;
    drawTextLine0042.kernSpacing = -1.6;
    drawTextLine0042.origin = CGPointMake(1189, 1799);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0042];

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 766;
    [edge0005.elements addObject:haul0028];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(1142, 1855.5);
    drawLine0032.endPoint = CGPointMake(1050.5, 1764.5);
    drawLine0032.width = 17;
    drawLine0032.color = line0003.color;
    [haul0028.drawPrimitives addObject:drawLine0032];

    // Добавляем станцию Kálvin tér
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0005.elements addObject:station0031];
    
    station0031.nameOriginal = @"Kálvin tér";
    station0031.mapLocation = CGPointMake(1051.5, 1765.5);
    station0031.geoLocation = CGPointMake(47.489722, 19.061667);

    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0031.mapLocation;
    fillCircle0036.radius = 4;
    fillCircle0036.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0036];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = station0031.nameOriginal;
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 40;
    drawTextLine0043.kernSpacing = -0.6;
    drawTextLine0043.origin = CGPointMake(1053.5, 1682);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0043];

    // Добавляем вершину
    edge0005.finishVertex = vertex0010;

    // Создаем участок линии Kálvin tér - Deák Ferenc tér
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Kálvin tér - Deák Ferenc tér";
    [self.edges addObject:edge0006];
    
    // Добавляем линию
    edge0006.line = line0003;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0010;

    // Добавляем станцию Kálvin tér
    [edge0006.elements addObject:station0031];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 611;
    [edge0006.elements addObject:haul0029];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(1051, 1765);
    drawLine0033.endPoint = CGPointMake(964.5, 1678.5);
    drawLine0033.width = 17;
    drawLine0033.color = line0003.color;
    [haul0029.drawPrimitives addObject:drawLine0033];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(967, 1684);
    drawLine0034.endPoint = CGPointMake(967, 1634.5);
    drawLine0034.width = 17;
    drawLine0034.color = line0003.color;
    [haul0029.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию Ferenciek tere
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0006.elements addObject:station0032];
    
    station0032.nameOriginal = @"Ferenciek tere";
    station0032.mapLocation = CGPointMake(967, 1634.5);
    station0032.geoLocation = CGPointMake(47.493056, 19.056111);

    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0032.mapLocation;
    fillCircle0037.radius = 19;
    fillCircle0037.fillColor = line0003.color;
    [station0032.drawPrimitives addObject:fillCircle0037];
    
    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = station0032.nameOriginal;
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 40;
    drawTextLine0044.kernSpacing = -0.0;
    drawTextLine0044.origin = CGPointMake(1016, 1614);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 512;
    [edge0006.elements addObject:haul0030];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(967, 1635);
    drawLine0035.endPoint = CGPointMake(967.5, 1463.5);
    drawLine0035.width = 17;
    drawLine0035.color = line0003.color;
    [haul0030.drawPrimitives addObject:drawLine0035];

    // Добавляем станцию Deák Ferenc tér
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0006.elements addObject:station0033];
    
    station0033.nameOriginal = @"Deák Ferenc tér";
    station0033.mapLocation = CGPointMake(967.5, 1463.5);
    station0033.geoLocation = CGPointMake(47.4975, 19.055);

    station0033.showNameOnMap = false;
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0004];

    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0033.mapLocation;
    fillCircle0038.radius = 4;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [station0033.drawPrimitives addObject:fillCircle0038];

    // Добавляем вершину
    edge0006.finishVertex = vertex0009;

    // Создаем участок линии Deák Ferenc tér - Újpest-Központ
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Deák Ferenc tér - Újpest-Központ";
    [self.edges addObject:edge0007];
    
    // Добавляем линию
    edge0007.line = line0003;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0009;

    // Добавляем станцию Deák Ferenc tér
    [edge0007.elements addObject:station0033];

    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 601;
    [edge0007.elements addObject:haul0031];
    
    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(967, 1464);
    drawLine0036.endPoint = CGPointMake(967.5, 1298);
    drawLine0036.width = 17;
    drawLine0036.color = line0003.color;
    [haul0031.drawPrimitives addObject:drawLine0036];

    // Добавляем станцию Arany János utca
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0007.elements addObject:station0034];
    
    station0034.nameOriginal = @"Arany János utca";
    station0034.mapLocation = CGPointMake(967.5, 1298);
    station0034.geoLocation = CGPointMake(47.503056, 19.054444);
    
    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0034.mapLocation;
    fillCircle0039.radius = 19;
    fillCircle0039.fillColor = line0003.color;
    [station0034.drawPrimitives addObject:fillCircle0039];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = @"Arany";
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 40;
    drawTextLine0045.kernSpacing = 0.2;
    drawTextLine0045.origin = CGPointMake(1007, 1232);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0045];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = @"J. utca";
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 40;
    drawTextLine0046.kernSpacing = -2.0;
    drawTextLine0046.origin = CGPointMake(1007, 1288);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0046];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 849;
    [edge0007.elements addObject:haul0032];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(967.5, 1298.5);
    drawLine0037.endPoint = CGPointMake(967.5, 1151.5);
    drawLine0037.width = 17;
    drawLine0037.color = line0003.color;
    [haul0032.drawPrimitives addObject:drawLine0037];

    // Добавляем станцию Nyugati pályaudvar
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0007.elements addObject:station0035];
    
    station0035.nameOriginal = @"Nyugati pályaudvar";
    station0035.mapLocation = CGPointMake(967.5, 1151.5);
    station0035.geoLocation = CGPointMake(47.511389, 19.056667);

    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0035.mapLocation;
    fillCircle0040.radius = 19;
    fillCircle0040.fillColor = line0003.color;
    [station0035.drawPrimitives addObject:fillCircle0040];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = @"Nyugati";
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 40;
    drawTextLine0047.kernSpacing = -0.2;
    drawTextLine0047.origin = CGPointMake(795, 1133);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0047];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = @"pályaudvar";
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 40;
    drawTextLine0048.kernSpacing = -1.2;
    drawTextLine0048.origin = CGPointMake(744, 1188);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0048];

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 825;
    [edge0007.elements addObject:haul0033];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(967.5, 1152);
    drawLine0038.endPoint = CGPointMake(967.5, 996);
    drawLine0038.width = 17;
    drawLine0038.color = line0003.color;
    [haul0033.drawPrimitives addObject:drawLine0038];

    // Добавляем станцию Lehel tér
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0007.elements addObject:station0036];
    
    station0036.nameOriginal = @"Lehel tér";
    station0036.mapLocation = CGPointMake(967.5, 996);
    station0036.geoLocation = CGPointMake(47.5175, 19.060556);
    
    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0036.mapLocation;
    fillCircle0041.radius = 19;
    fillCircle0041.fillColor = line0003.color;
    [station0036.drawPrimitives addObject:fillCircle0041];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0036.nameOriginal;
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 40;
    drawTextLine0049.kernSpacing = -0.0;
    drawTextLine0049.origin = CGPointMake(1022, 975);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0049];

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 837;
    [edge0007.elements addObject:haul0034];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(967.5, 996.5);
    drawLine0039.endPoint = CGPointMake(967.5, 822);
    drawLine0039.width = 17;
    drawLine0039.color = line0003.color;
    [haul0034.drawPrimitives addObject:drawLine0039];

    // Добавляем станцию Dózsa György út
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0007.elements addObject:station0037];
    
    station0037.nameOriginal = @"Dózsa György út";
    station0037.mapLocation = CGPointMake(967.5, 822);
    station0037.geoLocation = CGPointMake(47.524167, 19.063333);

    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = station0037.mapLocation;
    fillCircle0042.radius = 19;
    fillCircle0042.fillColor = line0003.color;
    [station0037.drawPrimitives addObject:fillCircle0042];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = station0037.nameOriginal;
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 40;
    drawTextLine0050.kernSpacing = 0.2;
    drawTextLine0050.origin = CGPointMake(1022, 802);
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0050];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 934;
    [edge0007.elements addObject:haul0035];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(967.5, 822.5);
    drawLine0040.endPoint = CGPointMake(967.5, 666.5);
    drawLine0040.width = 17;
    drawLine0040.color = line0003.color;
    [haul0035.drawPrimitives addObject:drawLine0040];

    // Добавляем станцию Árpád híd
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0007.elements addObject:station0038];

    station0038.nameOriginal = @"Árpád híd";
    station0038.mapLocation = CGPointMake(967.5, 666.5);
    station0038.geoLocation = CGPointMake(47.532778, 19.067222);

    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = station0038.mapLocation;
    fillCircle0043.radius = 19;
    fillCircle0043.fillColor = line0003.color;
    [station0038.drawPrimitives addObject:fillCircle0043];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = @"Árpád-híd";
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 40;
    drawTextLine0051.kernSpacing = -0.6;
    drawTextLine0051.origin = CGPointMake(1022, 642);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0051];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 772;
    [edge0007.elements addObject:haul0036];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(967.5, 667);
    drawLine0041.endPoint = CGPointMake(967.5, 573);
    drawLine0041.width = 17;
    drawLine0041.color = line0003.color;
    [haul0036.drawPrimitives addObject:drawLine0041];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(965, 578.5);
    drawLine0042.endPoint = CGPointMake(1154.5, 389);
    drawLine0042.width = 17;
    drawLine0042.color = line0003.color;
    [haul0036.drawPrimitives addObject:drawLine0042];

    // Добавляем станцию Forgách utca
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0007.elements addObject:station0039];

    station0039.nameOriginal = @"Forgách utca";
    station0039.mapLocation = CGPointMake(1154.5, 389);
    station0039.geoLocation = CGPointMake(47.539167, 19.069722);

    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0039.mapLocation;
    fillCircle0044.radius = 19;
    fillCircle0044.fillColor = line0003.color;
    [station0039.drawPrimitives addObject:fillCircle0044];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0039.nameOriginal;
    drawTextLine0052.fontName = @"HelveticaNeue";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 40;
    drawTextLine0052.kernSpacing = -1.4;
    drawTextLine0052.origin = CGPointMake(1213, 386);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0052];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 1071;
    [edge0007.elements addObject:haul0037];
    
    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(1154, 389.5);
    drawLine0043.endPoint = CGPointMake(1321, 225);
    drawLine0043.width = 17;
    drawLine0043.color = line0003.color;
    [haul0037.drawPrimitives addObject:drawLine0043];

    // Добавляем станцию Gyöngyösi utca
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0007.elements addObject:station0040];

    station0040.nameOriginal = @"Gyöngyösi utca";
    station0040.mapLocation = CGPointMake(1321, 225);
    station0040.geoLocation = CGPointMake(47.548611, 19.072778);

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0040.mapLocation;
    fillCircle0045.radius = 19;
    fillCircle0045.fillColor = line0003.color;
    [station0040.drawPrimitives addObject:fillCircle0045];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = @"Gyöngyösi";
    drawTextLine0053.fontName = @"HelveticaNeue";
    drawTextLine0053.fontColor = [UIColor blackColor];
    drawTextLine0053.fontSize = 40;
    drawTextLine0053.kernSpacing = -0.6;
    drawTextLine0053.origin = CGPointMake(1231, 68);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0053];

    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = @"utca";
    drawTextLine0054.fontName = @"HelveticaNeue";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 40;
    drawTextLine0054.kernSpacing = -1.6;
    drawTextLine0054.origin = CGPointMake(1286, 123);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0054];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 1272;
    [edge0007.elements addObject:haul0038];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(1320.5, 225);
    drawLine0044.endPoint = CGPointMake(1762, 225);
    drawLine0044.width = 17;
    drawLine0044.color = line0003.color;
    [haul0038.drawPrimitives addObject:drawLine0044];

    // Добавляем станцию Újpest-Városkapu
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0007.elements addObject:station0041];
    
    station0041.nameOriginal = @"Újpest-Városkapu";
    station0041.mapLocation = CGPointMake(1762, 225);
    station0041.geoLocation = CGPointMake(47.559444, 19.080833);

    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0041.mapLocation;
    fillCircle0046.radius = 19;
    fillCircle0046.fillColor = line0003.color;
    [station0041.drawPrimitives addObject:fillCircle0046];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = @"Újpest-";
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 40;
    drawTextLine0055.kernSpacing = -0.6;
    drawTextLine0055.origin = CGPointMake(1695, 61.5);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0055];

    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = @"Városkapu";
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor blackColor];
    drawTextLine0056.fontSize = 40;
    drawTextLine0056.kernSpacing = -1.6;
    drawTextLine0056.origin = CGPointMake(1671, 116);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0056];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 858;
    [edge0007.elements addObject:haul0039];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(1761.5, 225);
    drawLine0045.endPoint = CGPointMake(2037, 225);
    drawLine0045.width = 17;
    drawLine0045.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawLine0045];

    // Добавляем станцию Újpest-Központ
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0007.elements addObject:station0042];
    
    station0042.nameOriginal = @"Újpest-Központ";
    station0042.mapLocation = CGPointMake(2037, 225);
    station0042.geoLocation = CGPointMake(47.560556, 19.090278);

    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = station0042.mapLocation;
    fillCircle0047.radius = 19;
    fillCircle0047.fillColor = line0003.color;
    [station0042.drawPrimitives addObject:fillCircle0047];

    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = CGPointMake(2115.5, 225);
    fillCircle0048.radius = 37.5;
    fillCircle0048.fillColor = line0003.color;
    [station0042.drawPrimitives addObject:fillCircle0048];
    
    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = @"3";
    drawTextLine0057.fontName = @"HelveticaNeue-Bold";
    drawTextLine0057.fontColor = [UIColor whiteColor];
    drawTextLine0057.fontSize = 60;
    drawTextLine0057.origin = CGPointMake(2099, 187);
    [station0042.drawPrimitives addObject:drawTextLine0057];
    
    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = @"Újpest-központ";
    drawTextLine0058.fontName = @"HelveticaNeue-Bold";
    drawTextLine0058.fontColor = [UIColor blackColor];
    drawTextLine0058.fontSize = 40;
    drawTextLine0058.kernSpacing = -0.4;
    drawTextLine0058.origin = CGPointMake(2173, 204);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0058];

    // Добавляем вершину
    edge0007.finishVertex = vertex0005;

    ////////////////////////////////////////////////////////////////
    // Green Line 4
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Kelenföld vasútállomás - Kálvin tér
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Kelenföld vasútállomás - Kálvin tér";
    [self.edges addObject:edge0008];
    
    // Добавляем линию
    edge0008.line = line0004;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0007;

    // Добавляем станцию Kelenföld vasútállomás
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0008.elements addObject:station0043];
    
    station0043.nameOriginal = @"Kelenföld vasútállomás";
    station0043.mapLocation = CGPointMake(457.5, 2149);
    station0043.geoLocation = CGPointMake(47.464444, 19.018611);

    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = CGPointMake(382, 2087.5);
    fillCircle0049.radius = 37.5;
    fillCircle0049.fillColor = line0004.color;
    [station0043.drawPrimitives addObject:fillCircle0049];
    
    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = @"4";
    drawTextLine0059.fontName = @"HelveticaNeue-Bold";
    drawTextLine0059.fontColor = [UIColor whiteColor];
    drawTextLine0059.fontSize = 60;
    drawTextLine0059.origin = CGPointMake(364, 2049.5);
    [station0043.drawPrimitives addObject:drawTextLine0059];

    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = station0043.mapLocation;
    fillCircle0050.radius = 19;
    fillCircle0050.fillColor = line0004.color;
    [station0043.drawPrimitives addObject:fillCircle0050];

    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = station0043.nameOriginal;
    drawTextLine0060.fontName = @"HelveticaNeue-Bold";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 40;
    drawTextLine0060.kernSpacing = -2.0;
    drawTextLine0060.origin = CGPointMake(19, 2132);
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0060];

    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 1014;
    [edge0008.elements addObject:haul0040];
    
    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(457.5, 2149);
    drawLine0046.endPoint = CGPointMake(600, 2149);
    drawLine0046.width = 17;
    drawLine0046.color = line0004.color;
    [haul0040.drawPrimitives addObject:drawLine0046];

    // Добавляем станцию Bikás park
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0008.elements addObject:station0044];

    station0044.nameOriginal = @"Bikás park";
    station0044.mapLocation = CGPointMake(600, 2149);
    station0044.geoLocation = CGPointMake(47.465, 19.033056);
    
    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = station0044.mapLocation;
    fillCircle0051.radius = 19;
    fillCircle0051.fillColor = line0004.color;
    [station0044.drawPrimitives addObject:fillCircle0051];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = @"Bikás";
    drawTextLine0061.fontName = @"HelveticaNeue";
    drawTextLine0061.fontColor = [UIColor blackColor];
    drawTextLine0061.fontSize = 40;
    drawTextLine0061.kernSpacing = -0.0;
    drawTextLine0061.origin = CGPointMake(548, 2192);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0061];

    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = @"út";
    drawTextLine0062.fontName = @"HelveticaNeue";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 40;
    drawTextLine0062.kernSpacing = 0.2;
    drawTextLine0062.origin = CGPointMake(578, 2246);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0062];

    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 1431;
    [edge0008.elements addObject:haul0041];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(599.5, 2149);
    drawLine0047.endPoint = CGPointMake(668, 2149);
    drawLine0047.width = 17;
    drawLine0047.color = line0004.color;
    [haul0041.drawPrimitives addObject:drawLine0047];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(663, 2152);
    drawLine0048.endPoint = CGPointMake(723, 2092);
    drawLine0048.width = 17;
    drawLine0048.color = line0004.color;
    [haul0041.drawPrimitives addObject:drawLine0048];

    // Добавляем станцию Újbuda-központ
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0008.elements addObject:station0045];
    
    station0045.nameOriginal = @"Újbuda-központ";
    station0045.mapLocation = CGPointMake(723, 2092);
    station0045.geoLocation = CGPointMake(47.474167, 19.045833);

    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = station0045.mapLocation;
    fillCircle0052.radius = 19;
    fillCircle0052.fillColor = line0004.color;
    [station0045.drawPrimitives addObject:fillCircle0052];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = station0045.nameOriginal;
    drawTextLine0063.fontName = @"HelveticaNeue";
    drawTextLine0063.fontColor = [UIColor blackColor];
    drawTextLine0063.fontSize = 40;
    drawTextLine0063.kernSpacing = -2.0;
    drawTextLine0063.origin = CGPointMake(435, 2047);
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0063];

    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 391;
    [edge0008.elements addObject:haul0042];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(722.5, 2092.5);
    drawLine0049.endPoint = CGPointMake(799, 2016.5);
    drawLine0049.width = 17;
    drawLine0049.color = line0004.color;
    [haul0042.drawPrimitives addObject:drawLine0049];

    // Добавляем станцию Móricz Zsigmond körtér
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0008.elements addObject:station0046];

    station0046.nameOriginal = @"Móricz Zsigmond körtér";
    station0046.mapLocation = CGPointMake(799, 2016.5);
    station0046.geoLocation = CGPointMake(47.477222, 19.0475);
    
    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = station0046.mapLocation;
    fillCircle0053.radius = 19;
    fillCircle0053.fillColor = line0004.color;
    [station0046.drawPrimitives addObject:fillCircle0053];

    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = station0046.nameOriginal;
    drawTextLine0064.fontName = @"HelveticaNeue";
    drawTextLine0064.fontColor = [UIColor blackColor];
    drawTextLine0064.fontSize = 40;
    drawTextLine0064.kernSpacing = -0.0;
    drawTextLine0064.origin = CGPointMake(319, 1977);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0064];

    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 830;
    [edge0008.elements addObject:haul0043];
    
    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(798.5, 2017);
    drawLine0050.endPoint = CGPointMake(881, 1935);
    drawLine0050.width = 17;
    drawLine0050.color = line0004.color;
    [haul0043.drawPrimitives addObject:drawLine0050];

    // Добавляем станцию Szent Gellért tér
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0008.elements addObject:station0047];
    
    station0047.nameOriginal = @"Szent Gellért tér";
    station0047.mapLocation = CGPointMake(881, 1935);
    station0047.geoLocation = CGPointMake(47.483056, 19.054722);

    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = station0047.mapLocation;
    fillCircle0054.radius = 19;
    fillCircle0054.fillColor = line0004.color;
    [station0047.drawPrimitives addObject:fillCircle0054];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = station0047.nameOriginal;
    drawTextLine0065.fontName = @"HelveticaNeue";
    drawTextLine0065.fontColor = [UIColor blackColor];
    drawTextLine0065.fontSize = 40;
    drawTextLine0065.kernSpacing = -0.0;
    drawTextLine0065.origin = CGPointMake(530, 1905);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0065];

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 441;
    [edge0008.elements addObject:haul0044];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(880.5, 1935.5);
    drawLine0051.endPoint = CGPointMake(994, 1821.5);
    drawLine0051.width = 17;
    drawLine0051.color = line0004.color;
    [haul0044.drawPrimitives addObject:drawLine0051];

    // Добавляем станцию Fővám tér
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0008.elements addObject:station0048];

    station0048.nameOriginal = @"Fővám tér";
    station0048.mapLocation = CGPointMake(994, 1821.5);
    station0048.geoLocation = CGPointMake(47.486111, 19.0575);

    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = station0048.mapLocation;
    fillCircle0055.radius = 19;
    fillCircle0055.fillColor = line0004.color;
    [station0048.drawPrimitives addObject:fillCircle0055];

    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = station0048.nameOriginal;
    drawTextLine0066.fontName = @"HelveticaNeue";
    drawTextLine0066.fontColor = [UIColor blackColor];
    drawTextLine0066.fontSize = 40;
    drawTextLine0066.kernSpacing = -0.0;
    drawTextLine0066.origin = CGPointMake(779, 1763);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0066];

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 480;
    [edge0008.elements addObject:haul0045];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(993.5, 1822);
    drawLine0052.endPoint = CGPointMake(1052.5, 1762.5);
    drawLine0052.width = 17;
    drawLine0052.color = line0004.color;
    [haul0045.drawPrimitives addObject:drawLine0052];

    // Добавляем станцию Kálvin tér
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0008.elements addObject:station0049];
    
    station0049.nameOriginal = @"Kálvin tér";
    station0049.mapLocation = CGPointMake(1051.5, 1765.5);
    station0049.geoLocation = CGPointMake(47.489722, 19.061667);
    
    station0049.showNameOnMap = false;
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0043];
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = station0049.mapLocation;
    fillCircle0056.radius = 4;
    fillCircle0056.fillColor = [UIColor whiteColor];
    [station0049.drawPrimitives addObject:fillCircle0056];

    // Добавляем вершину
    edge0008.finishVertex = vertex0010;

    // Создаем участок линии Kálvin tér - Keleti pályaudvar
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: Kálvin tér - Keleti pályaudvar";
    [self.edges addObject:edge0009];
    
    // Добавляем линию
    edge0009.line = line0004;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0010;

    // Добавляем станцию Kálvin tér
    [edge0009.elements addObject:station0049];

    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 834;
    [edge0009.elements addObject:haul0046];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(1047, 1764.5);
    drawLine0053.endPoint = CGPointMake(1446, 1764.5);
    drawLine0053.width = 17;
    drawLine0053.color = line0004.color;
    [haul0046.drawPrimitives addObject:drawLine0053];

    // Добавляем станцию Rákóczi tér
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0009.elements addObject:station0050];
    
    station0050.nameOriginal = @"Rákóczi tér";
    station0050.mapLocation = CGPointMake(1446, 1764.5);
    station0050.geoLocation = CGPointMake(47.492778, 19.072222);

    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = station0050.mapLocation;
    fillCircle0057.radius = 19;
    fillCircle0057.fillColor = line0004.color;
    [station0050.drawPrimitives addObject:fillCircle0057];

    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = station0050.nameOriginal;
    drawTextLine0067.fontName = @"HelveticaNeue";
    drawTextLine0067.fontColor = [UIColor blackColor];
    drawTextLine0067.fontSize = 40;
    drawTextLine0067.kernSpacing = -0.8;
    drawTextLine0067.origin = CGPointMake(1346, 1683);
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0067];

    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 506;
    [edge0009.elements addObject:haul0047];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(1445.5, 1764.5);
    drawLine0054.endPoint = CGPointMake(1600.5, 1764.5);
    drawLine0054.width = 17;
    drawLine0054.color = line0004.color;
    [haul0047.drawPrimitives addObject:drawLine0054];

    // Добавляем станцию II. János Pál pápa tér
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0009.elements addObject:station0051];
 
    station0051.nameOriginal = @"II. János Pál pápa tér";
    station0051.mapLocation = CGPointMake(1597.5, 1763.5);
    station0051.geoLocation = CGPointMake(47.495833, 19.0775);
    
    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = station0051.mapLocation;
    fillCircle0058.radius = 19;
    fillCircle0058.fillColor = line0004.color;
    [station0051.drawPrimitives addObject:fillCircle0058];

    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = station0051.nameOriginal;
    drawTextLine0068.fontName = @"HelveticaNeue";
    drawTextLine0068.fontColor = [UIColor blackColor];
    drawTextLine0068.fontSize = 40;
    drawTextLine0068.kernSpacing = -0.8;
    drawTextLine0068.origin = CGPointMake(1661, 1743);
    [station0051.nameOriginalTextPrimitives addObject:drawTextLine0068];

    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 651;
    [edge0009.elements addObject:haul0048];

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(1594.5, 1767);
    drawLine0055.endPoint = CGPointMake(1790.5, 1571);
    drawLine0055.width = 17;
    drawLine0055.color = line0004.color;
    [haul0048.drawPrimitives addObject:drawLine0055];

    // Добавляем станцию Keleti pályaudvar
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0009.elements addObject:station0052];
    
    station0052.nameOriginal = @"Keleti pályaudvar";
    station0052.mapLocation = CGPointMake(1790.5, 1571);
    station0052.geoLocation = CGPointMake(47.5003, 19.0817);

    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = station0052.mapLocation;
    fillCircle0059.radius = 8.5;
    fillCircle0059.fillColor = line0004.color;
    [station0052.drawPrimitives addObject:fillCircle0059];

    station0052.showNameOnMap = false;
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0024];
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0025];

    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = CGPointMake(1882, 1527.5);
    fillCircle0060.radius = 37.5;
    fillCircle0060.fillColor = line0004.color;
    [station0052.drawPrimitives addObject:fillCircle0060];
    
    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = @"4";
    drawTextLine0069.fontName = @"HelveticaNeue-Bold";
    drawTextLine0069.fontColor = [UIColor whiteColor];
    drawTextLine0069.fontSize = 60;
    drawTextLine0069.origin = CGPointMake(1864, 1489.5);
    [station0052.drawPrimitives addObject:drawTextLine0069];

    // Добавляем вершину
    edge0009.finishVertex = vertex0008;

    return self;
}

@end
