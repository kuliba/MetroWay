//
//  MMWuhanMetro.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 30.05.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWWuhanMetro.h"
#import "MWLine.h"
#import "MWHaul.h"
#import "MWDrawTextLine.h"
#import "MWDrawLine.h"

@implementation MWWuhanMetro

- (id)init
{
    // Инициализируем
    self = [super init];
    
    self.identifier = @"wuhan_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Line 1
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameEnglish = @"Line 1";
    line0001.nameOriginal = @"1号线";
    line0001.color = [UIColor colorWithRed:(0/255.0) green:(102/255.0) blue:(164/255.0) alpha:1];
    [self.lines addObject:line0001];

    // 2. Line 2
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameEnglish = @"Line 2";
    line0002.nameOriginal = @"2号线";
    line0002.color = [UIColor colorWithRed:(255/255.0) green:(102/255.0) blue:(164/255.0) alpha:1];
    [self.lines addObject:line0002];

    // 3. Line 4
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameEnglish = @"Line 4";
    line0003.nameOriginal = @"4号线";
    line0003.color = [UIColor colorWithRed:(169/255.0) green:(212/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0003];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0002];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Dongwu Ave
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Dongwu Ave";
    [self.vertices addObject:vertex0001];

    // Xunlimen
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Xunlimen";
    [self.vertices addObject:vertex0002];

    // Hankou North Station
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Hankou North Station";
    [self.vertices addObject:vertex0003];
    
    // Jinyintan
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Jinyintan";
    [self.vertices addObject:vertex0004];
    
    // Hongshan Square
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Hongshan Square";
    [self.vertices addObject:vertex0005];

    // Zhongnan Rd
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Zhongnan Rd";
    [self.vertices addObject:vertex0006];

    // Optics Valley Square
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Optics Valley Square";
    [self.vertices addObject:vertex0007];

    // Wuchang Railway Station
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Wuchang Railway Station";
    [self.vertices addObject:vertex0008];

    // Wuhan Railway Station
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Wuhan Railway Station";
    [self.vertices addObject:vertex0009];

    ////////////////////////////////////////////////////////////////
    // 1. Line 1
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Dongwu Ave - Xunlimen
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Dongwu Ave - Xunlimen";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Jinshan Ave
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"金山大道";
    station0001.nameEnglish = @"Jinshan Boulevard";
    station0001.mapLocation = CGPointMake(67.5, 701.5);
    station0001.geoLocation = CGPointMake(30.627288, 114.122815);
 
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(67.5, 701.5);
    fillCircle0001.radius = 20;
    fillCircle0001.fillColor = [UIColor blackColor];
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = CGPointMake(67.5, 701.5);
    fillCircle0002.radius = 14;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0002];

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 40;
    drawTextLine0001.origin = CGPointMake(103, 674);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];
    
    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = @"Jinshan Ave";
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0002.fontSize = 24;
    drawTextLine0002.origin = CGPointMake(114, 721);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1653;
    [edge0001.elements addObject:haul0001];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(289, 640);
    drawArc0001.startRadians = 124 * M_PI / 180;
    drawArc0001.endRadians = 165 * M_PI / 180;
    drawArc0001.radius = 230;
    drawArc0001.width = 22;
    drawArc0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0001];
    
    // Добавляем станцию Dongwu Boulevard
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"东吴大道";
    station0002.nameEnglish = @"Dongwu Boulevard";
    station0002.mapLocation = CGPointMake(160, 830);
    station0002.geoLocation = CGPointMake(30.620066, 114.133110);
    
    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = CGPointMake(160, 830);
    fillCircle0003.radius = 20;
    fillCircle0003.fillColor = [UIColor blackColor];
    [station0002.drawPrimitives addObject:fillCircle0003];
    
    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = CGPointMake(160, 830);
    fillCircle0004.radius = 14;
    fillCircle0004.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0002.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 40;
    drawTextLine0003.origin = CGPointMake(189, 762);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];
    
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = @"Dongwu Ave";
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0004.fontSize = 24;
    drawTextLine0004.origin = CGPointMake(213, 809);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0004];
    
    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1656;
    [edge0001.elements addObject:haul0002];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(378, 500);
    drawArc0002.startRadians = 100.7 * M_PI / 180;
    drawArc0002.endRadians = 123.5 * M_PI / 180;
    drawArc0002.radius = 396;
    drawArc0002.width = 22;
    drawArc0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0002];

    // Добавляем станцию Wuhuan Boulevard
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"五环大道";
    station0003.nameEnglish = @"Wuhuan Boulevard";
    station0003.mapLocation = CGPointMake(303, 889);
    station0003.geoLocation = CGPointMake(30.620928, 114.150350);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = CGPointMake(303, 889);
    fillCircle0005.radius = 20;
    fillCircle0005.fillColor = [UIColor blackColor];
    [station0003.drawPrimitives addObject:fillCircle0005];
    
    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = CGPointMake(303, 889);
    fillCircle0006.radius = 14;
    fillCircle0006.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0003.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 40;
    drawTextLine0005.origin = CGPointMake(222, 915);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = @"Wuhuan Ave";
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0006.fontSize = 24;
    drawTextLine0006.origin = CGPointMake(236, 962);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 941;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(303, 889);
    drawLine0001.endPoint = CGPointMake(462, 889);
    drawLine0001.width = 22;
    drawLine0001.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0001];
    
    // Добавляем станцию Etouwan
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"额头湾";
    station0004.nameEnglish = @"Etouwan";
    station0004.mapLocation = CGPointMake(460, 889);
    station0004.geoLocation = CGPointMake(30.617374, 114.158267);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = CGPointMake(460, 889);
    fillCircle0007.radius = 20;
    fillCircle0007.fillColor = [UIColor blackColor];
    [station0004.drawPrimitives addObject:fillCircle0007];
    
    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = CGPointMake(460, 889);
    fillCircle0008.radius = 14;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0004.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 40;
    drawTextLine0007.origin = CGPointMake(397, 819);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];
    
    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0004.nameEnglish;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0008.fontSize = 24;
    drawTextLine0008.origin = CGPointMake(411, 791);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 809;
    [edge0001.elements addObject:haul0004];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(462, 1089);
    drawArc0003.startRadians = 270 * M_PI / 180;
    drawArc0003.endRadians = 315 * M_PI / 180;
    drawArc0003.radius = 200;
    drawArc0003.width = 22;
    drawArc0003.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawArc0003];

    // Добавляем станцию Zhuyehai
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"竹叶海";
    station0005.nameEnglish = @"Zhuyehai";
    station0005.mapLocation = CGPointMake(600.5, 945);
    station0005.geoLocation = CGPointMake(30.612318, 114.163968);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = CGPointMake(600.5, 945);
    fillCircle0009.radius = 20;
    fillCircle0009.fillColor = [UIColor blackColor];
    [station0005.drawPrimitives addObject:fillCircle0009];
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = CGPointMake(600.5, 945);
    fillCircle0010.radius = 14;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0005.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 40;
    drawTextLine0009.origin = CGPointMake(650, 917);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0009];
    
    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0005.nameEnglish;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0010.fontSize = 24;
    drawTextLine0010.origin = CGPointMake(678, 964);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1435;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(600.5, 945);
    drawLine0002.endPoint = CGPointMake(690, 1040.5);
    drawLine0002.width = 22;
    drawLine0002.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию Duoluokou
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"舵落口";
    station0006.nameEnglish = @"Duoluokou";
    station0006.mapLocation = CGPointMake(690, 1040.5);
    station0006.geoLocation = CGPointMake(30.606966, 114.177505);

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = CGPointMake(690, 1040.5);
    fillCircle0011.radius = 20;
    fillCircle0011.fillColor = [UIColor blackColor];
    [station0006.drawPrimitives addObject:fillCircle0011];
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = CGPointMake(690, 1040.5);
    fillCircle0012.radius = 14;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0012];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0006.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 40;
    drawTextLine0011.origin = CGPointMake(527, 1018);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0011];
    
    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0006.nameEnglish;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0012.fontSize = 24;
    drawTextLine0012.origin = CGPointMake(528, 1065);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0012];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1519;
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(689.5, 1040);
    drawLine0003.endPoint = CGPointMake(777, 1128.5);
    drawLine0003.width = 22;
    drawLine0003.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию Gutian 1st Road
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"古田一路";
    station0007.nameEnglish = @"Gutian 1st Road";
    station0007.mapLocation = CGPointMake(777, 1128.5);
    station0007.geoLocation = CGPointMake(30.599987, 114.191137);
    
    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0007.mapLocation;
    fillCircle0013.radius = 20;
    fillCircle0013.fillColor = [UIColor blackColor];
    [station0007.drawPrimitives addObject:fillCircle0013];
    
    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0007.mapLocation;
    fillCircle0014.radius = 14;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0014];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0007.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 40;
    drawTextLine0013.origin = CGPointMake(575, 1108);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0013];
    
    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = @"Gutian 1st Rd";
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0014.fontSize = 24;
    drawTextLine0014.origin = CGPointMake(588, 1155);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 907;
    [edge0001.elements addObject:haul0007];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(776.5, 1128);
    drawLine0004.endPoint = CGPointMake(864, 1215.5);
    drawLine0004.width = 22;
    drawLine0004.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Gutian 2nd Road
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"古田二路";
    station0008.nameEnglish = @"Gutian 2nd Road";
    station0008.mapLocation = CGPointMake(864, 1215.5);
    station0008.geoLocation = CGPointMake(30.595850, 114.119290);

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0008.mapLocation;
    fillCircle0015.radius = 20;
    fillCircle0015.fillColor = [UIColor blackColor];
    [station0008.drawPrimitives addObject:fillCircle0015];
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0008.mapLocation;
    fillCircle0016.radius = 14;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0008.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 40;
    drawTextLine0015.origin = CGPointMake(655, 1197);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0015];
    
    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = @"Gutian 2nd Rd";
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0016.fontSize = 24;
    drawTextLine0016.origin = CGPointMake(661, 1244);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0016];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 795;
    [edge0001.elements addObject:haul0008];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(863.5, 1215);
    drawLine0005.endPoint = CGPointMake(955.5, 1320.5);
    drawLine0005.width = 22;
    drawLine0005.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0005];

    // Добавляем станцию Gutian 3rd Road
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"古田三路";
    station0009.nameEnglish = @"Gutian 3rd Road";
    station0009.mapLocation = CGPointMake(955.5, 1320.5);
    station0009.geoLocation = CGPointMake(30.591807, 114.206113);

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0009.mapLocation;
    fillCircle0017.radius = 20;
    fillCircle0017.fillColor = [UIColor blackColor];
    [station0009.drawPrimitives addObject:fillCircle0017];
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0009.mapLocation;
    fillCircle0018.radius = 14;
    fillCircle0018.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0009.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 40;
    drawTextLine0017.origin = CGPointMake(747, 1297);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0017];
    
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = @"Gutian 3rd Rd";
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0018.fontSize = 24;
    drawTextLine0018.origin = CGPointMake(758, 1344);
    [station0009.nameEnglishTextPrimitives addObject:drawTextLine0018];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 822;
    [edge0001.elements addObject:haul0009];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(955, 1320);
    drawLine0006.endPoint = CGPointMake(1049, 1404.5);
    drawLine0006.width = 22;
    drawLine0006.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Gutian 4th Road
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0001.elements addObject:station0010];
    
    station0010.nameOriginal = @"古田四路";
    station0010.nameEnglish = @"Gutian 4th Road";
    station0010.mapLocation = CGPointMake(1049, 1404.5);
    station0010.geoLocation = CGPointMake(30.587939, 114.213382);

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0010.mapLocation;
    fillCircle0019.radius = 20;
    fillCircle0019.fillColor = [UIColor blackColor];
    [station0010.drawPrimitives addObject:fillCircle0019];
    
    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0010.mapLocation;
    fillCircle0020.radius = 14;
    fillCircle0020.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0010.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 40;
    drawTextLine0019.origin = CGPointMake(837, 1387);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0019];
    
    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = @"Gutian 4th Rd";
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0020.fontSize = 24;
    drawTextLine0020.origin = CGPointMake(848, 1434);
    [station0010.nameEnglishTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 919;
    [edge0001.elements addObject:haul0010];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(1540.5, 838);
    drawArc0004.startRadians = 120.8 * M_PI / 180;
    drawArc0004.endRadians = 131 * M_PI / 180;
    drawArc0004.radius = 750;
    drawArc0004.width = 22;
    drawArc0004.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawArc0004];

    // Добавляем станцию Hanxi 1st Road
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0001.elements addObject:station0011];
    
    station0011.nameOriginal = @"汉西一路";
    station0011.nameEnglish = @"Hanxi 1st Road";
    station0011.mapLocation = CGPointMake(1154.5, 1482);
    station0011.geoLocation = CGPointMake(30.582969, 114.220989);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0011.mapLocation;
    fillCircle0021.radius = 20;
    fillCircle0021.fillColor = [UIColor blackColor];
    [station0011.drawPrimitives addObject:fillCircle0021];
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0011.mapLocation;
    fillCircle0022.radius = 14;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0011.nameOriginal;
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 40;
    drawTextLine0021.origin = CGPointMake(937, 1467);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0021];
    
    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = @"Hanxi 1st Rd";
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0022.fontSize = 24;
    drawTextLine0022.origin = CGPointMake(958, 1514);
    [station0011.nameEnglishTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 1582;
    [edge0001.elements addObject:haul0011];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(1194, 1417.5);
    drawArc0005.startRadians = 90 * M_PI / 180;
    drawArc0005.endRadians = 120.7 * M_PI / 180;
    drawArc0005.radius = 75;
    drawArc0005.width = 22;
    drawArc0005.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(1194, 1492.5);
    drawLine0007.endPoint = CGPointMake(1322, 1492.5);
    drawLine0007.width = 22;
    drawLine0007.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Zongguan
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0001.elements addObject:station0012];
    
    station0012.nameOriginal = @"宗关";
    station0012.nameEnglish = @"Zongguan";
    station0012.mapLocation = CGPointMake(1322, 1492.5);
    station0012.geoLocation = CGPointMake(30.576526, 114.235284);

    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0012.mapLocation;
    fillCircle0023.radius = 20;
    fillCircle0023.fillColor = [UIColor blackColor];
    [station0012.drawPrimitives addObject:fillCircle0023];

    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0012.mapLocation;
    fillCircle0024.radius = 14;
    fillCircle0024.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0012.nameOriginal;
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 40;
    drawTextLine0023.origin = CGPointMake(1282, 1517);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0023];
    
    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = station0012.nameEnglish;
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0024.fontSize = 24;
    drawTextLine0024.origin = CGPointMake(1268, 1564);
    [station0012.nameEnglishTextPrimitives addObject:drawTextLine0024];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1039;
    [edge0001.elements addObject:haul0012];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(1321.5, 1492.5);
    drawLine0008.endPoint = CGPointMake(1515.5, 1491);
    drawLine0008.width = 22;
    drawLine0008.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Taipingyang
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0001.elements addObject:station0013];
    
    station0013.nameOriginal = @"太平洋";
    station0013.nameEnglish = @"Taipingyang";
    station0013.mapLocation = CGPointMake(1515.5, 1491);
    station0013.geoLocation = CGPointMake(30.574030, 114.244952);
    
    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0013.mapLocation;
    fillCircle0025.radius = 20;
    fillCircle0025.fillColor = [UIColor blackColor];
    [station0013.drawPrimitives addObject:fillCircle0025];
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0013.mapLocation;
    fillCircle0026.radius = 14;
    fillCircle0026.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0026];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = station0013.nameOriginal;
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 40;
    drawTextLine0025.origin = CGPointMake(1456, 1412);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0025];
    
    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0013.nameEnglish;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0026.fontSize = 24;
    drawTextLine0026.origin = CGPointMake(1452, 1380);
    [station0013.nameEnglishTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 1141;
    [edge0001.elements addObject:haul0013];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(1515, 1491);
    drawLine0009.endPoint = CGPointMake(1727, 1494.5);
    drawLine0009.width = 22;
    drawLine0009.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Qiaokou Road
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0001.elements addObject:station0014];
    
    station0014.nameOriginal = @"硚口路";
    station0014.nameEnglish = @"Qiaokou Road";
    station0014.mapLocation = CGPointMake(1727, 1494.5);
    station0014.geoLocation = CGPointMake(30.576468, 114.256470);
    
    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0014.mapLocation;
    fillCircle0027.radius = 20;
    fillCircle0027.fillColor = [UIColor blackColor];
    [station0014.drawPrimitives addObject:fillCircle0027];
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0014.mapLocation;
    fillCircle0028.radius = 14;
    fillCircle0028.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0014.nameOriginal;
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 40;
    drawTextLine0027.origin = CGPointMake(1666, 1519);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0027];
    
    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"Qiaokou Rd";
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0028.fontSize = 24;
    drawTextLine0028.origin = CGPointMake(1662, 1566);
    [station0014.nameEnglishTextPrimitives addObject:drawTextLine0028];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 879;
    [edge0001.elements addObject:haul0014];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(1726.5, 1494.5);
    drawLine0010.endPoint = CGPointMake(1940, 1492);
    drawLine0010.width = 22;
    drawLine0010.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Chongren Road
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0001.elements addObject:station0015];
    
    station0015.nameOriginal = @"崇仁路";
    station0015.nameEnglish = @"Chongren Road";
    station0015.mapLocation = CGPointMake(1940, 1492);
    station0015.geoLocation = CGPointMake(30.579886, 114.264688);                   
    
    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0015.mapLocation;
    fillCircle0029.radius = 20;
    fillCircle0029.fillColor = [UIColor blackColor];
    [station0015.drawPrimitives addObject:fillCircle0029];
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0015.mapLocation;
    fillCircle0030.radius = 14;
    fillCircle0030.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0030];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0015.nameOriginal;
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 40;
    drawTextLine0029.origin = CGPointMake(1877, 1516.5);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0029];
    
    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"Chongren Rd";
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0030.fontSize = 24;
    drawTextLine0030.origin = CGPointMake(1866, 1563.5);
    [station0015.nameEnglishTextPrimitives addObject:drawTextLine0030];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 894;
    [edge0001.elements addObject:haul0015];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(1939.5, 1492);
    drawLine0011.endPoint = CGPointMake(2133.5, 1483.5);
    drawLine0011.width = 22;
    drawLine0011.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0011];

    // Добавляем станцию Liji North Road
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0001.elements addObject:station0016];
    
    station0016.nameOriginal = @"利济北路";
    station0016.nameEnglish = @"Liji North Road";
    station0016.mapLocation = CGPointMake(2133.5, 1483.5);
    station0016.geoLocation = CGPointMake(30.583407, 114.273050);

    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0016.mapLocation;
    fillCircle0031.radius = 20;
    fillCircle0031.fillColor = [UIColor blackColor];
    [station0016.drawPrimitives addObject:fillCircle0031];
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0016.mapLocation;
    fillCircle0032.radius = 14;
    fillCircle0032.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0032];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = station0016.nameOriginal;
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 40;
    drawTextLine0031.origin = CGPointMake(2053, 1516.5);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0031];
    
    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = @"Liji N Rd";
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0032.fontSize = 24;
    drawTextLine0032.origin = CGPointMake(2088, 1563.5);
    [station0016.nameEnglishTextPrimitives addObject:drawTextLine0032];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 984;
    [edge0001.elements addObject:haul0016];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(2099, 1292);
    drawArc0006.startRadians = 36.4 * M_PI / 180;
    drawArc0006.endRadians = 80 * M_PI / 180;
    drawArc0006.radius = 195;
    drawArc0006.width = 22;
    drawArc0006.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawArc0006];

    // Добавляем станцию Youyi Road
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0001.elements addObject:station0017];

    station0017.nameOriginal = @"友谊路";
    station0017.nameEnglish = @"Youyi Road";
    station0017.mapLocation = CGPointMake(2255, 1408.5);
    station0017.geoLocation = CGPointMake(30.588046, 114.281670);

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0017.mapLocation;
    fillCircle0033.radius = 20;
    fillCircle0033.fillColor = [UIColor blackColor];
    [station0017.drawPrimitives addObject:fillCircle0033];
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0017.mapLocation;
    fillCircle0034.radius = 14;
    fillCircle0034.fillColor = [UIColor whiteColor];
    [station0017.drawPrimitives addObject:fillCircle0034];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0017.nameOriginal;
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 40;
    drawTextLine0033.origin = CGPointMake(2273, 1426.5);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0033];
    
    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = @"Youyi Rd";
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0034.fontSize = 24;
    drawTextLine0034.origin = CGPointMake(2288, 1473.5);
    [station0017.nameEnglishTextPrimitives addObject:drawTextLine0034];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 1083;
    [edge0001.elements addObject:haul0017];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(1342, 629);
    drawArc0007.startRadians = 33.5 * M_PI / 180;
    drawArc0007.endRadians = 42 * M_PI / 180;
    drawArc0007.radius = 1200;
    drawArc0007.width = 22;
    drawArc0007.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawArc0007];

    // Добавляем станцию Xunlimen
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0001.elements addObject:station0018];
    
    station0018.nameOriginal = @"循礼门";
    station0018.nameEnglish = @"Xunlimen";
    station0018.mapLocation = CGPointMake(2340.5, 1294.5);
    station0018.geoLocation = CGPointMake(30.595003, 114.289620);
    
    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0018.mapLocation;
    fillCircle0035.radius = 20;
    fillCircle0035.fillColor = [UIColor blackColor];
    [station0018.drawPrimitives addObject:fillCircle0035];
    
    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0018.mapLocation;
    fillCircle0036.radius = 14;
    fillCircle0036.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0036];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0018.nameOriginal;
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 40;
    drawTextLine0035.origin = CGPointMake(2391, 1239);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0035];
    
    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = station0018.nameEnglish;
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0036.fontSize = 24;
    drawTextLine0036.origin = CGPointMake(2403, 1286);
    [station0018.nameEnglishTextPrimitives addObject:drawTextLine0036];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;
    
    // Создаем участок линии Xunlimen - Hankou North Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Xunlimen - Hankou North Station";
    [self.edges addObject:edge0002];

    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;
    
    // Добавляем станцию Xunlimen
    [edge0002.elements addObject:station0018];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1013;
    [edge0002.elements addObject:haul0018];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(2340, 1295);
    drawLine0012.endPoint = CGPointMake(2417, 1173.5);
    drawLine0012.width = 22;
    drawLine0012.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0012];
    
    // Добавляем станцию Dazhi Road
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0002.elements addObject:station0019];
    
    station0019.nameOriginal = @"大智路";
    station0019.nameEnglish = @"Dazhi Road";
    station0019.mapLocation = CGPointMake(2417, 1173.5);
    station0019.geoLocation = CGPointMake(30.601935, 114.296411);
    
    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0019.mapLocation;
    fillCircle0037.radius = 20;
    fillCircle0037.fillColor = [UIColor blackColor];
    [station0019.drawPrimitives addObject:fillCircle0037];
    
    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0019.mapLocation;
    fillCircle0038.radius = 14;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0038];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = station0019.nameOriginal;
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 40;
    drawTextLine0037.origin = CGPointMake(2261, 1141);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0037];
    
    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"Dazhi Rd";
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0038.fontSize = 24;
    drawTextLine0038.origin = CGPointMake(2263, 1188);
    [station0019.nameEnglishTextPrimitives addObject:drawTextLine0038];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1155;
    [edge0002.elements addObject:haul0019];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(2416.5, 1174);
    drawLine0013.endPoint = CGPointMake(2475.5, 1083.5);
    drawLine0013.width = 22;
    drawLine0013.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0013];

    // Добавляем станцию Sanyang Road
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0002.elements addObject:station0020];
    
    station0020.nameOriginal = @"三阳路";
    station0020.nameEnglish = @"Sanyang Road";
    station0020.mapLocation = CGPointMake(2475.5, 1083.5);
    station0020.geoLocation = CGPointMake(30.610812, 114.302677);

    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0020.mapLocation;
    fillCircle0039.radius = 20;
    fillCircle0039.fillColor = [UIColor blackColor];
    [station0020.drawPrimitives addObject:fillCircle0039];
    
    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0020.mapLocation;
    fillCircle0040.radius = 14;
    fillCircle0040.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0040];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = station0020.nameOriginal;
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 40;
    drawTextLine0039.origin = CGPointMake(2317, 1060);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0039];
    
    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = @"Sanyang Rd";
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0040.fontSize = 24;
    drawTextLine0040.origin = CGPointMake(2286, 1107);
    [station0020.nameEnglishTextPrimitives addObject:drawTextLine0040];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 1205;
    [edge0002.elements addObject:haul0020];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(2475, 1084);
    drawLine0014.endPoint = CGPointMake(2534, 993.5);
    drawLine0014.width = 22;
    drawLine0014.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0014];

    // Добавляем станцию Huangpu Road
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0002.elements addObject:station0021];
    
    station0021.nameOriginal = @"黄浦路";
    station0021.nameEnglish = @"Huangpu Road";
    station0021.mapLocation = CGPointMake(2534, 993.5);
    station0021.geoLocation = CGPointMake(30.620333, 114.308542);

    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0021.mapLocation;
    fillCircle0041.radius = 20;
    fillCircle0041.fillColor = [UIColor blackColor];
    [station0021.drawPrimitives addObject:fillCircle0041];
    
    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = station0021.mapLocation;
    fillCircle0042.radius = 14;
    fillCircle0042.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0042];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0021.nameOriginal;
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 40;
    drawTextLine0041.origin = CGPointMake(2373, 968);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0041];
    
    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = @"Huangpu Rd";
    drawTextLine0042.fontName = @"HelveticaNeue";
    drawTextLine0042.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0042.fontSize = 24;
    drawTextLine0042.origin = CGPointMake(2334, 1015);
    [station0021.nameEnglishTextPrimitives addObject:drawTextLine0042];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 911;
    [edge0002.elements addObject:haul0021];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(2533.5, 994);
    drawLine0015.endPoint = CGPointMake(2592, 903.5);
    drawLine0015.width = 22;
    drawLine0015.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0015];

    // Добавляем станцию Toudao Street
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0002.elements addObject:station0022];
    
    station0022.nameOriginal = @"头道街";
    station0022.nameEnglish = @"Toudao Street";
    station0022.mapLocation = CGPointMake(2592, 903.5);
    station0022.geoLocation = CGPointMake(30.627421, 114.313343);
    
    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = station0022.mapLocation;
    fillCircle0043.radius = 20;
    fillCircle0043.fillColor = [UIColor blackColor];
    [station0022.drawPrimitives addObject:fillCircle0043];
    
    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0022.mapLocation;
    fillCircle0044.radius = 14;
    fillCircle0044.fillColor = [UIColor whiteColor];
    [station0022.drawPrimitives addObject:fillCircle0044];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = station0022.nameOriginal;
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 40;
    drawTextLine0043.origin = CGPointMake(2430, 875);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0043];
    
    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = @"Toudao St";
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0044.fontSize = 24;
    drawTextLine0044.origin = CGPointMake(2417, 922);
    [station0022.nameEnglishTextPrimitives addObject:drawTextLine0044];
    
    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 792;
    [edge0002.elements addObject:haul0022];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(2591.5, 904);
    drawLine0016.endPoint = CGPointMake(2651, 813.5);
    drawLine0016.width = 22;
    drawLine0016.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию Erqi Road
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0002.elements addObject:station0023];
    
    station0023.nameOriginal = @"二七路";
    station0023.nameEnglish = @"Erqi Road";
    station0023.mapLocation = CGPointMake(2651, 813.5);
    station0023.geoLocation = CGPointMake(30.633604, 114.317500);

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0023.mapLocation;
    fillCircle0045.radius = 20;
    fillCircle0045.fillColor = [UIColor blackColor];
    [station0023.drawPrimitives addObject:fillCircle0045];
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0023.mapLocation;
    fillCircle0046.radius = 14;
    fillCircle0046.fillColor = [UIColor whiteColor];
    [station0023.drawPrimitives addObject:fillCircle0046];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = station0023.nameOriginal;
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 40;
    drawTextLine0045.origin = CGPointMake(2487, 789);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0045];
    
    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = @"Erqi Rd";
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0046.fontSize = 24;
    drawTextLine0046.origin = CGPointMake(2505, 836);
    [station0023.nameEnglishTextPrimitives addObject:drawTextLine0046];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 1527;
    [edge0002.elements addObject:haul0023];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(2650.5, 814);
    drawLine0017.endPoint = CGPointMake(2709.5, 723.5);
    drawLine0017.width = 22;
    drawLine0017.color = line0001.color;
    [haul0023.drawPrimitives addObject:drawLine0017];

    // Добавляем станцию Xuzhouxincun
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0002.elements addObject:station0024];
    
    station0024.nameOriginal = @"徐州新村";
    station0024.nameEnglish = @"Xuzhouxincun";
    station0024.mapLocation = CGPointMake(2709.5, 723.5);
    station0024.geoLocation = CGPointMake(30.645893, 114.324591);
    
    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = station0024.mapLocation;
    fillCircle0047.radius = 20;
    fillCircle0047.fillColor = [UIColor blackColor];
    [station0024.drawPrimitives addObject:fillCircle0047];
    
    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = station0024.mapLocation;
    fillCircle0048.radius = 14;
    fillCircle0048.fillColor = [UIColor whiteColor];
    [station0024.drawPrimitives addObject:fillCircle0048];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = station0024.nameOriginal;
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 40;
    drawTextLine0047.origin = CGPointMake(2510, 699);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0047];
    
    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0024.nameEnglish;
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0048.fontSize = 24;
    drawTextLine0048.origin = CGPointMake(2488, 746);
    [station0024.nameEnglishTextPrimitives addObject:drawTextLine0048];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 1435;
    [edge0002.elements addObject:haul0024];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(2709, 724);
    drawLine0018.endPoint = CGPointMake(2768, 633.5);
    drawLine0018.width = 22;
    drawLine0018.color = line0001.color;
    [haul0024.drawPrimitives addObject:drawLine0018];

    // Добавляем станцию Danshuichi
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0002.elements addObject:station0025];
    
    station0025.nameOriginal = @"丹水池";
    station0025.nameEnglish = @"Danshuichi";
    station0025.mapLocation = CGPointMake(2768, 633.5);
    station0025.geoLocation = CGPointMake(30.658245, 114.329069);

    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = station0025.mapLocation;
    fillCircle0049.radius = 20;
    fillCircle0049.fillColor = [UIColor blackColor];
    [station0025.drawPrimitives addObject:fillCircle0049];
    
    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = station0025.mapLocation;
    fillCircle0050.radius = 14;
    fillCircle0050.fillColor = [UIColor whiteColor];
    [station0025.drawPrimitives addObject:fillCircle0050];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0025.nameOriginal;
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 40;
    drawTextLine0049.origin = CGPointMake(2603, 609);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0049];
    
    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = station0025.nameEnglish;
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0050.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0050.fontSize = 24;
    drawTextLine0050.origin = CGPointMake(2581, 656);
    [station0025.nameEnglishTextPrimitives addObject:drawTextLine0050];
	
    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 1167;
    [edge0002.elements addObject:haul0025];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(2767.5, 634);
    drawLine0019.endPoint = CGPointMake(2828.5, 543.5);
    drawLine0019.width = 22;
    drawLine0019.color = line0001.color;
    [haul0025.drawPrimitives addObject:drawLine0019];

    // Добавляем станцию Xinrong
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0002.elements addObject:station0026];
    
    station0026.nameOriginal = @"新荣";
    station0026.nameEnglish = @"Xinrong";
    station0026.mapLocation = CGPointMake(2826.5, 543.5);
    station0026.geoLocation = CGPointMake(30.668255, 114.332789);

    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = station0026.mapLocation;
    fillCircle0051.radius = 20;
    fillCircle0051.fillColor = [UIColor blackColor];
    [station0026.drawPrimitives addObject:fillCircle0051];
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = station0026.mapLocation;
    fillCircle0052.radius = 14;
    fillCircle0052.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0052];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = station0026.nameOriginal;
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 40;
    drawTextLine0051.origin = CGPointMake(2701, 519);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0051];
    
    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0026.nameEnglish;
    drawTextLine0052.fontName = @"HelveticaNeue";
    drawTextLine0052.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0052.fontSize = 24;
    drawTextLine0052.origin = CGPointMake(2676, 566);
    [station0026.nameEnglishTextPrimitives addObject:drawTextLine0052];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 1003;
    [edge0002.elements addObject:haul0026];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(2828, 544);
    drawLine0020.endPoint = CGPointMake(2885, 453.5);
    drawLine0020.width = 22;
    drawLine0020.color = line0001.color;
    [haul0026.drawPrimitives addObject:drawLine0020];

    // Добавляем станцию Dijiao
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0002.elements addObject:station0027];
    
    station0027.nameOriginal = @"堤角";
    station0027.nameEnglish = @"Dijiao";
    station0027.mapLocation = CGPointMake(2885, 453.5);
    station0027.geoLocation = CGPointMake(30.676843, 114.336033);
    
    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = station0027.mapLocation;
    fillCircle0053.radius = 20;
    fillCircle0053.fillColor = [UIColor blackColor];
    [station0027.drawPrimitives addObject:fillCircle0053];
    
    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = station0027.mapLocation;
    fillCircle0054.radius = 14;
    fillCircle0054.fillColor = [UIColor whiteColor];
    [station0027.drawPrimitives addObject:fillCircle0054];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = station0027.nameOriginal;
    drawTextLine0053.fontName = @"HelveticaNeue";
    drawTextLine0053.fontColor = [UIColor blackColor];
    drawTextLine0053.fontSize = 40;
    drawTextLine0053.origin = CGPointMake(2763, 430);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0053];
    
    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = station0027.nameEnglish;
    drawTextLine0054.fontName = @"HelveticaNeue";
    drawTextLine0054.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0054.fontSize = 24;
    drawTextLine0054.origin = CGPointMake(2759, 477);
    [station0027.nameEnglishTextPrimitives addObject:drawTextLine0054];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 1120;
    [edge0002.elements addObject:haul0027];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(2884.5, 454);
    drawLine0021.endPoint = CGPointMake(2943.5, 363.5);
    drawLine0021.width = 22;
    drawLine0021.color = line0001.color;
    [haul0027.drawPrimitives addObject:drawLine0021];

    // Добавляем станцию Tengzigang
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0002.elements addObject:station0028];
    
    station0028.nameOriginal = @"滕子岗";
    station0028.nameEnglish = @"Tengzigang";
    station0028.mapLocation = CGPointMake(2943.5, 363.5);
    station0028.geoLocation = CGPointMake(30.686876, 114.336927);

    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = station0028.mapLocation;
    fillCircle0055.radius = 20;
    fillCircle0055.fillColor = [UIColor blackColor];
    [station0028.drawPrimitives addObject:fillCircle0055];
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = station0028.mapLocation;
    fillCircle0056.radius = 14;
    fillCircle0056.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0056];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = station0028.nameOriginal;
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 40;
    drawTextLine0055.origin = CGPointMake(2783, 338);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0055];
    
    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = station0028.nameEnglish;
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0056.fontSize = 24;
    drawTextLine0056.origin = CGPointMake(2759, 385);
    [station0028.nameEnglishTextPrimitives addObject:drawTextLine0056];

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 3397;
    [edge0002.elements addObject:haul0028];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(2943, 364);
    drawLine0022.endPoint = CGPointMake(3002, 273.5);
    drawLine0022.width = 22;
    drawLine0022.color = line0001.color;
    [haul0028.drawPrimitives addObject:drawLine0022];

    // Добавляем станцию Shekouxincheng
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0002.elements addObject:station0029];
    
    station0029.nameOriginal = @"滠口新城";
    station0029.nameEnglish = @"Shekouxincheng";
    station0029.mapLocation = CGPointMake(3002, 273.5);
    station0029.geoLocation = CGPointMake(30.714303, 114.324052);

    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = station0029.mapLocation;
    fillCircle0057.radius = 20;
    fillCircle0057.fillColor = [UIColor blackColor];
    [station0029.drawPrimitives addObject:fillCircle0057];
    
    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = station0029.mapLocation;
    fillCircle0058.radius = 14;
    fillCircle0058.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0058];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = station0029.nameOriginal;
    drawTextLine0057.fontName = @"HelveticaNeue";
    drawTextLine0057.fontColor = [UIColor blackColor];
    drawTextLine0057.fontSize = 40;
    drawTextLine0057.origin = CGPointMake(2800, 248);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0057];
    
    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = station0029.nameEnglish;
    drawTextLine0058.fontName = @"HelveticaNeue";
    drawTextLine0058.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0058.fontSize = 24;
    drawTextLine0058.origin = CGPointMake(2760, 295);
    [station0029.nameEnglishTextPrimitives addObject:drawTextLine0058];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 1236;
    [edge0002.elements addObject:haul0029];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(3001.5, 274);
    drawLine0023.endPoint = CGPointMake(3062, 181.5);
    drawLine0023.width = 22;
    drawLine0023.color = line0001.color;
    [haul0029.drawPrimitives addObject:drawLine0023];

    // Добавляем станцию Hankou North Station
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0002.elements addObject:station0030];
    
    station0030.nameOriginal = @"汉口北";
    station0030.nameEnglish = @"Hankou North Station";
    station0030.mapLocation = CGPointMake(3062, 181.5);
    station0030.geoLocation = CGPointMake(30.720354, 114.324119);

    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = station0030.mapLocation;
    fillCircle0059.radius = 20;
    fillCircle0059.fillColor = [UIColor blackColor];
    [station0030.drawPrimitives addObject:fillCircle0059];
    
    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = station0030.mapLocation;
    fillCircle0060.radius = 14;
    fillCircle0060.fillColor = [UIColor whiteColor];
    [station0030.drawPrimitives addObject:fillCircle0060];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = station0030.nameOriginal;
    drawTextLine0059.fontName = @"HelveticaNeue";
    drawTextLine0059.fontColor = [UIColor blackColor];
    drawTextLine0059.fontSize = 40;
    drawTextLine0059.origin = CGPointMake(2900, 158);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0059];
    
    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = station0030.nameEnglish;
    drawTextLine0060.fontName = @"HelveticaNeue";
    drawTextLine0060.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0060.fontSize = 24;
    drawTextLine0060.origin = CGPointMake(2770, 205);
    [station0030.nameEnglishTextPrimitives addObject:drawTextLine0060];

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;
    
    ////////////////////////////////////////////////////////////////
    // 2. Line 2
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Jinyintan - Xunlimen
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Jinyintan - Xunlimen";
    [self.edges addObject:(edge0003)];
    
    // Добавляем линию
    edge0003.line = line0002;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0004;

    // Добавляем станцию Jinyintan
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0003.elements addObject:station0031];
    
    station0031.nameOriginal = @"金银潭";
    station0031.nameEnglish = @"Jinyintan";
    station0031.mapLocation = CGPointMake(1722.5, 586.5);
    station0031.geoLocation = CGPointMake(30.650526, 114.238649); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = station0031.mapLocation;
    fillCircle0061.radius = 20;
    fillCircle0061.fillColor = [UIColor blackColor];
    [station0031.drawPrimitives addObject:fillCircle0061];
    
    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = station0031.mapLocation;
    fillCircle0062.radius = 14;
    fillCircle0062.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0062];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = station0031.nameOriginal;
    drawTextLine0061.fontName = @"HelveticaNeue";
    drawTextLine0061.fontColor = [UIColor blackColor];
    drawTextLine0061.fontSize = 40;
    drawTextLine0061.origin = CGPointMake(1565, 566);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0061];
    
    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = station0031.nameEnglish;
    drawTextLine0062.fontName = @"HelveticaNeue";
    drawTextLine0062.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0062.fontSize = 24;
    drawTextLine0062.origin = CGPointMake(1605, 613);
    [station0031.nameEnglishTextPrimitives addObject:drawTextLine0062];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 927; // Длина вычислена с помощью функции correctZeroDistances
    [edge0003.elements addObject:haul0030];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(1722.5, 586.5);
    drawLine0024.endPoint = CGPointMake(1770.5, 724.5);
    drawLine0024.width = 22;
    drawLine0024.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Changqing Huayuan
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0003.elements addObject:station0032];
    
    station0032.nameOriginal = @"常青花园";
    station0032.nameEnglish = @"Changqing Huayuan";
    station0032.mapLocation = CGPointMake(1770.5, 724.5);
    station0032.geoLocation = CGPointMake(30.642389, 114.236551); // // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = station0032.mapLocation;
    fillCircle0063.radius = 20;
    fillCircle0063.fillColor = [UIColor blackColor];
    [station0032.drawPrimitives addObject:fillCircle0063];
    
    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = station0032.mapLocation;
    fillCircle0064.radius = 14;
    fillCircle0064.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0064];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = station0032.nameOriginal;
    drawTextLine0063.fontName = @"HelveticaNeue";
    drawTextLine0063.fontColor = [UIColor blackColor];
    drawTextLine0063.fontSize = 40;
    drawTextLine0063.origin = CGPointMake(1573, 700);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0063];
    
    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = station0032.nameEnglish;
    drawTextLine0064.fontName = @"HelveticaNeue";
    drawTextLine0064.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0064.fontSize = 24;
    drawTextLine0064.origin = CGPointMake(1530, 747);
    [station0032.nameEnglishTextPrimitives addObject:drawTextLine0064];

    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 1873; // Длина вычислена с помощью функции correctZeroDistances
    [edge0003.elements addObject:haul0031];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(1770.5, 725);
    drawLine0025.endPoint = CGPointMake(1814, 838.5);
    drawLine0025.width = 22;
    drawLine0025.color = line0002.color;
    [haul0031.drawPrimitives addObject:drawLine0025];

    // Добавляем станцию Changgang Rd
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0003.elements addObject:station0033];
    
    station0033.nameOriginal = @"长港路";
    station0033.nameEnglish = @"Changgang Rd";
    station0033.mapLocation = CGPointMake(1814, 838.5);
    station0033.geoLocation = CGPointMake(30.626178, 114.241859); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = station0033.mapLocation;
    fillCircle0065.radius = 20;
    fillCircle0065.fillColor = [UIColor blackColor];
    [station0033.drawPrimitives addObject:fillCircle0065];
    
    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = station0033.mapLocation;
    fillCircle0066.radius = 14;
    fillCircle0066.fillColor = [UIColor whiteColor];
    [station0033.drawPrimitives addObject:fillCircle0066];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = station0033.nameOriginal;
    drawTextLine0065.fontName = @"HelveticaNeue";
    drawTextLine0065.fontColor = [UIColor blackColor];
    drawTextLine0065.fontSize = 40;
    drawTextLine0065.origin = CGPointMake(1663, 812);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0065];
    
    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = station0033.nameEnglish;
    drawTextLine0066.fontName = @"HelveticaNeue";
    drawTextLine0066.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0066.fontSize = 24;
    drawTextLine0066.origin = CGPointMake(1629, 859);
    [station0033.nameEnglishTextPrimitives addObject:drawTextLine0066];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 888; // Длина вычислена с помощью функции correctZeroDistances
    [edge0003.elements addObject:haul0032];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(1814, 838);
    drawLine0026.endPoint = CGPointMake(1856, 964.5);
    drawLine0026.width = 22;
    drawLine0026.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0026];

    // Добавляем станцию Hankou Railway Station
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0003.elements addObject:station0034];
    
    station0034.nameOriginal = @"汉口火车站";
    station0034.nameEnglish = @"Hankou Railway Station";
    station0034.mapLocation = CGPointMake(1856, 964.5);
    station0034.geoLocation = CGPointMake(30.621653, 114.249515); // // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = station0034.mapLocation;
    fillCircle0067.radius = 20;
    fillCircle0067.fillColor = [UIColor blackColor];
    [station0034.drawPrimitives addObject:fillCircle0067];
    
    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = station0034.mapLocation;
    fillCircle0068.radius = 14;
    fillCircle0068.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0068];

    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = station0034.nameOriginal;
    drawTextLine0067.fontName = @"HelveticaNeue";
    drawTextLine0067.fontColor = [UIColor blackColor];
    drawTextLine0067.fontSize = 40;
    drawTextLine0067.origin = CGPointMake(1625, 938);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0067];
    
    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = station0034.nameEnglish;
    drawTextLine0068.fontName = @"HelveticaNeue";
    drawTextLine0068.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0068.fontSize = 24;
    drawTextLine0068.origin = CGPointMake(1580, 985);
    [station0034.nameEnglishTextPrimitives addObject:drawTextLine0068];

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 1350; // Длина вычислена с помощью функции correctZeroDistances
    [edge0003.elements addObject:haul0033];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(1856, 964);
    drawLine0027.endPoint = CGPointMake(1901, 1093);
    drawLine0027.width = 22;
    drawLine0027.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0027];

    // Добавляем станцию Fanhu
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0003.elements addObject:station0035];
    
    station0035.nameOriginal = @"范湖";
    station0035.nameEnglish = @"Fanhu";
    station0035.mapLocation = CGPointMake(1901, 1093);
    station0035.geoLocation = CGPointMake(30.610094, 114.253829); // // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = station0035.mapLocation;
    fillCircle0069.radius = 20;
    fillCircle0069.fillColor = [UIColor blackColor];
    [station0035.drawPrimitives addObject:fillCircle0069];
    
    MWDrawFillCircle *fillCircle0070 = [[MWDrawFillCircle alloc] init];
    fillCircle0070.center = station0035.mapLocation;
    fillCircle0070.radius = 14;
    fillCircle0070.fillColor = [UIColor whiteColor];
    [station0035.drawPrimitives addObject:fillCircle0070];

    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = station0035.nameOriginal;
    drawTextLine0069.fontName = @"HelveticaNeue";
    drawTextLine0069.fontColor = [UIColor blackColor];
    drawTextLine0069.fontSize = 40;
    drawTextLine0069.origin = CGPointMake(1787, 1068);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0069];
    
    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = station0035.nameEnglish;
    drawTextLine0070.fontName = @"HelveticaNeue";
    drawTextLine0070.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0070.fontSize = 24;
    drawTextLine0070.origin = CGPointMake(1811, 1113);
    [station0035.nameEnglishTextPrimitives addObject:drawTextLine0070];

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 1565; // Длина вычислена с помощью функции correctZeroDistances
    [edge0003.elements addObject:haul0034];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(1901, 1092.5);
    drawLine0028.endPoint = CGPointMake(1949, 1224);
    drawLine0028.width = 22;
    drawLine0028.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0028];

    // Добавляем станцию Wangjiadun East
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0003.elements addObject:station0036];
    
    station0036.nameOriginal = @"王家墩东";
    station0036.nameEnglish = @"Wangjiadun East";
    station0036.mapLocation = CGPointMake(1949, 1224);
    station0036.geoLocation = CGPointMake(30.596473, 114.257956); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0071 = [[MWDrawFillCircle alloc] init];
    fillCircle0071.center = station0036.mapLocation;
    fillCircle0071.radius = 20;
    fillCircle0071.fillColor = [UIColor blackColor];
    [station0036.drawPrimitives addObject:fillCircle0071];
    
    MWDrawFillCircle *fillCircle0072 = [[MWDrawFillCircle alloc] init];
    fillCircle0072.center = station0036.mapLocation;
    fillCircle0072.radius = 14;
    fillCircle0072.fillColor = [UIColor whiteColor];
    [station0036.drawPrimitives addObject:fillCircle0072];

    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = station0036.nameOriginal;
    drawTextLine0071.fontName = @"HelveticaNeue";
    drawTextLine0071.fontColor = [UIColor blackColor];
    drawTextLine0071.fontSize = 40;
    drawTextLine0071.origin = CGPointMake(1757, 1199);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0071];
    
    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = station0036.nameEnglish;
    drawTextLine0072.fontName = @"HelveticaNeue";
    drawTextLine0072.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0072.fontSize = 24;
    drawTextLine0072.origin = CGPointMake(1748, 1244);
    [station0036.nameEnglishTextPrimitives addObject:drawTextLine0072];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 1116; // Длина вычислена с помощью функции correctZeroDistances
    [edge0003.elements addObject:haul0035];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(1949, 1223.5);
    drawLine0029.endPoint = CGPointMake(1991, 1341);
    drawLine0029.width = 22;
    drawLine0029.color = line0002.color;
    [haul0035.drawPrimitives addObject:drawLine0029];

    // Добавляем станцию Qingnian Rd
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0003.elements addObject:station0037];
    
    station0037.nameOriginal = @"青年路";
    station0037.nameEnglish = @"Qingnian Rd";
    station0037.mapLocation = CGPointMake(1991, 1341);
    station0037.geoLocation = CGPointMake(30.586562, 114.259811); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0073 = [[MWDrawFillCircle alloc] init];
    fillCircle0073.center = station0037.mapLocation;
    fillCircle0073.radius = 20;
    fillCircle0073.fillColor = [UIColor blackColor];
    [station0037.drawPrimitives addObject:fillCircle0073];
    
    MWDrawFillCircle *fillCircle0074 = [[MWDrawFillCircle alloc] init];
    fillCircle0074.center = station0037.mapLocation;
    fillCircle0074.radius = 14;
    fillCircle0074.fillColor = [UIColor whiteColor];
    [station0037.drawPrimitives addObject:fillCircle0074];

    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = station0037.nameOriginal;
    drawTextLine0073.fontName = @"HelveticaNeue";
    drawTextLine0073.fontColor = [UIColor blackColor];
    drawTextLine0073.fontSize = 40;
    drawTextLine0073.origin = CGPointMake(1833, 1315);
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0073];
    
    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = station0037.nameEnglish;
    drawTextLine0074.fontName = @"HelveticaNeue";
    drawTextLine0074.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0074.fontSize = 24;
    drawTextLine0074.origin = CGPointMake(1829, 1360);
    [station0037.nameEnglishTextPrimitives addObject:drawTextLine0074];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 771; // Длина вычислена с помощью функции correctZeroDistances
    [edge0003.elements addObject:haul0036];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(1991, 1340.5);
    drawLine0030.endPoint = CGPointMake(2006, 1371);
    drawLine0030.width = 22;
    drawLine0030.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0030];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(2060, 1345);
    drawArc0008.startRadians = 52 * M_PI / 180;
    drawArc0008.endRadians = 155 * M_PI / 180;
    drawArc0008.radius = 60;
    drawArc0008.width = 22;
    drawArc0008.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(2096.5, 1393);
    drawLine0031.endPoint = CGPointMake(2153, 1347);
    drawLine0031.width = 22;
    drawLine0031.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0031];

    // Добавляем станцию Zhongshan Park
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0003.elements addObject:station0038];
    
    station0038.nameOriginal = @"中山公园";
    station0038.nameEnglish = @"Zhongshan Park";
    station0038.mapLocation = CGPointMake(2153, 1347);
    station0038.geoLocation = CGPointMake(30.584414, 114.267468); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0075 = [[MWDrawFillCircle alloc] init];
    fillCircle0075.center = station0038.mapLocation;
    fillCircle0075.radius = 20;
    fillCircle0075.fillColor = [UIColor blackColor];
    [station0038.drawPrimitives addObject:fillCircle0075];
    
    MWDrawFillCircle *fillCircle0076 = [[MWDrawFillCircle alloc] init];
    fillCircle0076.center = station0038.mapLocation;
    fillCircle0076.radius = 14;
    fillCircle0076.fillColor = [UIColor whiteColor];
    [station0038.drawPrimitives addObject:fillCircle0076];

    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = station0038.nameOriginal;
    drawTextLine0075.fontName = @"HelveticaNeue";
    drawTextLine0075.fontColor = [UIColor blackColor];
    drawTextLine0075.fontSize = 40;
    drawTextLine0075.origin = CGPointMake(2003, 1267);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0075];
    
    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0038.nameEnglish;
    drawTextLine0076.fontName = @"HelveticaNeue";
    drawTextLine0076.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0076.fontSize = 24;
    drawTextLine0076.origin = CGPointMake(2003, 1238);
    [station0038.nameEnglishTextPrimitives addObject:drawTextLine0076];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 2425; // Длина вычислена с помощью функции correctZeroDistances
    [edge0003.elements addObject:haul0037];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(2152.5, 1347.5);
    drawLine0032.endPoint = CGPointMake(2225, 1290.5);
    drawLine0032.width = 22;
    drawLine0032.color = line0002.color;
    [haul0037.drawPrimitives addObject:drawLine0032];
    
    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(2281, 1361);
    drawArc0009.startRadians = 231 * M_PI / 180;
    drawArc0009.endRadians = 315 * M_PI / 180;
    drawArc0009.radius = 90;
    drawArc0009.width = 22;
    drawArc0009.color = line0002.color;
    [haul0037.drawPrimitives addObject:drawArc0009];

    // Добавляем станцию Xunlimen
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0003.elements addObject:station0039];
    
    station0039.nameOriginal = @"循礼门";
    station0039.nameEnglish = @"Xunlimen";
    station0039.mapLocation = CGPointMake(2340.5, 1294.5);
    station0039.geoLocation = CGPointMake(30.595003, 114.289620);
    
    station0039.showNameOnMap = false;
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0035];
    [station0039.nameEnglishTextPrimitives addObject:drawTextLine0036];

    // Добавляем вершину
    edge0003.finishVertex = vertex0002;

    // Создаем участок линии Xunlimen - Hongshan Square
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Xunlimen - Hongshan Square";
    [self.edges addObject:(edge0004)];
    
    // Добавляем линию
    edge0004.line = line0002;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0002;

    // Добавляем станцию Xunlimen
    [edge0004.elements addObject:station0039];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 740; // Длина вычислена с помощью функции correctZeroDistances
    [edge0004.elements addObject:haul0038];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(2340, 1294);
    drawLine0033.endPoint = CGPointMake(2489, 1391);
    drawLine0033.width = 22;
    drawLine0033.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawLine0033];

    // Добавляем станцию Jianghan Rd
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0004.elements addObject:station0040];
    
    station0040.nameOriginal = @"江汉路";
    station0040.nameEnglish = @"Jianghan Rd";
    station0040.mapLocation = CGPointMake(2489, 1391);
    station0040.geoLocation = CGPointMake(30.588348, 114.289596); // Примерно! Точное месторасположение станции неизвестно
   
    MWDrawFillCircle *fillCircle0077 = [[MWDrawFillCircle alloc] init];
    fillCircle0077.center = station0040.mapLocation;
    fillCircle0077.radius = 20;
    fillCircle0077.fillColor = [UIColor blackColor];
    [station0040.drawPrimitives addObject:fillCircle0077];
    
    MWDrawFillCircle *fillCircle0078 = [[MWDrawFillCircle alloc] init];
    fillCircle0078.center = station0040.mapLocation;
    fillCircle0078.radius = 14;
    fillCircle0078.fillColor = [UIColor whiteColor];
    [station0040.drawPrimitives addObject:fillCircle0078];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = station0040.nameOriginal;
    drawTextLine0077.fontName = @"HelveticaNeue";
    drawTextLine0077.fontColor = [UIColor blackColor];
    drawTextLine0077.fontSize = 40;
    drawTextLine0077.origin = CGPointMake(2516, 1325);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0077];
    
    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = station0040.nameEnglish;
    drawTextLine0078.fontName = @"HelveticaNeue";
    drawTextLine0078.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0078.fontSize = 24;
    drawTextLine0078.origin = CGPointMake(2543, 1372);
    [station0040.nameEnglishTextPrimitives addObject:drawTextLine0078];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 3090; // Длина вычислена с помощью функции correctZeroDistances
    [edge0004.elements addObject:haul0039];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(2489, 1391);
    drawLine0034.endPoint = CGPointMake(2809, 1613);
    drawLine0034.width = 22;
    drawLine0034.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawLine0034];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(2774, 1662);
    drawArc0010.startRadians = 305 * M_PI / 180;
    drawArc0010.endRadians = 38 * M_PI / 180;
    drawArc0010.radius = 60;
    drawArc0010.width = 22;
    drawArc0010.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawArc0010];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(2822, 1698);
    drawLine0035.endPoint = CGPointMake(2764.5, 1773.5);
    drawLine0035.width = 22;
    drawLine0035.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawLine0035];

    // Добавляем станцию Jiyuqiao
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0004.elements addObject:station0041];
    
    station0041.nameOriginal = @"积玉桥";
    station0041.nameEnglish = @"Jiyuqiao";
    station0041.mapLocation = CGPointMake(2764.5, 1773.5);
    station0041.geoLocation = CGPointMake(30.563114, 114.303101); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0079 = [[MWDrawFillCircle alloc] init];
    fillCircle0079.center = station0041.mapLocation;
    fillCircle0079.radius = 20;
    fillCircle0079.fillColor = [UIColor blackColor];
    [station0041.drawPrimitives addObject:fillCircle0079];
    
    MWDrawFillCircle *fillCircle0080 = [[MWDrawFillCircle alloc] init];
    fillCircle0080.center = station0041.mapLocation;
    fillCircle0080.radius = 14;
    fillCircle0080.fillColor = [UIColor whiteColor];
    [station0041.drawPrimitives addObject:fillCircle0080];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = station0041.nameOriginal;
    drawTextLine0079.fontName = @"HelveticaNeue";
    drawTextLine0079.fontColor = [UIColor blackColor];
    drawTextLine0079.fontSize = 40;
    drawTextLine0079.origin = CGPointMake(2806, 1747);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0079];
    
    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = station0041.nameEnglish;
    drawTextLine0080.fontName = @"HelveticaNeue";
    drawTextLine0080.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0080.fontSize = 24;
    drawTextLine0080.origin = CGPointMake(2793, 1794);
    [station0041.nameEnglishTextPrimitives addObject:drawTextLine0080];
    
    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 1200; // Длина вычислена с помощью функции correctZeroDistances
    [edge0004.elements addObject:haul0040];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(2765, 1773);
    drawLine0036.endPoint = CGPointMake(2684, 1853.5);
    drawLine0036.width = 22;
    drawLine0036.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawLine0036];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(2706, 1874);
    drawArc0011.startRadians = 100 * M_PI / 180;
    drawArc0011.endRadians = 225 * M_PI / 180;
    drawArc0011.radius = 30;
    drawArc0011.width = 22;
    drawArc0011.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(2700, 1903.5);
    drawLine0037.endPoint = CGPointMake(2780.5, 1917.5);
    drawLine0037.width = 22;
    drawLine0037.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawLine0037];

    // Добавляем станцию Pangxiejia
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0004.elements addObject:station0042];
    
    station0042.nameOriginal = @"螃蟹岬";
    station0042.nameEnglish = @"Pangxiejia";
    station0042.mapLocation = CGPointMake(2780.5, 1917.5);
    station0042.geoLocation = CGPointMake(30.555606, 114.312108); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0081 = [[MWDrawFillCircle alloc] init];
    fillCircle0081.center = station0042.mapLocation;
    fillCircle0081.radius = 20;
    fillCircle0081.fillColor = [UIColor blackColor];
    [station0042.drawPrimitives addObject:fillCircle0081];
    
    MWDrawFillCircle *fillCircle0082 = [[MWDrawFillCircle alloc] init];
    fillCircle0082.center = station0042.mapLocation;
    fillCircle0082.radius = 14;
    fillCircle0082.fillColor = [UIColor whiteColor];
    [station0042.drawPrimitives addObject:fillCircle0082];

    MWDrawTextLine *drawTextLine0081 = [[MWDrawTextLine alloc] init];
    drawTextLine0081.text = station0042.nameOriginal;
    drawTextLine0081.fontName = @"HelveticaNeue";
    drawTextLine0081.fontColor = [UIColor blackColor];
    drawTextLine0081.fontSize = 40;
    drawTextLine0081.origin = CGPointMake(2720, 1945);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0081];
    
    MWDrawTextLine *drawTextLine0082 = [[MWDrawTextLine alloc] init];
    drawTextLine0082.text = station0042.nameEnglish;
    drawTextLine0082.fontName = @"HelveticaNeue";
    drawTextLine0082.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0082.fontSize = 24;
    drawTextLine0082.origin = CGPointMake(2726, 1992);
    [station0042.nameEnglishTextPrimitives addObject:drawTextLine0082];

    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 844; // Длина вычислена с помощью функции correctZeroDistances
    [edge0004.elements addObject:haul0041];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(2780, 1917.5);
    drawLine0038.endPoint = CGPointMake(2961, 1915);
    drawLine0038.width = 22;
    drawLine0038.color = line0002.color;
    [haul0041.drawPrimitives addObject:drawLine0038];

    // Добавляем станцию Xiaoguishan
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0004.elements addObject:station0043];
    
    station0043.nameOriginal = @"小龟山";
    station0043.nameEnglish = @"Xiaoguishan";
    station0043.mapLocation = CGPointMake(2961, 1915);
    station0043.geoLocation = CGPointMake(30.555630, 114.320920); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0083 = [[MWDrawFillCircle alloc] init];
    fillCircle0083.center = station0043.mapLocation;
    fillCircle0083.radius = 20;
    fillCircle0083.fillColor = [UIColor blackColor];
    [station0043.drawPrimitives addObject:fillCircle0083];
    
    MWDrawFillCircle *fillCircle0084 = [[MWDrawFillCircle alloc] init];
    fillCircle0084.center = station0043.mapLocation;
    fillCircle0084.radius = 14;
    fillCircle0084.fillColor = [UIColor whiteColor];
    [station0043.drawPrimitives addObject:fillCircle0084];

    MWDrawTextLine *drawTextLine0083 = [[MWDrawTextLine alloc] init];
    drawTextLine0083.text = station0043.nameOriginal;
    drawTextLine0083.fontName = @"HelveticaNeue";
    drawTextLine0083.fontColor = [UIColor blackColor];
    drawTextLine0083.fontSize = 40;
    drawTextLine0083.origin = CGPointMake(2900, 1945);
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0083];
    
    MWDrawTextLine *drawTextLine0084 = [[MWDrawTextLine alloc] init];
    drawTextLine0084.text = station0043.nameEnglish;
    drawTextLine0084.fontName = @"HelveticaNeue";
    drawTextLine0084.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0084.fontSize = 24;
    drawTextLine0084.origin = CGPointMake(2894, 1992);
    [station0043.nameEnglishTextPrimitives addObject:drawTextLine0084];
    
    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 1355; // Длина вычислена с помощью функции correctZeroDistances
    [edge0004.elements addObject:haul0042];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(2961, 1914.5);
    drawLine0039.endPoint = CGPointMake(3196, 1913);
    drawLine0039.width = 22;
    drawLine0039.color = line0002.color;
    [haul0042.drawPrimitives addObject:drawLine0039];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(3196, 1928);
    drawArc0012.startRadians = 268 * M_PI / 180;
    drawArc0012.endRadians = 20 * M_PI / 180;
    drawArc0012.radius = 15;
    drawArc0012.width = 22;
    drawArc0012.color = line0002.color;
    [haul0042.drawPrimitives addObject:drawArc0012];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(3210.5, 1932.5);
    drawLine0040.endPoint = CGPointMake(3207, 1942);
    drawLine0040.width = 22;
    drawLine0040.color = line0002.color;
    [haul0042.drawPrimitives addObject:drawLine0040];

    // Добавляем станцию Hongshan Square
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0004.elements addObject:station0044];
    
    station0044.nameOriginal = @"洪山广场";
    station0044.nameEnglish = @"Hongshan Square";
    station0044.mapLocation = CGPointMake(3212, 1942);
    station0044.geoLocation = CGPointMake(30.547475, 114.331441); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0085 = [[MWDrawFillCircle alloc] init];
    fillCircle0085.center = station0044.mapLocation;
    fillCircle0085.radius = 20;
    fillCircle0085.fillColor = [UIColor blackColor];
    [station0044.drawPrimitives addObject:fillCircle0085];
    
    MWDrawFillCircle *fillCircle0086 = [[MWDrawFillCircle alloc] init];
    fillCircle0086.center = station0044.mapLocation;
    fillCircle0086.radius = 14;
    fillCircle0086.fillColor = [UIColor whiteColor];
    [station0044.drawPrimitives addObject:fillCircle0086];

    MWDrawTextLine *drawTextLine0085 = [[MWDrawTextLine alloc] init];
    drawTextLine0085.text = station0044.nameOriginal;
    drawTextLine0085.fontName = @"HelveticaNeue";
    drawTextLine0085.fontColor = [UIColor blackColor];
    drawTextLine0085.fontSize = 40;
    drawTextLine0085.origin = CGPointMake(3255, 1918);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0085];
    
    MWDrawTextLine *drawTextLine0086 = [[MWDrawTextLine alloc] init];
    drawTextLine0086.text = station0044.nameEnglish;
    drawTextLine0086.fontName = @"HelveticaNeue";
    drawTextLine0086.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0086.fontSize = 24;
    drawTextLine0086.origin = CGPointMake(3229, 1965);
    [station0044.nameEnglishTextPrimitives addObject:drawTextLine0086];

    // Добавляем вершину
    edge0004.finishVertex = vertex0005;

    // Создаем участок линии Hongshan Square - Zhongnan Rd
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Hongshan Square - Zhongnan Rd";
    [self.edges addObject:(edge0005)];
    
    // Добавляем линию
    edge0005.line = line0002;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0005;
    
    // Добавляем станцию Hongshan Square
    [edge0005.elements addObject:station0044];

    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 869; // Длина вычислена с помощью функции correctZeroDistances
    [edge0005.elements addObject:haul0043];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(3207.5, 1941);
    drawLine0041.endPoint = CGPointMake(3161, 2054);
    drawLine0041.width = 22;
    drawLine0041.color = line0002.color;
    [haul0043.drawPrimitives addObject:drawLine0041];

    // Добавляем станцию Zhongnan Rd
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0005.elements addObject:station0045];
    
    station0045.nameOriginal = @"中南路";
    station0045.nameEnglish = @"Zhongnan Rd";
    station0045.mapLocation = CGPointMake(3152, 2052.5);
    station0045.geoLocation = CGPointMake(30.540333, 114.327761); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0087 = [[MWDrawFillCircle alloc] init];
    fillCircle0087.center = station0045.mapLocation;
    fillCircle0087.radius = 20;
    fillCircle0087.fillColor = [UIColor blackColor];
    [station0045.drawPrimitives addObject:fillCircle0087];
    
    MWDrawFillCircle *fillCircle0088 = [[MWDrawFillCircle alloc] init];
    fillCircle0088.center = station0045.mapLocation;
    fillCircle0088.radius = 14;
    fillCircle0088.fillColor = [UIColor whiteColor];
    [station0045.drawPrimitives addObject:fillCircle0088];

    MWDrawTextLine *drawTextLine0087 = [[MWDrawTextLine alloc] init];
    drawTextLine0087.text = station0045.nameOriginal;
    drawTextLine0087.fontName = @"HelveticaNeue";
    drawTextLine0087.fontColor = [UIColor blackColor];
    drawTextLine0087.fontSize = 40;
    drawTextLine0087.origin = CGPointMake(3192, 2029);
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0087];
    
    MWDrawTextLine *drawTextLine0088 = [[MWDrawTextLine alloc] init];
    drawTextLine0088.text = station0045.nameEnglish;
    drawTextLine0088.fontName = @"HelveticaNeue";
    drawTextLine0088.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0088.fontSize = 24;
    drawTextLine0088.origin = CGPointMake(3209, 2000);
    [station0045.nameEnglishTextPrimitives addObject:drawTextLine0088];

    // Добавляем вершину
    edge0005.finishVertex = vertex0006;

    // Создаем участок линии Zhongnan Rd - Optics Valley Square
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Zhongnan Rd - Optics Valley Square";
    [self.edges addObject:(edge0006)];
    
    // Добавляем линию
    edge0006.line = line0002;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0006;
    
    // Добавляем станцию Zhongnan Rd
    [edge0006.elements addObject:station0045];

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 1174; // Длина вычислена с помощью функции correctZeroDistances
    [edge0006.elements addObject:haul0044];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(3198, 2069);
    drawArc0013.startRadians = 106 * M_PI / 180;
    drawArc0013.endRadians = 203 * M_PI / 180;
    drawArc0013.radius = 40;
    drawArc0013.width = 22;
    drawArc0013.color = line0002.color;
    [haul0044.drawPrimitives addObject:drawArc0013];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(3186, 2107.5);
    drawLine0042.endPoint = CGPointMake(3322.5, 2144.5);
    drawLine0042.width = 22;
    drawLine0042.color = line0002.color;
    [haul0044.drawPrimitives addObject:drawLine0042];

    // Добавляем станцию Baotong Temple
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0006.elements addObject:station0046];
    
    station0046.nameOriginal = @"宝通寺";
    station0046.nameEnglish = @"Baotong Temple";
    station0046.mapLocation = CGPointMake(3322.5, 2144.5);
    station0046.geoLocation = CGPointMake(30.532525, 114.336016); // Примерно! Точное месторасположение станции неизвестно
    
    MWDrawFillCircle *fillCircle0089 = [[MWDrawFillCircle alloc] init];
    fillCircle0089.center = station0046.mapLocation;
    fillCircle0089.radius = 20;
    fillCircle0089.fillColor = [UIColor blackColor];
    [station0046.drawPrimitives addObject:fillCircle0089];
    
    MWDrawFillCircle *fillCircle0090 = [[MWDrawFillCircle alloc] init];
    fillCircle0090.center = station0046.mapLocation;
    fillCircle0090.radius = 14;
    fillCircle0090.fillColor = [UIColor whiteColor];
    [station0046.drawPrimitives addObject:fillCircle0090];

    MWDrawTextLine *drawTextLine0089 = [[MWDrawTextLine alloc] init];
    drawTextLine0089.text = station0046.nameOriginal;
    drawTextLine0089.fontName = @"HelveticaNeue";
    drawTextLine0089.fontColor = [UIColor blackColor];
    drawTextLine0089.fontSize = 40;
    drawTextLine0089.origin = CGPointMake(3260, 2169);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0089];
    
    MWDrawTextLine *drawTextLine0090 = [[MWDrawTextLine alloc] init];
    drawTextLine0090.text = station0046.nameEnglish;
    drawTextLine0090.fontName = @"HelveticaNeue";
    drawTextLine0090.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0090.fontSize = 24;
    drawTextLine0090.origin = CGPointMake(3229, 2216);
    [station0046.nameEnglishTextPrimitives addObject:drawTextLine0090];

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 1199; // Длина вычислена с помощью функции correctZeroDistances
    [edge0006.elements addObject:haul0045];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(3322, 2144.5);
    drawLine0043.endPoint = CGPointMake(3475, 2180.5);
    drawLine0043.width = 22;
    drawLine0043.color = line0002.color;
    [haul0045.drawPrimitives addObject:drawLine0043];

    // Добавляем станцию Jiedaokou
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0006.elements addObject:station0047];
    
    station0047.nameOriginal = @"街道口";
    station0047.nameEnglish = @"Jiedaokou";
    station0047.mapLocation = CGPointMake(3475, 2180.5);
    station0047.geoLocation = CGPointMake(30.528986, 114.347839); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0091 = [[MWDrawFillCircle alloc] init];
    fillCircle0091.center = station0047.mapLocation;
    fillCircle0091.radius = 20;
    fillCircle0091.fillColor = [UIColor blackColor];
    [station0047.drawPrimitives addObject:fillCircle0091];
    
    MWDrawFillCircle *fillCircle0092 = [[MWDrawFillCircle alloc] init];
    fillCircle0092.center = station0047.mapLocation;
    fillCircle0092.radius = 14;
    fillCircle0092.fillColor = [UIColor whiteColor];
    [station0047.drawPrimitives addObject:fillCircle0092];

    MWDrawTextLine *drawTextLine0091 = [[MWDrawTextLine alloc] init];
    drawTextLine0091.text = station0047.nameOriginal;
    drawTextLine0091.fontName = @"HelveticaNeue";
    drawTextLine0091.fontColor = [UIColor blackColor];
    drawTextLine0091.fontSize = 40;
    drawTextLine0091.origin = CGPointMake(3414, 2103);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0091];
    
    MWDrawTextLine *drawTextLine0092 = [[MWDrawTextLine alloc] init];
    drawTextLine0092.text = station0047.nameEnglish;
    drawTextLine0092.fontName = @"HelveticaNeue";
    drawTextLine0092.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0092.fontSize = 24;
    drawTextLine0092.origin = CGPointMake(3418, 2074);
    [station0047.nameEnglishTextPrimitives addObject:drawTextLine0092];

    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 986; // Длина вычислена с помощью функции correctZeroDistances
    [edge0006.elements addObject:haul0046];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(3474.5, 2180.5);
    drawLine0044.endPoint = CGPointMake(3619.5, 2214.5);
    drawLine0044.width = 22;
    drawLine0044.color = line0002.color;
    [haul0046.drawPrimitives addObject:drawLine0044];

    // Добавляем станцию Guangbutun
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0006.elements addObject:station0048];
    
    station0048.nameOriginal = @"广埠屯";
    station0048.nameEnglish = @"Guangbutun";
    station0048.mapLocation = CGPointMake(3619.5, 2214.5);
    station0048.geoLocation = CGPointMake(30.525695, 114.357406); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0093 = [[MWDrawFillCircle alloc] init];
    fillCircle0093.center = station0048.mapLocation;
    fillCircle0093.radius = 20;
    fillCircle0093.fillColor = [UIColor blackColor];
    [station0048.drawPrimitives addObject:fillCircle0093];
    
    MWDrawFillCircle *fillCircle0094 = [[MWDrawFillCircle alloc] init];
    fillCircle0094.center = station0048.mapLocation;
    fillCircle0094.radius = 14;
    fillCircle0094.fillColor = [UIColor whiteColor];
    [station0048.drawPrimitives addObject:fillCircle0094];

    MWDrawTextLine *drawTextLine0093 = [[MWDrawTextLine alloc] init];
    drawTextLine0093.text = station0048.nameOriginal;
    drawTextLine0093.fontName = @"HelveticaNeue";
    drawTextLine0093.fontColor = [UIColor blackColor];
    drawTextLine0093.fontSize = 40;
    drawTextLine0093.origin = CGPointMake(3558, 2245);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0093];
    
    MWDrawTextLine *drawTextLine0094 = [[MWDrawTextLine alloc] init];
    drawTextLine0094.text = station0048.nameEnglish;
    drawTextLine0094.fontName = @"HelveticaNeue";
    drawTextLine0094.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0094.fontSize = 24;
    drawTextLine0094.origin = CGPointMake(3550, 2292);
    [station0048.nameEnglishTextPrimitives addObject:drawTextLine0094];

    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 1043; // Длина вычислена с помощью функции correctZeroDistances
    [edge0006.elements addObject:haul0047];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(3619, 2214.5);
    drawLine0045.endPoint = CGPointMake(3768, 2255);
    drawLine0045.width = 22;
    drawLine0045.color = line0002.color;
    [haul0047.drawPrimitives addObject:drawLine0045];

    // Добавляем станцию Huquan
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0006.elements addObject:station0049];
    
    station0049.nameOriginal = @"虎泉";
    station0049.nameEnglish = @"Huquan";
    station0049.mapLocation = CGPointMake(3768, 2255);
    station0049.geoLocation = CGPointMake(30.517390, 114.362481); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0095 = [[MWDrawFillCircle alloc] init];
    fillCircle0095.center = station0049.mapLocation;
    fillCircle0095.radius = 20;
    fillCircle0095.fillColor = [UIColor blackColor];
    [station0049.drawPrimitives addObject:fillCircle0095];
    
    MWDrawFillCircle *fillCircle0096 = [[MWDrawFillCircle alloc] init];
    fillCircle0096.center = station0049.mapLocation;
    fillCircle0096.radius = 14;
    fillCircle0096.fillColor = [UIColor whiteColor];
    [station0049.drawPrimitives addObject:fillCircle0096];

    MWDrawTextLine *drawTextLine0095 = [[MWDrawTextLine alloc] init];
    drawTextLine0095.text = station0049.nameOriginal;
    drawTextLine0095.fontName = @"HelveticaNeue";
    drawTextLine0095.fontColor = [UIColor blackColor];
    drawTextLine0095.fontSize = 40;
    drawTextLine0095.origin = CGPointMake(3728, 2180);
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0095];
    
    MWDrawTextLine *drawTextLine0096 = [[MWDrawTextLine alloc] init];
    drawTextLine0096.text = station0049.nameEnglish;
    drawTextLine0096.fontName = @"HelveticaNeue";
    drawTextLine0096.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0096.fontSize = 24;
    drawTextLine0096.origin = CGPointMake(3725, 2151);
    [station0049.nameEnglishTextPrimitives addObject:drawTextLine0096];

    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 1627; // Длина вычислена с помощью функции correctZeroDistances
    [edge0006.elements addObject:haul0048];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(3851.5, 1941);
    drawArc0014.startRadians = 71 * M_PI / 180;
    drawArc0014.endRadians = 105 * M_PI / 180;
    drawArc0014.radius = 325;
    drawArc0014.width = 22;
    drawArc0014.color = line0002.color;
    [haul0048.drawPrimitives addObject:drawArc0014];

    // Добавляем станцию Yangjiawan
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0006.elements addObject:station0050];
    
    station0050.nameOriginal = @"杨家湾";
    station0050.nameEnglish = @"Yangjiawan";
    station0050.mapLocation = CGPointMake(3957, 2249);
    station0050.geoLocation = CGPointMake(30.507467, 114.374961); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0097 = [[MWDrawFillCircle alloc] init];
    fillCircle0097.center = station0050.mapLocation;
    fillCircle0097.radius = 20;
    fillCircle0097.fillColor = [UIColor blackColor];
    [station0050.drawPrimitives addObject:fillCircle0097];
    
    MWDrawFillCircle *fillCircle0098 = [[MWDrawFillCircle alloc] init];
    fillCircle0098.center = station0050.mapLocation;
    fillCircle0098.radius = 14;
    fillCircle0098.fillColor = [UIColor whiteColor];
    [station0050.drawPrimitives addObject:fillCircle0098];

    MWDrawTextLine *drawTextLine0097 = [[MWDrawTextLine alloc] init];
    drawTextLine0097.text = station0050.nameOriginal;
    drawTextLine0097.fontName = @"HelveticaNeue";
    drawTextLine0097.fontColor = [UIColor blackColor];
    drawTextLine0097.fontSize = 40;
    drawTextLine0097.origin = CGPointMake(3896, 2279);
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0097];
    
    MWDrawTextLine *drawTextLine0098 = [[MWDrawTextLine alloc] init];
    drawTextLine0098.text = station0050.nameEnglish;
    drawTextLine0098.fontName = @"HelveticaNeue";
    drawTextLine0098.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0098.fontSize = 24;
    drawTextLine0098.origin = CGPointMake(3896, 2326);
    [station0050.nameEnglishTextPrimitives addObject:drawTextLine0098];

    // Добавляем перегон
    MWHaul *haul0049 = [[MWHaul alloc] init];
    haul0049.identifier = @"haul0049";
    haul0049.length = 1789; // Длина вычислена с помощью функции correctZeroDistances
    [edge0006.elements addObject:haul0049];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(3753, 1663);
    drawArc0015.startRadians = 54.8 * M_PI / 180;
    drawArc0015.endRadians = 71 * M_PI / 180;
    drawArc0015.radius = 620;
    drawArc0015.width = 22;
    drawArc0015.color = line0002.color;
    [haul0049.drawPrimitives addObject:drawArc0015];

    // Добавляем станцию Optics Valley Square
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0006.elements addObject:station0051];
    
    station0051.nameOriginal = @"光谷广场";
    station0051.nameEnglish = @"Optics Valley Square";
    station0051.mapLocation = CGPointMake(4109.5, 2170);
    station0051.geoLocation = CGPointMake(30.508339, 114.393607); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0099 = [[MWDrawFillCircle alloc] init];
    fillCircle0099.center = station0051.mapLocation;
    fillCircle0099.radius = 20;
    fillCircle0099.fillColor = [UIColor blackColor];
    [station0051.drawPrimitives addObject:fillCircle0099];
    
    MWDrawFillCircle *fillCircle0100 = [[MWDrawFillCircle alloc] init];
    fillCircle0100.center = station0051.mapLocation;
    fillCircle0100.radius = 14;
    fillCircle0100.fillColor = [UIColor whiteColor];
    [station0051.drawPrimitives addObject:fillCircle0100];

    MWDrawTextLine *drawTextLine0099 = [[MWDrawTextLine alloc] init];
    drawTextLine0099.text = station0051.nameOriginal;
    drawTextLine0099.fontName = @"HelveticaNeue";
    drawTextLine0099.fontColor = [UIColor blackColor];
    drawTextLine0099.fontSize = 40;
    drawTextLine0099.origin = CGPointMake(3888, 2147);
    [station0051.nameOriginalTextPrimitives addObject:drawTextLine0099];
    
    MWDrawTextLine *drawTextLine0100 = [[MWDrawTextLine alloc] init];
    drawTextLine0100.text = station0051.nameEnglish;
    drawTextLine0100.fontName = @"HelveticaNeue";
    drawTextLine0100.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0100.fontSize = 24;
    drawTextLine0100.origin = CGPointMake(3825, 2118);
    [station0051.nameEnglishTextPrimitives addObject:drawTextLine0100];

    // Добавляем вершину
    edge0006.finishVertex = vertex0007;

    ////////////////////////////////////////////////////////////////
    // 3. Line 4
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Wuchang Railway Station - Zhongnan Road
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Wuchang Railway Station - Zhongnan Road";
    [self.edges addObject:(edge0007)];
    
    // Добавляем линию
    edge0007.line = line0003;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0008;

    // Добавляем станцию Wuchang Railway Station
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0007.elements addObject:station0052];
    
    station0052.nameOriginal = @"武昌火车站";
    station0052.nameEnglish = @"Wuchang Railway Station";
    station0052.mapLocation = CGPointMake(2810, 2131);
    station0052.geoLocation = CGPointMake(30.531030, 114.312615); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0101 = [[MWDrawFillCircle alloc] init];
    fillCircle0101.center = station0052.mapLocation;
    fillCircle0101.radius = 20;
    fillCircle0101.fillColor = [UIColor blackColor];
    [station0052.drawPrimitives addObject:fillCircle0101];
    
    MWDrawFillCircle *fillCircle0102 = [[MWDrawFillCircle alloc] init];
    fillCircle0102.center = station0052.mapLocation;
    fillCircle0102.radius = 14;
    fillCircle0102.fillColor = [UIColor whiteColor];
    [station0052.drawPrimitives addObject:fillCircle0102];

    MWDrawTextLine *drawTextLine0101 = [[MWDrawTextLine alloc] init];
    drawTextLine0101.text = station0052.nameOriginal;
    drawTextLine0101.fontName = @"HelveticaNeue";
    drawTextLine0101.fontColor = [UIColor blackColor];
    drawTextLine0101.fontSize = 40;
    drawTextLine0101.origin = CGPointMake(2578, 2108);
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0101];
    
    MWDrawTextLine *drawTextLine0102 = [[MWDrawTextLine alloc] init];
    drawTextLine0102.text = station0052.nameEnglish;
    drawTextLine0102.fontName = @"HelveticaNeue";
    drawTextLine0102.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0102.fontSize = 24;
    drawTextLine0102.origin = CGPointMake(2504, 2155);
    [station0052.nameEnglishTextPrimitives addObject:drawTextLine0102];

    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 915; // Длина вычислена с помощью функции correctZeroDistances
    [edge0007.elements addObject:haul0050];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(2810, 1071);
    drawArc0016.startRadians = 77.7 * M_PI / 180;
    drawArc0016.endRadians = 90 * M_PI / 180;
    drawArc0016.radius = 1060;
    drawArc0016.width = 22;
    drawArc0016.color = line0003.color;
    [haul0050.drawPrimitives addObject:drawArc0016];

    // Добавляем станцию Meiyuanxiaoqu
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0007.elements addObject:station0053];
    
    station0053.nameOriginal = @"梅苑小区";
    station0053.nameEnglish = @"Meiyuanxiaoqu";
    station0053.mapLocation = CGPointMake(3033, 2107);
    station0053.geoLocation = CGPointMake(30.533153, 114.321842); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0103 = [[MWDrawFillCircle alloc] init];
    fillCircle0103.center = station0053.mapLocation;
    fillCircle0103.radius = 20;
    fillCircle0103.fillColor = [UIColor blackColor];
    [station0053.drawPrimitives addObject:fillCircle0103];
    
    MWDrawFillCircle *fillCircle0104 = [[MWDrawFillCircle alloc] init];
    fillCircle0104.center = station0053.mapLocation;
    fillCircle0104.radius = 14;
    fillCircle0104.fillColor = [UIColor whiteColor];
    [station0053.drawPrimitives addObject:fillCircle0104];

    MWDrawTextLine *drawTextLine0103 = [[MWDrawTextLine alloc] init];
    drawTextLine0103.text = station0053.nameOriginal;
    drawTextLine0103.fontName = @"HelveticaNeue";
    drawTextLine0103.fontColor = [UIColor blackColor];
    drawTextLine0103.fontSize = 40;
    drawTextLine0103.origin = CGPointMake(2950, 2138);
    [station0053.nameOriginalTextPrimitives addObject:drawTextLine0103];
    
    MWDrawTextLine *drawTextLine0104 = [[MWDrawTextLine alloc] init];
    drawTextLine0104.text = station0053.nameEnglish;
    drawTextLine0104.fontName = @"HelveticaNeue";
    drawTextLine0104.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0104.fontSize = 24;
    drawTextLine0104.origin = CGPointMake(2948, 2185);
    [station0053.nameEnglishTextPrimitives addObject:drawTextLine0104];

    // Добавляем перегон
    MWHaul *haul0051 = [[MWHaul alloc] init];
    haul0051.identifier = @"haul0051";
    haul0051.length = 979; // Длина вычислена с помощью функции correctZeroDistances
    [edge0007.elements addObject:haul0051];

    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(2990.5, 1902);
    drawArc0017.startRadians = 44 * M_PI / 180;
    drawArc0017.endRadians = 77.7 * M_PI / 180;
    drawArc0017.radius = 210;
    drawArc0017.width = 22;
    drawArc0017.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawArc0017];

    // Добавляем станцию Zhongnan Road
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0007.elements addObject:station0054];
    
    station0054.nameOriginal = @"中南路";
    station0054.nameEnglish = @"Zhongnan Road";
    station0054.mapLocation = CGPointMake(3152, 2052.5);
    station0054.geoLocation = CGPointMake(30.540333, 114.327761); // Примерно! Точное месторасположение станции неизвестно

    station0054.showNameOnMap = false;
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0087];
    [station0054.nameEnglishTextPrimitives addObject:drawTextLine0088];
    
    // Добавляем вершину
    edge0007.finishVertex = vertex0006;

    // Создаем участок линии Zhongnan Road - Hongshan Square
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Zhongnan Road - Hongshan Square";
    [self.edges addObject:(edge0008)];
    
    // Добавляем линию
    edge0008.line = line0003;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0006;

    // Добавляем станцию Zhongnan Road
    [edge0008.elements addObject:station0054];

    // Добавляем перегон
    MWHaul *haul0052 = [[MWHaul alloc] init];
    haul0052.identifier = @"haul0052";
    haul0052.length = 869; // Длина вычислена с помощью функции correctZeroDistances
    [edge0008.elements addObject:haul0052];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(3140, 2050);
    drawLine0046.endPoint = CGPointMake(3219, 1943);
    drawLine0046.width = 22;
    drawLine0046.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0046];

    // Добавляем станцию Hongshan Square
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0008.elements addObject:station0055];
    
    station0055.nameOriginal = @"洪山广场";
    station0055.nameEnglish = @"Hongshan Square";
    station0055.mapLocation = CGPointMake(3212, 1942);
    station0055.geoLocation = CGPointMake(30.547475, 114.331441); // Примерно! Точное месторасположение станции неизвестно

    station0055.showNameOnMap = false;
    [station0055.nameOriginalTextPrimitives addObject:drawTextLine0085];
    [station0055.nameEnglishTextPrimitives addObject:drawTextLine0086];
    
    // Добавляем вершину
    edge0008.finishVertex = vertex0005;

    // Создаем участок линии Hongshan Square - Wuhan Railway Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: Hongshan Square - Wuhan Railway Station";
    [self.edges addObject:(edge0009)];
    
    // Добавляем линию
    edge0009.line = line0003;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0005;

    // Добавляем станцию Hongshan Square
    [edge0009.elements addObject:station0055];

    // Добавляем перегон
    MWHaul *haul0053 = [[MWHaul alloc] init];
    haul0053.identifier = @"haul0053";
    haul0053.length = 1208; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0053];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(3218.5, 1943.5);
    drawLine0047.endPoint = CGPointMake(3288.5, 1837);
    drawLine0047.width = 22;
    drawLine0047.color = line0003.color;
    [haul0053.drawPrimitives addObject:drawLine0047];

    // Добавляем станцию Chuhe Hanjie
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0009.elements addObject:station0056];
    
    station0056.nameOriginal = @"楚河汉街";
    station0056.nameEnglish = @"Chuhe Hanjie";
    station0056.mapLocation = CGPointMake(3288.5, 1837);
    station0056.geoLocation = CGPointMake(30.557424, 114.336508); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0105 = [[MWDrawFillCircle alloc] init];
    fillCircle0105.center = station0056.mapLocation;
    fillCircle0105.radius = 20;
    fillCircle0105.fillColor = [UIColor blackColor];
    [station0056.drawPrimitives addObject:fillCircle0105];
    
    MWDrawFillCircle *fillCircle0106 = [[MWDrawFillCircle alloc] init];
    fillCircle0106.center = station0056.mapLocation;
    fillCircle0106.radius = 14;
    fillCircle0106.fillColor = [UIColor whiteColor];
    [station0056.drawPrimitives addObject:fillCircle0106];
    
    MWDrawTextLine *drawTextLine0105 = [[MWDrawTextLine alloc] init];
    drawTextLine0105.text = station0056.nameOriginal;
    drawTextLine0105.fontName = @"HelveticaNeue";
    drawTextLine0105.fontColor = [UIColor blackColor];
    drawTextLine0105.fontSize = 40;
    drawTextLine0105.origin = CGPointMake(3325, 1813);
    [station0056.nameOriginalTextPrimitives addObject:drawTextLine0105];
    
    MWDrawTextLine *drawTextLine0106 = [[MWDrawTextLine alloc] init];
    drawTextLine0106.text = station0056.nameEnglish;
    drawTextLine0106.fontName = @"HelveticaNeue";
    drawTextLine0106.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0106.fontSize = 24;
    drawTextLine0106.origin = CGPointMake(3300, 1860);
    [station0056.nameEnglishTextPrimitives addObject:drawTextLine0106];

    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 1079; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0054];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(3288, 1837.5);
    drawLine0048.endPoint = CGPointMake(3349, 1745);
    drawLine0048.width = 22;
    drawLine0048.color = line0003.color;
    [haul0054.drawPrimitives addObject:drawLine0048];

    // Добавляем станцию Qingyuzui
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0009.elements addObject:station0057];
    
    station0057.nameOriginal = @"青鱼嘴";
    station0057.nameEnglish = @"Qingyuzui";
    station0057.mapLocation = CGPointMake(3349, 1745);
    station0057.geoLocation = CGPointMake(30.565106, 114.343390); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0107 = [[MWDrawFillCircle alloc] init];
    fillCircle0107.center = station0057.mapLocation;
    fillCircle0107.radius = 20;
    fillCircle0107.fillColor = [UIColor blackColor];
    [station0057.drawPrimitives addObject:fillCircle0107];
    
    MWDrawFillCircle *fillCircle0108 = [[MWDrawFillCircle alloc] init];
    fillCircle0108.center = station0057.mapLocation;
    fillCircle0108.radius = 14;
    fillCircle0108.fillColor = [UIColor whiteColor];
    [station0057.drawPrimitives addObject:fillCircle0108];

    MWDrawTextLine *drawTextLine0107 = [[MWDrawTextLine alloc] init];
    drawTextLine0107.text = station0057.nameOriginal;
    drawTextLine0107.fontName = @"HelveticaNeue";
    drawTextLine0107.fontColor = [UIColor blackColor];
    drawTextLine0107.fontSize = 40;
    drawTextLine0107.origin = CGPointMake(3193, 1721);
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0107];
    
    MWDrawTextLine *drawTextLine0108 = [[MWDrawTextLine alloc] init];
    drawTextLine0108.text = station0057.nameEnglish;
    drawTextLine0108.fontName = @"HelveticaNeue";
    drawTextLine0108.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0108.fontSize = 24;
    drawTextLine0108.origin = CGPointMake(3185, 1768);
    [station0057.nameEnglishTextPrimitives addObject:drawTextLine0108];

    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 997; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0055];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(3348.5, 1745.5);
    drawLine0049.endPoint = CGPointMake(3410.5, 1649.5);
    drawLine0049.width = 22;
    drawLine0049.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawLine0049];

    // Добавляем станцию Dongting
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0009.elements addObject:station0058];
    
    station0058.nameOriginal = @"东亭";
    station0058.nameEnglish = @"Dongting";
    station0058.mapLocation = CGPointMake(3410.5, 1649.5);
    station0058.geoLocation = CGPointMake(30.572535, 114.349219); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0109 = [[MWDrawFillCircle alloc] init];
    fillCircle0109.center = station0058.mapLocation;
    fillCircle0109.radius = 20;
    fillCircle0109.fillColor = [UIColor blackColor];
    [station0058.drawPrimitives addObject:fillCircle0109];
    
    MWDrawFillCircle *fillCircle0110 = [[MWDrawFillCircle alloc] init];
    fillCircle0110.center = station0058.mapLocation;
    fillCircle0110.radius = 14;
    fillCircle0110.fillColor = [UIColor whiteColor];
    [station0058.drawPrimitives addObject:fillCircle0110];

    MWDrawTextLine *drawTextLine0109 = [[MWDrawTextLine alloc] init];
    drawTextLine0109.text = station0058.nameOriginal;
    drawTextLine0109.fontName = @"HelveticaNeue";
    drawTextLine0109.fontColor = [UIColor blackColor];
    drawTextLine0109.fontSize = 40;
    drawTextLine0109.origin = CGPointMake(3300, 1625);
    [station0058.nameOriginalTextPrimitives addObject:drawTextLine0109];
    
    MWDrawTextLine *drawTextLine0110 = [[MWDrawTextLine alloc] init];
    drawTextLine0110.text = station0058.nameEnglish;
    drawTextLine0110.fontName = @"HelveticaNeue";
    drawTextLine0110.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0110.fontSize = 24;
    drawTextLine0110.origin = CGPointMake(3257, 1672);
    [station0058.nameEnglishTextPrimitives addObject:drawTextLine0110];

    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 980; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0056];

    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(3410, 1650);
    drawLine0050.endPoint = CGPointMake(3475.5, 1548.5);
    drawLine0050.width = 22;
    drawLine0050.color = line0003.color;
    [haul0056.drawPrimitives addObject:drawLine0050];

    // Добавляем станцию Yuejiazui
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0009.elements addObject:station0059];
    
    station0059.nameOriginal = @"岳家嘴";
    station0059.nameEnglish = @"Yuejiazui";
    station0059.mapLocation = CGPointMake(3475.5, 1548.5);
    station0059.geoLocation = CGPointMake(30.579054, 114.356127); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0111 = [[MWDrawFillCircle alloc] init];
    fillCircle0111.center = station0059.mapLocation;
    fillCircle0111.radius = 20;
    fillCircle0111.fillColor = [UIColor blackColor];
    [station0059.drawPrimitives addObject:fillCircle0111];
    
    MWDrawFillCircle *fillCircle0112 = [[MWDrawFillCircle alloc] init];
    fillCircle0112.center = station0059.mapLocation;
    fillCircle0112.radius = 14;
    fillCircle0112.fillColor = [UIColor whiteColor];
    [station0059.drawPrimitives addObject:fillCircle0112];

    MWDrawTextLine *drawTextLine0111 = [[MWDrawTextLine alloc] init];
    drawTextLine0111.text = station0059.nameOriginal;
    drawTextLine0111.fontName = @"HelveticaNeue";
    drawTextLine0111.fontColor = [UIColor blackColor];
    drawTextLine0111.fontSize = 40;
    drawTextLine0111.origin = CGPointMake(3320, 1525);
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0111];
    
    MWDrawTextLine *drawTextLine0112 = [[MWDrawTextLine alloc] init];
    drawTextLine0112.text = station0059.nameEnglish;
    drawTextLine0112.fontName = @"HelveticaNeue";
    drawTextLine0112.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0112.fontSize = 24;
    drawTextLine0112.origin = CGPointMake(3327, 1572);
    [station0059.nameEnglishTextPrimitives addObject:drawTextLine0112];

    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 1080; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0057];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(3475, 1549);
    drawLine0051.endPoint = CGPointMake(3545, 1444.5);
    drawLine0051.width = 22;
    drawLine0051.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawLine0051];

    // Добавляем станцию Tieji Road
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0009.elements addObject:station0060];
    
    station0060.nameOriginal = @"铁机村";
    station0060.nameEnglish = @"Tieji Road";
    station0060.mapLocation = CGPointMake(3545, 1444.5);
    station0060.geoLocation = CGPointMake(30.586377, 114.363524); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0113 = [[MWDrawFillCircle alloc] init];
    fillCircle0113.center = station0060.mapLocation;
    fillCircle0113.radius = 20;
    fillCircle0113.fillColor = [UIColor blackColor];
    [station0060.drawPrimitives addObject:fillCircle0113];
    
    MWDrawFillCircle *fillCircle0114 = [[MWDrawFillCircle alloc] init];
    fillCircle0114.center = station0060.mapLocation;
    fillCircle0114.radius = 14;
    fillCircle0114.fillColor = [UIColor whiteColor];
    [station0060.drawPrimitives addObject:fillCircle0114];

    MWDrawTextLine *drawTextLine0113 = [[MWDrawTextLine alloc] init];
    drawTextLine0113.text = station0060.nameOriginal;
    drawTextLine0113.fontName = @"HelveticaNeue";
    drawTextLine0113.fontColor = [UIColor blackColor];
    drawTextLine0113.fontSize = 40;
    drawTextLine0113.origin = CGPointMake(3395, 1419);
    [station0060.nameOriginalTextPrimitives addObject:drawTextLine0113];
    
    MWDrawTextLine *drawTextLine0114 = [[MWDrawTextLine alloc] init];
    drawTextLine0114.text = station0060.nameEnglish;
    drawTextLine0114.fontName = @"HelveticaNeue";
    drawTextLine0114.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0114.fontSize = 24;
    drawTextLine0114.origin = CGPointMake(3384, 1466);
    [station0060.nameEnglishTextPrimitives addObject:drawTextLine0114];

    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 995; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0058];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(3544.5, 1445);
    drawLine0052.endPoint = CGPointMake(3616.5, 1333.5);
    drawLine0052.width = 22;
    drawLine0052.color = line0003.color;
    [haul0058.drawPrimitives addObject:drawLine0052];

    // Добавляем станцию Luojiagang
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0009.elements addObject:station0061];
    
    station0061.nameOriginal = @"罗家港";
    station0061.nameEnglish = @"Luojiagang";
    station0061.mapLocation = CGPointMake(3616.5, 1333.5);
    station0061.geoLocation = CGPointMake(30.595065, 114.366022); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0115 = [[MWDrawFillCircle alloc] init];
    fillCircle0115.center = station0061.mapLocation;
    fillCircle0115.radius = 20;
    fillCircle0115.fillColor = [UIColor blackColor];
    [station0061.drawPrimitives addObject:fillCircle0115];
    
    MWDrawFillCircle *fillCircle0116 = [[MWDrawFillCircle alloc] init];
    fillCircle0116.center = station0061.mapLocation;
    fillCircle0116.radius = 14;
    fillCircle0116.fillColor = [UIColor whiteColor];
    [station0061.drawPrimitives addObject:fillCircle0116];

    MWDrawTextLine *drawTextLine0115 = [[MWDrawTextLine alloc] init];
    drawTextLine0115.text = station0061.nameOriginal;
    drawTextLine0115.fontName = @"HelveticaNeue";
    drawTextLine0115.fontColor = [UIColor blackColor];
    drawTextLine0115.fontSize = 40;
    drawTextLine0115.origin = CGPointMake(3468, 1308);
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0115];
    
    MWDrawTextLine *drawTextLine0116 = [[MWDrawTextLine alloc] init];
    drawTextLine0116.text = station0061.nameEnglish;
    drawTextLine0116.fontName = @"HelveticaNeue";
    drawTextLine0116.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0116.fontSize = 24;
    drawTextLine0116.origin = CGPointMake(3447, 1355);
    [station0061.nameEnglishTextPrimitives addObject:drawTextLine0116];

    // Добавляем перегон
    MWHaul *haul0059 = [[MWHaul alloc] init];
    haul0059.identifier = @"haul0059";
    haul0059.length = 2766; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0059];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(3616, 1334);
    drawLine0053.endPoint = CGPointMake(3683, 1226);
    drawLine0053.width = 22;
    drawLine0053.color = line0003.color;
    [haul0059.drawPrimitives addObject:drawLine0053];

    // Добавляем станцию Yuanlin Road
    MWStation *station0062 = [[MWStation alloc] init];
    station0062.identifier = @"station0062";
    [edge0009.elements addObject:station0062];
    
    station0062.nameOriginal = @"园林路";
    station0062.nameEnglish = @"Yuanlin Road";
    station0062.mapLocation = CGPointMake(3683, 1226);
    station0062.geoLocation = CGPointMake(30.614893, 114.383466); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0117 = [[MWDrawFillCircle alloc] init];
    fillCircle0117.center = station0062.mapLocation;
    fillCircle0117.radius = 20;
    fillCircle0117.fillColor = [UIColor blackColor];
    [station0062.drawPrimitives addObject:fillCircle0117];
    
    MWDrawFillCircle *fillCircle0118 = [[MWDrawFillCircle alloc] init];
    fillCircle0118.center = station0062.mapLocation;
    fillCircle0118.radius = 14;
    fillCircle0118.fillColor = [UIColor whiteColor];
    [station0062.drawPrimitives addObject:fillCircle0118];

    MWDrawTextLine *drawTextLine0117 = [[MWDrawTextLine alloc] init];
    drawTextLine0117.text = station0062.nameOriginal;
    drawTextLine0117.fontName = @"HelveticaNeue";
    drawTextLine0117.fontColor = [UIColor blackColor];
    drawTextLine0117.fontSize = 40;
    drawTextLine0117.origin = CGPointMake(3531, 1201);
    [station0062.nameOriginalTextPrimitives addObject:drawTextLine0117];
    
    MWDrawTextLine *drawTextLine0118 = [[MWDrawTextLine alloc] init];
    drawTextLine0118.text = station0062.nameEnglish;
    drawTextLine0118.fontName = @"HelveticaNeue";
    drawTextLine0118.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0118.fontSize = 24;
    drawTextLine0118.origin = CGPointMake(3490, 1248);
    [station0062.nameEnglishTextPrimitives addObject:drawTextLine0118];

    // Добавляем перегон
    MWHaul *haul0060 = [[MWHaul alloc] init];
    haul0060.identifier = @"haul0060";
    haul0060.length = 1476; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0060];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(3682.5, 1226.5);
    drawLine0054.endPoint = CGPointMake(3755, 1123);
    drawLine0054.width = 22;
    drawLine0054.color = line0003.color;
    [haul0060.drawPrimitives addObject:drawLine0054];

    // Добавляем станцию Renhe Road
    MWStation *station0063 = [[MWStation alloc] init];
    station0063.identifier = @"station0063";
    [edge0009.elements addObject:station0063];
    
    station0063.nameOriginal = @"仁和路";
    station0063.nameEnglish = @"Renhe Road";
    station0063.mapLocation = CGPointMake(3755, 1123);
    station0063.geoLocation = CGPointMake(30.620751, 114.397307); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0119 = [[MWDrawFillCircle alloc] init];
    fillCircle0119.center = station0063.mapLocation;
    fillCircle0119.radius = 20;
    fillCircle0119.fillColor = [UIColor blackColor];
    [station0063.drawPrimitives addObject:fillCircle0119];
    
    MWDrawFillCircle *fillCircle0120 = [[MWDrawFillCircle alloc] init];
    fillCircle0120.center = station0063.mapLocation;
    fillCircle0120.radius = 14;
    fillCircle0120.fillColor = [UIColor whiteColor];
    [station0063.drawPrimitives addObject:fillCircle0120];

    MWDrawTextLine *drawTextLine0119 = [[MWDrawTextLine alloc] init];
    drawTextLine0119.text = station0063.nameOriginal;
    drawTextLine0119.fontName = @"HelveticaNeue";
    drawTextLine0119.fontColor = [UIColor blackColor];
    drawTextLine0119.fontSize = 40;
    drawTextLine0119.origin = CGPointMake(3599, 1099);
    [station0063.nameOriginalTextPrimitives addObject:drawTextLine0119];
    
    MWDrawTextLine *drawTextLine0120 = [[MWDrawTextLine alloc] init];
    drawTextLine0120.text = station0063.nameEnglish;
    drawTextLine0120.fontName = @"HelveticaNeue";
    drawTextLine0120.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0120.fontSize = 24;
    drawTextLine0120.origin = CGPointMake(3565, 1146);
    [station0063.nameEnglishTextPrimitives addObject:drawTextLine0120];

    // Добавляем перегон
    MWHaul *haul0061 = [[MWHaul alloc] init];
    haul0061.identifier = @"haul0061";
    haul0061.length = 1039; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0061];

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(3754.5, 1123.5);
    drawLine0055.endPoint = CGPointMake(3821.5, 1020);
    drawLine0055.width = 22;
    drawLine0055.color = line0003.color;
    [haul0061.drawPrimitives addObject:drawLine0055];

    // Добавляем станцию Gongye Fourth Road
    MWStation *station0064 = [[MWStation alloc] init];
    station0064.identifier = @"station0064";
    [edge0009.elements addObject:station0064];
    
    station0064.nameOriginal = @"工业四路";
    station0064.nameEnglish = @"Gongye Fourth Road";
    station0064.mapLocation = CGPointMake(3821.5, 1020);
    station0064.geoLocation = CGPointMake(30.621558, 114.408127); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0121 = [[MWDrawFillCircle alloc] init];
    fillCircle0121.center = station0064.mapLocation;
    fillCircle0121.radius = 20;
    fillCircle0121.fillColor = [UIColor blackColor];
    [station0064.drawPrimitives addObject:fillCircle0121];
    
    MWDrawFillCircle *fillCircle0122 = [[MWDrawFillCircle alloc] init];
    fillCircle0122.center = station0064.mapLocation;
    fillCircle0122.radius = 14;
    fillCircle0122.fillColor = [UIColor whiteColor];
    [station0064.drawPrimitives addObject:fillCircle0122];

    MWDrawTextLine *drawTextLine0121 = [[MWDrawTextLine alloc] init];
    drawTextLine0121.text = station0064.nameOriginal;
    drawTextLine0121.fontName = @"HelveticaNeue";
    drawTextLine0121.fontColor = [UIColor blackColor];
    drawTextLine0121.fontSize = 40;
    drawTextLine0121.origin = CGPointMake(3628, 997);
    [station0064.nameOriginalTextPrimitives addObject:drawTextLine0121];
    
    MWDrawTextLine *drawTextLine0122 = [[MWDrawTextLine alloc] init];
    drawTextLine0122.text = station0064.nameEnglish;
    drawTextLine0122.fontName = @"HelveticaNeue";
    drawTextLine0122.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0122.fontSize = 24;
    drawTextLine0122.origin = CGPointMake(3542, 1044);
    [station0064.nameEnglishTextPrimitives addObject:drawTextLine0122];

    // Добавляем перегон
    MWHaul *haul0062 = [[MWHaul alloc] init];
    haul0062.identifier = @"haul0062";
    haul0062.length = 893; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0062];

    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(3821, 1020.5);
    drawLine0056.endPoint = CGPointMake(3887.5, 924);
    drawLine0056.width = 22;
    drawLine0056.color = line0003.color;
    [haul0062.drawPrimitives addObject:drawLine0056];

    // Добавляем станцию Yangchunhu
    MWStation *station0065 = [[MWStation alloc] init];
    station0065.identifier = @"station0065";
    [edge0009.elements addObject:station0065];
    
    station0065.nameOriginal = @"杨春湖";
    station0065.nameEnglish = @"Yangchunhu";
    station0065.mapLocation = CGPointMake(3887.5, 924);
    station0065.geoLocation = CGPointMake(30.616239, 114.415122); // Примерно! Точное месторасположение станции неизвестно

    MWDrawFillCircle *fillCircle0123 = [[MWDrawFillCircle alloc] init];
    fillCircle0123.center = station0065.mapLocation;
    fillCircle0123.radius = 20;
    fillCircle0123.fillColor = [UIColor blackColor];
    [station0065.drawPrimitives addObject:fillCircle0123];
    
    MWDrawFillCircle *fillCircle0124 = [[MWDrawFillCircle alloc] init];
    fillCircle0124.center = station0065.mapLocation;
    fillCircle0124.radius = 14;
    fillCircle0124.fillColor = [UIColor whiteColor];
    [station0065.drawPrimitives addObject:fillCircle0124];

    MWDrawTextLine *drawTextLine0123 = [[MWDrawTextLine alloc] init];
    drawTextLine0123.text = station0065.nameOriginal;
    drawTextLine0123.fontName = @"HelveticaNeue";
    drawTextLine0123.fontColor = [UIColor blackColor];
    drawTextLine0123.fontSize = 40;
    drawTextLine0123.origin = CGPointMake(3733, 898);
    [station0065.nameOriginalTextPrimitives addObject:drawTextLine0123];
    
    MWDrawTextLine *drawTextLine0124 = [[MWDrawTextLine alloc] init];
    drawTextLine0124.text = station0065.nameEnglish;
    drawTextLine0124.fontName = @"HelveticaNeue";
    drawTextLine0124.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0124.fontSize = 24;
    drawTextLine0124.origin = CGPointMake(3700, 945);
    [station0065.nameEnglishTextPrimitives addObject:drawTextLine0124];

    // Добавляем перегон
    MWHaul *haul0063 = [[MWHaul alloc] init];
    haul0063.identifier = @"haul0063";
    haul0063.length = 810; // Длина вычислена с помощью функции correctZeroDistances
    [edge0009.elements addObject:haul0063];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(3887, 924.5);
    drawLine0057.endPoint = CGPointMake(3953.5, 824);
    drawLine0057.width = 22;
    drawLine0057.color = line0003.color;
    [haul0063.drawPrimitives addObject:drawLine0057];

    // Добавляем станцию Wuhan Railway Station
    MWStation *station0066 = [[MWStation alloc] init];
    station0066.identifier = @"station0066";
    [edge0009.elements addObject:station0066];
    
    station0066.nameOriginal = @"武汉火车站";
    station0066.nameEnglish = @"Wuhan Railway Station";
    station0066.mapLocation = CGPointMake(3953.5, 824);
    station0066.geoLocation = CGPointMake(30.609725, 114.418920); // Примерно! Точное месторасположение станции неизвестно
    
    MWDrawFillCircle *fillCircle0125 = [[MWDrawFillCircle alloc] init];
    fillCircle0125.center = station0066.mapLocation;
    fillCircle0125.radius = 20;
    fillCircle0125.fillColor = [UIColor blackColor];
    [station0066.drawPrimitives addObject:fillCircle0125];
    
    MWDrawFillCircle *fillCircle0126 = [[MWDrawFillCircle alloc] init];
    fillCircle0126.center = station0066.mapLocation;
    fillCircle0126.radius = 14;
    fillCircle0126.fillColor = [UIColor whiteColor];
    [station0066.drawPrimitives addObject:fillCircle0126];

    MWDrawTextLine *drawTextLine0125 = [[MWDrawTextLine alloc] init];
    drawTextLine0125.text = station0066.nameOriginal;
    drawTextLine0125.fontName = @"HelveticaNeue";
    drawTextLine0125.fontColor = [UIColor blackColor];
    drawTextLine0125.fontSize = 40;
    drawTextLine0125.origin = CGPointMake(3720, 798);
    [station0066.nameOriginalTextPrimitives addObject:drawTextLine0125];
    
    MWDrawTextLine *drawTextLine0126 = [[MWDrawTextLine alloc] init];
    drawTextLine0126.text = station0066.nameEnglish;
    drawTextLine0126.fontName = @"HelveticaNeue";
    drawTextLine0126.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0126.fontSize = 24;
    drawTextLine0126.origin = CGPointMake(3652, 845);
    [station0066.nameEnglishTextPrimitives addObject:drawTextLine0126];

