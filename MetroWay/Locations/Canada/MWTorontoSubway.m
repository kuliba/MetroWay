//
//  MMTorontoSubway.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 29.07.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

// Все расстояния между станциями вычислены с помощью функции correctZeroDistances

#import "MWTorontoSubway.h"

@implementation MWTorontoSubway

// Инициализируем
- (id)init
{
    self = [super init];

    self.identifier = @"toronto_subway";

    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////

    // 1. Bloor-Danforth
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Bloor-Danforth";
    line0001.color = [UIColor colorWithRed:(0/255.0) green:(146/255.0) blue:(63/255.0) alpha:1];
    [self.lines addObject:line0001];

    // 2. Scarborough RT
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"Scarborough RT";
    line0002.color = [UIColor colorWithRed:(2/255.0) green:(147/255.0) blue:(221/255.0) alpha:1];
    [self.lines addObject:line0002];

    // 3. Sheppard
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"Sheppard";
    line0003.color = [UIColor colorWithRed:(156/255.0) green:(103/255.0) blue:(155/255.0) alpha:1];
    [self.lines addObject:line0003];

    // 4. Yonge-University-Spadina
    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"Yonge-University-Spadina";
    line0004.color = [UIColor colorWithRed:(248/255.0) green:(195/255.0) blue:(0/255.0) alpha:1];
    [self.lines addObject:line0004];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0004];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Kipling
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Kipling";
    [self.vertices addObject:vertex0001];

    // Spadina
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Spadina";
    [self.vertices addObject:vertex0002];

    MWDrawLine *drawLine0149 = [[MWDrawLine alloc] init];
    drawLine0149.startPoint = CGPointMake(1216, 960);
    drawLine0149.endPoint = CGPointMake(1194, 1014);
    drawLine0149.width = 15;
    drawLine0149.color = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:drawLine0149];
    
    MWDrawLine *drawLine0150 = [[MWDrawLine alloc] init];
    drawLine0150.startPoint = CGPointMake(1216, 960);
    drawLine0150.endPoint = CGPointMake(1194, 1014);
    drawLine0150.width = 5;
    drawLine0150.color = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:drawLine0150];

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(1216, 960);
    fillCircle0001.radius = 20;
    fillCircle0001.fillColor = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = CGPointMake(1216, 960);
    fillCircle0002.radius = 15;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0002];

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = CGPointMake(1216, 960);
    fillCircle0003.radius = 10;
    fillCircle0003.fillColor = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:fillCircle0003];

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = CGPointMake(1194, 1014);
    fillCircle0004.radius = 20;
    fillCircle0004.fillColor = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:fillCircle0004];

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = CGPointMake(1194, 1014);
    fillCircle0005.radius = 15;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0005];

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = CGPointMake(1194, 1014);
    fillCircle0006.radius = 10;
    fillCircle0006.fillColor = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:fillCircle0006];

    // St. George
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: St. George";
    [self.vertices addObject:vertex0003];

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = CGPointMake(1338, 1014);
    fillCircle0007.radius = 25;
    fillCircle0007.fillColor = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:fillCircle0007];

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = CGPointMake(1338, 1014);
    fillCircle0008.radius = 20;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0008];

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = CGPointMake(1338, 1014);
    fillCircle0009.radius = 15;
    fillCircle0009.fillColor = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:fillCircle0009];

    // Bloor-Yonge
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Bloor-Yonge";
    [self.vertices addObject:vertex0004];

    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = CGPointMake(1672, 1014);
    fillCircle0010.radius = 20;
    fillCircle0010.fillColor = [UIColor blackColor];
    [vertex0004.drawPrimitives addObject:fillCircle0010];

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = CGPointMake(1672, 1014);
    fillCircle0011.radius = 15;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0011];

    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = CGPointMake(1672, 1014);
    fillCircle0012.radius = 10;
    fillCircle0012.fillColor = [UIColor blackColor];
    [vertex0004.drawPrimitives addObject:fillCircle0012];

    // Kennedy
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Kennedy";
    [self.vertices addObject:vertex0005];

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = CGPointMake(3060, 600);
    fillCircle0013.radius = 20;
    fillCircle0013.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0013];

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = CGPointMake(3060, 600);
    fillCircle0014.radius = 15;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0014];

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = CGPointMake(3060, 600);
    fillCircle0015.radius = 10;
    fillCircle0015.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0015];

    // McCowan
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: McCowan";
    [self.vertices addObject:vertex0006];

    // Sheppard-Yonge
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Sheppard-Yonge";
    [self.vertices addObject:vertex0007];

    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = CGPointMake(1672, 186);
    fillCircle0016.radius = 20;
    fillCircle0016.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0016];

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = CGPointMake(1672, 186);
    fillCircle0017.radius = 15;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0017];

    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = CGPointMake(1672, 186);
    fillCircle0018.radius = 10;
    fillCircle0018.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0018];

    // Don Mills
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Don Mills";
    [self.vertices addObject:vertex0008];

    // Downsview
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Downsview";
    [self.vertices addObject:vertex0009];

    // Finch
    MWVertex *vertex0010 = [[MWVertex alloc] init];
    vertex0010.identifier = @"vertex0010";
    vertex0010.developmentName = @"Вершина: Finch";
    [self.vertices addObject:vertex0010];

    ////////////////////////////////////////////////////////////////
    // 1. Bloor-Danforth
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Kipling - Spadina
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Kipling - Spadina";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;

    // Добавляем станцию Kipling
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Kipling";
    station0001.mapLocation = CGPointMake(8, 1014);
    station0001.geoLocation = CGPointMake(43.637583, -79.535556);
    
    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(8, 992);
    drawLine0001.endPoint = CGPointMake(8, 1036);
    drawLine0001.width = 8;
    drawLine0001.color = line0001.color;
    [station0001.drawPrimitives addObject:drawLine0001];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = station0001.nameOriginal;
    drawTextLine0065.radians = 300 * M_PI / 180;
    drawTextLine0065.fontName = @"HelveticaNeue-Bold";
    drawTextLine0065.fontColor = [UIColor blackColor];
    drawTextLine0065.fontSize = 40;
    drawTextLine0065.kernSpacing = 1.8;
    drawTextLine0065.origin = CGPointMake(-8, 963);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0065];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1237;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(8, 1014);
    drawLine0002.endPoint = CGPointMake(92, 1014);
    drawLine0002.width = 12;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию Islington
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Islington";
    station0002.mapLocation = CGPointMake(92, 1014);
    station0002.geoLocation = CGPointMake(43.645278, -79.524444);

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(92, 992);
    drawLine0003.endPoint = CGPointMake(92, 1014);
    drawLine0003.width = 8;
    drawLine0003.color = line0001.color;
    [station0002.drawPrimitives addObject:drawLine0003];

    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = station0002.nameOriginal;
    drawTextLine0066.radians = 300 * M_PI / 180;
    drawTextLine0066.fontName = @"HelveticaNeue-Bold";
    drawTextLine0066.fontColor = [UIColor blackColor];
    drawTextLine0066.fontSize = 40;
    drawTextLine0066.kernSpacing = 1.8;
    drawTextLine0066.origin = CGPointMake(75, 964);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0066];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1095;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(91.5, 1014);
    drawLine0004.endPoint = CGPointMake(178, 1014);
    drawLine0004.width = 12;
    drawLine0004.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Royal York
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Royal York";
    station0003.mapLocation = CGPointMake(178, 1014);
    station0003.geoLocation = CGPointMake(43.648056, -79.511389);
    
    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(178, 992);
    drawLine0005.endPoint = CGPointMake(178, 1014);
    drawLine0005.width = 8;
    drawLine0005.color = line0001.color;
    [station0003.drawPrimitives addObject:drawLine0005];

    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = station0003.nameOriginal;
    drawTextLine0067.radians = 300 * M_PI / 180;
    drawTextLine0067.fontName = @"HelveticaNeue-Bold";
    drawTextLine0067.fontColor = [UIColor blackColor];
    drawTextLine0067.fontSize = 40;
    drawTextLine0067.kernSpacing = 1.8;
    drawTextLine0067.origin = CGPointMake(159, 965);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0067];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1358;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(177.5, 1014);
    drawLine0006.endPoint = CGPointMake(262, 1014);
    drawLine0006.width = 12;
    drawLine0006.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Old Mill
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Old Mill";
    station0004.mapLocation = CGPointMake(262, 1014);
    station0004.geoLocation = CGPointMake(43.65, -79.494722);

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(262, 992);
    drawLine0007.endPoint = CGPointMake(262, 1014);
    drawLine0007.width = 8;
    drawLine0007.color = line0001.color;
    [station0004.drawPrimitives addObject:drawLine0007];

    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = station0004.nameOriginal;
    drawTextLine0068.radians = 300 * M_PI / 180;
    drawTextLine0068.fontName = @"HelveticaNeue-Bold";
    drawTextLine0068.fontColor = [UIColor blackColor];
    drawTextLine0068.fontSize = 40;
    drawTextLine0068.kernSpacing = 1.8;
    drawTextLine0068.origin = CGPointMake(246, 963);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0068];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 871;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(261.5, 1014);
    drawLine0008.endPoint = CGPointMake(346, 1014);
    drawLine0008.width = 12;
    drawLine0008.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Jane
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"Jane";
    station0005.mapLocation = CGPointMake(346, 1014);
    station0005.geoLocation = CGPointMake(43.649917, -79.483889);

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(346, 992);
    drawLine0009.endPoint = CGPointMake(346, 1014);
    drawLine0009.width = 8;
    drawLine0009.color = line0001.color;
    [station0005.drawPrimitives addObject:drawLine0009];

    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = station0005.nameOriginal;
    drawTextLine0069.radians = 300 * M_PI / 180;
    drawTextLine0069.fontName = @"HelveticaNeue-Bold";
    drawTextLine0069.fontColor = [UIColor blackColor];
    drawTextLine0069.fontSize = 40;
    drawTextLine0069.kernSpacing = 1.8;
    drawTextLine0069.origin = CGPointMake(328, 966);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0069];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 677;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(345.5, 1014);
    drawLine0010.endPoint = CGPointMake(432, 1014);
    drawLine0010.width = 12;
    drawLine0010.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Runnymede
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Runnymede";
    station0006.mapLocation = CGPointMake(432, 1014);
    station0006.geoLocation = CGPointMake(43.651667, -79.475833);

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(432, 992);
    drawLine0011.endPoint = CGPointMake(432, 1014);
    drawLine0011.width = 8;
    drawLine0011.color = line0001.color;
    [station0006.drawPrimitives addObject:drawLine0011];

    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = station0006.nameOriginal;
    drawTextLine0070.radians = 300 * M_PI / 180;
    drawTextLine0070.fontName = @"HelveticaNeue-Bold";
    drawTextLine0070.fontColor = [UIColor blackColor];
    drawTextLine0070.fontSize = 40;
    drawTextLine0070.kernSpacing = 1.8;
    drawTextLine0070.origin = CGPointMake(413, 965);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0070];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 777;
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(431.5, 1014);
    drawLine0012.endPoint = CGPointMake(516, 1014);
    drawLine0012.width = 12;
    drawLine0012.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию High Park
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"High Park";
    station0007.mapLocation = CGPointMake(516, 1014);
    station0007.geoLocation = CGPointMake(43.653889, -79.466667);

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(516, 992);
    drawLine0013.endPoint = CGPointMake(516, 1014);
    drawLine0013.width = 8;
    drawLine0013.color = line0001.color;
    [station0007.drawPrimitives addObject:drawLine0013];

    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = station0007.nameOriginal;
    drawTextLine0071.radians = 300 * M_PI / 180;
    drawTextLine0071.fontName = @"HelveticaNeue-Bold";
    drawTextLine0071.fontColor = [UIColor blackColor];
    drawTextLine0071.fontSize = 40;
    drawTextLine0071.kernSpacing = 1.8;
    drawTextLine0071.origin = CGPointMake(498, 965);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0071];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 588;
    [edge0001.elements addObject:haul0007];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(515.5, 1014);
    drawLine0014.endPoint = CGPointMake(600, 1014);
    drawLine0014.width = 12;
    drawLine0014.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0014];

    // Добавляем станцию Keele
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"Keele";
    station0008.mapLocation = CGPointMake(600, 1014);
    station0008.geoLocation = CGPointMake(43.655556, -79.459722);

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(600, 992);
    drawLine0015.endPoint = CGPointMake(600, 1014);
    drawLine0015.width = 8;
    drawLine0015.color = line0001.color;
    [station0008.drawPrimitives addObject:drawLine0015];

    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = station0008.nameOriginal;
    drawTextLine0072.radians = 300 * M_PI / 180;
    drawTextLine0072.fontName = @"HelveticaNeue-Bold";
    drawTextLine0072.fontColor = [UIColor blackColor];
    drawTextLine0072.fontSize = 40;
    drawTextLine0072.kernSpacing = 1.8;
    drawTextLine0072.origin = CGPointMake(584, 965);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0072];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 569;
    [edge0001.elements addObject:haul0008];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(599.5, 1014);
    drawLine0016.endPoint = CGPointMake(686, 1014);
    drawLine0016.width = 12;
    drawLine0016.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию Dundas West
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"Dundas West";
    station0009.mapLocation = CGPointMake(686, 1014);
    station0009.geoLocation = CGPointMake(43.656944, -79.452917);

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(686, 1014);
    drawLine0017.endPoint = CGPointMake(686, 1036);
    drawLine0017.width = 8;
    drawLine0017.color = line0001.color;
    [station0009.drawPrimitives addObject:drawLine0017];

    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = station0009.nameOriginal;
    drawTextLine0073.radians = 300 * M_PI / 180;
    drawTextLine0073.fontName = @"HelveticaNeue-Bold";
    drawTextLine0073.fontColor = [UIColor blackColor];
    drawTextLine0073.fontSize = 40;
    drawTextLine0073.kernSpacing = 1.8;
    drawTextLine0073.origin = CGPointMake(529, 1272);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0073];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 852;
    [edge0001.elements addObject:haul0009];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(685.5, 1014);
    drawLine0018.endPoint = CGPointMake(770, 1014);
    drawLine0018.width = 12;
    drawLine0018.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0018];

    // Добавляем станцию Landsdowne
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0001.elements addObject:station0010];
    
    station0010.nameOriginal = @"Landsdowne";
    station0010.mapLocation = CGPointMake(770, 1014);
    station0010.geoLocation = CGPointMake(43.659167, -79.442778);

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(770, 1014);
    drawLine0019.endPoint = CGPointMake(770, 1036);
    drawLine0019.width = 8;
    drawLine0019.color = line0001.color;
    [station0010.drawPrimitives addObject:drawLine0019];

    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = station0010.nameOriginal;
    drawTextLine0074.radians = 300 * M_PI / 180;
    drawTextLine0074.fontName = @"HelveticaNeue-Bold";
    drawTextLine0074.fontColor = [UIColor blackColor];
    drawTextLine0074.fontSize = 40;
    drawTextLine0074.kernSpacing = 1.8;
    drawTextLine0074.origin = CGPointMake(619, 1261);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0074];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 588;
    [edge0001.elements addObject:haul0010];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(769.5, 1014);
    drawLine0020.endPoint = CGPointMake(856, 1014);
    drawLine0020.width = 12;
    drawLine0020.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0020];

    // Добавляем станцию Dufferin
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0001.elements addObject:station0011];
    
    station0011.nameOriginal = @"Dufferin";
    station0011.mapLocation = CGPointMake(856, 1014);
    station0011.geoLocation = CGPointMake(43.66, -79.435556);

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(856, 1014);
    drawLine0021.endPoint = CGPointMake(856, 1036);
    drawLine0021.width = 8;
    drawLine0021.color = line0001.color;
    [station0011.drawPrimitives addObject:drawLine0021];

    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = station0011.nameOriginal;
    drawTextLine0075.radians = 300 * M_PI / 180;
    drawTextLine0075.fontName = @"HelveticaNeue-Bold";
    drawTextLine0075.fontColor = [UIColor blackColor];
    drawTextLine0075.fontSize = 40;
    drawTextLine0075.kernSpacing = 1.8;
    drawTextLine0075.origin = CGPointMake(754, 1175);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0075];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 756;
    [edge0001.elements addObject:haul0011];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(855.5, 1014);
    drawLine0022.endPoint = CGPointMake(940, 1014);
    drawLine0022.width = 12;
    drawLine0022.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0022];

    // Добавляем станцию Ossington
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0001.elements addObject:station0012];
    
    station0012.nameOriginal = @"Ossington";
    station0012.mapLocation = CGPointMake(940, 1014);
    station0012.geoLocation = CGPointMake(43.662222, -79.426667);

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(940, 1014);
    drawLine0023.endPoint = CGPointMake(940, 1036);
    drawLine0023.width = 8;
    drawLine0023.color = line0001.color;
    [station0012.drawPrimitives addObject:drawLine0023];

    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0012.nameOriginal;
    drawTextLine0076.radians = 300 * M_PI / 180;
    drawTextLine0076.fontName = @"HelveticaNeue-Bold";
    drawTextLine0076.fontColor = [UIColor blackColor];
    drawTextLine0076.fontSize = 40;
    drawTextLine0076.kernSpacing = 1.8;
    drawTextLine0076.origin = CGPointMake(815, 1216);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0076];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 704;
    [edge0001.elements addObject:haul0012];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(939.5, 1014);
    drawLine0024.endPoint = CGPointMake(1026, 1014);
    drawLine0024.width = 12;
    drawLine0024.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Christie
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0001.elements addObject:station0013];
    
    station0013.nameOriginal = @"Christie";
    station0013.mapLocation = CGPointMake(1026, 1014);
    station0013.geoLocation = CGPointMake(43.664167, -79.418333);

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(1026, 1014);
    drawLine0025.endPoint = CGPointMake(1026, 1036);
    drawLine0025.width = 8;
    drawLine0025.color = line0001.color;
    [station0013.drawPrimitives addObject:drawLine0025];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = station0013.nameOriginal;
    drawTextLine0077.radians = 300 * M_PI / 180;
    drawTextLine0077.fontName = @"HelveticaNeue-Bold";
    drawTextLine0077.fontColor = [UIColor blackColor];
    drawTextLine0077.fontSize = 40;
    drawTextLine0077.kernSpacing = 1.8;
    drawTextLine0077.origin = CGPointMake(924, 1174);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0077];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 620;
    [edge0001.elements addObject:haul0013];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(1025.5, 1014);
    drawLine0026.endPoint = CGPointMake(1110, 1014);
    drawLine0026.width = 12;
    drawLine0026.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0026];

    // Добавляем станцию Bathurst
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0001.elements addObject:station0014];
    
    station0014.nameOriginal = @"Bathurst";
    station0014.mapLocation = CGPointMake(1110, 1014);
    station0014.geoLocation = CGPointMake(43.666111, -79.411111);
    
    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(1110, 1014);
    drawLine0027.endPoint = CGPointMake(1110, 1036);
    drawLine0027.width = 8;
    drawLine0027.color = line0001.color;
    [station0014.drawPrimitives addObject:drawLine0027];

    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = station0014.nameOriginal;
    drawTextLine0078.radians = 300 * M_PI / 180;
    drawTextLine0078.fontName = @"HelveticaNeue-Bold";
    drawTextLine0078.fontColor = [UIColor blackColor];
    drawTextLine0078.fontSize = 40;
    drawTextLine0078.kernSpacing = 1.8;
    drawTextLine0078.origin = CGPointMake(999, 1193);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0078];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 593;
    [edge0001.elements addObject:haul0014];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(1109.5, 1014);
    drawLine0028.endPoint = CGPointMake(1194, 1014);
    drawLine0028.width = 12;
    drawLine0028.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0028];

    // Добавляем станцию Spadina
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0001.elements addObject:station0015];
    
    station0015.nameOriginal = @"Spadina";
    station0015.mapLocation = CGPointMake(1194, 1014);
    station0015.geoLocation = CGPointMake(43.667222, -79.403889);

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0015.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue-Bold";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 40;
    drawTextLine0001.kernSpacing = 1.8;
    drawTextLine0001.origin = CGPointMake(1021, 941);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(1194, 994);
    drawLine0029.endPoint = CGPointMake(1194, 1014);
    drawLine0029.width = 8;
    drawLine0029.color = line0001.color;
    [station0015.drawPrimitives addObject:drawLine0029];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    // Создаем участок линии Spadina - St. George
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Spadina - St. George";
    [self.edges addObject:(edge0002)];

    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;

    // Добавляем станцию Spadina
    [edge0002.elements addObject:station0015];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 342;
    [edge0002.elements addObject:haul0015];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(1193.5, 1014);
    drawLine0030.endPoint = CGPointMake(1338, 1014);
    drawLine0030.width = 12;
    drawLine0030.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0030];

    // Добавляем станцию St. George
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0002.elements addObject:station0016];
    
    station0016.nameOriginal = @"St. George";
    station0016.mapLocation = CGPointMake(1338, 1014);
    station0016.geoLocation = CGPointMake(43.668264, -79.399889);

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(1338, 992);
    drawLine0031.endPoint = CGPointMake(1338, 1014);
    drawLine0031.width = 8;
    drawLine0031.color = line0001.color;
    [station0016.drawPrimitives addObject:drawLine0031];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0016.nameOriginal;
    drawTextLine0002.fontName = @"HelveticaNeue-Bold";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 40;
    drawTextLine0002.kernSpacing = 1.8;
    drawTextLine0002.origin = CGPointMake(1300, 937);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0002];

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;

    // Создаем участок линии St. George - Bloor-Yonge
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: St. George - Bloor-Yonge";
    [self.edges addObject:(edge0003)];

    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;

    // Добавляем станцию St. George
    [edge0003.elements addObject:station0016];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 826;
    [edge0003.elements addObject:haul0016];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(1337.5, 1014);
    drawLine0032.endPoint = CGPointMake(1566, 1014);
    drawLine0032.width = 12;
    drawLine0032.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0032];

    // Добавляем станцию Bay
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0003.elements addObject:station0017];
    
    station0017.nameOriginal = @"Bay";
    station0017.mapLocation = CGPointMake(1566, 1014);
    station0017.geoLocation = CGPointMake(43.670278, -79.39);
    
    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(1566, 1014);
    drawLine0033.endPoint = CGPointMake(1566, 1036);
    drawLine0033.width = 8;
    drawLine0033.color = line0001.color;
    [station0017.drawPrimitives addObject:drawLine0033];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0017.nameOriginal;
    drawTextLine0003.fontName = @"HelveticaNeue-Bold";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 40;
    drawTextLine0003.kernSpacing = 1.8;
    drawTextLine0003.origin = CGPointMake(1526, 1038);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0003];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 347;
    [edge0003.elements addObject:haul0017];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(1565.5, 1014);
    drawLine0034.endPoint = CGPointMake(1672, 1014);
    drawLine0034.width = 12;
    drawLine0034.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию Bloor-Yonge
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0003.elements addObject:station0018];
    
    station0018.nameOriginal = @"Bloor-Yonge";
    station0018.mapLocation = CGPointMake(1672, 1014);
    station0018.geoLocation = CGPointMake(43.671111, -79.385833);
    
    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(1672, 994);
    drawLine0035.endPoint = CGPointMake(1672, 1014);
    drawLine0035.width = 8;
    drawLine0035.color = line0001.color;
    [station0018.drawPrimitives addObject:drawLine0035];
    
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = @"Bloor-";
    drawTextLine0004.fontName = @"HelveticaNeue-Bold";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 21;
    drawTextLine0004.kernSpacing = 1.8;
    drawTextLine0004.origin = CGPointMake(1579, 948);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0004];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = @"Yonge";
    drawTextLine0005.fontName = @"HelveticaNeue-Bold";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 21;
    drawTextLine0005.kernSpacing = 1.8;
    drawTextLine0005.origin = CGPointMake(1579, 973);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0005];

    // Добавляем вершину
    edge0003.finishVertex = vertex0004;

    // Создаем участок линии Bloor-Yonge - Kennedy
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Bloor-Yonge - Kennedy";
    [self.edges addObject:edge0004];

    // Добавляем линию
    edge0004.line = line0001;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0004;

    // Добавляем станцию Bloor-Yonge
    [edge0004.elements addObject:station0018];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 769;
    [edge0004.elements addObject:haul0018];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(1671.5, 1014);
    drawLine0036.endPoint = CGPointMake(1788, 1014);
    drawLine0036.width = 12;
    drawLine0036.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0036];

    // Добавляем станцию Sherbourne
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0004.elements addObject:station0019];
    
    station0019.nameOriginal = @"Sherbourne";
    station0019.mapLocation = CGPointMake(1788, 1014);
    station0019.geoLocation = CGPointMake(43.672222, -79.376389);

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(1788, 992);
    drawLine0037.endPoint = CGPointMake(1788, 1014);
    drawLine0037.width = 8;
    drawLine0037.color = line0001.color;
    [station0019.drawPrimitives addObject:drawLine0037];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = station0019.nameOriginal;
    drawTextLine0079.radians = 300 * M_PI / 180;
    drawTextLine0079.fontName = @"HelveticaNeue-Bold";
    drawTextLine0079.fontColor = [UIColor blackColor];
    drawTextLine0079.fontSize = 40;
    drawTextLine0079.kernSpacing = 1.8;
    drawTextLine0079.origin = CGPointMake(1769, 964);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0079];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 622;
    [edge0004.elements addObject:haul0019];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(1787.5, 1014);
    drawLine0038.endPoint = CGPointMake(1874, 1014);
    drawLine0038.width = 12;
    drawLine0038.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0038];

    // Добавляем станцию Castle Frank
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0004.elements addObject:station0020];
    
    station0020.nameOriginal = @"Castle Frank";
    station0020.mapLocation = CGPointMake(1874, 1014);
    station0020.geoLocation = CGPointMake(43.673611, -79.368889);

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(1874, 992);
    drawLine0039.endPoint = CGPointMake(1874, 1014);
    drawLine0039.width = 8;
    drawLine0039.color = line0001.color;
    [station0020.drawPrimitives addObject:drawLine0039];

    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = station0020.nameOriginal;
    drawTextLine0080.radians = 300 * M_PI / 180;
    drawTextLine0080.fontName = @"HelveticaNeue-Bold";
    drawTextLine0080.fontColor = [UIColor blackColor];
    drawTextLine0080.fontSize = 40;
    drawTextLine0080.kernSpacing = 1.8;
    drawTextLine0080.origin = CGPointMake(1844, 962);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0080];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 897;
    [edge0004.elements addObject:haul0020];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(1873.5, 1014);
    drawLine0040.endPoint = CGPointMake(1958, 1014);
    drawLine0040.width = 12;
    drawLine0040.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0040];

    // Добавляем станцию Broadview
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0004.elements addObject:station0021];
    
    station0021.nameOriginal = @"Broadview";
    station0021.mapLocation = CGPointMake(1958, 1014);
    station0021.geoLocation = CGPointMake(43.67675, -79.358611);

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(1958, 992);
    drawLine0041.endPoint = CGPointMake(1958, 1014);
    drawLine0041.width = 8;
    drawLine0041.color = line0001.color;
    [station0021.drawPrimitives addObject:drawLine0041];

    MWDrawTextLine *drawTextLine0081 = [[MWDrawTextLine alloc] init];
    drawTextLine0081.text = station0021.nameOriginal;
    drawTextLine0081.radians = 300 * M_PI / 180;
    drawTextLine0081.fontName = @"HelveticaNeue-Bold";
    drawTextLine0081.fontColor = [UIColor blackColor];
    drawTextLine0081.fontSize = 40;
    drawTextLine0081.kernSpacing = 1.8;
    drawTextLine0081.origin = CGPointMake(1938, 963);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0081];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 522;
    [edge0004.elements addObject:haul0021];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(1957.5, 1014);
    drawLine0042.endPoint = CGPointMake(2042, 1014);
    drawLine0042.width = 12;
    drawLine0042.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0042];

    // Добавляем станцию Chester
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0004.elements addObject:station0022];
    
    station0022.nameOriginal = @"Chester";
    station0022.mapLocation = CGPointMake(2042, 1014);
    station0022.geoLocation = CGPointMake(43.678333, -79.3525);

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(2042, 992);
    drawLine0043.endPoint = CGPointMake(2042, 1014);
    drawLine0043.width = 8;
    drawLine0043.color = line0001.color;
    [station0022.drawPrimitives addObject:drawLine0043];

    MWDrawTextLine *drawTextLine0082 = [[MWDrawTextLine alloc] init];
    drawTextLine0082.text = station0022.nameOriginal;
    drawTextLine0082.radians = 300 * M_PI / 180;
    drawTextLine0082.fontName = @"HelveticaNeue-Bold";
    drawTextLine0082.fontColor = [UIColor blackColor];
    drawTextLine0082.fontSize = 40;
    drawTextLine0082.kernSpacing = 1.8;
    drawTextLine0082.origin = CGPointMake(2023, 962);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0082];

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 629;
    [edge0004.elements addObject:haul0022];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(2041.5, 1014);
    drawLine0044.endPoint = CGPointMake(2128, 1014);
    drawLine0044.width = 12;
    drawLine0044.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawLine0044];

    // Добавляем станцию Pape
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0004.elements addObject:station0023];
    
    station0023.nameOriginal = @"Pape";
    station0023.mapLocation = CGPointMake(2128, 1014);
    station0023.geoLocation = CGPointMake(43.68, -79.345025);

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(2128, 992);
    drawLine0045.endPoint = CGPointMake(2128, 1014);
    drawLine0045.width = 8;
    drawLine0045.color = line0001.color;
    [station0023.drawPrimitives addObject:drawLine0045];

    MWDrawTextLine *drawTextLine0083 = [[MWDrawTextLine alloc] init];
    drawTextLine0083.text = station0023.nameOriginal;
    drawTextLine0083.radians = 300 * M_PI / 180;
    drawTextLine0083.fontName = @"HelveticaNeue-Bold";
    drawTextLine0083.fontColor = [UIColor blackColor];
    drawTextLine0083.fontSize = 40;
    drawTextLine0083.kernSpacing = 1.8;
    drawTextLine0083.origin = CGPointMake(2106, 964);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0083];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 592;
    [edge0004.elements addObject:haul0023];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(2127.5, 1014);
    drawLine0046.endPoint = CGPointMake(2212, 1014);
    drawLine0046.width = 12;
    drawLine0046.color = line0001.color;
    [haul0023.drawPrimitives addObject:drawLine0046];

    // Добавляем станцию Donlands
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0004.elements addObject:station0024];
    
    station0024.nameOriginal = @"Donlands";
    station0024.mapLocation = CGPointMake(2212, 1014);
    station0024.geoLocation = CGPointMake(43.680972, -79.337778);

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(2212, 992);
    drawLine0047.endPoint = CGPointMake(2212, 1014);
    drawLine0047.width = 8;
    drawLine0047.color = line0001.color;
    [station0024.drawPrimitives addObject:drawLine0047];

    MWDrawTextLine *drawTextLine0084 = [[MWDrawTextLine alloc] init];
    drawTextLine0084.text = station0024.nameOriginal;
    drawTextLine0084.radians = 300 * M_PI / 180;
    drawTextLine0084.fontName = @"HelveticaNeue-Bold";
    drawTextLine0084.fontColor = [UIColor blackColor];
    drawTextLine0084.fontSize = 40;
    drawTextLine0084.kernSpacing = 1.8;
    drawTextLine0084.origin = CGPointMake(2191, 965);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0084];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 626;
    [edge0004.elements addObject:haul0024];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(2211.5, 1014);
    drawLine0048.endPoint = CGPointMake(2296, 1014);
    drawLine0048.width = 12;
    drawLine0048.color = line0001.color;
    [haul0024.drawPrimitives addObject:drawLine0048];

    // Добавляем станцию Greenwood
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0004.elements addObject:station0025];

    station0025.nameOriginal = @"Greenwood";
    station0025.mapLocation = CGPointMake(2296, 1014);
    station0025.geoLocation = CGPointMake(43.6825, -79.330278);

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(2296, 992);
    drawLine0049.endPoint = CGPointMake(2296, 1014);
    drawLine0049.width = 8;
    drawLine0049.color = line0001.color;
    [station0025.drawPrimitives addObject:drawLine0049];

    MWDrawTextLine *drawTextLine0085 = [[MWDrawTextLine alloc] init];
    drawTextLine0085.text = station0025.nameOriginal;
    drawTextLine0085.radians = 300 * M_PI / 180;
    drawTextLine0085.fontName = @"HelveticaNeue-Bold";
    drawTextLine0085.fontColor = [UIColor blackColor];
    drawTextLine0085.fontSize = 40;
    drawTextLine0085.kernSpacing = 1.8;
    drawTextLine0085.origin = CGPointMake(2279, 961);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0085];

    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 609;
    [edge0004.elements addObject:haul0025];

    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(2295.5, 1014);
    drawLine0050.endPoint = CGPointMake(2382, 1014);
    drawLine0050.width = 12;
    drawLine0050.color = line0001.color;
    [haul0025.drawPrimitives addObject:drawLine0050];

    // Добавляем станцию Coxwell
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0004.elements addObject:station0026];
    
    station0026.nameOriginal = @"Coxwell";
    station0026.mapLocation = CGPointMake(2382, 1014);
    station0026.geoLocation = CGPointMake(43.684167, -79.323056);

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(2382, 992);
    drawLine0051.endPoint = CGPointMake(2382, 1014);
    drawLine0051.width = 8;
    drawLine0051.color = line0001.color;
    [station0026.drawPrimitives addObject:drawLine0051];

    MWDrawTextLine *drawTextLine0086 = [[MWDrawTextLine alloc] init];
    drawTextLine0086.text = station0026.nameOriginal;
    drawTextLine0086.radians = 300 * M_PI / 180;
    drawTextLine0086.fontName = @"HelveticaNeue-Bold";
    drawTextLine0086.fontColor = [UIColor blackColor];
    drawTextLine0086.fontSize = 40;
    drawTextLine0086.kernSpacing = 1.8;
    drawTextLine0086.origin = CGPointMake(2363, 962);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0086];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 863;
    [edge0004.elements addObject:haul0026];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(2381.5, 1014);
    drawLine0052.endPoint = CGPointMake(2466, 1014);
    drawLine0052.width = 12;
    drawLine0052.color = line0001.color;
    [haul0026.drawPrimitives addObject:drawLine0052];

    // Добавляем станцию Woodbine
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0004.elements addObject:station0027];
    
    station0027.nameOriginal = @"Woodbine";
    station0027.mapLocation = CGPointMake(2466, 1014);
    station0027.geoLocation = CGPointMake(43.686389, -79.312778);
    
    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(2466, 992);
    drawLine0053.endPoint = CGPointMake(2466, 1014);
    drawLine0053.width = 8;
    drawLine0053.color = line0001.color;
    [station0027.drawPrimitives addObject:drawLine0053];

    MWDrawTextLine *drawTextLine0087 = [[MWDrawTextLine alloc] init];
    drawTextLine0087.text = station0027.nameOriginal;
    drawTextLine0087.radians = 300 * M_PI / 180;
    drawTextLine0087.fontName = @"HelveticaNeue-Bold";
    drawTextLine0087.fontColor = [UIColor blackColor];
    drawTextLine0087.fontSize = 40;
    drawTextLine0087.kernSpacing = 1.8;
    drawTextLine0087.origin = CGPointMake(2448, 960);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0087];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 940;
    [edge0004.elements addObject:haul0027];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(2465.5, 1014);
    drawLine0054.endPoint = CGPointMake(2552, 1014);
    drawLine0054.width = 12;
    drawLine0054.color = line0001.color;
    [haul0027.drawPrimitives addObject:drawLine0054];

    // Добавляем станцию Main St.
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0004.elements addObject:station0028];
    
    station0028.nameOriginal = @"Main St.";
    station0028.mapLocation = CGPointMake(2552, 1014);
    station0028.geoLocation = CGPointMake(43.689028, -79.301667);

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(2552, 1014);
    drawLine0055.endPoint = CGPointMake(2552, 1036);
    drawLine0055.width = 8;
    drawLine0055.color = line0001.color;
    [station0028.drawPrimitives addObject:drawLine0055];

    MWDrawTextLine *drawTextLine0088 = [[MWDrawTextLine alloc] init];
    drawTextLine0088.text = station0028.nameOriginal;
    drawTextLine0088.radians = 300 * M_PI / 180;
    drawTextLine0088.fontName = @"HelveticaNeue-Bold";
    drawTextLine0088.fontColor = [UIColor blackColor];
    drawTextLine0088.fontSize = 40;
    drawTextLine0088.kernSpacing = 1.8;
    drawTextLine0088.origin = CGPointMake(2454, 1169);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0088];

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 1242;
    [edge0004.elements addObject:haul0028];

    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(2551.5, 1014);
    drawLine0056.endPoint = CGPointMake(2571, 1014);
    drawLine0056.width = 12;
    drawLine0056.color = line0001.color;
    [haul0028.drawPrimitives addObject:drawLine0056];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(2571, 934);
    drawArc0001.startRadians = 45 * M_PI / 180;
    drawArc0001.endRadians = 90 * M_PI / 180;
    drawArc0001.radius = 80;
    drawArc0001.width = 12;
    drawArc0001.color = line0001.color;
    [haul0028.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(2626.2, 992);
    drawLine0057.endPoint = CGPointMake(2746, 882);
    drawLine0057.width = 12;
    drawLine0057.color = line0001.color;
    [haul0028.drawPrimitives addObject:drawLine0057];

    // Добавляем станцию Victoria Park
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0004.elements addObject:station0029];
    
    station0029.nameOriginal = @"Victoria Park";
    station0029.mapLocation = CGPointMake(2746, 882);
    station0029.geoLocation = CGPointMake(43.695, -79.288611);
    
    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(2746, 882);
    drawLine0058.endPoint = CGPointMake(2761, 897);
    drawLine0058.width = 8;
    drawLine0058.color = line0001.color;
    [station0029.drawPrimitives addObject:drawLine0058];

    MWDrawTextLine *drawTextLine0089 = [[MWDrawTextLine alloc] init];
    drawTextLine0089.text = station0029.nameOriginal;
    drawTextLine0089.radians = 45 * M_PI / 180;
    drawTextLine0089.fontName = @"HelveticaNeue-Bold";
    drawTextLine0089.fontColor = [UIColor blackColor];
    drawTextLine0089.fontSize = 40;
    drawTextLine0089.kernSpacing = 1.8;
    drawTextLine0089.origin = CGPointMake(2791, 882);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0089];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 1957;
    [edge0004.elements addObject:haul0029];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(2745.5, 882.5);
    drawLine0059.endPoint = CGPointMake(2880, 760);
    drawLine0059.width = 12;
    drawLine0059.color = line0001.color;
    [haul0029.drawPrimitives addObject:drawLine0059];

    // Добавляем станцию Warden
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0004.elements addObject:station0030];
    
    station0030.nameOriginal = @"Warden";
    station0030.mapLocation = CGPointMake(2880, 760);
    station0030.geoLocation = CGPointMake(43.711389, -79.279722);

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(2880, 760);
    drawLine0060.endPoint = CGPointMake(2895, 775);
    drawLine0060.width = 8;
    drawLine0060.color = line0001.color;
    [station0030.drawPrimitives addObject:drawLine0060];

    MWDrawTextLine *drawTextLine0090 = [[MWDrawTextLine alloc] init];
    drawTextLine0090.text = station0030.nameOriginal;
    drawTextLine0090.radians = 45 * M_PI / 180;
    drawTextLine0090.fontName = @"HelveticaNeue-Bold";
    drawTextLine0090.fontColor = [UIColor blackColor];
    drawTextLine0090.fontSize = 40;
    drawTextLine0090.kernSpacing = 1.8;
    drawTextLine0090.origin = CGPointMake(2922, 764);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0090];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 2681;
    [edge0004.elements addObject:haul0030];

    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(2879.5, 760.5);
    drawLine0061.endPoint = CGPointMake(3060, 600);
    drawLine0061.width = 12;
    drawLine0061.color = line0001.color;
    [haul0030.drawPrimitives addObject:drawLine0061];

    // Добавляем станцию Kennedy
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0004.elements addObject:station0031];
    
    station0031.nameOriginal = @"Kennedy";
    station0031.mapLocation = CGPointMake(3060, 600);
    station0031.geoLocation = CGPointMake(43.7325, -79.263611);

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0031.nameOriginal;
    drawTextLine0006.fontName = @"HelveticaNeue-Bold";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 40;
    drawTextLine0006.kernSpacing = 1.8;
    drawTextLine0006.origin = CGPointMake(3086, 583);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0006];

    // Добавляем вершину
    edge0004.finishVertex = vertex0005;
    
    ////////////////////////////////////////////////////////////////
    // 2. Scarborough RT
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Kennedy - McCowan
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Kennedy - McCowan";
    [self.edges addObject:(edge0005)];

    // Добавляем линию
    edge0005.line = line0002;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0005;
    
    // Добавляем станцию Kennedy
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0005.elements addObject:station0032];
    
    station0032.nameOriginal = @"Kennedy";
    station0032.mapLocation = CGPointMake(3060, 600);
    station0032.geoLocation = CGPointMake(43.7325, -79.263611);
    
    station0032.showNameOnMap = false;
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0006];
    
    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 2048;
    [edge0005.elements addObject:haul0031];

    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(3072, 600);
    drawLine0063.endPoint = CGPointMake(3072, 430);
    drawLine0063.width = 12;
    drawLine0063.color = line0002.color;
    [haul0031.drawPrimitives addObject:drawLine0063];

    // Добавляем станцию Lawrence
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0005.elements addObject:station0033];
    
    station0033.nameOriginal = @"Lawrence";
    station0033.mapLocation = CGPointMake(3072, 430);
    station0033.geoLocation = CGPointMake(43.750278, -79.270278);
    
    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(3072, 430);
    drawLine0064.endPoint = CGPointMake(3050, 430);
    drawLine0064.width = 8;
    drawLine0064.color = line0002.color;
    [station0033.drawPrimitives addObject:drawLine0064];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0033.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue-Bold";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 40;
    drawTextLine0007.kernSpacing = 1.8;
    drawTextLine0007.origin = CGPointMake(2841, 400);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0007];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 1917;
    [edge0005.elements addObject:haul0032];

    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(3072, 430.5);
    drawLine0065.endPoint = CGPointMake(3072, 370);
    drawLine0065.width = 12;
    drawLine0065.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0065];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(3152, 372);
    drawArc0002.startRadians = 180 * M_PI / 180;
    drawArc0002.endRadians = 225 * M_PI / 180;
    drawArc0002.radius = 80;
    drawArc0002.width = 12;
    drawArc0002.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawArc0002];

    // Добавляем станцию Ellesmere
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0005.elements addObject:station0034];
    
    station0034.nameOriginal = @"Ellesmere";
    station0034.mapLocation = CGPointMake(3094, 318);
    station0034.geoLocation = CGPointMake(43.766944, -79.276389);
    
    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(3094, 318);
    drawLine0066.endPoint = CGPointMake(3079, 303);
    drawLine0066.width = 8;
    drawLine0066.color = line0002.color;
    [station0034.drawPrimitives addObject:drawLine0066];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0034.nameOriginal;
    drawTextLine0008.fontName = @"HelveticaNeue-Bold";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 40;
    drawTextLine0008.kernSpacing = 1.8;
    drawTextLine0008.origin = CGPointMake(2868, 273);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 526;
    [edge0005.elements addObject:haul0033];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(3152, 372);
    drawArc0003.startRadians = 224.5 * M_PI / 180;
    drawArc0003.endRadians = 270 * M_PI / 180;
    drawArc0003.radius = 80;
    drawArc0003.width = 12;
    drawArc0003.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(3150, 292);
    drawLine0067.endPoint = CGPointMake(3176, 292);
    drawLine0067.width = 12;
    drawLine0067.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0067];

    // Добавляем станцию Midland
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0005.elements addObject:station0035];
    
    station0035.nameOriginal = @"Midland";
    station0035.mapLocation = CGPointMake(3176, 292);
    station0035.geoLocation = CGPointMake(43.770417, -79.271944);

    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(3176, 292);
    drawLine0068.endPoint = CGPointMake(3176, 314);
    drawLine0068.width = 8;
    drawLine0068.color = line0002.color;
    [station0035.drawPrimitives addObject:drawLine0068];

    MWDrawTextLine *drawTextLine0091 = [[MWDrawTextLine alloc] init];
    drawTextLine0091.text = station0035.nameOriginal;
    drawTextLine0091.radians = 30 * M_PI / 180;
    drawTextLine0091.fontName = @"HelveticaNeue-Bold";
    drawTextLine0091.fontColor = [UIColor blackColor];
    drawTextLine0091.fontSize = 40;
    drawTextLine0091.kernSpacing = 1.8;
    drawTextLine0091.origin = CGPointMake(3179, 315);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0091];

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 1243;
    [edge0005.elements addObject:haul0034];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(3175.5, 292);
    drawLine0069.endPoint = CGPointMake(3260, 292);
    drawLine0069.width = 12;
    drawLine0069.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0069];

    // Добавляем станцию Scarborough Centre
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0005.elements addObject:station0036];
    
    station0036.nameOriginal = @"Scarborough Centre";
    station0036.mapLocation = CGPointMake(3260, 292);
    station0036.geoLocation = CGPointMake(43.774444, -79.2575);

    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(3260, 292);
    drawLine0070.endPoint = CGPointMake(3260, 314);
    drawLine0070.width = 8;
    drawLine0070.color = line0002.color;
    [station0036.drawPrimitives addObject:drawLine0070];

    MWDrawTextLine *drawTextLine0092 = [[MWDrawTextLine alloc] init];
    drawTextLine0092.text = station0036.nameOriginal;
    drawTextLine0092.radians = 30 * M_PI / 180;
    drawTextLine0092.fontName = @"HelveticaNeue-Bold";
    drawTextLine0092.fontColor = [UIColor blackColor];
    drawTextLine0092.fontSize = 40;
    drawTextLine0092.kernSpacing = 1.8;
    drawTextLine0092.origin = CGPointMake(3267, 315);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0092];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 471;
    [edge0005.elements addObject:haul0035];

    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(3259.5, 292);
    drawLine0071.endPoint = CGPointMake(3346, 292);
    drawLine0071.width = 12;
    drawLine0071.color = line0002.color;
    [haul0035.drawPrimitives addObject:drawLine0071];

    // Добавляем станцию McCowan
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0005.elements addObject:station0037];

    station0037.nameOriginal = @"McCowan";
    station0037.mapLocation = CGPointMake(3346, 292);
    station0037.geoLocation = CGPointMake(43.774931, -79.251667);

    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(3346, 270);
    drawLine0072.endPoint = CGPointMake(3346, 314);
    drawLine0072.width = 8;
    drawLine0072.color = line0002.color;
    [station0037.drawPrimitives addObject:drawLine0072];

    MWDrawTextLine *drawTextLine0093 = [[MWDrawTextLine alloc] init];
    drawTextLine0093.text = station0037.nameOriginal;
    drawTextLine0093.radians = 30 * M_PI / 180;
    drawTextLine0093.fontName = @"HelveticaNeue-Bold";
    drawTextLine0093.fontColor = [UIColor blackColor];
    drawTextLine0093.fontSize = 40;
    drawTextLine0093.kernSpacing = 1.8;
    drawTextLine0093.origin = CGPointMake(3346, 314);
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0093];

    // Добавляем вершину
    edge0005.finishVertex = vertex0006;
    
    ////////////////////////////////////////////////////////////////
    // 3. Sheppard
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Sheppard-Yonge - Don Mills
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Sheppard-Yonge - Don Mills";
    [self.edges addObject:(edge0006)];

    // Добавляем линию
    edge0006.line = line0003;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0007;
    
    // Добавляем станцию Sheppard-Yonge
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0006.elements addObject:station0038];
    
    station0038.nameOriginal = @"Sheppard-Yonge";
    station0038.mapLocation = CGPointMake(1672, 186);
    station0038.geoLocation = CGPointMake(43.761389, -79.410833);

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"Sheppard-";
    drawTextLine0030.fontName = @"HelveticaNeue-Bold";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 40;
    drawTextLine0030.kernSpacing = 1.8;
    drawTextLine0030.origin = CGPointMake(1423, 136);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0030];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"Yonge";
    drawTextLine0031.fontName = @"HelveticaNeue-Bold";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 40;
    drawTextLine0031.kernSpacing = 1.8;
    drawTextLine0031.origin = CGPointMake(1512, 178);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0031];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 2037;
    [edge0006.elements addObject:haul0036];

    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(1672, 186);
    drawLine0073.endPoint = CGPointMake(1852, 186);
    drawLine0073.width = 12;
    drawLine0073.color = line0003.color;
    [haul0036.drawPrimitives addObject:drawLine0073];

    // Добавляем станцию Bayview
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0006.elements addObject:station0039];
    
    station0039.nameOriginal = @"Bayview";
    station0039.mapLocation = CGPointMake(1852, 186);
    station0039.geoLocation = CGPointMake(43.766944, -79.386667);
    
    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(1852, 186);
    drawLine0074.endPoint = CGPointMake(1852, 208);
    drawLine0074.width = 8;
    drawLine0074.color = line0003.color;
    [station0039.drawPrimitives addObject:drawLine0074];

    MWDrawTextLine *drawTextLine0094 = [[MWDrawTextLine alloc] init];
    drawTextLine0094.text = station0039.nameOriginal;
    drawTextLine0094.radians = 60 * M_PI / 180;
    drawTextLine0094.fontName = @"HelveticaNeue-Bold";
    drawTextLine0094.fontColor = [UIColor blackColor];
    drawTextLine0094.fontSize = 40;
    drawTextLine0094.kernSpacing = 1.8;
    drawTextLine0094.origin = CGPointMake(1875, 211);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0094];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 861;
    [edge0006.elements addObject:haul0037];

    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(1851.5, 186);
    drawLine0075.endPoint = CGPointMake(2042, 186);
    drawLine0075.width = 12;
    drawLine0075.color = line0003.color;
    [haul0037.drawPrimitives addObject:drawLine0075];

    // Добавляем станцию Bessarion
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0006.elements addObject:station0040];
    
    station0040.nameOriginal = @"Bessarion";
    station0040.mapLocation = CGPointMake(2042, 186);
    station0040.geoLocation = CGPointMake(43.769167, -79.376389);

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(2042, 186);
    drawLine0076.endPoint = CGPointMake(2042, 208);
    drawLine0076.width = 8;
    drawLine0076.color = line0003.color;
    [station0040.drawPrimitives addObject:drawLine0076];

    MWDrawTextLine *drawTextLine0095 = [[MWDrawTextLine alloc] init];
    drawTextLine0095.text = station0040.nameOriginal;
    drawTextLine0095.radians = 60 * M_PI / 180;
    drawTextLine0095.fontName = @"HelveticaNeue-Bold";
    drawTextLine0095.fontColor = [UIColor blackColor];
    drawTextLine0095.fontSize = 40;
    drawTextLine0095.kernSpacing = 1.8;
    drawTextLine0095.origin = CGPointMake(2066, 210);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0095];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 925;
    [edge0006.elements addObject:haul0038];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(2041.5, 186);
    drawLine0077.endPoint = CGPointMake(2212, 186);
    drawLine0077.width = 12;
    drawLine0077.color = line0003.color;
    [haul0038.drawPrimitives addObject:drawLine0077];

    // Добавляем станцию Leslie
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0006.elements addObject:station0041];
    
    station0041.nameOriginal = @"Leslie";
    station0041.mapLocation = CGPointMake(2212, 186);
    station0041.geoLocation = CGPointMake(43.771389, -79.365278);

    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(2212, 186);
    drawLine0078.endPoint = CGPointMake(2212, 208);
    drawLine0078.width = 8;
    drawLine0078.color = line0003.color;
    [station0041.drawPrimitives addObject:drawLine0078];

    MWDrawTextLine *drawTextLine0096 = [[MWDrawTextLine alloc] init];
    drawTextLine0096.text = station0041.nameOriginal;
    drawTextLine0096.radians = 60 * M_PI / 180;
    drawTextLine0096.fontName = @"HelveticaNeue-Bold";
    drawTextLine0096.fontColor = [UIColor blackColor];
    drawTextLine0096.fontSize = 40;
    drawTextLine0096.kernSpacing = 1.8;
    drawTextLine0096.origin = CGPointMake(2234, 211);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0096];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 1569;
    [edge0006.elements addObject:haul0039];

    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(2211.5, 186);
    drawLine0079.endPoint = CGPointMake(2380, 186);
    drawLine0079.width = 12;
    drawLine0079.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawLine0079];

    // Добавляем станцию Don Mills
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0006.elements addObject:station0042];
    
    station0042.nameOriginal = @"Don Mills";
    station0042.mapLocation = CGPointMake(2380, 186);
    station0042.geoLocation = CGPointMake(43.775, -79.346389);

    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(2380, 164);
    drawLine0080.endPoint = CGPointMake(2380, 208);
    drawLine0080.width = 8;
    drawLine0080.color = line0003.color;
    [station0042.drawPrimitives addObject:drawLine0080];

    MWDrawTextLine *drawTextLine0097 = [[MWDrawTextLine alloc] init];
    drawTextLine0097.text = station0042.nameOriginal;
    drawTextLine0097.radians = 60 * M_PI / 180;
    drawTextLine0097.fontName = @"HelveticaNeue-Bold";
    drawTextLine0097.fontColor = [UIColor blackColor];
    drawTextLine0097.fontSize = 40;
    drawTextLine0097.kernSpacing = 1.8;
    drawTextLine0097.origin = CGPointMake(2403, 211);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0097];

    // Добавляем вершину
    edge0006.finishVertex = vertex0008;

    ////////////////////////////////////////////////////////////////
    // 4. Yonge-University-Spadina
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Downsview - Spadina
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Downsview - Spadina";
    [self.edges addObject:(edge0007)];

    // Добавляем линию
    edge0007.line = line0004;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0009;
    
    // Добавляем станцию Downsview
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0007.elements addObject:station0043];
    
    station0043.nameOriginal = @"Downsview";
    station0043.mapLocation = CGPointMake(1036, 186);
    station0043.geoLocation = CGPointMake(43.749444, -79.461944);

    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(1014, 186);
    drawLine0081.endPoint = CGPointMake(1058, 186);
    drawLine0081.width = 8;
    drawLine0081.color = line0004.color;
    [station0043.drawPrimitives addObject:drawLine0081];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0043.nameOriginal;
    drawTextLine0032.fontName = @"HelveticaNeue-Bold";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 40;
    drawTextLine0032.kernSpacing = 1.8;
    drawTextLine0032.origin = CGPointMake(1066, 162);
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0032];

    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 1951;
    [edge0007.elements addObject:haul0040];

    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(1036, 186);
    drawLine0082.endPoint = CGPointMake(1036, 260);
    drawLine0082.width = 12;
    drawLine0082.color = line0004.color;
    [haul0040.drawPrimitives addObject:drawLine0082];

    // Добавляем станцию Wilson
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0007.elements addObject:station0044];
    
    station0044.nameOriginal = @"Wilson";
    station0044.mapLocation = CGPointMake(1036, 260);
    station0044.geoLocation = CGPointMake(43.734167, -79.45);

    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(1036, 260);
    drawLine0083.endPoint = CGPointMake(1058, 260);
    drawLine0083.width = 8;
    drawLine0083.color = line0004.color;
    [station0044.drawPrimitives addObject:drawLine0083];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0044.nameOriginal;
    drawTextLine0033.fontName = @"HelveticaNeue-Bold";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 40;
    drawTextLine0033.kernSpacing = 1.8;
    drawTextLine0033.origin = CGPointMake(1066, 236);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0033];

    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 1087;
    [edge0007.elements addObject:haul0041];

    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(1036, 259.5);
    drawLine0084.endPoint = CGPointMake(1036, 344);
    drawLine0084.width = 12;
    drawLine0084.color = line0004.color;
    [haul0041.drawPrimitives addObject:drawLine0084];

    // Добавляем станцию Yorkdale
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0007.elements addObject:station0045];
    
    station0045.nameOriginal = @"Yorkdale";
    station0045.mapLocation = CGPointMake(1036, 344);
    station0045.geoLocation = CGPointMake(43.724584, -79.447321);

    MWDrawLine *drawLine0085 = [[MWDrawLine alloc] init];
    drawLine0085.startPoint = CGPointMake(1036, 344);
    drawLine0085.endPoint = CGPointMake(1058, 344);
    drawLine0085.width = 8;
    drawLine0085.color = line0004.color;
    [station0045.drawPrimitives addObject:drawLine0085];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0045.nameOriginal;
    drawTextLine0034.fontName = @"HelveticaNeue-Bold";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 40;
    drawTextLine0034.kernSpacing = 1.8;
    drawTextLine0034.origin = CGPointMake(1066, 321);
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0034];

    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 1005;
    [edge0007.elements addObject:haul0042];

    MWDrawLine *drawLine0086 = [[MWDrawLine alloc] init];
    drawLine0086.startPoint = CGPointMake(1036, 343.5);
    drawLine0086.endPoint = CGPointMake(1036, 430);
    drawLine0086.width = 12;
    drawLine0086.color = line0004.color;
    [haul0042.drawPrimitives addObject:drawLine0086];

    // Добавляем станцию Lawrence West
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0007.elements addObject:station0046];
    
    station0046.nameOriginal = @"Lawrence West";
    station0046.mapLocation = CGPointMake(1036, 430);
    station0046.geoLocation = CGPointMake(43.715833, -79.444167);

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0046.nameOriginal;
    drawTextLine0035.fontName = @"HelveticaNeue-Bold";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 40;
    drawTextLine0035.kernSpacing = 1.8;
    drawTextLine0035.origin = CGPointMake(1066, 405);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0035];
    
    MWDrawLine *drawLine0087 = [[MWDrawLine alloc] init];
    drawLine0087.startPoint = CGPointMake(1036, 430);
    drawLine0087.endPoint = CGPointMake(1058, 430);
    drawLine0087.width = 8;
    drawLine0087.color = line0004.color;
    [station0046.drawPrimitives addObject:drawLine0087];

    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 817;
    [edge0007.elements addObject:haul0043];

    MWDrawLine *drawLine0088 = [[MWDrawLine alloc] init];
    drawLine0088.startPoint = CGPointMake(1036, 429.5);
    drawLine0088.endPoint = CGPointMake(1036, 516);
    drawLine0088.width = 12;
    drawLine0088.color = line0004.color;
    [haul0043.drawPrimitives addObject:drawLine0088];

    // Добавляем станцию Glencairn
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0007.elements addObject:station0047];
    
    station0047.nameOriginal = @"Glencairn";
    station0047.mapLocation = CGPointMake(1036, 516);
    station0047.geoLocation = CGPointMake(43.708889, -79.440833);

    MWDrawLine *drawLine0089 = [[MWDrawLine alloc] init];
    drawLine0089.startPoint = CGPointMake(1036, 516);
    drawLine0089.endPoint = CGPointMake(1058, 516);
    drawLine0089.width = 8;
    drawLine0089.color = line0004.color;
    [station0047.drawPrimitives addObject:drawLine0089];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = station0047.nameOriginal;
    drawTextLine0036.fontName = @"HelveticaNeue-Bold";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 40;
    drawTextLine0036.kernSpacing = 1.8;
    drawTextLine0036.origin = CGPointMake(1066, 492);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0036];

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 1149;
    [edge0007.elements addObject:haul0044];

    MWDrawLine *drawLine0090 = [[MWDrawLine alloc] init];
    drawLine0090.startPoint = CGPointMake(1036, 515.5);
    drawLine0090.endPoint = CGPointMake(1036, 600);
    drawLine0090.width = 12;
    drawLine0090.color = line0004.color;
    [haul0044.drawPrimitives addObject:drawLine0090];

    // Добавляем станцию Eglinton West
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0007.elements addObject:station0048];
    
    station0048.nameOriginal = @"Eglinton West";
    station0048.mapLocation = CGPointMake(1036, 600);
    station0048.geoLocation = CGPointMake(43.699209, -79.435819);

    MWDrawLine *drawLine0091 = [[MWDrawLine alloc] init];
    drawLine0091.startPoint = CGPointMake(1036, 600);
    drawLine0091.endPoint = CGPointMake(1058, 600);
    drawLine0091.width = 8;
    drawLine0091.color = line0004.color;
    [station0048.drawPrimitives addObject:drawLine0091];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"Eglinton";
    drawTextLine0037.fontName = @"HelveticaNeue-Bold";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 40;
    drawTextLine0037.kernSpacing = 1.8;
    drawTextLine0037.origin = CGPointMake(1066, 572);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0037];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"West";
    drawTextLine0038.fontName = @"HelveticaNeue-Bold";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 40;
    drawTextLine0038.kernSpacing = 1.8;
    drawTextLine0038.origin = CGPointMake(1066, 623);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0038];

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 2382;
    [edge0007.elements addObject:haul0045];

    MWDrawLine *drawLine0092 = [[MWDrawLine alloc] init];
    drawLine0092.startPoint = CGPointMake(1036, 599.5);
    drawLine0092.endPoint = CGPointMake(1036, 675);
    drawLine0092.width = 12;
    drawLine0092.color = line0004.color;
    [haul0045.drawPrimitives addObject:drawLine0092];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(1076, 674);
    drawArc0004.startRadians = 135 * M_PI / 180;
    drawArc0004.endRadians = 180 * M_PI / 180;
    drawArc0004.radius = 40;
    drawArc0004.width = 12;
    drawArc0004.color = line0004.color;
    [haul0045.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0093 = [[MWDrawLine alloc] init];
    drawLine0093.startPoint = CGPointMake(1047, 701.5);
    drawLine0093.endPoint = CGPointMake(1100, 748);
    drawLine0093.width = 12;
    drawLine0093.color = line0004.color;
    [haul0045.drawPrimitives addObject:drawLine0093];

    // Добавляем станцию St. Clair West
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0007.elements addObject:station0049];
    
    station0049.nameOriginal = @"St. Clair West";
    station0049.mapLocation = CGPointMake(1100, 748);
    station0049.geoLocation = CGPointMake(43.683888, -79.415113);

    MWDrawLine *drawLine0094 = [[MWDrawLine alloc] init];
    drawLine0094.startPoint = CGPointMake(1100, 748);
    drawLine0094.endPoint = CGPointMake(1085, 763);
    drawLine0094.width = 8;
    drawLine0094.color = line0004.color;
    [station0049.drawPrimitives addObject:drawLine0094];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = @"St. Clair";
    drawTextLine0039.fontName = @"HelveticaNeue-Bold";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 40;
    drawTextLine0039.kernSpacing = 1.8;
    drawTextLine0039.origin = CGPointMake(911, 752);
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0039];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = @"West";
    drawTextLine0040.fontName = @"HelveticaNeue-Bold";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 40;
    drawTextLine0040.kernSpacing = 1.8;
    drawTextLine0040.origin = CGPointMake(968, 792);
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0040];

    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 1230;
    [edge0007.elements addObject:haul0046];

    MWDrawLine *drawLine0095 = [[MWDrawLine alloc] init];
    drawLine0095.startPoint = CGPointMake(1099.5, 747.5);
    drawLine0095.endPoint = CGPointMake(1204.5, 852);
    drawLine0095.width = 12;
    drawLine0095.color = line0004.color;
    [haul0046.drawPrimitives addObject:drawLine0095];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(1176, 880);
    drawArc0005.startRadians = 315 * M_PI / 180;
    drawArc0005.endRadians = 360 * M_PI / 180;
    drawArc0005.radius = 40;
    drawArc0005.width = 12;
    drawArc0005.color = line0004.color;
    [haul0046.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0096 = [[MWDrawLine alloc] init];
    drawLine0096.startPoint = CGPointMake(1216, 880);
    drawLine0096.endPoint = CGPointMake(1216, 888);
    drawLine0096.width = 12;
    drawLine0096.color = line0004.color;
    [haul0046.drawPrimitives addObject:drawLine0096];

    // Добавляем станцию Dupont
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0007.elements addObject:station0050];
    
    station0050.nameOriginal = @"Dupont";
    station0050.mapLocation = CGPointMake(1216, 888);
    station0050.geoLocation = CGPointMake(43.674584, -79.40683);

    MWDrawLine *drawLine0097 = [[MWDrawLine alloc] init];
    drawLine0097.startPoint = CGPointMake(1216, 888);
    drawLine0097.endPoint = CGPointMake(1231, 888);
    drawLine0097.width = 8;
    drawLine0097.color = line0004.color;
    [station0050.drawPrimitives addObject:drawLine0097];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0050.nameOriginal;
    drawTextLine0041.fontName = @"HelveticaNeue-Bold";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 40;
    drawTextLine0041.kernSpacing = 1.8;
    drawTextLine0041.origin = CGPointMake(1246, 867);
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0041];
    
    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 852;
    [edge0007.elements addObject:haul0047];

    MWDrawLine *drawLine0098 = [[MWDrawLine alloc] init];
    drawLine0098.startPoint = CGPointMake(1216, 888);
    drawLine0098.endPoint = CGPointMake(1216, 960);
    drawLine0098.width = 12;
    drawLine0098.color = line0004.color;
    [haul0047.drawPrimitives addObject:drawLine0098];

    // Добавляем станцию Spadina
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0007.elements addObject:station0051];
    
    station0051.nameOriginal = @"Spadina";
    station0051.mapLocation = CGPointMake(1216, 960);
    station0051.geoLocation = CGPointMake(43.667222, -79.403889);

    MWDrawLine *drawLine0099 = [[MWDrawLine alloc] init];
    drawLine0099.startPoint = CGPointMake(1216, 960);
    drawLine0099.endPoint = CGPointMake(1201, 960);
    drawLine0099.width = 8;
    drawLine0099.color = line0004.color;
    [station0051.drawPrimitives addObject:drawLine0099];

    station0051.showNameOnMap = false;
    [station0051.nameOriginalTextPrimitives addObject:drawTextLine0001];
    
    // Добавляем вершину
    edge0007.finishVertex = vertex0002;

    // Создаем участок линии Spadina - St. George
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Spadina - St. George";
    [self.edges addObject:(edge0008)];
    
    // Добавляем линию
    edge0008.line = line0004;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0002;

    // Добавляем станцию Spadina
    [edge0008.elements addObject:station0051];

    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 342;
    [edge0008.elements addObject:haul0048];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(1276, 960);
    drawArc0006.startRadians = 90 * M_PI / 180;
    drawArc0006.endRadians = 180 * M_PI / 180;
    drawArc0006.radius = 60;
    drawArc0006.width = 12;
    drawArc0006.color = line0004.color;
    [haul0048.drawPrimitives addObject:drawArc0006];

    MWDrawLine *drawLine0100 = [[MWDrawLine alloc] init];
    drawLine0100.startPoint = CGPointMake(1275, 1020);
    drawLine0100.endPoint = CGPointMake(1338, 1020);
    drawLine0100.width = 12;
    drawLine0100.color = line0004.color;
    [haul0048.drawPrimitives addObject:drawLine0100];

    // Добавляем станцию St. George
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0008.elements addObject:station0052];
    
    station0052.nameOriginal = @"St. George";
    station0052.mapLocation = CGPointMake(1338, 1020);
    station0052.geoLocation = CGPointMake(43.668264, -79.399889);

    MWDrawLine *drawLine0101 = [[MWDrawLine alloc] init];
    drawLine0101.startPoint = CGPointMake(1338, 1020);
    drawLine0101.endPoint = CGPointMake(1338, 1005);
    drawLine0101.width = 8;
    drawLine0101.color = line0004.color;
    [station0052.drawPrimitives addObject:drawLine0101];

    station0052.showNameOnMap = false;
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0002];
    
    // Добавляем вершину
    edge0008.finishVertex = vertex0003;

    // Создаем участок линии St. George - Bloor-Yonge
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: St. George - Bloor-Yonge";
    [self.edges addObject:(edge0009)];

    // Добавляем линию
    edge0009.line = line0004;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0003;

    // Добавляем станцию St. George
    [edge0009.elements addObject:station0052];

    // Добавляем перегон
    MWHaul *haul0049 = [[MWHaul alloc] init];
    haul0049.identifier = @"haul0049";
    haul0049.length = 518;
    [edge0009.elements addObject:haul0049];
    
    MWDrawLine *drawLine0102 = [[MWDrawLine alloc] init];
    drawLine0102.startPoint = CGPointMake(1338, 1020);
    drawLine0102.endPoint = CGPointMake(1401, 1020);
    drawLine0102.width = 12;
    drawLine0102.color = line0004.color;
    [haul0049.drawPrimitives addObject:drawLine0102];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(1400, 1080);
    drawArc0007.startRadians = 270 * M_PI / 180;
    drawArc0007.endRadians = 0 * M_PI / 180;
    drawArc0007.radius = 60;
    drawArc0007.width = 12;
    drawArc0007.color = line0004.color;
    [haul0049.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0103 = [[MWDrawLine alloc] init];
    drawLine0103.startPoint = CGPointMake(1460, 1080);
    drawLine0103.endPoint = CGPointMake(1460, 1097);
    drawLine0103.width = 12;
    drawLine0103.color = line0004.color;
    [haul0049.drawPrimitives addObject:drawLine0103];

    // Добавляем станцию Museum
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0009.elements addObject:station0053];
    
    station0053.nameOriginal = @"Museum";
    station0053.mapLocation = CGPointMake(1460, 1097);
    station0053.geoLocation = CGPointMake(43.667222, -79.393611);

    MWDrawLine *drawLine0104 = [[MWDrawLine alloc] init];
    drawLine0104.startPoint = CGPointMake(1460, 1097);
    drawLine0104.endPoint = CGPointMake(1445, 1097);
    drawLine0104.width = 8;
    drawLine0104.color = line0004.color;
    [station0053.drawPrimitives addObject:drawLine0104];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = station0053.nameOriginal;
    drawTextLine0042.fontName = @"HelveticaNeue-Bold";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 40;
    drawTextLine0042.kernSpacing = 1.8;
    drawTextLine0042.origin = CGPointMake(1252, 1075);
    [station0053.nameOriginalTextPrimitives addObject:drawTextLine0042];

    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 839;
    [edge0009.elements addObject:haul0050];

    MWDrawLine *drawLine0105 = [[MWDrawLine alloc] init];
    drawLine0105.startPoint = CGPointMake(1460, 1096.5);
    drawLine0105.endPoint = CGPointMake(1460, 1184);
    drawLine0105.width = 12;
    drawLine0105.color = line0004.color;
    [haul0050.drawPrimitives addObject:drawLine0105];

    // Добавляем станцию Queen's Park
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0009.elements addObject:station0054];
    
    station0054.nameOriginal = @"Queen's Park";
    station0054.mapLocation = CGPointMake(1460, 1184);
    station0054.geoLocation = CGPointMake(43.66, -79.390556);

    MWDrawLine *drawLine0106 = [[MWDrawLine alloc] init];
    drawLine0106.startPoint = CGPointMake(1460, 1184);
    drawLine0106.endPoint = CGPointMake(1445, 1184);
    drawLine0106.width = 8;
    drawLine0106.color = line0004.color;
    [station0054.drawPrimitives addObject:drawLine0106];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = station0054.nameOriginal;
    drawTextLine0043.fontName = @"HelveticaNeue-Bold";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 40;
    drawTextLine0043.kernSpacing = 1.8;
    drawTextLine0043.origin = CGPointMake(1157, 1157);
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0043];

    // Добавляем перегон
    MWHaul *haul0051 = [[MWHaul alloc] init];
    haul0051.identifier = @"haul0051";
    haul0051.length = 613;
    [edge0009.elements addObject:haul0051];

    MWDrawLine *drawLine0107 = [[MWDrawLine alloc] init];
    drawLine0107.startPoint = CGPointMake(1460, 1183.5);
    drawLine0107.endPoint = CGPointMake(1460, 1268);
    drawLine0107.width = 12;
    drawLine0107.color = line0004.color;
    [haul0051.drawPrimitives addObject:drawLine0107];

    // Добавляем станцию St. Patrick
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0009.elements addObject:station0055];
    
    station0055.nameOriginal = @"St. Patrick";
    station0055.mapLocation = CGPointMake(1460, 1268);
    station0055.geoLocation = CGPointMake(43.654722, -79.388333);

    MWDrawLine *drawLine0108 = [[MWDrawLine alloc] init];
    drawLine0108.startPoint = CGPointMake(1460, 1268);
    drawLine0108.endPoint = CGPointMake(1445, 1268);
    drawLine0108.width = 8;
    drawLine0108.color = line0004.color;
    [station0055.drawPrimitives addObject:drawLine0108];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = station0055.nameOriginal;
    drawTextLine0044.fontName = @"HelveticaNeue-Bold";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 40;
    drawTextLine0044.kernSpacing = 1.8;
    drawTextLine0044.origin = CGPointMake(1211, 1244);
    [station0055.nameOriginalTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0052 = [[MWHaul alloc] init];
    haul0052.identifier = @"haul0052";
    haul0052.length = 452;
    [edge0009.elements addObject:haul0052];

    MWDrawLine *drawLine0109 = [[MWDrawLine alloc] init];
    drawLine0109.startPoint = CGPointMake(1460, 1267.5);
    drawLine0109.endPoint = CGPointMake(1460, 1364);
    drawLine0109.width = 12;
    drawLine0109.color = line0004.color;
    [haul0052.drawPrimitives addObject:drawLine0109];

    // Добавляем станцию Osgoode
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0009.elements addObject:station0056];
    
    station0056.nameOriginal = @"Osgoode";
    station0056.mapLocation = CGPointMake(1460, 1364);
    station0056.geoLocation = CGPointMake(43.650833, -79.386667);

    MWDrawLine *drawLine0110 = [[MWDrawLine alloc] init];
    drawLine0110.startPoint = CGPointMake(1460, 1364);
    drawLine0110.endPoint = CGPointMake(1445, 1364);
    drawLine0110.width = 8;
    drawLine0110.color = line0004.color;
    [station0056.drawPrimitives addObject:drawLine0110];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = station0056.nameOriginal;
    drawTextLine0045.fontName = @"HelveticaNeue-Bold";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 40;
    drawTextLine0045.kernSpacing = 1.8;
    drawTextLine0045.origin = CGPointMake(1244, 1336);
    [station0056.nameOriginalTextPrimitives addObject:drawTextLine0045];

    // Добавляем перегон
    MWHaul *haul0053 = [[MWHaul alloc] init];
    haul0053.identifier = @"haul0053";
    haul0053.length = 374;
    [edge0009.elements addObject:haul0053];

    MWDrawLine *drawLine0111 = [[MWDrawLine alloc] init];
    drawLine0111.startPoint = CGPointMake(1460, 1363.5);
    drawLine0111.endPoint = CGPointMake(1460, 1460);
    drawLine0111.width = 12;
    drawLine0111.color = line0004.color;
    [haul0053.drawPrimitives addObject:drawLine0111];

    // Добавляем станцию St. Andrew
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0009.elements addObject:station0057];
    
    station0057.nameOriginal = @"St. Andrew";
    station0057.mapLocation = CGPointMake(1460, 1460);
    station0057.geoLocation = CGPointMake(43.647778, -79.384722);

    MWDrawLine *drawLine0112 = [[MWDrawLine alloc] init];
    drawLine0112.startPoint = CGPointMake(1460, 1460);
    drawLine0112.endPoint = CGPointMake(1445, 1460);
    drawLine0112.width = 8;
    drawLine0112.color = line0004.color;
    [station0057.drawPrimitives addObject:drawLine0112];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = station0057.nameOriginal;
    drawTextLine0046.fontName = @"HelveticaNeue-Bold";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 40;
    drawTextLine0046.kernSpacing = 1.8;
    drawTextLine0046.origin = CGPointMake(1204, 1436);
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0046];

    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 413;
    [edge0009.elements addObject:haul0054];

    MWDrawLine *drawLine0113 = [[MWDrawLine alloc] init];
    drawLine0113.startPoint = CGPointMake(1460, 1459.5);
    drawLine0113.endPoint = CGPointMake(1460, 1464);
    drawLine0113.width = 12;
    drawLine0113.color = line0004.color;
    [haul0054.drawPrimitives addObject:drawLine0113];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(1540, 1464);
    drawArc0008.startRadians = 90 * M_PI / 180;
    drawArc0008.endRadians = 180 * M_PI / 180;
    drawArc0008.radius = 80;
    drawArc0008.width = 12;
    drawArc0008.color = line0004.color;
    [haul0054.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0114 = [[MWDrawLine alloc] init];
    drawLine0114.startPoint = CGPointMake(1540, 1544);
    drawLine0114.endPoint = CGPointMake(1566, 1544);
    drawLine0114.width = 12;
    drawLine0114.color = line0004.color;
    [haul0054.drawPrimitives addObject:drawLine0114];
    
    // Добавляем станцию Union
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0009.elements addObject:station0058];
    
    station0058.nameOriginal = @"Union";
    station0058.mapLocation = CGPointMake(1566, 1544);
    station0058.geoLocation = CGPointMake(43.645661, -79.380503);

    MWDrawLine *drawLine0115 = [[MWDrawLine alloc] init];
    drawLine0115.startPoint = CGPointMake(1566, 1544);
    drawLine0115.endPoint = CGPointMake(1566, 1564);
    drawLine0115.width = 8;
    drawLine0115.color = line0004.color;
    [station0058.drawPrimitives addObject:drawLine0115];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = station0058.nameOriginal;
    drawTextLine0047.fontName = @"HelveticaNeue-Bold";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 40;
    drawTextLine0047.kernSpacing = 1.8;
    drawTextLine0047.origin = CGPointMake(1506, 1568);
    [station0058.nameOriginalTextPrimitives addObject:drawTextLine0047];

    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 447;
    [edge0009.elements addObject:haul0055];

    MWDrawLine *drawLine0116 = [[MWDrawLine alloc] init];
    drawLine0116.startPoint = CGPointMake(1566, 1544);
    drawLine0116.endPoint = CGPointMake(1592, 1544);
    drawLine0116.width = 12;
    drawLine0116.color = line0004.color;
    [haul0055.drawPrimitives addObject:drawLine0116];

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(1592, 1464);
    drawArc0009.startRadians = 0 * M_PI / 180;
    drawArc0009.endRadians = 90 * M_PI / 180;
    drawArc0009.radius = 80;
    drawArc0009.width = 12;
    drawArc0009.color = line0004.color;
    [haul0055.drawPrimitives addObject:drawArc0009];

    MWDrawLine *drawLine0117 = [[MWDrawLine alloc] init];
    drawLine0117.startPoint = CGPointMake(1672, 1464);
    drawLine0117.endPoint = CGPointMake(1672, 1460);
    drawLine0117.width = 12;
    drawLine0117.color = line0004.color;
    [haul0055.drawPrimitives addObject:drawLine0117];

    // Добавляем станцию King
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0009.elements addObject:station0059];
    
    station0059.nameOriginal = @"King";
    station0059.mapLocation = CGPointMake(1672, 1460);
    station0059.geoLocation = CGPointMake(43.649167, -79.377778);

    MWDrawLine *drawLine0118 = [[MWDrawLine alloc] init];
    drawLine0118.startPoint = CGPointMake(1672, 1460);
    drawLine0118.endPoint = CGPointMake(1687, 1460);
    drawLine0118.width = 8;
    drawLine0118.color = line0004.color;
    [station0059.drawPrimitives addObject:drawLine0118];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0059.nameOriginal;
    drawTextLine0048.fontName = @"HelveticaNeue-Bold";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 40;
    drawTextLine0048.kernSpacing = 1.8;
    drawTextLine0048.origin = CGPointMake(1700, 1432);
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0048];

    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 414;
    [edge0009.elements addObject:haul0056];

    MWDrawLine *drawLine0119 = [[MWDrawLine alloc] init];
    drawLine0119.startPoint = CGPointMake(1672, 1460.5);
    drawLine0119.endPoint = CGPointMake(1672, 1364);
    drawLine0119.width = 12;
    drawLine0119.color = line0004.color;
    [haul0056.drawPrimitives addObject:drawLine0119];

    // Добавляем станцию Queen
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0009.elements addObject:station0060];
    
    station0060.nameOriginal = @"Queen";
    station0060.mapLocation = CGPointMake(1672, 1364);
    station0060.geoLocation = CGPointMake(43.652708, -79.379375);

    MWDrawLine *drawLine0120 = [[MWDrawLine alloc] init];
    drawLine0120.startPoint = CGPointMake(1672, 1364);
    drawLine0120.endPoint = CGPointMake(1687, 1364);
    drawLine0120.width = 8;
    drawLine0120.color = line0004.color;
    [station0060.drawPrimitives addObject:drawLine0120];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0060.nameOriginal;
    drawTextLine0049.fontName = @"HelveticaNeue-Bold";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 40;
    drawTextLine0049.kernSpacing = 1.8;
    drawTextLine0049.origin = CGPointMake(1700, 1337);
    [station0060.nameOriginalTextPrimitives addObject:drawTextLine0049];

    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 423;
    [edge0009.elements addObject:haul0057];

    MWDrawLine *drawLine0121 = [[MWDrawLine alloc] init];
    drawLine0121.startPoint = CGPointMake(1672, 1364.5);
    drawLine0121.endPoint = CGPointMake(1672, 1268);
    drawLine0121.width = 12;
    drawLine0121.color = line0004.color;
    [haul0057.drawPrimitives addObject:drawLine0121];

    // Добавляем станцию Dundas
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0009.elements addObject:station0061];
    
    station0061.nameOriginal = @"Dundas";
    station0061.mapLocation = CGPointMake(1672, 1268);
    station0061.geoLocation = CGPointMake(43.656344, -79.380914);

    MWDrawLine *drawLine0122 = [[MWDrawLine alloc] init];
    drawLine0122.startPoint = CGPointMake(1672, 1268);
    drawLine0122.endPoint = CGPointMake(1687, 1268);
    drawLine0122.width = 8;
    drawLine0122.color = line0004.color;
    [station0061.drawPrimitives addObject:drawLine0122];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = station0061.nameOriginal;
    drawTextLine0050.fontName = @"HelveticaNeue-Bold";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 40;
    drawTextLine0050.kernSpacing = 1.8;
    drawTextLine0050.origin = CGPointMake(1700, 1245);
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0050];

    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 577;
    [edge0009.elements addObject:haul0058];

    MWDrawLine *drawLine0123 = [[MWDrawLine alloc] init];
    drawLine0123.startPoint = CGPointMake(1672, 1268.5);
    drawLine0123.endPoint = CGPointMake(1672, 1184);
    drawLine0123.width = 12;
    drawLine0123.color = line0004.color;
    [haul0058.drawPrimitives addObject:drawLine0123];

    // Добавляем станцию College
    MWStation *station0062 = [[MWStation alloc] init];
    station0062.identifier = @"station0062";
    [edge0009.elements addObject:station0062];
    
    station0062.nameOriginal = @"College";
    station0062.mapLocation = CGPointMake(1672, 1184);
    station0062.geoLocation = CGPointMake(43.661289, -79.383094);

    MWDrawLine *drawLine0124 = [[MWDrawLine alloc] init];
    drawLine0124.startPoint = CGPointMake(1672, 1184);
    drawLine0124.endPoint = CGPointMake(1687, 1184);
    drawLine0124.width = 8;
    drawLine0124.color = line0004.color;
    [station0062.drawPrimitives addObject:drawLine0124];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = station0062.nameOriginal;
    drawTextLine0051.fontName = @"HelveticaNeue-Bold";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 40;
    drawTextLine0051.kernSpacing = 1.8;
    drawTextLine0051.origin = CGPointMake(1700, 1155);
    [station0062.nameOriginalTextPrimitives addObject:drawTextLine0051];

    // Добавляем перегон
    MWHaul *haul0059 = [[MWHaul alloc] init];
    haul0059.identifier = @"haul0059";
    haul0059.length = 448;
    [edge0009.elements addObject:haul0059];

    MWDrawLine *drawLine0125 = [[MWDrawLine alloc] init];
    drawLine0125.startPoint = CGPointMake(1672, 1184.5);
    drawLine0125.endPoint = CGPointMake(1672, 1100);
    drawLine0125.width = 12;
    drawLine0125.color = line0004.color;
    [haul0059.drawPrimitives addObject:drawLine0125];

    // Добавляем станцию Wellesley
    MWStation *station0063 = [[MWStation alloc] init];
    station0063.identifier = @"station0063";
    [edge0009.elements addObject:station0063];
    
    station0063.nameOriginal = @"Wellesley";
    station0063.mapLocation = CGPointMake(1672, 1100);
    station0063.geoLocation = CGPointMake(43.665278, -79.383889);

    MWDrawLine *drawLine0126 = [[MWDrawLine alloc] init];
    drawLine0126.startPoint = CGPointMake(1672, 1100);
    drawLine0126.endPoint = CGPointMake(1687, 1100);
    drawLine0126.width = 8;
    drawLine0126.color = line0004.color;
    [station0063.drawPrimitives addObject:drawLine0126];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0063.nameOriginal;
    drawTextLine0052.fontName = @"HelveticaNeue-Bold";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 40;
    drawTextLine0052.kernSpacing = 1.8;
    drawTextLine0052.origin = CGPointMake(1700, 1072);
    [station0063.nameOriginalTextPrimitives addObject:drawTextLine0052];

    // Добавляем перегон
    MWHaul *haul0060 = [[MWHaul alloc] init];
    haul0060.identifier = @"haul0060";
    haul0060.length = 667;
    [edge0009.elements addObject:haul0060];

    MWDrawLine *drawLine0127 = [[MWDrawLine alloc] init];
    drawLine0127.startPoint = CGPointMake(1672, 1100.5);
    drawLine0127.endPoint = CGPointMake(1672, 1014);
    drawLine0127.width = 12;
    drawLine0127.color = line0004.color;
    [haul0060.drawPrimitives addObject:drawLine0127];

    // Добавляем станцию Bloor-Yonge
    MWStation *station0064 = [[MWStation alloc] init];
    station0064.identifier = @"station0064";
    [edge0009.elements addObject:station0064];
    
    station0064.nameOriginal = @"Bloor-Yonge";
    station0064.mapLocation = CGPointMake(1672, 1014);
    station0064.geoLocation = CGPointMake(43.671111, -79.385833);

    MWDrawLine *drawLine0128 = [[MWDrawLine alloc] init];
    drawLine0128.startPoint = CGPointMake(1672, 1014);
    drawLine0128.endPoint = CGPointMake(1657, 1014);
    drawLine0128.width = 8;
    drawLine0128.color = line0004.color;
    [station0064.drawPrimitives addObject:drawLine0128];

    station0064.showNameOnMap = false;
    [station0064.nameOriginalTextPrimitives addObject:drawTextLine0004];
    [station0064.nameOriginalTextPrimitives addObject:drawTextLine0004];
    
    // Добавляем вершину
    edge0009.finishVertex = vertex0004;

    // Создаем участок линии Bloor-Yonge - Sheppard-Yonge
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Bloor-Yonge - Sheppard-Yonge";
    [self.edges addObject:(edge0010)];

    // Добавляем линию
    edge0010.line = line0004;
    
    // Добавляем вершину
    edge0010.startVertex = vertex0004;

    // Добавляем станцию Bloor-Yonge
    [edge0010.elements addObject:station0064];

    // Добавляем перегон
    MWHaul *haul0061 = [[MWHaul alloc] init];
    haul0061.identifier = @"haul0061";
    haul0061.length = 693;
    [edge0010.elements addObject:haul0061];

    MWDrawLine *drawLine0129 = [[MWDrawLine alloc] init];
    drawLine0129.startPoint = CGPointMake(1672, 1014.5);
    drawLine0129.endPoint = CGPointMake(1672, 928);
    drawLine0129.width = 12;
    drawLine0129.color = line0004.color;
    [haul0061.drawPrimitives addObject:drawLine0129];

    // Добавляем станцию Rosedale
    MWStation *station0065 = [[MWStation alloc] init];
    station0065.identifier = @"station0065";
    [edge0010.elements addObject:station0065];
    
    station0065.nameOriginal = @"Rosedale";
    station0065.mapLocation = CGPointMake(1672, 928);
    station0065.geoLocation = CGPointMake(43.676944, -79.388889);

    MWDrawLine *drawLine0130 = [[MWDrawLine alloc] init];
    drawLine0130.startPoint = CGPointMake(1672, 928);
    drawLine0130.endPoint = CGPointMake(1657, 928);
    drawLine0130.width = 8;
    drawLine0130.color = line0004.color;
    [station0065.drawPrimitives addObject:drawLine0130];

    MWDrawTextLine *drawTextLine0098 = [[MWDrawTextLine alloc] init];
    drawTextLine0098.text = station0065.nameOriginal;
    drawTextLine0098.radians = 30 * M_PI / 180;
    drawTextLine0098.fontName = @"HelveticaNeue-Bold";
    drawTextLine0098.fontColor = [UIColor blackColor];
    drawTextLine0098.fontSize = 40;
    drawTextLine0098.kernSpacing = 1.8;
    drawTextLine0098.origin = CGPointMake(1484, 810);
    [station0065.nameOriginalTextPrimitives addObject:drawTextLine0098];
    
    // Добавляем перегон
    MWHaul *haul0062 = [[MWHaul alloc] init];
    haul0062.identifier = @"haul0062";
    haul0062.length = 607;
    [edge0010.elements addObject:haul0062];

    MWDrawLine *drawLine0131 = [[MWDrawLine alloc] init];
    drawLine0131.startPoint = CGPointMake(1672, 928.5);
    drawLine0131.endPoint = CGPointMake(1672, 844);
    drawLine0131.width = 12;
    drawLine0131.color = line0004.color;
    [haul0062.drawPrimitives addObject:drawLine0131];

    // Добавляем станцию Summerhill
    MWStation *station0066 = [[MWStation alloc] init];
    station0066.identifier = @"station0066";
    [edge0010.elements addObject:station0066];
    
    station0066.nameOriginal = @"Summerhill";
    station0066.mapLocation = CGPointMake(1672, 844);
    station0066.geoLocation = CGPointMake(43.682222, -79.390833);

    MWDrawLine *drawLine0132 = [[MWDrawLine alloc] init];
    drawLine0132.startPoint = CGPointMake(1672, 844);
    drawLine0132.endPoint = CGPointMake(1657, 844);
    drawLine0132.width = 8;
    drawLine0132.color = line0004.color;
    [station0066.drawPrimitives addObject:drawLine0132];

    MWDrawTextLine *drawTextLine0099 = [[MWDrawTextLine alloc] init];
    drawTextLine0099.text = station0066.nameOriginal;
    drawTextLine0099.radians = 30 * M_PI / 180;
    drawTextLine0099.fontName = @"HelveticaNeue-Bold";
    drawTextLine0099.fontColor = [UIColor blackColor];
    drawTextLine0099.fontSize = 40;
    drawTextLine0099.kernSpacing = 1.8;
    drawTextLine0099.origin = CGPointMake(1447, 704);
    [station0066.nameOriginalTextPrimitives addObject:drawTextLine0099];

    // Добавляем перегон
    MWHaul *haul0063 = [[MWHaul alloc] init];
    haul0063.identifier = @"haul0063";
    haul0063.length = 718;
    [edge0010.elements addObject:haul0063];

    MWDrawLine *drawLine0133 = [[MWDrawLine alloc] init];
    drawLine0133.startPoint = CGPointMake(1672, 844.5);
    drawLine0133.endPoint = CGPointMake(1672, 760);
    drawLine0133.width = 12;
    drawLine0133.color = line0004.color;
    [haul0063.drawPrimitives addObject:drawLine0133];

    // Добавляем станцию St. Clair
    MWStation *station0067 = [[MWStation alloc] init];
    station0067.identifier = @"station0067";
    [edge0010.elements addObject:station0067];
    
    station0067.nameOriginal = @"St. Clair";
    station0067.mapLocation = CGPointMake(1672, 760);
    station0067.geoLocation = CGPointMake(43.688217, -79.394142);

    MWDrawLine *drawLine0134 = [[MWDrawLine alloc] init];
    drawLine0134.startPoint = CGPointMake(1672, 760);
    drawLine0134.endPoint = CGPointMake(1687, 760);
    drawLine0134.width = 8;
    drawLine0134.color = line0004.color;
    [station0067.drawPrimitives addObject:drawLine0134];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = station0067.nameOriginal;
    drawTextLine0053.fontName = @"HelveticaNeue-Bold";
    drawTextLine0053.fontColor = [UIColor blackColor];
    drawTextLine0053.fontSize = 40;
    drawTextLine0053.kernSpacing = 1.8;
    drawTextLine0053.origin = CGPointMake(1700, 735);
    [station0067.nameOriginalTextPrimitives addObject:drawTextLine0053];

    // Добавляем перегон
    MWHaul *haul0064 = [[MWHaul alloc] init];
    haul0064.identifier = @"haul0064";
    haul0064.length = 1058;
    [edge0010.elements addObject:haul0064];

    MWDrawLine *drawLine0135 = [[MWDrawLine alloc] init];
    drawLine0135.startPoint = CGPointMake(1672, 760.5);
    drawLine0135.endPoint = CGPointMake(1672, 684);
    drawLine0135.width = 12;
    drawLine0135.color = line0004.color;
    [haul0064.drawPrimitives addObject:drawLine0135];

    // Добавляем станцию Davisville
    MWStation *station0068 = [[MWStation alloc] init];
    station0068.identifier = @"station0068";
    [edge0010.elements addObject:station0068];
    
    station0068.nameOriginal = @"Davisville";
    station0068.mapLocation = CGPointMake(1672, 684);
    station0068.geoLocation = CGPointMake(43.6975, -79.397028);

    MWDrawLine *drawLine0136 = [[MWDrawLine alloc] init];
    drawLine0136.startPoint = CGPointMake(1672, 684);
    drawLine0136.endPoint = CGPointMake(1687, 684);
    drawLine0136.width = 8;
    drawLine0136.color = line0004.color;
    [station0068.drawPrimitives addObject:drawLine0136];

    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = station0068.nameOriginal;
    drawTextLine0054.fontName = @"HelveticaNeue-Bold";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 40;
    drawTextLine0054.kernSpacing = 1.8;
    drawTextLine0054.origin = CGPointMake(1700, 661);
    [station0068.nameOriginalTextPrimitives addObject:drawTextLine0054];

    // Добавляем перегон
    MWHaul *haul0065 = [[MWHaul alloc] init];
    haul0065.identifier = @"haul0065";
    haul0065.length = 933;
    [edge0010.elements addObject:haul0065];

    MWDrawLine *drawLine0137 = [[MWDrawLine alloc] init];
    drawLine0137.startPoint = CGPointMake(1672, 684.5);
    drawLine0137.endPoint = CGPointMake(1672, 600);
    drawLine0137.width = 12;
    drawLine0137.color = line0004.color;
    [haul0065.drawPrimitives addObject:drawLine0137];

    // Добавляем станцию Eglinton
    MWStation *station0069 = [[MWStation alloc] init];
    station0069.identifier = @"station0069";
    [edge0010.elements addObject:station0069];
    
    station0069.nameOriginal = @"Eglinton";
    station0069.mapLocation = CGPointMake(1672, 600);
    station0069.geoLocation = CGPointMake(43.705833, -79.398333);

    MWDrawLine *drawLine0138 = [[MWDrawLine alloc] init];
    drawLine0138.startPoint = CGPointMake(1672, 600);
    drawLine0138.endPoint = CGPointMake(1687, 600);
    drawLine0138.width = 8;
    drawLine0138.color = line0004.color;
    [station0069.drawPrimitives addObject:drawLine0138];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = station0069.nameOriginal;
    drawTextLine0055.fontName = @"HelveticaNeue-Bold";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 40;
    drawTextLine0055.kernSpacing = 1.8;
    drawTextLine0055.origin = CGPointMake(1700, 572);
    [station0069.nameOriginalTextPrimitives addObject:drawTextLine0055];

    // Добавляем перегон
    MWHaul *haul0066 = [[MWHaul alloc] init];
    haul0066.identifier = @"haul0066";
    haul0066.length = 2154;
    [edge0010.elements addObject:haul0066];

    MWDrawLine *drawLine0139 = [[MWDrawLine alloc] init];
    drawLine0139.startPoint = CGPointMake(1672, 600.5);
    drawLine0139.endPoint = CGPointMake(1672, 430);
    drawLine0139.width = 12;
    drawLine0139.color = line0004.color;
    [haul0066.drawPrimitives addObject:drawLine0139];

    // Добавляем станцию Lawrence
    MWStation *station0070 = [[MWStation alloc] init];
    station0070.identifier = @"station0070";
    [edge0010.elements addObject:station0070];
    
    station0070.nameOriginal = @"Lawrence";
    station0070.mapLocation = CGPointMake(1672, 430);
    station0070.geoLocation = CGPointMake(43.725, -79.402222);

    MWDrawLine *drawLine0140 = [[MWDrawLine alloc] init];
    drawLine0140.startPoint = CGPointMake(1672, 430);
    drawLine0140.endPoint = CGPointMake(1687, 430);
    drawLine0140.width = 8;
    drawLine0140.color = line0004.color;
    [station0070.drawPrimitives addObject:drawLine0140];

    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = station0070.nameOriginal;
    drawTextLine0056.fontName = @"HelveticaNeue-Bold";
    drawTextLine0056.fontColor = [UIColor blackColor];
    drawTextLine0056.fontSize = 40;
    drawTextLine0056.kernSpacing = 1.8;
    drawTextLine0056.origin = CGPointMake(1700, 405);
    [station0070.nameOriginalTextPrimitives addObject:drawTextLine0056];

    // Добавляем перегон
    MWHaul *haul0067 = [[MWHaul alloc] init];
    haul0067.identifier = @"haul0067";
    haul0067.length = 2161;
    [edge0010.elements addObject:haul0067];

    MWDrawLine *drawLine0141 = [[MWDrawLine alloc] init];
    drawLine0141.startPoint = CGPointMake(1672, 430.5);
    drawLine0141.endPoint = CGPointMake(1672, 272);
    drawLine0141.width = 12;
    drawLine0141.color = line0004.color;
    [haul0067.drawPrimitives addObject:drawLine0141];

    // Добавляем станцию York Mills
    MWStation *station0071 = [[MWStation alloc] init];
    station0071.identifier = @"station0071";
    [edge0010.elements addObject:station0071];
    
    station0071.nameOriginal = @"York Mills";
    station0071.mapLocation = CGPointMake(1672, 272);
    station0071.geoLocation = CGPointMake(43.744167, -79.406667);

    MWDrawLine *drawLine0142 = [[MWDrawLine alloc] init];
    drawLine0142.startPoint = CGPointMake(1672, 272);
    drawLine0142.endPoint = CGPointMake(1657, 272);
    drawLine0142.width = 8;
    drawLine0142.color = line0004.color;
    [station0071.drawPrimitives addObject:drawLine0142];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = station0071.nameOriginal;
    drawTextLine0057.fontName = @"HelveticaNeue-Bold";
    drawTextLine0057.fontColor = [UIColor blackColor];
    drawTextLine0057.fontSize = 40;
    drawTextLine0057.kernSpacing = 1.8;
    drawTextLine0057.origin = CGPointMake(1440, 252);
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0057];

    // Добавляем перегон
    MWHaul *haul0068 = [[MWHaul alloc] init];
    haul0068.identifier = @"haul0068";
    haul0068.length = 1944;
    [edge0010.elements addObject:haul0068];

    MWDrawLine *drawLine0143 = [[MWDrawLine alloc] init];
    drawLine0143.startPoint = CGPointMake(1672, 272.5);
    drawLine0143.endPoint = CGPointMake(1672, 186);
    drawLine0143.width = 12;
    drawLine0143.color = line0004.color;
    [haul0068.drawPrimitives addObject:drawLine0143];

    // Добавляем станцию Sheppard-Yonge
    MWStation *station0072 = [[MWStation alloc] init];
    station0072.identifier = @"station0072";
    [edge0010.elements addObject:station0072];
    
    station0072.nameOriginal = @"Sheppard-Yonge";
    station0072.mapLocation = CGPointMake(1672, 186);
    station0072.geoLocation = CGPointMake(43.761389, -79.410833);

    MWDrawLine *drawLine0144 = [[MWDrawLine alloc] init];
    drawLine0144.startPoint = CGPointMake(1672, 186);
    drawLine0144.endPoint = CGPointMake(1657, 186);
    drawLine0144.width = 8;
    drawLine0144.color = line0004.color;
    [station0072.drawPrimitives addObject:drawLine0144];

    station0072.showNameOnMap = false;
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0030];
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0031];
    
    // Добавляем вершину
    edge0010.finishVertex = vertex0007;

    // Создаем участок линии Sheppard-Yonge - Finch
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0011 = [[MWEdge alloc] init];
    edge0011.identifier = @"edge0011";
    edge0011.developmentName = @"Ребро: Sheppard-Yonge - Finch";
    [self.edges addObject:(edge0011)];
    
    // Добавляем линию
    edge0011.line = line0004;
    
    // Добавляем вершину
    edge0011.startVertex = vertex0007;

    // Добавляем станцию Sheppard-Yonge
    [edge0011.elements addObject:station0072];

    // Добавляем перегон
    MWHaul *haul0069 = [[MWHaul alloc] init];
    haul0069.identifier = @"haul0069";
    haul0069.length = 787;
    [edge0011.elements addObject:haul0069];

    MWDrawLine *drawLine0145 = [[MWDrawLine alloc] init];
    drawLine0145.startPoint = CGPointMake(1672, 186.5);
    drawLine0145.endPoint = CGPointMake(1672, 100);
    drawLine0145.width = 12;
    drawLine0145.color = line0004.color;
    [haul0069.drawPrimitives addObject:drawLine0145];

    // Добавляем станцию North York Centre
    MWStation *station0073 = [[MWStation alloc] init];
    station0073.identifier = @"station0073";
    [edge0011.elements addObject:station0073];
    
    station0073.nameOriginal = @"North York Centre";
    station0073.mapLocation = CGPointMake(1672, 100);
    station0073.geoLocation = CGPointMake(43.768333, -79.412778);

    MWDrawLine *drawLine0146 = [[MWDrawLine alloc] init];
    drawLine0146.startPoint = CGPointMake(1672, 100);
    drawLine0146.endPoint = CGPointMake(1687, 100);
    drawLine0146.width = 8;
    drawLine0146.color = line0004.color;
    [station0073.drawPrimitives addObject:drawLine0146];

    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = station0073.nameOriginal;
    drawTextLine0058.fontName = @"HelveticaNeue-Bold";
    drawTextLine0058.fontColor = [UIColor blackColor];
    drawTextLine0058.fontSize = 40;
    drawTextLine0058.kernSpacing = 1.8;
    drawTextLine0058.origin = CGPointMake(1700, 77);
    [station0073.nameOriginalTextPrimitives addObject:drawTextLine0058];
    
    // Добавляем перегон
    MWHaul *haul0070 = [[MWHaul alloc] init];
    haul0070.identifier = @"haul0070";
    haul0070.length = 1368;
    [edge0011.elements addObject:haul0070];

    MWDrawLine *drawLine0147 = [[MWDrawLine alloc] init];
    drawLine0147.startPoint = CGPointMake(1672, 100.5);
    drawLine0147.endPoint = CGPointMake(1672, 16);
    drawLine0147.width = 12;
    drawLine0147.color = line0004.color;
    [haul0070.drawPrimitives addObject:drawLine0147];
    
    // Добавляем станцию Finch
    MWStation *station0074 = [[MWStation alloc] init];
    station0074.identifier = @"station0074";
    [edge0011.elements addObject:station0074];
    
    station0074.nameOriginal = @"Finch";
    station0074.mapLocation = CGPointMake(1672, 16);
    station0074.geoLocation = CGPointMake(43.780556, -79.414722);

    MWDrawLine *drawLine0148 = [[MWDrawLine alloc] init];
    drawLine0148.startPoint = CGPointMake(1657, 16);
    drawLine0148.endPoint = CGPointMake(1687, 16);
    drawLine0148.width = 8;
    drawLine0148.color = line0004.color;
    [station0074.drawPrimitives addObject:drawLine0148];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = station0074.nameOriginal;
    drawTextLine0059.fontName = @"HelveticaNeue-Bold";
    drawTextLine0059.fontColor = [UIColor blackColor];
    drawTextLine0059.fontSize = 40;
    drawTextLine0059.kernSpacing = 1.8;
    drawTextLine0059.origin = CGPointMake(1700, -8);
    [station0074.nameOriginalTextPrimitives addObject:drawTextLine0059];

    // Добавляем вершину
    edge0011.finishVertex = vertex0010;

    ////////////////////////////////////////////////////////////////
    
    MWDrawLine *drawLine0151 = [[MWDrawLine alloc] init];
    drawLine0151.startPoint = CGPointMake(1980, 1216);
    drawLine0151.endPoint = CGPointMake(2744, 1216);
    drawLine0151.width = 4;
    drawLine0151.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0151];

    MWDrawLine *drawLine0152 = [[MWDrawLine alloc] init];
    drawLine0152.startPoint = CGPointMake(2744, 1216);
    drawLine0152.endPoint = CGPointMake(2744, 1588);
    drawLine0152.width = 4;
    drawLine0152.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0152];

    MWDrawLine *drawLine0153 = [[MWDrawLine alloc] init];
    drawLine0153.startPoint = CGPointMake(2744, 1588);
    drawLine0153.endPoint = CGPointMake(1980, 1588);
    drawLine0153.width = 4;
    drawLine0153.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0153];

    MWDrawLine *drawLine0154 = [[MWDrawLine alloc] init];
    drawLine0154.startPoint = CGPointMake(1980, 1588);
    drawLine0154.endPoint = CGPointMake(1980, 1216);
    drawLine0154.width = 4;
    drawLine0154.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0154];

    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = @"Legend";
    drawTextLine0060.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 74;
    drawTextLine0060.kernSpacing = -1.0;
    drawTextLine0060.origin = CGPointMake(2230, 1220);
    [self.additionalOverMapPrimitives addObject:drawTextLine0060];

    MWDrawLine *drawLine0155 = [[MWDrawLine alloc] init];
    drawLine0155.startPoint = CGPointMake(2010, 1374);
    drawLine0155.endPoint = CGPointMake(2170, 1374);
    drawLine0155.width = 12;
    drawLine0155.color = line0004.color;
    [self.additionalOverMapPrimitives addObject:drawLine0155];

    MWDrawLine *drawLine0156 = [[MWDrawLine alloc] init];
    drawLine0156.startPoint = CGPointMake(2010, 1428);
    drawLine0156.endPoint = CGPointMake(2170, 1428);
    drawLine0156.width = 12;
    drawLine0156.color = line0001.color;
    [self.additionalOverMapPrimitives addObject:drawLine0156];

    MWDrawLine *drawLine0157 = [[MWDrawLine alloc] init];
    drawLine0157.startPoint = CGPointMake(2010, 1480);
    drawLine0157.endPoint = CGPointMake(2170, 1480);
    drawLine0157.width = 12;
    drawLine0157.color = line0002.color;
    [self.additionalOverMapPrimitives addObject:drawLine0157];

    MWDrawLine *drawLine0158 = [[MWDrawLine alloc] init];
    drawLine0158.startPoint = CGPointMake(2010, 1534);
    drawLine0158.endPoint = CGPointMake(2170, 1534);
    drawLine0158.width = 12;
    drawLine0158.color = line0003.color;
    [self.additionalOverMapPrimitives addObject:drawLine0158];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = @"Yonge-University-Spadina Line";
    drawTextLine0061.fontName = @"HelveticaNeue-Bold";
    drawTextLine0061.fontColor = [UIColor blackColor];
    drawTextLine0061.fontSize = 40;
    drawTextLine0061.kernSpacing = -3.0;
    drawTextLine0061.origin = CGPointMake(2190, 1347);
    [self.additionalOverMapPrimitives addObject:drawTextLine0061];

    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = @"Bloor-Danforth Line";
    drawTextLine0062.fontName = @"HelveticaNeue-Bold";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 40;
    drawTextLine0062.kernSpacing = -3.0;
    drawTextLine0062.origin = CGPointMake(2190, 1400);
    [self.additionalOverMapPrimitives addObject:drawTextLine0062];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = @"Scarborough SRT";
    drawTextLine0063.fontName = @"HelveticaNeue-Bold";
    drawTextLine0063.fontColor = [UIColor blackColor];
    drawTextLine0063.fontSize = 40;
    drawTextLine0063.kernSpacing = -3.0;
    drawTextLine0063.origin = CGPointMake(2190, 1452);
    [self.additionalOverMapPrimitives addObject:drawTextLine0063];

    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = @"Sheppard Line";
    drawTextLine0064.fontName = @"HelveticaNeue-Bold";
    drawTextLine0064.fontColor = [UIColor blackColor];
    drawTextLine0064.fontSize = 40;
    drawTextLine0064.kernSpacing = -3.0;
    drawTextLine0064.origin = CGPointMake(2190, 1505);
    [self.additionalOverMapPrimitives addObject:drawTextLine0064];

    return self;
}

@end
