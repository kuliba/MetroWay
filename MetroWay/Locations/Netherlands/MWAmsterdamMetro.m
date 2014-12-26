//
//  MMAmsterdamMetro.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 09.02.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWAmsterdamMetro.h"
#import "MWEdge.h"
#import "MWStation.h"
#import "MWHaul.h"
#import "MWVertex.h"
#import "MWDrawLine.h"
#import "MWDrawArc.h"
#import "MWDrawTextLine.h"
#import "MWDrawGradientRect.h"
#import "MWDrawFillCircle.h"
#import "MWDrawGradientArc.h"
#import "MWDrawRoundedRect.h"

@implementation MWAmsterdamMetro

- (id)init
{
    // Инициализируем
    self = [super init];
    
    self.identifier = @"amsterdam_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 50. Ringlijn
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"50. Ringlijn";
    line0001.color = [UIColor colorWithRed:(37/255.0) green:(154/255.0) blue:(71/255.0) alpha:1];
    [self.lines addObject:line0001];
    
    // 51. Amstelveenlijn
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"51. Amstelveenlijn";
    line0002.color = [UIColor colorWithRed:(245/255.0) green:(128/255.0) blue:(32/255.0) alpha:1];
    [self.lines addObject:line0002];

    // 53. Gaasperplaslijn
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"53. Gaasperplaslijn";
    line0003.color = [UIColor colorWithRed:(239/255.0) green:(64/255.0) blue:(54/255.0) alpha:1];
    [self.lines addObject:line0003];

    // 54. Geinlijn
    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"54. Geinlijn";
    line0004.color = [UIColor colorWithRed:(250/255.0) green:(210/255.0) blue:(19/255.0) alpha:1];
    [self.lines addObject:line0004];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0004];
    [self.drawLinesOrder addObject:line0001];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Isolatorweg
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Isolatorweg";
    [self.vertices addObject:vertex0001];

    // Station Zuid
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Station Zuid";
    [self.vertices addObject:vertex0002];

    // Station RAI
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Station RAI";
    [self.vertices addObject:vertex0003];

    // Overamstel
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Overamstel";
    [self.vertices addObject:vertex0004];

    // Van der Madeweg
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Van der Madeweg";
    [self.vertices addObject:vertex0005];

    // Station Duivendrecht
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Station Duivendrecht";
    [self.vertices addObject:vertex0006];

    // Strandvliet
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Strandvliet";
    [self.vertices addObject:vertex0007];
    
    // Station Bijlmer ArenA
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Station Bijlmer ArenA";
    [self.vertices addObject:vertex0008];
    
    // Bullewijk
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Bullewijk";
    [self.vertices addObject:vertex0009];
    
    // Station Holendrecht
    MWVertex *vertex0010 = [[MWVertex alloc] init];
    vertex0010.identifier = @"vertex0010";
    vertex0010.developmentName = @"Вершина: Station Holendrecht";
    [self.vertices addObject:vertex0010];

    // Reigersbos
    MWVertex *vertex0011 = [[MWVertex alloc] init];
    vertex0011.identifier = @"vertex0011";
    vertex0011.developmentName = @"Вершина: Reigersbos";
    [self.vertices addObject:vertex0011];

    // Gein
    MWVertex *vertex0012 = [[MWVertex alloc] init];
    vertex0012.identifier = @"vertex0012";
    vertex0012.developmentName = @"Вершина: Gein";
    [self.vertices addObject:vertex0012];

    // Centraal Station
    MWVertex *vertex0013 = [[MWVertex alloc] init];
    vertex0013.identifier = @"vertex0013";
    vertex0013.developmentName = @"Вершина: Centraal Station";
    [self.vertices addObject:vertex0013];

    // Nieuwmarkt
    MWVertex *vertex0014 = [[MWVertex alloc] init];
    vertex0014.identifier = @"vertex0014";
    vertex0014.developmentName = @"Вершина: Nieuwmarkt";
    [self.vertices addObject:vertex0014];
    
    // Waterlooplein
    MWVertex *vertex0015 = [[MWVertex alloc] init];
    vertex0015.identifier = @"vertex0015";
    vertex0015.developmentName = @"Вершина: Waterlooplein";
    [self.vertices addObject:vertex0015];
    
    // Weesperplein
    MWVertex *vertex0016 = [[MWVertex alloc] init];
    vertex0016.identifier = @"vertex0016";
    vertex0016.developmentName = @"Вершина: Weesperplein";
    [self.vertices addObject:vertex0016];
    
    // Wibautstraat
    MWVertex *vertex0017 = [[MWVertex alloc] init];
    vertex0017.identifier = @"vertex0017";
    vertex0017.developmentName = @"Вершина: Wibautstraat";
    [self.vertices addObject:vertex0017];

    // Amstelstation
    MWVertex *vertex0018 = [[MWVertex alloc] init];
    vertex0018.identifier = @"vertex0018";
    vertex0018.developmentName = @"Вершина: Amstelstation";
    [self.vertices addObject:vertex0018];

    // Spaklerweg
    MWVertex *vertex0019 = [[MWVertex alloc] init];
    vertex0019.identifier = @"vertex0019";
    vertex0019.developmentName = @"Вершина: Spaklerweg";
    [self.vertices addObject:vertex0019];

    // Westwijk
    MWVertex *vertex0020 = [[MWVertex alloc] init];
    vertex0020.identifier = @"vertex0020";
    vertex0020.developmentName = @"Вершина: Westwijk";
    [self.vertices addObject:vertex0020];

    // Gaasperplas
    MWVertex *vertex0021 = [[MWVertex alloc] init];
    vertex0021.identifier = @"vertex0021";
    vertex0021.developmentName = @"Вершина: Gaasperplas";
    [self.vertices addObject:vertex0021];

    ////////////////////////////////////////////////////////////////
    // 50. Ringlijn
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Isolatorweg" до "Station Zuid"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Isolatorweg - Station Zuid";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию "Isolatorweg"
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Isolatorweg";
    station0001.mapLocation = CGPointMake(608.5, 267.5);
    station0001.geoLocation = CGPointMake(52.395184, 4.850496);
    
    MWDrawRoundedRect *roundedRect0001 = [[MWDrawRoundedRect alloc] init];
    roundedRect0001.rect = CGRectMake(638, 245, 63, 46);
    roundedRect0001.cornerRadius = 15;
    roundedRect0001.color = line0001.color;
    [station0001.drawPrimitives addObject:roundedRect0001];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = @"50";
    drawTextLine0063.fontName = @"HelveticaNeue-Bold";
    drawTextLine0063.fontColor = [UIColor whiteColor];
    drawTextLine0063.fontSize = 34;
    drawTextLine0063.origin = CGPointMake(651, 246);
    [station0001.drawPrimitives addObject:drawTextLine0063];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(627.5, 267.5);
    drawLine0001.endPoint = CGPointMake(608.5, 267.5);
    drawLine0001.width = 29;
    drawLine0001.color = line0001.color;
    [station0001.drawPrimitives addObject:drawLine0001];
    
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(608.5, 267.5);
    fillCircle0001.radius = 6.5;
    fillCircle0001.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0001];
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 34;
    drawTextLine0001.kernSpacing = 2.2;
    drawTextLine0001.origin = CGPointMake(510, 203);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];
    
    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1265;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(609, 267.5);
    drawLine0002.endPoint = CGPointMake(484, 267.5);
    drawLine0002.width = 29;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];
    
    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(484, 296.5);
    drawArc0001.startRadians = 180 * M_PI / 180;
    drawArc0001.endRadians = 270 * M_PI / 180;
    drawArc0001.radius = 29;
    drawArc0001.width = 29;
    drawArc0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(455, 296);
    drawLine0003.endPoint = CGPointMake(455, 391.5);
    drawLine0003.width = 29;
    drawLine0003.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию "Station Sloterdijk"
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Station Sloterdijk";
    station0002.mapLocation = CGPointMake(455, 391.5);
    station0002.geoLocation = CGPointMake(52.389051, 4.838882);

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = CGPointMake(455, 391.5);
    fillCircle0002.radius = 6.5;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0002];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0002.nameOriginal;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 34;
    drawTextLine0002.kernSpacing = 2.2;
    drawTextLine0002.origin = CGPointMake(132, 371);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0002];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1043;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(455, 391);
    drawLine0004.endPoint = CGPointMake(455, 513.5);
    drawLine0004.width = 29;
    drawLine0004.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию "De Vlugtlaan"
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"De Vlugtlaan";
    station0003.mapLocation = CGPointMake(455, 513.5);
    station0003.geoLocation = CGPointMake(52.379723, 4.838239);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = CGPointMake(455, 513.5);
    fillCircle0003.radius = 6.5;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0003];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0003.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 34;
    drawTextLine0003.kernSpacing = 2.2;
    drawTextLine0003.origin = CGPointMake(212, 493);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0003];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 867;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(455, 513);
    drawLine0005.endPoint = CGPointMake(455, 626.5);
    drawLine0005.width = 29;
    drawLine0005.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0005];
    
    // Добавляем станцию "Jan van Galenstraat"
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Jan van Galenstraat";
    station0004.mapLocation = CGPointMake(455, 626.5);
    station0004.geoLocation = CGPointMake(52.372596, 4.835179);

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = CGPointMake(455, 626.5);
    fillCircle0004.radius = 6.5;
    fillCircle0004.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0004.nameOriginal;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 34;
    drawTextLine0004.kernSpacing = 2.2;
    drawTextLine0004.origin = CGPointMake(85, 605);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0004];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 825;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(455, 626);
    drawLine0006.endPoint = CGPointMake(455, 740);
    drawLine0006.width = 29;
    drawLine0006.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию "Postjesweg"
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"Postjesweg";
    station0005.mapLocation = CGPointMake(455, 740);
    station0005.geoLocation = CGPointMake(52.364886, 4.833905);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = CGPointMake(455, 740);
    fillCircle0005.radius = 6.5;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0005];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0005.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 34;
    drawTextLine0005.kernSpacing = 2.2;
    drawTextLine0005.origin = CGPointMake(233, 717.5);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0005];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 773;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(455, 739.5);
    drawLine0007.endPoint = CGPointMake(455, 853.5);
    drawLine0007.width = 29;
    drawLine0007.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию "Station Lelylaan"
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Station Lelylaan";
    station0006.mapLocation = CGPointMake(455, 853.5);
    station0006.geoLocation = CGPointMake(52.357891, 4.834365);

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = CGPointMake(455, 853.5);
    fillCircle0006.radius = 6.5;
    fillCircle0006.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0006.nameOriginal;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 34;
    drawTextLine0006.kernSpacing = 2.2;
    drawTextLine0006.origin = CGPointMake(154, 828);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 562;      
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(455, 853);
    drawLine0008.endPoint = CGPointMake(455, 966.5);
    drawLine0008.width = 29;
    drawLine0008.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию "Heemstedestraat"
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"Heemstedestraat";
    station0007.mapLocation = CGPointMake(455, 966.5);
    station0007.geoLocation = CGPointMake(52.352858, 4.834307);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = CGPointMake(455, 966.5);
    fillCircle0007.radius = 6.5;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0007];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0007.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 34;
    drawTextLine0007.kernSpacing = 2.2;
    drawTextLine0007.origin = CGPointMake(136, 940);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0007];
    
    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 700;
    [edge0001.elements addObject:haul0007];
    
    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(455, 966);
    drawLine0009.endPoint = CGPointMake(455, 1072);
    drawLine0009.width = 29;
    drawLine0009.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0009];
    
    // Добавляем станцию "Henk Sneevlietweg"
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"Henk Sneevlietweg";
    station0008.mapLocation = CGPointMake(455, 1072);
    station0008.geoLocation = CGPointMake(52.346558, 4.834407);

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = CGPointMake(455, 1072);
    fillCircle0008.radius = 6.5;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0008.nameOriginal;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 34;
    drawTextLine0008.kernSpacing = 2.2;
    drawTextLine0008.origin = CGPointMake(103, 1052);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 2299;
    [edge0001.elements addObject:haul0008];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(455, 1071.5);
    drawLine0010.endPoint = CGPointMake(455, 1183);
    drawLine0010.width = 29;
    drawLine0010.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0010];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(484, 1182.5);
    drawArc0002.startRadians = 90 * M_PI / 180;
    drawArc0002.endRadians = 180 * M_PI / 180;
    drawArc0002.radius = 29;
    drawArc0002.width = 29;
    drawArc0002.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawArc0002];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(484, 1211.5);
    drawLine0011.endPoint = CGPointMake(518.5, 1211.5);
    drawLine0011.width = 29;
    drawLine0011.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0011];

    // Добавляем станцию "Amstelveenseweg"
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"Amstelveenseweg";
    station0009.mapLocation = CGPointMake(518.5, 1211.5);
    station0009.geoLocation = CGPointMake(52.338403, 4.857665);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = CGPointMake(518.5, 1211.5);
    fillCircle0009.radius = 6.5;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0009];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0009.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 34;
    drawTextLine0009.kernSpacing = 2.2;
    drawTextLine0009.origin = CGPointMake(357, 1236.5);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0009];
    
    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 1139;
    [edge0001.elements addObject:haul0009];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(700, 1211.5);
    drawLine0040.endPoint = CGPointMake(765.5, 1211.5);
    drawLine0040.width = 31;
    drawLine0040.color = [UIColor whiteColor];
    [haul0009.drawPrimitives addObject:drawLine0040];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(518, 1211.5);
    drawLine0012.endPoint = CGPointMake(805.5, 1211.5);
    drawLine0012.width = 29;
    drawLine0012.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию "Station Zuid"
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0001.elements addObject:station0010];
    
    station0010.nameOriginal = @"Station Zuid";
    station0010.mapLocation = CGPointMake(805.5, 1211.5);
    station0010.geoLocation = CGPointMake(52.339105, 4.874393);
    station0010.platformIndex = 1;

    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = CGPointMake(805.5, 1211.5);
    fillCircle0010.radius = 6.5;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = @"Station";
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 34;
    drawTextLine0010.kernSpacing = 2.2;
    drawTextLine0010.origin = CGPointMake(747, 1035);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0010];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = @"Zuid";
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 34;
    drawTextLine0011.kernSpacing = 2.2;
    drawTextLine0011.origin = CGPointMake(768, 1079.5);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0011];
    
    // Добавляем вершину
    edge0001.finishVertex = vertex0002;
    
    // Создаем участок линии от "Station Zuid" до "Station RAI"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Station Zuid - Station RAI";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;
    
    // Добавляем станцию "Station Zuid"
    [edge0002.elements addObject:station0010];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1081;
    [edge0002.elements addObject:haul0010];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(805, 1211.5);
    drawLine0013.endPoint = CGPointMake(959, 1211.5);
    drawLine0013.width = 29;
    drawLine0013.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0013];
    
    // Добавляем станцию "Station RAI"
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0002.elements addObject:station0011];
    
    station0011.nameOriginal = @"Station RAI";
    station0011.mapLocation = CGPointMake(959, 1211.5);
    station0011.geoLocation = CGPointMake(52.336781, 4.890738);
    station0011.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = CGPointMake(959, 1211.5);
    fillCircle0011.radius = 6.5;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0011];
    
    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = @"Station";
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 34;
    drawTextLine0012.kernSpacing = 2.2;
    drawTextLine0012.origin = CGPointMake(900, 1236.5);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0012];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = @"RAI";
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 34;
    drawTextLine0013.kernSpacing = 2.2;
    drawTextLine0013.origin = CGPointMake(930.5, 1280);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0013];

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;
    
    // Создаем участок линии от "Station RAI" до "Overamstel"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Station RAI - Overamstel";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;
    
    // Добавляем станцию "Station RAI"
    [edge0003.elements addObject:station0011];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 2256;
    [edge0003.elements addObject:haul0011];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(958.5, 1211.5);
    drawLine0014.endPoint = CGPointMake(1112.5, 1211.5);
    drawLine0014.width = 29;
    drawLine0014.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0014];
    
    // Добавляем станцию "Overamstel"
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0003.elements addObject:station0012];
    
    station0012.nameOriginal = @"Overamstel";
    station0012.mapLocation = CGPointMake(1112.5, 1211.5);
    station0012.geoLocation = CGPointMake(52.331850, 4.918032);
    station0012.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = CGPointMake(1112.5, 1211.5);
    fillCircle0012.radius = 6.5;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0012];
    
    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = @"Over-";
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 34;
    drawTextLine0014.kernSpacing = 2.2;
    drawTextLine0014.origin = CGPointMake(1068, 1236.5);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0014];
    
    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = @"amstel";
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 34;
    drawTextLine0015.kernSpacing = 2.2;
    drawTextLine0015.origin = CGPointMake(1058, 1280);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0015];
    
    // Добавляем вершину
    edge0003.finishVertex = vertex0004;
    
    // Создаем участок линии от "Overamstel" до "Van der Madeweg"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Overamstel - Van der Madeweg";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0001;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0004;
    
    // Добавляем станцию "Overamstel"
    [edge0004.elements addObject:station0012];
    
    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1128;
    [edge0004.elements addObject:haul0012];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(1112, 1211.5);
    drawLine0015.endPoint = CGPointMake(1186, 1211.5);
    drawLine0015.width = 29;
    drawLine0015.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0015];
    
    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(1185.5, 1240.5);
    drawArc0003.startRadians = 270 * M_PI / 180;
    drawArc0003.endRadians = 0 * M_PI / 180;
    drawArc0003.radius = 29;
    drawArc0003.width = 29;
    drawArc0003.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(1214.5, 1240);
    drawLine0016.endPoint = CGPointMake(1214.5, 1314.5);
    drawLine0016.width = 29;
    drawLine0016.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию "Van der Madeweg"
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0004.elements addObject:station0013];
    
    station0013.nameOriginal = @"Van der Madeweg";
    station0013.mapLocation = CGPointMake(1214.5, 1314.5);
    station0013.geoLocation = CGPointMake(52.329829, 4.930147);
    station0013.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = CGPointMake(1214.5, 1314.5);
    fillCircle0013.radius = 6.5;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0013];
    
    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = @"Van der";
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 34;
    drawTextLine0016.kernSpacing = 2.2;
    drawTextLine0016.origin = CGPointMake(1312, 1269);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0016];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = @"Madeweg";
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 34;
    drawTextLine0017.kernSpacing = 2.2;
    drawTextLine0017.origin = CGPointMake(1312, 1314);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0017];

    // Добавляем вершину
    edge0004.finishVertex = vertex0005;

    // Создаем участок линии от "Van der Madeweg" до "Station Duivendrecht"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Van der Madeweg - Station Duivendrecht";
    [self.edges addObject:edge0005];
    
    // Добавляем линию
    edge0005.line = line0001;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0005;
    
    // Добавляем станцию "Van der Madeweg"
    [edge0005.elements addObject:station0013];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 799;
    [edge0005.elements addObject:haul0013];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(1214.5, 1314);
    drawLine0017.endPoint = CGPointMake(1214.5, 1456);
    drawLine0017.width = 29;
    drawLine0017.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0017];
    
    // Добавляем станцию "Station Duivendrecht"
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0005.elements addObject:station0014];
    
    station0014.nameOriginal = @"Station Duivendrecht";
    station0014.mapLocation = CGPointMake(1214.5, 1456);
    station0014.geoLocation = CGPointMake(52.323587, 4.936543);
    station0014.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = CGPointMake(1214.5, 1456);
    fillCircle0014.radius = 6.5;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0014];
    
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = @"Station";
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 34;
    drawTextLine0018.kernSpacing = 2.2;
    drawTextLine0018.origin = CGPointMake(1061, 1410);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0018];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = @"Duivendrecht";
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 34;
    drawTextLine0019.kernSpacing = 2.2;
    drawTextLine0019.origin = CGPointMake(954, 1455);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0019];

    // Добавляем вершину
    edge0005.finishVertex = vertex0006;

    // Создаем участок линии от "Station Duivendrecht" до "Strandvliet"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Station Duivendrecht - Strandvliet";
    [self.edges addObject:edge0006];
    
    // Добавляем линию
    edge0006.line = line0001;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0006;

    // Добавляем станцию "Station Duivendrecht"
    [edge0006.elements addObject:station0014];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 665;
    [edge0006.elements addObject:haul0014];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(1214.5, 1455.5);
    drawLine0018.endPoint = CGPointMake(1214.5, 1597);
    drawLine0018.width = 29;
    drawLine0018.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0018];
    
    // Добавляем станцию "Strandvliet"
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0006.elements addObject:station0015];
    
    station0015.nameOriginal = @"Strandvliet";
    station0015.mapLocation = CGPointMake(1214.5, 1597);
    station0015.geoLocation = CGPointMake(52.318626, 4.941335);
    station0015.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = CGPointMake(1214.5, 1597);
    fillCircle0015.radius = 6.5;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0015];
    
    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0015.nameOriginal;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 34;
    drawTextLine0020.kernSpacing = 2.2;
    drawTextLine0020.origin = CGPointMake(1281, 1576.5);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0020];

    // Добавляем вершину
    edge0006.finishVertex = vertex0007;
    
    // Создаем участок линии от "Strandvliet" до "Station Bijlmer ArenA"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Strandvliet - Station Bijlmer ArenA";
    [self.edges addObject:edge0007];
    
    // Добавляем линию
    edge0007.line = line0001;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0007;
    
    // Добавляем станцию "Strandvliet"
    [edge0007.elements addObject:station0015];
    
    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 781;
    [edge0007.elements addObject:haul0015];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(1214.5, 1596.5);
    drawLine0019.endPoint = CGPointMake(1214.5, 1738.5);
    drawLine0019.width = 29;
    drawLine0019.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0019];

    // Добавляем станцию "Station Bijlmer ArenA"
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0007.elements addObject:station0016];
    
    station0016.nameOriginal = @"Station Bijlmer ArenA";
    station0016.mapLocation = CGPointMake(1214.5, 1738.5);
    station0016.geoLocation = CGPointMake(52.312066, 4.947399);
    station0016.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = CGPointMake(1214.5, 1738.5);
    fillCircle0016.radius = 6.5;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = @"Station";
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 34;
    drawTextLine0021.kernSpacing = 2.2;
    drawTextLine0021.origin = CGPointMake(1281, 1693);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0021];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = @"Bijlmer ArenA";
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 34;
    drawTextLine0022.kernSpacing = 2.2;
    drawTextLine0022.origin = CGPointMake(1281, 1737.5);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0022];

    // Добавляем вершину
    edge0007.finishVertex = vertex0008;
    
    // Создаем участок линии от "Station Bijlmer ArenA" до "Bullewijk"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Station Bijlmer ArenA - Bullewijk";
    [self.edges addObject:edge0008];
    
    // Добавляем линию
    edge0008.line = line0001;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0008;
    
    // Добавляем станцию "Station Bijlmer ArenA"
    [edge0008.elements addObject:station0016];
    
    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 725;
    [edge0008.elements addObject:haul0016];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(1214.5, 1738);
    drawLine0020.endPoint = CGPointMake(1214.5, 1879.5);
    drawLine0020.width = 29;
    drawLine0020.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0020];

    // Добавляем станцию "Bullewijk"
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0008.elements addObject:station0017];
    
    station0017.nameOriginal = @"Bullewijk";
    station0017.mapLocation = CGPointMake(1214.5, 1879.5);
    station0017.geoLocation = CGPointMake(52.306655, 4.952251);
    station0017.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = CGPointMake(1214.5, 1879.5);
    fillCircle0017.radius = 6.5;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0017.drawPrimitives addObject:fillCircle0017];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0017.nameOriginal;
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 34;
    drawTextLine0023.kernSpacing = 2.2;
    drawTextLine0023.origin = CGPointMake(1281, 1859.5);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0023];
    
    // Добавляем вершину
    edge0008.finishVertex = vertex0009;
    
    // Создаем участок линии от "Bullewijk" до "Station Holendrecht"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: Bullewijk - Station Holendrecht";
    [self.edges addObject:edge0009];
    
    // Добавляем линию
    edge0009.line = line0001;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0009;
    
    // Добавляем станцию "Bullewijk"
    [edge0009.elements addObject:station0017];
    
    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 1092;
    [edge0009.elements addObject:haul0017];
    
    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(1214.5, 1879);
    drawLine0021.endPoint = CGPointMake(1214.5, 2020.5);
    drawLine0021.width = 29;
    drawLine0021.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0021];
    
    // Добавляем станцию "Station Holendrecht"
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0009.elements addObject:station0018];
    
    station0018.nameOriginal = @"Station Holendrecht";
    station0018.mapLocation = CGPointMake(1214.5, 2020.5);
    station0018.geoLocation = CGPointMake(52.298392, 4.959815);
    station0018.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = CGPointMake(1214.5, 2020.5);
    fillCircle0018.radius = 6.5;
    fillCircle0018.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0018];
    
    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"Station";
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 34;
    drawTextLine0024.kernSpacing = 2.2;
    drawTextLine0024.origin = CGPointMake(1281, 1975);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"Holendrecht";
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 34;
    drawTextLine0025.kernSpacing = 2.2;
    drawTextLine0025.origin = CGPointMake(1281, 2020);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0025];

    // Добавляем вершину
    edge0009.finishVertex = vertex0010;

    // Создаем участок линии от "Station Holendrecht" до "Reigersbos"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Station Holendrecht - Reigersbos";
    [self.edges addObject:edge0010];
    
    // Добавляем линию
    edge0010.line = line0001;
    
    // Добавляем вершину
    edge0010.startVertex = vertex0010;
    
    // Добавляем станцию "Station Holendrecht"
    [edge0010.elements addObject:station0018];
    
    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1194;
    [edge0010.elements addObject:haul0018];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(1214.5, 2020);
    drawLine0022.endPoint = CGPointMake(1214.5, 2082);
    drawLine0022.width = 29;
    drawLine0022.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0022];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(1279.5, 2081.5);
    drawArc0004.startRadians = 90 * M_PI / 180;
    drawArc0004.endRadians = 180 * M_PI / 180;
    drawArc0004.radius = 65;
    drawArc0004.width = 29;
    drawArc0004.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(1279, 2146.5);
    drawLine0023.endPoint = CGPointMake(1398, 2146.5);
    drawLine0023.width = 29;
    drawLine0023.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0023];

    // Добавляем станцию "Reigersbos"
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0010.elements addObject:station0019];
    
    station0019.nameOriginal = @"Reigersbos";
    station0019.mapLocation = CGPointMake(1398, 2146.5);
    station0019.geoLocation = CGPointMake(52.295629, 4.974171);
    station0019.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = CGPointMake(1398, 2146.5);
    fillCircle0019.radius = 6.5;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0019];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0019.nameOriginal;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 34;
    drawTextLine0026.kernSpacing = 2.2;
    drawTextLine0026.origin = CGPointMake(1302.5, 2168.5);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0026];

    // Добавляем вершину
    edge0010.finishVertex = vertex0011;

    // Создаем участок линии от "Reigersbos" до "Gein"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0011 = [[MWEdge alloc] init];
    edge0011.identifier = @"edge0011";
    edge0011.developmentName = @"Ребро: Reigersbos - Gein";
    [self.edges addObject:edge0011];
    
    // Добавляем линию
    edge0011.line = line0001;
    
    // Добавляем вершину
    edge0011.startVertex = vertex0011;
    
    // Добавляем станцию "Reigersbos"
    [edge0011.elements addObject:station0019];
    
    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1024;
    [edge0011.elements addObject:haul0019];
    
    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(1397.5, 2146.5);
    drawLine0024.endPoint = CGPointMake(1621, 2146.5);
    drawLine0024.width = 29;
    drawLine0024.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0024];
    
    // Добавляем станцию "Gein"
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0011.elements addObject:station0020];
    
    station0020.nameOriginal = @"Gein";
    station0020.mapLocation = CGPointMake(1621, 2146.5);
    station0020.geoLocation = CGPointMake(52.296340, 4.989370);
    station0020.platformIndex = 1;
    
    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0020.nameOriginal;
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 34;
    drawTextLine0027.kernSpacing = 2.2;
    drawTextLine0027.origin = CGPointMake(1582.5, 2168.5);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0027];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(1620.5, 2146.5);
    drawLine0025.endPoint = CGPointMake(1638, 2146.5);
    drawLine0025.width = 29;
    drawLine0025.color = line0001.color;
    [station0020.drawPrimitives addObject:drawLine0025];

    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = CGPointMake(1621, 2146.5);
    fillCircle0020.radius = 6.5;
    fillCircle0020.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0020];

    MWDrawRoundedRect *roundedRect0002 = [[MWDrawRoundedRect alloc] init];
    roundedRect0002.rect = CGRectMake(1648.5, 2132, 63, 46);
    roundedRect0002.cornerRadius = 15;
    roundedRect0002.color = line0001.color;
    [station0020.drawPrimitives addObject:roundedRect0002];
    
    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = @"50";
    drawTextLine0064.fontName = @"HelveticaNeue-Bold";
    drawTextLine0064.fontColor = [UIColor whiteColor];
    drawTextLine0064.fontSize = 34;
    drawTextLine0064.origin = CGPointMake(1662, 2133);
    [station0020.drawPrimitives addObject:drawTextLine0064];

    // Добавляем вершину
    edge0011.finishVertex = vertex0012;

    ////////////////////////////////////////////////////////////////
    // 51. Amstelveenlijn
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Centraal Station" до "Nieuwmarkt"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0012 = [[MWEdge alloc] init];
    edge0012.identifier = @"edge0012";
    edge0012.developmentName = @"Ребро: Centraal Station - Nieuwmarkt";
    [self.edges addObject:edge0012];
    
    // Добавляем линию
    edge0012.line = line0002;
    
    // Добавляем вершину
    edge0012.startVertex = vertex0013;
    
    // Добавляем станцию "Centraal Station"
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0012.elements addObject:station0021];
    
    station0021.nameOriginal = @"Centraal Station";
    station0021.mapLocation = CGPointMake(1157.5, 415);
    station0021.geoLocation = CGPointMake(52.377376, 4.900784);
    station0021.platformIndex = 1;
    
    MWDrawRoundedRect *roundedRect0003 = [[MWDrawRoundedRect alloc] init];
    roundedRect0003.rect = CGRectMake(945, 316, 63, 46);
    roundedRect0003.cornerRadius = 15;
    roundedRect0003.color = line0002.color;
    [station0021.drawPrimitives addObject:roundedRect0003];
    
    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = @"51";
    drawTextLine0065.fontName = @"HelveticaNeue-Bold";
    drawTextLine0065.fontColor = [UIColor whiteColor];
    drawTextLine0065.fontSize = 34;
    drawTextLine0065.origin = CGPointMake(958.5, 317);
    [station0021.drawPrimitives addObject:drawTextLine0065];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(1146.5, 404);
    drawLine0026.endPoint = CGPointMake(1157.5, 415);
    drawLine0026.width = 29;
    drawLine0026.color = line0002.color;
    [station0021.drawPrimitives addObject:drawLine0026];
    
    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = CGPointMake(1157.5, 415);
    fillCircle0021.radius = 6.5;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0021];
    
    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = station0021.nameOriginal;
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 34;
    drawTextLine0028.kernSpacing = 2.2;
    drawTextLine0028.origin = CGPointMake(1223, 325);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0028];
    
    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 731;
    [edge0012.elements addObject:haul0020];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(1157.5, 415);
    drawLine0027.endPoint = CGPointMake(1197.5, 455);
    drawLine0027.width = 29;
    drawLine0027.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0027];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(1154.5, 497);
    drawArc0005.startRadians = 315 * M_PI / 180;
    drawArc0005.endRadians = 0 * M_PI / 180;
    drawArc0005.radius = 60;
    drawArc0005.width = 29;
    drawArc0005.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(1214.5, 497);
    drawLine0028.endPoint = CGPointMake(1214.5, 513.5);
    drawLine0028.width = 29;
    drawLine0028.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0028];
    
    // Добавляем станцию "Nieuwmarkt"
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0012.elements addObject:station0022];
    
    station0022.nameOriginal = @"Nieuwmarkt";
    station0022.mapLocation = CGPointMake(1214.5, 513.5);
    station0022.geoLocation = CGPointMake(52.371941, 4.901236);
    station0022.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = CGPointMake(1214.5, 513.5);
    fillCircle0022.radius = 6.5;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0022.drawPrimitives addObject:fillCircle0022];
    
    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0022.nameOriginal;
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 34;
    drawTextLine0029.kernSpacing = 2.2;
    drawTextLine0029.origin = CGPointMake(1311, 493);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0029];

    // Добавляем вершину
    edge0012.finishVertex = vertex0014;

    // Создаем участок линии от "Nieuwmarkt" до "Waterlooplein"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0013 = [[MWEdge alloc] init];
    edge0013.identifier = @"edge0013";
    edge0013.developmentName = @"Ребро: Nieuwmarkt - Waterlooplein";
    [self.edges addObject:edge0013];
    
    // Добавляем линию
    edge0013.line = line0002;
    
    // Добавляем вершину
    edge0013.startVertex = vertex0014;
    
    // Добавляем станцию "Nieuwmarkt"
    [edge0013.elements addObject:station0022];
    
    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 485;
    [edge0013.elements addObject:haul0021];
    
    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(1214.5, 513);
    drawLine0029.endPoint = CGPointMake(1214.5, 627);
    drawLine0029.width = 29;
    drawLine0029.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawLine0029];
    
    // Добавляем станцию "Waterlooplein"
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0013.elements addObject:station0023];
    
    station0023.nameOriginal = @"Waterlooplein";
    station0023.mapLocation = CGPointMake(1214.5, 627);
    station0023.geoLocation = CGPointMake(52.366979, 4.902981);
    station0023.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = CGPointMake(1214.5, 627);
    fillCircle0023.radius = 6.5;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0023.drawPrimitives addObject:fillCircle0023];
    
    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = station0023.nameOriginal;
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 34;
    drawTextLine0030.kernSpacing = 2.2;
    drawTextLine0030.origin = CGPointMake(1311, 607);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0030];
    
    // Добавляем вершину
    edge0013.finishVertex = vertex0015;

    // Создаем участок линии от "Waterlooplein" до "Weesperplein"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0014 = [[MWEdge alloc] init];
    edge0014.identifier = @"edge0014";
    edge0014.developmentName = @"Ребро: Waterlooplein - Weesperplein";
    [self.edges addObject:edge0014];
    
    // Добавляем линию
    edge0014.line = line0002;
    
    // Добавляем вершину
    edge0014.startVertex = vertex0015;
    
    // Добавляем станцию "Waterlooplein"
    [edge0014.elements addObject:station0023];
    
    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 870;
    [edge0014.elements addObject:haul0022];
    
    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(1214.5, 626.5);
    drawLine0030.endPoint = CGPointMake(1214.5, 740);
    drawLine0030.width = 29;
    drawLine0030.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0030];

    // Добавляем станцию "Weesperplein"
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0014.elements addObject:station0024];
    
    station0024.nameOriginal = @"Weesperplein";
    station0024.mapLocation = CGPointMake(1214.5, 740);
    station0024.geoLocation = CGPointMake(52.361218, 4.907959);
    station0024.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = CGPointMake(1214.5, 740);
    fillCircle0024.radius = 6.5;
    fillCircle0024.fillColor = [UIColor whiteColor];
    [station0024.drawPrimitives addObject:fillCircle0024];
    
    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = station0024.nameOriginal;
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 34;
    drawTextLine0031.kernSpacing = 2.2;
    drawTextLine0031.origin = CGPointMake(1311, 720);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0031];

    // Добавляем вершину
    edge0014.finishVertex = vertex0016;

    // Создаем участок линии от "Weesperplein" до "Wibautstraat"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0015 = [[MWEdge alloc] init];
    edge0015.identifier = @"edge0015";
    edge0015.developmentName = @"Ребро: Weesperplein - Wibautstraat";
    [self.edges addObject:edge0015];
    
    // Добавляем линию
    edge0015.line = line0002;
    
    // Добавляем вершину
    edge0015.startVertex = vertex0016;
    
    // Добавляем станцию "Weesperplein"
    [edge0015.elements addObject:station0024];
    
    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 821;
    [edge0015.elements addObject:haul0023];
    
    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(1214.5, 739.5);
    drawLine0031.endPoint = CGPointMake(1214.5, 853.5);
    drawLine0031.width = 29;
    drawLine0031.color = line0002.color;
    [haul0023.drawPrimitives addObject:drawLine0031];

    // Добавляем станцию "Wibautstraat"
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0015.elements addObject:station0025];
    
    station0025.nameOriginal = @"Wibautstraat";
    station0025.mapLocation = CGPointMake(1214.5, 853.5);
    station0025.geoLocation = CGPointMake(52.354320, 4.912136);
    station0025.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = CGPointMake(1214.5, 853.5);
    fillCircle0025.radius = 6.5;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [station0025.drawPrimitives addObject:fillCircle0025];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0025.nameOriginal;
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 34;
    drawTextLine0032.kernSpacing = 2.2;
    drawTextLine0032.origin = CGPointMake(1311, 833.5);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0032];

    // Добавляем вершину
    edge0015.finishVertex = vertex0017;

    // Создаем участок линии от "Wibautstraat" до "Amstelstation"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0016 = [[MWEdge alloc] init];
    edge0016.identifier = @"edge0016";
    edge0016.developmentName = @"Ребро: Wibautstraat - Amstelstation";
    [self.edges addObject:edge0016];
    
    // Добавляем линию
    edge0016.line = line0002;
    
    // Добавляем вершину
    edge0016.startVertex = vertex0017;
    
    // Добавляем станцию "Wibautstraat"
    [edge0016.elements addObject:station0025];
    
    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 954;
    [edge0016.elements addObject:haul0024];
    
    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(1214.5, 853);
    drawLine0032.endPoint = CGPointMake(1214.5, 966.5);
    drawLine0032.width = 29;
    drawLine0032.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0032];

    // Добавляем станцию "Amstelstation"
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0016.elements addObject:station0026];
    
    station0026.nameOriginal = @"Amstelstation";
    station0026.mapLocation = CGPointMake(1214.5, 966.5);
    station0026.geoLocation = CGPointMake(52.346139, 4.917759);
    station0026.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = CGPointMake(1214.5, 966.5);
    fillCircle0026.radius = 6.5;
    fillCircle0026.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0026];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0026.nameOriginal;
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 34;
    drawTextLine0033.kernSpacing = 2.2;
    drawTextLine0033.origin = CGPointMake(1311, 946.5);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0033];

    // Добавляем вершину
    edge0016.finishVertex = vertex0018;

    // Создаем участок линии от "Amstelstation" до "Spaklerweg"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0017 = [[MWEdge alloc] init];
    edge0017.identifier = @"edge0017";
    edge0017.developmentName = @"Ребро: Amstelstation - Spaklerweg";
    [self.edges addObject:edge0017];
    
    // Добавляем линию
    edge0017.line = line0002;
    
    // Добавляем вершину
    edge0017.startVertex = vertex0018;
    
    // Добавляем станцию "Amstelstation"
    [edge0017.elements addObject:station0026];
    
    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 755;
    [edge0017.elements addObject:haul0025];
    
    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(1214.5, 966);
    drawLine0033.endPoint = CGPointMake(1214.5, 1080);
    drawLine0033.width = 29;
    drawLine0033.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0033];

    // Добавляем станцию "Spaklerweg"
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0017.elements addObject:station0027];
    
    station0027.nameOriginal = @"Spaklerweg";
    station0027.mapLocation = CGPointMake(1214.5, 1080);
    station0027.geoLocation = CGPointMake(52.340089, 4.920943);
    station0027.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = CGPointMake(1214.5, 1080);
    fillCircle0027.radius = 6.5;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [station0027.drawPrimitives addObject:fillCircle0027];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0027.nameOriginal;
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 34;
    drawTextLine0034.kernSpacing = 2.2;
    drawTextLine0034.origin = CGPointMake(1311, 1060);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0034];

    // Добавляем вершину
    edge0017.finishVertex = vertex0019;
    
    // Создаем участок линии от "Spaklerweg" до "Overamstel"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0018 = [[MWEdge alloc] init];
    edge0018.identifier = @"edge0018";
    edge0018.developmentName = @"Ребро: Spaklerweg - Overamstel";
    [self.edges addObject:edge0018];
    
    // Добавляем линию
    edge0018.line = line0002;
    
    // Добавляем вершину
    edge0018.startVertex = vertex0019;
    
    // Добавляем станцию "Spaklerweg"
    [edge0018.elements addObject:station0027];
    
    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 1186;
    [edge0018.elements addObject:haul0026];
    
    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(1214.5, 1079.5);
    drawLine0034.endPoint = CGPointMake(1214.5, 1150);
    drawLine0034.width = 29;
    drawLine0034.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0034];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(1185.5, 1149.5);
    drawArc0006.startRadians = 0 * M_PI / 180;
    drawArc0006.endRadians = 90 * M_PI / 180;
    drawArc0006.radius = 29;
    drawArc0006.width = 29;
    drawArc0006.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawArc0006];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(1186, 1178.5);
    drawLine0035.endPoint = CGPointMake(1112.5, 1178.5);
    drawLine0035.width = 29;
    drawLine0035.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0035];

    // Добавляем станцию "Overamstel"
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0018.elements addObject:station0028];
    
    station0028.nameOriginal = @"Overamstel";
    station0028.mapLocation = CGPointMake(1112.5, 1178.5);
    station0028.geoLocation = CGPointMake(52.331850, 4.918032);
    station0028.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = CGPointMake(1112.5, 1178.5);
    fillCircle0028.radius = 6.5;
    fillCircle0028.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0028];
    
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0014];
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0015];
    station0028.showNameOnMap = false;
    
    // Добавляем вершину
    edge0018.finishVertex = vertex0004;

    // Создаем участок линии от "Overamstel" до "Station RAI"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0019 = [[MWEdge alloc] init];
    edge0019.identifier = @"edge0019";
    edge0019.developmentName = @"Ребро: Overamstel - Station RAI";
    [self.edges addObject:edge0019];
    
    // Добавляем линию
    edge0019.line = line0002;
    
    // Добавляем вершину
    edge0019.startVertex = vertex0004;
    
    // Добавляем станцию "Overamstel"
    [edge0019.elements addObject:station0028];
    
    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 2256;
    [edge0019.elements addObject:haul0027];
    
    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(1113, 1178.5);
    drawLine0036.endPoint = CGPointMake(959, 1178.5);
    drawLine0036.width = 29;
    drawLine0036.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0036];

    // Добавляем станцию "Station RAI"
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0019.elements addObject:station0029];
    
    station0029.nameOriginal = @"Station RAI";
    station0029.mapLocation = CGPointMake(959, 1178.5);
    station0029.geoLocation = CGPointMake(52.336781, 4.890738);
    station0029.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = CGPointMake(959, 1178.5);
    fillCircle0029.radius = 6.5;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0029];

    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0012];
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0013];
    station0029.showNameOnMap = false;

    // Добавляем вершину
    edge0019.finishVertex = vertex0003;

    // Создаем участок линии от "Station RAI" до "Station Zuid"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0020 = [[MWEdge alloc] init];
    edge0020.identifier = @"edge0020";
    edge0020.developmentName = @"Ребро: Station RAI - Station Zuid";
    [self.edges addObject:edge0020];
    
    // Добавляем линию
    edge0020.line = line0002;
    
    // Добавляем вершину
    edge0020.startVertex = vertex0003;
    
    // Добавляем станцию "Station RAI"
    [edge0020.elements addObject:station0029];
    
    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 1081;
    [edge0020.elements addObject:haul0028];
    
    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(959.5, 1178.5);
    drawLine0037.endPoint = CGPointMake(805.5, 1178.5);
    drawLine0037.width = 29;
    drawLine0037.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawLine0037];

    // Добавляем станцию "Station Zuid"
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0020.elements addObject:station0030];
    
    station0030.nameOriginal = @"Station Zuid";
    station0030.mapLocation = CGPointMake(805.5, 1178.5);
    station0030.geoLocation = CGPointMake(52.339105, 4.874393);
    station0030.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = CGPointMake(805.5, 1178.5);
    fillCircle0030.radius = 6.5;
    fillCircle0030.fillColor = [UIColor whiteColor];
    [station0030.drawPrimitives addObject:fillCircle0030];

    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0010];
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0011];
    station0030.showNameOnMap = false;

    // Добавляем вершину
    edge0020.finishVertex = vertex0002;
    
    // Создаем участок линии от "Station Zuid" до "Westwijk"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0021 = [[MWEdge alloc] init];
    edge0021.identifier = @"edge0021";
    edge0021.developmentName = @"Ребро: Station Zuid - Westwijk";
    [self.edges addObject:edge0021];
    
    // Добавляем линию
    edge0021.line = line0002;
    
    // Добавляем вершину
    edge0021.startVertex = vertex0002;
    
    // Добавляем станцию "Station Zuid"
    [edge0021.elements addObject:station0030];
    
    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 783;
    [edge0021.elements addObject:haul0029];
    
    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(806, 1178.5);
    drawLine0038.endPoint = CGPointMake(757, 1178.5);
    drawLine0038.width = 29;
    drawLine0038.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0038];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(757, 1207.5);
    drawArc0007.startRadians = 180 * M_PI / 180;
    drawArc0007.endRadians = 270 * M_PI / 180;
    drawArc0007.radius = 29;
    drawArc0007.width = 29;
    drawArc0007.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(728, 1207);
    drawLine0039.endPoint = CGPointMake(728, 1336.5);
    drawLine0039.width = 29;
    drawLine0039.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0039];

    // Добавляем станцию "De Boelelaan/VU"
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0021.elements addObject:station0031];
    
    station0031.nameOriginal = @"De Boelelaan/VU";
    station0031.mapLocation = CGPointMake(728, 1336.5);
    station0031.geoLocation = CGPointMake(52.334233, 4.868827);
    
    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = CGPointMake(728, 1336.5);
    fillCircle0031.radius = 6.5;
    fillCircle0031.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0031];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0031.nameOriginal;
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 34;
    drawTextLine0035.kernSpacing = 2.2;
    drawTextLine0035.origin = CGPointMake(412, 1316.5);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0035];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 324;
    [edge0021.elements addObject:haul0030];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(728, 1336);
    drawLine0041.endPoint = CGPointMake(728, 1413);
    drawLine0041.width = 29;
    drawLine0041.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0041];

    // Добавляем станцию "A.J. Ernststraat"
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0021.elements addObject:station0032];
    
    station0032.nameOriginal = @"A.J. Ernststraat";
    station0032.mapLocation = CGPointMake(728, 1413);
    station0032.geoLocation = CGPointMake(52.331329, 4.868873);
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = CGPointMake(728, 1413);
    fillCircle0032.radius = 6.5;
    fillCircle0032.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0032];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = station0032.nameOriginal;
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 34;
    drawTextLine0036.kernSpacing = 2.2;
    drawTextLine0036.origin = CGPointMake(433, 1393);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0036];

    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 653;
    [edge0021.elements addObject:haul0031];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(728, 1412.5);
    drawLine0042.endPoint = CGPointMake(728, 1489.5);
    drawLine0042.width = 29;
    drawLine0042.color = line0002.color;
    [haul0031.drawPrimitives addObject:drawLine0042];

    // Добавляем станцию "Van Boshuizenstraat"
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0021.elements addObject:station0033];
    
    station0033.nameOriginal = @"Van Boshuizenstraat";
    station0033.mapLocation = CGPointMake(728, 1489.5);
    station0033.geoLocation = CGPointMake(52.325437, 4.868969);
    
    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = CGPointMake(728, 1489.5);
    fillCircle0033.radius = 6.5;
    fillCircle0033.fillColor = [UIColor whiteColor];
    [station0033.drawPrimitives addObject:fillCircle0033];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = station0033.nameOriginal;
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 34;
    drawTextLine0037.kernSpacing = 2.2;
    drawTextLine0037.origin = CGPointMake(349, 1469);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0037];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 406;
    [edge0021.elements addObject:haul0032];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(728, 1489);
    drawLine0043.endPoint = CGPointMake(728, 1565.5);
    drawLine0043.width = 29;
    drawLine0043.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0043];

    // Добавляем станцию "Uilenstede"
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0021.elements addObject:station0034];
    
    station0034.nameOriginal = @"Uilenstede";
    station0034.mapLocation = CGPointMake(728, 1565.5);
    station0034.geoLocation = CGPointMake(52.321762, 4.869162);

    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = CGPointMake(728, 1565.5);
    fillCircle0034.radius = 6.5;
    fillCircle0034.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0034];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = station0034.nameOriginal;
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 34;
    drawTextLine0038.kernSpacing = 2.2;
    drawTextLine0038.origin = CGPointMake(519, 1545.5);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0038];

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 565;
    [edge0021.elements addObject:haul0033];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(728, 1565);
    drawLine0044.endPoint = CGPointMake(728, 1642);
    drawLine0044.width = 29;
    drawLine0044.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0044];

    // Добавляем станцию "Kronenburg"
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0021.elements addObject:station0035];
    
    station0035.nameOriginal = @"Kronenburg";
    station0035.mapLocation = CGPointMake(728, 1642);
    station0035.geoLocation = CGPointMake(52.316626, 4.870272);

    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = CGPointMake(728, 1642);
    fillCircle0035.radius = 6.5;
    fillCircle0035.fillColor = [UIColor whiteColor];
    [station0035.drawPrimitives addObject:fillCircle0035];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = station0035.nameOriginal;
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 34;
    drawTextLine0039.kernSpacing = 2.2;
    drawTextLine0039.origin = CGPointMake(503, 1622);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0039];

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 471;
    [edge0021.elements addObject:haul0034];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(728, 1641.5);
    drawLine0045.endPoint = CGPointMake(728, 1718.5);
    drawLine0045.width = 29;
    drawLine0045.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0045];

    // Добавляем станцию "Zonnestein"
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0021.elements addObject:station0036];
    
    station0036.nameOriginal = @"Zonnestein";
    station0036.mapLocation = CGPointMake(728, 1718.5);
    station0036.geoLocation = CGPointMake(52.312483, 4.872171);

    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = CGPointMake(728, 1718.5);
    fillCircle0036.radius = 6.5;
    fillCircle0036.fillColor = [UIColor whiteColor];
    [station0036.drawPrimitives addObject:fillCircle0036];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = station0036.nameOriginal;
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 34;
    drawTextLine0040.kernSpacing = 2.2;
    drawTextLine0040.origin = CGPointMake(512, 1698.5);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0040];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 505;
    [edge0021.elements addObject:haul0035];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(728, 1718);
    drawLine0046.endPoint = CGPointMake(728, 1795);
    drawLine0046.width = 29;
    drawLine0046.color = line0002.color;
    [haul0035.drawPrimitives addObject:drawLine0046];

    // Добавляем станцию "Onderuit"
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0021.elements addObject:station0037];
    
    station0037.nameOriginal = @"Onderuit";
    station0037.mapLocation = CGPointMake(728, 1795);
    station0037.geoLocation = CGPointMake(52.308197, 4.872512);

    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = CGPointMake(728, 1795);
    fillCircle0037.radius = 6.5;
    fillCircle0037.fillColor = [UIColor whiteColor];
    [station0037.drawPrimitives addObject:fillCircle0037];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0037.nameOriginal;
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 34;
    drawTextLine0041.kernSpacing = 2.2;
    drawTextLine0041.origin = CGPointMake(552, 1775);
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0041];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 526;
    [edge0021.elements addObject:haul0036];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(728, 1794.5);
    drawLine0047.endPoint = CGPointMake(728, 1871);
    drawLine0047.width = 29;
    drawLine0047.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0047];

    // Добавляем станцию "Oranjebaan"
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0021.elements addObject:station0038];
    
    station0038.nameOriginal = @"Oranjebaan";
    station0038.mapLocation = CGPointMake(728, 1871);
    station0038.geoLocation = CGPointMake(52.303195, 4.871961);
    
    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = CGPointMake(728, 1871);
    fillCircle0038.radius = 6.5;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [station0038.drawPrimitives addObject:fillCircle0038];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = station0038.nameOriginal;
    drawTextLine0042.fontName = @"HelveticaNeue";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 34;
    drawTextLine0042.kernSpacing = 2.2;
    drawTextLine0042.origin = CGPointMake(505, 1851);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0042];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 402;
    [edge0021.elements addObject:haul0037];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(728, 1870.5);
    drawLine0048.endPoint = CGPointMake(728, 1947.5);
    drawLine0048.width = 29;
    drawLine0048.color = line0002.color;
    [haul0037.drawPrimitives addObject:drawLine0048];

    // Добавляем станцию "Amstelveen Centrum"
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0021.elements addObject:station0039];
    
    station0039.nameOriginal = @"Amstelveen Centrum";
    station0039.mapLocation = CGPointMake(728, 1947.5);
    station0039.geoLocation = CGPointMake(52.299941, 4.869837);

    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = CGPointMake(728, 1947.5);
    fillCircle0039.radius = 6.5;
    fillCircle0039.fillColor = [UIColor whiteColor];
    [station0039.drawPrimitives addObject:fillCircle0039];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = station0039.nameOriginal;
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 34;
    drawTextLine0043.kernSpacing = 2.2;
    drawTextLine0043.origin = CGPointMake(345, 1927.5);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0043];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 437;
    [edge0021.elements addObject:haul0038];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(728, 1947);
    drawLine0049.endPoint = CGPointMake(728, 2024);
    drawLine0049.width = 29;
    drawLine0049.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawLine0049];

    // Добавляем станцию "Ouderkerkerlaan"
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0021.elements addObject:station0040];
    
    station0040.nameOriginal = @"Ouderkerkerlaan";
    station0040.mapLocation = CGPointMake(728, 2024);
    station0040.geoLocation = CGPointMake(52.296317, 4.867589);

    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = CGPointMake(728, 2024);
    fillCircle0040.radius = 6.5;
    fillCircle0040.fillColor = [UIColor whiteColor];
    [station0040.drawPrimitives addObject:fillCircle0040];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = station0040.nameOriginal;
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 34;
    drawTextLine0044.kernSpacing = 2.2;
    drawTextLine0044.origin = CGPointMake(418, 2004);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 662;
    [edge0021.elements addObject:haul0039];

    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(728, 2023.5);
    drawLine0050.endPoint = CGPointMake(728, 2100.5);
    drawLine0050.width = 29;
    drawLine0050.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawLine0050];

    // Добавляем станцию "Sportlaan"
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0021.elements addObject:station0041];
    
    station0041.nameOriginal = @"Sportlaan";
    station0041.mapLocation = CGPointMake(728, 2100.5);
    station0041.geoLocation = CGPointMake(52.290725, 4.864067);

    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = CGPointMake(728, 2100.5);
    fillCircle0041.radius = 6.5;
    fillCircle0041.fillColor = [UIColor whiteColor];
    [station0041.drawPrimitives addObject:fillCircle0041];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = station0041.nameOriginal;
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 34;
    drawTextLine0045.kernSpacing = 2.2;
    drawTextLine0045.origin = CGPointMake(536, 2080.5);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0045];

    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 458;
    [edge0021.elements addObject:haul0040];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(728, 2100);
    drawLine0051.endPoint = CGPointMake(728, 2176.5);
    drawLine0051.width = 29;
    drawLine0051.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawLine0051];

    // Добавляем станцию "Marne"
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0021.elements addObject:station0042];
    
    station0042.nameOriginal = @"Marne";
    station0042.mapLocation = CGPointMake(728, 2176.5);
    station0042.geoLocation = CGPointMake(52.286986, 4.861382);

    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = CGPointMake(728, 2176.5);
    fillCircle0042.radius = 6.5;
    fillCircle0042.fillColor = [UIColor whiteColor];
    [station0042.drawPrimitives addObject:fillCircle0042];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = station0042.nameOriginal;
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 34;
    drawTextLine0046.kernSpacing = 2.2;
    drawTextLine0046.origin = CGPointMake(594, 2156.5);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0046];

    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 312;
    [edge0021.elements addObject:haul0041];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(728, 2176);
    drawLine0052.endPoint = CGPointMake(728, 2253);
    drawLine0052.width = 29;
    drawLine0052.color = line0002.color;
    [haul0041.drawPrimitives addObject:drawLine0052];

    // Добавляем станцию "Gondel"
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0021.elements addObject:station0043];
    
    station0043.nameOriginal = @"Gondel";
    station0043.mapLocation = CGPointMake(728, 2253);
    station0043.geoLocation = CGPointMake(52.284540, 4.859338);

    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = CGPointMake(728, 2253);
    fillCircle0043.radius = 6.5;
    fillCircle0043.fillColor = [UIColor whiteColor];
    [station0043.drawPrimitives addObject:fillCircle0043];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = station0043.nameOriginal;
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 34;
    drawTextLine0047.kernSpacing = 2.2;
    drawTextLine0047.origin = CGPointMake(580, 2233);
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0047];

    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 410;
    [edge0021.elements addObject:haul0042];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(728, 2252.5);
    drawLine0053.endPoint = CGPointMake(728, 2329.5);
    drawLine0053.width = 29;
    drawLine0053.color = line0002.color;
    [haul0042.drawPrimitives addObject:drawLine0053];

    // Добавляем станцию "Meent"
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0021.elements addObject:station0044];
    
    station0044.nameOriginal = @"Meent";
    station0044.mapLocation = CGPointMake(728, 2329.5);
    station0044.geoLocation = CGPointMake(52.281067, 4.857192);

    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = CGPointMake(728, 2329.5);
    fillCircle0044.radius = 6.5;
    fillCircle0044.fillColor = [UIColor whiteColor];
    [station0044.drawPrimitives addObject:fillCircle0044];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0044.nameOriginal;
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 34;
    drawTextLine0048.kernSpacing = 2.2;
    drawTextLine0048.origin = CGPointMake(595, 2309.5);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0048];

    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 423;
    [edge0021.elements addObject:haul0043];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(728, 2329);
    drawLine0054.endPoint = CGPointMake(728, 2422);
    drawLine0054.width = 29;
    drawLine0054.color = line0002.color;
    [haul0043.drawPrimitives addObject:drawLine0054];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(699, 2422);
    drawArc0008.startRadians = 0 * M_PI / 180;
    drawArc0008.endRadians = 90 * M_PI / 180;
    drawArc0008.radius = 29;
    drawArc0008.width = 29;
    drawArc0008.color = line0002.color;
    [haul0043.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(699, 2451);
    drawLine0055.endPoint = CGPointMake(621, 2451);
    drawLine0055.width = 29;
    drawLine0055.color = line0002.color;
    [haul0043.drawPrimitives addObject:drawLine0055];

    // Добавляем станцию "Brink"
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0021.elements addObject:station0045];
    
    station0045.nameOriginal = @"Brink";
    station0045.mapLocation = CGPointMake(621, 2451);
    station0045.geoLocation = CGPointMake(52.280579, 4.851754);

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = CGPointMake(621, 2451);
    fillCircle0045.radius = 6.5;
    fillCircle0045.fillColor = [UIColor whiteColor];
    [station0045.drawPrimitives addObject:fillCircle0045];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0045.nameOriginal;
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 34;
    drawTextLine0049.kernSpacing = 2.2;
    drawTextLine0049.origin = CGPointMake(582, 2473);
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0049];

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 554;
    [edge0021.elements addObject:haul0044];

    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(621.5, 2451);
    drawLine0056.endPoint = CGPointMake(509, 2451);
    drawLine0056.width = 29;
    drawLine0056.color = line0002.color;
    [haul0044.drawPrimitives addObject:drawLine0056];

    // Добавляем станцию "Poortwachter"
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0021.elements addObject:station0046];
    
    station0046.nameOriginal = @"Poortwachter";
    station0046.mapLocation = CGPointMake(509, 2451);
    station0046.geoLocation = CGPointMake(52.283243, 4.845488);

    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = CGPointMake(509, 2451);
    fillCircle0046.radius = 6.5;
    fillCircle0046.fillColor = [UIColor whiteColor];
    [station0046.drawPrimitives addObject:fillCircle0046];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = @"Poort-";
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 34;
    drawTextLine0050.kernSpacing = 2.2;
    drawTextLine0050.origin = CGPointMake(456, 2336);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0050];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = @"wachter";
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 34;
    drawTextLine0051.kernSpacing = 2.2;
    drawTextLine0051.origin = CGPointMake(442, 2381);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0051];

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 503;
    [edge0021.elements addObject:haul0045];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(509.5, 2451);
    drawLine0057.endPoint = CGPointMake(397, 2451);
    drawLine0057.width = 29;
    drawLine0057.color = line0002.color;
    [haul0045.drawPrimitives addObject:drawLine0057];

    // Добавляем станцию "Spinnerij"
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0021.elements addObject:station0047];
    
    station0047.nameOriginal = @"Spinnerij";
    station0047.mapLocation = CGPointMake(397, 2451);
    station0047.geoLocation = CGPointMake(52.284215, 4.838318);

    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = CGPointMake(397, 2451);
    fillCircle0047.radius = 6.5;
    fillCircle0047.fillColor = [UIColor whiteColor];
    [station0047.drawPrimitives addObject:fillCircle0047];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0047.nameOriginal;
    drawTextLine0052.fontName = @"HelveticaNeue";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 34;
    drawTextLine0052.kernSpacing = 2.2;
    drawTextLine0052.origin = CGPointMake(315, 2473);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0052];

    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 503;
    [edge0021.elements addObject:haul0046];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(397.5, 2451);
    drawLine0058.endPoint = CGPointMake(285, 2451);
    drawLine0058.width = 29;
    drawLine0058.color = line0002.color;
    [haul0046.drawPrimitives addObject:drawLine0058];

    // Добавляем станцию "Sacharovlaan"
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0021.elements addObject:station0048];
    
    station0048.nameOriginal = @"Sacharovlaan";
    station0048.mapLocation = CGPointMake(285, 2451);
    station0048.geoLocation = CGPointMake(52.282408, 4.832550);

    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = CGPointMake(285, 2451);
    fillCircle0048.radius = 6.5;
    fillCircle0048.fillColor = [UIColor whiteColor];
    [station0048.drawPrimitives addObject:fillCircle0048];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = @"Sacharov-";
    drawTextLine0053.fontName = @"HelveticaNeue";
    drawTextLine0053.fontColor = [UIColor blackColor];
    drawTextLine0053.fontSize = 34;
    drawTextLine0053.kernSpacing = 2.2;
    drawTextLine0053.origin = CGPointMake(200, 2336);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0053];
    
    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = @"Iaan";
    drawTextLine0054.fontName = @"HelveticaNeue";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 34;
    drawTextLine0054.kernSpacing = 2.2;
    drawTextLine0054.origin = CGPointMake(249, 2381);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0054];

    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 925;
    [edge0021.elements addObject:haul0047];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(285.5, 2451);
    drawLine0059.endPoint = CGPointMake(223, 2451);
    drawLine0059.width = 29;
    drawLine0059.color = line0002.color;
    [haul0047.drawPrimitives addObject:drawLine0059];

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(223.5, 2480);
    drawArc0009.startRadians = 180 * M_PI / 180;
    drawArc0009.endRadians = 270 * M_PI / 180;
    drawArc0009.radius = 29;
    drawArc0009.width = 29;
    drawArc0009.color = line0002.color;
    [haul0047.drawPrimitives addObject:drawArc0009];
    
    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(194.5, 2480);
    drawLine0060.endPoint = CGPointMake(194.5, 2540.5);
    drawLine0060.width = 29;
    drawLine0060.color = line0002.color;
    [haul0047.drawPrimitives addObject:drawLine0060];

    // Добавляем станцию "Westwijk"
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0021.elements addObject:station0049];
    
    station0049.nameOriginal = @"Westwijk";
    station0049.mapLocation = CGPointMake(194.5, 2540.5);
    station0049.geoLocation = CGPointMake(52.274544, 4.830746);

    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(194.5, 2540);
    drawLine0061.endPoint = CGPointMake(194.5, 2560);
    drawLine0061.width = 29;
    drawLine0061.color = line0002.color;
    [station0049.drawPrimitives addObject:drawLine0061];

    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = CGPointMake(194.5, 2540.5);
    fillCircle0049.radius = 6.5;
    fillCircle0049.fillColor = [UIColor whiteColor];
    [station0049.drawPrimitives addObject:fillCircle0049];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = station0049.nameOriginal;
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 34;
    drawTextLine0055.kernSpacing = 2.2;
    drawTextLine0055.origin = CGPointMake(22, 2520.5);
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0055];

    MWDrawRoundedRect *roundedRect0004 = [[MWDrawRoundedRect alloc] init];
    roundedRect0004.rect = CGRectMake(163, 2569, 63, 46);
    roundedRect0004.cornerRadius = 15;
    roundedRect0004.color = line0002.color;
    [station0049.drawPrimitives addObject:roundedRect0004];
    
    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = @"51";
    drawTextLine0066.fontName = @"HelveticaNeue-Bold";
    drawTextLine0066.fontColor = [UIColor whiteColor];
    drawTextLine0066.fontSize = 34;
    drawTextLine0066.origin = CGPointMake(176.5, 2570);
    [station0049.drawPrimitives addObject:drawTextLine0066];

    // Добавляем вершину
    edge0021.finishVertex = vertex0020;
    
    ////////////////////////////////////////////////////////////////
    // 53. Gaasperplaslijn
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Centraal Station" до "Nieuwmarkt"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0022 = [[MWEdge alloc] init];
    edge0022.identifier = @"edge0022";
    edge0022.developmentName = @"Ребро: Centraal Station - Nieuwmarkt";
    [self.edges addObject:edge0022];
    
    // Добавляем линию
    edge0022.line = line0003;
    
    // Добавляем вершину
    edge0022.startVertex = vertex0013;
    
    // Добавляем станцию "Centraal Station"
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0022.elements addObject:station0050];
    
    station0050.nameOriginal = @"Centraal Station";
    station0050.mapLocation = CGPointMake(1204.5, 368);
    station0050.geoLocation = CGPointMake(52.377376, 4.900784);
    station0050.platformIndex = 1;

    MWDrawRoundedRect *roundedRect0005 = [[MWDrawRoundedRect alloc] init];
    roundedRect0005.rect = CGRectMake(1082.5, 316, 63, 46);
    roundedRect0005.cornerRadius = 15;
    roundedRect0005.color = line0003.color;
    [station0050.drawPrimitives addObject:roundedRect0005];
    
    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = @"53";
    drawTextLine0067.fontName = @"HelveticaNeue-Bold";
    drawTextLine0067.fontColor = [UIColor whiteColor];
    drawTextLine0067.fontSize = 34;
    drawTextLine0067.origin = CGPointMake(1096, 317);
    [station0050.drawPrimitives addObject:drawTextLine0067];

    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(1193.5, 357);
    drawLine0062.endPoint = CGPointMake(1204.5, 368);
    drawLine0062.width = 29;
    drawLine0062.color = line0003.color;
    [station0050.drawPrimitives addObject:drawLine0062];

    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = CGPointMake(1204.5, 368);
    fillCircle0050.radius = 6.5;
    fillCircle0050.fillColor = [UIColor whiteColor];
    [station0050.drawPrimitives addObject:fillCircle0050];

    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0028];
    station0050.showNameOnMap = false;
    
    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 731;
    [edge0022.elements addObject:haul0048];

    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(1204, 367.5);
    drawLine0063.endPoint = CGPointMake(1246.5, 410);
    drawLine0063.width = 29;
    drawLine0063.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawLine0063];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(1161, 494.25);
    drawArc0010.startRadians = 315 * M_PI / 180;
    drawArc0010.endRadians = 0 * M_PI / 180;
    drawArc0010.radius = 120;
    drawArc0010.width = 29;
    drawArc0010.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawArc0010];
    
    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(1281, 494);
    drawLine0064.endPoint = CGPointMake(1281, 513.5);
    drawLine0064.width = 29;
    drawLine0064.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawLine0064];

    // Добавляем станцию "Nieuwmarkt"
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0022.elements addObject:station0051];
    
    station0051.nameOriginal = @"Nieuwmarkt";
    station0051.mapLocation = CGPointMake(1281, 513.5);
    station0051.geoLocation = CGPointMake(52.371941, 4.901236);
    station0051.platformIndex = 1;

    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = CGPointMake(1281, 513.5);
    fillCircle0051.radius = 6.5;
    fillCircle0051.fillColor = [UIColor whiteColor];
    [station0051.drawPrimitives addObject:fillCircle0051];

    [station0051.nameOriginalTextPrimitives addObject:drawTextLine0029];
    station0051.showNameOnMap = false;

    // Добавляем вершину
    edge0022.finishVertex = vertex0014;
    
    // Создаем участок линии от "Nieuwmarkt" до "Waterlooplein"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0023 = [[MWEdge alloc] init];
    edge0023.identifier = @"edge0023";
    edge0023.developmentName = @"Ребро: Nieuwmarkt - Waterlooplein";
    [self.edges addObject:edge0023];
    
    // Добавляем линию
    edge0023.line = line0003;
    
    // Добавляем вершину
    edge0023.startVertex = vertex0014;
    
    // Добавляем станцию "Nieuwmarkt"
    [edge0023.elements addObject:station0051];
    
    // Добавляем перегон
    MWHaul *haul0049 = [[MWHaul alloc] init];
    haul0049.identifier = @"haul0049";
    haul0049.length = 485;
    [edge0023.elements addObject:haul0049];
    
    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(1281, 513);
    drawLine0065.endPoint = CGPointMake(1281, 627);
    drawLine0065.width = 29;
    drawLine0065.color = line0003.color;
    [haul0049.drawPrimitives addObject:drawLine0065];

    // Добавляем станцию "Waterlooplein"
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0023.elements addObject:station0052];
    
    station0052.nameOriginal = @"Waterlooplein";
    station0052.mapLocation = CGPointMake(1281, 627);
    station0052.geoLocation = CGPointMake(52.366979, 4.902981);
    station0052.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = CGPointMake(1281, 627);
    fillCircle0052.radius = 6.5;
    fillCircle0052.fillColor = [UIColor whiteColor];
    [station0052.drawPrimitives addObject:fillCircle0052];
    
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0030];
    station0052.showNameOnMap = false;

    // Добавляем вершину
    edge0023.finishVertex = vertex0015;
    
    // Создаем участок линии от "Waterlooplein" до "Weesperplein"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0024 = [[MWEdge alloc] init];
    edge0024.identifier = @"edge0024";
    edge0024.developmentName = @"Ребро: Waterlooplein - Weesperplein";
    [self.edges addObject:edge0024];
    
    // Добавляем линию
    edge0024.line = line0003;
    
    // Добавляем вершину
    edge0024.startVertex = vertex0015;
    
    // Добавляем станцию "Waterlooplein"
    [edge0024.elements addObject:station0052];
    
    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 870;
    [edge0024.elements addObject:haul0050];
    
    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(1281, 626.5);
    drawLine0066.endPoint = CGPointMake(1281, 740);
    drawLine0066.width = 29;
    drawLine0066.color = line0003.color;
    [haul0050.drawPrimitives addObject:drawLine0066];

    // Добавляем станцию "Weesperplein"
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0024.elements addObject:station0053];
    
    station0053.nameOriginal = @"Weesperplein";
    station0053.mapLocation = CGPointMake(1281, 740);
    station0053.geoLocation = CGPointMake(52.361218, 4.907959);
    station0053.platformIndex = 1;

    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = CGPointMake(1281, 740);
    fillCircle0053.radius = 6.5;
    fillCircle0053.fillColor = [UIColor whiteColor];
    [station0053.drawPrimitives addObject:fillCircle0053];
    
    [station0053.nameOriginalTextPrimitives addObject:drawTextLine0031];
    station0053.showNameOnMap = false;

    // Добавляем вершину
    edge0024.finishVertex = vertex0016;
    
    // Создаем участок линии от "Weesperplein" до "Wibautstraat"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0025 = [[MWEdge alloc] init];
    edge0025.identifier = @"edge0025";
    edge0025.developmentName = @"Ребро: Weesperplein - Wibautstraat";
    [self.edges addObject:edge0025];
    
    // Добавляем линию
    edge0025.line = line0003;
    
    // Добавляем вершину
    edge0025.startVertex = vertex0016;
    
    // Добавляем станцию "Weesperplein"
    [edge0025.elements addObject:station0053];
    
    // Добавляем перегон
    MWHaul *haul0051 = [[MWHaul alloc] init];
    haul0051.identifier = @"haul0051";
    haul0051.length = 821;
    [edge0025.elements addObject:haul0051];

    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(1281, 739.5);
    drawLine0067.endPoint = CGPointMake(1281, 853.5);
    drawLine0067.width = 29;
    drawLine0067.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawLine0067];

    // Добавляем станцию "Wibautstraat"
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0025.elements addObject:station0054];
    
    station0054.nameOriginal = @"Wibautstraat";
    station0054.mapLocation = CGPointMake(1281, 853.5);
    station0054.geoLocation = CGPointMake(52.354320, 4.912136);
    station0054.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = CGPointMake(1281, 853.5);
    fillCircle0054.radius = 6.5;
    fillCircle0054.fillColor = [UIColor whiteColor];
    [station0054.drawPrimitives addObject:fillCircle0054];
    
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0032];
    station0054.showNameOnMap = false;

    // Добавляем вершину
    edge0025.finishVertex = vertex0017;
    
    // Создаем участок линии от "Wibautstraat" до "Amstelstation"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0026 = [[MWEdge alloc] init];
    edge0026.identifier = @"edge0026";
    edge0026.developmentName = @"Ребро: Wibautstraat - Amstelstation";
    [self.edges addObject:edge0026];
    
    // Добавляем линию
    edge0026.line = line0003;
    
    // Добавляем вершину
    edge0026.startVertex = vertex0017;
    
    // Добавляем станцию "Wibautstraat"
    [edge0026.elements addObject:station0054];
    
    // Добавляем перегон
    MWHaul *haul0052 = [[MWHaul alloc] init];
    haul0052.identifier = @"haul0052";
    haul0052.length = 954;
    [edge0026.elements addObject:haul0052];
    
    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(1281, 853);
    drawLine0068.endPoint = CGPointMake(1281, 966.5);
    drawLine0068.width = 29;
    drawLine0068.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0068];

    // Добавляем станцию "Amstelstation"
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0026.elements addObject:station0055];
    
    station0055.nameOriginal = @"Amstelstation";
    station0055.mapLocation = CGPointMake(1281, 966.5);
    station0055.geoLocation = CGPointMake(52.346139, 4.917759);
    station0055.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = CGPointMake(1281, 966.5);
    fillCircle0055.radius = 6.5;
    fillCircle0055.fillColor = [UIColor whiteColor];
    [station0055.drawPrimitives addObject:fillCircle0055];
    
    [station0055.nameOriginalTextPrimitives addObject:drawTextLine0033];
    station0055.showNameOnMap = false;

    // Добавляем вершину
    edge0026.finishVertex = vertex0018;
    
    // Создаем участок линии от "Amstelstation" до "Spaklerweg"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0027 = [[MWEdge alloc] init];
    edge0027.identifier = @"edge0027";
    edge0027.developmentName = @"Ребро: Amstelstation - Spaklerweg";
    [self.edges addObject:edge0027];
    
    // Добавляем линию
    edge0027.line = line0003;
    
    // Добавляем вершину
    edge0027.startVertex = vertex0018;
    
    // Добавляем станцию "Amstelstation"
    [edge0027.elements addObject:station0055];
    
    // Добавляем перегон
    MWHaul *haul0053 = [[MWHaul alloc] init];
    haul0053.identifier = @"haul0053";
    haul0053.length = 755;
    [edge0027.elements addObject:haul0053];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(1281, 966);
    drawLine0069.endPoint = CGPointMake(1281, 1080.5);
    drawLine0069.width = 29;
    drawLine0069.color = line0003.color;
    [haul0053.drawPrimitives addObject:drawLine0069];

    // Добавляем станцию "Spaklerweg"
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0027.elements addObject:station0056];
    
    station0056.nameOriginal = @"Spaklerweg";
    station0056.mapLocation = CGPointMake(1281, 1080.5);
    station0056.geoLocation = CGPointMake(52.340089, 4.920943);
    station0056.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = CGPointMake(1281, 1080.5);
    fillCircle0056.radius = 6.5;
    fillCircle0056.fillColor = [UIColor whiteColor];
    [station0056.drawPrimitives addObject:fillCircle0056];
    
    [station0056.nameOriginalTextPrimitives addObject:drawTextLine0034];
    station0056.showNameOnMap = false;

    // Добавляем вершину
    edge0027.finishVertex = vertex0019;

    // Создаем участок линии от "Spaklerweg" до "Van der Madeweg"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0028 = [[MWEdge alloc] init];
    edge0028.identifier = @"edge0028";
    edge0028.developmentName = @"Ребро: Spaklerweg - Van der Madeweg";
    [self.edges addObject:edge0028];
    
    // Добавляем линию
    edge0028.line = line0003;
    
    // Добавляем вершину
    edge0028.startVertex = vertex0019;
    
    // Добавляем станцию "Spaklerweg"
    [edge0028.elements addObject:station0056];
    
    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 1321;
    [edge0028.elements addObject:haul0054];
    
    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(1281, 1080);
    drawLine0070.endPoint = CGPointMake(1281, 1314.5);
    drawLine0070.width = 29;
    drawLine0070.color = line0003.color;
    [haul0054.drawPrimitives addObject:drawLine0070];

    // Добавляем станцию "Van der Madeweg"
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0028.elements addObject:station0057];
    
    station0057.nameOriginal = @"Van der Madeweg";
    station0057.mapLocation = CGPointMake(1281, 1314.5);
    station0057.geoLocation = CGPointMake(52.329829, 4.930147);
    station0057.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = CGPointMake(1281, 1314.5);
    fillCircle0057.radius = 6.5;
    fillCircle0057.fillColor = [UIColor whiteColor];
    [station0057.drawPrimitives addObject:fillCircle0057];
    
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0016];
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0017];
    station0057.showNameOnMap = false;

    // Добавляем вершину
    edge0028.finishVertex = vertex0005;

    // Создаем участок линии от "Van der Madeweg" до "Gaasperplas"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0029 = [[MWEdge alloc] init];
    edge0029.identifier = @"edge0029";
    edge0029.developmentName = @"Ребро: Van der Madeweg - Gaasperplas";
    [self.edges addObject:edge0029];
    
    // Добавляем линию
    edge0029.line = line0003;
    
    // Добавляем вершину
    edge0029.startVertex = vertex0005;
    
    // Добавляем станцию "Van der Madeweg"
    [edge0029.elements addObject:station0057];
    
    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 1510;
    [edge0029.elements addObject:haul0055];
    
    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(1281, 1314);
    drawLine0071.endPoint = CGPointMake(1281, 1420);
    drawLine0071.width = 29;
    drawLine0071.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawLine0071];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(1310, 1419.5);
    drawArc0011.startRadians = 90 * M_PI / 180;
    drawArc0011.endRadians = 180 * M_PI / 180;
    drawArc0011.radius = 29;
    drawArc0011.width = 29;
    drawArc0011.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawArc0011];
    
    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(1310, 1448.5);
    drawLine0072.endPoint = CGPointMake(1422, 1448.5);
    drawLine0072.width = 29;
    drawLine0072.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawLine0072];

    // Добавляем станцию "Venserpolder"
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0029.elements addObject:station0058];
    
    station0058.nameOriginal = @"Venserpolder";
    station0058.mapLocation = CGPointMake(1422, 1448.5);
    station0058.geoLocation = CGPointMake(52.326777, 4.946414);

    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = CGPointMake(1422, 1448.5);
    fillCircle0058.radius = 6.5;
    fillCircle0058.fillColor = [UIColor whiteColor];
    [station0058.drawPrimitives addObject:fillCircle0058];
    
    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = station0058.nameOriginal;
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor blackColor];
    drawTextLine0056.fontSize = 34;
    drawTextLine0056.kernSpacing = 2.2;
    drawTextLine0056.origin = CGPointMake(1312, 1472);
    [station0058.nameOriginalTextPrimitives addObject:drawTextLine0056];
    
    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 807;
    [edge0029.elements addObject:haul0056];

    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(1421.5, 1448.5);
    drawLine0073.endPoint = CGPointMake(1664, 1448.5);
    drawLine0073.width = 29;
    drawLine0073.color = line0003.color;
    [haul0056.drawPrimitives addObject:drawLine0073];

    // Добавляем станцию "Station Diemen Zuid"
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0029.elements addObject:station0059];
    
    station0059.nameOriginal = @"Station Diemen Zuid";
    station0059.mapLocation = CGPointMake(1664, 1448.5);
    station0059.geoLocation = CGPointMake(52.330290, 4.956550);

    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = CGPointMake(1664, 1448.5);
    fillCircle0059.radius = 6.5;
    fillCircle0059.fillColor = [UIColor whiteColor];
    [station0059.drawPrimitives addObject:fillCircle0059];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = @"Station";
    drawTextLine0057.fontName = @"HelveticaNeue";
    drawTextLine0057.fontColor = [UIColor blackColor];
    drawTextLine0057.fontSize = 34;
    drawTextLine0057.kernSpacing = 2.2;
    drawTextLine0057.origin = CGPointMake(1604, 1327);
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0057];

    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = @"Diemen Zuid";
    drawTextLine0058.fontName = @"HelveticaNeue";
    drawTextLine0058.fontColor = [UIColor blackColor];
    drawTextLine0058.fontSize = 34;
    drawTextLine0058.kernSpacing = 2.2;
    drawTextLine0058.origin = CGPointMake(1557.5, 1371);
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0058];

    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 808;
    [edge0029.elements addObject:haul0057];

    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(1663.5, 1448.5);
    drawLine0074.endPoint = CGPointMake(1792, 1448.5);
    drawLine0074.width = 29;
    drawLine0074.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawLine0074];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(1792, 1477.5);
    drawArc0012.startRadians = 270 * M_PI / 180;
    drawArc0012.endRadians = 0 * M_PI / 180;
    drawArc0012.radius = 29;
    drawArc0012.width = 29;
    drawArc0012.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawArc0012];

    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(1821, 1477);
    drawLine0075.endPoint = CGPointMake(1821, 1525.5);
    drawLine0075.width = 29;
    drawLine0075.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawLine0075];

    // Добавляем станцию "Verrijn Stuartweg"
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0029.elements addObject:station0060];
    
    station0060.nameOriginal = @"Verrijn Stuartweg";
    station0060.mapLocation = CGPointMake(1821, 1525.5);
    station0060.geoLocation = CGPointMake(52.328622, 4.966764);

    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = CGPointMake(1821, 1525.5);
    fillCircle0060.radius = 6.5;
    fillCircle0060.fillColor = [UIColor whiteColor];
    [station0060.drawPrimitives addObject:fillCircle0060];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = station0060.nameOriginal;
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0059.fontColor = [UIColor blackColor];
    drawTextLine0059.fontSize = 34;
    drawTextLine0059.kernSpacing = 2.2;
    drawTextLine0059.origin = CGPointMake(1851, 1505.5);
    [station0060.nameOriginalTextPrimitives addObject:drawTextLine0059];

    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 710;
    [edge0029.elements addObject:haul0058];

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(1821, 1525);
    drawLine0076.endPoint = CGPointMake(1821, 1668);
    drawLine0076.width = 29;
    drawLine0076.color = line0003.color;
    [haul0058.drawPrimitives addObject:drawLine0076];

    // Добавляем станцию "Ganzenhoef"
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0029.elements addObject:station0061];
    
    station0061.nameOriginal = @"Ganzenhoef";
    station0061.mapLocation = CGPointMake(1821, 1668);
    station0061.geoLocation = CGPointMake(52.323599, 4.973064);

    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = CGPointMake(1821, 1668);
    fillCircle0061.radius = 6.5;
    fillCircle0061.fillColor = [UIColor whiteColor];
    [station0061.drawPrimitives addObject:fillCircle0061];

    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = station0061.nameOriginal;
    drawTextLine0060.fontName = @"HelveticaNeue";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 34;
    drawTextLine0060.kernSpacing = 2.2;
    drawTextLine0060.origin = CGPointMake(1850, 1648);
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0060];

    // Добавляем перегон
    MWHaul *haul0059 = [[MWHaul alloc] init];
    haul0059.identifier = @"haul0059";
    haul0059.length = 903;
    [edge0029.elements addObject:haul0059];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(1821, 1667.5);
    drawLine0077.endPoint = CGPointMake(1821, 1810);
    drawLine0077.width = 29;
    drawLine0077.color = line0003.color;
    [haul0059.drawPrimitives addObject:drawLine0077];

    // Добавляем станцию "Kraaiennest"
    MWStation *station0062 = [[MWStation alloc] init];
    station0062.identifier = @"station0062";
    [edge0029.elements addObject:station0062];
    
    station0062.nameOriginal = @"Kraaiennest";
    station0062.mapLocation = CGPointMake(1821, 1810);
    station0062.geoLocation = CGPointMake(52.316484, 4.979584);

    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = CGPointMake(1821, 1810);
    fillCircle0062.radius = 6.5;
    fillCircle0062.fillColor = [UIColor whiteColor];
    [station0062.drawPrimitives addObject:fillCircle0062];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = station0062.nameOriginal;
    drawTextLine0061.fontName = @"HelveticaNeue";
    drawTextLine0061.fontColor = [UIColor blackColor];
    drawTextLine0061.fontSize = 34;
    drawTextLine0061.kernSpacing = 2.2;
    drawTextLine0061.origin = CGPointMake(1850, 1790);
    [station0062.nameOriginalTextPrimitives addObject:drawTextLine0061];

    // Добавляем перегон
    MWHaul *haul0060 = [[MWHaul alloc] init];
    haul0060.identifier = @"haul0060";
    haul0060.length = 707;
    [edge0029.elements addObject:haul0060];

    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(1821, 1809.5);
    drawLine0078.endPoint = CGPointMake(1821, 1952.5);
    drawLine0078.width = 29;
    drawLine0078.color = line0003.color;
    [haul0060.drawPrimitives addObject:drawLine0078];

    // Добавляем станцию "Gaasperplas"
    MWStation *station0063 = [[MWStation alloc] init];
    station0063.identifier = @"station0063";
    [edge0029.elements addObject:station0063];
    
    station0063.nameOriginal = @"Gaasperplas";
    station0063.mapLocation = CGPointMake(1821, 1952.5);
    station0063.geoLocation = CGPointMake(52.310985, 4.984587);

    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(1821, 1952);
    drawLine0079.endPoint = CGPointMake(1821, 1970);
    drawLine0079.width = 29;
    drawLine0079.color = line0003.color;
    [station0063.drawPrimitives addObject:drawLine0079];
    
    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = CGPointMake(1821, 1952);
    fillCircle0063.radius = 6.5;
    fillCircle0063.fillColor = [UIColor whiteColor];
    [station0063.drawPrimitives addObject:fillCircle0063];

    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = station0063.nameOriginal;
    drawTextLine0062.fontName = @"HelveticaNeue";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 34;
    drawTextLine0062.kernSpacing = 2.2;
    drawTextLine0062.origin = CGPointMake(1850, 1932);
    [station0063.nameOriginalTextPrimitives addObject:drawTextLine0062];

    MWDrawRoundedRect *roundedRect0006 = [[MWDrawRoundedRect alloc] init];
    roundedRect0006.rect = CGRectMake(1790, 1978, 63, 46);
    roundedRect0006.cornerRadius = 15;
    roundedRect0006.color = line0003.color;
    [station0063.drawPrimitives addObject:roundedRect0006];
    
    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = @"53";
    drawTextLine0068.fontName = @"HelveticaNeue-Bold";
    drawTextLine0068.fontColor = [UIColor whiteColor];
    drawTextLine0068.fontSize = 34;
    drawTextLine0068.origin = CGPointMake(1803.5, 1979);
    [station0063.drawPrimitives addObject:drawTextLine0068];

    // Добавляем вершину
    edge0029.finishVertex = vertex0021;
    
    ////////////////////////////////////////////////////////////////
    // 54. Geinlijn
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Centraal Station" до "Nieuwmarkt"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0030 = [[MWEdge alloc] init];
    edge0030.identifier = @"edge0030";
    edge0030.developmentName = @"Ребро: Centraal Station - Nieuwmarkt";
    [self.edges addObject:edge0030];
    
    // Добавляем линию
    edge0030.line = line0004;
    
    // Добавляем вершину
    edge0030.startVertex = vertex0013;
    
    // Добавляем станцию "Centraal Station"
    MWStation *station0064 = [[MWStation alloc] init];
    station0064.identifier = @"station0064";
    [edge0030.elements addObject:station0064];
    
    station0064.nameOriginal = @"Centraal Station";
    station0064.mapLocation = CGPointMake(1181, 391.5);
    station0064.geoLocation = CGPointMake(52.377376, 4.900784);
    station0064.platformIndex = 1;

    MWDrawRoundedRect *roundedRect0007 = [[MWDrawRoundedRect alloc] init];
    roundedRect0007.rect = CGRectMake(1013.5, 316, 63, 46);
    roundedRect0007.cornerRadius = 15;
    roundedRect0007.color = line0004.color;
    [station0064.drawPrimitives addObject:roundedRect0007];
    
    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = @"54";
    drawTextLine0069.fontName = @"HelveticaNeue-Bold";
    drawTextLine0069.fontColor = [UIColor blackColor];
    drawTextLine0069.fontSize = 34;
    drawTextLine0069.origin = CGPointMake(1027, 317);
    [station0064.drawPrimitives addObject:drawTextLine0069];

    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(1170, 380.5);
    drawLine0080.endPoint = CGPointMake(1181, 391.5);
    drawLine0080.width = 29;
    drawLine0080.color = line0004.color;
    [station0064.drawPrimitives addObject:drawLine0080];

    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = CGPointMake(1181, 391.5);
    fillCircle0064.radius = 6.5;
    fillCircle0064.fillColor = [UIColor whiteColor];
    [station0064.drawPrimitives addObject:fillCircle0064];

    [station0064.nameOriginalTextPrimitives addObject:drawTextLine0028];
    station0064.showNameOnMap = false;

    // Добавляем перегон
    MWHaul *haul0061 = [[MWHaul alloc] init];
    haul0061.identifier = @"haul0061";
    haul0061.length = 731;
    [edge0030.elements addObject:haul0061];

    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(1181, 391.5);
    drawLine0081.endPoint = CGPointMake(1222, 432.5);
    drawLine0081.width = 29;
    drawLine0081.color = line0004.color;
    [haul0061.drawPrimitives addObject:drawLine0081];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(1158, 496);
    drawArc0013.startRadians = 315 * M_PI / 180;
    drawArc0013.endRadians = 0 * M_PI / 180;
    drawArc0013.radius = 90;
    drawArc0013.width = 29;
    drawArc0013.color = line0004.color;
    [haul0061.drawPrimitives addObject:drawArc0013];

    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(1248, 496);
    drawLine0082.endPoint = CGPointMake(1248, 513.5);
    drawLine0082.width = 29;
    drawLine0082.color = line0004.color;
    [haul0061.drawPrimitives addObject:drawLine0082];

    // Добавляем станцию "Nieuwmarkt"
    MWStation *station0065 = [[MWStation alloc] init];
    station0065.identifier = @"station0065";
    [edge0030.elements addObject:station0065];
    
    station0065.nameOriginal = @"Nieuwmarkt";
    station0065.mapLocation = CGPointMake(1248, 513.5);
    station0065.geoLocation = CGPointMake(52.371941, 4.901236);
    station0065.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = CGPointMake(1248, 513.5);
    fillCircle0065.radius = 6.5;
    fillCircle0065.fillColor = [UIColor whiteColor];
    [station0065.drawPrimitives addObject:fillCircle0065];

    [station0065.nameOriginalTextPrimitives addObject:drawTextLine0029];
    station0065.showNameOnMap = false;
    
    // Добавляем вершину
    edge0030.finishVertex = vertex0014;
    
    // Создаем участок линии от "Nieuwmarkt" до "Waterlooplein"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0031 = [[MWEdge alloc] init];
    edge0031.identifier = @"edge0031";
    edge0031.developmentName = @"Ребро: Nieuwmarkt - Waterlooplein";
    [self.edges addObject:edge0031];
    
    // Добавляем линию
    edge0031.line = line0004;
    
    // Добавляем вершину
    edge0031.startVertex = vertex0014;
    
    // Добавляем станцию "Nieuwmarkt"
    [edge0031.elements addObject:station0065];
    
    // Добавляем перегон
    MWHaul *haul0062 = [[MWHaul alloc] init];
    haul0062.identifier = @"haul0062";
    haul0062.length = 485;
    [edge0031.elements addObject:haul0062];
    
    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(1248, 513);
    drawLine0083.endPoint = CGPointMake(1248, 627);
    drawLine0083.width = 29;
    drawLine0083.color = line0004.color;
    [haul0062.drawPrimitives addObject:drawLine0083];

    // Добавляем станцию "Waterlooplein"
    MWStation *station0066 = [[MWStation alloc] init];
    station0066.identifier = @"station0066";
    [edge0031.elements addObject:station0066];
    
    station0066.nameOriginal = @"Waterlooplein";
    station0066.mapLocation = CGPointMake(1248, 627);
    station0066.geoLocation = CGPointMake(52.366979, 4.902981);
    station0066.platformIndex = 1;

    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = CGPointMake(1248, 627);
    fillCircle0066.radius = 6.5;
    fillCircle0066.fillColor = [UIColor whiteColor];
    [station0066.drawPrimitives addObject:fillCircle0066];

    [station0066.nameOriginalTextPrimitives addObject:drawTextLine0030];
    station0066.showNameOnMap = false;
    
    // Добавляем вершину
    edge0031.finishVertex = vertex0015;
    
    // Создаем участок линии от "Waterlooplein" до "Weesperplein"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0032 = [[MWEdge alloc] init];
    edge0032.identifier = @"edge0032";
    edge0032.developmentName = @"Ребро: Waterlooplein - Weesperplein";
    [self.edges addObject:edge0032];
    
    // Добавляем линию
    edge0032.line = line0004;
    
    // Добавляем вершину
    edge0032.startVertex = vertex0015;
    
    // Добавляем станцию "Waterlooplein"
    [edge0032.elements addObject:station0066];
    
    // Добавляем перегон
    MWHaul *haul0063 = [[MWHaul alloc] init];
    haul0063.identifier = @"haul0063";
    haul0063.length = 870;
    [edge0032.elements addObject:haul0063];
    
    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(1248, 626.5);
    drawLine0084.endPoint = CGPointMake(1248, 740);
    drawLine0084.width = 29;
    drawLine0084.color = line0004.color;
    [haul0063.drawPrimitives addObject:drawLine0084];

    // Добавляем станцию "Weesperplein"
    MWStation *station0067 = [[MWStation alloc] init];
    station0067.identifier = @"station0067";
    [edge0032.elements addObject:station0067];
    
    station0067.nameOriginal = @"Weesperplein";
    station0067.mapLocation = CGPointMake(1248, 740);
    station0067.geoLocation = CGPointMake(52.361218, 4.907959);
    station0067.platformIndex = 1;

    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = CGPointMake(1248, 740);
    fillCircle0067.radius = 6.5;
    fillCircle0067.fillColor = [UIColor whiteColor];
    [station0067.drawPrimitives addObject:fillCircle0067];

    [station0067.nameOriginalTextPrimitives addObject:drawTextLine0031];
    station0067.showNameOnMap = false;

    // Добавляем вершину
    edge0032.finishVertex = vertex0016;
    
    // Создаем участок линии от "Weesperplein" до "Wibautstraat"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0033 = [[MWEdge alloc] init];
    edge0033.identifier = @"edge0033";
    edge0033.developmentName = @"Ребро: Weesperplein - Wibautstraat";
    [self.edges addObject:edge0033];
    
    // Добавляем линию
    edge0033.line = line0004;
    
    // Добавляем вершину
    edge0033.startVertex = vertex0016;
    
    // Добавляем станцию "Weesperplein"
    [edge0033.elements addObject:station0067];
    
    // Добавляем перегон
    MWHaul *haul0064 = [[MWHaul alloc] init];
    haul0064.identifier = @"haul0064";
    haul0064.length = 821;
    [edge0033.elements addObject:haul0064];
    
    MWDrawLine *drawLine0085 = [[MWDrawLine alloc] init];
    drawLine0085.startPoint = CGPointMake(1248, 739.5);
    drawLine0085.endPoint = CGPointMake(1248, 853.5);
    drawLine0085.width = 29;
    drawLine0085.color = line0004.color;
    [haul0064.drawPrimitives addObject:drawLine0085];

    // Добавляем станцию "Wibautstraat"
    MWStation *station0068 = [[MWStation alloc] init];
    station0068.identifier = @"station0068";
    [edge0033.elements addObject:station0068];
    
    station0068.nameOriginal = @"Wibautstraat";
    station0068.mapLocation = CGPointMake(1248, 853.5);
    station0068.geoLocation = CGPointMake(52.354320, 4.912136);
    station0068.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = CGPointMake(1248, 853.5);
    fillCircle0068.radius = 6.5;
    fillCircle0068.fillColor = [UIColor whiteColor];
    [station0068.drawPrimitives addObject:fillCircle0068];
    
    [station0068.nameOriginalTextPrimitives addObject:drawTextLine0032];
    station0068.showNameOnMap = false;

    // Добавляем вершину
    edge0033.finishVertex = vertex0017;
    
    // Создаем участок линии от "Wibautstraat" до "Amstelstation"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0034 = [[MWEdge alloc] init];
    edge0034.identifier = @"edge0034";
    edge0034.developmentName = @"Ребро: Wibautstraat - Amstelstation";
    [self.edges addObject:edge0034];
    
    // Добавляем линию
    edge0034.line = line0004;
    
    // Добавляем вершину
    edge0034.startVertex = vertex0017;
    
    // Добавляем станцию "Wibautstraat"
    [edge0034.elements addObject:station0068];
    
    // Добавляем перегон
    MWHaul *haul0065 = [[MWHaul alloc] init];
    haul0065.identifier = @"haul0065";
    haul0065.length = 954;
    [edge0034.elements addObject:haul0065];
    
    MWDrawLine *drawLine0086 = [[MWDrawLine alloc] init];
    drawLine0086.startPoint = CGPointMake(1248, 853);
    drawLine0086.endPoint = CGPointMake(1248, 966.5);
    drawLine0086.width = 29;
    drawLine0086.color = line0004.color;
    [haul0065.drawPrimitives addObject:drawLine0086];

    // Добавляем станцию "Amstelstation"
    MWStation *station0069 = [[MWStation alloc] init];
    station0069.identifier = @"station0069";
    [edge0034.elements addObject:station0069];
    
    station0069.nameOriginal = @"Amstelstation";
    station0069.mapLocation = CGPointMake(1248, 966.5);
    station0069.geoLocation = CGPointMake(52.346139, 4.917759);
    station0069.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = CGPointMake(1248, 966.5);
    fillCircle0069.radius = 6.5;
    fillCircle0069.fillColor = [UIColor whiteColor];
    [station0069.drawPrimitives addObject:fillCircle0069];
    
    [station0069.nameOriginalTextPrimitives addObject:drawTextLine0033];
    station0069.showNameOnMap = false;

    // Добавляем вершину
    edge0034.finishVertex = vertex0018;
    
    // Создаем участок линии от "Amstelstation" до "Spaklerweg"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0035 = [[MWEdge alloc] init];
    edge0035.identifier = @"edge0035";
    edge0035.developmentName = @"Ребро: Amstelstation - Spaklerweg";
    [self.edges addObject:edge0035];
    
    // Добавляем линию
    edge0035.line = line0004;
    
    // Добавляем вершину
    edge0035.startVertex = vertex0018;
    
    // Добавляем станцию "Amstelstation"
    [edge0035.elements addObject:station0069];
    
    // Добавляем перегон
    MWHaul *haul0066 = [[MWHaul alloc] init];
    haul0066.identifier = @"haul0066";
    haul0066.length = 755;
    [edge0035.elements addObject:haul0066];
    
    MWDrawLine *drawLine0087 = [[MWDrawLine alloc] init];
    drawLine0087.startPoint = CGPointMake(1248, 966);
    drawLine0087.endPoint = CGPointMake(1248, 1080);
    drawLine0087.width = 29;
    drawLine0087.color = line0004.color;
    [haul0066.drawPrimitives addObject:drawLine0087];

    // Добавляем станцию "Spaklerweg"
    MWStation *station0070 = [[MWStation alloc] init];
    station0070.identifier = @"station0070";
    [edge0035.elements addObject:station0070];
    
    station0070.nameOriginal = @"Spaklerweg";
    station0070.mapLocation = CGPointMake(1248, 1080);
    station0070.geoLocation = CGPointMake(52.340089, 4.920943);
    station0070.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0070 = [[MWDrawFillCircle alloc] init];
    fillCircle0070.center = CGPointMake(1248, 1080);
    fillCircle0070.radius = 6.5;
    fillCircle0070.fillColor = [UIColor whiteColor];
    [station0070.drawPrimitives addObject:fillCircle0070];
    
    [station0070.nameOriginalTextPrimitives addObject:drawTextLine0034];
    station0070.showNameOnMap = false;

    // Добавляем вершину
    edge0035.finishVertex = vertex0019;
    
    // Создаем участок линии от "Spaklerweg" до "Van der Madeweg"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0036 = [[MWEdge alloc] init];
    edge0036.identifier = @"edge0036";
    edge0036.developmentName = @"Ребро: Spaklerweg - Van der Madeweg";
    [self.edges addObject:edge0036];
    
    // Добавляем линию
    edge0036.line = line0004;
    
    // Добавляем вершину
    edge0036.startVertex = vertex0019;
    
    // Добавляем станцию "Spaklerweg"
    [edge0036.elements addObject:station0070];
    
    // Добавляем перегон
    MWHaul *haul0067 = [[MWHaul alloc] init];
    haul0067.identifier = @"haul0067";
    haul0067.length = 1321;
    [edge0036.elements addObject:haul0067];
    
    MWDrawLine *drawLine0088 = [[MWDrawLine alloc] init];
    drawLine0088.startPoint = CGPointMake(1248, 1079.5);
    drawLine0088.endPoint = CGPointMake(1248, 1314.5);
    drawLine0088.width = 29;
    drawLine0088.color = line0004.color;
    [haul0067.drawPrimitives addObject:drawLine0088];

    // Добавляем станцию "Van der Madeweg"
    MWStation *station0071 = [[MWStation alloc] init];
    station0071.identifier = @"station0071";
    [edge0036.elements addObject:station0071];
    
    station0071.nameOriginal = @"Van der Madeweg";
    station0071.mapLocation = CGPointMake(1248, 1314.5);
    station0071.geoLocation = CGPointMake(52.329829, 4.930147);
    station0071.platformIndex = 1;

    MWDrawFillCircle *fillCircle0071 = [[MWDrawFillCircle alloc] init];
    fillCircle0071.center = CGPointMake(1248, 1314.5);
    fillCircle0071.radius = 6.5;
    fillCircle0071.fillColor = [UIColor whiteColor];
    [station0071.drawPrimitives addObject:fillCircle0071];
    
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0016];
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0017];
    station0071.showNameOnMap = false;

    // Добавляем вершину
    edge0036.finishVertex = vertex0005;

    // Создаем участок линии от "Van der Madeweg" до "Station Duivendrecht"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0037 = [[MWEdge alloc] init];
    edge0037.identifier = @"edge0037";
    edge0037.developmentName = @"Ребро: Van der Madeweg - Station Duivendrecht";
    [self.edges addObject:edge0037];
    
    // Добавляем линию
    edge0037.line = line0004;
    
    // Добавляем вершину
    edge0037.startVertex = vertex0005;
    
    // Добавляем станцию "Van der Madeweg"
    [edge0037.elements addObject:station0071];
    
    // Добавляем перегон
    MWHaul *haul0068 = [[MWHaul alloc] init];
    haul0068.identifier = @"haul0068";
    haul0068.length = 799;
    [edge0037.elements addObject:haul0068];
    
    MWDrawLine *drawLine0089 = [[MWDrawLine alloc] init];
    drawLine0089.startPoint = CGPointMake(1248, 1314);
    drawLine0089.endPoint = CGPointMake(1248, 1456);
    drawLine0089.width = 29;
    drawLine0089.color = line0004.color;
    [haul0068.drawPrimitives addObject:drawLine0089];

    // Добавляем станцию "Station Duivendrecht"
    MWStation *station0072 = [[MWStation alloc] init];
    station0072.identifier = @"station0072";
    [edge0037.elements addObject:station0072];
    
    station0072.nameOriginal = @"Station Duivendrecht";
    station0072.mapLocation = CGPointMake(1248, 1456);
    station0072.geoLocation = CGPointMake(52.323587, 4.936543);
    station0072.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0072 = [[MWDrawFillCircle alloc] init];
    fillCircle0072.center = CGPointMake(1248, 1456);
    fillCircle0072.radius = 6.5;
    fillCircle0072.fillColor = [UIColor whiteColor];
    [station0072.drawPrimitives addObject:fillCircle0072];
    
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0018];
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0019];
    station0072.showNameOnMap = false;

    // Добавляем вершину
    edge0037.finishVertex = vertex0006;
    
    // Создаем участок линии от "Station Duivendrecht" до "Strandvliet"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0038 = [[MWEdge alloc] init];
    edge0038.identifier = @"edge0038";
    edge0038.developmentName = @"Ребро: Station Duivendrecht - Strandvliet";
    [self.edges addObject:edge0038];
    
    // Добавляем линию
    edge0038.line = line0004;
    
    // Добавляем вершину
    edge0038.startVertex = vertex0006;
    
    // Добавляем станцию "Station Duivendrecht"
    [edge0038.elements addObject:station0072];
    
    // Добавляем перегон
    MWHaul *haul0069 = [[MWHaul alloc] init];
    haul0069.identifier = @"haul0069";
    haul0069.length = 665;
    [edge0038.elements addObject:haul0069];
    
    MWDrawLine *drawLine0090 = [[MWDrawLine alloc] init];
    drawLine0090.startPoint = CGPointMake(1248, 1455.5);
    drawLine0090.endPoint = CGPointMake(1248, 1597);
    drawLine0090.width = 29;
    drawLine0090.color = line0004.color;
    [haul0069.drawPrimitives addObject:drawLine0090];

    // Добавляем станцию "Strandvliet"
    MWStation *station0073 = [[MWStation alloc] init];
    station0073.identifier = @"station0073";
    [edge0038.elements addObject:station0073];
    
    station0073.nameOriginal = @"Strandvliet";
    station0073.mapLocation = CGPointMake(1248, 1597);
    station0073.geoLocation = CGPointMake(52.318626, 4.941335);
    station0073.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0073 = [[MWDrawFillCircle alloc] init];
    fillCircle0073.center = CGPointMake(1248, 1597);
    fillCircle0073.radius = 6.5;
    fillCircle0073.fillColor = [UIColor whiteColor];
    [station0073.drawPrimitives addObject:fillCircle0073];
    
    [station0073.nameOriginalTextPrimitives addObject:drawTextLine0020];
    station0073.showNameOnMap = false;

    // Добавляем вершину
    edge0038.finishVertex = vertex0007;
    
    // Создаем участок линии от "Strandvliet" до "Station Bijlmer ArenA"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0039 = [[MWEdge alloc] init];
    edge0039.identifier = @"edge0039";
    edge0039.developmentName = @"Ребро: Strandvliet - Station Bijlmer ArenA";
    [self.edges addObject:edge0039];
    
    // Добавляем линию
    edge0039.line = line0004;
    
    // Добавляем вершину
    edge0039.startVertex = vertex0007;
    
    // Добавляем станцию "Strandvliet"
    [edge0039.elements addObject:station0073];
    
    // Добавляем перегон
    MWHaul *haul0070 = [[MWHaul alloc] init];
    haul0070.identifier = @"haul0070";
    haul0070.length = 781;
    [edge0039.elements addObject:haul0070];
    
    MWDrawLine *drawLine0091 = [[MWDrawLine alloc] init];
    drawLine0091.startPoint = CGPointMake(1248, 1596.5);
    drawLine0091.endPoint = CGPointMake(1248, 1738.5);
    drawLine0091.width = 29;
    drawLine0091.color = line0004.color;
    [haul0070.drawPrimitives addObject:drawLine0091];

    // Добавляем станцию "Station Bijlmer ArenA"
    MWStation *station0074 = [[MWStation alloc] init];
    station0074.identifier = @"station0074";
    [edge0039.elements addObject:station0074];
    
    station0074.nameOriginal = @"Station Bijlmer ArenA";
    station0074.mapLocation = CGPointMake(1248, 1738.5);
    station0074.geoLocation = CGPointMake(52.312066, 4.947399);
    station0074.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0074 = [[MWDrawFillCircle alloc] init];
    fillCircle0074.center = CGPointMake(1248, 1738.5);
    fillCircle0074.radius = 6.5;
    fillCircle0074.fillColor = [UIColor whiteColor];
    [station0074.drawPrimitives addObject:fillCircle0074];
    
    [station0074.nameOriginalTextPrimitives addObject:drawTextLine0021];
    [station0074.nameOriginalTextPrimitives addObject:drawTextLine0022];
    station0074.showNameOnMap = false;

    // Добавляем вершину
    edge0039.finishVertex = vertex0008;
    
    // Создаем участок линии от "Station Bijlmer ArenA" до "Bullewijk"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0040 = [[MWEdge alloc] init];
    edge0040.identifier = @"edge0040";
    edge0040.developmentName = @"Ребро: Station Bijlmer ArenA - Bullewijk";
    [self.edges addObject:edge0040];
    
    // Добавляем линию
    edge0040.line = line0004;
    
    // Добавляем вершину
    edge0040.startVertex = vertex0008;
    
    // Добавляем станцию "Station Bijlmer ArenA"
    [edge0040.elements addObject:station0074];
    
    // Добавляем перегон
    MWHaul *haul0071 = [[MWHaul alloc] init];
    haul0071.identifier = @"haul0071";
    haul0071.length = 725;
    [edge0040.elements addObject:haul0071];
    
    MWDrawLine *drawLine0092 = [[MWDrawLine alloc] init];
    drawLine0092.startPoint = CGPointMake(1248, 1738);
    drawLine0092.endPoint = CGPointMake(1248, 1879.5);
    drawLine0092.width = 29;
    drawLine0092.color = line0004.color;
    [haul0071.drawPrimitives addObject:drawLine0092];

    // Добавляем станцию "Bullewijk"
    MWStation *station0075 = [[MWStation alloc] init];
    station0075.identifier = @"station0075";
    [edge0040.elements addObject:station0075];
    
    station0075.nameOriginal = @"Bullewijk";
    station0075.mapLocation = CGPointMake(1248, 1879.5);
    station0075.geoLocation = CGPointMake(52.306655, 4.952251);
    station0075.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0075 = [[MWDrawFillCircle alloc] init];
    fillCircle0075.center = CGPointMake(1248, 1879.5);
    fillCircle0075.radius = 6.5;
    fillCircle0075.fillColor = [UIColor whiteColor];
    [station0075.drawPrimitives addObject:fillCircle0075];
    
    [station0075.nameOriginalTextPrimitives addObject:drawTextLine0023];
    station0075.showNameOnMap = false;

    // Добавляем вершину
    edge0040.finishVertex = vertex0009;
    
    // Создаем участок линии от "Bullewijk" до "Station Holendrecht"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0041 = [[MWEdge alloc] init];
    edge0041.identifier = @"edge0041";
    edge0041.developmentName = @"Ребро: Bullewijk - Station Holendrecht";
    [self.edges addObject:edge0041];
    
    // Добавляем линию
    edge0041.line = line0004;
    
    // Добавляем вершину
    edge0041.startVertex = vertex0009;
    
    // Добавляем станцию "Bullewijk"
    [edge0041.elements addObject:station0075];
    
    // Добавляем перегон
    MWHaul *haul0072 = [[MWHaul alloc] init];
    haul0072.identifier = @"haul0072";
    haul0072.length = 1092;
    [edge0041.elements addObject:haul0072];
    
    MWDrawLine *drawLine0093 = [[MWDrawLine alloc] init];
    drawLine0093.startPoint = CGPointMake(1248, 1879);
    drawLine0093.endPoint = CGPointMake(1248, 2020.5);
    drawLine0093.width = 29;
    drawLine0093.color = line0004.color;
    [haul0072.drawPrimitives addObject:drawLine0093];

    // Добавляем станцию "Station Holendrecht"
    MWStation *station0076 = [[MWStation alloc] init];
    station0076.identifier = @"station0076";
    [edge0041.elements addObject:station0076];
    
    station0076.nameOriginal = @"Station Holendrecht";
    station0076.mapLocation = CGPointMake(1248, 2020.5);
    station0076.geoLocation = CGPointMake(52.298392, 4.959815);
    station0076.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0076 = [[MWDrawFillCircle alloc] init];
    fillCircle0076.center = CGPointMake(1248, 2020.5);
    fillCircle0076.radius = 6.5;
    fillCircle0076.fillColor = [UIColor whiteColor];
    [station0076.drawPrimitives addObject:fillCircle0076];
    
    [station0076.nameOriginalTextPrimitives addObject:drawTextLine0024];
    [station0076.nameOriginalTextPrimitives addObject:drawTextLine0025];
    station0076.showNameOnMap = false;

    // Добавляем вершину
    edge0041.finishVertex = vertex0010;
    
    // Создаем участок линии от "Station Holendrecht" до "Reigersbos"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0042 = [[MWEdge alloc] init];
    edge0042.identifier = @"edge0042";
    edge0042.developmentName = @"Ребро: Station Holendrecht - Reigersbos";
    [self.edges addObject:edge0042];
    
    // Добавляем линию
    edge0042.line = line0004;
    
    // Добавляем вершину
    edge0042.startVertex = vertex0010;
    
    // Добавляем станцию "Station Holendrecht"
    [edge0042.elements addObject:station0076];
    
    // Добавляем перегон
    MWHaul *haul0073 = [[MWHaul alloc] init];
    haul0073.identifier = @"haul0073";
    haul0073.length = 1194;
    [edge0042.elements addObject:haul0073];
    
    MWDrawLine *drawLine0094 = [[MWDrawLine alloc] init];
    drawLine0094.startPoint = CGPointMake(1248, 2020);
    drawLine0094.endPoint = CGPointMake(1248, 2084);
    drawLine0094.width = 29;
    drawLine0094.color = line0004.color;
    [haul0073.drawPrimitives addObject:drawLine0094];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(1277, 2084);
    drawArc0014.startRadians = 90 * M_PI / 180;
    drawArc0014.endRadians = 180 * M_PI / 180;
    drawArc0014.radius = 29;
    drawArc0014.width = 29;
    drawArc0014.color = line0004.color;
    [haul0073.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0095 = [[MWDrawLine alloc] init];
    drawLine0095.startPoint = CGPointMake(1277, 2113);
    drawLine0095.endPoint = CGPointMake(1398, 2113);
    drawLine0095.width = 29;
    drawLine0095.color = line0004.color;
    [haul0073.drawPrimitives addObject:drawLine0095];

    // Добавляем станцию "Reigersbos"
    MWStation *station0077 = [[MWStation alloc] init];
    station0077.identifier = @"station0077";
    [edge0042.elements addObject:station0077];
    
    station0077.nameOriginal = @"Reigersbos";
    station0077.mapLocation = CGPointMake(1398, 2113);
    station0077.geoLocation = CGPointMake(52.295629, 4.974171);
    station0077.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0077 = [[MWDrawFillCircle alloc] init];
    fillCircle0077.center = CGPointMake(1398, 2113);
    fillCircle0077.radius = 6.5;
    fillCircle0077.fillColor = [UIColor whiteColor];
    [station0077.drawPrimitives addObject:fillCircle0077];
    
    [station0077.nameOriginalTextPrimitives addObject:drawTextLine0026];
    station0077.showNameOnMap = false;

    // Добавляем вершину
    edge0042.finishVertex = vertex0011;
    
    // Создаем участок линии от "Reigersbos" до "Gein"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0043 = [[MWEdge alloc] init];
    edge0043.identifier = @"edge0043";
    edge0043.developmentName = @"Ребро: Reigersbos - Gein";
    [self.edges addObject:edge0043];
    
    // Добавляем линию
    edge0043.line = line0004;
    
    // Добавляем вершину
    edge0043.startVertex = vertex0011;
    
    // Добавляем станцию "Reigersbos"
    [edge0043.elements addObject:station0077];
    
    // Добавляем перегон
    MWHaul *haul0074 = [[MWHaul alloc] init];
    haul0074.identifier = @"haul0074";
    haul0074.length = 1024;
    [edge0043.elements addObject:haul0074];

    MWDrawLine *drawLine0096 = [[MWDrawLine alloc] init];
    drawLine0096.startPoint = CGPointMake(1397.5, 2113);
    drawLine0096.endPoint = CGPointMake(1621, 2113);
    drawLine0096.width = 29;
    drawLine0096.color = line0004.color;
    [haul0074.drawPrimitives addObject:drawLine0096];

    // Добавляем станцию "Gein"
    MWStation *station0078 = [[MWStation alloc] init];
    station0078.identifier = @"station0078";
    [edge0043.elements addObject:station0078];
    
    station0078.nameOriginal = @"Gein";
    station0078.mapLocation = CGPointMake(1621, 2113);
    station0078.geoLocation = CGPointMake(52.296340, 4.989370);
    station0078.platformIndex = 1;

    MWDrawLine *drawLine0097 = [[MWDrawLine alloc] init];
    drawLine0097.startPoint = CGPointMake(1620.5, 2113);
    drawLine0097.endPoint = CGPointMake(1638, 2113);
    drawLine0097.width = 29;
    drawLine0097.color = line0004.color;
    [station0078.drawPrimitives addObject:drawLine0097];

    MWDrawFillCircle *fillCircle0078 = [[MWDrawFillCircle alloc] init];
    fillCircle0078.center = CGPointMake(1621, 2113);
    fillCircle0078.radius = 6.5;
    fillCircle0078.fillColor = [UIColor whiteColor];
    [station0078.drawPrimitives addObject:fillCircle0078];
    
    [station0078.nameOriginalTextPrimitives addObject:drawTextLine0027];
    station0078.showNameOnMap = false;

    MWDrawRoundedRect *roundedRect0008 = [[MWDrawRoundedRect alloc] init];
    roundedRect0008.rect = CGRectMake(1648.5, 2078.5, 63, 46);
    roundedRect0008.cornerRadius = 15;
    roundedRect0008.color = line0004.color;
    [station0065.drawPrimitives addObject:roundedRect0008];
    
    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = @"54";
    drawTextLine0070.fontName = @"HelveticaNeue-Bold";
    drawTextLine0070.fontColor = [UIColor blackColor];
    drawTextLine0070.fontSize = 34;
    drawTextLine0070.origin = CGPointMake(1662, 2079.5);
    [station0065.drawPrimitives addObject:drawTextLine0070];

    // Добавляем вершину
    edge0043.finishVertex = vertex0012;
    
    // Рисуем остальные графические примитивы

    MWDrawRoundedRect *roundedRect0009 = [[MWDrawRoundedRect alloc] init];
    roundedRect0009.rect = CGRectMake(1458, 23, 63, 46);
    roundedRect0009.cornerRadius = 15;
    roundedRect0009.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:roundedRect0009];
    
    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = @"52";
    drawTextLine0071.fontName = @"HelveticaNeue-Bold";
    drawTextLine0071.fontColor = [UIColor whiteColor];
    drawTextLine0071.fontSize = 34;
    drawTextLine0071.origin = CGPointMake(1471.5, 24);
    [self.additionalOverMapPrimitives addObject:drawTextLine0071];

    MWDrawRoundedRect *roundedRect0010 = [[MWDrawRoundedRect alloc] init];
    roundedRect0010.rect = CGRectMake(682, 1122.5, 63, 46);
    roundedRect0010.cornerRadius = 15;
    roundedRect0010.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:roundedRect0010];
    
    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = @"52";
    drawTextLine0072.fontName = @"HelveticaNeue-Bold";
    drawTextLine0072.fontColor = [UIColor whiteColor];
    drawTextLine0072.fontSize = 34;
    drawTextLine0072.origin = CGPointMake(695.5, 1123.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0072];

    MWDrawLine *drawLine0098 = [[MWDrawLine alloc] init];
    drawLine0098.startPoint = CGPointMake(1450, 59.5);
    drawLine0098.endPoint = CGPointMake(956, 553.5);
    drawLine0098.width = 4;
    drawLine0098.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0098];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(1031, 627.5);
    drawArc0015.startRadians = 180 * M_PI / 180;
    drawArc0015.endRadians = 225 * M_PI / 180;
    drawArc0015.radius = 105.5;
    drawArc0015.width = 4;
    drawArc0015.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0099 = [[MWDrawLine alloc] init];
    drawLine0099.startPoint = CGPointMake(925.5, 627);
    drawLine0099.endPoint = CGPointMake(925.5, 1112);
    drawLine0099.width = 4;
    drawLine0099.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0099];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(905.5, 1112);
    drawArc0016.startRadians = 0 * M_PI / 180;
    drawArc0016.endRadians = 90 * M_PI / 180;
    drawArc0016.radius = 20;
    drawArc0016.width = 4;
    drawArc0016.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0016];

    MWDrawLine *drawLine0100 = [[MWDrawLine alloc] init];
    drawLine0100.startPoint = CGPointMake(906, 1132);
    drawLine0100.endPoint = CGPointMake(778, 1132);
    drawLine0100.width = 4;
    drawLine0100.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0100];

    MWDrawLine *drawLine0101 = [[MWDrawLine alloc] init];
    drawLine0101.startPoint = CGPointMake(1468, 77.5);
    drawLine0101.endPoint = CGPointMake(973.5, 572);
    drawLine0101.width = 4;
    drawLine0101.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0101];

    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(1030.5, 628);
    drawArc0017.startRadians = 180 * M_PI / 180;
    drawArc0017.endRadians = 225 * M_PI / 180;
    drawArc0017.radius = 80;
    drawArc0017.width = 4;
    drawArc0017.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0017];

    MWDrawLine *drawLine0102 = [[MWDrawLine alloc] init];
    drawLine0102.startPoint = CGPointMake(950.5, 628);
    drawLine0102.endPoint = CGPointMake(950.5, 1112);
    drawLine0102.width = 4;
    drawLine0102.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0102];

    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(905.5, 1112);
    drawArc0018.startRadians = 0 * M_PI / 180;
    drawArc0018.endRadians = 90 * M_PI / 180;
    drawArc0018.radius = 45;
    drawArc0018.width = 4;
    drawArc0018.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0103 = [[MWDrawLine alloc] init];
    drawLine0103.startPoint = CGPointMake(906, 1157);
    drawLine0103.endPoint = CGPointMake(778, 1157);
    drawLine0103.width = 4;
    drawLine0103.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0103];

    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(1443.7, 83.7);
    drawArc0019.startRadians = 0 * M_PI / 180;
    drawArc0019.endRadians = 360 * M_PI / 180;
    drawArc0019.radius = 8.5;
    drawArc0019.width = 4;
    drawArc0019.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0019];

    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(1296.7, 230.7);
    drawArc0020.startRadians = 0 * M_PI / 180;
    drawArc0020.endRadians = 360 * M_PI / 180;
    drawArc0020.radius = 8.5;
    drawArc0020.width = 4;
    drawArc0020.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0020];

    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(1203.7, 323.7);
    drawArc0021.startRadians = 0 * M_PI / 180;
    drawArc0021.endRadians = 360 * M_PI / 180;
    drawArc0021.radius = 8.5;
    drawArc0021.width = 4;
    drawArc0021.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0021];

    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(1029.7, 497.7);
    drawArc0022.startRadians = 0 * M_PI / 180;
    drawArc0022.endRadians = 360 * M_PI / 180;
    drawArc0022.radius = 8.5;
    drawArc0022.width = 4;
    drawArc0022.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0022];

    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(938, 740);
    drawArc0023.startRadians = 0 * M_PI / 180;
    drawArc0023.endRadians = 360 * M_PI / 180;
    drawArc0023.radius = 8.5;
    drawArc0023.width = 4;
    drawArc0023.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0023];

    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(938, 910);
    drawArc0024.startRadians = 0 * M_PI / 180;
    drawArc0024.endRadians = 360 * M_PI / 180;
    drawArc0024.radius = 8.5;
    drawArc0024.width = 4;
    drawArc0024.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0024];

    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(938, 1080);
    drawArc0025.startRadians = 0 * M_PI / 180;
    drawArc0025.endRadians = 360 * M_PI / 180;
    drawArc0025.radius = 8.5;
    drawArc0025.width = 4;
    drawArc0025.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0025];

    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(805.5, 1144.5);
    drawArc0026.startRadians = 0 * M_PI / 180;
    drawArc0026.endRadians = 360 * M_PI / 180;
    drawArc0026.radius = 8.5;
    drawArc0026.width = 4;
    drawArc0026.color = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0026];

    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = @"Noord/Zuidlijn (2017)";
    drawTextLine0080.radians = 315 * M_PI / 180;
    drawTextLine0080.fontName = @"HelveticaNeue";
    drawTextLine0080.fontColor = [UIColor colorWithRed:0/255.0 green:174/255.0 blue:239/255.0 alpha:1];
    drawTextLine0080.fontSize = 34;
    drawTextLine0080.origin = CGPointMake(1172, 274);
    drawTextLine0080.radians = 315 * M_PI / 180;
    [self.additionalOverMapPrimitives addObject:drawTextLine0080];
    
    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = @"Noord";
    drawTextLine0073.fontName = @"HelveticaNeue";
    drawTextLine0073.fontColor = [UIColor colorWithRed:99/255.0 green:100/255.0 blue:102/255.0 alpha:1];
    drawTextLine0073.fontSize = 34;
    drawTextLine0073.kernSpacing = 2.2;
    drawTextLine0073.origin = CGPointMake(1444, 105);
    [self.additionalOverMapPrimitives addObject:drawTextLine0073];

    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = @"Noorderpark";
    drawTextLine0074.fontName = @"HelveticaNeue";
    drawTextLine0074.fontColor = [UIColor colorWithRed:99/255.0 green:100/255.0 blue:102/255.0 alpha:1];
    drawTextLine0074.fontSize = 34;
    drawTextLine0074.kernSpacing = 2.2;
    drawTextLine0074.origin = CGPointMake(1297, 253);
    [self.additionalOverMapPrimitives addObject:drawTextLine0074];

    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = @"Rokin";
    drawTextLine0075.fontName = @"HelveticaNeue";
    drawTextLine0075.fontColor = [UIColor colorWithRed:99/255.0 green:100/255.0 blue:102/255.0 alpha:1];
    drawTextLine0075.fontSize = 34;
    drawTextLine0075.kernSpacing = 2.2;
    drawTextLine0075.origin = CGPointMake(934, 439.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0075];

    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = @"Vijzelgracht";
    drawTextLine0076.fontName = @"HelveticaNeue";
    drawTextLine0076.fontColor = [UIColor colorWithRed:99/255.0 green:100/255.0 blue:102/255.0 alpha:1];
    drawTextLine0076.fontSize = 34;
    drawTextLine0076.kernSpacing = 2.2;
    drawTextLine0076.origin = CGPointMake(712, 720);
    [self.additionalOverMapPrimitives addObject:drawTextLine0076];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = @"De Pijp";
    drawTextLine0077.fontName = @"HelveticaNeue";
    drawTextLine0077.fontColor = [UIColor colorWithRed:99/255.0 green:100/255.0 blue:102/255.0 alpha:1];
    drawTextLine0077.fontSize = 34;
    drawTextLine0077.kernSpacing = 2.2;
    drawTextLine0077.origin = CGPointMake(790, 889);
    [self.additionalOverMapPrimitives addObject:drawTextLine0077];

    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = @"Europa-";
    drawTextLine0078.fontName = @"HelveticaNeue";
    drawTextLine0078.fontColor = [UIColor colorWithRed:99/255.0 green:100/255.0 blue:102/255.0 alpha:1];
    drawTextLine0078.fontSize = 34;
    drawTextLine0078.kernSpacing = 2.2;
    drawTextLine0078.origin = CGPointMake(969, 1036);
    [self.additionalOverMapPrimitives addObject:drawTextLine0078];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = @"plein";
    drawTextLine0079.fontName = @"HelveticaNeue";
    drawTextLine0079.fontColor = [UIColor colorWithRed:99/255.0 green:100/255.0 blue:102/255.0 alpha:1];
    drawTextLine0079.fontSize = 34;
    drawTextLine0079.kernSpacing = 2.2;
    drawTextLine0079.origin = CGPointMake(969, 1080.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0079];

    
    
    return self;
}

@end
