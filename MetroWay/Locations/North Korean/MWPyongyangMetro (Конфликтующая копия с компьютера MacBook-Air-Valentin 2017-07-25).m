//
//  pyongyang_metro.m
//  MetroWay
//
//  Created by Valentin Ozerov on 11.03.15.
//  Copyright (c) 2015 Valentin Ozerov. All rights reserved.
//

#import "MWPyongyangMetro.h"

@implementation MWPyongyangMetro

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"pyongyang_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // #1 Chŏllima Line
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameEnglish = @"#1 Chŏllima Line";
    line0001.nameOriginal = @"천리마선 (千里馬線)";
    line0001.color = [UIColor colorWithRed:(204/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0001];

    // #2 Hyŏksin Line
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameEnglish = @"#2 Hyŏksin Line";
    line0002.nameOriginal = @"혁신선 (革新線)";
    line0002.color = [UIColor colorWithRed:(78/255.0) green:(154/255.0) blue:(6/255.0) alpha:1];
    [self.lines addObject:line0002];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0001];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Pulgŭnbyŏl
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Pulgŭnbyŏl";
    [self.vertices addObject:vertex0001];

    // Puhŭng
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Puhŭng";
    [self.vertices addObject:vertex0002];

    // Kwangbok
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Kwangbok";
    [self.vertices addObject:vertex0003];

    // Ragwŏn
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Ragwŏn";
    [self.vertices addObject:vertex0004];

    // Chŏnu / Chŏnsŭng
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Chŏnu / Chŏnsŭng";
    [self.vertices addObject:vertex0005];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(851, 732.5);
    drawLine0015.endPoint = CGPointMake(853, 680.5);
    drawLine0015.width = 18;
    drawLine0015.color = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:drawLine0015];

    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = CGPointMake(851, 732.5);
    fillCircle0035.radius = 22;
    fillCircle0035.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0035];
    
    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = CGPointMake(851, 732.5);
    fillCircle0036.radius = 18;
    fillCircle0036.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0036];

    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = CGPointMake(853, 680.5);
    fillCircle0037.radius = 22;
    fillCircle0037.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0037];
    
    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = CGPointMake(853, 680.5);
    fillCircle0038.radius = 18;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0038];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(851, 732.5);
    drawLine0016.endPoint = CGPointMake(853, 680.5);
    drawLine0016.width = 12;
    drawLine0016.color = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:drawLine0016];

    ////////////////////////////////////////////////////////////////
    // #1 Chŏllima Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Pulgŭnbyŏl - Chŏnu
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Pulgŭnbyŏl - Chŏnu";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;

    // Добавляем станцию Pulgŭnbyŏl
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"붉은별";
    station0001.nameEnglish = @"Pulgŭnbyŏl";
    station0001.mapLocation = CGPointMake(850.5, 400.5);
    station0001.geoLocation = CGPointMake(39.066669, 125.756850);

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(850.5, 400.5);
    fillCircle0001.radius = 27;
    fillCircle0001.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = CGPointMake(850.5, 400.5);
    fillCircle0002.radius = 20;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0002];

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 40;
    drawTextLine0001.origin = CGPointMake(896, 378);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0001.nameEnglish;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0002.fontSize = 24;
    drawTextLine0002.origin = CGPointMake(896, 352);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 920;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(850.5, 400.5);
    drawLine0001.endPoint = CGPointMake(851, 732.5);
    drawLine0001.width = 24;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];

    // Добавляем станцию Chŏnsŭng
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"전우 (戰友)";
    station0002.nameEnglish = @"Chŏnu";
    station0002.mapLocation = CGPointMake(851, 732.5);
    station0002.geoLocation = CGPointMake(39.058428, 125.756082);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = CGPointMake(851, 732.5);
    fillCircle0003.radius = 22;
    fillCircle0003.fillColor = line0001.color;
    [station0002.drawPrimitives addObject:fillCircle0003];
    
    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = CGPointMake(851, 732.5);
    fillCircle0004.radius = 18;
    fillCircle0004.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0002.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 40;
    drawTextLine0003.origin = CGPointMake(886, 705);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0002.nameEnglish;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0004.fontSize = 24;
    drawTextLine0004.origin = CGPointMake(886, 750);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0004];

    // Добавляем вершину
    edge0001.finishVertex = vertex0005;

    // Создаем участок линии Chŏnu - Puhŭng
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Chŏnu - Puhŭng";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0005;
    
    // Добавляем станцию Chŏnsŭng
    [edge0002.elements addObject:station0002];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1691;
    [edge0002.elements addObject:haul0002];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(851, 732);
    drawLine0002.endPoint = CGPointMake(851.5, 892);
    drawLine0002.width = 24;
    drawLine0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию T'ŏngil
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0002.elements addObject:station0003];
    
    station0003.nameOriginal = @"통일 (統一)";
    station0003.nameEnglish = @"T'ŏngil";
    station0003.mapLocation = CGPointMake(851.5, 892);
    station0003.geoLocation = CGPointMake(39.043393, 125.753871);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0003.mapLocation;
    fillCircle0005.radius = 22;
    fillCircle0005.fillColor = line0001.color;
    [station0003.drawPrimitives addObject:fillCircle0005];

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0003.mapLocation;
    fillCircle0006.radius = 18;
    fillCircle0006.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0003.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 40;
    drawTextLine0005.origin = CGPointMake(885, 869);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0003.nameEnglish;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0006.fontSize = 24;
    drawTextLine0006.origin = CGPointMake(886, 914);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1276;
    [edge0002.elements addObject:haul0003];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(851.5, 891.5);
    drawLine0003.endPoint = CGPointMake(852, 997);
    drawLine0003.width = 24;
    drawLine0003.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию Kaesŏn
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0002.elements addObject:station0004];
    
    station0004.nameOriginal = @"개선(凱旋)";
    station0004.nameEnglish = @"Kaesŏn";
    station0004.mapLocation = CGPointMake(852, 997);
    station0004.geoLocation = CGPointMake(39.032135, 125.756382);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0004.mapLocation;
    fillCircle0007.radius = 22;
    fillCircle0007.fillColor = line0001.color;
    [station0004.drawPrimitives addObject:fillCircle0007];

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0004.mapLocation;
    fillCircle0008.radius = 18;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0004.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 40;
    drawTextLine0007.origin = CGPointMake(882, 974);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0004.nameEnglish;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0008.fontSize = 24;
    drawTextLine0008.origin = CGPointMake(882, 1019);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 687;
    [edge0002.elements addObject:haul0004];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(852, 996.5);
    drawLine0004.endPoint = CGPointMake(852, 1127.5);
    drawLine0004.width = 24;
    drawLine0004.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Sŭngri
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0002.elements addObject:station0005];
    
    station0005.nameOriginal = @"승리 (勝利)";
    station0005.nameEnglish = @"Sŭngri";
    station0005.mapLocation = CGPointMake(852, 1127.5);
    station0005.geoLocation = CGPointMake(39.026133, 125.755022);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0005.mapLocation;
    fillCircle0009.radius = 22;
    fillCircle0009.fillColor = line0001.color;
    [station0005.drawPrimitives addObject:fillCircle0009];
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0005.mapLocation;
    fillCircle0010.radius = 18;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0005.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 40;
    drawTextLine0009.origin = CGPointMake(882, 1104);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0009];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0005.nameEnglish;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0010.fontSize = 24;
    drawTextLine0010.origin = CGPointMake(882, 1149);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1861;
    [edge0002.elements addObject:haul0005];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(852, 1127);
    drawLine0005.endPoint = CGPointMake(852, 1274.5);
    drawLine0005.width = 24;
    drawLine0005.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0005];

    // Добавляем станцию Ponghwa
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0002.elements addObject:station0006];
    
    station0006.nameOriginal = @"봉화 (烽火)";
    station0006.nameEnglish = @"Ponghwa";
    station0006.mapLocation = CGPointMake(851.5, 1274.5);
    station0006.geoLocation = CGPointMake(39.012225, 125.744459);

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0006.mapLocation;
    fillCircle0011.radius = 22;
    fillCircle0011.fillColor = line0001.color;
    [station0006.drawPrimitives addObject:fillCircle0011];

    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0006.mapLocation;
    fillCircle0012.radius = 18;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0012];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0006.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 40;
    drawTextLine0011.origin = CGPointMake(882, 1249);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0011];
    
    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0006.nameEnglish;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0012.fontSize = 24;
    drawTextLine0012.origin = CGPointMake(882, 1294);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0012];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 979;
    [edge0002.elements addObject:haul0006];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(851.5, 1274);
    drawLine0006.endPoint = CGPointMake(851.5, 1443);
    drawLine0006.width = 24;
    drawLine0006.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Yŏnggwang
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0002.elements addObject:station0007];
    
    station0007.nameOriginal = @"영광 (榮光)";
    station0007.nameEnglish = @"Yŏnggwang";
    station0007.mapLocation = CGPointMake(851.5, 1443);
    station0007.geoLocation = CGPointMake(39.008052, 125.734525);

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0007.mapLocation;
    fillCircle0013.radius = 22;
    fillCircle0013.fillColor = line0001.color;
    [station0007.drawPrimitives addObject:fillCircle0013];

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0007.mapLocation;
    fillCircle0014.radius = 18;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0014];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0007.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 40;
    drawTextLine0013.origin = CGPointMake(881, 1404);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0013];
    
    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = @"Pyongyang / Yŏnggwang";
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0014.fontSize = 24;
    drawTextLine0014.origin = CGPointMake(882, 1376);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 1612;
    [edge0002.elements addObject:haul0007];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(852, 1443);
    drawLine0007.endPoint = CGPointMake(651.5, 1507.5);
    drawLine0007.width = 24;
    drawLine0007.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Puhŭng
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0002.elements addObject:station0008];
    
    station0008.nameOriginal = @"부흥 (復興)";
    station0008.nameEnglish = @"Puhŭng";
    station0008.mapLocation = CGPointMake(651.5, 1507.5);
    station0008.geoLocation = CGPointMake(39.010862, 125.717489);

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0008.mapLocation;
    fillCircle0015.radius = 27;
    fillCircle0015.fillColor = line0001.color;
    [station0008.drawPrimitives addObject:fillCircle0015];
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0008.mapLocation;
    fillCircle0016.radius = 20;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0008.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 40;
    drawTextLine0015.origin = CGPointMake(555, 1540);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0015];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0008.nameEnglish;
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0016.fontSize = 24;
    drawTextLine0016.origin = CGPointMake(608, 1585);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0016];

    // Добавляем вершину
    edge0002.finishVertex = vertex0002;

    ////////////////////////////////////////////////////////////////
    // #2 Hyŏksin Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Kwangbok - Chŏnsŭng
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Kwangbok - Chŏnsŭng";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0002;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;

    // Добавляем станцию Kwangbok
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0003.elements addObject:station0009];
    
    station0009.nameOriginal = @"광복 (光復)";
    station0009.nameEnglish = @"Kwangbok";
    station0009.mapLocation = CGPointMake(227.5, 1154.5);
    station0009.geoLocation = CGPointMake(39.033966, 125.692235);

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0009.mapLocation;
    fillCircle0017.radius = 27;
    fillCircle0017.fillColor = line0002.color;
    [station0009.drawPrimitives addObject:fillCircle0017];
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0009.mapLocation;
    fillCircle0018.radius = 20;
    fillCircle0018.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0009.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 40;
    drawTextLine0017.origin = CGPointMake(12, 1127);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0017];
    
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0009.nameEnglish;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0018.fontSize = 24;
    drawTextLine0018.origin = CGPointMake(77, 1172);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0018];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 1676;
    [edge0003.elements addObject:haul0008];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(227.5, 1154.5);
    drawLine0008.endPoint = CGPointMake(341, 1155.5);
    drawLine0008.width = 24;
    drawLine0008.color = line0002.color;
    [haul0008.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Kŏn'guk
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0003.elements addObject:station0010];
    
    station0010.nameOriginal = @"건국 (建國)";
    station0010.nameEnglish = @"Kŏn'guk";
    station0010.mapLocation = CGPointMake(341, 1155.5);
    station0010.geoLocation = CGPointMake(39.032687, 125.710596);
    
    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0010.mapLocation;
    fillCircle0019.radius = 22;
    fillCircle0019.fillColor = line0002.color;
    [station0010.drawPrimitives addObject:fillCircle0019];
    
    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0010.mapLocation;
    fillCircle0020.radius = 18;
    fillCircle0020.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0010.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 40;
    drawTextLine0019.origin = CGPointMake(252, 1080);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0019];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0010.nameEnglish;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0020.fontSize = 24;
    drawTextLine0020.origin = CGPointMake(298, 1060);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 1468;
    [edge0003.elements addObject:haul0009];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(340.5, 1155.5);
    drawLine0009.endPoint = CGPointMake(599.5, 1150);
    drawLine0009.width = 24;
    drawLine0009.color = line0002.color;
    [haul0009.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Hwanggŭmbŏl
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0003.elements addObject:station0011];
    
    station0011.nameOriginal = @"황금벌 (黃金벌)";
    station0011.nameEnglish = @"Hwanggŭmbŏl";
    station0011.mapLocation = CGPointMake(599.5, 1150);
    station0011.geoLocation = CGPointMake(39.027704, 125.726215);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0011.mapLocation;
    fillCircle0021.radius = 22;
    fillCircle0021.fillColor = line0002.color;
    [station0011.drawPrimitives addObject:fillCircle0021];
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0011.mapLocation;
    fillCircle0022.radius = 18;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0011.nameOriginal;
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 40;
    drawTextLine0021.origin = CGPointMake(350, 1177);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0021];
    
    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0011.nameEnglish;
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0022.fontSize = 24;
    drawTextLine0022.origin = CGPointMake(442, 1222);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1085;
    [edge0003.elements addObject:haul0010];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(599, 1150.5);
    drawLine0010.endPoint = CGPointMake(627, 1065.5);
    drawLine0010.width = 24;
    drawLine0010.color = line0002.color;
    [haul0010.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Kŏnsŏl
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0003.elements addObject:station0012];
    
    station0012.nameOriginal = @"건설 (建設)";
    station0012.nameEnglish = @"Kŏnsŏl";
    station0012.mapLocation = CGPointMake(627, 1065.5);
    station0012.geoLocation = CGPointMake(39.035188, 125.732402);

    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0012.mapLocation;
    fillCircle0023.radius = 22;
    fillCircle0023.fillColor = line0002.color;
    [station0012.drawPrimitives addObject:fillCircle0023];
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0012.mapLocation;
    fillCircle0024.radius = 18;
    fillCircle0024.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0012.nameOriginal;
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 40;
    drawTextLine0023.origin = CGPointMake(652, 1038);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0023];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = station0012.nameEnglish;
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0024.fontSize = 24;
    drawTextLine0024.origin = CGPointMake(652, 1083);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0024];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 1733;
    [edge0003.elements addObject:haul0011];
    
    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(626.5, 1066);
    drawLine0011.endPoint = CGPointMake(654.5, 971.5);
    drawLine0011.width = 24;
    drawLine0011.color = line0002.color;
    [haul0011.drawPrimitives addObject:drawLine0011];

    // Добавляем станцию Hyŏksin
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0003.elements addObject:station0013];
    
    station0013.nameOriginal = @"혁신 (革新)";
    station0013.nameEnglish = @"Hyŏksin";
    station0013.mapLocation = CGPointMake(654.5, 971.5);
    station0013.geoLocation = CGPointMake(39.048535, 125.740383);
    
    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0013.mapLocation;
    fillCircle0025.radius = 22;
    fillCircle0025.fillColor = line0002.color;
    [station0013.drawPrimitives addObject:fillCircle0025];
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0013.mapLocation;
    fillCircle0026.radius = 18;
    fillCircle0026.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0026];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = station0013.nameOriginal;
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 40;
    drawTextLine0025.origin = CGPointMake(480, 897);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0025];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0013.nameEnglish;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0026.fontSize = 24;
    drawTextLine0026.origin = CGPointMake(574, 871);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1510;
    [edge0003.elements addObject:haul0012];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(654, 972);
    drawLine0012.endPoint = CGPointMake(853, 680.5);
    drawLine0012.width = 24;
    drawLine0012.color = line0002.color;
    [haul0012.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию Chŏnsŭng
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0003.elements addObject:station0014];
    
    station0014.nameOriginal = @"전승 (戰勝)";
    station0014.nameEnglish = @"Chŏnsŭng";
    station0014.mapLocation = CGPointMake(853, 680.5);
    station0014.geoLocation = CGPointMake(39.057568, 125.752827);

    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0014.mapLocation;
    fillCircle0027.radius = 22;
    fillCircle0027.fillColor = line0002.color;
    [station0014.drawPrimitives addObject:fillCircle0027];
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0014.mapLocation;
    fillCircle0028.radius = 18;
    fillCircle0028.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0014.nameOriginal;
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 40;
    drawTextLine0027.origin = CGPointMake(886, 657);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0027];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = station0014.nameEnglish;
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0028.fontSize = 24;
    drawTextLine0028.origin = CGPointMake(914, 629);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0028];
    
    // Добавляем вершину
    edge0003.finishVertex = vertex0005;

    // Создаем участок линии Chŏnsŭng - Ragwŏn
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Chŏnsŭng - Ragwŏn";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0002;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0005;

    // Добавляем станцию Chŏnsŭng
    [edge0004.elements addObject:station0014];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 1459;
    [edge0004.elements addObject:haul0013];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(852.5, 681);
    drawLine0013.endPoint = CGPointMake(965.5, 525.5);
    drawLine0013.width = 24;
    drawLine0013.color = line0002.color;
    [haul0013.drawPrimitives addObject:drawLine0013];

    // Добавляем станцию Samhŭng
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0004.elements addObject:station0015];
    
    station0015.nameOriginal = @"삼흥 (三興)";
    station0015.nameEnglish = @"Samhŭng";
    station0015.mapLocation = CGPointMake(965.5, 525.5);
    station0015.geoLocation = CGPointMake(39.063174, 125.768057);
    
    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0015.mapLocation;
    fillCircle0029.radius = 22;
    fillCircle0029.fillColor = line0002.color;
    [station0015.drawPrimitives addObject:fillCircle0029];
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0015.mapLocation;
    fillCircle0030.radius = 18;
    fillCircle0030.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0030];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0015.nameOriginal;
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 40;
    drawTextLine0029.origin = CGPointMake(961, 547);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0029];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = station0015.nameEnglish;
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0030.fontSize = 24;
    drawTextLine0030.origin = CGPointMake(961, 592);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0030];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1761;
    [edge0004.elements addObject:haul0014];
    
    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(965, 525.5);
    drawLine0014.endPoint = CGPointMake(1370, 524);
    drawLine0014.width = 24;
    drawLine0014.color = line0002.color;
    [haul0014.drawPrimitives addObject:drawLine0014];

    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = CGPointMake(1165.5, 525.5);
    fillCircle0031.radius = 22;
    fillCircle0031.fillColor = line0002.color;
    [haul0014.drawPrimitives addObject:fillCircle0031];
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = CGPointMake(1165.5, 525.5);
    fillCircle0032.radius = 18;
    fillCircle0032.fillColor = [UIColor lightGrayColor];
    [haul0014.drawPrimitives addObject:fillCircle0032];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"광명 (光明)";
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor lightGrayColor];
    drawTextLine0031.fontSize = 40;
    drawTextLine0031.origin = CGPointMake(1076, 449);
    [haul0014.drawPrimitives addObject:drawTextLine0031];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = @"Kwangmyŏng";
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor lightGrayColor];
    drawTextLine0032.fontSize = 24;
    drawTextLine0032.origin = CGPointMake(1094, 421);
    [haul0014.drawPrimitives addObject:drawTextLine0032];

    // Добавляем станцию Ragwŏn
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0004.elements addObject:station0016];
    
    station0016.nameOriginal = @"락원 (樂園)";
    station0016.nameEnglish = @"Ragwŏn";
    station0016.mapLocation = CGPointMake(1370, 524);
    station0016.geoLocation = CGPointMake(39.067220, 125.787574);

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0016.mapLocation;
    fillCircle0033.radius = 27;
    fillCircle0033.fillColor = line0002.color;
    [station0016.drawPrimitives addObject:fillCircle0033];
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0016.mapLocation;
    fillCircle0034.radius = 20;
    fillCircle0034.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0034];
    
    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0016.nameOriginal;
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 40;
    drawTextLine0033.origin = CGPointMake(1403, 501);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0033];
    
    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0016.nameEnglish;
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0034.fontSize = 24;
    drawTextLine0034.origin = CGPointMake(1403, 546);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0034];
    
    // Добавляем вершину
    edge0004.finishVertex = vertex0004;

    ////////////////////////
    
    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(599.5, 1150);
    drawLine0017.endPoint = CGPointMake(567.5, 1108);
    drawLine0017.width = 18;
    drawLine0017.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0017];
    
    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = CGPointMake(599.5, 1150);
    fillCircle0039.radius = 22;
    fillCircle0039.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0039];
    
    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = CGPointMake(599.5, 1150);
    fillCircle0040.radius = 18;
    fillCircle0040.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0040];
    
    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = CGPointMake(567.5, 1108);
    fillCircle0041.radius = 22;
    fillCircle0041.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0041];
    
    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = CGPointMake(567.5, 1108);
    fillCircle0042.radius = 18;
    fillCircle0042.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0042];
    
    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(599.5, 1150);
    drawLine0018.endPoint = CGPointMake(567.5, 1108);
    drawLine0018.width = 12;
    drawLine0018.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0018];

    ///
    
    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(851.5, 1443);
    drawLine0019.endPoint = CGPointMake(819, 1401);
    drawLine0019.width = 18;
    drawLine0019.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0019];
    
    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = CGPointMake(851.5, 1443);
    fillCircle0043.radius = 22;
    fillCircle0043.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0043];
    
    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = CGPointMake(851.5, 1443);
    fillCircle0044.radius = 18;
    fillCircle0044.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0044];
    
    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = CGPointMake(819, 1401);
    fillCircle0045.radius = 22;
    fillCircle0045.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0045];
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = CGPointMake(819, 1401);
    fillCircle0046.radius = 18;
    fillCircle0046.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0046];
    
    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(851.5, 1443);
    drawLine0020.endPoint = CGPointMake(819, 1401);
    drawLine0020.width = 12;
    drawLine0020.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0020];

    return self;
}

@end
