//
//  MMMedellinMetro.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 29.01.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWMedellinMetro.h"
#import "MWLine.h"
#import "MWVertex.h"
#import "MWEdge.h"
#import "MWHaul.h"
#import "MWDrawLine.h"
#import "MWDrawTextLine.h"
#import "MWDrawFillCircle.h"
#import "MWDrawArc.h"

@implementation MWMedellinMetro

- (id)init
{
    // Инициализируем
    self = [super init];
    
    self.identifier = @"medellin_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // Line A
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Line A (Metro)";
    line0001.color = [UIColor colorWithRed:(48/255.0) green:(67/255.0) blue:(148/255.0) alpha:1];
    [self.lines addObject:line0001];

    // Line B
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"Line B (Metro)";
    line0002.color = [UIColor colorWithRed:(248/255.0) green:(83/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0002];
    
    // Line J
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"Line J (Metrocable)";
    line0003.color = [UIColor colorWithRed:(254/255.0) green:(167/255.0) blue:(51/255.0) alpha:1];
    [self.lines addObject:line0003];

    // Line K
    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"Line K (Metrocable)";
    line0004.color = [UIColor colorWithRed:(153/255.0) green:(182/255.0) blue:(51/255.0) alpha:1];
    [self.lines addObject:line0004];
    
    // Line L
    MWLine *line0005 = [[MWLine alloc] init];
    line0005.identifier = @"line0005";
    line0005.nameOriginal = @"Line L (Metrocable)";
    line0005.color = [UIColor colorWithRed:(121/255.0) green:(67/255.0) blue:(15/255.0) alpha:1];
    [self.lines addObject:line0005];
    
    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0004];
    [self.drawLinesOrder addObject:line0005];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Nuquia
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Niquia";
    [self.vertices addObject:vertex0001];
    
    // Acevedo
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Acevedo";
    [self.vertices addObject:vertex0002];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(455, 437.5);
    drawLine0004.endPoint = CGPointMake(474.5, 430);
    drawLine0004.width = 19;
    drawLine0004.color = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:drawLine0004];

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = CGPointMake(455, 437.5);
    fillCircle0009.radius = 9.5;
    fillCircle0009.fillColor = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:fillCircle0009];

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = CGPointMake(474.5, 430);
    fillCircle0008.radius = 9.5;
    fillCircle0008.fillColor = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:fillCircle0008];\
    
    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(455, 437.5);
    drawLine0005.endPoint = CGPointMake(474.5, 430);
    drawLine0005.width = 15;
    drawLine0005.color = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:drawLine0005];
    
    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = CGPointMake(455, 437.5);
    fillCircle0005.radius = 7.5;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0005];
    
    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = CGPointMake(455, 437.5);
    fillCircle0004.radius = 4.5;
    fillCircle0004.fillColor = line0001.color;
    [vertex0002.drawPrimitives addObject:fillCircle0004];
    
    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = CGPointMake(474.5, 430);
    fillCircle0006.radius = 7.5;
    fillCircle0006.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0006];
    
    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = CGPointMake(474.5, 430);
    fillCircle0007.radius = 4.5;
    fillCircle0007.fillColor = line0004.color;
    [vertex0002.drawPrimitives addObject:fillCircle0007];
    
    // San Antonio
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"San Antonio";
    [self.vertices addObject:vertex0003];
    
    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(601.5, 1085);
    drawLine0037.endPoint = CGPointMake(581, 1085);
    drawLine0037.width = 19;
    drawLine0037.color = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:drawLine0037];
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = CGPointMake(601.5, 1085);
    fillCircle0052.radius = 9.5;
    fillCircle0052.fillColor = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:fillCircle0052];
    
    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = CGPointMake(581, 1085);
    fillCircle0053.radius = 9.5;
    fillCircle0053.fillColor = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:fillCircle0053];
    
    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(601.5, 1085);
    drawLine0036.endPoint = CGPointMake(581, 1085);
    drawLine0036.width = 15;
    drawLine0036.color = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:drawLine0036];
    
    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = CGPointMake(581, 1085);
    fillCircle0054.radius = 7.5;
    fillCircle0054.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0054];
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = CGPointMake(601.5, 1085);
    fillCircle0056.radius = 7.5;
    fillCircle0056.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0056];
    
    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = CGPointMake(601.5, 1085);
    fillCircle0055.radius = 4.5;
    fillCircle0055.fillColor = line0001.color;
    [vertex0003.drawPrimitives addObject:fillCircle0055];

    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = CGPointMake(581, 1085);
    fillCircle0057.radius = 4.5;
    fillCircle0057.fillColor = line0002.color;
    [vertex0003.drawPrimitives addObject:fillCircle0057];
    
    // Itagüí
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Itagüí";
    [self.vertices addObject:vertex0004];

    // San Javier
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"San Javier";
    [self.vertices addObject:vertex0005];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(76.5, 1085);
    drawLine0038.endPoint = CGPointMake(56.5, 1085);
    drawLine0038.width = 19;
    drawLine0038.color = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:drawLine0038];
    
    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = CGPointMake(76.5, 1085);
    fillCircle0058.radius = 9.5;
    fillCircle0058.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0058];
    
    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = CGPointMake(56.5, 1085);
    fillCircle0059.radius = 9.5;
    fillCircle0059.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0059];
    
    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(76.5, 1085);
    drawLine0039.endPoint = CGPointMake(56.5, 1085);
    drawLine0039.width = 15;
    drawLine0039.color = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:drawLine0039];
    
    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = CGPointMake(76.5, 1085);
    fillCircle0060.radius = 7.5;
    fillCircle0060.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0060];
    
    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = CGPointMake(56.5, 1085);
    fillCircle0061.radius = 7.5;
    fillCircle0061.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0061];
    
    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = CGPointMake(76.5, 1085);
    fillCircle0062.radius = 4.5;
    fillCircle0062.fillColor = line0002.color;
    [vertex0005.drawPrimitives addObject:fillCircle0062];
    
    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = CGPointMake(56.5, 1085);
    fillCircle0063.radius = 4.5;
    fillCircle0063.fillColor = line0003.color;
    [vertex0005.drawPrimitives addObject:fillCircle0063];
    
    // La Aurora
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"La Aurora";
    [self.vertices addObject:vertex0006];

    // Santo Domingo Savio
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Santo Domingo Savio";
    [self.vertices addObject:vertex0007];
    
    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(894, 397.5);
    drawLine0040.endPoint = CGPointMake(894, 418);
    drawLine0040.width = 19;
    drawLine0040.color = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:drawLine0040];
    
    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = CGPointMake(894, 397.5);
    fillCircle0064.radius = 9.5;
    fillCircle0064.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0064];
    
    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = CGPointMake(894, 418);
    fillCircle0065.radius = 9.5;
    fillCircle0065.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0065];
    
    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(894, 397.5);
    drawLine0041.endPoint = CGPointMake(894, 418);
    drawLine0041.width = 15;
    drawLine0041.color = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:drawLine0041];
    
    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = CGPointMake(894, 397.5);
    fillCircle0066.radius = 7.5;
    fillCircle0066.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0066];
    
    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = CGPointMake(894, 418);
    fillCircle0067.radius = 7.5;
    fillCircle0067.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0067];
    
    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = CGPointMake(894, 397.5);
    fillCircle0068.radius = 4.5;
    fillCircle0068.fillColor = line0004.color;
    [vertex0007.drawPrimitives addObject:fillCircle0068];
    
    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = CGPointMake(894, 418);
    fillCircle0069.radius = 4.5;
    fillCircle0069.fillColor = line0005.color;
    [vertex0007.drawPrimitives addObject:fillCircle0069];
    
    // Arví
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Arví";
    [self.vertices addObject:vertex0008];
    
    ////////////////////////////////////////////////////////////////
    // Line A (Metro)
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Niquía" до "Acevedo"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Niquía - Acevedo";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию "Niquía"
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Niquía";
    station0001.mapLocation = CGPointMake(455, 146);
    station0001.geoLocation = CGPointMake(6.337944, -75.544492);

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(455, 146);
    drawArc0001.startRadians = M_PI;
    drawArc0001.endRadians = 0;
    drawArc0001.radius = 7.5;
    drawArc0001.width = 4;
    drawArc0001.color = line0001.color;
    [station0001.drawPrimitives addObject:drawArc0001];
    
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(455, 146);
    fillCircle0001.radius = 6.5;
    fillCircle0001.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0001];
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 32;
    drawTextLine0001.origin = CGPointMake(347, 126);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];
    
    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1357;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(455, 146);
    drawLine0001.endPoint = CGPointMake(455, 244.5);
    drawLine0001.width = 19;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];
    
    // Добавляем станцию "Bello"
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Bello";
    station0002.mapLocation = CGPointMake(455, 244.5);
    station0002.geoLocation = CGPointMake(6.330178, -75.553624);
    
    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = CGPointMake(455, 244.5);
    fillCircle0002.radius = 6.5;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0002];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0002.nameOriginal;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 32;
    drawTextLine0002.origin = CGPointMake(368, 224);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0002];
    
    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1615;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(455, 244);
    drawLine0002.endPoint = CGPointMake(455, 337.5);
    drawLine0002.width = 19;
    drawLine0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0002];
    
    // Добавляем станцию "Madera"
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Madera";
    station0003.mapLocation = CGPointMake(455, 337.5);
    station0003.geoLocation = CGPointMake(6.315973, -75.555339);
    
    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = CGPointMake(455, 337.5);
    fillCircle0003.radius = 6.5;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0003];
    
    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0003.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 32;
    drawTextLine0003.origin = CGPointMake(330, 319);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0003];
    
    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1829;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(455, 337);
    drawLine0003.endPoint = CGPointMake(455, 437.5);
    drawLine0003.width = 19;
    drawLine0003.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0003];
    
    // Добавляем станцию "Acevedo"
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Acevedo";
    station0004.mapLocation = CGPointMake(455, 437.5);
    station0004.geoLocation = CGPointMake(6.300315, -75.558409);

    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = CGPointMake(455, 437.5);
    fillCircle0016.radius = 6.5;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0016];
    
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0004.nameOriginal;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 32;
    drawTextLine0004.origin = CGPointMake(314, 422);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0004];
    
    // Добавляем вершину
    edge0001.finishVertex = vertex0002;
    
    // Создаем участок линии от "Acevedo" до "San Antonio"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Acevedo - San Antonio";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;
    
    // Добавляем станцию "Acevedo"
    [edge0002.elements addObject:station0004];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 1311;
    [edge0002.elements addObject:haul0004];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(455, 437);
    drawLine0006.endPoint = CGPointMake(455, 536.5);
    drawLine0006.width = 19;
    drawLine0006.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0006];
    
    // Добавляем станцию "Tricentenario";
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0002.elements addObject:station0005];
    
    station0005.nameOriginal = @"Tricentenario";
    station0005.mapLocation = CGPointMake(455, 536.5);
    station0005.geoLocation = CGPointMake(6.290504, -75.564579);
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = CGPointMake(455, 536.5);
    fillCircle0010.radius = 6.5;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0010];
    
    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0005.nameOriginal;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 32;
    drawTextLine0005.origin = CGPointMake(256, 519);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0005];
    
    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1493;
    [edge0002.elements addObject:haul0005];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(455, 536);
    drawLine0007.endPoint = CGPointMake(455, 639);
    drawLine0007.width = 19;
    drawLine0007.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0007];
    
    // Добавляем станцию "Caribe";
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0002.elements addObject:station0006];
    
    station0006.nameOriginal = @"Caribe";
    station0006.mapLocation = CGPointMake(455, 639);
    station0006.geoLocation = CGPointMake(6.278374, -75.569436);
    
    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = CGPointMake(455, 639);
    fillCircle0011.radius = 6.5;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0011];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0006.nameOriginal;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 32;
    drawTextLine0006.origin = CGPointMake(344, 623);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0006];
    
    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1302;
    [edge0002.elements addObject:haul0006];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(455, 638.5);
    drawLine0008.endPoint = CGPointMake(455, 703);
    drawLine0008.width = 19;
    drawLine0008.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0008];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(465, 702.5);
    drawArc0002.startRadians = 90 * M_PI / 180;
    drawArc0002.endRadians = 180 * M_PI / 180;
    drawArc0002.radius = 10;
    drawArc0002.width = 19;
    drawArc0002.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawArc0002];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(465, 712.5);
    drawLine0009.endPoint = CGPointMake(534, 712.5);
    drawLine0009.width = 19;
    drawLine0009.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0009];
    
    // Добавляем станцию "Universidad";
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0002.elements addObject:station0007];
    
    station0007.nameOriginal = @"Universidad";
    station0007.mapLocation = CGPointMake(534, 712.5);
    station0007.geoLocation = CGPointMake(6.269516, -75.565918);
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = CGPointMake(534, 712.5);
    fillCircle0012.radius = 6.5;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0012];
    
    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0007.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 32;
    drawTextLine0007.origin = CGPointMake(526, 665);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0007];
    
    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 830;
    [edge0002.elements addObject:haul0007];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(533.5, 712.5);
    drawLine0010.endPoint = CGPointMake(592, 712.5);
    drawLine0010.width = 19;
    drawLine0010.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0010];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(591.5, 722.5);
    drawArc0003.startRadians = 270 * M_PI / 180;
    drawArc0003.endRadians = 360 * M_PI / 180;
    drawArc0003.radius = 10;
    drawArc0003.width = 19;
    drawArc0003.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(601.5, 722);
    drawLine0011.endPoint = CGPointMake(601.5, 762);
    drawLine0011.width = 19;
    drawLine0011.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0011];
    
    // Добавляем станцию "Hospital";
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0002.elements addObject:station0008];
    
    station0008.nameOriginal = @"Hospital";
    station0008.mapLocation = CGPointMake(601.5, 762);
    station0008.geoLocation = CGPointMake(6.263919, -75.563364);
    
    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = CGPointMake(601.5, 762);
    fillCircle0013.radius = 6.5;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0013];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0008.nameOriginal;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 32;
    drawTextLine0008.origin = CGPointMake(618, 742);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0008];
    
    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 819;
    [edge0002.elements addObject:haul0008];
    
    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(601.5, 761.5);
    drawLine0012.endPoint = CGPointMake(601.5, 870.5);
    drawLine0012.width = 19;
    drawLine0012.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0012];
    
    // Добавляем станцию "Prado";
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0002.elements addObject:station0009];
    
    station0009.nameOriginal = @"Prado";
    station0009.mapLocation = CGPointMake(601.5, 870.5);
    station0009.geoLocation = CGPointMake(6.257049, -75.566123);

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = CGPointMake(601.5, 870.5);
    fillCircle0014.radius = 6.5;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0014];
    
    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0009.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 32;
    drawTextLine0009.origin = CGPointMake(618, 850.5);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0009];
    
    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 746;
    [edge0002.elements addObject:haul0009];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(601.5, 870);
    drawLine0013.endPoint = CGPointMake(601.5, 991.5);
    drawLine0013.width = 19;
    drawLine0013.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0013];
    
    // Добавляем станцию "Parque Berrío";
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0002.elements addObject:station0010];
    
    station0010.nameOriginal = @"Parque Berrío";
    station0010.mapLocation = CGPointMake(601.5, 991.5);
    station0010.geoLocation = CGPointMake(6.250691, -75.568247);

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = CGPointMake(601.5, 991.5);
    fillCircle0015.radius = 6.5;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0015];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0010.nameOriginal;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 32;
    drawTextLine0010.origin = CGPointMake(618, 971.5);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0010];
    
    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 407;
    [edge0002.elements addObject:haul0010];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(601.5, 991);
    drawLine0014.endPoint = CGPointMake(601.5, 1085);
    drawLine0014.width = 19;
    drawLine0014.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0014];
    
    // Добавляем станцию "San Antonio";
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0002.elements addObject:station0011];
    
    station0011.nameOriginal = @"San Antonio";
    station0011.mapLocation = CGPointMake(601.5, 1085);
    station0011.geoLocation = CGPointMake(6.247326, -75.569698);
    
    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = CGPointMake(601.5, 1085);
    fillCircle0017.radius = 6.5;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0017];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0011.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 32;
    drawTextLine0011.origin = CGPointMake(618, 1065);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0011];
    
    // Добавляем вершину
    edge0002.finishVertex = vertex0003;
    
    // Создаем участок линии от "San Antonio" до "Itagüí"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: San Antonio - Itagüí";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;
    
    // Добавляем станцию "San Antonio"
    [edge0003.elements addObject:station0011];
    
    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 514;
    [edge0003.elements addObject:haul0011];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(601.5, 1084.5);
    drawLine0015.endPoint = CGPointMake(601.5, 1181.5);
    drawLine0015.width = 19;
    drawLine0015.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0015];
    
    // Добавляем станцию "Alpujarra";
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0003.elements addObject:station0012];
    
    station0012.nameOriginal = @"Alpujarra";
    station0012.mapLocation = CGPointMake(601.5, 1181.5);
    station0012.geoLocation = CGPointMake(6.243058, -75.571486);
  
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = CGPointMake(601.5, 1181.5);
    fillCircle0018.radius = 6.5;
    fillCircle0018.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0018];
    
    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0012.nameOriginal;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 32;
    drawTextLine0012.origin = CGPointMake(618, 1161.5);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0012];
    
    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 547;
    [edge0003.elements addObject:haul0012];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(601.5, 1181);
    drawLine0016.endPoint = CGPointMake(601.5, 1272);
    drawLine0016.width = 19;
    drawLine0016.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию "Exposiciones";
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0003.elements addObject:station0013];
    
    station0013.nameOriginal = @"Exposiciones";
    station0013.mapLocation = CGPointMake(601.5, 1272);
    station0013.geoLocation = CGPointMake(6.238402, -75.573238);

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = CGPointMake(601.5, 1272);
    fillCircle0019.radius = 6.5;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0019];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0013.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 32;
    drawTextLine0013.origin = CGPointMake(618, 1252);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0013];
    
    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 981;
    [edge0003.elements addObject:haul0013];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(601.5, 1271.5);
    drawLine0017.endPoint = CGPointMake(601.5, 1358.5);
    drawLine0017.width = 19;
    drawLine0017.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0017];
    
    // Добавляем станцию "Industriales";
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0003.elements addObject:station0014];
    
    station0014.nameOriginal = @"Industriales";
    station0014.mapLocation = CGPointMake(601.5, 1358.5);
    station0014.geoLocation = CGPointMake(6.229929, -75.575685);

    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = CGPointMake(601.5, 1358.5);
    fillCircle0020.radius = 6.5;
    fillCircle0020.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0020];
    
    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0014.nameOriginal;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 32;
    drawTextLine0014.origin = CGPointMake(618, 1338.5);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0014];
    
    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1980;
    [edge0003.elements addObject:haul0014];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(601.5, 1358);
    drawLine0018.endPoint = CGPointMake(601.5, 1469);
    drawLine0018.width = 19;
    drawLine0018.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0018];
    
    // Добавляем станцию "Poblado";
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0003.elements addObject:station0015];
    
    station0015.nameOriginal = @"Poblado";
    station0015.mapLocation = CGPointMake(601.5, 1469);
    station0015.geoLocation = CGPointMake(6.212204, -75.577948);
    
    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = CGPointMake(601.5, 1469);
    fillCircle0021.radius = 6.5;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0021];
    
    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0015.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 32;
    drawTextLine0015.origin = CGPointMake(618, 1449);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0015];
    
    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 2109;
    [edge0003.elements addObject:haul0015];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(601.5, 1468.5);
    drawLine0019.endPoint = CGPointMake(601.5, 1578.5);
    drawLine0019.width = 19;
    drawLine0019.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0019];
    
    // Добавляем станцию "Aguacatala";
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0003.elements addObject:station0016];
    
    station0016.nameOriginal = @"Aguacatala";
    station0016.mapLocation = CGPointMake(601.5, 1578.5);
    station0016.geoLocation = CGPointMake(6.193308, -75.582321);

    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = CGPointMake(601.5, 1578.5);
    fillCircle0022.radius = 6.5;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0022];
    
    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0016.nameOriginal;
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 32;
    drawTextLine0016.origin = CGPointMake(618, 1558.5);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0016];
    
    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 949;
    [edge0003.elements addObject:haul0016];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(601.5, 1578);
    drawLine0020.endPoint = CGPointMake(601.5, 1686.5);
    drawLine0020.width = 19;
    drawLine0020.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0020];
    
    // Добавляем станцию "Ayurá";
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0003.elements addObject:station0017];
    
    station0017.nameOriginal = @"Ayurá";
    station0017.mapLocation = CGPointMake(601.5, 1686.5);
    station0017.geoLocation = CGPointMake(6.185897, -75.585564);
    
    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = CGPointMake(601.5, 1686.5);
    fillCircle0023.radius = 6.5;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0017.drawPrimitives addObject:fillCircle0023];
    
    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0017.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 32;
    drawTextLine0017.origin = CGPointMake(618, 1666.5);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0017];
    
    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 1817;
    [edge0003.elements addObject:haul0017];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(601.5, 1686);
    drawLine0021.endPoint = CGPointMake(601.5, 1762.5);
    drawLine0021.width = 19;
    drawLine0021.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0021];
    
    // Добавляем станцию "Envigado";
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0003.elements addObject:station0018];
    
    station0018.nameOriginal = @"Envigado";
    station0018.mapLocation = CGPointMake(601.5, 1762.5);
    station0018.geoLocation = CGPointMake(6.174166, -75.597032);

    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = CGPointMake(601.5, 1762.5);
    fillCircle0024.radius = 6.5;
    fillCircle0024.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0018.nameOriginal;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 32;
    drawTextLine0018.origin = CGPointMake(454, 1742.5);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0018];
    
    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1902;
    [edge0003.elements addObject:haul0018];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(601.5, 1762);
    drawLine0022.endPoint = CGPointMake(601.5, 1854.5);
    drawLine0022.width = 19;
    drawLine0022.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0022];

    // Добавляем станцию "Itagüí";
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0003.elements addObject:station0019];
    
    station0019.nameOriginal = @"Itagüí";
    station0019.mapLocation = CGPointMake(601.5, 1854.5);
    station0019.geoLocation = CGPointMake(6.153994, -75.623400);

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = CGPointMake(601.5, 1854.5);
    fillCircle0025.radius = 9.5;
    fillCircle0025.fillColor = line0001.color;
    [station0019.drawPrimitives addObject:fillCircle0025];

    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = CGPointMake(601.5, 1854.5);
    fillCircle0026.radius = 6.5;
    fillCircle0026.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0026];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0019.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 32;
    drawTextLine0019.origin = CGPointMake(506, 1834.5);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0019];
    
    // Добавляем вершину
    edge0003.finishVertex = vertex0004;
    
    ////////////////////////////////////////////////////////////////
    // Line B (Metro)
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "San Antonio" до "San Javier"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: San Antonio - San Javier";
    [self.edges addObject:(edge0004)];
    
    // Добавляем линию
    edge0004.line = line0002;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0003;
    
    // Добавляем станцию "San Antonio";
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0004.elements addObject:station0020];
    
    station0020.nameOriginal = @"San Antonio";
    station0020.mapLocation = CGPointMake(581, 1085);
    station0020.geoLocation = CGPointMake(6.247323, -75.569700);
    
    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = CGPointMake(581, 1085);
    fillCircle0027.radius = 9.5;
    fillCircle0027.fillColor = line0002.color;
    [station0020.drawPrimitives addObject:fillCircle0027];
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = CGPointMake(581, 1085);
    fillCircle0028.radius = 6.5;
    fillCircle0028.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0028];
    
    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 642;
    [edge0004.elements addObject:haul0019];
    
    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(581, 1085);
    drawLine0023.endPoint = CGPointMake(528, 1085);
    drawLine0023.width = 19;
    drawLine0023.color = line0002.color;
    [haul0019.drawPrimitives addObject:drawLine0023];
    
    // Добавляем станцию "Cisneros";
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0004.elements addObject:station0021];
    
    station0021.nameOriginal = @"Cisneros";
    station0021.mapLocation = CGPointMake(528, 1085);
    station0021.geoLocation = CGPointMake(6.249109, -75.575347);

    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = CGPointMake(528, 1085);
    fillCircle0029.radius = 6.5;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0029];
    
    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0021.nameOriginal;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 32;
    drawTextLine0020.origin = CGPointMake(462, 1036.5);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 970;
    [edge0004.elements addObject:haul0020];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(528.5, 1085);
    drawLine0024.endPoint = CGPointMake(444, 1085);
    drawLine0024.width = 19;
    drawLine0024.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0024];
    
    // Добавляем станцию "Suramericana";
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0004.elements addObject:station0022];
    
    station0022.nameOriginal = @"Suramericana";
    station0022.mapLocation = CGPointMake(444, 1085);
    station0022.geoLocation = CGPointMake(6.252913, -75.583111);

    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = CGPointMake(444, 1085);
    fillCircle0030.radius = 6.5;
    fillCircle0030.fillColor = [UIColor whiteColor];
    [station0022.drawPrimitives addObject:fillCircle0030];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0022.nameOriginal;
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 32;
    drawTextLine0021.origin = CGPointMake(375, 1094.5);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0021];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 589;
    [edge0004.elements addObject:haul0021];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(444, 1085);
    drawLine0025.endPoint = CGPointMake(343.5, 1085);
    drawLine0025.width = 19;
    drawLine0025.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawLine0025];
    
    // Добавляем станцию "Estadio";
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0004.elements addObject:station0023];
    
    station0023.nameOriginal = @"Estadio";
    station0023.mapLocation = CGPointMake(343.5, 1085);
    station0023.geoLocation = CGPointMake(6.253444, -75.588326);
    
    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = CGPointMake(343.5, 1085);
    fillCircle0031.radius = 6.5;
    fillCircle0031.fillColor = [UIColor whiteColor];
    [station0023.drawPrimitives addObject:fillCircle0031];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0023.nameOriginal;
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 32;
    drawTextLine0022.origin = CGPointMake(310, 1036.5);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 1314;
    [edge0004.elements addObject:haul0022];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(344, 1085);
    drawLine0026.endPoint = CGPointMake(251, 1085);
    drawLine0026.width = 19;
    drawLine0026.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0026];
    
    // Добавляем станцию "Floresta";
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0004.elements addObject:station0024];
    
    station0024.nameOriginal = @"Floresta";
    station0024.mapLocation = CGPointMake(251, 1085);
    station0024.geoLocation = CGPointMake(6.258814, -75.597829);
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = CGPointMake(251, 1085);
    fillCircle0032.radius = 6.5;
    fillCircle0032.fillColor = [UIColor whiteColor];
    [station0024.drawPrimitives addObject:fillCircle0032];
    
    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0024.nameOriginal;
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 32;
    drawTextLine0023.origin = CGPointMake(198.5, 1094.5);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0023];
    
    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 703;
    [edge0004.elements addObject:haul0023];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(251.5, 1085);
    drawLine0027.endPoint = CGPointMake(166.5, 1085);
    drawLine0027.width = 19;
    drawLine0027.color = line0002.color;
    [haul0023.drawPrimitives addObject:drawLine0027];

    // Добавляем станцию "Santa Lucía";
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0004.elements addObject:station0025];
    
    station0025.nameOriginal = @"Santa Lucía";
    station0025.mapLocation = CGPointMake(166.5, 1085);
    station0025.geoLocation = CGPointMake(6.258208, -75.603797);

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = CGPointMake(166.5, 1085);
    fillCircle0033.radius = 6.5;
    fillCircle0033.fillColor = [UIColor whiteColor];
    [station0025.drawPrimitives addObject:fillCircle0033];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"Santa";
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 32;
    drawTextLine0024.origin = CGPointMake(119, 1006.5);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0024];
    
    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"Lucía";
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 32;
    drawTextLine0025.origin = CGPointMake(123, 1036.5);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0025];
    
    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 1256;
    [edge0004.elements addObject:haul0024];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(167, 1085);
    drawLine0028.endPoint = CGPointMake(76.5, 1085);
    drawLine0028.width = 19;
    drawLine0028.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0028];
    
    // Добавляем станцию "San Javier";
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0004.elements addObject:station0026];
    
    station0026.nameOriginal = @"San Javíer";
    station0026.mapLocation = CGPointMake(76.5, 1085);
    station0026.geoLocation = CGPointMake(6.257321, -75.614121);
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = CGPointMake(76.5, 1085);
    fillCircle0034.radius = 9.5;
    fillCircle0034.fillColor = line0002.color;
    [station0026.drawPrimitives addObject:fillCircle0034];
    
    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = CGPointMake(76.5, 1085);
    fillCircle0035.radius = 6.5;
    fillCircle0035.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0035];
    
    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = @"San";
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 32;
    drawTextLine0026.origin = CGPointMake(40, 1094.5);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0026];
    
    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = @"Javíer";
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 32;
    drawTextLine0027.origin = CGPointMake(24, 1124.5);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0027];
    
    // Добавляем вершину
    edge0004.finishVertex = vertex0005;
    
    ////////////////////////////////////////////////////////////////
    // Line J (Metrocable)
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "San Javíer" до "La Aurora"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: San Javíer - La Aurora";
    [self.edges addObject:(edge0005)];
    
    // Добавляем линию
    edge0005.line = line0003;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0005;
    
    // Добавляем станцию "San Javier";
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0005.elements addObject:station0027];
    
    station0027.nameOriginal = @"San Javíer";
    station0027.mapLocation = CGPointMake(56.5, 1085);
    station0027.geoLocation = CGPointMake(6.257321, -75.614121);
    
    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = CGPointMake(56.5, 1085);
    fillCircle0036.radius = 4.5;
    fillCircle0036.fillColor = line0003.color;
    [station0027.drawPrimitives addObject:fillCircle0036];
    
    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = CGPointMake(56.5, 1085);
    fillCircle0037.radius = 3;
    fillCircle0037.fillColor = [UIColor whiteColor];
    [station0027.drawPrimitives addObject:fillCircle0037];
    
    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 944;
    [edge0005.elements addObject:haul0025];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(56.5, 1085);
    drawLine0029.endPoint = CGPointMake(56.5, 894.5);
    drawLine0029.width = 9;
    drawLine0029.color = line0003.color;
    [haul0025.drawPrimitives addObject:drawLine0029];
    
    // Добавляем станцию "Juan XXIII";
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0005.elements addObject:station0028];
    
    station0028.nameOriginal = @"Juan XXIII";
    station0028.mapLocation = CGPointMake(56.5, 894.5);
    station0028.geoLocation = CGPointMake(6.265705, -75.613699);

    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = CGPointMake(56.5, 894.5);
    fillCircle0038.radius = 3;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0038];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = station0028.nameOriginal;
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 32;
    drawTextLine0028.origin = CGPointMake(70, 874.5);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0028];
    
    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 1070;
    [edge0005.elements addObject:haul0026];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(56.5, 895);
    drawLine0030.endPoint = CGPointMake(56.5, 735.5);
    drawLine0030.width = 9;
    drawLine0030.color = line0003.color;
    [haul0026.drawPrimitives addObject:drawLine0030];

    // Добавляем станцию "Vallejuelos";
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0005.elements addObject:station0029];
    
    station0029.nameOriginal = @"Vallejuelos";
    station0029.mapLocation = CGPointMake(56.5, 735.5);
    station0029.geoLocation = CGPointMake(6.275380, -75.614022);

    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = CGPointMake(56.5, 735.5);
    fillCircle0039.radius = 3;
    fillCircle0039.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0039];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0029.nameOriginal;
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 32;
    drawTextLine0029.origin = CGPointMake(70, 715.5);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0029];
    
    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 635;
    [edge0005.elements addObject:haul0027];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(56.5, 736);
    drawLine0031.endPoint = CGPointMake(56.5, 634);
    drawLine0031.width = 9;
    drawLine0031.color = line0003.color;
    [haul0027.drawPrimitives addObject:drawLine0031];

    // Добавляем станцию "La Aurora";
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0005.elements addObject:station0030];
    
    station0030.nameOriginal = @"La Aurora";
    station0030.mapLocation = CGPointMake(56.5, 634);
    station0030.geoLocation = CGPointMake(6.281099, -75.614203);
    
    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = CGPointMake(56.5, 634);
    fillCircle0040.radius = 4.5;
    fillCircle0040.fillColor = line0003.color;
    [station0030.drawPrimitives addObject:fillCircle0040];
    
    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = CGPointMake(56.5, 634);
    fillCircle0041.radius = 3;
    fillCircle0041.fillColor = [UIColor whiteColor];
    [station0030.drawPrimitives addObject:fillCircle0041];
    
    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = station0030.nameOriginal;
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 32;
    drawTextLine0030.origin = CGPointMake(70, 614);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0030];
    
    // Добавляем вершину
    edge0005.finishVertex = vertex0006;
    
    ////////////////////////////////////////////////////////////////
    // Line K (Metrocable)
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Acevedo" до "Santo Domingo"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Acevedo - Santo Domingo";
    [self.edges addObject:(edge0006)];

    // Добавляем линию
    edge0006.line = line0004;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0002;
    
    // Добавляем станцию "Acevedo";
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0006.elements addObject:station0031];
    
    station0031.nameOriginal = @"Acevedo";
    station0031.mapLocation = CGPointMake(474.5, 430);
    station0031.geoLocation = CGPointMake(6.300315, -75.558409);
    
    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = CGPointMake(474.5, 430);
    fillCircle0042.radius = 4.5;
    fillCircle0042.fillColor = line0004.color;
    [station0031.drawPrimitives addObject:fillCircle0042];
    
    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = CGPointMake(474.5, 430);
    fillCircle0043.radius = 3;
    fillCircle0043.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0043];
    
    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 833;
    [edge0006.elements addObject:haul0028];
    
    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(474.5, 430);
    drawLine0032.endPoint = CGPointMake(696, 457);
    drawLine0032.width = 9;
    drawLine0032.color = line0004.color;
    [haul0028.drawPrimitives addObject:drawLine0032];
    
    // Добавляем станцию "Andalucía";
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0006.elements addObject:station0032];
    
    station0032.nameOriginal = @"Andalucía";
    station0032.mapLocation = CGPointMake(695, 456.5);
    station0032.geoLocation = CGPointMake(6.296265, -75.551925);
    
    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = CGPointMake(695, 456.5);
    fillCircle0044.radius = 3;
    fillCircle0044.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0044];
    
    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = station0032.nameOriginal;
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 32;
    drawTextLine0031.origin = CGPointMake(690, 465);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0031];
    
    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 435;
    [edge0006.elements addObject:haul0029];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(694, 457);
    drawLine0033.endPoint = CGPointMake(800, 425);
    drawLine0033.width = 9;
    drawLine0033.color = line0004.color;
    [haul0029.drawPrimitives addObject:drawLine0033];

    // Добавляем станцию "Popular";
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0006.elements addObject:station0033];
    
    station0033.nameOriginal = @"Popular";
    station0033.mapLocation = CGPointMake(800, 425);
    station0033.geoLocation = CGPointMake(6.295120, -75.548192);

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = CGPointMake(800, 425);
    fillCircle0045.radius = 3;
    fillCircle0045.fillColor = [UIColor whiteColor];
    [station0033.drawPrimitives addObject:fillCircle0045];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0033.nameOriginal;
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 32;
    drawTextLine0032.origin = CGPointMake(798, 433);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0032];
    
    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 744;
    [edge0006.elements addObject:haul0030];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(799.5, 425);
    drawLine0034.endPoint = CGPointMake(894, 397.5);
    drawLine0034.width = 9;
    drawLine0034.color = line0004.color;
    [haul0030.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию "Santo Domingo Savio";
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0006.elements addObject:station0034];
    
    station0034.nameOriginal = @"Santo Domingo Savio";
    station0034.mapLocation = CGPointMake(894, 397.5);
    station0034.geoLocation = CGPointMake(6.293226, -75.541768);
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = CGPointMake(894, 397.5);
    fillCircle0046.radius = 4.5;
    fillCircle0046.fillColor = line0004.color;
    [station0034.drawPrimitives addObject:fillCircle0046];
    
    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = CGPointMake(894, 397.5);
    fillCircle0047.radius = 3;
    fillCircle0047.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0047];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0034.nameOriginal;
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 32;
    drawTextLine0033.origin = CGPointMake(887, 347);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0033];

    // Добавляем вершину
    edge0006.finishVertex = vertex0007;
    
    ////////////////////////////////////////////////////////////////
    // Line L (Metrocable)
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Santo Domingo Savio" до "Arví"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Santo Domingo Savio - Arví";
    [self.edges addObject:(edge0007)];
    
    // Добавляем линию
    edge0007.line = line0005;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0007;
    
    // Добавляем станцию "Santo Domingo Savio";
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0007.elements addObject:station0035];
    
    station0035.nameOriginal = @"Santo Domingo Savio";
    station0035.mapLocation = CGPointMake(894, 418);
    station0035.geoLocation = CGPointMake(6.293226, -75.541768);
    
    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = CGPointMake(894, 418);
    fillCircle0048.radius = 4.5;
    fillCircle0048.fillColor = line0005.color;
    [station0035.drawPrimitives addObject:fillCircle0048];
    
    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = CGPointMake(894, 418);
    fillCircle0049.radius = 3;
    fillCircle0049.fillColor = [UIColor whiteColor];
    [station0035.drawPrimitives addObject:fillCircle0049];
    
    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 4595;
    [edge0007.elements addObject:haul0031];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(894, 418);
    drawLine0035.endPoint = CGPointMake(1474.5, 394);
    drawLine0035.width = 9;
    drawLine0035.color = line0005.color;
    [haul0031.drawPrimitives addObject:drawLine0035];
    
    // Добавляем станцию "Arví";
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0007.elements addObject:station0036];
    
    station0036.nameOriginal = @"Arví";
    station0036.mapLocation = CGPointMake(1474.5, 394);
    station0036.geoLocation = CGPointMake(6.296508, -75.502125);

    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = CGPointMake(1474.5, 394);
    fillCircle0050.radius = 4.5;
    fillCircle0050.fillColor = line0005.color;
    [station0036.drawPrimitives addObject:fillCircle0050];
    
    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = CGPointMake(1474.5, 394);
    fillCircle0051.radius = 3;
    fillCircle0051.fillColor = [UIColor whiteColor];
    [station0036.drawPrimitives addObject:fillCircle0051];
    
    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0036.nameOriginal;
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 32;
    drawTextLine0034.origin = CGPointMake(1472.5, 351);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0034];
    
    // Добавляем вершину
    edge0007.finishVertex = vertex0008;

    ////////////////////////////////////////////////////////////////
    // Рисуем объекты, расположенные под схемой
    ////////////////////////////////////////////////////////////////
    
    // Речка
    
    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(495.5, 143);
    drawLine0042.endPoint = CGPointMake(495.5, 1300);
    drawLine0042.width = 33;
    drawLine0042.color = [UIColor colorWithRed:(213/255.0) green:(230/255.0) blue:(245/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0042];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(534.5, 82);
    drawLine0043.endPoint = CGPointMake(434.5, 182);
    drawLine0043.width = 33;
    drawLine0043.color = [UIColor whiteColor];
    [self.additionalUnderMapPrimitives addObject:drawLine0043];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(494.5, 120);
    drawLine0044.endPoint = CGPointMake(568.5, 194);
    drawLine0044.width = 33;
    drawLine0044.color = [UIColor whiteColor];
    [self.additionalUnderMapPrimitives addObject:drawLine0044];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(491, 1289);
    drawLine0045.endPoint = CGPointMake(552, 1350);
    drawLine0045.width = 33;
    drawLine0045.color = [UIColor colorWithRed:(213/255.0) green:(230/255.0) blue:(245/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0045];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(547, 1339);
    drawLine0046.endPoint = CGPointMake(547, 1692);
    drawLine0046.width = 33;
    drawLine0046.color = [UIColor colorWithRed:(213/255.0) green:(230/255.0) blue:(245/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0046];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(540, 1678);
    drawLine0047.endPoint = CGPointMake(649, 1756);
    drawLine0047.width = 33;
    drawLine0047.color = [UIColor colorWithRed:(213/255.0) green:(230/255.0) blue:(245/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0047];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(642.5, 1743);
    drawLine0048.endPoint = CGPointMake(642.5, 1879);
    drawLine0048.width = 33;
    drawLine0048.color = [UIColor colorWithRed:(213/255.0) green:(230/255.0) blue:(245/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0048];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(649, 1866);
    drawLine0049.endPoint = CGPointMake(540, 1945);
    drawLine0049.width = 33;
    drawLine0049.color = [UIColor colorWithRed:(213/255.0) green:(230/255.0) blue:(245/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0049];
    
    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(547, 1932);
    drawLine0050.endPoint = CGPointMake(547, 2085);
    drawLine0050.width = 33;
    drawLine0050.color = [UIColor colorWithRed:(213/255.0) green:(230/255.0) blue:(245/255.0) alpha:1];
    [self.additionalUnderMapPrimitives addObject:drawLine0050];
    
    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(535.5, 2080);
    drawLine0051.endPoint = CGPointMake(580.5, 2125);
    drawLine0051.width = 33;
    drawLine0051.color = [UIColor whiteColor];
    [self.additionalUnderMapPrimitives addObject:drawLine0051];
    
    // Названия речки
    
    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = @"Rio Medellin";
    drawTextLine0070.fontName = @"HelveticaNeue";
    drawTextLine0070.fontColor = line0001.color;
    drawTextLine0070.fontSize = 24;
    drawTextLine0070.radians = 270 * M_PI / 180;
    drawTextLine0070.origin = CGPointMake(481, 297);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0070];

    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = @"Rio Medellin";
    drawTextLine0071.fontName = @"HelveticaNeue";
    drawTextLine0071.fontColor = line0001.color;
    drawTextLine0071.fontSize = 24;
    drawTextLine0071.radians = 270 * M_PI / 180;
    drawTextLine0071.origin = CGPointMake(628, 1877);
    [self.additionalUnderMapPrimitives addObject:drawTextLine0071];

    // Метка линии A
    
    MWDrawFillCircle *fillCircle0070 = [[MWDrawFillCircle alloc] init];
    fillCircle0070.center = CGPointMake(455, 114.5);
    fillCircle0070.radius = 18;
    fillCircle0070.fillColor = line0001.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0070];
    
    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = @"A";
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor whiteColor];
    drawTextLine0035.fontSize = 32;
    drawTextLine0035.origin = CGPointMake(444.5, 93);
    [self.additionalOverMapPrimitives addObject:drawTextLine0035];
    
    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(455, 130);
    drawLine0052.endPoint = CGPointMake(455, 137);
    drawLine0052.width = 4;
    drawLine0052.color = line0001.color;
    [self.additionalOverMapPrimitives addObject:drawLine0052];
    
    // Метка линии B
    
    MWDrawFillCircle *fillCircle0071 = [[MWDrawFillCircle alloc] init];
    fillCircle0071.center = CGPointMake(262.5, 1039.5);
    fillCircle0071.radius = 18;
    fillCircle0071.fillColor = line0002.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0071];
    
    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(262.5, 1039.5);
    drawLine0053.endPoint = CGPointMake(262.5, 1076);
    drawLine0053.width = 4;
    drawLine0053.color = line0002.color;
    [self.additionalOverMapPrimitives addObject:drawLine0053];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = @"B";
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor whiteColor];
    drawTextLine0036.fontSize = 32;
    drawTextLine0036.origin = CGPointMake(252, 1020);
    [self.additionalOverMapPrimitives addObject:drawTextLine0036];
    
    // Метка линии J
    
    MWDrawFillCircle *fillCircle0072 = [[MWDrawFillCircle alloc] init];
    fillCircle0072.center = CGPointMake(24, 769);
    fillCircle0072.radius = 18;
    fillCircle0072.fillColor = line0003.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0072];
    
    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(42, 769);
    drawLine0054.endPoint = CGPointMake(52, 769);
    drawLine0054.width = 4;
    drawLine0054.color = line0003.color;
    [self.additionalOverMapPrimitives addObject:drawLine0054];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"J";
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor whiteColor];
    drawTextLine0037.fontSize = 32;
    drawTextLine0037.origin = CGPointMake(15.5, 749.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0037];
    
    // Метка линии K
    
    MWDrawFillCircle *fillCircle0073 = [[MWDrawFillCircle alloc] init];
    fillCircle0073.center = CGPointMake(584, 409);
    fillCircle0073.radius = 18;
    fillCircle0073.fillColor = line0004.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0073];
    
    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(584, 419);
    drawLine0055.endPoint = CGPointMake(584, 439);
    drawLine0055.width = 4;
    drawLine0055.color = line0004.color;
    [self.additionalOverMapPrimitives addObject:drawLine0055];
    
    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"K";
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor whiteColor];
    drawTextLine0038.fontSize = 32;
    drawTextLine0038.origin = CGPointMake(573, 389);
    [self.additionalOverMapPrimitives addObject:drawTextLine0038];
    
    // Метка линии L
    
    MWDrawFillCircle *fillCircle0074 = [[MWDrawFillCircle alloc] init];
    fillCircle0074.center = CGPointMake(1195, 436);
    fillCircle0074.radius = 18;
    fillCircle0074.fillColor = line0005.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0074];
    
    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(1195, 410);
    drawLine0056.endPoint = CGPointMake(1195, 418);
    drawLine0056.width = 4;
    drawLine0056.color = line0005.color;
    [self.additionalOverMapPrimitives addObject:drawLine0056];
    
    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = @"L";
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor whiteColor];
    drawTextLine0039.fontSize = 32;
    drawTextLine0039.origin = CGPointMake(1187, 415.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0039];
    
    // Надписи
    
    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = @"Bello";
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = [UIColor grayColor];
    drawTextLine0040.fontSize = 36;
    drawTextLine0040.origin = CGPointMake(156, 314);
    [self.additionalOverMapPrimitives addObject:drawTextLine0040];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = @"Itagüí";
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor grayColor];
    drawTextLine0041.fontSize = 36;
    drawTextLine0041.origin = CGPointMake(399, 1861);
    [self.additionalOverMapPrimitives addObject:drawTextLine0041];
    
    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = @"La Estrella";
    drawTextLine0042.fontName = @"HelveticaNeue";
    drawTextLine0042.fontColor = [UIColor grayColor];
    drawTextLine0042.fontSize = 36;
    drawTextLine0042.origin = CGPointMake(344, 2002);
    [self.additionalOverMapPrimitives addObject:drawTextLine0042];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = @"Corregimiento de";
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor grayColor];
    drawTextLine0043.fontSize = 20;
    drawTextLine0043.origin = CGPointMake(1315, 472.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0043];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = @"Santa Elena";
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor grayColor];
    drawTextLine0044.fontSize = 36;
    drawTextLine0044.origin = CGPointMake(1308, 501.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0044];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = @"Medellín";
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor grayColor];
    drawTextLine0045.fontSize = 36;
    drawTextLine0045.origin = CGPointMake(853, 855.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0045];
    
    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = @"Envígado";
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor grayColor];
    drawTextLine0046.fontSize = 36;
    drawTextLine0046.origin = CGPointMake(696, 1812.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0046];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = @"Sabaneta";
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor grayColor];
    drawTextLine0047.fontSize = 36;
    drawTextLine0047.origin = CGPointMake(685, 2052);
    [self.additionalOverMapPrimitives addObject:drawTextLine0047];
    
    // Компас
    
    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(736, 118);
    drawLine0057.endPoint = CGPointMake(778, 160);
    drawLine0057.width = 60;
    drawLine0057.color = [UIColor lightGrayColor];
    [self.additionalOverMapPrimitives addObject:drawLine0057];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(746.5, 107.5);
    drawLine0058.endPoint = CGPointMake(767.5, 128.5);
    drawLine0058.width = 30;
    drawLine0058.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0058];

    MWDrawFillCircle *fillCircle0075 = [[MWDrawFillCircle alloc] init];
    fillCircle0075.center = CGPointMake(757, 138);
    fillCircle0075.radius = 32;
    fillCircle0075.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0075];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = @"N";
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor darkGrayColor];
    drawTextLine0048.fontSize = 54;
    drawTextLine0048.origin = CGPointMake(737.5, 105);
    [self.additionalOverMapPrimitives addObject:drawTextLine0048];

    // Примечания
    
    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = @"Líneas del Sistema";
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = [UIColor colorWithRed:(0/255.0) green:(147/255.0) blue:(0/255.0) alpha:1];
    drawTextLine0049.fontSize = 54;
    drawTextLine0049.origin = CGPointMake(887.5, 1205);
    [self.additionalOverMapPrimitives addObject:drawTextLine0049];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = @"Metro";
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0050.fontColor = [UIColor blackColor] ;
    drawTextLine0050.fontSize = 36;
    drawTextLine0050.origin = CGPointMake(887.5, 1276);
    [self.additionalOverMapPrimitives addObject:drawTextLine0050];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(1014, 1303.5);
    drawLine0059.endPoint = CGPointMake(1284, 1303.5);
    drawLine0059.width = 2;
    drawLine0059.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0059];

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(1283.5, 1303.5);
    drawLine0060.endPoint = CGPointMake(1455, 1303.5);
    drawLine0060.width = 6;
    drawLine0060.color = [UIColor colorWithRed:(0/255.0) green:(147/255.0) blue:(0/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0060];
    
    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(1476, 1303.5);
    drawArc0004.startRadians = 0 * M_PI / 180;
    drawArc0004.endRadians = 360 * M_PI / 180;
    drawArc0004.radius = 16;
    drawArc0004.width = 12;
    drawArc0004.color = [UIColor colorWithRed:(0/255.0) green:(147/255.0) blue:(0/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0004];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = @"Línea";
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor blackColor] ;
    drawTextLine0051.fontSize = 25;
    drawTextLine0051.origin = CGPointMake(887.5, 1338);
    [self.additionalOverMapPrimitives addObject:drawTextLine0051];

    MWDrawFillCircle *fillCircle0076 = [[MWDrawFillCircle alloc] init];
    fillCircle0076.center = CGPointMake(995, 1354);
    fillCircle0076.radius = 18;
    fillCircle0076.fillColor = line0001.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0076];
    
    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = @"A";
    drawTextLine0052.fontName = @"HelveticaNeue";
    drawTextLine0052.fontColor = [UIColor whiteColor];
    drawTextLine0052.fontSize = 32;
    drawTextLine0052.origin = CGPointMake(985, 1333);
    [self.additionalOverMapPrimitives addObject:drawTextLine0052];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = @"Itagüí - Itagüí - Itagüí";
    drawTextLine0053.fontName = @"HelveticaNeue";
    drawTextLine0053.fontColor = [UIColor darkTextColor] ;
    drawTextLine0053.fontSize = 25;
    drawTextLine0053.origin = CGPointMake(1021, 1338);
    [self.additionalOverMapPrimitives addObject:drawTextLine0053];

    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = @"Línea";
    drawTextLine0054.fontName = @"HelveticaNeue";
    drawTextLine0054.fontColor = [UIColor blackColor] ;
    drawTextLine0054.fontSize = 25;
    drawTextLine0054.origin = CGPointMake(887.5, 1386);
    [self.additionalOverMapPrimitives addObject:drawTextLine0054];
    
    MWDrawFillCircle *fillCircle0077 = [[MWDrawFillCircle alloc] init];
    fillCircle0077.center = CGPointMake(995, 1402);
    fillCircle0077.radius = 18;
    fillCircle0077.fillColor = line0002.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0077];
    
    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = @"B";
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = [UIColor whiteColor];
    drawTextLine0055.fontSize = 32;
    drawTextLine0055.origin = CGPointMake(985, 1382);
    [self.additionalOverMapPrimitives addObject:drawTextLine0055];
    
    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = @"San Antonio - San Javier - San Antonio";
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor darkTextColor] ;
    drawTextLine0056.fontSize = 25;
    drawTextLine0056.origin = CGPointMake(1021, 1386);
    [self.additionalOverMapPrimitives addObject:drawTextLine0056];
    
    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = @"Cable";
    drawTextLine0057.fontName = @"HelveticaNeue";
    drawTextLine0057.fontColor = [UIColor blackColor] ;
    drawTextLine0057.fontSize = 36;
    drawTextLine0057.origin = CGPointMake(887.5, 1457);
    [self.additionalOverMapPrimitives addObject:drawTextLine0057];
    
    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(1014, 1484.5);
    drawLine0061.endPoint = CGPointMake(1284, 1484.5);
    drawLine0061.width = 2;
    drawLine0061.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0061];
    
    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(1283.5, 1484.5);
    drawLine0062.endPoint = CGPointMake(1455, 1484.5);
    drawLine0062.width = 6;
    drawLine0062.color = [UIColor colorWithRed:(0/255.0) green:(147/255.0) blue:(0/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0062];
    
    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(1476, 1484.5);
    drawArc0005.startRadians = 0 * M_PI / 180;
    drawArc0005.endRadians = 360 * M_PI / 180;
    drawArc0005.radius = 16;
    drawArc0005.width = 12;
    drawArc0005.color = [UIColor colorWithRed:(0/255.0) green:(147/255.0) blue:(0/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0005];
    
    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = @"Línea";
    drawTextLine0058.fontName = @"HelveticaNeue";
    drawTextLine0058.fontColor = [UIColor blackColor] ;
    drawTextLine0058.fontSize = 25;
    drawTextLine0058.origin = CGPointMake(887.5, 1521);
    [self.additionalOverMapPrimitives addObject:drawTextLine0058];
    
    MWDrawFillCircle *fillCircle0078 = [[MWDrawFillCircle alloc] init];
    fillCircle0078.center = CGPointMake(995, 1537);
    fillCircle0078.radius = 18;
    fillCircle0078.fillColor = line0003.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0078];
    
    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = @"J";
    drawTextLine0059.fontName = @"HelveticaNeue";
    drawTextLine0059.fontColor = [UIColor whiteColor];
    drawTextLine0059.fontSize = 32;
    drawTextLine0059.origin = CGPointMake(987, 1517);
    [self.additionalOverMapPrimitives addObject:drawTextLine0059];
    
    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = @"San Javier - La Aurora - San Javier";
    drawTextLine0060.fontName = @"HelveticaNeue";
    drawTextLine0060.fontColor = [UIColor darkTextColor] ;
    drawTextLine0060.fontSize = 25;
    drawTextLine0060.origin = CGPointMake(1021, 1521);
    [self.additionalOverMapPrimitives addObject:drawTextLine0060];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = @"Línea";
    drawTextLine0061.fontName = @"HelveticaNeue";
    drawTextLine0061.fontColor = [UIColor blackColor] ;
    drawTextLine0061.fontSize = 25;
    drawTextLine0061.origin = CGPointMake(887.5, 1564);
    [self.additionalOverMapPrimitives addObject:drawTextLine0061];
    
    MWDrawFillCircle *fillCircle0079 = [[MWDrawFillCircle alloc] init];
    fillCircle0079.center = CGPointMake(995, 1580);
    fillCircle0079.radius = 18;
    fillCircle0079.fillColor = line0004.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0079];
    
    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = @"K";
    drawTextLine0062.fontName = @"HelveticaNeue";
    drawTextLine0062.fontColor = [UIColor whiteColor];
    drawTextLine0062.fontSize = 32;
    drawTextLine0062.origin = CGPointMake(983.5, 1560);
    [self.additionalOverMapPrimitives addObject:drawTextLine0062];
    
    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = @"Acevedo - Santo Domingo - Acevedo";
    drawTextLine0063.fontName = @"HelveticaNeue";
    drawTextLine0063.fontColor = [UIColor darkTextColor] ;
    drawTextLine0063.fontSize = 25;
    drawTextLine0063.origin = CGPointMake(1021, 1564);
    [self.additionalOverMapPrimitives addObject:drawTextLine0063];
    
    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = @"Línea";
    drawTextLine0064.fontName = @"HelveticaNeue";
    drawTextLine0064.fontColor = [UIColor blackColor] ;
    drawTextLine0064.fontSize = 25;
    drawTextLine0064.origin = CGPointMake(887.5, 1608.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0064];
    
    MWDrawFillCircle *fillCircle0080 = [[MWDrawFillCircle alloc] init];
    fillCircle0080.center = CGPointMake(995, 1624.5);
    fillCircle0080.radius = 18;
    fillCircle0080.fillColor = line0005.color;
    [self.additionalOverMapPrimitives addObject:fillCircle0080];
    
    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = @"L";
    drawTextLine0065.fontName = @"HelveticaNeue";
    drawTextLine0065.fontColor = [UIColor whiteColor];
    drawTextLine0065.fontSize = 32;
    drawTextLine0065.origin = CGPointMake(985.5, 1604.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0065];
    
    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = @"Santo Domingo - Arví - Santo Domingo";
    drawTextLine0066.fontName = @"HelveticaNeue";
    drawTextLine0066.fontColor = [UIColor darkTextColor] ;
    drawTextLine0066.fontSize = 25;
    drawTextLine0066.origin = CGPointMake(1021, 1608.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0066];
    
    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = @"Convenciones";
    drawTextLine0067.fontName = @"HelveticaNeue";
    drawTextLine0067.fontColor = [UIColor colorWithRed:(0/255.0) green:(147/255.0) blue:(0/255.0) alpha:1];
    drawTextLine0067.fontSize = 54;
    drawTextLine0067.origin = CGPointMake(887.5, 1656.5);
    [self.additionalOverMapPrimitives addObject:drawTextLine0067];
    
    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(918.5, 1785);
    drawLine0063.endPoint = CGPointMake(898, 1785);
    drawLine0063.width = 19;
    drawLine0063.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0063];
    
    MWDrawFillCircle *fillCircle0081 = [[MWDrawFillCircle alloc] init];
    fillCircle0081.center = CGPointMake(918.5, 1785);
    fillCircle0081.radius = 9.5;
    fillCircle0081.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0081];
    
    MWDrawFillCircle *fillCircle0082 = [[MWDrawFillCircle alloc] init];
    fillCircle0082.center = CGPointMake(898, 1785);
    fillCircle0082.radius = 9.5;
    fillCircle0082.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0082];
    
    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(918.5, 1785);
    drawLine0064.endPoint = CGPointMake(898, 1785);
    drawLine0064.width = 15;
    drawLine0064.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0064];
    
    MWDrawFillCircle *fillCircle0083 = [[MWDrawFillCircle alloc] init];
    fillCircle0083.center = CGPointMake(898, 1785);
    fillCircle0083.radius = 7.5;
    fillCircle0083.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0083];
    
    MWDrawFillCircle *fillCircle0084 = [[MWDrawFillCircle alloc] init];
    fillCircle0084.center = CGPointMake(918.5, 1785);
    fillCircle0084.radius = 7.5;
    fillCircle0084.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0084];
    
    MWDrawFillCircle *fillCircle0085 = [[MWDrawFillCircle alloc] init];
    fillCircle0085.center = CGPointMake(918.5, 1785);
    fillCircle0085.radius = 4.5;
    fillCircle0085.fillColor = [UIColor darkGrayColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0085];
    
    MWDrawFillCircle *fillCircle0086 = [[MWDrawFillCircle alloc] init];
    fillCircle0086.center = CGPointMake(898, 1785);
    fillCircle0086.radius = 4.5;
    fillCircle0086.fillColor = [UIColor darkGrayColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0086];
    
    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(909, 1743);
    drawArc0006.startRadians = 0 * M_PI / 180;
    drawArc0006.endRadians = 360 * M_PI / 180;
    drawArc0006.radius = 6;
    drawArc0006.width = 2;
    drawArc0006.color = [UIColor grayColor];
    [self.additionalOverMapPrimitives addObject:drawArc0006];
    
    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = @"Estación";
    drawTextLine0068.fontName = @"HelveticaNeue";
    drawTextLine0068.fontColor = [UIColor darkTextColor];
    drawTextLine0068.fontSize = 32;
    drawTextLine0068.origin = CGPointMake(940, 1723);
    [self.additionalOverMapPrimitives addObject:drawTextLine0068];

    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = @"Estación de transferencia";
    drawTextLine0069.fontName = @"HelveticaNeue";
    drawTextLine0069.fontColor = [UIColor darkTextColor];
    drawTextLine0069.fontSize = 32;
    drawTextLine0069.origin = CGPointMake(940, 1765);
    [self.additionalOverMapPrimitives addObject:drawTextLine0069];
    
    return self;
}

@end
