//
//  MMKyotoSubway.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 10.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWKyotoSubway.h"

@implementation MWKyotoSubway

- (id)init
{
    // Инициализируем
    self = [super init];
    
    self.identifier = @"kyoto_subway";
    [self setMinimumZoomScale: 0.18];
    [self setMaximumZoomScale: 1.5];
    [self setInitialZoomScale: 0.18];
    [self setContentOffset:CGPointMake(0, -20)];
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Karasuma Line
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameEnglish = @"Karasuma Line";
    line0001.nameOriginal = @"烏丸線";
    line0001.color = [UIColor colorWithRed:(15/255.0) green:(182/255.0) blue:(202/255.0) alpha:1];
    [self.lines addObject:line0001];

    // 2. Tōzai Line
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameEnglish = @"Tōzai Line";
    line0002.nameOriginal = @"東西線";
    line0002.color = [UIColor colorWithRed:(234/255.0) green:(84/255.0) blue:(4/255.0) alpha:1];
    [self.lines addObject:line0002];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0001];
 
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Kokusaikaikan
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Kokusaikaikan";
    [self.vertices addObject:vertex0001];

    // Karasuma Oike
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Karasuma Oike";
    [self.vertices addObject:vertex0002];

    // Takeda
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Takeda";
    [self.vertices addObject:vertex0003];

    // Rokujizo
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Rokujizo";
    [self.vertices addObject:vertex0004];

    // Uzumasa Tenjingawa
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Uzumasa Tenjingawa";
    [self.vertices addObject:vertex0005];

    ////////////////////////////////////////////////////////////////
    // 1. Karasuma Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Kokusaikaikan - Karasuma Oike
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Kokusaikaikan - Karasuma Oike";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Kokusaikaikan
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"国際会館駅";
    station0001.nameEnglish = @"Kokusaikaikan";
    station0001.mapLocation = CGPointMake(834, 231.5);
    station0001.geoLocation = CGPointMake(35.062942, 135.785217);
    
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = station0001.mapLocation;
    fillCircle0001.radius = 43;
    fillCircle0001.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0001.mapLocation;
    fillCircle0002.radius = 37;
    fillCircle0002.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0001.drawPrimitives addObject:fillCircle0002];

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = @"K";
    drawTextLine0001.fontColor = [UIColor whiteColor];
    drawTextLine0001.fontSize = 36;
    drawTextLine0001.origin = CGPointMake(822, 194);
    [station0001.drawPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = @"01";
    drawTextLine0002.fontColor = [UIColor whiteColor];
    drawTextLine0002.fontSize = 36;
    drawTextLine0002.origin = CGPointMake(816, 226);
    [station0001.drawPrimitives addObject:drawTextLine0002];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0001.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 40;
    drawTextLine0003.origin = CGPointMake(889, 207);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0003];
     
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0001.nameEnglish;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0004.fontSize = 34;
    drawTextLine0004.origin = CGPointMake(889, 252);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0004];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1600;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(834, 231.5);
    drawLine0001.endPoint = CGPointMake(754, 315);
    drawLine0001.width = 52;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];
    
    // Добавляем станцию Matsugasaki
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"松ヶ崎駅";
    station0002.nameEnglish = @"Matsugasaki";
    station0002.mapLocation = CGPointMake(754, 315);
    station0002.geoLocation = CGPointMake(35.051656, 135.777114);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0002.mapLocation;
    fillCircle0003.radius = 43;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0003];

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0002.mapLocation;
    fillCircle0004.radius = 37;
    fillCircle0004.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0002.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = @"K";
    drawTextLine0005.fontColor = [UIColor whiteColor];
    drawTextLine0005.fontSize = 36;
    drawTextLine0005.origin = CGPointMake(742, 277);
    [station0002.drawPrimitives addObject:drawTextLine0005];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = @"02";
    drawTextLine0006.fontColor = [UIColor whiteColor];
    drawTextLine0006.fontSize = 36;
    drawTextLine0006.origin = CGPointMake(733, 308);
    [station0002.drawPrimitives addObject:drawTextLine0006];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0002.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 40;
    drawTextLine0007.origin = CGPointMake(781, 334);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0007];
    
    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0002.nameEnglish;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0008.fontSize = 34;
    drawTextLine0008.origin = CGPointMake(781, 378);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0008];
    
    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1000;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(754.5, 314.5);
    drawLine0002.endPoint = CGPointMake(708, 362);
    drawLine0002.width = 52;
    drawLine0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0002];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(727, 354);
    drawLine0003.endPoint = CGPointMake(630, 354);
    drawLine0003.width = 52;
    drawLine0003.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию Kitayama
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"北山駅";
    station0003.nameEnglish = @"Kitayama";
    station0003.mapLocation = CGPointMake(630, 354);
    station0003.geoLocation = CGPointMake(35.051275, 135.766328);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0003.mapLocation;
    fillCircle0005.radius = 43;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0005];

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0003.mapLocation;
    fillCircle0006.radius = 37;
    fillCircle0006.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0003.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = @"K";
    drawTextLine0009.fontColor = [UIColor whiteColor];
    drawTextLine0009.fontSize = 36;
    drawTextLine0009.origin = CGPointMake(618, 316);
    [station0003.drawPrimitives addObject:drawTextLine0009];
    
    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = @"03";
    drawTextLine0010.fontColor = [UIColor whiteColor];
    drawTextLine0010.fontSize = 36;
    drawTextLine0010.origin = CGPointMake(610, 348);
    [station0003.drawPrimitives addObject:drawTextLine0010];

    MWDrawTextLine *drawTextLine0124 = [[MWDrawTextLine alloc] init];
    drawTextLine0124.text = station0003.nameOriginal;
    drawTextLine0124.radians = 90 * M_PI / 180;
    drawTextLine0124.fontName = @"HelveticaNeue";
    drawTextLine0124.fontColor = [UIColor blackColor];
    drawTextLine0124.fontSize = 40;
    drawTextLine0124.origin = CGPointMake(653, 180);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0124];
    
    MWDrawTextLine *drawTextLine0125 = [[MWDrawTextLine alloc] init];
    drawTextLine0125.text = station0003.nameEnglish;
    drawTextLine0125.radians = 90 * M_PI / 180;
    drawTextLine0125.fontName = @"HelveticaNeue";
    drawTextLine0125.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0125.fontSize = 34;
    drawTextLine0125.origin = CGPointMake(615, 174);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0125];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1200;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(630.5, 354);
    drawLine0004.endPoint = CGPointMake(592, 354);
    drawLine0004.width = 52;
    drawLine0004.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0004];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(592, 384);
    drawArc0001.startRadians = 180 * M_PI / 180;
    drawArc0001.endRadians = 270 * M_PI / 180;
    drawArc0001.radius = 30;
    drawArc0001.width = 52;
    drawArc0001.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(562, 384);
    drawLine0005.endPoint = CGPointMake(562, 450);
    drawLine0005.width = 52;
    drawLine0005.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0005];

    // Добавляем станцию Kitaōji
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"北大路駅";
    station0004.nameEnglish = @"Kitaōji";
    station0004.mapLocation = CGPointMake(562, 450);
    station0004.geoLocation = CGPointMake(35.044975, 135.758658);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0004.mapLocation;
    fillCircle0007.radius = 43;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0007];

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0004.mapLocation;
    fillCircle0008.radius = 37;
    fillCircle0008.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0004.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = @"K";
    drawTextLine0011.fontColor = [UIColor whiteColor];
    drawTextLine0011.fontSize = 36;
    drawTextLine0011.origin = CGPointMake(550, 412);
    [station0004.drawPrimitives addObject:drawTextLine0011];
    
    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = @"04";
    drawTextLine0012.fontColor = [UIColor whiteColor];
    drawTextLine0012.fontSize = 36;
    drawTextLine0012.origin = CGPointMake(542, 444);
    [station0004.drawPrimitives addObject:drawTextLine0012];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0004.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 40;
    drawTextLine0013.origin = CGPointMake(348, 423);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0013];
    
    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0004.nameEnglish;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0014.fontSize = 34;
    drawTextLine0014.origin = CGPointMake(422, 465);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 800;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(562, 449.5);
    drawLine0006.endPoint = CGPointMake(562, 585.5);
    drawLine0006.width = 52;
    drawLine0006.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Kuramaguchi
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"鞍馬口駅";
    station0005.nameEnglish = @"Kuramaguchi";
    station0005.mapLocation = CGPointMake(562, 585.5);
    station0005.geoLocation = CGPointMake(35.037156, 135.759289);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0005.mapLocation;
    fillCircle0009.radius = 43;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0009];

    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0005.mapLocation;
    fillCircle0010.radius = 37;
    fillCircle0010.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0005.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = @"K";
    drawTextLine0015.fontColor = [UIColor whiteColor];
    drawTextLine0015.fontSize = 36;
    drawTextLine0015.origin = CGPointMake(550, 547);
    [station0005.drawPrimitives addObject:drawTextLine0015];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = @"05";
    drawTextLine0016.fontColor = [UIColor whiteColor];
    drawTextLine0016.fontSize = 36;
    drawTextLine0016.origin = CGPointMake(542, 579);
    [station0005.drawPrimitives addObject:drawTextLine0016];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0005.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 40;
    drawTextLine0017.origin = CGPointMake(346, 564);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0017];
    
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0005.nameEnglish;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0018.fontSize = 34;
    drawTextLine0018.origin = CGPointMake(316, 603);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0018];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 800;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(562, 585);
    drawLine0007.endPoint = CGPointMake(562, 703);
    drawLine0007.width = 52;
    drawLine0007.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Imadegawa
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"今出川駅";
    station0006.nameEnglish = @"Imadegawa";
    station0006.mapLocation = CGPointMake(562, 703);
    station0006.geoLocation = CGPointMake(35.030167, 135.759386);

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0006.mapLocation;
    fillCircle0011.radius = 43;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0011];
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0006.mapLocation;
    fillCircle0012.radius = 37;
    fillCircle0012.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0006.drawPrimitives addObject:fillCircle0012];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = @"K";
    drawTextLine0019.fontColor = [UIColor whiteColor];
    drawTextLine0019.fontSize = 36;
    drawTextLine0019.origin = CGPointMake(550, 665);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0019];
    
    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = @"06";
    drawTextLine0020.fontColor = [UIColor whiteColor];
    drawTextLine0020.fontSize = 36;
    drawTextLine0020.origin = CGPointMake(542, 697);
    [station0006.drawPrimitives addObject:drawTextLine0020];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0006.nameOriginal;
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 40;
    drawTextLine0021.origin = CGPointMake(346, 675);
    [station0006.drawPrimitives addObject:drawTextLine0021];
    
    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0006.nameEnglish;
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0022.fontSize = 34;
    drawTextLine0022.origin = CGPointMake(334, 717);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1500;
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(562, 702.5);
    drawLine0008.endPoint = CGPointMake(562, 822.5);
    drawLine0008.width = 52;
    drawLine0008.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Marutamachi
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"丸太町駅";
    station0007.nameEnglish = @"Marutamachi";
    station0007.mapLocation = CGPointMake(562, 822.5);
    station0007.geoLocation = CGPointMake(35.016572, 135.759528);

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0007.mapLocation;
    fillCircle0013.radius = 43;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0013];
    
    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0007.mapLocation;
    fillCircle0014.radius = 37;
    fillCircle0014.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0007.drawPrimitives addObject:fillCircle0014];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = @"K";
    drawTextLine0023.fontColor = [UIColor whiteColor];
    drawTextLine0023.fontSize = 36;
    drawTextLine0023.origin = CGPointMake(550, 784);
    [station0007.drawPrimitives addObject:drawTextLine0023];
    
    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"07";
    drawTextLine0024.fontColor = [UIColor whiteColor];
    drawTextLine0024.fontSize = 36;
    drawTextLine0024.origin = CGPointMake(542, 816);
    [station0007.drawPrimitives addObject:drawTextLine0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = station0007.nameOriginal;
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 40;
    drawTextLine0025.origin = CGPointMake(346, 801);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0025];
    
    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0007.nameEnglish;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0026.fontSize = 34;
    drawTextLine0026.origin = CGPointMake(317, 843);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 700;
    [edge0001.elements addObject:haul0007];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(562, 822);
    drawLine0009.endPoint = CGPointMake(562, 971);
    drawLine0009.width = 52;
    drawLine0009.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Karasuma Oike
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"烏丸御池駅";
    station0008.nameEnglish = @"Karasuma Oike";
    station0008.mapLocation = CGPointMake(562, 971);
    station0008.geoLocation = CGPointMake(35.010517, 135.759639);

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0008.mapLocation;
    fillCircle0015.radius = 43;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0015];
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0008.mapLocation;
    fillCircle0016.radius = 37;
    fillCircle0016.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0008.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = @"K";
    drawTextLine0027.fontColor = [UIColor whiteColor];
    drawTextLine0027.fontSize = 36;
    drawTextLine0027.origin = CGPointMake(550, 933);
    [station0008.drawPrimitives addObject:drawTextLine0027];
    
    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"08";
    drawTextLine0028.fontColor = [UIColor whiteColor];
    drawTextLine0028.fontSize = 36;
    drawTextLine0028.origin = CGPointMake(542, 965);
    [station0008.drawPrimitives addObject:drawTextLine0028];

    MWDrawTextLine *drawTextLine0126 = [[MWDrawTextLine alloc] init];
    drawTextLine0126.text = station0008.nameOriginal;
    drawTextLine0126.radians = 90 * M_PI / 180;
    drawTextLine0126.fontName = @"HelveticaNeue";
    drawTextLine0126.fontColor = [UIColor blackColor];
    drawTextLine0126.fontSize = 40;
    drawTextLine0126.origin = CGPointMake(700, 719);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0126];

    MWDrawTextLine *drawTextLine0127 = [[MWDrawTextLine alloc] init];
    drawTextLine0127.text = station0008.nameEnglish;
    drawTextLine0127.radians = 90 * M_PI / 180;
    drawTextLine0127.fontName = @"HelveticaNeue";
    drawTextLine0127.fontColor = [UIColor blackColor];
    drawTextLine0127.fontSize = 34;
    drawTextLine0127.origin = CGPointMake(655, 676);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0127];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;
    
    // Создаем участок линии Karasuma Oike - Takeda
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Karasuma Oike - Takeda";
    [self.edges addObject:edge0002];

    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;
    
    // Добавляем станцию Karasuma Oike
    [edge0002.elements addObject:station0008];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 900;
    [edge0002.elements addObject:haul0008];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(562, 970.5);
    drawLine0010.endPoint = CGPointMake(562, 1135);
    drawLine0010.width = 52;
    drawLine0010.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Shijō
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0002.elements addObject:station0009];
    
    station0009.nameOriginal = @"四条駅";
    station0009.nameEnglish = @"Shijō";
    station0009.mapLocation = CGPointMake(562, 1135);
    station0009.geoLocation = CGPointMake(35.000078, 135.759667);

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0009.mapLocation;
    fillCircle0017.radius = 43;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0017];
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0009.mapLocation;
    fillCircle0018.radius = 37;
    fillCircle0018.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0009.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = @"K";
    drawTextLine0029.fontColor = [UIColor whiteColor];
    drawTextLine0029.fontSize = 36;
    drawTextLine0029.origin = CGPointMake(550, 1097);
    [station0009.drawPrimitives addObject:drawTextLine0029];
    
    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"09";
    drawTextLine0030.fontColor = [UIColor whiteColor];
    drawTextLine0030.fontSize = 36;
    drawTextLine0030.origin = CGPointMake(542, 1129);
    [station0009.drawPrimitives addObject:drawTextLine0030];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = station0009.nameOriginal;
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 40;
    drawTextLine0031.origin = CGPointMake(615, 1093);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0031];
    
    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0009.nameEnglish;
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0032.fontSize = 34;
    drawTextLine0032.origin = CGPointMake(615, 1140);
    [station0009.nameEnglishTextPrimitives addObject:drawTextLine0032];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 800;
    [edge0002.elements addObject:haul0009];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(562, 1134.5);
    drawLine0011.endPoint = CGPointMake(562, 1248.5);
    drawLine0011.width = 52;
    drawLine0011.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0011];

    // Добавляем станцию Gojō
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0002.elements addObject:station0010];
    
    station0010.nameOriginal = @"五条駅";
    station0010.nameEnglish = @"Gojō";
    station0010.mapLocation = CGPointMake(562, 1248.5);
    station0010.geoLocation = CGPointMake(34.995172, 135.759739);

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0010.mapLocation;
    fillCircle0019.radius = 43;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0019];

    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0010.mapLocation;
    fillCircle0020.radius = 37;
    fillCircle0020.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0010.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = @"K";
    drawTextLine0033.fontColor = [UIColor whiteColor];
    drawTextLine0033.fontSize = 36;
    drawTextLine0033.origin = CGPointMake(550, 1211);
    [station0010.drawPrimitives addObject:drawTextLine0033];
    
    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = @"10";
    drawTextLine0034.fontColor = [UIColor whiteColor];
    drawTextLine0034.fontSize = 36;
    drawTextLine0034.origin = CGPointMake(542, 1243);
    [station0010.drawPrimitives addObject:drawTextLine0034];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0010.nameOriginal;
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 40;
    drawTextLine0035.origin = CGPointMake(615, 1210);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0035];
    
    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = station0010.nameEnglish;
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0036.fontSize = 34;
    drawTextLine0036.origin = CGPointMake(615, 1251);
    [station0010.nameEnglishTextPrimitives addObject:drawTextLine0036];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1000;
    [edge0002.elements addObject:haul0010];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(562, 1248);
    drawLine0012.endPoint = CGPointMake(562, 1348);
    drawLine0012.width = 52;
    drawLine0012.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию Kyoto
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0002.elements addObject:station0011];
    
    station0011.nameOriginal = @"京都駅";
    station0011.nameEnglish = @"Kyoto";
    station0011.mapLocation = CGPointMake(562, 1348);
    station0011.geoLocation = CGPointMake(34.985458, 135.757756);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0011.mapLocation;
    fillCircle0021.radius = 43;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0021];
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0011.mapLocation;
    fillCircle0022.radius = 37;
    fillCircle0022.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0011.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"K";
    drawTextLine0037.fontColor = [UIColor whiteColor];
    drawTextLine0037.fontSize = 36;
    drawTextLine0037.origin = CGPointMake(550, 1310);
    [station0011.drawPrimitives addObject:drawTextLine0037];
    
    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"11";
    drawTextLine0038.fontColor = [UIColor whiteColor];
    drawTextLine0038.fontSize = 36;
    drawTextLine0038.origin = CGPointMake(542, 1342);
    [station0011.drawPrimitives addObject:drawTextLine0038];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = station0011.nameOriginal;
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 40;
    drawTextLine0039.origin = CGPointMake(615, 1323);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0039];
    
    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = station0011.nameEnglish;
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0040.fontSize = 34;
    drawTextLine0040.origin = CGPointMake(615, 1365);
    [station0011.nameEnglishTextPrimitives addObject:drawTextLine0040];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 800;
    [edge0002.elements addObject:haul0011];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(562, 1347.5);
    drawLine0013.endPoint = CGPointMake(562, 1461.5);
    drawLine0013.width = 52;
    drawLine0013.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0013];

    // Добавляем станцию Kujō
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0002.elements addObject:station0012];
    
    station0012.nameOriginal = @"九条駅";
    station0012.nameEnglish = @"Kujō";
    station0012.mapLocation = CGPointMake(562, 1461.5);
    station0012.geoLocation = CGPointMake(34.979064, 135.759664);

    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0012.mapLocation;
    fillCircle0023.radius = 43;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0023];
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0012.mapLocation;
    fillCircle0024.radius = 37;
    fillCircle0024.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0012.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = @"K";
    drawTextLine0041.fontColor = [UIColor whiteColor];
    drawTextLine0041.fontSize = 36;
    drawTextLine0041.origin = CGPointMake(550, 1423);
    [station0012.drawPrimitives addObject:drawTextLine0041];
    
    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = @"12";
    drawTextLine0042.fontColor = [UIColor whiteColor];
    drawTextLine0042.fontSize = 36;
    drawTextLine0042.origin = CGPointMake(542, 1455);
    [station0012.drawPrimitives addObject:drawTextLine0042];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = station0012.nameOriginal;
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 40;
    drawTextLine0043.origin = CGPointMake(615, 1426);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0043];
    
    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = station0012.nameEnglish;
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0044.fontSize = 34;
    drawTextLine0044.origin = CGPointMake(615, 1470);
    [station0012.nameEnglishTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 700;
    [edge0002.elements addObject:haul0012];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(562, 1461);
    drawLine0014.endPoint = CGPointMake(562, 1588);
    drawLine0014.width = 52;
    drawLine0014.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0014];

    // Добавляем станцию Jūjō
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0002.elements addObject:station0013];
    
    station0013.nameOriginal = @"十条駅";
    station0013.nameEnglish = @"Jūjō";
    station0013.mapLocation = CGPointMake(562, 1588);
    station0013.geoLocation = CGPointMake(34.972117, 135.759664);

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0013.mapLocation;
    fillCircle0025.radius = 43;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0025];
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0013.mapLocation;
    fillCircle0026.radius = 37;
    fillCircle0026.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0013.drawPrimitives addObject:fillCircle0026];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = @"K";
    drawTextLine0045.fontColor = [UIColor whiteColor];
    drawTextLine0045.fontSize = 36;
    drawTextLine0045.origin = CGPointMake(550, 1550);
    [station0013.drawPrimitives addObject:drawTextLine0045];
    
    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = @"13";
    drawTextLine0046.fontColor = [UIColor whiteColor];
    drawTextLine0046.fontSize = 36;
    drawTextLine0046.origin = CGPointMake(542, 1582);
    [station0013.drawPrimitives addObject:drawTextLine0046];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = station0013.nameOriginal;
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 40;
    drawTextLine0047.origin = CGPointMake(615, 1545);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0047];
    
    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0013.nameEnglish;
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0048.fontSize = 34;
    drawTextLine0048.origin = CGPointMake(615, 1587);
    [station0013.nameEnglishTextPrimitives addObject:drawTextLine0048];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 1200;
    [edge0002.elements addObject:haul0013];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(562, 1588);
    drawLine0015.endPoint = CGPointMake(480.5, 1701);
    drawLine0015.width = 52;
    drawLine0015.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0015];

    // Добавляем станцию Kuinabashi
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0002.elements addObject:station0014];
    
    station0014.nameOriginal = @"くいな橋駅";
    station0014.nameEnglish = @"Kuinabashi";
    station0014.mapLocation = CGPointMake(480.5, 1701);
    station0014.geoLocation = CGPointMake(34.962672, 135.757439);
    
    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0014.mapLocation;
    fillCircle0027.radius = 43;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0027];
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0014.mapLocation;
    fillCircle0028.radius = 37;
    fillCircle0028.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0014.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = @"K";
    drawTextLine0049.fontColor = [UIColor whiteColor];
    drawTextLine0049.fontSize = 36;
    drawTextLine0049.origin = CGPointMake(468, 1664);
    [station0014.drawPrimitives addObject:drawTextLine0049];
    
    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = @"14";
    drawTextLine0050.fontColor = [UIColor whiteColor];
    drawTextLine0050.fontSize = 36;
    drawTextLine0050.origin = CGPointMake(459, 1696);
    [station0014.drawPrimitives addObject:drawTextLine0050];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = station0014.nameOriginal;
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 40;
    drawTextLine0051.origin = CGPointMake(534, 1685);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0051];
    
    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0014.nameEnglish;
    drawTextLine0052.fontName = @"HelveticaNeue";
    drawTextLine0052.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0052.fontSize = 34;
    drawTextLine0052.origin = CGPointMake(534, 1727);
    [station0014.nameEnglishTextPrimitives addObject:drawTextLine0052];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 700;
    [edge0002.elements addObject:haul0014];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(480.5, 1701);
    drawLine0016.endPoint = CGPointMake(394, 1806.5);
    drawLine0016.width = 52;
    drawLine0016.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию Takeda
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0002.elements addObject:station0015];
    
    station0015.nameOriginal = @"竹田駅";
    station0015.nameEnglish = @"Takeda";
    station0015.mapLocation = CGPointMake(394, 1806.5);
    station0015.geoLocation = CGPointMake(34.956894, 135.756114);

    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0015.mapLocation;
    fillCircle0029.radius = 43;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0029];
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0015.mapLocation;
    fillCircle0030.radius = 37;
    fillCircle0030.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [station0015.drawPrimitives addObject:fillCircle0030];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = @"K";
    drawTextLine0053.fontColor = [UIColor whiteColor];
    drawTextLine0053.fontSize = 36;
    drawTextLine0053.origin = CGPointMake(382, 1769);
    [station0015.drawPrimitives addObject:drawTextLine0053];
    
    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = @"15";
    drawTextLine0054.fontColor = [UIColor whiteColor];
    drawTextLine0054.fontSize = 36;
    drawTextLine0054.origin = CGPointMake(373, 1801);
    [station0015.drawPrimitives addObject:drawTextLine0054];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = station0015.nameOriginal;
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 40;
    drawTextLine0055.origin = CGPointMake(218, 1770);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0055];
    
    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = station0015.nameEnglish;
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0056.fontSize = 34;
    drawTextLine0056.origin = CGPointMake(234, 1812);
    [station0015.nameEnglishTextPrimitives addObject:drawTextLine0056];

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;

    ////////////////////////////////////////////////////////////////
    // 2. Tōzai Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Rokujizō - Karasuma Oike
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Rokujizō - Karasuma Oike";
    [self.edges addObject:(edge0003)];
    
    // Добавляем линию
    edge0003.line = line0002;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0004;

    // Добавляем станцию Rokujizō
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0003.elements addObject:station0016];
    
    station0016.nameOriginal = @"六地蔵駅";
    station0016.nameEnglish = @"Rokujizō";
    station0016.mapLocation = CGPointMake(1481.5, 2163);
    station0016.geoLocation = CGPointMake(34.932022, 135.793328);

    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0016.mapLocation;
    fillCircle0031.radius = 43;
    fillCircle0031.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0031];
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0016.mapLocation;
    fillCircle0032.radius = 37;
    fillCircle0032.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0016.drawPrimitives addObject:fillCircle0032];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = @"T";
    drawTextLine0057.fontColor = [UIColor whiteColor];
    drawTextLine0057.fontSize = 36;
    drawTextLine0057.origin = CGPointMake(1471, 2125);
    [station0016.drawPrimitives addObject:drawTextLine0057];
    
    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = @"01";
    drawTextLine0058.fontColor = [UIColor whiteColor];
    drawTextLine0058.fontSize = 36;
    drawTextLine0058.origin = CGPointMake(1462, 2157);
    [station0016.drawPrimitives addObject:drawTextLine0058];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = station0016.nameOriginal;
    drawTextLine0059.fontName = @"HelveticaNeue";
    drawTextLine0059.fontColor = [UIColor blackColor];
    drawTextLine0059.fontSize = 40;
    drawTextLine0059.origin = CGPointMake(1536, 2140);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0059];
    
    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = station0016.nameEnglish;
    drawTextLine0060.fontName = @"HelveticaNeue";
    drawTextLine0060.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0060.fontSize = 34;
    drawTextLine0060.origin = CGPointMake(1536, 2184);
    [station0016.nameEnglishTextPrimitives addObject:drawTextLine0060];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 1100;
    [edge0003.elements addObject:haul0015];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(1206, 1948);
    drawArc0002.startRadians = 14.5 * M_PI / 180;
    drawArc0002.endRadians = 39 * M_PI / 180;
    drawArc0002.radius = 350;
    drawArc0002.width = 52;
    drawArc0002.color = line0002.color;
    [haul0015.drawPrimitives addObject:drawArc0002];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(1206, 1948);
    drawArc0003.startRadians = 14.5 * M_PI / 180;
    drawArc0003.endRadians = 39 * M_PI / 180;
    drawArc0003.radius = 350;
    drawArc0003.width = 6;
    drawArc0003.color = [UIColor whiteColor];
    [haul0015.drawPrimitives addObject:drawArc0003];

    // Добавляем станцию Ishida
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0003.elements addObject:station0017];
    
    station0017.nameOriginal = @"石田駅";
    station0017.nameEnglish = @"Ishida";
    station0017.mapLocation = CGPointMake(1544, 2040.5);
    station0017.geoLocation = CGPointMake(34.940569, 135.803994);

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0017.mapLocation;
    fillCircle0033.radius = 43;
    fillCircle0033.fillColor = [UIColor whiteColor];
    [station0017.drawPrimitives addObject:fillCircle0033];
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0017.mapLocation;
    fillCircle0034.radius = 37;
    fillCircle0034.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0017.drawPrimitives addObject:fillCircle0034];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = @"T";
    drawTextLine0061.fontColor = [UIColor whiteColor];
    drawTextLine0061.fontSize = 36;
    drawTextLine0061.origin = CGPointMake(1533, 2002);
    [station0017.drawPrimitives addObject:drawTextLine0061];
    
    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = @"02";
    drawTextLine0062.fontColor = [UIColor whiteColor];
    drawTextLine0062.fontSize = 36;
    drawTextLine0062.origin = CGPointMake(1524, 2034);
    [station0017.drawPrimitives addObject:drawTextLine0062];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = station0017.nameOriginal;
    drawTextLine0063.fontName = @"HelveticaNeue";
    drawTextLine0063.fontColor = [UIColor blackColor];
    drawTextLine0063.fontSize = 40;
    drawTextLine0063.origin = CGPointMake(1595, 2005);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0063];
    
    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = station0017.nameEnglish;
    drawTextLine0064.fontName = @"HelveticaNeue";
    drawTextLine0064.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0064.fontSize = 34;
    drawTextLine0064.origin = CGPointMake(1594, 2046);
    [station0017.nameEnglishTextPrimitives addObject:drawTextLine0064];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 1300;
    [edge0003.elements addObject:haul0016];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(253, 1872);
    drawArc0004.startRadians = 0 * M_PI / 180;
    drawArc0004.endRadians = 7.3 * M_PI / 180;
    drawArc0004.radius = 1300;
    drawArc0004.width = 52;
    drawArc0004.color = line0002.color;
    [haul0016.drawPrimitives addObject:drawArc0004];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(253, 1872);
    drawArc0005.startRadians = 0 * M_PI / 180;
    drawArc0005.endRadians = 7.3 * M_PI / 180;
    drawArc0005.radius = 1300;
    drawArc0005.width = 6;
    drawArc0005.color = [UIColor whiteColor];
    [haul0016.drawPrimitives addObject:drawArc0005];

    // Добавляем станцию Daigo
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0003.elements addObject:station0018];
    
    station0018.nameOriginal = @"醍醐駅";
    station0018.nameEnglish = @"Daigo";
    station0018.mapLocation = CGPointMake(1553, 1875);
    station0018.geoLocation = CGPointMake(34.950858, 135.810631);

    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0018.mapLocation;
    fillCircle0035.radius = 43;
    fillCircle0035.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0035];
    
    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0018.mapLocation;
    fillCircle0036.radius = 37;
    fillCircle0036.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0018.drawPrimitives addObject:fillCircle0036];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = @"T";
    drawTextLine0065.fontColor = [UIColor whiteColor];
    drawTextLine0065.fontSize = 36;
    drawTextLine0065.origin = CGPointMake(1543, 1837);
    [station0018.drawPrimitives addObject:drawTextLine0065];
    
    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = @"03";
    drawTextLine0066.fontColor = [UIColor whiteColor];
    drawTextLine0066.fontSize = 36;
    drawTextLine0066.origin = CGPointMake(1534, 1869);
    [station0018.drawPrimitives addObject:drawTextLine0066];

    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = station0018.nameOriginal;
    drawTextLine0067.fontName = @"HelveticaNeue";
    drawTextLine0067.fontColor = [UIColor blackColor];
    drawTextLine0067.fontSize = 40;
    drawTextLine0067.origin = CGPointMake(1605, 1837);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0067];
    
    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = station0018.nameEnglish;
    drawTextLine0068.fontName = @"HelveticaNeue";
    drawTextLine0068.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0068.fontSize = 34;
    drawTextLine0068.origin = CGPointMake(1605, 1878);
    [station0018.nameEnglishTextPrimitives addObject:drawTextLine0068];
    
    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 1200;
    [edge0003.elements addObject:haul0017];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(1553, 1875.5);
    drawLine0017.endPoint = CGPointMake(1553, 1687);
    drawLine0017.width = 52;
    drawLine0017.color = line0002.color;
    [haul0017.drawPrimitives addObject:drawLine0017];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(1553, 1875.5);
    drawLine0018.endPoint = CGPointMake(1553, 1687);
    drawLine0018.width = 6;
    drawLine0018.color = [UIColor whiteColor];
    [haul0017.drawPrimitives addObject:drawLine0018];

    // Добавляем станцию Ono
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0003.elements addObject:station0019];
    
    station0019.nameOriginal = @"小野駅";
    station0019.nameEnglish = @"Ono";
    station0019.mapLocation = CGPointMake(1553, 1687);
    station0019.geoLocation = CGPointMake(34.961217, 135.812731);

    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0019.mapLocation;
    fillCircle0037.radius = 43;
    fillCircle0037.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0037];
    
    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0019.mapLocation;
    fillCircle0039.radius = 37;
    fillCircle0039.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0019.drawPrimitives addObject:fillCircle0039];

    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = @"T";
    drawTextLine0069.fontColor = [UIColor whiteColor];
    drawTextLine0069.fontSize = 36;
    drawTextLine0069.origin = CGPointMake(1543, 1649);
    [station0019.drawPrimitives addObject:drawTextLine0069];
    
    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = @"04";
    drawTextLine0070.fontColor = [UIColor whiteColor];
    drawTextLine0070.fontSize = 36;
    drawTextLine0070.origin = CGPointMake(1534, 1681);
    [station0019.drawPrimitives addObject:drawTextLine0070];

    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = station0019.nameOriginal;
    drawTextLine0071.fontName = @"HelveticaNeue";
    drawTextLine0071.fontColor = [UIColor blackColor];
    drawTextLine0071.fontSize = 40;
    drawTextLine0071.origin = CGPointMake(1605, 1644);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0071];
    
    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = station0019.nameEnglish;
    drawTextLine0072.fontName = @"HelveticaNeue";
    drawTextLine0072.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0072.fontSize = 34;
    drawTextLine0072.origin = CGPointMake(1605, 1686);
    [station0019.nameEnglishTextPrimitives addObject:drawTextLine0072];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1300;
    [edge0003.elements addObject:haul0018];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(1553, 1687.5);
    drawLine0019.endPoint = CGPointMake(1553, 1536);
    drawLine0019.width = 52;
    drawLine0019.color = line0002.color;
    [haul0018.drawPrimitives addObject:drawLine0019];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(1553, 1687.5);
    drawLine0020.endPoint = CGPointMake(1553, 1536);
    drawLine0020.width = 6;
    drawLine0020.color = [UIColor whiteColor];
    [haul0018.drawPrimitives addObject:drawLine0020];

    // Добавляем станцию Nagitsuji
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0003.elements addObject:station0020];
    
    station0020.nameOriginal = @"椥辻駅";
    station0020.nameEnglish = @"Nagitsuji";
    station0020.mapLocation = CGPointMake(1553, 1536);
    station0020.geoLocation = CGPointMake(34.972714, 135.814886);

    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0020.mapLocation;
    fillCircle0038.radius = 43;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0038];
    
    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0020.mapLocation;
    fillCircle0040.radius = 37;
    fillCircle0040.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0020.drawPrimitives addObject:fillCircle0040];

    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = @"T";
    drawTextLine0073.fontColor = [UIColor whiteColor];
    drawTextLine0073.fontSize = 36;
    drawTextLine0073.origin = CGPointMake(1543, 1498);
    [station0020.drawPrimitives addObject:drawTextLine0073];
    
    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = @"05";
    drawTextLine0074.fontColor = [UIColor whiteColor];
    drawTextLine0074.fontSize = 36;
    drawTextLine0074.origin = CGPointMake(1534, 1530);
    [station0020.drawPrimitives addObject:drawTextLine0074];

    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = station0020.nameOriginal;
    drawTextLine0075.fontName = @"HelveticaNeue";
    drawTextLine0075.fontColor = [UIColor blackColor];
    drawTextLine0075.fontSize = 40;
    drawTextLine0075.origin = CGPointMake(1605, 1493);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0075];
    
    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0020.nameEnglish;
    drawTextLine0076.fontName = @"HelveticaNeue";
    drawTextLine0076.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0076.fontSize = 34;
    drawTextLine0076.origin = CGPointMake(1605, 1539);
    [station0020.nameEnglishTextPrimitives addObject:drawTextLine0076];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1000;
    [edge0003.elements addObject:haul0019];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(1553, 1536.5);
    drawLine0021.endPoint = CGPointMake(1553, 1359);
    drawLine0021.width = 52;
    drawLine0021.color = line0002.color;
    [haul0019.drawPrimitives addObject:drawLine0021];
    
    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(1553, 1536.5);
    drawLine0022.endPoint = CGPointMake(1553, 1359);
    drawLine0022.width = 6;
    drawLine0022.color = [UIColor whiteColor];
    [haul0019.drawPrimitives addObject:drawLine0022];

    // Добавляем станцию Higashino
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0003.elements addObject:station0021];
    
    station0021.nameOriginal = @"東野駅";
    station0021.nameEnglish = @"Higashino";
    station0021.mapLocation = CGPointMake(1553, 1359);
    station0021.geoLocation = CGPointMake(34.982208, 135.816761);
    
    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0021.mapLocation;
    fillCircle0041.radius = 43;
    fillCircle0041.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0041];
    
    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = station0021.mapLocation;
    fillCircle0042.radius = 37;
    fillCircle0042.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0021.drawPrimitives addObject:fillCircle0042];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = @"T";
    drawTextLine0077.fontColor = [UIColor whiteColor];
    drawTextLine0077.fontSize = 36;
    drawTextLine0077.origin = CGPointMake(1543, 1321);
    [station0021.drawPrimitives addObject:drawTextLine0077];
    
    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = @"06";
    drawTextLine0078.fontColor = [UIColor whiteColor];
    drawTextLine0078.fontSize = 36;
    drawTextLine0078.origin = CGPointMake(1534, 1353);
    [station0021.drawPrimitives addObject:drawTextLine0078];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = station0021.nameOriginal;
    drawTextLine0079.fontName = @"HelveticaNeue";
    drawTextLine0079.fontColor = [UIColor blackColor];
    drawTextLine0079.fontSize = 40;
    drawTextLine0079.origin = CGPointMake(1605, 1316);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0079];
    
    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = station0021.nameEnglish;
    drawTextLine0080.fontName = @"HelveticaNeue";
    drawTextLine0080.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0080.fontSize = 34;
    drawTextLine0080.origin = CGPointMake(1605, 1359);
    [station0021.nameEnglishTextPrimitives addObject:drawTextLine0080];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 1100;
    [edge0003.elements addObject:haul0020];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(1553, 1359.5);
    drawLine0023.endPoint = CGPointMake(1553, 1161);
    drawLine0023.width = 52;
    drawLine0023.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0023];
    
    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(1553, 1359.5);
    drawLine0024.endPoint = CGPointMake(1553, 1161);
    drawLine0024.width = 6;
    drawLine0024.color = [UIColor whiteColor];
    [haul0020.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Yamashina
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0003.elements addObject:station0022];
    
    station0022.nameOriginal = @"山科駅";
    station0022.nameEnglish = @"Yamashina";
    station0022.mapLocation = CGPointMake(1553, 1161);
    station0022.geoLocation = CGPointMake(34.992336, 135.817083);

    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = station0022.mapLocation;
    fillCircle0043.radius = 43;
    fillCircle0043.fillColor = [UIColor whiteColor];
    [station0022.drawPrimitives addObject:fillCircle0043];
    
    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0022.mapLocation;
    fillCircle0044.radius = 37;
    fillCircle0044.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0022.drawPrimitives addObject:fillCircle0044];

    MWDrawTextLine *drawTextLine0081 = [[MWDrawTextLine alloc] init];
    drawTextLine0081.text = @"T";
    drawTextLine0081.fontColor = [UIColor whiteColor];
    drawTextLine0081.fontSize = 36;
    drawTextLine0081.origin = CGPointMake(1543, 1123);
    [station0022.drawPrimitives addObject:drawTextLine0081];
    
    MWDrawTextLine *drawTextLine0082 = [[MWDrawTextLine alloc] init];
    drawTextLine0082.text = @"07";
    drawTextLine0082.fontColor = [UIColor whiteColor];
    drawTextLine0082.fontSize = 36;
    drawTextLine0082.origin = CGPointMake(1534, 1155);
    [station0022.drawPrimitives addObject:drawTextLine0082];

    MWDrawTextLine *drawTextLine0083 = [[MWDrawTextLine alloc] init];
    drawTextLine0083.text = station0022.nameOriginal;
    drawTextLine0083.fontName = @"HelveticaNeue";
    drawTextLine0083.fontColor = [UIColor blackColor];
    drawTextLine0083.fontSize = 40;
    drawTextLine0083.origin = CGPointMake(1605, 1137);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0083];
    
    MWDrawTextLine *drawTextLine0084 = [[MWDrawTextLine alloc] init];
    drawTextLine0084.text = station0022.nameEnglish;
    drawTextLine0084.fontName = @"HelveticaNeue";
    drawTextLine0084.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0084.fontSize = 34;
    drawTextLine0084.origin = CGPointMake(1605, 1179);
    [station0022.nameEnglishTextPrimitives addObject:drawTextLine0084];
    
    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 1700;
    [edge0003.elements addObject:haul0021];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(1553, 1161.5);
    drawLine0025.endPoint = CGPointMake(1553, 1123);
    drawLine0025.width = 52;
    drawLine0025.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawLine0025];
    
    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(1553, 1161.5);
    drawLine0026.endPoint = CGPointMake(1553, 1123);
    drawLine0026.width = 6;
    drawLine0026.color = [UIColor whiteColor];
    [haul0021.drawPrimitives addObject:drawLine0026];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(1523, 1123);
    drawArc0006.startRadians = 270 * M_PI / 180;
    drawArc0006.endRadians = 0 * M_PI / 180;
    drawArc0006.radius = 30;
    drawArc0006.width = 52;
    drawArc0006.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawArc0006];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(1523, 1123);
    drawArc0007.startRadians = 270 * M_PI / 180;
    drawArc0007.endRadians = 0 * M_PI / 180;
    drawArc0007.radius = 30;
    drawArc0007.width = 6;
    drawArc0007.color = [UIColor whiteColor];
    [haul0021.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(1523, 1093);
    drawLine0027.endPoint = CGPointMake(1378, 1093);
    drawLine0027.width = 52;
    drawLine0027.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawLine0027];
    
    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(1396, 1100.5);
    drawLine0029.endPoint = CGPointMake(1354, 1058.5);
    drawLine0029.width = 52;
    drawLine0029.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawLine0029];
    
    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(1523, 1093);
    drawLine0028.endPoint = CGPointMake(1388, 1093);
    drawLine0028.width = 6;
    drawLine0028.color = [UIColor whiteColor];
    [haul0021.drawPrimitives addObject:drawLine0028];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(1390, 1094.5);
    drawLine0030.endPoint = CGPointMake(1354, 1058.5);
    drawLine0030.width = 6;
    drawLine0030.color = [UIColor whiteColor];
    [haul0021.drawPrimitives addObject:drawLine0030];
    
    // Добавляем станцию Misasagi
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0003.elements addObject:station0023];
    
    station0023.nameOriginal = @"御陵駅";
    station0023.nameEnglish = @"Misasagi";
    station0023.mapLocation = CGPointMake(1354, 1058.5);
    station0023.geoLocation = CGPointMake(34.996122, 135.801622);

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0023.mapLocation;
    fillCircle0045.radius = 43;
    fillCircle0045.fillColor = [UIColor whiteColor];
    [station0023.drawPrimitives addObject:fillCircle0045];
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0023.mapLocation;
    fillCircle0046.radius = 37;
    fillCircle0046.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0023.drawPrimitives addObject:fillCircle0046];

    MWDrawTextLine *drawTextLine0085 = [[MWDrawTextLine alloc] init];
    drawTextLine0085.text = @"T";
    drawTextLine0085.fontColor = [UIColor whiteColor];
    drawTextLine0085.fontSize = 36;
    drawTextLine0085.origin = CGPointMake(1343, 1021);
    [station0023.drawPrimitives addObject:drawTextLine0085];
    
    MWDrawTextLine *drawTextLine0086 = [[MWDrawTextLine alloc] init];
    drawTextLine0086.text = @"08";
    drawTextLine0086.fontColor = [UIColor whiteColor];
    drawTextLine0086.fontSize = 36;
    drawTextLine0086.origin = CGPointMake(1334, 1053);
    [station0023.drawPrimitives addObject:drawTextLine0086];

    MWDrawTextLine *drawTextLine0087 = [[MWDrawTextLine alloc] init];
    drawTextLine0087.text = station0023.nameOriginal;
    drawTextLine0087.fontName = @"HelveticaNeue";
    drawTextLine0087.fontColor = [UIColor blackColor];
    drawTextLine0087.fontSize = 40;
    drawTextLine0087.origin = CGPointMake(1378, 938);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0087];
    
    MWDrawTextLine *drawTextLine0088 = [[MWDrawTextLine alloc] init];
    drawTextLine0088.text = station0023.nameEnglish;
    drawTextLine0088.fontName = @"HelveticaNeue";
    drawTextLine0088.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0088.fontSize = 34;
    drawTextLine0088.origin = CGPointMake(1378, 981);
    [station0023.nameEnglishTextPrimitives addObject:drawTextLine0088];

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 1800;
    [edge0003.elements addObject:haul0022];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(1354, 1058.5);
    drawLine0031.endPoint = CGPointMake(1259, 963.5);
    drawLine0031.width = 52;
    drawLine0031.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0031];
    
    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(1277, 971.5);
    drawLine0033.endPoint = CGPointMake(1207, 971.5);
    drawLine0033.width = 52;
    drawLine0033.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0033];
    
    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(1354, 1058.5);
    drawLine0032.endPoint = CGPointMake(1266, 970.5);
    drawLine0032.width = 6;
    drawLine0032.color = [UIColor whiteColor];
    [haul0022.drawPrimitives addObject:drawLine0032];
    
    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(1268, 971.5);
    drawLine0034.endPoint = CGPointMake(1201, 971.5);
    drawLine0034.width = 6;
    drawLine0034.color = [UIColor whiteColor];
    [haul0022.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию Keage
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0003.elements addObject:station0024];
    
    station0024.nameOriginal = @"蹴上駅";
    station0024.nameEnglish = @"Keage";
    station0024.mapLocation = CGPointMake(1207, 971.5);
    station0024.geoLocation = CGPointMake(35.008036, 135.790228);

    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = station0024.mapLocation;
    fillCircle0047.radius = 43;
    fillCircle0047.fillColor = [UIColor whiteColor];
    [station0024.drawPrimitives addObject:fillCircle0047];
    
    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = station0024.mapLocation;
    fillCircle0048.radius = 37;
    fillCircle0048.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0024.drawPrimitives addObject:fillCircle0048];

    MWDrawTextLine *drawTextLine0089 = [[MWDrawTextLine alloc] init];
    drawTextLine0089.text = @"T";
    drawTextLine0089.fontColor = [UIColor whiteColor];
    drawTextLine0089.fontSize = 36;
    drawTextLine0089.origin = CGPointMake(1197, 934);
    [station0024.drawPrimitives addObject:drawTextLine0089];
    
    MWDrawTextLine *drawTextLine0090 = [[MWDrawTextLine alloc] init];
    drawTextLine0090.text = @"09";
    drawTextLine0090.fontColor = [UIColor whiteColor];
    drawTextLine0090.fontSize = 36;
    drawTextLine0090.origin = CGPointMake(1188, 966);
    [station0024.drawPrimitives addObject:drawTextLine0090];

    MWDrawTextLine *drawTextLine0128 = [[MWDrawTextLine alloc] init];
    drawTextLine0128.text = station0024.nameOriginal;
    drawTextLine0128.radians = 90 * M_PI / 180;
    drawTextLine0128.fontName = @"HelveticaNeue";
    drawTextLine0128.fontColor = [UIColor blackColor];
    drawTextLine0128.fontSize = 40;
    drawTextLine0128.origin = CGPointMake(1232, 800);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0128];

    MWDrawTextLine *drawTextLine0129 = [[MWDrawTextLine alloc] init];
    drawTextLine0129.text = station0024.nameEnglish;
    drawTextLine0129.radians = 90 * M_PI / 180;
    drawTextLine0129.fontName = @"HelveticaNeue";
    drawTextLine0129.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0129.fontSize = 34;
    drawTextLine0129.origin = CGPointMake(1191, 822);
    [station0024.nameEnglishTextPrimitives addObject:drawTextLine0129];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 1000;
    [edge0003.elements addObject:haul0023];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(1207.5, 971.5);
    drawLine0035.endPoint = CGPointMake(1060, 971.5);
    drawLine0035.width = 52;
    drawLine0035.color = line0002.color;
    [haul0023.drawPrimitives addObject:drawLine0035];
    
    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(1207.5, 971.5);
    drawLine0036.endPoint = CGPointMake(1060, 971.5);
    drawLine0036.width = 6;
    drawLine0036.color = [UIColor whiteColor];
    [haul0023.drawPrimitives addObject:drawLine0036];

    // Добавляем станцию Higashiyama
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0003.elements addObject:station0025];
    
    station0025.nameOriginal = @"東山駅";
    station0025.nameEnglish = @"Higashiyama";
    station0025.mapLocation = CGPointMake(1060, 971.5);
    station0025.geoLocation = CGPointMake(35.009419, 135.779708);

    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = station0025.mapLocation;
    fillCircle0049.radius = 43;
    fillCircle0049.fillColor = [UIColor whiteColor];
    [station0025.drawPrimitives addObject:fillCircle0049];
    
    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = station0025.mapLocation;
    fillCircle0050.radius = 37;
    fillCircle0050.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0025.drawPrimitives addObject:fillCircle0050];

    MWDrawTextLine *drawTextLine0091 = [[MWDrawTextLine alloc] init];
    drawTextLine0091.text = @"T";
    drawTextLine0091.fontColor = [UIColor whiteColor];
    drawTextLine0091.fontSize = 36;
    drawTextLine0091.origin = CGPointMake(1050, 934);
    [station0025.drawPrimitives addObject:drawTextLine0091];
    
    MWDrawTextLine *drawTextLine0092 = [[MWDrawTextLine alloc] init];
    drawTextLine0092.text = @"10";
    drawTextLine0092.fontColor = [UIColor whiteColor];
    drawTextLine0092.fontSize = 36;
    drawTextLine0092.origin = CGPointMake(1040, 966);
    [station0025.drawPrimitives addObject:drawTextLine0092];

    MWDrawTextLine *drawTextLine0130 = [[MWDrawTextLine alloc] init];
    drawTextLine0130.text = station0025.nameOriginal;
    drawTextLine0130.radians = 90 * M_PI / 180;
    drawTextLine0130.fontName = @"HelveticaNeue";
    drawTextLine0130.fontColor = [UIColor blackColor];
    drawTextLine0130.fontSize = 40;
    drawTextLine0130.origin = CGPointMake(1085, 800);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0130];

    MWDrawTextLine *drawTextLine0131 = [[MWDrawTextLine alloc] init];
    drawTextLine0131.text = station0025.nameEnglish;
    drawTextLine0131.radians = 90 * M_PI / 180;
    drawTextLine0131.fontName = @"HelveticaNeue";
    drawTextLine0131.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0131.fontSize = 34;
    drawTextLine0131.origin = CGPointMake(1044, 731);
    [station0025.nameEnglishTextPrimitives addObject:drawTextLine0131];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 600;
    [edge0003.elements addObject:haul0024];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(1060.5, 971.5);
    drawLine0037.endPoint = CGPointMake(934, 971.5);
    drawLine0037.width = 52;
    drawLine0037.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0037];
    
    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(1060.5, 971.5);
    drawLine0038.endPoint = CGPointMake(934, 971.5);
    drawLine0038.width = 6;
    drawLine0038.color = [UIColor whiteColor];
    [haul0024.drawPrimitives addObject:drawLine0038];

    // Добавляем станцию Sanjō Keihan
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0003.elements addObject:station0026];
    
    station0026.nameOriginal = @"三条京阪駅";
    station0026.nameEnglish = @"Sanjō Keihan";
    station0026.mapLocation = CGPointMake(934, 971.5);
    station0026.geoLocation = CGPointMake(35.009278, 135.773750);

    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = station0026.mapLocation;
    fillCircle0051.radius = 43;
    fillCircle0051.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0051];
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = station0026.mapLocation;
    fillCircle0052.radius = 37;
    fillCircle0052.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0026.drawPrimitives addObject:fillCircle0052];

    MWDrawTextLine *drawTextLine0093 = [[MWDrawTextLine alloc] init];
    drawTextLine0093.text = @"T";
    drawTextLine0093.fontColor = [UIColor whiteColor];
    drawTextLine0093.fontSize = 36;
    drawTextLine0093.origin = CGPointMake(924, 934);
    [station0026.drawPrimitives addObject:drawTextLine0093];
    
    MWDrawTextLine *drawTextLine0094 = [[MWDrawTextLine alloc] init];
    drawTextLine0094.text = @"11";
    drawTextLine0094.fontColor = [UIColor whiteColor];
    drawTextLine0094.fontSize = 36;
    drawTextLine0094.origin = CGPointMake(914, 966);
    [station0026.drawPrimitives addObject:drawTextLine0094];

    MWDrawTextLine *drawTextLine0132 = [[MWDrawTextLine alloc] init];
    drawTextLine0132.text = station0026.nameOriginal;
    drawTextLine0132.radians = 90 * M_PI / 180;
    drawTextLine0132.fontName = @"HelveticaNeue";
    drawTextLine0132.fontColor = [UIColor blackColor];
    drawTextLine0132.fontSize = 40;
    drawTextLine0132.origin = CGPointMake(974, 720);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0132];

    MWDrawTextLine *drawTextLine0133 = [[MWDrawTextLine alloc] init];
    drawTextLine0133.text = station0026.nameEnglish;
    drawTextLine0133.radians = 90 * M_PI / 180;
    drawTextLine0133.fontName = @"HelveticaNeue";
    drawTextLine0133.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0133.fontSize = 34;
    drawTextLine0133.origin = CGPointMake(936, 713);
    [station0026.nameEnglishTextPrimitives addObject:drawTextLine0133];

    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 500;
    [edge0003.elements addObject:haul0025];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(934.5, 971.5);
    drawLine0039.endPoint = CGPointMake(790, 971.5);
    drawLine0039.width = 52;
    drawLine0039.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0039];
    
    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(934.5, 971.5);
    drawLine0040.endPoint = CGPointMake(790, 971.5);
    drawLine0040.width = 6;
    drawLine0040.color = [UIColor whiteColor];
    [haul0025.drawPrimitives addObject:drawLine0040];

    // Добавляем станцию Kyōto Shiyakusho-mae
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0003.elements addObject:station0027];
    
    station0027.nameOriginal = @"京都市役所前駅";
    station0027.nameEnglish = @"Kyōto Shiyakusho-mae";
    station0027.mapLocation = CGPointMake(790, 971.5);
    station0027.geoLocation = CGPointMake(35.011003, 135.768828);
    
    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = station0027.mapLocation;
    fillCircle0053.radius = 43;
    fillCircle0053.fillColor = [UIColor whiteColor];
    [station0027.drawPrimitives addObject:fillCircle0053];
    
    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = station0027.mapLocation;
    fillCircle0054.radius = 37;
    fillCircle0054.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0027.drawPrimitives addObject:fillCircle0054];

    MWDrawTextLine *drawTextLine0095 = [[MWDrawTextLine alloc] init];
    drawTextLine0095.text = @"T";
    drawTextLine0095.fontColor = [UIColor whiteColor];
    drawTextLine0095.fontSize = 36;
    drawTextLine0095.origin = CGPointMake(780, 934);
    [station0027.drawPrimitives addObject:drawTextLine0095];
    
    MWDrawTextLine *drawTextLine0096 = [[MWDrawTextLine alloc] init];
    drawTextLine0096.text = @"12";
    drawTextLine0096.fontColor = [UIColor whiteColor];
    drawTextLine0096.fontSize = 36;
    drawTextLine0096.origin = CGPointMake(770, 966);
    [station0027.drawPrimitives addObject:drawTextLine0096];

    MWDrawTextLine *drawTextLine0134 = [[MWDrawTextLine alloc] init];
    drawTextLine0134.text = station0027.nameOriginal;
    drawTextLine0134.radians = 90 * M_PI / 180;
    drawTextLine0134.fontName = @"HelveticaNeue";
    drawTextLine0134.fontColor = [UIColor blackColor];
    drawTextLine0134.fontSize = 40;
    drawTextLine0134.origin = CGPointMake(833, 642);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0134];

    MWDrawTextLine *drawTextLine0135 = [[MWDrawTextLine alloc] init];
    drawTextLine0135.text = station0027.nameEnglish;
    drawTextLine0135.radians = 90 * M_PI / 180;
    drawTextLine0135.fontName = @"HelveticaNeue";
    drawTextLine0135.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0135.fontSize = 34;
    drawTextLine0135.origin = CGPointMake(792, 565);
    [station0027.nameEnglishTextPrimitives addObject:drawTextLine0135];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 900;
    [edge0003.elements addObject:haul0026];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(790.5, 971.5);
    drawLine0041.endPoint = CGPointMake(627, 971.5);
    drawLine0041.width = 52;
    drawLine0041.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0041];
    
    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(790.5, 971.5);
    drawLine0042.endPoint = CGPointMake(627, 971.5);
    drawLine0042.width = 6;
    drawLine0042.color = [UIColor whiteColor];
    [haul0026.drawPrimitives addObject:drawLine0042];

    // Добавляем станцию Karasuma Oike
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0003.elements addObject:station0028];
    
    station0028.nameOriginal = @"烏丸御池駅";
    station0028.nameEnglish = @"Karasuma Oike";
    station0028.mapLocation = CGPointMake(627, 971.5);
    station0028.geoLocation = CGPointMake(35.010517, 135.759639);

    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = station0028.mapLocation;
    fillCircle0055.radius = 43;
    fillCircle0055.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0055];
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = station0028.mapLocation;
    fillCircle0056.radius = 37;
    fillCircle0056.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0028.drawPrimitives addObject:fillCircle0056];

    MWDrawTextLine *drawTextLine0097 = [[MWDrawTextLine alloc] init];
    drawTextLine0097.text = @"T";
    drawTextLine0097.fontColor = [UIColor whiteColor];
    drawTextLine0097.fontSize = 36;
    drawTextLine0097.origin = CGPointMake(617, 934);
    [station0028.drawPrimitives addObject:drawTextLine0097];
    
    MWDrawTextLine *drawTextLine0098 = [[MWDrawTextLine alloc] init];
    drawTextLine0098.text = @"13";
    drawTextLine0098.fontColor = [UIColor whiteColor];
    drawTextLine0098.fontSize = 36;
    drawTextLine0098.origin = CGPointMake(607, 966);
    [station0028.drawPrimitives addObject:drawTextLine0098];

    station0028.showNameOnMap = false;
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0126];
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0127];
    
    // Добавляем вершину
    edge0003.finishVertex = vertex0002;
    
    // Создаем участок линии Karasuma Oike - Uzumasa Tenjingawa
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Karasuma Oike - Uzumasa Tenjingawa";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0002;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0002;
    
    // Добавляем станцию Xunlimen
    [edge0004.elements addObject:station0028];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 800;
    [edge0004.elements addObject:haul0027];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(627.5, 971.5);
    drawLine0043.endPoint = CGPointMake(425.5, 971.5);
    drawLine0043.width = 52;
    drawLine0043.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0043];
    
    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(627.5, 971.5);
    drawLine0044.endPoint = CGPointMake(425.5, 971.5);
    drawLine0044.width = 6;
    drawLine0044.color = [UIColor whiteColor];
    [haul0027.drawPrimitives addObject:drawLine0044];

    // Добавляем станцию Nijōjō-mae
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0004.elements addObject:station0029];
    
    station0029.nameOriginal = @"二条城前駅";
    station0029.nameEnglish = @"Nijōjō-mae";
    station0029.mapLocation = CGPointMake(425.5, 971.5);
    station0029.geoLocation = CGPointMake(35.011892, 135.750475);
    
    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = station0029.mapLocation;
    fillCircle0057.radius = 43;
    fillCircle0057.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0057];
    
    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = station0029.mapLocation;
    fillCircle0058.radius = 37;
    fillCircle0058.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0029.drawPrimitives addObject:fillCircle0058];

    MWDrawTextLine *drawTextLine0099 = [[MWDrawTextLine alloc] init];
    drawTextLine0099.text = @"T";
    drawTextLine0099.fontColor = [UIColor whiteColor];
    drawTextLine0099.fontSize = 36;
    drawTextLine0099.origin = CGPointMake(415, 934);
    [station0029.drawPrimitives addObject:drawTextLine0099];
    
    MWDrawTextLine *drawTextLine0100 = [[MWDrawTextLine alloc] init];
    drawTextLine0100.text = @"14";
    drawTextLine0100.fontColor = [UIColor whiteColor];
    drawTextLine0100.fontSize = 36;
    drawTextLine0100.origin = CGPointMake(405, 966);
    [station0029.drawPrimitives addObject:drawTextLine0100];

    MWDrawTextLine *drawTextLine0136 = [[MWDrawTextLine alloc] init];
    drawTextLine0136.text = station0029.nameOriginal;
    drawTextLine0136.radians = 90 * M_PI / 180;
    drawTextLine0136.fontName = @"HelveticaNeue";
    drawTextLine0136.fontColor = [UIColor blackColor];
    drawTextLine0136.fontSize = 40;
    drawTextLine0136.origin = CGPointMake(451, 1036);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0136];

    MWDrawTextLine *drawTextLine0137 = [[MWDrawTextLine alloc] init];
    drawTextLine0137.text = station0029.nameEnglish;
    drawTextLine0137.radians = 90 * M_PI / 180;
    drawTextLine0137.fontName = @"HelveticaNeue";
    drawTextLine0137.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0137.fontSize = 34;
    drawTextLine0137.origin = CGPointMake(408, 1031);
    [station0029.nameEnglishTextPrimitives addObject:drawTextLine0137];

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 800;
    [edge0004.elements addObject:haul0028];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(426, 971.5);
    drawLine0045.endPoint = CGPointMake(305, 971.5);
    drawLine0045.width = 52;
    drawLine0045.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawLine0045];
    
    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(426, 971.5);
    drawLine0046.endPoint = CGPointMake(305, 971.5);
    drawLine0046.width = 6;
    drawLine0046.color = [UIColor whiteColor];
    [haul0028.drawPrimitives addObject:drawLine0046];

    // Добавляем станцию Nijō
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0004.elements addObject:station0030];
    
    station0030.nameOriginal = @"二条駅";
    station0030.nameEnglish = @"Nijō";
    station0030.mapLocation = CGPointMake(305, 971.5);
    station0030.geoLocation = CGPointMake(35.010975, 135.741694);

    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = station0030.mapLocation;
    fillCircle0059.radius = 43;
    fillCircle0059.fillColor = [UIColor whiteColor];
    [station0030.drawPrimitives addObject:fillCircle0059];
    
    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = station0030.mapLocation;
    fillCircle0060.radius = 37;
    fillCircle0060.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0030.drawPrimitives addObject:fillCircle0060];

    MWDrawTextLine *drawTextLine0101 = [[MWDrawTextLine alloc] init];
    drawTextLine0101.text = @"T";
    drawTextLine0101.fontColor = [UIColor whiteColor];
    drawTextLine0101.fontSize = 36;
    drawTextLine0101.origin = CGPointMake(294, 934);
    [station0030.drawPrimitives addObject:drawTextLine0101];
    
    MWDrawTextLine *drawTextLine0102 = [[MWDrawTextLine alloc] init];
    drawTextLine0102.text = @"15";
    drawTextLine0102.fontColor = [UIColor whiteColor];
    drawTextLine0102.fontSize = 36;
    drawTextLine0102.origin = CGPointMake(284, 966);
    [station0030.drawPrimitives addObject:drawTextLine0102];

    MWDrawTextLine *drawTextLine0138 = [[MWDrawTextLine alloc] init];
    drawTextLine0138.text = station0030.nameOriginal;
    drawTextLine0138.radians = 90 * M_PI / 180;
    drawTextLine0138.fontName = @"HelveticaNeue";
    drawTextLine0138.fontColor = [UIColor blackColor];
    drawTextLine0138.fontSize = 40;
    drawTextLine0138.origin = CGPointMake(331, 1036);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0138];

    MWDrawTextLine *drawTextLine0139 = [[MWDrawTextLine alloc] init];
    drawTextLine0139.text = station0030.nameEnglish;
    drawTextLine0139.radians = 90 * M_PI / 180;
    drawTextLine0139.fontName = @"HelveticaNeue";
    drawTextLine0139.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0139.fontSize = 34;
    drawTextLine0139.origin = CGPointMake(288, 1031);
    [station0030.nameEnglishTextPrimitives addObject:drawTextLine0139];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 1100;
    [edge0004.elements addObject:haul0029];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(305.5, 971.5);
    drawLine0047.endPoint = CGPointMake(171, 971.5);
    drawLine0047.width = 52;
    drawLine0047.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0047];
    
    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(305.5, 971.5);
    drawLine0048.endPoint = CGPointMake(171, 971.5);
    drawLine0048.width = 6;
    drawLine0048.color = [UIColor whiteColor];
    [haul0029.drawPrimitives addObject:drawLine0048];

    // Добавляем станцию Nishiōji Oike
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0004.elements addObject:station0031];
    
    station0031.nameOriginal = @"西大路御池駅";
    station0031.nameEnglish = @"Nishiōji Oike";
    station0031.mapLocation = CGPointMake(171, 971.5);
    station0031.geoLocation = CGPointMake(35.010933, 135.730464);

    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = station0031.mapLocation;
    fillCircle0061.radius = 43;
    fillCircle0061.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0061];
    
    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = station0031.mapLocation;
    fillCircle0062.radius = 37;
    fillCircle0062.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0031.drawPrimitives addObject:fillCircle0062];

    MWDrawTextLine *drawTextLine0103 = [[MWDrawTextLine alloc] init];
    drawTextLine0103.text = @"T";
    drawTextLine0103.fontColor = [UIColor whiteColor];
    drawTextLine0103.fontSize = 36;
    drawTextLine0103.origin = CGPointMake(161, 934);
    [station0031.drawPrimitives addObject:drawTextLine0103];
    
    MWDrawTextLine *drawTextLine0104 = [[MWDrawTextLine alloc] init];
    drawTextLine0104.text = @"16";
    drawTextLine0104.fontColor = [UIColor whiteColor];
    drawTextLine0104.fontSize = 36;
    drawTextLine0104.origin = CGPointMake(151, 966);
    [station0031.drawPrimitives addObject:drawTextLine0104];

    MWDrawTextLine *drawTextLine0140 = [[MWDrawTextLine alloc] init];
    drawTextLine0140.text = station0031.nameOriginal;
    drawTextLine0140.radians = 90 * M_PI / 180;
    drawTextLine0140.fontName = @"HelveticaNeue";
    drawTextLine0140.fontColor = [UIColor blackColor];
    drawTextLine0140.fontSize = 40;
    drawTextLine0140.origin = CGPointMake(212, 1030);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0140];

    MWDrawTextLine *drawTextLine0141 = [[MWDrawTextLine alloc] init];
    drawTextLine0141.text = station0031.nameEnglish;
    drawTextLine0141.radians = 90 * M_PI / 180;
    drawTextLine0141.fontName = @"HelveticaNeue";
    drawTextLine0141.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0141.fontSize = 34;
    drawTextLine0141.origin = CGPointMake(167, 1032);
    [station0031.nameEnglishTextPrimitives addObject:drawTextLine0141];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 1300;
    [edge0004.elements addObject:haul0030];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(171.5, 971.5);
    drawLine0049.endPoint = CGPointMake(47, 971.5);
    drawLine0049.width = 52;
    drawLine0049.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0049];
    
    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(171.5, 971.5);
    drawLine0050.endPoint = CGPointMake(47, 971.5);
    drawLine0050.width = 6;
    drawLine0050.color = [UIColor whiteColor];
    [haul0030.drawPrimitives addObject:drawLine0050];

    // Добавляем станцию Uzumasa Tenjingawa
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0004.elements addObject:station0032];
    
    station0032.nameOriginal = @"太秦天神川駅";
    station0032.nameEnglish = @"Uzumasa Tenjingawa";
    station0032.mapLocation = CGPointMake(47, 971.5);
    station0032.geoLocation = CGPointMake(35.010808, 135.715558);

    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = station0032.mapLocation;
    fillCircle0063.radius = 43;
    fillCircle0063.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0063];
    
    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = station0032.mapLocation;
    fillCircle0064.radius = 37;
    fillCircle0064.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [station0032.drawPrimitives addObject:fillCircle0064];

    MWDrawTextLine *drawTextLine0105 = [[MWDrawTextLine alloc] init];
    drawTextLine0105.text = @"T";
    drawTextLine0105.fontColor = [UIColor whiteColor];
    drawTextLine0105.fontSize = 36;
    drawTextLine0105.origin = CGPointMake(37, 934);
    [station0032.drawPrimitives addObject:drawTextLine0105];
    
    MWDrawTextLine *drawTextLine0106 = [[MWDrawTextLine alloc] init];
    drawTextLine0106.text = @"17";
    drawTextLine0106.fontColor = [UIColor whiteColor];
    drawTextLine0106.fontSize = 36;
    drawTextLine0106.origin = CGPointMake(27, 966);
    [station0032.drawPrimitives addObject:drawTextLine0106];

    MWDrawTextLine *drawTextLine0142 = [[MWDrawTextLine alloc] init];
    drawTextLine0142.text = station0032.nameOriginal;
    drawTextLine0142.radians = 90 * M_PI / 180;
    drawTextLine0142.fontName = @"HelveticaNeue";
    drawTextLine0142.fontColor = [UIColor blackColor];
    drawTextLine0142.fontSize = 40;
    drawTextLine0142.origin = CGPointMake(87, 1031);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0142];

    MWDrawTextLine *drawTextLine0143 = [[MWDrawTextLine alloc] init];
    drawTextLine0143.text = station0032.nameEnglish;
    drawTextLine0143.radians = 90 * M_PI / 180;
    drawTextLine0143.fontName = @"HelveticaNeue";
    drawTextLine0143.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0143.fontSize = 34;
    drawTextLine0143.origin = CGPointMake(42, 1032);
    [station0032.nameEnglishTextPrimitives addObject:drawTextLine0143];

    // Добавляем вершину
    edge0004.finishVertex = vertex0005;

    ///////////////////////////////////////
    MWDrawTextLine *drawTextLine0107 = [[MWDrawTextLine alloc] init];
    drawTextLine0107.text = @"Diagram of the Kyoto City Subway Line";
    drawTextLine0007.fontName = @"EuphemiaUCAS";
    drawTextLine0107.fontColor = [UIColor colorWithRed:(89/255.0) green:(86/255.0) blue:(86/255.0) alpha:1];
    drawTextLine0107.fontSize = 60;
    drawTextLine0107.kernSpacing = 1.2;
    drawTextLine0107.origin = CGPointMake(291, 31);
    [self.additionalOverMapPrimitives addObject:drawTextLine0107];
    
    MWDrawTextLine *drawTextLine0108 = [[MWDrawTextLine alloc] init];
    drawTextLine0108.text = @"烏丸線";
    drawTextLine0108.fontName = @"HelveticaNeue";
    drawTextLine0108.fontColor = [UIColor colorWithRed:(128/255.0) green:(128/255.0) blue:(128/255.0) alpha:1];
    drawTextLine0108.fontSize = 60;
    drawTextLine0108.origin = CGPointMake(268, 200);
    [self.additionalOverMapPrimitives addObject:drawTextLine0108];

    MWDrawTextLine *drawTextLine0109 = [[MWDrawTextLine alloc] init];
    drawTextLine0109.text = @"Karasuma Line";
    drawTextLine0109.fontName = @"HelveticaNeue";
    drawTextLine0109.fontColor = [UIColor colorWithRed:(128/255.0) green:(128/255.0) blue:(128/255.0) alpha:1];
    drawTextLine0109.fontSize = 32;
    drawTextLine0109.origin = CGPointMake(252, 260);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0109];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(241, 304);
    drawLine0051.endPoint = CGPointMake(250, 304);
    drawLine0051.width = 3;
    drawLine0051.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0051];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(261, 304);
    drawLine0052.endPoint = CGPointMake(273, 304);
    drawLine0052.width = 3;
    drawLine0052.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0052];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(285, 304);
    drawLine0053.endPoint = CGPointMake(297, 304);
    drawLine0053.width = 3;
    drawLine0053.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0053];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(309, 304);
    drawLine0054.endPoint = CGPointMake(321, 304);
    drawLine0054.width = 3;
    drawLine0054.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0054];

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(333, 304);
    drawLine0055.endPoint = CGPointMake(345, 304);
    drawLine0055.width = 3;
    drawLine0055.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0055];

    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(357, 304);
    drawLine0056.endPoint = CGPointMake(369, 304);
    drawLine0056.width = 3;
    drawLine0056.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0056];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(381, 304);
    drawLine0057.endPoint = CGPointMake(393, 304);
    drawLine0057.width = 3;
    drawLine0057.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0057];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(405, 304);
    drawLine0058.endPoint = CGPointMake(417, 304);
    drawLine0058.width = 3;
    drawLine0058.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0058];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(429, 304);
    drawLine0059.endPoint = CGPointMake(441, 304);
    drawLine0059.width = 3;
    drawLine0059.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0059];

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(453, 304);
    drawLine0060.endPoint = CGPointMake(465, 304);
    drawLine0060.width = 3;
    drawLine0060.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0060];

    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(477, 304);
    drawLine0061.endPoint = CGPointMake(489, 304);
    drawLine0061.width = 3;
    drawLine0061.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0061];

    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(498, 312);
    drawLine0062.endPoint = CGPointMake(508, 322);
    drawLine0062.width = 3;
    drawLine0062.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0062];

    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(515, 329);
    drawLine0063.endPoint = CGPointMake(525, 339);
    drawLine0063.width = 3;
    drawLine0063.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0063];

    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(532, 346);
    drawLine0064.endPoint = CGPointMake(542, 356);
    drawLine0064.width = 3;
    drawLine0064.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0064];

    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(549, 363);
    drawLine0065.endPoint = CGPointMake(559, 373);
    drawLine0065.width = 3;
    drawLine0065.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0065];

    MWDrawTextLine *drawTextLine0110 = [[MWDrawTextLine alloc] init];
    drawTextLine0110.text = @"東西線";
    drawTextLine0110.fontName = @"HelveticaNeue";
    drawTextLine0110.fontColor = [UIColor colorWithRed:(128/255.0) green:(128/255.0) blue:(128/255.0) alpha:1];
    drawTextLine0110.fontSize = 60;
    drawTextLine0110.origin = CGPointMake(1232, 1300);
    [self.additionalOverMapPrimitives addObject:drawTextLine0110];
    
    MWDrawTextLine *drawTextLine0111 = [[MWDrawTextLine alloc] init];
    drawTextLine0111.text = @"Tōzai Line";
    drawTextLine0111.fontName = @"HelveticaNeue";
    drawTextLine0111.fontColor = [UIColor colorWithRed:(128/255.0) green:(128/255.0) blue:(128/255.0) alpha:1];
    drawTextLine0111.fontSize = 32;
    drawTextLine0111.origin = CGPointMake(1249, 1366);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0111];

    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(1219, 1411);
    drawLine0066.endPoint = CGPointMake(1230, 1411);
    drawLine0066.width = 3;
    drawLine0066.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0066];

    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(1243, 1411);
    drawLine0067.endPoint = CGPointMake(1255, 1411);
    drawLine0067.width = 3;
    drawLine0067.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0067];

    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(1267, 1411);
    drawLine0068.endPoint = CGPointMake(1279, 1411);
    drawLine0068.width = 3;
    drawLine0068.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0068];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(1291, 1411);
    drawLine0069.endPoint = CGPointMake(1303, 1411);
    drawLine0069.width = 3;
    drawLine0069.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0069];

    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(1315, 1411);
    drawLine0070.endPoint = CGPointMake(1327, 1411);
    drawLine0070.width = 3;
    drawLine0070.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0070];

    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(1339, 1411);
    drawLine0071.endPoint = CGPointMake(1351, 1411);
    drawLine0071.width = 3;
    drawLine0071.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0071];

    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(1361, 1411);
    drawLine0072.endPoint = CGPointMake(1375, 1411);
    drawLine0072.width = 3;
    drawLine0072.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0072];

    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(1385, 1411);
    drawLine0073.endPoint = CGPointMake(1399, 1411);
    drawLine0073.width = 3;
    drawLine0073.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0073];

    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(1409, 1411);
    drawLine0074.endPoint = CGPointMake(1423, 1411);
    drawLine0074.width = 3;
    drawLine0074.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0074];

    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(1431, 1408);
    drawLine0075.endPoint = CGPointMake(1441, 1397);
    drawLine0075.width = 3;
    drawLine0075.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0075];

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(1447, 1389);
    drawLine0076.endPoint = CGPointMake(1456, 1377);
    drawLine0076.width = 3;
    drawLine0076.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0076];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(1462, 1370);
    drawLine0077.endPoint = CGPointMake(1471, 1358);
    drawLine0077.width = 3;
    drawLine0077.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0077];

    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(1477, 1351);
    drawLine0078.endPoint = CGPointMake(1486, 1339);
    drawLine0078.width = 3;
    drawLine0078.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0078];

    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(1492, 1332);
    drawLine0079.endPoint = CGPointMake(1501, 1320);
    drawLine0079.width = 3;
    drawLine0079.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0079];

    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(1507, 1313);
    drawLine0080.endPoint = CGPointMake(1516, 1301);
    drawLine0080.width = 3;
    drawLine0080.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0080];

    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(1522, 1294);
    drawLine0081.endPoint = CGPointMake(1531, 1282);
    drawLine0081.width = 3;
    drawLine0081.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0081];

    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(1537, 1275);
    drawLine0082.endPoint = CGPointMake(1546, 1263);
    drawLine0082.width = 3;
    drawLine0082.color = [UIColor colorWithRed:(167/255.0) green:(167/255.0) blue:(167/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0082];

    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(125, 1952);
    drawLine0083.endPoint = CGPointMake(1027, 1952);
    drawLine0083.width = 1;
    drawLine0083.color = [UIColor colorWithRed:(172/255.0) green:(172/255.0) blue:(171/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0083];

    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(1027, 1952);
    drawLine0084.endPoint = CGPointMake(1027, 2283);
    drawLine0084.width = 1;
    drawLine0084.color = [UIColor colorWithRed:(172/255.0) green:(172/255.0) blue:(171/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0084];

    MWDrawLine *drawLine0085 = [[MWDrawLine alloc] init];
    drawLine0085.startPoint = CGPointMake(1027, 2283);
    drawLine0085.endPoint = CGPointMake(125, 2283);
    drawLine0085.width = 1;
    drawLine0085.color = [UIColor colorWithRed:(172/255.0) green:(172/255.0) blue:(171/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0085];

    MWDrawLine *drawLine0086 = [[MWDrawLine alloc] init];
    drawLine0086.startPoint = CGPointMake(125, 1952);
    drawLine0086.endPoint = CGPointMake(125, 2283);
    drawLine0086.width = 1;
    drawLine0086.color = [UIColor colorWithRed:(172/255.0) green:(172/255.0) blue:(171/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0086];

    MWDrawLine *drawLine0087 = [[MWDrawLine alloc] init];
    drawLine0087.startPoint = CGPointMake(143, 2024);
    drawLine0087.endPoint = CGPointMake(367, 2024);
    drawLine0087.width = 52;
    drawLine0087.color = line0001.color;
    [self.additionalEnglishTextPrimitives addObject:drawLine0087];

    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = CGPointMake(252.5, 2024);
    fillCircle0065.radius = 43;
    fillCircle0065.fillColor = [UIColor whiteColor];
    [self.additionalEnglishTextPrimitives addObject:fillCircle0065];
    
    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = CGPointMake(252.5, 2024);
    fillCircle0066.radius = 37;
    fillCircle0066.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:fillCircle0066];

    MWDrawTextLine *drawTextLine0112 = [[MWDrawTextLine alloc] init];
    drawTextLine0112.text = @"K";
    drawTextLine0112.fontColor = [UIColor whiteColor];
    drawTextLine0112.fontSize = 50;
    drawTextLine0112.origin = CGPointMake(237, 1996);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0112];

    MWDrawLine *drawLine0088 = [[MWDrawLine alloc] init];
    drawLine0088.startPoint = CGPointMake(143, 2139);
    drawLine0088.endPoint = CGPointMake(367, 2139);
    drawLine0088.width = 52;
    drawLine0088.color = line0002.color;
    [self.additionalEnglishTextPrimitives addObject:drawLine0088];
    
    MWDrawLine *drawLine0089 = [[MWDrawLine alloc] init];
    drawLine0089.startPoint = CGPointMake(143, 2139);
    drawLine0089.endPoint = CGPointMake(367, 2139);
    drawLine0089.width = 6;
    drawLine0089.color = [UIColor whiteColor];
    [self.additionalEnglishTextPrimitives addObject:drawLine0089];

    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = CGPointMake(252.5, 2139);
    fillCircle0067.radius = 43;
    fillCircle0067.fillColor = [UIColor whiteColor];
    [self.additionalEnglishTextPrimitives addObject:fillCircle0067];
    
    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = CGPointMake(252.5, 2139);
    fillCircle0068.radius = 37;
    fillCircle0068.fillColor = [UIColor colorWithRed:(240/255.0) green:(133/255.0) blue:(93/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:fillCircle0068];

    MWDrawTextLine *drawTextLine0113 = [[MWDrawTextLine alloc] init];
    drawTextLine0113.text = @"T";
    drawTextLine0113.fontColor = [UIColor whiteColor];
    drawTextLine0113.fontSize = 50;
    drawTextLine0113.origin = CGPointMake(238, 2111);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0113];

    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = CGPointMake(658.5, 2120);
    fillCircle0069.radius = 57;
    fillCircle0069.fillColor = [UIColor colorWithRed:(9/255.0) green:(145/255.0) blue:(137/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:fillCircle0069];

    MWDrawTextLine *drawTextLine0114 = [[MWDrawTextLine alloc] init];
    drawTextLine0114.text = @"K";
    drawTextLine0114.fontColor = [UIColor whiteColor];
    drawTextLine0114.fontSize = 54;
    drawTextLine0114.origin = CGPointMake(639, 2065);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0114];

    MWDrawTextLine *drawTextLine0115 = [[MWDrawTextLine alloc] init];
    drawTextLine0115.text = @"15";
    drawTextLine0115.fontColor = [UIColor whiteColor];
    drawTextLine0115.fontSize = 54;
    drawTextLine0115.origin = CGPointMake(624, 2109);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0115];

    MWDrawLine *drawLine0090 = [[MWDrawLine alloc] init];
    drawLine0090.startPoint = CGPointMake(714, 2085);
    drawLine0090.endPoint = CGPointMake(749, 2085);
    drawLine0090.width = 5;
    drawLine0090.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0090];

    MWDrawLine *drawLine0091 = [[MWDrawLine alloc] init];
    drawLine0091.startPoint = CGPointMake(707, 2085);
    drawLine0091.endPoint = CGPointMake(707, 2085);
    drawLine0091.width = 1;
    drawLine0091.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0091];

    MWDrawLine *drawLine0092 = [[MWDrawLine alloc] init];
    drawLine0092.startPoint = CGPointMake(708, 2084);
    drawLine0092.endPoint = CGPointMake(708, 2086);
    drawLine0092.width = 1;
    drawLine0092.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0092];

    MWDrawLine *drawLine0093 = [[MWDrawLine alloc] init];
    drawLine0093.startPoint = CGPointMake(709, 2083);
    drawLine0093.endPoint = CGPointMake(709, 2087);
    drawLine0093.width = 1;
    drawLine0093.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0093];

    MWDrawLine *drawLine0094 = [[MWDrawLine alloc] init];
    drawLine0094.startPoint = CGPointMake(710, 2082);
    drawLine0094.endPoint = CGPointMake(710, 2088);
    drawLine0094.width = 1;
    drawLine0094.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0094];

    MWDrawLine *drawLine0095 = [[MWDrawLine alloc] init];
    drawLine0095.startPoint = CGPointMake(711, 2081);
    drawLine0095.endPoint = CGPointMake(711, 2089);
    drawLine0095.width = 1;
    drawLine0095.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0095];

    MWDrawLine *drawLine0096 = [[MWDrawLine alloc] init];
    drawLine0096.startPoint = CGPointMake(712, 2080);
    drawLine0096.endPoint = CGPointMake(712, 2090);
    drawLine0096.width = 1;
    drawLine0096.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0096];

    MWDrawLine *drawLine0097 = [[MWDrawLine alloc] init];
    drawLine0097.startPoint = CGPointMake(713, 2079);
    drawLine0097.endPoint = CGPointMake(713, 2091);
    drawLine0097.width = 1;
    drawLine0097.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0097];

    MWDrawLine *drawLine0098 = [[MWDrawLine alloc] init];
    drawLine0098.startPoint = CGPointMake(714, 2078);
    drawLine0098.endPoint = CGPointMake(714, 2092);
    drawLine0098.width = 1;
    drawLine0098.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0098];

    MWDrawLine *drawLine0099 = [[MWDrawLine alloc] init];
    drawLine0099.startPoint = CGPointMake(715, 2077);
    drawLine0099.endPoint = CGPointMake(715, 2093);
    drawLine0099.width = 1;
    drawLine0099.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0099];

    MWDrawLine *drawLine0100 = [[MWDrawLine alloc] init];
    drawLine0100.startPoint = CGPointMake(716, 2076);
    drawLine0100.endPoint = CGPointMake(716, 2094);
    drawLine0100.width = 1;
    drawLine0100.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0100];

    MWDrawLine *drawLine0101 = [[MWDrawLine alloc] init];
    drawLine0101.startPoint = CGPointMake(717, 2075);
    drawLine0101.endPoint = CGPointMake(717, 2095);
    drawLine0101.width = 1;
    drawLine0101.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0101];

    MWDrawLine *drawLine0102 = [[MWDrawLine alloc] init];
    drawLine0102.startPoint = CGPointMake(718, 2074);
    drawLine0102.endPoint = CGPointMake(718, 2096);
    drawLine0102.width = 1;
    drawLine0102.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0102];

    MWDrawLine *drawLine0103 = [[MWDrawLine alloc] init];
    drawLine0103.startPoint = CGPointMake(658.5, 2185);
    drawLine0103.endPoint = CGPointMake(658.5, 2220);
    drawLine0103.width = 5;
    drawLine0103.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0103];

    MWDrawLine *drawLine0104 = [[MWDrawLine alloc] init];
    drawLine0104.startPoint = CGPointMake(658.5, 2180);
    drawLine0104.endPoint = CGPointMake(658.5, 2180);
    drawLine0104.width = 1;
    drawLine0104.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0104];

    MWDrawLine *drawLine0105 = [[MWDrawLine alloc] init];
    drawLine0105.startPoint = CGPointMake(657.5, 2181);
    drawLine0105.endPoint = CGPointMake(659.5, 2181);
    drawLine0105.width = 1;
    drawLine0105.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0105];

    MWDrawLine *drawLine0106 = [[MWDrawLine alloc] init];
    drawLine0106.startPoint = CGPointMake(656.5, 2182);
    drawLine0106.endPoint = CGPointMake(660.5, 2182);
    drawLine0106.width = 1;
    drawLine0106.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0106];

    MWDrawLine *drawLine0107 = [[MWDrawLine alloc] init];
    drawLine0107.startPoint = CGPointMake(655.5, 2183);
    drawLine0107.endPoint = CGPointMake(661.5, 2183);
    drawLine0107.width = 1;
    drawLine0107.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0107];

    MWDrawLine *drawLine0108 = [[MWDrawLine alloc] init];
    drawLine0108.startPoint = CGPointMake(654.5, 2184);
    drawLine0108.endPoint = CGPointMake(662.5, 2184);
    drawLine0108.width = 1;
    drawLine0108.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0108];

    MWDrawLine *drawLine0109 = [[MWDrawLine alloc] init];
    drawLine0109.startPoint = CGPointMake(653.5, 2185);
    drawLine0109.endPoint = CGPointMake(663.5, 2185);
    drawLine0109.width = 1;
    drawLine0109.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0109];

    MWDrawLine *drawLine0110 = [[MWDrawLine alloc] init];
    drawLine0110.startPoint = CGPointMake(652.5, 2186);
    drawLine0110.endPoint = CGPointMake(664.5, 2186);
    drawLine0110.width = 1;
    drawLine0110.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0110];

    MWDrawLine *drawLine0111 = [[MWDrawLine alloc] init];
    drawLine0111.startPoint = CGPointMake(651.5, 2187);
    drawLine0111.endPoint = CGPointMake(665.5, 2187);
    drawLine0111.width = 1;
    drawLine0111.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0111];

    MWDrawLine *drawLine0112 = [[MWDrawLine alloc] init];
    drawLine0112.startPoint = CGPointMake(650.5, 2188);
    drawLine0112.endPoint = CGPointMake(666.5, 2188);
    drawLine0112.width = 1;
    drawLine0112.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0112];

    MWDrawLine *drawLine0113 = [[MWDrawLine alloc] init];
    drawLine0113.startPoint = CGPointMake(649.5, 2189);
    drawLine0113.endPoint = CGPointMake(667.5, 2189);
    drawLine0113.width = 1;
    drawLine0113.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0113];

    MWDrawLine *drawLine0114 = [[MWDrawLine alloc] init];
    drawLine0114.startPoint = CGPointMake(648.5, 2190);
    drawLine0114.endPoint = CGPointMake(668.5, 2190);
    drawLine0114.width = 1;
    drawLine0114.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0114];

    MWDrawLine *drawLine0115 = [[MWDrawLine alloc] init];
    drawLine0115.startPoint = CGPointMake(647.5, 2191);
    drawLine0115.endPoint = CGPointMake(669.5, 2191);
    drawLine0115.width = 1;
    drawLine0115.color = [UIColor colorWithRed:(160/255.0) green:(204/255.0) blue:(146/255.0) alpha:1];
    [self.additionalEnglishTextPrimitives addObject:drawLine0115];

    MWDrawTextLine *drawTextLine0116 = [[MWDrawTextLine alloc] init];
    drawTextLine0116.text = @"Karasuma Line";
    drawTextLine0116.fontName = @"HelveticaNeue";
    drawTextLine0116.fontColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
    drawTextLine0116.fontSize = 34;
    drawTextLine0116.origin = CGPointMake(382, 1991);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0116];

    MWDrawTextLine *drawTextLine0117 = [[MWDrawTextLine alloc] init];
    drawTextLine0117.text = @"(Green)";
    drawTextLine0117.fontName = @"HelveticaNeue";
    drawTextLine0117.fontColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
    drawTextLine0117.fontSize = 34;
    drawTextLine0117.origin = CGPointMake(442, 2024);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0117];

    MWDrawTextLine *drawTextLine0118 = [[MWDrawTextLine alloc] init];
    drawTextLine0118.text = @"Tōzai Line";
    drawTextLine0118.fontName = @"HelveticaNeue";
    drawTextLine0118.fontColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
    drawTextLine0118.fontSize = 34;
    drawTextLine0118.origin = CGPointMake(386, 2102);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0118];

    MWDrawTextLine *drawTextLine0119 = [[MWDrawTextLine alloc] init];
    drawTextLine0119.text = @"(Red)";
    drawTextLine0119.fontName = @"HelveticaNeue";
    drawTextLine0119.fontColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
    drawTextLine0119.fontSize = 34;
    drawTextLine0119.origin = CGPointMake(425, 2140);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0119];

    MWDrawTextLine *drawTextLine0120 = [[MWDrawTextLine alloc] init];
    drawTextLine0120.text = @"Station Number";
    drawTextLine0120.fontName = @"HelveticaNeue";
    drawTextLine0120.fontColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
    drawTextLine0120.fontSize = 28;
    drawTextLine0120.origin = CGPointMake(582, 2225);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0120];

    MWDrawTextLine *drawTextLine0121 = [[MWDrawTextLine alloc] init];
    drawTextLine0121.text = @"Route Name";
    drawTextLine0121.fontName = @"HelveticaNeue";
    drawTextLine0121.fontColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
    drawTextLine0121.fontSize = 28;
    drawTextLine0121.origin = CGPointMake(766, 2023);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0121];

    MWDrawTextLine *drawTextLine0122 = [[MWDrawTextLine alloc] init];
    drawTextLine0122.text = @"K: Karasuma Line";
    drawTextLine0122.fontName = @"HelveticaNeue-LightItalic";
    drawTextLine0122.fontColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
    drawTextLine0122.fontSize = 28;
    drawTextLine0122.origin = CGPointMake(766, 2064);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0122];

    MWDrawTextLine *drawTextLine0123 = [[MWDrawTextLine alloc] init];
    drawTextLine0123.text = @"T: Tōzai Line";
    drawTextLine0123.fontName = @"HelveticaNeue-LightItalic";
    drawTextLine0123.fontColor = [UIColor colorWithRed:(64/255.0) green:(64/255.0) blue:(64/255.0) alpha:1];
    drawTextLine0123.fontSize = 28;
    drawTextLine0123.origin = CGPointMake(766, 2100);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0123];

    return self;
}

@end