//    -------------------
  
    MWDrawTextLine *drawTextLine0127 = [[MWDrawTextLine alloc] init];
    drawTextLine0127.text = @"1";
    drawTextLine0127.fontName = @"Arial-BoldMT";
    drawTextLine0127.fontColor = line0001.color;
    drawTextLine0127.fontSize = 144;
    drawTextLine0127.origin = CGPointMake(18, 506);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0127];
    
    MWDrawTextLine *drawTextLine0128 = [[MWDrawTextLine alloc] init];
    drawTextLine0128.text = @"1";
    drawTextLine0128.fontName = @"Arial-BoldMT";
    drawTextLine0128.fontColor = line0001.color;
    drawTextLine0128.fontSize = 144;
    drawTextLine0128.origin = CGPointMake(3096, 31);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0128];

    MWDrawTextLine *drawTextLine0129 = [[MWDrawTextLine alloc] init];
    drawTextLine0129.text = @"2";
    drawTextLine0129.fontName = @"Arial-BoldMT";
    drawTextLine0129.fontColor = line0002.color;
    drawTextLine0129.fontSize = 144;
    drawTextLine0129.origin = CGPointMake(1670, 418);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0129];

    MWDrawTextLine *drawTextLine0130 = [[MWDrawTextLine alloc] init];
    drawTextLine0130.text = @"2";
    drawTextLine0130.fontName = @"Arial-BoldMT";
    drawTextLine0130.fontColor = line0002.color;
    drawTextLine0130.fontSize = 144;
    drawTextLine0130.origin = CGPointMake(4065, 1975);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0130];

    MWDrawTextLine *drawTextLine0131 = [[MWDrawTextLine alloc] init];
    drawTextLine0131.text = @"4";
    drawTextLine0131.fontName = @"Arial-BoldMT";
    drawTextLine0131.fontColor = line0003.color;
    drawTextLine0131.fontSize = 144;
    drawTextLine0131.origin = CGPointMake(2785, 2145);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0131];

    MWDrawTextLine *drawTextLine0132 = [[MWDrawTextLine alloc] init];
    drawTextLine0132.text = @"4";
    drawTextLine0132.fontName = @"Arial-BoldMT";
    drawTextLine0132.fontColor = line0003.color;
    drawTextLine0132.fontSize = 144;
    drawTextLine0132.origin = CGPointMake(3909, 649);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0132];

    MWDrawTextLine *drawTextLine0133 = [[MWDrawTextLine alloc] init];
    drawTextLine0133.text = @"武汉地铁";
    drawTextLine0133.fontName = @"Arial-BoldMT";
    drawTextLine0133.fontColor = [UIColor blackColor];
    drawTextLine0133.fontSize = 144;
    drawTextLine0133.origin = CGPointMake(420, 1979);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0133];

    MWDrawTextLine *drawTextLine0134 = [[MWDrawTextLine alloc] init];
    drawTextLine0134.text = @"Wuhan Metro";
    drawTextLine0134.fontName = @"Arial-BoldMT";
    drawTextLine0134.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0134.fontSize = 92;
    drawTextLine0134.origin = CGPointMake(420, 2130);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0134];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(1750, 2800);
    drawLine0058.endPoint = CGPointMake(3900, -300);
    drawLine0058.width = 300;
    drawLine0058.color = [UIColor colorWithRed:(175/255.0) green:(221/255.0) blue:(233/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0058];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(0, 1719);
    drawLine0059.endPoint = CGPointMake(2500, 1719);
    drawLine0059.width = 150;
    drawLine0059.color = [UIColor colorWithRed:(175/255.0) green:(221/255.0) blue:(233/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0059];

    MWDrawTextLine *drawTextLine0135 = [[MWDrawTextLine alloc] init];
    drawTextLine0135.text = @"Han River (Han Jiang)";
    drawTextLine0135.fontName = @"Arial-BoldMT";
    drawTextLine0135.fontColor = [UIColor colorWithRed:(225/255.0) green:(242/255.0) blue:(247/255.0) alpha:1];
    drawTextLine0135.fontSize = 86;
    drawTextLine0135.origin = CGPointMake(930, 1662);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0135];

    MWDrawTextLine *drawTextLine0136 = [[MWDrawTextLine alloc] init];
    drawTextLine0136.text = @"Yangtze River";
    drawTextLine0136.radians = 305 * M_PI / 180;
    drawTextLine0136.fontName = @"Arial-BoldMT";
    drawTextLine0136.fontColor = [UIColor colorWithRed:(225/255.0) green:(242/255.0) blue:(247/255.0) alpha:1];
    drawTextLine0136.fontSize = 144;
    drawTextLine0136.origin = CGPointMake(1997, 2270);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0136];

    MWDrawTextLine *drawTextLine0137 = [[MWDrawTextLine alloc] init];
    drawTextLine0137.text = @"(Chang Jiang)";
    drawTextLine0137.radians = 305 * M_PI / 180;
    drawTextLine0137.fontName = @"Arial-BoldMT";
    drawTextLine0137.fontColor = [UIColor colorWithRed:(225/255.0) green:(242/255.0) blue:(247/255.0) alpha:1];
    drawTextLine0137.fontSize = 144;
    drawTextLine0137.origin = CGPointMake(2738, 1204);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0137];

    // Добавляем вершину
    edge0009.finishVertex = vertex0009;
    
    return self;
}

@end
