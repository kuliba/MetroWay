//
//  MWRecifeMetro.m
//  MetroWay
//
//  Created by Valentin Ozerov on 03.04.15.
//  Copyright (c) 2015 Valentin Ozerov. All rights reserved.
//

#import "MWRecifeMetro.h"
#import "MWDrawFillCircle.h"
#import "MWDrawLine.h"

@implementation MWRecifeMetro

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"recife_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // Center - 1
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Center - 1";
    line0001.color = [UIColor colorWithRed:(255/255.0) green:(140/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0001];

    // Center - 2
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"Center - 2";
    line0002.color = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0002];

    // South
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"South";
    line0003.color = [UIColor colorWithRed:(30/255.0) green:(144/255.0) blue:(255/255.0) alpha:1];
    [self.lines addObject:line0003];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0003];

    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Recife
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Recife";
    [self.vertices addObject:vertex0001];

    // Joana Bezerra
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Joana Bezerra";
    [self.vertices addObject:vertex0002];

    // Afogados
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Afogados";
    [self.vertices addObject:vertex0003];

    // Ipiranga
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Ipiranga";
    [self.vertices addObject:vertex0004];

    // Mangueira
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Mangueira";
    [self.vertices addObject:vertex0005];

    // Santa Luzia
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Santa Luzia";
    [self.vertices addObject:vertex0006];

    // Werneck
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Werneck";
    [self.vertices addObject:vertex0007];

    // Barro
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Barro";
    [self.vertices addObject:vertex0008];

    // Tejipió
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Tejipió";
    [self.vertices addObject:vertex0009];

    // Conqueiral
    MWVertex *vertex0010 = [[MWVertex alloc] init];
    vertex0010.identifier = @"vertex0010";
    vertex0010.developmentName = @"Вершина: Conqueiral";
    [self.vertices addObject:vertex0010];

    // Camaragibe
    MWVertex *vertex0011 = [[MWVertex alloc] init];
    vertex0011.identifier = @"vertex0011";
    vertex0011.developmentName = @"Вершина: Camaragibe";
    [self.vertices addObject:vertex0011];

    // Jaboatão
    MWVertex *vertex0012 = [[MWVertex alloc] init];
    vertex0012.identifier = @"vertex0012";
    vertex0012.developmentName = @"Вершина: Jaboatão";
    [self.vertices addObject:vertex0012];

    // Cajueiro Seco
    MWVertex *vertex0013 = [[MWVertex alloc] init];
    vertex0013.identifier = @"vertex0013";
    vertex0013.developmentName = @"Вершина: Cajueiro Seco";
    [self.vertices addObject:vertex0013];

    ////////////////////////////////////////////////////////////////
    // Center - 1
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Recife - Joana Bezerra
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Recife - Joana Bezerra";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;

    // Добавляем станцию Recife
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Recife";
    station0001.mapLocation = CGPointMake(2222, 393);
    station0001.geoLocation = CGPointMake(-8.068947, -34.885492);
    station0001.platformIndex = 1;

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue-Bold";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 36;
    drawTextLine0001.degrees = -45;
    drawTextLine0001.origin = CGPointMake(2203, 272);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = station0001.mapLocation;
    fillCircle0001.radius = 35;
    fillCircle0001.fillColor = [UIColor blueColor];
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0001.mapLocation;
    fillCircle0002.radius = 30;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0002];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(2332, 335.5);
    drawLine0001.endPoint = CGPointMake(2222, 335.5);
    drawLine0001.width = 33;
    drawLine0001.color = line0001.color;
    [station0001.drawPrimitives addObject:drawLine0001];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1302;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(2222.5, 335.5);
    drawLine0002.endPoint = CGPointMake(2084, 335.5);
    drawLine0002.width = 33;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию Joana Bezerra
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Joana Bezerra";
    station0002.mapLocation = CGPointMake(2084, 393);
    station0002.geoLocation = CGPointMake(-8.073133, -34.895424);
    station0002.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0002.nameOriginal;
    drawTextLine0002.fontName = @"HelveticaNeue-Bold";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 36;
    drawTextLine0002.degrees = -45;
    drawTextLine0002.kernSpacing = 0.3;
    drawTextLine0002.origin = CGPointMake(2056, 273);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0002];

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0002.mapLocation;
    fillCircle0003.radius = 35;
    fillCircle0003.fillColor = [UIColor blueColor];
    [station0002.drawPrimitives addObject:fillCircle0003];

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0002.mapLocation;
    fillCircle0004.radius = 30;
    fillCircle0004.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0004];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    // Создаем участок линии Joana Bezerra - Afogados
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Joana Bezerra - Afogados";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;

    // Добавляем станцию Joana Bezerra
    [edge0002.elements addObject:station0002];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1311;
    [edge0002.elements addObject:haul0002];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(2084.5, 335.5);
    drawLine0003.endPoint = CGPointMake(1911, 335.5);
    drawLine0003.width = 33;
    drawLine0003.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию Afogados
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0002.elements addObject:station0003];
    
    station0003.nameOriginal = @"Afogados";
    station0003.mapLocation = CGPointMake(1911, 354);
    station0003.geoLocation = CGPointMake(-8.077233, -34.906434);
    station0003.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0003.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue-Bold";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 36;
    drawTextLine0003.degrees = -45;
    drawTextLine0003.kernSpacing = 0.3;
    drawTextLine0003.origin = CGPointMake(1906, 273);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0003];

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0003.mapLocation;
    fillCircle0005.radius = 35;
    fillCircle0005.fillColor = [UIColor blueColor];
    [station0003.drawPrimitives addObject:fillCircle0005];

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0003.mapLocation;
    fillCircle0006.radius = 30;
    fillCircle0006.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0006];

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;

    // Создаем участок линии Afogados - Ipiranga
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Afogados - Ipiranga";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;

    // Добавляем станцию Afogados
    [edge0003.elements addObject:station0003];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 810;
    [edge0003.elements addObject:haul0003];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(1911.5, 335.5);
    drawLine0004.endPoint = CGPointMake(1778, 335.5);
    drawLine0004.width = 33;
    drawLine0004.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Ipiranga
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0003.elements addObject:station0004];
    
    station0004.nameOriginal = @"Ipiranga";
    station0004.mapLocation = CGPointMake(1778, 355);
    station0004.geoLocation = CGPointMake(-8.077695, -34.913389);
    station0004.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0004.nameOriginal;
    drawTextLine0004.fontName = @"HelveticaNeue-Bold";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 36;
    drawTextLine0004.degrees = -45;
    drawTextLine0004.kernSpacing = 0.3;
    drawTextLine0004.origin = CGPointMake(1782, 273);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0004];

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0004.mapLocation;
    fillCircle0007.radius = 35;
    fillCircle0007.fillColor = [UIColor blueColor];
    [station0004.drawPrimitives addObject:fillCircle0007];

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0004.mapLocation;
    fillCircle0008.radius = 30;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0008];

    // Добавляем вершину
    edge0003.finishVertex = vertex0004;

    // Создаем участок линии Ipiranga - Mangueira
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Ipiranga - Mangueira";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0001;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0004;

    // Добавляем станцию Ipiranga
    [edge0004.elements addObject:station0004];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 876;
    [edge0004.elements addObject:haul0004];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(1778.5, 335.5);
    drawLine0005.endPoint = CGPointMake(1643, 335.5);
    drawLine0005.width = 33;
    drawLine0005.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0005];

    // Добавляем станцию Mangueira
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0004.elements addObject:station0005];
    
    station0005.nameOriginal = @"Mangueira";
    station0005.mapLocation = CGPointMake(1643, 355);
    station0005.geoLocation = CGPointMake(-8.079270, -34.921133);
    station0005.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0005.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue-Bold";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 36;
    drawTextLine0005.degrees = -45;
    drawTextLine0005.kernSpacing = 0.3;
    drawTextLine0005.origin = CGPointMake(1635, 273);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0005];

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0005.mapLocation;
    fillCircle0009.radius = 35;
    fillCircle0009.fillColor = [UIColor blueColor];
    [station0005.drawPrimitives addObject:fillCircle0009];

    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0005.mapLocation;
    fillCircle0010.radius = 30;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0010];

    // Добавляем вершину
    edge0004.finishVertex = vertex0005;

    // Создаем участок линии Mangueira - Santa Luzia
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Mangueira - Santa Luzia";
    [self.edges addObject:edge0005];
    
    // Добавляем линию
    edge0005.line = line0001;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0005;

    // Добавляем станцию Mangueira
    [edge0005.elements addObject:station0005];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1164;
    [edge0005.elements addObject:haul0005];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(1643.5, 335.5);
    drawLine0006.endPoint = CGPointMake(1509, 335.5);
    drawLine0006.width = 33;
    drawLine0006.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Santa Luzia
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0005.elements addObject:station0006];
    
    station0006.nameOriginal = @"Santa Luzia";
    station0006.mapLocation = CGPointMake(1509, 355);
    station0006.geoLocation = CGPointMake(-8.084078, -34.930179);
    station0006.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0006.nameOriginal;
    drawTextLine0006.fontName = @"HelveticaNeue-Bold";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 36;
    drawTextLine0006.degrees = -45;
    drawTextLine0006.kernSpacing = 0.3;
    drawTextLine0006.origin = CGPointMake(1502, 273);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0006];

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0006.mapLocation;
    fillCircle0011.radius = 35;
    fillCircle0011.fillColor = [UIColor blueColor];
    [station0006.drawPrimitives addObject:fillCircle0011];

    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0006.mapLocation;
    fillCircle0012.radius = 30;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0012];

    // Добавляем вершину
    edge0005.finishVertex = vertex0006;

    // Создаем участок линии Santa Luzia - Werneck
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Santa Luzia - Werneck";
    [self.edges addObject:edge0006];
    
    // Добавляем линию
    edge0006.line = line0001;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0006;

    // Добавляем станцию Santa Luzia
    [edge0006.elements addObject:station0006];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 709;
    [edge0006.elements addObject:haul0006];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(1509.5, 335.5);
    drawLine0007.endPoint = CGPointMake(1377, 335.5);
    drawLine0007.width = 33;
    drawLine0007.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Werneck
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0006.elements addObject:station0007];
    
    station0007.nameOriginal = @"Werneck";
    station0007.mapLocation = CGPointMake(1377, 355);
    station0007.geoLocation = CGPointMake(-8.085918, -34.936326);
    station0007.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0007.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue-Bold";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 36;
    drawTextLine0007.degrees = -45;
    drawTextLine0007.kernSpacing = 0.3;
    drawTextLine0007.origin = CGPointMake(1366, 273);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0007];

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0007.mapLocation;
    fillCircle0013.radius = 35;
    fillCircle0013.fillColor = [UIColor blueColor];
    [station0007.drawPrimitives addObject:fillCircle0013];

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0007.mapLocation;
    fillCircle0014.radius = 30;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0014];

    // Добавляем вершину
    edge0006.finishVertex = vertex0007;

    // Создаем участок линии Werneck - Barro
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Werneck - Barro";
    [self.edges addObject:edge0007];
    
    // Добавляем линию
    edge0007.line = line0001;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0007;

    // Добавляем станцию Werneck
    [edge0007.elements addObject:station0007];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 1142;
    [edge0007.elements addObject:haul0007];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(1377.5, 335.5);
    drawLine0008.endPoint = CGPointMake(1242, 335.5);
    drawLine0008.width = 33;
    drawLine0008.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Barro
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0007.elements addObject:station0008];
    
    station0008.nameOriginal = @"Barro";
    station0008.mapLocation = CGPointMake(1242, 355);
    station0008.geoLocation = CGPointMake(-8.088883, -34.945884);
    station0008.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0008.nameOriginal;
    drawTextLine0008.fontName = @"HelveticaNeue-Bold";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 36;
    drawTextLine0008.degrees = -45;
    drawTextLine0008.kernSpacing = 0.3;
    drawTextLine0008.origin = CGPointMake(1231, 273);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0008];

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0008.mapLocation;
    fillCircle0015.radius = 35;
    fillCircle0015.fillColor = [UIColor blueColor];
    [station0008.drawPrimitives addObject:fillCircle0015];
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0008.mapLocation;
    fillCircle0016.radius = 30;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0016];

    // Добавляем вершину
    edge0007.finishVertex = vertex0008;

    // Создаем участок линии Barro - Tejipió
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Barro - Tejipió";
    [self.edges addObject:edge0008];
    
    // Добавляем линию
    edge0008.line = line0001;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0008;

    // Добавляем станцию Barro
    [edge0008.elements addObject:station0008];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 1209;
    [edge0008.elements addObject:haul0008];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(1242.5, 335.5);
    drawLine0009.endPoint = CGPointMake(1108, 335.5);
    drawLine0009.width = 33;
    drawLine0009.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Tejipió
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0008.elements addObject:station0009];
    
    station0009.nameOriginal = @"Tejipió";
    station0009.mapLocation = CGPointMake(1108.5, 355);
    station0009.geoLocation = CGPointMake(-8.090210, -34.956491);
    station0009.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0009.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue-Bold";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 36;
    drawTextLine0009.degrees = -45;
    drawTextLine0009.kernSpacing = 0.3;
    drawTextLine0009.origin = CGPointMake(1097, 273);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0009];

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0009.mapLocation;
    fillCircle0017.radius = 35;
    fillCircle0017.fillColor = [UIColor blueColor];
    [station0009.drawPrimitives addObject:fillCircle0017];
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0009.mapLocation;
    fillCircle0018.radius = 30;
    fillCircle0018.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0018];

    // Добавляем вершину
    edge0008.finishVertex = vertex0009;
    
    // Создаем участок линии Tejipió - Coqueiral
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: Tejipió - Coqueiral";
    [self.edges addObject:edge0009];
    
    // Добавляем линию
    edge0009.line = line0001;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0009;

    // Добавляем станцию Tejipió
    [edge0009.elements addObject:station0009];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 934;
    [edge0009.elements addObject:haul0009];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(1108.5, 335.5);
    drawLine0010.endPoint = CGPointMake(972, 335.5);
    drawLine0010.width = 33;
    drawLine0010.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Coqueiral
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0009.elements addObject:station0010];
    
    station0010.nameOriginal = @"Coqueiral";
    station0010.mapLocation = CGPointMake(972, 355);
    station0010.geoLocation = CGPointMake(-8.091324, -34.964687);
    station0010.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0010.nameOriginal;
    drawTextLine0010.fontName = @"HelveticaNeue-Bold";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 36;
    drawTextLine0010.degrees = -45;
    drawTextLine0010.kernSpacing = 0.3;
    drawTextLine0010.origin = CGPointMake(953, 273);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0010];

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0010.mapLocation;
    fillCircle0019.radius = 35;
    fillCircle0019.fillColor = [UIColor blueColor];
    [station0010.drawPrimitives addObject:fillCircle0019];

    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0010.mapLocation;
    fillCircle0020.radius = 30;
    fillCircle0020.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0020];

    // Добавляем вершину
    edge0009.finishVertex = vertex0010;

    // Создаем участок линии Coqueiral - Camaragibe
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Coqueiral - Camaragibe";
    [self.edges addObject:edge0010];
    
    // Добавляем линию
    edge0010.line = line0001;
    
    // Добавляем вершину
    edge0010.startVertex = vertex0010;

    // Добавляем станцию Coqueiral
    [edge0010.elements addObject:station0010];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1423;
    [edge0010.elements addObject:haul0010];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(972.5, 335.5);
    drawLine0011.endPoint = CGPointMake(856, 335.5);
    drawLine0011.width = 33;
    drawLine0011.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0011];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(796, 214);
    drawLine0012.endPoint = CGPointMake(916, 341);
    drawLine0012.width = 33;
    drawLine0012.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0012];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(808, 219);
    drawLine0013.endPoint = CGPointMake(736, 219);
    drawLine0013.width = 33;
    drawLine0013.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0013];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(781, 249);
    drawLine0014.endPoint = CGPointMake(867, 342);
    drawLine0014.width = 31;
    drawLine0014.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0014];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(792, 255);
    drawLine0015.endPoint = CGPointMake(736, 255);
    drawLine0015.width = 33;
    drawLine0015.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0015];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(867, 316);
    drawLine0016.endPoint = CGPointMake(902, 353.5);
    drawLine0016.width = 4;
    drawLine0016.color = [UIColor whiteColor];
    [haul0010.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию Alto do Céu
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0010.elements addObject:station0011];
    
    station0011.nameOriginal = @"Alto do Céu";
    station0011.mapLocation = CGPointMake(736, 237);
    station0011.geoLocation = CGPointMake(-8.084675, -34.975042);

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0011.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue-Bold";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 36;
    drawTextLine0011.degrees = -45;
    drawTextLine0011.kernSpacing = 0.3;
    drawTextLine0011.origin = CGPointMake(722, 162);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0011];

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0011.mapLocation;
    fillCircle0021.radius = 35;
    fillCircle0021.fillColor = [UIColor blueColor];
    [station0011.drawPrimitives addObject:fillCircle0021];
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0011.mapLocation;
    fillCircle0022.radius = 30;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0022];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 1072;
    [edge0010.elements addObject:haul0011];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(736.5, 219);
    drawLine0017.endPoint = CGPointMake(596, 219);
    drawLine0017.width = 33;
    drawLine0017.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0017];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(736.5, 255);
    drawLine0018.endPoint = CGPointMake(596, 255);
    drawLine0018.width = 33;
    drawLine0018.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0018];

    // Добавляем станцию Curado
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0010.elements addObject:station0012];
    
    station0012.nameOriginal = @"Curado";
    station0012.mapLocation = CGPointMake(596, 237);
    station0012.geoLocation = CGPointMake(-8.075855, -34.978911);

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0012.nameOriginal;
    drawTextLine0012.fontName = @"HelveticaNeue-Bold";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 36;
    drawTextLine0012.degrees = -45;
    drawTextLine0012.kernSpacing = 0.3;
    drawTextLine0012.origin = CGPointMake(574, 162);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0012];

    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = station0012.mapLocation;
    fillCircle0060.radius = 35;
    fillCircle0060.fillColor = [UIColor colorWithRed:(73/255.0) green:(6/255.0) blue:(9/255.0) alpha:1];
    [station0012.drawPrimitives addObject:fillCircle0060];

    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0012.mapLocation;
    fillCircle0023.radius = 35;
    fillCircle0023.fillColor = [UIColor blueColor];
    [station0012.drawPrimitives addObject:fillCircle0023];
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0012.mapLocation;
    fillCircle0024.radius = 30;
    fillCircle0024.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = @"Destino";
    drawTextLine0013.fontName = @"HelveticaNeue-Bold";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 30;
    drawTextLine0013.kernSpacing = -0.7;
    drawTextLine0013.origin = CGPointMake(550, 292);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0013];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = @"Cabo";
    drawTextLine0014.fontName = @"HelveticaNeue-Bold";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 30;
    drawTextLine0014.kernSpacing = -0.6;
    drawTextLine0014.origin = CGPointMake(550, 326);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1342;
    [edge0010.elements addObject:haul0012];
    
    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(596.5, 219);
    drawLine0019.endPoint = CGPointMake(466, 219);
    drawLine0019.width = 33;
    drawLine0019.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0019];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(596.5, 255);
    drawLine0020.endPoint = CGPointMake(466, 255);
    drawLine0020.width = 33;
    drawLine0020.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0020];
    
    // Добавляем станцию  Rodoviária
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0010.elements addObject:station0013];
    
    station0013.nameOriginal = @"Rodoviária";
    station0013.mapLocation = CGPointMake(466, 237);
    station0013.geoLocation = CGPointMake(-8.064043, -34.981040);
    
    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0013.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue-Bold";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 36;
    drawTextLine0015.degrees = -45;
    drawTextLine0015.kernSpacing = 0.3;
    drawTextLine0015.origin = CGPointMake(438, 162);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0015];

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0013.mapLocation;
    fillCircle0025.radius = 35;
    fillCircle0025.fillColor = [UIColor blueColor];
    [station0013.drawPrimitives addObject:fillCircle0025];
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0013.mapLocation;
    fillCircle0026.radius = 30;
    fillCircle0026.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0026];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 3195;
    [edge0010.elements addObject:haul0013];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(466.5, 219);
    drawLine0021.endPoint = CGPointMake(332, 219);
    drawLine0021.width = 33;
    drawLine0021.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0021];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(466.5, 255);
    drawLine0022.endPoint = CGPointMake(332, 255);
    drawLine0022.width = 33;
    drawLine0022.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0022];
    
    // Добавляем станцию  Cosme e Damião
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0010.elements addObject:station0014];
    
    station0014.nameOriginal = @"Cosme e Damião";
    station0014.mapLocation = CGPointMake(332, 237);
    station0014.geoLocation = CGPointMake(-8.036431, -34.988523);
    
    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0014.nameOriginal;
    drawTextLine0016.fontName = @"HelveticaNeue-Bold";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 36;
    drawTextLine0016.degrees = -45;
    drawTextLine0016.kernSpacing = -3.4;
    drawTextLine0016.origin = CGPointMake(311, 162);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0016];

    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0014.mapLocation;
    fillCircle0027.radius = 35;
    fillCircle0027.fillColor = [UIColor blueColor];
    [station0014.drawPrimitives addObject:fillCircle0027];
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0014.mapLocation;
    fillCircle0028.radius = 30;
    fillCircle0028.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0028];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1521;
    [edge0010.elements addObject:haul0014];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(332.5, 219);
    drawLine0023.endPoint = CGPointMake(198, 219);
    drawLine0023.width = 33;
    drawLine0023.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0023];
    
    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(332.5, 255);
    drawLine0024.endPoint = CGPointMake(198, 255);
    drawLine0024.width = 33;
    drawLine0024.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию  Camaragibe
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0010.elements addObject:station0015];
    
    station0015.nameOriginal = @"Camaragibe";
    station0015.mapLocation = CGPointMake(198, 237);
    station0015.geoLocation = CGPointMake(-8.024495, -34.995348);

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0015.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue-Bold";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 36;
    drawTextLine0017.degrees = -45;
    drawTextLine0017.kernSpacing = 0.3;
    drawTextLine0017.origin = CGPointMake(184, 162);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0017];

    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0015.mapLocation;
    fillCircle0029.radius = 35;
    fillCircle0029.fillColor = [UIColor blueColor];
    [station0015.drawPrimitives addObject:fillCircle0029];
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0015.mapLocation;
    fillCircle0030.radius = 30;
    fillCircle0030.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0030];

    // Добавляем вершину
    edge0010.finishVertex = vertex0011;

    ////////////////////////////////////////////////////////////////
    // Center - 2
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Recife - Joana Bezerra
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0011 = [[MWEdge alloc] init];
    edge0011.identifier = @"edge0011";
    edge0011.developmentName = @"Ребро: Recife - Joana Bezerra";
    [self.edges addObject:edge0011];
    
    // Добавляем линию
    edge0011.line = line0002;
    
    // Добавляем вершину
    edge0011.startVertex = vertex0001;
    
    // Добавляем станцию Recife
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0011.elements addObject:station0016];
    
    station0016.nameOriginal = @"Recife";
    station0016.mapLocation = CGPointMake(2222, 393);
    station0016.geoLocation = CGPointMake(-8.068947, -34.885492);
    station0016.showNameOnMap = NO;
    station0016.platformIndex = 1;

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(2332, 374);
    drawLine0025.endPoint = CGPointMake(2222, 374);
    drawLine0025.width = 33;
    drawLine0025.color = line0002.color;
    [station0016.drawPrimitives addObject:drawLine0025];

    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0001];
    [station0016.drawPrimitives addObject:fillCircle0001];
    [station0016.drawPrimitives addObject:fillCircle0002];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 1302;
    [edge0011.elements addObject:haul0015];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(2222.5, 374);
    drawLine0026.endPoint = CGPointMake(2084, 374);
    drawLine0026.width = 33;
    drawLine0026.color = line0002.color;
    [haul0015.drawPrimitives addObject:drawLine0026];

    // Добавляем станцию Joana Bezerra
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0011.elements addObject:station0017];
    
    station0017.nameOriginal = @"Joana Bezerra";
    station0017.mapLocation = CGPointMake(2084, 393);
    station0017.geoLocation = CGPointMake(-8.073133, -34.895424);
    station0017.showNameOnMap = NO;
    station0017.platformIndex = 1;
    
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0002];
    [station0017.drawPrimitives addObject:fillCircle0003];
    [station0017.drawPrimitives addObject:fillCircle0004];

    // Добавляем вершину
    edge0011.finishVertex = vertex0002;

    // Создаем участок линии Joana Bezerra - Afogados
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0012 = [[MWEdge alloc] init];
    edge0012.identifier = @"edge0012";
    edge0012.developmentName = @"Ребро: Joana Bezerra - Afogados";
    [self.edges addObject:edge0012];
    
    // Добавляем линию
    edge0012.line = line0002;
    
    // Добавляем вершину
    edge0012.startVertex = vertex0002;
    
    // Добавляем станцию Joana Bezerra
    [edge0012.elements addObject:station0017];
    
    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 1311;
    [edge0012.elements addObject:haul0016];
    
    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(2084.5, 374);
    drawLine0027.endPoint = CGPointMake(1911, 374);
    drawLine0027.width = 33;
    drawLine0027.color = line0002.color;
    [haul0016.drawPrimitives addObject:drawLine0027];

    // Добавляем станцию Afogados
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0012.elements addObject:station0018];
    
    station0018.nameOriginal = @"Afogados";
    station0018.mapLocation = CGPointMake(1911, 354);
    station0018.geoLocation = CGPointMake(-8.077233, -34.906434);
    station0018.showNameOnMap = NO;
    station0018.platformIndex = 1;
    
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0003];
    [station0018.drawPrimitives addObject:fillCircle0005];
    [station0018.drawPrimitives addObject:fillCircle0006];
    
    // Добавляем вершину
    edge0012.finishVertex = vertex0003;

    // Создаем участок линии Afogados - Ipiranga
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0013 = [[MWEdge alloc] init];
    edge0013.identifier = @"edge0013";
    edge0013.developmentName = @"Ребро: Afogados - Ipiranga";
    [self.edges addObject:edge0013];
    
    // Добавляем линию
    edge0013.line = line0002;
    
    // Добавляем вершину
    edge0013.startVertex = vertex0003;
    
    // Добавляем станцию Afogados
    [edge0013.elements addObject:station0018];
    
    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 810;
    [edge0013.elements addObject:haul0017];
    
    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(1911.5, 374);
    drawLine0028.endPoint = CGPointMake(1778, 374);
    drawLine0028.width = 33;
    drawLine0028.color = line0002.color;
    [haul0017.drawPrimitives addObject:drawLine0028];

    // Добавляем станцию Ipiranga
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0013.elements addObject:station0019];
    
    station0019.nameOriginal = @"Ipiranga";
    station0019.mapLocation = CGPointMake(850.5, 400.5);
    station0019.geoLocation = CGPointMake(-8.077695, -34.913389);
    station0019.showNameOnMap = NO;
    station0019.platformIndex = 1;
    
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0004];
    [station0019.drawPrimitives addObject:fillCircle0007];
    [station0019.drawPrimitives addObject:fillCircle0008];

    // Добавляем вершину
    edge0013.finishVertex = vertex0004;

    // Создаем участок линии Ipiranga - Mangueira
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0014 = [[MWEdge alloc] init];
    edge0014.identifier = @"edge0014";
    edge0014.developmentName = @"Ребро: Ipiranga - Mangueira";
    [self.edges addObject:edge0014];
    
    // Добавляем линию
    edge0014.line = line0002;
    
    // Добавляем вершину
    edge0014.startVertex = vertex0004;
    
    // Добавляем станцию Ipiranga
    [edge0014.elements addObject:station0019];
    
    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 876;
    [edge0014.elements addObject:haul0018];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(1778.5, 374);
    drawLine0029.endPoint = CGPointMake(1643, 374);
    drawLine0029.width = 33;
    drawLine0029.color = line0002.color;
    [haul0018.drawPrimitives addObject:drawLine0029];

    // Добавляем станцию Mangueira
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0014.elements addObject:station0020];
    
    station0020.nameOriginal = @"Mangueira";
    station0020.mapLocation = CGPointMake(1643, 355);
    station0020.geoLocation = CGPointMake(-8.079270, -34.921133);
    station0020.showNameOnMap = NO;
    station0020.platformIndex = 1;
    
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0005];
    [station0020.drawPrimitives addObject:fillCircle0009];
    [station0020.drawPrimitives addObject:fillCircle0010];
    
    // Добавляем вершину
    edge0014.finishVertex = vertex0005;
    
    // Создаем участок линии Mangueira - Santa Luzia
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0015 = [[MWEdge alloc] init];
    edge0015.identifier = @"edge0015";
    edge0015.developmentName = @"Ребро: Mangueira - Santa Luzia";
    [self.edges addObject:edge0015];
    
    // Добавляем линию
    edge0015.line = line0002;
    
    // Добавляем вершину
    edge0015.startVertex = vertex0005;
    
    // Добавляем станцию Mangueira
    [edge0015.elements addObject:station0020];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1164;
    [edge0015.elements addObject:haul0019];
    
    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(1643.5, 374);
    drawLine0030.endPoint = CGPointMake(1509, 374);
    drawLine0030.width = 33;
    drawLine0030.color = line0002.color;
    [haul0019.drawPrimitives addObject:drawLine0030];
    
    // Добавляем станцию Santa Luzia
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0015.elements addObject:station0021];
    
    station0021.nameOriginal = @"Santa Luzia";
    station0021.mapLocation = CGPointMake(1509, 355);
    station0021.geoLocation = CGPointMake(-8.084078, -34.930179);
    station0021.showNameOnMap = NO;
    station0021.platformIndex = 1;
    
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0006];
    [station0021.drawPrimitives addObject:fillCircle0011];
    [station0021.drawPrimitives addObject:fillCircle0012];
    
    // Добавляем вершину
    edge0015.finishVertex = vertex0006;

    // Создаем участок линии Santa Luzia - Werneck
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0016 = [[MWEdge alloc] init];
    edge0016.identifier = @"edge0016";
    edge0016.developmentName = @"Ребро: Santa Luzia - Werneck";
    [self.edges addObject:edge0016];
    
    // Добавляем линию
    edge0016.line = line0002;
    
    // Добавляем вершину
    edge0016.startVertex = vertex0006;
    
    // Добавляем станцию Santa Luzia
    [edge0016.elements addObject:station0021];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 709;
    [edge0016.elements addObject:haul0020];
    
    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(1509.5, 374);
    drawLine0031.endPoint = CGPointMake(1377, 374);
    drawLine0031.width = 33;
    drawLine0031.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0031];

    // Добавляем станцию Werneck
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0016.elements addObject:station0022];
    
    station0022.nameOriginal = @"Werneck";
    station0022.mapLocation = CGPointMake(1377, 355);
    station0022.geoLocation = CGPointMake(-8.085918, -34.936326);
    station0022.showNameOnMap = NO;
    station0022.platformIndex = 1;
    
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0007];
    [station0022.drawPrimitives addObject:fillCircle0013];
    [station0022.drawPrimitives addObject:fillCircle0014];

    // Добавляем вершину
    edge0016.finishVertex = vertex0007;

    // Создаем участок линии Werneck - Barro
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0017 = [[MWEdge alloc] init];
    edge0017.identifier = @"edge0017";
    edge0017.developmentName = @"Ребро: Werneck - Barro";
    [self.edges addObject:edge0017];
    
    // Добавляем линию
    edge0017.line = line0002;
    
    // Добавляем вершину
    edge0017.startVertex = vertex0007;
    
    // Добавляем станцию Werneck
    [edge0017.elements addObject:station0022];
    
    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 1142;
    [edge0017.elements addObject:haul0021];
    
    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(1377.5, 374);
    drawLine0032.endPoint = CGPointMake(1242, 374);
    drawLine0032.width = 33;
    drawLine0032.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawLine0032];

    // Добавляем станцию Barro
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0017.elements addObject:station0023];
    
    station0023.nameOriginal = @"Barro";
    station0023.mapLocation = CGPointMake(1242, 355);
    station0023.geoLocation = CGPointMake(-8.088883, -34.945884);
    station0023.showNameOnMap = NO;
    station0023.platformIndex = 1;
    
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0008];
    [station0023.drawPrimitives addObject:fillCircle0015];
    [station0023.drawPrimitives addObject:fillCircle0016];

    // Добавляем вершину
    edge0017.finishVertex = vertex0008;

    // Создаем участок линии Barro - Tejipió
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0018 = [[MWEdge alloc] init];
    edge0018.identifier = @"edge0018";
    edge0018.developmentName = @"Ребро: Barro - Tejipió";
    [self.edges addObject:edge0018];
    
    // Добавляем линию
    edge0018.line = line0002;
    
    // Добавляем вершину
    edge0018.startVertex = vertex0008;
    
    // Добавляем станцию Barro
    [edge0018.elements addObject:station0023];
    
    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 1209;
    [edge0018.elements addObject:haul0022];
    
    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(1242.5, 374);
    drawLine0033.endPoint = CGPointMake(1108, 374);
    drawLine0033.width = 33;
    drawLine0033.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0033];

    // Добавляем станцию Tejipió
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0018.elements addObject:station0024];
    
    station0024.nameOriginal = @"Tejipió";
    station0024.mapLocation = CGPointMake(1108.5, 355);
    station0024.geoLocation = CGPointMake(-8.090210, -34.956491);
    station0024.showNameOnMap = NO;
    station0024.platformIndex = 1;
    
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0009];
    [station0024.drawPrimitives addObject:fillCircle0017];
    [station0024.drawPrimitives addObject:fillCircle0018];
    
    // Добавляем вершину
    edge0018.finishVertex = vertex0009;

    // Создаем участок линии Tejipió - Coqueiral
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0019 = [[MWEdge alloc] init];
    edge0019.identifier = @"edge0019";
    edge0019.developmentName = @"Ребро: Tejipió - Coqueiral";
    [self.edges addObject:edge0019];
    
    // Добавляем линию
    edge0019.line = line0002;
    
    // Добавляем вершину
    edge0019.startVertex = vertex0009;
    
    // Добавляем станцию Tejipió
    [edge0019.elements addObject:station0024];
    
    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 934;
    [edge0019.elements addObject:haul0023];
    
    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(1108.5, 374);
    drawLine0034.endPoint = CGPointMake(972, 374);
    drawLine0034.width = 33;
    drawLine0034.color = line0002.color;
    [haul0023.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию Coqueiral
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0019.elements addObject:station0025];
    
    station0025.nameOriginal = @"Coqueiral";
    station0025.mapLocation = CGPointMake(972, 355);
    station0025.geoLocation = CGPointMake(-8.091324, -34.964687);
    station0025.showNameOnMap = NO;
    station0025.platformIndex = 1;
    
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0010];
    [station0025.drawPrimitives addObject:fillCircle0019];
    [station0025.drawPrimitives addObject:fillCircle0020];

    // Добавляем вершину
    edge0019.finishVertex = vertex0010;
    
    // Создаем участок линии Coqueiral - Jaboatão
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0020 = [[MWEdge alloc] init];
    edge0020.identifier = @"edge0020";
    edge0020.developmentName = @"Ребро: Coqueiral - Jaboatão";
    [self.edges addObject:edge0020];
    
    // Добавляем линию
    edge0020.line = line0002;
    
    // Добавляем вершину
    edge0020.startVertex = vertex0010;
    
    // Добавляем станцию Coqueiral
    [edge0020.elements addObject:station0025];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 1013;
    [edge0020.elements addObject:haul0024];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(972.5, 374);
    drawLine0035.endPoint = CGPointMake(856, 374);
    drawLine0035.width = 33;
    drawLine0035.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0035];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(736.5, 489);
    drawLine0036.endPoint = CGPointMake(813, 489);
    drawLine0036.width = 33;
    drawLine0036.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0036];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(736.5, 453);
    drawLine0037.endPoint = CGPointMake(794, 453);
    drawLine0037.width = 33;
    drawLine0037.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0037];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(783, 459);
    drawLine0038.endPoint = CGPointMake(867, 368);
    drawLine0038.width = 33;
    drawLine0038.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0038];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(801, 494);
    drawLine0039.endPoint = CGPointMake(916, 369);
    drawLine0039.width = 33;
    drawLine0039.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0039];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(862.5, 400);
    drawLine0040.endPoint = CGPointMake(904.5, 353.5);
    drawLine0040.width = 4;
    drawLine0040.color = [UIColor whiteColor];
    [haul0024.drawPrimitives addObject:drawLine0040];

    // Добавляем станцию Cavaleiro
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0020.elements addObject:station0026];
    
    station0026.nameOriginal = @"Cavaleiro";
    station0026.mapLocation = CGPointMake(736.5, 470);
    station0026.geoLocation = CGPointMake(-8.093983, -34.972808);
    
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0026.nameOriginal;
    drawTextLine0018.fontName = @"HelveticaNeue-Bold";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 36;
    drawTextLine0018.degrees = -45;
    drawTextLine0018.kernSpacing = 0.3;
    drawTextLine0018.origin = CGPointMake(609, 627);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0018];
    
    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0026.mapLocation;
    fillCircle0031.radius = 35;
    fillCircle0031.fillColor = [UIColor blueColor];
    [station0026.drawPrimitives addObject:fillCircle0031];
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0026.mapLocation;
    fillCircle0032.radius = 30;
    fillCircle0032.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0032];

    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 2962;
    [edge0020.elements addObject:haul0025];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(736, 453);
    drawLine0041.endPoint = CGPointMake(599.5, 453);
    drawLine0041.width = 33;
    drawLine0041.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0041];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(736, 489);
    drawLine0042.endPoint = CGPointMake(599.5, 489);
    drawLine0042.width = 33;
    drawLine0042.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0042];

    // Добавляем станцию Floriano
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0020.elements addObject:station0027];
    
    station0027.nameOriginal = @"Floriano";
    station0027.mapLocation = CGPointMake(599.5, 470);
    station0027.geoLocation = CGPointMake(-8.106880, -34.993299);

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0027.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue-Bold";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 36;
    drawTextLine0019.degrees = -45;
    drawTextLine0019.kernSpacing = 0.3;
    drawTextLine0019.origin = CGPointMake(473, 613);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0019];

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0027.mapLocation;
    fillCircle0033.radius = 35;
    fillCircle0033.fillColor = [UIColor blueColor];
    [station0027.drawPrimitives addObject:fillCircle0033];
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0027.mapLocation;
    fillCircle0034.radius = 30;
    fillCircle0034.fillColor = [UIColor whiteColor];
    [station0027.drawPrimitives addObject:fillCircle0034];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 1374;
    [edge0020.elements addObject:haul0026];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(600, 453);
    drawLine0043.endPoint = CGPointMake(466, 453);
    drawLine0043.width = 33;
    drawLine0043.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0043];
    
    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(600, 489);
    drawLine0044.endPoint = CGPointMake(466, 489);
    drawLine0044.width = 33;
    drawLine0044.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0044];
    
    // Добавляем станцию Engenho Velho
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0020.elements addObject:station0028];
    
    station0028.nameOriginal = @"Engenho Velho";
    station0028.mapLocation = CGPointMake(466, 470);
    station0028.geoLocation = CGPointMake(-8.107980, -35.005415);

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = @"Engenho";
    drawTextLine0020.fontName = @"HelveticaNeue-Bold";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 36;
    drawTextLine0020.degrees = -45;
    drawTextLine0020.kernSpacing = 0.3;
    drawTextLine0020.origin = CGPointMake(324, 621);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0020];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = @"Velho";
    drawTextLine0021.fontName = @"HelveticaNeue-Bold";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 36;
    drawTextLine0021.degrees = -45;
    drawTextLine0021.kernSpacing = 0.3;
    drawTextLine0021.origin = CGPointMake(352, 649);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0021];

    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0028.mapLocation;
    fillCircle0035.radius = 35;
    fillCircle0035.fillColor = [UIColor blueColor];
    [station0028.drawPrimitives addObject:fillCircle0035];
    
    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0028.mapLocation;
    fillCircle0036.radius = 30;
    fillCircle0036.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0036];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 1154;
    [edge0020.elements addObject:haul0027];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(466.5, 453);
    drawLine0045.endPoint = CGPointMake(332, 453);
    drawLine0045.width = 33;
    drawLine0045.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0045];
    
    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(466.5, 489);
    drawLine0046.endPoint = CGPointMake(332, 489);
    drawLine0046.width = 33;
    drawLine0046.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0046];

    // Добавляем станцию Jaboatão
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0020.elements addObject:station0029];
    
    station0029.nameOriginal = @"Jaboatão";
    station0029.mapLocation = CGPointMake(332, 470);
    station0029.geoLocation = CGPointMake(-8.111035, -35.015329);

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0029.nameOriginal;
    drawTextLine0022.fontName = @"HelveticaNeue-Bold";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 36;
    drawTextLine0022.degrees = -45;
    drawTextLine0022.kernSpacing = 0.3;
    drawTextLine0022.origin = CGPointMake(193, 626);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0022];
    
    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(332.5, 453);
    drawLine0047.endPoint = CGPointMake(228, 453);
    drawLine0047.width = 33;
    drawLine0047.color = line0002.color;
    [station0029.drawPrimitives addObject:drawLine0047];
    
    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(332.5, 489);
    drawLine0048.endPoint = CGPointMake(228, 489);
    drawLine0048.width = 33;
    drawLine0048.color = line0002.color;
    [station0029.drawPrimitives addObject:drawLine0048];
    
    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0029.mapLocation;
    fillCircle0037.radius = 35;
    fillCircle0037.fillColor = [UIColor blueColor];
    [station0029.drawPrimitives addObject:fillCircle0037];
    
    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0029.mapLocation;
    fillCircle0038.radius = 30;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0038];

    // Добавляем вершину
    edge0020.finishVertex = vertex0012;

    ////////////////////////////////////////////////////////////////
    // South
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Recife - Joana Bezerra
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0021 = [[MWEdge alloc] init];
    edge0021.identifier = @"edge0021";
    edge0021.developmentName = @"Ребро: Recife - Joana Bezerra";
    [self.edges addObject:edge0021];
    
    // Добавляем линию
    edge0021.line = line0003;
    
    // Добавляем вершину
    edge0021.startVertex = vertex0001;
    
    // Добавляем станцию Recife
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0021.elements addObject:station0030];
    
    station0030.nameOriginal = @"Recife";
    station0030.mapLocation = CGPointMake(2222, 393);
    station0030.geoLocation = CGPointMake(-8.068947, -34.885492);
    station0030.showNameOnMap = NO;
    station0030.platformIndex = 1;

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(2332, 414);
    drawLine0049.endPoint = CGPointMake(2222, 414);
    drawLine0049.width = 33;
    drawLine0049.color = line0003.color;
    [station0030.drawPrimitives addObject:drawLine0049];

    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(2332, 451);
    drawLine0050.endPoint = CGPointMake(2222, 451);
    drawLine0050.width = 31;
    drawLine0050.color = line0003.color;
    [station0030.drawPrimitives addObject:drawLine0050];

    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0001];
    [station0030.drawPrimitives addObject:fillCircle0001];
    [station0030.drawPrimitives addObject:fillCircle0002];

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 1302;
    [edge0021.elements addObject:haul0028];
    
    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(2222.5, 414);
    drawLine0051.endPoint = CGPointMake(2084, 414);
    drawLine0051.width = 33;
    drawLine0051.color = line0003.color;
    [haul0028.drawPrimitives addObject:drawLine0051];
    
    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(2222.5, 451);
    drawLine0052.endPoint = CGPointMake(2084, 451);
    drawLine0052.width = 31;
    drawLine0052.color = line0003.color;
    [haul0028.drawPrimitives addObject:drawLine0052];

    // Добавляем станцию Joana Bezerra
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0021.elements addObject:station0031];
    
    station0031.nameOriginal = @"Joana Bezerra";
    station0031.mapLocation = CGPointMake(2084, 393);
    station0031.geoLocation = CGPointMake(-8.073133, -34.895424);
    station0031.showNameOnMap = NO;
    station0031.platformIndex = 1;
    
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0002];
    [station0031.drawPrimitives addObject:fillCircle0003];
    [station0031.drawPrimitives addObject:fillCircle0004];

    // Добавляем вершину
    edge0021.finishVertex = vertex0002;

    // Создаем участок линии Recife - Cajueiro Seco
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0022 = [[MWEdge alloc] init];
    edge0022.identifier = @"edge0022";
    edge0022.developmentName = @"Ребро: Recife - Cajueiro Seco";
    [self.edges addObject:edge0022];
    
    // Добавляем линию
    edge0022.line = line0003;
    
    // Добавляем вершину
    edge0022.startVertex = vertex0002;

    // Добавляем станцию Joana Bezerra
    [edge0022.elements addObject:station0031];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 1487;
    [edge0022.elements addObject:haul0029];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(2084.5, 414);
    drawLine0053.endPoint = CGPointMake(2003, 414);
    drawLine0053.width = 33;
    drawLine0053.color = line0003.color;
    [haul0029.drawPrimitives addObject:drawLine0053];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(2015, 406);
    drawLine0054.endPoint = CGPointMake(1782, 745);
    drawLine0054.width = 30;
    drawLine0054.color = line0003.color;
    [haul0029.drawPrimitives addObject:drawLine0054];

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(1794, 738);
    drawLine0055.endPoint = CGPointMake(1763, 738);
    drawLine0055.width = 33;
    drawLine0055.color = line0003.color;
    [haul0029.drawPrimitives addObject:drawLine0055];
    
    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(2084.5, 451);
    drawLine0056.endPoint = CGPointMake(2020, 451);
    drawLine0056.width = 31;
    drawLine0056.color = line0003.color;
    [haul0029.drawPrimitives addObject:drawLine0056];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(2032, 444);
    drawLine0057.endPoint = CGPointMake(1796, 786);
    drawLine0057.width = 30;
    drawLine0057.color = line0003.color;
    [haul0029.drawPrimitives addObject:drawLine0057];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(1808, 778);
    drawLine0058.endPoint = CGPointMake(1763, 778);
    drawLine0058.width = 33;
    drawLine0058.color = line0003.color;
    [haul0029.drawPrimitives addObject:drawLine0058];

    // Добавляем станцию Largo da Paz
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0022.elements addObject:station0032];
    
    station0032.nameOriginal = @"Largo da Paz";
    station0032.mapLocation = CGPointMake(1763, 758);
    station0032.geoLocation = CGPointMake(-8.081154, -34.905097);

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0032.nameOriginal;
    drawTextLine0023.fontName = @"HelveticaNeue-Bold";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 36;
    drawTextLine0023.degrees = -45;
    drawTextLine0023.kernSpacing = 1.0;
    drawTextLine0023.origin = CGPointMake(1592, 977);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0023];

    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0032.mapLocation;
    fillCircle0039.radius = 37;
    fillCircle0039.fillColor = [UIColor blueColor];
    [station0032.drawPrimitives addObject:fillCircle0039];
    
    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0032.mapLocation;
    fillCircle0040.radius = 32;
    fillCircle0040.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0040];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 1011;
    [edge0022.elements addObject:haul0030];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(1763.5, 738);
    drawLine0059.endPoint = CGPointMake(1606.5, 738);
    drawLine0059.width = 33;
    drawLine0059.color = line0003.color;
    [haul0030.drawPrimitives addObject:drawLine0059];

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(1763.5, 778);
    drawLine0060.endPoint = CGPointMake(1606.5, 778);
    drawLine0060.width = 33;
    drawLine0060.color = line0003.color;
    [haul0030.drawPrimitives addObject:drawLine0060];

    // Добавляем станцию Imbiribeira
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0022.elements addObject:station0033];
    
    station0033.nameOriginal = @"Imbiribeira";
    station0033.mapLocation = CGPointMake(1606.5, 758);
    station0033.geoLocation = CGPointMake(-8.090043, -34.907544);

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = station0033.nameOriginal;
    drawTextLine0024.fontName = @"HelveticaNeue-Bold";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 36;
    drawTextLine0024.degrees = -45;
    drawTextLine0024.kernSpacing = 0.9;
    drawTextLine0024.origin = CGPointMake(1444, 944);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0024];

    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0033.mapLocation;
    fillCircle0041.radius = 37;
    fillCircle0041.fillColor = [UIColor blueColor];
    [station0033.drawPrimitives addObject:fillCircle0041];
    
    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = station0033.mapLocation;
    fillCircle0042.radius = 32;
    fillCircle0042.fillColor = [UIColor whiteColor];
    [station0033.drawPrimitives addObject:fillCircle0042];

    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 2211;
    [edge0022.elements addObject:haul0031];

    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(1607, 738);
    drawLine0061.endPoint = CGPointMake(1435.5, 738);
    drawLine0061.width = 33;
    drawLine0061.color = line0003.color;
    [haul0031.drawPrimitives addObject:drawLine0061];
    
    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(1607, 778);
    drawLine0062.endPoint = CGPointMake(1435.5, 778);
    drawLine0062.width = 33;
    drawLine0062.color = line0003.color;
    [haul0031.drawPrimitives addObject:drawLine0062];

    // Добавляем станцию Antonio Falcão
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0022.elements addObject:station0034];
    
    station0034.nameOriginal = @"Antonio Falcão";
    station0034.mapLocation = CGPointMake(1435.5, 758);
    station0034.geoLocation = CGPointMake(-8.109968, -34.909047);

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = station0034.nameOriginal;
    drawTextLine0025.fontName = @"HelveticaNeue-Bold";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 36;
    drawTextLine0025.degrees = -45;
    drawTextLine0025.kernSpacing = 0.9;
    drawTextLine0025.origin = CGPointMake(1225.5, 1000.5);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0025];

    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = station0034.mapLocation;
    fillCircle0043.radius = 37;
    fillCircle0043.fillColor = [UIColor blueColor];
    [station0034.drawPrimitives addObject:fillCircle0043];
    
    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0034.mapLocation;
    fillCircle0044.radius = 32;
    fillCircle0044.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0044];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 723;
    [edge0022.elements addObject:haul0032];
    
    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(1436, 738);
    drawLine0063.endPoint = CGPointMake(1264.5, 738);
    drawLine0063.width = 33;
    drawLine0063.color = line0003.color;
    [haul0032.drawPrimitives addObject:drawLine0063];
    
    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(1436, 778);
    drawLine0064.endPoint = CGPointMake(1264.5, 778);
    drawLine0064.width = 33;
    drawLine0064.color = line0003.color;
    [haul0032.drawPrimitives addObject:drawLine0064];

    // Добавляем станцию Shopping
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0022.elements addObject:station0035];
    
    station0035.nameOriginal = @"Shopping";
    station0035.mapLocation = CGPointMake(1264.5, 758);
    station0035.geoLocation = CGPointMake(-8.116107, -34.910544);

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0035.nameOriginal;
    drawTextLine0026.fontName = @"HelveticaNeue-Bold";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 36;
    drawTextLine0026.degrees = -45;
    drawTextLine0026.kernSpacing = 1.4;
    drawTextLine0026.origin = CGPointMake(1123, 933);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0026];

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0035.mapLocation;
    fillCircle0045.radius = 37;
    fillCircle0045.fillColor = [UIColor blueColor];
    [station0035.drawPrimitives addObject:fillCircle0045];
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0035.mapLocation;
    fillCircle0046.radius = 32;
    fillCircle0046.fillColor = [UIColor whiteColor];
    [station0035.drawPrimitives addObject:fillCircle0046];

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 676;
    [edge0022.elements addObject:haul0033];
    
    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(1265, 738);
    drawLine0065.endPoint = CGPointMake(1093.5, 738);
    drawLine0065.width = 33;
    drawLine0065.color = line0003.color;
    [haul0033.drawPrimitives addObject:drawLine0065];
    
    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(1265, 778);
    drawLine0066.endPoint = CGPointMake(1093.5, 778);
    drawLine0066.width = 33;
    drawLine0066.color = line0003.color;
    [haul0033.drawPrimitives addObject:drawLine0066];

    // Добавляем станцию Tancredo Neves
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0022.elements addObject:station0036];
    
    station0036.nameOriginal = @"Tancredo Neves";
    station0036.mapLocation = CGPointMake(1093.5, 758);
    station0036.geoLocation = CGPointMake(-8.122083, -34.911851);

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0036.nameOriginal;
    drawTextLine0027.fontName = @"HelveticaNeue-Bold";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 36;
    drawTextLine0027.degrees = -45;
    drawTextLine0027.kernSpacing = 1.2;
    drawTextLine0027.origin = CGPointMake(859, 1013);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0027];

    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = station0036.mapLocation;
    fillCircle0047.radius = 37;
    fillCircle0047.fillColor = [UIColor blueColor];
    [station0036.drawPrimitives addObject:fillCircle0047];
    
    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = station0036.mapLocation;
    fillCircle0048.radius = 32;
    fillCircle0048.fillColor = [UIColor whiteColor];
    [station0036.drawPrimitives addObject:fillCircle0048];

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 1367;
    [edge0022.elements addObject:haul0034];

    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(1094, 738);
    drawLine0067.endPoint = CGPointMake(923, 738);
    drawLine0067.width = 33;
    drawLine0067.color = line0003.color;
    [haul0034.drawPrimitives addObject:drawLine0067];
    
    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(1094, 778);
    drawLine0068.endPoint = CGPointMake(923, 778);
    drawLine0068.width = 33;
    drawLine0068.color = line0003.color;
    [haul0034.drawPrimitives addObject:drawLine0068];

    // Добавляем станцию Aeroporto
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0022.elements addObject:station0037];
    
    station0037.nameOriginal = @"Aeroporto";
    station0037.mapLocation = CGPointMake(923, 758);
    station0037.geoLocation = CGPointMake(-8.134126, -34.914673);

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = station0037.nameOriginal;
    drawTextLine0028.fontName = @"HelveticaNeue-Bold";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 36;
    drawTextLine0028.degrees = -45;
    drawTextLine0028.kernSpacing = 1.2;
    drawTextLine0028.origin = CGPointMake(774, 936);
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0028];

    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = station0037.mapLocation;
    fillCircle0049.radius = 37;
    fillCircle0049.fillColor = [UIColor blueColor];
    [station0037.drawPrimitives addObject:fillCircle0049];
    
    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = station0037.mapLocation;
    fillCircle0050.radius = 32;
    fillCircle0050.fillColor = [UIColor whiteColor];
    [station0037.drawPrimitives addObject:fillCircle0050];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 1463;
    [edge0022.elements addObject:haul0035];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(923.5, 738);
    drawLine0069.endPoint = CGPointMake(752, 738);
    drawLine0069.width = 33;
    drawLine0069.color = line0003.color;
    [haul0035.drawPrimitives addObject:drawLine0069];
    
    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(923.5, 778);
    drawLine0070.endPoint = CGPointMake(752, 778);
    drawLine0070.width = 33;
    drawLine0070.color = line0003.color;
    [haul0035.drawPrimitives addObject:drawLine0070];

    // Добавляем станцию Porto Larga
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0022.elements addObject:station0038];
    
    station0038.nameOriginal = @"Porto Larga";
    station0038.mapLocation = CGPointMake(752, 758);
    station0038.geoLocation = CGPointMake(-8.147027, -34.917596);

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0038.nameOriginal;
    drawTextLine0029.fontName = @"HelveticaNeue-Bold";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 36;
    drawTextLine0029.degrees = -45;
    drawTextLine0029.kernSpacing = 0.8;
    drawTextLine0029.origin = CGPointMake(584, 957);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0029];

    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = station0038.mapLocation;
    fillCircle0051.radius = 37;
    fillCircle0051.fillColor = [UIColor blueColor];
    [station0038.drawPrimitives addObject:fillCircle0051];
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = station0038.mapLocation;
    fillCircle0052.radius = 32;
    fillCircle0052.fillColor = [UIColor whiteColor];
    [station0038.drawPrimitives addObject:fillCircle0052];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 873;
    [edge0022.elements addObject:haul0036];

    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(752.5, 738);
    drawLine0071.endPoint = CGPointMake(581, 738);
    drawLine0071.width = 33;
    drawLine0071.color = line0003.color;
    [haul0036.drawPrimitives addObject:drawLine0071];
    
    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(752.5, 778);
    drawLine0072.endPoint = CGPointMake(581, 778);
    drawLine0072.width = 33;
    drawLine0072.color = line0003.color;
    [haul0036.drawPrimitives addObject:drawLine0072];

    // Добавляем станцию Monte dos Guararapes
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0022.elements addObject:station0039];
    
    station0039.nameOriginal = @"Monte dos Guararapes";
    station0039.mapLocation = CGPointMake(581, 758);
    station0039.geoLocation = CGPointMake(-8.154384, -34.920153);

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"Monte dos";
    drawTextLine0030.fontName = @"HelveticaNeue-Bold";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 36;
    drawTextLine0030.degrees = -45;
    drawTextLine0030.kernSpacing = 1.0;
    drawTextLine0030.origin = CGPointMake(419, 941);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0030];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"Guararapes";
    drawTextLine0031.fontName = @"HelveticaNeue-Bold";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 36;
    drawTextLine0031.degrees = -45;
    drawTextLine0031.kernSpacing = 1.0;
    drawTextLine0031.origin = CGPointMake(451, 973);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0031];

    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = station0039.mapLocation;
    fillCircle0053.radius = 37;
    fillCircle0053.fillColor = [UIColor blueColor];
    [station0039.drawPrimitives addObject:fillCircle0053];
    
    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = station0039.mapLocation;
    fillCircle0054.radius = 32;
    fillCircle0054.fillColor = [UIColor whiteColor];
    [station0039.drawPrimitives addObject:fillCircle0054];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 1048;
    [edge0022.elements addObject:haul0037];

    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(581.5, 738);
    drawLine0073.endPoint = CGPointMake(410, 738);
    drawLine0073.width = 33;
    drawLine0073.color = line0003.color;
    [haul0037.drawPrimitives addObject:drawLine0073];
    
    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(581.5, 778);
    drawLine0074.endPoint = CGPointMake(410, 778);
    drawLine0074.width = 33;
    drawLine0074.color = line0003.color;
    [haul0037.drawPrimitives addObject:drawLine0074];

    // Добавляем станцию Prazeres
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0022.elements addObject:station0040];
    
    station0040.nameOriginal = @"Prazeres";
    station0040.mapLocation = CGPointMake(410, 758);
    station0040.geoLocation = CGPointMake(-8.161102, -34.926845);

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0040.nameOriginal;
    drawTextLine0032.fontName = @"HelveticaNeue-Bold";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 36;
    drawTextLine0032.degrees = -45;
    drawTextLine0032.kernSpacing = 1.0;
    drawTextLine0032.origin = CGPointMake(282, 919);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0032];

    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = station0040.mapLocation;
    fillCircle0055.radius = 37;
    fillCircle0055.fillColor = [UIColor blueColor];
    [station0040.drawPrimitives addObject:fillCircle0055];
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = station0040.mapLocation;
    fillCircle0056.radius = 32;
    fillCircle0056.fillColor = [UIColor whiteColor];
    [station0040.drawPrimitives addObject:fillCircle0056];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 1143;
    [edge0022.elements addObject:haul0038];

    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(410.5, 738);
    drawLine0075.endPoint = CGPointMake(239.5, 738);
    drawLine0075.width = 33;
    drawLine0075.color = line0003.color;
    [haul0038.drawPrimitives addObject:drawLine0075];
    
    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(410.5, 778);
    drawLine0076.endPoint = CGPointMake(239.5, 778);
    drawLine0076.width = 33;
    drawLine0076.color = line0003.color;
    [haul0038.drawPrimitives addObject:drawLine0076];

    // Добавляем станцию Cajueiro Seco
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0022.elements addObject:station0041];
    
    station0041.nameOriginal = @"Cajueiro Seco";
    station0041.mapLocation = CGPointMake(239.5, 758);
    station0041.geoLocation = CGPointMake(-8.168482, -34.934110);

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0041.nameOriginal;
    drawTextLine0033.fontName = @"HelveticaNeue-Bold";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 36;
    drawTextLine0033.degrees = -45;
    drawTextLine0033.kernSpacing = 1.0;
    drawTextLine0033.origin = CGPointMake(43, 985);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0033];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(240, 738);
    drawLine0077.endPoint = CGPointMake(181, 738);
    drawLine0077.width = 33;
    drawLine0077.color = line0003.color;
    [station0041.drawPrimitives addObject:drawLine0077];
    
    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(240, 778);
    drawLine0078.endPoint = CGPointMake(181, 778);
    drawLine0078.width = 33;
    drawLine0078.color = line0003.color;
    [station0041.drawPrimitives addObject:drawLine0078];

    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = station0041.mapLocation;
    fillCircle0059.radius = 35;
    fillCircle0059.fillColor = [UIColor colorWithRed:(73/255.0) green:(6/255.0) blue:(9/255.0) alpha:1];
    [station0041.drawPrimitives addObject:fillCircle0059];

    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = station0041.mapLocation;
    fillCircle0057.radius = 37;
    fillCircle0057.fillColor = [UIColor blueColor];
    [station0041.drawPrimitives addObject:fillCircle0057];
    
    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = station0041.mapLocation;
    fillCircle0058.radius = 32;
    fillCircle0058.fillColor = [UIColor whiteColor];
    [station0041.drawPrimitives addObject:fillCircle0058];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = @"Destino";
    drawTextLine0034.fontName = @"HelveticaNeue-Bold";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 30;
    drawTextLine0034.kernSpacing = -0.7;
    drawTextLine0034.origin = CGPointMake(90, 791);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0034];
    
    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = @"Cabo";
    drawTextLine0035.fontName = @"HelveticaNeue-Bold";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 30;
    drawTextLine0035.kernSpacing = -0.6;
    drawTextLine0035.origin = CGPointMake(90, 826);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0035];

    // Добавляем вершину
    edge0022.finishVertex = vertex0013;

    return self;
}

@end
