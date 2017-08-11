//
//  MWHiroshimaMetro.m
//  MetroWay
//
//  Created by Valentin Ozerov on 01.06.15.
//  Copyright (c) 2015 Valentin Ozerov. All rights reserved.
//

#import "MWHiroshimaMetro.h"
#import "MWHaul.h"
#import "MWDrawTextLine.h"
#import "MWDrawFillCircle.h"
#import "MWDrawLine.h"
#import "MWDrawArc.h"

@implementation MWHiroshimaMetro

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"hiroshima_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"アストラムライン";
    line0001.nameEnglish = @"Astram Line";
    line0001.color = [UIColor colorWithRed:(255/255.0) green:(215/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0001];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];

    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Hondōri
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Hondōri";
    [self.vertices addObject:vertex0001];

    // Kōiki-kōen-mae
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Kōiki-kōen-mae";
    [self.vertices addObject:vertex0002];

    ////////////////////////////////////////////////////////////////
    // Astram Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Hondōri - Kōiki-kōen-mae
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Recife - Joana Bezerra";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Hondōri
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"本通駅";
    station0001.nameEnglish = @"Hondōri";
    station0001.mapLocation = CGPointMake(530, 966.5);
    station0001.geoLocation = CGPointMake(34.393333, 132.456944);

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = station0001.mapLocation;
    fillCircle0001.radius = 13;
    fillCircle0001.fillColor = [UIColor blackColor];
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0001.mapLocation;
    fillCircle0002.radius = 10;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0002];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(440, 967);
    drawLine0038.endPoint = CGPointMake(515, 967);
    drawLine0038.width = 40;
    drawLine0038.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0001.nameOriginalTextPrimitives addObject:drawLine0038];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(425, 935);
    drawLine0039.endPoint = CGPointMake(515, 935);
    drawLine0039.width = 25;
    drawLine0039.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0001.nameEnglishTextPrimitives addObject:drawLine0039];
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = @"本通";
    drawTextLine0001.fontName = @"HelveticaNeue-Bold";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 36;
    drawTextLine0001.degrees = 0;
    drawTextLine0001.origin = CGPointMake(442, 944);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0001.nameEnglish;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor grayColor];
    drawTextLine0002.fontSize = 24;
    drawTextLine0002.degrees = 0;
    drawTextLine0002.origin = CGPointMake(427, 920);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 300;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(530, 966.5);
    drawLine0001.endPoint = CGPointMake(541, 929.5);
    drawLine0001.width = 22;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];

    // Добавляем станцию Kenchō-mae
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"県庁前駅";
    station0002.nameEnglish = @"Kenchō-mae";
    station0002.mapLocation = CGPointMake(541, 929.5);
    station0002.geoLocation = CGPointMake(34.396944, 132.458333);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0002.mapLocation;
    fillCircle0003.radius = 8;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0003];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(557, 933);
    drawLine0040.endPoint = CGPointMake(665, 933);
    drawLine0040.width = 40;
    drawLine0040.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0002.nameOriginalTextPrimitives addObject:drawLine0040];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(557, 904);
    drawLine0041.endPoint = CGPointMake(695, 904);
    drawLine0041.width = 25;
    drawLine0041.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0002.nameEnglishTextPrimitives addObject:drawLine0041];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = @"県庁前";
    drawTextLine0003.fontName = @"HelveticaNeue-Bold";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 36;
    drawTextLine0003.degrees = 0;
    drawTextLine0003.origin = CGPointMake(557, 910);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0002.nameEnglish;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor grayColor];
    drawTextLine0004.fontSize = 24;
    drawTextLine0004.degrees = 0;
    drawTextLine0004.origin = CGPointMake(557, 889);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0004];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1100;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(541, 930);
    drawLine0002.endPoint = CGPointMake(545, 917);
    drawLine0002.width = 22;
    drawLine0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0002];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(533, 915);
    drawArc0001.startRadians = 330 * M_PI / 180;
    drawArc0001.endRadians = 15 * M_PI / 180;
    drawArc0001.radius = 12;
    drawArc0001.width = 22;
    drawArc0001.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(543, 910);
    drawLine0003.endPoint = CGPointMake(536, 897);
    drawLine0003.width = 22;
    drawLine0003.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0003];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(562, 883);
    drawArc0002.startRadians = 150 * M_PI / 180;
    drawArc0002.endRadians = 200 * M_PI / 180;
    drawArc0002.radius = 30;
    drawArc0002.width = 22;
    drawArc0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawArc0002];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(533, 875);
    drawLine0004.endPoint = CGPointMake(547.5, 836.5);
    drawLine0004.width = 22;
    drawLine0004.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Jōhoku
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"城北駅";
    station0003.nameEnglish = @"Jōhoku";
    station0003.mapLocation = CGPointMake(547, 837);
    station0003.geoLocation = CGPointMake(34.4053, 132.4588);

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0003.mapLocation;
    fillCircle0004.radius = 8;
    fillCircle0004.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0004];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(450, 838);
    drawLine0042.endPoint = CGPointMake(526, 838);
    drawLine0042.width = 40;
    drawLine0042.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0003.nameOriginalTextPrimitives addObject:drawLine0042];
    
    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(440, 806);
    drawLine0043.endPoint = CGPointMake(524, 806);
    drawLine0043.width = 25;
    drawLine0043.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0003.nameEnglishTextPrimitives addObject:drawLine0043];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = @"城北";
    drawTextLine0005.fontName = @"HelveticaNeue-Bold";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 36;
    drawTextLine0005.degrees = 0;
    drawTextLine0005.origin = CGPointMake(452, 815);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0005];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0003.nameEnglish;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor grayColor];
    drawTextLine0006.fontSize = 24;
    drawTextLine0006.degrees = 0;
    drawTextLine0006.origin = CGPointMake(443, 791);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 300;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(546.5, 838);
    drawLine0005.endPoint = CGPointMake(561, 811.5);
    drawLine0005.width = 22;
    drawLine0005.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0005];

    // Добавляем станцию Shin-Hakushima
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"新白島駅";
    station0004.nameEnglish = @"Shin-Hakushima";
    station0004.mapLocation = CGPointMake(561, 811.5);
    station0004.geoLocation = CGPointMake(34.408056, 132.46075);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0004.mapLocation;
    fillCircle0005.radius = 13;
    fillCircle0005.fillColor = [UIColor blackColor];
    [station0004.drawPrimitives addObject:fillCircle0005];
    
    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0004.mapLocation;
    fillCircle0006.radius = 10;
    fillCircle0006.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0006];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(592, 811);
    drawLine0044.endPoint = CGPointMake(703, 811);
    drawLine0044.width = 40;
    drawLine0044.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0004.nameOriginalTextPrimitives addObject:drawLine0044];
    
    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(597, 780);
    drawLine0045.endPoint = CGPointMake(780, 780);
    drawLine0045.width = 25;
    drawLine0045.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0004.nameEnglishTextPrimitives addObject:drawLine0045];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = @"新白島";
    drawTextLine0007.fontName = @"HelveticaNeue-Bold";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 36;
    drawTextLine0007.degrees = 0;
    drawTextLine0007.origin = CGPointMake(595, 788);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];
    
    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0004.nameEnglish;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor grayColor];
    drawTextLine0008.fontSize = 24;
    drawTextLine0008.degrees = 0;
    drawTextLine0008.origin = CGPointMake(600, 766);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 400;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(561, 811.5);
    drawLine0006.endPoint = CGPointMake(573, 798);
    drawLine0006.width = 22;
    drawLine0006.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0006];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(549, 781);
    drawArc0003.startRadians = 15 * M_PI / 180;
    drawArc0003.endRadians = 37 * M_PI / 180;
    drawArc0003.radius = 30;
    drawArc0003.width = 22;
    drawArc0003.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(577.5, 790);
    drawLine0007.endPoint = CGPointMake(581.5, 776);
    drawLine0007.width = 22;
    drawLine0007.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Hakushima
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"白島駅";
    station0005.nameEnglish = @"Hakushima";
    station0005.mapLocation = CGPointMake(581.5, 776);
    station0005.geoLocation = CGPointMake(34.411111, 132.462778);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0005.mapLocation;
    fillCircle0007.radius = 8;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0007];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(500, 760);
    drawLine0046.endPoint = CGPointMake(568, 760);
    drawLine0046.width = 40;
    drawLine0046.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0005.nameOriginalTextPrimitives addObject:drawLine0046];
    
    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(449, 730);
    drawLine0047.endPoint = CGPointMake(572, 730);
    drawLine0047.width = 25;
    drawLine0047.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0005.nameEnglishTextPrimitives addObject:drawLine0047];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = @"白島";
    drawTextLine0009.fontName = @"HelveticaNeue-Bold";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 36;
    drawTextLine0009.degrees = 0;
    drawTextLine0009.origin = CGPointMake(498, 737);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0009];
    
    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0005.nameEnglish;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor grayColor];
    drawTextLine0010.fontSize = 24;
    drawTextLine0010.degrees = 0;
    drawTextLine0010.origin = CGPointMake(450, 715);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 800;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(581.5, 776.5);
    drawLine0008.endPoint = CGPointMake(598.5, 709);
    drawLine0008.width = 22;
    drawLine0008.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Ushita
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"牛田駅 (ビッグウェーブ前)";
    station0006.nameEnglish = @"Ushita";
    station0006.mapLocation = CGPointMake(598.5, 709);
    station0006.geoLocation = CGPointMake(34.4175, 132.464722);

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0006.mapLocation;
    fillCircle0008.radius = 8;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = @"牛田";
    drawTextLine0011.fontName = @"HelveticaNeue-Bold";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 36;
    drawTextLine0011.degrees = 0;
    drawTextLine0011.origin = CGPointMake(615, 687);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0011];
    
    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0006.nameEnglish;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor grayColor];
    drawTextLine0012.fontSize = 24;
    drawTextLine0012.degrees = 0;
    drawTextLine0012.origin = CGPointMake(620, 665);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0012];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = @"(ビッグウェーブ前)";
    drawTextLine0013.fontName = @"HelveticaNeue-Bold";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 16;
    drawTextLine0013.degrees = 0;
    drawTextLine0013.origin = CGPointMake(615, 726);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0013];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1100;
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(598.5, 709.5);
    drawLine0009.endPoint = CGPointMake(601, 699);
    drawLine0009.width = 22;
    drawLine0009.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0009];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(562, 689);
    drawArc0004.startRadians = 352 * M_PI / 180;
    drawArc0004.endRadians = 15 * M_PI / 180;
    drawArc0004.radius = 40;
    drawArc0004.width = 22;
    drawArc0004.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawArc0004];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(661, 674);
    drawArc0005.startRadians = 170 * M_PI / 180;
    drawArc0005.endRadians = 220 * M_PI / 180;
    drawArc0005.radius = 60;
    drawArc0005.width = 22;
    drawArc0005.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(614.5, 636);
    drawLine0010.endPoint = CGPointMake(638, 609);
    drawLine0010.width = 22;
    drawLine0010.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Fudōin-mae
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"不動院前駅 (比治山大学前)";
    station0007.nameEnglish = @"Fudōin-mae";
    station0007.mapLocation = CGPointMake(638, 609);
    station0007.geoLocation = CGPointMake(34.427, 132.4692);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0007.mapLocation;
    fillCircle0009.radius = 8;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0009];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = @"不動院前";
    drawTextLine0014.fontName = @"HelveticaNeue-Bold";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 36;
    drawTextLine0014.degrees = 0;
    drawTextLine0014.origin = CGPointMake(656, 589);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0014];
    
    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0007.nameEnglish;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor grayColor];
    drawTextLine0015.fontSize = 24;
    drawTextLine0015.degrees = 0;
    drawTextLine0015.origin = CGPointMake(661, 567);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0015];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = @"(比治山大学前)";
    drawTextLine0016.fontName = @"HelveticaNeue-Bold";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 16;
    drawTextLine0016.degrees = 0;
    drawTextLine0016.origin = CGPointMake(661, 632);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0016];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 1000;
    [edge0001.elements addObject:haul0007];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(613, 592);
    drawArc0006.startRadians = 350 * M_PI / 180;
    drawArc0006.endRadians = 36 * M_PI / 180;
    drawArc0006.radius = 30;
    drawArc0006.width = 22;
    drawArc0006.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawArc0006];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(639, 549);
    drawLine0011.endPoint = CGPointMake(643, 588);
    drawLine0011.width = 22;
    drawLine0011.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0011];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(669, 548);
    drawArc0007.startRadians = 172 * M_PI / 180;
    drawArc0007.endRadians = 216 * M_PI / 180;
    drawArc0007.radius = 30;
    drawArc0007.width = 22;
    drawArc0007.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(653.5, 518.5);
    drawLine0012.endPoint = CGPointMake(644, 531);
    drawLine0012.width = 22;
    drawLine0012.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию Gion-shinbashi-kita
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"祇園新橋北駅";
    station0008.nameEnglish = @"Gion-shinbashi-kita";
    station0008.mapLocation = CGPointMake(653.5, 518.5);
    station0008.geoLocation = CGPointMake(34.435, 132.4708);
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0008.mapLocation;
    fillCircle0010.radius = 8;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0010];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(655, 556);
    drawLine0048.endPoint = CGPointMake(805, 556);
    drawLine0048.width = 30;
    drawLine0048.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0008.nameOriginalTextPrimitives addObject:drawLine0048];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(660, 540);
    drawLine0051.endPoint = CGPointMake(805, 540);
    drawLine0051.width = 20;
    drawLine0051.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0008.nameOriginalTextPrimitives addObject:drawLine0051];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(676, 516);
    drawLine0049.endPoint = CGPointMake(785, 516);
    drawLine0049.width = 25;
    drawLine0049.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0008.nameEnglishTextPrimitives addObject:drawLine0049];

    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(690, 493);
    drawLine0050.endPoint = CGPointMake(800, 493);
    drawLine0050.width = 25;
    drawLine0050.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0008.nameEnglishTextPrimitives addObject:drawLine0050];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = @"祇園新橋北";
    drawTextLine0017.fontName = @"HelveticaNeue-Bold";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 30;
    drawTextLine0017.degrees = 0;
    drawTextLine0017.origin = CGPointMake(656, 527);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0017];
    
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = @"Gion-shin-";
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor grayColor];
    drawTextLine0018.fontSize = 24;
    drawTextLine0018.degrees = 0;
    drawTextLine0018.origin = CGPointMake(686, 479);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0018];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = @"bashi-kita";
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor grayColor];
    drawTextLine0027.fontSize = 24;
    drawTextLine0027.degrees = 0;
    drawTextLine0027.origin = CGPointMake(676, 502);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0027];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 1000;
    [edge0001.elements addObject:haul0008];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(671.5, 489.5);
    drawLine0013.endPoint = CGPointMake(652.5, 520);
    drawLine0013.width = 22;
    drawLine0013.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0013];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(567, 430);
    drawArc0008.startRadians = 15 * M_PI / 180;
    drawArc0008.endRadians = 30 * M_PI / 180;
    drawArc0008.radius = 120;
    drawArc0008.width = 22;
    drawArc0008.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(688.5, 433);
    drawLine0014.endPoint = CGPointMake(683, 462);
    drawLine0014.width = 22;
    drawLine0014.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0014];
    
    // Добавляем станцию Nishihara
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"西原駅";
    station0009.nameEnglish = @"Nishihara";
    station0009.mapLocation = CGPointMake(688.5, 433);
    station0009.geoLocation = CGPointMake(34.443056, 132.474722);
    
    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0009.mapLocation;
    fillCircle0011.radius = 8;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0011];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = @"西原";
    drawTextLine0019.fontName = @"HelveticaNeue-Bold";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 36;
    drawTextLine0019.degrees = 0;
    drawTextLine0019.origin = CGPointMake(703, 409);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0019];
    
    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0009.nameEnglish;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor grayColor];
    drawTextLine0020.fontSize = 24;
    drawTextLine0020.degrees = 0;
    drawTextLine0020.origin = CGPointMake(708, 389);
    [station0009.nameEnglishTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 1000;
    [edge0001.elements addObject:haul0009];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(688.5, 433.5);
    drawLine0015.endPoint = CGPointMake(706.5, 342.5);
    drawLine0015.width = 22;
    drawLine0015.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0015];

    // Добавляем станцию Nakasuji
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0001.elements addObject:station0010];
    
    station0010.nameOriginal = @"中筋駅";
    station0010.nameEnglish = @"Nakasuji";
    station0010.mapLocation = CGPointMake(706.5, 342.5);
    station0010.geoLocation = CGPointMake(34.4517, 132.4768);
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0010.mapLocation;
    fillCircle0012.radius = 8;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0012];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(730, 316);
    drawLine0052.endPoint = CGPointMake(810, 316);
    drawLine0052.width = 25;
    drawLine0052.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0010.nameEnglishTextPrimitives addObject:drawLine0052];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = @"中筋";
    drawTextLine0021.fontName = @"HelveticaNeue-Bold";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 36;
    drawTextLine0021.degrees = 0;
    drawTextLine0021.origin = CGPointMake(722, 319);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0021];
    
    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0010.nameEnglish;
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor grayColor];
    drawTextLine0022.fontSize = 20;
    drawTextLine0022.degrees = 0;
    drawTextLine0022.origin = CGPointMake(730, 302);
    [station0010.nameEnglishTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 800;
    [edge0001.elements addObject:haul0010];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(712.5, 319);
    drawLine0016.endPoint = CGPointMake(706, 343.5);
    drawLine0016.width = 22;
    drawLine0016.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0016];

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(683, 314);
    drawArc0009.startRadians = 322 * M_PI / 180;
    drawArc0009.endRadians = 12 * M_PI / 180;
    drawArc0009.radius = 30;
    drawArc0009.width = 22;
    drawArc0009.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawArc0009];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(693, 276);
    drawLine0017.endPoint = CGPointMake(709, 299);
    drawLine0017.width = 22;
    drawLine0017.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0017];

    // Добавляем станцию Furuichi
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0001.elements addObject:station0011];
    
    station0011.nameOriginal = @"古市駅";
    station0011.nameEnglish = @"Furuichi";
    station0011.mapLocation = CGPointMake(693, 276);
    station0011.geoLocation = CGPointMake(34.457778, 132.475278);

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0011.mapLocation;
    fillCircle0013.radius = 8;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0013];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = @"古市";
    drawTextLine0023.fontName = @"HelveticaNeue-Bold";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 36;
    drawTextLine0023.degrees = 0;
    drawTextLine0023.origin = CGPointMake(717, 254);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0023];
    
    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = station0011.nameEnglish;
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor grayColor];
    drawTextLine0024.fontSize = 24;
    drawTextLine0024.degrees = 0;
    drawTextLine0024.origin = CGPointMake(700, 234);
    [station0011.nameEnglishTextPrimitives addObject:drawTextLine0024];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 600;
    [edge0001.elements addObject:haul0011];
    
    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(671, 251);
    drawLine0018.endPoint = CGPointMake(694, 277);
    drawLine0018.width = 22;
    drawLine0018.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0018];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(649, 271);
    drawArc0010.startRadians = 310 * M_PI / 180;
    drawArc0010.endRadians = 320 * M_PI / 180;
    drawArc0010.radius = 30;
    drawArc0010.width = 22;
    drawArc0010.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawArc0010];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(650.5, 233.5);
    drawLine0019.endPoint = CGPointMake(669, 249);
    drawLine0019.width = 22;
    drawLine0019.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0019];

    // Добавляем станцию Ōmachi
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0001.elements addObject:station0012];
    
    station0012.nameOriginal = @"大町駅";
    station0012.nameEnglish = @"Ōmachi";
    station0012.mapLocation = CGPointMake(650.5, 233.5);
    station0012.geoLocation = CGPointMake(34.461389, 132.470556);

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0012.mapLocation;
    fillCircle0014.radius = 13;
    fillCircle0014.fillColor = [UIColor blackColor];
    [station0012.drawPrimitives addObject:fillCircle0014];
    
    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0012.mapLocation;
    fillCircle0015.radius = 10;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0015];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"大町";
    drawTextLine0025.fontName = @"HelveticaNeue-Bold";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 40;
    drawTextLine0025.degrees = 0;
    drawTextLine0025.origin = CGPointMake(675, 194);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0025];
    
    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0012.nameEnglish;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor grayColor];
    drawTextLine0026.fontSize = 24;
    drawTextLine0026.degrees = 0;
    drawTextLine0026.origin = CGPointMake(702, 172);
    [station0012.nameEnglishTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1200;
    [edge0001.elements addObject:haul0012];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(622, 215);
    drawLine0020.endPoint = CGPointMake(650.5, 233.5);
    drawLine0020.width = 22;
    drawLine0020.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0020];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(673, 153);
    drawArc0011.startRadians = 125 * M_PI / 180;
    drawArc0011.endRadians = 170 * M_PI / 180;
    drawArc0011.radius = 80;
    drawArc0011.width = 22;
    drawArc0011.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawArc0011];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(565, 173);
    drawArc0012.startRadians = 305 * M_PI / 180;
    drawArc0012.endRadians = 350 * M_PI / 180;
    drawArc0012.radius = 30;
    drawArc0012.width = 22;
    drawArc0012.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawArc0012];

    // Добавляем станцию Bishamondai
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0001.elements addObject:station0013];

    station0013.nameOriginal = @"毘沙門台駅";
    station0013.nameEnglish = @"Bishamondai";
    station0013.mapLocation = CGPointMake(583.5, 149.5);
    station0013.geoLocation = CGPointMake(34.4693, 132.4626);
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0013.mapLocation;
    fillCircle0016.radius = 8;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0016];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(610, 150);
    drawLine0053.endPoint = CGPointMake(740, 150);
    drawLine0053.width = 40;
    drawLine0053.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0013.nameOriginalTextPrimitives addObject:drawLine0053];
    
    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(700, 118);
    drawLine0054.endPoint = CGPointMake(770, 118);
    drawLine0054.width = 25;
    drawLine0054.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.8];
    [station0013.nameEnglishTextPrimitives addObject:drawLine0054];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"毘沙門台";
    drawTextLine0028.fontName = @"HelveticaNeue-Bold";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 36;
    drawTextLine0028.degrees = 0;
    drawTextLine0028.origin = CGPointMake(605, 126);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0028];
    
    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0013.nameEnglish;
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor grayColor];
    drawTextLine0029.fontSize = 24;
    drawTextLine0029.degrees = 0;
    drawTextLine0029.origin = CGPointMake(606, 104);
    [station0013.nameEnglishTextPrimitives addObject:drawTextLine0029];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 1000;
    [edge0001.elements addObject:haul0013];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(584, 150);
    drawLine0021.endPoint = CGPointMake(497, 89);
    drawLine0021.width = 22;
    drawLine0021.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0021];

    // Добавляем станцию Yasuhigashi
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0001.elements addObject:station0014];
    
    station0014.nameOriginal = @"安東駅 (安田女子大学前)";
    station0014.nameEnglish = @"Yasuhigashi";
    station0014.mapLocation = CGPointMake(497, 89);
    station0014.geoLocation = CGPointMake(34.475, 132.453);
    
    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0014.mapLocation;
    fillCircle0017.radius = 8;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0017];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"安東";
    drawTextLine0030.fontName = @"HelveticaNeue-Bold";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 36;
    drawTextLine0030.degrees = 0;
    drawTextLine0030.origin = CGPointMake(510, 44);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0030];
    
    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = station0014.nameEnglish;
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor grayColor];
    drawTextLine0031.fontSize = 24;
    drawTextLine0031.degrees = 0;
    drawTextLine0031.origin = CGPointMake(510, 22);
    [station0014.nameEnglishTextPrimitives addObject:drawTextLine0031];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = @"(安田女子大学前)";
    drawTextLine0032.fontName = @"HelveticaNeue-Bold";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 16;
    drawTextLine0032.degrees = 0;
    drawTextLine0032.origin = CGPointMake(585, 56);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0032];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 800;
    [edge0001.elements addObject:haul0014];
    
    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(487, 82);
    drawLine0022.endPoint = CGPointMake(497, 89);
    drawLine0022.width = 22;
    drawLine0022.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0022];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(471, 107);
    drawArc0013.startRadians = 266 * M_PI / 180;
    drawArc0013.endRadians = 305 * M_PI / 180;
    drawArc0013.radius = 30;
    drawArc0013.width = 22;
    drawArc0013.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawArc0013];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(422.5, 82);
    drawLine0023.endPoint = CGPointMake(470, 77);
    drawLine0023.width = 22;
    drawLine0023.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0023];

    // Добавляем станцию Kamiyasu
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0001.elements addObject:station0015];
    
    station0015.nameOriginal = @"上安駅 (動物公園口)";
    station0015.nameEnglish = @"Kamiyasu";
    station0015.mapLocation = CGPointMake(422.5, 82);
    station0015.geoLocation = CGPointMake(34.4757, 132.4449);
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0015.mapLocation;
    fillCircle0018.radius = 8;
    fillCircle0018.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = @"上安";
    drawTextLine0033.fontName = @"HelveticaNeue-Bold";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 36;
    drawTextLine0033.degrees = 0;
    drawTextLine0033.origin = CGPointMake(395, 22);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0033];
    
    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0015.nameEnglish;
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor grayColor];
    drawTextLine0034.fontSize = 24;
    drawTextLine0034.degrees = 0;
    drawTextLine0034.origin = CGPointMake(395, 0);
    [station0015.nameEnglishTextPrimitives addObject:drawTextLine0034];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 600;
    [edge0001.elements addObject:haul0015];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(361.5, 88.5);
    drawLine0024.endPoint = CGPointMake(423, 82);
    drawLine0024.width = 22;
    drawLine0024.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Takatori
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0001.elements addObject:station0016];
    
    station0016.nameOriginal = @"高取駅";
    station0016.nameEnglish = @"Takatori";
    station0016.mapLocation = CGPointMake(361.5, 88.5);
    station0016.geoLocation = CGPointMake(34.4753, 132.4383);
    
    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0016.mapLocation;
    fillCircle0019.radius = 8;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0019];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = @"高取";
    drawTextLine0035.fontName = @"HelveticaNeue-Bold";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 36;
    drawTextLine0035.degrees = 0;
    drawTextLine0035.origin = CGPointMake(300, 32);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0035];
    
    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = station0016.nameEnglish;
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor grayColor];
    drawTextLine0036.fontSize = 24;
    drawTextLine0036.degrees = 0;
    drawTextLine0036.origin = CGPointMake(288, 10);
    [station0016.nameEnglishTextPrimitives addObject:drawTextLine0036];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 700;
    [edge0001.elements addObject:haul0016];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(381, 207);
    drawArc0014.startRadians = 246 * M_PI / 180;
    drawArc0014.endRadians = 262 * M_PI / 180;
    drawArc0014.radius = 120;
    drawArc0014.width = 22;
    drawArc0014.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(300, 112);
    drawLine0025.endPoint = CGPointMake(333, 97);
    drawLine0025.width = 22;
    drawLine0025.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0025];

    // Добавляем станцию Chōrakuji
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0001.elements addObject:station0017];
    
    station0017.nameOriginal = @"長楽寺駅 (交通科学館前)";
    station0017.nameEnglish = @"Chōrakuji";
    station0017.mapLocation = CGPointMake(300, 112);
    station0017.geoLocation = CGPointMake(34.4727, 132.431);
    
    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0017.mapLocation;
    fillCircle0020.radius = 13;
    fillCircle0020.fillColor = [UIColor blackColor];
    [station0017.drawPrimitives addObject:fillCircle0020];
    
    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0017.mapLocation;
    fillCircle0021.radius = 10;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0017.drawPrimitives addObject:fillCircle0021];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"長楽寺";
    drawTextLine0037.fontName = @"HelveticaNeue-Bold";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 36;
    drawTextLine0037.degrees = 0;
    drawTextLine0037.origin = CGPointMake(296, 121);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0037];
    
    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = station0017.nameEnglish;
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor grayColor];
    drawTextLine0038.fontSize = 24;
    drawTextLine0038.degrees = 0;
    drawTextLine0038.origin = CGPointMake(296, 160);
    [station0017.nameEnglishTextPrimitives addObject:drawTextLine0038];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = @"(交通科学館前)";
    drawTextLine0039.fontName = @"HelveticaNeue-Bold";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 16;
    drawTextLine0039.degrees = 0;
    drawTextLine0039.origin = CGPointMake(407, 133);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0039];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 1200;
    [edge0001.elements addObject:haul0017];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(292, 116);
    drawLine0026.endPoint = CGPointMake(300.5, 111.5);
    drawLine0026.width = 22;
    drawLine0026.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0026];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(281, 88);
    drawArc0016.startRadians = 66 * M_PI / 180;
    drawArc0016.endRadians = 90 * M_PI / 180;
    drawArc0016.radius = 30;
    drawArc0016.width = 22;
    drawArc0016.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawArc0016];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(282, 118);
    drawLine0027.endPoint = CGPointMake(275, 118);
    drawLine0027.width = 22;
    drawLine0027.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0027];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(276, 148);
    drawArc0015.startRadians = 240 * M_PI / 180;
    drawArc0015.endRadians = 270 * M_PI / 180;
    drawArc0015.radius = 30;
    drawArc0015.width = 22;
    drawArc0015.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(262, 122);
    drawLine0028.endPoint = CGPointMake(253, 128);
    drawLine0028.width = 22;
    drawLine0028.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0028];

    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(194, 24);
    drawArc0017.startRadians = 60 * M_PI / 180;
    drawArc0017.endRadians = 90 * M_PI / 180;
    drawArc0017.radius = 120;
    drawArc0017.width = 22;
    drawArc0017.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawArc0017];

    // Добавляем станцию Tomo
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0001.elements addObject:station0018];

    station0018.nameOriginal = @"伴駅 (広陵学園前)";
    station0018.nameEnglish = @"Tomo";
    station0018.mapLocation = CGPointMake(194.5, 143.5);
    station0018.geoLocation = CGPointMake(34.4699, 132.4198);
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0018.mapLocation;
    fillCircle0022.radius = 8;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = @"伴";
    drawTextLine0040.fontName = @"HelveticaNeue-Bold";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 36;
    drawTextLine0040.degrees = 0;
    drawTextLine0040.origin = CGPointMake(176, 62);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0040];
    
    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0018.nameEnglish;
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor grayColor];
    drawTextLine0041.fontSize = 24;
    drawTextLine0041.degrees = 0;
    drawTextLine0041.origin = CGPointMake(165, 39);
    [station0018.nameEnglishTextPrimitives addObject:drawTextLine0041];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = @"(広陵学園前)";
    drawTextLine0042.fontName = @"HelveticaNeue-Bold";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 16;
    drawTextLine0042.degrees = 0;
    drawTextLine0042.origin = CGPointMake(150, 105);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0042];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1000;
    [edge0001.elements addObject:haul0018];

    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(194, 174);
    drawArc0018.startRadians = 215 * M_PI / 180;
    drawArc0018.endRadians = 270 * M_PI / 180;
    drawArc0018.radius = 30;
    drawArc0018.width = 22;
    drawArc0018.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(170, 156);
    drawLine0029.endPoint = CGPointMake(151, 186);
    drawLine0029.width = 22;
    drawLine0029.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0029];

    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(204, 215);
    drawArc0019.startRadians = 190 * M_PI / 180;
    drawArc0019.endRadians = 210 * M_PI / 180;
    drawArc0019.radius = 60;
    drawArc0019.width = 22;
    drawArc0019.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0019];

    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(116, 195);
    drawArc0020.startRadians = 10 * M_PI / 180;
    drawArc0020.endRadians = 45 * M_PI / 180;
    drawArc0020.radius = 30;
    drawArc0020.width = 22;
    drawArc0020.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0020];

    // Добавляем станцию Ōbara
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0001.elements addObject:station0019];
    
    station0019.nameOriginal = @"大原駅";
    station0019.nameEnglish = @"Ōbara";
    station0019.mapLocation = CGPointMake(137, 217);
    station0019.geoLocation = CGPointMake(34.463056, 132.412778);
    
    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0019.mapLocation;
    fillCircle0023.radius = 8;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0023];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = @"大原";
    drawTextLine0043.fontName = @"HelveticaNeue-Bold";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 36;
    drawTextLine0043.degrees = 0;
    drawTextLine0043.origin = CGPointMake(31, 194);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0043];
    
    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = station0019.nameEnglish;
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor grayColor];
    drawTextLine0044.fontSize = 24;
    drawTextLine0044.degrees = 0;
    drawTextLine0044.origin = CGPointMake(39, 171);
    [station0019.nameEnglishTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1100;
    [edge0001.elements addObject:haul0019];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(85.5, 266);
    drawLine0030.endPoint = CGPointMake(138, 216);
    drawLine0030.width = 22;
    drawLine0030.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0030];

    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(106, 288);
    drawArc0021.startRadians = 200 * M_PI / 180;
    drawArc0021.endRadians = 228 * M_PI / 180;
    drawArc0021.radius = 30;
    drawArc0021.width = 22;
    drawArc0021.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawArc0021];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(78, 277);
    drawLine0031.endPoint = CGPointMake(72, 295.5);
    drawLine0031.width = 22;
    drawLine0031.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0031];

    // Добавляем станцию Tomo-chūō
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0001.elements addObject:station0020];
    
    station0020.nameOriginal = @"伴中央駅";
    station0020.nameEnglish = @"Tomo-chūō";
    station0020.mapLocation = CGPointMake(72, 295.5);
    station0020.geoLocation = CGPointMake(34.4556, 132.4051);
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0020.mapLocation;
    fillCircle0024.radius = 8;
    fillCircle0024.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = @"伴中央";
    drawTextLine0045.fontName = @"HelveticaNeue-Bold";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 36;
    drawTextLine0045.degrees = 0;
    drawTextLine0045.origin = CGPointMake(91, 273);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0045];
    
    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = station0020.nameEnglish;
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor grayColor];
    drawTextLine0046.fontSize = 24;
    drawTextLine0046.degrees = 0;
    drawTextLine0046.origin = CGPointMake(122, 250);
    [station0020.nameEnglishTextPrimitives addObject:drawTextLine0046];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 1600;
    [edge0001.elements addObject:haul0020];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(72, 295);
    drawLine0032.endPoint = CGPointMake(63, 325);
    drawLine0032.width = 22;
    drawLine0032.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0032];

    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(121, 340);
    drawArc0022.startRadians = 182 * M_PI / 180;
    drawArc0022.endRadians = 195 * M_PI / 180;
    drawArc0022.radius = 60;
    drawArc0022.width = 22;
    drawArc0022.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawArc0022];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(61, 335);
    drawLine0033.endPoint = CGPointMake(61, 384.5);
    drawLine0033.width = 22;
    drawLine0033.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0033];

    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(91, 385);
    drawArc0023.startRadians = 165 * M_PI / 180;
    drawArc0023.endRadians = 182 * M_PI / 180;
    drawArc0023.radius = 30;
    drawArc0023.width = 22;
    drawArc0023.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawArc0023];

    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(31.5, 395);
    drawArc0024.startRadians = 350 * M_PI / 180;
    drawArc0024.endRadians = 25 * M_PI / 180;
    drawArc0024.radius = 30;
    drawArc0024.width = 22;
    drawArc0024.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawArc0024];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(60, 405);
    drawLine0034.endPoint = CGPointMake(49.5, 450);
    drawLine0034.width = 22;
    drawLine0034.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию Ōzuka
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0001.elements addObject:station0021];

    station0021.nameOriginal = @"大塚駅 (市立大学口)";
    station0021.nameEnglish = @"Ōzuka";
    station0021.mapLocation = CGPointMake(49.5, 450);
    station0021.geoLocation = CGPointMake(34.441389, 132.402778);
    
    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0021.mapLocation;
    fillCircle0025.radius = 8;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0025];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = @"大塚";
    drawTextLine0047.fontName = @"HelveticaNeue-Bold";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 36;
    drawTextLine0047.degrees = 0;
    drawTextLine0047.origin = CGPointMake(70, 428);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0047];
    
    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0021.nameEnglish;
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor grayColor];
    drawTextLine0048.fontSize = 24;
    drawTextLine0048.degrees = 0;
    drawTextLine0048.origin = CGPointMake(78, 405);
    [station0021.nameEnglishTextPrimitives addObject:drawTextLine0048];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = @"(市立大学口)";
    drawTextLine0049.fontName = @"HelveticaNeue-Bold";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 16;
    drawTextLine0049.degrees = 0;
    drawTextLine0049.origin = CGPointMake(70, 470);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0049];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 800;
    [edge0001.elements addObject:haul0021];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(50, 449);
    drawLine0035.endPoint = CGPointMake(44.5, 466);
    drawLine0035.width = 22;
    drawLine0035.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0035];

    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(73, 475);
    drawArc0025.startRadians = 190 * M_PI / 180;
    drawArc0025.endRadians = 200 * M_PI / 180;
    drawArc0025.radius = 30;
    drawArc0025.width = 22;
    drawArc0025.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawArc0025];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(44, 468);
    drawLine0036.endPoint = CGPointMake(42, 487);
    drawLine0036.width = 22;
    drawLine0036.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0036];

    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(13, 480);
    drawArc0026.startRadians = 10 * M_PI / 180;
    drawArc0026.endRadians = 30 * M_PI / 180;
    drawArc0026.radius = 30;
    drawArc0026.width = 22;
    drawArc0026.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawArc0026];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(40, 494);
    drawLine0037.endPoint = CGPointMake(26.5, 516);
    drawLine0037.width = 22;
    drawLine0037.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0037];

    // Добавляем станцию Kōiki-kōen-mae
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0001.elements addObject:station0022];
    
    station0022.nameOriginal = @"広域公園前駅（修道大学前)";
    station0022.nameEnglish = @"Kōiki-kōen-mae";
    station0022.mapLocation = CGPointMake(26.5, 516);
    station0022.geoLocation = CGPointMake(34.4354, 132.4003);

    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0022.mapLocation;
    fillCircle0026.radius = 13;
    fillCircle0026.fillColor = [UIColor blackColor];
    [station0022.drawPrimitives addObject:fillCircle0026];
    
    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0022.mapLocation;
    fillCircle0027.radius = 10;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [station0022.drawPrimitives addObject:fillCircle0027];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = @"広域公園前";
    drawTextLine0050.fontName = @"HelveticaNeue-Bold";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 40;
    drawTextLine0050.degrees = 0;
    drawTextLine0050.origin = CGPointMake(11, 530);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0050];
    
    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = station0022.nameEnglish;
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor grayColor];
    drawTextLine0051.fontSize = 24;
    drawTextLine0051.degrees = 0;
    drawTextLine0051.origin = CGPointMake(48, 507);
    [station0022.nameEnglishTextPrimitives addObject:drawTextLine0051];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = @"（修道大学前)";
    drawTextLine0052.fontName = @"HelveticaNeue-Bold";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 16;
    drawTextLine0052.degrees = 0;
    drawTextLine0052.origin = CGPointMake(214, 544);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0052];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    return self;
}
    
@end
