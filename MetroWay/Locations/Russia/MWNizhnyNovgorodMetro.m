//
//  MMNizhnyNovgorodMetro.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 25.08.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWNizhnyNovgorodMetro.h"

@implementation MWNizhnyNovgorodMetro

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"nizhny_novgorod_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Автозаводская
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"1. Автозаводская";
    line0001.nameEnglish = @"1. Avtozavodskaya";
    line0001.color = [UIColor colorWithRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0001];

    // 2. Сормовская
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"2. Сормовская";
    line0002.nameEnglish = @"2. Sormovskaya";
    line0002.color = [UIColor colorWithRed:(19/255.0) green:(124/255.0) blue:(181/255.0) alpha:1];
    [self.lines addObject:line0002];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0002];

    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Московская
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Московская";
    [self.vertices addObject:vertex0001];

    // Горьковская
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Горьковская";
    [self.vertices addObject:vertex0002];

    // Парк культуры
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Парк культуры";
    [self.vertices addObject:vertex0003];

    // Буревестник
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Буревестник";
    [self.vertices addObject:vertex0004];

    ////////////////////////////////////////////////////////////////
    // 1. Автозаводская
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Горьковская - Московская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Горьковская - Московская";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0002;

    // Добавляем станцию Горьковская
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Горьковская";
    station0001.nameEnglish = @"Gorkovskaya";
    station0001.mapLocation = CGPointMake(785, 468);
    station0001.geoLocation = CGPointMake(56.313889, 43.995);
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 27;
    drawTextLine0001.origin = CGPointMake(709, 483);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0001.nameEnglish;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0002.fontSize = 18;
    drawTextLine0002.origin = CGPointMake(739, 513);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0002];

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = station0001.mapLocation;
    fillCircle0001.radius = 24;
    fillCircle0001.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0001.mapLocation;
    fillCircle0002.radius = 17;
    fillCircle0002.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 3184;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(775, 468);
    drawLine0001.endPoint = CGPointMake(718, 468);
    drawLine0001.width = 22;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(718, 418);
    drawArc0001.startRadians = 90 * M_PI / 180;
    drawArc0001.endRadians = 135 * M_PI / 180;
    drawArc0001.radius = 50;
    drawArc0001.width = 22;
    drawArc0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(655, 426);
    drawLine0002.endPoint = CGPointMake(683, 454);
    drawLine0002.width = 22;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(620, 462);
    drawArc0002.startRadians = 270 * M_PI / 180;
    drawArc0002.endRadians = 315 * M_PI / 180;
    drawArc0002.radius = 50;
    drawArc0002.width = 22;
    drawArc0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0002];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(620, 412);
    drawLine0003.endPoint = CGPointMake(595, 412);
    drawLine0003.width = 22;
    drawLine0003.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию Московская
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Московская";
    station0002.nameEnglish = @"Moskovskaya";
    station0002.mapLocation = CGPointMake(595, 412);
    station0002.geoLocation = CGPointMake(56.321361, 43.945156);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0002.mapLocation;
    fillCircle0003.radius = 24;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0003];
    
    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0002.mapLocation;
    fillCircle0004.radius = 17;
    fillCircle0004.fillColor = line0001.color;
    [station0002.drawPrimitives addObject:fillCircle0004];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(613, 428);
    drawLine0005.endPoint = CGPointMake(690, 428);
    drawLine0005.width = 24;
    drawLine0005.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.3];
    [station0002.nameOriginalTextPrimitives addObject:drawLine0005];
    
    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(660, 456);
    drawLine0006.endPoint = CGPointMake(750, 456);
    drawLine0006.width = 16;
    drawLine0006.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0002.nameEnglishTextPrimitives addObject:drawLine0006];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0002.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 27;
    drawTextLine0003.origin = CGPointMake(611, 411);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0002.nameEnglish;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0004.fontSize = 18;
    drawTextLine0004.origin = CGPointMake(638, 443);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0004];

    // Добавляем вершину
    edge0001.finishVertex = vertex0001;

    // Создаем участок линии Московская - Парк культуры
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Московская - Парк культуры";
    [self.edges addObject:(edge0002)];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0001;

    // Добавляем станцию Московская
    [edge0002.elements addObject:station0002];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1191;
    [edge0002.elements addObject:haul0002];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(595, 412);
    drawLine0004.endPoint = CGPointMake(515, 491.5);
    drawLine0004.width = 22;
    drawLine0004.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Чкаловская
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0002.elements addObject:station0003];
    
    station0003.nameOriginal = @"Чкаловская";
    station0003.nameEnglish = @"Chkalovskaya";
    station0003.mapLocation = CGPointMake(515, 491.5);
    station0003.geoLocation = CGPointMake(56.311486, 43.937669);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0003.mapLocation;
    fillCircle0005.radius = 24;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0005];
    
    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0003.mapLocation;
    fillCircle0006.radius = 17;
    fillCircle0006.fillColor = line0001.color;
    [station0003.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0003.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 27;
    drawTextLine0005.origin = CGPointMake(534, 491);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0003.nameEnglish;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0006.fontSize = 18;
    drawTextLine0006.origin = CGPointMake(530, 521);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1496;
    [edge0002.elements addObject:haul0003];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(515.5, 491);
    drawLine0007.endPoint = CGPointMake(513, 493.5);
    drawLine0007.width = 22;
    drawLine0007.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0007];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(549, 528);
    drawArc0003.startRadians = 180 * M_PI / 180;
    drawArc0003.endRadians = 225 * M_PI / 180;
    drawArc0003.radius = 50;
    drawArc0003.width = 22;
    drawArc0003.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(499, 528);
    drawLine0008.endPoint = CGPointMake(499, 620);
    drawLine0008.width = 22;
    drawLine0008.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Ленинская
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0002.elements addObject:station0004];
    
    station0004.nameOriginal = @"Ленинская";
    station0004.nameEnglish = @"Leninskaya";
    station0004.mapLocation = CGPointMake(499, 620);
    station0004.geoLocation = CGPointMake(56.298028, 43.937533);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0004.mapLocation;
    fillCircle0007.radius = 24;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0007];
    
    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0004.mapLocation;
    fillCircle0008.radius = 17;
    fillCircle0008.fillColor = line0001.color;
    [station0004.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0004.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 27;
    drawTextLine0007.origin = CGPointMake(340, 602);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0004.nameEnglish;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0008.fontSize = 18;
    drawTextLine0008.origin = CGPointMake(390, 632);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 1477;
    [edge0002.elements addObject:haul0004];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(499, 619.5);
    drawLine0009.endPoint = CGPointMake(499, 745);
    drawLine0009.width = 22;
    drawLine0009.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Заречная
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0002.elements addObject:station0005];
    
    station0005.nameOriginal = @"Заречная";
    station0005.nameEnglish = @"Zarechnaya";
    station0005.mapLocation = CGPointMake(499, 745);
    station0005.geoLocation = CGPointMake(56.285833, 43.928056);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0005.mapLocation;
    fillCircle0009.radius = 24;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0009];
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0005.mapLocation;
    fillCircle0010.radius = 17;
    fillCircle0010.fillColor = line0001.color;
    [station0005.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0005.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 27;
    drawTextLine0009.origin = CGPointMake(358, 727);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0009];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0005.nameEnglish;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0010.fontSize = 18;
    drawTextLine0010.origin = CGPointMake(388, 709);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1204;	
    [edge0002.elements addObject:haul0005];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(499, 744.5);
    drawLine0010.endPoint = CGPointMake(499, 782);
    drawLine0010.width = 22;
    drawLine0010.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0010];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(449, 781.5);
    drawArc0004.startRadians = 0 * M_PI / 180;
    drawArc0004.endRadians = 45 * M_PI / 180;
    drawArc0004.radius = 50;
    drawArc0004.width = 22;
    drawArc0004.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(484.5, 817);
    drawLine0011.endPoint = CGPointMake(482.5, 819);
    drawLine0011.width = 22;
    drawLine0011.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0011];

    // Добавляем станцию Двигатель революции
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0002.elements addObject:station0006];
    
    station0006.nameOriginal = @"Двигатель революции";
    station0006.nameEnglish = @"Dvigatel Revolutsii";
    station0006.mapLocation = CGPointMake(482.5, 819);
    station0006.geoLocation = CGPointMake(56.275833, 43.920556);

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0006.mapLocation;
    fillCircle0011.radius = 24;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0011];
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0006.mapLocation;
    fillCircle0012.radius = 17;
    fillCircle0012.fillColor = line0001.color;
    [station0006.drawPrimitives addObject:fillCircle0012];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = @"Двигатель";
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 27;
    drawTextLine0011.origin = CGPointMake(320, 769);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0011];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = @"революции";
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 27;
    drawTextLine0012.origin = CGPointMake(320, 792);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0012];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0006.nameEnglish;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0013.fontSize = 18;
    drawTextLine0013.origin = CGPointMake(290, 822);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0013];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 867;
    [edge0002.elements addObject:haul0006];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(483, 818.5);
    drawLine0012.endPoint = CGPointMake(416.5, 885.5);
    drawLine0012.width = 22;
    drawLine0012.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию Пролетарская
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0002.elements addObject:station0007];
    
    station0007.nameOriginal = @"Пролетарская";
    station0007.nameEnglish = @"Proletarskaya";
    station0007.mapLocation = CGPointMake(416.5, 885.5);
    station0007.geoLocation = CGPointMake(56.282222, 43.9125);

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0007.mapLocation;
    fillCircle0013.radius = 24;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0013];
    
    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0007.mapLocation;
    fillCircle0014.radius = 17;
    fillCircle0014.fillColor = line0001.color;
    [station0007.drawPrimitives addObject:fillCircle0014];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0007.nameOriginal;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 27;
    drawTextLine0014.origin = CGPointMake(216, 854);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0014];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0007.nameEnglish;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0015.fontSize = 18;
    drawTextLine0015.origin = CGPointMake(267, 884);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0015];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 2765;
    [edge0002.elements addObject:haul0007];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(417, 885);
    drawLine0013.endPoint = CGPointMake(355.5, 947);
    drawLine0013.width = 22;
    drawLine0013.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0013];

    // Добавляем станцию Автозаводская
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0002.elements addObject:station0008];
    
    station0008.nameOriginal = @"Автозаводская";
    station0008.nameEnglish = @"Avtozavodskaya";
    station0008.mapLocation = CGPointMake(355.5, 947);
    station0008.geoLocation = CGPointMake(56.258056, 43.901944);

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0008.mapLocation;
    fillCircle0015.radius = 24;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0015];
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0008.mapLocation;
    fillCircle0016.radius = 17;
    fillCircle0016.fillColor = line0001.color;
    [station0008.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0008.nameOriginal;
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 27;
    drawTextLine0016.origin = CGPointMake(145, 907);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0016];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0008.nameEnglish;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0017.fontSize = 18;
    drawTextLine0017.origin = CGPointMake(190, 934);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0017];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 962;
    [edge0002.elements addObject:haul0008];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(356, 946.5);
    drawLine0014.endPoint = CGPointMake(312.5, 989.5);
    drawLine0014.width = 22;
    drawLine0014.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0014];

    // Добавляем станцию Комсомольская
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0002.elements addObject:station0009];
    
    station0009.nameOriginal = @"Комсомольская";
    station0009.nameEnglish = @"Komsomolskaya";
    station0009.mapLocation = CGPointMake(312.5, 989.5);
    station0009.geoLocation = CGPointMake(56.2525, 43.89);

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0009.mapLocation;
    fillCircle0017.radius = 24;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0017];
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0009.mapLocation;
    fillCircle0018.radius = 17;
    fillCircle0018.fillColor = line0001.color;
    [station0009.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0009.nameOriginal;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 27;
    drawTextLine0018.origin = CGPointMake(91, 957);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0018];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0009.nameEnglish;
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0019.fontSize = 18;
    drawTextLine0019.origin = CGPointMake(141, 987);
    [station0009.nameEnglishTextPrimitives addObject:drawTextLine0019];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 891;
    [edge0002.elements addObject:haul0009];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(313, 989);
    drawLine0015.endPoint = CGPointMake(266, 1035.5);
    drawLine0015.width = 22;
    drawLine0015.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0015];

    // Добавляем станцию Кировская
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0002.elements addObject:station0010];
    
    station0010.nameOriginal = @"Кировская";
    station0010.nameEnglish = @"Kirovskaya";
    station0010.mapLocation = CGPointMake(266, 1035.5);
    station0010.geoLocation = CGPointMake(56.247778, 43.878333);

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0010.mapLocation;
    fillCircle0019.radius = 24;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0019];
    
    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0010.mapLocation;
    fillCircle0020.radius = 17;
    fillCircle0020.fillColor = line0001.color;
    [station0010.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0010.nameOriginal;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 27;
    drawTextLine0020.origin = CGPointMake(108, 1010);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0020];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0010.nameEnglish;
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0021.fontSize = 18;
    drawTextLine0021.origin = CGPointMake(132, 1040);
    [station0010.nameEnglishTextPrimitives addObject:drawTextLine0021];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1380;
    [edge0002.elements addObject:haul0010];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(266.5, 1035);
    drawLine0016.endPoint = CGPointMake(198.5, 1103.5);
    drawLine0016.width = 22;
    drawLine0016.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию Парк Культуры
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0002.elements addObject:station0011];
    
    station0011.nameOriginal = @"Парк культуры";
    station0011.nameEnglish = @"Park kultury";
    station0011.mapLocation = CGPointMake(198.5, 1103.5);
    station0011.geoLocation = CGPointMake(56.241667, 43.858889);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0011.mapLocation;
    fillCircle0021.radius = 24;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0021];
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0011.mapLocation;
    fillCircle0022.radius = 17;
    fillCircle0022.fillColor = line0001.color;
    [station0011.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = @"Парк";
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 27;
    drawTextLine0022.origin = CGPointMake(56, 1053);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0022];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = @"Культуры";
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 27;
    drawTextLine0023.origin = CGPointMake(56, 1078);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0023];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = station0011.nameEnglish;
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0024.fontSize = 18;
    drawTextLine0024.origin = CGPointMake(82, 1108);
    [station0011.nameEnglishTextPrimitives addObject:drawTextLine0024];

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;
    
    ////////////////////////////////////////////////////////////////
    // 2. Сормовская
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Буревестник - Московская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Буревестник - Московская";
    [self.edges addObject:(edge0003)];

    // Добавляем линию
    edge0003.line = line0002;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0004;
    
    // Добавляем станцию Буревестник
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0003.elements addObject:station0012];
    
    station0012.nameOriginal = @"Буревестник";
    station0012.nameEnglish = @"Gorkovskaya";
    station0012.mapLocation = CGPointMake(335.5, 316);
    station0012.geoLocation = CGPointMake(56.3333, 43.8942);

    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0012.mapLocation;
    fillCircle0023.radius = 24;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0023];
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0012.mapLocation;
    fillCircle0024.radius = 17;
    fillCircle0024.fillColor = line0002.color;
    [station0012.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = station0012.nameOriginal;
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 27;
    drawTextLine0025.origin = CGPointMake(152, 310);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0025];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0012.nameEnglish;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0026.fontSize = 18;
    drawTextLine0026.origin = CGPointMake(225, 340);
    [station0012.nameEnglishTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 1197;
    [edge0003.elements addObject:haul0011];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(335.5, 316);
    drawLine0017.endPoint = CGPointMake(404, 385);
    drawLine0017.width = 22;
    drawLine0017.color = line0002.color;
    [haul0011.drawPrimitives addObject:drawLine0017];

    // Добавляем станцию Бурнаковская
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0003.elements addObject:station0013];
    
    station0013.nameOriginal = @"Бурнаковская";
    station0013.nameEnglish = @"Burnakovskaya";
    station0013.mapLocation = CGPointMake(404, 385);
    station0013.geoLocation = CGPointMake(56.32732, 43.91035);

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0013.mapLocation;
    fillCircle0025.radius = 24;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0025];
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0013.mapLocation;
    fillCircle0026.radius = 17;
    fillCircle0026.fillColor = line0002.color;
    [station0013.drawPrimitives addObject:fillCircle0026];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0013.nameOriginal;
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 27;
    drawTextLine0027.origin = CGPointMake(205, 378);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0027];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = station0013.nameEnglish;
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0028.fontSize = 18;
    drawTextLine0028.origin = CGPointMake(275, 408);
    [station0013.nameEnglishTextPrimitives addObject:drawTextLine0028];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1185;
    [edge0003.elements addObject:haul0012];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(403.5, 384.5);
    drawLine0018.endPoint = CGPointMake(438, 419);
    drawLine0018.width = 22;
    drawLine0018.color = line0002.color;
    [haul0012.drawPrimitives addObject:drawLine0018];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(480, 376);
    drawArc0005.startRadians = 90 * M_PI / 180;
    drawArc0005.endRadians = 135 * M_PI / 180;
    drawArc0005.radius = 60;
    drawArc0005.width = 22;
    drawArc0005.color = line0002.color;
    [haul0012.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(480, 436);
    drawLine0019.endPoint = CGPointMake(483, 436);
    drawLine0019.width = 22;
    drawLine0019.color = line0002.color;
    [haul0012.drawPrimitives addObject:drawLine0019];

    // Добавляем станцию Канавинская
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0003.elements addObject:station0014];
    
    station0014.nameOriginal = @"Канавинская";
    station0014.nameEnglish = @"Kanavinskaya";
    station0014.mapLocation = CGPointMake(483, 436);
    station0014.geoLocation = CGPointMake(56.3208, 43.92556);

    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0014.mapLocation;
    fillCircle0027.radius = 24;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0027];
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0014.mapLocation;
    fillCircle0028.radius = 17;
    fillCircle0028.fillColor = line0002.color;
    [station0014.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0014.nameOriginal;
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 27;
    drawTextLine0029.origin = CGPointMake(326, 451);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0029];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = station0014.nameEnglish;
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0030.fontSize = 18;
    drawTextLine0030.origin = CGPointMake(375, 481);
    [station0014.nameEnglishTextPrimitives addObject:drawTextLine0030];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 1210;
    [edge0003.elements addObject:haul0013];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(482.5, 436);
    drawLine0020.endPoint = CGPointMake(546, 436);
    drawLine0020.width = 22;
    drawLine0020.color = line0002.color;
    [haul0013.drawPrimitives addObject:drawLine0020];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(546, 376);
    drawArc0006.startRadians = 45 * M_PI / 180;
    drawArc0006.endRadians = 90 * M_PI / 180;
    drawArc0006.radius = 60;
    drawArc0006.width = 22;
    drawArc0006.color = line0002.color;
    [haul0013.drawPrimitives addObject:drawArc0006];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(587, 420);
    drawLine0021.endPoint = CGPointMake(595, 412);
    drawLine0021.width = 22;
    drawLine0021.color = line0002.color;
    [haul0013.drawPrimitives addObject:drawLine0021];

    // Добавляем станцию Московская
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0003.elements addObject:station0015];
    
    station0015.nameOriginal = @"Московская";
    station0015.nameEnglish = @"Moskovskaya";
    station0015.mapLocation = CGPointMake(595, 412);
    station0015.geoLocation = CGPointMake(56.321361, 43.945156);

    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0015.mapLocation;
    fillCircle0029.radius = 24;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0029];
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0015.mapLocation;
    fillCircle0030.radius = 17;
    fillCircle0030.fillColor = line0002.color;
    [station0015.drawPrimitives addObject:fillCircle0030];

    station0015.showNameOnMap = false;
    [station0015.nameOriginalTextPrimitives addObject:drawLine0005];
    [station0015.nameEnglishTextPrimitives addObject:drawLine0006];
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0003];
    [station0015.nameEnglishTextPrimitives addObject:drawTextLine0004];
    
    // Добавляем вершину
    edge0003.finishVertex = vertex0001;

    ///////////////////////////////////////////////////////////////

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(329.5, 295.5);
    drawLine0022.endPoint = CGPointMake(299.5, 265.5);
    drawLine0022.width = 1;
    drawLine0022.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0022];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(314.5, 310.5);
    drawLine0023.endPoint = CGPointMake(284.5, 280.5);
    drawLine0023.width = 1;
    drawLine0023.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0023];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(279, 260);
    drawArc0007.startRadians = 0 * M_PI / 180;
    drawArc0007.endRadians = 360 * M_PI / 180;
    drawArc0007.radius = 15;
    drawArc0007.width = 1;
    drawArc0007.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawArc0007];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"Варя";
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0031.fontSize = 27;
    drawTextLine0031.origin = CGPointMake(196, 254);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0031];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = @"Varya";
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0032.fontSize = 18;
    drawTextLine0032.origin = CGPointMake(226, 284);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0032];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(273.5, 239.5);
    drawLine0024.endPoint = CGPointMake(229.5, 195.5);
    drawLine0024.width = 1;
    drawLine0024.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0024];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(258.5, 254.5);
    drawLine0025.endPoint = CGPointMake(214.5, 210.5);
    drawLine0025.width = 1;
    drawLine0025.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0025];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(209, 189.5);
    drawArc0008.startRadians = 0 * M_PI / 180;
    drawArc0008.endRadians = 360 * M_PI / 180;
    drawArc0008.radius = 15;
    drawArc0008.width = 1;
    drawArc0008.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawArc0008];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = @"Сормовская";
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0033.fontSize = 27;
    drawTextLine0033.origin = CGPointMake(33, 183);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0033];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = @"Sormovskaya";
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0034.fontSize = 18;
    drawTextLine0034.origin = CGPointMake(90, 213);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0034];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(600.5, 392.5);
    drawLine0026.endPoint = CGPointMake(613.5, 378.5);
    drawLine0026.width = 1;
    drawLine0026.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0026];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(618.5, 403.5);
    drawLine0027.endPoint = CGPointMake(628.5, 393.5);
    drawLine0027.width = 1;
    drawLine0027.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0027];

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(634.5, 372.5);
    drawArc0009.startRadians = 0 * M_PI / 180;
    drawArc0009.endRadians = 360 * M_PI / 180;
    drawArc0009.radius = 15;
    drawArc0009.width = 1;
    drawArc0009.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawArc0009];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = @"Ярмарка";
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0035.fontSize = 27;
    drawTextLine0035.origin = CGPointMake(503, 341);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0035];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = @"Yarmarka";
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0036.fontSize = 18;
    drawTextLine0036.origin = CGPointMake(539, 323);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0036];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(803, 457);
    drawLine0028.endPoint = CGPointMake(887, 457);
    drawLine0028.width = 1;
    drawLine0028.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0028];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(803, 478);
    drawLine0029.endPoint = CGPointMake(887, 478);
    drawLine0029.width = 1;
    drawLine0029.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0029];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(905.5, 467.5);
    drawArc0010.startRadians = 0 * M_PI / 180;
    drawArc0010.endRadians = 360 * M_PI / 180;
    drawArc0010.radius = 15;
    drawArc0010.width = 1;
    drawArc0010.color = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawArc0010];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"Пл. Свободы";
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0037.fontSize = 27;
    drawTextLine0037.origin = CGPointMake(838, 419);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0037];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"Ploschad Svobody";
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor colorWithRed:(193/255.0) green:(192/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0038.fontSize = 18;
    drawTextLine0038.origin = CGPointMake(845, 399);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0038];

    // Речка
    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(250, -29);
    drawLine0030.endPoint = CGPointMake(430, 151);
    drawLine0030.width = 44;
    drawLine0030.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawLine0030];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(501, 80);
    drawArc0011.startRadians = 90 * M_PI / 180;
    drawArc0011.endRadians = 135 * M_PI / 180;
    drawArc0011.radius = 100;
    drawArc0011.width = 44;
    drawArc0011.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(500, 180);
    drawLine0031.endPoint = CGPointMake(586, 180);
    drawLine0031.width = 44;
    drawLine0031.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawLine0031];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(586, 280);
    drawArc0012.startRadians = 270 * M_PI / 180;
    drawArc0012.endRadians = 315 * M_PI / 180;
    drawArc0012.radius = 100;
    drawArc0012.width = 44;
    drawArc0012.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawArc0012];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(656.5, 209);
    drawLine0032.endPoint = CGPointMake(709.5, 262);
    drawLine0032.width = 44;
    drawLine0032.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawLine0032];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(780, 191);
    drawArc0013.startRadians = 90 * M_PI / 180;
    drawArc0013.endRadians = 135 * M_PI / 180;
    drawArc0013.radius = 100;
    drawArc0013.width = 44;
    drawArc0013.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawArc0013];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(280, 1274);
    drawLine0033.endPoint = CGPointMake(613, 941);
    drawLine0033.width = 44;
    drawLine0033.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawLine0033];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(542, 870.5);
    drawArc0014.startRadians = 0 * M_PI / 180;
    drawArc0014.endRadians = 45 * M_PI / 180;
    drawArc0014.radius = 100;
    drawArc0014.width = 44;
    drawArc0014.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(642, 878);
    drawLine0034.endPoint = CGPointMake(642, 475);
    drawLine0034.width = 44;
    drawLine0034.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawLine0034];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(742, 476.5);
    drawArc0015.startRadians = 180 * M_PI / 180;
    drawArc0015.endRadians = 225 * M_PI / 180;
    drawArc0015.radius = 100;
    drawArc0015.width = 44;
    drawArc0015.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(670, 407);
    drawLine0035.endPoint = CGPointMake(757, 320);
    drawLine0035.width = 44;
    drawLine0035.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawLine0035];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(827.5, 391);
    drawArc0016.startRadians = 225 * M_PI / 180;
    drawArc0016.endRadians = 270 * M_PI / 180;
    drawArc0016.radius = 100;
    drawArc0016.width = 44;
    drawArc0016.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawArc0016];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(770, 291);
    drawLine0036.endPoint = CGPointMake(1030, 291);
    drawLine0036.width = 44;
    drawLine0036.color = [UIColor colorWithRed:(243/255.0) green:(247/255.0) blue:(248/255.0) alpha:0.5];
    [self.additionalUnderMapPrimitives addObject:drawLine0036];

    return self;
}
    
@end
