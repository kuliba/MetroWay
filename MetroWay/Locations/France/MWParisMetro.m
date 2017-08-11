//
//  MWParisMetro.m
//  MetroWay
//
//  Created by Valentin Ozerov on 26.08.15.
//  Copyright (c) 2015 Valentin Ozerov. All rights reserved.
//

#import "MWParisMetro.h"
#import "MWHaul.h"
#import "MWDrawLine.h"
#import "MWDrawArc.h"
#import "MWDrawTextLine.h"
#import "MWDrawFillCircle.h"

@implementation MWParisMetro

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"paris_metro";

    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Line 1";
    line0001.color = [UIColor colorWithRed:(255/255.0) green:(205/255.0) blue:(7/255.0) alpha:1];
    [self.lines addObject:line0001];

    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"Line 2";
    line0002.color = [UIColor colorWithRed:(0/255.0) green:(109/255.0) blue:(184/255.0) alpha:1];
    [self.lines addObject:line0002];

    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"Line 3";
    line0003.color = [UIColor colorWithRed:(155/255.0) green:(153/255.0) blue:(58/255.0) alpha:1];
    [self.lines addObject:line0003];

    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"Line 3bis";
    line0004.color = [UIColor colorWithRed:(135/255.0) green:(211/255.0) blue:(223/255.0) alpha:1];
    [self.lines addObject:line0004];

    MWLine *line0005 = [[MWLine alloc] init];
    line0005.identifier = @"line0005";
    line0005.nameOriginal = @"Line 4";
    line0005.color = [UIColor colorWithRed:(187/255.0) green:(73/255.0) blue:(155/255.0) alpha:1];
    [self.lines addObject:line0005];

    MWLine *line0006 = [[MWLine alloc] init];
    line0006.identifier = @"line0006";
    line0006.nameOriginal = @"Line 5";
    line0006.color = [UIColor colorWithRed:(246/255.0) green:(144/255.0) blue:(75/255.0) alpha:1];
    [self.lines addObject:line0006];

    MWLine *line0007 = [[MWLine alloc] init];
    line0007.identifier = @"line0007";
    line0007.nameOriginal = @"Line 6";
    line0007.color = [UIColor colorWithRed:(118/255.0) green:(198/255.0) blue:(149/255.0) alpha:1];
    [self.lines addObject:line0007];

    MWLine *line0008 = [[MWLine alloc] init];
    line0008.identifier = @"line0008";
    line0008.nameOriginal = @"Line 7";
    line0008.color = [UIColor colorWithRed:(246/255.0) green:(159/255.0) blue:(180/255.0) alpha:1];
    [self.lines addObject:line0008];

    MWLine *line0009 = [[MWLine alloc] init];
    line0009.identifier = @"line0009";
    line0009.nameOriginal = @"Line 7bis";
    line0009.color = [UIColor colorWithRed:(118/255.0) green:(198/255.0) blue:(149/255.0) alpha:1];
    [self.lines addObject:line0009];

    MWLine *line0010 = [[MWLine alloc] init];
    line0010.identifier = @"line0010";
    line0010.nameOriginal = @"Line 8";
    line0010.color = [UIColor colorWithRed:(197/255.0) green:(163/255.0) blue:(205/255.0) alpha:1];
    [self.lines addObject:line0010];

    MWLine *line0011 = [[MWLine alloc] init];
    line0011.identifier = @"line0011";
    line0011.nameOriginal = @"Line 9";
    line0011.color = [UIColor colorWithRed:(206/255.0) green:(201/255.0) blue:(41/255.0) alpha:1];
    [self.lines addObject:line0011];

    MWLine *line0012 = [[MWLine alloc] init];
    line0012.identifier = @"line0012";
    line0012.nameOriginal = @"Line 10";
    line0012.color = [UIColor colorWithRed:(224/255.0) green:(176/255.0) blue:(60/255.0) alpha:1];
    [self.lines addObject:line0012];

    MWLine *line0013 = [[MWLine alloc] init];
    line0013.identifier = @"line0013";
    line0013.nameOriginal = @"Line 11";
    line0013.color = [UIColor colorWithRed:(141/255.0) green:(102/255.0) blue:(57/255.0) alpha:1];
    [self.lines addObject:line0013];

    MWLine *line0014 = [[MWLine alloc] init];
    line0014.identifier = @"line0014";
    line0014.nameOriginal = @"Line 12";
    line0014.color = [UIColor colorWithRed:(0/255.0) green:(140/255.0) blue:(90/255.0) alpha:1];
    [self.lines addObject:line0014];

    MWLine *line0015 = [[MWLine alloc] init];
    line0015.identifier = @"line0015";
    line0015.nameOriginal = @"Line 13";
    line0015.color = [UIColor colorWithRed:(135/255.0) green:(211/255.0) blue:(223/255.0) alpha:1];
    [self.lines addObject:line0015];

    MWLine *line0016 = [[MWLine alloc] init];
    line0016.identifier = @"line0016";
    line0016.nameOriginal = @"Line 14";
    line0016.color = [UIColor colorWithRed:(102/255.0) green:(45/255.0) blue:(145/255.0) alpha:1];
    [self.lines addObject:line0016];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0012];
    [self.drawLinesOrder addObject:line0007];
    [self.drawLinesOrder addObject:line0005];
    [self.drawLinesOrder addObject:line0011];
    [self.drawLinesOrder addObject:line0006];
    [self.drawLinesOrder addObject:line0016];
    [self.drawLinesOrder addObject:line0013];
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0015];
    [self.drawLinesOrder addObject:line0014];
    [self.drawLinesOrder addObject:line0008];
    [self.drawLinesOrder addObject:line0010];
    [self.drawLinesOrder addObject:line0009];
    [self.drawLinesOrder addObject:line0004];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // La Défense – Grande Arche
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: La Défense – Grande Arche";
    [self.vertices addObject:vertex0001];

    MWDrawFillCircle *fillCircle0479 = [[MWDrawFillCircle alloc] init];
    fillCircle0479.center = CGPointMake(524.5, 1293);
    fillCircle0479.radius = 13;
    fillCircle0479.fillColor = [UIColor blackColor];
    [vertex0001.drawPrimitives addObject:fillCircle0479];

    MWDrawFillCircle *fillCircle0480 = [[MWDrawFillCircle alloc] init];
    fillCircle0480.center = CGPointMake(542, 1275.5);
    fillCircle0480.radius = 13;
    fillCircle0480.fillColor = [UIColor blackColor];
    [vertex0001.drawPrimitives addObject:fillCircle0480];
    
    MWDrawLine *drawLine0537 = [[MWDrawLine alloc] init];
    drawLine0537.startPoint = CGPointMake(524.5, 1293);
    drawLine0537.endPoint = CGPointMake(542, 1275.5);
    drawLine0537.width = 26;
    drawLine0537.color = [UIColor blackColor];
    [vertex0001.drawPrimitives addObject:drawLine0537];

    MWDrawFillCircle *fillCircle0481 = [[MWDrawFillCircle alloc] init];
    fillCircle0481.center = CGPointMake(524.5, 1293);
    fillCircle0481.radius = 11;
    fillCircle0481.fillColor = [UIColor whiteColor];
    [vertex0001.drawPrimitives addObject:fillCircle0481];
    
    MWDrawFillCircle *fillCircle0482 = [[MWDrawFillCircle alloc] init];
    fillCircle0482.center = CGPointMake(542, 1275.5);
    fillCircle0482.radius = 11;
    fillCircle0482.fillColor = [UIColor whiteColor];
    [vertex0001.drawPrimitives addObject:fillCircle0482];

    MWDrawLine *drawLine0538 = [[MWDrawLine alloc] init];
    drawLine0538.startPoint = CGPointMake(524.5, 1293);
    drawLine0538.endPoint = CGPointMake(542, 1275.5);
    drawLine0538.width = 22;
    drawLine0538.color = [UIColor whiteColor];
    [vertex0001.drawPrimitives addObject:drawLine0538];

    MWDrawFillCircle *fillCircle0483 = [[MWDrawFillCircle alloc] init];
    fillCircle0483.center = CGPointMake(524.5, 1293);
    fillCircle0483.radius = 8;
    fillCircle0483.fillColor = line0001.color;
    [vertex0001.drawPrimitives addObject:fillCircle0483];

    // Charles de Gaulle — Étoile
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Charles de Gaulle — Étoile";
    [self.vertices addObject:vertex0002];

    MWDrawFillCircle *fillCircle0484 = [[MWDrawFillCircle alloc] init];
    fillCircle0484.center = CGPointMake(1087.5, 1887.5);
    fillCircle0484.radius = 13;
    fillCircle0484.fillColor = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:fillCircle0484];
    
    MWDrawFillCircle *fillCircle0485 = [[MWDrawFillCircle alloc] init];
    fillCircle0485.center = CGPointMake(1121, 1854);
    fillCircle0485.radius = 13;
    fillCircle0485.fillColor = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:fillCircle0485];

    MWDrawLine *drawLine0539 = [[MWDrawLine alloc] init];
    drawLine0539.startPoint = CGPointMake(1087.5, 1887.5);
    drawLine0539.endPoint = CGPointMake(1121, 1854);
    drawLine0539.width = 26;
    drawLine0539.color = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:drawLine0539];

    MWDrawFillCircle *fillCircle0486 = [[MWDrawFillCircle alloc] init];
    fillCircle0486.center = CGPointMake(1087.5, 1887.5);
    fillCircle0486.radius = 11;
    fillCircle0486.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0486];
    
    MWDrawFillCircle *fillCircle0487 = [[MWDrawFillCircle alloc] init];
    fillCircle0487.center = CGPointMake(1121, 1854);
    fillCircle0487.radius = 11;
    fillCircle0487.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0487];

    MWDrawLine *drawLine0540 = [[MWDrawLine alloc] init];
    drawLine0540.startPoint = CGPointMake(1087.5, 1887.5);
    drawLine0540.endPoint = CGPointMake(1121, 1854);
    drawLine0540.width = 22;
    drawLine0540.color = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:drawLine0540];

    MWDrawFillCircle *fillCircle0488 = [[MWDrawFillCircle alloc] init];
    fillCircle0488.center = CGPointMake(1087.5, 1887.5);
    fillCircle0488.radius = 8;
    fillCircle0488.fillColor = line0007.color;
    [vertex0002.drawPrimitives addObject:fillCircle0488];

    // Franklin D. Roosevelt
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Franklin D. Roosevelt";
    [self.vertices addObject:vertex0003];

    MWDrawFillCircle *fillCircle0489 = [[MWDrawFillCircle alloc] init];
    fillCircle0489.center = CGPointMake(1356.5, 2125);
    fillCircle0489.radius = 13;
    fillCircle0489.fillColor = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:fillCircle0489];
    
    MWDrawFillCircle *fillCircle0490 = [[MWDrawFillCircle alloc] init];
    fillCircle0490.center = CGPointMake(1356.5, 2125);
    fillCircle0490.radius = 11;
    fillCircle0490.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0490];

    // Champs-Élysées – Clemenceau
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Champs-Élysées – Clemenceau";
    [self.vertices addObject:vertex0004];

    MWDrawFillCircle *fillCircle0491 = [[MWDrawFillCircle alloc] init];
    fillCircle0491.center = CGPointMake(1446, 2214.5);
    fillCircle0491.radius = 13;
    fillCircle0491.fillColor = [UIColor blackColor];
    [vertex0004.drawPrimitives addObject:fillCircle0491];
    
    MWDrawFillCircle *fillCircle0492 = [[MWDrawFillCircle alloc] init];
    fillCircle0492.center = CGPointMake(1446, 2214.5);
    fillCircle0492.radius = 11;
    fillCircle0492.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0492];

    // Concorde
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Concorde";
    [self.vertices addObject:vertex0005];

    MWDrawFillCircle *fillCircle0493 = [[MWDrawFillCircle alloc] init];
    fillCircle0493.center = CGPointMake(1512, 2280.5);
    fillCircle0493.radius = 13;
    fillCircle0493.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0493];
    
    MWDrawFillCircle *fillCircle0494 = [[MWDrawFillCircle alloc] init];
    fillCircle0494.center = CGPointMake(1534, 2303);
    fillCircle0494.radius = 13;
    fillCircle0494.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0494];
    
    MWDrawLine *drawLine0541 = [[MWDrawLine alloc] init];
    drawLine0541.startPoint = CGPointMake(1512, 2280.5);
    drawLine0541.endPoint = CGPointMake(1534, 2303);
    drawLine0541.width = 26;
    drawLine0541.color = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:drawLine0541];
    
    MWDrawFillCircle *fillCircle0495 = [[MWDrawFillCircle alloc] init];
    fillCircle0495.center = CGPointMake(1512, 2280.5);
    fillCircle0495.radius = 11;
    fillCircle0495.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0495];
    
    MWDrawFillCircle *fillCircle0496 = [[MWDrawFillCircle alloc] init];
    fillCircle0496.center = CGPointMake(1534, 2303);
    fillCircle0496.radius = 11;
    fillCircle0496.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0496];
    
    MWDrawLine *drawLine0542 = [[MWDrawLine alloc] init];
    drawLine0542.startPoint = CGPointMake(1512, 2280.5);
    drawLine0542.endPoint = CGPointMake(1534, 2303);
    drawLine0542.width = 22;
    drawLine0542.color = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:drawLine0542];

    // Palais Royal - Musée du Louvre
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Palais Royal – Musée du Louvre";
    [self.vertices addObject:vertex0006];
    
    MWDrawFillCircle *fillCircle0497 = [[MWDrawFillCircle alloc] init];
    fillCircle0497.center = CGPointMake(1895.5, 2350.5);
    fillCircle0497.radius = 13;
    fillCircle0497.fillColor = [UIColor blackColor];
    [vertex0006.drawPrimitives addObject:fillCircle0497];
    
    MWDrawFillCircle *fillCircle0498 = [[MWDrawFillCircle alloc] init];
    fillCircle0498.center = CGPointMake(1895.5, 2350.5);
    fillCircle0498.radius = 11;
    fillCircle0498.fillColor = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:fillCircle0498];
    
    // Châtelet
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Châtelet";
    [self.vertices addObject:vertex0007];

    MWDrawFillCircle *fillCircle0499 = [[MWDrawFillCircle alloc] init];
    fillCircle0499.center = CGPointMake(2366, 2328);
    fillCircle0499.radius = 13;
    fillCircle0499.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0499];
    
    MWDrawFillCircle *fillCircle0500 = [[MWDrawFillCircle alloc] init];
    fillCircle0500.center = CGPointMake(2366, 2395);
    fillCircle0500.radius = 13;
    fillCircle0500.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0500];

    MWDrawLine *drawLine0543 = [[MWDrawLine alloc] init];
    drawLine0543.startPoint = CGPointMake(2366, 2328);
    drawLine0543.endPoint = CGPointMake(2366, 2395);
    drawLine0543.width = 26;
    drawLine0543.color = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:drawLine0543];
    
    MWDrawFillCircle *fillCircle0501 = [[MWDrawFillCircle alloc] init];
    fillCircle0501.center = CGPointMake(2366, 2328);
    fillCircle0501.radius = 11;
    fillCircle0501.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0501];

    MWDrawFillCircle *fillCircle0502 = [[MWDrawFillCircle alloc] init];
    fillCircle0502.center = CGPointMake(2366, 2395);
    fillCircle0502.radius = 11;
    fillCircle0502.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0502];

    MWDrawLine *drawLine0544 = [[MWDrawLine alloc] init];
    drawLine0544.startPoint = CGPointMake(2366, 2328);
    drawLine0544.endPoint = CGPointMake(2366, 2395);
    drawLine0544.width = 22;
    drawLine0544.color = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:drawLine0544];

    MWDrawFillCircle *fillCircle0503 = [[MWDrawFillCircle alloc] init];
    fillCircle0503.center = CGPointMake(2366, 2395);
    fillCircle0503.radius = 8;
    fillCircle0503.fillColor = line0013.color;
    [vertex0007.drawPrimitives addObject:fillCircle0503];

    // Hôtel de Ville
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Hôtel de Ville";
    [self.vertices addObject:vertex0008];

    MWDrawFillCircle *fillCircle0504 = [[MWDrawFillCircle alloc] init];
    fillCircle0504.center = CGPointMake(2545.5, 2354.5);
    fillCircle0504.radius = 13;
    fillCircle0504.fillColor = [UIColor blackColor];
    [vertex0008.drawPrimitives addObject:fillCircle0504];
    
    MWDrawFillCircle *fillCircle0505 = [[MWDrawFillCircle alloc] init];
    fillCircle0505.center = CGPointMake(2545.5, 2354.5);
    fillCircle0505.radius = 11;
    fillCircle0505.fillColor = [UIColor whiteColor];
    [vertex0008.drawPrimitives addObject:fillCircle0505];

    // Bastille
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Bastille";
    [self.vertices addObject:vertex0009];

    MWDrawFillCircle *fillCircle0506 = [[MWDrawFillCircle alloc] init];
    fillCircle0506.center = CGPointMake(2889, 2533);
    fillCircle0506.radius = 13;
    fillCircle0506.fillColor = [UIColor blackColor];
    [vertex0009.drawPrimitives addObject:fillCircle0506];
    
    MWDrawFillCircle *fillCircle0507 = [[MWDrawFillCircle alloc] init];
    fillCircle0507.center = CGPointMake(2889, 2567);
    fillCircle0507.radius = 13;
    fillCircle0507.fillColor = [UIColor blackColor];
    [vertex0009.drawPrimitives addObject:fillCircle0507];
    
    MWDrawLine *drawLine0545 = [[MWDrawLine alloc] init];
    drawLine0545.startPoint = CGPointMake(2889, 2533);
    drawLine0545.endPoint = CGPointMake(2889, 2567);
    drawLine0545.width = 26;
    drawLine0545.color = [UIColor blackColor];
    [vertex0009.drawPrimitives addObject:drawLine0545];
    
    MWDrawFillCircle *fillCircle0508 = [[MWDrawFillCircle alloc] init];
    fillCircle0508.center = CGPointMake(2889, 2533);
    fillCircle0508.radius = 11;
    fillCircle0508.fillColor = [UIColor whiteColor];
    [vertex0009.drawPrimitives addObject:fillCircle0508];
    
    MWDrawFillCircle *fillCircle0509 = [[MWDrawFillCircle alloc] init];
    fillCircle0509.center = CGPointMake(2889, 2567);
    fillCircle0509.radius = 11;
    fillCircle0509.fillColor = [UIColor whiteColor];
    [vertex0009.drawPrimitives addObject:fillCircle0509];
    
    MWDrawLine *drawLine0546 = [[MWDrawLine alloc] init];
    drawLine0546.startPoint = CGPointMake(2889, 2533);
    drawLine0546.endPoint = CGPointMake(2889, 2567);
    drawLine0546.width = 22;
    drawLine0546.color = [UIColor whiteColor];
    [vertex0009.drawPrimitives addObject:drawLine0546];

    // Gare de Lyon
    MWVertex *vertex0010 = [[MWVertex alloc] init];
    vertex0010.identifier = @"vertex0010";
    vertex0010.developmentName = @"Вершина: Gare de Lyon";
    [self.vertices addObject:vertex0010];

    MWDrawFillCircle *fillCircle0510 = [[MWDrawFillCircle alloc] init];
    fillCircle0510.center = CGPointMake(3103.5, 2911);
    fillCircle0510.radius = 13;
    fillCircle0510.fillColor = [UIColor blackColor];
    [vertex0010.drawPrimitives addObject:fillCircle0510];
    
    MWDrawFillCircle *fillCircle0511 = [[MWDrawFillCircle alloc] init];
    fillCircle0511.center = CGPointMake(3047.5, 2966.5);
    fillCircle0511.radius = 13;
    fillCircle0511.fillColor = [UIColor blackColor];
    [vertex0010.drawPrimitives addObject:fillCircle0511];
    
    MWDrawLine *drawLine0547 = [[MWDrawLine alloc] init];
    drawLine0547.startPoint = CGPointMake(3103.5, 2911);
    drawLine0547.endPoint = CGPointMake(3047.5, 2966.5);
    drawLine0547.width = 26;
    drawLine0547.color = [UIColor blackColor];
    [vertex0010.drawPrimitives addObject:drawLine0547];
    
    MWDrawFillCircle *fillCircle0512 = [[MWDrawFillCircle alloc] init];
    fillCircle0512.center = CGPointMake(3103.5, 2911);
    fillCircle0512.radius = 11;
    fillCircle0512.fillColor = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:fillCircle0512];
    
    MWDrawFillCircle *fillCircle0513 = [[MWDrawFillCircle alloc] init];
    fillCircle0513.center = CGPointMake(3047.5, 2966.5);
    fillCircle0513.radius = 11;
    fillCircle0513.fillColor = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:fillCircle0513];
    
    MWDrawLine *drawLine0548 = [[MWDrawLine alloc] init];
    drawLine0548.startPoint = CGPointMake(3103.5, 2911);
    drawLine0548.endPoint = CGPointMake(3047.5, 2966.5);
    drawLine0548.width = 22;
    drawLine0548.color = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:drawLine0548];

    MWDrawLine *drawLine0549 = [[MWDrawLine alloc] init];
    drawLine0549.startPoint = CGPointMake(3079, 2923);
    drawLine0549.endPoint = CGPointMake(3091, 2935);
    drawLine0549.width = 9;
    drawLine0549.color = [UIColor colorWithRed:(222/255.0) green:(178/255.0) blue:(210/255.0) alpha:1];
    [vertex0010.drawPrimitives addObject:drawLine0549];

    // Reuilly – Diderot
    MWVertex *vertex0011 = [[MWVertex alloc] init];
    vertex0011.identifier = @"vertex0011";
    vertex0011.developmentName = @"Вершина: Reuilly – Diderot";
    [self.vertices addObject:vertex0011];

    MWDrawFillCircle *fillCircle0514 = [[MWDrawFillCircle alloc] init];
    fillCircle0514.center = CGPointMake(3284, 2812);
    fillCircle0514.radius = 13;
    fillCircle0514.fillColor = [UIColor blackColor];
    [vertex0011.drawPrimitives addObject:fillCircle0514];
    
    MWDrawFillCircle *fillCircle0515 = [[MWDrawFillCircle alloc] init];
    fillCircle0515.center = CGPointMake(3284, 2812);
    fillCircle0515.radius = 11;
    fillCircle0515.fillColor = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:fillCircle0515];
    
    // Nation
    MWVertex *vertex0012 = [[MWVertex alloc] init];
    vertex0012.identifier = @"vertex0012";
    vertex0012.developmentName = @"Вершина: Nation";
    [self.vertices addObject:vertex0012];

    MWDrawFillCircle *fillCircle0516 = [[MWDrawFillCircle alloc] init];
    fillCircle0516.center = CGPointMake(3586.5, 2631);
    fillCircle0516.radius = 13;
    fillCircle0516.fillColor = [UIColor blackColor];
    [vertex0012.drawPrimitives addObject:fillCircle0516];
    
    MWDrawFillCircle *fillCircle0517 = [[MWDrawFillCircle alloc] init];
    fillCircle0517.center = CGPointMake(3519.5, 2698);
    fillCircle0517.radius = 13;
    fillCircle0517.fillColor = [UIColor blackColor];
    [vertex0012.drawPrimitives addObject:fillCircle0517];
    
    MWDrawLine *drawLine0550 = [[MWDrawLine alloc] init];
    drawLine0550.startPoint = CGPointMake(3586.5, 2631);
    drawLine0550.endPoint = CGPointMake(3519.5, 2698);
    drawLine0550.width = 26;
    drawLine0550.color = [UIColor blackColor];
    [vertex0012.drawPrimitives addObject:drawLine0550];
    
    MWDrawFillCircle *fillCircle0518 = [[MWDrawFillCircle alloc] init];
    fillCircle0518.center = CGPointMake(3586.5, 2631);
    fillCircle0518.radius = 11;
    fillCircle0518.fillColor = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:fillCircle0518];
    
    MWDrawFillCircle *fillCircle0519 = [[MWDrawFillCircle alloc] init];
    fillCircle0519.center = CGPointMake(3519.5, 2698);
    fillCircle0519.radius = 11;
    fillCircle0519.fillColor = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:fillCircle0519];
    
    MWDrawLine *drawLine0551 = [[MWDrawLine alloc] init];
    drawLine0551.startPoint = CGPointMake(3586.5, 2631);
    drawLine0551.endPoint = CGPointMake(3519.5, 2698);
    drawLine0551.width = 22;
    drawLine0551.color = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:drawLine0551];

    MWDrawFillCircle *fillCircle0520 = [[MWDrawFillCircle alloc] init];
    fillCircle0520.center = CGPointMake(3586.5, 2631);
    fillCircle0520.radius = 8;
    fillCircle0520.fillColor = line0002.color;
    [vertex0012.drawPrimitives addObject:fillCircle0520];

    MWDrawFillCircle *fillCircle0521 = [[MWDrawFillCircle alloc] init];
    fillCircle0521.center = CGPointMake(3519.5, 2698);
    fillCircle0521.radius = 8;
    fillCircle0521.fillColor = line0007.color;
    [vertex0012.drawPrimitives addObject:fillCircle0521];

    // Château de Vincennes
    MWVertex *vertex0013 = [[MWVertex alloc] init];
    vertex0013.identifier = @"vertex0013";
    vertex0013.developmentName = @"Вершина: Château de Vincennes";
    [self.vertices addObject:vertex0013];

    // Porte Dauphine
    MWVertex *vertex0014 = [[MWVertex alloc] init];
    vertex0014.identifier = @"vertex0014";
    vertex0014.developmentName = @"Вершина: Porte Dauphine";
    [self.vertices addObject:vertex0014];

    // Villiers
    MWVertex *vertex0015 = [[MWVertex alloc] init];
    vertex0015.identifier = @"vertex0015";
    vertex0015.developmentName = @"Вершина: Villiers";
    [self.vertices addObject:vertex0015];

    MWDrawFillCircle *fillCircle0523 = [[MWDrawFillCircle alloc] init];
    fillCircle0523.center = CGPointMake(1509, 1466);
    fillCircle0523.radius = 13;
    fillCircle0523.fillColor = [UIColor blackColor];
    [vertex0015.drawPrimitives addObject:fillCircle0523];

    MWDrawFillCircle *fillCircle0524 = [[MWDrawFillCircle alloc] init];
    fillCircle0524.center = CGPointMake(1509, 1466);
    fillCircle0524.radius = 11;
    fillCircle0524.fillColor = [UIColor whiteColor];
    [vertex0015.drawPrimitives addObject:fillCircle0524];

    // Place de Clichy
    MWVertex *vertex0016 = [[MWVertex alloc] init];
    vertex0016.identifier = @"vertex0016";
    vertex0016.developmentName = @"Вершина: Place de Clichy";
    [self.vertices addObject:vertex0016];

    MWDrawFillCircle *fillCircle0525 = [[MWDrawFillCircle alloc] init];
    fillCircle0525.center = CGPointMake(1754, 1327);
    fillCircle0525.radius = 13;
    fillCircle0525.fillColor = [UIColor blackColor];
    [vertex0016.drawPrimitives addObject:fillCircle0525];
    
    MWDrawFillCircle *fillCircle0526 = [[MWDrawFillCircle alloc] init];
    fillCircle0526.center = CGPointMake(1754, 1327);
    fillCircle0526.radius = 11;
    fillCircle0526.fillColor = [UIColor whiteColor];
    [vertex0016.drawPrimitives addObject:fillCircle0526];

    // Pigalle
    MWVertex *vertex0017 = [[MWVertex alloc] init];
    vertex0017.identifier = @"vertex0017";
    vertex0017.developmentName = @"Вершина: Pigalle";
    [self.vertices addObject:vertex0017];

    MWDrawFillCircle *fillCircle0527 = [[MWDrawFillCircle alloc] init];
    fillCircle0527.center = CGPointMake(2195.5, 1327);
    fillCircle0527.radius = 13;
    fillCircle0527.fillColor = [UIColor blackColor];
    [vertex0017.drawPrimitives addObject:fillCircle0527];
    
    MWDrawFillCircle *fillCircle0528 = [[MWDrawFillCircle alloc] init];
    fillCircle0528.center = CGPointMake(2195.5, 1327);
    fillCircle0528.radius = 11;
    fillCircle0528.fillColor = [UIColor whiteColor];
    [vertex0017.drawPrimitives addObject:fillCircle0528];

    // Barbès – Rochechouart
    MWVertex *vertex0018 = [[MWVertex alloc] init];
    vertex0018.identifier = @"vertex0018";
    vertex0018.developmentName = @"Вершина: Barbès – Rochechouart";
    [self.vertices addObject:vertex0018];

    MWDrawFillCircle *fillCircle0530 = [[MWDrawFillCircle alloc] init];
    fillCircle0530.center = CGPointMake(2566, 1327);
    fillCircle0530.radius = 13;
    fillCircle0530.fillColor = [UIColor blackColor];
    [vertex0018.drawPrimitives addObject:fillCircle0530];
    
    MWDrawFillCircle *fillCircle0531 = [[MWDrawFillCircle alloc] init];
    fillCircle0531.center = CGPointMake(2566, 1349);
    fillCircle0531.radius = 13;
    fillCircle0531.fillColor = [UIColor blackColor];
    [vertex0018.drawPrimitives addObject:fillCircle0531];
    
    MWDrawLine *drawLine0552 = [[MWDrawLine alloc] init];
    drawLine0552.startPoint = CGPointMake(2566, 1327);
    drawLine0552.endPoint = CGPointMake(2566, 1349);
    drawLine0552.width = 26;
    drawLine0552.color = [UIColor blackColor];
    [vertex0018.drawPrimitives addObject:drawLine0552];
    
    MWDrawFillCircle *fillCircle0532 = [[MWDrawFillCircle alloc] init];
    fillCircle0532.center = CGPointMake(2566, 1327);
    fillCircle0532.radius = 11;
    fillCircle0532.fillColor = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:fillCircle0532];
    
    MWDrawFillCircle *fillCircle0533 = [[MWDrawFillCircle alloc] init];
    fillCircle0533.center = CGPointMake(2566, 1349);
    fillCircle0533.radius = 11;
    fillCircle0533.fillColor = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:fillCircle0533];
    
    MWDrawLine *drawLine0553 = [[MWDrawLine alloc] init];
    drawLine0553.startPoint = CGPointMake(2566, 1327);
    drawLine0553.endPoint = CGPointMake(2566, 1349);
    drawLine0553.width = 22;
    drawLine0553.color = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:drawLine0553];

    // La Chapelle
//    MWVertex *vertex0019 = [[MWVertex alloc] init];
//    vertex0019.identifier = @"vertex0019";
//    vertex0019.developmentName = @"Вершина: La Chapelle";
//    [self.vertices addObject:vertex0019];
    
    // Stalingrad
    MWVertex *vertex0020 = [[MWVertex alloc] init];
    vertex0020.identifier = @"vertex0020";
    vertex0020.developmentName = @"Вершина: Stalingrad";
    [self.vertices addObject:vertex0020];

    MWDrawFillCircle *fillCircle0534 = [[MWDrawFillCircle alloc] init];
    fillCircle0534.center = CGPointMake(3039, 1343);
    fillCircle0534.radius = 13;
    fillCircle0534.fillColor = [UIColor blackColor];
    [vertex0020.drawPrimitives addObject:fillCircle0534];
    
    MWDrawFillCircle *fillCircle0535 = [[MWDrawFillCircle alloc] init];
    fillCircle0535.center = CGPointMake(3039, 1375);
    fillCircle0535.radius = 13;
    fillCircle0535.fillColor = [UIColor blackColor];
    [vertex0020.drawPrimitives addObject:fillCircle0535];
    
    MWDrawLine *drawLine0554 = [[MWDrawLine alloc] init];
    drawLine0554.startPoint = CGPointMake(3039, 1343);
    drawLine0554.endPoint = CGPointMake(3039, 1375);
    drawLine0554.width = 26;
    drawLine0554.color = [UIColor blackColor];
    [vertex0020.drawPrimitives addObject:drawLine0554];
    
    MWDrawFillCircle *fillCircle0536 = [[MWDrawFillCircle alloc] init];
    fillCircle0536.center = CGPointMake(3039, 1343);
    fillCircle0536.radius = 11;
    fillCircle0536.fillColor = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:fillCircle0536];
    
    MWDrawFillCircle *fillCircle0537 = [[MWDrawFillCircle alloc] init];
    fillCircle0537.center = CGPointMake(3039, 1375);
    fillCircle0537.radius = 11;
    fillCircle0537.fillColor = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:fillCircle0537];
    
    MWDrawLine *drawLine0555 = [[MWDrawLine alloc] init];
    drawLine0555.startPoint = CGPointMake(3039, 1343);
    drawLine0555.endPoint = CGPointMake(3039, 1375);
    drawLine0555.width = 22;
    drawLine0555.color = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:drawLine0555];

    // Jaurès
    MWVertex *vertex0021 = [[MWVertex alloc] init];
    vertex0021.identifier = @"vertex0021";
    vertex0021.developmentName = @"Вершина: Jaurès";
    [self.vertices addObject:vertex0021];

    MWDrawFillCircle *fillCircle0538 = [[MWDrawFillCircle alloc] init];
    fillCircle0538.center = CGPointMake(3152, 1425);
    fillCircle0538.radius = 13;
    fillCircle0538.fillColor = [UIColor blackColor];
    [vertex0021.drawPrimitives addObject:fillCircle0538];
    
    MWDrawFillCircle *fillCircle0539 = [[MWDrawFillCircle alloc] init];
    fillCircle0539.center = CGPointMake(3136, 1441);
    fillCircle0539.radius = 13;
    fillCircle0539.fillColor = [UIColor blackColor];
    [vertex0021.drawPrimitives addObject:fillCircle0539];
    
    MWDrawLine *drawLine0556 = [[MWDrawLine alloc] init];
    drawLine0556.startPoint = CGPointMake(3152, 1425);
    drawLine0556.endPoint = CGPointMake(3136, 1441);
    drawLine0556.width = 26;
    drawLine0556.color = [UIColor blackColor];
    [vertex0021.drawPrimitives addObject:drawLine0556];
    
    MWDrawFillCircle *fillCircle0540 = [[MWDrawFillCircle alloc] init];
    fillCircle0540.center = CGPointMake(3152, 1425);
    fillCircle0540.radius = 11;
    fillCircle0540.fillColor = [UIColor whiteColor];
    [vertex0021.drawPrimitives addObject:fillCircle0540];
    
    MWDrawFillCircle *fillCircle0541 = [[MWDrawFillCircle alloc] init];
    fillCircle0541.center = CGPointMake(3136, 1441);
    fillCircle0541.radius = 11;
    fillCircle0541.fillColor = [UIColor whiteColor];
    [vertex0021.drawPrimitives addObject:fillCircle0541];
    
    MWDrawLine *drawLine0557 = [[MWDrawLine alloc] init];
    drawLine0557.startPoint = CGPointMake(3152, 1425);
    drawLine0557.endPoint = CGPointMake(3136, 1441);
    drawLine0557.width = 22;
    drawLine0557.color = [UIColor whiteColor];
    [vertex0021.drawPrimitives addObject:drawLine0557];
    
    // Belleville
    MWVertex *vertex0022 = [[MWVertex alloc] init];
    vertex0022.identifier = @"vertex0022";
    vertex0022.developmentName = @"Вершина: Belleville";
    [self.vertices addObject:vertex0022];

    MWDrawFillCircle *fillCircle0542 = [[MWDrawFillCircle alloc] init];
    fillCircle0542.center = CGPointMake(3161, 1738.5);
    fillCircle0542.radius = 13;
    fillCircle0542.fillColor = [UIColor blackColor];
    [vertex0022.drawPrimitives addObject:fillCircle0542];

    MWDrawFillCircle *fillCircle0543 = [[MWDrawFillCircle alloc] init];
    fillCircle0543.center = CGPointMake(3161, 1738.5);
    fillCircle0543.radius = 11;
    fillCircle0543.fillColor = [UIColor whiteColor];
    [vertex0022.drawPrimitives addObject:fillCircle0543];

    // Père Lachaise
    MWVertex *vertex0023 = [[MWVertex alloc] init];
    vertex0023.identifier = @"vertex0023";
    vertex0023.developmentName = @"Вершина: Père Lachaise";
    [self.vertices addObject:vertex0023];

    MWDrawFillCircle *fillCircle0544 = [[MWDrawFillCircle alloc] init];
    fillCircle0544.center = CGPointMake(3481, 2122.5);
    fillCircle0544.radius = 13;
    fillCircle0544.fillColor = [UIColor blackColor];
    [vertex0023.drawPrimitives addObject:fillCircle0544];
    
    MWDrawFillCircle *fillCircle0545 = [[MWDrawFillCircle alloc] init];
    fillCircle0545.center = CGPointMake(3481, 2122.5);
    fillCircle0545.radius = 11;
    fillCircle0545.fillColor = [UIColor whiteColor];
    [vertex0023.drawPrimitives addObject:fillCircle0545];

    // Pont de Levallois — Bécon
    MWVertex *vertex0024 = [[MWVertex alloc] init];
    vertex0024.identifier = @"vertex0024";
    vertex0024.developmentName = @"Вершина: Pont de Levallois — Bécon";
    [self.vertices addObject:vertex0024];
    
    // Saint-Lazare
    MWVertex *vertex0025 = [[MWVertex alloc] init];
    vertex0025.identifier = @"vertex0025";
    vertex0025.developmentName = @"Вершина: Saint-Lazare";
    [self.vertices addObject:vertex0025];

    MWDrawLine *drawLine0560 = [[MWDrawLine alloc] init];
    drawLine0560.startPoint = CGPointMake(1646, 1836);
    drawLine0560.endPoint = CGPointMake(1646, 1804);
    drawLine0560.width = 10;
    drawLine0560.color = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:drawLine0560];
    
    MWDrawLine *drawLine0561 = [[MWDrawLine alloc] init];
    drawLine0561.startPoint = CGPointMake(1644.5, 1807);
    drawLine0561.endPoint = CGPointMake(1709.5, 1744);
    drawLine0561.width = 10;
    drawLine0561.color = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:drawLine0561];

    MWDrawFillCircle *fillCircle0547 = [[MWDrawFillCircle alloc] init];
    fillCircle0547.center = CGPointMake(1709.5, 1744);
    fillCircle0547.radius = 13;
    fillCircle0547.fillColor = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:fillCircle0547];
    
    MWDrawFillCircle *fillCircle0548 = [[MWDrawFillCircle alloc] init];
    fillCircle0548.center = CGPointMake(1776, 1744);
    fillCircle0548.radius = 13;
    fillCircle0548.fillColor = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:fillCircle0548];
    
    MWDrawLine *drawLine0558 = [[MWDrawLine alloc] init];
    drawLine0558.startPoint = CGPointMake(1709.5, 1744);
    drawLine0558.endPoint = CGPointMake(1776, 1744);
    drawLine0558.width = 26;
    drawLine0558.color = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:drawLine0558];
    
    MWDrawFillCircle *fillCircle0549 = [[MWDrawFillCircle alloc] init];
    fillCircle0549.center = CGPointMake(1709.5, 1744);
    fillCircle0549.radius = 11;
    fillCircle0549.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0549];
    
    MWDrawFillCircle *fillCircle0550 = [[MWDrawFillCircle alloc] init];
    fillCircle0550.center = CGPointMake(1776, 1744);
    fillCircle0550.radius = 11;
    fillCircle0550.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0550];
    
    MWDrawLine *drawLine0559 = [[MWDrawLine alloc] init];
    drawLine0559.startPoint = CGPointMake(1709.5, 1744);
    drawLine0559.endPoint = CGPointMake(1776, 1744);
    drawLine0559.width = 22;
    drawLine0559.color = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:drawLine0559];

    MWDrawLine *drawLine0563 = [[MWDrawLine alloc] init];
    drawLine0563.startPoint = CGPointMake(1645, 1806.5);
    drawLine0563.endPoint = CGPointMake(1709.5, 1744);
    drawLine0563.width = 6;
    drawLine0563.color = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:drawLine0563];

    MWDrawFillCircle *fillCircle0553 = [[MWDrawFillCircle alloc] init];
    fillCircle0553.center = CGPointMake(1709.5, 1744);
    fillCircle0553.radius = 8;
    fillCircle0553.fillColor = line0016.color;
    [vertex0025.drawPrimitives addObject:fillCircle0553];

    MWDrawFillCircle *fillCircle0551 = [[MWDrawFillCircle alloc] init];
    fillCircle0551.center = CGPointMake(1646, 1836);
    fillCircle0551.radius = 13;
    fillCircle0551.fillColor = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:fillCircle0551];

    MWDrawFillCircle *fillCircle0552 = [[MWDrawFillCircle alloc] init];
    fillCircle0552.center = CGPointMake(1646, 1836);
    fillCircle0552.radius = 11;
    fillCircle0552.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0552];

    MWDrawLine *drawLine0562 = [[MWDrawLine alloc] init];
    drawLine0562.startPoint = CGPointMake(1646, 1836);
    drawLine0562.endPoint = CGPointMake(1646, 1805);
    drawLine0562.width = 6;
    drawLine0562.color = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:drawLine0562];

    // Havre - Caumartin
    MWVertex *vertex0026 = [[MWVertex alloc] init];
    vertex0026.identifier = @"vertex0026";
    vertex0026.developmentName = @"Вершина: Havre - Caumartin";
    [self.vertices addObject:vertex0026];

    MWDrawFillCircle *fillCircle0556 = [[MWDrawFillCircle alloc] init];
    fillCircle0556.center = CGPointMake(1809.5, 1899.5);
    fillCircle0556.radius = 13;
    fillCircle0556.fillColor = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:fillCircle0556];
    
    MWDrawFillCircle *fillCircle0557 = [[MWDrawFillCircle alloc] init];
    fillCircle0557.center = CGPointMake(1809.5, 1899.5);
    fillCircle0557.radius = 11;
    fillCircle0557.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0557];

    // Opéra
    MWVertex *vertex0027 = [[MWVertex alloc] init];
    vertex0027.identifier = @"vertex0027";
    vertex0027.developmentName = @"Вершина: Opéra";
    [self.vertices addObject:vertex0027];
    
    MWDrawFillCircle *fillCircle0554 = [[MWDrawFillCircle alloc] init];
    fillCircle0554.center = CGPointMake(1891.5, 1981.5);
    fillCircle0554.radius = 13;
    fillCircle0554.fillColor = [UIColor blackColor];
    [vertex0027.drawPrimitives addObject:fillCircle0554];
    
    MWDrawFillCircle *fillCircle0555 = [[MWDrawFillCircle alloc] init];
    fillCircle0555.center = CGPointMake(1907, 1997);
    fillCircle0555.radius = 13;
    fillCircle0555.fillColor = [UIColor blackColor];
    [vertex0027.drawPrimitives addObject:fillCircle0555];
    
    MWDrawLine *drawLine0564 = [[MWDrawLine alloc] init];
    drawLine0564.startPoint = CGPointMake(1891.5, 1981.5);
    drawLine0564.endPoint = CGPointMake(1907, 1997);
    drawLine0564.width = 26;
    drawLine0564.color = [UIColor blackColor];
    [vertex0027.drawPrimitives addObject:drawLine0564];
    
    MWDrawFillCircle *fillCircle0558 = [[MWDrawFillCircle alloc] init];
    fillCircle0558.center = CGPointMake(1891.5, 1981.5);
    fillCircle0558.radius = 11;
    fillCircle0558.fillColor = [UIColor whiteColor];
    [vertex0027.drawPrimitives addObject:fillCircle0558];
    
    MWDrawFillCircle *fillCircle0559 = [[MWDrawFillCircle alloc] init];
    fillCircle0559.center = CGPointMake(1907, 1997);
    fillCircle0559.radius = 11;
    fillCircle0559.fillColor = [UIColor whiteColor];
    [vertex0027.drawPrimitives addObject:fillCircle0559];
    
    MWDrawLine *drawLine0565 = [[MWDrawLine alloc] init];
    drawLine0565.startPoint = CGPointMake(1891.5, 1981.5);
    drawLine0565.endPoint = CGPointMake(1907, 1997);
    drawLine0565.width = 22;
    drawLine0565.color = [UIColor whiteColor];
    [vertex0027.drawPrimitives addObject:drawLine0565];

    // Réaumur – Sébastopol
    MWVertex *vertex0028 = [[MWVertex alloc] init];
    vertex0028.identifier = @"vertex0028";
    vertex0028.developmentName = @"Вершина: Réaumur – Sébastopol";
    [self.vertices addObject:vertex0028];

    MWDrawFillCircle *fillCircle0560 = [[MWDrawFillCircle alloc] init];
    fillCircle0560.center = CGPointMake(2522, 2145);
    fillCircle0560.radius = 13;
    fillCircle0560.fillColor = [UIColor blackColor];
    [vertex0028.drawPrimitives addObject:fillCircle0560];
    
    MWDrawFillCircle *fillCircle0561 = [[MWDrawFillCircle alloc] init];
    fillCircle0561.center = CGPointMake(2522, 2167);
    fillCircle0561.radius = 13;
    fillCircle0561.fillColor = [UIColor blackColor];
    [vertex0028.drawPrimitives addObject:fillCircle0561];
    
    MWDrawLine *drawLine0568 = [[MWDrawLine alloc] init];
    drawLine0568.startPoint = CGPointMake(2522, 2145);
    drawLine0568.endPoint = CGPointMake(2522, 2167);
    drawLine0568.width = 26;
    drawLine0568.color = [UIColor blackColor];
    [vertex0028.drawPrimitives addObject:drawLine0568];

    MWDrawFillCircle *fillCircle0562 = [[MWDrawFillCircle alloc] init];
    fillCircle0562.center = CGPointMake(2522, 2145);
    fillCircle0562.radius = 11;
    fillCircle0562.fillColor = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:fillCircle0562];
    
    MWDrawFillCircle *fillCircle0563 = [[MWDrawFillCircle alloc] init];
    fillCircle0563.center = CGPointMake(2522, 2167);
    fillCircle0563.radius = 11;
    fillCircle0563.fillColor = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:fillCircle0563];

    MWDrawLine *drawLine0569 = [[MWDrawLine alloc] init];
    drawLine0569.startPoint = CGPointMake(2522, 2145);
    drawLine0569.endPoint = CGPointMake(2522, 2167);
    drawLine0569.width = 22;
    drawLine0569.color = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:drawLine0569];

    // Arts et Métiers
    MWVertex *vertex0029 = [[MWVertex alloc] init];
    vertex0029.identifier = @"vertex0029";
    vertex0029.developmentName = @"Вершина: Arts et Métiers";
    [self.vertices addObject:vertex0029];

    MWDrawFillCircle *fillCircle0564 = [[MWDrawFillCircle alloc] init];
    fillCircle0564.center = CGPointMake(2765.5, 2102.5);
    fillCircle0564.radius = 13;
    fillCircle0564.fillColor = [UIColor blackColor];
    [vertex0029.drawPrimitives addObject:fillCircle0564];

    MWDrawFillCircle *fillCircle0565 = [[MWDrawFillCircle alloc] init];
    fillCircle0565.center = CGPointMake(2781.5, 2118.5);
    fillCircle0565.radius = 13;
    fillCircle0565.fillColor = [UIColor blackColor];
    [vertex0029.drawPrimitives addObject:fillCircle0565];

    MWDrawLine *drawLine0570 = [[MWDrawLine alloc] init];
    drawLine0570.startPoint = CGPointMake(2765.5, 2102.5);
    drawLine0570.endPoint = CGPointMake(2781.5, 2118.5);
    drawLine0570.width = 26;
    drawLine0570.color = [UIColor blackColor];
    [vertex0029.drawPrimitives addObject:drawLine0570];

    MWDrawFillCircle *fillCircle0566 = [[MWDrawFillCircle alloc] init];
    fillCircle0566.center = CGPointMake(2765.5, 2102.5);
    fillCircle0566.radius = 11;
    fillCircle0566.fillColor = [UIColor whiteColor];
    [vertex0029.drawPrimitives addObject:fillCircle0566];
    
    MWDrawFillCircle *fillCircle0567 = [[MWDrawFillCircle alloc] init];
    fillCircle0567.center = CGPointMake(2781.5, 2118.5);
    fillCircle0567.radius = 11;
    fillCircle0567.fillColor = [UIColor whiteColor];
    [vertex0029.drawPrimitives addObject:fillCircle0567];

    MWDrawLine *drawLine0571 = [[MWDrawLine alloc] init];
    drawLine0571.startPoint = CGPointMake(2765.5, 2102.5);
    drawLine0571.endPoint = CGPointMake(2781.5, 2118.5);
    drawLine0571.width = 22;
    drawLine0571.color = [UIColor whiteColor];
    [vertex0029.drawPrimitives addObject:drawLine0571];

    // République
    MWVertex *vertex0030 = [[MWVertex alloc] init];
    vertex0030.identifier = @"vertex0030";
    vertex0030.developmentName = @"Вершина: République";
    [self.vertices addObject:vertex0030];

    MWDrawFillCircle *fillCircle0568 = [[MWDrawFillCircle alloc] init];
    fillCircle0568.center = CGPointMake(2896, 2003.5);
    fillCircle0568.radius = 13;
    fillCircle0568.fillColor = [UIColor blackColor];
    [vertex0030.drawPrimitives addObject:fillCircle0568];

    MWDrawFillCircle *fillCircle0569 = [[MWDrawFillCircle alloc] init];
    fillCircle0569.center = CGPointMake(2952.5, 1947);
    fillCircle0569.radius = 13;
    fillCircle0569.fillColor = [UIColor blackColor];
    [vertex0030.drawPrimitives addObject:fillCircle0569];

    MWDrawLine *drawLine0572 = [[MWDrawLine alloc] init];
    drawLine0572.startPoint = CGPointMake(2896, 2003.5);
    drawLine0572.endPoint = CGPointMake(2952.5, 1947);
    drawLine0572.width = 26;
    drawLine0572.color = [UIColor blackColor];
    [vertex0030.drawPrimitives addObject:drawLine0572];
    
    MWDrawFillCircle *fillCircle0570 = [[MWDrawFillCircle alloc] init];
    fillCircle0570.center = CGPointMake(2896, 2003.5);;
    fillCircle0570.radius = 11;
    fillCircle0570.fillColor = [UIColor whiteColor];
    [vertex0030.drawPrimitives addObject:fillCircle0570];

    MWDrawFillCircle *fillCircle0571 = [[MWDrawFillCircle alloc] init];
    fillCircle0571.center = CGPointMake(2952.5, 1947);
    fillCircle0571.radius = 11;
    fillCircle0571.fillColor = [UIColor whiteColor];
    [vertex0030.drawPrimitives addObject:fillCircle0571];

    MWDrawLine *drawLine0573 = [[MWDrawLine alloc] init];
    drawLine0573.startPoint = CGPointMake(2896, 2003.5);;
    drawLine0573.endPoint = CGPointMake(2952.5, 1947);
    drawLine0573.width = 22;
    drawLine0573.color = [UIColor whiteColor];
    [vertex0030.drawPrimitives addObject:drawLine0573];
    
    // Gambetta
    MWVertex *vertex0031 = [[MWVertex alloc] init];
    vertex0031.identifier = @"vertex0031";
    vertex0031.developmentName = @"Вершина: Gambetta";
    [self.vertices addObject:vertex0031];

    MWDrawFillCircle *fillCircle0572 = [[MWDrawFillCircle alloc] init];
    fillCircle0572.center = CGPointMake(3662, 2100);
    fillCircle0572.radius = 13;
    fillCircle0572.fillColor = [UIColor blackColor];
    [vertex0031.drawPrimitives addObject:fillCircle0572];
    
    MWDrawFillCircle *fillCircle0573 = [[MWDrawFillCircle alloc] init];
    fillCircle0573.center = CGPointMake(3662, 2122.5);
    fillCircle0573.radius = 13;
    fillCircle0573.fillColor = [UIColor blackColor];
    [vertex0031.drawPrimitives addObject:fillCircle0573];

    MWDrawLine *drawLine0574 = [[MWDrawLine alloc] init];
    drawLine0574.startPoint = CGPointMake(3662, 2100);
    drawLine0574.endPoint = CGPointMake(3662, 2122.5);
    drawLine0574.width = 26;
    drawLine0574.color = [UIColor blackColor];
    [vertex0031.drawPrimitives addObject:drawLine0574];
    
    MWDrawFillCircle *fillCircle0574 = [[MWDrawFillCircle alloc] init];
    fillCircle0574.center = CGPointMake(3662, 2100);
    fillCircle0574.radius = 11;
    fillCircle0574.fillColor = [UIColor whiteColor];
    [vertex0031.drawPrimitives addObject:fillCircle0574];

    MWDrawFillCircle *fillCircle0575 = [[MWDrawFillCircle alloc] init];
    fillCircle0575.center = CGPointMake(3662, 2122.5);
    fillCircle0575.radius = 11;
    fillCircle0575.fillColor = [UIColor whiteColor];
    [vertex0031.drawPrimitives addObject:fillCircle0575];

    MWDrawLine *drawLine0575 = [[MWDrawLine alloc] init];
    drawLine0575.startPoint = CGPointMake(3662, 2100);
    drawLine0575.endPoint = CGPointMake(3662, 2122.5);
    drawLine0575.width = 22;
    drawLine0575.color = [UIColor whiteColor];
    [vertex0031.drawPrimitives addObject:drawLine0575];

    MWDrawFillCircle *fillCircle0581 = [[MWDrawFillCircle alloc] init];
    fillCircle0581.center = CGPointMake(3662, 2100);
    fillCircle0581.radius = 8;
    fillCircle0581.fillColor = line0004.color;
    [vertex0031.drawPrimitives addObject:fillCircle0581];

    // Gallieni
    MWVertex *vertex0032 = [[MWVertex alloc] init];
    vertex0032.identifier = @"vertex0032";
    vertex0032.developmentName = @"Вершина: Gallieni";
    [self.vertices addObject:vertex0032];
    
    // Porte des Lilas
    MWVertex *vertex0033 = [[MWVertex alloc] init];
    vertex0033.identifier = @"vertex0033";
    vertex0033.developmentName = @"Вершина: Porte des Lilas";
    [self.vertices addObject:vertex0033];

    MWDrawFillCircle *fillCircle0577 = [[MWDrawFillCircle alloc] init];
    fillCircle0577.center = CGPointMake(3865.5, 1653);
    fillCircle0577.radius = 13;
    fillCircle0577.fillColor = [UIColor blackColor];
    [vertex0033.drawPrimitives addObject:fillCircle0577];

    MWDrawFillCircle *fillCircle0578 = [[MWDrawFillCircle alloc] init];
    fillCircle0578.center = CGPointMake(3865.5, 1676);
    fillCircle0578.radius = 13;
    fillCircle0578.fillColor = [UIColor blackColor];
    [vertex0033.drawPrimitives addObject:fillCircle0578];
    
    MWDrawLine *drawLine0576 = [[MWDrawLine alloc] init];
    drawLine0576.startPoint = CGPointMake(3865.5, 1653);
    drawLine0576.endPoint = CGPointMake(3865.5, 1676);
    drawLine0576.width = 26;
    drawLine0576.color = [UIColor blackColor];
    [vertex0033.drawPrimitives addObject:drawLine0576];
    
    MWDrawFillCircle *fillCircle0579 = [[MWDrawFillCircle alloc] init];
    fillCircle0579.center = CGPointMake(3865.5, 1653);
    fillCircle0579.radius = 11;
    fillCircle0579.fillColor = [UIColor whiteColor];
    [vertex0033.drawPrimitives addObject:fillCircle0579];

    MWDrawFillCircle *fillCircle0580 = [[MWDrawFillCircle alloc] init];
    fillCircle0580.center = CGPointMake(3865.5, 1676);
    fillCircle0580.radius = 11;
    fillCircle0580.fillColor = [UIColor whiteColor];
    [vertex0033.drawPrimitives addObject:fillCircle0580];

    MWDrawLine *drawLine0577 = [[MWDrawLine alloc] init];
    drawLine0577.startPoint = CGPointMake(3865.5, 1653);
    drawLine0577.endPoint = CGPointMake(3865.5, 1676);
    drawLine0577.width = 22;
    drawLine0577.color = [UIColor whiteColor];
    [vertex0033.drawPrimitives addObject:drawLine0577];

    MWDrawFillCircle *fillCircle0582 = [[MWDrawFillCircle alloc] init];
    fillCircle0582.center = CGPointMake(3865.5, 1676);
    fillCircle0582.radius = 8;
    fillCircle0582.fillColor = line0004.color;
    [vertex0033.drawPrimitives addObject:fillCircle0582];

    // Porte de Clignancourt
    MWVertex *vertex0034 = [[MWVertex alloc] init];
    vertex0034.identifier = @"vertex0034";
    vertex0034.developmentName = @"Вершина: Porte de Clignancourt";
    [self.vertices addObject:vertex0034];

    // Marcadet – Poissonniers
    MWVertex *vertex0035 = [[MWVertex alloc] init];
    vertex0035.identifier = @"vertex0035";
    vertex0035.developmentName = @"Вершина: Marcadet – Poissonniers";
    [self.vertices addObject:vertex0035];

    MWDrawFillCircle *fillCircle0583 = [[MWDrawFillCircle alloc] init];
    fillCircle0583.center = CGPointMake(2443.5, 1121);
    fillCircle0583.radius = 13;
    fillCircle0583.fillColor = [UIColor blackColor];
    [vertex0035.drawPrimitives addObject:fillCircle0583];

    MWDrawFillCircle *fillCircle0584 = [[MWDrawFillCircle alloc] init];
    fillCircle0584.center = CGPointMake(2443.5, 1121);
    fillCircle0584.radius = 11;
    fillCircle0584.fillColor = [UIColor whiteColor];
    [vertex0035.drawPrimitives addObject:fillCircle0584];

    // Gare du Nord
    MWVertex *vertex0036 = [[MWVertex alloc] init];
    vertex0036.identifier = @"vertex0036";
    vertex0036.developmentName = @"Вершина: Gare du Nord";
    [self.vertices addObject:vertex0036];

    MWDrawLine *drawLine0566 = [[MWDrawLine alloc] init];
    drawLine0566.startPoint = CGPointMake(2783, 1327);
    drawLine0566.endPoint = CGPointMake(2783, 1427);
    drawLine0566.width = 11;
    drawLine0566.color = [UIColor blackColor];
    [vertex0036.drawPrimitives addObject:drawLine0566];

    MWDrawFillCircle *fillCircle0585 = [[MWDrawFillCircle alloc] init];
    fillCircle0585.center = CGPointMake(2724.5, 1427);
    fillCircle0585.radius = 13;
    fillCircle0585.fillColor = [UIColor blackColor];
    [vertex0036.drawPrimitives addObject:fillCircle0585];
    
    MWDrawFillCircle *fillCircle0586 = [[MWDrawFillCircle alloc] init];
    fillCircle0586.center = CGPointMake(2800, 1427);
    fillCircle0586.radius = 13;
    fillCircle0586.fillColor = [UIColor blackColor];
    [vertex0036.drawPrimitives addObject:fillCircle0586];
    
    MWDrawLine *drawLine0578 = [[MWDrawLine alloc] init];
    drawLine0578.startPoint = CGPointMake(2724.5, 1427);
    drawLine0578.endPoint = CGPointMake(2800, 1427);
    drawLine0578.width = 26;
    drawLine0578.color = [UIColor blackColor];
    [vertex0036.drawPrimitives addObject:drawLine0578];
    
    MWDrawFillCircle *fillCircle0587 = [[MWDrawFillCircle alloc] init];
    fillCircle0587.center = CGPointMake(2724.5, 1427);
    fillCircle0587.radius = 11;
    fillCircle0587.fillColor = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:fillCircle0587];
    
    MWDrawFillCircle *fillCircle0588 = [[MWDrawFillCircle alloc] init];
    fillCircle0588.center = CGPointMake(2800, 1427);
    fillCircle0588.radius = 11;
    fillCircle0588.fillColor = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:fillCircle0588];
    
    MWDrawLine *drawLine0579 = [[MWDrawLine alloc] init];
    drawLine0579.startPoint = CGPointMake(2724.5, 1427);
    drawLine0579.endPoint = CGPointMake(2800, 1427);
    drawLine0579.width = 22;
    drawLine0579.color = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:drawLine0579];

    MWDrawFillCircle *fillCircle0589 = [[MWDrawFillCircle alloc] init];
    fillCircle0589.center = CGPointMake(2783, 1327);
    fillCircle0589.radius = 13;
    fillCircle0589.fillColor = [UIColor blackColor];
    [vertex0036.drawPrimitives addObject:fillCircle0589];

    MWDrawFillCircle *fillCircle0590 = [[MWDrawFillCircle alloc] init];
    fillCircle0590.center = CGPointMake(2783, 1327);
    fillCircle0590.radius = 11;
    fillCircle0590.fillColor = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:fillCircle0590];

    MWDrawLine *drawLine0567 = [[MWDrawLine alloc] init];
    drawLine0567.startPoint = CGPointMake(2783, 1327);
    drawLine0567.endPoint = CGPointMake(2783, 1427);
    drawLine0567.width = 6;
    drawLine0567.color = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:drawLine0567];

    // Gare de l'Est
    MWVertex *vertex0037 = [[MWVertex alloc] init];
    vertex0037.identifier = @"vertex0037";
    vertex0037.developmentName = @"Вершина: Gare de l'Est";
    [self.vertices addObject:vertex0037];

    MWDrawFillCircle *fillCircle0591 = [[MWDrawFillCircle alloc] init];
    fillCircle0591.center = CGPointMake(2777.5, 1599.5);
    fillCircle0591.radius = 13;
    fillCircle0591.fillColor = [UIColor blackColor];
    [vertex0037.drawPrimitives addObject:fillCircle0591];
    
    MWDrawFillCircle *fillCircle0592 = [[MWDrawFillCircle alloc] init];
    fillCircle0592.center = CGPointMake(2800, 1599.5);
    fillCircle0592.radius = 13;
    fillCircle0592.fillColor = [UIColor blackColor];
    [vertex0037.drawPrimitives addObject:fillCircle0592];
    
    MWDrawLine *drawLine0580 = [[MWDrawLine alloc] init];
    drawLine0580.startPoint = CGPointMake(2777.5, 1599.5);
    drawLine0580.endPoint = CGPointMake(2800, 1599.5);
    drawLine0580.width = 26;
    drawLine0580.color = [UIColor blackColor];
    [vertex0037.drawPrimitives addObject:drawLine0580];
    
    MWDrawFillCircle *fillCircle0593 = [[MWDrawFillCircle alloc] init];
    fillCircle0593.center = CGPointMake(2777.5, 1599.5);
    fillCircle0593.radius = 11;
    fillCircle0593.fillColor = [UIColor whiteColor];
    [vertex0037.drawPrimitives addObject:fillCircle0593];

    MWDrawFillCircle *fillCircle0594 = [[MWDrawFillCircle alloc] init];
    fillCircle0594.center = CGPointMake(2800, 1599.5);
    fillCircle0594.radius = 11;
    fillCircle0594.fillColor = [UIColor whiteColor];
    [vertex0037.drawPrimitives addObject:fillCircle0594];

    MWDrawLine *drawLine0581 = [[MWDrawLine alloc] init];
    drawLine0581.startPoint = CGPointMake(2777.5, 1599.5);
    drawLine0581.endPoint = CGPointMake(2800, 1599.5);
    drawLine0581.width = 22;
    drawLine0581.color = [UIColor whiteColor];
    [vertex0037.drawPrimitives addObject:drawLine0581];

    // Strasbourg – Saint-Denis
    MWVertex *vertex0038 = [[MWVertex alloc] init];
    vertex0038.identifier = @"vertex0038";
    vertex0038.developmentName = @"Вершина: Strasbourg – Saint-Denis";
    [self.vertices addObject:vertex0038];

    MWDrawFillCircle *fillCircle0595 = [[MWDrawFillCircle alloc] init];
    fillCircle0595.center = CGPointMake(2621.5, 1900);
    fillCircle0595.radius = 13;
    fillCircle0595.fillColor = [UIColor blackColor];
    [vertex0038.drawPrimitives addObject:fillCircle0595];
    
    MWDrawFillCircle *fillCircle0596 = [[MWDrawFillCircle alloc] init];
    fillCircle0596.center = CGPointMake(2621.5, 1922);
    fillCircle0596.radius = 13;
    fillCircle0596.fillColor = [UIColor blackColor];
    [vertex0038.drawPrimitives addObject:fillCircle0596];

    MWDrawLine *drawLine0582 = [[MWDrawLine alloc] init];
    drawLine0582.startPoint = CGPointMake(2621.5, 1900);
    drawLine0582.endPoint = CGPointMake(2621.5, 1922);
    drawLine0582.width = 26;
    drawLine0582.color = [UIColor blackColor];
    [vertex0038.drawPrimitives addObject:drawLine0582];
    
    MWDrawFillCircle *fillCircle0597 = [[MWDrawFillCircle alloc] init];
    fillCircle0597.center = CGPointMake(2621.5, 1900);
    fillCircle0597.radius = 11;
    fillCircle0597.fillColor = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:fillCircle0597];
    
    MWDrawFillCircle *fillCircle0598 = [[MWDrawFillCircle alloc] init];
    fillCircle0598.center = CGPointMake(2621.5, 1922);
    fillCircle0598.radius = 11;
    fillCircle0598.fillColor = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:fillCircle0598];
    
    MWDrawLine *drawLine0583 = [[MWDrawLine alloc] init];
    drawLine0583.startPoint = CGPointMake(2621.5, 1900);
    drawLine0583.endPoint = CGPointMake(2621.5, 1922);
    drawLine0583.width = 22;
    drawLine0583.color = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:drawLine0583];

    // Odéon
    MWVertex *vertex0039 = [[MWVertex alloc] init];
    vertex0039.identifier = @"vertex0039";
    vertex0039.developmentName = @"Вершина: Odéon";
    [self.vertices addObject:vertex0039];

    MWDrawFillCircle *fillCircle0599 = [[MWDrawFillCircle alloc] init];
    fillCircle0599.center = CGPointMake(2204.5, 2729);
    fillCircle0599.radius = 13;
    fillCircle0599.fillColor = [UIColor blackColor];
    [vertex0039.drawPrimitives addObject:fillCircle0599];
    
    MWDrawFillCircle *fillCircle0600 = [[MWDrawFillCircle alloc] init];
    fillCircle0600.center = CGPointMake(2204.5, 2751);
    fillCircle0600.radius = 13;
    fillCircle0600.fillColor = [UIColor blackColor];
    [vertex0039.drawPrimitives addObject:fillCircle0600];

    MWDrawLine *drawLine0584 = [[MWDrawLine alloc] init];
    drawLine0584.startPoint = CGPointMake(2204.5, 2729);
    drawLine0584.endPoint = CGPointMake(2204.5, 2751);
    drawLine0584.width = 26;
    drawLine0584.color = [UIColor blackColor];
    [vertex0039.drawPrimitives addObject:drawLine0584];
    
    MWDrawFillCircle *fillCircle0601 = [[MWDrawFillCircle alloc] init];
    fillCircle0601.center = CGPointMake(2204.5, 2729);
    fillCircle0601.radius = 11;
    fillCircle0601.fillColor = [UIColor whiteColor];
    [vertex0039.drawPrimitives addObject:fillCircle0601];
    
    MWDrawFillCircle *fillCircle0602 = [[MWDrawFillCircle alloc] init];
    fillCircle0602.center = CGPointMake(2204.5, 2751);
    fillCircle0602.radius = 11;
    fillCircle0602.fillColor = [UIColor whiteColor];
    [vertex0039.drawPrimitives addObject:fillCircle0602];
    
    MWDrawLine *drawLine0585 = [[MWDrawLine alloc] init];
    drawLine0585.startPoint = CGPointMake(2204.5, 2729);
    drawLine0585.endPoint = CGPointMake(2204.5, 2751);
    drawLine0585.width = 22;
    drawLine0585.color = [UIColor whiteColor];
    [vertex0039.drawPrimitives addObject:drawLine0585];

    // Montparnasse — Bienvenüe
    MWVertex *vertex0040 = [[MWVertex alloc] init];
    vertex0040.identifier = @"vertex0040";
    vertex0040.developmentName = @"Вершина: Montparnasse — Bienvenüe";
    [self.vertices addObject:vertex0040];

    MWDrawFillCircle *fillCircle0603 = [[MWDrawFillCircle alloc] init];
    fillCircle0603.center = CGPointMake(1927.5, 3168);
    fillCircle0603.radius = 13;
    fillCircle0603.fillColor = [UIColor blackColor];
    [vertex0040.drawPrimitives addObject:fillCircle0603];
    
    MWDrawFillCircle *fillCircle0604 = [[MWDrawFillCircle alloc] init];
    fillCircle0604.center = CGPointMake(1971, 3124);
    fillCircle0604.radius = 13;
    fillCircle0604.fillColor = [UIColor blackColor];
    [vertex0040.drawPrimitives addObject:fillCircle0604];
    
    MWDrawLine *drawLine0586 = [[MWDrawLine alloc] init];
    drawLine0586.startPoint = CGPointMake(1927.5, 3168);
    drawLine0586.endPoint = CGPointMake(1971, 3124);
    drawLine0586.width = 26;
    drawLine0586.color = [UIColor blackColor];
    [vertex0040.drawPrimitives addObject:drawLine0586];
    
    MWDrawFillCircle *fillCircle0605 = [[MWDrawFillCircle alloc] init];
    fillCircle0605.center = CGPointMake(1927.5, 3168);
    fillCircle0605.radius = 11;
    fillCircle0605.fillColor = [UIColor whiteColor];
    [vertex0040.drawPrimitives addObject:fillCircle0605];
    
    MWDrawFillCircle *fillCircle0606 = [[MWDrawFillCircle alloc] init];
    fillCircle0606.center = CGPointMake(1971, 3124);
    fillCircle0606.radius = 11;
    fillCircle0606.fillColor = [UIColor whiteColor];
    [vertex0040.drawPrimitives addObject:fillCircle0606];
    
    MWDrawLine *drawLine0587 = [[MWDrawLine alloc] init];
    drawLine0587.startPoint = CGPointMake(1927.5, 3168);
    drawLine0587.endPoint = CGPointMake(1971, 3124);
    drawLine0587.width = 22;
    drawLine0587.color = [UIColor whiteColor];
    [vertex0040.drawPrimitives addObject:drawLine0587];

    // Raspail
    MWVertex *vertex0041 = [[MWVertex alloc] init];
    vertex0041.identifier = @"vertex0041";
    vertex0041.developmentName = @"Вершина: Raspail";
    [self.vertices addObject:vertex0041];

    MWDrawFillCircle *fillCircle0607 = [[MWDrawFillCircle alloc] init];
    fillCircle0607.center = CGPointMake(2200, 3214);
    fillCircle0607.radius = 13;
    fillCircle0607.fillColor = [UIColor blackColor];
    [vertex0041.drawPrimitives addObject:fillCircle0607];
    
    MWDrawFillCircle *fillCircle0608 = [[MWDrawFillCircle alloc] init];
    fillCircle0608.center = CGPointMake(2216, 3198);
    fillCircle0608.radius = 13;
    fillCircle0608.fillColor = [UIColor blackColor];
    [vertex0041.drawPrimitives addObject:fillCircle0608];
    
    MWDrawLine *drawLine0588 = [[MWDrawLine alloc] init];
    drawLine0588.startPoint = CGPointMake(2200, 3214);
    drawLine0588.endPoint = CGPointMake(2216, 3198);
    drawLine0588.width = 26;
    drawLine0588.color = [UIColor blackColor];
    [vertex0041.drawPrimitives addObject:drawLine0588];
    
    MWDrawFillCircle *fillCircle0609 = [[MWDrawFillCircle alloc] init];
    fillCircle0609.center = CGPointMake(2200, 3214);
    fillCircle0609.radius = 11;
    fillCircle0609.fillColor = [UIColor whiteColor];
    [vertex0041.drawPrimitives addObject:fillCircle0609];
    
    MWDrawFillCircle *fillCircle0610 = [[MWDrawFillCircle alloc] init];
    fillCircle0610.center = CGPointMake(2216, 3198);
    fillCircle0610.radius = 11;
    fillCircle0610.fillColor = [UIColor whiteColor];
    [vertex0041.drawPrimitives addObject:fillCircle0610];
    
    MWDrawLine *drawLine0589 = [[MWDrawLine alloc] init];
    drawLine0589.startPoint = CGPointMake(2200, 3214);
    drawLine0589.endPoint = CGPointMake(2216, 3198);
    drawLine0589.width = 22;
    drawLine0589.color = [UIColor whiteColor];
    [vertex0041.drawPrimitives addObject:drawLine0589];

    // Denfert-Rochereau
    MWVertex *vertex0042 = [[MWVertex alloc] init];
    vertex0042.identifier = @"vertex0042";
    vertex0042.developmentName = @"Вершина: Denfert-Rochereau";
    [self.vertices addObject:vertex0042];

    MWDrawFillCircle *fillCircle0611 = [[MWDrawFillCircle alloc] init];
    fillCircle0611.center = CGPointMake(2271, 3285);
    fillCircle0611.radius = 13;
    fillCircle0611.fillColor = [UIColor blackColor];
    [vertex0042.drawPrimitives addObject:fillCircle0611];
    
    MWDrawFillCircle *fillCircle0612 = [[MWDrawFillCircle alloc] init];
    fillCircle0612.center = CGPointMake(2296, 3310);
    fillCircle0612.radius = 13;
    fillCircle0612.fillColor = [UIColor blackColor];
    [vertex0042.drawPrimitives addObject:fillCircle0612];
    
    MWDrawLine *drawLine0590 = [[MWDrawLine alloc] init];
    drawLine0590.startPoint = CGPointMake(2271, 3285);
    drawLine0590.endPoint = CGPointMake(2296, 3310);
    drawLine0590.width = 26;
    drawLine0590.color = [UIColor blackColor];
    [vertex0042.drawPrimitives addObject:drawLine0590];
    
    MWDrawFillCircle *fillCircle0613 = [[MWDrawFillCircle alloc] init];
    fillCircle0613.center = CGPointMake(2271, 3285);
    fillCircle0613.radius = 11;
    fillCircle0613.fillColor = [UIColor whiteColor];
    [vertex0042.drawPrimitives addObject:fillCircle0613];

    MWDrawFillCircle *fillCircle0614 = [[MWDrawFillCircle alloc] init];
    fillCircle0614.center = CGPointMake(2296, 3310);
    fillCircle0614.radius = 11;
    fillCircle0614.fillColor = [UIColor whiteColor];
    [vertex0042.drawPrimitives addObject:fillCircle0614];
    
    MWDrawLine *drawLine0591 = [[MWDrawLine alloc] init];
    drawLine0591.startPoint = CGPointMake(2271, 3285);
    drawLine0591.endPoint = CGPointMake(2296, 3310);
    drawLine0591.width = 22;
    drawLine0591.color = [UIColor whiteColor];
    [vertex0042.drawPrimitives addObject:drawLine0591];
    
    // Mairie de Montrouge
    MWVertex *vertex0043 = [[MWVertex alloc] init];
    vertex0043.identifier = @"vertex0043";
    vertex0043.developmentName = @"Вершина: Mairie de Montrouge";
    [self.vertices addObject:vertex0043];
    
    // Bobigny – Pablo Picasso
    MWVertex *vertex0044 = [[MWVertex alloc] init];
    vertex0044.identifier = @"vertex0044";
    vertex0044.developmentName = @"Вершина: Bobigny – Pablo Picasso";
    [self.vertices addObject:vertex0044];

    // Oberkampf
    MWVertex *vertex0045 = [[MWVertex alloc] init];
    vertex0045.identifier = @"vertex0045";
    vertex0045.developmentName = @"Вершина: Oberkampf";
    [self.vertices addObject:vertex0045];

    MWDrawFillCircle *fillCircle0615 = [[MWDrawFillCircle alloc] init];
    fillCircle0615.center = CGPointMake(2997.5, 2073.5);
    fillCircle0615.radius = 13;
    fillCircle0615.fillColor = [UIColor blackColor];
    [vertex0045.drawPrimitives addObject:fillCircle0615];
    
    MWDrawFillCircle *fillCircle0616 = [[MWDrawFillCircle alloc] init];
    fillCircle0616.center = CGPointMake(3012.5, 2058.5);
    fillCircle0616.radius = 13;
    fillCircle0616.fillColor = [UIColor blackColor];
    [vertex0045.drawPrimitives addObject:fillCircle0616];
    
    MWDrawLine *drawLine0592 = [[MWDrawLine alloc] init];
    drawLine0592.startPoint = CGPointMake(2997.5, 2073.5);
    drawLine0592.endPoint = CGPointMake(3012.5, 2058.5);
    drawLine0592.width = 26;
    drawLine0592.color = [UIColor blackColor];
    [vertex0045.drawPrimitives addObject:drawLine0592];
    
    MWDrawFillCircle *fillCircle0617 = [[MWDrawFillCircle alloc] init];
    fillCircle0617.center = CGPointMake(2997.5, 2073.5);
    fillCircle0617.radius = 11;
    fillCircle0617.fillColor = [UIColor whiteColor];
    [vertex0045.drawPrimitives addObject:fillCircle0617];
    
    MWDrawFillCircle *fillCircle0618 = [[MWDrawFillCircle alloc] init];
    fillCircle0618.center = CGPointMake(3012.5, 2058.5);
    fillCircle0618.radius = 11;
    fillCircle0618.fillColor = [UIColor whiteColor];
    [vertex0045.drawPrimitives addObject:fillCircle0618];
    
    MWDrawLine *drawLine0593 = [[MWDrawLine alloc] init];
    drawLine0593.startPoint = CGPointMake(2997.5, 2073.5);
    drawLine0593.endPoint = CGPointMake(3012.5, 2058.5);
    drawLine0593.width = 22;
    drawLine0593.color = [UIColor whiteColor];
    [vertex0045.drawPrimitives addObject:drawLine0593];
    
    // Gare d'Austerlitz
    MWVertex *vertex0046 = [[MWVertex alloc] init];
    vertex0046.identifier = @"vertex0046";
    vertex0046.developmentName = @"Вершина: Gare d'Austerlitz";
    [self.vertices addObject:vertex0046];

    MWDrawFillCircle *fillCircle0619 = [[MWDrawFillCircle alloc] init];
    fillCircle0619.center = CGPointMake(2871, 3081);
    fillCircle0619.radius = 13;
    fillCircle0619.fillColor = [UIColor blackColor];
    [vertex0046.drawPrimitives addObject:fillCircle0619];
    
    MWDrawFillCircle *fillCircle0620 = [[MWDrawFillCircle alloc] init];
    fillCircle0620.center = CGPointMake(2889, 3063.5);
    fillCircle0620.radius = 13;
    fillCircle0620.fillColor = [UIColor blackColor];
    [vertex0046.drawPrimitives addObject:fillCircle0620];
    
    MWDrawLine *drawLine0594 = [[MWDrawLine alloc] init];
    drawLine0594.startPoint = CGPointMake(2871, 3081);
    drawLine0594.endPoint = CGPointMake(2889, 3063.5);
    drawLine0594.width = 26;
    drawLine0594.color = [UIColor blackColor];
    [vertex0046.drawPrimitives addObject:drawLine0594];
    
    MWDrawFillCircle *fillCircle0621 = [[MWDrawFillCircle alloc] init];
    fillCircle0621.center = CGPointMake(2871, 3081);
    fillCircle0621.radius = 11;
    fillCircle0621.fillColor = [UIColor whiteColor];
    [vertex0046.drawPrimitives addObject:fillCircle0621];
    
    MWDrawFillCircle *fillCircle0622 = [[MWDrawFillCircle alloc] init];
    fillCircle0622.center = CGPointMake(2889, 3063.5);
    fillCircle0622.radius = 11;
    fillCircle0622.fillColor = [UIColor whiteColor];
    [vertex0046.drawPrimitives addObject:fillCircle0622];
    
    MWDrawLine *drawLine0595 = [[MWDrawLine alloc] init];
    drawLine0595.startPoint = CGPointMake(2871, 3081);
    drawLine0595.endPoint = CGPointMake(2889, 3063.5);
    drawLine0595.width = 22;
    drawLine0595.color = [UIColor whiteColor];
    [vertex0046.drawPrimitives addObject:drawLine0595];

    MWDrawFillCircle *fillCircle0623 = [[MWDrawFillCircle alloc] init];
    fillCircle0623.center = CGPointMake(2871, 3081);
    fillCircle0623.radius = 8;
    fillCircle0623.fillColor = line0012.color;
    [vertex0046.drawPrimitives addObject:fillCircle0623];

    // Place d'Italie
    MWVertex *vertex0047 = [[MWVertex alloc] init];
    vertex0047.identifier = @"vertex0047";
    vertex0047.developmentName = @"Вершина: Place d'Italie";
    [self.vertices addObject:vertex0047];

    MWDrawFillCircle *fillCircle0624 = [[MWDrawFillCircle alloc] init];
    fillCircle0624.center = CGPointMake(2705, 3435);
    fillCircle0624.radius = 13;
    fillCircle0624.fillColor = [UIColor blackColor];
    [vertex0047.drawPrimitives addObject:fillCircle0624];
    
    MWDrawFillCircle *fillCircle0625 = [[MWDrawFillCircle alloc] init];
    fillCircle0625.center = CGPointMake(2727.5, 3435);
    fillCircle0625.radius = 13;
    fillCircle0625.fillColor = [UIColor blackColor];
    [vertex0047.drawPrimitives addObject:fillCircle0625];
    
    MWDrawLine *drawLine0596 = [[MWDrawLine alloc] init];
    drawLine0596.startPoint = CGPointMake(2705, 3435);
    drawLine0596.endPoint = CGPointMake(2727.5, 3435);
    drawLine0596.width = 26;
    drawLine0596.color = [UIColor blackColor];
    [vertex0047.drawPrimitives addObject:drawLine0596];
    
    MWDrawFillCircle *fillCircle0626 = [[MWDrawFillCircle alloc] init];
    fillCircle0626.center = CGPointMake(2705, 3435);
    fillCircle0626.radius = 11;
    fillCircle0626.fillColor = [UIColor whiteColor];
    [vertex0047.drawPrimitives addObject:fillCircle0626];
    
    MWDrawFillCircle *fillCircle0627 = [[MWDrawFillCircle alloc] init];
    fillCircle0627.center = CGPointMake(2727.5, 3435);
    fillCircle0627.radius = 11;
    fillCircle0627.fillColor = [UIColor whiteColor];
    [vertex0047.drawPrimitives addObject:fillCircle0627];
    
    MWDrawLine *drawLine0597 = [[MWDrawLine alloc] init];
    drawLine0597.startPoint = CGPointMake(2705, 3435);
    drawLine0597.endPoint = CGPointMake(2727.5, 3435);
    drawLine0597.width = 22;
    drawLine0597.color = [UIColor whiteColor];
    [vertex0047.drawPrimitives addObject:drawLine0597];
    
    MWDrawFillCircle *fillCircle0628 = [[MWDrawFillCircle alloc] init];
    fillCircle0628.center = CGPointMake(2727.5, 3435);
    fillCircle0628.radius = 8;
    fillCircle0628.fillColor = line0006.color;
    [vertex0047.drawPrimitives addObject:fillCircle0628];

    // Trocadéro
    MWVertex *vertex0048 = [[MWVertex alloc] init];
    vertex0048.identifier = @"vertex0048";
    vertex0048.developmentName = @"Вершина: Trocadéro";
    [self.vertices addObject:vertex0048];

    MWDrawFillCircle *fillCircle0629 = [[MWDrawFillCircle alloc] init];
    fillCircle0629.center = CGPointMake(830.5, 2350.5);
    fillCircle0629.radius = 13;
    fillCircle0629.fillColor = [UIColor blackColor];
    [vertex0048.drawPrimitives addObject:fillCircle0629];

    MWDrawFillCircle *fillCircle0630 = [[MWDrawFillCircle alloc] init];
    fillCircle0630.center = CGPointMake(830.5, 2350.5);
    fillCircle0630.radius = 11;
    fillCircle0630.fillColor = [UIColor whiteColor];
    [vertex0048.drawPrimitives addObject:fillCircle0630];

    // La Motte-Picquet — Grenelle
    MWVertex *vertex0049 = [[MWVertex alloc] init];
    vertex0049.identifier = @"vertex0049";
    vertex0049.developmentName = @"Вершина: La Motte-Picquet — Grenelle";
    [self.vertices addObject:vertex0049];

    MWDrawFillCircle *fillCircle0631 = [[MWDrawFillCircle alloc] init];
    fillCircle0631.center = CGPointMake(1231, 2912);
    fillCircle0631.radius = 13;
    fillCircle0631.fillColor = [UIColor blackColor];
    [vertex0049.drawPrimitives addObject:fillCircle0631];
    
    MWDrawFillCircle *fillCircle0632 = [[MWDrawFillCircle alloc] init];
    fillCircle0632.center = CGPointMake(1231, 2935);
    fillCircle0632.radius = 13;
    fillCircle0632.fillColor = [UIColor blackColor];
    [vertex0049.drawPrimitives addObject:fillCircle0632];
    
    MWDrawLine *drawLine0598 = [[MWDrawLine alloc] init];
    drawLine0598.startPoint = CGPointMake(1231, 2912);
    drawLine0598.endPoint = CGPointMake(1231, 2935);
    drawLine0598.width = 26;
    drawLine0598.color = [UIColor blackColor];
    [vertex0049.drawPrimitives addObject:drawLine0598];
    
    MWDrawFillCircle *fillCircle0633 = [[MWDrawFillCircle alloc] init];
    fillCircle0633.center = CGPointMake(1231, 2912);
    fillCircle0633.radius = 11;
    fillCircle0633.fillColor = [UIColor whiteColor];
    [vertex0049.drawPrimitives addObject:fillCircle0633];
    
    MWDrawFillCircle *fillCircle0634 = [[MWDrawFillCircle alloc] init];
    fillCircle0634.center = CGPointMake(1231, 2935);
    fillCircle0634.radius = 11;
    fillCircle0634.fillColor = [UIColor whiteColor];
    [vertex0049.drawPrimitives addObject:fillCircle0634];
    
    MWDrawLine *drawLine0599 = [[MWDrawLine alloc] init];
    drawLine0599.startPoint = CGPointMake(1231, 2912);
    drawLine0599.endPoint = CGPointMake(1231, 2935);
    drawLine0599.width = 22;
    drawLine0599.color = [UIColor whiteColor];
    [vertex0049.drawPrimitives addObject:drawLine0599];
    
    // Pasteur
    MWVertex *vertex0050 = [[MWVertex alloc] init];
    vertex0050.identifier = @"vertex0050";
    vertex0050.developmentName = @"Вершина: Pasteur";
    [self.vertices addObject:vertex0050];

    MWDrawFillCircle *fillCircle0635 = [[MWDrawFillCircle alloc] init];
    fillCircle0635.center = CGPointMake(1709.5, 3168.5);
    fillCircle0635.radius = 13;
    fillCircle0635.fillColor = [UIColor blackColor];
    [vertex0050.drawPrimitives addObject:fillCircle0635];

    MWDrawFillCircle *fillCircle0636 = [[MWDrawFillCircle alloc] init];
    fillCircle0636.center = CGPointMake(1709.5, 3168.5);
    fillCircle0636.radius = 11;
    fillCircle0636.fillColor = [UIColor whiteColor];
    [vertex0050.drawPrimitives addObject:fillCircle0636];

    // Bercy
    MWVertex *vertex0051 = [[MWVertex alloc] init];
    vertex0051.identifier = @"vertex0051";
    vertex0051.developmentName = @"Вершина: Bercy";
    [self.vertices addObject:vertex0051];

    MWDrawFillCircle *fillCircle0637 = [[MWDrawFillCircle alloc] init];
    fillCircle0637.center = CGPointMake(3302.5, 3221.5);
    fillCircle0637.radius = 13;
    fillCircle0637.fillColor = [UIColor blackColor];
    [vertex0051.drawPrimitives addObject:fillCircle0637];
    
    MWDrawFillCircle *fillCircle0638 = [[MWDrawFillCircle alloc] init];
    fillCircle0638.center = CGPointMake(3302.5, 3221.5);
    fillCircle0638.radius = 11;
    fillCircle0638.fillColor = [UIColor whiteColor];
    [vertex0051.drawPrimitives addObject:fillCircle0638];

    // Daumesnil
    MWVertex *vertex0052 = [[MWVertex alloc] init];
    vertex0052.identifier = @"vertex0052";
    vertex0052.developmentName = @"Вершина: Daumesnil";
    [self.vertices addObject:vertex0052];

    MWDrawFillCircle *fillCircle0639 = [[MWDrawFillCircle alloc] init];
    fillCircle0639.center = CGPointMake(3498, 3026.5);
    fillCircle0639.radius = 13;
    fillCircle0639.fillColor = [UIColor blackColor];
    [vertex0052.drawPrimitives addObject:fillCircle0639];
    
    MWDrawFillCircle *fillCircle0640 = [[MWDrawFillCircle alloc] init];
    fillCircle0640.center = CGPointMake(3498, 3026.5);
    fillCircle0640.radius = 11;
    fillCircle0640.fillColor = [UIColor whiteColor];
    [vertex0052.drawPrimitives addObject:fillCircle0640];
    
    // La Courneuve - 8 Mai 1945
    MWVertex *vertex0053 = [[MWVertex alloc] init];
    vertex0053.identifier = @"vertex0053";
    vertex0053.developmentName = @"Вершина: La Courneuve - 8 Mai 1945";
    [self.vertices addObject:vertex0053];

    // Louis Blanc
    MWVertex *vertex0054 = [[MWVertex alloc] init];
    vertex0054.identifier = @"vertex0054";
    vertex0054.developmentName = @"Вершина: Louis Blanc";
    [self.vertices addObject:vertex0054];
    
    MWDrawFillCircle *fillCircle0641 = [[MWDrawFillCircle alloc] init];
    fillCircle0641.center = CGPointMake(3006.5, 1457.5);
    fillCircle0641.radius = 13;
    fillCircle0641.fillColor = [UIColor blackColor];
    [vertex0054.drawPrimitives addObject:fillCircle0641];
    
    MWDrawFillCircle *fillCircle0642 = [[MWDrawFillCircle alloc] init];
    fillCircle0642.center = CGPointMake(3023, 1474);
    fillCircle0642.radius = 13;
    fillCircle0642.fillColor = [UIColor blackColor];
    [vertex0054.drawPrimitives addObject:fillCircle0642];
    
    MWDrawLine *drawLine0600 = [[MWDrawLine alloc] init];
    drawLine0600.startPoint = CGPointMake(3006.5, 1457.5);
    drawLine0600.endPoint = CGPointMake(3023, 1474);
    drawLine0600.width = 26;
    drawLine0600.color = [UIColor blackColor];
    [vertex0054.drawPrimitives addObject:drawLine0600];
    
    MWDrawFillCircle *fillCircle0643 = [[MWDrawFillCircle alloc] init];
    fillCircle0643.center = CGPointMake(3006.5, 1457.5);
    fillCircle0643.radius = 11;
    fillCircle0643.fillColor = [UIColor whiteColor];
    [vertex0054.drawPrimitives addObject:fillCircle0643];
    
    MWDrawFillCircle *fillCircle0644 = [[MWDrawFillCircle alloc] init];
    fillCircle0644.center = CGPointMake(3023, 1474);
    fillCircle0644.radius = 11;
    fillCircle0644.fillColor = [UIColor whiteColor];
    [vertex0054.drawPrimitives addObject:fillCircle0644];
    
    MWDrawLine *drawLine0601 = [[MWDrawLine alloc] init];
    drawLine0601.startPoint = CGPointMake(3006.5, 1457.5);
    drawLine0601.endPoint = CGPointMake(3023, 1474);
    drawLine0601.width = 22;
    drawLine0601.color = [UIColor whiteColor];
    [vertex0054.drawPrimitives addObject:drawLine0601];

    MWDrawFillCircle *fillCircle0645 = [[MWDrawFillCircle alloc] init];
    fillCircle0645.center = CGPointMake(3023, 1474);
    fillCircle0645.radius = 8;
    fillCircle0645.fillColor = line0007.color;
    [vertex0054.drawPrimitives addObject:fillCircle0645];

    // Chaussée d'Antin - La Fayette
    MWVertex *vertex0055 = [[MWVertex alloc] init];
    vertex0055.identifier = @"vertex0055";
    vertex0055.developmentName = @"Вершина: Chaussée d'Antin - La Fayette";
    [self.vertices addObject:vertex0055];

    MWDrawFillCircle *fillCircle0646 = [[MWDrawFillCircle alloc] init];
    fillCircle0646.center = CGPointMake(2001.5, 1900);
    fillCircle0646.radius = 13;
    fillCircle0646.fillColor = [UIColor blackColor];
    [vertex0055.drawPrimitives addObject:fillCircle0646];

    MWDrawFillCircle *fillCircle0647 = [[MWDrawFillCircle alloc] init];
    fillCircle0647.center = CGPointMake(2001.5, 1900);
    fillCircle0647.radius = 11;
    fillCircle0647.fillColor = [UIColor whiteColor];
    [vertex0055.drawPrimitives addObject:fillCircle0647];

    // Pyramides
    MWVertex *vertex0056 = [[MWVertex alloc] init];
    vertex0056.identifier = @"vertex0056";
    vertex0056.developmentName = @"Вершина: Pyramides";
    [self.vertices addObject:vertex0056];

    MWDrawFillCircle *fillCircle0648 = [[MWDrawFillCircle alloc] init];
    fillCircle0648.center = CGPointMake(1895.5, 2164);
    fillCircle0648.radius = 13;
    fillCircle0648.fillColor = [UIColor blackColor];
    [vertex0056.drawPrimitives addObject:fillCircle0648];
    
    MWDrawFillCircle *fillCircle0649 = [[MWDrawFillCircle alloc] init];
    fillCircle0649.center = CGPointMake(1895.5, 2164);
    fillCircle0649.radius = 11;
    fillCircle0649.fillColor = [UIColor whiteColor];
    [vertex0056.drawPrimitives addObject:fillCircle0649];

    // Jussieu
    MWVertex *vertex0057 = [[MWVertex alloc] init];
    vertex0057.identifier = @"vertex0057";
    vertex0057.developmentName = @"Вершина: Jussieu";
    [self.vertices addObject:vertex0057];

    MWDrawFillCircle *fillCircle0650 = [[MWDrawFillCircle alloc] init];
    fillCircle0650.center = CGPointMake(2633, 2940);
    fillCircle0650.radius = 13;
    fillCircle0650.fillColor = [UIColor blackColor];
    [vertex0057.drawPrimitives addObject:fillCircle0650];
    
    MWDrawFillCircle *fillCircle0651 = [[MWDrawFillCircle alloc] init];
    fillCircle0651.center = CGPointMake(2633, 2962);
    fillCircle0651.radius = 13;
    fillCircle0651.fillColor = [UIColor blackColor];
    [vertex0057.drawPrimitives addObject:fillCircle0651];
    
    MWDrawLine *drawLine0602 = [[MWDrawLine alloc] init];
    drawLine0602.startPoint = CGPointMake(2633, 2940);
    drawLine0602.endPoint = CGPointMake(2633, 2962);
    drawLine0602.width = 26;
    drawLine0602.color = [UIColor blackColor];
    [vertex0057.drawPrimitives addObject:drawLine0602];
    
    MWDrawFillCircle *fillCircle0652 = [[MWDrawFillCircle alloc] init];
    fillCircle0652.center = CGPointMake(2633, 2940);
    fillCircle0652.radius = 11;
    fillCircle0652.fillColor = [UIColor whiteColor];
    [vertex0057.drawPrimitives addObject:fillCircle0652];
    
    MWDrawFillCircle *fillCircle0653 = [[MWDrawFillCircle alloc] init];
    fillCircle0653.center = CGPointMake(2633, 2962);
    fillCircle0653.radius = 11;
    fillCircle0653.fillColor = [UIColor whiteColor];
    [vertex0057.drawPrimitives addObject:fillCircle0653];
    
    MWDrawLine *drawLine0603 = [[MWDrawLine alloc] init];
    drawLine0603.startPoint = CGPointMake(2633, 2940);
    drawLine0603.endPoint = CGPointMake(2633, 2962);
    drawLine0603.width = 22;
    drawLine0603.color = [UIColor whiteColor];
    [vertex0057.drawPrimitives addObject:drawLine0603];
    
    // Maison Blanche
    MWVertex *vertex0058 = [[MWVertex alloc] init];
    vertex0058.identifier = @"vertex0058";
    vertex0058.developmentName = @"Вершина: Maison Blanche";
    [self.vertices addObject:vertex0058];
    
    MWDrawFillCircle *fillCircle0654 = [[MWDrawFillCircle alloc] init];
    fillCircle0654.center = CGPointMake(2705, 3613);
    fillCircle0654.radius = 13;
    fillCircle0654.fillColor = [UIColor blackColor];
    [vertex0058.drawPrimitives addObject:fillCircle0654];

    MWDrawFillCircle *fillCircle0655 = [[MWDrawFillCircle alloc] init];
    fillCircle0655.center = CGPointMake(2705, 3613);
    fillCircle0655.radius = 11;
    fillCircle0655.fillColor = [UIColor whiteColor];
    [vertex0058.drawPrimitives addObject:fillCircle0655];

    // Villejuif - Louis Aragon
    MWVertex *vertex0059 = [[MWVertex alloc] init];
    vertex0059.identifier = @"vertex0059";
    vertex0059.developmentName = @"Вершина: Villejuif - Louis Aragon";
    [self.vertices addObject:vertex0059];

    // Mairie d'Ivry
    MWVertex *vertex0060 = [[MWVertex alloc] init];
    vertex0060.identifier = @"vertex0060";
    vertex0060.developmentName = @"Вершина: Mairie d'Ivry";
    [self.vertices addObject:vertex0060];

    // Place des Fêtes
    MWVertex *vertex0061 = [[MWVertex alloc] init];
    vertex0061.identifier = @"vertex0061";
    vertex0061.developmentName = @"Вершина: Place des Fêtes";
    [self.vertices addObject:vertex0061];

    MWDrawFillCircle *fillCircle0656 = [[MWDrawFillCircle alloc] init];
    fillCircle0656.center = CGPointMake(3623, 1649);
    fillCircle0656.radius = 13;
    fillCircle0656.fillColor = [UIColor blackColor];
    [vertex0061.drawPrimitives addObject:fillCircle0656];
    
    MWDrawFillCircle *fillCircle0657 = [[MWDrawFillCircle alloc] init];
    fillCircle0657.center = CGPointMake(3623, 1672);
    fillCircle0657.radius = 13;
    fillCircle0657.fillColor = [UIColor blackColor];
    [vertex0061.drawPrimitives addObject:fillCircle0657];
    
    MWDrawLine *drawLine0604 = [[MWDrawLine alloc] init];
    drawLine0604.startPoint = CGPointMake(3623, 1649);
    drawLine0604.endPoint = CGPointMake(3623, 1672);
    drawLine0604.width = 26;
    drawLine0604.color = [UIColor blackColor];
    [vertex0061.drawPrimitives addObject:drawLine0604];
    
    MWDrawFillCircle *fillCircle0658 = [[MWDrawFillCircle alloc] init];
    fillCircle0658.center = CGPointMake(3623, 1649);
    fillCircle0658.radius = 11;
    fillCircle0658.fillColor = [UIColor whiteColor];
    [vertex0061.drawPrimitives addObject:fillCircle0658];
    
    MWDrawFillCircle *fillCircle0659 = [[MWDrawFillCircle alloc] init];
    fillCircle0659.center = CGPointMake(3623, 1672);
    fillCircle0659.radius = 11;
    fillCircle0659.fillColor = [UIColor whiteColor];
    [vertex0061.drawPrimitives addObject:fillCircle0659];
    
    MWDrawLine *drawLine0605 = [[MWDrawLine alloc] init];
    drawLine0605.startPoint = CGPointMake(3623, 1649);
    drawLine0605.endPoint = CGPointMake(3623, 1672);
    drawLine0605.width = 22;
    drawLine0605.color = [UIColor whiteColor];
    [vertex0061.drawPrimitives addObject:drawLine0605];
    
    // Balard
    MWVertex *vertex0062 = [[MWVertex alloc] init];
    vertex0062.identifier = @"vertex0062";
    vertex0062.developmentName = @"Вершина: Balard";
    [self.vertices addObject:vertex0062];

    // Invalides
    MWVertex *vertex0063 = [[MWVertex alloc] init];
    vertex0063.identifier = @"vertex0063";
    vertex0063.developmentName = @"Вершина: Invalides";
    [self.vertices addObject:vertex0063];

    MWDrawFillCircle *fillCircle0660 = [[MWDrawFillCircle alloc] init];
    fillCircle0660.center = CGPointMake(1446, 2464.5);
    fillCircle0660.radius = 13;
    fillCircle0660.fillColor = [UIColor blackColor];
    [vertex0063.drawPrimitives addObject:fillCircle0660];

    MWDrawFillCircle *fillCircle0661 = [[MWDrawFillCircle alloc] init];
    fillCircle0661.center = CGPointMake(1446, 2464.5);
    fillCircle0661.radius = 11;
    fillCircle0661.fillColor = [UIColor whiteColor];
    [vertex0063.drawPrimitives addObject:fillCircle0661];

    // Madeleine
    MWVertex *vertex0064 = [[MWVertex alloc] init];
    vertex0064.identifier = @"vertex0064";
    vertex0064.developmentName = @"Вершина: Madeleine";
    [self.vertices addObject:vertex0064];

    MWDrawFillCircle *fillCircle0662 = [[MWDrawFillCircle alloc] init];
    fillCircle0662.center = CGPointMake(1535, 2141.5);
    fillCircle0662.radius = 13;
    fillCircle0662.fillColor = [UIColor blackColor];
    [vertex0064.drawPrimitives addObject:fillCircle0662];
    
    MWDrawFillCircle *fillCircle0663 = [[MWDrawFillCircle alloc] init];
    fillCircle0663.center = CGPointMake(1557, 2141.5);
    fillCircle0663.radius = 13;
    fillCircle0663.fillColor = [UIColor blackColor];
    [vertex0064.drawPrimitives addObject:fillCircle0663];
    
    MWDrawLine *drawLine0606 = [[MWDrawLine alloc] init];
    drawLine0606.startPoint = CGPointMake(1535, 2141.5);
    drawLine0606.endPoint = CGPointMake(1557, 2141.5);
    drawLine0606.width = 26;
    drawLine0606.color = [UIColor blackColor];
    [vertex0064.drawPrimitives addObject:drawLine0606];
    
    MWDrawFillCircle *fillCircle0664 = [[MWDrawFillCircle alloc] init];
    fillCircle0664.center = CGPointMake(1535, 2141.5);
    fillCircle0664.radius = 11;
    fillCircle0664.fillColor = [UIColor whiteColor];
    [vertex0064.drawPrimitives addObject:fillCircle0664];
    
    MWDrawFillCircle *fillCircle0665 = [[MWDrawFillCircle alloc] init];
    fillCircle0665.center = CGPointMake(1557, 2141.5);
    fillCircle0665.radius = 11;
    fillCircle0665.fillColor = [UIColor whiteColor];
    [vertex0064.drawPrimitives addObject:fillCircle0665];
    
    MWDrawLine *drawLine0607 = [[MWDrawLine alloc] init];
    drawLine0607.startPoint = CGPointMake(1535, 2141.5);
    drawLine0607.endPoint = CGPointMake(1557, 2141.5);
    drawLine0607.width = 22;
    drawLine0607.color = [UIColor whiteColor];
    [vertex0064.drawPrimitives addObject:drawLine0607];

    // Richelieu – Drouot
    MWVertex *vertex0065 = [[MWVertex alloc] init];
    vertex0065.identifier = @"vertex0065";
    vertex0065.developmentName = @"Вершина: Richelieu – Drouot";
    [self.vertices addObject:vertex0065];

    MWDrawFillCircle *fillCircle0666 = [[MWDrawFillCircle alloc] init];
    fillCircle0666.center = CGPointMake(2126.5, 1900);
    fillCircle0666.radius = 13;
    fillCircle0666.fillColor = [UIColor blackColor];
    [vertex0065.drawPrimitives addObject:fillCircle0666];
    
    MWDrawFillCircle *fillCircle0667 = [[MWDrawFillCircle alloc] init];
    fillCircle0667.center = CGPointMake(2126.5, 1922);
    fillCircle0667.radius = 13;
    fillCircle0667.fillColor = [UIColor blackColor];
    [vertex0065.drawPrimitives addObject:fillCircle0667];
    
    MWDrawLine *drawLine0608 = [[MWDrawLine alloc] init];
    drawLine0608.startPoint = CGPointMake(2126.5, 1900);
    drawLine0608.endPoint = CGPointMake(2126.5, 1922);
    drawLine0608.width = 26;
    drawLine0608.color = [UIColor blackColor];
    [vertex0065.drawPrimitives addObject:drawLine0608];

    MWDrawFillCircle *fillCircle0668 = [[MWDrawFillCircle alloc] init];
    fillCircle0668.center = CGPointMake(2126.5, 1900);
    fillCircle0668.radius = 11;
    fillCircle0668.fillColor = [UIColor whiteColor];
    [vertex0065.drawPrimitives addObject:fillCircle0668];
    
    MWDrawFillCircle *fillCircle0669 = [[MWDrawFillCircle alloc] init];
    fillCircle0669.center = CGPointMake(2126.5, 1922);
    fillCircle0669.radius = 11;
    fillCircle0669.fillColor = [UIColor whiteColor];
    [vertex0065.drawPrimitives addObject:fillCircle0669];
    
    MWDrawLine *drawLine0609 = [[MWDrawLine alloc] init];
    drawLine0609.startPoint = CGPointMake(2126.5, 1900);
    drawLine0609.endPoint = CGPointMake(2126.5, 1922);
    drawLine0609.width = 22;
    drawLine0609.color = [UIColor whiteColor];
    [vertex0065.drawPrimitives addObject:drawLine0609];
    
    // Grands Boulevards
    MWVertex *vertex0066 = [[MWVertex alloc] init];
    vertex0066.identifier = @"vertex0066";
    vertex0066.developmentName = @"Вершина: Grands Boulevards";
    [self.vertices addObject:vertex0066];

    MWDrawFillCircle *fillCircle0670 = [[MWDrawFillCircle alloc] init];
    fillCircle0670.center = CGPointMake(2288, 1922);
    fillCircle0670.radius = 12;
    fillCircle0670.fillColor = line0010.color;
    [vertex0066.drawPrimitives addObject:fillCircle0670];

    MWDrawFillCircle *fillCircle0671 = [[MWDrawFillCircle alloc] init];
    fillCircle0671.center = CGPointMake(2288, 1900);
    fillCircle0671.radius = 12;
    fillCircle0671.fillColor = line0011.color;
    [vertex0066.drawPrimitives addObject:fillCircle0671];

    MWDrawLine *drawLine0610 = [[MWDrawLine alloc] init];
    drawLine0610.startPoint = CGPointMake(2288, 1922);
    drawLine0610.endPoint = CGPointMake(2288, 1911);
    drawLine0610.width = 22;
    drawLine0610.color = line0010.color;
    [vertex0066.drawPrimitives addObject:drawLine0610];

    MWDrawLine *drawLine0611 = [[MWDrawLine alloc] init];
    drawLine0611.startPoint = CGPointMake(2288, 1911);
    drawLine0611.endPoint = CGPointMake(2288, 1900);
    drawLine0611.width = 22;
    drawLine0611.color = line0011.color;
    [vertex0066.drawPrimitives addObject:drawLine0611];

    // Bonne Nouvelle
    MWVertex *vertex0067 = [[MWVertex alloc] init];
    vertex0067.identifier = @"vertex0067";
    vertex0067.developmentName = @"Вершина: Bonne Nouvelle";
    [self.vertices addObject:vertex0067];

    MWDrawFillCircle *fillCircle0672 = [[MWDrawFillCircle alloc] init];
    fillCircle0672.center = CGPointMake(2505, 1922);
    fillCircle0672.radius = 12;
    fillCircle0672.fillColor = line0010.color;
    [vertex0067.drawPrimitives addObject:fillCircle0672];
    
    MWDrawFillCircle *fillCircle0673 = [[MWDrawFillCircle alloc] init];
    fillCircle0673.center = CGPointMake(2505, 1900);
    fillCircle0673.radius = 12;
    fillCircle0673.fillColor = line0011.color;
    [vertex0067.drawPrimitives addObject:fillCircle0673];
    
    MWDrawLine *drawLine0612 = [[MWDrawLine alloc] init];
    drawLine0612.startPoint = CGPointMake(2505, 1922);
    drawLine0612.endPoint = CGPointMake(2505, 1911);
    drawLine0612.width = 22;
    drawLine0612.color = line0010.color;
    [vertex0067.drawPrimitives addObject:drawLine0612];
    
    MWDrawLine *drawLine0613 = [[MWDrawLine alloc] init];
    drawLine0613.startPoint = CGPointMake(2505, 1911);
    drawLine0613.endPoint = CGPointMake(2505, 1900);
    drawLine0613.width = 22;
    drawLine0613.color = line0011.color;
    [vertex0067.drawPrimitives addObject:drawLine0613];

    // Créteil – Pointe du Lac
    MWVertex *vertex0068 = [[MWVertex alloc] init];
    vertex0068.identifier = @"vertex0068";
    vertex0068.developmentName = @"Вершина: Créteil – Pointe du Lac";
    [self.vertices addObject:vertex0068];
    
    // Pont de Sèvres
    MWVertex *vertex0069 = [[MWVertex alloc] init];
    vertex0069.identifier = @"vertex0069";
    vertex0069.developmentName = @"Вершина: Pont de Sèvres";
    [self.vertices addObject:vertex0069];

    // Michel-Ange - Molitor
    MWVertex *vertex0070 = [[MWVertex alloc] init];
    vertex0070.identifier = @"vertex0070";
    vertex0070.developmentName = @"Вершина: Michel-Ange - Molitor";
    [self.vertices addObject:vertex0070];

    MWDrawFillCircle *fillCircle0674 = [[MWDrawFillCircle alloc] init];
    fillCircle0674.center = CGPointMake(608, 3179.5);
    fillCircle0674.radius = 13;
    fillCircle0674.fillColor = [UIColor blackColor];
    [vertex0070.drawPrimitives addObject:fillCircle0674];

    MWDrawFillCircle *fillCircle0675 = [[MWDrawFillCircle alloc] init];
    fillCircle0675.center = CGPointMake(608, 3179.5);
    fillCircle0675.radius = 11;
    fillCircle0675.fillColor = [UIColor whiteColor];
    [vertex0070.drawPrimitives addObject:fillCircle0675];

    // Michel-Ange - Auteuil
    MWVertex *vertex0071 = [[MWVertex alloc] init];
    vertex0071.identifier = @"vertex0071";
    vertex0071.developmentName = @"Вершина: Michel-Ange - Auteuil";
    [self.vertices addObject:vertex0071];

    MWDrawFillCircle *fillCircle0676 = [[MWDrawFillCircle alloc] init];
    fillCircle0676.center = CGPointMake(608, 3062.5);
    fillCircle0676.radius = 13;
    fillCircle0676.fillColor = [UIColor blackColor];
    [vertex0071.drawPrimitives addObject:fillCircle0676];
    
    MWDrawFillCircle *fillCircle0677 = [[MWDrawFillCircle alloc] init];
    fillCircle0677.center = CGPointMake(608, 3062.5);
    fillCircle0677.radius = 11;
    fillCircle0677.fillColor = [UIColor whiteColor];
    [vertex0071.drawPrimitives addObject:fillCircle0677];

    // Miromesnil
    MWVertex *vertex0072 = [[MWVertex alloc] init];
    vertex0072.identifier = @"vertex0072";
    vertex0072.developmentName = @"Вершина: Miromesnil";
    [self.vertices addObject:vertex0072];

    MWDrawFillCircle *fillCircle0678 = [[MWDrawFillCircle alloc] init];
    fillCircle0678.center = CGPointMake(1575.5, 1906);
    fillCircle0678.radius = 13;
    fillCircle0678.fillColor = [UIColor blackColor];
    [vertex0072.drawPrimitives addObject:fillCircle0678];
    
    MWDrawFillCircle *fillCircle0679 = [[MWDrawFillCircle alloc] init];
    fillCircle0679.center = CGPointMake(1591.5, 1922);
    fillCircle0679.radius = 13;
    fillCircle0679.fillColor = [UIColor blackColor];
    [vertex0072.drawPrimitives addObject:fillCircle0679];
    
    MWDrawLine *drawLine0614 = [[MWDrawLine alloc] init];
    drawLine0614.startPoint = CGPointMake(1575.5, 1906);
    drawLine0614.endPoint = CGPointMake(1591.5, 1922);
    drawLine0614.width = 26;
    drawLine0614.color = [UIColor blackColor];
    [vertex0072.drawPrimitives addObject:drawLine0614];
    
    MWDrawFillCircle *fillCircle0680 = [[MWDrawFillCircle alloc] init];
    fillCircle0680.center = CGPointMake(1575.5, 1906);
    fillCircle0680.radius = 11;
    fillCircle0680.fillColor = [UIColor whiteColor];
    [vertex0072.drawPrimitives addObject:fillCircle0680];
    
    MWDrawFillCircle *fillCircle0681 = [[MWDrawFillCircle alloc] init];
    fillCircle0681.center = CGPointMake(1591.5, 1922);
    fillCircle0681.radius = 11;
    fillCircle0681.fillColor = [UIColor whiteColor];
    [vertex0072.drawPrimitives addObject:fillCircle0681];
    
    MWDrawLine *drawLine0615 = [[MWDrawLine alloc] init];
    drawLine0615.startPoint = CGPointMake(1575.5, 1906);
    drawLine0615.endPoint = CGPointMake(1591.5, 1922);
    drawLine0615.width = 22;
    drawLine0615.color = [UIColor whiteColor];
    [vertex0072.drawPrimitives addObject:drawLine0615];

    // Saint-Augustin
//    MWVertex *vertex0073 = [[MWVertex alloc] init];
//    vertex0073.identifier = @"vertex0073";
//    vertex0073.developmentName = @"Вершина: Saint-Augustin";
//    [self.vertices addObject:vertex0073];

    // Mairie de Montreuil
    MWVertex *vertex0074 = [[MWVertex alloc] init];
    vertex0074.identifier = @"vertex0074";
    vertex0074.developmentName = @"Вершина: Mairie de Montreuil";
    [self.vertices addObject:vertex0074];

    // Boulogne – Pont de Saint-Cloud
    MWVertex *vertex0075 = [[MWVertex alloc] init];
    vertex0075.identifier = @"vertex0075";
    vertex0075.developmentName = @"Вершина: Boulogne – Pont de Saint-Cloud";
    [self.vertices addObject:vertex0075];

    // Duroc
    MWVertex *vertex0076 = [[MWVertex alloc] init];
    vertex0076.identifier = @"vertex0076";
    vertex0076.developmentName = @"Вершина: Duroc";
    [self.vertices addObject:vertex0076];

    MWDrawFillCircle *fillCircle0682 = [[MWDrawFillCircle alloc] init];
    fillCircle0682.center = CGPointMake(1654, 2990);
    fillCircle0682.radius = 13;
    fillCircle0682.fillColor = [UIColor blackColor];
    [vertex0076.drawPrimitives addObject:fillCircle0682];

    MWDrawFillCircle *fillCircle0683 = [[MWDrawFillCircle alloc] init];
    fillCircle0683.center = CGPointMake(1654, 2990);
    fillCircle0683.radius = 11;
    fillCircle0683.fillColor = [UIColor whiteColor];
    [vertex0076.drawPrimitives addObject:fillCircle0683];

    // Sèvres – Babylone
    MWVertex *vertex0077 = [[MWVertex alloc] init];
    vertex0077.identifier = @"vertex0077";
    vertex0077.developmentName = @"Вершина: Sèvres – Babylone";
    [self.vertices addObject:vertex0077];

    MWDrawFillCircle *fillCircle0684 = [[MWDrawFillCircle alloc] init];
    fillCircle0684.center = CGPointMake(1837.5, 2806.5);
    fillCircle0684.radius = 13;
    fillCircle0684.fillColor = [UIColor blackColor];
    [vertex0077.drawPrimitives addObject:fillCircle0684];

    MWDrawFillCircle *fillCircle0685 = [[MWDrawFillCircle alloc] init];
    fillCircle0685.center = CGPointMake(1837.5, 2806.5);
    fillCircle0685.radius = 11;
    fillCircle0685.fillColor = [UIColor whiteColor];
    [vertex0077.drawPrimitives addObject:fillCircle0685];
    
    // Mairie des Lilas
    MWVertex *vertex0078 = [[MWVertex alloc] init];
    vertex0078.identifier = @"vertex0078";
    vertex0078.developmentName = @"Вершина: Mairie des Lilas";
    [self.vertices addObject:vertex0078];

    // Front Populaire
    MWVertex *vertex0079 = [[MWVertex alloc] init];
    vertex0079.identifier = @"vertex0079";
    vertex0079.developmentName = @"Вершина: Front Populaire";
    [self.vertices addObject:vertex0079];

    // Mairie d'Issy
    MWVertex *vertex0080 = [[MWVertex alloc] init];
    vertex0080.identifier = @"vertex0080";
    vertex0080.developmentName = @"Вершина: Mairie d'Issy";
    [self.vertices addObject:vertex0080];

    // Saint-Denis - Université
    MWVertex *vertex0081 = [[MWVertex alloc] init];
    vertex0081.identifier = @"vertex0081";
    vertex0081.developmentName = @"Вершина: Saint-Denis - Université";
    [self.vertices addObject:vertex0081];
    
    // Asnières – Gennevilliers – Les Courtilles
    MWVertex *vertex0082 = [[MWVertex alloc] init];
    vertex0082.identifier = @"vertex0082";
    vertex0082.developmentName = @"Вершина: Asnières – Gennevilliers – Les Courtilles";
    [self.vertices addObject:vertex0082];
    
    // La Fourche
    MWVertex *vertex0083 = [[MWVertex alloc] init];
    vertex0083.identifier = @"vertex0083";
    vertex0083.developmentName = @"Вершина: La Fourche";
    [self.vertices addObject:vertex0083];
    
    MWDrawFillCircle *fillCircle0437 = [[MWDrawFillCircle alloc] init];
    fillCircle0437.center = CGPointMake(1754, 1217.5);
    fillCircle0437.radius = 13;
    fillCircle0437.fillColor = [UIColor blackColor];
    [vertex0083.drawPrimitives addObject:fillCircle0437];

    MWDrawFillCircle *fillCircle0438 = [[MWDrawFillCircle alloc] init];
    fillCircle0438.center = CGPointMake(1754, 1217.5);
    fillCircle0438.radius = 11;
    fillCircle0438.fillColor = [UIColor whiteColor];
    [vertex0083.drawPrimitives addObject:fillCircle0438];

    // Olympiades
    MWVertex *vertex0085 = [[MWVertex alloc] init];
    vertex0085.identifier = @"vertex0085";
    vertex0085.developmentName = @"Вершина: Olympiades";
    [self.vertices addObject:vertex0085];

    // Botzaris
    MWVertex *vertex0086 = [[MWVertex alloc] init];
    vertex0086.identifier = @"vertex0086";
    vertex0086.developmentName = @"Вершина: Botzaris";
    [self.vertices addObject:vertex0086];

    // Boulogne – Jean Jaurès
    MWVertex *vertex0087 = [[MWVertex alloc] init];
    vertex0087.identifier = @"vertex0087";
    vertex0087.developmentName = @"Вершина: Boulogne – Jean Jaurès";
    [self.vertices addObject:vertex0087];

    MWDrawFillCircle *fillCircle0336 = [[MWDrawFillCircle alloc] init];
    fillCircle0336.center = CGPointMake(399.5, 3210);
    fillCircle0336.radius = 13;
    fillCircle0336.fillColor = [UIColor blackColor];
    [vertex0087.drawPrimitives addObject:fillCircle0336];
    
    MWDrawFillCircle *fillCircle0337 = [[MWDrawFillCircle alloc] init];
    fillCircle0337.center = CGPointMake(399.5, 3210);
    fillCircle0337.radius = 11;
    fillCircle0337.fillColor = [UIColor whiteColor];
    [vertex0087.drawPrimitives addObject:fillCircle0337];

    // Javel – André Citroën
    MWVertex *vertex0088 = [[MWVertex alloc] init];
    vertex0088.identifier = @"vertex0088";
    vertex0088.developmentName = @"Вершина: Javel – André Citroën";
    [self.vertices addObject:vertex0088];

    MWDrawFillCircle *fillCircle0347 = [[MWDrawFillCircle alloc] init];
    fillCircle0347.center = CGPointMake(930, 3063);
    fillCircle0347.radius = 13;
    fillCircle0347.fillColor = [UIColor blackColor];
    [vertex0088.drawPrimitives addObject:fillCircle0347];
    
    MWDrawFillCircle *fillCircle0348 = [[MWDrawFillCircle alloc] init];
    fillCircle0348.center = CGPointMake(930, 3063);
    fillCircle0348.radius = 11;
    fillCircle0348.fillColor = [UIColor whiteColor];
    [vertex0088.drawPrimitives addObject:fillCircle0348];

    // Châtillon - Montrouge
    MWVertex *vertex0089 = [[MWVertex alloc] init];
    vertex0089.identifier = @"vertex0089";
    vertex0089.developmentName = @"Вершина: Javel – André Citroën";
    [self.vertices addObject:vertex0089];

    ////////////////////////////////////////////////////////////////
    // Line 1
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии La Défense – Grande Arche - Charles de Gaulle – Étoile
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: La Défense – Grande Arche - Charles de Gaulle – Étoile";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;

    // Добавляем станцию La Défense – Grande Arche
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"La Défense – Grande Arche";
    station0001.mapLocation = CGPointMake(524.5, 1293);
    station0001.geoLocation = CGPointMake(48.891389, 2.24);

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(600, 1273);
    fillCircle0001.radius = 28;
    fillCircle0001.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = @"1";
    drawTextLine0001.fontName = @"HelveticaNeue-Bold";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 44;
    drawTextLine0001.origin = CGPointMake(587, 1246);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = @"La Défense";
    drawTextLine0002.fontName = @"Helvetica-Bold";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 30;
    drawTextLine0002.kernSpacing = 1.2;
    drawTextLine0002.origin = CGPointMake(634, 1236);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0002];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(636, 1290);
    drawLine0001.endPoint = CGPointMake(833, 1290);
    drawLine0001.width = 34;
    drawLine0001.color = [UIColor colorWithRed:(141/255.0) green:(102/255.0) blue:(57/255.0) alpha:1];
    [station0001.drawPrimitives addObject:drawLine0001];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = @"Grande Arche";
    drawTextLine0003.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0003.fontColor = [UIColor whiteColor];
    drawTextLine0003.fontSize = 28;
    drawTextLine0003.kernSpacing = -0.4;
    drawTextLine0003.origin = CGPointMake(644, 1271.5);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0003];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0001.mapLocation;
    fillCircle0002.radius = 5.5;
    fillCircle0002.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 954;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(524.5, 1293);
    drawLine0002.endPoint = CGPointMake(603.5, 1372);
    drawLine0002.width = 11;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию Esplanade de la Défense
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Esplanade de la Défense";
    station0002.mapLocation = CGPointMake(603.5, 1372);
    station0002.geoLocation = CGPointMake(48.888333, 2.25);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0002.mapLocation;
    fillCircle0003.radius = 12;
    fillCircle0003.fillColor = line0001.color;
    [station0002.drawPrimitives addObject:fillCircle0003];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = @"Esplanade";
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 34;
    drawTextLine0004.kernSpacing = -0.7;
    drawTextLine0004.origin = CGPointMake(443, 1372);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0004];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = @"de la Défense";
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 34;
    drawTextLine0005.kernSpacing = 0.4;
    drawTextLine0005.origin = CGPointMake(382, 1405);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0005];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 851;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(603, 1371.5);
    drawLine0003.endPoint = CGPointMake(687, 1455);
    drawLine0003.width = 11;
    drawLine0003.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию Pont de Neuilly
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Pont de Neuilly";
    station0003.mapLocation = CGPointMake(687, 1455);
    station0003.geoLocation = CGPointMake(48.885, 2.259722);

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0003.mapLocation;
    fillCircle0004.radius = 12;
    fillCircle0004.fillColor = line0001.color;
    [station0003.drawPrimitives addObject:fillCircle0004];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0003.nameOriginal;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 34;
    drawTextLine0006.kernSpacing = 0.0;
    drawTextLine0006.origin = CGPointMake(425, 1455);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 966;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(686.5, 1454.5);
    drawLine0004.endPoint = CGPointMake(770, 1539);
    drawLine0004.width = 11;
    drawLine0004.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Les Sablons
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Les Sablons";
    station0004.mapLocation = CGPointMake(770, 1539);
    station0004.geoLocation = CGPointMake(48.880833, 2.272222);
    
    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0004.mapLocation;
    fillCircle0005.radius = 12;
    fillCircle0005.fillColor = line0001.color;
    [station0004.drawPrimitives addObject:fillCircle0005];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0004.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 34;
    drawTextLine0007.kernSpacing = -1.0;
    drawTextLine0007.origin = CGPointMake(585, 1539);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0007];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 769;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(769.5, 1538.5);
    drawLine0005.endPoint = CGPointMake(864.5, 1633.5);
    drawLine0005.width = 11;
    drawLine0005.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0005];

    // Добавляем станцию Porte Maillot
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"Porte Maillot";
    station0005.mapLocation = CGPointMake(864.5, 1633.5);
    station0005.geoLocation = CGPointMake(48.878056, 2.281944);
    
    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0005.mapLocation;
    fillCircle0006.radius = 13;
    fillCircle0006.fillColor = [UIColor blackColor];
    [station0005.drawPrimitives addObject:fillCircle0006];

    MWDrawFillCircle *fillCircle0692 = [[MWDrawFillCircle alloc] init];
    fillCircle0692.center = station0005.mapLocation;
    fillCircle0692.radius = 11;
    fillCircle0692.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0692];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0005.nameOriginal;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 34;
    drawTextLine0008.kernSpacing = 0.1;
    drawTextLine0008.origin = CGPointMake(652, 1622);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 667;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(864, 1633);
    drawLine0006.endPoint = CGPointMake(998.5, 1767);
    drawLine0006.width = 11;
    drawLine0006.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Argentine
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Argentine";
    station0006.mapLocation = CGPointMake(998.5, 1767);
    station0006.geoLocation = CGPointMake(48.875278, 2.29);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0006.mapLocation;
    fillCircle0007.radius = 12;
    fillCircle0007.fillColor = line0001.color;
    [station0006.drawPrimitives addObject:fillCircle0007];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0006.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 34;
    drawTextLine0009.kernSpacing = 0.1;
    drawTextLine0009.origin = CGPointMake(820, 1767);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0009];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 385;
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(998, 1766.5);
    drawLine0007.endPoint = CGPointMake(1104, 1871.5);
    drawLine0007.width = 11;
    drawLine0007.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Charles de Gaulle – Étoile
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"Charles de Gaulle – Étoile";
    station0007.mapLocation = CGPointMake(1104, 1871.5);
    station0007.geoLocation = CGPointMake(48.873611, 2.294444);

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0007.mapLocation;
    fillCircle0008.radius = 3;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = @"Charles";
    drawTextLine0010.fontName = @"Helvetica-Bold";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 30;
    drawTextLine0010.kernSpacing = 1.0;
    drawTextLine0010.origin = CGPointMake(1181, 1802);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0010];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = @"de Gaulle";
    drawTextLine0011.fontName = @"Helvetica-Bold";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 30;
    drawTextLine0011.kernSpacing = 1.2;
    drawTextLine0011.origin = CGPointMake(1151, 1835);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0011];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = @"Étoile";
    drawTextLine0012.fontName = @"Helvetica-Bold";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 30;
    drawTextLine0012.kernSpacing = 1.5;
    drawTextLine0012.origin = CGPointMake(1206, 1869);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0012];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    // Создаем участок линии Charles de Gaulle – Étoile - Franklin D. Roosevelt
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Charles de Gaulle – Étoile - Franklin D. Roosevelt";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;

    // Добавляем станцию Charles de Gaulle – Étoile
    [edge0002.elements addObject:station0007];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 468;
    [edge0002.elements addObject:haul0007];
    
    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(1103.5, 1871);
    drawLine0008.endPoint = CGPointMake(1231, 2000.5);
    drawLine0008.width = 11;
    drawLine0008.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию George V
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0002.elements addObject:station0008];
    
    station0008.nameOriginal = @"George V";
    station0008.mapLocation = CGPointMake(1231.5, 2000.5);
    station0008.geoLocation = CGPointMake(48.871944, 2.300556);
    
    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0008.mapLocation;
    fillCircle0009.radius = 12;
    fillCircle0009.fillColor = line0001.color;
    [station0008.drawPrimitives addObject:fillCircle0009];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0008.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 34;
    drawTextLine0013.kernSpacing = -0.6;
    drawTextLine0013.origin = CGPointMake(1079, 1990);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0013];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 778;
    [edge0002.elements addObject:haul0008];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(1230.5, 2000);
    drawLine0009.endPoint = CGPointMake(1356.5, 2125);
    drawLine0009.width = 11;
    drawLine0009.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Franklin D. Roosevelt
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0002.elements addObject:station0009];
    
    station0009.nameOriginal = @"Franklin D. Roosevelt";
    station0009.mapLocation = CGPointMake(1356.5, 2125);
    station0009.geoLocation = CGPointMake(48.868977, 2.30989);
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0009.mapLocation;
    fillCircle0010.radius = 3;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = @"Franklin";
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 34;
    drawTextLine0014.kernSpacing = 0.4;
    drawTextLine0014.origin = CGPointMake(1147, 2068);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0014];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = @"D. Roosevelt";
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 34;
    drawTextLine0015.kernSpacing = -1.0;
    drawTextLine0015.origin = CGPointMake(1147, 2101);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0015];

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;

    // Создаем участок линии Franklin D. Roosevelt - Champs-Élysées – Clemenceau
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Franklin D. Roosevelt - Champs-Élysées – Clemenceau";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;

    // Добавляем станцию Franklin D. Roosevelt
    [edge0003.elements addObject:station0009];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 300;
    [edge0003.elements addObject:haul0009];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(1356, 2124.5);
    drawLine0010.endPoint = CGPointMake(1446, 2214.5);
    drawLine0010.width = 11;
    drawLine0010.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию Champs-Élysées – Clemenceau
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0003.elements addObject:station0010];
    
    station0010.nameOriginal = @"Champs-Élysées – Clemenceau";
    station0010.mapLocation = CGPointMake(1446, 2214.5);
    station0010.geoLocation = CGPointMake(48.867531, 2.313542);
    
    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0010.mapLocation;
    fillCircle0011.radius = 3;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0011];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = @"Champs";
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 34;
    drawTextLine0016.kernSpacing = -1.2;
    drawTextLine0016.origin = CGPointMake(1305, 2195);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0016];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = @"Élysées";
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 34;
    drawTextLine0017.kernSpacing = -1.4;
    drawTextLine0017.origin = CGPointMake(1318, 2228);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0017];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = @"Clemenceau";
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 34;
    drawTextLine0018.kernSpacing = -0.9;
    drawTextLine0018.origin = CGPointMake(1244, 2262);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0018];

    // Добавляем вершину
    edge0003.finishVertex = vertex0004;

    // Создаем участок линии Champs-Élysées – Clemenceau - Concorde
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Champs-Élysées – Clemenceau - Concorde";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0001;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0004;

    // Добавляем станцию Champs-Élysées – Clemenceau
    [edge0004.elements addObject:station0010];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 694;
    [edge0004.elements addObject:haul0010];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(1445.5, 2214);
    drawLine0011.endPoint = CGPointMake(1523.5, 2290.5);
    drawLine0011.width = 11;
    drawLine0011.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0011];

    // Добавляем станцию Concorde
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0004.elements addObject:station0011];
    
    station0011.nameOriginal = @"Concorde";
    station0011.mapLocation = CGPointMake(1523.5, 2290.5);
    station0011.geoLocation = CGPointMake(48.86541, 2.32111);
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0011.mapLocation;
    fillCircle0012.radius = 3;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0012];
    
    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = @"Concorde";
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 34;
    drawTextLine0019.kernSpacing = -1.4;
    drawTextLine0019.origin = CGPointMake(1549, 2262);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0019];

    // Добавляем вершину
    edge0004.finishVertex = vertex0005;
    
    // Создаем участок линии Concorde - Palais Royal – Musée du Louvre
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Concorde - Palais Royal – Musée du Louvre";
    [self.edges addObject:edge0005];
    
    // Добавляем линию
    edge0005.line = line0001;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0005;

    // Добавляем станцию Concorde
    [edge0005.elements addObject:station0011];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 653;
    [edge0005.elements addObject:haul0011];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(1523, 2290);
    drawLine0012.endPoint = CGPointMake(1575, 2342);
    drawLine0012.width = 11;
    drawLine0012.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0012];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(1596, 2320.5);
    drawArc0001.startDegrees = 90;
    drawArc0001.endDegrees = 135;
    drawArc0001.radius = 30;
    drawArc0001.width = 11;
    drawArc0001.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(1596, 2350.5);
    drawLine0013.endPoint = CGPointMake(1715, 2350.5);
    drawLine0013.width = 11;
    drawLine0013.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0013];

    // Добавляем станцию Tuileries
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0005.elements addObject:station0012];
    
    station0012.nameOriginal = @"Tuileries";
    station0012.mapLocation = CGPointMake(1715, 2350.5);
    station0012.geoLocation = CGPointMake(48.864531, 2.329617);

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0012.mapLocation;
    fillCircle0013.radius = 12;
    fillCircle0013.fillColor = line0001.color;
    [station0012.drawPrimitives addObject:fillCircle0013];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0012.nameOriginal;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 34;
    drawTextLine0020.kernSpacing = -0.0;
    drawTextLine0020.origin = CGPointMake(1654, 2362);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 455;
    [edge0005.elements addObject:haul0012];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(1714.5, 2350.5);
    drawLine0014.endPoint = CGPointMake(1895.5, 2350.5);
    drawLine0014.width = 11;
    drawLine0014.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0014];

    // Добавляем станцию Palais Royal – Musée du Louvre
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0005.elements addObject:station0013];
    
    station0013.nameOriginal = @"Palais Royal – Musée du Louvre";
    station0013.mapLocation = CGPointMake(1895.5, 2350.5);
    station0013.geoLocation = CGPointMake(48.862644, 2.336578);

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0013.mapLocation;
    fillCircle0014.radius = 3;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0014];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = @"Palais Royal";
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 34;
    drawTextLine0021.kernSpacing = -1.0;
    drawTextLine0021.origin = CGPointMake(1706, 2234);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0021];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = @"Musée du";
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 34;
    drawTextLine0022.kernSpacing = 1.2;
    drawTextLine0022.origin = CGPointMake(1720, 2267);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0022];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = @"Louvre";
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 34;
    drawTextLine0023.kernSpacing = -1.0;
    drawTextLine0023.origin = CGPointMake(1782, 2301);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0023];

    // Добавляем вершину
    edge0005.finishVertex = vertex0006;
    
    // Создаем участок линии Palais Royal – Musée du Louvre - Châtelet
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Palais Royal – Musée du Louvre - Châtelet";
    [self.edges addObject:edge0006];
    
    // Добавляем линию
    edge0006.line = line0001;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0006;

    // Добавляем станцию Palais Royal – Musée du Louvre
    [edge0006.elements addObject:station0013];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 415;
    [edge0006.elements addObject:haul0013];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(1895, 2350.5);
    drawLine0015.endPoint = CGPointMake(2042.5, 2350.5);
    drawLine0015.width = 11;
    drawLine0015.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0015];

    // Добавляем станцию Louvre – Rivoli
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0006.elements addObject:station0014];
    
    station0014.nameOriginal = @"Louvre – Rivoli";
    station0014.mapLocation = CGPointMake(2042.5, 2350.5);
    station0014.geoLocation = CGPointMake(48.86108, 2.340283);
    
    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0014.mapLocation;
    fillCircle0015.radius = 12;
    fillCircle0015.fillColor = line0001.color;
    [station0014.drawPrimitives addObject:fillCircle0015];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"Louvre";
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 34;
    drawTextLine0024.kernSpacing = -0.6;
    drawTextLine0024.origin = CGPointMake(1991, 2262);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"Rivoli";
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 34;
    drawTextLine0025.kernSpacing = 0.2;
    drawTextLine0025.origin = CGPointMake(1991, 2295);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0025];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 546;
    [edge0006.elements addObject:haul0014];
    
    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(2042, 2350.5);
    drawLine0016.endPoint = CGPointMake(2366, 2350.5);
    drawLine0016.width = 11;
    drawLine0016.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию Châtelet
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0006.elements addObject:station0015];
    
    station0015.nameOriginal = @"Châtelet";
    station0015.mapLocation = CGPointMake(2366, 2350.5);
    station0015.geoLocation = CGPointMake(48.858352, 2.347324);

    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0015.mapLocation;
    fillCircle0016.radius = 3;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0015.nameOriginal;
    drawTextLine0026.fontName = @"Helvetica-Bold";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 30;
    drawTextLine0026.kernSpacing = 1.6;
    drawTextLine0026.origin = CGPointMake(2214, 2383);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0026];

    // Добавляем вершину
    edge0006.finishVertex = vertex0007;
    
    // Создаем участок линии Châtelet - Hôtel de Ville
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Châtelet - Hôtel de Ville";
    [self.edges addObject:edge0007];
    
    // Добавляем линию
    edge0007.line = line0001;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0007;

    // Добавляем станцию Châtelet
    [edge0007.elements addObject:station0015];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 330;
    [edge0007.elements addObject:haul0015];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(2365.5, 2350.5);
    drawLine0017.endPoint = CGPointMake(2530, 2350.5);
    drawLine0017.width = 11;
    drawLine0017.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0017];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(2529.5, 2380.5);
    drawArc0002.startDegrees = 270;
    drawArc0002.endDegrees = 302.5;
    drawArc0002.radius = 30;
    drawArc0002.width = 11;
    drawArc0002.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawArc0002];
    
    // Добавляем станцию Hôtel de Ville
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0007.elements addObject:station0016];
    
    station0016.nameOriginal = @"Hôtel de Ville";
    station0016.mapLocation = CGPointMake(2545.5, 2354.5);
    station0016.geoLocation = CGPointMake(48.857487, 2.351525);
    
    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0016.mapLocation;
    fillCircle0017.radius = 3;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0017];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0016.nameOriginal;
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 34;
    drawTextLine0027.kernSpacing = 0.1;
    drawTextLine0027.origin = CGPointMake(2571, 2334);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0027];

    // Добавляем вершину
    edge0007.finishVertex = vertex0008;

    // Создаем участок линии Hôtel de Ville - Bastille
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Hôtel de Ville - Bastille";
    [self.edges addObject:edge0008];
    
    // Добавляем линию
    edge0008.line = line0001;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0008;

    // Добавляем станцию Hôtel de Ville
    [edge0008.elements addObject:station0016];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 724;
    [edge0008.elements addObject:haul0016];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(2529.5, 2380.5);
    drawArc0003.startDegrees = 302;
    drawArc0003.endDegrees = 315;
    drawArc0003.radius = 30;
    drawArc0003.width = 11;
    drawArc0003.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(2550.5, 2359);
    drawLine0018.endPoint = CGPointMake(2694.5, 2503.5);
    drawLine0018.width = 11;
    drawLine0018.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0018];

    // Добавляем станцию Saint-Paul
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0008.elements addObject:station0017];
    
    station0017.nameOriginal = @"Saint-Paul";
    station0017.mapLocation = CGPointMake(2694.5, 2503.5);
    station0017.geoLocation = CGPointMake(48.855214, 2.360859);

    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0017.mapLocation;
    fillCircle0018.radius = 12;
    fillCircle0018.fillColor = line0001.color;
    [station0017.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"St-Paul";
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 34;
    drawTextLine0028.kernSpacing = -1.2;
    drawTextLine0028.origin = CGPointMake(2704, 2457);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0028];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 655;
    [edge0008.elements addObject:haul0017];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(2694.5, 2503.5);
    drawLine0019.endPoint = CGPointMake(2705.5, 2514.5);
    drawLine0019.width = 11;
    drawLine0019.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0019];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(2726.5, 2493);
    drawArc0004.startDegrees = 90;
    drawArc0004.endDegrees = 135;
    drawArc0004.radius = 30;
    drawArc0004.width = 11;
    drawArc0004.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(2726, 2523);
    drawLine0020.endPoint = CGPointMake(2836, 2523);
    drawLine0020.width = 11;
    drawLine0020.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0020];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(2835.5, 2553);
    drawArc0005.startDegrees = 270;
    drawArc0005.endDegrees = 315;
    drawArc0005.radius = 30;
    drawArc0005.width = 11;
    drawArc0005.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(2855.5, 2530.5);
    drawLine0021.endPoint = CGPointMake(2889, 2564);
    drawLine0021.width = 11;
    drawLine0021.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0021];

    // Добавляем станцию Bastille
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0008.elements addObject:station0018];
    
    station0018.nameOriginal = @"Bastille";
    station0018.mapLocation = CGPointMake(2889, 2564);
    station0018.geoLocation = CGPointMake(48.853082, 2.369077);

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0018.mapLocation;
    fillCircle0019.radius = 3;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0019];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = station0018.nameOriginal;
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 34;
    drawTextLine0029.kernSpacing = -0.2;
    drawTextLine0029.origin = CGPointMake(2908, 2504);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0029];

    // Добавляем вершину
    edge0008.finishVertex = vertex0009;
    
    // Создаем участок линии Bastille - Gare de Lyon
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: Bastille - Gare de Lyon";
    [self.edges addObject:edge0009];
    
    // Добавляем линию
    edge0009.line = line0001;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0009;

    // Добавляем станцию Bastille
    [edge0009.elements addObject:station0018];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1162;
    [edge0009.elements addObject:haul0018];
    
    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(2888.5, 2563.5);
    drawLine0022.endPoint = CGPointMake(3002.5, 2677.5);
    drawLine0022.width = 11;
    drawLine0022.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0022];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(2981, 2698.5);
    drawArc0006.startDegrees = 315;
    drawArc0006.endDegrees = 0;
    drawArc0006.radius = 30;
    drawArc0006.width = 11;
    drawArc0006.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0006];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(3011, 2698);
    drawLine0023.endPoint = CGPointMake(3011, 2806);
    drawLine0023.width = 11;
    drawLine0023.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0023];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(3041, 2805.5);
    drawArc0007.startDegrees = 135;
    drawArc0007.endDegrees = 180;
    drawArc0007.radius = 30;
    drawArc0007.width = 11;
    drawArc0007.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(3019.5, 2826.5);
    drawLine0024.endPoint = CGPointMake(3103.5, 2910.5);
    drawLine0024.width = 11;
    drawLine0024.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Gare de Lyon
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0009.elements addObject:station0019];
    
    station0019.nameOriginal = @"Gare de Lyon";
    station0019.mapLocation = CGPointMake(3103.5, 2910.5);
    station0019.geoLocation = CGPointMake(48.844722, 2.373889);
    
    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0019.mapLocation;
    fillCircle0020.radius = 3;
    fillCircle0020.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"Gare";
    drawTextLine0030.fontName = @"Helvetica-Bold";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 30;
    drawTextLine0030.kernSpacing = 1.2;
    drawTextLine0030.origin = CGPointMake(3165, 2932);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0030];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"de Lyon";
    drawTextLine0031.fontName = @"Helvetica-Bold";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 30;
    drawTextLine0031.kernSpacing = 1.2;
    drawTextLine0031.origin = CGPointMake(3165, 2965);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0031];

    // Добавляем вершину
    edge0009.finishVertex = vertex0010;

    // Создаем участок линии Gare de Lyon - Reuilly – Diderot
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Gare de Lyon - Reuilly – Diderot";
    [self.edges addObject:edge0010];
    
    // Добавляем линию
    edge0010.line = line0001;
    
    // Добавляем вершину
    edge0010.startVertex = vertex0010;

    // Добавляем станцию Gare de Lyon
    [edge0010.elements addObject:station0019];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1077;
    [edge0010.elements addObject:haul0019];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(3103, 2910);
    drawLine0025.endPoint = CGPointMake(3134, 2942);
    drawLine0025.width = 11;
    drawLine0025.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0025];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(3144.5, 2931);
    drawArc0008.startDegrees = 45;
    drawArc0008.endDegrees = 135;
    drawArc0008.radius = 15;
    drawArc0008.width = 11;
    drawArc0008.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(3155, 2942);
    drawLine0026.endPoint = CGPointMake(3284, 2812);
    drawLine0026.width = 11;
    drawLine0026.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0026];

    // Добавляем станцию Reuilly – Diderot
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0010.elements addObject:station0020];
    
    station0020.nameOriginal = @"Reuilly – Diderot";
    station0020.mapLocation = CGPointMake(3284, 2812);
    station0020.geoLocation = CGPointMake(48.846944, 2.386389);
    
    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0020.mapLocation;
    fillCircle0021.radius = 3;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0021];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0020.nameOriginal;
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 34;
    drawTextLine0032.kernSpacing = -0.6;
    drawTextLine0032.origin = CGPointMake(3310, 2790);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0032];

    // Добавляем вершину
    edge0010.finishVertex = vertex0011;

    // Создаем участок линии Reuilly – Diderot - Nation
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0011 = [[MWEdge alloc] init];
    edge0011.identifier = @"edge0011";
    edge0011.developmentName = @"Ребро: Reuilly – Diderot - Nation";
    [self.edges addObject:edge0011];
    
    // Добавляем линию
    edge0011.line = line0001;
    
    // Добавляем вершину
    edge0011.startVertex = vertex0011;

    // Добавляем станцию Reuilly – Diderot
    [edge0011.elements addObject:station0020];
    
    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 695;
    [edge0011.elements addObject:haul0020];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(3283.5, 2812.5);
    drawLine0027.endPoint = CGPointMake(3464.5, 2631.5);
    drawLine0027.width = 11;
    drawLine0027.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0027];

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(3474.5, 2642.5);
    drawArc0009.startDegrees = 225;
    drawArc0009.endDegrees = 315;
    drawArc0009.radius = 15;
    drawArc0009.width = 11;
    drawArc0009.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawArc0009];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(3484.5, 2631);
    drawLine0028.endPoint = CGPointMake(3536.5, 2682);
    drawLine0028.width = 11;
    drawLine0028.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0028];

    // Добавляем станцию Nation
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0011.elements addObject:station0021];

    station0021.nameOriginal = @"Nation";
    station0021.mapLocation = CGPointMake(3536.5, 2682);
    station0021.geoLocation = CGPointMake(48.848389, 2.3958);
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0021.mapLocation;
    fillCircle0022.radius = 3;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0021.nameOriginal;
    drawTextLine0033.fontName = @"Helvetica-Bold";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 30;
    drawTextLine0033.kernSpacing = 2.2;
    drawTextLine0033.origin = CGPointMake(3423.5, 2712);
    [station0021.drawPrimitives addObject:drawTextLine0033];

    // Добавляем вершину
    edge0011.finishVertex = vertex0012;
    
    // Создаем участок линии Nation - Château de Vincennes
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0012 = [[MWEdge alloc] init];
    edge0012.identifier = @"edge0012";
    edge0012.developmentName = @"Ребро: Nation - Château de Vincennes";
    [self.edges addObject:edge0012];
    
    // Добавляем линию
    edge0012.line = line0001;
    
    // Добавляем вершину
    edge0012.startVertex = vertex0012;

    // Добавляем станцию Nation
    [edge0012.elements addObject:station0021];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 903;
    [edge0012.elements addObject:haul0021];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(3536, 2681.5);
    drawLine0029.endPoint = CGPointMake(3564, 2710.5);
    drawLine0029.width = 11;
    drawLine0029.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0029];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(3585, 2689);
    drawArc0010.startDegrees = 90;
    drawArc0010.endDegrees = 135;
    drawArc0010.radius = 30;
    drawArc0010.width = 11;
    drawArc0010.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawArc0010];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(3584, 2719);
    drawLine0030.endPoint = CGPointMake(3728, 2719);
    drawLine0030.width = 11;
    drawLine0030.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0030];

    // Добавляем станцию Porte de Vincennes
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0012.elements addObject:station0022];
    
    station0022.nameOriginal = @"Porte de Vincennes";
    station0022.mapLocation = CGPointMake(3728, 2719);
    station0022.geoLocation = CGPointMake(48.847326, 2.407759);
    
    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0022.mapLocation;
    fillCircle0023.radius = 13;
    fillCircle0023.fillColor = [UIColor blackColor];
    [station0022.drawPrimitives addObject:fillCircle0023];

    MWDrawFillCircle *fillCircle0522 = [[MWDrawFillCircle alloc] init];
    fillCircle0522.center = station0022.mapLocation;
    fillCircle0522.radius = 11;
    fillCircle0522.fillColor = [UIColor whiteColor];
    [station0022.drawPrimitives addObject:fillCircle0522];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = @"Porte de";
    drawTextLine0034.fontName = @"Helvetica-Bold";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 30;
    drawTextLine0034.kernSpacing = 1.8;
    drawTextLine0034.origin = CGPointMake(3635, 2762);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0034];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = @"Vincennes";
    drawTextLine0035.fontName = @"Helvetica-Bold";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 30;
    drawTextLine0035.kernSpacing = 1.3;
    drawTextLine0035.origin = CGPointMake(3587, 2797);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0035];

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 793;
    [edge0012.elements addObject:haul0022];
    
    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(3728, 2719);
    drawLine0031.endPoint = CGPointMake(3773, 2719);
    drawLine0031.width = 11;
    drawLine0031.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawLine0031];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(3773, 2749);
    drawArc0011.startDegrees = 270;
    drawArc0011.endDegrees = 315;
    drawArc0011.radius = 30;
    drawArc0011.width = 11;
    drawArc0011.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(3793.5, 2727);
    drawLine0032.endPoint = CGPointMake(3859.5, 2792.5);
    drawLine0032.width = 11;
    drawLine0032.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawLine0032];

    // Добавляем станцию Saint-Mandé
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0012.elements addObject:station0023];
    
    station0023.nameOriginal = @"Saint-Mandé";
    station0023.mapLocation = CGPointMake(3859.5, 2792.5);
    station0023.geoLocation = CGPointMake(48.846111, 2.418889);

    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0023.mapLocation;
    fillCircle0024.radius = 12;
    fillCircle0024.fillColor = line0001.color;
    [station0023.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = @"St-Mandé";
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 34;
    drawTextLine0036.kernSpacing = -1.4;
    drawTextLine0036.origin = CGPointMake(3875, 2763);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0036];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 786;
    [edge0012.elements addObject:haul0023];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(3859, 2792);
    drawLine0033.endPoint = CGPointMake(3955, 2890);
    drawLine0033.width = 11;
    drawLine0033.color = line0001.color;
    [haul0023.drawPrimitives addObject:drawLine0033];

    // Добавляем станцию Bérault
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0012.elements addObject:station0024];
    
    station0024.nameOriginal = @"Bérault";
    station0024.mapLocation = CGPointMake(3955, 2890);
    station0024.geoLocation = CGPointMake(48.845278, 2.428333);

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0024.mapLocation;
    fillCircle0025.radius = 12;
    fillCircle0025.fillColor = line0001.color;
    [station0024.drawPrimitives addObject:fillCircle0025];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = station0024.nameOriginal;
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 34;
    drawTextLine0037.kernSpacing = -0.3;
    drawTextLine0037.origin = CGPointMake(3828, 2870.5);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0037];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 690;
    [edge0012.elements addObject:haul0024];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(3954.5, 2889.5);
    drawLine0034.endPoint = CGPointMake(3992, 2925);
    drawLine0034.width = 11;
    drawLine0034.color = line0001.color;
    [haul0024.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию Château de Vincennes
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0012.elements addObject:station0025];
    
    station0025.nameOriginal = @"Château de Vincennes";
    station0025.mapLocation = CGPointMake(3992, 2925);
    station0025.geoLocation = CGPointMake(48.844444, 2.44);

    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0025.mapLocation;
    fillCircle0026.radius = 12;
    fillCircle0026.fillColor = [UIColor blackColor];
    [station0025.drawPrimitives addObject:fillCircle0026];

    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = CGPointMake(4023.5, 2957);
    fillCircle0027.radius = 28;
    fillCircle0027.fillColor = line0001.color;
    [station0025.drawPrimitives addObject:fillCircle0027];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"1";
    drawTextLine0038.fontName = @"HelveticaNeue-Bold";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 44;
    drawTextLine0038.origin = CGPointMake(4011, 2930);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0038];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = @"Château";
    drawTextLine0039.fontName = @"Helvetica-Bold";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 30;
    drawTextLine0039.kernSpacing = 1.3;
    drawTextLine0039.origin = CGPointMake(4058, 2922);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0039];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = @"de Vincennes";
    drawTextLine0040.fontName = @"Helvetica-Bold";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 30;
    drawTextLine0040.kernSpacing = 1.3;
    drawTextLine0040.origin = CGPointMake(4058, 2956.5);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0040];

    // Добавляем вершину
    edge0012.finishVertex = vertex0013;

    ////////////////////////////////////////////////////////////////
    // Line 2
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Porte Dauphine - Charles de Gaulle - Étoile
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0013 = [[MWEdge alloc] init];
    edge0013.identifier = @"edge0013";
    edge0013.developmentName = @"Ребро: Porte Dauphine - Charles de Gaulle - Étoile";
    [self.edges addObject:edge0013];
    
    // Добавляем линию
    edge0013.line = line0002;
    
    // Добавляем вершину
    edge0013.startVertex = vertex0014;
    
    // Добавляем станцию Porte Dauphine
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0013.elements addObject:station0026];
    
    station0026.nameOriginal = @"Porte Dauphine";
    station0026.mapLocation = CGPointMake(732.5, 1890.5);
    station0026.geoLocation = CGPointMake(48.87139, 2.27667);
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = CGPointMake(777.5, 1869);
    fillCircle0028.radius = 28;
    fillCircle0028.fillColor = line0002.color;
    [station0026.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = @"2";
    drawTextLine0041.fontName = @"HelveticaNeue-Bold";
    drawTextLine0041.fontColor = [UIColor whiteColor];
    drawTextLine0041.fontSize = 44;
    drawTextLine0041.origin = CGPointMake(765.5, 1840);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0041];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = @"Porte";
    drawTextLine0042.fontName = @"Helvetica-Bold";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 30;
    drawTextLine0042.kernSpacing = 2.0;
    drawTextLine0042.origin = CGPointMake(812, 1835.5);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0042];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = @"Dauphine";
    drawTextLine0043.fontName = @"Helvetica-Bold";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 30;
    drawTextLine0043.kernSpacing = 2.0;
    drawTextLine0043.origin = CGPointMake(812, 1868.5);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0043];

    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0026.mapLocation;
    fillCircle0029.radius = 13;
    fillCircle0029.fillColor = [UIColor blackColor];
    [station0026.drawPrimitives addObject:fillCircle0029];

    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0026.mapLocation;
    fillCircle0030.radius = 11;
    fillCircle0030.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0030];

    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 686;
    [edge0013.elements addObject:haul0025];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(732.5, 1890.5);
    drawLine0035.endPoint = CGPointMake(886.5, 2045);
    drawLine0035.width = 11;
    drawLine0035.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0035];

    // Добавляем станцию Victor Hugo
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0013.elements addObject:station0027];
    
    station0027.nameOriginal = @"Victor Hugo";
    station0027.mapLocation = CGPointMake(886.5, 2045);
    station0027.geoLocation = CGPointMake(48.86972, 2.285);

    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0027.mapLocation;
    fillCircle0031.radius = 12;
    fillCircle0031.fillColor = line0002.color;
    [station0027.drawPrimitives addObject:fillCircle0031];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = station0027.nameOriginal;
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 34;
    drawTextLine0044.kernSpacing = -0.2;
    drawTextLine0044.origin = CGPointMake(700, 2045);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0044];
    
    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 815;
    [edge0013.elements addObject:haul0026];
    
    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(886, 2045.5);
    drawLine0036.endPoint = CGPointMake(902, 2059.5);
    drawLine0036.width = 11;
    drawLine0036.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0036];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(908.5, 2052);
    drawArc0012.startDegrees = 45;
    drawArc0012.endDegrees = 135;
    drawArc0012.radius = 10;
    drawArc0012.width = 11;
    drawArc0012.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawArc0012];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(915, 2060);
    drawLine0037.endPoint = CGPointMake(1121, 1854);
    drawLine0037.width = 11;
    drawLine0037.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0037];

    // Добавляем станцию Charles de Gaulle - Étoile
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0013.elements addObject:station0028];
    
    station0028.nameOriginal = @"Charles de Gaulle - Étoile";
    station0028.mapLocation = CGPointMake(1121, 1854);
    station0028.geoLocation = CGPointMake(48.873611, 2.294444);

    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0028.mapLocation;
    fillCircle0032.radius = 3;
    fillCircle0032.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0032];

    station0028.showNameOnMap = false;
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0010];
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0011];
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0012];
    
    // Добавляем вершину
    edge0013.finishVertex = vertex0002;

    // Создаем участок линии Charles de Gaulle - Étoile - Villiers
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0014 = [[MWEdge alloc] init];
    edge0014.identifier = @"edge0014";
    edge0014.developmentName = @"Ребро: Charles de Gaulle - Étoile - Villiers";
    [self.edges addObject:edge0014];
    
    // Добавляем линию
    edge0014.line = line0002;
    
    // Добавляем вершину
    edge0014.startVertex = vertex0002;

    // Добавляем станцию Charles de Gaulle - Étoile
    [edge0014.elements addObject:station0028];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 577;
    [edge0014.elements addObject:haul0027];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(1120.5, 1854.5);
    drawLine0038.endPoint = CGPointMake(1217, 1758);
    drawLine0038.width = 11;
    drawLine0038.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0038];

    // Добавляем станцию Ternes
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0014.elements addObject:station0029];
    
    station0029.nameOriginal = @"Ternes";
    station0029.mapLocation = CGPointMake(1217, 1758);
    station0029.geoLocation = CGPointMake(48.877778, 2.298611);

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0029.mapLocation;
    fillCircle0033.radius = 12;
    fillCircle0033.fillColor = line0002.color;
    [station0029.drawPrimitives addObject:fillCircle0033];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = station0029.nameOriginal;
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 34;
    drawTextLine0045.kernSpacing = -0.6;
    drawTextLine0045.origin = CGPointMake(1110, 1711);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0045];

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 838;
    [edge0014.elements addObject:haul0028];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(1216.5, 1758.5);
    drawLine0039.endPoint = CGPointMake(1314.5, 1660.5);
    drawLine0039.width = 11;
    drawLine0039.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawLine0039];

    // Добавляем станцию Courcelles
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0014.elements addObject:station0030];
    
    station0030.nameOriginal = @"Courcelles";
    station0030.mapLocation = CGPointMake(1314.5, 1660.5);
    station0030.geoLocation = CGPointMake(48.879167, 2.304167);

    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0030.mapLocation;
    fillCircle0034.radius = 12;
    fillCircle0034.fillColor = line0002.color;
    [station0030.drawPrimitives addObject:fillCircle0034];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = station0030.nameOriginal;
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 34;
    drawTextLine0046.kernSpacing = -0.8;
    drawTextLine0046.origin = CGPointMake(1151, 1613.5);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0046];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 373;
    [edge0014.elements addObject:haul0029];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(1314, 1661);
    drawLine0040.endPoint = CGPointMake(1412, 1563);
    drawLine0040.width = 11;
    drawLine0040.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0040];

    // Добавляем станцию Monceau
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0014.elements addObject:station0031];
    
    station0031.nameOriginal = @"Monceau";
    station0031.mapLocation = CGPointMake(1412, 1563);
    station0031.geoLocation = CGPointMake(48.88, 2.308333);

    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0031.mapLocation;
    fillCircle0035.radius = 12;
    fillCircle0035.fillColor = line0002.color;
    [station0031.drawPrimitives addObject:fillCircle0035];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = station0031.nameOriginal;
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 34;
    drawTextLine0047.kernSpacing = -0.9;
    drawTextLine0047.origin = CGPointMake(1256, 1517.5);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0047];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 456;
    [edge0014.elements addObject:haul0030];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(1411.5, 1563.5);
    drawLine0041.endPoint = CGPointMake(1509, 1466);
    drawLine0041.width = 11;
    drawLine0041.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0041];

    // Добавляем станцию Villiers
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0014.elements addObject:station0032];
    
    station0032.nameOriginal = @"Villiers";
    station0032.mapLocation = CGPointMake(1509, 1466);
    station0032.geoLocation = CGPointMake(48.88113, 2.314867);

    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0032.mapLocation;
    fillCircle0036.radius = 3;
    fillCircle0036.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0036];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0032.nameOriginal;
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 34;
    drawTextLine0048.kernSpacing = 0.6;
    drawTextLine0048.origin = CGPointMake(1527, 1450);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0048];

    // Добавляем вершину
    edge0014.finishVertex = vertex0015;

    // Создаем участок линии Villiers - Place de Clichy
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0015 = [[MWEdge alloc] init];
    edge0015.identifier = @"edge0015";
    edge0015.developmentName = @"Ребро: Villiers - Place de Clichy";
    [self.edges addObject:edge0015];
    
    // Добавляем линию
    edge0015.line = line0002;
    
    // Добавляем вершину
    edge0015.startVertex = vertex0015;

    // Добавляем станцию Villiers
    [edge0015.elements addObject:station0032];

    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 527;
    [edge0015.elements addObject:haul0031];
    
    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(1508.5, 1466.5);
    drawLine0042.endPoint = CGPointMake(1618, 1357.5);
    drawLine0042.width = 11;
    drawLine0042.color = line0002.color;
    [haul0031.drawPrimitives addObject:drawLine0042];

    // Добавляем станцию Rome
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0015.elements addObject:station0033];
    
    station0033.nameOriginal = @"Rome";
    station0033.mapLocation = CGPointMake(1618, 1357.5);
    station0033.geoLocation = CGPointMake(48.882425, 2.322052);

    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0033.mapLocation;
    fillCircle0037.radius = 12;
    fillCircle0037.fillColor = line0002.color;
    [station0033.drawPrimitives addObject:fillCircle0037];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0033.nameOriginal;
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 34;
    drawTextLine0049.kernSpacing = -1.2;
    drawTextLine0049.origin = CGPointMake(1613, 1361);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0049];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 413;
    [edge0015.elements addObject:haul0032];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(1618.5, 1358);
    drawLine0043.endPoint = CGPointMake(1641.5, 1335);
    drawLine0043.width = 11;
    drawLine0043.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0043];
    
    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(1662, 1357);
    drawArc0013.startDegrees = 225;
    drawArc0013.endDegrees = 270;
    drawArc0013.radius = 30;
    drawArc0013.width = 11;
    drawArc0013.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawArc0013];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(1662, 1327);
    drawLine0044.endPoint = CGPointMake(1754, 1327);
    drawLine0044.width = 11;
    drawLine0044.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0044];

    // Добавляем станцию Place de Clichy
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0015.elements addObject:station0034];
    
    station0034.nameOriginal = @"Place de Clichy";
    station0034.mapLocation = CGPointMake(1754, 1327);
    station0034.geoLocation = CGPointMake(48.883889, 2.3275);
    
    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0034.mapLocation;
    fillCircle0038.radius = 3;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0038];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = @"Place";
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 34;
    drawTextLine0050.kernSpacing = -1.6;
    drawTextLine0050.origin = CGPointMake(1769, 1333.5);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0050];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = @"de Clichy";
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 34;
    drawTextLine0051.kernSpacing = -0.8;
    drawTextLine0051.origin = CGPointMake(1769, 1366);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0051];

    // Добавляем вершину
    edge0015.finishVertex = vertex0016;
    
    // Создаем участок линии Place de Clichy - Pigalle
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0016 = [[MWEdge alloc] init];
    edge0016.identifier = @"edge0016";
    edge0016.developmentName = @"Ребро: Place de Clichy - Pigalle";
    [self.edges addObject:edge0016];
    
    // Добавляем линию
    edge0016.line = line0002;
    
    // Добавляем вершину
    edge0016.startVertex = vertex0016;

    // Добавляем станцию Place de Clichy
    [edge0016.elements addObject:station0034];

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 473;
    [edge0016.elements addObject:haul0033];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(1753.5, 1327);
    drawLine0045.endPoint = CGPointMake(1973, 1327);
    drawLine0045.width = 11;
    drawLine0045.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0045];

    // Добавляем станцию Blanche
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0016.elements addObject:station0035];
    
    station0035.nameOriginal = @"Blanche";
    station0035.mapLocation = CGPointMake(1973, 1327);
    station0035.geoLocation = CGPointMake(48.883459, 2.333703);

    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0035.mapLocation;
    fillCircle0039.radius = 12;
    fillCircle0039.fillColor = line0002.color;
    [station0035.drawPrimitives addObject:fillCircle0039];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0035.nameOriginal;
    drawTextLine0052.fontName = @"HelveticaNeue";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 34;
    drawTextLine0052.kernSpacing = -0.8;
    drawTextLine0052.origin = CGPointMake(1913, 1272);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0052];

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 357;
    [edge0016.elements addObject:haul0034];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(1972.5, 1327);
    drawLine0046.endPoint = CGPointMake(2195.5, 1327);
    drawLine0046.width = 11;
    drawLine0046.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0046];
    
    // Добавляем станцию Pigalle
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0016.elements addObject:station0036];
    
    station0036.nameOriginal = @"Pigalle";
    station0036.mapLocation = CGPointMake(2195.5, 1327);
    station0036.geoLocation = CGPointMake(48.882255, 2.337573);

    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0036.mapLocation;
    fillCircle0040.radius = 3;
    fillCircle0040.fillColor = [UIColor whiteColor];
    [station0036.drawPrimitives addObject:fillCircle0040];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = station0036.nameOriginal;
    drawTextLine0053.fontName = @"HelveticaNeue";
    drawTextLine0053.fontColor = [UIColor blackColor];
    drawTextLine0053.fontSize = 34;
    drawTextLine0053.kernSpacing = -0.6;
    drawTextLine0053.origin = CGPointMake(2068, 1331);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0053];

    // Добавляем вершину
    edge0016.finishVertex = vertex0017;
    
    // Создаем участок линии Pigalle - Barbès – Rochechouart
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0017 = [[MWEdge alloc] init];
    edge0017.identifier = @"edge0017";
    edge0017.developmentName = @"Ребро: Pigalle - Barbès – Rochechouart";
    [self.edges addObject:edge0017];
    
    // Добавляем линию
    edge0017.line = line0002;
    
    // Добавляем вершину
    edge0017.startVertex = vertex0017;

    // Добавляем станцию Pigalle
    [edge0017.elements addObject:station0036];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 504;
    [edge0017.elements addObject:haul0035];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(2195, 1327);
    drawLine0047.endPoint = CGPointMake(2364, 1327);
    drawLine0047.width = 11;
    drawLine0047.color = line0002.color;
    [haul0035.drawPrimitives addObject:drawLine0047];

    // Добавляем станцию Anvers
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0017.elements addObject:station0037];
    
    station0037.nameOriginal = @"Anvers";
    station0037.mapLocation = CGPointMake(2364, 1327);
    station0037.geoLocation = CGPointMake(48.883007, 2.344849);
    
    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0037.mapLocation;
    fillCircle0041.radius = 13;
    fillCircle0041.fillColor = [UIColor blackColor];
    [station0037.drawPrimitives addObject:fillCircle0041];

    MWDrawFillCircle *fillCircle0529 = [[MWDrawFillCircle alloc] init];
    fillCircle0529.center = station0037.mapLocation;
    fillCircle0529.radius = 11;
    fillCircle0529.fillColor = [UIColor whiteColor];
    [station0037.drawPrimitives addObject:fillCircle0529];

    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = station0037.nameOriginal;
    drawTextLine0054.fontName = @"HelveticaNeue";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 34;
    drawTextLine0054.kernSpacing = -0.8;
    drawTextLine0054.origin = CGPointMake(2314, 1338);
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0054];
    
    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 398;
    [edge0017.elements addObject:haul0036];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(2363.5, 1327);
    drawLine0048.endPoint = CGPointMake(2566, 1327);
    drawLine0048.width = 11;
    drawLine0048.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0048];

    // Добавляем станцию Barbès – Rochechouart
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0017.elements addObject:station0038];
    
    station0038.nameOriginal = @"Barbès – Rochechouart";
    station0038.mapLocation = CGPointMake(2566, 1327);
    station0038.geoLocation = CGPointMake(48.883611, 2.350556);

    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = station0038.mapLocation;
    fillCircle0042.radius = 3;
    fillCircle0042.fillColor = [UIColor whiteColor];
    [station0038.drawPrimitives addObject:fillCircle0042];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = @"Barbès";
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 34;
    drawTextLine0055.kernSpacing = -1.0;
    drawTextLine0055.origin = CGPointMake(2515, 1238.5);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0055];

    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = @"Rochechouart";
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor blackColor];
    drawTextLine0056.fontSize = 34;
    drawTextLine0056.kernSpacing = -0.6;
    drawTextLine0056.origin = CGPointMake(2463, 1272);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0056];

    // Добавляем вершину
    edge0017.finishVertex = vertex0018;
    
    // Создаем участок линии Barbès – Rochechouart - La Chapelle
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0018 = [[MWEdge alloc] init];
    edge0018.identifier = @"edge0018";
    edge0018.developmentName = @"Ребро: Barbès – Rochechouart - La Chapelle";
    [self.edges addObject:edge0018];
    
    // Добавляем линию
    edge0018.line = line0002;
    
    // Добавляем вершину
    edge0018.startVertex = vertex0018;

    // Добавляем станцию Barbès – Rochechouart
    [edge0018.elements addObject:station0038];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 795;
    [edge0018.elements addObject:haul0037];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(2565.5, 1327);
    drawLine0049.endPoint = CGPointMake(2783, 1327);
    drawLine0049.width = 11;
    drawLine0049.color = line0002.color;
    [haul0037.drawPrimitives addObject:drawLine0049];

    // Добавляем станцию La Chapelle
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0018.elements addObject:station0039];
    
    station0039.nameOriginal = @"La Chapelle";
    station0039.mapLocation = CGPointMake(2783, 1327);
    station0039.geoLocation = CGPointMake(48.884411, 2.360288);
    
    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = station0039.mapLocation;
    fillCircle0043.radius = 3;
    fillCircle0043.fillColor = [UIColor whiteColor];
    [station0039.drawPrimitives addObject:fillCircle0043];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = station0039.nameOriginal;
    drawTextLine0057.fontName = @"HelveticaNeue";
    drawTextLine0057.fontColor = [UIColor blackColor];
    drawTextLine0057.fontSize = 34;
    drawTextLine0057.kernSpacing = -0.6;
    drawTextLine0057.origin = CGPointMake(2770, 1272);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0057];

    // Добавляем вершину
    edge0018.finishVertex = vertex0036;

    // Создаем участок линии La Chapelle - Stalingrad
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0019 = [[MWEdge alloc] init];
    edge0019.identifier = @"edge0019";
    edge0019.developmentName = @"Ребро: La Chapelle - Stalingrad";
    [self.edges addObject:edge0019];
    
    // Добавляем линию
    edge0019.line = line0002;
    
    // Добавляем вершину
    edge0019.startVertex = vertex0036;

    // Добавляем станцию La Chapelle
    [edge0019.elements addObject:station0039];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 604;
    [edge0019.elements addObject:haul0038];
    
    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(2782.5, 1327);
    drawLine0050.endPoint = CGPointMake(3008, 1327);
    drawLine0050.width = 11;
    drawLine0050.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawLine0050];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(3008, 1357);
    drawArc0014.startDegrees = 270;
    drawArc0014.endDegrees = 315;
    drawArc0014.radius = 30;
    drawArc0014.width = 11;
    drawArc0014.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(3028.5, 1335);
    drawLine0051.endPoint = CGPointMake(3039, 1345.5);
    drawLine0051.width = 11;
    drawLine0051.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawLine0051];

    // Добавляем станцию Stalingrad
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0019.elements addObject:station0040];
    
    station0040.nameOriginal = @"Stalingrad";
    station0040.mapLocation = CGPointMake(3039, 1345.5);
    station0040.geoLocation = CGPointMake(48.88426, 2.36874);
    
    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0040.mapLocation;
    fillCircle0044.radius = 3;
    fillCircle0044.fillColor = [UIColor whiteColor];
    [station0040.drawPrimitives addObject:fillCircle0044];

    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = station0040.nameOriginal;
    drawTextLine0058.fontName = @"HelveticaNeue";
    drawTextLine0058.fontColor = [UIColor blackColor];
    drawTextLine0058.fontSize = 34;
    drawTextLine0058.kernSpacing = -0.4;
    drawTextLine0058.origin = CGPointMake(3048, 1296);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0058];

    // Добавляем вершину
    edge0019.finishVertex = vertex0020;
    
    // Создаем участок линии Stalingrad - Jaurès
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0020 = [[MWEdge alloc] init];
    edge0020.identifier = @"edge0020";
    edge0020.developmentName = @"Ребро: Stalingrad - Jaurès";
    [self.edges addObject:edge0020];
    
    // Добавляем линию
    edge0020.line = line0002;
    
    // Добавляем вершину
    edge0020.startVertex = vertex0020;

    // Добавляем станцию Stalingrad
    [edge0020.elements addObject:station0040];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 195;
    [edge0020.elements addObject:haul0039];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(3038.5, 1345);
    drawLine0052.endPoint = CGPointMake(3136.5, 1441);
    drawLine0052.width = 11;
    drawLine0052.color = line0002.color;
    [haul0039.drawPrimitives addObject:drawLine0052];

    // Добавляем станцию Jaurès
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0020.elements addObject:station0041];
    
    station0041.nameOriginal = @"Jaurès";
    station0041.mapLocation = CGPointMake(3136.5, 1441);
    station0041.geoLocation = CGPointMake(48.88292, 2.37067);

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0041.mapLocation;
    fillCircle0045.radius = 3;
    fillCircle0045.fillColor = [UIColor whiteColor];
    [station0041.drawPrimitives addObject:fillCircle0045];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = station0041.nameOriginal;
    drawTextLine0059.fontName = @"HelveticaNeue";
    drawTextLine0059.fontColor = [UIColor blackColor];
    drawTextLine0059.fontSize = 34;
    drawTextLine0059.kernSpacing = -0.8;
    drawTextLine0059.origin = CGPointMake(3174, 1402);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0059];

    // Добавляем вершину
    edge0020.finishVertex = vertex0021;
    
    // Создаем участок линии Jaurès - Belleville
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0021 = [[MWEdge alloc] init];
    edge0021.identifier = @"edge0021";
    edge0021.developmentName = @"Ребро: Jaurès - Belleville";
    [self.edges addObject:edge0021];
    
    // Добавляем линию
    edge0021.line = line0002;
    
    // Добавляем вершину
    edge0021.startVertex = vertex0021;

    // Добавляем станцию Jaurès
    [edge0021.elements addObject:station0041];

    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 657;
    [edge0021.elements addObject:haul0040];
    
    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(3136, 1440.5);
    drawLine0053.endPoint = CGPointMake(3153, 1457.5);
    drawLine0053.width = 11;
    drawLine0053.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawLine0053];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(3131, 1478);
    drawArc0015.startDegrees = 315;
    drawArc0015.endDegrees = 0;
    drawArc0015.radius = 30;
    drawArc0015.width = 11;
    drawArc0015.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(3161, 1478);
    drawLine0054.endPoint = CGPointMake(3161, 1589.5);
    drawLine0054.width = 11;
    drawLine0054.color = line0002.color;
    [haul0040.drawPrimitives addObject:drawLine0054];

    // Добавляем станцию Colonel Fabien
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0021.elements addObject:station0042];
    
    station0042.nameOriginal = @"Colonel Fabien";
    station0042.mapLocation = CGPointMake(3161, 1589.5);
    station0042.geoLocation = CGPointMake(48.877136, 2.37116);
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0042.mapLocation;
    fillCircle0046.radius = 12;
    fillCircle0046.fillColor = line0002.color;
    [station0042.drawPrimitives addObject:fillCircle0046];

    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = @"Colonel";
    drawTextLine0060.fontName = @"HelveticaNeue";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 34;
    drawTextLine0060.kernSpacing = -0.5;
    drawTextLine0060.origin = CGPointMake(3180, 1568);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0060];
 
    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = @"Fabien";
    drawTextLine0061.fontName = @"HelveticaNeue";
    drawTextLine0061.fontColor = [UIColor blackColor];
    drawTextLine0061.fontSize = 34;
    drawTextLine0061.kernSpacing = -0.5;
    drawTextLine0061.origin = CGPointMake(3180, 1601);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0061];

    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 696;
    [edge0021.elements addObject:haul0041];

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(3161, 1589);
    drawLine0055.endPoint = CGPointMake(3161, 1738.5);
    drawLine0055.width = 11;
    drawLine0055.color = line0002.color;
    [haul0041.drawPrimitives addObject:drawLine0055];

    // Добавляем станцию Belleville
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0021.elements addObject:station0043];
    
    station0043.nameOriginal = @"Belleville";
    station0043.mapLocation = CGPointMake(3161, 1738.5);
    station0043.geoLocation = CGPointMake(48.872083, 2.376947);
    
    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = station0043.mapLocation;
    fillCircle0047.radius = 3;
    fillCircle0047.fillColor = [UIColor whiteColor];
    [station0043.drawPrimitives addObject:fillCircle0047];

    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = station0043.nameOriginal;
    drawTextLine0062.fontName = @"HelveticaNeue";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 34;
    drawTextLine0062.kernSpacing = -0.1;
    drawTextLine0062.origin = CGPointMake(3008, 1709);
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0062];

    // Добавляем вершину
    edge0021.finishVertex = vertex0022;
    
    // Создаем участок линии Belleville - Père Lachaise
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0022 = [[MWEdge alloc] init];
    edge0022.identifier = @"edge0022";
    edge0022.developmentName = @"Ребро: Belleville - Père Lachaise";
    [self.edges addObject:edge0022];
    
    // Добавляем линию
    edge0022.line = line0002;
    
    // Добавляем вершину
    edge0022.startVertex = vertex0022;

    // Добавляем станцию Belleville
    [edge0022.elements addObject:station0043];

    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 396;
    [edge0022.elements addObject:haul0042];

    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(3161, 1738);
    drawLine0056.endPoint = CGPointMake(3161, 1757);
    drawLine0056.width = 11;
    drawLine0056.color = line0002.color;
    [haul0042.drawPrimitives addObject:drawLine0056];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(3191, 1757);
    drawArc0016.startDegrees = 135;
    drawArc0016.endDegrees = 180;
    drawArc0016.radius = 30;
    drawArc0016.width = 11;
    drawArc0016.color = line0002.color;
    [haul0042.drawPrimitives addObject:drawArc0016];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(3169, 1777.5);
    drawLine0057.endPoint = CGPointMake(3256, 1864.5);
    drawLine0057.width = 11;
    drawLine0057.color = line0002.color;
    [haul0042.drawPrimitives addObject:drawLine0057];

    // Добавляем станцию Couronnes
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0022.elements addObject:station0044];
    
    station0044.nameOriginal = @"Couronnes";
    station0044.mapLocation = CGPointMake(3256, 1864.5);
    station0044.geoLocation = CGPointMake(48.869521, 2.379861);

    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = station0044.mapLocation;
    fillCircle0048.radius = 12;
    fillCircle0048.fillColor = line0002.color;
    [station0044.drawPrimitives addObject:fillCircle0048];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = station0044.nameOriginal;
    drawTextLine0063.fontName = @"HelveticaNeue";
    drawTextLine0063.fontColor = [UIColor blackColor];
    drawTextLine0063.fontSize = 34;
    drawTextLine0063.kernSpacing = -0.6;
    drawTextLine0063.origin = CGPointMake(3267, 1817);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0063];

    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 311;
    [edge0022.elements addObject:haul0043];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(3255.5, 1864);
    drawLine0058.endPoint = CGPointMake(3372.5, 1981);
    drawLine0058.width = 11;
    drawLine0058.color = line0002.color;
    [haul0043.drawPrimitives addObject:drawLine0058];

    // Добавляем станцию Ménilmontant
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0022.elements addObject:station0045];
    
    station0045.nameOriginal = @"Ménilmontant";
    station0045.mapLocation = CGPointMake(3372.5, 1981);
    station0045.geoLocation = CGPointMake(48.866248, 2.383618);

    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = station0045.mapLocation;
    fillCircle0049.radius = 12;
    fillCircle0049.fillColor = line0002.color;
    [station0045.drawPrimitives addObject:fillCircle0049];

    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = station0045.nameOriginal;
    drawTextLine0064.fontName = @"HelveticaNeue";
    drawTextLine0064.fontColor = [UIColor blackColor];
    drawTextLine0064.fontSize = 34;
    drawTextLine0064.kernSpacing = 0.4;
    drawTextLine0064.origin = CGPointMake(3384, 1934);
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0064];

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 578;
    [edge0022.elements addObject:haul0044];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(3372, 1980.5);
    drawLine0059.endPoint = CGPointMake(3473, 2081.5);
    drawLine0059.width = 11;
    drawLine0059.color = line0002.color;
    [haul0044.drawPrimitives addObject:drawLine0059];
    
    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(3451, 2102);
    drawArc0017.startDegrees = 315;
    drawArc0017.endDegrees = 0;
    drawArc0017.radius = 30;
    drawArc0017.width = 11;
    drawArc0017.color = line0002.color;
    [haul0044.drawPrimitives addObject:drawArc0017];

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(3481, 2101.5);
    drawLine0060.endPoint = CGPointMake(3481, 2122.5);
    drawLine0060.width = 11;
    drawLine0060.color = line0002.color;
    [haul0044.drawPrimitives addObject:drawLine0060];

    // Добавляем станцию Père Lachaise
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0022.elements addObject:station0046];
    
    station0046.nameOriginal = @"Père Lachaise";
    station0046.mapLocation = CGPointMake(3481, 2122.5);
    station0046.geoLocation = CGPointMake(48.862921, 2.387388);
    
    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = station0046.mapLocation;
    fillCircle0050.radius = 3;
    fillCircle0050.fillColor = [UIColor whiteColor];
    [station0046.drawPrimitives addObject:fillCircle0050];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = @"Père";
    drawTextLine0065.fontName = @"HelveticaNeue";
    drawTextLine0065.fontColor = [UIColor blackColor];
    drawTextLine0065.fontSize = 34;
    drawTextLine0065.kernSpacing = -0.8;
    drawTextLine0065.origin = CGPointMake(3496, 2039);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0065];

    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = @"Lachaise";
    drawTextLine0066.fontName = @"HelveticaNeue";
    drawTextLine0066.fontColor = [UIColor blackColor];
    drawTextLine0066.fontSize = 34;
    drawTextLine0066.kernSpacing = -1.0;
    drawTextLine0066.origin = CGPointMake(3496, 2073);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0066];

    // Добавляем вершину
    edge0022.finishVertex = vertex0023;

    // Создаем участок линии Père Lachaise - Nation
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0023 = [[MWEdge alloc] init];
    edge0023.identifier = @"edge0023";
    edge0023.developmentName = @"Ребро: Père Lachaise - Nation";
    [self.edges addObject:edge0023];
    
    // Добавляем линию
    edge0023.line = line0002;
    
    // Добавляем вершину
    edge0023.startVertex = vertex0023;

    // Добавляем станцию Père Lachaise
    [edge0023.elements addObject:station0046];

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 580;
    [edge0023.elements addObject:haul0045];
    
    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(3481, 2122);
    drawLine0061.endPoint = CGPointMake(3481, 2241.5);
    drawLine0061.width = 11;
    drawLine0061.color = line0002.color;
    [haul0045.drawPrimitives addObject:drawLine0061];

    // Добавляем станцию Philippe Auguste
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0023.elements addObject:station0047];
    
    station0047.nameOriginal = @"Philippe Auguste";
    station0047.mapLocation = CGPointMake(3481, 2241.5);
    station0047.geoLocation = CGPointMake(48.858021, 2.390938);

    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = station0047.mapLocation;
    fillCircle0051.radius = 12;
    fillCircle0051.fillColor = line0002.color;
    [station0047.drawPrimitives addObject:fillCircle0051];

    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = @"Philippe";
    drawTextLine0067.fontName = @"HelveticaNeue";
    drawTextLine0067.fontColor = [UIColor blackColor];
    drawTextLine0067.fontSize = 34;
    drawTextLine0067.kernSpacing = -0.0;
    drawTextLine0067.origin = CGPointMake(3502, 2220);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0067];

    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = @"Auguste";
    drawTextLine0068.fontName = @"HelveticaNeue";
    drawTextLine0068.fontColor = [UIColor blackColor];
    drawTextLine0068.fontSize = 34;
    drawTextLine0068.kernSpacing = -0.6;
    drawTextLine0068.origin = CGPointMake(3502, 2253);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0068];

    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 429;
    [edge0023.elements addObject:haul0046];

    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(3481, 2241);
    drawLine0062.endPoint = CGPointMake(3481, 2389.5);
    drawLine0062.width = 11;
    drawLine0062.color = line0002.color;
    [haul0046.drawPrimitives addObject:drawLine0062];

    // Добавляем станцию Alexandre Dumas
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0023.elements addObject:station0048];
    
    station0048.nameOriginal = @"Alexandre Dumas";
    station0048.mapLocation = CGPointMake(3481, 2389.5);
    station0048.geoLocation = CGPointMake(48.855907, 2.39479);
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = station0048.mapLocation;
    fillCircle0052.radius = 12;
    fillCircle0052.fillColor = line0002.color;
    [station0048.drawPrimitives addObject:fillCircle0052];

    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = @"Alexandre";
    drawTextLine0069.fontName = @"HelveticaNeue";
    drawTextLine0069.fontColor = [UIColor blackColor];
    drawTextLine0069.fontSize = 34;
    drawTextLine0069.kernSpacing = -0.6;
    drawTextLine0069.origin = CGPointMake(3501, 2368);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0069];

    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = @"Dumas";
    drawTextLine0070.fontName = @"HelveticaNeue";
    drawTextLine0070.fontColor = [UIColor blackColor];
    drawTextLine0070.fontSize = 34;
    drawTextLine0070.kernSpacing = -0.6;
    drawTextLine0070.origin = CGPointMake(3501, 2401);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0070];

    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 576;
    [edge0023.elements addObject:haul0047];

    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(3481, 2389);
    drawLine0063.endPoint = CGPointMake(3481, 2513);
    drawLine0063.width = 11;
    drawLine0063.color = line0002.color;
    [haul0047.drawPrimitives addObject:drawLine0063];

    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(3511, 2513);
    drawArc0018.startDegrees = 135;
    drawArc0018.endDegrees = 180;
    drawArc0018.radius = 30;
    drawArc0018.width = 11;
    drawArc0018.color = line0002.color;
    [haul0047.drawPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(3488, 2532.5);
    drawLine0064.endPoint = CGPointMake(3495, 2539.5);
    drawLine0064.width = 11;
    drawLine0064.color = line0002.color;
    [haul0047.drawPrimitives addObject:drawLine0064];

    // Добавляем станцию Avron
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0023.elements addObject:station0049];
    
    station0049.nameOriginal = @"Avron";
    station0049.mapLocation = CGPointMake(3495, 2539.5);
    station0049.geoLocation = CGPointMake(48.85194, 2.397863);
    
    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = station0049.mapLocation;
    fillCircle0053.radius = 12;
    fillCircle0053.fillColor = line0002.color;
    [station0049.drawPrimitives addObject:fillCircle0053];

    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = station0049.nameOriginal;
    drawTextLine0071.fontName = @"HelveticaNeue";
    drawTextLine0071.fontColor = [UIColor blackColor];
    drawTextLine0071.fontSize = 34;
    drawTextLine0071.kernSpacing = -0.4;
    drawTextLine0071.origin = CGPointMake(3516, 2506);
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0071];

    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 415;
    [edge0023.elements addObject:haul0048];

    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(3494.5, 2539);
    drawLine0065.endPoint = CGPointMake(3586.5, 2631.5);
    drawLine0065.width = 11;
    drawLine0065.color = line0002.color;
    [haul0048.drawPrimitives addObject:drawLine0065];

    // Добавляем станцию Nation
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0023.elements addObject:station0050];
    
    station0050.nameOriginal = @"Nation";
    station0050.mapLocation = CGPointMake(3586.5, 2631.5);
    station0050.geoLocation = CGPointMake(48.848389, 2.3958);

    MWDrawFillCircle *fillCircle0175 = [[MWDrawFillCircle alloc] init];
    fillCircle0175.center = station0050.mapLocation;
    fillCircle0175.radius = 5.5;
    fillCircle0175.fillColor = line0002.color;
    [station0050.drawPrimitives addObject:fillCircle0175];

    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = CGPointMake(3613, 2592.5);
    fillCircle0055.radius = 28;
    fillCircle0055.fillColor = line0002.color;
    [station0050.drawPrimitives addObject:fillCircle0055];
    
    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = @"2";
    drawTextLine0072.fontName = @"HelveticaNeue-Bold";
    drawTextLine0072.fontColor = [UIColor whiteColor];
    drawTextLine0072.fontSize = 44;
    drawTextLine0072.origin = CGPointMake(3601, 2563.5);
    [station0050.drawPrimitives addObject:drawTextLine0072];

    station0050.showNameOnMap = false;
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0033];
    
    // Добавляем вершину
    edge0023.finishVertex = vertex0012;

    ////////////////////////////////////////////////////////////////
    // Line 3
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Pont de Levallois — Bécon - Villiers
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0024 = [[MWEdge alloc] init];
    edge0024.identifier = @"edge0024";
    edge0024.developmentName = @"Ребро: Pont de Levallois — Bécon - Villiers";
    [self.edges addObject:edge0024];
    
    // Добавляем линию
    edge0024.line = line0003;
    
    // Добавляем вершину
    edge0024.startVertex = vertex0024;
    
    // Добавляем станцию Pont de Levallois — Bécon
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0024.elements addObject:station0051];
    
    station0051.nameOriginal = @"Pont de Levallois — Bécon";
    station0051.mapLocation = CGPointMake(1095.5, 1052);
    station0051.geoLocation = CGPointMake(48.897313, 2.280787);

    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = CGPointMake(1063, 1020);
    fillCircle0056.radius = 28;
    fillCircle0056.fillColor = line0003.color;
    [station0051.drawPrimitives addObject:fillCircle0056];

    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = @"3";
    drawTextLine0073.fontName = @"HelveticaNeue-Bold";
    drawTextLine0073.fontColor = [UIColor whiteColor];
    drawTextLine0073.fontSize = 44;
    drawTextLine0073.origin = CGPointMake(1051, 992);
    [station0051.drawPrimitives addObject:drawTextLine0073];

    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = @"Pont de Levallois";
    drawTextLine0074.fontName = @"Helvetica-Bold";
    drawTextLine0074.fontColor = [UIColor blackColor];
    drawTextLine0074.fontSize = 30;
    drawTextLine0074.kernSpacing = 1.2;
    drawTextLine0074.origin = CGPointMake(764, 983);
    [station0051.drawPrimitives addObject:drawTextLine0074];

    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = @"Bécon";
    drawTextLine0075.fontName = @"Helvetica-Bold";
    drawTextLine0075.fontColor = [UIColor blackColor];
    drawTextLine0075.fontSize = 30;
    drawTextLine0075.kernSpacing = 0.6;
    drawTextLine0075.origin = CGPointMake(912, 1017);
    [station0051.drawPrimitives addObject:drawTextLine0075];

    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = station0051.mapLocation;
    fillCircle0057.radius = 12;
    fillCircle0057.fillColor = [UIColor blackColor];
    [station0051.drawPrimitives addObject:fillCircle0057];

    // Добавляем перегон
    MWHaul *haul0049 = [[MWHaul alloc] init];
    haul0049.identifier = @"haul0049";
    haul0049.length = 650;
    [edge0024.elements addObject:haul0049];

    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(1095.5, 1052);
    drawLine0066.endPoint = CGPointMake(1148, 1105);
    drawLine0066.width = 11;
    drawLine0066.color = line0003.color;
    [haul0049.drawPrimitives addObject:drawLine0066];

    // Добавляем станцию Anatole France
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0024.elements addObject:station0052];
    
    station0052.nameOriginal = @"Anatole France";
    station0052.mapLocation = CGPointMake(1148, 1105);
    station0052.geoLocation = CGPointMake(48.892022, 2.285536);
    
    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = station0052.mapLocation;
    fillCircle0058.radius = 12;
    fillCircle0058.fillColor = line0003.color;
    [station0052.drawPrimitives addObject:fillCircle0058];

    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0052.nameOriginal;
    drawTextLine0076.fontName = @"HelveticaNeue";
    drawTextLine0076.fontColor = [UIColor blackColor];
    drawTextLine0076.fontSize = 34;
    drawTextLine0076.kernSpacing = -0.4;
    drawTextLine0076.origin = CGPointMake(914, 1105);
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0076];

    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 465;
    [edge0024.elements addObject:haul0050];
    
    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(1147.5, 1104.5);
    drawLine0067.endPoint = CGPointMake(1201, 1157.5);
    drawLine0067.width = 11;
    drawLine0067.color = line0003.color;
    [haul0050.drawPrimitives addObject:drawLine0067];

    // Добавляем станцию Louise Michel
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0024.elements addObject:station0053];
    
    station0053.nameOriginal = @"Louise Michel";
    station0053.mapLocation = CGPointMake(1201, 1157.5);
    station0053.geoLocation = CGPointMake(48.889273, 2.288073);

    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = station0053.mapLocation;
    fillCircle0059.radius = 12;
    fillCircle0059.fillColor = line0003.color;
    [station0053.drawPrimitives addObject:fillCircle0059];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = station0053.nameOriginal;
    drawTextLine0077.fontName = @"HelveticaNeue";
    drawTextLine0077.fontColor = [UIColor blackColor];
    drawTextLine0077.fontSize = 34;
    drawTextLine0077.kernSpacing = -0.1;
    drawTextLine0077.origin = CGPointMake(978, 1158);
    [station0053.nameOriginalTextPrimitives addObject:drawTextLine0077];

    // Добавляем перегон
    MWHaul *haul0051 = [[MWHaul alloc] init];
    haul0051.identifier = @"haul0051";
    haul0051.length = 593;
    [edge0024.elements addObject:haul0051];

    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(1200.5, 1157);
    drawLine0068.endPoint = CGPointMake(1254, 1210.5);
    drawLine0068.width = 11;
    drawLine0068.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawLine0068];

    // Добавляем станцию Porte de Champerret
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0024.elements addObject:station0054];
    
    station0054.nameOriginal = @"Porte de Champerret";
    station0054.mapLocation = CGPointMake(1254, 1210.5);
    station0054.geoLocation = CGPointMake(48.885851, 2.293487);
    
    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = station0054.mapLocation;
    fillCircle0060.radius = 12;
    fillCircle0060.fillColor = line0003.color;
    [station0054.drawPrimitives addObject:fillCircle0060];

    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = station0054.nameOriginal;
    drawTextLine0078.fontName = @"HelveticaNeue";
    drawTextLine0078.fontColor = [UIColor blackColor];
    drawTextLine0078.fontSize = 34;
    drawTextLine0078.kernSpacing = -0.4;
    drawTextLine0078.origin = CGPointMake(910, 1210);
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0078];

    // Добавляем перегон
    MWHaul *haul0052 = [[MWHaul alloc] init];
    haul0052.identifier = @"haul0052";
    haul0052.length = 414;
    [edge0024.elements addObject:haul0052];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(1253.5, 1210);
    drawLine0069.endPoint = CGPointMake(1331.5, 1288);
    drawLine0069.width = 11;
    drawLine0069.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0069];

    // Добавляем станцию Pereire
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0024.elements addObject:station0055];
    
    station0055.nameOriginal = @"Pereire";
    station0055.mapLocation = CGPointMake(1331.5, 1288);
    station0055.geoLocation = CGPointMake(48.884648, 2.299211);
    
    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = station0055.mapLocation;
    fillCircle0061.radius = 13;
    fillCircle0061.fillColor = [UIColor blackColor];
    [station0055.drawPrimitives addObject:fillCircle0061];

    MWDrawFillCircle *fillCircle0546 = [[MWDrawFillCircle alloc] init];
    fillCircle0546.center = station0055.mapLocation;
    fillCircle0546.radius = 11;
    fillCircle0546.fillColor = [UIColor whiteColor];
    [station0055.drawPrimitives addObject:fillCircle0546];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = station0055.nameOriginal;
    drawTextLine0079.fontName = @"HelveticaNeue";
    drawTextLine0079.fontColor = [UIColor blackColor];
    drawTextLine0079.fontSize = 34;
    drawTextLine0079.kernSpacing = -0.4;
    drawTextLine0079.origin = CGPointMake(1341, 1241);
    [station0055.nameOriginalTextPrimitives addObject:drawTextLine0079];

    // Добавляем перегон
    MWHaul *haul0053 = [[MWHaul alloc] init];
    haul0053.identifier = @"haul0053";
    haul0053.length = 407;
    [edge0024.elements addObject:haul0053];
    
    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(1331, 1287.5);
    drawLine0070.endPoint = CGPointMake(1384.5, 1341.5);
    drawLine0070.width = 11;
    drawLine0070.color = line0003.color;
    [haul0053.drawPrimitives addObject:drawLine0070];

    // Добавляем станцию Wagram
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0024.elements addObject:station0056];
    
    station0056.nameOriginal = @"Wagram";
    station0056.mapLocation = CGPointMake(1384.5, 1341.5);
    station0056.geoLocation = CGPointMake(48.884057, 2.303668);
    
    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = station0056.mapLocation;
    fillCircle0062.radius = 12;
    fillCircle0062.fillColor = line0003.color;
    [station0056.drawPrimitives addObject:fillCircle0062];

    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = station0056.nameOriginal;
    drawTextLine0080.fontName = @"HelveticaNeue";
    drawTextLine0080.fontColor = [UIColor blackColor];
    drawTextLine0080.fontSize = 34;
    drawTextLine0080.kernSpacing = -1.2;
    drawTextLine0080.origin = CGPointMake(1255, 1341);
    [station0056.nameOriginalTextPrimitives addObject:drawTextLine0080];

    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 469;
    [edge0024.elements addObject:haul0054];

    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(1384, 1341);
    drawLine0071.endPoint = CGPointMake(1446, 1402.5);
    drawLine0071.width = 11;
    drawLine0071.color = line0003.color;
    [haul0054.drawPrimitives addObject:drawLine0071];

    // Добавляем станцию Malesherbes
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0024.elements addObject:station0057];
    
    station0057.nameOriginal = @"Malesherbes";
    station0057.mapLocation = CGPointMake(1446, 1402.5);
    station0057.geoLocation = CGPointMake(48.882476, 2.311002);

    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = station0057.mapLocation;
    fillCircle0063.radius = 12;
    fillCircle0063.fillColor = line0003.color;
    [station0057.drawPrimitives addObject:fillCircle0063];

    MWDrawTextLine *drawTextLine0081 = [[MWDrawTextLine alloc] init];
    drawTextLine0081.text = station0057.nameOriginal;
    drawTextLine0081.fontName = @"HelveticaNeue";
    drawTextLine0081.fontColor = [UIColor blackColor];
    drawTextLine0081.fontSize = 34;
    drawTextLine0081.kernSpacing = -0.4;
    drawTextLine0081.origin = CGPointMake(1247, 1402);
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0081];

    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 482;
    [edge0024.elements addObject:haul0055];

    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(1445.5, 1402);
    drawLine0072.endPoint = CGPointMake(1509, 1466);
    drawLine0072.width = 11;
    drawLine0072.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawLine0072];

    // Добавляем станцию Villiers
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0024.elements addObject:station0058];
    
    station0058.nameOriginal = @"Villiers";
    station0058.mapLocation = CGPointMake(1509, 1466);
    station0058.geoLocation = CGPointMake(48.88113, 2.314867);

    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = station0058.mapLocation;
    fillCircle0064.radius = 3;
    fillCircle0064.fillColor = [UIColor whiteColor];
    [station0058.drawPrimitives addObject:fillCircle0064];

    station0058.showNameOnMap = NO;
    [station0058.nameOriginalTextPrimitives addObject:drawTextLine0048];
    
    // Добавляем вершину
    edge0024.finishVertex = vertex0015;

    // Создаем участок линии Villiers - Saint-Lazare
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0025 = [[MWEdge alloc] init];
    edge0025.identifier = @"edge0025";
    edge0025.developmentName = @"Ребро: Villiers - Saint-Lazare";
    [self.edges addObject:edge0025];
    
    // Добавляем линию
    edge0025.line = line0003;
    
    // Добавляем вершину
    edge0025.startVertex = vertex0015;

    // Добавляем станцию Villiers
    [edge0025.elements addObject:station0058];

    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 615;
    [edge0025.elements addObject:haul0056];

    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(1508.5, 1465.5);
    drawLine0073.endPoint = CGPointMake(1621, 1577.5);
    drawLine0073.width = 11;
    drawLine0073.color = line0003.color;
    [haul0056.drawPrimitives addObject:drawLine0073];

    // Добавляем станцию Europe
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0025.elements addObject:station0059];
    
    station0059.nameOriginal = @"Europe";
    station0059.mapLocation = CGPointMake(1621, 1577.5);
    station0059.geoLocation = CGPointMake(48.878821, 2.32238);

    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = station0059.mapLocation;
    fillCircle0065.radius = 12;
    fillCircle0065.fillColor = line0003.color;
    [station0059.drawPrimitives addObject:fillCircle0065];

    MWDrawTextLine *drawTextLine0082 = [[MWDrawTextLine alloc] init];
    drawTextLine0082.text = station0059.nameOriginal;
    drawTextLine0082.fontName = @"HelveticaNeue";
    drawTextLine0082.fontColor = [UIColor blackColor];
    drawTextLine0082.fontSize = 34;
    drawTextLine0082.kernSpacing = -0.4;
    drawTextLine0082.origin = CGPointMake(1504, 1577);
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0082];

    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 604;
    [edge0025.elements addObject:haul0057];

    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(1620.5, 1577);
    drawLine0074.endPoint = CGPointMake(1724, 1680.5);
    drawLine0074.width = 11;
    drawLine0074.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawLine0074];

    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(1702, 1701);
    drawArc0019.startDegrees = 315;
    drawArc0019.endDegrees = 0;
    drawArc0019.radius = 30;
    drawArc0019.width = 11;
    drawArc0019.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawArc0019];

    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(1732, 1701);
    drawLine0075.endPoint = CGPointMake(1732, 1744);
    drawLine0075.width = 11;
    drawLine0075.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawLine0075];

    // Добавляем станцию Saint-Lazare
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0025.elements addObject:station0060];
    
    station0060.nameOriginal = @"Saint-Lazare";
    station0060.mapLocation = CGPointMake(1732, 1744);
    station0060.geoLocation = CGPointMake(48.87549, 2.32664);

    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = station0060.mapLocation;
    fillCircle0066.radius = 3;
    fillCircle0066.fillColor = [UIColor whiteColor];
    [station0060.drawPrimitives addObject:fillCircle0066];

    MWDrawTextLine *drawTextLine0083 = [[MWDrawTextLine alloc] init];
    drawTextLine0083.text = station0060.nameOriginal;
    drawTextLine0083.fontName = @"Helvetica-Bold";
    drawTextLine0083.fontColor = [UIColor blackColor];
    drawTextLine0083.fontSize = 30;
    drawTextLine0083.kernSpacing = 1.0;
    drawTextLine0083.origin = CGPointMake(1414, 1724);
    [station0060.drawPrimitives addObject:drawTextLine0083];

    // Добавляем вершину
    edge0025.finishVertex = vertex0025;
    
    // Создаем участок линии Saint-Lazare - Havre — Caumartin
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0026 = [[MWEdge alloc] init];
    edge0026.identifier = @"edge0026";
    edge0026.developmentName = @"Ребро: Saint-Lazare - Havre — Caumartin";
    [self.edges addObject:edge0026];
    
    // Добавляем линию
    edge0026.line = line0003;
    
    // Добавляем вершину
    edge0026.startVertex = vertex0025;

    // Добавляем станцию Saint-Lazare
    [edge0026.elements addObject:station0060];

    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 337;
    [edge0026.elements addObject:haul0058];

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(1732, 1743.5);
    drawLine0076.endPoint = CGPointMake(1732, 1810);
    drawLine0076.width = 11;
    drawLine0076.color = line0003.color;
    [haul0058.drawPrimitives addObject:drawLine0076];

    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(1762, 1809.5);
    drawArc0020.startDegrees = 135;
    drawArc0020.endDegrees = 180;
    drawArc0020.radius = 30;
    drawArc0020.width = 11;
    drawArc0020.color = line0003.color;
    [haul0058.drawPrimitives addObject:drawArc0020];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(1740, 1830);
    drawLine0077.endPoint = CGPointMake(1809.5, 1899.5);
    drawLine0077.width = 11;
    drawLine0077.color = line0003.color;
    [haul0058.drawPrimitives addObject:drawLine0077];

    // Добавляем станцию Havre — Caumartin
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0026.elements addObject:station0061];
    
    station0061.nameOriginal = @"Havre — Caumartin";
    station0061.mapLocation = CGPointMake(1809.5, 1899.5);
    station0061.geoLocation = CGPointMake(48.873465, 2.327968);

    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = station0061.mapLocation;
    fillCircle0067.radius = 3;
    fillCircle0067.fillColor = [UIColor whiteColor];
    [station0061.drawPrimitives addObject:fillCircle0067];

    MWDrawTextLine *drawTextLine0084 = [[MWDrawTextLine alloc] init];
    drawTextLine0084.text = @"Havre";
    drawTextLine0084.fontName = @"HelveticaNeue";
    drawTextLine0084.fontColor = [UIColor blackColor];
    drawTextLine0084.fontSize = 34;
    drawTextLine0084.kernSpacing = -0.4;
    drawTextLine0084.origin = CGPointMake(1713, 1898);
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0084];

    MWDrawTextLine *drawTextLine0085 = [[MWDrawTextLine alloc] init];
    drawTextLine0085.text = @"Caumartin";
    drawTextLine0085.fontName = @"HelveticaNeue";
    drawTextLine0085.fontColor = [UIColor blackColor];
    drawTextLine0085.fontSize = 34;
    drawTextLine0085.kernSpacing = -0.2;
    drawTextLine0085.origin = CGPointMake(1639, 1931);
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0085];

    // Добавляем вершину
    edge0026.finishVertex = vertex0026;

    // Создаем участок линии Havre — Caumartin - Opéra
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0027 = [[MWEdge alloc] init];
    edge0027.identifier = @"edge0027";
    edge0027.developmentName = @"Ребро: Havre — Caumartin - Opéra";
    [self.edges addObject:edge0027];
    
    // Добавляем линию
    edge0027.line = line0003;
    
    // Добавляем вершину
    edge0027.startVertex = vertex0026;

    // Добавляем станцию Havre — Caumartin
    [edge0027.elements addObject:station0061];

    // Добавляем перегон
    MWHaul *haul0059 = [[MWHaul alloc] init];
    haul0059.identifier = @"haul0059";
    haul0059.length = 414;
    [edge0027.elements addObject:haul0059];

    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(1809, 1899);
    drawLine0078.endPoint = CGPointMake(1900, 1989.5);
    drawLine0078.width = 11;
    drawLine0078.color = line0003.color;
    [haul0059.drawPrimitives addObject:drawLine0078];

    // Добавляем станцию Opéra
    MWStation *station0062 = [[MWStation alloc] init];
    station0062.identifier = @"station0062";
    [edge0027.elements addObject:station0062];
    
    station0062.nameOriginal = @"Opéra";
    station0062.mapLocation = CGPointMake(1900, 1989.5);
    station0062.geoLocation = CGPointMake(48.870636, 2.332353);

    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = station0062.mapLocation;
    fillCircle0068.radius = 3;
    fillCircle0068.fillColor = [UIColor whiteColor];
    [station0062.drawPrimitives addObject:fillCircle0068];

    MWDrawTextLine *drawTextLine0086 = [[MWDrawTextLine alloc] init];
    drawTextLine0086.text = station0062.nameOriginal;
    drawTextLine0086.fontName = @"HelveticaNeue";
    drawTextLine0086.fontColor = [UIColor blackColor];
    drawTextLine0086.fontSize = 34;
    drawTextLine0086.kernSpacing = -0.8;
    drawTextLine0086.origin = CGPointMake(1941, 1957);
    [station0062.nameOriginalTextPrimitives addObject:drawTextLine0086];

    // Добавляем вершину
    edge0027.finishVertex = vertex0027;

    // Создаем участок линии Opéra - Réaumur — Sébastopol
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0028 = [[MWEdge alloc] init];
    edge0028.identifier = @"edge0028";
    edge0028.developmentName = @"Ребро: Opéra - Réaumur — Sébastopol";
    [self.edges addObject:edge0028];
    
    // Добавляем линию
    edge0028.line = line0003;
    
    // Добавляем вершину
    edge0028.startVertex = vertex0027;

    // Добавляем станцию Opéra
    [edge0028.elements addObject:station0062];

    // Добавляем перегон
    MWHaul *haul0060 = [[MWHaul alloc] init];
    haul0060.identifier = @"haul0060";
    haul0060.length = 330;
    [edge0028.elements addObject:haul0060];

    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(1899.5, 1989);
    drawLine0079.endPoint = CGPointMake(2001.5, 2092);
    drawLine0079.width = 11;
    drawLine0079.color = line0003.color;
    [haul0060.drawPrimitives addObject:drawLine0079];

    // Добавляем станцию Quatre-Septembre
    MWStation *station0063 = [[MWStation alloc] init];
    station0063.identifier = @"station0063";
    [edge0028.elements addObject:station0063];
    
    station0063.nameOriginal = @"Quatre-Septembre";
    station0063.mapLocation = CGPointMake(2001.5, 2092);
    station0063.geoLocation = CGPointMake(48.869574, 2.336633);

    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = station0063.mapLocation;
    fillCircle0069.radius = 12;
    fillCircle0069.fillColor = line0003.color;
    [station0063.drawPrimitives addObject:fillCircle0069];

    MWDrawTextLine *drawTextLine0087 = [[MWDrawTextLine alloc] init];
    drawTextLine0087.text = @"Quatre-Septembre";
    drawTextLine0087.fontName = @"HelveticaNeue";
    drawTextLine0087.fontColor = [UIColor blackColor];
    drawTextLine0087.fontSize = 34;
    drawTextLine0087.kernSpacing = -0.7;
    drawTextLine0087.origin = CGPointMake(2014, 2044);
    [station0063.nameOriginalTextPrimitives addObject:drawTextLine0087];

    // Добавляем перегон
    MWHaul *haul0061 = [[MWHaul alloc] init];
    haul0061.identifier = @"haul0061";
    haul0061.length = 378;
    [edge0028.elements addObject:haul0061];

    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(2001, 2091.5);
    drawLine0080.endPoint = CGPointMake(2046, 2136.5);
    drawLine0080.width = 11;
    drawLine0080.color = line0003.color;
    [haul0061.drawPrimitives addObject:drawLine0080];

    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(2066.5, 2114.5);
    drawArc0021.startDegrees = 90;
    drawArc0021.endDegrees = 135;
    drawArc0021.radius = 30;
    drawArc0021.width = 11;
    drawArc0021.color = line0003.color;
    [haul0061.drawPrimitives addObject:drawArc0021];

    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(2066, 2144.5);
    drawLine0081.endPoint = CGPointMake(2154.5, 2144.5);
    drawLine0081.width = 11;
    drawLine0081.color = line0003.color;
    [haul0061.drawPrimitives addObject:drawLine0081];

    // Добавляем станцию Bourse
    MWStation *station0064 = [[MWStation alloc] init];
    station0064.identifier = @"station0064";
    [edge0028.elements addObject:station0064];
    
    station0064.nameOriginal = @"Bourse";
    station0064.mapLocation = CGPointMake(2154.5, 2144.5);
    station0064.geoLocation = CGPointMake(48.868738, 2.34137);
    
    MWDrawFillCircle *fillCircle0070 = [[MWDrawFillCircle alloc] init];
    fillCircle0070.center = station0064.mapLocation;
    fillCircle0070.radius = 12;
    fillCircle0070.fillColor = line0003.color;
    [station0064.drawPrimitives addObject:fillCircle0070];

    MWDrawTextLine *drawTextLine0088 = [[MWDrawTextLine alloc] init];
    drawTextLine0088.text = station0064.nameOriginal;
    drawTextLine0088.fontName = @"HelveticaNeue";
    drawTextLine0088.fontColor = [UIColor blackColor];
    drawTextLine0088.fontSize = 34;
    drawTextLine0088.kernSpacing = -0.6;
    drawTextLine0088.origin = CGPointMake(2102, 2089);
    [station0064.nameOriginalTextPrimitives addObject:drawTextLine0088];

    // Добавляем перегон
    MWHaul *haul0062 = [[MWHaul alloc] init];
    haul0062.identifier = @"haul0062";
    haul0062.length = 386;
    [edge0028.elements addObject:haul0062];

    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(2154, 2144.5);
    drawLine0082.endPoint = CGPointMake(2313, 2144.5);
    drawLine0082.width = 11;
    drawLine0082.color = line0003.color;
    [haul0062.drawPrimitives addObject:drawLine0082];

    // Добавляем станцию Sentier
    MWStation *station0065 = [[MWStation alloc] init];
    station0065.identifier = @"station0065";
    [edge0028.elements addObject:station0065];
    
    station0065.nameOriginal = @"Sentier";
    station0065.mapLocation = CGPointMake(2313, 2144.5);
    station0065.geoLocation = CGPointMake(48.8676, 2.3464);

    MWDrawFillCircle *fillCircle0071 = [[MWDrawFillCircle alloc] init];
    fillCircle0071.center = station0065.mapLocation;
    fillCircle0071.radius = 12;
    fillCircle0071.fillColor = line0003.color;
    [station0065.drawPrimitives addObject:fillCircle0071];

    MWDrawTextLine *drawTextLine0089 = [[MWDrawTextLine alloc] init];
    drawTextLine0089.text = station0065.nameOriginal;
    drawTextLine0089.fontName = @"HelveticaNeue";
    drawTextLine0089.fontColor = [UIColor blackColor];
    drawTextLine0089.fontSize = 34;
    drawTextLine0089.kernSpacing = 0.6;
    drawTextLine0089.origin = CGPointMake(2262, 2089);
    [station0065.nameOriginalTextPrimitives addObject:drawTextLine0089];

    // Добавляем перегон
    MWHaul *haul0063 = [[MWHaul alloc] init];
    haul0063.identifier = @"haul0063";
    haul0063.length = 476;
    [edge0028.elements addObject:haul0063];

    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(2312.5, 2144.5);
    drawLine0083.endPoint = CGPointMake(2522, 2144.5);
    drawLine0083.width = 11;
    drawLine0083.color = line0003.color;
    [haul0063.drawPrimitives addObject:drawLine0083];

    // Добавляем станцию Réaumur — Sébastopol
    MWStation *station0066 = [[MWStation alloc] init];
    station0066.identifier = @"station0066";
    [edge0028.elements addObject:station0066];
    
    station0066.nameOriginal = @"Réaumur – Sébastopol";
    station0066.mapLocation = CGPointMake(2522, 2144.5);
    station0066.geoLocation = CGPointMake(48.866111, 2.3525);

    MWDrawFillCircle *fillCircle0072 = [[MWDrawFillCircle alloc] init];
    fillCircle0072.center = station0066.mapLocation;
    fillCircle0072.radius = 3;
    fillCircle0072.fillColor = [UIColor whiteColor];
    [station0066.drawPrimitives addObject:fillCircle0072];

    MWDrawTextLine *drawTextLine0090 = [[MWDrawTextLine alloc] init];
    drawTextLine0090.text = @"Réaumur";
    drawTextLine0090.fontName = @"HelveticaNeue";
    drawTextLine0090.fontColor = [UIColor blackColor];
    drawTextLine0090.fontSize = 34;
    drawTextLine0090.kernSpacing = -0.4;
    drawTextLine0090.origin = CGPointMake(2454, 2056);
    [station0066.nameOriginalTextPrimitives addObject:drawTextLine0090];

    MWDrawTextLine *drawTextLine0091 = [[MWDrawTextLine alloc] init];
    drawTextLine0091.text = @"Sébastopol";
    drawTextLine0091.fontName = @"HelveticaNeue";
    drawTextLine0091.fontColor = [UIColor blackColor];
    drawTextLine0091.fontSize = 34;
    drawTextLine0091.kernSpacing = -1.1;
    drawTextLine0091.origin = CGPointMake(2431, 2089);
    [station0066.nameOriginalTextPrimitives addObject:drawTextLine0091];

    // Добавляем вершину
    edge0028.finishVertex = vertex0028;

    // Создаем участок линии Réaumur — Sébastopol - Arts et Métiers
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0029 = [[MWEdge alloc] init];
    edge0029.identifier = @"edge0029";
    edge0029.developmentName = @"Ребро: Réaumur — Sébastopol - Arts et Métiers";
    [self.edges addObject:edge0029];
    
    // Добавляем линию
    edge0029.line = line0003;
    
    // Добавляем вершину
    edge0029.startVertex = vertex0028;

    // Добавляем станцию Réaumur — Sébastopol
    [edge0029.elements addObject:station0066];

    // Добавляем перегон
    MWHaul *haul0064 = [[MWHaul alloc] init];
    haul0064.identifier = @"haul0064";
    haul0064.length = 276;
    [edge0029.elements addObject:haul0064];

    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(2521.5, 2144.5);
    drawLine0084.endPoint = CGPointMake(2712.5, 2144.5);
    drawLine0084.width = 11;
    drawLine0084.color = line0003.color;
    [haul0064.drawPrimitives addObject:drawLine0084];

    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(2711.5, 2114.5);
    drawArc0022.startDegrees = 45;
    drawArc0022.endDegrees = 90;
    drawArc0022.radius = 30;
    drawArc0022.width = 11;
    drawArc0022.color = line0003.color;
    [haul0064.drawPrimitives addObject:drawArc0022];

    MWDrawLine *drawLine0085 = [[MWDrawLine alloc] init];
    drawLine0085.startPoint = CGPointMake(2732, 2136.5);
    drawLine0085.endPoint = CGPointMake(2765.5, 2103);
    drawLine0085.width = 11;
    drawLine0085.color = line0003.color;
    [haul0064.drawPrimitives addObject:drawLine0085];

    // Добавляем станцию Arts et Métiers
    MWStation *station0067 = [[MWStation alloc] init];
    station0067.identifier = @"station0067";
    [edge0029.elements addObject:station0067];
    
    station0067.nameOriginal = @"Arts et Métiers";
    station0067.mapLocation = CGPointMake(2765.5, 2103);
    station0067.geoLocation = CGPointMake(48.8655, 2.3561);
    
    MWDrawFillCircle *fillCircle0073 = [[MWDrawFillCircle alloc] init];
    fillCircle0073.center = station0067.mapLocation;
    fillCircle0073.radius = 3;
    fillCircle0073.fillColor = [UIColor whiteColor];
    [station0067.drawPrimitives addObject:fillCircle0073];

    MWDrawTextLine *drawTextLine0092 = [[MWDrawTextLine alloc] init];
    drawTextLine0092.text = @"Arts et";
    drawTextLine0092.fontName = @"HelveticaNeue";
    drawTextLine0092.fontColor = [UIColor blackColor];
    drawTextLine0092.fontSize = 34;
    drawTextLine0092.kernSpacing = -0.4;
    drawTextLine0092.origin = CGPointMake(2656, 2023);
    [station0067.nameOriginalTextPrimitives addObject:drawTextLine0092];

    MWDrawTextLine *drawTextLine0093 = [[MWDrawTextLine alloc] init];
    drawTextLine0093.text = @"Métiers";
    drawTextLine0093.fontName = @"HelveticaNeue";
    drawTextLine0093.fontColor = [UIColor blackColor];
    drawTextLine0093.fontSize = 34;
    drawTextLine0093.kernSpacing = -0.4;
    drawTextLine0093.origin = CGPointMake(2643, 2056);
    [station0067.nameOriginalTextPrimitives addObject:drawTextLine0093];

    // Добавляем вершину
    edge0029.finishVertex = vertex0029;

    // Создаем участок линии Arts et Métiers - République
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0030 = [[MWEdge alloc] init];
    edge0030.identifier = @"edge0030";
    edge0030.developmentName = @"Ребро: Arts et Métiers - République";
    [self.edges addObject:edge0030];
    
    // Добавляем линию
    edge0030.line = line0003;
    
    // Добавляем вершину
    edge0030.startVertex = vertex0029;

    // Добавляем станцию Arts et Métiers
    [edge0030.elements addObject:station0067];

    // Добавляем перегон
    MWHaul *haul0065 = [[MWHaul alloc] init];
    haul0065.identifier = @"haul0065";
    haul0065.length = 349;
    [edge0030.elements addObject:haul0065];

    MWDrawLine *drawLine0086 = [[MWDrawLine alloc] init];
    drawLine0086.startPoint = CGPointMake(2765, 2103.5);
    drawLine0086.endPoint = CGPointMake(2843.5, 2025);
    drawLine0086.width = 11;
    drawLine0086.color = line0003.color;
    [haul0065.drawPrimitives addObject:drawLine0086];

    // Добавляем станцию Temple
    MWStation *station0068 = [[MWStation alloc] init];
    station0068.identifier = @"station0068";
    [edge0030.elements addObject:station0068];
    
    station0068.nameOriginal = @"Temple";
    station0068.mapLocation = CGPointMake(2843.5, 2025);
    station0068.geoLocation = CGPointMake(48.866488, 2.360595);
    
    MWDrawFillCircle *fillCircle0074 = [[MWDrawFillCircle alloc] init];
    fillCircle0074.center = station0068.mapLocation;
    fillCircle0074.radius = 12;
    fillCircle0074.fillColor = line0003.color;
    [station0068.drawPrimitives addObject:fillCircle0074];

    MWDrawTextLine *drawTextLine0094 = [[MWDrawTextLine alloc] init];
    drawTextLine0094.text = station0068.nameOriginal;
    drawTextLine0094.fontName = @"HelveticaNeue";
    drawTextLine0094.fontColor = [UIColor blackColor];
    drawTextLine0094.fontSize = 34;
    drawTextLine0094.kernSpacing = -0.2;
    drawTextLine0094.origin = CGPointMake(2725, 1978);
    [station0068.nameOriginalTextPrimitives addObject:drawTextLine0094];

    // Добавляем перегон
    MWHaul *haul0066 = [[MWHaul alloc] init];
    haul0066.identifier = @"haul0066";
    haul0066.length = 275;
    [edge0030.elements addObject:haul0066];

    MWDrawLine *drawLine0087 = [[MWDrawLine alloc] init];
    drawLine0087.startPoint = CGPointMake(2844, 2025.5);
    drawLine0087.endPoint = CGPointMake(2914.5, 1955);
    drawLine0087.width = 11;
    drawLine0087.color = line0003.color;
    [haul0066.drawPrimitives addObject:drawLine0087];

    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(2935, 1977);
    drawArc0023.startDegrees = 225;
    drawArc0023.endDegrees = 270;
    drawArc0023.radius = 30;
    drawArc0023.width = 11;
    drawArc0023.color = line0003.color;
    [haul0066.drawPrimitives addObject:drawArc0023];

    MWDrawLine *drawLine0088 = [[MWDrawLine alloc] init];
    drawLine0088.startPoint = CGPointMake(2935, 1947);
    drawLine0088.endPoint = CGPointMake(2952.5, 1947);
    drawLine0088.width = 11;
    drawLine0088.color = line0003.color;
    [haul0066.drawPrimitives addObject:drawLine0088];

    // Добавляем станцию République
    MWStation *station0069 = [[MWStation alloc] init];
    station0069.identifier = @"station0069";
    [edge0030.elements addObject:station0069];
    
    station0069.nameOriginal = @"République";
    station0069.mapLocation = CGPointMake(2952.5, 1947);
    station0069.geoLocation = CGPointMake(48.867503, 2.363811);

    MWDrawFillCircle *fillCircle0075 = [[MWDrawFillCircle alloc] init];
    fillCircle0075.center = station0069.mapLocation;
    fillCircle0075.radius = 3;
    fillCircle0075.fillColor = [UIColor whiteColor];
    [station0069.drawPrimitives addObject:fillCircle0075];

    MWDrawTextLine *drawTextLine0095 = [[MWDrawTextLine alloc] init];
    drawTextLine0095.text = station0069.nameOriginal;
    drawTextLine0095.fontName = @"HelveticaNeue";
    drawTextLine0095.fontColor = [UIColor blackColor];
    drawTextLine0095.fontSize = 34;
    drawTextLine0095.kernSpacing = -0.5;
    drawTextLine0095.origin = CGPointMake(2961, 1956);
    [station0069.nameOriginalTextPrimitives addObject:drawTextLine0095];

    // Добавляем вершину
    edge0030.finishVertex = vertex0030;

    // Создаем участок линии République - Père Lachaise
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0031 = [[MWEdge alloc] init];
    edge0031.identifier = @"edge0031";
    edge0031.developmentName = @"Ребро: République - Père Lachaise";
    [self.edges addObject:edge0031];
    
    // Добавляем линию
    edge0031.line = line0003;
    
    // Добавляем вершину
    edge0031.startVertex = vertex0030;

    // Добавляем станцию République
    [edge0031.elements addObject:station0069];

    // Добавляем перегон
    MWHaul *haul0067 = [[MWHaul alloc] init];
    haul0067.identifier = @"haul0067";
    haul0067.length = 783;
    [edge0031.elements addObject:haul0067];

    MWDrawLine *drawLine0089 = [[MWDrawLine alloc] init];
    drawLine0089.startPoint = CGPointMake(2952, 1947);
    drawLine0089.endPoint = CGPointMake(3135, 1947);
    drawLine0089.width = 11;
    drawLine0089.color = line0003.color;
    [haul0067.drawPrimitives addObject:drawLine0089];

    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(3135, 1977);
    drawArc0024.startDegrees = 270;
    drawArc0024.endDegrees = 315;
    drawArc0024.radius = 30;
    drawArc0024.width = 11;
    drawArc0024.color = line0003.color;
    [haul0067.drawPrimitives addObject:drawArc0024];

    MWDrawLine *drawLine0090 = [[MWDrawLine alloc] init];
    drawLine0090.startPoint = CGPointMake(3155.5, 1955);
    drawLine0090.endPoint = CGPointMake(3264.5, 2064);
    drawLine0090.width = 11;
    drawLine0090.color = line0003.color;
    [haul0067.drawPrimitives addObject:drawLine0090];

    // Добавляем станцию Parmentier
    MWStation *station0070 = [[MWStation alloc] init];
    station0070.identifier = @"station0070";
    [edge0031.elements addObject:station0070];
    
    station0070.nameOriginal = @"Parmentier";
    station0070.mapLocation = CGPointMake(3264.5, 2064);
    station0070.geoLocation = CGPointMake(48.865299, 2.374381);

    MWDrawFillCircle *fillCircle0076 = [[MWDrawFillCircle alloc] init];
    fillCircle0076.center = station0070.mapLocation;
    fillCircle0076.radius = 12;
    fillCircle0076.fillColor = line0003.color;
    [station0070.drawPrimitives addObject:fillCircle0076];

    MWDrawTextLine *drawTextLine0096 = [[MWDrawTextLine alloc] init];
    drawTextLine0096.text = station0070.nameOriginal;
    drawTextLine0096.fontName = @"HelveticaNeue";
    drawTextLine0096.fontColor = [UIColor blackColor];
    drawTextLine0096.fontSize = 34;
    drawTextLine0096.kernSpacing = 0.2;
    drawTextLine0096.origin = CGPointMake(3100, 2066.5);
    [station0070.nameOriginalTextPrimitives addObject:drawTextLine0096];

    // Добавляем перегон
    MWHaul *haul0068 = [[MWHaul alloc] init];
    haul0068.identifier = @"haul0068";
    haul0068.length = 387;
    [edge0031.elements addObject:haul0068];

    MWDrawLine *drawLine0091 = [[MWDrawLine alloc] init];
    drawLine0091.startPoint = CGPointMake(3264, 2063.5);
    drawLine0091.endPoint = CGPointMake(3315, 2114.5);
    drawLine0091.width = 11;
    drawLine0091.color = line0003.color;
    [haul0068.drawPrimitives addObject:drawLine0091];

    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(3335.5, 2092.5);
    drawArc0025.startDegrees = 90;
    drawArc0025.endDegrees = 135;
    drawArc0025.radius = 30;
    drawArc0025.width = 11;
    drawArc0025.color = line0003.color;
    [haul0068.drawPrimitives addObject:drawArc0025];

    MWDrawLine *drawLine0092 = [[MWDrawLine alloc] init];
    drawLine0092.startPoint = CGPointMake(3335, 2122.5);
    drawLine0092.endPoint = CGPointMake(3356, 2122.5);
    drawLine0092.width = 11;
    drawLine0092.color = line0003.color;
    [haul0068.drawPrimitives addObject:drawLine0092];

    // Добавляем станцию Rue Saint-Maur
    MWStation *station0071 = [[MWStation alloc] init];
    station0071.identifier = @"station0071";
    [edge0031.elements addObject:station0071];
    
    station0071.nameOriginal = @"Rue Saint-Maur";
    station0071.mapLocation = CGPointMake(3356, 2122.5);
    station0071.geoLocation = CGPointMake(48.864335, 2.379448);

    MWDrawFillCircle *fillCircle0077 = [[MWDrawFillCircle alloc] init];
    fillCircle0077.center = station0071.mapLocation;
    fillCircle0077.radius = 12;
    fillCircle0077.fillColor = line0003.color;
    [station0071.drawPrimitives addObject:fillCircle0077];

    MWDrawTextLine *drawTextLine0097 = [[MWDrawTextLine alloc] init];
    drawTextLine0097.text = @"Rue";
    drawTextLine0097.fontName = @"HelveticaNeue";
    drawTextLine0097.fontColor = [UIColor blackColor];
    drawTextLine0097.fontSize = 34;
    drawTextLine0097.kernSpacing = -0.6;
    drawTextLine0097.origin = CGPointMake(3327, 2131);
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0097];

    MWDrawTextLine *drawTextLine0098 = [[MWDrawTextLine alloc] init];
    drawTextLine0098.text = @"Saint-Maur";
    drawTextLine0098.fontName = @"HelveticaNeue";
    drawTextLine0098.fontColor = [UIColor blackColor];
    drawTextLine0098.fontSize = 34;
    drawTextLine0098.kernSpacing = -0.8;
    drawTextLine0098.origin = CGPointMake(3264, 2164);
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0098];

    // Добавляем перегон
    MWHaul *haul0069 = [[MWHaul alloc] init];
    haul0069.identifier = @"haul0069";
    haul0069.length = 608;
    [edge0031.elements addObject:haul0069];

    MWDrawLine *drawLine0093 = [[MWDrawLine alloc] init];
    drawLine0093.startPoint = CGPointMake(3355.5, 2122.5);
    drawLine0093.endPoint = CGPointMake(3481, 2122.5);
    drawLine0093.width = 11;
    drawLine0093.color = line0003.color;
    [haul0069.drawPrimitives addObject:drawLine0093];

    // Добавляем станцию Père Lachaise
    MWStation *station0072 = [[MWStation alloc] init];
    station0072.identifier = @"station0072";
    [edge0031.elements addObject:station0072];
    
    station0072.nameOriginal = @"Père Lachaise";
    station0072.mapLocation = CGPointMake(3481, 2122.5);
    station0072.geoLocation = CGPointMake(48.862921, 2.387388);

    MWDrawFillCircle *fillCircle0078 = [[MWDrawFillCircle alloc] init];
    fillCircle0078.center = station0072.mapLocation;
    fillCircle0078.radius = 3;
    fillCircle0078.fillColor = [UIColor whiteColor];
    [station0072.drawPrimitives addObject:fillCircle0078];
    
    station0072.showNameOnMap = false;
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0065];
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0066];
    
    // Добавляем вершину
    edge0031.finishVertex = vertex0023;
    
    // Создаем участок линии Père Lachaise - Gambetta
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0032 = [[MWEdge alloc] init];
    edge0032.identifier = @"edge0032";
    edge0032.developmentName = @"Ребро: Père Lachaise - Gambetta";
    [self.edges addObject:edge0032];
    
    // Добавляем линию
    edge0032.line = line0003;
    
    // Добавляем вершину
    edge0032.startVertex = vertex0023;

    // Добавляем станцию Père Lachaise
    [edge0032.elements addObject:station0072];

    // Добавляем перегон
    MWHaul *haul0070 = [[MWHaul alloc] init];
    haul0070.identifier = @"haul0070";
    haul0070.length = 856;
    [edge0032.elements addObject:haul0070];
    
    MWDrawLine *drawLine0094 = [[MWDrawLine alloc] init];
    drawLine0094.startPoint = CGPointMake(3480.5, 2122.5);
    drawLine0094.endPoint = CGPointMake(3662, 2122.5);
    drawLine0094.width = 11;
    drawLine0094.color = line0003.color;
    [haul0070.drawPrimitives addObject:drawLine0094];

    // Добавляем станцию Gambetta
    MWStation *station0073 = [[MWStation alloc] init];
    station0073.identifier = @"station0073";
    [edge0032.elements addObject:station0073];
    
    station0073.nameOriginal = @"Gambetta";
    station0073.mapLocation = CGPointMake(3662, 2122.5);
    station0073.geoLocation = CGPointMake(48.864947, 2.398451);
    
    MWDrawFillCircle *fillCircle0079 = [[MWDrawFillCircle alloc] init];
    fillCircle0079.center = station0073.mapLocation;
    fillCircle0079.radius = 3;
    fillCircle0079.fillColor = [UIColor whiteColor];
    [station0073.drawPrimitives addObject:fillCircle0079];

    MWDrawTextLine *drawTextLine0099 = [[MWDrawTextLine alloc] init];
    drawTextLine0099.text = station0073.nameOriginal;
    drawTextLine0099.fontName = @"Helvetica-Bold";
    drawTextLine0099.fontColor = [UIColor blackColor];
    drawTextLine0099.fontSize = 30;
    drawTextLine0099.kernSpacing = 1.8;
    drawTextLine0099.origin = CGPointMake(3586, 2135);
    [station0073.drawPrimitives addObject:drawTextLine0099];

    // Добавляем вершину
    edge0032.finishVertex = vertex0031;
    
    // Создаем участок линии Gambetta - Gallieni
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0033 = [[MWEdge alloc] init];
    edge0033.identifier = @"edge0033";
    edge0033.developmentName = @"Ребро: Gambetta - Gallieni";
    [self.edges addObject:edge0033];
    
    // Добавляем линию
    edge0033.line = line0003;
    
    // Добавляем вершину
    edge0033.startVertex = vertex0031;

    // Добавляем станцию Gambetta
    [edge0033.elements addObject:station0073];

    // Добавляем перегон
    MWHaul *haul0071 = [[MWHaul alloc] init];
    haul0071.identifier = @"haul0071";
    haul0071.length = 630;
    [edge0033.elements addObject:haul0071];
    
    MWDrawLine *drawLine0095 = [[MWDrawLine alloc] init];
    drawLine0095.startPoint = CGPointMake(3661.5, 2122.5);
    drawLine0095.endPoint = CGPointMake(3846, 2122.5);
    drawLine0095.width = 11;
    drawLine0095.color = line0003.color;
    [haul0071.drawPrimitives addObject:drawLine0095];

    // Добавляем станцию Porte de Bagnolet
    MWStation *station0074 = [[MWStation alloc] init];
    station0074.identifier = @"station0074";
    [edge0033.elements addObject:station0074];
    
    station0074.nameOriginal = @"Porte de Bagnolet";
    station0074.mapLocation = CGPointMake(3846, 2122.5);
    station0074.geoLocation = CGPointMake(48.864565, 2.407278);

    MWDrawFillCircle *fillCircle0080 = [[MWDrawFillCircle alloc] init];
    fillCircle0080.center = station0074.mapLocation;
    fillCircle0080.radius = 13;
    fillCircle0080.fillColor = [UIColor blackColor];
    [station0074.drawPrimitives addObject:fillCircle0080];

    MWDrawFillCircle *fillCircle0576 = [[MWDrawFillCircle alloc] init];
    fillCircle0576.center = station0074.mapLocation;
    fillCircle0576.radius = 11;
    fillCircle0576.fillColor = [UIColor whiteColor];
    [station0074.drawPrimitives addObject:fillCircle0576];

    MWDrawTextLine *drawTextLine0100 = [[MWDrawTextLine alloc] init];
    drawTextLine0100.text = @"Porte";
    drawTextLine0100.fontName = @"HelveticaNeue";
    drawTextLine0100.fontColor = [UIColor blackColor];
    drawTextLine0100.fontSize = 34;
    drawTextLine0100.kernSpacing = -0.6;
    drawTextLine0100.origin = CGPointMake(3835, 2133.5);
    [station0074.nameOriginalTextPrimitives addObject:drawTextLine0100];

    MWDrawTextLine *drawTextLine0101 = [[MWDrawTextLine alloc] init];
    drawTextLine0101.text = @"de Bagnolet";
    drawTextLine0101.fontName = @"HelveticaNeue";
    drawTextLine0101.fontColor = [UIColor blackColor];
    drawTextLine0101.fontSize = 34;
    drawTextLine0101.kernSpacing = -0.5;
    drawTextLine0101.origin = CGPointMake(3835, 2168);
    [station0074.nameOriginalTextPrimitives addObject:drawTextLine0101];

    // Добавляем перегон
    MWHaul *haul0072 = [[MWHaul alloc] init];
    haul0072.identifier = @"haul0072";
    haul0072.length = 625;
    [edge0033.elements addObject:haul0072];
    
    MWDrawLine *drawLine0096 = [[MWDrawLine alloc] init];
    drawLine0096.startPoint = CGPointMake(3845.5, 2122.5);
    drawLine0096.endPoint = CGPointMake(3978, 2122.5);
    drawLine0096.width = 11;
    drawLine0096.color = line0003.color;
    [haul0072.drawPrimitives addObject:drawLine0096];

    // Добавляем станцию Gallieni
    MWStation *station0075 = [[MWStation alloc] init];
    station0075.identifier = @"station0075";
    [edge0033.elements addObject:station0075];
    
    station0075.nameOriginal = @"Gallieni";
    station0075.mapLocation = CGPointMake(3978, 2122.5);
    station0075.geoLocation = CGPointMake(48.8635, 2.41578);
    
    MWDrawFillCircle *fillCircle0081 = [[MWDrawFillCircle alloc] init];
    fillCircle0081.center = station0075.mapLocation;
    fillCircle0081.radius = 12;
    fillCircle0081.fillColor = [UIColor blackColor];
    [station0075.drawPrimitives addObject:fillCircle0081];

    MWDrawTextLine *drawTextLine0102 = [[MWDrawTextLine alloc] init];
    drawTextLine0102.text = station0075.nameOriginal;
    drawTextLine0102.fontName = @"Helvetica-Bold";
    drawTextLine0102.fontColor = [UIColor blackColor];
    drawTextLine0102.fontSize = 30;
    drawTextLine0102.kernSpacing = 1.4;
    drawTextLine0102.origin = CGPointMake(4058, 2105.5);
    [station0075.drawPrimitives addObject:drawTextLine0102];

    MWDrawFillCircle *fillCircle0082 = [[MWDrawFillCircle alloc] init];
    fillCircle0082.center = CGPointMake(4023, 2122.5);
    fillCircle0082.radius = 28;
    fillCircle0082.fillColor = line0003.color;
    [station0075.drawPrimitives addObject:fillCircle0082];

    MWDrawTextLine *drawTextLine0103 = [[MWDrawTextLine alloc] init];
    drawTextLine0103.text = @"3";
    drawTextLine0103.fontName = @"HelveticaNeue-Bold";
    drawTextLine0103.fontColor = [UIColor whiteColor];
    drawTextLine0103.fontSize = 44;
    drawTextLine0103.origin = CGPointMake(4011, 2094.5);
    [station0075.drawPrimitives addObject:drawTextLine0103];

    // Добавляем вершину
    edge0033.finishVertex = vertex0032;
    
    ////////////////////////////////////////////////////////////////
    // Line 3bis
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Porte des Lilas - Gambetta
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0034 = [[MWEdge alloc] init];
    edge0034.identifier = @"edge0034";
    edge0034.developmentName = @"Ребро: Porte des Lilas - Gambetta";
    [self.edges addObject:edge0034];
    
    // Добавляем линию
    edge0034.line = line0004;
    
    // Добавляем вершину
    edge0034.startVertex = vertex0033;

    // Добавляем станцию Porte des Lilas
    MWStation *station0076 = [[MWStation alloc] init];
    station0076.identifier = @"station0076";
    [edge0034.elements addObject:station0076];
    
    station0076.nameOriginal = @"Porte des Lilas";
    station0076.mapLocation = CGPointMake(3865.5, 1676);
    station0076.geoLocation = CGPointMake(48.877183, 2.406655);

    MWDrawFillCircle *fillCircle0083 = [[MWDrawFillCircle alloc] init];
    fillCircle0083.center = CGPointMake(3941, 1672);
    fillCircle0083.radius = 28;
    fillCircle0083.fillColor = line0004.color;
    [station0076.drawPrimitives addObject:fillCircle0083];

    MWDrawTextLine *drawTextLine0104 = [[MWDrawTextLine alloc] init];
    drawTextLine0104.text = @"3";
    drawTextLine0104.fontName = @"HelveticaNeue-Bold";
    drawTextLine0104.fontColor = [UIColor blackColor];
    drawTextLine0104.fontSize = 44;
    drawTextLine0104.origin = CGPointMake(3919, 1644);
    [station0076.drawPrimitives addObject:drawTextLine0104];

    MWDrawTextLine *drawTextLine0105 = [[MWDrawTextLine alloc] init];
    drawTextLine0105.text = @"bis";
    drawTextLine0105.fontName = @"HelveticaNeue-Bold";
    drawTextLine0105.fontColor = [UIColor blackColor];
    drawTextLine0105.fontSize = 15;
    drawTextLine0105.origin = CGPointMake(3944, 1661);
    [station0076.drawPrimitives addObject:drawTextLine0105];

    MWDrawTextLine *drawTextLine0106 = [[MWDrawTextLine alloc] init];
    drawTextLine0106.text = station0076.nameOriginal;
    drawTextLine0106.fontName = @"Helvetica-Bold";
    drawTextLine0106.fontColor = [UIColor blackColor];
    drawTextLine0106.fontSize = 30;
    drawTextLine0106.kernSpacing = 1.0;
    drawTextLine0106.origin = CGPointMake(3975, 1654);
    [station0076.drawPrimitives addObject:drawTextLine0106];

    MWDrawFillCircle *fillCircle0084 = [[MWDrawFillCircle alloc] init];
    fillCircle0084.center = station0076.mapLocation;
    fillCircle0084.radius = 5.5;
    fillCircle0084.fillColor = line0004.color;
    [station0076.drawPrimitives addObject:fillCircle0084];

    // Добавляем перегон
    MWHaul *haul0073 = [[MWHaul alloc] init];
    haul0073.identifier = @"haul0073";
    haul0073.length = 620;
    [edge0034.elements addObject:haul0073];

    MWDrawLine *drawLine0097 = [[MWDrawLine alloc] init];
    drawLine0097.startPoint = CGPointMake(3865.5, 1676);
    drawLine0097.endPoint = CGPointMake(3865.5, 1813.5);
    drawLine0097.width = 11;
    drawLine0097.color = line0004.color;
    [haul0073.drawPrimitives addObject:drawLine0097];

    // Добавляем станцию Saint-Fargeau
    MWStation *station0077 = [[MWStation alloc] init];
    station0077.identifier = @"station0077";
    [edge0034.elements addObject:station0077];
    
    station0077.nameOriginal = @"Saint-Fargeau";
    station0077.mapLocation = CGPointMake(3865.5, 1813.5);
    station0077.geoLocation = CGPointMake(48.872083, 2.40452);

    MWDrawFillCircle *fillCircle0085 = [[MWDrawFillCircle alloc] init];
    fillCircle0085.center = station0077.mapLocation;
    fillCircle0085.radius = 12;
    fillCircle0085.fillColor = line0004.color;
    [station0077.drawPrimitives addObject:fillCircle0085];

    MWDrawTextLine *drawTextLine0107 = [[MWDrawTextLine alloc] init];
    drawTextLine0107.text = station0077.nameOriginal;
    drawTextLine0107.fontName = @"HelveticaNeue";
    drawTextLine0107.fontColor = [UIColor blackColor];
    drawTextLine0107.fontSize = 34;
    drawTextLine0107.kernSpacing = -1.1;
    drawTextLine0107.origin = CGPointMake(3635, 1792);
    [station0077.nameOriginalTextPrimitives addObject:drawTextLine0107];

    // Добавляем перегон
    MWHaul *haul0074 = [[MWHaul alloc] init];
    haul0074.identifier = @"haul0074";
    haul0074.length = 431;
    [edge0034.elements addObject:haul0074];

    MWDrawLine *drawLine0098 = [[MWDrawLine alloc] init];
    drawLine0098.startPoint = CGPointMake(3865.5, 1813.5);
    drawLine0098.endPoint = CGPointMake(3865.5, 1858);
    drawLine0098.width = 11;
    drawLine0098.color = line0004.color;
    [haul0074.drawPrimitives addObject:drawLine0098];

    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(3835.5, 1857.5);
    drawArc0026.startDegrees = 0;
    drawArc0026.endDegrees = 45;
    drawArc0026.radius = 30;
    drawArc0026.width = 11;
    drawArc0026.color = line0004.color;
    [haul0074.drawPrimitives addObject:drawArc0026];

    MWDrawLine *drawLine0099 = [[MWDrawLine alloc] init];
    drawLine0099.startPoint = CGPointMake(3857, 1878.5);
    drawLine0099.endPoint = CGPointMake(3774, 1961.5);
    drawLine0099.width = 11;
    drawLine0099.color = line0004.color;
    [haul0074.drawPrimitives addObject:drawLine0099];

    // Добавляем станцию Pelleport
    MWStation *station0078 = [[MWStation alloc] init];
    station0078.identifier = @"station0078";
    [edge0034.elements addObject:station0078];
    
    station0078.nameOriginal = @"Pelleport";
    station0078.mapLocation = CGPointMake(3774, 1961.5);
    station0078.geoLocation = CGPointMake(48.868671, 2.401752);

    MWDrawFillCircle *fillCircle0086 = [[MWDrawFillCircle alloc] init];
    fillCircle0086.center = station0078.mapLocation;
    fillCircle0086.radius = 12;
    fillCircle0086.fillColor = line0004.color;
    [station0078.drawPrimitives addObject:fillCircle0086];

    MWDrawTextLine *drawTextLine0108 = [[MWDrawTextLine alloc] init];
    drawTextLine0108.text = station0078.nameOriginal;
    drawTextLine0108.fontName = @"HelveticaNeue";
    drawTextLine0108.fontColor = [UIColor blackColor];
    drawTextLine0108.fontSize = 34;
    drawTextLine0108.kernSpacing = -0.2;
    drawTextLine0108.origin = CGPointMake(3629, 1915);
    [station0078.nameOriginalTextPrimitives addObject:drawTextLine0108];

    // Добавляем перегон
    MWHaul *haul0075 = [[MWHaul alloc] init];
    haul0075.identifier = @"haul0075";
    haul0075.length = 435;
    [edge0034.elements addObject:haul0075];

    MWDrawLine *drawLine0100 = [[MWDrawLine alloc] init];
    drawLine0100.startPoint = CGPointMake(3774.5, 1961);
    drawLine0100.endPoint = CGPointMake(3670, 2065.5);
    drawLine0100.width = 11;
    drawLine0100.color = line0004.color;
    [haul0075.drawPrimitives addObject:drawLine0100];

    MWDrawArc *drawArc0027 = [[MWDrawArc alloc] init];
    drawArc0027.center = CGPointMake(3692, 2086);
    drawArc0027.startDegrees = 180;
    drawArc0027.endDegrees = 225;
    drawArc0027.radius = 30;
    drawArc0027.width = 11;
    drawArc0027.color = line0004.color;
    [haul0075.drawPrimitives addObject:drawArc0027];

    MWDrawLine *drawLine0101 = [[MWDrawLine alloc] init];
    drawLine0101.startPoint = CGPointMake(3662, 2085);
    drawLine0101.endPoint = CGPointMake(3662, 2100);
    drawLine0101.width = 11;
    drawLine0101.color = line0004.color;
    [haul0075.drawPrimitives addObject:drawLine0101];

    // Добавляем станцию Gambetta
    MWStation *station0079 = [[MWStation alloc] init];
    station0079.identifier = @"station0079";
    [edge0034.elements addObject:station0079];
    
    station0079.nameOriginal = @"Gambetta";
    station0079.mapLocation = CGPointMake(3662, 2100);
    station0079.geoLocation = CGPointMake(48.864947, 2.398451);

    MWDrawFillCircle *fillCircle0087 = [[MWDrawFillCircle alloc] init];
    fillCircle0087.center = station0079.mapLocation;
    fillCircle0087.radius = 5.5;
    fillCircle0087.fillColor = line0004.color;
    [station0079.drawPrimitives addObject:fillCircle0087];

    station0079.showNameOnMap = false;
    [station0079.drawPrimitives addObject:drawTextLine0099];
    
    MWDrawFillCircle *fillCircle0088 = [[MWDrawFillCircle alloc] init];
    fillCircle0088.center = CGPointMake(3711.5, 2085);
    fillCircle0088.radius = 28;
    fillCircle0088.fillColor = line0004.color;
    [station0079.drawPrimitives addObject:fillCircle0088];

    MWDrawTextLine *drawTextLine0109 = [[MWDrawTextLine alloc] init];
    drawTextLine0109.text = @"3";
    drawTextLine0109.fontName = @"HelveticaNeue-Bold";
    drawTextLine0109.fontColor = [UIColor blackColor];
    drawTextLine0109.fontSize = 44;
    drawTextLine0109.origin = CGPointMake(3689, 2057);
    [station0079.drawPrimitives addObject:drawTextLine0109];

    MWDrawTextLine *drawTextLine0110 = [[MWDrawTextLine alloc] init];
    drawTextLine0110.text = @"bis";
    drawTextLine0110.fontName = @"HelveticaNeue-Bold";
    drawTextLine0110.fontColor = [UIColor blackColor];
    drawTextLine0110.fontSize = 15;
    drawTextLine0110.origin = CGPointMake(3714, 2074);
    [station0079.drawPrimitives addObject:drawTextLine0110];

    // Добавляем вершину
    edge0034.finishVertex = vertex0031;
    
    ////////////////////////////////////////////////////////////////
    // Line 4
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Porte de Clignancourt - Marcadet – Poissonniers
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0035 = [[MWEdge alloc] init];
    edge0035.identifier = @"edge0035";
    edge0035.developmentName = @"Ребро: Porte de Clignancourt - Marcadet – Poissonniers";
    [self.edges addObject:edge0035];
    
    // Добавляем линию
    edge0035.line = line0005;
    
    // Добавляем вершину
    edge0035.startVertex = vertex0034;

    // Добавляем станцию Porte de Clignancourt
    MWStation *station0080 = [[MWStation alloc] init];
    station0080.identifier = @"station0080";
    [edge0035.elements addObject:station0080];
    
    station0080.nameOriginal = @"Porte de Clignancourt";
    station0080.mapLocation = CGPointMake(2312, 950);
    station0080.geoLocation = CGPointMake(48.896944, 2.345);

    MWDrawFillCircle *fillCircle0089 = [[MWDrawFillCircle alloc] init];
    fillCircle0089.center = CGPointMake(2280.5, 917.5);
    fillCircle0089.radius = 28;
    fillCircle0089.fillColor = line0005.color;
    [station0080.drawPrimitives addObject:fillCircle0089];

    MWDrawTextLine *drawTextLine0111 = [[MWDrawTextLine alloc] init];
    drawTextLine0111.text = @"4";
    drawTextLine0111.fontName = @"HelveticaNeue-Bold";
    drawTextLine0111.fontColor = [UIColor whiteColor];
    drawTextLine0111.fontSize = 44;
    drawTextLine0111.origin = CGPointMake(2266.5, 889);
    [station0080.drawPrimitives addObject:drawTextLine0111];

    MWDrawTextLine *drawTextLine0112 = [[MWDrawTextLine alloc] init];
    drawTextLine0112.text = @"Porte";
    drawTextLine0112.fontName = @"Helvetica-Bold";
    drawTextLine0112.fontColor = [UIColor blackColor];
    drawTextLine0112.fontSize = 30;
    drawTextLine0112.kernSpacing = 2.0;
    drawTextLine0112.origin = CGPointMake(2160, 881);
    [station0080.drawPrimitives addObject:drawTextLine0112];

    MWDrawTextLine *drawTextLine0113 = [[MWDrawTextLine alloc] init];
    drawTextLine0113.text = @"de Clignancourt";
    drawTextLine0113.fontName = @"Helvetica-Bold";
    drawTextLine0113.fontColor = [UIColor blackColor];
    drawTextLine0113.fontSize = 30;
    drawTextLine0113.kernSpacing = 1.1;
    drawTextLine0113.origin = CGPointMake(2001, 914);
    [station0080.drawPrimitives addObject:drawTextLine0113];

    MWDrawFillCircle *fillCircle0090 = [[MWDrawFillCircle alloc] init];
    fillCircle0090.center = station0080.mapLocation;
    fillCircle0090.radius = 12;
    fillCircle0090.fillColor = [UIColor blackColor];
    [station0080.drawPrimitives addObject:fillCircle0090];

    // Добавляем перегон
    MWHaul *haul0076 = [[MWHaul alloc] init];
    haul0076.identifier = @"haul0076";
    haul0076.length = 463;
    [edge0035.elements addObject:haul0076];

    MWDrawLine *drawLine0102 = [[MWDrawLine alloc] init];
    drawLine0102.startPoint = CGPointMake(2312, 950);
    drawLine0102.endPoint = CGPointMake(2380, 1018.5);
    drawLine0102.width = 11;
    drawLine0102.color = line0005.color;
    [haul0076.drawPrimitives addObject:drawLine0102];

    // Добавляем станцию Simplon
    MWStation *station0081 = [[MWStation alloc] init];
    station0081.identifier = @"station0081";
    [edge0035.elements addObject:station0081];
    
    station0081.nameOriginal = @"Simplon";
    station0081.mapLocation = CGPointMake(2380, 1018.5);
    station0081.geoLocation = CGPointMake(48.893333, 2.348333);

    MWDrawFillCircle *fillCircle0091 = [[MWDrawFillCircle alloc] init];
    fillCircle0091.center = station0081.mapLocation;
    fillCircle0091.radius = 12;
    fillCircle0091.fillColor = line0005.color;
    [station0081.drawPrimitives addObject:fillCircle0091];

    MWDrawTextLine *drawTextLine0114 = [[MWDrawTextLine alloc] init];
    drawTextLine0114.text = station0081.nameOriginal;
    drawTextLine0114.fontName = @"HelveticaNeue";
    drawTextLine0114.fontColor = [UIColor blackColor];
    drawTextLine0114.fontSize = 34;
    drawTextLine0114.kernSpacing = -0.4;
    drawTextLine0114.origin = CGPointMake(2398, 983);
    [station0081.nameOriginalTextPrimitives addObject:drawTextLine0114];

    // Добавляем перегон
    MWHaul *haul0077 = [[MWHaul alloc] init];
    haul0077.identifier = @"haul0077";
    haul0077.length = 264;
    [edge0035.elements addObject:haul0077];

    MWDrawLine *drawLine0103 = [[MWDrawLine alloc] init];
    drawLine0103.startPoint = CGPointMake(2379.5, 1018);
    drawLine0103.endPoint = CGPointMake(2435, 1073.5);
    drawLine0103.width = 11;
    drawLine0103.color = line0005.color;
    [haul0077.drawPrimitives addObject:drawLine0103];

    MWDrawArc *drawArc0028 = [[MWDrawArc alloc] init];
    drawArc0028.center = CGPointMake(2413.5, 1094.5);
    drawArc0028.startDegrees = 315;
    drawArc0028.endDegrees = 0;
    drawArc0028.radius = 30;
    drawArc0028.width = 11;
    drawArc0028.color = line0005.color;
    [haul0077.drawPrimitives addObject:drawArc0028];

    MWDrawLine *drawLine0104 = [[MWDrawLine alloc] init];
    drawLine0104.startPoint = CGPointMake(2443.5, 1094);
    drawLine0104.endPoint = CGPointMake(2443.5, 1121);
    drawLine0104.width = 11;
    drawLine0104.color = line0005.color;
    [haul0077.drawPrimitives addObject:drawLine0104];

    // Добавляем станцию Marcadet – Poissonniers
    MWStation *station0082 = [[MWStation alloc] init];
    station0082.identifier = @"station0082";
    [edge0035.elements addObject:station0082];
    
    station0082.nameOriginal = @"Marcadet – Poissonniers";
    station0082.mapLocation = CGPointMake(2443.5, 1121);
    station0082.geoLocation = CGPointMake(48.890278, 2.35);

    MWDrawFillCircle *fillCircle0092 = [[MWDrawFillCircle alloc] init];
    fillCircle0092.center = station0082.mapLocation;
    fillCircle0092.radius = 3;
    fillCircle0092.fillColor = [UIColor whiteColor];
    [station0082.drawPrimitives addObject:fillCircle0092];

    MWDrawTextLine *drawTextLine0115 = [[MWDrawTextLine alloc] init];
    drawTextLine0115.text = @"Marcadet";
    drawTextLine0115.fontName = @"HelveticaNeue";
    drawTextLine0115.fontColor = [UIColor blackColor];
    drawTextLine0115.fontSize = 34;
    drawTextLine0115.kernSpacing = -0.8;
    drawTextLine0115.origin = CGPointMake(2454, 1039);
    [station0082.nameOriginalTextPrimitives addObject:drawTextLine0115];

    MWDrawTextLine *drawTextLine0116 = [[MWDrawTextLine alloc] init];
    drawTextLine0116.text = @"Poissonniers";
    drawTextLine0116.fontName = @"HelveticaNeue";
    drawTextLine0116.fontColor = [UIColor blackColor];
    drawTextLine0116.fontSize = 34;
    drawTextLine0116.kernSpacing = -0.55;
    drawTextLine0116.origin = CGPointMake(2454, 1071);
    [station0082.nameOriginalTextPrimitives addObject:drawTextLine0116];

    // Добавляем вершину
    edge0035.finishVertex = vertex0035;

    // Создаем участок линии Marcadet – Poissonniers - Barbès – Rochechouart
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0036 = [[MWEdge alloc] init];
    edge0036.identifier = @"edge0036";
    edge0036.developmentName = @"Ребро: Marcadet – Poissonniers - Barbès – Rochechouart";
    [self.edges addObject:edge0036];
    
    // Добавляем линию
    edge0036.line = line0005;
    
    // Добавляем вершину
    edge0036.startVertex = vertex0035;

    // Добавляем станцию Marcadet – Poissonniers
    [edge0036.elements addObject:station0082];

    // Добавляем перегон
    MWHaul *haul0078 = [[MWHaul alloc] init];
    haul0078.identifier = @"haul0078";
    haul0078.length = 490;
    [edge0036.elements addObject:haul0078];
    
    MWDrawLine *drawLine0105 = [[MWDrawLine alloc] init];
    drawLine0105.startPoint = CGPointMake(2443.5, 1120.5);
    drawLine0105.endPoint = CGPointMake(2443.5, 1210);
    drawLine0105.width = 11;
    drawLine0105.color = line0005.color;
    [haul0078.drawPrimitives addObject:drawLine0105];

    // Добавляем станцию Château Rouge
    MWStation *station0083 = [[MWStation alloc] init];
    station0083.identifier = @"station0083";
    [edge0036.elements addObject:station0083];
    
    station0083.nameOriginal = @"Château Rouge";
    station0083.mapLocation = CGPointMake(2443.5, 1210);
    station0083.geoLocation = CGPointMake(48.886667, 2.349444);

    MWDrawFillCircle *fillCircle0093 = [[MWDrawFillCircle alloc] init];
    fillCircle0093.center = station0083.mapLocation;
    fillCircle0093.radius = 12;
    fillCircle0093.fillColor = line0005.color;
    [station0083.drawPrimitives addObject:fillCircle0093];

    MWDrawTextLine *drawTextLine0117 = [[MWDrawTextLine alloc] init];
    drawTextLine0117.text = @"Château";
    drawTextLine0117.fontName = @"HelveticaNeue";
    drawTextLine0117.fontColor = [UIColor blackColor];
    drawTextLine0117.fontSize = 34;
    drawTextLine0117.kernSpacing = -0.7;
    drawTextLine0117.origin = CGPointMake(2463, 1155);
    [station0083.nameOriginalTextPrimitives addObject:drawTextLine0117];

    MWDrawTextLine *drawTextLine0118 = [[MWDrawTextLine alloc] init];
    drawTextLine0118.text = @"Rouge";
    drawTextLine0118.fontName = @"HelveticaNeue";
    drawTextLine0118.fontColor = [UIColor blackColor];
    drawTextLine0118.fontSize = 34;
    drawTextLine0118.kernSpacing = -0.8;
    drawTextLine0118.origin = CGPointMake(2463, 1188);
    [station0083.nameOriginalTextPrimitives addObject:drawTextLine0118];

    // Добавляем перегон
    MWHaul *haul0079 = [[MWHaul alloc] init];
    haul0079.identifier = @"haul0079";
    haul0079.length = 378;
    [edge0036.elements addObject:haul0079];
    
    MWDrawLine *drawLine0106 = [[MWDrawLine alloc] init];
    drawLine0106.startPoint = CGPointMake(2443.5, 1209.5);
    drawLine0106.endPoint = CGPointMake(2443.5, 1334);
    drawLine0106.width = 11;
    drawLine0106.color = line0005.color;
    [haul0079.drawPrimitives addObject:drawLine0106];

    MWDrawArc *drawArc0029 = [[MWDrawArc alloc] init];
    drawArc0029.center = CGPointMake(2458.5, 1334);
    drawArc0029.startDegrees = 90;
    drawArc0029.endDegrees = 180;
    drawArc0029.radius = 15;
    drawArc0029.width = 11;
    drawArc0029.color = line0005.color;
    [haul0079.drawPrimitives addObject:drawArc0029];

    MWDrawLine *drawLine0107 = [[MWDrawLine alloc] init];
    drawLine0107.startPoint = CGPointMake(2458, 1349);
    drawLine0107.endPoint = CGPointMake(2566, 1349);
    drawLine0107.width = 11;
    drawLine0107.color = line0005.color;
    [haul0079.drawPrimitives addObject:drawLine0107];

    // Добавляем станцию Barbès – Rochechouart
    MWStation *station0084 = [[MWStation alloc] init];
    station0084.identifier = @"station0084";
    [edge0036.elements addObject:station0084];
    
    station0084.nameOriginal = @"Barbès – Rochechouart";
    station0084.mapLocation = CGPointMake(2566, 1349);
    station0084.geoLocation = CGPointMake(48.883611, 2.350556);

    MWDrawFillCircle *fillCircle0094 = [[MWDrawFillCircle alloc] init];
    fillCircle0094.center = station0084.mapLocation;
    fillCircle0094.radius = 3;
    fillCircle0094.fillColor = [UIColor whiteColor];
    [station0084.drawPrimitives addObject:fillCircle0094];

    station0084.showNameOnMap = false;
    [station0084.nameOriginalTextPrimitives addObject:drawTextLine0055];
    [station0084.nameOriginalTextPrimitives addObject:drawTextLine0056];

    // Добавляем вершину
    edge0036.finishVertex = vertex0018;
    
    // Создаем участок линии Barbès – Rochechouart - Gare du Nord
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0037 = [[MWEdge alloc] init];
    edge0037.identifier = @"edge0037";
    edge0037.developmentName = @"Ребро: Barbès – Rochechouart - Gare du Nord";
    [self.edges addObject:edge0037];
    
    // Добавляем линию
    edge0037.line = line0005;
    
    // Добавляем вершину
    edge0037.startVertex = vertex0018;

    // Добавляем станцию Barbès – Rochechouart
    [edge0037.elements addObject:station0084];

    // Добавляем перегон
    MWHaul *haul0080 = [[MWHaul alloc] init];
    haul0080.identifier = @"haul0080";
    haul0080.length = 682;
    [edge0037.elements addObject:haul0080];

    MWDrawLine *drawLine0108 = [[MWDrawLine alloc] init];
    drawLine0108.startPoint = CGPointMake(2565.5, 1349);
    drawLine0108.endPoint = CGPointMake(2665, 1349);
    drawLine0108.width = 11;
    drawLine0108.color = line0005.color;
    [haul0080.drawPrimitives addObject:drawLine0108];

    MWDrawArc *drawArc0030 = [[MWDrawArc alloc] init];
    drawArc0030.center = CGPointMake(2664.5, 1379);
    drawArc0030.startDegrees = 270;
    drawArc0030.endDegrees = 315;
    drawArc0030.radius = 30;
    drawArc0030.width = 11;
    drawArc0030.color = line0005.color;
    [haul0080.drawPrimitives addObject:drawArc0030];

    MWDrawLine *drawLine0109 = [[MWDrawLine alloc] init];
    drawLine0109.startPoint = CGPointMake(2685, 1357);
    drawLine0109.endPoint = CGPointMake(2755, 1427);
    drawLine0109.width = 11;
    drawLine0109.color = line0005.color;
    [haul0080.drawPrimitives addObject:drawLine0109];

    // Добавляем станцию Gare du Nord
    MWStation *station0085 = [[MWStation alloc] init];
    station0085.identifier = @"station0085";
    [edge0037.elements addObject:station0085];
    
    station0085.nameOriginal = @"Gare du Nord";
    station0085.mapLocation = CGPointMake(2755, 1427);
    station0085.geoLocation = CGPointMake(48.880556, 2.355);
    
    MWDrawFillCircle *fillCircle0095 = [[MWDrawFillCircle alloc] init];
    fillCircle0095.center = station0085.mapLocation;
    fillCircle0095.radius = 3;
    fillCircle0095.fillColor = [UIColor whiteColor];
    [station0085.drawPrimitives addObject:fillCircle0095];

    MWDrawTextLine *drawTextLine0119 = [[MWDrawTextLine alloc] init];
    drawTextLine0119.text = station0085.nameOriginal;
    drawTextLine0119.fontName = @"Helvetica-Bold";
    drawTextLine0119.fontColor = [UIColor blackColor];
    drawTextLine0119.fontSize = 30;
    drawTextLine0119.kernSpacing = 1.3;
    drawTextLine0119.origin = CGPointMake(2459, 1408);
    [station0085.drawPrimitives addObject:drawTextLine0119];

    // Добавляем вершину
    edge0037.finishVertex = vertex0036;
    
    // Создаем участок линии Gare du Nord - Gare de l'Est
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0038 = [[MWEdge alloc] init];
    edge0038.identifier = @"edge0038";
    edge0038.developmentName = @"Ребро: Gare du Nord - Gare de l'Est";
    [self.edges addObject:edge0038];
    
    // Добавляем линию
    edge0038.line = line0005;
    
    // Добавляем вершину
    edge0038.startVertex = vertex0036;

    // Добавляем станцию Gare du Nord
    [edge0038.elements addObject:station0085];

    // Добавляем перегон
    MWHaul *haul0081 = [[MWHaul alloc] init];
    haul0081.identifier = @"haul0081";
    haul0081.length = 658;
    [edge0038.elements addObject:haul0081];
    
    MWDrawLine *drawLine0110 = [[MWDrawLine alloc] init];
    drawLine0110.startPoint = CGPointMake(2754.5, 1426.5);
    drawLine0110.endPoint = CGPointMake(2769.5, 1441.5);
    drawLine0110.width = 11;
    drawLine0110.color = line0005.color;
    [haul0080.drawPrimitives addObject:drawLine0110];

    MWDrawArc *drawArc0031 = [[MWDrawArc alloc] init];
    drawArc0031.center = CGPointMake(2747.5, 1462);
    drawArc0031.startDegrees = 315;
    drawArc0031.endDegrees = 0;
    drawArc0031.radius = 30;
    drawArc0031.width = 11;
    drawArc0031.color = line0005.color;
    [haul0081.drawPrimitives addObject:drawArc0031];

    MWDrawLine *drawLine0111 = [[MWDrawLine alloc] init];
    drawLine0111.startPoint = CGPointMake(2777.5, 1462);
    drawLine0111.endPoint = CGPointMake(2777.5, 1593);
    drawLine0111.width = 11;
    drawLine0111.color = line0005.color;
    [haul0081.drawPrimitives addObject:drawLine0111];

    MWDrawArc *drawArc0032 = [[MWDrawArc alloc] init];
    drawArc0032.center = CGPointMake(2747.5, 1592.5);
    drawArc0032.startDegrees = 0;
    drawArc0032.endDegrees = 14;
    drawArc0032.radius = 30;
    drawArc0032.width = 11;
    drawArc0032.color = line0005.color;
    [haul0081.drawPrimitives addObject:drawArc0032];

    // Добавляем станцию Gare de l'Est
    MWStation *station0086 = [[MWStation alloc] init];
    station0086.identifier = @"station0086";
    [edge0038.elements addObject:station0086];
    
    station0086.nameOriginal = @"Gare de l'Est";
    station0086.mapLocation = CGPointMake(2776.5, 1599.5);
    station0086.geoLocation = CGPointMake(48.876111, 2.358333);
    
    MWDrawFillCircle *fillCircle0096 = [[MWDrawFillCircle alloc] init];
    fillCircle0096.center = station0086.mapLocation;
    fillCircle0096.radius = 3;
    fillCircle0096.fillColor = [UIColor whiteColor];
    [station0086.drawPrimitives addObject:fillCircle0096];

    MWDrawTextLine *drawTextLine0120 = [[MWDrawTextLine alloc] init];
    drawTextLine0120.text = @"Gare";
    drawTextLine0120.fontName = @"Helvetica-Bold";
    drawTextLine0120.fontColor = [UIColor blackColor];
    drawTextLine0120.fontSize = 30;
    drawTextLine0120.kernSpacing = 1.2;
    drawTextLine0120.origin = CGPointMake(2814, 1609.5);
    [station0086.drawPrimitives addObject:drawTextLine0120];

    MWDrawTextLine *drawTextLine0121 = [[MWDrawTextLine alloc] init];
    drawTextLine0121.text = @"de l'Est";
    drawTextLine0121.fontName = @"Helvetica-Bold";
    drawTextLine0121.fontColor = [UIColor blackColor];
    drawTextLine0121.fontSize = 30;
    drawTextLine0121.kernSpacing = 0.8;
    drawTextLine0121.origin = CGPointMake(2814, 1643);
    [station0086.drawPrimitives addObject:drawTextLine0121];

    // Добавляем вершину
    edge0038.finishVertex = vertex0037;
    
    // Создаем участок линии Gare de l'Est - Strasbourg – Saint-Denis
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0039 = [[MWEdge alloc] init];
    edge0039.identifier = @"edge0039";
    edge0039.developmentName = @"Ребро: Gare de l'Est - Strasbourg – Saint-Denis";
    [self.edges addObject:edge0039];
    
    // Добавляем линию
    edge0039.line = line0005;
    
    // Добавляем вершину
    edge0039.startVertex = vertex0037;

    // Добавляем станцию Gare de l'Est
    [edge0039.elements addObject:station0086];

    // Добавляем перегон
    MWHaul *haul0082 = [[MWHaul alloc] init];
    haul0082.identifier = @"haul0082";
    haul0082.length = 443;
    [edge0039.elements addObject:haul0082];
    
    MWDrawArc *drawArc0033 = [[MWDrawArc alloc] init];
    drawArc0033.center = CGPointMake(2747.5, 1592.5);
    drawArc0033.startDegrees = 13.5;
    drawArc0033.endDegrees = 45;
    drawArc0033.radius = 30;
    drawArc0033.width = 11;
    drawArc0033.color = line0005.color;
    [haul0082.drawPrimitives addObject:drawArc0033];

    MWDrawLine *drawLine0112 = [[MWDrawLine alloc] init];
    drawLine0112.startPoint = CGPointMake(2769.5, 1613);
    drawLine0112.endPoint = CGPointMake(2668, 1714.5);
    drawLine0112.width = 11;
    drawLine0112.color = line0005.color;
    [haul0082.drawPrimitives addObject:drawLine0112];

    // Добавляем станцию Château d'Eau
    MWStation *station0087 = [[MWStation alloc] init];
    station0087.identifier = @"station0087";
    [edge0039.elements addObject:station0087];
    
    station0087.nameOriginal = @"Château d'Eau";
    station0087.mapLocation = CGPointMake(2668, 1714.5);
    station0087.geoLocation = CGPointMake(48.872778, 2.356111);

    MWDrawFillCircle *fillCircle0097 = [[MWDrawFillCircle alloc] init];
    fillCircle0097.center = station0087.mapLocation;
    fillCircle0097.radius = 12;
    fillCircle0097.fillColor = line0005.color;
    [station0087.drawPrimitives addObject:fillCircle0097];

    MWDrawTextLine *drawTextLine0122 = [[MWDrawTextLine alloc] init];
    drawTextLine0122.text = @"Château";
    drawTextLine0122.fontName = @"HelveticaNeue";
    drawTextLine0122.fontColor = [UIColor blackColor];
    drawTextLine0122.fontSize = 34;
    drawTextLine0122.kernSpacing = -0.9;
    drawTextLine0122.origin = CGPointMake(2679, 1717);
    [station0087.nameOriginalTextPrimitives addObject:drawTextLine0122];

    MWDrawTextLine *drawTextLine0123 = [[MWDrawTextLine alloc] init];
    drawTextLine0123.text = @"d'Eau";
    drawTextLine0123.fontName = @"HelveticaNeue";
    drawTextLine0123.fontColor = [UIColor blackColor];
    drawTextLine0123.fontSize = 34;
    drawTextLine0123.kernSpacing = -1.6;
    drawTextLine0123.origin = CGPointMake(2679, 1750);
    [station0087.nameOriginalTextPrimitives addObject:drawTextLine0123];

    // Добавляем перегон
    MWHaul *haul0083 = [[MWHaul alloc] init];
    haul0083.identifier = @"haul0083";
    haul0083.length = 361;
    [edge0039.elements addObject:haul0083];

    MWDrawLine *drawLine0113 = [[MWDrawLine alloc] init];
    drawLine0113.startPoint = CGPointMake(2668.5, 1714);
    drawLine0113.endPoint = CGPointMake(2630, 1752.5);
    drawLine0113.width = 11;
    drawLine0113.color = line0005.color;
    [haul0083.drawPrimitives addObject:drawLine0113];

    MWDrawArc *drawArc0034 = [[MWDrawArc alloc] init];
    drawArc0034.center = CGPointMake(2652, 1773);
    drawArc0034.startDegrees = 180;
    drawArc0034.endDegrees = 225;
    drawArc0034.radius = 30;
    drawArc0034.width = 11;
    drawArc0034.color = line0005.color;
    [haul0083.drawPrimitives addObject:drawArc0034];

    MWDrawLine *drawLine0114 = [[MWDrawLine alloc] init];
    drawLine0114.startPoint = CGPointMake(2622, 1773);
    drawLine0114.endPoint = CGPointMake(2622, 1911);
    drawLine0114.width = 11;
    drawLine0114.color = line0005.color;
    [haul0083.drawPrimitives addObject:drawLine0114];

    // Добавляем станцию Strasbourg – Saint-Denis
    MWStation *station0088 = [[MWStation alloc] init];
    station0088.identifier = @"station0088";
    [edge0039.elements addObject:station0088];
    
    station0088.nameOriginal = @"Strasbourg – Saint-Denis";
    station0088.mapLocation = CGPointMake(2622, 1911);
    station0088.geoLocation = CGPointMake(48.869722, 2.353889);
    
    MWDrawFillCircle *fillCircle0098 = [[MWDrawFillCircle alloc] init];
    fillCircle0098.center = station0088.mapLocation;
    fillCircle0098.radius = 3;
    fillCircle0098.fillColor = [UIColor whiteColor];
    [station0088.drawPrimitives addObject:fillCircle0098];

    MWDrawTextLine *drawTextLine0124 = [[MWDrawTextLine alloc] init];
    drawTextLine0124.text = @"Strasbourg";
    drawTextLine0124.fontName = @"HelveticaNeue";
    drawTextLine0124.fontColor = [UIColor blackColor];
    drawTextLine0124.fontSize = 34;
    drawTextLine0124.kernSpacing = -0.8;
    drawTextLine0124.origin = CGPointMake(2638, 1816);
    [station0088.nameOriginalTextPrimitives addObject:drawTextLine0124];

    MWDrawTextLine *drawTextLine0125 = [[MWDrawTextLine alloc] init];
    drawTextLine0125.text = @"Saint-Denis";
    drawTextLine0125.fontName = @"HelveticaNeue";
    drawTextLine0125.fontColor = [UIColor blackColor];
    drawTextLine0125.fontSize = 34;
    drawTextLine0125.kernSpacing = -0.6;
    drawTextLine0125.origin = CGPointMake(2638, 1849);
    [station0088.nameOriginalTextPrimitives addObject:drawTextLine0125];

    // Добавляем вершину
    edge0039.finishVertex = vertex0038;

    // Создаем участок линии Strasbourg – Saint-Denis - Réaumur – Sébastopol
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0040 = [[MWEdge alloc] init];
    edge0040.identifier = @"edge0040";
    edge0040.developmentName = @"Ребро: Strasbourg – Saint-Denis - Réaumur – Sébastopol";
    [self.edges addObject:edge0040];
    
    // Добавляем линию
    edge0040.line = line0005;
    
    // Добавляем вершину
    edge0040.startVertex = vertex0038;

    // Добавляем станцию Strasbourg – Saint-Denis
    [edge0040.elements addObject:station0087];

    // Добавляем перегон
    MWHaul *haul0084 = [[MWHaul alloc] init];
    haul0084.identifier = @"haul0084";
    haul0084.length = 376;
    [edge0040.elements addObject:haul0084];

    MWDrawLine *drawLine0115 = [[MWDrawLine alloc] init];
    drawLine0115.startPoint = CGPointMake(2622, 1910.5);
    drawLine0115.endPoint = CGPointMake(2622, 2152);
    drawLine0115.width = 11;
    drawLine0115.color = line0005.color;
    [haul0084.drawPrimitives addObject:drawLine0115];

    MWDrawArc *drawArc0035 = [[MWDrawArc alloc] init];
    drawArc0035.center = CGPointMake(2607, 2152);
    drawArc0035.startDegrees = 0;
    drawArc0035.endDegrees = 90;
    drawArc0035.radius = 15;
    drawArc0035.width = 11;
    drawArc0035.color = line0005.color;
    [haul0084.drawPrimitives addObject:drawArc0035];

    MWDrawLine *drawLine0116 = [[MWDrawLine alloc] init];
    drawLine0116.startPoint = CGPointMake(2607, 2167);
    drawLine0116.endPoint = CGPointMake(2522, 2167);
    drawLine0116.width = 11;
    drawLine0116.color = line0005.color;
    [haul0084.drawPrimitives addObject:drawLine0116];

    // Добавляем станцию Réaumur – Sébastopol
    MWStation *station0089 = [[MWStation alloc] init];
    station0089.identifier = @"station0089";
    [edge0040.elements addObject:station0089];
    
    station0089.nameOriginal = @"Réaumur – Sébastopol";
    station0089.mapLocation = CGPointMake(2522, 2167);
    station0089.geoLocation = CGPointMake(48.866111, 2.3525);
    
    MWDrawFillCircle *fillCircle0099 = [[MWDrawFillCircle alloc] init];
    fillCircle0099.center = station0089.mapLocation;
    fillCircle0099.radius = 3;
    fillCircle0099.fillColor = [UIColor whiteColor];
    [station0089.drawPrimitives addObject:fillCircle0099];

    station0089.showNameOnMap = false;
    [station0089.nameOriginalTextPrimitives addObject:drawTextLine0090];
    [station0089.nameOriginalTextPrimitives addObject:drawTextLine0091];
    
    // Добавляем вершину
    edge0040.finishVertex = vertex0028;
    
    // Создаем участок линии Réaumur – Sébastopol - Châtelet
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0041 = [[MWEdge alloc] init];
    edge0041.identifier = @"edge0041";
    edge0041.developmentName = @"Ребро: Réaumur – Sébastopol - Châtelet";
    [self.edges addObject:edge0041];
    
    // Добавляем линию
    edge0041.line = line0005;
    
    // Добавляем вершину
    edge0041.startVertex = vertex0028;

    // Добавляем станцию Réaumur – Sébastopol
    [edge0041.elements addObject:station0088];

    // Добавляем перегон
    MWHaul *haul0085 = [[MWHaul alloc] init];
    haul0085.identifier = @"haul0085";
    haul0085.length = 410;
    [edge0041.elements addObject:haul0085];

    MWDrawLine *drawLine0117 = [[MWDrawLine alloc] init];
    drawLine0117.startPoint = CGPointMake(2522.5, 2167);
    drawLine0117.endPoint = CGPointMake(2381, 2167);
    drawLine0117.width = 11;
    drawLine0117.color = line0005.color;
    [haul0085.drawPrimitives addObject:drawLine0117];

    MWDrawArc *drawArc0036 = [[MWDrawArc alloc] init];
    drawArc0036.center = CGPointMake(2381, 2182);
    drawArc0036.startDegrees = 180;
    drawArc0036.endDegrees = 270;
    drawArc0036.radius = 15;
    drawArc0036.width = 11;
    drawArc0036.color = line0005.color;
    [haul0085.drawPrimitives addObject:drawArc0036];

    MWDrawLine *drawLine0118 = [[MWDrawLine alloc] init];
    drawLine0118.startPoint = CGPointMake(2366, 2182);
    drawLine0118.endPoint = CGPointMake(2366, 2189);
    drawLine0118.width = 11;
    drawLine0118.color = line0005.color;
    [haul0085.drawPrimitives addObject:drawLine0118];

    // Добавляем станцию Étienne Marcel
    MWStation *station0090 = [[MWStation alloc] init];
    station0090.identifier = @"station0090";
    [edge0041.elements addObject:station0090];
    
    station0090.nameOriginal = @"Étienne Marcel";
    station0090.mapLocation = CGPointMake(2366, 2189);
    station0090.geoLocation = CGPointMake(48.864167, 2.350556);

    MWDrawFillCircle *fillCircle0100 = [[MWDrawFillCircle alloc] init];
    fillCircle0100.center = station0090.mapLocation;
    fillCircle0100.radius = 12;
    fillCircle0100.fillColor = line0005.color;
    [station0090.drawPrimitives addObject:fillCircle0100];

    MWDrawTextLine *drawTextLine0126 = [[MWDrawTextLine alloc] init];
    drawTextLine0126.text = @"Étienne";
    drawTextLine0126.fontName = @"HelveticaNeue";
    drawTextLine0126.fontColor = [UIColor blackColor];
    drawTextLine0126.fontSize = 34;
    drawTextLine0126.kernSpacing = 0.3;
    drawTextLine0126.origin = CGPointMake(2231, 2167);
    [station0090.nameOriginalTextPrimitives addObject:drawTextLine0126];

    MWDrawTextLine *drawTextLine0127 = [[MWDrawTextLine alloc] init];
    drawTextLine0127.text = @"Marcel";
    drawTextLine0127.fontName = @"HelveticaNeue";
    drawTextLine0127.fontColor = [UIColor blackColor];
    drawTextLine0127.fontSize = 34;
    drawTextLine0127.kernSpacing = 0.0;
    drawTextLine0127.origin = CGPointMake(2245, 2201);
    [station0090.nameOriginalTextPrimitives addObject:drawTextLine0127];

    // Добавляем перегон
    MWHaul *haul0086 = [[MWHaul alloc] init];
    haul0086.identifier = @"haul0086";
    haul0086.length = 317;
    [edge0041.elements addObject:haul0086];

    MWDrawLine *drawLine0119 = [[MWDrawLine alloc] init];
    drawLine0119.startPoint = CGPointMake(2366, 2188.5);
    drawLine0119.endPoint = CGPointMake(2366, 2272.5);
    drawLine0119.width = 11;
    drawLine0119.color = line0005.color;
    [haul0086.drawPrimitives addObject:drawLine0119];

    // Добавляем станцию Les Halles
    MWStation *station0091 = [[MWStation alloc] init];
    station0091.identifier = @"station0091";
    [edge0041.elements addObject:station0091];
    
    station0091.nameOriginal = @"Les Halles";
    station0091.mapLocation = CGPointMake(2366, 2272.5);
    station0091.geoLocation = CGPointMake(48.8625, 2.34611);

    MWDrawFillCircle *fillCircle0101 = [[MWDrawFillCircle alloc] init];
    fillCircle0101.center = station0091.mapLocation;
    fillCircle0101.radius = 13;
    fillCircle0101.fillColor = [UIColor blackColor];
    [station0091.drawPrimitives addObject:fillCircle0101];

    MWDrawFillCircle *fillCircle0695 = [[MWDrawFillCircle alloc] init];
    fillCircle0695.center = station0091.mapLocation;
    fillCircle0695.radius = 11;
    fillCircle0695.fillColor = [UIColor whiteColor];
    [station0091.drawPrimitives addObject:fillCircle0695];

    MWDrawTextLine *drawTextLine0128 = [[MWDrawTextLine alloc] init];
    drawTextLine0128.text = station0091.nameOriginal;
    drawTextLine0128.fontName = @"HelveticaNeue";
    drawTextLine0128.fontColor = [UIColor blackColor];
    drawTextLine0128.fontSize = 34;
    drawTextLine0128.kernSpacing = -0.8;
    drawTextLine0128.origin = CGPointMake(2176, 2251);
    [station0091.nameOriginalTextPrimitives addObject:drawTextLine0128];

    // Добавляем перегон
    MWHaul *haul0087 = [[MWHaul alloc] init];
    haul0087.identifier = @"haul0087";
    haul0087.length = 453;
    [edge0041.elements addObject:haul0087];

    MWDrawLine *drawLine0120 = [[MWDrawLine alloc] init];
    drawLine0120.startPoint = CGPointMake(2366, 2272);
    drawLine0120.endPoint = CGPointMake(2366, 2361.5);
    drawLine0120.width = 11;
    drawLine0120.color = line0005.color;
    [haul0087.drawPrimitives addObject:drawLine0120];

    // Добавляем станцию Châtelet
    MWStation *station0092 = [[MWStation alloc] init];
    station0092.identifier = @"station0092";
    [edge0041.elements addObject:station0092];
    
    station0092.nameOriginal = @"Châtelet";
    station0092.mapLocation = CGPointMake(2366, 2361.5);
    station0092.geoLocation = CGPointMake(48.858352, 2.347324);

    MWDrawFillCircle *fillCircle0102 = [[MWDrawFillCircle alloc] init];
    fillCircle0102.center = station0092.mapLocation;
    fillCircle0102.radius = 3;
    fillCircle0102.fillColor = [UIColor whiteColor];
    [station0092.drawPrimitives addObject:fillCircle0102];

    station0092.showNameOnMap = false;
    [station0092.nameOriginalTextPrimitives addObject:drawTextLine0026];

    // Добавляем вершину
    edge0041.finishVertex = vertex0007;

    // Создаем участок линии Châtelet - Odéon
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0042 = [[MWEdge alloc] init];
    edge0042.identifier = @"edge0042";
    edge0042.developmentName = @"Ребро: Châtelet - Odéon";
    [self.edges addObject:edge0042];
    
    // Добавляем линию
    edge0042.line = line0005;
    
    // Добавляем вершину
    edge0042.startVertex = vertex0007;

    // Добавляем станцию Châtelet
    [edge0042.elements addObject:station0091];

    // Добавляем перегон
    MWHaul *haul0088 = [[MWHaul alloc] init];
    haul0088.identifier = @"haul0088";
    haul0088.length = 355;
    [edge0042.elements addObject:haul0088];
    
    MWDrawLine *drawLine0121 = [[MWDrawLine alloc] init];
    drawLine0121.startPoint = CGPointMake(2366, 2361);
    drawLine0121.endPoint = CGPointMake(2366, 2410.5);
    drawLine0121.width = 11;
    drawLine0121.color = line0005.color;
    [haul0088.drawPrimitives addObject:drawLine0121];

    MWDrawArc *drawArc0037 = [[MWDrawArc alloc] init];
    drawArc0037.center = CGPointMake(2336, 2410);
    drawArc0037.startDegrees = 0;
    drawArc0037.endDegrees = 45;
    drawArc0037.radius = 30;
    drawArc0037.width = 11;
    drawArc0037.color = line0005.color;
    [haul0088.drawPrimitives addObject:drawArc0037];

    MWDrawLine *drawLine0122 = [[MWDrawLine alloc] init];
    drawLine0122.startPoint = CGPointMake(2358, 2430.5);
    drawLine0122.endPoint = CGPointMake(2296.5, 2492);
    drawLine0122.width = 11;
    drawLine0122.color = line0005.color;
    [haul0088.drawPrimitives addObject:drawLine0122];

    // Добавляем станцию Cité
    MWStation *station0093 = [[MWStation alloc] init];
    station0093.identifier = @"station0093";
    [edge0042.elements addObject:station0093];
    
    station0093.nameOriginal = @"Cité";
    station0093.mapLocation = CGPointMake(2296.5, 2492);
    station0093.geoLocation = CGPointMake(48.855278, 2.346389);

    MWDrawFillCircle *fillCircle0103 = [[MWDrawFillCircle alloc] init];
    fillCircle0103.center = station0093.mapLocation;
    fillCircle0103.radius = 12;
    fillCircle0103.fillColor = line0005.color;
    [station0093.drawPrimitives addObject:fillCircle0103];

    MWDrawTextLine *drawTextLine0129 = [[MWDrawTextLine alloc] init];
    drawTextLine0129.text = station0093.nameOriginal;
    drawTextLine0129.fontName = @"HelveticaNeue";
    drawTextLine0129.fontColor = [UIColor blackColor];
    drawTextLine0129.fontSize = 34;
    drawTextLine0129.kernSpacing = -0.6;
    drawTextLine0129.origin = CGPointMake(2217, 2446);
    [station0093.nameOriginalTextPrimitives addObject:drawTextLine0129];

    // Добавляем перегон
    MWHaul *haul0089 = [[MWHaul alloc] init];
    haul0089.identifier = @"haul0089";
    haul0089.length = 388;
    [edge0042.elements addObject:haul0089];

    MWDrawLine *drawLine0123 = [[MWDrawLine alloc] init];
    drawLine0123.startPoint = CGPointMake(2297, 2491.5);
    drawLine0123.endPoint = CGPointMake(2246, 2542.5);
    drawLine0123.width = 11;
    drawLine0123.color = line0005.color;
    [haul0089.drawPrimitives addObject:drawLine0123];

    MWDrawArc *drawArc0038 = [[MWDrawArc alloc] init];
    drawArc0038.center = CGPointMake(2268, 2563);
    drawArc0038.startDegrees = 180;
    drawArc0038.endDegrees = 225;
    drawArc0038.radius = 30;
    drawArc0038.width = 11;
    drawArc0038.color = line0005.color;
    [haul0089.drawPrimitives addObject:drawArc0038];

    MWDrawLine *drawLine0124 = [[MWDrawLine alloc] init];
    drawLine0124.startPoint = CGPointMake(2238, 2563);
    drawLine0124.endPoint = CGPointMake(2238, 2655);
    drawLine0124.width = 11;
    drawLine0124.color = line0005.color;
    [haul0089.drawPrimitives addObject:drawLine0124];

    // Добавляем станцию Saint-Michel
    MWStation *station0094 = [[MWStation alloc] init];
    station0094.identifier = @"station0094";
    [edge0042.elements addObject:station0094];
    
    station0094.nameOriginal = @"Saint-Michel";
    station0094.mapLocation = CGPointMake(2238, 2655);
    station0094.geoLocation = CGPointMake(48.853611, 2.343889);

    MWDrawFillCircle *fillCircle0104 = [[MWDrawFillCircle alloc] init];
    fillCircle0104.center = station0094.mapLocation;
    fillCircle0104.radius = 13;
    fillCircle0104.fillColor = [UIColor blackColor];
    [station0094.drawPrimitives addObject:fillCircle0104];

    MWDrawFillCircle *fillCircle0696 = [[MWDrawFillCircle alloc] init];
    fillCircle0696.center = station0094.mapLocation;
    fillCircle0696.radius = 11;
    fillCircle0696.fillColor = [UIColor whiteColor];
    [station0094.drawPrimitives addObject:fillCircle0696];

    MWDrawTextLine *drawTextLine0130 = [[MWDrawTextLine alloc] init];
    drawTextLine0130.text = @"St-Michel";
    drawTextLine0130.fontName = @"HelveticaNeue";
    drawTextLine0130.fontColor = [UIColor blackColor];
    drawTextLine0130.fontSize = 34;
    drawTextLine0130.kernSpacing = -0.8;
    drawTextLine0130.origin = CGPointMake(2080, 2635);
    [station0094.nameOriginalTextPrimitives addObject:drawTextLine0130];

    // Добавляем перегон
    MWHaul *haul0090 = [[MWHaul alloc] init];
    haul0090.identifier = @"haul0090";
    haul0090.length = 295;
    [edge0042.elements addObject:haul0090];

    MWDrawLine *drawLine0125 = [[MWDrawLine alloc] init];
    drawLine0125.startPoint = CGPointMake(2238, 2654.5);
    drawLine0125.endPoint = CGPointMake(2238, 2713);
    drawLine0125.width = 11;
    drawLine0125.color = line0005.color;
    [haul0090.drawPrimitives addObject:drawLine0125];

    MWDrawArc *drawArc0039 = [[MWDrawArc alloc] init];
    drawArc0039.center = CGPointMake(2223, 2713);
    drawArc0039.startDegrees = 0;
    drawArc0039.endDegrees = 90;
    drawArc0039.radius = 15;
    drawArc0039.width = 11;
    drawArc0039.color = line0005.color;
    [haul0090.drawPrimitives addObject:drawArc0039];

    MWDrawLine *drawLine0126 = [[MWDrawLine alloc] init];
    drawLine0126.startPoint = CGPointMake(2223, 2728);
    drawLine0126.endPoint = CGPointMake(2204.5, 2728);
    drawLine0126.width = 11;
    drawLine0126.color = line0005.color;
    [haul0090.drawPrimitives addObject:drawLine0126];

    // Добавляем станцию Odéon
    MWStation *station0095 = [[MWStation alloc] init];
    station0095.identifier = @"station0095";
    [edge0042.elements addObject:station0095];
    
    station0095.nameOriginal = @"Odéon";
    station0095.mapLocation = CGPointMake(2204.5, 2728);
    station0095.geoLocation = CGPointMake(48.851944, 2.338889);

    MWDrawFillCircle *fillCircle0105 = [[MWDrawFillCircle alloc] init];
    fillCircle0105.center = station0095.mapLocation;
    fillCircle0105.radius = 3;
    fillCircle0105.fillColor = [UIColor whiteColor];
    [station0095.drawPrimitives addObject:fillCircle0105];

    MWDrawTextLine *drawTextLine0131 = [[MWDrawTextLine alloc] init];
    drawTextLine0131.text = station0095.nameOriginal;
    drawTextLine0131.fontName = @"HelveticaNeue";
    drawTextLine0131.fontColor = [UIColor blackColor];
    drawTextLine0131.fontSize = 34;
    drawTextLine0131.kernSpacing = -1.0;
    drawTextLine0131.origin = CGPointMake(2153, 2762);
    [station0095.nameOriginalTextPrimitives addObject:drawTextLine0131];

    // Добавляем вершину
    edge0042.finishVertex = vertex0039;
    
    // Создаем участок линии Odéon - Montparnasse – Bienvenüe
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0043 = [[MWEdge alloc] init];
    edge0043.identifier = @"edge0043";
    edge0043.developmentName = @"Ребро: Odéon - Montparnasse – Bienvenüe";
    [self.edges addObject:edge0043];
    
    // Добавляем линию
    edge0043.line = line0005;
    
    // Добавляем вершину
    edge0043.startVertex = vertex0039;

    // Добавляем станцию Odéon
    [edge0043.elements addObject:station0094];

    // Добавляем перегон
    MWHaul *haul0091 = [[MWHaul alloc] init];
    haul0091.identifier = @"haul0091";
    haul0091.length = 475;
    [edge0043.elements addObject:haul0091];

    MWDrawLine *drawLine0127 = [[MWDrawLine alloc] init];
    drawLine0127.startPoint = CGPointMake(2205, 2728);
    drawLine0127.endPoint = CGPointMake(2021, 2728);
    drawLine0127.width = 11;
    drawLine0127.color = line0005.color;
    [haul0091.drawPrimitives addObject:drawLine0127];

    // Добавляем станцию Saint-Germain-des-Prés
    MWStation *station0096 = [[MWStation alloc] init];
    station0096.identifier = @"station0096";
    [edge0043.elements addObject:station0096];
    
    station0096.nameOriginal = @"Saint-Germain-des-Prés";
    station0096.mapLocation = CGPointMake(2021, 2728);
    station0096.geoLocation = CGPointMake(48.853889, 2.333333);

    MWDrawFillCircle *fillCircle0106 = [[MWDrawFillCircle alloc] init];
    fillCircle0106.center = station0096.mapLocation;
    fillCircle0106.radius = 12;
    fillCircle0106.fillColor = line0005.color;
    [station0096.drawPrimitives addObject:fillCircle0106];

    MWDrawTextLine *drawTextLine0132 = [[MWDrawTextLine alloc] init];
    drawTextLine0132.text = @"Saint";
    drawTextLine0132.fontName = @"HelveticaNeue";
    drawTextLine0132.fontColor = [UIColor blackColor];
    drawTextLine0132.fontSize = 34;
    drawTextLine0132.kernSpacing = -0.6;
    drawTextLine0132.origin = CGPointMake(1952, 2607);
    [station0096.nameOriginalTextPrimitives addObject:drawTextLine0132];

    MWDrawTextLine *drawTextLine0133 = [[MWDrawTextLine alloc] init];
    drawTextLine0133.text = @"Germain";
    drawTextLine0133.fontName = @"HelveticaNeue";
    drawTextLine0133.fontColor = [UIColor blackColor];
    drawTextLine0133.fontSize = 34;
    drawTextLine0133.kernSpacing = -0.0;
    drawTextLine0133.origin = CGPointMake(1899, 2640);
    [station0096.nameOriginalTextPrimitives addObject:drawTextLine0133];

    MWDrawTextLine *drawTextLine0134 = [[MWDrawTextLine alloc] init];
    drawTextLine0134.text = @"des-Prés";
    drawTextLine0134.fontName = @"HelveticaNeue";
    drawTextLine0134.fontColor = [UIColor blackColor];
    drawTextLine0134.fontSize = 34;
    drawTextLine0134.kernSpacing = -1.8;
    drawTextLine0134.origin = CGPointMake(1904, 2673);
    [station0096.nameOriginalTextPrimitives addObject:drawTextLine0134];

    // Добавляем перегон
    MWHaul *haul0092 = [[MWHaul alloc] init];
    haul0092.identifier = @"haul0092";
    haul0092.length = 348;
    [edge0043.elements addObject:haul0092];

    MWDrawLine *drawLine0128 = [[MWDrawLine alloc] init];
    drawLine0128.startPoint = CGPointMake(2021.5, 2728);
    drawLine0128.endPoint = CGPointMake(1986, 2728);
    drawLine0128.width = 11;
    drawLine0128.color = line0005.color;
    [haul0092.drawPrimitives addObject:drawLine0128];

    MWDrawArc *drawArc0040 = [[MWDrawArc alloc] init];
    drawArc0040.center = CGPointMake(1986, 2743);
    drawArc0040.startDegrees = 180;
    drawArc0040.endDegrees = 270;
    drawArc0040.radius = 15;
    drawArc0040.width = 11;
    drawArc0040.color = line0005.color;
    [haul0092.drawPrimitives addObject:drawArc0040];

    MWDrawLine *drawLine0129 = [[MWDrawLine alloc] init];
    drawLine0129.startPoint = CGPointMake(1971, 2743);
    drawLine0129.endPoint = CGPointMake(1971, 2846.5);
    drawLine0129.width = 11;
    drawLine0129.color = line0005.color;
    [haul0092.drawPrimitives addObject:drawLine0129];

    // Добавляем станцию Saint-Sulpice
    MWStation *station0097 = [[MWStation alloc] init];
    station0097.identifier = @"station0097";
    [edge0043.elements addObject:station0097];
    
    station0097.nameOriginal = @"Saint-Sulpice";
    station0097.mapLocation = CGPointMake(1971, 2846.5);
    station0097.geoLocation = CGPointMake(48.850909, 2.330652);

    MWDrawFillCircle *fillCircle0107 = [[MWDrawFillCircle alloc] init];
    fillCircle0107.center = station0097.mapLocation;
    fillCircle0107.radius = 12;
    fillCircle0107.fillColor = line0005.color;
    [station0097.drawPrimitives addObject:fillCircle0107];

    MWDrawTextLine *drawTextLine0135 = [[MWDrawTextLine alloc] init];
    drawTextLine0135.text = station0097.nameOriginal;
    drawTextLine0135.fontName = @"HelveticaNeue";
    drawTextLine0135.fontColor = [UIColor blackColor];
    drawTextLine0135.fontSize = 34;
    drawTextLine0135.kernSpacing = -1.0;
    drawTextLine0135.origin = CGPointMake(1990, 2824);
    [station0097.nameOriginalTextPrimitives addObject:drawTextLine0135];

    // Добавляем перегон
    MWHaul *haul0093 = [[MWHaul alloc] init];
    haul0093.identifier = @"haul0093";
    haul0093.length = 609;
    [edge0043.elements addObject:haul0093];

    MWDrawLine *drawLine0130 = [[MWDrawLine alloc] init];
    drawLine0130.startPoint = CGPointMake(1971, 2846);
    drawLine0130.endPoint = CGPointMake(1971, 2990);
    drawLine0130.width = 11;
    drawLine0130.color = line0005.color;
    [haul0093.drawPrimitives addObject:drawLine0130];

    // Добавляем станцию Saint-Placide
    MWStation *station0098 = [[MWStation alloc] init];
    station0098.identifier = @"station0098";
    [edge0043.elements addObject:station0098];
    
    station0098.nameOriginal = @"Saint-Placide";
    station0098.mapLocation = CGPointMake(1971, 2990);
    station0098.geoLocation = CGPointMake(48.846844, 2.326914);

    MWDrawFillCircle *fillCircle0108 = [[MWDrawFillCircle alloc] init];
    fillCircle0108.center = station0098.mapLocation;
    fillCircle0108.radius = 12;
    fillCircle0108.fillColor = line0005.color;
    [station0098.drawPrimitives addObject:fillCircle0108];

    MWDrawTextLine *drawTextLine0136 = [[MWDrawTextLine alloc] init];
    drawTextLine0136.text = @"St-Placide";
    drawTextLine0136.fontName = @"HelveticaNeue";
    drawTextLine0136.fontColor = [UIColor blackColor];
    drawTextLine0136.fontSize = 34;
    drawTextLine0136.kernSpacing = -1.3;
    drawTextLine0136.origin = CGPointMake(1800, 2954);
    [station0098.nameOriginalTextPrimitives addObject:drawTextLine0136];

    // Добавляем перегон
    MWHaul *haul0094 = [[MWHaul alloc] init];
    haul0094.identifier = @"haul0094";
    haul0094.length = 415;
    [edge0043.elements addObject:haul0094];
    
    MWDrawLine *drawLine0131 = [[MWDrawLine alloc] init];
    drawLine0131.startPoint = CGPointMake(1971, 2989.5);
    drawLine0131.endPoint = CGPointMake(1971, 3123.5);
    drawLine0131.width = 11;
    drawLine0131.color = line0005.color;
    [haul0094.drawPrimitives addObject:drawLine0131];

    // Добавляем станцию Montparnasse – Bienvenüe
    MWStation *station0099 = [[MWStation alloc] init];
    station0099.identifier = @"station0099";
    [edge0043.elements addObject:station0099];
    
    station0099.nameOriginal = @"Montparnasse – Bienvenüe";
    station0099.mapLocation = CGPointMake(1971, 3123.5);
    station0099.geoLocation = CGPointMake(48.843466, 2.323072);

    MWDrawFillCircle *fillCircle0109 = [[MWDrawFillCircle alloc] init];
    fillCircle0109.center = station0099.mapLocation;
    fillCircle0109.radius = 3;
    fillCircle0109.fillColor = [UIColor whiteColor];
    [station0099.drawPrimitives addObject:fillCircle0109];

    MWDrawTextLine *drawTextLine0137 = [[MWDrawTextLine alloc] init];
    drawTextLine0137.text = @"Montparnasse";
    drawTextLine0137.fontName = @"HelveticaNeue";
    drawTextLine0137.fontColor = [UIColor blackColor];
    drawTextLine0137.fontSize = 34;
    drawTextLine0137.kernSpacing = -0.6;
    drawTextLine0137.origin = CGPointMake(1736, 3046);
    [station0099.nameOriginalTextPrimitives addObject:drawTextLine0137];

    MWDrawTextLine *drawTextLine0138 = [[MWDrawTextLine alloc] init];
    drawTextLine0138.text = @"Bienvenüe";
    drawTextLine0138.fontName = @"HelveticaNeue";
    drawTextLine0138.fontColor = [UIColor blackColor];
    drawTextLine0138.fontSize = 34;
    drawTextLine0138.kernSpacing = -0.2;
    drawTextLine0138.origin = CGPointMake(1788, 3079);
    [station0099.nameOriginalTextPrimitives addObject:drawTextLine0138];

    // Добавляем вершину
    edge0043.finishVertex = vertex0040;

    // Создаем участок линии Montparnasse – Bienvenüe - Raspail
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0044 = [[MWEdge alloc] init];
    edge0044.identifier = @"edge0044";
    edge0044.developmentName = @"Ребро: Montparnasse – Bienvenüe - Raspail";
    [self.edges addObject:edge0044];
    
    // Добавляем линию
    edge0044.line = line0005;
    
    // Добавляем вершину
    edge0044.startVertex = vertex0040;

    // Добавляем станцию Montparnasse – Bienvenüe
    [edge0044.elements addObject:station0098];

    // Добавляем перегон
    MWHaul *haul0095 = [[MWHaul alloc] init];
    haul0095.identifier = @"haul0095";
    haul0095.length = 371;
    [edge0044.elements addObject:haul0095];

    MWDrawLine *drawLine0132 = [[MWDrawLine alloc] init];
    drawLine0132.startPoint = CGPointMake(1971, 3123);
    drawLine0132.endPoint = CGPointMake(1971, 3131);
    drawLine0132.width = 11;
    drawLine0132.color = line0005.color;
    [haul0095.drawPrimitives addObject:drawLine0132];

    MWDrawArc *drawArc0041 = [[MWDrawArc alloc] init];
    drawArc0041.center = CGPointMake(1986, 3131);
    drawArc0041.startDegrees = 90;
    drawArc0041.endDegrees = 180;
    drawArc0041.radius = 15;
    drawArc0041.width = 11;
    drawArc0041.color = line0005.color;
    [haul0095.drawPrimitives addObject:drawArc0041];

    MWDrawLine *drawLine0133 = [[MWDrawLine alloc] init];
    drawLine0133.startPoint = CGPointMake(1986, 3146);
    drawLine0133.endPoint = CGPointMake(2101.5, 3146);
    drawLine0133.width = 11;
    drawLine0133.color = line0005.color;
    [haul0095.drawPrimitives addObject:drawLine0133];

    // Добавляем станцию Vavin
    MWStation *station0100 = [[MWStation alloc] init];
    station0100.identifier = @"station0100";
    [edge0044.elements addObject:station0100];
    
    station0100.nameOriginal = @"Vavin";
    station0100.mapLocation = CGPointMake(2101.5, 3146);
    station0100.geoLocation = CGPointMake(48.842233, 2.32895);

    MWDrawFillCircle *fillCircle0110 = [[MWDrawFillCircle alloc] init];
    fillCircle0110.center = station0100.mapLocation;
    fillCircle0110.radius = 12;
    fillCircle0110.fillColor = line0005.color;
    [station0100.drawPrimitives addObject:fillCircle0110];

    MWDrawTextLine *drawTextLine0139 = [[MWDrawTextLine alloc] init];
    drawTextLine0139.text = station0100.nameOriginal;
    drawTextLine0139.fontName = @"HelveticaNeue";
    drawTextLine0139.fontColor = [UIColor blackColor];
    drawTextLine0139.fontSize = 34;
    drawTextLine0139.kernSpacing = -0.2;
    drawTextLine0139.origin = CGPointMake(2062, 3091);
    [station0100.nameOriginalTextPrimitives addObject:drawTextLine0139];

    // Добавляем перегон
    MWHaul *haul0096 = [[MWHaul alloc] init];
    haul0096.identifier = @"haul0096";
    haul0096.length = 394;
    [edge0044.elements addObject:haul0096];

    MWDrawLine *drawLine0134 = [[MWDrawLine alloc] init];
    drawLine0134.startPoint = CGPointMake(2101, 3146);
    drawLine0134.endPoint = CGPointMake(2152, 3146);
    drawLine0134.width = 11;
    drawLine0134.color = line0005.color;
    [haul0096.drawPrimitives addObject:drawLine0134];

    MWDrawArc *drawArc0042 = [[MWDrawArc alloc] init];
    drawArc0042.center = CGPointMake(2151.5, 3176);
    drawArc0042.startDegrees = 270;
    drawArc0042.endDegrees = 315;
    drawArc0042.radius = 30;
    drawArc0042.width = 11;
    drawArc0042.color = line0005.color;
    [haul0096.drawPrimitives addObject:drawArc0042];

    MWDrawLine *drawLine0135 = [[MWDrawLine alloc] init];
    drawLine0135.startPoint = CGPointMake(2172.5, 3154.5);
    drawLine0135.endPoint = CGPointMake(2216, 3198);
    drawLine0135.width = 11;
    drawLine0135.color = line0005.color;
    [haul0096.drawPrimitives addObject:drawLine0135];

    // Добавляем станцию Raspail
    MWStation *station0101 = [[MWStation alloc] init];
    station0101.identifier = @"station0101";
    [edge0044.elements addObject:station0101];
    
    station0101.nameOriginal = @"Raspail";
    station0101.mapLocation = CGPointMake(2216, 3198);
    station0101.geoLocation = CGPointMake(48.839194, 2.330606);

    MWDrawFillCircle *fillCircle0111 = [[MWDrawFillCircle alloc] init];
    fillCircle0111.center = station0101.mapLocation;
    fillCircle0111.radius = 3;
    fillCircle0111.fillColor = [UIColor whiteColor];
    [station0101.drawPrimitives addObject:fillCircle0111];

    MWDrawTextLine *drawTextLine0140 = [[MWDrawTextLine alloc] init];
    drawTextLine0140.text = station0101.nameOriginal;
    drawTextLine0140.fontName = @"HelveticaNeue";
    drawTextLine0140.fontColor = [UIColor blackColor];
    drawTextLine0140.fontSize = 34;
    drawTextLine0140.kernSpacing = -0.5;
    drawTextLine0140.origin = CGPointMake(2104, 3227.5);
    [station0101.nameOriginalTextPrimitives addObject:drawTextLine0140];

    // Добавляем вершину
    edge0044.finishVertex = vertex0041;

    // Создаем участок линии Raspail - Denfert-Rochereau
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0045 = [[MWEdge alloc] init];
    edge0045.identifier = @"edge0045";
    edge0045.developmentName = @"Ребро: Raspail - Denfert-Rochereau";
    [self.edges addObject:edge0045];
    
    // Добавляем линию
    edge0045.line = line0005;
    
    // Добавляем вершину
    edge0045.startVertex = vertex0041;

    // Добавляем станцию Raspail
    [edge0045.elements addObject:station0100];

    // Добавляем перегон
    MWHaul *haul0097 = [[MWHaul alloc] init];
    haul0097.identifier = @"haul0097";
    haul0097.length = 589;
    [edge0045.elements addObject:haul0097];

    MWDrawLine *drawLine0136 = [[MWDrawLine alloc] init];
    drawLine0136.startPoint = CGPointMake(2215.5, 3197.5);
    drawLine0136.endPoint = CGPointMake(2263.5, 3245.5);
    drawLine0136.width = 11;
    drawLine0136.color = line0005.color;
    [haul0097.drawPrimitives addObject:drawLine0136];

    MWDrawArc *drawArc0043 = [[MWDrawArc alloc] init];
    drawArc0043.center = CGPointMake(2241.5, 3266);
    drawArc0043.startDegrees = 315;
    drawArc0043.endDegrees = 0;
    drawArc0043.radius = 30;
    drawArc0043.width = 11;
    drawArc0043.color = line0005.color;
    [haul0097.drawPrimitives addObject:drawArc0043];

    MWDrawLine *drawLine0137 = [[MWDrawLine alloc] init];
    drawLine0137.startPoint = CGPointMake(2271.5, 3265);
    drawLine0137.endPoint = CGPointMake(2271.5, 3285);
    drawLine0137.width = 11;
    drawLine0137.color = line0005.color;
    [haul0097.drawPrimitives addObject:drawLine0137];

    // Добавляем станцию Denfert-Rochereau
    MWStation *station0102 = [[MWStation alloc] init];
    station0102.identifier = @"station0102";
    [edge0045.elements addObject:station0102];
    
    station0102.nameOriginal = @"Denfert-Rochereau";
    station0102.mapLocation = CGPointMake(2271.5, 3285);
    station0102.geoLocation = CGPointMake(48.833901, 2.332728);

    MWDrawFillCircle *fillCircle0112 = [[MWDrawFillCircle alloc] init];
    fillCircle0112.center = station0102.mapLocation;
    fillCircle0112.radius = 3;
    fillCircle0112.fillColor = [UIColor whiteColor];
    [station0102.drawPrimitives addObject:fillCircle0112];

    MWDrawTextLine *drawTextLine0141 = [[MWDrawTextLine alloc] init];
    drawTextLine0141.text = @"Denfert";
    drawTextLine0141.fontName = @"HelveticaNeue";
    drawTextLine0141.fontColor = [UIColor blackColor];
    drawTextLine0141.fontSize = 34;
    drawTextLine0141.kernSpacing = 0.6;
    drawTextLine0141.origin = CGPointMake(2313.5, 3241);
    [station0102.nameOriginalTextPrimitives addObject:drawTextLine0141];

    MWDrawTextLine *drawTextLine0142 = [[MWDrawTextLine alloc] init];
    drawTextLine0142.text = @"Rochereau";
    drawTextLine0142.fontName = @"HelveticaNeue";
    drawTextLine0142.fontColor = [UIColor blackColor];
    drawTextLine0142.fontSize = 34;
    drawTextLine0142.kernSpacing = -0.9;
    drawTextLine0142.origin = CGPointMake(2313.5, 3274);
    [station0102.nameOriginalTextPrimitives addObject:drawTextLine0142];

    // Добавляем вершину
    edge0045.finishVertex = vertex0042;

    // Создаем участок линии Denfert-Rochereau - Mairie de Montrouge
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0046 = [[MWEdge alloc] init];
    edge0046.identifier = @"edge0046";
    edge0046.developmentName = @"Ребро: Denfert-Rochereau - Mairie de Montrouge";
    [self.edges addObject:edge0046];
    
    // Добавляем линию
    edge0046.line = line0005;
    
    // Добавляем вершину
    edge0046.startVertex = vertex0042;

    // Добавляем станцию Denfert-Rochereau
    [edge0046.elements addObject:station0101];

    // Добавляем перегон
    MWHaul *haul0098 = [[MWHaul alloc] init];
    haul0098.identifier = @"haul0098";
    haul0098.length = 341;
    [edge0046.elements addObject:haul0098];
    
    MWDrawLine *drawLine0138 = [[MWDrawLine alloc] init];
    drawLine0138.startPoint = CGPointMake(2271.5, 3284.5);
    drawLine0138.endPoint = CGPointMake(2271.5, 3424);
    drawLine0138.width = 11;
    drawLine0138.color = line0005.color;
    [haul0098.drawPrimitives addObject:drawLine0138];

    // Добавляем станцию Mouton-Duvernet
    MWStation *station0103 = [[MWStation alloc] init];
    station0103.identifier = @"station0103";
    [edge0046.elements addObject:station0103];
    
    station0103.nameOriginal = @"Mouton-Duvernet";
    station0103.mapLocation = CGPointMake(2271.5, 3424);
    station0103.geoLocation = CGPointMake(48.832139, 2.330325);

    MWDrawFillCircle *fillCircle0113 = [[MWDrawFillCircle alloc] init];
    fillCircle0113.center = station0103.mapLocation;
    fillCircle0113.radius = 12;
    fillCircle0113.fillColor = line0005.color;
    [station0103.drawPrimitives addObject:fillCircle0113];

    MWDrawTextLine *drawTextLine0143 = [[MWDrawTextLine alloc] init];
    drawTextLine0143.text = @"Mouton";
    drawTextLine0143.fontName = @"HelveticaNeue";
    drawTextLine0143.fontColor = [UIColor blackColor];
    drawTextLine0143.fontSize = 34;
    drawTextLine0143.kernSpacing = 0.2;
    drawTextLine0143.origin = CGPointMake(2133, 3369);
    [station0103.nameOriginalTextPrimitives addObject:drawTextLine0143];

    MWDrawTextLine *drawTextLine0144 = [[MWDrawTextLine alloc] init];
    drawTextLine0144.text = @"Duvernet";
    drawTextLine0144.fontName = @"HelveticaNeue";
    drawTextLine0144.fontColor = [UIColor blackColor];
    drawTextLine0144.fontSize = 34;
    drawTextLine0144.kernSpacing = 0.2;
    drawTextLine0144.origin = CGPointMake(2113, 3402);
    [station0103.nameOriginalTextPrimitives addObject:drawTextLine0144];

    // Добавляем перегон
    MWHaul *haul0099 = [[MWHaul alloc] init];
    haul0099.identifier = @"haul0099";
    haul0099.length = 404;
    [edge0046.elements addObject:haul0099];
    
    MWDrawLine *drawLine0139 = [[MWDrawLine alloc] init];
    drawLine0139.startPoint = CGPointMake(2271.5, 3423.5);
    drawLine0139.endPoint = CGPointMake(2271.5, 3492);
    drawLine0139.width = 11;
    drawLine0139.color = line0005.color;
    [haul0099.drawPrimitives addObject:drawLine0139];

    MWDrawArc *drawArc0044 = [[MWDrawArc alloc] init];
    drawArc0044.center = CGPointMake(2241.5, 3492);
    drawArc0044.startDegrees = 0;
    drawArc0044.endDegrees = 45;
    drawArc0044.radius = 30;
    drawArc0044.width = 11;
    drawArc0044.color = line0005.color;
    [haul0099.drawPrimitives addObject:drawArc0044];

    MWDrawLine *drawLine0140 = [[MWDrawLine alloc] init];
    drawLine0140.startPoint = CGPointMake(2263, 3513);
    drawLine0140.endPoint = CGPointMake(2201, 3575);
    drawLine0140.width = 11;
    drawLine0140.color = line0005.color;
    [haul0099.drawPrimitives addObject:drawLine0140];

    // Добавляем станцию Alésia
    MWStation *station0104 = [[MWStation alloc] init];
    station0104.identifier = @"station0104";
    [edge0046.elements addObject:station0104];
    
    station0104.nameOriginal = @"Alésia";
    station0104.mapLocation = CGPointMake(2201, 3575);
    station0104.geoLocation = CGPointMake(48.828333, 2.326667);

    MWDrawFillCircle *fillCircle0114 = [[MWDrawFillCircle alloc] init];
    fillCircle0114.center = station0104.mapLocation;
    fillCircle0114.radius = 12;
    fillCircle0114.fillColor = line0005.color;
    [station0104.drawPrimitives addObject:fillCircle0114];

    MWDrawTextLine *drawTextLine0145 = [[MWDrawTextLine alloc] init];
    drawTextLine0145.text = station0104.nameOriginal;
    drawTextLine0145.fontName = @"HelveticaNeue";
    drawTextLine0145.fontColor = [UIColor blackColor];
    drawTextLine0145.fontSize = 34;
    drawTextLine0145.kernSpacing = -0.6;
    drawTextLine0145.origin = CGPointMake(2097, 3530);
    [station0104.nameOriginalTextPrimitives addObject:drawTextLine0145];

    // Добавляем перегон
    MWHaul *haul0100 = [[MWHaul alloc] init];
    haul0100.identifier = @"haul0100";
    haul0100.length = 571;
    [edge0046.elements addObject:haul0100];

    MWDrawLine *drawLine0141 = [[MWDrawLine alloc] init];
    drawLine0141.startPoint = CGPointMake(2201.5, 3574.5);
    drawLine0141.endPoint = CGPointMake(2142, 3634);
    drawLine0141.width = 11;
    drawLine0141.color = line0005.color;
    [haul0100.drawPrimitives addObject:drawLine0141];

    // Добавляем станцию Porte d'Orléans
    MWStation *station0105 = [[MWStation alloc] init];
    station0105.identifier = @"station0105";
    [edge0046.elements addObject:station0105];
    
    station0105.nameOriginal = @"Porte d'Orléans";
    station0105.mapLocation = CGPointMake(2142, 3634);
    station0105.geoLocation = CGPointMake(48.823189, 2.325364);

    MWDrawFillCircle *fillCircle0115 = [[MWDrawFillCircle alloc] init];
    fillCircle0115.center = station0105.mapLocation;
    fillCircle0115.radius = 13;
    fillCircle0115.fillColor = [UIColor blackColor];
    [station0105.drawPrimitives addObject:fillCircle0115];

    MWDrawFillCircle *fillCircle0116 = [[MWDrawFillCircle alloc] init];
    fillCircle0116.center = station0105.mapLocation;
    fillCircle0116.radius = 11;
    fillCircle0116.fillColor = [UIColor whiteColor];
    [station0105.drawPrimitives addObject:fillCircle0116];

    MWDrawTextLine *drawTextLine0146 = [[MWDrawTextLine alloc] init];
    drawTextLine0146.text = @"Porte";
    drawTextLine0146.fontName = @"HelveticaNeue";
    drawTextLine0146.fontColor = [UIColor blackColor];
    drawTextLine0146.fontSize = 34;
    drawTextLine0146.kernSpacing = -0.2;
    drawTextLine0146.origin = CGPointMake(2013, 3580);
    [station0105.nameOriginalTextPrimitives addObject:drawTextLine0146];

    MWDrawTextLine *drawTextLine0147 = [[MWDrawTextLine alloc] init];
    drawTextLine0147.text = @"d'Orléans";
    drawTextLine0147.fontName = @"HelveticaNeue";
    drawTextLine0147.fontColor = [UIColor blackColor];
    drawTextLine0147.fontSize = 34;
    drawTextLine0147.kernSpacing = -0.2;
    drawTextLine0147.origin = CGPointMake(1950, 3613);
    [station0105.nameOriginalTextPrimitives addObject:drawTextLine0147];

    // Добавляем перегон
    MWHaul *haul0101 = [[MWHaul alloc] init];
    haul0101.identifier = @"haul0101";
    haul0101.length = 811;
    [edge0046.elements addObject:haul0101];
    
    MWDrawLine *drawLine0142 = [[MWDrawLine alloc] init];
    drawLine0142.startPoint = CGPointMake(2142, 3633.5);
    drawLine0142.endPoint = CGPointMake(2139.5, 3746);
    drawLine0142.width = 11;
    drawLine0142.color = line0005.color;
    [haul0101.drawPrimitives addObject:drawLine0142];

    // Добавляем станцию Mairie de Montrouge
    MWStation *station0106 = [[MWStation alloc] init];
    station0106.identifier = @"station0106";
    [edge0046.elements addObject:station0106];
    
    station0106.nameOriginal = @"Mairie de Montrouge";
    station0106.mapLocation = CGPointMake(2139.5, 3746);
    station0106.geoLocation = CGPointMake(48.81843, 2.31953);

    MWDrawFillCircle *fillCircle0117 = [[MWDrawFillCircle alloc] init];
    fillCircle0117.center = station0106.mapLocation;
    fillCircle0117.radius = 12;
    fillCircle0117.fillColor = [UIColor blackColor];
    [station0106.drawPrimitives addObject:fillCircle0117];

    MWDrawTextLine *drawTextLine0148 = [[MWDrawTextLine alloc] init];
    drawTextLine0148.text = @"Mairie";
    drawTextLine0148.fontName = @"Helvetica-Bold";
    drawTextLine0148.fontColor = [UIColor blackColor];
    drawTextLine0148.fontSize = 30;
    drawTextLine0148.kernSpacing = 2.6;
    drawTextLine0148.origin = CGPointMake(1985, 3745);
    [station0106.drawPrimitives addObject:drawTextLine0148];

    MWDrawTextLine *drawTextLine0149 = [[MWDrawTextLine alloc] init];
    drawTextLine0149.text = @"de Montrouge";
    drawTextLine0149.fontName = @"Helvetica-Bold";
    drawTextLine0149.fontColor = [UIColor blackColor];
    drawTextLine0149.fontSize = 30;
    drawTextLine0149.kernSpacing = 1.8;
    drawTextLine0149.origin = CGPointMake(1872, 3778);
    [station0106.drawPrimitives addObject:drawTextLine0149];

    MWDrawFillCircle *fillCircle0118 = [[MWDrawFillCircle alloc] init];
    fillCircle0118.center = CGPointMake(2138, 3792.5);
    fillCircle0118.radius = 28;
    fillCircle0118.fillColor = line0005.color;
    [station0106.drawPrimitives addObject:fillCircle0118];

    MWDrawTextLine *drawTextLine0150 = [[MWDrawTextLine alloc] init];
    drawTextLine0150.text = @"4";
    drawTextLine0150.fontName = @"HelveticaNeue-Bold";
    drawTextLine0150.fontColor = [UIColor whiteColor];
    drawTextLine0150.fontSize = 44;
    drawTextLine0150.origin = CGPointMake(2124, 3764);
    [station0106.drawPrimitives addObject:drawTextLine0150];

    // Добавляем вершину
    edge0046.finishVertex = vertex0043;
    
    ////////////////////////////////////////////////////////////////
    // Line 5
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Bobigny – Pablo Picasso - Jaurès
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0047 = [[MWEdge alloc] init];
    edge0047.identifier = @"edge0047";
    edge0047.developmentName = @"Ребро: Bobigny – Pablo Picasso - Jaurès";
    [self.edges addObject:edge0047];
    
    // Добавляем линию
    edge0047.line = line0006;
    
    // Добавляем вершину
    edge0047.startVertex = vertex0044;

    // Добавляем станцию Bobigny – Pablo Picasso
    MWStation *station0107 = [[MWStation alloc] init];
    station0107.identifier = @"station0107";
    [edge0047.elements addObject:station0107];
    
    station0107.nameOriginal = @"Bobigny – Pablo Picasso";
    station0107.mapLocation = CGPointMake(3980, 1010);
    station0107.geoLocation = CGPointMake(48.906538, 2.449994);

    MWDrawFillCircle *fillCircle0119 = [[MWDrawFillCircle alloc] init];
    fillCircle0119.center = CGPointMake(4016, 937);
    fillCircle0119.radius = 28;
    fillCircle0119.fillColor = line0006.color;
    [station0107.drawPrimitives addObject:fillCircle0119];

    MWDrawTextLine *drawTextLine0151 = [[MWDrawTextLine alloc] init];
    drawTextLine0151.text = @"5";
    drawTextLine0151.fontName = @"HelveticaNeue-Bold";
    drawTextLine0151.fontColor = [UIColor blackColor];
    drawTextLine0151.fontSize = 44;
    drawTextLine0151.origin = CGPointMake(4004, 910);
    [station0107.drawPrimitives addObject:drawTextLine0151];

    MWDrawTextLine *drawTextLine0152 = [[MWDrawTextLine alloc] init];
    drawTextLine0152.text = @"Bobigny";
    drawTextLine0152.fontName = @"Helvetica-Bold";
    drawTextLine0152.fontColor = [UIColor blackColor];
    drawTextLine0152.fontSize = 30;
    drawTextLine0152.kernSpacing = 1.2;
    drawTextLine0152.origin = CGPointMake(4051, 902);
    [station0107.drawPrimitives addObject:drawTextLine0152];

    MWDrawTextLine *drawTextLine0153 = [[MWDrawTextLine alloc] init];
    drawTextLine0153.text = @"Pablo Picasso";
    drawTextLine0153.fontName = @"Helvetica-Bold";
    drawTextLine0153.fontColor = [UIColor blackColor];
    drawTextLine0153.fontSize = 30;
    drawTextLine0153.kernSpacing = 0.5;
    drawTextLine0153.origin = CGPointMake(4051, 937);
    [station0107.drawPrimitives addObject:drawTextLine0153];

    MWDrawFillCircle *fillCircle0120 = [[MWDrawFillCircle alloc] init];
    fillCircle0120.center = station0107.mapLocation;
    fillCircle0120.radius = 13;
    fillCircle0120.fillColor = [UIColor blackColor];
    [station0107.drawPrimitives addObject:fillCircle0120];

    MWDrawFillCircle *fillCircle0121 = [[MWDrawFillCircle alloc] init];
    fillCircle0121.center = station0107.mapLocation;
    fillCircle0121.radius = 11;
    fillCircle0121.fillColor = [UIColor whiteColor];
    [station0107.drawPrimitives addObject:fillCircle0121];

    // Добавляем перегон
    MWHaul *haul0102 = [[MWHaul alloc] init];
    haul0102.identifier = @"haul0102";
    haul0102.length = 2444;
    [edge0047.elements addObject:haul0102];

    MWDrawLine *drawLine0143 = [[MWDrawLine alloc] init];
    drawLine0143.startPoint = CGPointMake(3980, 1010);
    drawLine0143.endPoint = CGPointMake(3864.5, 1124.5);
    drawLine0143.width = 11;
    drawLine0143.color = line0006.color;
    [haul0102.drawPrimitives addObject:drawLine0143];

    // Добавляем станцию Bobigny – Pantin – Raymond Queneau
    MWStation *station0108 = [[MWStation alloc] init];
    station0108.identifier = @"station0108";
    [edge0047.elements addObject:station0108];
    
    station0108.nameOriginal = @"Bobigny – Pantin – Raymond Queneau";
    station0108.mapLocation = CGPointMake(3864.5, 1124.5);
    station0108.geoLocation = CGPointMake(48.895, 2.425);

    MWDrawFillCircle *fillCircle0122 = [[MWDrawFillCircle alloc] init];
    fillCircle0122.center = station0108.mapLocation;
    fillCircle0122.radius = 12;
    fillCircle0122.fillColor = line0006.color;
    [station0108.drawPrimitives addObject:fillCircle0122];

    MWDrawTextLine *drawTextLine0154 = [[MWDrawTextLine alloc] init];
    drawTextLine0154.text = @"Bobigny – Pantin";
    drawTextLine0154.fontName = @"HelveticaNeue";
    drawTextLine0154.fontColor = [UIColor blackColor];
    drawTextLine0154.fontSize = 34;
    drawTextLine0154.kernSpacing = -1.0;
    drawTextLine0154.origin = CGPointMake(3613, 1044);
    [station0108.nameOriginalTextPrimitives addObject:drawTextLine0154];

    MWDrawTextLine *drawTextLine0155 = [[MWDrawTextLine alloc] init];
    drawTextLine0155.text = @"Raymond Queneau";
    drawTextLine0155.fontName = @"HelveticaNeue";
    drawTextLine0155.fontColor = [UIColor blackColor];
    drawTextLine0155.fontSize = 34;
    drawTextLine0155.kernSpacing = -0.5;
    drawTextLine0155.origin = CGPointMake(3571, 1077);
    [station0108.nameOriginalTextPrimitives addObject:drawTextLine0155];

    // Добавляем перегон
    MWHaul *haul0103 = [[MWHaul alloc] init];
    haul0103.identifier = @"haul0103";
    haul0103.length = 1027;
    [edge0047.elements addObject:haul0103];

    MWDrawLine *drawLine0144 = [[MWDrawLine alloc] init];
    drawLine0144.startPoint = CGPointMake(3865, 1124);
    drawLine0144.endPoint = CGPointMake(3787, 1201);
    drawLine0144.width = 11;
    drawLine0144.color = line0006.color;
    [haul0103.drawPrimitives addObject:drawLine0144];

    // Добавляем станцию Église de Pantin
    MWStation *station0109 = [[MWStation alloc] init];
    station0109.identifier = @"station0109";
    [edge0047.elements addObject:station0109];
    
    station0109.nameOriginal = @"Église de Pantin";
    station0109.mapLocation = CGPointMake(3787, 1201);
    station0109.geoLocation = CGPointMake(48.894, 2.413);

    MWDrawFillCircle *fillCircle0123 = [[MWDrawFillCircle alloc] init];
    fillCircle0123.center = station0109.mapLocation;
    fillCircle0123.radius = 12;
    fillCircle0123.fillColor = line0006.color;
    [station0109.drawPrimitives addObject:fillCircle0123];

    MWDrawTextLine *drawTextLine0156 = [[MWDrawTextLine alloc] init];
    drawTextLine0156.text = station0109.nameOriginal;
    drawTextLine0156.fontName = @"HelveticaNeue";
    drawTextLine0156.fontColor = [UIColor blackColor];
    drawTextLine0156.fontSize = 34;
    drawTextLine0156.kernSpacing = -0.3;
    drawTextLine0156.origin = CGPointMake(3532, 1157.5);
    [station0109.nameOriginalTextPrimitives addObject:drawTextLine0156];

    // Добавляем перегон
    MWHaul *haul0104 = [[MWHaul alloc] init];
    haul0104.identifier = @"haul0104";
    haul0104.length = 728;
    [edge0047.elements addObject:haul0104];

    MWDrawLine *drawLine0145 = [[MWDrawLine alloc] init];
    drawLine0145.startPoint = CGPointMake(3787.5, 1200.5);
    drawLine0145.endPoint = CGPointMake(3731, 1257);
    drawLine0145.width = 11;
    drawLine0145.color = line0006.color;
    [haul0104.drawPrimitives addObject:drawLine0145];

    MWDrawArc *drawArc0045 = [[MWDrawArc alloc] init];
    drawArc0045.center = CGPointMake(3710, 1235.5);
    drawArc0045.startDegrees = 45;
    drawArc0045.endDegrees = 90;
    drawArc0045.radius = 30;
    drawArc0045.width = 11;
    drawArc0045.color = line0006.color;
    [haul0104.drawPrimitives addObject:drawArc0045];

    MWDrawLine *drawLine0146 = [[MWDrawLine alloc] init];
    drawLine0146.startPoint = CGPointMake(3710, 1265.5);
    drawLine0146.endPoint = CGPointMake(3676, 1265.5);
    drawLine0146.width = 11;
    drawLine0146.color = line0006.color;
    [haul0104.drawPrimitives addObject:drawLine0146];

    // Добавляем станцию Hoche
    MWStation *station0110 = [[MWStation alloc] init];
    station0110.identifier = @"station0110";
    [edge0047.elements addObject:station0110];
    
    station0110.nameOriginal = @"Hoche";
    station0110.mapLocation = CGPointMake(3676, 1265.5);
    station0110.geoLocation = CGPointMake(48.891, 2.403);

    MWDrawFillCircle *fillCircle0124 = [[MWDrawFillCircle alloc] init];
    fillCircle0124.center = station0110.mapLocation;
    fillCircle0124.radius = 12;
    fillCircle0124.fillColor = line0006.color;
    [station0110.drawPrimitives addObject:fillCircle0124];

    MWDrawTextLine *drawTextLine0157 = [[MWDrawTextLine alloc] init];
    drawTextLine0157.text = station0110.nameOriginal;
    drawTextLine0157.fontName = @"HelveticaNeue";
    drawTextLine0157.fontColor = [UIColor blackColor];
    drawTextLine0157.fontSize = 34;
    drawTextLine0157.kernSpacing = -0.5;
    drawTextLine0157.origin = CGPointMake(3627, 1277);
    [station0110.nameOriginalTextPrimitives addObject:drawTextLine0157];

    // Добавляем перегон
    MWHaul *haul0105 = [[MWHaul alloc] init];
    haul0105.identifier = @"haul0105";
    haul0105.length = 868;
    [edge0047.elements addObject:haul0105];

    MWDrawLine *drawLine0147 = [[MWDrawLine alloc] init];
    drawLine0147.startPoint = CGPointMake(3676.5, 1265.5);
    drawLine0147.endPoint = CGPointMake(3519.5, 1265.5);
    drawLine0147.width = 11;
    drawLine0147.color = line0006.color;
    [haul0105.drawPrimitives addObject:drawLine0147];

    // Добавляем станцию Porte de Pantin
    MWStation *station0111 = [[MWStation alloc] init];
    station0111.identifier = @"station0111";
    [edge0047.elements addObject:station0111];
    
    station0111.nameOriginal = @"Porte de Pantin";
    station0111.mapLocation = CGPointMake(3519.5, 1265.5);
    station0111.geoLocation = CGPointMake(48.88971, 2.39629);

    MWDrawFillCircle *fillCircle0125 = [[MWDrawFillCircle alloc] init];
    fillCircle0125.center = station0111.mapLocation;
    fillCircle0125.radius = 13;
    fillCircle0125.fillColor = [UIColor blackColor];
    [station0111.drawPrimitives addObject:fillCircle0125];

    MWDrawFillCircle *fillCircle0126 = [[MWDrawFillCircle alloc] init];
    fillCircle0126.center = station0111.mapLocation;
    fillCircle0126.radius = 11;
    fillCircle0126.fillColor = [UIColor whiteColor];
    [station0111.drawPrimitives addObject:fillCircle0126];

    MWDrawTextLine *drawTextLine0158 = [[MWDrawTextLine alloc] init];
    drawTextLine0158.text = @"Porte";
    drawTextLine0158.fontName = @"HelveticaNeue";
    drawTextLine0158.fontColor = [UIColor blackColor];
    drawTextLine0158.fontSize = 34;
    drawTextLine0158.kernSpacing = -0.0;
    drawTextLine0158.origin = CGPointMake(3476, 1277);
    [station0111.nameOriginalTextPrimitives addObject:drawTextLine0158];

    MWDrawTextLine *drawTextLine0159 = [[MWDrawTextLine alloc] init];
    drawTextLine0159.text = @"de Pantin";
    drawTextLine0159.fontName = @"HelveticaNeue";
    drawTextLine0159.fontColor = [UIColor blackColor];
    drawTextLine0159.fontSize = 34;
    drawTextLine0159.kernSpacing = -0.1;
    drawTextLine0159.origin = CGPointMake(3445, 1310);
    [station0111.nameOriginalTextPrimitives addObject:drawTextLine0159];

    // Добавляем перегон
    MWHaul *haul0106 = [[MWHaul alloc] init];
    haul0106.identifier = @"haul0106";
    haul0106.length = 474;
    [edge0047.elements addObject:haul0106];

    MWDrawLine *drawLine0148 = [[MWDrawLine alloc] init];
    drawLine0148.startPoint = CGPointMake(3520, 1265.5);
    drawLine0148.endPoint = CGPointMake(3358.5, 1265.5);
    drawLine0148.width = 11;
    drawLine0148.color = line0006.color;
    [haul0106.drawPrimitives addObject:drawLine0148];

    // Добавляем станцию Ourcq
    MWStation *station0112 = [[MWStation alloc] init];
    station0112.identifier = @"station0112";
    [edge0047.elements addObject:station0112];
    
    station0112.nameOriginal = @"Ourcq";
    station0112.mapLocation = CGPointMake(3358.5, 1265.5);
    station0112.geoLocation = CGPointMake(48.887, 2.386);

    MWDrawFillCircle *fillCircle0127 = [[MWDrawFillCircle alloc] init];
    fillCircle0127.center = station0112.mapLocation;
    fillCircle0127.radius = 12;
    fillCircle0127.fillColor = line0006.color;
    [station0112.drawPrimitives addObject:fillCircle0127];

    MWDrawTextLine *drawTextLine0160 = [[MWDrawTextLine alloc] init];
    drawTextLine0160.text = station0112.nameOriginal;
    drawTextLine0160.fontName = @"HelveticaNeue";
    drawTextLine0160.fontColor = [UIColor blackColor];
    drawTextLine0160.fontSize = 34;
    drawTextLine0160.kernSpacing = -0.8;
    drawTextLine0160.origin = CGPointMake(3314, 1277);
    [station0112.nameOriginalTextPrimitives addObject:drawTextLine0160];

    // Добавляем перегон
    MWHaul *haul0107 = [[MWHaul alloc] init];
    haul0107.identifier = @"haul0107";
    haul0107.length = 507;
    [edge0047.elements addObject:haul0107];

    MWDrawLine *drawLine0149 = [[MWDrawLine alloc] init];
    drawLine0149.startPoint = CGPointMake(3359, 1265.5);
    drawLine0149.endPoint = CGPointMake(3324, 1265.5);
    drawLine0149.width = 11;
    drawLine0149.color = line0006.color;
    [haul0107.drawPrimitives addObject:drawLine0149];

    MWDrawArc *drawArc0046 = [[MWDrawArc alloc] init];
    drawArc0046.center = CGPointMake(3324.5, 1295.5);
    drawArc0046.startDegrees = 225;
    drawArc0046.endDegrees = 270;
    drawArc0046.radius = 30;
    drawArc0046.width = 11;
    drawArc0046.color = line0006.color;
    [haul0107.drawPrimitives addObject:drawArc0046];

    MWDrawLine *drawLine0150 = [[MWDrawLine alloc] init];
    drawLine0150.startPoint = CGPointMake(3303.5, 1274);
    drawLine0150.endPoint = CGPointMake(3236.5, 1341);
    drawLine0150.width = 11;
    drawLine0150.color = line0006.color;
    [haul0107.drawPrimitives addObject:drawLine0150];

    // Добавляем станцию Laumière
    MWStation *station0113 = [[MWStation alloc] init];
    station0113.identifier = @"station0113";
    [edge0047.elements addObject:station0113];
    
    station0113.nameOriginal = @"Laumière";
    station0113.mapLocation = CGPointMake(3236.5, 1341);
    station0113.geoLocation = CGPointMake(48.885, 2.379);

    MWDrawFillCircle *fillCircle0128 = [[MWDrawFillCircle alloc] init];
    fillCircle0128.center = station0113.mapLocation;
    fillCircle0128.radius = 12;
    fillCircle0128.fillColor = line0006.color;
    [station0113.drawPrimitives addObject:fillCircle0128];

    MWDrawTextLine *drawTextLine0161 = [[MWDrawTextLine alloc] init];
    drawTextLine0161.text = station0113.nameOriginal;
    drawTextLine0161.fontName = @"HelveticaNeue";
    drawTextLine0161.fontColor = [UIColor blackColor];
    drawTextLine0161.fontSize = 34;
    drawTextLine0161.kernSpacing = -0.0;
    drawTextLine0161.origin = CGPointMake(3247, 1344);
    [station0113.nameOriginalTextPrimitives addObject:drawTextLine0161];

    // Добавляем перегон
    MWHaul *haul0108 = [[MWHaul alloc] init];
    haul0108.identifier = @"haul0108";
    haul0108.length = 682;
    [edge0047.elements addObject:haul0108];

    MWDrawLine *drawLine0151 = [[MWDrawLine alloc] init];
    drawLine0151.startPoint = CGPointMake(3237, 1340.5);
    drawLine0151.endPoint = CGPointMake(3144, 1433);
    drawLine0151.width = 11;
    drawLine0151.color = line0006.color;
    [haul0108.drawPrimitives addObject:drawLine0151];

    // Добавляем станцию Jaurès
    MWStation *station0114 = [[MWStation alloc] init];
    station0114.identifier = @"station0114";
    [edge0047.elements addObject:station0114];
    
    station0114.nameOriginal = @"Jaurès";
    station0114.mapLocation = CGPointMake(3144, 1433);
    station0114.geoLocation = CGPointMake(48.88292, 2.37067);

    MWDrawFillCircle *fillCircle0129 = [[MWDrawFillCircle alloc] init];
    fillCircle0129.center = station0114.mapLocation;
    fillCircle0129.radius = 3;
    fillCircle0129.fillColor = [UIColor whiteColor];
    [station0114.drawPrimitives addObject:fillCircle0129];

    station0114.showNameOnMap = false;
    [station0114.nameOriginalTextPrimitives addObject:drawTextLine0059];
    
    // Добавляем вершину
    edge0047.finishVertex = vertex0021;

    // Создаем участок линии Jaurès - Stalingrad
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0048 = [[MWEdge alloc] init];
    edge0048.identifier = @"edge0048";
    edge0048.developmentName = @"Ребро: Jaurès - Stalingrad";
    [self.edges addObject:edge0048];
    
    // Добавляем линию
    edge0048.line = line0006;
    
    // Добавляем вершину
    edge0048.startVertex = vertex0021;

    // Добавляем станцию Jaurès
    [edge0048.elements addObject:station0113];

    // Добавляем перегон
    MWHaul *haul0109 = [[MWHaul alloc] init];
    haul0109.identifier = @"haul0109";
    haul0109.length = 233;
    [edge0048.elements addObject:haul0109];
    
    MWDrawLine *drawLine0152 = [[MWDrawLine alloc] init];
    drawLine0152.startPoint = CGPointMake(3144.5, 1432.5);
    drawLine0152.endPoint = CGPointMake(3129.5, 1447.5);
    drawLine0152.width = 11;
    drawLine0152.color = line0006.color;
    [haul0109.drawPrimitives addObject:drawLine0152];

    MWDrawArc *drawArc0047 = [[MWDrawArc alloc] init];
    drawArc0047.center = CGPointMake(3120, 1436);
    drawArc0047.startDegrees = 45;
    drawArc0047.endDegrees = 135;
    drawArc0047.radius = 15;
    drawArc0047.width = 11;
    drawArc0047.color = line0006.color;
    [haul0109.drawPrimitives addObject:drawArc0047];

    MWDrawLine *drawLine0153 = [[MWDrawLine alloc] init];
    drawLine0153.startPoint = CGPointMake(3110, 1447);
    drawLine0153.endPoint = CGPointMake(3039, 1376);
    drawLine0153.width = 11;
    drawLine0153.color = line0006.color;
    [haul0109.drawPrimitives addObject:drawLine0153];

    // Добавляем станцию Stalingrad
    MWStation *station0115 = [[MWStation alloc] init];
    station0115.identifier = @"station0115";
    [edge0048.elements addObject:station0115];
    
    station0115.nameOriginal = @"Stalingrad";
    station0115.mapLocation = CGPointMake(3039, 1376);
    station0115.geoLocation = CGPointMake(48.88426, 2.36874);
    
    MWDrawFillCircle *fillCircle0130 = [[MWDrawFillCircle alloc] init];
    fillCircle0130.center = station0115.mapLocation;
    fillCircle0130.radius = 3;
    fillCircle0130.fillColor = [UIColor whiteColor];
    [station0115.drawPrimitives addObject:fillCircle0130];

    station0115.showNameOnMap = false;
    [station0115.nameOriginalTextPrimitives addObject:drawTextLine0058];

    // Добавляем вершину
    edge0048.finishVertex = vertex0020;

    // Создаем участок линии Stalingrad - Gare du Nord
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0049 = [[MWEdge alloc] init];
    edge0049.identifier = @"edge0049";
    edge0049.developmentName = @"Ребро: Stalingrad - Gare du Nord";
    [self.edges addObject:edge0049];
    
    // Добавляем линию
    edge0049.line = line0006;
    
    // Добавляем вершину
    edge0049.startVertex = vertex0020;

    // Добавляем станцию Stalingrad
    [edge0049.elements addObject:station0114];

    // Добавляем перегон
    MWHaul *haul0110 = [[MWHaul alloc] init];
    haul0110.identifier = @"haul0110";
    haul0110.length = 1259;
    [edge0049.elements addObject:haul0110];
    
    MWDrawLine *drawLine0154 = [[MWDrawLine alloc] init];
    drawLine0154.startPoint = CGPointMake(3039.5, 1376.5);
    drawLine0154.endPoint = CGPointMake(3019.5, 1356.5);
    drawLine0154.width = 11;
    drawLine0154.color = line0006.color;
    [haul0110.drawPrimitives addObject:drawLine0154];

    MWDrawArc *drawArc0048 = [[MWDrawArc alloc] init];
    drawArc0048.center = CGPointMake(2999, 1378.5);
    drawArc0048.startDegrees = 270;
    drawArc0048.endDegrees = 315;
    drawArc0048.radius = 30;
    drawArc0048.width = 11;
    drawArc0048.color = line0006.color;
    [haul0110.drawPrimitives addObject:drawArc0048];

    MWDrawLine *drawLine0155 = [[MWDrawLine alloc] init];
    drawLine0155.startPoint = CGPointMake(2814.5, 1348.5);
    drawLine0155.endPoint = CGPointMake(3000, 1348.5);
    drawLine0155.width = 11;
    drawLine0155.color = line0006.color;
    [haul0110.drawPrimitives addObject:drawLine0155];

    MWDrawArc *drawArc0049 = [[MWDrawArc alloc] init];
    drawArc0049.center = CGPointMake(2815, 1363.5);
    drawArc0049.startDegrees = 180;
    drawArc0049.endDegrees = 270;
    drawArc0049.radius = 15;
    drawArc0049.width = 11;
    drawArc0049.color = line0006.color;
    [haul0110.drawPrimitives addObject:drawArc0049];

    MWDrawLine *drawLine0156 = [[MWDrawLine alloc] init];
    drawLine0156.startPoint = CGPointMake(2800, 1363);
    drawLine0156.endPoint = CGPointMake(2800, 1427);
    drawLine0156.width = 11;
    drawLine0156.color = line0006.color;
    [haul0110.drawPrimitives addObject:drawLine0156];

    // Добавляем станцию Gare du Nord
    MWStation *station0116 = [[MWStation alloc] init];
    station0116.identifier = @"station0116";
    [edge0049.elements addObject:station0116];
    
    station0116.nameOriginal = @"Gare du Nord";
    station0116.mapLocation = CGPointMake(2800, 1427);
    station0116.geoLocation = CGPointMake(48.880556, 2.355);
    
    MWDrawFillCircle *fillCircle0131 = [[MWDrawFillCircle alloc] init];
    fillCircle0131.center = station0116.mapLocation;
    fillCircle0131.radius = 3;
    fillCircle0131.fillColor = [UIColor whiteColor];
    [station0116.drawPrimitives addObject:fillCircle0131];

    station0116.showNameOnMap = false;
    [station0116.drawPrimitives addObject:drawTextLine0119];
    
    // Добавляем вершину
    edge0049.finishVertex = vertex0036;
    
    // Создаем участок линии Gare du Nord - Gare de l'Est
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0050 = [[MWEdge alloc] init];
    edge0050.identifier = @"edge0050";
    edge0050.developmentName = @"Ребро: Gare du Nord - Gare de l'Est";
    [self.edges addObject:edge0050];
    
    // Добавляем линию
    edge0050.line = line0006;
    
    // Добавляем вершину
    edge0050.startVertex = vertex0036;
    
    // Добавляем станцию Gare du Nord
    [edge0050.elements addObject:station0115];

    // Добавляем перегон
    MWHaul *haul0111 = [[MWHaul alloc] init];
    haul0111.identifier = @"haul0111";
    haul0111.length = 558;
    [edge0050.elements addObject:haul0111];

    MWDrawLine *drawLine0157 = [[MWDrawLine alloc] init];
    drawLine0157.startPoint = CGPointMake(2800, 1426.5);
    drawLine0157.endPoint = CGPointMake(2800, 1599.5);
    drawLine0157.width = 11;
    drawLine0157.color = line0006.color;
    [haul0111.drawPrimitives addObject:drawLine0157];

    // Добавляем станцию Gare de l'Est
    MWStation *station0117 = [[MWStation alloc] init];
    station0117.identifier = @"station0117";
    [edge0050.elements addObject:station0117];
    
    station0117.nameOriginal = @"Gare de l'Est";
    station0117.mapLocation = CGPointMake(2800, 1599.5);
    station0117.geoLocation = CGPointMake(48.876111, 2.358333);
    
    MWDrawFillCircle *fillCircle0132 = [[MWDrawFillCircle alloc] init];
    fillCircle0132.center = station0117.mapLocation;
    fillCircle0132.radius = 3;
    fillCircle0132.fillColor = [UIColor whiteColor];
    [station0117.drawPrimitives addObject:fillCircle0132];

    station0117.showNameOnMap = false;
    [station0117.drawPrimitives addObject:drawTextLine0120];
    [station0117.drawPrimitives addObject:drawTextLine0121];
    
    // Добавляем вершину
    edge0050.finishVertex = vertex0037;

    // Создаем участок линии Gare de l'Est - République
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0051 = [[MWEdge alloc] init];
    edge0051.identifier = @"edge0051";
    edge0051.developmentName = @"Ребро: Gare de l'Est - République";
    [self.edges addObject:edge0051];
    
    // Добавляем линию
    edge0051.line = line0006;
    
    // Добавляем вершину
    edge0051.startVertex = vertex0037;

    // Добавляем станцию Gare de l'Est
    [edge0051.elements addObject:station0116];

    // Добавляем перегон
    MWHaul *haul0112 = [[MWHaul alloc] init];
    haul0112.identifier = @"haul0112";
    haul0112.length = 859;
    [edge0051.elements addObject:haul0112];

    MWDrawLine *drawLine0158 = [[MWDrawLine alloc] init];
    drawLine0158.startPoint = CGPointMake(2800, 1599);
    drawLine0158.endPoint = CGPointMake(2800, 1688);
    drawLine0158.width = 11;
    drawLine0158.color = line0006.color;
    [haul0112.drawPrimitives addObject:drawLine0158];
    
    MWDrawArc *drawArc0050 = [[MWDrawArc alloc] init];
    drawArc0050.center = CGPointMake(2830, 1688);
    drawArc0050.startDegrees = 135;
    drawArc0050.endDegrees = 180;
    drawArc0050.radius = 30;
    drawArc0050.width = 11;
    drawArc0050.color = line0006.color;
    [haul0112.drawPrimitives addObject:drawArc0050];

    MWDrawLine *drawLine0159 = [[MWDrawLine alloc] init];
    drawLine0159.startPoint = CGPointMake(2808, 1708.5);
    drawLine0159.endPoint = CGPointMake(2837, 1737.5);
    drawLine0159.width = 11;
    drawLine0159.color = line0006.color;
    [haul0112.drawPrimitives addObject:drawLine0159];

    MWDrawArc *drawArc0051 = [[MWDrawArc alloc] init];
    drawArc0051.center = CGPointMake(2815, 1758);
    drawArc0051.startDegrees = 315;
    drawArc0051.endDegrees = 0;
    drawArc0051.radius = 30;
    drawArc0051.width = 11;
    drawArc0051.color = line0006.color;
    [haul0112.drawPrimitives addObject:drawArc0051];

    MWDrawLine *drawLine0160 = [[MWDrawLine alloc] init];
    drawLine0160.startPoint = CGPointMake(2845, 1758);
    drawLine0160.endPoint = CGPointMake(2845, 1803);
    drawLine0160.width = 11;
    drawLine0160.color = line0006.color;
    [haul0112.drawPrimitives addObject:drawLine0160];

    // Добавляем станцию Jacques Bonsergent
    MWStation *station0118 = [[MWStation alloc] init];
    station0118.identifier = @"station0118";
    [edge0051.elements addObject:station0118];
    
    station0118.nameOriginal = @"Jacques Bonsergent";
    station0118.mapLocation = CGPointMake(2845, 1803);
    station0118.geoLocation = CGPointMake(48.871, 2.361);
    
    MWDrawFillCircle *fillCircle0133 = [[MWDrawFillCircle alloc] init];
    fillCircle0133.center = station0118.mapLocation;
    fillCircle0133.radius = 12;
    fillCircle0133.fillColor = line0006.color;
    [station0118.drawPrimitives addObject:fillCircle0133];

    MWDrawTextLine *drawTextLine0162 = [[MWDrawTextLine alloc] init];
    drawTextLine0162.text = @"Jacques";
    drawTextLine0162.fontName = @"HelveticaNeue";
    drawTextLine0162.fontColor = [UIColor blackColor];
    drawTextLine0162.fontSize = 34;
    drawTextLine0162.kernSpacing = -1.8;
    drawTextLine0162.origin = CGPointMake(2863, 1748);
    [station0118.nameOriginalTextPrimitives addObject:drawTextLine0162];

    MWDrawTextLine *drawTextLine0163 = [[MWDrawTextLine alloc] init];
    drawTextLine0163.text = @"Bonsergent";
    drawTextLine0163.fontName = @"HelveticaNeue";
    drawTextLine0163.fontColor = [UIColor blackColor];
    drawTextLine0163.fontSize = 34;
    drawTextLine0163.kernSpacing = -0.4;
    drawTextLine0163.origin = CGPointMake(2863, 1781);
    [station0118.nameOriginalTextPrimitives addObject:drawTextLine0163];

    // Добавляем перегон
    MWHaul *haul0113 = [[MWHaul alloc] init];
    haul0113.identifier = @"haul0113";
    haul0113.length = 476;
    [edge0051.elements addObject:haul0113];

    MWDrawLine *drawLine0161 = [[MWDrawLine alloc] init];
    drawLine0161.startPoint = CGPointMake(2845, 1802.5);
    drawLine0161.endPoint = CGPointMake(2845, 1877);
    drawLine0161.width = 11;
    drawLine0161.color = line0006.color;
    [haul0113.drawPrimitives addObject:drawLine0161];

    MWDrawArc *drawArc0052 = [[MWDrawArc alloc] init];
    drawArc0052.center = CGPointMake(2875, 1876.5);
    drawArc0052.startDegrees = 135;
    drawArc0052.endDegrees = 180;
    drawArc0052.radius = 30;
    drawArc0052.width = 11;
    drawArc0052.color = line0006.color;
    [haul0113.drawPrimitives addObject:drawArc0052];

    MWDrawLine *drawLine0162 = [[MWDrawLine alloc] init];
    drawLine0162.startPoint = CGPointMake(2853, 1897);
    drawLine0162.endPoint = CGPointMake(2928.5, 1972.5);
    drawLine0162.width = 11;
    drawLine0162.color = line0006.color;
    [haul0113.drawPrimitives addObject:drawLine0162];

    // Добавляем станцию République
    MWStation *station0119 = [[MWStation alloc] init];
    station0119.identifier = @"station0119";
    [edge0051.elements addObject:station0119];
    
    station0119.nameOriginal = @"République";
    station0119.mapLocation = CGPointMake(2927.5, 1971.5);
    station0119.geoLocation = CGPointMake(48.867503, 2.363811);

    MWDrawFillCircle *fillCircle0134 = [[MWDrawFillCircle alloc] init];
    fillCircle0134.center = station0119.mapLocation;
    fillCircle0134.radius = 3;
    fillCircle0134.fillColor = [UIColor whiteColor];
    [station0119.drawPrimitives addObject:fillCircle0134];

    station0119.showNameOnMap = false;
    [station0119.nameOriginalTextPrimitives addObject:drawTextLine0095];
    
    // Добавляем вершину
    edge0051.finishVertex = vertex0030;

    // Создаем участок линии République - Oberkampf
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0052 = [[MWEdge alloc] init];
    edge0052.identifier = @"edge0052";
    edge0052.developmentName = @"Ребро: République - Oberkampf";
    [self.edges addObject:edge0052];
    
    // Добавляем линию
    edge0052.line = line0006;
    
    // Добавляем вершину
    edge0052.startVertex = vertex0030;

    // Добавляем станцию République
    [edge0052.elements addObject:station0119];

    // Добавляем перегон
    MWHaul *haul0114 = [[MWHaul alloc] init];
    haul0114.identifier = @"haul0114";
    haul0114.length = 479;
    [edge0052.elements addObject:haul0114];

    MWDrawLine *drawLine0163 = [[MWDrawLine alloc] init];
    drawLine0163.startPoint = CGPointMake(2928, 1972);
    drawLine0163.endPoint = CGPointMake(3012.5, 2058.5);
    drawLine0163.width = 11;
    drawLine0163.color = line0006.color;
    [haul0114.drawPrimitives addObject:drawLine0163];

    // Добавляем станцию Oberkampf
    MWStation *station0120 = [[MWStation alloc] init];
    station0120.identifier = @"station0120";
    [edge0052.elements addObject:station0120];
    
    station0120.nameOriginal = @"Oberkampf";
    station0120.mapLocation = CGPointMake(3012.5, 2058.5);
    station0120.geoLocation = CGPointMake(48.8635, 2.37025);
    
    MWDrawFillCircle *fillCircle0135 = [[MWDrawFillCircle alloc] init];
    fillCircle0135.center = station0120.mapLocation;
    fillCircle0135.radius = 3;
    fillCircle0135.fillColor = [UIColor whiteColor];
    [station0120.drawPrimitives addObject:fillCircle0135];

    MWDrawTextLine *drawTextLine0164 = [[MWDrawTextLine alloc] init];
    drawTextLine0164.text = station0120.nameOriginal;
    drawTextLine0164.fontName = @"HelveticaNeue";
    drawTextLine0164.fontColor = [UIColor blackColor];
    drawTextLine0164.fontSize = 34;
    drawTextLine0164.kernSpacing = -0.4;
    drawTextLine0164.origin = CGPointMake(3008, 2009);
    [station0120.nameOriginalTextPrimitives addObject:drawTextLine0164];

    // Добавляем вершину
    edge0052.finishVertex = vertex0045;
    
    // Создаем участок линии Oberkampf - Bastille
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0053 = [[MWEdge alloc] init];
    edge0053.identifier = @"edge0053";
    edge0053.developmentName = @"Ребро: Oberkampf - Bastille";
    [self.edges addObject:edge0053];
    
    // Добавляем линию
    edge0053.line = line0006;
    
    // Добавляем вершину
    edge0053.startVertex = vertex0045;

    // Добавляем станцию Oberkampf
    [edge0053.elements addObject:station0120];

    // Добавляем перегон
    MWHaul *haul0115 = [[MWHaul alloc] init];
    haul0115.identifier = @"haul0115";
    haul0115.length = 585;
    [edge0053.elements addObject:haul0115];
    
    MWDrawLine *drawLine0164 = [[MWDrawLine alloc] init];
    drawLine0164.startPoint = CGPointMake(3012, 2058);
    drawLine0164.endPoint = CGPointMake(3162, 2208);
    drawLine0164.width = 11;
    drawLine0164.color = line0006.color;
    [haul0115.drawPrimitives addObject:drawLine0164];

    MWDrawArc *drawArc0053 = [[MWDrawArc alloc] init];
    drawArc0053.center = CGPointMake(3150.25, 2217.75);
    drawArc0053.startDegrees = 315;
    drawArc0053.endDegrees = 45;
    drawArc0053.radius = 15;
    drawArc0053.width = 11;
    drawArc0053.color = line0006.color;
    [haul0115.drawPrimitives addObject:drawArc0053];

    MWDrawLine *drawLine0165 = [[MWDrawLine alloc] init];
    drawLine0165.startPoint = CGPointMake(3161.5, 2228);
    drawLine0165.endPoint = CGPointMake(3078, 2311.5);
    drawLine0165.width = 11;
    drawLine0165.color = line0006.color;
    [haul0115.drawPrimitives addObject:drawLine0165];

    // Добавляем станцию Richard-Lenoir
    MWStation *station0121 = [[MWStation alloc] init];
    station0121.identifier = @"station0121";
    [edge0053.elements addObject:station0121];
    
    station0121.nameOriginal = @"Richard-Lenoir";
    station0121.mapLocation = CGPointMake(3078, 2311.5);
    station0121.geoLocation = CGPointMake(48.86, 2.372);

    MWDrawFillCircle *fillCircle0136 = [[MWDrawFillCircle alloc] init];
    fillCircle0136.center = station0121.mapLocation;
    fillCircle0136.radius = 12;
    fillCircle0136.fillColor = line0006.color;
    [station0121.drawPrimitives addObject:fillCircle0136];

    MWDrawTextLine *drawTextLine0165 = [[MWDrawTextLine alloc] init];
    drawTextLine0165.text = @"Richard";
    drawTextLine0165.fontName = @"HelveticaNeue";
    drawTextLine0165.fontColor = [UIColor blackColor];
    drawTextLine0165.fontSize = 34;
    drawTextLine0165.kernSpacing = -0.6;
    drawTextLine0165.origin = CGPointMake(3089, 2315);
    [station0121.nameOriginalTextPrimitives addObject:drawTextLine0165];

    MWDrawTextLine *drawTextLine0166 = [[MWDrawTextLine alloc] init];
    drawTextLine0166.text = @"Lenoir";
    drawTextLine0166.fontName = @"HelveticaNeue";
    drawTextLine0166.fontColor = [UIColor blackColor];
    drawTextLine0166.fontSize = 34;
    drawTextLine0166.kernSpacing = 0.1;
    drawTextLine0166.origin = CGPointMake(3089, 2348);
    [station0121.nameOriginalTextPrimitives addObject:drawTextLine0166];

    // Добавляем перегон
    MWHaul *haul0116 = [[MWHaul alloc] init];
    haul0116.identifier = @"haul0116";
    haul0116.length = 424;
    [edge0053.elements addObject:haul0116];

    MWDrawLine *drawLine0166 = [[MWDrawLine alloc] init];
    drawLine0166.startPoint = CGPointMake(3078.5, 2311);
    drawLine0166.endPoint = CGPointMake(2983, 2406);
    drawLine0166.width = 11;
    drawLine0166.color = line0006.color;
    [haul0116.drawPrimitives addObject:drawLine0166];

    // Добавляем станцию Bréguet – Sabin
    MWStation *station0122 = [[MWStation alloc] init];
    station0122.identifier = @"station0122";
    [edge0053.elements addObject:station0122];
    
    station0122.nameOriginal = @"Bréguet – Sabin";
    station0122.mapLocation = CGPointMake(2983, 2406);
    station0122.geoLocation = CGPointMake(48.856, 2.37);

    MWDrawFillCircle *fillCircle0137 = [[MWDrawFillCircle alloc] init];
    fillCircle0137.center = station0122.mapLocation;
    fillCircle0137.radius = 12;
    fillCircle0137.fillColor = line0006.color;
    [station0122.drawPrimitives addObject:fillCircle0137];

    MWDrawTextLine *drawTextLine0167 = [[MWDrawTextLine alloc] init];
    drawTextLine0167.text = @"Bréguet";
    drawTextLine0167.fontName = @"HelveticaNeue";
    drawTextLine0167.fontColor = [UIColor blackColor];
    drawTextLine0167.fontSize = 34;
    drawTextLine0167.kernSpacing = -0.8;
    drawTextLine0167.origin = CGPointMake(2994, 2409);
    [station0122.nameOriginalTextPrimitives addObject:drawTextLine0167];

    MWDrawTextLine *drawTextLine0168 = [[MWDrawTextLine alloc] init];
    drawTextLine0168.text = @"Sabin";
    drawTextLine0168.fontName = @"HelveticaNeue";
    drawTextLine0168.fontColor = [UIColor blackColor];
    drawTextLine0168.fontSize = 34;
    drawTextLine0168.kernSpacing = -1.0;
    drawTextLine0168.origin = CGPointMake(2994, 2442);
    [station0122.nameOriginalTextPrimitives addObject:drawTextLine0168];

    // Добавляем перегон
    MWHaul *haul0117 = [[MWHaul alloc] init];
    haul0117.identifier = @"haul0117";
    haul0117.length = 422;
    [edge0053.elements addObject:haul0117];

    MWDrawLine *drawLine0167 = [[MWDrawLine alloc] init];
    drawLine0167.startPoint = CGPointMake(2983.5, 2405.5);
    drawLine0167.endPoint = CGPointMake(2897.5, 2491.5);
    drawLine0167.width = 11;
    drawLine0167.color = line0006.color;
    [haul0117.drawPrimitives addObject:drawLine0167];

    MWDrawArc *drawArc0054 = [[MWDrawArc alloc] init];
    drawArc0054.center = CGPointMake(2919, 2512.5);
    drawArc0054.startDegrees = 180;
    drawArc0054.endDegrees = 225;
    drawArc0054.radius = 30;
    drawArc0054.width = 11;
    drawArc0054.color = line0006.color;
    [haul0117.drawPrimitives addObject:drawArc0054];

    MWDrawLine *drawLine0168 = [[MWDrawLine alloc] init];
    drawLine0168.startPoint = CGPointMake(2889, 2512);
    drawLine0168.endPoint = CGPointMake(2889, 2549);
    drawLine0168.width = 11;
    drawLine0168.color = line0006.color;
    [haul0117.drawPrimitives addObject:drawLine0168];

    // Добавляем станцию Bastille
    MWStation *station0123 = [[MWStation alloc] init];
    station0123.identifier = @"station0123";
    [edge0053.elements addObject:station0123];
    
    station0123.nameOriginal = @"Bastille";
    station0123.mapLocation = CGPointMake(2889, 2549);
    station0123.geoLocation = CGPointMake(48.853082, 2.369077);

    MWDrawFillCircle *fillCircle0138 = [[MWDrawFillCircle alloc] init];
    fillCircle0138.center = station0123.mapLocation;
    fillCircle0138.radius = 3;
    fillCircle0138.fillColor = [UIColor whiteColor];
    [station0123.drawPrimitives addObject:fillCircle0138];

    station0123.showNameOnMap = false;
    [station0123.nameOriginalTextPrimitives addObject:drawTextLine0029];

    // Добавляем вершину
    edge0053.finishVertex = vertex0009;

    // Создаем участок линии Bastille - Gare d'Austerlitz
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0054 = [[MWEdge alloc] init];
    edge0054.identifier = @"edge0054";
    edge0054.developmentName = @"Ребро: Bastille - Gare d'Austerlitz";
    [self.edges addObject:edge0054];
    
    // Добавляем линию
    edge0054.line = line0006;
    
    // Добавляем вершину
    edge0054.startVertex = vertex0009;

    // Добавляем станцию Bastille
    [edge0054.elements addObject:station0123];

    // Добавляем перегон
    MWHaul *haul0118 = [[MWHaul alloc] init];
    haul0118.identifier = @"haul0118";
    haul0118.length = 789;
    [edge0054.elements addObject:haul0118];

    MWDrawLine *drawLine0169 = [[MWDrawLine alloc] init];
    drawLine0169.startPoint = CGPointMake(2889, 2548.5);
    drawLine0169.endPoint = CGPointMake(2889, 2857);
    drawLine0169.width = 11;
    drawLine0169.color = line0006.color;
    [haul0118.drawPrimitives addObject:drawLine0169];

    // Добавляем станцию Quai de la Rapée
    MWStation *station0124 = [[MWStation alloc] init];
    station0124.identifier = @"station0124";
    [edge0054.elements addObject:station0124];
    
    station0124.nameOriginal = @"Quai de la Rapée";
    station0124.mapLocation = CGPointMake(2889, 2857);
    station0124.geoLocation = CGPointMake(48.846, 2.366);

    MWDrawFillCircle *fillCircle0139 = [[MWDrawFillCircle alloc] init];
    fillCircle0139.center = station0124.mapLocation;
    fillCircle0139.radius = 12;
    fillCircle0139.fillColor = line0006.color;
    [station0124.drawPrimitives addObject:fillCircle0139];

    MWDrawTextLine *drawTextLine0169 = [[MWDrawTextLine alloc] init];
    drawTextLine0169.text = @"Quai de";
    drawTextLine0169.fontName = @"HelveticaNeue";
    drawTextLine0169.fontColor = [UIColor blackColor];
    drawTextLine0169.fontSize = 34;
    drawTextLine0169.kernSpacing = -0.6;
    drawTextLine0169.origin = CGPointMake(2754, 2835);
    [station0124.nameOriginalTextPrimitives addObject:drawTextLine0169];

    MWDrawTextLine *drawTextLine0170 = [[MWDrawTextLine alloc] init];
    drawTextLine0170.text = @"la Rapée";
    drawTextLine0170.fontName = @"HelveticaNeue";
    drawTextLine0170.fontColor = [UIColor blackColor];
    drawTextLine0170.fontSize = 34;
    drawTextLine0170.kernSpacing = -0.8;
    drawTextLine0170.origin = CGPointMake(2742, 2868);
    [station0124.nameOriginalTextPrimitives addObject:drawTextLine0170];

    // Добавляем перегон
    MWHaul *haul0119 = [[MWHaul alloc] init];
    haul0119.identifier = @"haul0119";
    haul0119.length = 707;
    [edge0054.elements addObject:haul0119];

    MWDrawLine *drawLine0170 = [[MWDrawLine alloc] init];
    drawLine0170.startPoint = CGPointMake(2889, 2856.5);
    drawLine0170.endPoint = CGPointMake(2889, 3063.5);
    drawLine0170.width = 11;
    drawLine0170.color = line0006.color;
    [haul0119.drawPrimitives addObject:drawLine0170];

    // Добавляем станцию Gare d'Austerlitz
    MWStation *station0125 = [[MWStation alloc] init];
    station0125.identifier = @"station0125";
    [edge0054.elements addObject:station0125];
    
    station0125.nameOriginal = @"Gare d'Austerlitz";
    station0125.mapLocation = CGPointMake(2889, 3063.5);
    station0125.geoLocation = CGPointMake(48.842626, 2.364971);

    MWDrawFillCircle *fillCircle0140 = [[MWDrawFillCircle alloc] init];
    fillCircle0140.center = station0125.mapLocation;
    fillCircle0140.radius = 3;
    fillCircle0140.fillColor = [UIColor whiteColor];
    [station0125.drawPrimitives addObject:fillCircle0140];

    MWDrawTextLine *drawTextLine0171 = [[MWDrawTextLine alloc] init];
    drawTextLine0171.text = @"Gare";
    drawTextLine0171.fontName = @"Helvetica-Bold";
    drawTextLine0171.fontColor = [UIColor blackColor];
    drawTextLine0171.fontSize = 30;
    drawTextLine0171.kernSpacing = 1.2;
    drawTextLine0171.origin = CGPointMake(2899, 2990);
    [station0125.nameOriginalTextPrimitives addObject:drawTextLine0171];

    MWDrawTextLine *drawTextLine0172 = [[MWDrawTextLine alloc] init];
    drawTextLine0172.text = @"d'Austerlitz";
    drawTextLine0172.fontName = @"Helvetica-Bold";
    drawTextLine0172.fontColor = [UIColor blackColor];
    drawTextLine0172.fontSize = 30;
    drawTextLine0172.kernSpacing = 1.4;
    drawTextLine0172.origin = CGPointMake(2899, 3023);
    [station0125.nameOriginalTextPrimitives addObject:drawTextLine0172];

    // Добавляем вершину
    edge0054.finishVertex = vertex0046;
    
    // Создаем участок линии Gare d'Austerlitz - Place d'Italie
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0055 = [[MWEdge alloc] init];
    edge0055.identifier = @"edge0055";
    edge0055.developmentName = @"Ребро: Gare d'Austerlitz - Place d'Italie";
    [self.edges addObject:edge0055];
    
    // Добавляем линию
    edge0055.line = line0006;
    
    // Добавляем вершину
    edge0055.startVertex = vertex0046;

    // Добавляем станцию Gare d'Austerlitz
    [edge0055.elements addObject:station0125];

    // Добавляем перегон
    MWHaul *haul0120 = [[MWHaul alloc] init];
    haul0120.identifier = @"haul0120";
    haul0120.length = 440;
    [edge0055.elements addObject:haul0120];

    MWDrawLine *drawLine0171 = [[MWDrawLine alloc] init];
    drawLine0171.startPoint = CGPointMake(2889, 3063);
    drawLine0171.endPoint = CGPointMake(2889, 3185);
    drawLine0171.width = 11;
    drawLine0171.color = line0006.color;
    [haul0120.drawPrimitives addObject:drawLine0171];

    // Добавляем станцию Saint-Marcel
    MWStation *station0126 = [[MWStation alloc] init];
    station0126.identifier = @"station0126";
    [edge0055.elements addObject:station0126];
    
    station0126.nameOriginal = @"Saint-Marcel";
    station0126.mapLocation = CGPointMake(2889, 3185);
    station0126.geoLocation = CGPointMake(48.838, 2.36);

    MWDrawFillCircle *fillCircle0141 = [[MWDrawFillCircle alloc] init];
    fillCircle0141.center = station0126.mapLocation;
    fillCircle0141.radius = 12;
    fillCircle0141.fillColor = line0006.color;
    [station0126.drawPrimitives addObject:fillCircle0141];

    MWDrawTextLine *drawTextLine0173 = [[MWDrawTextLine alloc] init];
    drawTextLine0173.text = @"Saint";
    drawTextLine0173.fontName = @"HelveticaNeue";
    drawTextLine0173.fontColor = [UIColor blackColor];
    drawTextLine0173.fontSize = 34;
    drawTextLine0173.kernSpacing = -0.6;
    drawTextLine0173.origin = CGPointMake(2909, 3163);
    [station0126.nameOriginalTextPrimitives addObject:drawTextLine0173];

    MWDrawTextLine *drawTextLine0174 = [[MWDrawTextLine alloc] init];
    drawTextLine0174.text = @"Marcel";
    drawTextLine0174.fontName = @"HelveticaNeue";
    drawTextLine0174.fontColor = [UIColor blackColor];
    drawTextLine0174.fontSize = 34;
    drawTextLine0174.kernSpacing = -0.6;
    drawTextLine0174.origin = CGPointMake(2909, 3196);
    [station0126.nameOriginalTextPrimitives addObject:drawTextLine0174];

    // Добавляем перегон
    MWHaul *haul0121 = [[MWHaul alloc] init];
    haul0121.identifier = @"haul0121";
    haul0121.length = 471;
    [edge0055.elements addObject:haul0121];

    MWDrawLine *drawLine0172 = [[MWDrawLine alloc] init];
    drawLine0172.startPoint = CGPointMake(2889, 3184.5);
    drawLine0172.endPoint = CGPointMake(2889, 3195);
    drawLine0172.width = 11;
    drawLine0172.color = line0006.color;
    [haul0121.drawPrimitives addObject:drawLine0172];

    MWDrawArc *drawArc0055 = [[MWDrawArc alloc] init];
    drawArc0055.center = CGPointMake(2859, 3194.5);
    drawArc0055.startDegrees = 0;
    drawArc0055.endDegrees = 45;
    drawArc0055.radius = 30;
    drawArc0055.width = 11;
    drawArc0055.color = line0006.color;
    [haul0121.drawPrimitives addObject:drawArc0055];

    MWDrawLine *drawLine0173 = [[MWDrawLine alloc] init];
    drawLine0173.startPoint = CGPointMake(2880.5, 3215.5);
    drawLine0173.endPoint = CGPointMake(2819, 3277);
    drawLine0173.width = 11;
    drawLine0173.color = line0006.color;
    [haul0121.drawPrimitives addObject:drawLine0173];

    // Добавляем станцию Campo Formio
    MWStation *station0127 = [[MWStation alloc] init];
    station0127.identifier = @"station0127";
    [edge0055.elements addObject:station0127];
    
    station0127.nameOriginal = @"Campo Formio";
    station0127.mapLocation = CGPointMake(2819, 3277);
    station0127.geoLocation = CGPointMake(48.835, 2.358);
    
    MWDrawFillCircle *fillCircle0142 = [[MWDrawFillCircle alloc] init];
    fillCircle0142.center = station0127.mapLocation;
    fillCircle0142.radius = 12;
    fillCircle0142.fillColor = line0006.color;
    [station0127.drawPrimitives addObject:fillCircle0142];

    MWDrawTextLine *drawTextLine0175 = [[MWDrawTextLine alloc] init];
    drawTextLine0175.text = @"Campo";
    drawTextLine0175.fontName = @"HelveticaNeue";
    drawTextLine0175.fontColor = [UIColor blackColor];
    drawTextLine0175.fontSize = 34;
    drawTextLine0175.kernSpacing = -1.0;
    drawTextLine0175.origin = CGPointMake(2830, 3280);
    [station0127.nameOriginalTextPrimitives addObject:drawTextLine0175];

    MWDrawTextLine *drawTextLine0176 = [[MWDrawTextLine alloc] init];
    drawTextLine0176.text = @"Formio";
    drawTextLine0176.fontName = @"HelveticaNeue";
    drawTextLine0176.fontColor = [UIColor blackColor];
    drawTextLine0176.fontSize = 34;
    drawTextLine0176.kernSpacing = -0.0;
    drawTextLine0176.origin = CGPointMake(2830, 3313);
    [station0127.nameOriginalTextPrimitives addObject:drawTextLine0176];

    // Добавляем перегон
    MWHaul *haul0122 = [[MWHaul alloc] init];
    haul0122.identifier = @"haul0122";
    haul0122.length = 513;
    [edge0055.elements addObject:haul0122];
    
    MWDrawLine *drawLine0174 = [[MWDrawLine alloc] init];
    drawLine0174.startPoint = CGPointMake(2819.5, 3276.5);
    drawLine0174.endPoint = CGPointMake(2736, 3360);
    drawLine0174.width = 11;
    drawLine0174.color = line0006.color;
    [haul0122.drawPrimitives addObject:drawLine0174];

    MWDrawArc *drawArc0056 = [[MWDrawArc alloc] init];
    drawArc0056.center = CGPointMake(2757.5, 3381);
    drawArc0056.startDegrees = 180;
    drawArc0056.endDegrees = 225;
    drawArc0056.radius = 30;
    drawArc0056.width = 11;
    drawArc0056.color = line0006.color;
    [haul0122.drawPrimitives addObject:drawArc0056];

    MWDrawLine *drawLine0175 = [[MWDrawLine alloc] init];
    drawLine0175.startPoint = CGPointMake(2727.5, 3381);
    drawLine0175.endPoint = CGPointMake(2727.5, 3435.5);
    drawLine0175.width = 11;
    drawLine0175.color = line0006.color;
    [haul0122.drawPrimitives addObject:drawLine0175];

    // Добавляем станцию Place d'Italie
    MWStation *station0128 = [[MWStation alloc] init];
    station0128.identifier = @"station0128";
    [edge0055.elements addObject:station0128];
    
    station0128.nameOriginal = @"Place d'Italie";
    station0128.mapLocation = CGPointMake(2727.5, 3435.5);
    station0128.geoLocation = CGPointMake(48.831483, 2.355692);

    MWDrawFillCircle *fillCircle0143 = [[MWDrawFillCircle alloc] init];
    fillCircle0143.center = station0128.mapLocation;
    fillCircle0143.radius = 5.5;
    fillCircle0143.fillColor = line0006.color;
    [station0128.drawPrimitives addObject:fillCircle0143];

    MWDrawTextLine *drawTextLine0177 = [[MWDrawTextLine alloc] init];
    drawTextLine0177.text = @"Place";
    drawTextLine0177.fontName = @"Helvetica-Bold";
    drawTextLine0177.fontColor = [UIColor blackColor];
    drawTextLine0177.fontSize = 30;
    drawTextLine0177.kernSpacing = 1.0;
    drawTextLine0177.origin = CGPointMake(2740, 3359.5);
    [station0128.nameOriginalTextPrimitives addObject:drawTextLine0177];

    MWDrawTextLine *drawTextLine0178 = [[MWDrawTextLine alloc] init];
    drawTextLine0178.text = @"d'Italie";
    drawTextLine0178.fontName = @"Helvetica-Bold";
    drawTextLine0178.fontColor = [UIColor blackColor];
    drawTextLine0178.fontSize = 30;
    drawTextLine0178.kernSpacing = 2.0;
    drawTextLine0178.origin = CGPointMake(2740, 3392);
    [station0128.nameOriginalTextPrimitives addObject:drawTextLine0178];

    MWDrawFillCircle *fillCircle0144 = [[MWDrawFillCircle alloc] init];
    fillCircle0144.center = CGPointMake(2744, 3480);
    fillCircle0144.radius = 28;
    fillCircle0144.fillColor = line0006.color;
    [station0128.drawPrimitives addObject:fillCircle0144];

    MWDrawTextLine *drawTextLine0179 = [[MWDrawTextLine alloc] init];
    drawTextLine0179.text = @"5";
    drawTextLine0179.fontName = @"HelveticaNeue-Bold";
    drawTextLine0179.fontColor = [UIColor blackColor];
    drawTextLine0179.fontSize = 44;
    drawTextLine0179.origin = CGPointMake(2732, 3453);
    [station0128.drawPrimitives addObject:drawTextLine0179];

    // Добавляем вершину
    edge0055.finishVertex = vertex0047;

    ////////////////////////////////////////////////////////////////
    // Line 6
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Charles de Gaulle — Étoile - Trocadéro
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0056 = [[MWEdge alloc] init];
    edge0056.identifier = @"edge0056";
    edge0056.developmentName = @"Ребро: Charles de Gaulle — Étoile - Trocadéro";
    [self.edges addObject:edge0056];
    
    // Добавляем линию
    edge0056.line = line0007;
    
    // Добавляем вершину
    edge0056.startVertex = vertex0002;

    // Добавляем станцию Charles de Gaulle — Étoile
    MWStation *station0129 = [[MWStation alloc] init];
    station0129.identifier = @"station0129";
    [edge0056.elements addObject:station0129];
    
    station0129.nameOriginal = @"Charles de Gaulle — Étoile";
    station0129.mapLocation = CGPointMake(1087.5, 1887.5);
    station0129.geoLocation = CGPointMake(48.873611, 2.294444);

    MWDrawFillCircle *fillCircle0145 = [[MWDrawFillCircle alloc] init];
    fillCircle0145.center = CGPointMake(1045, 1866.5);
    fillCircle0145.radius = 28;
    fillCircle0145.fillColor = line0007.color;
    [station0129.drawPrimitives addObject:fillCircle0145];

    MWDrawTextLine *drawTextLine0180 = [[MWDrawTextLine alloc] init];
    drawTextLine0180.text = @"6";
    drawTextLine0180.fontName = @"HelveticaNeue-Bold";
    drawTextLine0180.fontColor = [UIColor blackColor];
    drawTextLine0180.fontSize = 44;
    drawTextLine0180.origin = CGPointMake(1033, 1838.25);
    [station0129.drawPrimitives addObject:drawTextLine0180];

    MWDrawFillCircle *fillCircle0146 = [[MWDrawFillCircle alloc] init];
    fillCircle0146.center = station0129.mapLocation;
    fillCircle0146.radius = 5.5;
    fillCircle0146.fillColor = line0007.color;
    [station0129.drawPrimitives addObject:fillCircle0146];

    // Добавляем перегон
    MWHaul *haul0123 = [[MWHaul alloc] init];
    haul0123.identifier = @"haul0123";
    haul0123.length = 284;
    [edge0056.elements addObject:haul0123];

    MWDrawLine *drawLine0176 = [[MWDrawLine alloc] init];
    drawLine0176.startPoint = CGPointMake(1087.5, 1887.5);
    drawLine0176.endPoint = CGPointMake(1093.5, 1893.5);
    drawLine0176.width = 11;
    drawLine0176.color = line0007.color;
    [haul0123.drawPrimitives addObject:drawLine0176];

    MWDrawArc *drawArc0057 = [[MWDrawArc alloc] init];
    drawArc0057.center = CGPointMake(1082.5, 1903.5);
    drawArc0057.startDegrees = 315;
    drawArc0057.endDegrees = 45;
    drawArc0057.radius = 15;
    drawArc0057.width = 11;
    drawArc0057.color = line0007.color;
    [haul0123.drawPrimitives addObject:drawArc0057];

    MWDrawLine *drawLine0177 = [[MWDrawLine alloc] init];
    drawLine0177.startPoint = CGPointMake(1093.5, 1914);
    drawLine0177.endPoint = CGPointMake(976, 2031);
    drawLine0177.width = 11;
    drawLine0177.color = line0007.color;
    [haul0123.drawPrimitives addObject:drawLine0177];

    // Добавляем станцию Kléber
    MWStation *station0130 = [[MWStation alloc] init];
    station0130.identifier = @"station0130";
    [edge0056.elements addObject:station0130];
    
    station0130.nameOriginal = @"Kléber";
    station0130.mapLocation = CGPointMake(976, 2031);
    station0130.geoLocation = CGPointMake(48.871138, 2.293118);

    MWDrawFillCircle *fillCircle0147 = [[MWDrawFillCircle alloc] init];
    fillCircle0147.center = station0130.mapLocation;
    fillCircle0147.radius = 12;
    fillCircle0147.fillColor = line0007.color;
    [station0130.drawPrimitives addObject:fillCircle0147];

    MWDrawTextLine *drawTextLine0181 = [[MWDrawTextLine alloc] init];
    drawTextLine0181.text = station0130.nameOriginal;
    drawTextLine0181.fontName = @"HelveticaNeue";
    drawTextLine0181.fontColor = [UIColor blackColor];
    drawTextLine0181.fontSize = 34;
    drawTextLine0181.kernSpacing = -0.2;
    drawTextLine0181.origin = CGPointMake(975, 2039);
    [station0130.nameOriginalTextPrimitives addObject:drawTextLine0181];

    // Добавляем перегон
    MWHaul *haul0124 = [[MWHaul alloc] init];
    haul0124.identifier = @"haul0124";
    haul0124.length = 566;
    [edge0056.elements addObject:haul0124];

    MWDrawLine *drawLine0178 = [[MWDrawLine alloc] init];
    drawLine0178.startPoint = CGPointMake(976.5, 2030.5);
    drawLine0178.endPoint = CGPointMake(842.5, 2164);
    drawLine0178.width = 11;
    drawLine0178.color = line0007.color;
    [haul0124.drawPrimitives addObject:drawLine0178];

    // Добавляем станцию Boissière
    MWStation *station0131 = [[MWStation alloc] init];
    station0131.identifier = @"station0131";
    [edge0056.elements addObject:station0131];
    
    station0131.nameOriginal = @"Boissière";
    station0131.mapLocation = CGPointMake(842.5, 2164);
    station0131.geoLocation = CGPointMake(48.867386, 2.290392);

    MWDrawFillCircle *fillCircle0148 = [[MWDrawFillCircle alloc] init];
    fillCircle0148.center = station0131.mapLocation;
    fillCircle0148.radius = 12;
    fillCircle0148.fillColor = line0007.color;
    [station0131.drawPrimitives addObject:fillCircle0148];

    MWDrawTextLine *drawTextLine0182 = [[MWDrawTextLine alloc] init];
    drawTextLine0182.text = station0131.nameOriginal;
    drawTextLine0182.fontName = @"HelveticaNeue";
    drawTextLine0182.fontColor = [UIColor blackColor];
    drawTextLine0182.fontSize = 34;
    drawTextLine0182.kernSpacing = -0.8;
    drawTextLine0182.origin = CGPointMake(855, 2167);
    [station0131.nameOriginalTextPrimitives addObject:drawTextLine0182];

    // Добавляем перегон
    MWHaul *haul0125 = [[MWHaul alloc] init];
    haul0125.identifier = @"haul0125";
    haul0125.length = 491;
    [edge0056.elements addObject:haul0125];

    MWDrawLine *drawLine0179 = [[MWDrawLine alloc] init];
    drawLine0179.startPoint = CGPointMake(843, 2163.5);
    drawLine0179.endPoint = CGPointMake(838.5, 2169);
    drawLine0179.width = 11;
    drawLine0179.color = line0007.color;
    [haul0125.drawPrimitives addObject:drawLine0179];

    MWDrawArc *drawArc0058 = [[MWDrawArc alloc] init];
    drawArc0058.center = CGPointMake(860.5, 2189.5);
    drawArc0058.startDegrees = 180;
    drawArc0058.endDegrees = 225;
    drawArc0058.radius = 30;
    drawArc0058.width = 11;
    drawArc0058.color = line0007.color;
    [haul0125.drawPrimitives addObject:drawArc0058];

    MWDrawLine *drawLine0180 = [[MWDrawLine alloc] init];
    drawLine0180.startPoint = CGPointMake(830.5, 2188.5);
    drawLine0180.endPoint = CGPointMake(830.5, 2350.5);
    drawLine0180.width = 11;
    drawLine0180.color = line0007.color;
    [haul0125.drawPrimitives addObject:drawLine0180];

    // Добавляем станцию Trocadéro
    MWStation *station0132 = [[MWStation alloc] init];
    station0132.identifier = @"station0132";
    [edge0056.elements addObject:station0132];
    
    station0132.nameOriginal = @"Trocadéro";
    station0132.mapLocation = CGPointMake(830.5, 2350.5);
    station0132.geoLocation = CGPointMake(48.863301, 2.287061);

    MWDrawFillCircle *fillCircle0149 = [[MWDrawFillCircle alloc] init];
    fillCircle0149.center = station0132.mapLocation;
    fillCircle0149.radius = 3;
    fillCircle0149.fillColor = [UIColor whiteColor];
    [station0132.drawPrimitives addObject:fillCircle0149];
    
    MWDrawTextLine *drawTextLine0183 = [[MWDrawTextLine alloc] init];
    drawTextLine0183.text = station0132.nameOriginal;
    drawTextLine0183.fontName = @"HelveticaNeue";
    drawTextLine0183.fontColor = [UIColor blackColor];
    drawTextLine0183.fontSize = 34;
    drawTextLine0183.kernSpacing = -0.8;
    drawTextLine0183.origin = CGPointMake(845, 2356);
    [station0132.nameOriginalTextPrimitives addObject:drawTextLine0183];

    // Добавляем вершину
    edge0056.finishVertex = vertex0048;

    // Создаем участок линии Trocadéro - La Motte-Picquet — Grenelle
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0057 = [[MWEdge alloc] init];
    edge0057.identifier = @"edge0057";
    edge0057.developmentName = @"Ребро: Trocadéro - La Motte-Picquet — Grenelle";
    [self.edges addObject:edge0057];
    
    // Добавляем линию
    edge0057.line = line0007;
    
    // Добавляем вершину
    edge0057.startVertex = vertex0048;

    // Добавляем станцию Trocadéro
    [edge0057.elements addObject:station0131];

    // Добавляем перегон
    MWHaul *haul0126 = [[MWHaul alloc] init];
    haul0126.identifier = @"haul0126";
    haul0126.length = 655;
    [edge0057.elements addObject:haul0126];

    MWDrawLine *drawLine0181 = [[MWDrawLine alloc] init];
    drawLine0181.startPoint = CGPointMake(830.5, 2350);
    drawLine0181.endPoint = CGPointMake(830.5, 2555);
    drawLine0181.width = 11;
    drawLine0181.color = line0007.color;
    [haul0126.drawPrimitives addObject:drawLine0181];

    MWDrawArc *drawArc0059 = [[MWDrawArc alloc] init];
    drawArc0059.center = CGPointMake(860.5, 2555);
    drawArc0059.startDegrees = 135;
    drawArc0059.endDegrees = 180;
    drawArc0059.radius = 30;
    drawArc0059.width = 11;
    drawArc0059.color = line0007.color;
    [haul0126.drawPrimitives addObject:drawArc0059];

    MWDrawLine *drawLine0182 = [[MWDrawLine alloc] init];
    drawLine0182.startPoint = CGPointMake(839, 2576);
    drawLine0182.endPoint = CGPointMake(844.5, 2581.5);
    drawLine0182.width = 11;
    drawLine0182.color = line0007.color;
    [haul0126.drawPrimitives addObject:drawLine0182];

    // Добавляем станцию Passy
    MWStation *station0133 = [[MWStation alloc] init];
    station0133.identifier = @"station0133";
    [edge0057.elements addObject:station0133];
    
    station0133.nameOriginal = @"Passy";
    station0133.mapLocation = CGPointMake(844.5, 2581.5);
    station0133.geoLocation = CGPointMake(48.857445, 2.285779);
    
    MWDrawFillCircle *fillCircle0151 = [[MWDrawFillCircle alloc] init];
    fillCircle0151.center = station0133.mapLocation;
    fillCircle0151.radius = 12;
    fillCircle0151.fillColor = line0007.color;
    [station0133.drawPrimitives addObject:fillCircle0151];

    MWDrawTextLine *drawTextLine0184 = [[MWDrawTextLine alloc] init];
    drawTextLine0184.text = station0133.nameOriginal;
    drawTextLine0184.fontName = @"HelveticaNeue";
    drawTextLine0184.fontColor = [UIColor blackColor];
    drawTextLine0184.fontSize = 34;
    drawTextLine0184.kernSpacing = -2.2;
    drawTextLine0184.origin = CGPointMake(854, 2534);
    [station0133.nameOriginalTextPrimitives addObject:drawTextLine0184];

    // Добавляем перегон
    MWHaul *haul0127 = [[MWHaul alloc] init];
    haul0127.identifier = @"haul0127";
    haul0127.length = 476;
    [edge0057.elements addObject:haul0127];

    MWDrawLine *drawLine0183 = [[MWDrawLine alloc] init];
    drawLine0183.startPoint = CGPointMake(844, 2581);
    drawLine0183.endPoint = CGPointMake(969.5, 2706.5);
    drawLine0183.width = 11;
    drawLine0183.color = line0007.color;
    [haul0127.drawPrimitives addObject:drawLine0183];
    
    // Добавляем станцию Bir-Hakeim
    MWStation *station0134 = [[MWStation alloc] init];
    station0134.identifier = @"station0134";
    [edge0057.elements addObject:station0134];
    
    station0134.nameOriginal = @"Bir-Hakeim";
    station0134.mapLocation = CGPointMake(969.5, 2706.5);
    station0134.geoLocation = CGPointMake(48.853917, 2.289332);
    
    MWDrawFillCircle *fillCircle0152 = [[MWDrawFillCircle alloc] init];
    fillCircle0152.center = station0134.mapLocation;
    fillCircle0152.radius = 13;
    fillCircle0152.fillColor = [UIColor blackColor];
    [station0134.drawPrimitives addObject:fillCircle0152];

    MWDrawFillCircle *fillCircle0697 = [[MWDrawFillCircle alloc] init];
    fillCircle0697.center = station0134.mapLocation;
    fillCircle0697.radius = 11;
    fillCircle0697.fillColor = [UIColor whiteColor];
    [station0134.drawPrimitives addObject:fillCircle0697];

    MWDrawTextLine *drawTextLine0185 = [[MWDrawTextLine alloc] init];
    drawTextLine0185.text = station0134.nameOriginal;
    drawTextLine0185.fontName = @"HelveticaNeue";
    drawTextLine0185.fontColor = [UIColor blackColor];
    drawTextLine0185.fontSize = 34;
    drawTextLine0185.kernSpacing = -0.2;
    drawTextLine0185.origin = CGPointMake(988, 2679);
    [station0134.nameOriginalTextPrimitives addObject:drawTextLine0185];
    
    // Добавляем перегон
    MWHaul *haul0128 = [[MWHaul alloc] init];
    haul0128.identifier = @"haul0128";
    haul0128.length = 508;
    [edge0057.elements addObject:haul0128];

    MWDrawLine *drawLine0184 = [[MWDrawLine alloc] init];
    drawLine0184.startPoint = CGPointMake(969, 2706);
    drawLine0184.endPoint = CGPointMake(1078, 2815);
    drawLine0184.width = 11;
    drawLine0184.color = line0007.color;
    [haul0128.drawPrimitives addObject:drawLine0184];

    // Добавляем станцию Dupleix
    MWStation *station0135 = [[MWStation alloc] init];
    station0135.identifier = @"station0135";
    [edge0057.elements addObject:station0135];
    
    station0135.nameOriginal = @"Dupleix";
    station0135.mapLocation = CGPointMake(1078, 2815);
    station0135.geoLocation = CGPointMake(48.850392, 2.293611);

    MWDrawFillCircle *fillCircle0153 = [[MWDrawFillCircle alloc] init];
    fillCircle0153.center = station0135.mapLocation;
    fillCircle0153.radius = 12;
    fillCircle0153.fillColor = line0007.color;
    [station0135.drawPrimitives addObject:fillCircle0153];

    MWDrawTextLine *drawTextLine0186 = [[MWDrawTextLine alloc] init];
    drawTextLine0186.text = station0135.nameOriginal;
    drawTextLine0186.fontName = @"HelveticaNeue";
    drawTextLine0186.fontColor = [UIColor blackColor];
    drawTextLine0186.fontSize = 34;
    drawTextLine0186.kernSpacing = -0.0;
    drawTextLine0186.origin = CGPointMake(1089, 2768);
    [station0135.nameOriginalTextPrimitives addObject:drawTextLine0186];

    // Добавляем перегон
    MWHaul *haul0129 = [[MWHaul alloc] init];
    haul0129.identifier = @"haul0129";
    haul0129.length = 356;
    [edge0057.elements addObject:haul0129];
    
    MWDrawLine *drawLine0185 = [[MWDrawLine alloc] init];
    drawLine0185.startPoint = CGPointMake(1077.5, 2814.5);
    drawLine0185.endPoint = CGPointMake(1189, 2926);
    drawLine0185.width = 11;
    drawLine0185.color = line0007.color;
    [haul0129.drawPrimitives addObject:drawLine0185];

    MWDrawArc *drawArc0060 = [[MWDrawArc alloc] init];
    drawArc0060.center = CGPointMake(1210, 2904.5);
    drawArc0060.startDegrees = 90;
    drawArc0060.endDegrees = 135;
    drawArc0060.radius = 30;
    drawArc0060.width = 11;
    drawArc0060.color = line0007.color;
    [haul0129.drawPrimitives addObject:drawArc0060];

    MWDrawLine *drawLine0186 = [[MWDrawLine alloc] init];
    drawLine0186.startPoint = CGPointMake(1210, 2934.5);
    drawLine0186.endPoint = CGPointMake(1231, 2934.5);
    drawLine0186.width = 11;
    drawLine0186.color = line0007.color;
    [haul0129.drawPrimitives addObject:drawLine0186];

    // Добавляем станцию La Motte-Picquet — Grenelle
    MWStation *station0136 = [[MWStation alloc] init];
    station0136.identifier = @"station0136";
    [edge0057.elements addObject:station0136];
    
    station0136.nameOriginal = @"La Motte-Picquet — Grenelle";
    station0136.mapLocation = CGPointMake(1231, 2934.5);
    station0136.geoLocation = CGPointMake(48.849143, 2.29809);

    MWDrawFillCircle *fillCircle0154 = [[MWDrawFillCircle alloc] init];
    fillCircle0154.center = station0136.mapLocation;
    fillCircle0154.radius = 3;
    fillCircle0154.fillColor = [UIColor whiteColor];
    [station0136.drawPrimitives addObject:fillCircle0154];

    MWDrawTextLine *drawTextLine0187 = [[MWDrawTextLine alloc] init];
    drawTextLine0187.text = @"La Motte";
    drawTextLine0187.fontName = @"HelveticaNeue";
    drawTextLine0187.fontColor = [UIColor blackColor];
    drawTextLine0187.fontSize = 34;
    drawTextLine0187.kernSpacing = -0.4;
    drawTextLine0187.origin = CGPointMake(1246, 2796);
    [station0136.nameOriginalTextPrimitives addObject:drawTextLine0187];

    MWDrawTextLine *drawTextLine0188 = [[MWDrawTextLine alloc] init];
    drawTextLine0188.text = @"Picquet";
    drawTextLine0188.fontName = @"HelveticaNeue";
    drawTextLine0188.fontColor = [UIColor blackColor];
    drawTextLine0188.fontSize = 34;
    drawTextLine0188.kernSpacing = -0.8;
    drawTextLine0188.origin = CGPointMake(1246, 2829);
    [station0136.nameOriginalTextPrimitives addObject:drawTextLine0188];

    MWDrawTextLine *drawTextLine0189 = [[MWDrawTextLine alloc] init];
    drawTextLine0189.text = @"Grenelle";
    drawTextLine0189.fontName = @"HelveticaNeue";
    drawTextLine0189.fontColor = [UIColor blackColor];
    drawTextLine0189.fontSize = 34;
    drawTextLine0189.kernSpacing = -0.4;
    drawTextLine0189.origin = CGPointMake(1246, 2863);
    [station0136.nameOriginalTextPrimitives addObject:drawTextLine0189];

    // Добавляем вершину
    edge0057.finishVertex = vertex0049;

    // Создаем участок линии La Motte-Picquet — Grenelle - Pasteur
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0058 = [[MWEdge alloc] init];
    edge0058.identifier = @"edge0058";
    edge0058.developmentName = @"Ребро: La Motte-Picquet — Grenelle - Pasteur";
    [self.edges addObject:edge0058];
    
    // Добавляем линию
    edge0058.line = line0007;
    
    // Добавляем вершину
    edge0058.startVertex = vertex0049;

    // Добавляем станцию La Motte-Picquet — Grenelle
    [edge0058.elements addObject:station0136];

    // Добавляем перегон
    MWHaul *haul0130 = [[MWHaul alloc] init];
    haul0130.identifier = @"haul0130";
    haul0130.length = 400;
    [edge0058.elements addObject:haul0130];

    MWDrawLine *drawLine0187 = [[MWDrawLine alloc] init];
    drawLine0187.startPoint = CGPointMake(1230.5, 2934.5);
    drawLine0187.endPoint = CGPointMake(1369, 2934.5);
    drawLine0187.width = 11;
    drawLine0187.color = line0007.color;
    [haul0130.drawPrimitives addObject:drawLine0187];

    MWDrawArc *drawArc0061 = [[MWDrawArc alloc] init];
    drawArc0061.center = CGPointMake(1368.5, 2964.5);
    drawArc0061.startDegrees = 270;
    drawArc0061.endDegrees = 315;
    drawArc0061.radius = 30;
    drawArc0061.width = 11;
    drawArc0061.color = line0007.color;
    [haul0130.drawPrimitives addObject:drawArc0061];
    
    MWDrawLine *drawLine0188 = [[MWDrawLine alloc] init];
    drawLine0188.startPoint = CGPointMake(1389.5, 2943);
    drawLine0188.endPoint = CGPointMake(1437.5, 2991);
    drawLine0188.width = 11;
    drawLine0188.color = line0007.color;
    [haul0130.drawPrimitives addObject:drawLine0188];

    // Добавляем станцию Cambronne
    MWStation *station0137 = [[MWStation alloc] init];
    station0137.identifier = @"station0137";
    [edge0058.elements addObject:station0137];
    
    station0137.nameOriginal = @"Cambronne";
    station0137.mapLocation = CGPointMake(1437.5, 2991);
    station0137.geoLocation = CGPointMake(48.847537, 2.302937);

    MWDrawFillCircle *fillCircle0155 = [[MWDrawFillCircle alloc] init];
    fillCircle0155.center = station0137.mapLocation;
    fillCircle0155.radius = 12;
    fillCircle0155.fillColor = line0007.color;
    [station0137.drawPrimitives addObject:fillCircle0155];

    MWDrawTextLine *drawTextLine0190 = [[MWDrawTextLine alloc] init];
    drawTextLine0190.text = station0137.nameOriginal;
    drawTextLine0190.fontName = @"HelveticaNeue";
    drawTextLine0190.fontColor = [UIColor blackColor];
    drawTextLine0190.fontSize = 34;
    drawTextLine0190.kernSpacing = -0.6;
    drawTextLine0190.origin = CGPointMake(1257, 2991);
    [station0137.nameOriginalTextPrimitives addObject:drawTextLine0190];

    // Добавляем перегон
    MWHaul *haul0131 = [[MWHaul alloc] init];
    haul0131.identifier = @"haul0131";
    haul0131.length = 529;
    [edge0058.elements addObject:haul0131];
    
    MWDrawLine *drawLine0189 = [[MWDrawLine alloc] init];
    drawLine0189.startPoint = CGPointMake(1437, 2990.5);
    drawLine0189.endPoint = CGPointMake(1548.5, 3102);
    drawLine0189.width = 11;
    drawLine0189.color = line0007.color;
    [haul0131.drawPrimitives addObject:drawLine0189];

    // Добавляем станцию Sèvres — Lecourbe
    MWStation *station0138 = [[MWStation alloc] init];
    station0138.identifier = @"station0138";
    [edge0058.elements addObject:station0138];
    
    station0138.nameOriginal = @"Sèvres — Lecourbe";
    station0138.mapLocation = CGPointMake(1548.5, 3102);
    station0138.geoLocation = CGPointMake(48.845634, 2.309476);

    MWDrawFillCircle *fillCircle0156 = [[MWDrawFillCircle alloc] init];
    fillCircle0156.center = station0138.mapLocation;
    fillCircle0156.radius = 12;
    fillCircle0156.fillColor = line0007.color;
    [station0138.drawPrimitives addObject:fillCircle0156];

    MWDrawTextLine *drawTextLine0191 = [[MWDrawTextLine alloc] init];
    drawTextLine0191.text = @"Sèvres";
    drawTextLine0191.fontName = @"HelveticaNeue";
    drawTextLine0191.fontColor = [UIColor blackColor];
    drawTextLine0191.fontSize = 34;
    drawTextLine0191.kernSpacing = -1.8;
    drawTextLine0191.origin = CGPointMake(1445, 3102);
    [station0138.nameOriginalTextPrimitives addObject:drawTextLine0191];

    MWDrawTextLine *drawTextLine0192 = [[MWDrawTextLine alloc] init];
    drawTextLine0192.text = @"Lecourbe";
    drawTextLine0192.fontName = @"HelveticaNeue";
    drawTextLine0192.fontColor = [UIColor blackColor];
    drawTextLine0192.fontSize = 34;
    drawTextLine0192.kernSpacing = -0.6;
    drawTextLine0192.origin = CGPointMake(1400, 3135);
    [station0138.nameOriginalTextPrimitives addObject:drawTextLine0192];

    // Добавляем перегон
    MWHaul *haul0132 = [[MWHaul alloc] init];
    haul0132.identifier = @"haul0132";
    haul0132.length = 405;
    [edge0058.elements addObject:haul0132];
    
    MWDrawLine *drawLine0190 = [[MWDrawLine alloc] init];
    drawLine0190.startPoint = CGPointMake(1548, 3101.5);
    drawLine0190.endPoint = CGPointMake(1609, 3160.5);
    drawLine0190.width = 11;
    drawLine0190.color = line0007.color;
    [haul0132.drawPrimitives addObject:drawLine0190];

    MWDrawArc *drawArc0062 = [[MWDrawArc alloc] init];
    drawArc0062.center = CGPointMake(1629.5, 3138.5);
    drawArc0062.startDegrees = 90;
    drawArc0062.endDegrees = 135;
    drawArc0062.radius = 30;
    drawArc0062.width = 11;
    drawArc0062.color = line0007.color;
    [haul0132.drawPrimitives addObject:drawArc0062];

    MWDrawLine *drawLine0191 = [[MWDrawLine alloc] init];
    drawLine0191.startPoint = CGPointMake(1629, 3168.5);
    drawLine0191.endPoint = CGPointMake(1709.5, 3168.5);
    drawLine0191.width = 11;
    drawLine0191.color = line0007.color;
    [haul0132.drawPrimitives addObject:drawLine0191];

    // Добавляем станцию Pasteur
    MWStation *station0139 = [[MWStation alloc] init];
    station0139.identifier = @"station0139";
    [edge0058.elements addObject:station0139];
    
    station0139.nameOriginal = @"Pasteur";
    station0139.mapLocation = CGPointMake(1709.5, 3168.5);
    station0139.geoLocation = CGPointMake(48.842836, 2.312681);

    MWDrawFillCircle *fillCircle0157 = [[MWDrawFillCircle alloc] init];
    fillCircle0157.center = station0139.mapLocation;
    fillCircle0157.radius = 3;
    fillCircle0157.fillColor = [UIColor whiteColor];
    [station0139.drawPrimitives addObject:fillCircle0157];

    MWDrawTextLine *drawTextLine0193 = [[MWDrawTextLine alloc] init];
    drawTextLine0193.text = station0139.nameOriginal;
    drawTextLine0193.fontName = @"HelveticaNeue";
    drawTextLine0193.fontColor = [UIColor blackColor];
    drawTextLine0193.fontSize = 34;
    drawTextLine0193.kernSpacing = -1.2;
    drawTextLine0193.origin = CGPointMake(1715, 3174);
    [station0139.nameOriginalTextPrimitives addObject:drawTextLine0193];

    // Добавляем вершину
    edge0058.finishVertex = vertex0050;

    // Создаем участок линии Pasteur - Montparnasse — Bienvenüe
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0059 = [[MWEdge alloc] init];
    edge0059.identifier = @"edge0059";
    edge0059.developmentName = @"Ребро: Pasteur - Montparnasse — Bienvenüe";
    [self.edges addObject:edge0059];
    
    // Добавляем линию
    edge0059.line = line0007;
    
    // Добавляем вершину
    edge0059.startVertex = vertex0050;

    // Добавляем станцию Pasteur
    [edge0059.elements addObject:station0139];

    // Добавляем перегон
    MWHaul *haul0133 = [[MWHaul alloc] init];
    haul0133.identifier = @"haul0133";
    haul0133.length = 943;
    [edge0059.elements addObject:haul0133];

    MWDrawLine *drawLine0192 = [[MWDrawLine alloc] init];
    drawLine0192.startPoint = CGPointMake(1709, 3168.5);
    drawLine0192.endPoint = CGPointMake(1923.5, 3168.5);
    drawLine0192.width = 11;
    drawLine0192.color = line0007.color;
    [haul0133.drawPrimitives addObject:drawLine0192];

    // Добавляем станцию Montparnasse — Bienvenüe
    MWStation *station0140 = [[MWStation alloc] init];
    station0140.identifier = @"station0140";
    [edge0059.elements addObject:station0140];
    
    station0140.nameOriginal = @"Montparnasse — Bienvenüe";
    station0140.mapLocation = CGPointMake(1923.5, 3168.5);
    station0140.geoLocation = CGPointMake(48.843466, 2.323072);

    MWDrawFillCircle *fillCircle0158 = [[MWDrawFillCircle alloc] init];
    fillCircle0158.center = station0140.mapLocation;
    fillCircle0158.radius = 3;
    fillCircle0158.fillColor = [UIColor whiteColor];
    [station0140.drawPrimitives addObject:fillCircle0158];

    station0140.showNameOnMap = false;
    [station0140.nameOriginalTextPrimitives addObject:drawTextLine0137];
    [station0140.nameOriginalTextPrimitives addObject:drawTextLine0138];
    
    // Добавляем вершину
    edge0059.finishVertex = vertex0040;

    // Создаем участок линии Montparnasse — Bienvenüe - Raspail
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0060 = [[MWEdge alloc] init];
    edge0060.identifier = @"edge0060";
    edge0060.developmentName = @"Ребро: Montparnasse — Bienvenüe - Raspail";
    [self.edges addObject:edge0060];
    
    // Добавляем линию
    edge0060.line = line0007;
    
    // Добавляем вершину
    edge0060.startVertex = vertex0040;

    // Добавляем станцию Montparnasse — Bienvenüe
    [edge0060.elements addObject:station0140];

    // Добавляем перегон
    MWHaul *haul0134 = [[MWHaul alloc] init];
    haul0134.identifier = @"haul0134";
    haul0134.length = 429;
    [edge0060.elements addObject:haul0134];
    
    MWDrawLine *drawLine0193 = [[MWDrawLine alloc] init];
    drawLine0193.startPoint = CGPointMake(1923, 3168.5);
    drawLine0193.endPoint = CGPointMake(2021, 3168.5);
    drawLine0193.width = 11;
    drawLine0193.color = line0007.color;
    [haul0134.drawPrimitives addObject:drawLine0193];

    // Добавляем станцию Edgar Quinet
    MWStation *station0141 = [[MWStation alloc] init];
    station0141.identifier = @"station0141";
    [edge0060.elements addObject:station0141];
    
    station0141.nameOriginal = @"Edgar Quinet";
    station0141.mapLocation = CGPointMake(2021, 3168.5);
    station0141.geoLocation = CGPointMake(48.841048, 2.325084);
    
    MWDrawFillCircle *fillCircle0159 = [[MWDrawFillCircle alloc] init];
    fillCircle0159.center = station0141.mapLocation;
    fillCircle0159.radius = 12;
    fillCircle0159.fillColor = line0007.color;
    [station0141.drawPrimitives addObject:fillCircle0159];

    MWDrawTextLine *drawTextLine0194 = [[MWDrawTextLine alloc] init];
    drawTextLine0194.text = @"Edgar";
    drawTextLine0194.fontName = @"HelveticaNeue";
    drawTextLine0194.fontColor = [UIColor blackColor];
    drawTextLine0194.fontSize = 34;
    drawTextLine0194.kernSpacing = -1.2;
    drawTextLine0194.origin = CGPointMake(1974, 3177);
    [station0141.nameOriginalTextPrimitives addObject:drawTextLine0194];

    MWDrawTextLine *drawTextLine0195 = [[MWDrawTextLine alloc] init];
    drawTextLine0195.text = @"Quinet";
    drawTextLine0195.fontName = @"HelveticaNeue";
    drawTextLine0195.fontColor = [UIColor blackColor];
    drawTextLine0195.fontSize = 34;
    drawTextLine0195.kernSpacing = 0.5;
    drawTextLine0195.origin = CGPointMake(1958, 3210);
    [station0141.nameOriginalTextPrimitives addObject:drawTextLine0195];

    // Добавляем перегон
    MWHaul *haul0135 = [[MWHaul alloc] init];
    haul0135.identifier = @"haul0135";
    haul0135.length = 455;
    [edge0060.elements addObject:haul0135];

    MWDrawLine *drawLine0194 = [[MWDrawLine alloc] init];
    drawLine0194.startPoint = CGPointMake(2020.5, 3168.5);
    drawLine0194.endPoint = CGPointMake(2142, 3168.5);
    drawLine0194.width = 11;
    drawLine0194.color = line0007.color;
    [haul0135.drawPrimitives addObject:drawLine0194];

    MWDrawArc *drawArc0063 = [[MWDrawArc alloc] init];
    drawArc0063.center = CGPointMake(2142, 3198.5);
    drawArc0063.startDegrees = 270;
    drawArc0063.endDegrees = 315;
    drawArc0063.radius = 30;
    drawArc0063.width = 11;
    drawArc0063.color = line0007.color;
    [haul0135.drawPrimitives addObject:drawArc0063];

    MWDrawLine *drawLine0195 = [[MWDrawLine alloc] init];
    drawLine0195.startPoint = CGPointMake(2163, 3177);
    drawLine0195.endPoint = CGPointMake(2200, 3214);
    drawLine0195.width = 11;
    drawLine0195.color = line0007.color;
    [haul0135.drawPrimitives addObject:drawLine0195];

    // Добавляем станцию Raspail
    MWStation *station0142 = [[MWStation alloc] init];
    station0142.identifier = @"station0142";
    [edge0060.elements addObject:station0142];
    
    station0142.nameOriginal = @"Raspail";
    station0142.mapLocation = CGPointMake(2200, 3214);
    station0142.geoLocation = CGPointMake(48.839194, 2.330606);

    MWDrawFillCircle *fillCircle0160 = [[MWDrawFillCircle alloc] init];
    fillCircle0160.center = station0142.mapLocation;
    fillCircle0160.radius = 3;
    fillCircle0160.fillColor = [UIColor whiteColor];
    [station0142.drawPrimitives addObject:fillCircle0160];
    
    station0142.showNameOnMap = false;
    [station0142.nameOriginalTextPrimitives addObject:drawTextLine0140];

    // Добавляем вершину
    edge0060.finishVertex = vertex0041;

    // Создаем участок линии Raspail - Denfert-Rochereau
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0061 = [[MWEdge alloc] init];
    edge0061.identifier = @"edge0061";
    edge0061.developmentName = @"Ребро: Raspail - Denfert-Rochereau";
    [self.edges addObject:edge0061];
    
    // Добавляем линию
    edge0061.line = line0007;
    
    // Добавляем вершину
    edge0061.startVertex = vertex0041;

    // Добавляем станцию Raspail
    [edge0061.elements addObject:station0142];

    // Добавляем перегон
    MWHaul *haul0136 = [[MWHaul alloc] init];
    haul0136.identifier = @"haul0136";
    haul0136.length = 589;
    [edge0061.elements addObject:haul0136];

    MWDrawLine *drawLine0196 = [[MWDrawLine alloc] init];
    drawLine0196.startPoint = CGPointMake(2199.5, 3213.5);
    drawLine0196.endPoint = CGPointMake(2296.5, 3310);
    drawLine0196.width = 11;
    drawLine0196.color = line0007.color;
    [haul0136.drawPrimitives addObject:drawLine0196];

    // Добавляем станцию Denfert-Rochereau
    MWStation *station0143 = [[MWStation alloc] init];
    station0143.identifier = @"station0143";
    [edge0061.elements addObject:station0143];
    
    station0143.nameOriginal = @"Denfert-Rochereau";
    station0143.mapLocation = CGPointMake(2296.5, 3310);
    station0143.geoLocation = CGPointMake(48.833901, 2.332728);

    MWDrawFillCircle *fillCircle0161 = [[MWDrawFillCircle alloc] init];
    fillCircle0161.center = station0143.mapLocation;
    fillCircle0161.radius = 3;
    fillCircle0161.fillColor = [UIColor whiteColor];
    [station0143.drawPrimitives addObject:fillCircle0161];

    station0143.showNameOnMap = false;
    [station0143.nameOriginalTextPrimitives addObject:drawTextLine0141];
    [station0143.nameOriginalTextPrimitives addObject:drawTextLine0142];
    
    // Добавляем вершину
    edge0061.finishVertex = vertex0042;

    // Создаем участок линии Denfert-Rochereau - Place d'Italie
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0062 = [[MWEdge alloc] init];
    edge0062.identifier = @"edge0062";
    edge0062.developmentName = @"Ребро: Denfert-Rochereau - Place d'Italie";
    [self.edges addObject:edge0062];
    
    // Добавляем линию
    edge0062.line = line0007;
    
    // Добавляем вершину
    edge0062.startVertex = vertex0042;

    // Добавляем станцию Denfert-Rochereau
    [edge0062.elements addObject:station0143];

    // Добавляем перегон
    MWHaul *haul0137 = [[MWHaul alloc] init];
    haul0137.identifier = @"haul0137";
    haul0137.length = 344;
    [edge0062.elements addObject:haul0137];
    
    MWDrawLine *drawLine0197 = [[MWDrawLine alloc] init];
    drawLine0197.startPoint = CGPointMake(2296, 3309.5);
    drawLine0197.endPoint = CGPointMake(2363, 3376);
    drawLine0197.width = 11;
    drawLine0197.color = line0007.color;
    [haul0137.drawPrimitives addObject:drawLine0197];

    // Добавляем станцию Saint-Jacques
    MWStation *station0144 = [[MWStation alloc] init];
    station0144.identifier = @"station0144";
    [edge0062.elements addObject:station0144];
    
    station0144.nameOriginal = @"Saint-Jacques";
    station0144.mapLocation = CGPointMake(2363, 3376.5);
    station0144.geoLocation = CGPointMake(48.832913, 2.337081);

    MWDrawFillCircle *fillCircle0162 = [[MWDrawFillCircle alloc] init];
    fillCircle0162.center = station0144.mapLocation;
    fillCircle0162.radius = 12;
    fillCircle0162.fillColor = line0007.color;
    [station0144.drawPrimitives addObject:fillCircle0162];

    MWDrawTextLine *drawTextLine0196 = [[MWDrawTextLine alloc] init];
    drawTextLine0196.text = station0144.nameOriginal;
    drawTextLine0196.fontName = @"HelveticaNeue";
    drawTextLine0196.fontColor = [UIColor blackColor];
    drawTextLine0196.fontSize = 34;
    drawTextLine0196.kernSpacing = -1.8;
    drawTextLine0196.origin = CGPointMake(2375, 3330);
    [station0144.nameOriginalTextPrimitives addObject:drawTextLine0196];

    // Добавляем перегон
    MWHaul *haul0138 = [[MWHaul alloc] init];
    haul0138.identifier = @"haul0138";
    haul0138.length = 501;
    [edge0062.elements addObject:haul0138];
    
    MWDrawLine *drawLine0198 = [[MWDrawLine alloc] init];
    drawLine0198.startPoint = CGPointMake(2362.5, 3375.5);
    drawLine0198.endPoint = CGPointMake(2414, 3427);
    drawLine0198.width = 11;
    drawLine0198.color = line0007.color;
    [haul0137.drawPrimitives addObject:drawLine0198];

    MWDrawArc *drawArc0064 = [[MWDrawArc alloc] init];
    drawArc0064.center = CGPointMake(2434.5, 3405);
    drawArc0064.startDegrees = 90;
    drawArc0064.endDegrees = 135;
    drawArc0064.radius = 30;
    drawArc0064.width = 11;
    drawArc0064.color = line0007.color;
    [haul0138.drawPrimitives addObject:drawArc0064];

    MWDrawLine *drawLine0199 = [[MWDrawLine alloc] init];
    drawLine0199.startPoint = CGPointMake(2434, 3435);
    drawLine0199.endPoint = CGPointMake(2477, 3435);
    drawLine0199.width = 11;
    drawLine0199.color = line0007.color;
    [haul0137.drawPrimitives addObject:drawLine0199];

    // Добавляем станцию Glacière
    MWStation *station0145 = [[MWStation alloc] init];
    station0145.identifier = @"station0145";
    [edge0062.elements addObject:station0145];
    
    station0145.nameOriginal = @"Glacière";
    station0145.mapLocation = CGPointMake(2477, 3435);
    station0145.geoLocation = CGPointMake(48.83115, 2.343384);

    MWDrawFillCircle *fillCircle0163 = [[MWDrawFillCircle alloc] init];
    fillCircle0163.center = station0145.mapLocation;
    fillCircle0163.radius = 12;
    fillCircle0163.fillColor = line0007.color;
    [station0145.drawPrimitives addObject:fillCircle0163];

    MWDrawTextLine *drawTextLine0197 = [[MWDrawTextLine alloc] init];
    drawTextLine0197.text = station0145.nameOriginal;
    drawTextLine0197.fontName = @"HelveticaNeue";
    drawTextLine0197.fontColor = [UIColor blackColor];
    drawTextLine0197.fontSize = 34;
    drawTextLine0197.kernSpacing = -0.6;
    drawTextLine0197.origin = CGPointMake(2417, 3447);
    [station0145.nameOriginalTextPrimitives addObject:drawTextLine0197];
    
    // Добавляем перегон
    MWHaul *haul0139 = [[MWHaul alloc] init];
    haul0139.identifier = @"haul0139";
    haul0139.length = 568;
    [edge0062.elements addObject:haul0139];
    
    MWDrawLine *drawLine0200 = [[MWDrawLine alloc] init];
    drawLine0200.startPoint = CGPointMake(2476.5, 3435);
    drawLine0200.endPoint = CGPointMake(2613.5, 3435);
    drawLine0200.width = 11;
    drawLine0200.color = line0007.color;
    [haul0139.drawPrimitives addObject:drawLine0200];

    // Добавляем станцию Corvisart
    MWStation *station0146 = [[MWStation alloc] init];
    station0146.identifier = @"station0146";
    [edge0062.elements addObject:station0146];
    
    station0146.nameOriginal = @"Corvisart";
    station0146.mapLocation = CGPointMake(2613.5, 3435);
    station0146.geoLocation = CGPointMake(48.829807, 2.350508);

    MWDrawFillCircle *fillCircle0164 = [[MWDrawFillCircle alloc] init];
    fillCircle0164.center = station0146.mapLocation;
    fillCircle0164.radius = 12;
    fillCircle0164.fillColor = line0007.color;
    [station0146.drawPrimitives addObject:fillCircle0164];

    MWDrawTextLine *drawTextLine0198 = [[MWDrawTextLine alloc] init];
    drawTextLine0198.text = station0146.nameOriginal;
    drawTextLine0198.fontName = @"HelveticaNeue";
    drawTextLine0198.fontColor = [UIColor blackColor];
    drawTextLine0198.fontSize = 34;
    drawTextLine0198.kernSpacing = -0.6;
    drawTextLine0198.origin = CGPointMake(2547, 3380);
    [station0146.nameOriginalTextPrimitives addObject:drawTextLine0198];

    // Добавляем перегон
    MWHaul *haul0140 = [[MWHaul alloc] init];
    haul0140.identifier = @"haul0140";
    haul0140.length = 422;
    [edge0062.elements addObject:haul0140];
    
    MWDrawLine *drawLine0201 = [[MWDrawLine alloc] init];
    drawLine0201.startPoint = CGPointMake(2613, 3435);
    drawLine0201.endPoint = CGPointMake(2716, 3435);
    drawLine0201.width = 11;
    drawLine0201.color = line0007.color;
    [haul0140.drawPrimitives addObject:drawLine0201];

    // Добавляем станцию Place d'Italie
    MWStation *station0147 = [[MWStation alloc] init];
    station0147.identifier = @"station0147";
    [edge0062.elements addObject:station0147];
    
    station0147.nameOriginal = @"Place d'Italie";
    station0147.mapLocation = CGPointMake(2716, 3435);
    station0147.geoLocation = CGPointMake(48.831483, 2.355692);

    MWDrawFillCircle *fillCircle0165 = [[MWDrawFillCircle alloc] init];
    fillCircle0165.center = station0147.mapLocation;
    fillCircle0165.radius = 3;
    fillCircle0165.fillColor = [UIColor whiteColor];
    [station0147.drawPrimitives addObject:fillCircle0165];

    station0147.showNameOnMap = false;
    [station0147.nameOriginalTextPrimitives addObject:drawTextLine0177];
    [station0147.nameOriginalTextPrimitives addObject:drawTextLine0178];
    
    // Добавляем вершину
    edge0062.finishVertex = vertex0047;
    
    // Создаем участок линии Place d'Italie - Bercy
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0063 = [[MWEdge alloc] init];
    edge0063.identifier = @"edge0063";
    edge0063.developmentName = @"Ребро: Place d'Italie - Bercy";
    [self.edges addObject:edge0063];
    
    // Добавляем линию
    edge0063.line = line0007;
    
    // Добавляем вершину
    edge0063.startVertex = vertex0047;

    // Добавляем станцию Place d'Italie
    [edge0063.elements addObject:station0147];

    // Добавляем перегон
    MWHaul *haul0141 = [[MWHaul alloc] init];
    haul0141.identifier = @"haul0141";
    haul0141.length = 557;
    [edge0063.elements addObject:haul0141];

    MWDrawLine *drawLine0202 = [[MWDrawLine alloc] init];
    drawLine0202.startPoint = CGPointMake(2715.5, 3435);
    drawLine0202.endPoint = CGPointMake(2872, 3435);
    drawLine0202.width = 11;
    drawLine0202.color = line0007.color;
    [haul0141.drawPrimitives addObject:drawLine0202];

    // Добавляем станцию Nationale
    MWStation *station0148 = [[MWStation alloc] init];
    station0148.identifier = @"station0148";
    [edge0063.elements addObject:station0148];
    
    station0148.nameOriginal = @"Nationale";
    station0148.mapLocation = CGPointMake(2872, 3435);
    station0148.geoLocation = CGPointMake(48.833183, 2.362718);

    MWDrawFillCircle *fillCircle0166 = [[MWDrawFillCircle alloc] init];
    fillCircle0166.center = station0148.mapLocation;
    fillCircle0166.radius = 12;
    fillCircle0166.fillColor = line0007.color;
    [station0148.drawPrimitives addObject:fillCircle0166];

    MWDrawTextLine *drawTextLine0199 = [[MWDrawTextLine alloc] init];
    drawTextLine0199.text = station0148.nameOriginal;
    drawTextLine0199.fontName = @"HelveticaNeue";
    drawTextLine0199.fontColor = [UIColor blackColor];
    drawTextLine0199.fontSize = 34;
    drawTextLine0199.kernSpacing = 0.2;
    drawTextLine0199.origin = CGPointMake(2788, 3447);
    [station0148.nameOriginalTextPrimitives addObject:drawTextLine0199];

    // Добавляем перегон
    MWHaul *haul0142 = [[MWHaul alloc] init];
    haul0142.identifier = @"haul0142";
    haul0142.length = 440;
    [edge0063.elements addObject:haul0142];

    MWDrawLine *drawLine0203 = [[MWDrawLine alloc] init];
    drawLine0203.startPoint = CGPointMake(2871.5, 3435);
    drawLine0203.endPoint = CGPointMake(3011, 3435);
    drawLine0203.width = 11;
    drawLine0203.color = line0007.color;
    [haul0142.drawPrimitives addObject:drawLine0203];

    // Добавляем станцию Chevaleret
    MWStation *station0149 = [[MWStation alloc] init];
    station0149.identifier = @"station0149";
    [edge0063.elements addObject:station0149];
    
    station0149.nameOriginal = @"Chevaleret";
    station0149.mapLocation = CGPointMake(3011, 3435);
    station0149.geoLocation = CGPointMake(48.834938, 2.368082);

    MWDrawFillCircle *fillCircle0167 = [[MWDrawFillCircle alloc] init];
    fillCircle0167.center = station0149.mapLocation;
    fillCircle0167.radius = 12;
    fillCircle0167.fillColor = line0007.color;
    [station0149.drawPrimitives addObject:fillCircle0167];

    MWDrawTextLine *drawTextLine0200 = [[MWDrawTextLine alloc] init];
    drawTextLine0200.text = station0149.nameOriginal;
    drawTextLine0200.fontName = @"HelveticaNeue";
    drawTextLine0200.fontColor = [UIColor blackColor];
    drawTextLine0200.fontSize = 34;
    drawTextLine0200.kernSpacing = -0.6;
    drawTextLine0200.origin = CGPointMake(2932, 3380);
    [station0149.nameOriginalTextPrimitives addObject:drawTextLine0200];

    // Добавляем перегон
    MWHaul *haul0143 = [[MWHaul alloc] init];
    haul0143.identifier = @"haul0143";
    haul0143.length = 448;
    [edge0063.elements addObject:haul0143];

    MWDrawLine *drawLine0204 = [[MWDrawLine alloc] init];
    drawLine0204.startPoint = CGPointMake(3010.5, 3435);
    drawLine0204.endPoint = CGPointMake(3077, 3435);
    drawLine0204.width = 11;
    drawLine0204.color = line0007.color;
    [haul0143.drawPrimitives addObject:drawLine0204];

    MWDrawArc *drawArc0065 = [[MWDrawArc alloc] init];
    drawArc0065.center = CGPointMake(3077, 3405);
    drawArc0065.startDegrees = 45;
    drawArc0065.endDegrees = 90;
    drawArc0065.radius = 30;
    drawArc0065.width = 11;
    drawArc0065.color = line0007.color;
    [haul0143.drawPrimitives addObject:drawArc0065];

    MWDrawLine *drawLine0205 = [[MWDrawLine alloc] init];
    drawLine0205.startPoint = CGPointMake(3098, 3426.5);
    drawLine0205.endPoint = CGPointMake(3153, 3371.5);
    drawLine0205.width = 11;
    drawLine0205.color = line0007.color;
    [haul0143.drawPrimitives addObject:drawLine0205];

    // Добавляем станцию Quai de la Gare
    MWStation *station0150 = [[MWStation alloc] init];
    station0150.identifier = @"station0150";
    [edge0063.elements addObject:station0150];
    
    station0150.nameOriginal = @"Quai de la Gare";
    station0150.mapLocation = CGPointMake(3153, 3371.5);
    station0150.geoLocation = CGPointMake(48.837069, 2.372773);

    MWDrawFillCircle *fillCircle0168 = [[MWDrawFillCircle alloc] init];
    fillCircle0168.center = station0150.mapLocation;
    fillCircle0168.radius = 12;
    fillCircle0168.fillColor = line0007.color;
    [station0150.drawPrimitives addObject:fillCircle0168];

    MWDrawTextLine *drawTextLine0201 = [[MWDrawTextLine alloc] init];
    drawTextLine0201.text = @"Quai";
    drawTextLine0201.fontName = @"HelveticaNeue";
    drawTextLine0201.fontColor = [UIColor blackColor];
    drawTextLine0201.fontSize = 34;
    drawTextLine0201.kernSpacing = -0.2;
    drawTextLine0201.origin = CGPointMake(3074, 3291);
    [station0150.nameOriginalTextPrimitives addObject:drawTextLine0201];

    MWDrawTextLine *drawTextLine0202 = [[MWDrawTextLine alloc] init];
    drawTextLine0202.text = @"de la Gare";
    drawTextLine0202.fontName = @"HelveticaNeue";
    drawTextLine0202.fontColor = [UIColor blackColor];
    drawTextLine0202.fontSize = 34;
    drawTextLine0202.kernSpacing = -0.4;
    drawTextLine0202.origin = CGPointMake(2990, 3324);
    [station0150.nameOriginalTextPrimitives addObject:drawTextLine0202];

    // Добавляем перегон
    MWHaul *haul0144 = [[MWHaul alloc] init];
    haul0144.identifier = @"haul0144";
    haul0144.length = 610;
    [edge0063.elements addObject:haul0144];

    MWDrawLine *drawLine0206 = [[MWDrawLine alloc] init];
    drawLine0206.startPoint = CGPointMake(3153.5, 3372);
    drawLine0206.endPoint = CGPointMake(3302.5, 3222);
    drawLine0206.width = 11;
    drawLine0206.color = line0007.color;
    [haul0144.drawPrimitives addObject:drawLine0206];

    // Добавляем станцию Bercy
    MWStation *station0151 = [[MWStation alloc] init];
    station0151.identifier = @"station0151";
    [edge0063.elements addObject:station0151];
    
    station0151.nameOriginal = @"Bercy";
    station0151.mapLocation = CGPointMake(3302.5, 3222);
    station0151.geoLocation = CGPointMake(48.83993, 2.380418);

    MWDrawFillCircle *fillCircle0169 = [[MWDrawFillCircle alloc] init];
    fillCircle0169.center = station0151.mapLocation;
    fillCircle0169.radius = 3;
    fillCircle0169.fillColor = [UIColor whiteColor];
    [station0151.drawPrimitives addObject:fillCircle0169];

    MWDrawTextLine *drawTextLine0203 = [[MWDrawTextLine alloc] init];
    drawTextLine0203.text = station0151.nameOriginal;
    drawTextLine0203.fontName = @"HelveticaNeue";
    drawTextLine0203.fontColor = [UIColor blackColor];
    drawTextLine0203.fontSize = 34;
    drawTextLine0203.kernSpacing = -1.2;
    drawTextLine0203.origin = CGPointMake(3197, 3199);
    [station0151.nameOriginalTextPrimitives addObject:drawTextLine0203];

    // Добавляем вершину
    edge0063.finishVertex = vertex0051;

    // Создаем участок линии Bercy - Daumesnil
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0064 = [[MWEdge alloc] init];
    edge0064.identifier = @"edge0064";
    edge0064.developmentName = @"Ребро: Bercy - Daumesnil";
    [self.edges addObject:edge0064];
    
    // Добавляем линию
    edge0064.line = line0007;
    
    // Добавляем вершину
    edge0064.startVertex = vertex0051;

    // Добавляем станцию Bercy
    [edge0064.elements addObject:station0151];

    // Добавляем перегон
    MWHaul *haul0145 = [[MWHaul alloc] init];
    haul0145.identifier = @"haul0145";
    haul0145.length = 752;
    [edge0064.elements addObject:haul0145];

    MWDrawLine *drawLine0207 = [[MWDrawLine alloc] init];
    drawLine0207.startPoint = CGPointMake(3302, 3222.5);
    drawLine0207.endPoint = CGPointMake(3395, 3129);
    drawLine0207.width = 11;
    drawLine0207.color = line0007.color;
    [haul0145.drawPrimitives addObject:drawLine0207];

    // Добавляем станцию Dugommier
    MWStation *station0152 = [[MWStation alloc] init];
    station0152.identifier = @"station0152";
    [edge0064.elements addObject:station0152];
    
    station0152.nameOriginal = @"Dugommier";
    station0152.mapLocation = CGPointMake(3395, 3129);
    station0152.geoLocation = CGPointMake(48.83905, 2.389964);

    MWDrawFillCircle *fillCircle0170 = [[MWDrawFillCircle alloc] init];
    fillCircle0170.center = station0152.mapLocation;
    fillCircle0170.radius = 12;
    fillCircle0170.fillColor = line0007.color;
    [station0152.drawPrimitives addObject:fillCircle0170];

    MWDrawTextLine *drawTextLine0204 = [[MWDrawTextLine alloc] init];
    drawTextLine0204.text = station0152.nameOriginal;
    drawTextLine0204.fontName = @"HelveticaNeue";
    drawTextLine0204.fontColor = [UIColor blackColor];
    drawTextLine0204.fontSize = 34;
    drawTextLine0204.kernSpacing = -0.0;
    drawTextLine0204.origin = CGPointMake(3407, 3132);
    [station0152.nameOriginalTextPrimitives addObject:drawTextLine0204];

    // Добавляем перегон
    MWHaul *haul0146 = [[MWHaul alloc] init];
    haul0146.identifier = @"haul0146";
    haul0146.length = 436;
    [edge0064.elements addObject:haul0146];

    MWDrawLine *drawLine0208 = [[MWDrawLine alloc] init];
    drawLine0208.startPoint = CGPointMake(3394.5, 3129.5);
    drawLine0208.endPoint = CGPointMake(3498, 3026.5);
    drawLine0208.width = 11;
    drawLine0208.color = line0007.color;
    [haul0146.drawPrimitives addObject:drawLine0208];

    // Добавляем станцию Daumesnil
    MWStation *station0153 = [[MWStation alloc] init];
    station0153.identifier = @"station0153";
    [edge0064.elements addObject:station0153];
    
    station0153.nameOriginal = @"Daumesnil";
    station0153.mapLocation = CGPointMake(3498, 3026.5);
    station0153.geoLocation = CGPointMake(48.839644, 2.395792);

    MWDrawFillCircle *fillCircle0171 = [[MWDrawFillCircle alloc] init];
    fillCircle0171.center = station0153.mapLocation;
    fillCircle0171.radius = 3;
    fillCircle0171.fillColor = [UIColor whiteColor];
    [station0153.drawPrimitives addObject:fillCircle0171];

    MWDrawTextLine *drawTextLine0205 = [[MWDrawTextLine alloc] init];
    drawTextLine0205.text = station0153.nameOriginal;
    drawTextLine0205.fontName = @"HelveticaNeue";
    drawTextLine0205.fontColor = [UIColor blackColor];
    drawTextLine0205.fontSize = 34;
    drawTextLine0205.kernSpacing = 0.3;
    drawTextLine0205.origin = CGPointMake(3296, 3012);
    [station0153.nameOriginalTextPrimitives addObject:drawTextLine0205];

    // Добавляем вершину
    edge0064.finishVertex = vertex0052;

    // Создаем участок линии Daumesnil - Nation
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0065 = [[MWEdge alloc] init];
    edge0065.identifier = @"edge0065";
    edge0065.developmentName = @"Ребро: Daumesnil - Nation";
    [self.edges addObject:edge0065];
    
    // Добавляем линию
    edge0065.line = line0007;
    
    // Добавляем вершину
    edge0065.startVertex = vertex0052;

    // Добавляем станцию Daumesnil
    [edge0065.elements addObject:station0153];

    // Добавляем перегон
    MWHaul *haul0147 = [[MWHaul alloc] init];
    haul0147.identifier = @"haul0147";
    haul0147.length = 505;
    [edge0065.elements addObject:haul0147];

    MWDrawLine *drawLine0209 = [[MWDrawLine alloc] init];
    drawLine0209.startPoint = CGPointMake(3497.5, 3027);
    drawLine0209.endPoint = CGPointMake(3581, 2943);
    drawLine0209.width = 11;
    drawLine0209.color = line0007.color;
    [haul0147.drawPrimitives addObject:drawLine0209];

    // Добавляем станцию Bel-Air
    MWStation *station0154 = [[MWStation alloc] init];
    station0154.identifier = @"station0154";
    [edge0065.elements addObject:station0154];
    
    station0154.nameOriginal = @"Bel-Air";
    station0154.mapLocation = CGPointMake(3581, 2943);
    station0154.geoLocation = CGPointMake(48.841344, 2.400912);

    MWDrawFillCircle *fillCircle0172 = [[MWDrawFillCircle alloc] init];
    fillCircle0172.center = station0154.mapLocation;
    fillCircle0172.radius = 12;
    fillCircle0172.fillColor = line0007.color;
    [station0154.drawPrimitives addObject:fillCircle0172];

    MWDrawTextLine *drawTextLine0206 = [[MWDrawTextLine alloc] init];
    drawTextLine0206.text = station0154.nameOriginal;
    drawTextLine0206.fontName = @"HelveticaNeue";
    drawTextLine0206.fontColor = [UIColor blackColor];
    drawTextLine0206.fontSize = 34;
    drawTextLine0206.kernSpacing = -0.4;
    drawTextLine0206.origin = CGPointMake(3583, 2947);
    [station0154.nameOriginalTextPrimitives addObject:drawTextLine0206];

    // Добавляем перегон
    MWHaul *haul0148 = [[MWHaul alloc] init];
    haul0148.identifier = @"haul0148";
    haul0148.length = 480;
    [edge0065.elements addObject:haul0148];

    MWDrawLine *drawLine0210 = [[MWDrawLine alloc] init];
    drawLine0210.startPoint = CGPointMake(3580.5, 2943.5);
    drawLine0210.endPoint = CGPointMake(3662, 2862);
    drawLine0210.width = 11;
    drawLine0210.color = line0007.color;
    [haul0148.drawPrimitives addObject:drawLine0210];

    // Добавляем станцию Picpus
    MWStation *station0155 = [[MWStation alloc] init];
    station0155.identifier = @"station0155";
    [edge0065.elements addObject:station0155];
    
    station0155.nameOriginal = @"Picpus";
    station0155.mapLocation = CGPointMake(3662, 2862);
    station0155.geoLocation = CGPointMake(48.84515, 2.400494);

    MWDrawFillCircle *fillCircle0173 = [[MWDrawFillCircle alloc] init];
    fillCircle0173.center = station0155.mapLocation;
    fillCircle0173.radius = 12;
    fillCircle0173.fillColor = line0007.color;
    [station0155.drawPrimitives addObject:fillCircle0173];

    MWDrawTextLine *drawTextLine0207 = [[MWDrawTextLine alloc] init];
    drawTextLine0207.text = station0155.nameOriginal;
    drawTextLine0207.fontName = @"HelveticaNeue";
    drawTextLine0207.fontColor = [UIColor blackColor];
    drawTextLine0207.fontSize = 34;
    drawTextLine0207.kernSpacing = -1.0;
    drawTextLine0207.origin = CGPointMake(3548, 2834);
    [station0155.nameOriginalTextPrimitives addObject:drawTextLine0207];

    // Добавляем перегон
    MWHaul *haul0149 = [[MWHaul alloc] init];
    haul0149.identifier = @"haul0149";
    haul0149.length = 601;
    [edge0065.elements addObject:haul0149];

    MWDrawLine *drawLine0211 = [[MWDrawLine alloc] init];
    drawLine0211.startPoint = CGPointMake(3661.5, 2862.5);
    drawLine0211.endPoint = CGPointMake(3663, 2861);
    drawLine0211.width = 11;
    drawLine0211.color = line0007.color;
    [haul0149.drawPrimitives addObject:drawLine0211];

    MWDrawArc *drawArc0066 = [[MWDrawArc alloc] init];
    drawArc0066.center = CGPointMake(3651.5, 2851);
    drawArc0066.startDegrees = 315;
    drawArc0066.endDegrees = 45;
    drawArc0066.radius = 15;
    drawArc0066.width = 11;
    drawArc0066.color = line0007.color;
    [haul0149.drawPrimitives addObject:drawArc0066];

    MWDrawLine *drawLine0212 = [[MWDrawLine alloc] init];
    drawLine0212.startPoint = CGPointMake(3662.5, 2841);
    drawLine0212.endPoint = CGPointMake(3519.5, 2698);
    drawLine0212.width = 11;
    drawLine0212.color = line0007.color;
    [haul0149.drawPrimitives addObject:drawLine0212];

    // Добавляем станцию Nation
    MWStation *station0156 = [[MWStation alloc] init];
    station0156.identifier = @"station0156";
    [edge0065.elements addObject:station0156];
    
    station0156.nameOriginal = @"Nation";
    station0156.mapLocation = CGPointMake(3519.5, 2698);
    station0156.geoLocation = CGPointMake(48.848389, 2.3958);

    MWDrawFillCircle *fillCircle0174 = [[MWDrawFillCircle alloc] init];
    fillCircle0174.center = station0156.mapLocation;
    fillCircle0174.radius = 5.5;
    fillCircle0174.fillColor = line0007.color;
    [station0156.drawPrimitives addObject:fillCircle0174];

    MWDrawFillCircle *fillCircle0176 = [[MWDrawFillCircle alloc] init];
    fillCircle0176.center = CGPointMake(3476, 2681.5);
    fillCircle0176.radius = 28;
    fillCircle0176.fillColor = line0007.color;
    [station0156.drawPrimitives addObject:fillCircle0176];
    
    MWDrawTextLine *drawTextLine0208 = [[MWDrawTextLine alloc] init];
    drawTextLine0208.text = @"6";
    drawTextLine0208.fontName = @"HelveticaNeue-Bold";
    drawTextLine0208.fontColor = [UIColor blackColor];
    drawTextLine0208.fontSize = 44;
    drawTextLine0208.origin = CGPointMake(3464, 2653.25);
    [station0156.drawPrimitives addObject:drawTextLine0208];

    station0156.showNameOnMap = false;
    [station0156.drawPrimitives addObject:drawTextLine0033];

    // Добавляем вершину
    edge0065.finishVertex = vertex0012;

    ////////////////////////////////////////////////////////////////
    // Line 7
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии La Courneuve - 8 Mai 1945 — Stalingrad
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0066 = [[MWEdge alloc] init];
    edge0066.identifier = @"edge0066";
    edge0066.developmentName = @"Ребро: La Courneuve - 8 Mai 1945 — Stalingrad";
    [self.edges addObject:edge0066];
    
    // Добавляем линию
    edge0066.line = line0008;
    
    // Добавляем вершину
    edge0066.startVertex = vertex0053;

    // Добавляем станцию La Courneuve - 8 Mai 1945
    MWStation *station0157 = [[MWStation alloc] init];
    station0157.identifier = @"station0157";
    [edge0066.elements addObject:station0157];
    
    station0157.nameOriginal = @"La Courneuve - 8 Mai 1945";
    station0157.mapLocation = CGPointMake(3500.5, 672.5);
    station0157.geoLocation = CGPointMake(48.920777, 2.410668);

    MWDrawFillCircle *fillCircle0177 = [[MWDrawFillCircle alloc] init];
    fillCircle0177.center = CGPointMake(3450.5, 676);
    fillCircle0177.radius = 28;
    fillCircle0177.fillColor = line0008.color;
    [station0157.drawPrimitives addObject:fillCircle0177];

    MWDrawTextLine *drawTextLine0209 = [[MWDrawTextLine alloc] init];
    drawTextLine0209.text = @"7";
    drawTextLine0209.fontName = @"HelveticaNeue-Bold";
    drawTextLine0209.fontColor = [UIColor blackColor];
    drawTextLine0209.fontSize = 44;
    drawTextLine0209.origin = CGPointMake(3439, 649);
    [station0157.drawPrimitives addObject:drawTextLine0209];

    MWDrawTextLine *drawTextLine0210 = [[MWDrawTextLine alloc] init];
    drawTextLine0210.text = @"La Courneuve";
    drawTextLine0210.fontName = @"Helvetica-Bold";
    drawTextLine0210.fontColor = [UIColor blackColor];
    drawTextLine0210.fontSize = 30;
    drawTextLine0210.kernSpacing = 0.9;
    drawTextLine0210.origin = CGPointMake(3206, 642);
    [station0157.drawPrimitives addObject:drawTextLine0210];

    MWDrawTextLine *drawTextLine0211 = [[MWDrawTextLine alloc] init];
    drawTextLine0211.text = @"8 Mai 1945";
    drawTextLine0211.fontName = @"Helvetica-Bold";
    drawTextLine0211.fontColor = [UIColor blackColor];
    drawTextLine0211.fontSize = 30;
    drawTextLine0211.kernSpacing = 1.9;
    drawTextLine0211.origin = CGPointMake(3249, 675);
    [station0157.drawPrimitives addObject:drawTextLine0211];

    MWDrawFillCircle *fillCircle0178 = [[MWDrawFillCircle alloc] init];
    fillCircle0178.center = station0157.mapLocation;
    fillCircle0178.radius = 13;
    fillCircle0178.fillColor = [UIColor blackColor];
    [station0157.drawPrimitives addObject:fillCircle0178];

    MWDrawFillCircle *fillCircle0179 = [[MWDrawFillCircle alloc] init];
    fillCircle0179.center = station0157.mapLocation;
    fillCircle0179.radius = 11;
    fillCircle0179.fillColor = [UIColor whiteColor];
    [station0157.drawPrimitives addObject:fillCircle0179];

    // Добавляем перегон
    MWHaul *haul0150 = [[MWHaul alloc] init];
    haul0150.identifier = @"haul0150";
    haul0150.length = 840;
    [edge0066.elements addObject:haul0150];

    MWDrawLine *drawLine0213 = [[MWDrawLine alloc] init];
    drawLine0213.startPoint = CGPointMake(3500.5, 672.5);
    drawLine0213.endPoint = CGPointMake(3500.5, 803);
    drawLine0213.width = 11;
    drawLine0213.color = line0008.color;
    [haul0150.drawPrimitives addObject:drawLine0213];

    // Добавляем станцию Fort d'Aubervilliers
    MWStation *station0158 = [[MWStation alloc] init];
    station0158.identifier = @"station0158";
    [edge0066.elements addObject:station0158];
    
    station0158.nameOriginal = @"Fort d'Aubervilliers";
    station0158.mapLocation = CGPointMake(3500.5, 803);
    station0158.geoLocation = CGPointMake(48.91424, 2.403785);
    
    MWDrawFillCircle *fillCircle0180 = [[MWDrawFillCircle alloc] init];
    fillCircle0180.center = station0158.mapLocation;
    fillCircle0180.radius = 12;
    fillCircle0180.fillColor = line0008.color;
    [station0158.drawPrimitives addObject:fillCircle0180];

    MWDrawTextLine *drawTextLine0212 = [[MWDrawTextLine alloc] init];
    drawTextLine0212.text = @"Fort";
    drawTextLine0212.fontName = @"HelveticaNeue";
    drawTextLine0212.fontColor = [UIColor blackColor];
    drawTextLine0212.fontSize = 34;
    drawTextLine0212.kernSpacing = 0.6;
    drawTextLine0212.origin = CGPointMake(3419, 738);
    [station0158.nameOriginalTextPrimitives addObject:drawTextLine0212];

    MWDrawTextLine *drawTextLine0213 = [[MWDrawTextLine alloc] init];
    drawTextLine0213.text = @"d'Aubervilliers";
    drawTextLine0213.fontName = @"HelveticaNeue";
    drawTextLine0213.fontColor = [UIColor blackColor];
    drawTextLine0213.fontSize = 34;
    drawTextLine0213.kernSpacing = -0.1;
    drawTextLine0213.origin = CGPointMake(3270, 772);
    [station0158.nameOriginalTextPrimitives addObject:drawTextLine0213];

    // Добавляем перегон
    MWHaul *haul0151 = [[MWHaul alloc] init];
    haul0151.identifier = @"haul0151";
    haul0151.length = 1486;
    [edge0066.elements addObject:haul0151];

    MWDrawLine *drawLine0214 = [[MWDrawLine alloc] init];
    drawLine0214.startPoint = CGPointMake(3500.5, 802.5);
    drawLine0214.endPoint = CGPointMake(3500.5, 822);
    drawLine0214.width = 11;
    drawLine0214.color = line0008.color;
    [haul0151.drawPrimitives addObject:drawLine0214];

    MWDrawArc *drawArc0067 = [[MWDrawArc alloc] init];
    drawArc0067.center = CGPointMake(3470.5, 821.5);
    drawArc0067.startDegrees = 0;
    drawArc0067.endDegrees = 45;
    drawArc0067.radius = 30;
    drawArc0067.width = 11;
    drawArc0067.color = line0008.color;
    [haul0151.drawPrimitives addObject:drawArc0067];

    MWDrawLine *drawLine0215 = [[MWDrawLine alloc] init];
    drawLine0215.startPoint = CGPointMake(3492.5, 842);
    drawLine0215.endPoint = CGPointMake(3391.5, 943);
    drawLine0215.width = 11;
    drawLine0215.color = line0008.color;
    [haul0151.drawPrimitives addObject:drawLine0215];

    // Добавляем станцию Aubervilliers - Pantin - Quatre Chemins
    MWStation *station0159 = [[MWStation alloc] init];
    station0159.identifier = @"station0159";
    [edge0066.elements addObject:station0159];
    
    station0159.nameOriginal = @"Aubervilliers - Pantin - Quatre Chemins";
    station0159.mapLocation = CGPointMake(3391.5, 943);
    station0159.geoLocation = CGPointMake(48.9039, 2.3925);

    MWDrawFillCircle *fillCircle0181 = [[MWDrawFillCircle alloc] init];
    fillCircle0181.center = station0159.mapLocation;
    fillCircle0181.radius = 12;
    fillCircle0181.fillColor = line0008.color;
    [station0159.drawPrimitives addObject:fillCircle0181];

    MWDrawTextLine *drawTextLine0214 = [[MWDrawTextLine alloc] init];
    drawTextLine0214.text = @"Aubervilliers";
    drawTextLine0214.fontName = @"HelveticaNeue";
    drawTextLine0214.fontColor = [UIColor blackColor];
    drawTextLine0214.fontSize = 34;
    drawTextLine0214.kernSpacing = 0.2;
    drawTextLine0214.origin = CGPointMake(3185, 848);
    [station0159.nameOriginalTextPrimitives addObject:drawTextLine0214];

    MWDrawTextLine *drawTextLine0215 = [[MWDrawTextLine alloc] init];
    drawTextLine0215.text = @"Pantin";
    drawTextLine0215.fontName = @"HelveticaNeue";
    drawTextLine0215.fontColor = [UIColor blackColor];
    drawTextLine0215.fontSize = 34;
    drawTextLine0215.kernSpacing = 0.2;
    drawTextLine0215.origin = CGPointMake(3275, 882);
    [station0159.nameOriginalTextPrimitives addObject:drawTextLine0215];

    MWDrawTextLine *drawTextLine0216 = [[MWDrawTextLine alloc] init];
    drawTextLine0216.text = @"Quatre Chemins";
    drawTextLine0216.fontName = @"HelveticaNeue";
    drawTextLine0216.fontColor = [UIColor blackColor];
    drawTextLine0216.fontSize = 34;
    drawTextLine0216.kernSpacing = -0.3;
    drawTextLine0216.origin = CGPointMake(3130, 915);
    [station0159.nameOriginalTextPrimitives addObject:drawTextLine0216];

    // Добавляем перегон
    MWHaul *haul0152 = [[MWHaul alloc] init];
    haul0152.identifier = @"haul0152";
    haul0152.length = 800;
    [edge0066.elements addObject:haul0152];

    MWDrawLine *drawLine0216 = [[MWDrawLine alloc] init];
    drawLine0216.startPoint = CGPointMake(3392, 942.5);
    drawLine0216.endPoint = CGPointMake(3288.5, 1046);
    drawLine0216.width = 11;
    drawLine0216.color = line0008.color;
    [haul0152.drawPrimitives addObject:drawLine0216];

    // Добавляем станцию Porte de la Villette
    MWStation *station0160 = [[MWStation alloc] init];
    station0160.identifier = @"station0160";
    [edge0066.elements addObject:station0160];
    
    station0160.nameOriginal = @"Porte de la Villette";
    station0160.mapLocation = CGPointMake(3288.5, 1046);
    station0160.geoLocation = CGPointMake(48.89709, 2.38588);

    MWDrawFillCircle *fillCircle0182 = [[MWDrawFillCircle alloc] init];
    fillCircle0182.center = station0160.mapLocation;
    fillCircle0182.radius = 13;
    fillCircle0182.fillColor = [UIColor blackColor];
    [station0160.drawPrimitives addObject:fillCircle0182];
    
    MWDrawFillCircle *fillCircle0183 = [[MWDrawFillCircle alloc] init];
    fillCircle0183.center = station0160.mapLocation;
    fillCircle0183.radius = 11;
    fillCircle0183.fillColor = [UIColor whiteColor];
    [station0160.drawPrimitives addObject:fillCircle0183];
    
    MWDrawTextLine *drawTextLine0217 = [[MWDrawTextLine alloc] init];
    drawTextLine0217.text = @"Pte de";
    drawTextLine0217.fontName = @"HelveticaNeue";
    drawTextLine0217.fontColor = [UIColor blackColor];
    drawTextLine0217.fontSize = 34;
    drawTextLine0217.kernSpacing = -0.6;
    drawTextLine0217.origin = CGPointMake(3365, 1027);
    [station0160.nameOriginalTextPrimitives addObject:drawTextLine0217];

    MWDrawTextLine *drawTextLine0218 = [[MWDrawTextLine alloc] init];
    drawTextLine0218.text = @"la Villette";
    drawTextLine0218.fontName = @"HelveticaNeue";
    drawTextLine0218.fontColor = [UIColor blackColor];
    drawTextLine0218.fontSize = 34;
    drawTextLine0218.kernSpacing = 0.7;
    drawTextLine0218.origin = CGPointMake(3365, 1060);
    [station0160.nameOriginalTextPrimitives addObject:drawTextLine0218];

    // Добавляем перегон
    MWHaul *haul0153 = [[MWHaul alloc] init];
    haul0153.identifier = @"haul0153";
    haul0153.length = 433;
    [edge0066.elements addObject:haul0153];

    MWDrawLine *drawLine0217 = [[MWDrawLine alloc] init];
    drawLine0217.startPoint = CGPointMake(3289, 1045.5);
    drawLine0217.endPoint = CGPointMake(3208, 1126.5);
    drawLine0217.width = 11;
    drawLine0217.color = line0008.color;
    [haul0153.drawPrimitives addObject:drawLine0217];

    // Добавляем станцию Corentin Cariou
    MWStation *station0161 = [[MWStation alloc] init];
    station0161.identifier = @"station0161";
    [edge0066.elements addObject:station0161];
    
    station0161.nameOriginal = @"Corentin Cariou";
    station0161.mapLocation = CGPointMake(3208, 1126.5);
    station0161.geoLocation = CGPointMake(48.89434, 2.381745);

    MWDrawFillCircle *fillCircle0184 = [[MWDrawFillCircle alloc] init];
    fillCircle0184.center = station0161.mapLocation;
    fillCircle0184.radius = 12;
    fillCircle0184.fillColor = line0008.color;
    [station0161.drawPrimitives addObject:fillCircle0184];

    MWDrawTextLine *drawTextLine0219 = [[MWDrawTextLine alloc] init];
    drawTextLine0219.text = station0161.nameOriginal;
    drawTextLine0219.fontName = @"HelveticaNeue";
    drawTextLine0219.fontColor = [UIColor blackColor];
    drawTextLine0219.fontSize = 34;
    drawTextLine0219.kernSpacing = -0.3;
    drawTextLine0219.origin = CGPointMake(3223, 1106);
    [station0161.nameOriginalTextPrimitives addObject:drawTextLine0219];

    // Добавляем перегон
    MWHaul *haul0154 = [[MWHaul alloc] init];
    haul0154.identifier = @"haul0154";
    haul0154.length = 557;
    [edge0066.elements addObject:haul0154];

    MWDrawLine *drawLine0218 = [[MWDrawLine alloc] init];
    drawLine0218.startPoint = CGPointMake(3208.5, 1126);
    drawLine0218.endPoint = CGPointMake(3141, 1193.5);
    drawLine0218.width = 11;
    drawLine0218.color = line0008.color;
    [haul0154.drawPrimitives addObject:drawLine0218];

    // Добавляем станцию Crimée
    MWStation *station0162 = [[MWStation alloc] init];
    station0162.identifier = @"station0162";
    [edge0066.elements addObject:station0162];
    
    station0162.nameOriginal = @"Crimée";
    station0162.mapLocation = CGPointMake(3141, 1193.5);
    station0162.geoLocation = CGPointMake(48.89158, 2.37707);

    MWDrawFillCircle *fillCircle0185 = [[MWDrawFillCircle alloc] init];
    fillCircle0185.center = station0162.mapLocation;
    fillCircle0185.radius = 12;
    fillCircle0185.fillColor = line0008.color;
    [station0162.drawPrimitives addObject:fillCircle0185];

    MWDrawTextLine *drawTextLine0220 = [[MWDrawTextLine alloc] init];
    drawTextLine0220.text = station0162.nameOriginal;
    drawTextLine0220.fontName = @"HelveticaNeue";
    drawTextLine0220.fontColor = [UIColor blackColor];
    drawTextLine0220.fontSize = 34;
    drawTextLine0220.kernSpacing = -0.3;
    drawTextLine0220.origin = CGPointMake(3158, 1176);
    [station0162.nameOriginalTextPrimitives addObject:drawTextLine0220];

    // Добавляем перегон
    MWHaul *haul0155 = [[MWHaul alloc] init];
    haul0155.identifier = @"haul0155";
    haul0155.length = 379;
    [edge0066.elements addObject:haul0155];

    MWDrawLine *drawLine0219 = [[MWDrawLine alloc] init];
    drawLine0219.startPoint = CGPointMake(3141.5, 1193);
    drawLine0219.endPoint = CGPointMake(3074.5, 1260);
    drawLine0219.width = 11;
    drawLine0219.color = line0008.color;
    [haul0155.drawPrimitives addObject:drawLine0219];

    // Добавляем станцию Riquet
    MWStation *station0163 = [[MWStation alloc] init];
    station0163.identifier = @"station0163";
    [edge0066.elements addObject:station0163];
    
    station0163.nameOriginal = @"Riquet";
    station0163.mapLocation = CGPointMake(3074.5, 1260);
    station0163.geoLocation = CGPointMake(48.88788, 2.373578);

    MWDrawFillCircle *fillCircle0186 = [[MWDrawFillCircle alloc] init];
    fillCircle0186.center = station0163.mapLocation;
    fillCircle0186.radius = 12;
    fillCircle0186.fillColor = line0008.color;
    [station0163.drawPrimitives addObject:fillCircle0186];

    MWDrawTextLine *drawTextLine0221 = [[MWDrawTextLine alloc] init];
    drawTextLine0221.text = station0163.nameOriginal;
    drawTextLine0221.fontName = @"HelveticaNeue";
    drawTextLine0221.fontColor = [UIColor blackColor];
    drawTextLine0221.fontSize = 34;
    drawTextLine0221.kernSpacing = -0.2;
    drawTextLine0221.origin = CGPointMake(3089, 1244);
    [station0163.nameOriginalTextPrimitives addObject:drawTextLine0221];

    // Добавляем перегон
    MWHaul *haul0156 = [[MWHaul alloc] init];
    haul0156.identifier = @"haul0156";
    haul0156.length = 638;
    [edge0066.elements addObject:haul0156];

    MWDrawLine *drawLine0220 = [[MWDrawLine alloc] init];
    drawLine0220.startPoint = CGPointMake(3075, 1259.5);
    drawLine0220.endPoint = CGPointMake(3047, 1287.5);
    drawLine0220.width = 11;
    drawLine0220.color = line0008.color;
    [haul0156.drawPrimitives addObject:drawLine0220];

    MWDrawArc *drawArc0068 = [[MWDrawArc alloc] init];
    drawArc0068.center = CGPointMake(3069, 1308);
    drawArc0068.startDegrees = 180;
    drawArc0068.endDegrees = 225;
    drawArc0068.radius = 30;
    drawArc0068.width = 11;
    drawArc0068.color = line0008.color;
    [haul0156.drawPrimitives addObject:drawArc0068];

    MWDrawLine *drawLine0221 = [[MWDrawLine alloc] init];
    drawLine0221.startPoint = CGPointMake(3039, 1308);
    drawLine0221.endPoint = CGPointMake(3039, 1359);
    drawLine0221.width = 11;
    drawLine0221.color = line0008.color;
    [haul0156.drawPrimitives addObject:drawLine0221];

    // Добавляем станцию Stalingrad
    MWStation *station0164 = [[MWStation alloc] init];
    station0164.identifier = @"station0164";
    [edge0066.elements addObject:station0164];
    
    station0164.nameOriginal = @"Stalingrad";
    station0164.mapLocation = CGPointMake(3039, 1359);
    station0164.geoLocation = CGPointMake(48.88426, 2.36874);

    MWDrawFillCircle *fillCircle0187 = [[MWDrawFillCircle alloc] init];
    fillCircle0187.center = station0164.mapLocation;
    fillCircle0187.radius = 3;
    fillCircle0187.fillColor = [UIColor whiteColor];
    [station0164.drawPrimitives addObject:fillCircle0187];

    station0164.showNameOnMap = false;
    [station0164.nameOriginalTextPrimitives addObject:drawTextLine0058];
    
    // Добавляем вершину
    edge0066.finishVertex = vertex0020;
    
    // Создаем участок линии Stalingrad - Louis Blanc
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0067 = [[MWEdge alloc] init];
    edge0067.identifier = @"edge0067";
    edge0067.developmentName = @"Ребро: Stalingrad - Louis Blanc";
    [self.edges addObject:edge0067];
    
    // Добавляем линию
    edge0067.line = line0008;
    
    // Добавляем вершину
    edge0067.startVertex = vertex0020;

    // Добавляем станцию Stalingrad
    [edge0067.elements addObject:station0164];

    // Добавляем перегон
    MWHaul *haul0157 = [[MWHaul alloc] init];
    haul0157.identifier = @"haul0157";
    haul0157.length = 398;
    [edge0067.elements addObject:haul0157];

    MWDrawLine *drawLine0222 = [[MWDrawLine alloc] init];
    drawLine0222.startPoint = CGPointMake(3039, 1358.5);
    drawLine0222.endPoint = CGPointMake(3039, 1413);
    drawLine0222.width = 11;
    drawLine0222.color = line0008.color;
    [haul0157.drawPrimitives addObject:drawLine0222];

    MWDrawArc *drawArc0069 = [[MWDrawArc alloc] init];
    drawArc0069.center = CGPointMake(3009, 1412.5);
    drawArc0069.startDegrees = 0;
    drawArc0069.endDegrees = 45;
    drawArc0069.radius = 30;
    drawArc0069.width = 11;
    drawArc0069.color = line0008.color;
    [haul0157.drawPrimitives addObject:drawArc0069];

    MWDrawLine *drawLine0223 = [[MWDrawLine alloc] init];
    drawLine0223.startPoint = CGPointMake(3031, 1433);
    drawLine0223.endPoint = CGPointMake(3006.5, 1457.5);
    drawLine0223.width = 11;
    drawLine0223.color = line0008.color;
    [haul0157.drawPrimitives addObject:drawLine0223];

    // Добавляем станцию Louis Blanc
    MWStation *station0165 = [[MWStation alloc] init];
    station0165.identifier = @"station0165";
    [edge0067.elements addObject:station0165];
    
    station0165.nameOriginal = @"Louis Blanc";
    station0165.mapLocation = CGPointMake(3006.5, 1457.5);
    station0165.geoLocation = CGPointMake(48.881137, 2.364839);

    MWDrawFillCircle *fillCircle0188 = [[MWDrawFillCircle alloc] init];
    fillCircle0188.center = station0165.mapLocation;
    fillCircle0188.radius = 3;
    fillCircle0188.fillColor = [UIColor whiteColor];
    [station0165.drawPrimitives addObject:fillCircle0188];

    MWDrawTextLine *drawTextLine0222 = [[MWDrawTextLine alloc] init];
    drawTextLine0222.text = @"Louis";
    drawTextLine0222.fontName = @"Helvetica-Bold";
    drawTextLine0222.fontColor = [UIColor blackColor];
    drawTextLine0222.fontSize = 30;
    drawTextLine0222.kernSpacing = 0.5;
    drawTextLine0222.origin = CGPointMake(3040, 1469);
    [station0165.drawPrimitives addObject:drawTextLine0222];

    MWDrawTextLine *drawTextLine0223 = [[MWDrawTextLine alloc] init];
    drawTextLine0223.text = @"Blanc";
    drawTextLine0223.fontName = @"Helvetica-Bold";
    drawTextLine0223.fontColor = [UIColor blackColor];
    drawTextLine0223.fontSize = 30;
    drawTextLine0223.kernSpacing = 1.0;
    drawTextLine0223.origin = CGPointMake(3040, 1502);
    [station0165.drawPrimitives addObject:drawTextLine0223];

    // Добавляем вершину
    edge0067.finishVertex = vertex0054;
    
    // Создаем участок линии Louis Blanc - Gare de l'Est
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0068 = [[MWEdge alloc] init];
    edge0068.identifier = @"edge0068";
    edge0068.developmentName = @"Ребро: Louis Blanc - Gare de l'Est";
    [self.edges addObject:edge0068];
    
    // Добавляем линию
    edge0068.line = line0008;
    
    // Добавляем вершину
    edge0068.startVertex = vertex0054;

    // Добавляем станцию Louis Blanc
    [edge0068.elements addObject:station0165];

    // Добавляем перегон
    MWHaul *haul0158 = [[MWHaul alloc] init];
    haul0158.identifier = @"haul0158";
    haul0158.length = 382;
    [edge0068.elements addObject:haul0158];

    MWDrawLine *drawLine0224 = [[MWDrawLine alloc] init];
    drawLine0224.startPoint = CGPointMake(3007, 1457);
    drawLine0224.endPoint = CGPointMake(2930.5, 1535.5);
    drawLine0224.width = 11;
    drawLine0224.color = line0008.color;
    [haul0158.drawPrimitives addObject:drawLine0224];

    // Добавляем станцию Château-Landon
    MWStation *station0166 = [[MWStation alloc] init];
    station0166.identifier = @"station0166";
    [edge0068.elements addObject:station0166];
    
    station0166.nameOriginal = @"Château-Landon";
    station0166.mapLocation = CGPointMake(2930.5, 1535.5);
    station0166.geoLocation = CGPointMake(48.87846, 2.362071);

    MWDrawFillCircle *fillCircle0189 = [[MWDrawFillCircle alloc] init];
    fillCircle0189.center = station0166.mapLocation;
    fillCircle0189.radius = 13;
    fillCircle0189.fillColor = [UIColor blackColor];
    [station0166.drawPrimitives addObject:fillCircle0189];

    MWDrawFillCircle *fillCircle0698 = [[MWDrawFillCircle alloc] init];
    fillCircle0698.center = station0166.mapLocation;
    fillCircle0698.radius = 11;
    fillCircle0698.fillColor = [UIColor whiteColor];
    [station0166.drawPrimitives addObject:fillCircle0698];

    MWDrawTextLine *drawTextLine0224 = [[MWDrawTextLine alloc] init];
    drawTextLine0224.text = @"Château";
    drawTextLine0224.fontName = @"HelveticaNeue";
    drawTextLine0224.fontColor = [UIColor blackColor];
    drawTextLine0224.fontSize = 34;
    drawTextLine0224.kernSpacing = -0.8;
    drawTextLine0224.origin = CGPointMake(2941, 1539);
    [station0166.nameOriginalTextPrimitives addObject:drawTextLine0224];

    MWDrawTextLine *drawTextLine0225 = [[MWDrawTextLine alloc] init];
    drawTextLine0225.text = @"Landon";
    drawTextLine0225.fontName = @"HelveticaNeue";
    drawTextLine0225.fontColor = [UIColor blackColor];
    drawTextLine0225.fontSize = 34;
    drawTextLine0225.kernSpacing = -0.6;
    drawTextLine0225.origin = CGPointMake(2941, 1572);
    [station0166.nameOriginalTextPrimitives addObject:drawTextLine0225];

    // Добавляем перегон
    MWHaul *haul0159 = [[MWHaul alloc] init];
    haul0159.identifier = @"haul0159";
    haul0159.length = 452;
    [edge0068.elements addObject:haul0159];
    
    MWDrawLine *drawLine0225 = [[MWDrawLine alloc] init];
    drawLine0225.startPoint = CGPointMake(2931, 1535);
    drawLine0225.endPoint = CGPointMake(2875.5, 1591);
    drawLine0225.width = 11;
    drawLine0225.color = line0008.color;
    [haul0159.drawPrimitives addObject:drawLine0225];

    MWDrawArc *drawArc0070 = [[MWDrawArc alloc] init];
    drawArc0070.center = CGPointMake(2854.5, 1569.5);
    drawArc0070.startDegrees = 45;
    drawArc0070.endDegrees = 90;
    drawArc0070.radius = 30;
    drawArc0070.width = 11;
    drawArc0070.color = line0008.color;
    [haul0159.drawPrimitives addObject:drawArc0070];

    MWDrawLine *drawLine0226 = [[MWDrawLine alloc] init];
    drawLine0226.startPoint = CGPointMake(2855, 1599.5);
    drawLine0226.endPoint = CGPointMake(2788.5, 1599.5);
    drawLine0226.width = 11;
    drawLine0226.color = line0008.color;
    [haul0159.drawPrimitives addObject:drawLine0226];

    // Добавляем станцию Gare de l'Est
    MWStation *station0167 = [[MWStation alloc] init];
    station0167.identifier = @"station0167";
    [edge0068.elements addObject:station0167];
    
    station0167.nameOriginal = @"Gare de l'Est";
    station0167.mapLocation = CGPointMake(2788.5, 1599.5);
    station0167.geoLocation = CGPointMake(48.876111, 2.358333);

    MWDrawFillCircle *fillCircle0190 = [[MWDrawFillCircle alloc] init];
    fillCircle0190.center = station0167.mapLocation;
    fillCircle0190.radius = 3;
    fillCircle0190.fillColor = [UIColor whiteColor];
    [station0167.drawPrimitives addObject:fillCircle0190];

    station0167.showNameOnMap = false;
    [station0167.drawPrimitives addObject:drawTextLine0120];
    [station0167.drawPrimitives addObject:drawTextLine0121];

    // Добавляем вершину
    edge0068.finishVertex = vertex0037;

    // Создаем участок линии Gare de l'Est - Chaussée d'Antin - La Fayette
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0069 = [[MWEdge alloc] init];
    edge0069.identifier = @"edge0069";
    edge0069.developmentName = @"Ребро: Gare de l'Est - Chaussée d'Antin - La Fayette";
    [self.edges addObject:edge0069];
    
    // Добавляем линию
    edge0069.line = line0008;
    
    // Добавляем вершину
    edge0069.startVertex = vertex0037;

    // Добавляем станцию Gare de l'Est
    [edge0069.elements addObject:station0167];

    // Добавляем перегон
    MWHaul *haul0160 = [[MWHaul alloc] init];
    haul0160.identifier = @"haul0160";
    haul0160.length = 692;
    [edge0069.elements addObject:haul0160];

    MWDrawLine *drawLine0227 = [[MWDrawLine alloc] init];
    drawLine0227.startPoint = CGPointMake(2789, 1599.5);
    drawLine0227.endPoint = CGPointMake(2479, 1599.5);
    drawLine0227.width = 11;
    drawLine0227.color = line0008.color;
    [haul0160.drawPrimitives addObject:drawLine0227];

    // Добавляем станцию Poissonnière
    MWStation *station0168 = [[MWStation alloc] init];
    station0168.identifier = @"station0168";
    [edge0069.elements addObject:station0168];
    
    station0168.nameOriginal = @"Poissonnière";
    station0168.mapLocation = CGPointMake(2479, 1599.5);
    station0168.geoLocation = CGPointMake(48.87708, 2.34845);

    MWDrawFillCircle *fillCircle0191 = [[MWDrawFillCircle alloc] init];
    fillCircle0191.center = station0168.mapLocation;
    fillCircle0191.radius = 12;
    fillCircle0191.fillColor = line0008.color;
    [station0168.drawPrimitives addObject:fillCircle0191];

    MWDrawTextLine *drawTextLine0226 = [[MWDrawTextLine alloc] init];
    drawTextLine0226.text = station0168.nameOriginal;
    drawTextLine0226.fontName = @"HelveticaNeue";
    drawTextLine0226.fontColor = [UIColor blackColor];
    drawTextLine0226.fontSize = 34;
    drawTextLine0226.kernSpacing = -0.4;
    drawTextLine0226.origin = CGPointMake(2372, 1611);
    [station0168.nameOriginalTextPrimitives addObject:drawTextLine0226];

    // Добавляем перегон
    MWHaul *haul0161 = [[MWHaul alloc] init];
    haul0161.identifier = @"haul0161";
    haul0161.length = 366;
    [edge0069.elements addObject:haul0161];
    
    MWDrawLine *drawLine0228 = [[MWDrawLine alloc] init];
    drawLine0228.startPoint = CGPointMake(2479.5, 1599.5);
    drawLine0228.endPoint = CGPointMake(2306, 1599.5);
    drawLine0228.width = 11;
    drawLine0228.color = line0008.color;
    [haul0161.drawPrimitives addObject:drawLine0228];

    MWDrawArc *drawArc0071 = [[MWDrawArc alloc] init];
    drawArc0071.center = CGPointMake(2306, 1629.5);
    drawArc0071.startDegrees = 225;
    drawArc0071.endDegrees = 270;
    drawArc0071.radius = 30;
    drawArc0071.width = 11;
    drawArc0071.color = line0008.color;
    [haul0161.drawPrimitives addObject:drawArc0071];

    MWDrawLine *drawLine0229 = [[MWDrawLine alloc] init];
    drawLine0229.startPoint = CGPointMake(2285.5, 1607.5);
    drawLine0229.endPoint = CGPointMake(2263, 1630);
    drawLine0229.width = 11;
    drawLine0229.color = line0008.color;
    [haul0161.drawPrimitives addObject:drawLine0229];

    // Добавляем станцию Cadet
    MWStation *station0169 = [[MWStation alloc] init];
    station0169.identifier = @"station0169";
    [edge0069.elements addObject:station0169];
    
    station0169.nameOriginal = @"Cadet";
    station0169.mapLocation = CGPointMake(2263, 1630);
    station0169.geoLocation = CGPointMake(48.876135, 2.344876);

    MWDrawFillCircle *fillCircle0192 = [[MWDrawFillCircle alloc] init];
    fillCircle0192.center = station0169.mapLocation;
    fillCircle0192.radius = 12;
    fillCircle0192.fillColor = line0008.color;
    [station0169.drawPrimitives addObject:fillCircle0192];
    
    MWDrawTextLine *drawTextLine0227 = [[MWDrawTextLine alloc] init];
    drawTextLine0227.text = station0169.nameOriginal;
    drawTextLine0227.fontName = @"HelveticaNeue";
    drawTextLine0227.fontColor = [UIColor blackColor];
    drawTextLine0227.fontSize = 34;
    drawTextLine0227.kernSpacing = -1.4;
    drawTextLine0227.origin = CGPointMake(2274, 1633);
    [station0169.nameOriginalTextPrimitives addObject:drawTextLine0227];

    // Добавляем перегон
    MWHaul *haul0162 = [[MWHaul alloc] init];
    haul0162.identifier = @"haul0162";
    haul0162.length = 370;
    [edge0069.elements addObject:haul0162];

    MWDrawLine *drawLine0230 = [[MWDrawLine alloc] init];
    drawLine0230.startPoint = CGPointMake(2263.5, 1629.5);
    drawLine0230.endPoint = CGPointMake(2189, 1704);
    drawLine0230.width = 11;
    drawLine0230.color = line0008.color;
    [haul0162.drawPrimitives addObject:drawLine0230];

    // Добавляем станцию Le Peletier
    MWStation *station0170 = [[MWStation alloc] init];
    station0170.identifier = @"station0170";
    [edge0069.elements addObject:station0170];
    
    station0170.nameOriginal = @"Le Peletier";
    station0170.mapLocation = CGPointMake(2189, 1704);
    station0170.geoLocation = CGPointMake(48.87472, 2.33955);
    
    MWDrawTextLine *drawTextLine0228 = [[MWDrawTextLine alloc] init];
    drawTextLine0228.text = station0170.nameOriginal;
    drawTextLine0228.fontName = @"HelveticaNeue";
    drawTextLine0228.fontColor = [UIColor blackColor];
    drawTextLine0228.fontSize = 34;
    drawTextLine0228.kernSpacing = -0.3;
    drawTextLine0228.origin = CGPointMake(2207, 1711);
    [station0170.nameOriginalTextPrimitives addObject:drawTextLine0228];

    MWDrawFillCircle *fillCircle0193 = [[MWDrawFillCircle alloc] init];
    fillCircle0193.center = station0170.mapLocation;
    fillCircle0193.radius = 12;
    fillCircle0193.fillColor = line0008.color;
    [station0170.drawPrimitives addObject:fillCircle0193];

    // Добавляем перегон
    MWHaul *haul0163 = [[MWHaul alloc] init];
    haul0163.identifier = @"haul0163";
    haul0163.length = 521;
    [edge0069.elements addObject:haul0163];
    
    MWDrawLine *drawLine0231 = [[MWDrawLine alloc] init];
    drawLine0231.startPoint = CGPointMake(2189.5, 1703.5);
    drawLine0231.endPoint = CGPointMake(2001.5, 1900);
    drawLine0231.width = 11;
    drawLine0231.color = line0008.color;
    [haul0163.drawPrimitives addObject:drawLine0231];

    // Добавляем станцию Chaussée d'Antin - La Fayette
    MWStation *station0171 = [[MWStation alloc] init];
    station0171.identifier = @"station0171";
    [edge0069.elements addObject:station0171];
    
    station0171.nameOriginal = @"Chaussée d'Antin - La Fayette";
    station0171.mapLocation = CGPointMake(2001.5, 1900);
    station0171.geoLocation = CGPointMake(48.87307, 2.33393);

    MWDrawFillCircle *fillCircle0194 = [[MWDrawFillCircle alloc] init];
    fillCircle0194.center = station0171.mapLocation;
    fillCircle0194.radius = 3;
    fillCircle0194.fillColor = [UIColor whiteColor];
    [station0171.drawPrimitives addObject:fillCircle0194];

    MWDrawTextLine *drawTextLine0229 = [[MWDrawTextLine alloc] init];
    drawTextLine0229.text = @"Chaussée";
    drawTextLine0229.fontName = @"HelveticaNeue";
    drawTextLine0229.fontColor = [UIColor blackColor];
    drawTextLine0229.fontSize = 34;
    drawTextLine0229.kernSpacing = -1.6;
    drawTextLine0229.origin = CGPointMake(1870, 1778);
    [station0171.nameOriginalTextPrimitives addObject:drawTextLine0229];

    MWDrawTextLine *drawTextLine0230 = [[MWDrawTextLine alloc] init];
    drawTextLine0230.text = @"d'Antin";
    drawTextLine0230.fontName = @"HelveticaNeue";
    drawTextLine0230.fontColor = [UIColor blackColor];
    drawTextLine0230.fontSize = 34;
    drawTextLine0230.kernSpacing = 0.2;
    drawTextLine0230.origin = CGPointMake(1900, 1811);
    [station0171.nameOriginalTextPrimitives addObject:drawTextLine0230];

    MWDrawTextLine *drawTextLine0231 = [[MWDrawTextLine alloc] init];
    drawTextLine0231.text = @"La Fayette";
    drawTextLine0231.fontName = @"HelveticaNeue";
    drawTextLine0231.fontColor = [UIColor blackColor];
    drawTextLine0231.fontSize = 34;
    drawTextLine0231.kernSpacing = -1.0;
    drawTextLine0231.origin = CGPointMake(1858, 1844);
    [station0171.nameOriginalTextPrimitives addObject:drawTextLine0231];

    // Добавляем вершину
    edge0069.finishVertex = vertex0055;
    
    // Создаем участок линии Chaussée d'Antin - La Fayette - Opéra
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0070 = [[MWEdge alloc] init];
    edge0070.identifier = @"edge0070";
    edge0070.developmentName = @"Ребро: Chaussée d'Antin - La Fayette - Opéra";
    [self.edges addObject:edge0070];
    
    // Добавляем линию
    edge0070.line = line0008;
    
    // Добавляем вершину
    edge0070.startVertex = vertex0055;

    // Добавляем станцию Chaussée d'Antin - La Fayette
    [edge0070.elements addObject:station0171];

    // Добавляем перегон
    MWHaul *haul0164 = [[MWHaul alloc] init];
    haul0164.identifier = @"haul0164";
    haul0164.length = 271;
    [edge0070.elements addObject:haul0164];
    
    MWDrawLine *drawLine0232 = [[MWDrawLine alloc] init];
    drawLine0232.startPoint = CGPointMake(2002, 1899.5);
    drawLine0232.endPoint = CGPointMake(1907, 1997);
    drawLine0232.width = 11;
    drawLine0232.color = line0008.color;
    [haul0164.drawPrimitives addObject:drawLine0232];

    // Добавляем станцию Opéra
    MWStation *station0172 = [[MWStation alloc] init];
    station0172.identifier = @"station0172";
    [edge0070.elements addObject:station0172];
    
    station0172.nameOriginal = @"Opéra";
    station0172.mapLocation = CGPointMake(1907, 1997);
    station0172.geoLocation = CGPointMake(48.870636, 2.332353);

    MWDrawFillCircle *fillCircle0195 = [[MWDrawFillCircle alloc] init];
    fillCircle0195.center = station0172.mapLocation;
    fillCircle0195.radius = 3;
    fillCircle0195.fillColor = [UIColor whiteColor];
    [station0172.drawPrimitives addObject:fillCircle0195];

    station0172.showNameOnMap = false;
    [station0172.nameOriginalTextPrimitives addObject:drawTextLine0086];

    // Добавляем вершину
    edge0070.finishVertex = vertex0027;

    // Создаем участок линии Opéra - Pyramides
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0071 = [[MWEdge alloc] init];
    edge0071.identifier = @"edge0071";
    edge0071.developmentName = @"Ребро: Opéra - Pyramides";
    [self.edges addObject:edge0071];
    
    // Добавляем линию
    edge0071.line = line0008;
    
    // Добавляем вершину
    edge0071.startVertex = vertex0027;

    // Добавляем станцию Opéra
    [edge0071.elements addObject:station0172];

    // Добавляем перегон
    MWHaul *haul0165 = [[MWHaul alloc] init];
    haul0165.identifier = @"haul0165";
    haul0165.length = 550;
    [edge0071.elements addObject:haul0165];

    MWDrawLine *drawLine0233 = [[MWDrawLine alloc] init];
    drawLine0233.startPoint = CGPointMake(1907.5, 1996.5);
    drawLine0233.endPoint = CGPointMake(1899, 2005);
    drawLine0233.width = 11;
    drawLine0233.color = line0008.color;
    [haul0165.drawPrimitives addObject:drawLine0233];

    MWDrawArc *drawArc0072 = [[MWDrawArc alloc] init];
    drawArc0072.center = CGPointMake(1910.5, 2015);
    drawArc0072.startDegrees = 180;
    drawArc0072.endDegrees = 225;
    drawArc0072.radius = 15;
    drawArc0072.width = 11;
    drawArc0072.color = line0008.color;
    [haul0165.drawPrimitives addObject:drawArc0072];

    MWDrawLine *drawLine0234 = [[MWDrawLine alloc] init];
    drawLine0234.startPoint = CGPointMake(1895.5, 2015);
    drawLine0234.endPoint = CGPointMake(1895.5, 2164);
    drawLine0234.width = 11;
    drawLine0234.color = line0008.color;
    [haul0165.drawPrimitives addObject:drawLine0234];

    // Добавляем станцию Pyramides
    MWStation *station0173 = [[MWStation alloc] init];
    station0173.identifier = @"station0173";
    [edge0071.elements addObject:station0173];
    
    station0173.nameOriginal = @"Pyramides";
    station0173.mapLocation = CGPointMake(1895.5, 2164);
    station0173.geoLocation = CGPointMake(48.86587, 2.33467);

    MWDrawFillCircle *fillCircle0196 = [[MWDrawFillCircle alloc] init];
    fillCircle0196.center = station0173.mapLocation;
    fillCircle0196.radius = 3;
    fillCircle0196.fillColor = [UIColor whiteColor];
    [station0173.drawPrimitives addObject:fillCircle0196];

    MWDrawTextLine *drawTextLine0232 = [[MWDrawTextLine alloc] init];
    drawTextLine0232.text = station0173.nameOriginal;
    drawTextLine0232.fontName = @"HelveticaNeue";
    drawTextLine0232.fontColor = [UIColor blackColor];
    drawTextLine0232.fontSize = 34;
    drawTextLine0232.kernSpacing = -0.8;
    drawTextLine0232.origin = CGPointMake(1728, 2170);
    [station0173.nameOriginalTextPrimitives addObject:drawTextLine0232];

    // Добавляем вершину
    edge0071.finishVertex = vertex0056;

    // Создаем участок линии Pyramides - Palais Royal - Musée du Louvre
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0072 = [[MWEdge alloc] init];
    edge0072.identifier = @"edge0072";
    edge0072.developmentName = @"Ребро: Pyramides - Palais Royal - Musée du Louvre";
    [self.edges addObject:edge0072];
    
    // Добавляем линию
    edge0072.line = line0008;
    
    // Добавляем вершину
    edge0072.startVertex = vertex0056;

    // Добавляем станцию Pyramides
    [edge0072.elements addObject:station0173];

    // Добавляем перегон
    MWHaul *haul0166 = [[MWHaul alloc] init];
    haul0166.identifier = @"haul0166";
    haul0166.length = 342;
    [edge0072.elements addObject:haul0166];

    MWDrawLine *drawLine0235 = [[MWDrawLine alloc] init];
    drawLine0235.startPoint = CGPointMake(1895.5, 2163.5);
    drawLine0235.endPoint = CGPointMake(1895.5, 2350.5);
    drawLine0235.width = 11;
    drawLine0235.color = line0008.color;
    [haul0166.drawPrimitives addObject:drawLine0235];

    // Добавляем станцию Palais Royal - Musée du Louvre
    MWStation *station0174 = [[MWStation alloc] init];
    station0174.identifier = @"station0174";
    [edge0072.elements addObject:station0174];
    
    station0174.nameOriginal = @"Palais Royal - Musée du Louvre";
    station0174.mapLocation = CGPointMake(1895.5, 2350.5);
    station0174.geoLocation = CGPointMake(48.862644, 2.336578);
    
    MWDrawFillCircle *fillCircle0197 = [[MWDrawFillCircle alloc] init];
    fillCircle0197.center = station0174.mapLocation;
    fillCircle0197.radius = 3;
    fillCircle0197.fillColor = [UIColor whiteColor];
    [station0174.drawPrimitives addObject:fillCircle0197];

    station0174.showNameOnMap = false;
    [station0174.nameOriginalTextPrimitives addObject:drawTextLine0021];
    [station0174.nameOriginalTextPrimitives addObject:drawTextLine0022];
    [station0174.nameOriginalTextPrimitives addObject:drawTextLine0023];
    
    // Добавляем вершину
    edge0072.finishVertex = vertex0006;

    // Создаем участок линии Palais Royal - Musée du Louvre - Châtelet
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0073 = [[MWEdge alloc] init];
    edge0073.identifier = @"edge0073";
    edge0073.developmentName = @"Ребро: Palais Royal - Musée du Louvre - Châtelet";
    [self.edges addObject:edge0073];
    
    // Добавляем линию
    edge0073.line = line0008;
    
    // Добавляем вершину
    edge0073.startVertex = vertex0006;

    // Добавляем станцию Palais Royal - Musée du Louvre
    [edge0073.elements addObject:station0174];

    // Добавляем перегон
    MWHaul *haul0167 = [[MWHaul alloc] init];
    haul0167.identifier = @"haul0167";
    haul0167.length = 800;
    [edge0073.elements addObject:haul0167];
    
    MWDrawLine *drawLine0236 = [[MWDrawLine alloc] init];
    drawLine0236.startPoint = CGPointMake(1895.5, 2350);
    drawLine0236.endPoint = CGPointMake(1895.5, 2360);
    drawLine0236.width = 11;
    drawLine0236.color = line0008.color;
    [haul0167.drawPrimitives addObject:drawLine0236];

    MWDrawArc *drawArc0073 = [[MWDrawArc alloc] init];
    drawArc0073.center = CGPointMake(1910.5, 2357.5);
    drawArc0073.startDegrees = 90;
    drawArc0073.endDegrees = 180;
    drawArc0073.radius = 15;
    drawArc0073.width = 11;
    drawArc0073.color = line0008.color;
    [haul0167.drawPrimitives addObject:drawArc0073];

    MWDrawLine *drawLine0237 = [[MWDrawLine alloc] init];
    drawLine0237.startPoint = CGPointMake(1910, 2372.5);
    drawLine0237.endPoint = CGPointMake(2165, 2372.5);
    drawLine0237.width = 11;
    drawLine0237.color = line0008.color;
    [haul0167.drawPrimitives addObject:drawLine0237];

    // Добавляем станцию Pont Neuf
    MWStation *station0175 = [[MWStation alloc] init];
    station0175.identifier = @"station0175";
    [edge0073.elements addObject:station0175];
    
    station0175.nameOriginal = @"Pont Neuf";
    station0175.mapLocation = CGPointMake(2165, 2372.5);
    station0175.geoLocation = CGPointMake(48.85868, 2.34149);

    MWDrawFillCircle *fillCircle0198 = [[MWDrawFillCircle alloc] init];
    fillCircle0198.center = station0175.mapLocation;
    fillCircle0198.radius = 12;
    fillCircle0198.fillColor = line0008.color;
    [station0175.drawPrimitives addObject:fillCircle0198];

    MWDrawTextLine *drawTextLine0233 = [[MWDrawTextLine alloc] init];
    drawTextLine0233.text = station0175.nameOriginal;
    drawTextLine0233.fontName = @"HelveticaNeue";
    drawTextLine0233.fontColor = [UIColor blackColor];
    drawTextLine0233.fontSize = 34;
    drawTextLine0233.kernSpacing = -0.0;
    drawTextLine0233.origin = CGPointMake(2020, 2384);
    [station0175.nameOriginalTextPrimitives addObject:drawTextLine0233];

    // Добавляем перегон
    MWHaul *haul0168 = [[MWHaul alloc] init];
    haul0168.identifier = @"haul0168";
    haul0168.length = 498;
    [edge0073.elements addObject:haul0168];

    MWDrawLine *drawLine0238 = [[MWDrawLine alloc] init];
    drawLine0238.startPoint = CGPointMake(2164.5, 2372.5);
    drawLine0238.endPoint = CGPointMake(2365.5, 2372.5);
    drawLine0238.width = 11;
    drawLine0238.color = line0008.color;
    [haul0168.drawPrimitives addObject:drawLine0238];

    // Добавляем станцию Châtelet
    MWStation *station0176 = [[MWStation alloc] init];
    station0176.identifier = @"station0176";
    [edge0073.elements addObject:station0176];
    
    station0176.nameOriginal = @"Châtelet";
    station0176.mapLocation = CGPointMake(2365.5, 2372.5);
    station0176.geoLocation = CGPointMake(48.858352, 2.347324);

    MWDrawFillCircle *fillCircle0199 = [[MWDrawFillCircle alloc] init];
    fillCircle0199.center = station0176.mapLocation;
    fillCircle0199.radius = 3;
    fillCircle0199.fillColor = [UIColor whiteColor];
    [station0176.drawPrimitives addObject:fillCircle0199];

    station0176.showNameOnMap = false;
    [station0176.nameOriginalTextPrimitives addObject:drawTextLine0026];
    
    // Добавляем вершину
    edge0073.finishVertex = vertex0007;

    // Создаем участок линии Châtelet - Jussieu
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0074 = [[MWEdge alloc] init];
    edge0074.identifier = @"edge0074";
    edge0074.developmentName = @"Ребро: Châtelet - Jussieu";
    [self.edges addObject:edge0074];
    
    // Добавляем линию
    edge0074.line = line0008;
    
    // Добавляем вершину
    edge0074.startVertex = vertex0007;

    // Добавляем станцию Châtelet
    [edge0074.elements addObject:station0176];

    // Добавляем перегон
    MWHaul *haul0169 = [[MWHaul alloc] init];
    haul0169.identifier = @"haul0169";
    haul0169.length = 946;
    [edge0074.elements addObject:haul0169];

    MWDrawLine *drawLine0239 = [[MWDrawLine alloc] init];
    drawLine0239.startPoint = CGPointMake(2365, 2372.5);
    drawLine0239.endPoint = CGPointMake(2410, 2372.5);
    drawLine0239.width = 11;
    drawLine0239.color = line0008.color;
    [haul0169.drawPrimitives addObject:drawLine0239];

    MWDrawArc *drawArc0074 = [[MWDrawArc alloc] init];
    drawArc0074.center = CGPointMake(2409.5, 2402.5);
    drawArc0074.startDegrees = 270;
    drawArc0074.endDegrees = 315;
    drawArc0074.radius = 30;
    drawArc0074.width = 11;
    drawArc0074.color = line0008.color;
    [haul0169.drawPrimitives addObject:drawArc0074];

    MWDrawLine *drawLine0240 = [[MWDrawLine alloc] init];
    drawLine0240.startPoint = CGPointMake(2430, 2380.5);
    drawLine0240.endPoint = CGPointMake(2565, 2515.5);
    drawLine0240.width = 11;
    drawLine0240.color = line0008.color;
    [haul0169.drawPrimitives addObject:drawLine0240];

    // Добавляем станцию Pont Marie
    MWStation *station0177 = [[MWStation alloc] init];
    station0177.identifier = @"station0177";
    [edge0074.elements addObject:station0177];
    
    station0177.nameOriginal = @"Pont Marie";
    station0177.mapLocation = CGPointMake(2565, 2515.5);
    station0177.geoLocation = CGPointMake(48.85329, 2.35762);

    MWDrawFillCircle *fillCircle0200 = [[MWDrawFillCircle alloc] init];
    fillCircle0200.center = station0177.mapLocation;
    fillCircle0200.radius = 12;
    fillCircle0200.fillColor = line0008.color;
    [station0177.drawPrimitives addObject:fillCircle0200];

    MWDrawTextLine *drawTextLine0234 = [[MWDrawTextLine alloc] init];
    drawTextLine0234.text = station0177.nameOriginal;
    drawTextLine0234.fontName = @"HelveticaNeue";
    drawTextLine0234.fontColor = [UIColor blackColor];
    drawTextLine0234.fontSize = 34;
    drawTextLine0234.kernSpacing = -0.0;
    drawTextLine0234.origin = CGPointMake(2378, 2496);
    [station0177.nameOriginalTextPrimitives addObject:drawTextLine0234];

    // Добавляем перегон
    MWHaul *haul0170 = [[MWHaul alloc] init];
    haul0170.identifier = @"haul0170";
    haul0170.length = 393;
    [edge0074.elements addObject:haul0170];

    MWDrawLine *drawLine0241 = [[MWDrawLine alloc] init];
    drawLine0241.startPoint = CGPointMake(2564.5, 2515);
    drawLine0241.endPoint = CGPointMake(2690, 2640);
    drawLine0241.width = 11;
    drawLine0241.color = line0008.color;
    [haul0170.drawPrimitives addObject:drawLine0241];

    // Добавляем станцию Sully - Morland
    MWStation *station0178 = [[MWStation alloc] init];
    station0178.identifier = @"station0178";
    [edge0074.elements addObject:station0178];
    
    station0178.nameOriginal = @"Sully - Morland";
    station0178.mapLocation = CGPointMake(2690, 2640);
    station0178.geoLocation = CGPointMake(48.851425, 2.361894);

    MWDrawFillCircle *fillCircle0201 = [[MWDrawFillCircle alloc] init];
    fillCircle0201.center = station0178.mapLocation;
    fillCircle0201.radius = 12;
    fillCircle0201.fillColor = line0008.color;
    [station0178.drawPrimitives addObject:fillCircle0201];

    MWDrawTextLine *drawTextLine0235 = [[MWDrawTextLine alloc] init];
    drawTextLine0235.text = @"Sully";
    drawTextLine0235.fontName = @"HelveticaNeue";
    drawTextLine0235.fontColor = [UIColor blackColor];
    drawTextLine0235.fontSize = 34;
    drawTextLine0235.kernSpacing = -0.6;
    drawTextLine0235.origin = CGPointMake(2602, 2630);
    [station0178.nameOriginalTextPrimitives addObject:drawTextLine0235];

    MWDrawTextLine *drawTextLine0236 = [[MWDrawTextLine alloc] init];
    drawTextLine0236.text = @"Morland";
    drawTextLine0236.fontName = @"HelveticaNeue";
    drawTextLine0236.fontColor = [UIColor blackColor];
    drawTextLine0236.fontSize = 34;
    drawTextLine0236.kernSpacing = -0.0;
    drawTextLine0236.origin = CGPointMake(2543, 2663);
    [station0178.nameOriginalTextPrimitives addObject:drawTextLine0236];
    
    // Добавляем перегон
    MWHaul *haul0171 = [[MWHaul alloc] init];
    haul0171.identifier = @"haul0171";
    haul0171.length = 877;
    [edge0074.elements addObject:haul0171];

    MWDrawLine *drawLine0242 = [[MWDrawLine alloc] init];
    drawLine0242.startPoint = CGPointMake(2689.5, 2639.5);
    drawLine0242.endPoint = CGPointMake(2699.5, 2649.5);
    drawLine0242.width = 11;
    drawLine0242.color = line0008.color;
    [haul0171.drawPrimitives addObject:drawLine0242];

    MWDrawArc *drawArc0075 = [[MWDrawArc alloc] init];
    drawArc0075.center = CGPointMake(2678, 2670.5);
    drawArc0075.startDegrees = 315;
    drawArc0075.endDegrees = 0;
    drawArc0075.radius = 30;
    drawArc0075.width = 11;
    drawArc0075.color = line0008.color;
    [haul0171.drawPrimitives addObject:drawArc0075];

    MWDrawLine *drawLine0243 = [[MWDrawLine alloc] init];
    drawLine0243.startPoint = CGPointMake(2708, 2670);
    drawLine0243.endPoint = CGPointMake(2708, 2948);
    drawLine0243.width = 11;
    drawLine0243.color = line0008.color;
    [haul0171.drawPrimitives addObject:drawLine0243];

    MWDrawArc *drawArc0076 = [[MWDrawArc alloc] init];
    drawArc0076.center = CGPointMake(2693, 2947.5);
    drawArc0076.startDegrees = 0;
    drawArc0076.endDegrees = 90;
    drawArc0076.radius = 15;
    drawArc0076.width = 11;
    drawArc0076.color = line0008.color;
    [haul0171.drawPrimitives addObject:drawArc0076];

    MWDrawLine *drawLine0244 = [[MWDrawLine alloc] init];
    drawLine0244.startPoint = CGPointMake(2693, 2962.5);
    drawLine0244.endPoint = CGPointMake(2633, 2962.5);
    drawLine0244.width = 11;
    drawLine0244.color = line0008.color;
    [haul0171.drawPrimitives addObject:drawLine0244];

    // Добавляем станцию Jussieu
    MWStation *station0179 = [[MWStation alloc] init];
    station0179.identifier = @"station0179";
    [edge0074.elements addObject:station0179];
    
    station0179.nameOriginal = @"Jussieu";
    station0179.mapLocation = CGPointMake(2633, 2962.5);
    station0179.geoLocation = CGPointMake(48.846052, 2.355738);

    MWDrawFillCircle *fillCircle0202 = [[MWDrawFillCircle alloc] init];
    fillCircle0202.center = station0179.mapLocation;
    fillCircle0202.radius = 3;
    fillCircle0202.fillColor = [UIColor whiteColor];
    [station0179.drawPrimitives addObject:fillCircle0202];

    MWDrawTextLine *drawTextLine0237 = [[MWDrawTextLine alloc] init];
    drawTextLine0237.text = station0179.nameOriginal;
    drawTextLine0237.fontName = @"HelveticaNeue";
    drawTextLine0237.fontColor = [UIColor blackColor];
    drawTextLine0237.fontSize = 34;
    drawTextLine0237.kernSpacing = -1.2;
    drawTextLine0237.origin = CGPointMake(2571, 2978);
    [station0179.nameOriginalTextPrimitives addObject:drawTextLine0237];

    // Добавляем вершину
    edge0074.finishVertex = vertex0057;

    // Создаем участок линии Jussieu - Place d'Italie
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0075 = [[MWEdge alloc] init];
    edge0075.identifier = @"edge0075";
    edge0075.developmentName = @"Ребро: Jussieu - Place d'Italie";
    [self.edges addObject:edge0075];
    
    // Добавляем линию
    edge0075.line = line0008;
    
    // Добавляем вершину
    edge0075.startVertex = vertex0057;

    // Добавляем станцию Jussieu
    [edge0075.elements addObject:station0179];

    // Добавляем перегон
    MWHaul *haul0172 = [[MWHaul alloc] init];
    haul0172.identifier = @"haul0172";
    haul0172.length = 364;
    [edge0075.elements addObject:haul0172];

    MWDrawLine *drawLine0245 = [[MWDrawLine alloc] init];
    drawLine0245.startPoint = CGPointMake(2634, 2962.5);
    drawLine0245.endPoint = CGPointMake(2558, 2962.5);
    drawLine0245.width = 11;
    drawLine0245.color = line0008.color;
    [haul0172.drawPrimitives addObject:drawLine0245];

    MWDrawArc *drawArc0077 = [[MWDrawArc alloc] init];
    drawArc0077.center = CGPointMake(2559, 2977.5);
    drawArc0077.startDegrees = 180;
    drawArc0077.endDegrees = 270;
    drawArc0077.radius = 15;
    drawArc0077.width = 11;
    drawArc0077.color = line0008.color;
    [haul0172.drawPrimitives addObject:drawArc0077];

    MWDrawLine *drawLine0246 = [[MWDrawLine alloc] init];
    drawLine0246.startPoint = CGPointMake(2544, 2977);
    drawLine0246.endPoint = CGPointMake(2544, 3057);
    drawLine0246.width = 11;
    drawLine0246.color = line0008.color;
    [haul0172.drawPrimitives addObject:drawLine0246];

    // Добавляем станцию Place Monge
    MWStation *station0180 = [[MWStation alloc] init];
    station0180.identifier = @"station0180";
    [edge0075.elements addObject:station0180];
    
    station0180.nameOriginal = @"Place Monge";
    station0180.mapLocation = CGPointMake(2544, 3057);
    station0180.geoLocation = CGPointMake(48.84359, 2.352279);

    MWDrawFillCircle *fillCircle0203 = [[MWDrawFillCircle alloc] init];
    fillCircle0203.center = station0180.mapLocation;
    fillCircle0203.radius = 12;
    fillCircle0203.fillColor = line0008.color;
    [station0180.drawPrimitives addObject:fillCircle0203];

    MWDrawTextLine *drawTextLine0238 = [[MWDrawTextLine alloc] init];
    drawTextLine0238.text = @"Place";
    drawTextLine0238.fontName = @"HelveticaNeue";
    drawTextLine0238.fontColor = [UIColor blackColor];
    drawTextLine0238.fontSize = 34;
    drawTextLine0238.kernSpacing = -1.6;
    drawTextLine0238.origin = CGPointMake(2564, 3035);
    [station0180.nameOriginalTextPrimitives addObject:drawTextLine0238];

    MWDrawTextLine *drawTextLine0239 = [[MWDrawTextLine alloc] init];
    drawTextLine0239.text = @"Monge";
    drawTextLine0239.fontName = @"HelveticaNeue";
    drawTextLine0239.fontColor = [UIColor blackColor];
    drawTextLine0239.fontSize = 34;
    drawTextLine0239.kernSpacing = -1.2;
    drawTextLine0239.origin = CGPointMake(2564, 3068);
    [station0180.nameOriginalTextPrimitives addObject:drawTextLine0239];

    // Добавляем перегон
    MWHaul *haul0173 = [[MWHaul alloc] init];
    haul0173.identifier = @"haul0173";
    haul0173.length = 337;
    [edge0075.elements addObject:haul0173];

    MWDrawLine *drawLine0247 = [[MWDrawLine alloc] init];
    drawLine0247.startPoint = CGPointMake(2544, 3056.5);
    drawLine0247.endPoint = CGPointMake(2544, 3179.5);
    drawLine0247.width = 11;
    drawLine0247.color = line0008.color;
    [haul0173.drawPrimitives addObject:drawLine0247];

    // Добавляем станцию Censier - Daubenton
    MWStation *station0181 = [[MWStation alloc] init];
    station0181.identifier = @"station0181";
    [edge0075.elements addObject:station0181];
    
    station0181.nameOriginal = @"Censier - Daubenton";
    station0181.mapLocation = CGPointMake(2544, 3179.5);
    station0181.geoLocation = CGPointMake(48.840597, 2.351774);

    MWDrawFillCircle *fillCircle0204 = [[MWDrawFillCircle alloc] init];
    fillCircle0204.center = station0181.mapLocation;
    fillCircle0204.radius = 12;
    fillCircle0204.fillColor = line0008.color;
    [station0181.drawPrimitives addObject:fillCircle0204];

    MWDrawTextLine *drawTextLine0240 = [[MWDrawTextLine alloc] init];
    drawTextLine0240.text = @"Censier";
    drawTextLine0240.fontName = @"HelveticaNeue";
    drawTextLine0240.fontColor = [UIColor blackColor];
    drawTextLine0240.fontSize = 34;
    drawTextLine0240.kernSpacing = -1.2;
    drawTextLine0240.origin = CGPointMake(2564, 3124);
    [station0181.nameOriginalTextPrimitives addObject:drawTextLine0240];

    MWDrawTextLine *drawTextLine0241 = [[MWDrawTextLine alloc] init];
    drawTextLine0241.text = @"Daubenton";
    drawTextLine0241.fontName = @"HelveticaNeue";
    drawTextLine0241.fontColor = [UIColor blackColor];
    drawTextLine0241.fontSize = 34;
    drawTextLine0241.kernSpacing = -0.0;
    drawTextLine0241.origin = CGPointMake(2564, 3157);
    [station0181.nameOriginalTextPrimitives addObject:drawTextLine0241];

    // Добавляем перегон
    MWHaul *haul0174 = [[MWHaul alloc] init];
    haul0174.identifier = @"haul0174";
    haul0174.length = 447;
    [edge0075.elements addObject:haul0174];

    MWDrawLine *drawLine0248 = [[MWDrawLine alloc] init];
    drawLine0248.startPoint = CGPointMake(2544, 3179);
    drawLine0248.endPoint = CGPointMake(2544, 3194.5);
    drawLine0248.width = 11;
    drawLine0248.color = line0008.color;
    [haul0174.drawPrimitives addObject:drawLine0248];

    MWDrawArc *drawArc0078 = [[MWDrawArc alloc] init];
    drawArc0078.center = CGPointMake(2574, 3194);
    drawArc0078.startDegrees = 135;
    drawArc0078.endDegrees = 180;
    drawArc0078.radius = 30;
    drawArc0078.width = 11;
    drawArc0078.color = line0008.color;
    [haul0174.drawPrimitives addObject:drawArc0078];

    MWDrawLine *drawLine0249 = [[MWDrawLine alloc] init];
    drawLine0249.startPoint = CGPointMake(2552, 3214.5);
    drawLine0249.endPoint = CGPointMake(2630, 3292.5);
    drawLine0249.width = 11;
    drawLine0249.color = line0008.color;
    [haul0174.drawPrimitives addObject:drawLine0249];

    // Добавляем станцию Les Gobelins
    MWStation *station0182 = [[MWStation alloc] init];
    station0182.identifier = @"station0182";
    [edge0075.elements addObject:station0182];
    
    station0182.nameOriginal = @"Les Gobelins";
    station0182.mapLocation = CGPointMake(2630, 3292.5);
    station0182.geoLocation = CGPointMake(48.8364, 2.35225);
    
    MWDrawFillCircle *fillCircle0205 = [[MWDrawFillCircle alloc] init];
    fillCircle0205.center = station0182.mapLocation;
    fillCircle0205.radius = 12;
    fillCircle0205.fillColor = line0008.color;
    [station0182.drawPrimitives addObject:fillCircle0205];

    MWDrawTextLine *drawTextLine0242 = [[MWDrawTextLine alloc] init];
    drawTextLine0242.text = @"Les";
    drawTextLine0242.fontName = @"HelveticaNeue";
    drawTextLine0242.fontColor = [UIColor blackColor];
    drawTextLine0242.fontSize = 34;
    drawTextLine0242.kernSpacing = -0.8;
    drawTextLine0242.origin = CGPointMake(2640, 3212);
    [station0182.nameOriginalTextPrimitives addObject:drawTextLine0242];

    MWDrawTextLine *drawTextLine0243 = [[MWDrawTextLine alloc] init];
    drawTextLine0243.text = @"Gobelins";
    drawTextLine0243.fontName = @"HelveticaNeue";
    drawTextLine0243.fontColor = [UIColor blackColor];
    drawTextLine0243.fontSize = 34;
    drawTextLine0243.kernSpacing = -0.4;
    drawTextLine0243.origin = CGPointMake(2640, 3246);
    [station0182.nameOriginalTextPrimitives addObject:drawTextLine0243];

    // Добавляем перегон
    MWHaul *haul0175 = [[MWHaul alloc] init];
    haul0175.identifier = @"haul0175";
    haul0175.length = 656;
    [edge0075.elements addObject:haul0175];

    MWDrawLine *drawLine0250 = [[MWDrawLine alloc] init];
    drawLine0250.startPoint = CGPointMake(2629.5, 3292);
    drawLine0250.endPoint = CGPointMake(2696.5, 3359);
    drawLine0250.width = 11;
    drawLine0250.color = line0008.color;
    [haul0175.drawPrimitives addObject:drawLine0250];

    MWDrawArc *drawArc0079 = [[MWDrawArc alloc] init];
    drawArc0079.center = CGPointMake(2675, 3380);
    drawArc0079.startDegrees = 315;
    drawArc0079.endDegrees = 0;
    drawArc0079.radius = 30;
    drawArc0079.width = 11;
    drawArc0079.color = line0008.color;
    [haul0175.drawPrimitives addObject:drawArc0079];

    MWDrawLine *drawLine0251 = [[MWDrawLine alloc] init];
    drawLine0251.startPoint = CGPointMake(2705, 3380);
    drawLine0251.endPoint = CGPointMake(2705, 3435);
    drawLine0251.width = 11;
    drawLine0251.color = line0008.color;
    [haul0175.drawPrimitives addObject:drawLine0251];

    // Добавляем станцию Place d'Italie
    MWStation *station0183 = [[MWStation alloc] init];
    station0183.identifier = @"station0183";
    [edge0075.elements addObject:station0183];
    
    station0183.nameOriginal = @"Place d'Italie";
    station0183.mapLocation = CGPointMake(2705, 3435);
    station0183.geoLocation = CGPointMake(48.831483, 2.355692);

    MWDrawFillCircle *fillCircle0206 = [[MWDrawFillCircle alloc] init];
    fillCircle0206.center = station0183.mapLocation;
    fillCircle0206.radius = 3;
    fillCircle0206.fillColor = [UIColor whiteColor];
    [station0183.drawPrimitives addObject:fillCircle0206];

    station0183.showNameOnMap = false;
    [station0183.nameOriginalTextPrimitives addObject:drawTextLine0177];
    [station0183.nameOriginalTextPrimitives addObject:drawTextLine0178];
    
    // Добавляем вершину
    edge0075.finishVertex = vertex0047;

    // Создаем участок линии Place d'Italie - Maison Blanche
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0076 = [[MWEdge alloc] init];
    edge0076.identifier = @"edge0076";
    edge0076.developmentName = @"Ребро: Jussieu - Place d'Italie";
    [self.edges addObject:edge0076];
    
    // Добавляем линию
    edge0076.line = line0008;
    
    // Добавляем вершину
    edge0076.startVertex = vertex0047;

    // Добавляем станцию Place d'Italie
    [edge0076.elements addObject:station0183];

    // Добавляем перегон
    MWHaul *haul0176 = [[MWHaul alloc] init];
    haul0176.identifier = @"haul0176";
    haul0176.length = 588;
    [edge0076.elements addObject:haul0176];

    MWDrawLine *drawLine0252 = [[MWDrawLine alloc] init];
    drawLine0252.startPoint = CGPointMake(2705, 3434.5);
    drawLine0252.endPoint = CGPointMake(2705, 3527);
    drawLine0252.width = 11;
    drawLine0252.color = line0008.color;
    [haul0176.drawPrimitives addObject:drawLine0252];

    // Добавляем станцию Tolbiac
    MWStation *station0184 = [[MWStation alloc] init];
    station0184.identifier = @"station0184";
    [edge0076.elements addObject:station0184];
    
    station0184.nameOriginal = @"Tolbiac";
    station0184.mapLocation = CGPointMake(2705, 3527);
    station0184.geoLocation = CGPointMake(48.826665, 2.357678);

    MWDrawFillCircle *fillCircle0207 = [[MWDrawFillCircle alloc] init];
    fillCircle0207.center = station0184.mapLocation;
    fillCircle0207.radius = 12;
    fillCircle0207.fillColor = line0008.color;
    [station0184.drawPrimitives addObject:fillCircle0207];

    MWDrawTextLine *drawTextLine0244 = [[MWDrawTextLine alloc] init];
    drawTextLine0244.text = @"Tolbiac";
    drawTextLine0244.fontName = @"HelveticaNeue";
    drawTextLine0244.fontColor = [UIColor blackColor];
    drawTextLine0244.fontSize = 34;
    drawTextLine0244.kernSpacing = -0.4;
    drawTextLine0244.origin = CGPointMake(2582, 3505);
    [station0184.nameOriginalTextPrimitives addObject:drawTextLine0244];

    // Добавляем перегон
    MWHaul *haul0177 = [[MWHaul alloc] init];
    haul0177.identifier = @"haul0177";
    haul0177.length = 469;
    [edge0076.elements addObject:haul0177];

    MWDrawLine *drawLine0253 = [[MWDrawLine alloc] init];
    drawLine0253.startPoint = CGPointMake(2705, 3526.5);
    drawLine0253.endPoint = CGPointMake(2705, 3613);
    drawLine0253.width = 11;
    drawLine0253.color = line0008.color;
    [haul0177.drawPrimitives addObject:drawLine0253];

    // Добавляем станцию Maison Blanche
    MWStation *station0185 = [[MWStation alloc] init];
    station0185.identifier = @"station0185";
    [edge0076.elements addObject:station0185];
    
    station0185.nameOriginal = @"Maison Blanche";
    station0185.mapLocation = CGPointMake(2705, 3613);
    station0185.geoLocation = CGPointMake(48.822155, 2.358531);

    MWDrawFillCircle *fillCircle0208 = [[MWDrawFillCircle alloc] init];
    fillCircle0208.center = station0185.mapLocation;
    fillCircle0208.radius = 3;
    fillCircle0208.fillColor = [UIColor whiteColor];
    [station0185.drawPrimitives addObject:fillCircle0208];

    MWDrawTextLine *drawTextLine0245 = [[MWDrawTextLine alloc] init];
    drawTextLine0245.text = @"Maison";
    drawTextLine0245.fontName = @"HelveticaNeue";
    drawTextLine0245.fontColor = [UIColor blackColor];
    drawTextLine0245.fontSize = 34;
    drawTextLine0245.kernSpacing = -0.6;
    drawTextLine0245.origin = CGPointMake(2568, 3550);
    [station0185.nameOriginalTextPrimitives addObject:drawTextLine0245];

    MWDrawTextLine *drawTextLine0246 = [[MWDrawTextLine alloc] init];
    drawTextLine0246.text = @"Blanche";
    drawTextLine0246.fontName = @"HelveticaNeue";
    drawTextLine0246.fontColor = [UIColor blackColor];
    drawTextLine0246.fontSize = 34;
    drawTextLine0246.kernSpacing = -0.6;
    drawTextLine0246.origin = CGPointMake(2555, 3584);
    [station0185.nameOriginalTextPrimitives addObject:drawTextLine0246];

    // Добавляем вершину
    edge0076.finishVertex = vertex0058;

    // Создаем участок линии Maison Blanche - Mairie d'Ivry
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0077 = [[MWEdge alloc] init];
    edge0077.identifier = @"edge0077";
    edge0077.developmentName = @"Ребро: Maison Blanche - Mairie d'Ivry";
    [self.edges addObject:edge0077];
    
    // Добавляем линию
    edge0077.line = line0008;
    
    // Добавляем вершину
    edge0077.startVertex = vertex0058;

    // Добавляем станцию Maison Blanche
    [edge0077.elements addObject:station0185];

    // Добавляем перегон
    MWHaul *haul0178 = [[MWHaul alloc] init];
    haul0178.identifier = @"haul0178";
    haul0178.length = 396;
    [edge0077.elements addObject:haul0178];

    MWDrawLine *drawLine0254 = [[MWDrawLine alloc] init];
    drawLine0254.startPoint = CGPointMake(2705, 3612.5);
    drawLine0254.endPoint = CGPointMake(2705, 3617);
    drawLine0254.width = 11;
    drawLine0254.color = line0008.color;
    [haul0178.drawPrimitives addObject:drawLine0254];

    MWDrawArc *drawArc0080 = [[MWDrawArc alloc] init];
    drawArc0080.center = CGPointMake(2735, 3617);
    drawArc0080.startDegrees = 135;
    drawArc0080.endDegrees = 180;
    drawArc0080.radius = 30;
    drawArc0080.width = 11;
    drawArc0080.color = line0008.color;
    [haul0178.drawPrimitives addObject:drawArc0080];

    MWDrawLine *drawLine0255 = [[MWDrawLine alloc] init];
    drawLine0255.startPoint = CGPointMake(2713.5, 3638);
    drawLine0255.endPoint = CGPointMake(2757.5, 3683);
    drawLine0255.width = 11;
    drawLine0255.color = line0008.color;
    [haul0178.drawPrimitives addObject:drawLine0255];

    MWDrawArc *drawArc0081 = [[MWDrawArc alloc] init];
    drawArc0081.center = CGPointMake(2778.5, 3661.5);
    drawArc0081.startDegrees = 90;
    drawArc0081.endDegrees = 135;
    drawArc0081.radius = 30;
    drawArc0081.width = 11;
    drawArc0081.color = line0008.color;
    [haul0178.drawPrimitives addObject:drawArc0081];

    MWDrawLine *drawLine0256 = [[MWDrawLine alloc] init];
    drawLine0256.startPoint = CGPointMake(2778, 3691.5);
    drawLine0256.endPoint = CGPointMake(2827.5, 3691.5);
    drawLine0256.width = 11;
    drawLine0256.color = line0008.color;
    [haul0178.drawPrimitives addObject:drawLine0256];

    // Добавляем станцию Porte d'Italie
    MWStation *station0186 = [[MWStation alloc] init];
    station0186.identifier = @"station0186";
    [edge0077.elements addObject:station0186];
    
    station0186.nameOriginal = @"Porte d'Italie";
    station0186.mapLocation = CGPointMake(2827.5, 3691.5);
    station0186.geoLocation = CGPointMake(48.819196, 2.360805);

    MWDrawFillCircle *fillCircle0209 = [[MWDrawFillCircle alloc] init];
    fillCircle0209.center = station0186.mapLocation;
    fillCircle0209.radius = 13;
    fillCircle0209.fillColor = [UIColor blackColor];
    [station0186.drawPrimitives addObject:fillCircle0209];
    
    MWDrawFillCircle *fillCircle0210 = [[MWDrawFillCircle alloc] init];
    fillCircle0210.center = station0186.mapLocation;
    fillCircle0210.radius = 11;
    fillCircle0210.fillColor = [UIColor whiteColor];
    [station0186.drawPrimitives addObject:fillCircle0210];

    MWDrawTextLine *drawTextLine0247 = [[MWDrawTextLine alloc] init];
    drawTextLine0247.text = @"Porte";
    drawTextLine0247.fontName = @"HelveticaNeue";
    drawTextLine0247.fontColor = [UIColor blackColor];
    drawTextLine0247.fontSize = 34;
    drawTextLine0247.kernSpacing = -0.6;
    drawTextLine0247.origin = CGPointMake(2787, 3569);
    [station0186.nameOriginalTextPrimitives addObject:drawTextLine0247];

    MWDrawTextLine *drawTextLine0248 = [[MWDrawTextLine alloc] init];
    drawTextLine0248.text = @"d'Italie";
    drawTextLine0248.fontName = @"HelveticaNeue";
    drawTextLine0248.fontColor = [UIColor blackColor];
    drawTextLine0248.fontSize = 34;
    drawTextLine0248.kernSpacing = 0.6;
    drawTextLine0248.origin = CGPointMake(2775, 3603);
    [station0186.nameOriginalTextPrimitives addObject:drawTextLine0248];

    // Добавляем перегон
    MWHaul *haul0179 = [[MWHaul alloc] init];
    haul0179.identifier = @"haul0179";
    haul0179.length = 308;
    [edge0077.elements addObject:haul0179];

    MWDrawLine *drawLine0257 = [[MWDrawLine alloc] init];
    drawLine0257.startPoint = CGPointMake(2827, 3691.5);
    drawLine0257.endPoint = CGPointMake(2972.5, 3691.5);
    drawLine0257.width = 11;
    drawLine0257.color = line0008.color;
    [haul0179.drawPrimitives addObject:drawLine0257];

    // Добавляем станцию Porte de Choisy
    MWStation *station0187 = [[MWStation alloc] init];
    station0187.identifier = @"station0187";
    [edge0077.elements addObject:station0187];
    
    station0187.nameOriginal = @"Porte de Choisy";
    station0187.mapLocation = CGPointMake(2972.5, 3691.5);
    station0187.geoLocation = CGPointMake(48.82032, 2.36529);
    
    MWDrawFillCircle *fillCircle0211 = [[MWDrawFillCircle alloc] init];
    fillCircle0211.center = station0187.mapLocation;
    fillCircle0211.radius = 13;
    fillCircle0211.fillColor = [UIColor blackColor];
    [station0187.drawPrimitives addObject:fillCircle0211];
    
    MWDrawFillCircle *fillCircle0212 = [[MWDrawFillCircle alloc] init];
    fillCircle0212.center = station0187.mapLocation;
    fillCircle0212.radius = 11;
    fillCircle0212.fillColor = [UIColor whiteColor];
    [station0187.drawPrimitives addObject:fillCircle0212];

    MWDrawTextLine *drawTextLine0249 = [[MWDrawTextLine alloc] init];
    drawTextLine0249.text = @"Porte";
    drawTextLine0249.fontName = @"HelveticaNeue";
    drawTextLine0249.fontColor = [UIColor blackColor];
    drawTextLine0249.fontSize = 34;
    drawTextLine0249.kernSpacing = -0.2;
    drawTextLine0249.origin = CGPointMake(2931, 3569);
    [station0187.nameOriginalTextPrimitives addObject:drawTextLine0249];

    MWDrawTextLine *drawTextLine0250 = [[MWDrawTextLine alloc] init];
    drawTextLine0250.text = @"de Choisy";
    drawTextLine0250.fontName = @"HelveticaNeue";
    drawTextLine0250.fontColor = [UIColor blackColor];
    drawTextLine0250.fontSize = 34;
    drawTextLine0250.kernSpacing = -0.8;
    drawTextLine0250.origin = CGPointMake(2900, 3603);
    [station0187.nameOriginalTextPrimitives addObject:drawTextLine0250];

    // Добавляем перегон
    MWHaul *haul0180 = [[MWHaul alloc] init];
    haul0180.identifier = @"haul0180";
    haul0180.length = 463;
    [edge0077.elements addObject:haul0180];

    MWDrawLine *drawLine0258 = [[MWDrawLine alloc] init];
    drawLine0258.startPoint = CGPointMake(2972, 3691.5);
    drawLine0258.endPoint = CGPointMake(3117, 3691.5);
    drawLine0258.width = 11;
    drawLine0258.color = line0008.color;
    [haul0180.drawPrimitives addObject:drawLine0258];

    // Добавляем станцию Porte d'Ivry
    MWStation *station0188 = [[MWStation alloc] init];
    station0188.identifier = @"station0188";
    [edge0077.elements addObject:station0188];
    
    station0188.nameOriginal = @"Porte d'Ivry";
    station0188.mapLocation = CGPointMake(3117, 3691.5);
    station0188.geoLocation = CGPointMake(48.82096, 2.37044);

    MWDrawFillCircle *fillCircle0213 = [[MWDrawFillCircle alloc] init];
    fillCircle0213.center = station0188.mapLocation;
    fillCircle0213.radius = 13;
    fillCircle0213.fillColor = [UIColor blackColor];
    [station0188.drawPrimitives addObject:fillCircle0213];
    
    MWDrawFillCircle *fillCircle0214 = [[MWDrawFillCircle alloc] init];
    fillCircle0214.center = station0188.mapLocation;
    fillCircle0214.radius = 11;
    fillCircle0214.fillColor = [UIColor whiteColor];
    [station0188.drawPrimitives addObject:fillCircle0214];
    
    MWDrawTextLine *drawTextLine0251 = [[MWDrawTextLine alloc] init];
    drawTextLine0251.text = @"Porte";
    drawTextLine0251.fontName = @"HelveticaNeue";
    drawTextLine0251.fontColor = [UIColor blackColor];
    drawTextLine0251.fontSize = 34;
    drawTextLine0251.kernSpacing = -0.4;
    drawTextLine0251.origin = CGPointMake(3066, 3569);
    [station0188.nameOriginalTextPrimitives addObject:drawTextLine0251];

    MWDrawTextLine *drawTextLine0252 = [[MWDrawTextLine alloc] init];
    drawTextLine0252.text = @"d'Ivry";
    drawTextLine0252.fontName = @"HelveticaNeue";
    drawTextLine0252.fontColor = [UIColor blackColor];
    drawTextLine0252.fontSize = 34;
    drawTextLine0252.kernSpacing = -0.2;
    drawTextLine0252.origin = CGPointMake(3056, 3603);
    [station0188.nameOriginalTextPrimitives addObject:drawTextLine0252];

    // Добавляем перегон
    MWHaul *haul0181 = [[MWHaul alloc] init];
    haul0181.identifier = @"haul0181";
    haul0181.length = 832;
    [edge0077.elements addObject:haul0181];

    MWDrawLine *drawLine0259 = [[MWDrawLine alloc] init];
    drawLine0259.startPoint = CGPointMake(3116.5, 3691.5);
    drawLine0259.endPoint = CGPointMake(3155, 3691.5);
    drawLine0259.width = 11;
    drawLine0259.color = line0008.color;
    [haul0181.drawPrimitives addObject:drawLine0259];

    MWDrawArc *drawArc0082 = [[MWDrawArc alloc] init];
    drawArc0082.center = CGPointMake(3154.5, 3721.5);
    drawArc0082.startDegrees = 270;
    drawArc0082.endDegrees = 315;
    drawArc0082.radius = 30;
    drawArc0082.width = 11;
    drawArc0082.color = line0008.color;
    [haul0181.drawPrimitives addObject:drawArc0082];

    MWDrawLine *drawLine0260 = [[MWDrawLine alloc] init];
    drawLine0260.startPoint = CGPointMake(3175.5, 3700);
    drawLine0260.endPoint = CGPointMake(3214, 3738.5);
    drawLine0260.width = 11;
    drawLine0260.color = line0008.color;
    [haul0181.drawPrimitives addObject:drawLine0260];

    // Добавляем станцию Pierre et Marie Curie
    MWStation *station0189 = [[MWStation alloc] init];
    station0189.identifier = @"station0189";
    [edge0077.elements addObject:station0189];
    
    station0189.nameOriginal = @"Pierre et Marie Curie";
    station0189.mapLocation = CGPointMake(3214, 3738.5);
    station0189.geoLocation = CGPointMake(48.81592, 2.37789);

    MWDrawFillCircle *fillCircle0215 = [[MWDrawFillCircle alloc] init];
    fillCircle0215.center = station0189.mapLocation;
    fillCircle0215.radius = 12;
    fillCircle0215.fillColor = line0008.color;
    [station0189.drawPrimitives addObject:fillCircle0215];

    MWDrawTextLine *drawTextLine0253 = [[MWDrawTextLine alloc] init];
    drawTextLine0253.text = @"Pierre et Marie";
    drawTextLine0253.fontName = @"HelveticaNeue";
    drawTextLine0253.fontColor = [UIColor blackColor];
    drawTextLine0253.fontSize = 34;
    drawTextLine0253.kernSpacing = 0.2;
    drawTextLine0253.origin = CGPointMake(2978, 3733);
    [station0189.nameOriginalTextPrimitives addObject:drawTextLine0253];

    MWDrawTextLine *drawTextLine0254 = [[MWDrawTextLine alloc] init];
    drawTextLine0254.text = @"Curie";
    drawTextLine0254.fontName = @"HelveticaNeue";
    drawTextLine0254.fontColor = [UIColor blackColor];
    drawTextLine0254.fontSize = 34;
    drawTextLine0254.kernSpacing = -0.2;
    drawTextLine0254.origin = CGPointMake(3122, 3766);
    [station0189.nameOriginalTextPrimitives addObject:drawTextLine0254];

    // Добавляем перегон
    MWHaul *haul0182 = [[MWHaul alloc] init];
    haul0182.identifier = @"haul0182";
    haul0182.length = 795;
    [edge0077.elements addObject:haul0182];

    MWDrawLine *drawLine0261 = [[MWDrawLine alloc] init];
    drawLine0261.startPoint = CGPointMake(3213.5, 3738);
    drawLine0261.endPoint = CGPointMake(3285, 3809);
    drawLine0261.width = 11;
    drawLine0261.color = line0008.color;
    [haul0182.drawPrimitives addObject:drawLine0261];

    // Добавляем станцию Mairie d'Ivry
    MWStation *station0190 = [[MWStation alloc] init];
    station0190.identifier = @"station0190";
    [edge0077.elements addObject:station0190];
    
    station0190.nameOriginal = @"Mairie d'Ivry";
    station0190.mapLocation = CGPointMake(3285, 3809);
    station0190.geoLocation = CGPointMake(48.81112, 2.38339);

    MWDrawFillCircle *fillCircle0216 = [[MWDrawFillCircle alloc] init];
    fillCircle0216.center = station0190.mapLocation;
    fillCircle0216.radius = 12;
    fillCircle0216.fillColor = [UIColor blackColor];
    [station0190.drawPrimitives addObject:fillCircle0216];

    MWDrawTextLine *drawTextLine0255 = [[MWDrawTextLine alloc] init];
    drawTextLine0255.text = station0190.nameOriginal;
    drawTextLine0255.fontName = @"Helvetica-Bold";
    drawTextLine0255.fontColor = [UIColor blackColor];
    drawTextLine0255.fontSize = 30;
    drawTextLine0255.kernSpacing = 1.9;
    drawTextLine0255.origin = CGPointMake(3086, 3825);
    [station0190.drawPrimitives addObject:drawTextLine0255];

    MWDrawFillCircle *fillCircle0217 = [[MWDrawFillCircle alloc] init];
    fillCircle0217.center = CGPointMake(3317, 3841);
    fillCircle0217.radius = 28;
    fillCircle0217.fillColor = line0008.color;
    [station0190.drawPrimitives addObject:fillCircle0217];

    MWDrawTextLine *drawTextLine0256 = [[MWDrawTextLine alloc] init];
    drawTextLine0256.text = @"7";
    drawTextLine0256.fontName = @"HelveticaNeue-Bold";
    drawTextLine0256.fontColor = [UIColor blackColor];
    drawTextLine0256.fontSize = 44;
    drawTextLine0256.origin = CGPointMake(3305.5, 3814);
    [station0190.drawPrimitives addObject:drawTextLine0256];

    // Добавляем вершину
    edge0077.finishVertex = vertex0060;

    // Создаем участок линии Maison Blanche - Villejuif - Louis Aragon
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0078 = [[MWEdge alloc] init];
    edge0078.identifier = @"edge0078";
    edge0078.developmentName = @"Ребро: Maison Blanche - Villejuif - Louis Aragon";
    [self.edges addObject:edge0078];
    
    // Добавляем линию
    edge0078.line = line0008;
    
    // Добавляем вершину
    edge0078.startVertex = vertex0058;
    
    // Добавляем станцию Maison Blanche
    [edge0078.elements addObject:station0185];

    // Добавляем перегон
    MWHaul *haul0183 = [[MWHaul alloc] init];
    haul0183.identifier = @"haul0183";
    haul0183.length = 1621; // Прямое расстояние, т.к. маршрут неизвестен
    [edge0078.elements addObject:haul0183];

    MWDrawLine *drawLine0262 = [[MWDrawLine alloc] init];
    drawLine0262.startPoint = CGPointMake(2705, 3612.5);
    drawLine0262.endPoint = CGPointMake(2705, 3724.5);
    drawLine0262.width = 11;
    drawLine0262.color = line0008.color;
    [haul0183.drawPrimitives addObject:drawLine0262];

    // Добавляем станцию Le Kremlin-Bicêtre
    MWStation *station0191 = [[MWStation alloc] init];
    station0191.identifier = @"station0191";
    [edge0078.elements addObject:station0191];
    
    station0191.nameOriginal = @"Le Kremlin-Bicêtre";
    station0191.mapLocation = CGPointMake(2705, 3724.5);
    station0191.geoLocation = CGPointMake(48.810388, 2.361849);

    MWDrawFillCircle *fillCircle0218 = [[MWDrawFillCircle alloc] init];
    fillCircle0218.center = station0191.mapLocation;
    fillCircle0218.radius = 12;
    fillCircle0218.fillColor = line0008.color;
    [station0191.drawPrimitives addObject:fillCircle0218];

    MWDrawTextLine *drawTextLine0257 = [[MWDrawTextLine alloc] init];
    drawTextLine0257.text = @"Le Kremlin";
    drawTextLine0257.fontName = @"HelveticaNeue";
    drawTextLine0257.fontColor = [UIColor blackColor];
    drawTextLine0257.fontSize = 34;
    drawTextLine0257.kernSpacing = 0.2;
    drawTextLine0257.origin = CGPointMake(2724, 3703);
    [station0191.nameOriginalTextPrimitives addObject:drawTextLine0257];

    MWDrawTextLine *drawTextLine0258 = [[MWDrawTextLine alloc] init];
    drawTextLine0258.text = @"Bicêtre";
    drawTextLine0258.fontName = @"HelveticaNeue";
    drawTextLine0258.fontColor = [UIColor blackColor];
    drawTextLine0258.fontSize = 34;
    drawTextLine0258.kernSpacing = 0.2;
    drawTextLine0258.origin = CGPointMake(2724, 3736);
    [station0191.nameOriginalTextPrimitives addObject:drawTextLine0258];

    // Добавляем перегон
    MWHaul *haul0184 = [[MWHaul alloc] init];
    haul0184.identifier = @"haul0184";
    haul0184.length = 648;
    [edge0078.elements addObject:haul0184];

    MWDrawLine *drawLine0263 = [[MWDrawLine alloc] init];
    drawLine0263.startPoint = CGPointMake(2705, 3724);
    drawLine0263.endPoint = CGPointMake(2705, 3819);
    drawLine0263.width = 11;
    drawLine0263.color = line0008.color;
    [haul0184.drawPrimitives addObject:drawLine0263];

    // Добавляем станцию Villejuif - Léo Lagrange
    MWStation *station0192 = [[MWStation alloc] init];
    station0192.identifier = @"station0192";
    [edge0078.elements addObject:station0192];
    
    station0192.nameOriginal = @"Villejuif - Léo Lagrange";
    station0192.mapLocation = CGPointMake(2705, 3819);
    station0192.geoLocation = CGPointMake(48.803768, 2.363927);

    MWDrawFillCircle *fillCircle0219 = [[MWDrawFillCircle alloc] init];
    fillCircle0219.center = station0192.mapLocation;
    fillCircle0219.radius = 12;
    fillCircle0219.fillColor = line0008.color;
    [station0192.drawPrimitives addObject:fillCircle0219];

    MWDrawTextLine *drawTextLine0259 = [[MWDrawTextLine alloc] init];
    drawTextLine0259.text = @"Villejuif";
    drawTextLine0259.fontName = @"HelveticaNeue";
    drawTextLine0259.fontColor = [UIColor blackColor];
    drawTextLine0259.fontSize = 34;
    drawTextLine0259.kernSpacing = 1.3;
    drawTextLine0259.origin = CGPointMake(2724, 3797);
    [station0192.nameOriginalTextPrimitives addObject:drawTextLine0259];

    MWDrawTextLine *drawTextLine0260 = [[MWDrawTextLine alloc] init];
    drawTextLine0260.text = @"Léo Lagrange";
    drawTextLine0260.fontName = @"HelveticaNeue";
    drawTextLine0260.fontColor = [UIColor blackColor];
    drawTextLine0260.fontSize = 34;
    drawTextLine0260.kernSpacing = -1.0;
    drawTextLine0260.origin = CGPointMake(2724, 3831);
    [station0192.nameOriginalTextPrimitives addObject:drawTextLine0260];

    // Добавляем перегон
    MWHaul *haul0185 = [[MWHaul alloc] init];
    haul0185.identifier = @"haul0185";
    haul0185.length = 982;
    [edge0078.elements addObject:haul0185];

    MWDrawLine *drawLine0264 = [[MWDrawLine alloc] init];
    drawLine0264.startPoint = CGPointMake(2705, 3818.5);
    drawLine0264.endPoint = CGPointMake(2705, 3914);
    drawLine0264.width = 11;
    drawLine0264.color = line0008.color;
    [haul0185.drawPrimitives addObject:drawLine0264];

    // Добавляем станцию Villejuif - Paul Vaillant-Couturier
    MWStation *station0193 = [[MWStation alloc] init];
    station0193.identifier = @"station0193";
    [edge0078.elements addObject:station0193];
    
    station0193.nameOriginal = @"Villejuif - Paul Vaillant-Couturier";
    station0193.mapLocation = CGPointMake(2705, 3914);
    station0193.geoLocation = CGPointMake(48.803768, 2.363927);
    
    MWDrawFillCircle *fillCircle0220 = [[MWDrawFillCircle alloc] init];
    fillCircle0220.center = station0193.mapLocation;
    fillCircle0220.radius = 12;
    fillCircle0220.fillColor = line0008.color;
    [station0193.drawPrimitives addObject:fillCircle0220];

    MWDrawTextLine *drawTextLine0261 = [[MWDrawTextLine alloc] init];
    drawTextLine0261.text = @"Villejuif";
    drawTextLine0261.fontName = @"HelveticaNeue";
    drawTextLine0261.fontColor = [UIColor blackColor];
    drawTextLine0261.fontSize = 34;
    drawTextLine0261.kernSpacing = 1.3;
    drawTextLine0261.origin = CGPointMake(2724, 3892);
    [station0193.nameOriginalTextPrimitives addObject:drawTextLine0261];

    MWDrawTextLine *drawTextLine0262 = [[MWDrawTextLine alloc] init];
    drawTextLine0262.text = @"Paul Vaillant-Couturier";
    drawTextLine0262.fontName = @"HelveticaNeue";
    drawTextLine0262.fontColor = [UIColor blackColor];
    drawTextLine0262.fontSize = 34;
    drawTextLine0262.kernSpacing = -0.0;
    drawTextLine0262.origin = CGPointMake(2724, 3925);
    [station0193.nameOriginalTextPrimitives addObject:drawTextLine0262];

    // Добавляем перегон
    MWHaul *haul0186 = [[MWHaul alloc] init];
    haul0186.identifier = @"haul0186";
    haul0186.length = 1023;
    [edge0078.elements addObject:haul0186];

    MWDrawLine *drawLine0265 = [[MWDrawLine alloc] init];
    drawLine0265.startPoint = CGPointMake(2705, 3913.5);
    drawLine0265.endPoint = CGPointMake(2705, 4009.5);
    drawLine0265.width = 11;
    drawLine0265.color = line0008.color;
    [haul0186.drawPrimitives addObject:drawLine0265];

    // Добавляем станцию Villejuif - Louis Aragon
    MWStation *station0194 = [[MWStation alloc] init];
    station0194.identifier = @"station0194";
    [edge0078.elements addObject:station0194];
    
    station0194.nameOriginal = @"Villejuif - Louis Aragon";
    station0194.mapLocation = CGPointMake(2705, 4009.5);
    station0194.geoLocation = CGPointMake(48.795991, 2.368248);

    MWDrawFillCircle *fillCircle0221 = [[MWDrawFillCircle alloc] init];
    fillCircle0221.center = station0194.mapLocation;
    fillCircle0221.radius = 13;
    fillCircle0221.fillColor = [UIColor blackColor];
    [station0194.drawPrimitives addObject:fillCircle0221];

    MWDrawFillCircle *fillCircle0222 = [[MWDrawFillCircle alloc] init];
    fillCircle0222.center = station0194.mapLocation;
    fillCircle0222.radius = 11;
    fillCircle0222.fillColor = [UIColor whiteColor];
    [station0194.drawPrimitives addObject:fillCircle0222];

    MWDrawFillCircle *fillCircle0223 = [[MWDrawFillCircle alloc] init];
    fillCircle0223.center = CGPointMake(2764.5, 4009);
    fillCircle0223.radius = 28;
    fillCircle0223.fillColor = line0008.color;
    [station0194.drawPrimitives addObject:fillCircle0223];

    MWDrawTextLine *drawTextLine0263 = [[MWDrawTextLine alloc] init];
    drawTextLine0263.text = @"7";
    drawTextLine0263.fontName = @"HelveticaNeue-Bold";
    drawTextLine0263.fontColor = [UIColor blackColor];
    drawTextLine0263.fontSize = 44;
    drawTextLine0263.origin = CGPointMake(2753, 3982);
    [station0194.drawPrimitives addObject:drawTextLine0263];
    
    MWDrawTextLine *drawTextLine0264 = [[MWDrawTextLine alloc] init];
    drawTextLine0264.text = station0194.nameOriginal;
    drawTextLine0264.fontName = @"Helvetica-Bold";
    drawTextLine0264.fontColor = [UIColor blackColor];
    drawTextLine0264.fontSize = 30;
    drawTextLine0264.kernSpacing = 1.3;
    drawTextLine0264.origin = CGPointMake(2802, 3992);
    [station0194.drawPrimitives addObject:drawTextLine0264];

    // Добавляем вершину
    edge0078.finishVertex = vertex0059;

    ////////////////////////////////////////////////////////////////
    // Line 7bis
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Louis Blanc - Jaurès
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0079 = [[MWEdge alloc] init];
    edge0079.identifier = @"edge0079";
    edge0079.developmentName = @"Ребро: Louis Blanc - Jaurès";
    [self.edges addObject:edge0079];
    
    // Добавляем линию
    edge0079.line = line0009;
    
    // Добавляем вершину
    edge0079.startVertex = vertex0054;

    // Добавляем станцию Louis Blanc
    MWStation *station0195 = [[MWStation alloc] init];
    station0195.identifier = @"station0195";
    [edge0079.elements addObject:station0195];
    
    station0195.nameOriginal = @"Louis Blanc";
    station0195.mapLocation = CGPointMake(3023, 1474.5);
    station0195.geoLocation = CGPointMake(48.881137, 2.364839);

    MWDrawFillCircle *fillCircle0224 = [[MWDrawFillCircle alloc] init];
    fillCircle0224.center = CGPointMake(2976.5, 1421.5);
    fillCircle0224.radius = 28;
    fillCircle0224.fillColor = line0009.color;
    [station0195.drawPrimitives addObject:fillCircle0224];

    MWDrawTextLine *drawTextLine0265 = [[MWDrawTextLine alloc] init];
    drawTextLine0265.text = @"7";
    drawTextLine0265.fontName = @"HelveticaNeue-Bold";
    drawTextLine0265.fontColor = [UIColor blackColor];
    drawTextLine0265.fontSize = 44;
    drawTextLine0265.origin = CGPointMake(2956.5, 1393.5);
    [station0195.drawPrimitives addObject:drawTextLine0265];

    MWDrawTextLine *drawTextLine0266 = [[MWDrawTextLine alloc] init];
    drawTextLine0266.text = @"bis";
    drawTextLine0266.fontName = @"HelveticaNeue-Bold";
    drawTextLine0266.fontColor = [UIColor blackColor];
    drawTextLine0266.fontSize = 15;
    drawTextLine0266.origin = CGPointMake(2978, 1414);
    [station0195.drawPrimitives addObject:drawTextLine0266];

    MWDrawFillCircle *fillCircle0225 = [[MWDrawFillCircle alloc] init];
    fillCircle0225.center = station0195.mapLocation;
    fillCircle0225.radius = 5.5;
    fillCircle0225.fillColor = line0009.color;
    [station0195.drawPrimitives addObject:fillCircle0225];

    station0195.showNameOnMap = false;
    [station0195.drawPrimitives addObject:drawTextLine0222];
    [station0195.drawPrimitives addObject:drawTextLine0223];

    // Добавляем перегон
    MWHaul *haul0187 = [[MWHaul alloc] init];
    haul0187.identifier = @"haul0187";
    haul0187.length = 412;
    [edge0079.elements addObject:haul0187];

    MWDrawLine *drawLine0266 = [[MWDrawLine alloc] init];
    drawLine0266.startPoint = CGPointMake(3023, 1474.5);
    drawLine0266.endPoint = CGPointMake(3102, 1395.5);
    drawLine0266.width = 11;
    drawLine0266.color = line0009.color;
    [haul0187.drawPrimitives addObject:drawLine0266];

    MWDrawArc *drawArc0083 = [[MWDrawArc alloc] init];
    drawArc0083.center = CGPointMake(3112, 1406.5);
    drawArc0083.startDegrees = 225;
    drawArc0083.endDegrees = 315;
    drawArc0083.radius = 15;
    drawArc0083.width = 11;
    drawArc0083.color = line0009.color;
    [haul0187.drawPrimitives addObject:drawArc0083];
    
    MWDrawLine *drawLine0267 = [[MWDrawLine alloc] init];
    drawLine0267.startPoint = CGPointMake(3122, 1395);
    drawLine0267.endPoint = CGPointMake(3152, 1425);
    drawLine0267.width = 11;
    drawLine0267.color = line0009.color;
    [haul0187.drawPrimitives addObject:drawLine0267];

    // Добавляем станцию Jaurès
    MWStation *station0196 = [[MWStation alloc] init];
    station0196.identifier = @"station0196";
    [edge0079.elements addObject:station0196];
    
    station0196.nameOriginal = @"Jaurès";
    station0196.mapLocation = CGPointMake(3152, 1425);
    station0196.geoLocation = CGPointMake(48.88292, 2.37067);
    
    MWDrawFillCircle *fillCircle0226 = [[MWDrawFillCircle alloc] init];
    fillCircle0226.center = station0196.mapLocation;
    fillCircle0226.radius = 3;
    fillCircle0226.fillColor = [UIColor whiteColor];
    [station0196.drawPrimitives addObject:fillCircle0226];

    station0196.showNameOnMap = false;
    [station0196.nameOriginalTextPrimitives addObject:drawTextLine0059];

    // Добавляем вершину
    edge0079.finishVertex = vertex0021;

    // Создаем участок линии Jaurès - Botzaris
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0080 = [[MWEdge alloc] init];
    edge0080.identifier = @"edge0080";
    edge0080.developmentName = @"Ребро: Jaurès - Botzaris";
    [self.edges addObject:edge0080];
    
    // Добавляем линию
    edge0080.line = line0009;
    
    // Добавляем вершину
    edge0080.startVertex = vertex0021;

    // Добавляем станцию Jaurès
    [edge0080.elements addObject:station0196];

    // Добавляем перегон
    MWHaul *haul0188 = [[MWHaul alloc] init];
    haul0188.identifier = @"haul0188";
    haul0188.length = 400;
    [edge0080.elements addObject:haul0188];

    MWDrawLine *drawLine0268 = [[MWDrawLine alloc] init];
    drawLine0268.startPoint = CGPointMake(3151.5, 1424.5);
    drawLine0268.endPoint = CGPointMake(3240, 1513);
    drawLine0268.width = 11;
    drawLine0268.color = line0009.color;
    [haul0188.drawPrimitives addObject:drawLine0268];

    // Добавляем станцию Bolivar
    MWStation *station0197 = [[MWStation alloc] init];
    station0197.identifier = @"station0197";
    [edge0080.elements addObject:station0197];
    
    station0197.nameOriginal = @"Bolivar";
    station0197.mapLocation = CGPointMake(3240, 1513);
    station0197.geoLocation = CGPointMake(48.880502, 2.374922);

    MWDrawFillCircle *fillCircle0227 = [[MWDrawFillCircle alloc] init];
    fillCircle0227.center = station0197.mapLocation;
    fillCircle0227.radius = 12;
    fillCircle0227.fillColor = line0009.color;
    [station0197.drawPrimitives addObject:fillCircle0227];

    MWDrawTextLine *drawTextLine0267 = [[MWDrawTextLine alloc] init];
    drawTextLine0267.text = station0197.nameOriginal;
    drawTextLine0267.fontName = @"HelveticaNeue";
    drawTextLine0267.fontColor = [UIColor blackColor];
    drawTextLine0267.fontSize = 34;
    drawTextLine0267.kernSpacing = -0.1;
    drawTextLine0267.origin = CGPointMake(3250, 1466);
    [station0197.nameOriginalTextPrimitives addObject:drawTextLine0267];
    
    // Добавляем перегон
    MWHaul *haul0189 = [[MWHaul alloc] init];
    haul0189.identifier = @"haul0189";
    haul0189.length = 611;
    [edge0080.elements addObject:haul0189];

    MWDrawLine *drawLine0269 = [[MWDrawLine alloc] init];
    drawLine0269.startPoint = CGPointMake(3239.5, 1512.5);
    drawLine0269.endPoint = CGPointMake(3263, 1536);
    drawLine0269.width = 11;
    drawLine0269.color = line0009.color;
    [haul0189.drawPrimitives addObject:drawLine0269];

    MWDrawArc *drawArc0084 = [[MWDrawArc alloc] init];
    drawArc0084.center = CGPointMake(3283.5, 1514);
    drawArc0084.startDegrees = 90;
    drawArc0084.endDegrees = 135;
    drawArc0084.radius = 30;
    drawArc0084.width = 11;
    drawArc0084.color = line0009.color;
    [haul0189.drawPrimitives addObject:drawArc0084];

    MWDrawLine *drawLine0270 = [[MWDrawLine alloc] init];
    drawLine0270.startPoint = CGPointMake(3283, 1544);
    drawLine0270.endPoint = CGPointMake(3405, 1544);
    drawLine0270.width = 11;
    drawLine0270.color = line0009.color;
    [haul0189.drawPrimitives addObject:drawLine0270];

    // Добавляем станцию Buttes Chaumont
    MWStation *station0198 = [[MWStation alloc] init];
    station0198.identifier = @"station0198";
    [edge0080.elements addObject:station0198];
    
    station0198.nameOriginal = @"Buttes Chaumont";
    station0198.mapLocation = CGPointMake(3405, 1544);
    station0198.geoLocation = CGPointMake(48.8785, 2.381772);

    MWDrawFillCircle *fillCircle0228 = [[MWDrawFillCircle alloc] init];
    fillCircle0228.center = station0198.mapLocation;
    fillCircle0228.radius = 12;
    fillCircle0228.fillColor = line0009.color;
    [station0198.drawPrimitives addObject:fillCircle0228];

    MWDrawTextLine *drawTextLine0268 = [[MWDrawTextLine alloc] init];
    drawTextLine0268.text = @"Buttes";
    drawTextLine0268.fontName = @"HelveticaNeue";
    drawTextLine0268.fontColor = [UIColor blackColor];
    drawTextLine0268.fontSize = 34;
    drawTextLine0268.kernSpacing = -0.4;
    drawTextLine0268.origin = CGPointMake(3356, 1555);
    [station0198.nameOriginalTextPrimitives addObject:drawTextLine0268];

    MWDrawTextLine *drawTextLine0269 = [[MWDrawTextLine alloc] init];
    drawTextLine0269.text = @"Chaumont";
    drawTextLine0269.fontName = @"HelveticaNeue";
    drawTextLine0269.fontColor = [UIColor blackColor];
    drawTextLine0269.fontSize = 34;
    drawTextLine0269.kernSpacing = -0.4;
    drawTextLine0269.origin = CGPointMake(3327, 1589);
    [station0198.nameOriginalTextPrimitives addObject:drawTextLine0269];

    // Добавляем перегон
    MWHaul *haul0190 = [[MWHaul alloc] init];
    haul0190.identifier = @"haul0190";
    haul0190.length = 554;
    [edge0080.elements addObject:haul0190];

    MWDrawLine *drawLine0271 = [[MWDrawLine alloc] init];
    drawLine0271.startPoint = CGPointMake(3404.5, 1544);
    drawLine0271.endPoint = CGPointMake(3494, 1544);
    drawLine0271.width = 11;
    drawLine0271.color = line0009.color;
    [haul0190.drawPrimitives addObject:drawLine0271];

    // Добавляем станцию Botzaris
    MWStation *station0199 = [[MWStation alloc] init];
    station0199.identifier = @"station0199";
    [edge0080.elements addObject:station0199];
    
    station0199.nameOriginal = @"Botzaris";
    station0199.mapLocation = CGPointMake(3494, 1544);
    station0199.geoLocation = CGPointMake(48.879552, 2.38804);
    
    MWDrawFillCircle *fillCircle0229 = [[MWDrawFillCircle alloc] init];
    fillCircle0229.center = station0199.mapLocation;
    fillCircle0229.radius = 12;
    fillCircle0229.fillColor = line0009.color;
    [station0199.drawPrimitives addObject:fillCircle0229];

    MWDrawTextLine *drawTextLine0270 = [[MWDrawTextLine alloc] init];
    drawTextLine0270.text = station0199.nameOriginal;
    drawTextLine0270.fontName = @"HelveticaNeue";
    drawTextLine0270.fontColor = [UIColor blackColor];
    drawTextLine0270.fontSize = 34;
    drawTextLine0270.kernSpacing = -0.4;
    drawTextLine0270.origin = CGPointMake(3518, 1522);
    [station0199.nameOriginalTextPrimitives addObject:drawTextLine0270];

    // Добавляем вершину
    edge0080.finishVertex = vertex0086;

    // Создаем участок линии Botzaris - Place des Fêtes
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0081 = [[MWEdge alloc] init];
    edge0081.identifier = @"edge0081";
    edge0081.developmentName = @"Ребро: Botzaris - Place des Fêtes";
    [self.edges addObject:edge0081];
    
    edge0081.directionFromStation = station0199;
    
    // Добавляем линию
    edge0081.line = line0009;
    
    // Добавляем вершину
    edge0081.startVertex = vertex0086;

    // Добавляем станцию Botzaris
    [edge0081.elements addObject:station0199];

    // Добавляем перегон
    MWHaul *haul0191 = [[MWHaul alloc] init];
    haul0191.identifier = @"haul0191";
    haul0191.length = 447;
    [edge0081.elements addObject:haul0191];

    MWDrawLine *drawLine0272 = [[MWDrawLine alloc] init];
    drawLine0272.startPoint = CGPointMake(3489.5, 1543.5);
    drawLine0272.endPoint = CGPointMake(3587, 1641);
    drawLine0272.width = 11;
    drawLine0272.color = line0009.color;
    [haul0191.drawPrimitives addObject:drawLine0272];

    MWDrawArc *drawArc0085 = [[MWDrawArc alloc] init];
    drawArc0085.center = CGPointMake(3608, 1619.5);
    drawArc0085.startDegrees = 90;
    drawArc0085.endDegrees = 135;
    drawArc0085.radius = 30;
    drawArc0085.width = 11;
    drawArc0085.color = line0009.color;
    [haul0191.drawPrimitives addObject:drawArc0085];
    
    MWDrawLine *drawLine0273 = [[MWDrawLine alloc] init];
    drawLine0273.startPoint = CGPointMake(3608, 1649.5);
    drawLine0273.endPoint = CGPointMake(3623, 1649.5);
    drawLine0273.width = 11;
    drawLine0273.color = line0009.color;
    [haul0191.drawPrimitives addObject:drawLine0273];

    MWDrawFillCircle *fillCircle0230 = [[MWDrawFillCircle alloc] init];
    fillCircle0230.center = CGPointMake(3592.5, 1617);
    fillCircle0230.radius = 2.5;
    fillCircle0230.fillColor = line0009.color;
    [haul0191.drawPrimitives addObject:fillCircle0230];

    MWDrawFillCircle *fillCircle0231 = [[MWDrawFillCircle alloc] init];
    fillCircle0231.center = CGPointMake(3592.5, 1597);
    fillCircle0231.radius = 2.5;
    fillCircle0231.fillColor = line0009.color;
    [haul0191.drawPrimitives addObject:fillCircle0231];

    MWDrawFillCircle *fillCircle0232 = [[MWDrawFillCircle alloc] init];
    fillCircle0232.center = CGPointMake(3570.5, 1597);
    fillCircle0232.radius = 2.5;
    fillCircle0232.fillColor = line0009.color;
    [haul0191.drawPrimitives addObject:fillCircle0232];

    MWDrawLine *drawLine0274 = [[MWDrawLine alloc] init];
    drawLine0274.startPoint = CGPointMake(3592.5, 1617);
    drawLine0274.endPoint = CGPointMake(3592.5, 1597);
    drawLine0274.width = 5;
    drawLine0274.color = line0009.color;
    [haul0191.drawPrimitives addObject:drawLine0274];

    MWDrawLine *drawLine0275 = [[MWDrawLine alloc] init];
    drawLine0275.startPoint = CGPointMake(3592.5, 1617);
    drawLine0275.endPoint = CGPointMake(3570.5, 1597);
    drawLine0275.width = 5;
    drawLine0275.color = line0009.color;
    [haul0191.drawPrimitives addObject:drawLine0275];

    // Добавляем станцию Place des Fêtes
    MWStation *station0200 = [[MWStation alloc] init];
    station0200.identifier = @"station0200";
    [edge0081.elements addObject:station0200];
    
    station0200.nameOriginal = @"Place des Fêtes";
    station0200.mapLocation = CGPointMake(3623, 1649.5);
    station0200.geoLocation = CGPointMake(48.87684, 2.39296);

    MWDrawFillCircle *fillCircle0233 = [[MWDrawFillCircle alloc] init];
    fillCircle0233.center = station0200.mapLocation;
    fillCircle0233.radius = 3;
    fillCircle0233.fillColor = [UIColor whiteColor];
    [station0200.drawPrimitives addObject:fillCircle0233];

    MWDrawTextLine *drawTextLine0271 = [[MWDrawTextLine alloc] init];
    drawTextLine0271.text = @"Place";
    drawTextLine0271.fontName = @"HelveticaNeue";
    drawTextLine0271.fontColor = [UIColor blackColor];
    drawTextLine0271.fontSize = 34;
    drawTextLine0271.kernSpacing = -0.8;
    drawTextLine0271.origin = CGPointMake(3578, 1683);
    [station0200.nameOriginalTextPrimitives addObject:drawTextLine0271];

    MWDrawTextLine *drawTextLine0272 = [[MWDrawTextLine alloc] init];
    drawTextLine0272.text = @"des Fêtes";
    drawTextLine0272.fontName = @"HelveticaNeue";
    drawTextLine0272.fontColor = [UIColor blackColor];
    drawTextLine0272.fontSize = 34;
    drawTextLine0272.kernSpacing = -1.0;
    drawTextLine0272.origin = CGPointMake(3536, 1717);
    [station0200.nameOriginalTextPrimitives addObject:drawTextLine0272];

    // Добавляем вершину
    edge0081.finishVertex = vertex0061;

    // Создаем участок линии Place des Fêtes - Botzaris
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0082 = [[MWEdge alloc] init];
    edge0082.identifier = @"edge0082";
    edge0082.developmentName = @"Ребро: Place des Fêtes - Botzaris";
    [self.edges addObject:edge0082];
    
    edge0082.directionFromStation = station0200;
    
    // Добавляем линию
    edge0082.line = line0009;
    
    // Добавляем вершину
    edge0082.startVertex = vertex0061;

    // Добавляем станцию Place des Fêtes
    [edge0082.elements addObject:station0200];

    // Добавляем перегон
    MWHaul *haul0192 = [[MWHaul alloc] init];
    haul0192.identifier = @"haul0192";
    haul0192.length = 722;
    [edge0082.elements addObject:haul0192];

    MWDrawLine *drawLine0276 = [[MWDrawLine alloc] init];
    drawLine0276.startPoint = CGPointMake(3623, 1649.5);
    drawLine0276.endPoint = CGPointMake(3639, 1649.5);
    drawLine0276.width = 11;
    drawLine0276.color = line0009.color;
    [haul0192.drawPrimitives addObject:drawLine0276];

    MWDrawArc *drawArc0086 = [[MWDrawArc alloc] init];
    drawArc0086.center = CGPointMake(3639, 1619.5);
    drawArc0086.startDegrees = 45;
    drawArc0086.endDegrees = 90;
    drawArc0086.radius = 30;
    drawArc0086.width = 11;
    drawArc0086.color = line0009.color;
    [haul0192.drawPrimitives addObject:drawArc0086];

    MWDrawLine *drawLine0277 = [[MWDrawLine alloc] init];
    drawLine0277.startPoint = CGPointMake(3660, 1641);
    drawLine0277.endPoint = CGPointMake(3747, 1554);
    drawLine0277.width = 11;
    drawLine0277.color = line0009.color;
    [haul0192.drawPrimitives addObject:drawLine0277];

    MWDrawArc *drawArc0087 = [[MWDrawArc alloc] init];
    drawArc0087.center = CGPointMake(3736, 1544);
    drawArc0087.startDegrees = 315;
    drawArc0087.endDegrees = 45;
    drawArc0087.radius = 15;
    drawArc0087.width = 11;
    drawArc0087.color = line0009.color;
    [haul0192.drawPrimitives addObject:drawArc0087];

    MWDrawLine *drawLine0278 = [[MWDrawLine alloc] init];
    drawLine0278.startPoint = CGPointMake(3748, 1534);
    drawLine0278.endPoint = CGPointMake(3740, 1526);
    drawLine0278.width = 11;
    drawLine0278.color = line0009.color;
    [haul0192.drawPrimitives addObject:drawLine0278];

    MWDrawFillCircle *fillCircle0234 = [[MWDrawFillCircle alloc] init];
    fillCircle0234.center = CGPointMake(3688, 1562);
    fillCircle0234.radius = 2.5;
    fillCircle0234.fillColor = line0009.color;
    [haul0192.drawPrimitives addObject:fillCircle0234];

    MWDrawFillCircle *fillCircle0235 = [[MWDrawFillCircle alloc] init];
    fillCircle0235.center = CGPointMake(3710, 1562);
    fillCircle0235.radius = 2.5;
    fillCircle0235.fillColor = line0009.color;
    [haul0192.drawPrimitives addObject:fillCircle0235];

    MWDrawFillCircle *fillCircle0236 = [[MWDrawFillCircle alloc] init];
    fillCircle0236.center = CGPointMake(3688, 1584.5);
    fillCircle0236.radius = 2.5;
    fillCircle0236.fillColor = line0009.color;
    [haul0192.drawPrimitives addObject:fillCircle0236];

    MWDrawLine *drawLine0279 = [[MWDrawLine alloc] init];
    drawLine0279.startPoint = CGPointMake(3688, 1562);
    drawLine0279.endPoint = CGPointMake(3710, 1562);
    drawLine0279.width = 5;
    drawLine0279.color = line0009.color;
    [haul0192.drawPrimitives addObject:drawLine0279];

    MWDrawLine *drawLine0280 = [[MWDrawLine alloc] init];
    drawLine0280.startPoint = CGPointMake(3710, 1562);
    drawLine0280.endPoint = CGPointMake(3688, 1584.5);
    drawLine0280.width = 5;
    drawLine0280.color = line0009.color;
    [haul0192.drawPrimitives addObject:drawLine0280];

    // Добавляем станцию Pré Saint-Gervais
    MWStation *station0201 = [[MWStation alloc] init];
    station0201.identifier = @"station0201";
    [edge0082.elements addObject:station0201];
    
    station0201.nameOriginal = @"Pré Saint-Gervais";
    station0201.mapLocation = CGPointMake(3740, 1526);
    station0201.geoLocation = CGPointMake(48.88025, 2.39891);

    MWDrawFillCircle *fillCircle0237 = [[MWDrawFillCircle alloc] init];
    fillCircle0237.center = station0201.mapLocation;
    fillCircle0237.radius = 13;
    fillCircle0237.fillColor = [UIColor blackColor];
    [station0201.drawPrimitives addObject:fillCircle0237];

    MWDrawFillCircle *fillCircle0238 = [[MWDrawFillCircle alloc] init];
    fillCircle0238.center = station0201.mapLocation;
    fillCircle0238.radius = 11;
    fillCircle0238.fillColor = [UIColor whiteColor];
    [station0201.drawPrimitives addObject:fillCircle0238];

    MWDrawFillCircle *fillCircle0239 = [[MWDrawFillCircle alloc] init];
    fillCircle0239.center = CGPointMake(3738.5, 1457.5);
    fillCircle0239.radius = 28;
    fillCircle0239.fillColor = line0009.color;
    [station0201.drawPrimitives addObject:fillCircle0239];

    MWDrawTextLine *drawTextLine0273 = [[MWDrawTextLine alloc] init];
    drawTextLine0273.text = @"7";
    drawTextLine0273.fontName = @"HelveticaNeue-Bold";
    drawTextLine0273.fontColor = [UIColor blackColor];
    drawTextLine0273.fontSize = 44;
    drawTextLine0273.origin = CGPointMake(3718.5, 1429.5);
    [station0201.drawPrimitives addObject:drawTextLine0273];

    MWDrawTextLine *drawTextLine0274 = [[MWDrawTextLine alloc] init];
    drawTextLine0274.text = @"bis";
    drawTextLine0274.fontName = @"HelveticaNeue-Bold";
    drawTextLine0274.fontColor = [UIColor blackColor];
    drawTextLine0274.fontSize = 15;
    drawTextLine0274.origin = CGPointMake(3740, 1450);
    [station0201.drawPrimitives addObject:drawTextLine0274];

    MWDrawTextLine *drawTextLine0275 = [[MWDrawTextLine alloc] init];
    drawTextLine0275.text = @"Pré";
    drawTextLine0275.fontName = @"Helvetica-Bold";
    drawTextLine0275.fontColor = [UIColor blackColor];
    drawTextLine0275.fontSize = 30;
    drawTextLine0275.kernSpacing = 1.3;
    drawTextLine0275.origin = CGPointMake(3700, 1361);
    [station0201.nameOriginalTextPrimitives addObject:drawTextLine0275];

    MWDrawTextLine *drawTextLine0276 = [[MWDrawTextLine alloc] init];
    drawTextLine0276.text = @"St-Gervais";
    drawTextLine0276.fontName = @"Helvetica-Bold";
    drawTextLine0276.fontColor = [UIColor blackColor];
    drawTextLine0276.fontSize = 30;
    drawTextLine0276.kernSpacing = 0.6;
    drawTextLine0276.origin = CGPointMake(3700, 1395);
    [station0201.nameOriginalTextPrimitives addObject:drawTextLine0276];

    // Добавляем перегон
    MWHaul *haul0193 = [[MWHaul alloc] init];
    haul0193.identifier = @"haul0193";
    haul0193.length = 466;
    [edge0082.elements addObject:haul0193];

    MWDrawLine *drawLine0281 = [[MWDrawLine alloc] init];
    drawLine0281.startPoint = CGPointMake(3740, 1526);
    drawLine0281.endPoint = CGPointMake(3660.5, 1446.5);
    drawLine0281.width = 11;
    drawLine0281.color = line0009.color;
    [haul0193.drawPrimitives addObject:drawLine0281];

    MWDrawArc *drawArc0088 = [[MWDrawArc alloc] init];
    drawArc0088.center = CGPointMake(3639.5, 1468);
    drawArc0088.startDegrees = 270;
    drawArc0088.endDegrees = 315;
    drawArc0088.radius = 30;
    drawArc0088.width = 11;
    drawArc0088.color = line0009.color;
    [haul0193.drawPrimitives addObject:drawArc0088];

    MWDrawLine *drawLine0282 = [[MWDrawLine alloc] init];
    drawLine0282.startPoint = CGPointMake(3640, 1438);
    drawLine0282.endPoint = CGPointMake(3623, 1438);
    drawLine0282.width = 11;
    drawLine0282.color = line0009.color;
    [haul0193.drawPrimitives addObject:drawLine0282];

    MWDrawFillCircle *fillCircle0240 = [[MWDrawFillCircle alloc] init];
    fillCircle0240.center = CGPointMake(3651, 1488);
    fillCircle0240.radius = 2.5;
    fillCircle0240.fillColor = line0009.color;
    [haul0193.drawPrimitives addObject:fillCircle0240];
    
    MWDrawFillCircle *fillCircle0241 = [[MWDrawFillCircle alloc] init];
    fillCircle0241.center = CGPointMake(3651, 1466);
    fillCircle0241.radius = 2.5;
    fillCircle0241.fillColor = line0009.color;
    [haul0193.drawPrimitives addObject:fillCircle0241];

    MWDrawFillCircle *fillCircle0242 = [[MWDrawFillCircle alloc] init];
    fillCircle0242.center = CGPointMake(3673, 1488);
    fillCircle0242.radius = 2.5;
    fillCircle0242.fillColor = line0009.color;
    [haul0193.drawPrimitives addObject:fillCircle0242];

    MWDrawLine *drawLine0283 = [[MWDrawLine alloc] init];
    drawLine0283.startPoint = CGPointMake(3651, 1466);
    drawLine0283.endPoint = CGPointMake(3651, 1488);
    drawLine0283.width = 5;
    drawLine0283.color = line0009.color;
    [haul0193.drawPrimitives addObject:drawLine0283];

    MWDrawLine *drawLine0284 = [[MWDrawLine alloc] init];
    drawLine0284.startPoint = CGPointMake(3651, 1466);
    drawLine0284.endPoint = CGPointMake(3673, 1488);
    drawLine0284.width = 5;
    drawLine0284.color = line0009.color;
    [haul0193.drawPrimitives addObject:drawLine0284];

    // Добавляем станцию Danube
    MWStation *station0202 = [[MWStation alloc] init];
    station0202.identifier = @"station0202";
    [edge0082.elements addObject:station0202];
    
    station0202.nameOriginal = @"Danube";
    station0202.mapLocation = CGPointMake(3623, 1438);
    station0202.geoLocation = CGPointMake(48.881808, 2.394201);

    MWDrawFillCircle *fillCircle0243 = [[MWDrawFillCircle alloc] init];
    fillCircle0243.center = station0202.mapLocation;
    fillCircle0243.radius = 12;
    fillCircle0243.fillColor = line0009.color;
    [station0202.drawPrimitives addObject:fillCircle0243];

    MWDrawTextLine *drawTextLine0277 = [[MWDrawTextLine alloc] init];
    drawTextLine0277.text = station0202.nameOriginal;
    drawTextLine0277.fontName = @"HelveticaNeue";
    drawTextLine0277.fontColor = [UIColor blackColor];
    drawTextLine0277.fontSize = 34;
    drawTextLine0277.kernSpacing = -0.4;
    drawTextLine0277.origin = CGPointMake(3511, 1388);
    [station0202.nameOriginalTextPrimitives addObject:drawTextLine0277];

    // Добавляем перегон
    MWHaul *haul0194 = [[MWHaul alloc] init];
    haul0194.identifier = @"haul0194";
    haul0194.length = 408;
    [edge0082.elements addObject:haul0194];

    MWDrawLine *drawLine0285 = [[MWDrawLine alloc] init];
    drawLine0285.startPoint = CGPointMake(3623, 1438);
    drawLine0285.endPoint = CGPointMake(3608, 1438);
    drawLine0285.width = 11;
    drawLine0285.color = line0009.color;
    [haul0194.drawPrimitives addObject:drawLine0285];
    
    MWDrawArc *drawArc0089 = [[MWDrawArc alloc] init];
    drawArc0089.center = CGPointMake(3608.5, 1468);
    drawArc0089.startDegrees = 225;
    drawArc0089.endDegrees = 270;
    drawArc0089.radius = 30;
    drawArc0089.width = 11;
    drawArc0089.color = line0009.color;
    [haul0194.drawPrimitives addObject:drawArc0089];

    MWDrawLine *drawLine0286 = [[MWDrawLine alloc] init];
    drawLine0286.startPoint = CGPointMake(3587.5, 1446.5);
    drawLine0286.endPoint = CGPointMake(3490, 1544);
    drawLine0286.width = 11;
    drawLine0286.color = line0009.color;
    [haul0194.drawPrimitives addObject:drawLine0286];
    
    MWDrawFillCircle *fillCircle0244 = [[MWDrawFillCircle alloc] init];
    fillCircle0244.center = CGPointMake(3564, 1496.5);
    fillCircle0244.radius = 2.5;
    fillCircle0244.fillColor = line0009.color;
    [haul0194.drawPrimitives addObject:fillCircle0244];

    MWDrawFillCircle *fillCircle0245 = [[MWDrawFillCircle alloc] init];
    fillCircle0245.center = CGPointMake(3543, 1519);
    fillCircle0245.radius = 2.5;
    fillCircle0245.fillColor = line0009.color;
    [haul0194.drawPrimitives addObject:fillCircle0245];

    MWDrawFillCircle *fillCircle0246 = [[MWDrawFillCircle alloc] init];
    fillCircle0246.center = CGPointMake(3564, 1519.5);
    fillCircle0246.radius = 2.5;
    fillCircle0246.fillColor = line0009.color;
    [haul0194.drawPrimitives addObject:fillCircle0246];

    MWDrawLine *drawLine0287 = [[MWDrawLine alloc] init];
    drawLine0287.startPoint = CGPointMake(3564, 1496.5);
    drawLine0287.endPoint = CGPointMake(3543, 1519);
    drawLine0287.width = 5;
    drawLine0287.color = line0009.color;
    [haul0194.drawPrimitives addObject:drawLine0287];

    MWDrawLine *drawLine0288 = [[MWDrawLine alloc] init];
    drawLine0288.startPoint = CGPointMake(3542.5, 1519.5);
    drawLine0288.endPoint = CGPointMake(3564, 1519.5);
    drawLine0288.width = 5;
    drawLine0288.color = line0009.color;
    [haul0194.drawPrimitives addObject:drawLine0288];

    // Добавляем станцию Botzaris
    [edge0082.elements addObject:station0199];

    // Добавляем вершину
    edge0082.finishVertex = vertex0086;
    
    ////////////////////////////////////////////////////////////////
    // Line 8
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Balard - La Motte-Picquet – Grenelle
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0083 = [[MWEdge alloc] init];
    edge0083.identifier = @"edge0083";
    edge0083.developmentName = @"Ребро: Balard - La Motte-Picquet – Grenelle";
    [self.edges addObject:edge0083];
    
    // Добавляем линию
    edge0083.line = line0010;
    
    // Добавляем вершину
    edge0083.startVertex = vertex0062;

    // Добавляем станцию Balard
    MWStation *station0203 = [[MWStation alloc] init];
    station0203.identifier = @"station0203";
    [edge0083.elements addObject:station0203];
    
    station0203.nameOriginal = @"Balard";
    station0203.mapLocation = CGPointMake(976.5, 3545.5);
    station0203.geoLocation = CGPointMake(48.83597, 2.278212);

    MWDrawFillCircle *fillCircle0247 = [[MWDrawFillCircle alloc] init];
    fillCircle0247.center = CGPointMake(929.5, 3576.5);
    fillCircle0247.radius = 28;
    fillCircle0247.fillColor = line0010.color;
    [station0203.drawPrimitives addObject:fillCircle0247];

    MWDrawTextLine *drawTextLine0278 = [[MWDrawTextLine alloc] init];
    drawTextLine0278.text = @"8";
    drawTextLine0278.fontName = @"HelveticaNeue-Bold";
    drawTextLine0278.fontColor = [UIColor blackColor];
    drawTextLine0278.fontSize = 44;
    drawTextLine0278.origin = CGPointMake(918, 3548.5);
    [station0203.drawPrimitives addObject:drawTextLine0278];

    MWDrawTextLine *drawTextLine0279 = [[MWDrawTextLine alloc] init];
    drawTextLine0279.text = station0203.nameOriginal;
    drawTextLine0279.fontName = @"Helvetica-Bold";
    drawTextLine0279.fontColor = [UIColor blackColor];
    drawTextLine0279.fontSize = 30;
    drawTextLine0279.kernSpacing = 1.4;
    drawTextLine0279.origin = CGPointMake(962, 3559);
    [station0203.drawPrimitives addObject:drawTextLine0279];

    MWDrawFillCircle *fillCircle0248 = [[MWDrawFillCircle alloc] init];
    fillCircle0248.center = station0203.mapLocation;
    fillCircle0248.radius = 13;
    fillCircle0248.fillColor = [UIColor blackColor];
    [station0203.drawPrimitives addObject:fillCircle0248];
    
    MWDrawFillCircle *fillCircle0249 = [[MWDrawFillCircle alloc] init];
    fillCircle0249.center = station0203.mapLocation;
    fillCircle0249.radius = 11;
    fillCircle0249.fillColor = [UIColor whiteColor];
    [station0203.drawPrimitives addObject:fillCircle0249];

    // Добавляем перегон
    MWHaul *haul0195 = [[MWHaul alloc] init];
    haul0195.identifier = @"haul0195";
    haul0195.length = 401;
    [edge0083.elements addObject:haul0195];

    MWDrawLine *drawLine0289 = [[MWDrawLine alloc] init];
    drawLine0289.startPoint = CGPointMake(976.5, 3545.5);
    drawLine0289.endPoint = CGPointMake(1094.5, 3427);
    drawLine0289.width = 11;
    drawLine0289.color = line0010.color;
    [haul0195.drawPrimitives addObject:drawLine0289];

    // Добавляем станцию Lourmel
    MWStation *station0204 = [[MWStation alloc] init];
    station0204.identifier = @"station0204";
    [edge0083.elements addObject:station0204];
    
    station0204.nameOriginal = @"Lourmel";
    station0204.mapLocation = CGPointMake(1094.5, 3427);
    station0204.geoLocation = CGPointMake(48.838604, 2.281817);

    MWDrawFillCircle *fillCircle0250 = [[MWDrawFillCircle alloc] init];
    fillCircle0250.center = station0204.mapLocation;
    fillCircle0250.radius = 12;
    fillCircle0250.fillColor = line0010.color;
    [station0204.drawPrimitives addObject:fillCircle0250];

    MWDrawTextLine *drawTextLine0280 = [[MWDrawTextLine alloc] init];
    drawTextLine0280.text = station0204.nameOriginal;
    drawTextLine0280.fontName = @"HelveticaNeue";
    drawTextLine0280.fontColor = [UIColor blackColor];
    drawTextLine0280.fontSize = 34;
    drawTextLine0280.kernSpacing = 0.2;
    drawTextLine0280.origin = CGPointMake(1105, 3430);
    [station0204.nameOriginalTextPrimitives addObject:drawTextLine0280];
    
    // Добавляем перегон
    MWHaul *haul0196 = [[MWHaul alloc] init];
    haul0196.identifier = @"haul0196";
    haul0196.length = 511;
    [edge0083.elements addObject:haul0196];

    MWDrawLine *drawLine0290 = [[MWDrawLine alloc] init];
    drawLine0290.startPoint = CGPointMake(1094, 3427.5);
    drawLine0290.endPoint = CGPointMake(1186.5, 3335);
    drawLine0290.width = 11;
    drawLine0290.color = line0010.color;
    [haul0196.drawPrimitives addObject:drawLine0290];

    // Добавляем станцию Boucicaut
    MWStation *station0205 = [[MWStation alloc] init];
    station0205.identifier = @"station0205";
    [edge0083.elements addObject:station0205];
    
    station0205.nameOriginal = @"Boucicaut";
    station0205.mapLocation = CGPointMake(1186.5, 3335);
    station0205.geoLocation = CGPointMake(48.840578, 2.286621);

    MWDrawFillCircle *fillCircle0251 = [[MWDrawFillCircle alloc] init];
    fillCircle0251.center = station0205.mapLocation;
    fillCircle0251.radius = 12;
    fillCircle0251.fillColor = line0010.color;
    [station0205.drawPrimitives addObject:fillCircle0251];

    MWDrawTextLine *drawTextLine0281 = [[MWDrawTextLine alloc] init];
    drawTextLine0281.text = station0205.nameOriginal;
    drawTextLine0281.fontName = @"HelveticaNeue";
    drawTextLine0281.fontColor = [UIColor blackColor];
    drawTextLine0281.fontSize = 34;
    drawTextLine0281.kernSpacing = -0.8;
    drawTextLine0281.origin = CGPointMake(1198, 3338);
    [station0205.nameOriginalTextPrimitives addObject:drawTextLine0281];

    // Добавляем перегон
    MWHaul *haul0197 = [[MWHaul alloc] init];
    haul0197.identifier = @"haul0197";
    haul0197.length = 343;
    [edge0083.elements addObject:haul0197];

    MWDrawLine *drawLine0291 = [[MWDrawLine alloc] init];
    drawLine0291.startPoint = CGPointMake(1186, 3335.5);
    drawLine0291.endPoint = CGPointMake(1222.5, 3299);
    drawLine0291.width = 11;
    drawLine0291.color = line0010.color;
    [haul0197.drawPrimitives addObject:drawLine0291];

    MWDrawArc *drawArc0090 = [[MWDrawArc alloc] init];
    drawArc0090.center = CGPointMake(1201, 3278);
    drawArc0090.startDegrees = 0;
    drawArc0090.endDegrees = 45;
    drawArc0090.radius = 30;
    drawArc0090.width = 11;
    drawArc0090.color = line0010.color;
    [haul0197.drawPrimitives addObject:drawArc0090];

    MWDrawLine *drawLine0292 = [[MWDrawLine alloc] init];
    drawLine0292.startPoint = CGPointMake(1231, 3278);
    drawLine0292.endPoint = CGPointMake(1231, 3207);
    drawLine0292.width = 11;
    drawLine0292.color = line0010.color;
    [haul0197.drawPrimitives addObject:drawLine0292];

    // Добавляем станцию Félix Faure
    MWStation *station0206 = [[MWStation alloc] init];
    station0206.identifier = @"station0206";
    [edge0083.elements addObject:station0206];
    
    station0206.nameOriginal = @"Félix Faure";
    station0206.mapLocation = CGPointMake(1231, 3207);
    station0206.geoLocation = CGPointMake(48.842351, 2.291004);

    MWDrawFillCircle *fillCircle0252 = [[MWDrawFillCircle alloc] init];
    fillCircle0252.center = station0206.mapLocation;
    fillCircle0252.radius = 12;
    fillCircle0252.fillColor = line0010.color;
    [station0206.drawPrimitives addObject:fillCircle0252];

    MWDrawTextLine *drawTextLine0282 = [[MWDrawTextLine alloc] init];
    drawTextLine0282.text = station0206.nameOriginal;
    drawTextLine0282.fontName = @"HelveticaNeue";
    drawTextLine0282.fontColor = [UIColor blackColor];
    drawTextLine0282.fontSize = 34;
    drawTextLine0282.kernSpacing = -0.6;
    drawTextLine0282.origin = CGPointMake(1250, 3185);
    [station0206.nameOriginalTextPrimitives addObject:drawTextLine0282];

    // Добавляем перегон
    MWHaul *haul0198 = [[MWHaul alloc] init];
    haul0198.identifier = @"haul0198";
    haul0198.length = 272;
    [edge0083.elements addObject:haul0198];
    
    MWDrawLine *drawLine0293 = [[MWDrawLine alloc] init];
    drawLine0293.startPoint = CGPointMake(1231, 3207.5);
    drawLine0293.endPoint = CGPointMake(1231, 3084.5);
    drawLine0293.width = 11;
    drawLine0293.color = line0010.color;
    [haul0198.drawPrimitives addObject:drawLine0293];

    // Добавляем станцию Commerce
    MWStation *station0207 = [[MWStation alloc] init];
    station0207.identifier = @"station0207";
    [edge0083.elements addObject:station0207];
    
    station0207.nameOriginal = @"Commerce";
    station0207.mapLocation = CGPointMake(1231, 3084.5);
    station0207.geoLocation = CGPointMake(48.845093, 2.294215);

    MWDrawFillCircle *fillCircle0253 = [[MWDrawFillCircle alloc] init];
    fillCircle0253.center = station0207.mapLocation;
    fillCircle0253.radius = 12;
    fillCircle0253.fillColor = line0010.color;
    [station0207.drawPrimitives addObject:fillCircle0253];
    
    MWDrawTextLine *drawTextLine0283 = [[MWDrawTextLine alloc] init];
    drawTextLine0283.text = station0207.nameOriginal;
    drawTextLine0283.fontName = @"HelveticaNeue";
    drawTextLine0283.fontColor = [UIColor blackColor];
    drawTextLine0283.fontSize = 34;
    drawTextLine0283.kernSpacing = -0.8;
    drawTextLine0283.origin = CGPointMake(1250, 3060);
    [station0207.nameOriginalTextPrimitives addObject:drawTextLine0283];

    // Добавляем перегон
    MWHaul *haul0199 = [[MWHaul alloc] init];
    haul0199.identifier = @"haul0199";
    haul0199.length = 576;
    [edge0083.elements addObject:haul0199];

    MWDrawLine *drawLine0294 = [[MWDrawLine alloc] init];
    drawLine0294.startPoint = CGPointMake(1231, 3084);
    drawLine0294.endPoint = CGPointMake(1231, 2923.5);
    drawLine0294.width = 11;
    drawLine0294.color = line0010.color;
    [haul0199.drawPrimitives addObject:drawLine0294];

    // Добавляем станцию La Motte-Picquet – Grenelle
    MWStation *station0208 = [[MWStation alloc] init];
    station0208.identifier = @"station0208";
    [edge0083.elements addObject:station0208];
    
    station0208.nameOriginal = @"La Motte-Picquet — Grenelle";
    station0208.mapLocation = CGPointMake(1231, 2923.5);
    station0208.geoLocation = CGPointMake(48.849143, 2.29809);

    MWDrawFillCircle *fillCircle0254 = [[MWDrawFillCircle alloc] init];
    fillCircle0254.center = station0208.mapLocation;
    fillCircle0254.radius = 3;
    fillCircle0254.fillColor = [UIColor whiteColor];
    [station0208.drawPrimitives addObject:fillCircle0254];

    station0208.showNameOnMap = false;
    [station0208.nameOriginalTextPrimitives addObject:drawTextLine0187];
    [station0208.nameOriginalTextPrimitives addObject:drawTextLine0188];
    [station0208.nameOriginalTextPrimitives addObject:drawTextLine0189];
    
    // Добавляем вершину
    edge0083.finishVertex = vertex0049;

    // Создаем участок линии La Motte-Picquet – Grenelle - Invalides
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0084 = [[MWEdge alloc] init];
    edge0084.identifier = @"edge0084";
    edge0084.developmentName = @"Ребро: La Motte-Picquet – Grenelle - Invalides";
    [self.edges addObject:edge0084];
    
    // Добавляем линию
    edge0084.line = line0010;
    
    // Добавляем вершину
    edge0084.startVertex = vertex0049;

    // Добавляем станцию La Motte-Picquet – Grenelle
    [edge0084.elements addObject:station0208];

    // Добавляем перегон
    MWHaul *haul0200 = [[MWHaul alloc] init];
    haul0200.identifier = @"haul0200";
    haul0200.length = 893;
    [edge0084.elements addObject:haul0200];
    
    MWDrawLine *drawLine0295 = [[MWDrawLine alloc] init];
    drawLine0295.startPoint = CGPointMake(1231, 2924);
    drawLine0295.endPoint = CGPointMake(1231, 2719);
    drawLine0295.width = 11;
    drawLine0295.color = line0010.color;
    [haul0200.drawPrimitives addObject:drawLine0295];

    // Добавляем станцию École Militaire
    MWStation *station0209 = [[MWStation alloc] init];
    station0209.identifier = @"station0209";
    [edge0084.elements addObject:station0209];
    
    station0209.nameOriginal = @"École Militaire";
    station0209.mapLocation = CGPointMake(1231, 2719);
    station0209.geoLocation = CGPointMake(48.85511, 2.306737);

    MWDrawFillCircle *fillCircle0255 = [[MWDrawFillCircle alloc] init];
    fillCircle0255.center = station0209.mapLocation;
    fillCircle0255.radius = 12;
    fillCircle0255.fillColor = line0010.color;
    [station0209.drawPrimitives addObject:fillCircle0255];
    
    MWDrawTextLine *drawTextLine0284 = [[MWDrawTextLine alloc] init];
    drawTextLine0284.text = @"École";
    drawTextLine0284.fontName = @"HelveticaNeue";
    drawTextLine0284.fontColor = [UIColor blackColor];
    drawTextLine0284.fontSize = 34;
    drawTextLine0284.kernSpacing = -0.8;
    drawTextLine0284.origin = CGPointMake(1252, 2669);
    [station0209.nameOriginalTextPrimitives addObject:drawTextLine0284];

    MWDrawTextLine *drawTextLine0285 = [[MWDrawTextLine alloc] init];
    drawTextLine0285.text = @"Militaire";
    drawTextLine0285.fontName = @"HelveticaNeue";
    drawTextLine0285.fontColor = [UIColor blackColor];
    drawTextLine0285.fontSize = 34;
    drawTextLine0285.kernSpacing = 0.8;
    drawTextLine0285.origin = CGPointMake(1252, 2703);
    [station0209.nameOriginalTextPrimitives addObject:drawTextLine0285];

    // Добавляем перегон
    MWHaul *haul0201 = [[MWHaul alloc] init];
    haul0201.identifier = @"haul0201";
    haul0201.length = 439;
    [edge0084.elements addObject:haul0201];

    MWDrawLine *drawLine0296 = [[MWDrawLine alloc] init];
    drawLine0296.startPoint = CGPointMake(1231, 2719.5);
    drawLine0296.endPoint = CGPointMake(1231, 2692);
    drawLine0296.width = 11;
    drawLine0296.color = line0010.color;
    [haul0201.drawPrimitives addObject:drawLine0296];

    MWDrawArc *drawArc0091 = [[MWDrawArc alloc] init];
    drawArc0091.center = CGPointMake(1261, 2692);
    drawArc0091.startDegrees = 180;
    drawArc0091.endDegrees = 225;
    drawArc0091.radius = 30;
    drawArc0091.width = 11;
    drawArc0091.color = line0010.color;
    [haul0201.drawPrimitives addObject:drawArc0091];

    MWDrawLine *drawLine0297 = [[MWDrawLine alloc] init];
    drawLine0297.startPoint = CGPointMake(1239, 2671.5);
    drawLine0297.endPoint = CGPointMake(1338.5, 2572);
    drawLine0297.width = 11;
    drawLine0297.color = line0010.color;
    [haul0201.drawPrimitives addObject:drawLine0297];

    // Добавляем станцию La Tour-Maubourg
    MWStation *station0210 = [[MWStation alloc] init];
    station0210.identifier = @"station0210";
    [edge0084.elements addObject:station0210];
    
    station0210.nameOriginal = @"La Tour-Maubourg";
    station0210.mapLocation = CGPointMake(1338.5, 2572);
    station0210.geoLocation = CGPointMake(48.857667, 2.310399);
    
    MWDrawFillCircle *fillCircle0256 = [[MWDrawFillCircle alloc] init];
    fillCircle0256.center = station0210.mapLocation;
    fillCircle0256.radius = 12;
    fillCircle0256.fillColor = line0010.color;
    [station0210.drawPrimitives addObject:fillCircle0256];

    MWDrawTextLine *drawTextLine0286 = [[MWDrawTextLine alloc] init];
    drawTextLine0286.text = @"La Tour";
    drawTextLine0286.fontName = @"HelveticaNeue";
    drawTextLine0286.fontColor = [UIColor blackColor];
    drawTextLine0286.fontSize = 34;
    drawTextLine0286.kernSpacing = -0.6;
    drawTextLine0286.origin = CGPointMake(1218, 2492);
    [station0210.nameOriginalTextPrimitives addObject:drawTextLine0286];

    MWDrawTextLine *drawTextLine0287 = [[MWDrawTextLine alloc] init];
    drawTextLine0287.text = @"Maubourg";
    drawTextLine0287.fontName = @"HelveticaNeue";
    drawTextLine0287.fontColor = [UIColor blackColor];
    drawTextLine0287.fontSize = 34;
    drawTextLine0287.kernSpacing = -0.3;
    drawTextLine0287.origin = CGPointMake(1176, 2525);
    [station0210.nameOriginalTextPrimitives addObject:drawTextLine0287];

    // Добавляем перегон
    MWHaul *haul0202 = [[MWHaul alloc] init];
    haul0202.identifier = @"haul0202";
    haul0202.length = 958;
    [edge0084.elements addObject:haul0202];

    MWDrawLine *drawLine0298 = [[MWDrawLine alloc] init];
    drawLine0298.startPoint = CGPointMake(1338, 2572.5);
    drawLine0298.endPoint = CGPointMake(1446, 2464.5);
    drawLine0298.width = 11;
    drawLine0298.color = line0010.color;
    [haul0202.drawPrimitives addObject:drawLine0298];

    // Добавляем станцию Invalides
    MWStation *station0211 = [[MWStation alloc] init];
    station0211.identifier = @"station0211";
    [edge0084.elements addObject:station0211];
    
    station0211.nameOriginal = @"Invalides";
    station0211.mapLocation = CGPointMake(1446, 2464.5);
    station0211.geoLocation = CGPointMake(48.86299, 2.31333);

    MWDrawFillCircle *fillCircle0257 = [[MWDrawFillCircle alloc] init];
    fillCircle0257.center = station0211.mapLocation;
    fillCircle0257.radius = 3;
    fillCircle0257.fillColor = [UIColor whiteColor];
    [station0211.drawPrimitives addObject:fillCircle0257];

    MWDrawTextLine *drawTextLine0288 = [[MWDrawTextLine alloc] init];
    drawTextLine0288.text = station0211.nameOriginal;
    drawTextLine0288.fontName = @"HelveticaNeue";
    drawTextLine0288.fontColor = [UIColor blackColor];
    drawTextLine0288.fontSize = 34;
    drawTextLine0288.kernSpacing = -0.3;
    drawTextLine0288.origin = CGPointMake(1286, 2409);
    [station0211.nameOriginalTextPrimitives addObject:drawTextLine0288];

    // Добавляем вершину
    edge0084.finishVertex = vertex0063;

    // Создаем участок линии Invalides - Concorde
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0085 = [[MWEdge alloc] init];
    edge0085.identifier = @"edge0085";
    edge0085.developmentName = @"Ребро: Invalides - Concorde";
    [self.edges addObject:edge0085];
    
    // Добавляем линию
    edge0085.line = line0010;
    
    // Добавляем вершину
    edge0085.startVertex = vertex0063;

    // Добавляем станцию Invalides
    [edge0085.elements addObject:station0211];

    // Добавляем перегон
    MWHaul *haul0203 = [[MWHaul alloc] init];
    haul0203.identifier = @"haul0203";
    haul0203.length = 877;
    [edge0085.elements addObject:haul0203];

    MWDrawLine *drawLine0299 = [[MWDrawLine alloc] init];
    drawLine0299.startPoint = CGPointMake(1445.5, 2465);
    drawLine0299.endPoint = CGPointMake(1504.5, 2406);
    drawLine0299.width = 11;
    drawLine0299.color = line0010.color;
    [haul0203.drawPrimitives addObject:drawLine0299];

    MWDrawArc *drawArc0092 = [[MWDrawArc alloc] init];
    drawArc0092.center = CGPointMake(1482.5, 2385.5);
    drawArc0092.startDegrees = 0;
    drawArc0092.endDegrees = 45;
    drawArc0092.radius = 30;
    drawArc0092.width = 11;
    drawArc0092.color = line0010.color;
    [haul0203.drawPrimitives addObject:drawArc0092];

    MWDrawLine *drawLine0300 = [[MWDrawLine alloc] init];
    drawLine0300.startPoint = CGPointMake(1512.5, 2386);
    drawLine0300.endPoint = CGPointMake(1512.5, 2280.5);
    drawLine0300.width = 11;
    drawLine0300.color = line0010.color;
    [haul0203.drawPrimitives addObject:drawLine0300];

    // Добавляем станцию Concorde
    MWStation *station0212 = [[MWStation alloc] init];
    station0212.identifier = @"station0212";
    [edge0085.elements addObject:station0212];
    
    station0212.nameOriginal = @"Concorde";
    station0212.mapLocation = CGPointMake(1512.5, 2280.5);
    station0212.geoLocation = CGPointMake(48.86541, 2.32111);

    MWDrawFillCircle *fillCircle0258 = [[MWDrawFillCircle alloc] init];
    fillCircle0258.center = station0212.mapLocation;
    fillCircle0258.radius = 3;
    fillCircle0258.fillColor = [UIColor whiteColor];
    [station0212.drawPrimitives addObject:fillCircle0258];

    station0212.showNameOnMap = false;
    [station0212.nameOriginalTextPrimitives addObject:drawTextLine0019];

    // Добавляем вершину
    edge0085.finishVertex = vertex0005;

    // Создаем участок линии Concorde - Madeleine
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0086 = [[MWEdge alloc] init];
    edge0086.identifier = @"edge0086";
    edge0086.developmentName = @"Ребро: Concorde - Madeleine";
    [self.edges addObject:edge0086];

    // Добавляем линию
    edge0086.line = line0010;
    
    // Добавляем вершину
    edge0086.startVertex = vertex0005;

    // Добавляем станцию Concorde
    [edge0086.elements addObject:station0212];

    // Добавляем перегон
    MWHaul *haul0204 = [[MWHaul alloc] init];
    haul0204.identifier = @"haul0204";
    haul0204.length = 493;
    [edge0086.elements addObject:haul0204];
    
    MWDrawLine *drawLine0301 = [[MWDrawLine alloc] init];
    drawLine0301.startPoint = CGPointMake(1512.5, 2281);
    drawLine0301.endPoint = CGPointMake(1512.5, 2156);
    drawLine0301.width = 11;
    drawLine0301.color = line0010.color;
    [haul0204.drawPrimitives addObject:drawLine0301];

    MWDrawArc *drawArc0093 = [[MWDrawArc alloc] init];
    drawArc0093.center = CGPointMake(1527.5, 2156);
    drawArc0093.startDegrees = 180;
    drawArc0093.endDegrees = 270;
    drawArc0093.radius = 15;
    drawArc0093.width = 11;
    drawArc0093.color = line0010.color;
    [haul0204.drawPrimitives addObject:drawArc0093];

    MWDrawLine *drawLine0302 = [[MWDrawLine alloc] init];
    drawLine0302.startPoint = CGPointMake(1526, 2141.5);
    drawLine0302.endPoint = CGPointMake(1546, 2141.5);
    drawLine0302.width = 11;
    drawLine0302.color = line0010.color;
    [haul0204.drawPrimitives addObject:drawLine0302];

    // Добавляем станцию Madeleine
    MWStation *station0213 = [[MWStation alloc] init];
    station0213.identifier = @"station0213";
    [edge0086.elements addObject:station0213];
    
    station0213.nameOriginal = @"Madeleine";
    station0213.mapLocation = CGPointMake(1546, 2141.5);
    station0213.geoLocation = CGPointMake(48.86977, 2.3244);
    
    MWDrawFillCircle *fillCircle0259 = [[MWDrawFillCircle alloc] init];
    fillCircle0259.center = station0213.mapLocation;
    fillCircle0259.radius = 3;
    fillCircle0259.fillColor = [UIColor whiteColor];
    [station0213.drawPrimitives addObject:fillCircle0259];

    MWDrawTextLine *drawTextLine0289 = [[MWDrawTextLine alloc] init];
    drawTextLine0289.text = station0213.nameOriginal;
    drawTextLine0289.fontName = @"HelveticaNeue";
    drawTextLine0289.fontColor = [UIColor blackColor];
    drawTextLine0289.fontSize = 34;
    drawTextLine0289.kernSpacing = -0.3;
    drawTextLine0289.origin = CGPointMake(1571, 2098);
    [station0213.nameOriginalTextPrimitives addObject:drawTextLine0289];

    // Добавляем вершину
    edge0086.finishVertex = vertex0064;

    // Создаем участок линии Madeleine - Opéra
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0087 = [[MWEdge alloc] init];
    edge0087.identifier = @"edge0087";
    edge0087.developmentName = @"Ребро: Madeleine - Opéra";
    [self.edges addObject:edge0087];
    
    // Добавляем линию
    edge0087.line = line0010;
    
    // Добавляем вершину
    edge0087.startVertex = vertex0064;

    // Добавляем станцию Madeleine
    [edge0087.elements addObject:station0213];

    // Добавляем перегон
    MWHaul *haul0205 = [[MWHaul alloc] init];
    haul0205.identifier = @"haul0205";
    haul0205.length = 553;
    [edge0087.elements addObject:haul0205];

    MWDrawLine *drawLine0303 = [[MWDrawLine alloc] init];
    drawLine0303.startPoint = CGPointMake(1545.5, 2141.5);
    drawLine0303.endPoint = CGPointMake(1718, 2141.5);
    drawLine0303.width = 11;
    drawLine0303.color = line0010.color;
    [haul0205.drawPrimitives addObject:drawLine0303];

    MWDrawArc *drawArc0094 = [[MWDrawArc alloc] init];
    drawArc0094.center = CGPointMake(1717.5, 2111.5);
    drawArc0094.startDegrees = 45;
    drawArc0094.endDegrees = 90;
    drawArc0094.radius = 30;
    drawArc0094.width = 11;
    drawArc0094.color = line0010.color;
    [haul0205.drawPrimitives addObject:drawArc0094];

    MWDrawLine *drawLine0304 = [[MWDrawLine alloc] init];
    drawLine0304.startPoint = CGPointMake(1738, 2133.5);
    drawLine0304.endPoint = CGPointMake(1891, 1980.5);
    drawLine0304.width = 11;
    drawLine0304.color = line0010.color;
    [haul0205.drawPrimitives addObject:drawLine0304];

    // Добавляем станцию Opéra
    MWStation *station0214 = [[MWStation alloc] init];
    station0214.identifier = @"station0214";
    [edge0087.elements addObject:station0214];
    
    station0214.nameOriginal = @"Opéra";
    station0214.mapLocation = CGPointMake(1891, 1980.5);
    station0214.geoLocation = CGPointMake(48.870636, 2.332353);
    
    MWDrawFillCircle *fillCircle0260 = [[MWDrawFillCircle alloc] init];
    fillCircle0260.center = station0214.mapLocation;
    fillCircle0260.radius = 3;
    fillCircle0260.fillColor = [UIColor whiteColor];
    [station0214.drawPrimitives addObject:fillCircle0260];

    station0214.showNameOnMap = false;
    [station0214.nameOriginalTextPrimitives addObject:drawTextLine0086];

    // Добавляем вершину
    edge0087.finishVertex = vertex0027;

    // Создаем участок линии Opéra - Richelieu – Drouot
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0088 = [[MWEdge alloc] init];
    edge0088.identifier = @"edge0088";
    edge0088.developmentName = @"Ребро: Opéra - Richelieu – Drouot";
    [self.edges addObject:edge0088];
    
    // Добавляем линию
    edge0088.line = line0010;
    
    // Добавляем вершину
    edge0088.startVertex = vertex0027;

    // Добавляем станцию Opéra
    [edge0088.elements addObject:station0214];

    // Добавляем перегон
    MWHaul *haul0206 = [[MWHaul alloc] init];
    haul0206.identifier = @"haul0206";
    haul0206.length = 566;
    [edge0088.elements addObject:haul0206];
    
    MWDrawLine *drawLine0305 = [[MWDrawLine alloc] init];
    drawLine0305.startPoint = CGPointMake(1890.5, 1981);
    drawLine0305.endPoint = CGPointMake(1941, 1930.5);
    drawLine0305.width = 11;
    drawLine0305.color = line0010.color;
    [haul0206.drawPrimitives addObject:drawLine0305];

    MWDrawArc *drawArc0095 = [[MWDrawArc alloc] init];
    drawArc0095.center = CGPointMake(1962, 1952);
    drawArc0095.startDegrees = 225;
    drawArc0095.endDegrees = 270;
    drawArc0095.radius = 30;
    drawArc0095.width = 11;
    drawArc0095.color = line0010.color;
    [haul0206.drawPrimitives addObject:drawArc0095];

    MWDrawLine *drawLine0306 = [[MWDrawLine alloc] init];
    drawLine0306.startPoint = CGPointMake(1962, 1922);
    drawLine0306.endPoint = CGPointMake(2127, 1922);
    drawLine0306.width = 11;
    drawLine0306.color = line0010.color;
    [haul0206.drawPrimitives addObject:drawLine0306];

    // Добавляем станцию Richelieu – Drouot
    MWStation *station0215 = [[MWStation alloc] init];
    station0215.identifier = @"station0215";
    [edge0088.elements addObject:station0215];
    
    station0215.nameOriginal = @"Richelieu – Drouot";
    station0215.mapLocation = CGPointMake(2127, 1922);
    station0215.geoLocation = CGPointMake(48.871987, 2.338741);
    
    MWDrawFillCircle *fillCircle0261 = [[MWDrawFillCircle alloc] init];
    fillCircle0261.center = station0215.mapLocation;
    fillCircle0261.radius = 3;
    fillCircle0261.fillColor = [UIColor whiteColor];
    [station0215.drawPrimitives addObject:fillCircle0261];

    MWDrawTextLine *drawTextLine0290 = [[MWDrawTextLine alloc] init];
    drawTextLine0290.text = @"Richelieu";
    drawTextLine0290.fontName = @"HelveticaNeue";
    drawTextLine0290.fontColor = [UIColor blackColor];
    drawTextLine0290.fontSize = 34;
    drawTextLine0290.kernSpacing = -0.0;
    drawTextLine0290.origin = CGPointMake(2116, 1811);
    [station0215.nameOriginalTextPrimitives addObject:drawTextLine0290];

    MWDrawTextLine *drawTextLine0291 = [[MWDrawTextLine alloc] init];
    drawTextLine0291.text = @"Drouot";
    drawTextLine0291.fontName = @"HelveticaNeue";
    drawTextLine0291.fontColor = [UIColor blackColor];
    drawTextLine0291.fontSize = 34;
    drawTextLine0291.kernSpacing = -0.0;
    drawTextLine0291.origin = CGPointMake(2116, 1844);
    [station0215.nameOriginalTextPrimitives addObject:drawTextLine0291];

    // Добавляем вершину
    edge0088.finishVertex = vertex0065;

    // Создаем участок линии Richelieu – Drouot - Grands Boulevards
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0089 = [[MWEdge alloc] init];
    edge0089.identifier = @"edge0089";
    edge0089.developmentName = @"Ребро: Richelieu – Drouot - Grands Boulevards";
    [self.edges addObject:edge0089];
    
    // Добавляем линию
    edge0089.line = line0010;
    
    // Добавляем вершину
    edge0089.startVertex = vertex0065;

    // Добавляем станцию Richelieu – Drouot
    [edge0089.elements addObject:station0215];

    // Добавляем перегон
    MWHaul *haul0207 = [[MWHaul alloc] init];
    haul0207.identifier = @"haul0207";
    haul0207.length = 353;
    [edge0089.elements addObject:haul0207];
    
    MWDrawLine *drawLine0307 = [[MWDrawLine alloc] init];
    drawLine0307.startPoint = CGPointMake(2126.5, 1922);
    drawLine0307.endPoint = CGPointMake(2288, 1922);
    drawLine0307.width = 11;
    drawLine0307.color = line0010.color;
    [haul0207.drawPrimitives addObject:drawLine0307];

    // Добавляем станцию Grands Boulevards
    MWStation *station0216 = [[MWStation alloc] init];
    station0216.identifier = @"station0216";
    [edge0089.elements addObject:station0216];
    
    station0216.nameOriginal = @"Grands Boulevards";
    station0216.mapLocation = CGPointMake(2288, 1922);
    station0216.geoLocation = CGPointMake(48.871426, 2.344342);
    
    MWDrawFillCircle *fillCircle0262 = [[MWDrawFillCircle alloc] init];
    fillCircle0262.center = station0216.mapLocation;
    fillCircle0262.radius = 12;
    fillCircle0262.fillColor = line0010.color;
    [station0216.drawPrimitives addObject:fillCircle0262];

    MWDrawTextLine *drawTextLine0292 = [[MWDrawTextLine alloc] init];
    drawTextLine0292.text = @"Grands";
    drawTextLine0292.fontName = @"HelveticaNeue";
    drawTextLine0292.fontColor = [UIColor blackColor];
    drawTextLine0292.fontSize = 34;
    drawTextLine0292.kernSpacing = -1.0;
    drawTextLine0292.origin = CGPointMake(2236, 1934);
    [station0216.nameOriginalTextPrimitives addObject:drawTextLine0292];

    MWDrawTextLine *drawTextLine0293 = [[MWDrawTextLine alloc] init];
    drawTextLine0293.text = @"Boulevards";
    drawTextLine0293.fontName = @"HelveticaNeue";
    drawTextLine0293.fontColor = [UIColor blackColor];
    drawTextLine0293.fontSize = 34;
    drawTextLine0293.kernSpacing = -1.0;
    drawTextLine0293.origin = CGPointMake(2207, 1967);
    [station0216.nameOriginalTextPrimitives addObject:drawTextLine0293];

    // Добавляем вершину
    edge0089.finishVertex = vertex0066;

    // Создаем участок линии Grands Boulevards - Bonne Nouvelle
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0090 = [[MWEdge alloc] init];
    edge0090.identifier = @"edge0090";
    edge0090.developmentName = @"Ребро: Grands Boulevards - Bonne Nouvelle";
    [self.edges addObject:edge0090];
    
    // Добавляем линию
    edge0090.line = line0010;
    
    // Добавляем вершину
    edge0090.startVertex = vertex0066;

    // Добавляем станцию Grands Boulevards
    [edge0090.elements addObject:station0216];

    // Добавляем перегон
    MWHaul *haul0208 = [[MWHaul alloc] init];
    haul0208.identifier = @"haul0208";
    haul0208.length = 323;
    [edge0090.elements addObject:haul0208];
    
    MWDrawLine *drawLine0308 = [[MWDrawLine alloc] init];
    drawLine0308.startPoint = CGPointMake(2287.5, 1922);
    drawLine0308.endPoint = CGPointMake(2505, 1922);
    drawLine0308.width = 11;
    drawLine0308.color = line0010.color;
    [haul0208.drawPrimitives addObject:drawLine0308];

    // Добавляем станцию Bonne Nouvelle
    MWStation *station0217 = [[MWStation alloc] init];
    station0217.identifier = @"station0217";
    [edge0090.elements addObject:station0217];
    
    station0217.nameOriginal = @"Bonne Nouvelle";
    station0217.mapLocation = CGPointMake(2505, 1922);
    station0217.geoLocation = CGPointMake(48.870639, 2.348875);
    
    MWDrawFillCircle *fillCircle0263 = [[MWDrawFillCircle alloc] init];
    fillCircle0263.center = station0217.mapLocation;
    fillCircle0263.radius = 12;
    fillCircle0263.fillColor = line0010.color;
    [station0217.drawPrimitives addObject:fillCircle0263];

    MWDrawTextLine *drawTextLine0294 = [[MWDrawTextLine alloc] init];
    drawTextLine0294.text = @"Bonne";
    drawTextLine0294.fontName = @"HelveticaNeue";
    drawTextLine0294.fontColor = [UIColor blackColor];
    drawTextLine0294.fontSize = 34;
    drawTextLine0294.kernSpacing = -0.6;
    drawTextLine0294.origin = CGPointMake(2457, 1934);
    [station0217.nameOriginalTextPrimitives addObject:drawTextLine0294];

    MWDrawTextLine *drawTextLine0295 = [[MWDrawTextLine alloc] init];
    drawTextLine0295.text = @"Nouvelle";
    drawTextLine0295.fontName = @"HelveticaNeue";
    drawTextLine0295.fontColor = [UIColor blackColor];
    drawTextLine0295.fontSize = 34;
    drawTextLine0295.kernSpacing = -0.2;
    drawTextLine0295.origin = CGPointMake(2440, 1967);
    [station0217.nameOriginalTextPrimitives addObject:drawTextLine0295];

    // Добавляем вершину
    edge0090.finishVertex = vertex0067;

    // Создаем участок линии Bonne Nouvelle - Strasbourg – Saint-Denis
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0091 = [[MWEdge alloc] init];
    edge0091.identifier = @"edge0091";
    edge0091.developmentName = @"Ребро: Bonne Nouvelle - Strasbourg – Saint-Denis";
    [self.edges addObject:edge0091];
    
    // Добавляем линию
    edge0091.line = line0010;
    
    // Добавляем вершину
    edge0091.startVertex = vertex0067;

    // Добавляем станцию Bonne Nouvelle
    [edge0091.elements addObject:station0217];

    // Добавляем перегон
    MWHaul *haul0209 = [[MWHaul alloc] init];
    haul0209.identifier = @"haul0209";
    haul0209.length = 427;
    [edge0091.elements addObject:haul0209];
    
    MWDrawLine *drawLine0309 = [[MWDrawLine alloc] init];
    drawLine0309.startPoint = CGPointMake(2504.5, 1922);
    drawLine0309.endPoint = CGPointMake(2622, 1922);
    drawLine0309.width = 11;
    drawLine0309.color = line0010.color;
    [haul0209.drawPrimitives addObject:drawLine0309];

    // Добавляем станцию Strasbourg – Saint-Denis
    MWStation *station0218 = [[MWStation alloc] init];
    station0218.identifier = @"station0218";
    [edge0091.elements addObject:station0218];
    
    station0218.nameOriginal = @"Strasbourg – Saint-Denis";
    station0218.mapLocation = CGPointMake(2622, 1922);
    station0218.geoLocation = CGPointMake(48.869722, 2.353889);
    
    MWDrawFillCircle *fillCircle0264 = [[MWDrawFillCircle alloc] init];
    fillCircle0264.center = station0218.mapLocation;
    fillCircle0264.radius = 3;
    fillCircle0264.fillColor = [UIColor whiteColor];
    [station0218.drawPrimitives addObject:fillCircle0264];

    station0218.showNameOnMap = false;
    [station0218.nameOriginalTextPrimitives addObject:drawTextLine0124];
    [station0218.nameOriginalTextPrimitives addObject:drawTextLine0125];

    // Добавляем вершину
    edge0091.finishVertex = vertex0038;
    
    // Создаем участок линии Strasbourg – Saint-Denis - République
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0092 = [[MWEdge alloc] init];
    edge0092.identifier = @"edge0092";
    edge0092.developmentName = @"Ребро: Strasbourg – Saint-Denis - République";
    [self.edges addObject:edge0092];
    
    // Добавляем линию
    edge0092.line = line0010;
    
    // Добавляем вершину
    edge0092.startVertex = vertex0038;

    // Добавляем станцию Strasbourg – Saint-Denis
    [edge0092.elements addObject:station0218];

    // Добавляем перегон
    MWHaul *haul0210 = [[MWHaul alloc] init];
    haul0210.identifier = @"haul0210";
    haul0210.length = 728;
    [edge0092.elements addObject:haul0210];
    
    MWDrawLine *drawLine0310 = [[MWDrawLine alloc] init];
    drawLine0310.startPoint = CGPointMake(2621.5, 1922);
    drawLine0310.endPoint = CGPointMake(2802, 1922);
    drawLine0310.width = 11;
    drawLine0310.color = line0010.color;
    [haul0210.drawPrimitives addObject:drawLine0310];

    MWDrawArc *drawArc0096 = [[MWDrawArc alloc] init];
    drawArc0096.center = CGPointMake(2802, 1952);
    drawArc0096.startDegrees = 270;
    drawArc0096.endDegrees = 315;
    drawArc0096.radius = 30;
    drawArc0096.width = 11;
    drawArc0096.color = line0010.color;
    [haul0210.drawPrimitives addObject:drawArc0096];

    MWDrawLine *drawLine0311 = [[MWDrawLine alloc] init];
    drawLine0311.startPoint = CGPointMake(2822.5, 1930);
    drawLine0311.endPoint = CGPointMake(2896, 2003.5);
    drawLine0311.width = 11;
    drawLine0311.color = line0010.color;
    [haul0210.drawPrimitives addObject:drawLine0311];

    // Добавляем станцию République
    MWStation *station0219 = [[MWStation alloc] init];
    station0219.identifier = @"station0219";
    [edge0092.elements addObject:station0219];
    
    station0219.nameOriginal = @"République";
    station0219.mapLocation = CGPointMake(2896, 2003.5);
    station0219.geoLocation = CGPointMake(48.867503, 2.363811);
    
    MWDrawFillCircle *fillCircle0265 = [[MWDrawFillCircle alloc] init];
    fillCircle0265.center = station0219.mapLocation;
    fillCircle0265.radius = 3;
    fillCircle0265.fillColor = [UIColor whiteColor];
    [station0219.drawPrimitives addObject:fillCircle0265];

    station0219.showNameOnMap = false;
    [station0219.nameOriginalTextPrimitives addObject:drawTextLine0095];
    
    // Добавляем вершину
    edge0092.finishVertex = vertex0030;

    // Создаем участок линии République - Bastille
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0093 = [[MWEdge alloc] init];
    edge0093.identifier = @"edge0093";
    edge0093.developmentName = @"Ребро: République - Bastille";
    [self.edges addObject:edge0093];
    
    // Добавляем линию
    edge0093.line = line0010;
    
    // Добавляем вершину
    edge0093.startVertex = vertex0030;

    // Добавляем станцию République
    [edge0093.elements addObject:station0219];

    // Добавляем перегон
    MWHaul *haul0211 = [[MWHaul alloc] init];
    haul0211.identifier = @"haul0211";
    haul0211.length = 536;
    [edge0093.elements addObject:haul0211];
    
    MWDrawLine *drawLine0312 = [[MWDrawLine alloc] init];
    drawLine0312.startPoint = CGPointMake(2895.5, 2003);
    drawLine0312.endPoint = CGPointMake(2902, 2009.5);
    drawLine0312.width = 11;
    drawLine0312.color = line0010.color;
    [haul0211.drawPrimitives addObject:drawLine0312];

    MWDrawArc *drawArc0097 = [[MWDrawArc alloc] init];
    drawArc0097.center = CGPointMake(2890.5, 2019.5);
    drawArc0097.startDegrees = 315;
    drawArc0097.endDegrees = 45;
    drawArc0097.radius = 15;
    drawArc0097.width = 11;
    drawArc0097.color = line0010.color;
    [haul0211.drawPrimitives addObject:drawArc0097];

    MWDrawLine *drawLine0313 = [[MWDrawLine alloc] init];
    drawLine0313.startPoint = CGPointMake(2901.5, 2029.5);
    drawLine0313.endPoint = CGPointMake(2874.5, 2056.5);
    drawLine0313.width = 11;
    drawLine0313.color = line0010.color;
    [haul0211.drawPrimitives addObject:drawLine0313];

    MWDrawArc *drawArc0098 = [[MWDrawArc alloc] init];
    drawArc0098.center = CGPointMake(2896.5, 2077);
    drawArc0098.startDegrees = 180;
    drawArc0098.endDegrees = 225;
    drawArc0098.radius = 30;
    drawArc0098.width = 11;
    drawArc0098.color = line0010.color;
    [haul0211.drawPrimitives addObject:drawArc0098];

    MWDrawLine *drawLine0314 = [[MWDrawLine alloc] init];
    drawLine0314.startPoint = CGPointMake(2866.5, 2076.5);
    drawLine0314.endPoint = CGPointMake(2866.5, 2178);
    drawLine0314.width = 11;
    drawLine0314.color = line0010.color;
    [haul0211.drawPrimitives addObject:drawLine0314];

    // Добавляем станцию Filles du Calvaire
    MWStation *station0220 = [[MWStation alloc] init];
    station0220.identifier = @"station0220";
    [edge0093.elements addObject:station0220];
    
    station0220.nameOriginal = @"Filles du Calvaire";
    station0220.mapLocation = CGPointMake(2866.5, 2178);
    station0220.geoLocation = CGPointMake(48.864167, 2.366111);

    MWDrawFillCircle *fillCircle0266 = [[MWDrawFillCircle alloc] init];
    fillCircle0266.center = station0220.mapLocation;
    fillCircle0266.radius = 12;
    fillCircle0266.fillColor = line0010.color;
    [station0220.drawPrimitives addObject:fillCircle0266];

    MWDrawTextLine *drawTextLine0296 = [[MWDrawTextLine alloc] init];
    drawTextLine0296.text = @"Filles";
    drawTextLine0296.fontName = @"HelveticaNeue";
    drawTextLine0296.fontColor = [UIColor blackColor];
    drawTextLine0296.fontSize = 34;
    drawTextLine0296.kernSpacing = -0.2;
    drawTextLine0296.origin = CGPointMake(2887, 2123);
    [station0220.nameOriginalTextPrimitives addObject:drawTextLine0296];

    MWDrawTextLine *drawTextLine0297 = [[MWDrawTextLine alloc] init];
    drawTextLine0297.text = @"du Calvaire";
    drawTextLine0297.fontName = @"HelveticaNeue";
    drawTextLine0297.fontColor = [UIColor blackColor];
    drawTextLine0297.fontSize = 34;
    drawTextLine0297.kernSpacing = -0.6;
    drawTextLine0297.origin = CGPointMake(2887, 2156);
    [station0220.nameOriginalTextPrimitives addObject:drawTextLine0297];

    // Добавляем перегон
    MWHaul *haul0212 = [[MWHaul alloc] init];
    haul0212.identifier = @"haul0212";
    haul0212.length = 241;
    [edge0093.elements addObject:haul0212];

    MWDrawLine *drawLine0315 = [[MWDrawLine alloc] init];
    drawLine0315.startPoint = CGPointMake(2866.5, 2177.5);
    drawLine0315.endPoint = CGPointMake(2866.5, 2298);
    drawLine0315.width = 11;
    drawLine0315.color = line0010.color;
    [haul0212.drawPrimitives addObject:drawLine0315];

    // Добавляем станцию Saint-Sébastien – Froissart
    MWStation *station0221 = [[MWStation alloc] init];
    station0221.identifier = @"station0221";
    [edge0093.elements addObject:station0221];
    
    station0221.nameOriginal = @"Saint-Sébastien – Froissart";
    station0221.mapLocation = CGPointMake(2866.5, 2298);
    station0221.geoLocation = CGPointMake(48.86048, 2.367358);

    MWDrawFillCircle *fillCircle0267 = [[MWDrawFillCircle alloc] init];
    fillCircle0267.center = station0221.mapLocation;
    fillCircle0267.radius = 12;
    fillCircle0267.fillColor = line0010.color;
    [station0221.drawPrimitives addObject:fillCircle0267];

    MWDrawTextLine *drawTextLine0298 = [[MWDrawTextLine alloc] init];
    drawTextLine0298.text = @"St-Sébastien";
    drawTextLine0298.fontName = @"HelveticaNeue";
    drawTextLine0298.fontColor = [UIColor blackColor];
    drawTextLine0298.fontSize = 34;
    drawTextLine0298.kernSpacing = -1.6;
    drawTextLine0298.origin = CGPointMake(2887, 2242);
    [station0221.nameOriginalTextPrimitives addObject:drawTextLine0298];

    MWDrawTextLine *drawTextLine0299 = [[MWDrawTextLine alloc] init];
    drawTextLine0299.text = @"Froissart";
    drawTextLine0299.fontName = @"HelveticaNeue";
    drawTextLine0299.fontColor = [UIColor blackColor];
    drawTextLine0299.fontSize = 34;
    drawTextLine0299.kernSpacing = -0.4;
    drawTextLine0299.origin = CGPointMake(2887, 2276);
    [station0221.nameOriginalTextPrimitives addObject:drawTextLine0299];

    // Добавляем перегон
    MWHaul *haul0213 = [[MWHaul alloc] init];
    haul0213.identifier = @"haul0213";
    haul0213.length = 377;
    [edge0093.elements addObject:haul0213];
    
    MWDrawLine *drawLine0316 = [[MWDrawLine alloc] init];
    drawLine0316.startPoint = CGPointMake(2866.5, 2297.5);
    drawLine0316.endPoint = CGPointMake(2866.5, 2414.5);
    drawLine0316.width = 11;
    drawLine0316.color = line0010.color;
    [haul0213.drawPrimitives addObject:drawLine0316];

    // Добавляем станцию Chemin Vert
    MWStation *station0222 = [[MWStation alloc] init];
    station0222.identifier = @"station0222";
    [edge0093.elements addObject:station0222];
    
    station0222.nameOriginal = @"Chemin Vert";
    station0222.mapLocation = CGPointMake(2866.5, 2414.5);
    station0222.geoLocation = CGPointMake(48.856778, 2.368348);

    MWDrawFillCircle *fillCircle0268 = [[MWDrawFillCircle alloc] init];
    fillCircle0268.center = station0222.mapLocation;
    fillCircle0268.radius = 12;
    fillCircle0268.fillColor = line0010.color;
    [station0222.drawPrimitives addObject:fillCircle0268];

    MWDrawTextLine *drawTextLine0300 = [[MWDrawTextLine alloc] init];
    drawTextLine0300.text = station0222.nameOriginal;
    drawTextLine0300.fontName = @"HelveticaNeue";
    drawTextLine0300.fontColor = [UIColor blackColor];
    drawTextLine0300.fontSize = 34;
    drawTextLine0300.kernSpacing = 0.2;
    drawTextLine0300.origin = CGPointMake(2659, 2393);
    [station0222.nameOriginalTextPrimitives addObject:drawTextLine0300];

    // Добавляем перегон
    MWHaul *haul0214 = [[MWHaul alloc] init];
    haul0214.identifier = @"haul0214";
    haul0214.length = 447;
    [edge0093.elements addObject:haul0214];

    MWDrawLine *drawLine0317 = [[MWDrawLine alloc] init];
    drawLine0317.startPoint = CGPointMake(2866.5, 2414);
    drawLine0317.endPoint = CGPointMake(2866.5, 2503);
    drawLine0317.width = 11;
    drawLine0317.color = line0010.color;
    [haul0214.drawPrimitives addObject:drawLine0317];

    MWDrawArc *drawArc0099 = [[MWDrawArc alloc] init];
    drawArc0099.center = CGPointMake(2896.5, 2502.5);
    drawArc0099.startDegrees = 135;
    drawArc0099.endDegrees = 180;
    drawArc0099.radius = 30;
    drawArc0099.width = 11;
    drawArc0099.color = line0010.color;
    [haul0214.drawPrimitives addObject:drawArc0099];

    MWDrawLine *drawLine0318 = [[MWDrawLine alloc] init];
    drawLine0318.startPoint = CGPointMake(2874.5, 2523);
    drawLine0318.endPoint = CGPointMake(2888.5, 2537);
    drawLine0318.width = 11;
    drawLine0318.color = line0010.color;
    [haul0214.drawPrimitives addObject:drawLine0318];

    // Добавляем станцию Bastille
    MWStation *station0223 = [[MWStation alloc] init];
    station0223.identifier = @"station0223";
    [edge0093.elements addObject:station0223];
    
    station0223.nameOriginal = @"Bastille";
    station0223.mapLocation = CGPointMake(2888.5, 2537);
    station0223.geoLocation = CGPointMake(48.853082, 2.369077);

    MWDrawFillCircle *fillCircle0269 = [[MWDrawFillCircle alloc] init];
    fillCircle0269.center = station0223.mapLocation;
    fillCircle0269.radius = 3;
    fillCircle0269.fillColor = [UIColor whiteColor];
    [station0223.drawPrimitives addObject:fillCircle0269];

    station0223.showNameOnMap = false;
    [station0223.nameOriginalTextPrimitives addObject:drawTextLine0029];
    
    // Добавляем вершину
    edge0093.finishVertex = vertex0009;
    
    // Создаем участок линии Bastille - Reuilly – Diderot
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0094 = [[MWEdge alloc] init];
    edge0094.identifier = @"edge0094";
    edge0094.developmentName = @"Ребро: Bastille - Reuilly – Diderot";
    [self.edges addObject:edge0094];
    
    // Добавляем линию
    edge0094.line = line0010;
    
    // Добавляем вершину
    edge0094.startVertex = vertex0009;

    // Добавляем станцию Bastille
    [edge0094.elements addObject:station0223];

    // Добавляем перегон
    MWHaul *haul0215 = [[MWHaul alloc] init];
    haul0215.identifier = @"haul0215";
    haul0215.length = 570;
    [edge0094.elements addObject:haul0215];

    MWDrawLine *drawLine0319 = [[MWDrawLine alloc] init];
    drawLine0319.startPoint = CGPointMake(2888, 2536.5);
    drawLine0319.endPoint = CGPointMake(2991.5, 2637);
    drawLine0319.width = 11;
    drawLine0319.color = line0010.color;
    [haul0215.drawPrimitives addObject:drawLine0319];

    // Добавляем станцию Ledru-Rollin
    MWStation *station0224 = [[MWStation alloc] init];
    station0224.identifier = @"station0224";
    [edge0094.elements addObject:station0224];
    
    station0224.nameOriginal = @"Ledru-Rollin";
    station0224.mapLocation = CGPointMake(2991.5, 2637);
    station0224.geoLocation = CGPointMake(48.851529, 2.37516);

    MWDrawFillCircle *fillCircle0270 = [[MWDrawFillCircle alloc] init];
    fillCircle0270.center = station0224.mapLocation;
    fillCircle0270.radius = 12;
    fillCircle0270.fillColor = line0010.color;
    [station0224.drawPrimitives addObject:fillCircle0270];

    MWDrawTextLine *drawTextLine0301 = [[MWDrawTextLine alloc] init];
    drawTextLine0301.text = station0224.nameOriginal;
    drawTextLine0301.fontName = @"HelveticaNeue";
    drawTextLine0301.fontColor = [UIColor blackColor];
    drawTextLine0301.fontSize = 34;
    drawTextLine0301.kernSpacing = -0.4;
    drawTextLine0301.origin = CGPointMake(3002, 2590);
    [station0224.nameOriginalTextPrimitives addObject:drawTextLine0301];

    // Добавляем перегон
    MWHaul *haul0216 = [[MWHaul alloc] init];
    haul0216.identifier = @"haul0216";
    haul0216.length = 553;
    [edge0094.elements addObject:haul0216];

    MWDrawLine *drawLine0320 = [[MWDrawLine alloc] init];
    drawLine0320.startPoint = CGPointMake(2991, 2636.5);
    drawLine0320.endPoint = CGPointMake(3022, 2667.5);
    drawLine0320.width = 11;
    drawLine0320.color = line0010.color;
    [haul0216.drawPrimitives addObject:drawLine0320];

    MWDrawArc *drawArc0100 = [[MWDrawArc alloc] init];
    drawArc0100.center = CGPointMake(3043, 2646);
    drawArc0100.startDegrees = 90;
    drawArc0100.endDegrees = 135;
    drawArc0100.radius = 30;
    drawArc0100.width = 11;
    drawArc0100.color = line0010.color;
    [haul0216.drawPrimitives addObject:drawArc0100];

    MWDrawLine *drawLine0321 = [[MWDrawLine alloc] init];
    drawLine0321.startPoint = CGPointMake(3043, 2676);
    drawLine0321.endPoint = CGPointMake(3135, 2676);
    drawLine0321.width = 11;
    drawLine0321.color = line0010.color;
    [haul0216.drawPrimitives addObject:drawLine0321];

    MWDrawArc *drawArc0101 = [[MWDrawArc alloc] init];
    drawArc0101.center = CGPointMake(3135, 2706);
    drawArc0101.startDegrees = 270;
    drawArc0101.endDegrees = 315;
    drawArc0101.radius = 30;
    drawArc0101.width = 11;
    drawArc0101.color = line0010.color;
    [haul0216.drawPrimitives addObject:drawArc0101];

    MWDrawLine *drawLine0322 = [[MWDrawLine alloc] init];
    drawLine0322.startPoint = CGPointMake(3155.5, 2684);
    drawLine0322.endPoint = CGPointMake(3186.5, 2715);
    drawLine0322.width = 11;
    drawLine0322.color = line0010.color;
    [haul0216.drawPrimitives addObject:drawLine0322];

    // Добавляем станцию Faidherbe – Chaligny
    MWStation *station0225 = [[MWStation alloc] init];
    station0225.identifier = @"station0225";
    [edge0094.elements addObject:station0225];
    
    station0225.nameOriginal = @"Faidherbe – Chaligny";
    station0225.mapLocation = CGPointMake(3186.5, 2715);
    station0225.geoLocation = CGPointMake(48.850158, 2.383398);

    MWDrawFillCircle *fillCircle0271 = [[MWDrawFillCircle alloc] init];
    fillCircle0271.center = station0225.mapLocation;
    fillCircle0271.radius = 12;
    fillCircle0271.fillColor = line0010.color;
    [station0225.drawPrimitives addObject:fillCircle0271];

    MWDrawTextLine *drawTextLine0302 = [[MWDrawTextLine alloc] init];
    drawTextLine0302.text = @"Faidherbe";
    drawTextLine0302.fontName = @"HelveticaNeue";
    drawTextLine0302.fontColor = [UIColor blackColor];
    drawTextLine0302.fontSize = 34;
    drawTextLine0302.kernSpacing = -0.2;
    drawTextLine0302.origin = CGPointMake(3196, 2635);
    [station0225.nameOriginalTextPrimitives addObject:drawTextLine0302];

    MWDrawTextLine *drawTextLine0303 = [[MWDrawTextLine alloc] init];
    drawTextLine0303.text = @"Chaligny";
    drawTextLine0303.fontName = @"HelveticaNeue";
    drawTextLine0303.fontColor = [UIColor blackColor];
    drawTextLine0303.fontSize = 34;
    drawTextLine0303.kernSpacing = -0.2;
    drawTextLine0303.origin = CGPointMake(3196, 2668);
    [station0225.nameOriginalTextPrimitives addObject:drawTextLine0303];

    // Добавляем перегон
    MWHaul *haul0217 = [[MWHaul alloc] init];
    haul0217.identifier = @"haul0217";
    haul0217.length = 427;
    [edge0094.elements addObject:haul0217];

    MWDrawLine *drawLine0323 = [[MWDrawLine alloc] init];
    drawLine0323.startPoint = CGPointMake(3186, 2714.5);
    drawLine0323.endPoint = CGPointMake(3284, 2812);
    drawLine0323.width = 11;
    drawLine0323.color = line0010.color;
    [haul0217.drawPrimitives addObject:drawLine0323];

    // Добавляем станцию Reuilly – Diderot
    MWStation *station0226 = [[MWStation alloc] init];
    station0226.identifier = @"station0226";
    [edge0094.elements addObject:station0226];
    
    station0226.nameOriginal = @"Reuilly – Diderot";
    station0226.mapLocation = CGPointMake(3284, 2812);
    station0226.geoLocation = CGPointMake(48.846944, 2.386389);

    MWDrawFillCircle *fillCircle0272 = [[MWDrawFillCircle alloc] init];
    fillCircle0272.center = station0226.mapLocation;
    fillCircle0272.radius = 3;
    fillCircle0272.fillColor = [UIColor whiteColor];
    [station0226.drawPrimitives addObject:fillCircle0272];

    station0226.showNameOnMap = false;
    [station0226.nameOriginalTextPrimitives addObject:drawTextLine0032];
    
    // Добавляем вершину
    edge0094.finishVertex = vertex0011;

    // Создаем участок линии Reuilly – Diderot - Daumesnil
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0095 = [[MWEdge alloc] init];
    edge0095.identifier = @"edge0095";
    edge0095.developmentName = @"Ребро: Reuilly – Diderot - Daumesnil";
    [self.edges addObject:edge0095];
    
    // Добавляем линию
    edge0095.line = line0010;
    
    // Добавляем вершину
    edge0095.startVertex = vertex0011;

    // Добавляем станцию Reuilly – Diderot
    [edge0095.elements addObject:station0226];

    // Добавляем перегон
    MWHaul *haul0218 = [[MWHaul alloc] init];
    haul0218.identifier = @"haul0218";
    haul0218.length = 440;
    [edge0095.elements addObject:haul0218];

    MWDrawLine *drawLine0324 = [[MWDrawLine alloc] init];
    drawLine0324.startPoint = CGPointMake(3283.5, 2811.5);
    drawLine0324.endPoint = CGPointMake(3389.5, 2917.5);
    drawLine0324.width = 11;
    drawLine0324.color = line0010.color;
    [haul0218.drawPrimitives addObject:drawLine0324];

    // Добавляем станцию Montgallet
    MWStation *station0227 = [[MWStation alloc] init];
    station0227.identifier = @"station0227";
    [edge0095.elements addObject:station0227];
    
    station0227.nameOriginal = @"Montgallet";
    station0227.mapLocation = CGPointMake(3389.5, 2917.5);
    station0227.geoLocation = CGPointMake(48.844276, 2.389974);

    MWDrawFillCircle *fillCircle0273 = [[MWDrawFillCircle alloc] init];
    fillCircle0273.center = station0227.mapLocation;
    fillCircle0273.radius = 12;
    fillCircle0273.fillColor = line0010.color;
    [station0227.drawPrimitives addObject:fillCircle0273];

    MWDrawTextLine *drawTextLine0304 = [[MWDrawTextLine alloc] init];
    drawTextLine0304.text = station0227.nameOriginal;
    drawTextLine0304.fontName = @"HelveticaNeue";
    drawTextLine0304.fontColor = [UIColor blackColor];
    drawTextLine0304.fontSize = 34;
    drawTextLine0304.kernSpacing = 0.0;
    drawTextLine0304.origin = CGPointMake(3401, 2871);
    [station0227.nameOriginalTextPrimitives addObject:drawTextLine0304];

    // Добавляем перегон
    MWHaul *haul0219 = [[MWHaul alloc] init];
    haul0219.identifier = @"haul0219";
    haul0219.length = 640;
    [edge0095.elements addObject:haul0219];

    MWDrawLine *drawLine0325 = [[MWDrawLine alloc] init];
    drawLine0325.startPoint = CGPointMake(3389, 2917);
    drawLine0325.endPoint = CGPointMake(3498, 3026.5);
    drawLine0325.width = 11;
    drawLine0325.color = line0010.color;
    [haul0219.drawPrimitives addObject:drawLine0325];

    // Добавляем станцию Daumesnil
    MWStation *station0228 = [[MWStation alloc] init];
    station0228.identifier = @"station0228";
    [edge0095.elements addObject:station0228];
    
    station0228.nameOriginal = @"Daumesnil";
    station0228.mapLocation = CGPointMake(3498, 3026.5);
    station0228.geoLocation = CGPointMake(48.839644, 2.395792);

    MWDrawFillCircle *fillCircle0274 = [[MWDrawFillCircle alloc] init];
    fillCircle0274.center = station0228.mapLocation;
    fillCircle0274.radius = 3;
    fillCircle0274.fillColor = [UIColor whiteColor];
    [station0228.drawPrimitives addObject:fillCircle0274];

    station0228.showNameOnMap = false;
    [station0228.nameOriginalTextPrimitives addObject:drawTextLine0205];
    
    // Добавляем вершину
    edge0095.finishVertex = vertex0052;

    // Создаем участок линии Daumesnil - Créteil – Pointe du Lac
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0096 = [[MWEdge alloc] init];
    edge0096.identifier = @"edge0096";
    edge0096.developmentName = @"Ребро: Daumesnil - Créteil – Pointe du Lac";
    [self.edges addObject:edge0096];
    
    // Добавляем линию
    edge0096.line = line0010;
    
    // Добавляем вершину
    edge0096.startVertex = vertex0052;

    // Добавляем станцию Daumesnil
    [edge0096.elements addObject:station0228];

    // Добавляем перегон
    MWHaul *haul0220 = [[MWHaul alloc] init];
    haul0220.identifier = @"haul0220";
    haul0220.length = 563;
    [edge0096.elements addObject:haul0220];

    MWDrawLine *drawLine0326 = [[MWDrawLine alloc] init];
    drawLine0326.startPoint = CGPointMake(3497.5, 3026);
    drawLine0326.endPoint = CGPointMake(3567.5, 3096);
    drawLine0326.width = 11;
    drawLine0326.color = line0010.color;
    [haul0220.drawPrimitives addObject:drawLine0326];

    // Добавляем станцию Michel Bizot
    MWStation *station0229 = [[MWStation alloc] init];
    station0229.identifier = @"station0229";
    [edge0096.elements addObject:station0229];
    
    station0229.nameOriginal = @"Michel Bizot";
    station0229.mapLocation = CGPointMake(3567.5, 3096);
    station0229.geoLocation = CGPointMake(48.837485, 2.401234);

    MWDrawFillCircle *fillCircle0275 = [[MWDrawFillCircle alloc] init];
    fillCircle0275.center = station0229.mapLocation;
    fillCircle0275.radius = 12;
    fillCircle0275.fillColor = line0010.color;
    [station0229.drawPrimitives addObject:fillCircle0275];

    MWDrawTextLine *drawTextLine0305 = [[MWDrawTextLine alloc] init];
    drawTextLine0305.text = @"Michel";
    drawTextLine0305.fontName = @"HelveticaNeue";
    drawTextLine0305.fontColor = [UIColor blackColor];
    drawTextLine0305.fontSize = 34;
    drawTextLine0305.kernSpacing = 0.4;
    drawTextLine0305.origin = CGPointMake(3573, 3013);
    [station0229.nameOriginalTextPrimitives addObject:drawTextLine0305];

    MWDrawTextLine *drawTextLine0306 = [[MWDrawTextLine alloc] init];
    drawTextLine0306.text = @"Bizot";
    drawTextLine0306.fontName = @"HelveticaNeue";
    drawTextLine0306.fontColor = [UIColor blackColor];
    drawTextLine0306.fontSize = 34;
    drawTextLine0306.kernSpacing = -0.4;
    drawTextLine0306.origin = CGPointMake(3573, 3047);
    [station0229.nameOriginalTextPrimitives addObject:drawTextLine0306];

    // Добавляем перегон
    MWHaul *haul0221 = [[MWHaul alloc] init];
    haul0221.identifier = @"haul0221";
    haul0221.length = 449;
    [edge0096.elements addObject:haul0221];
    
    MWDrawLine *drawLine0327 = [[MWDrawLine alloc] init];
    drawLine0327.startPoint = CGPointMake(3567, 3095.5);
    drawLine0327.endPoint = CGPointMake(3642.5, 3171);
    drawLine0327.width = 11;
    drawLine0327.color = line0010.color;
    [haul0221.drawPrimitives addObject:drawLine0327];

    MWDrawArc *drawArc0102 = [[MWDrawArc alloc] init];
    drawArc0102.center = CGPointMake(3631, 3181);
    drawArc0102.startDegrees = 315;
    drawArc0102.endDegrees = 45;
    drawArc0102.radius = 15;
    drawArc0102.width = 11;
    drawArc0102.color = line0010.color;
    [haul0221.drawPrimitives addObject:drawArc0102];

    MWDrawLine *drawLine0328 = [[MWDrawLine alloc] init];
    drawLine0328.startPoint = CGPointMake(3642.5, 3191);
    drawLine0328.endPoint = CGPointMake(3635.5, 3198);
    drawLine0328.width = 11;
    drawLine0328.color = line0010.color;
    [haul0221.drawPrimitives addObject:drawLine0328];

    // Добавляем станцию Porte Dorée
    MWStation *station0230 = [[MWStation alloc] init];
    station0230.identifier = @"station0230";
    [edge0096.elements addObject:station0230];
    
    station0230.nameOriginal = @"Porte Dorée";
    station0230.mapLocation = CGPointMake(3635.5, 3198);
    station0230.geoLocation = CGPointMake(48.835481, 2.4061);

    MWDrawFillCircle *fillCircle0276 = [[MWDrawFillCircle alloc] init];
    fillCircle0276.center = station0230.mapLocation;
    fillCircle0276.radius = 13;
    fillCircle0276.fillColor = [UIColor blackColor];
    [station0230.drawPrimitives addObject:fillCircle0276];
    
    MWDrawFillCircle *fillCircle0277 = [[MWDrawFillCircle alloc] init];
    fillCircle0277.center = station0230.mapLocation;
    fillCircle0277.radius = 11;
    fillCircle0277.fillColor = [UIColor whiteColor];
    [station0230.drawPrimitives addObject:fillCircle0277];

    MWDrawTextLine *drawTextLine0307 = [[MWDrawTextLine alloc] init];
    drawTextLine0307.text = station0230.nameOriginal;
    drawTextLine0307.fontName = @"HelveticaNeue";
    drawTextLine0307.fontColor = [UIColor blackColor];
    drawTextLine0307.fontSize = 34;
    drawTextLine0307.kernSpacing = -0.2;
    drawTextLine0307.origin = CGPointMake(3659, 3178);
    [station0230.nameOriginalTextPrimitives addObject:drawTextLine0307];

    // Добавляем перегон
    MWHaul *haul0222 = [[MWHaul alloc] init];
    haul0222.identifier = @"haul0222";
    haul0222.length = 441;
    [edge0096.elements addObject:haul0222];
    
    MWDrawLine *drawLine0329 = [[MWDrawLine alloc] init];
    drawLine0329.startPoint = CGPointMake(3636, 3197.5);
    drawLine0329.endPoint = CGPointMake(3542, 3290.5);
    drawLine0329.width = 11;
    drawLine0329.color = line0010.color;
    [haul0222.drawPrimitives addObject:drawLine0329];

    // Добавляем станцию Porte de Charenton
    MWStation *station0231 = [[MWStation alloc] init];
    station0231.identifier = @"station0231";
    [edge0096.elements addObject:station0231];
    
    station0231.nameOriginal = @"Porte de Charenton";
    station0231.mapLocation = CGPointMake(3542, 3290.5);
    station0231.geoLocation = CGPointMake(48.83278, 2.4004);

    MWDrawFillCircle *fillCircle0278 = [[MWDrawFillCircle alloc] init];
    fillCircle0278.center = station0231.mapLocation;
    fillCircle0278.radius = 13;
    fillCircle0278.fillColor = [UIColor blackColor];
    [station0231.drawPrimitives addObject:fillCircle0278];
    
    MWDrawFillCircle *fillCircle0279 = [[MWDrawFillCircle alloc] init];
    fillCircle0279.center = station0231.mapLocation;
    fillCircle0279.radius = 11;
    fillCircle0279.fillColor = [UIColor whiteColor];
    [station0231.drawPrimitives addObject:fillCircle0279];

    MWDrawTextLine *drawTextLine0308 = [[MWDrawTextLine alloc] init];
    drawTextLine0308.text = station0231.nameOriginal;
    drawTextLine0308.fontName = @"HelveticaNeue";
    drawTextLine0308.fontColor = [UIColor blackColor];
    drawTextLine0308.fontSize = 34;
    drawTextLine0308.kernSpacing = -0.2;
    drawTextLine0308.origin = CGPointMake(3565, 3274);
    [station0231.nameOriginalTextPrimitives addObject:drawTextLine0308];

    // Добавляем перегон
    MWHaul *haul0223 = [[MWHaul alloc] init];
    haul0223.identifier = @"haul0223";
    haul0223.length = 967;
    [edge0096.elements addObject:haul0223];

    MWDrawLine *drawLine0330 = [[MWDrawLine alloc] init];
    drawLine0330.startPoint = CGPointMake(3542.5, 3290);
    drawLine0330.endPoint = CGPointMake(3530.5, 3303);
    drawLine0330.width = 11;
    drawLine0330.color = line0010.color;
    [haul0223.drawPrimitives addObject:drawLine0330];

    MWDrawArc *drawArc0103 = [[MWDrawArc alloc] init];
    drawArc0103.center = CGPointMake(3541.5, 3313);
    drawArc0103.startDegrees = 135;
    drawArc0103.endDegrees = 225;
    drawArc0103.radius = 15;
    drawArc0103.width = 11;
    drawArc0103.color = line0010.color;
    [haul0223.drawPrimitives addObject:drawArc0103];

    MWDrawLine *drawLine0331 = [[MWDrawLine alloc] init];
    drawLine0331.startPoint = CGPointMake(3530, 3323);
    drawLine0331.endPoint = CGPointMake(3611.5, 3404.5);
    drawLine0331.width = 11;
    drawLine0331.color = line0010.color;
    [haul0223.drawPrimitives addObject:drawLine0331];

    // Добавляем станцию Liberté
    MWStation *station0232 = [[MWStation alloc] init];
    station0232.identifier = @"station0232";
    [edge0096.elements addObject:station0232];
    
    station0232.nameOriginal = @"Liberté";
    station0232.mapLocation = CGPointMake(3611.5, 3404.5);
    station0232.geoLocation = CGPointMake(48.825882, 2.407022);

    MWDrawFillCircle *fillCircle0280 = [[MWDrawFillCircle alloc] init];
    fillCircle0280.center = station0232.mapLocation;
    fillCircle0280.radius = 12;
    fillCircle0280.fillColor = line0010.color;
    [station0232.drawPrimitives addObject:fillCircle0280];

    MWDrawTextLine *drawTextLine0309 = [[MWDrawTextLine alloc] init];
    drawTextLine0309.text = station0232.nameOriginal;
    drawTextLine0309.fontName = @"HelveticaNeue";
    drawTextLine0309.fontColor = [UIColor blackColor];
    drawTextLine0309.fontSize = 34;
    drawTextLine0309.kernSpacing = 0.2;
    drawTextLine0309.origin = CGPointMake(3622, 3358);
    [station0232.nameOriginalTextPrimitives addObject:drawTextLine0309];

    // Добавляем перегон
    MWHaul *haul0224 = [[MWHaul alloc] init];
    haul0224.identifier = @"haul0224";
    haul0224.length = 788;
    [edge0096.elements addObject:haul0224];

    MWDrawLine *drawLine0332 = [[MWDrawLine alloc] init];
    drawLine0332.startPoint = CGPointMake(3611, 3404);
    drawLine0332.endPoint = CGPointMake(3711.5, 3505);
    drawLine0332.width = 11;
    drawLine0332.color = line0010.color;
    [haul0224.drawPrimitives addObject:drawLine0332];

    // Добавляем станцию Charenton – Écoles
    MWStation *station0233 = [[MWStation alloc] init];
    station0233.identifier = @"station0233";
    [edge0096.elements addObject:station0233];
    
    station0233.nameOriginal = @"Charenton – Écoles";
    station0233.mapLocation = CGPointMake(3711.5, 3505);
    station0233.geoLocation = CGPointMake(48.82149, 2.41386);
    
    MWDrawFillCircle *fillCircle0281 = [[MWDrawFillCircle alloc] init];
    fillCircle0281.center = station0233.mapLocation;
    fillCircle0281.radius = 12;
    fillCircle0281.fillColor = line0010.color;
    [station0233.drawPrimitives addObject:fillCircle0281];
    
    MWDrawTextLine *drawTextLine0310 = [[MWDrawTextLine alloc] init];
    drawTextLine0310.text = station0233.nameOriginal;
    drawTextLine0310.fontName = @"HelveticaNeue";
    drawTextLine0310.fontColor = [UIColor blackColor];
    drawTextLine0310.fontSize = 34;
    drawTextLine0310.kernSpacing = -1.1;
    drawTextLine0310.origin = CGPointMake(3722, 3458);
    [station0233.nameOriginalTextPrimitives addObject:drawTextLine0310];

    // Добавляем перегон
    MWHaul *haul0225 = [[MWHaul alloc] init];
    haul0225.identifier = @"haul0225";
    haul0225.length = 1026;
    [edge0096.elements addObject:haul0225];
    
    MWDrawLine *drawLine0333 = [[MWDrawLine alloc] init];
    drawLine0333.startPoint = CGPointMake(3711, 3504.5);
    drawLine0333.endPoint = CGPointMake(3812, 3605);
    drawLine0333.width = 11;
    drawLine0333.color = line0010.color;
    [haul0225.drawPrimitives addObject:drawLine0333];

    // Добавляем станцию École Vétérinaire de Maisons-Alfort
    MWStation *station0234 = [[MWStation alloc] init];
    station0234.identifier = @"station0234";
    [edge0096.elements addObject:station0234];
    
    station0234.nameOriginal = @"École Vétérinaire de Maisons-Alfort";
    station0234.mapLocation = CGPointMake(3812, 3605);
    station0234.geoLocation = CGPointMake(48.81519, 2.421882);

    MWDrawFillCircle *fillCircle0282 = [[MWDrawFillCircle alloc] init];
    fillCircle0282.center = station0234.mapLocation;
    fillCircle0282.radius = 12;
    fillCircle0282.fillColor = line0010.color;
    [station0234.drawPrimitives addObject:fillCircle0282];
    
    MWDrawTextLine *drawTextLine0311 = [[MWDrawTextLine alloc] init];
    drawTextLine0311.text = @"École Vétérinaire";
    drawTextLine0311.fontName = @"HelveticaNeue";
    drawTextLine0311.fontColor = [UIColor blackColor];
    drawTextLine0311.fontSize = 34;
    drawTextLine0311.kernSpacing = -0.0;
    drawTextLine0311.origin = CGPointMake(3835, 3586);
    [station0234.nameOriginalTextPrimitives addObject:drawTextLine0311];

    MWDrawTextLine *drawTextLine0312 = [[MWDrawTextLine alloc] init];
    drawTextLine0312.text = @"de Maisons-Alfort";
    drawTextLine0312.fontName = @"HelveticaNeue";
    drawTextLine0312.fontColor = [UIColor blackColor];
    drawTextLine0312.fontSize = 34;
    drawTextLine0312.kernSpacing = -0.4;
    drawTextLine0312.origin = CGPointMake(3863, 3619);
    [station0234.nameOriginalTextPrimitives addObject:drawTextLine0312];

    // Добавляем перегон
    MWHaul *haul0226 = [[MWHaul alloc] init];
    haul0226.identifier = @"haul0226";
    haul0226.length = 1140;
    [edge0096.elements addObject:haul0226];

    MWDrawLine *drawLine0334 = [[MWDrawLine alloc] init];
    drawLine0334.startPoint = CGPointMake(3811.5, 3604.5);
    drawLine0334.endPoint = CGPointMake(3888.5, 3685);
    drawLine0334.width = 11;
    drawLine0334.color = line0010.color;
    [haul0226.drawPrimitives addObject:drawLine0334];

    // Добавляем станцию Maisons-Alfort – Stade
    MWStation *station0235 = [[MWStation alloc] init];
    station0235.identifier = @"station0235";
    [edge0096.elements addObject:station0235];
    
    station0235.nameOriginal = @"Maisons-Alfort – Stade";
    station0235.mapLocation = CGPointMake(3888.5, 3685);
    station0235.geoLocation = CGPointMake(48.808681, 2.436073);

    MWDrawFillCircle *fillCircle0283 = [[MWDrawFillCircle alloc] init];
    fillCircle0283.center = station0235.mapLocation;
    fillCircle0283.radius = 12;
    fillCircle0283.fillColor = line0010.color;
    [station0235.drawPrimitives addObject:fillCircle0283];

    MWDrawTextLine *drawTextLine0313 = [[MWDrawTextLine alloc] init];
    drawTextLine0313.text = station0235.nameOriginal;
    drawTextLine0313.fontName = @"HelveticaNeue";
    drawTextLine0313.fontColor = [UIColor blackColor];
    drawTextLine0313.fontSize = 34;
    drawTextLine0313.kernSpacing = -1.0;
    drawTextLine0313.origin = CGPointMake(3908, 3663);
    [station0235.nameOriginalTextPrimitives addObject:drawTextLine0313];

    // Добавляем перегон
    MWHaul *haul0227 = [[MWHaul alloc] init];
    haul0227.identifier = @"haul0227";
    haul0227.length = 1033;
    [edge0096.elements addObject:haul0227];

    MWDrawLine *drawLine0335 = [[MWDrawLine alloc] init];
    drawLine0335.startPoint = CGPointMake(3888.5, 3684.5);
    drawLine0335.endPoint = CGPointMake(3888.5, 3765.5);
    drawLine0335.width = 11;
    drawLine0335.color = line0010.color;
    [haul0227.drawPrimitives addObject:drawLine0335];

    // Добавляем станцию Maisons-Alfort – Les Juilliottes
    MWStation *station0236 = [[MWStation alloc] init];
    station0236.identifier = @"station0236";
    [edge0096.elements addObject:station0236];
    
    station0236.nameOriginal = @"Maisons-Alfort – Les Juilliottes";
    station0236.mapLocation = CGPointMake(3888.5, 3765.5);
    station0236.geoLocation = CGPointMake(48.802567, 2.446432);
    
    MWDrawFillCircle *fillCircle0284 = [[MWDrawFillCircle alloc] init];
    fillCircle0284.center = station0236.mapLocation;
    fillCircle0284.radius = 12;
    fillCircle0284.fillColor = line0010.color;
    [station0236.drawPrimitives addObject:fillCircle0284];

    MWDrawTextLine *drawTextLine0314 = [[MWDrawTextLine alloc] init];
    drawTextLine0314.text = @"Maisons-Alfort";
    drawTextLine0314.fontName = @"HelveticaNeue";
    drawTextLine0314.fontColor = [UIColor blackColor];
    drawTextLine0314.fontSize = 34;
    drawTextLine0314.kernSpacing = -0.4;
    drawTextLine0314.origin = CGPointMake(3908, 3727);
    [station0236.nameOriginalTextPrimitives addObject:drawTextLine0314];

    MWDrawTextLine *drawTextLine0315 = [[MWDrawTextLine alloc] init];
    drawTextLine0315.text = @"Les Juilliottes";
    drawTextLine0315.fontName = @"HelveticaNeue";
    drawTextLine0315.fontColor = [UIColor blackColor];
    drawTextLine0315.fontSize = 34;
    drawTextLine0315.kernSpacing = -0.4;
    drawTextLine0315.origin = CGPointMake(3908, 3760);
    [station0236.nameOriginalTextPrimitives addObject:drawTextLine0315];

    // Добавляем перегон
    MWHaul *haul0228 = [[MWHaul alloc] init];
    haul0228.identifier = @"haul0228";
    haul0228.length = 892;
    [edge0096.elements addObject:haul0228];

    MWDrawLine *drawLine0336 = [[MWDrawLine alloc] init];
    drawLine0336.startPoint = CGPointMake(3888.5, 3765);
    drawLine0336.endPoint = CGPointMake(3888.5, 3846);
    drawLine0336.width = 11;
    drawLine0336.color = line0010.color;
    [haul0228.drawPrimitives addObject:drawLine0336];

    // Добавляем станцию Créteil – L'Échat
    MWStation *station0237 = [[MWStation alloc] init];
    station0237.identifier = @"station0237";
    [edge0096.elements addObject:station0237];
    
    station0237.nameOriginal = @"Créteil – L'Échat";
    station0237.mapLocation = CGPointMake(3888.5, 3846);
    station0237.geoLocation = CGPointMake(48.795963, 2.449356);
    
    MWDrawFillCircle *fillCircle0285 = [[MWDrawFillCircle alloc] init];
    fillCircle0285.center = station0237.mapLocation;
    fillCircle0285.radius = 12;
    fillCircle0285.fillColor = line0010.color;
    [station0237.drawPrimitives addObject:fillCircle0285];

    MWDrawTextLine *drawTextLine0316 = [[MWDrawTextLine alloc] init];
    drawTextLine0316.text = station0237.nameOriginal;
    drawTextLine0316.fontName = @"HelveticaNeue";
    drawTextLine0316.fontColor = [UIColor blackColor];
    drawTextLine0316.fontSize = 34;
    drawTextLine0316.kernSpacing = -1.4;
    drawTextLine0316.origin = CGPointMake(3908, 3824);
    [station0237.nameOriginalTextPrimitives addObject:drawTextLine0316];

    // Добавляем перегон
    MWHaul *haul0229 = [[MWHaul alloc] init];
    haul0229.identifier = @"haul0229";
    haul0229.length = 796;
    [edge0096.elements addObject:haul0229];

    MWDrawLine *drawLine0337 = [[MWDrawLine alloc] init];
    drawLine0337.startPoint = CGPointMake(3888.5, 3845.5);
    drawLine0337.endPoint = CGPointMake(3888.5, 3923.5);
    drawLine0337.width = 11;
    drawLine0337.color = line0010.color;
    [haul0229.drawPrimitives addObject:drawLine0337];

    // Добавляем станцию Créteil – Université
    MWStation *station0238 = [[MWStation alloc] init];
    station0238.identifier = @"station0238";
    [edge0096.elements addObject:station0238];
    
    station0238.nameOriginal = @"Créteil – Université";
    station0238.mapLocation = CGPointMake(3888.5, 3923.5);
    station0238.geoLocation = CGPointMake(48.789754, 2.450785);

    MWDrawFillCircle *fillCircle0286 = [[MWDrawFillCircle alloc] init];
    fillCircle0286.center = station0238.mapLocation;
    fillCircle0286.radius = 12;
    fillCircle0286.fillColor = line0010.color;
    [station0238.drawPrimitives addObject:fillCircle0286];

    MWDrawTextLine *drawTextLine0317 = [[MWDrawTextLine alloc] init];
    drawTextLine0317.text = station0238.nameOriginal;
    drawTextLine0317.fontName = @"HelveticaNeue";
    drawTextLine0317.fontColor = [UIColor blackColor];
    drawTextLine0317.fontSize = 34;
    drawTextLine0317.kernSpacing = -0.6;
    drawTextLine0317.origin = CGPointMake(3908, 3902);
    [station0238.nameOriginalTextPrimitives addObject:drawTextLine0317];

    // Добавляем перегон
    MWHaul *haul0230 = [[MWHaul alloc] init];
    haul0230.identifier = @"haul0230";
    haul0230.length = 1396;
    [edge0096.elements addObject:haul0230];

    MWDrawLine *drawLine0338 = [[MWDrawLine alloc] init];
    drawLine0338.startPoint = CGPointMake(3888.5, 3923);
    drawLine0338.endPoint = CGPointMake(3888.5, 4001.5);
    drawLine0338.width = 11;
    drawLine0338.color = line0010.color;
    [haul0230.drawPrimitives addObject:drawLine0338];

    // Добавляем станцию Créteil – Préfecture
    MWStation *station0239 = [[MWStation alloc] init];
    station0239.identifier = @"station0239";
    [edge0096.elements addObject:station0239];
    
    station0239.nameOriginal = @"Créteil – Préfecture";
    station0239.mapLocation = CGPointMake(3888.5, 4001.5);
    station0239.geoLocation = CGPointMake(48.779772, 2.459317);

    MWDrawFillCircle *fillCircle0287 = [[MWDrawFillCircle alloc] init];
    fillCircle0287.center = station0239.mapLocation;
    fillCircle0287.radius = 12;
    fillCircle0287.fillColor = line0010.color;
    [station0239.drawPrimitives addObject:fillCircle0287];

    MWDrawTextLine *drawTextLine0318 = [[MWDrawTextLine alloc] init];
    drawTextLine0318.text = station0239.nameOriginal;
    drawTextLine0318.fontName = @"HelveticaNeue";
    drawTextLine0318.fontColor = [UIColor blackColor];
    drawTextLine0318.fontSize = 34;
    drawTextLine0318.kernSpacing = -0.8;
    drawTextLine0318.origin = CGPointMake(3908, 3979);
    [station0239.nameOriginalTextPrimitives addObject:drawTextLine0318];

    // Добавляем перегон
    MWHaul *haul0231 = [[MWHaul alloc] init];
    haul0231.identifier = @"haul0231";
    haul0231.length = 1296;
    [edge0096.elements addObject:haul0231];

    MWDrawLine *drawLine0339 = [[MWDrawLine alloc] init];
    drawLine0339.startPoint = CGPointMake(3888.5, 4001);
    drawLine0339.endPoint = CGPointMake(3888.5, 4079);
    drawLine0339.width = 11;
    drawLine0339.color = line0010.color;
    [haul0231.drawPrimitives addObject:drawLine0339];

    // Добавляем станцию Créteil – Pointe du Lac
    MWStation *station0240 = [[MWStation alloc] init];
    station0240.identifier = @"station0240";
    [edge0096.elements addObject:station0240];
    
    station0240.nameOriginal = @"Créteil – Pointe du Lac";
    station0240.mapLocation = CGPointMake(3888.5, 4079);
    station0240.geoLocation = CGPointMake(48.76889, 2.46472);

    MWDrawFillCircle *fillCircle0288 = [[MWDrawFillCircle alloc] init];
    fillCircle0288.center = station0240.mapLocation;
    fillCircle0288.radius = 12;
    fillCircle0288.fillColor = [UIColor blackColor];
    [station0240.drawPrimitives addObject:fillCircle0288];

    MWDrawTextLine *drawTextLine0319 = [[MWDrawTextLine alloc] init];
    drawTextLine0319.text = @"Créteil";
    drawTextLine0319.fontName = @"Helvetica-BoldOblique";
    drawTextLine0319.fontColor = [UIColor blackColor];
    drawTextLine0319.fontSize = 28;
    drawTextLine0319.kernSpacing = -0.4;
    drawTextLine0319.origin = CGPointMake(3924, 4099);
    [station0240.drawPrimitives addObject:drawTextLine0319];

    MWDrawTextLine *drawTextLine0320 = [[MWDrawTextLine alloc] init];
    drawTextLine0320.text = @"Pointe du Lac";
    drawTextLine0320.fontName = @"Helvetica-Bold";
    drawTextLine0320.fontColor = [UIColor blackColor];
    drawTextLine0320.fontSize = 30;
    drawTextLine0320.kernSpacing = 1.2;
    drawTextLine0320.origin = CGPointMake(3925, 4129);
    [station0240.drawPrimitives addObject:drawTextLine0320];

    MWDrawFillCircle *fillCircle0289 = [[MWDrawFillCircle alloc] init];
    fillCircle0289.center = CGPointMake(3888.5, 4129);
    fillCircle0289.radius = 28;
    fillCircle0289.fillColor = line0010.color;
    [station0240.drawPrimitives addObject:fillCircle0289];

    MWDrawTextLine *drawTextLine0321 = [[MWDrawTextLine alloc] init];
    drawTextLine0321.text = @"8";
    drawTextLine0321.fontName = @"HelveticaNeue-Bold";
    drawTextLine0321.fontColor = [UIColor blackColor];
    drawTextLine0321.fontSize = 44;
    drawTextLine0321.origin = CGPointMake(3877, 4101);
    [station0240.drawPrimitives addObject:drawTextLine0321];

    // Добавляем вершину
    edge0096.finishVertex = vertex0068;
    
    ////////////////////////////////////////////////////////////////
    // Line 9
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Pont de Sèvres - Michel-Ange - Molitor
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0097 = [[MWEdge alloc] init];
    edge0097.identifier = @"edge0097";
    edge0097.developmentName = @"Ребро: Pont de Sèvres - Michel-Ange - Molitor";
    [self.edges addObject:edge0097];
    
    // Добавляем линию
    edge0097.line = line0011;
    
    // Добавляем вершину
    edge0097.startVertex = vertex0069;

    // Добавляем станцию Pont de Sèvres
    MWStation *station0241 = [[MWStation alloc] init];
    station0241.identifier = @"station0241";
    [edge0097.elements addObject:station0241];
    
    station0241.nameOriginal = @"Pont de Sèvres";
    station0241.mapLocation = CGPointMake(395, 3637.5);
    station0241.geoLocation = CGPointMake(48.829747, 2.231035);

    MWDrawFillCircle *fillCircle0290 = [[MWDrawFillCircle alloc] init];
    fillCircle0290.center = CGPointMake(395, 3683.5);
    fillCircle0290.radius = 28;
    fillCircle0290.fillColor = line0011.color;
    [station0241.drawPrimitives addObject:fillCircle0290];

    MWDrawTextLine *drawTextLine0322 = [[MWDrawTextLine alloc] init];
    drawTextLine0322.text = @"9";
    drawTextLine0322.fontName = @"HelveticaNeue-Bold";
    drawTextLine0322.fontColor = [UIColor blackColor];
    drawTextLine0322.fontSize = 44;
    drawTextLine0322.origin = CGPointMake(383.5, 3655.5);
    [station0241.drawPrimitives addObject:drawTextLine0322];

    MWDrawFillCircle *fillCircle0291 = [[MWDrawFillCircle alloc] init];
    fillCircle0291.center = station0241.mapLocation;
    fillCircle0291.radius = 13;
    fillCircle0291.fillColor = [UIColor blackColor];
    [station0241.drawPrimitives addObject:fillCircle0291];

    MWDrawFillCircle *fillCircle0292 = [[MWDrawFillCircle alloc] init];
    fillCircle0292.center = station0241.mapLocation;
    fillCircle0292.radius = 11;
    fillCircle0292.fillColor = [UIColor whiteColor];
    [station0241.drawPrimitives addObject:fillCircle0292];

    MWDrawTextLine *drawTextLine0323 = [[MWDrawTextLine alloc] init];
    drawTextLine0323.text = @"Pont";
    drawTextLine0323.fontName = @"Helvetica-Bold";
    drawTextLine0323.fontColor = [UIColor blackColor];
    drawTextLine0323.fontSize = 30;
    drawTextLine0323.kernSpacing = 1.8;
    drawTextLine0323.origin = CGPointMake(427, 3649);
    [station0241.drawPrimitives addObject:drawTextLine0323];

    MWDrawTextLine *drawTextLine0324 = [[MWDrawTextLine alloc] init];
    drawTextLine0324.text = @"de Sèvres";
    drawTextLine0324.fontName = @"Helvetica-Bold";
    drawTextLine0324.fontColor = [UIColor blackColor];
    drawTextLine0324.fontSize = 30;
    drawTextLine0324.kernSpacing = 0.8;
    drawTextLine0324.origin = CGPointMake(427, 3683);
    [station0241.drawPrimitives addObject:drawTextLine0324];

    // Добавляем перегон
    MWHaul *haul0232 = [[MWHaul alloc] init];
    haul0232.identifier = @"haul0232";
    haul0232.length = 547;
    [edge0097.elements addObject:haul0232];
    
    MWDrawLine *drawLine0340 = [[MWDrawLine alloc] init];
    drawLine0340.startPoint = CGPointMake(395, 3637.5);
    drawLine0340.endPoint = CGPointMake(466.5, 3566);
    drawLine0340.width = 11;
    drawLine0340.color = line0011.color;
    [haul0232.drawPrimitives addObject:drawLine0340];

    // Добавляем станцию Billancourt
    MWStation *station0242 = [[MWStation alloc] init];
    station0242.identifier = @"station0242";
    [edge0097.elements addObject:station0242];
    
    station0242.nameOriginal = @"Billancourt";
    station0242.mapLocation = CGPointMake(466.5, 3566);
    station0242.geoLocation = CGPointMake(48.83209, 2.238177);
    
    MWDrawFillCircle *fillCircle0293 = [[MWDrawFillCircle alloc] init];
    fillCircle0293.center = station0242.mapLocation;
    fillCircle0293.radius = 12;
    fillCircle0293.fillColor = line0011.color;
    [station0242.drawPrimitives addObject:fillCircle0293];

    MWDrawTextLine *drawTextLine0325 = [[MWDrawTextLine alloc] init];
    drawTextLine0325.text = station0242.nameOriginal;
    drawTextLine0325.fontName = @"HelveticaNeue";
    drawTextLine0325.fontColor = [UIColor blackColor];
    drawTextLine0325.fontSize = 34;
    drawTextLine0325.kernSpacing = -0.0;
    drawTextLine0325.origin = CGPointMake(477, 3569);
    [station0242.nameOriginalTextPrimitives addObject:drawTextLine0325];

    // Добавляем перегон
    MWHaul *haul0233 = [[MWHaul alloc] init];
    haul0233.identifier = @"haul0233";
    haul0233.length = 599;
    [edge0097.elements addObject:haul0233];
    
    MWDrawLine *drawLine0341 = [[MWDrawLine alloc] init];
    drawLine0341.startPoint = CGPointMake(466, 3566.5);
    drawLine0341.endPoint = CGPointMake(538.5, 3494);
    drawLine0341.width = 11;
    drawLine0341.color = line0011.color;
    [haul0233.drawPrimitives addObject:drawLine0341];

    // Добавляем станцию Marcel Sembat
    MWStation *station0243 = [[MWStation alloc] init];
    station0243.identifier = @"station0243";
    [edge0097.elements addObject:station0243];
    
    station0243.nameOriginal = @"Marcel Sembat";
    station0243.mapLocation = CGPointMake(538.5, 3494);
    station0243.geoLocation = CGPointMake(48.83367, 2.243579);
    
    MWDrawFillCircle *fillCircle0294 = [[MWDrawFillCircle alloc] init];
    fillCircle0294.center = station0243.mapLocation;
    fillCircle0294.radius = 12;
    fillCircle0294.fillColor = line0011.color;
    [station0243.drawPrimitives addObject:fillCircle0294];
    
    MWDrawTextLine *drawTextLine0326 = [[MWDrawTextLine alloc] init];
    drawTextLine0326.text = station0243.nameOriginal;
    drawTextLine0326.fontName = @"HelveticaNeue";
    drawTextLine0326.fontColor = [UIColor blackColor];
    drawTextLine0326.fontSize = 34;
    drawTextLine0326.kernSpacing = -0.8;
    drawTextLine0326.origin = CGPointMake(550, 3497);
    [station0243.nameOriginalTextPrimitives addObject:drawTextLine0326];

    // Добавляем перегон
    MWHaul *haul0234 = [[MWHaul alloc] init];
    haul0234.identifier = @"haul0234";
    haul0234.length = 1010;
    [edge0097.elements addObject:haul0234];
    
    MWDrawLine *drawLine0342 = [[MWDrawLine alloc] init];
    drawLine0342.startPoint = CGPointMake(538, 3494.5);
    drawLine0342.endPoint = CGPointMake(600, 3432.5);
    drawLine0342.width = 11;
    drawLine0342.color = line0011.color;
    [haul0234.drawPrimitives addObject:drawLine0342];

    MWDrawArc *drawArc0104 = [[MWDrawArc alloc] init];
    drawArc0104.center = CGPointMake(578, 3412);
    drawArc0104.startDegrees = 0;
    drawArc0104.endDegrees = 45;
    drawArc0104.radius = 30;
    drawArc0104.width = 11;
    drawArc0104.color = line0011.color;
    [haul0224.drawPrimitives addObject:drawArc0104];

    MWDrawLine *drawLine0343 = [[MWDrawLine alloc] init];
    drawLine0343.startPoint = CGPointMake(608, 3412);
    drawLine0343.endPoint = CGPointMake(608, 3402);
    drawLine0343.width = 11;
    drawLine0343.color = line0011.color;
    [haul0234.drawPrimitives addObject:drawLine0343];

    // Добавляем станцию Porte de Saint-Cloud
    MWStation *station0244 = [[MWStation alloc] init];
    station0244.identifier = @"station0244";
    [edge0097.elements addObject:station0244];
    
    station0244.nameOriginal = @"Porte de Saint-Cloud";
    station0244.mapLocation = CGPointMake(608, 3402);
    station0244.geoLocation = CGPointMake(48.838082, 2.256956);

    MWDrawFillCircle *fillCircle0295 = [[MWDrawFillCircle alloc] init];
    fillCircle0295.center = station0244.mapLocation;
    fillCircle0295.radius = 12;
    fillCircle0295.fillColor = line0011.color;
    [station0244.drawPrimitives addObject:fillCircle0295];

    MWDrawTextLine *drawTextLine0327 = [[MWDrawTextLine alloc] init];
    drawTextLine0327.text = @"Porte";
    drawTextLine0327.fontName = @"HelveticaNeue";
    drawTextLine0327.fontColor = [UIColor blackColor];
    drawTextLine0327.fontSize = 34;
    drawTextLine0327.kernSpacing = -0.4;
    drawTextLine0327.origin = CGPointMake(628, 3380);
    [station0244.nameOriginalTextPrimitives addObject:drawTextLine0327];

    MWDrawTextLine *drawTextLine0328 = [[MWDrawTextLine alloc] init];
    drawTextLine0328.text = @"de St-Cloud";
    drawTextLine0328.fontName = @"HelveticaNeue";
    drawTextLine0328.fontColor = [UIColor blackColor];
    drawTextLine0328.fontSize = 34;
    drawTextLine0328.kernSpacing = -1.4;
    drawTextLine0328.origin = CGPointMake(628, 3413);
    [station0244.nameOriginalTextPrimitives addObject:drawTextLine0328];

    // Добавляем перегон
    MWHaul *haul0235 = [[MWHaul alloc] init];
    haul0235.identifier = @"haul0235";
    haul0235.length = 523;
    [edge0097.elements addObject:haul0235];

    MWDrawLine *drawLine0344 = [[MWDrawLine alloc] init];
    drawLine0344.startPoint = CGPointMake(608, 3402.5);
    drawLine0344.endPoint = CGPointMake(608, 3296);
    drawLine0344.width = 11;
    drawLine0344.color = line0011.color;
    [haul0235.drawPrimitives addObject:drawLine0344];

    // Добавляем станцию Exelmans
    MWStation *station0245 = [[MWStation alloc] init];
    station0245.identifier = @"station0245";
    [edge0097.elements addObject:station0245];
    
    station0245.nameOriginal = @"Exelmans";
    station0245.mapLocation = CGPointMake(608, 3296);
    station0245.geoLocation = CGPointMake(48.842405, 2.259549);
    
    MWDrawFillCircle *fillCircle0296 = [[MWDrawFillCircle alloc] init];
    fillCircle0296.center = station0245.mapLocation;
    fillCircle0296.radius = 12;
    fillCircle0296.fillColor = line0011.color;
    [station0245.drawPrimitives addObject:fillCircle0296];

    MWDrawTextLine *drawTextLine0329 = [[MWDrawTextLine alloc] init];
    drawTextLine0329.text = station0245.nameOriginal;
    drawTextLine0329.fontName = @"HelveticaNeue";
    drawTextLine0329.fontColor = [UIColor blackColor];
    drawTextLine0329.fontSize = 34;
    drawTextLine0329.kernSpacing = -1.0;
    drawTextLine0329.origin = CGPointMake(628, 3274);
    [station0245.nameOriginalTextPrimitives addObject:drawTextLine0329];

    // Добавляем перегон
    MWHaul *haul0236 = [[MWHaul alloc] init];
    haul0236.identifier = @"haul0236";
    haul0236.length = 356;
    [edge0097.elements addObject:haul0236];

    MWDrawLine *drawLine0345 = [[MWDrawLine alloc] init];
    drawLine0345.startPoint = CGPointMake(608, 3296.5);
    drawLine0345.endPoint = CGPointMake(608, 3179);
    drawLine0345.width = 11;
    drawLine0345.color = line0011.color;
    [haul0236.drawPrimitives addObject:drawLine0345];

    // Добавляем станцию Michel-Ange - Molitor
    MWStation *station0246 = [[MWStation alloc] init];
    station0246.identifier = @"station0246";
    [edge0097.elements addObject:station0246];
    
    station0246.nameOriginal = @"Michel-Ange - Molitor";
    station0246.mapLocation = CGPointMake(608, 3179.5);
    station0246.geoLocation = CGPointMake(48.84496, 2.261194);
    
    MWDrawFillCircle *fillCircle0297 = [[MWDrawFillCircle alloc] init];
    fillCircle0297.center = station0246.mapLocation;
    fillCircle0297.radius = 3;
    fillCircle0297.fillColor = [UIColor whiteColor];
    [station0246.drawPrimitives addObject:fillCircle0297];

    MWDrawTextLine *drawTextLine0330 = [[MWDrawTextLine alloc] init];
    drawTextLine0330.text = @"Michel";
    drawTextLine0330.fontName = @"HelveticaNeue";
    drawTextLine0330.fontColor = [UIColor blackColor];
    drawTextLine0330.fontSize = 34;
    drawTextLine0330.kernSpacing = -0.4;
    drawTextLine0330.origin = CGPointMake(495, 3185);
    [station0246.nameOriginalTextPrimitives addObject:drawTextLine0330];

    MWDrawTextLine *drawTextLine0331 = [[MWDrawTextLine alloc] init];
    drawTextLine0331.text = @"Ange";
    drawTextLine0331.fontName = @"HelveticaNeue";
    drawTextLine0331.fontColor = [UIColor blackColor];
    drawTextLine0331.fontSize = 34;
    drawTextLine0331.kernSpacing = -0.6;
    drawTextLine0331.origin = CGPointMake(518, 3219);
    [station0246.nameOriginalTextPrimitives addObject:drawTextLine0331];

    MWDrawTextLine *drawTextLine0332 = [[MWDrawTextLine alloc] init];
    drawTextLine0332.text = @"Molitor";
    drawTextLine0332.fontName = @"HelveticaNeue";
    drawTextLine0332.fontColor = [UIColor blackColor];
    drawTextLine0332.fontSize = 34;
    drawTextLine0332.kernSpacing = 0.6;
    drawTextLine0332.origin = CGPointMake(484, 3252);
    [station0246.nameOriginalTextPrimitives addObject:drawTextLine0332];

    // Добавляем вершину
    edge0097.finishVertex = vertex0070;

    // Создаем участок линии Michel-Ange - Molitor - Michel-Ange - Auteuil
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0098 = [[MWEdge alloc] init];
    edge0098.identifier = @"edge0098";
    edge0098.developmentName = @"Ребро: Michel-Ange - Molitor - Michel-Ange - Auteuil";
    [self.edges addObject:edge0098];
    
    // Добавляем линию
    edge0098.line = line0011;
    
    // Добавляем вершину
    edge0098.startVertex = vertex0070;

    // Добавляем станцию Michel-Ange - Molitor
    [edge0098.elements addObject:station0246];

    // Добавляем перегон
    MWHaul *haul0237 = [[MWHaul alloc] init];
    haul0237.identifier = @"haul0237";
    haul0237.length = 338;
    [edge0098.elements addObject:haul0237];

    MWDrawLine *drawLine0346 = [[MWDrawLine alloc] init];
    drawLine0346.startPoint = CGPointMake(608, 3179.5);
    drawLine0346.endPoint = CGPointMake(608, 3062.5);
    drawLine0346.width = 11;
    drawLine0346.color = line0011.color;
    [haul0237.drawPrimitives addObject:drawLine0346];

    // Добавляем станцию Michel-Ange - Auteuil
    MWStation *station0247 = [[MWStation alloc] init];
    station0247.identifier = @"station0247";
    [edge0098.elements addObject:station0247];
    
    station0247.nameOriginal = @"Michel-Ange - Auteuil";
    station0247.mapLocation = CGPointMake(608, 3062.5);
    station0247.geoLocation = CGPointMake(48.8475, 2.263611);
    
    MWDrawFillCircle *fillCircle0298 = [[MWDrawFillCircle alloc] init];
    fillCircle0298.center = station0247.mapLocation;
    fillCircle0298.radius = 3;
    fillCircle0298.fillColor = [UIColor whiteColor];
    [station0247.drawPrimitives addObject:fillCircle0298];

    MWDrawTextLine *drawTextLine0333 = [[MWDrawTextLine alloc] init];
    drawTextLine0333.text = @"Michel";
    drawTextLine0333.fontName = @"HelveticaNeue";
    drawTextLine0333.fontColor = [UIColor blackColor];
    drawTextLine0333.fontSize = 34;
    drawTextLine0333.kernSpacing = -0.0;
    drawTextLine0333.origin = CGPointMake(485, 2948);
    [station0247.nameOriginalTextPrimitives addObject:drawTextLine0333];

    MWDrawTextLine *drawTextLine0334 = [[MWDrawTextLine alloc] init];
    drawTextLine0334.text = @"Ange";
    drawTextLine0334.fontName = @"HelveticaNeue";
    drawTextLine0334.fontColor = [UIColor blackColor];
    drawTextLine0334.fontSize = 34;
    drawTextLine0334.kernSpacing = -0.8;
    drawTextLine0334.origin = CGPointMake(511, 2981);
    [station0247.nameOriginalTextPrimitives addObject:drawTextLine0334];

    MWDrawTextLine *drawTextLine0335 = [[MWDrawTextLine alloc] init];
    drawTextLine0335.text = @"Auteuil";
    drawTextLine0335.fontName = @"HelveticaNeue";
    drawTextLine0335.fontColor = [UIColor blackColor];
    drawTextLine0335.fontSize = 34;
    drawTextLine0335.kernSpacing = 0.6;
    drawTextLine0335.origin = CGPointMake(475, 3015);
    [station0247.nameOriginalTextPrimitives addObject:drawTextLine0335];

    // Добавляем вершину
    edge0098.finishVertex = vertex0071;

    // Создаем участок линии Michel-Ange - Auteuil - Trocadéro
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0099 = [[MWEdge alloc] init];
    edge0099.identifier = @"edge0099";
    edge0099.developmentName = @"Ребро: Michel-Ange - Auteuil - Trocadéro";
    [self.edges addObject:edge0099];
    
    // Добавляем линию
    edge0099.line = line0011;
    
    // Добавляем вершину
    edge0099.startVertex = vertex0071;

    // Добавляем станцию Michel-Ange - Auteuil
    [edge0099.elements addObject:station0247];

    // Добавляем перегон
    MWHaul *haul0238 = [[MWHaul alloc] init];
    haul0238.identifier = @"haul0238";
    haul0238.length = 587;
    [edge0099.elements addObject:haul0238];
    
    MWDrawLine *drawLine0347 = [[MWDrawLine alloc] init];
    drawLine0347.startPoint = CGPointMake(608, 3063);
    drawLine0347.endPoint = CGPointMake(608, 2890.5);
    drawLine0347.width = 11;
    drawLine0347.color = line0011.color;
    [haul0238.drawPrimitives addObject:drawLine0347];

    // Добавляем станцию Jasmin
    MWStation *station0248 = [[MWStation alloc] init];
    station0248.identifier = @"station0248";
    [edge0099.elements addObject:station0248];
    
    station0248.nameOriginal = @"Jasmin";
    station0248.mapLocation = CGPointMake(608, 2890.5);
    station0248.geoLocation = CGPointMake(48.851898, 2.267856);

    MWDrawFillCircle *fillCircle0299 = [[MWDrawFillCircle alloc] init];
    fillCircle0299.center = station0248.mapLocation;
    fillCircle0299.radius = 12;
    fillCircle0299.fillColor = line0011.color;
    [station0248.drawPrimitives addObject:fillCircle0299];

    MWDrawTextLine *drawTextLine0336 = [[MWDrawTextLine alloc] init];
    drawTextLine0336.text = station0248.nameOriginal;
    drawTextLine0336.fontName = @"HelveticaNeue";
    drawTextLine0336.fontColor = [UIColor blackColor];
    drawTextLine0336.fontSize = 34;
    drawTextLine0336.kernSpacing = 0.0;
    drawTextLine0336.origin = CGPointMake(480, 2868);
    [station0248.nameOriginalTextPrimitives addObject:drawTextLine0336];

    // Добавляем перегон
    MWHaul *haul0239 = [[MWHaul alloc] init];
    haul0239.identifier = @"haul0239";
    haul0239.length = 332;
    [edge0099.elements addObject:haul0239];
    
    MWDrawLine *drawLine0348 = [[MWDrawLine alloc] init];
    drawLine0348.startPoint = CGPointMake(608, 2891);
    drawLine0348.endPoint = CGPointMake(608, 2717.5);
    drawLine0348.width = 11;
    drawLine0348.color = line0011.color;
    [haul0239.drawPrimitives addObject:drawLine0348];

    // Добавляем станцию Ranelagh
    MWStation *station0249 = [[MWStation alloc] init];
    station0249.identifier = @"station0249";
    [edge0099.elements addObject:station0249];
    
    station0249.nameOriginal = @"Ranelagh";
    station0249.mapLocation = CGPointMake(608, 2717.5);
    station0249.geoLocation = CGPointMake(48.85502, 2.269634);

    MWDrawFillCircle *fillCircle0300 = [[MWDrawFillCircle alloc] init];
    fillCircle0300.center = station0249.mapLocation;
    fillCircle0300.radius = 12;
    fillCircle0300.fillColor = line0011.color;
    [station0249.drawPrimitives addObject:fillCircle0300];

    MWDrawTextLine *drawTextLine0337 = [[MWDrawTextLine alloc] init];
    drawTextLine0337.text = station0249.nameOriginal;
    drawTextLine0337.fontName = @"HelveticaNeue";
    drawTextLine0337.fontColor = [UIColor blackColor];
    drawTextLine0337.fontSize = 34;
    drawTextLine0337.kernSpacing = -0.8;
    drawTextLine0337.origin = CGPointMake(450, 2696);
    [station0249.nameOriginalTextPrimitives addObject:drawTextLine0337];

    // Добавляем перегон
    MWHaul *haul0240 = [[MWHaul alloc] init];
    haul0240.identifier = @"haul0240";
    haul0240.length = 447;
    [edge0099.elements addObject:haul0240];

    MWDrawLine *drawLine0349 = [[MWDrawLine alloc] init];
    drawLine0349.startPoint = CGPointMake(608, 2718);
    drawLine0349.endPoint = CGPointMake(608, 2539.5);
    drawLine0349.width = 11;
    drawLine0349.color = line0011.color;
    [haul0240.drawPrimitives addObject:drawLine0349];

    // Добавляем станцию La Muette
    MWStation *station0250 = [[MWStation alloc] init];
    station0250.identifier = @"station0250";
    [edge0099.elements addObject:station0250];
    
    station0250.nameOriginal = @"La Muette";
    station0250.mapLocation = CGPointMake(608, 2539.5);
    station0250.geoLocation = CGPointMake(48.857718, 2.273719);

    MWDrawFillCircle *fillCircle0301 = [[MWDrawFillCircle alloc] init];
    fillCircle0301.center = station0250.mapLocation;
    fillCircle0301.radius = 13;
    fillCircle0301.fillColor = [UIColor blackColor];
    [station0250.drawPrimitives addObject:fillCircle0301];
    
    MWDrawFillCircle *fillCircle0302 = [[MWDrawFillCircle alloc] init];
    fillCircle0302.center = station0250.mapLocation;
    fillCircle0302.radius = 11;
    fillCircle0302.fillColor = [UIColor whiteColor];
    [station0250.drawPrimitives addObject:fillCircle0302];

    MWDrawTextLine *drawTextLine0338 = [[MWDrawTextLine alloc] init];
    drawTextLine0338.text = station0250.nameOriginal;
    drawTextLine0338.fontName = @"HelveticaNeue";
    drawTextLine0338.fontColor = [UIColor blackColor];
    drawTextLine0338.fontSize = 34;
    drawTextLine0338.kernSpacing = -0.2;
    drawTextLine0338.origin = CGPointMake(627, 2518);
    [station0250.nameOriginalTextPrimitives addObject:drawTextLine0338];

    // Добавляем перегон
    MWHaul *haul0241 = [[MWHaul alloc] init];
    haul0241.identifier = @"haul0241";
    haul0241.length = 826;
    [edge0099.elements addObject:haul0241];

    MWDrawLine *drawLine0350 = [[MWDrawLine alloc] init];
    drawLine0350.startPoint = CGPointMake(608, 2540);
    drawLine0350.endPoint = CGPointMake(608, 2365);
    drawLine0350.width = 11;
    drawLine0350.color = line0011.color;
    [haul0241.drawPrimitives addObject:drawLine0350];

    MWDrawArc *drawArc0105 = [[MWDrawArc alloc] init];
    drawArc0105.center = CGPointMake(623, 2365.5);
    drawArc0105.startDegrees = 180;
    drawArc0105.endDegrees = 270;
    drawArc0105.radius = 15;
    drawArc0105.width = 11;
    drawArc0105.color = line0011.color;
    [haul0241.drawPrimitives addObject:drawArc0105];

    MWDrawLine *drawLine0351 = [[MWDrawLine alloc] init];
    drawLine0351.startPoint = CGPointMake(623, 2350.5);
    drawLine0351.endPoint = CGPointMake(647, 2350.5);
    drawLine0351.width = 11;
    drawLine0351.color = line0011.color;
    [haul0241.drawPrimitives addObject:drawLine0351];

    // Добавляем станцию Rue de la Pompe
    MWStation *station0251 = [[MWStation alloc] init];
    station0251.identifier = @"station0251";
    [edge0099.elements addObject:station0251];
    
    station0251.nameOriginal = @"Rue de la Pompe";
    station0251.mapLocation = CGPointMake(647, 2350.5);
    station0251.geoLocation = CGPointMake(48.863912, 2.279052);

    MWDrawFillCircle *fillCircle0303 = [[MWDrawFillCircle alloc] init];
    fillCircle0303.center = station0251.mapLocation;
    fillCircle0303.radius = 12;
    fillCircle0303.fillColor = line0011.color;
    [station0251.drawPrimitives addObject:fillCircle0303];

    MWDrawTextLine *drawTextLine0339 = [[MWDrawTextLine alloc] init];
    drawTextLine0339.text = @"Rue";
    drawTextLine0339.fontName = @"HelveticaNeue";
    drawTextLine0339.fontColor = [UIColor blackColor];
    drawTextLine0339.fontSize = 34;
    drawTextLine0339.kernSpacing = -0.6;
    drawTextLine0339.origin = CGPointMake(621, 2262);
    [station0251.nameOriginalTextPrimitives addObject:drawTextLine0339];

    MWDrawTextLine *drawTextLine0340 = [[MWDrawTextLine alloc] init];
    drawTextLine0340.text = @"de la Pompe";
    drawTextLine0340.fontName = @"HelveticaNeue";
    drawTextLine0340.fontColor = [UIColor blackColor];
    drawTextLine0340.fontSize = 34;
    drawTextLine0340.kernSpacing = -0.6;
    drawTextLine0340.origin = CGPointMake(557, 2295);
    [station0251.nameOriginalTextPrimitives addObject:drawTextLine0340];

    // Добавляем перегон
    MWHaul *haul0242 = [[MWHaul alloc] init];
    haul0242.identifier = @"haul0242";
    haul0242.length = 648;
    [edge0099.elements addObject:haul0242];

    MWDrawLine *drawLine0352 = [[MWDrawLine alloc] init];
    drawLine0352.startPoint = CGPointMake(646.5, 2350.5);
    drawLine0352.endPoint = CGPointMake(831, 2350.5);
    drawLine0352.width = 11;
    drawLine0352.color = line0011.color;
    [haul0242.drawPrimitives addObject:drawLine0352];

    // Добавляем станцию Trocadéro
    MWStation *station0252 = [[MWStation alloc] init];
    station0252.identifier = @"station0252";
    [edge0099.elements addObject:station0252];
    
    station0252.nameOriginal = @"Trocadéro";
    station0252.mapLocation = CGPointMake(831, 2350.5);
    station0252.geoLocation = CGPointMake(48.863301, 2.287061);

    MWDrawFillCircle *fillCircle0304 = [[MWDrawFillCircle alloc] init];
    fillCircle0304.center = station0252.mapLocation;
    fillCircle0304.radius = 3;
    fillCircle0304.fillColor = [UIColor whiteColor];
    [station0252.drawPrimitives addObject:fillCircle0304];

    station0252.showNameOnMap = false;
    [station0252.nameOriginalTextPrimitives addObject:drawTextLine0183];

    // Добавляем вершину
    edge0099.finishVertex = vertex0048;
    
    // Создаем участок линии Trocadéro - Franklin D. Roosevelt
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0100 = [[MWEdge alloc] init];
    edge0100.identifier = @"edge0100";
    edge0100.developmentName = @"Ребро: Trocadéro - Franklin D. Roosevelt";
    [self.edges addObject:edge0100];
    
    // Добавляем линию
    edge0100.line = line0011;
    
    // Добавляем вершину
    edge0100.startVertex = vertex0048;

    // Добавляем станцию Trocadéro
    [edge0100.elements addObject:station0252];

    // Добавляем перегон
    MWHaul *haul0243 = [[MWHaul alloc] init];
    haul0243.identifier = @"haul0243";
    haul0243.length = 496;
    [edge0100.elements addObject:haul0243];
    
    MWDrawLine *drawLine0353 = [[MWDrawLine alloc] init];
    drawLine0353.startPoint = CGPointMake(830.5, 2350.5);
    drawLine0353.endPoint = CGPointMake(1014, 2350.5);
    drawLine0353.width = 11;
    drawLine0353.color = line0011.color;
    [haul0243.drawPrimitives addObject:drawLine0353];

    // Добавляем станцию Iéna
    MWStation *station0253 = [[MWStation alloc] init];
    station0253.identifier = @"station0253";
    [edge0100.elements addObject:station0253];
    
    station0253.nameOriginal = @"Iéna";
    station0253.mapLocation = CGPointMake(1014, 2350.5);
    station0253.geoLocation = CGPointMake(48.864466, 2.29338);

    MWDrawFillCircle *fillCircle0305 = [[MWDrawFillCircle alloc] init];
    fillCircle0305.center = station0253.mapLocation;
    fillCircle0305.radius = 12;
    fillCircle0305.fillColor = line0011.color;
    [station0253.drawPrimitives addObject:fillCircle0305];

    MWDrawTextLine *drawTextLine0341 = [[MWDrawTextLine alloc] init];
    drawTextLine0341.text = station0253.nameOriginal;
    drawTextLine0341.fontName = @"HelveticaNeue";
    drawTextLine0341.fontColor = [UIColor blackColor];
    drawTextLine0341.fontSize = 34;
    drawTextLine0341.kernSpacing = -0.6;
    drawTextLine0341.origin = CGPointMake(982, 2295);
    [station0253.nameOriginalTextPrimitives addObject:drawTextLine0341];

    // Добавляем перегон
    MWHaul *haul0244 = [[MWHaul alloc] init];
    haul0244.identifier = @"haul0244";
    haul0244.length = 530;
    [edge0100.elements addObject:haul0244];

    MWDrawLine *drawLine0354 = [[MWDrawLine alloc] init];
    drawLine0354.startPoint = CGPointMake(1013.5, 2350.5);
    drawLine0354.endPoint = CGPointMake(1120.5, 2350.5);
    drawLine0354.width = 11;
    drawLine0354.color = line0011.color;
    [haul0244.drawPrimitives addObject:drawLine0354];

    MWDrawArc *drawArc0106 = [[MWDrawArc alloc] init];
    drawArc0106.center = CGPointMake(1119.5, 2320.5);
    drawArc0106.startDegrees = 45;
    drawArc0106.endDegrees = 90;
    drawArc0106.radius = 30;
    drawArc0106.width = 11;
    drawArc0106.color = line0011.color;
    [haul0244.drawPrimitives addObject:drawArc0106];

    MWDrawLine *drawLine0355 = [[MWDrawLine alloc] init];
    drawLine0355.startPoint = CGPointMake(1140.5, 2342);
    drawLine0355.endPoint = CGPointMake(1209.5, 2273);
    drawLine0355.width = 11;
    drawLine0355.color = line0011.color;
    [haul0244.drawPrimitives addObject:drawLine0355];

    // Добавляем станцию Alma - Marceau
    MWStation *station0254 = [[MWStation alloc] init];
    station0254.identifier = @"station0254";
    [edge0100.elements addObject:station0254];
    
    station0254.nameOriginal = @"Alma - Marceau";
    station0254.mapLocation = CGPointMake(1209.5, 2273);
    station0254.geoLocation = CGPointMake(48.864904, 2.300234);

    MWDrawFillCircle *fillCircle0306 = [[MWDrawFillCircle alloc] init];
    fillCircle0306.center = station0254.mapLocation;
    fillCircle0306.radius = 13;
    fillCircle0306.fillColor = [UIColor blackColor];
    [station0254.drawPrimitives addObject:fillCircle0306];

    MWDrawFillCircle *fillCircle0307 = [[MWDrawFillCircle alloc] init];
    fillCircle0307.center = station0254.mapLocation;
    fillCircle0307.radius = 11;
    fillCircle0307.fillColor = [UIColor whiteColor];
    [station0254.drawPrimitives addObject:fillCircle0307];

    MWDrawTextLine *drawTextLine0342 = [[MWDrawTextLine alloc] init];
    drawTextLine0342.text = @"Alma";
    drawTextLine0342.fontName = @"HelveticaNeue";
    drawTextLine0342.fontColor = [UIColor blackColor];
    drawTextLine0342.fontSize = 34;
    drawTextLine0342.kernSpacing = -0.6;
    drawTextLine0342.origin = CGPointMake(1127, 2192);
    [station0254.nameOriginalTextPrimitives addObject:drawTextLine0342];

    MWDrawTextLine *drawTextLine0343 = [[MWDrawTextLine alloc] init];
    drawTextLine0343.text = @"Marceau";
    drawTextLine0343.fontName = @"HelveticaNeue";
    drawTextLine0343.fontColor = [UIColor blackColor];
    drawTextLine0343.fontSize = 34;
    drawTextLine0343.kernSpacing = -0.8;
    drawTextLine0343.origin = CGPointMake(1072, 2225);
    [station0254.nameOriginalTextPrimitives addObject:drawTextLine0343];

    // Добавляем перегон
    MWHaul *haul0245 = [[MWHaul alloc] init];
    haul0245.identifier = @"haul0245";
    haul0245.length = 857;
    [edge0100.elements addObject:haul0245];

    MWDrawLine *drawLine0356 = [[MWDrawLine alloc] init];
    drawLine0356.startPoint = CGPointMake(1209, 2273.5);
    drawLine0356.endPoint = CGPointMake(1356.5, 2125);
    drawLine0356.width = 11;
    drawLine0356.color = line0011.color;
    [haul0245.drawPrimitives addObject:drawLine0356];

    // Добавляем станцию Franklin D. Roosevelt
    MWStation *station0255 = [[MWStation alloc] init];
    station0255.identifier = @"station0255";
    [edge0100.elements addObject:station0255];
    
    station0255.nameOriginal = @"Franklin D. Roosevelt";
    station0255.mapLocation = CGPointMake(1356.5, 2125);
    station0255.geoLocation = CGPointMake(48.868977, 2.30989);

    MWDrawFillCircle *fillCircle0308 = [[MWDrawFillCircle alloc] init];
    fillCircle0308.center = station0255.mapLocation;
    fillCircle0308.radius = 3;
    fillCircle0308.fillColor = [UIColor whiteColor];
    [station0255.drawPrimitives addObject:fillCircle0308];

    station0255.showNameOnMap = false;
    [station0255.nameOriginalTextPrimitives addObject:drawTextLine0014];
    [station0255.nameOriginalTextPrimitives addObject:drawTextLine0015];
    
    // Добавляем вершину
    edge0100.finishVertex = vertex0003;

    // Создаем участок линии Franklin D. Roosevelt - Miromesnil
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0101 = [[MWEdge alloc] init];
    edge0101.identifier = @"edge0101";
    edge0101.developmentName = @"Ребро: Franklin D. Roosevelt - Miromesnil";
    [self.edges addObject:edge0101];
    
    // Добавляем линию
    edge0101.line = line0011;
    
    // Добавляем вершину
    edge0101.startVertex = vertex0003;

    // Добавляем станцию Franklin D. Roosevelt
    [edge0101.elements addObject:station0255];

    // Добавляем перегон
    MWHaul *haul0246 = [[MWHaul alloc] init];
    haul0246.identifier = @"haul0246";
    haul0246.length = 355;
    [edge0101.elements addObject:haul0246];
    
    MWDrawLine *drawLine0357 = [[MWDrawLine alloc] init];
    drawLine0357.startPoint = CGPointMake(1356, 2126.5);
    drawLine0357.endPoint = CGPointMake(1492.5, 1989);
    drawLine0357.width = 11;
    drawLine0357.color = line0011.color;
    [haul0246.drawPrimitives addObject:drawLine0357];

    // Добавляем станцию Saint-Philippe du Roule
    MWStation *station0256 = [[MWStation alloc] init];
    station0256.identifier = @"station0256";
    [edge0101.elements addObject:station0256];
    
    station0256.nameOriginal = @"Saint-Philippe du Roule";
    station0256.mapLocation = CGPointMake(1492.5, 1989);
    station0256.geoLocation = CGPointMake(48.871941, 2.310036);

    MWDrawFillCircle *fillCircle0309 = [[MWDrawFillCircle alloc] init];
    fillCircle0309.center = station0256.mapLocation;
    fillCircle0309.radius = 12;
    fillCircle0309.fillColor = line0011.color;
    [station0256.drawPrimitives addObject:fillCircle0309];

    MWDrawTextLine *drawTextLine0344 = [[MWDrawTextLine alloc] init];
    drawTextLine0344.text = @"Saint-Philippe";
    drawTextLine0344.fontName = @"HelveticaNeue";
    drawTextLine0344.fontColor = [UIColor blackColor];
    drawTextLine0344.fontSize = 34;
    drawTextLine0344.kernSpacing = -0.4;
    drawTextLine0344.origin = CGPointMake(1274, 1909);
    [station0256.nameOriginalTextPrimitives addObject:drawTextLine0344];

    MWDrawTextLine *drawTextLine0345 = [[MWDrawTextLine alloc] init];
    drawTextLine0345.text = @"du Roule";
    drawTextLine0345.fontName = @"HelveticaNeue";
    drawTextLine0345.fontColor = [UIColor blackColor];
    drawTextLine0345.fontSize = 34;
    drawTextLine0345.kernSpacing = -0.6;
    drawTextLine0345.origin = CGPointMake(1350, 1942);
    [station0256.nameOriginalTextPrimitives addObject:drawTextLine0345];

    // Добавляем перегон
    MWHaul *haul0247 = [[MWHaul alloc] init];
    haul0247.identifier = @"haul0247";
    haul0247.length = 372;
    [edge0101.elements addObject:haul0247];

    MWDrawLine *drawLine0358 = [[MWDrawLine alloc] init];
    drawLine0358.startPoint = CGPointMake(1492, 1989.5);
    drawLine0358.endPoint = CGPointMake(1575.5, 1906);
    drawLine0358.width = 11;
    drawLine0358.color = line0011.color;
    [haul0247.drawPrimitives addObject:drawLine0358];

    // Добавляем станцию Miromesnil
    MWStation *station0257 = [[MWStation alloc] init];
    station0257.identifier = @"station0257";
    [edge0101.elements addObject:station0257];
    
    station0257.nameOriginal = @"Miromesnil";
    station0257.mapLocation = CGPointMake(1575.5, 1906);
    station0257.geoLocation = CGPointMake(48.87367, 2.31446);

    MWDrawFillCircle *fillCircle0310 = [[MWDrawFillCircle alloc] init];
    fillCircle0310.center = station0257.mapLocation;
    fillCircle0310.radius = 3;
    fillCircle0310.fillColor = [UIColor whiteColor];
    [station0257.drawPrimitives addObject:fillCircle0310];

    MWDrawTextLine *drawTextLine0346 = [[MWDrawTextLine alloc] init];
    drawTextLine0346.text = station0257.nameOriginal;
    drawTextLine0346.fontName = @"HelveticaNeue";
    drawTextLine0346.fontColor = [UIColor blackColor];
    drawTextLine0346.fontSize = 34;
    drawTextLine0346.kernSpacing = 0.6;
    drawTextLine0346.origin = CGPointMake(1395, 1859);
    [station0257.nameOriginalTextPrimitives addObject:drawTextLine0346];

    // Добавляем вершину
    edge0101.finishVertex = vertex0072;

    // Создаем участок линии Miromesnil - Saint-Augustin
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0102 = [[MWEdge alloc] init];
    edge0102.identifier = @"edge0102";
    edge0102.developmentName = @"Ребро: Miromesnil - Saint-Augustin";
    [self.edges addObject:edge0102];
    
    // Добавляем линию
    edge0102.line = line0011;
    
    // Добавляем вершину
    edge0102.startVertex = vertex0072;

    // Добавляем станцию Miromesnil
    [edge0102.elements addObject:station0257];

    // Добавляем перегон
    MWHaul *haul0248 = [[MWHaul alloc] init];
    haul0248.identifier = @"haul0248";
    haul0248.length = 536;
    [edge0102.elements addObject:haul0248];

    MWDrawLine *drawLine0359 = [[MWDrawLine alloc] init];
    drawLine0359.startPoint = CGPointMake(1575, 1906.5);
    drawLine0359.endPoint = CGPointMake(1646, 1836);
    drawLine0359.width = 11;
    drawLine0359.color = line0011.color;
    [haul0248.drawPrimitives addObject:drawLine0359];

    // Добавляем станцию Saint-Augustin
    MWStation *station0258 = [[MWStation alloc] init];
    station0258.identifier = @"station0258";
    [edge0102.elements addObject:station0258];
    
    station0258.nameOriginal = @"Saint-Augustin";
    station0258.mapLocation = CGPointMake(1646, 1836);
    station0258.geoLocation = CGPointMake(48.874441, 2.322133);

    MWDrawFillCircle *fillCircle0311 = [[MWDrawFillCircle alloc] init];
    fillCircle0311.center = station0258.mapLocation;
    fillCircle0311.radius = 3;
    fillCircle0311.fillColor = [UIColor whiteColor];
    [station0258.drawPrimitives addObject:fillCircle0311];

    MWDrawTextLine *drawTextLine0347 = [[MWDrawTextLine alloc] init];
    drawTextLine0347.text = station0258.nameOriginal;
    drawTextLine0347.fontName = @"HelveticaNeue";
    drawTextLine0347.fontColor = [UIColor blackColor];
    drawTextLine0347.fontSize = 34;
    drawTextLine0347.kernSpacing = -0.6;
    drawTextLine0347.origin = CGPointMake(1418, 1789);
    [station0258.nameOriginalTextPrimitives addObject:drawTextLine0347];

    // Добавляем вершину
    edge0102.finishVertex = vertex0025;

    // Создаем участок линии Saint-Augustin - Havre - Caumartin
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0103 = [[MWEdge alloc] init];
    edge0103.identifier = @"edge0103";
    edge0103.developmentName = @"Ребро: Saint-Augustin - Havre - Caumartin";
    [self.edges addObject:edge0103];
    
    // Добавляем линию
    edge0103.line = line0011;
    
    // Добавляем вершину
    edge0103.startVertex = vertex0025;

    // Добавляем станцию Saint-Augustin
    [edge0103.elements addObject:station0258];

    // Добавляем перегон
    MWHaul *haul0249 = [[MWHaul alloc] init];
    haul0249.identifier = @"haul0249";
    haul0249.length = 546;
    [edge0103.elements addObject:haul0249];

    MWDrawLine *drawLine0360 = [[MWDrawLine alloc] init];
    drawLine0360.startPoint = CGPointMake(1645.5, 1836.5);
    drawLine0360.endPoint = CGPointMake(1670, 1812);
    drawLine0360.width = 11;
    drawLine0360.color = line0011.color;
    [haul0249.drawPrimitives addObject:drawLine0360];

    MWDrawArc *drawArc0107 = [[MWDrawArc alloc] init];
    drawArc0107.center = CGPointMake(1680, 1823);
    drawArc0107.startDegrees = 225;
    drawArc0107.endDegrees = 315;
    drawArc0107.radius = 15;
    drawArc0107.width = 11;
    drawArc0107.color = line0011.color;
    [haul0249.drawPrimitives addObject:drawArc0107];

    MWDrawLine *drawLine0361 = [[MWDrawLine alloc] init];
    drawLine0361.startPoint = CGPointMake(1690, 1811.5);
    drawLine0361.endPoint = CGPointMake(1769.5, 1891);
    drawLine0361.width = 11;
    drawLine0361.color = line0011.color;
    [haul0249.drawPrimitives addObject:drawLine0361];

    MWDrawArc *drawArc0108 = [[MWDrawArc alloc] init];
    drawArc0108.center = CGPointMake(1790.5, 1869.5);
    drawArc0108.startDegrees = 90;
    drawArc0108.endDegrees = 135;
    drawArc0108.radius = 30;
    drawArc0108.width = 11;
    drawArc0108.color = line0011.color;
    [haul0249.drawPrimitives addObject:drawArc0108];

    MWDrawLine *drawLine0362 = [[MWDrawLine alloc] init];
    drawLine0362.startPoint = CGPointMake(1790, 1899.5);
    drawLine0362.endPoint = CGPointMake(1809.5, 1899.5);
    drawLine0362.width = 11;
    drawLine0362.color = line0011.color;
    [haul0249.drawPrimitives addObject:drawLine0362];

    // Добавляем станцию Havre - Caumartin
    MWStation *station0259 = [[MWStation alloc] init];
    station0259.identifier = @"station0259";
    [edge0103.elements addObject:station0259];
    
    station0259.nameOriginal = @"Havre - Caumartin";
    station0259.mapLocation = CGPointMake(1809.5, 1899.5);
    station0259.geoLocation = CGPointMake(48.873465, 2.327968);
    
    MWDrawFillCircle *fillCircle0312 = [[MWDrawFillCircle alloc] init];
    fillCircle0312.center = station0259.mapLocation;
    fillCircle0312.radius = 3;
    fillCircle0312.fillColor = [UIColor whiteColor];
    [station0259.drawPrimitives addObject:fillCircle0312];

    station0259.showNameOnMap = false;
    [station0259.nameOriginalTextPrimitives addObject:drawTextLine0084];
    [station0259.nameOriginalTextPrimitives addObject:drawTextLine0085];

    // Добавляем вершину
    edge0103.finishVertex = vertex0026;

    // Создаем участок линии Havre - Caumartin - Chaussée d'Antin - La Fayette
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0104 = [[MWEdge alloc] init];
    edge0104.identifier = @"edge0104";
    edge0104.developmentName = @"Ребро: Havre - Caumartin - Chaussée d'Antin - La Fayette";
    [self.edges addObject:edge0104];
    
    // Добавляем линию
    edge0104.line = line0011;
    
    // Добавляем вершину
    edge0104.startVertex = vertex0026;

    // Добавляем станцию Havre - Caumartin
    [edge0104.elements addObject:station0259];

    // Добавляем перегон
    MWHaul *haul0250 = [[MWHaul alloc] init];
    haul0250.identifier = @"haul0250";
    haul0250.length = 340;
    [edge0104.elements addObject:haul0250];
    
    MWDrawLine *drawLine0363 = [[MWDrawLine alloc] init];
    drawLine0363.startPoint = CGPointMake(1809, 1899.5);
    drawLine0363.endPoint = CGPointMake(2001.5, 1900);
    drawLine0363.width = 11;
    drawLine0363.color = line0011.color;
    [haul0250.drawPrimitives addObject:drawLine0363];

    // Добавляем станцию Chaussée d'Antin - La Fayette
    MWStation *station0260 = [[MWStation alloc] init];
    station0260.identifier = @"station0260";
    [edge0104.elements addObject:station0260];
    
    station0260.nameOriginal = @"Chaussée d'Antin - La Fayette";
    station0260.mapLocation = CGPointMake(2001.5, 1900);
    station0260.geoLocation = CGPointMake(48.87307, 2.33393);

    MWDrawFillCircle *fillCircle0313 = [[MWDrawFillCircle alloc] init];
    fillCircle0313.center = station0260.mapLocation;
    fillCircle0313.radius = 3;
    fillCircle0313.fillColor = [UIColor whiteColor];
    [station0260.drawPrimitives addObject:fillCircle0313];

    station0260.showNameOnMap = false;
    [station0260.nameOriginalTextPrimitives addObject:drawTextLine0229];
    [station0260.nameOriginalTextPrimitives addObject:drawTextLine0230];
    [station0260.nameOriginalTextPrimitives addObject:drawTextLine0231];

    // Добавляем вершину
    edge0104.finishVertex = vertex0055;

    // Создаем участок линии Chaussée d'Antin - La Fayette - Richelieu – Drouot
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0105 = [[MWEdge alloc] init];
    edge0105.identifier = @"edge0105";
    edge0105.developmentName = @"Ребро: Chaussée d'Antin - La Fayette - Richelieu – Drouot";
    [self.edges addObject:edge0105];
    
    // Добавляем линию
    edge0105.line = line0011;
    
    // Добавляем вершину
    edge0105.startVertex = vertex0055;

    // Добавляем станцию Chaussée d'Antin - La Fayette
    [edge0105.elements addObject:station0260];

    // Добавляем перегон
    MWHaul *haul0251 = [[MWHaul alloc] init];
    haul0251.identifier = @"haul0251";
    haul0251.length = 469;
    [edge0105.elements addObject:haul0251];

    MWDrawLine *drawLine0364 = [[MWDrawLine alloc] init];
    drawLine0364.startPoint = CGPointMake(2001, 1900);
    drawLine0364.endPoint = CGPointMake(2126.5, 1900);
    drawLine0364.width = 11;
    drawLine0364.color = line0011.color;
    [haul0251.drawPrimitives addObject:drawLine0364];

    // Добавляем станцию Richelieu – Drouot
    MWStation *station0261 = [[MWStation alloc] init];
    station0261.identifier = @"station0261";
    [edge0105.elements addObject:station0261];
    
    station0261.nameOriginal = @"Richelieu – Drouot";
    station0261.mapLocation = CGPointMake(2126.5, 1900);
    station0261.geoLocation = CGPointMake(48.871987, 2.338741);

    MWDrawFillCircle *fillCircle0314 = [[MWDrawFillCircle alloc] init];
    fillCircle0314.center = station0261.mapLocation;
    fillCircle0314.radius = 3;
    fillCircle0314.fillColor = [UIColor whiteColor];
    [station0261.drawPrimitives addObject:fillCircle0314];

    station0261.showNameOnMap = false;
    [station0261.nameOriginalTextPrimitives addObject:drawTextLine0290];
    [station0261.nameOriginalTextPrimitives addObject:drawTextLine0291];
    
    // Добавляем вершину
    edge0105.finishVertex = vertex0065;

    // Создаем участок линии Richelieu – Drouot - Grands Boulevards
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0106 = [[MWEdge alloc] init];
    edge0106.identifier = @"edge0106";
    edge0106.developmentName = @"Ребро: Richelieu – Drouot - Grands Boulevards";
    [self.edges addObject:edge0106];
    
    // Добавляем линию
    edge0106.line = line0011;
    
    // Добавляем вершину
    edge0106.startVertex = vertex0065;

    // Добавляем станцию Richelieu – Drouot
    [edge0106.elements addObject:station0261];

    // Добавляем перегон
    MWHaul *haul0252 = [[MWHaul alloc] init];
    haul0252.identifier = @"haul0252";
    haul0252.length = 378;
    [edge0106.elements addObject:haul0252];

    MWDrawLine *drawLine0365 = [[MWDrawLine alloc] init];
    drawLine0365.startPoint = CGPointMake(2126, 1900);
    drawLine0365.endPoint = CGPointMake(2288, 1900);
    drawLine0365.width = 11;
    drawLine0365.color = line0011.color;
    [haul0252.drawPrimitives addObject:drawLine0365];

    // Добавляем станцию Grands Boulevards
    MWStation *station0262 = [[MWStation alloc] init];
    station0262.identifier = @"station0262";
    [edge0106.elements addObject:station0262];
    
    station0262.nameOriginal = @"Grands Boulevards";
    station0262.mapLocation = CGPointMake(2288, 1900);
    station0262.geoLocation = CGPointMake(48.871426, 2.344342);

    MWDrawFillCircle *fillCircle0315 = [[MWDrawFillCircle alloc] init];
    fillCircle0315.center = station0262.mapLocation;
    fillCircle0315.radius = 12;
    fillCircle0315.fillColor = line0011.color;
    [station0262.drawPrimitives addObject:fillCircle0315];

    station0262.showNameOnMap = false;
    [station0262.nameOriginalTextPrimitives addObject:drawTextLine0292];
    [station0262.nameOriginalTextPrimitives addObject:drawTextLine0293];

    // Добавляем вершину
    edge0106.finishVertex = vertex0066;

    // Создаем участок линии Grands Boulevards - Bonne Nouvelle
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0107 = [[MWEdge alloc] init];
    edge0107.identifier = @"edge0107";
    edge0107.developmentName = @"Ребро: Grands Boulevards - Bonne Nouvelle";
    [self.edges addObject:edge0107];
    
    // Добавляем линию
    edge0107.line = line0011;
    
    // Добавляем вершину
    edge0107.startVertex = vertex0066;

    // Добавляем станцию Grands Boulevards
    [edge0107.elements addObject:station0262];

    // Добавляем перегон
    MWHaul *haul0253 = [[MWHaul alloc] init];
    haul0253.identifier = @"haul0253";
    haul0253.length = 323;
    [edge0107.elements addObject:haul0253];
    
    MWDrawLine *drawLine0366 = [[MWDrawLine alloc] init];
    drawLine0366.startPoint = CGPointMake(2287.5, 1900);
    drawLine0366.endPoint = CGPointMake(2505, 1900);
    drawLine0366.width = 11;
    drawLine0366.color = line0011.color;
    [haul0253.drawPrimitives addObject:drawLine0366];

    // Добавляем станцию Bonne Nouvelle
    MWStation *station0263 = [[MWStation alloc] init];
    station0263.identifier = @"station0263";
    [edge0107.elements addObject:station0263];
    
    station0263.nameOriginal = @"Bonne Nouvelle";
    station0263.mapLocation = CGPointMake(2505, 1900);
    station0263.geoLocation = CGPointMake(48.870639, 2.348875);
    
    MWDrawFillCircle *fillCircle0316 = [[MWDrawFillCircle alloc] init];
    fillCircle0316.center = station0263.mapLocation;
    fillCircle0316.radius = 12;
    fillCircle0316.fillColor = line0011.color;
    [station0263.drawPrimitives addObject:fillCircle0316];

    station0263.showNameOnMap = false;
    [station0263.nameOriginalTextPrimitives addObject:drawTextLine0294];
    [station0263.nameOriginalTextPrimitives addObject:drawTextLine0295];
    
    // Добавляем вершину
    edge0107.finishVertex = vertex0067;

    // Создаем участок линии Bonne Nouvelle - Strasbourg - Saint-Denis
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0108 = [[MWEdge alloc] init];
    edge0108.identifier = @"edge0108";
    edge0108.developmentName = @"Ребро: Bonne Nouvelle - Strasbourg - Saint-Denis";
    [self.edges addObject:edge0108];
    
    // Добавляем линию
    edge0108.line = line0011;
    
    // Добавляем вершину
    edge0108.startVertex = vertex0067;

    // Добавляем станцию Bonne Nouvelle
    [edge0108.elements addObject:station0263];

    // Добавляем перегон
    MWHaul *haul0254 = [[MWHaul alloc] init];
    haul0254.identifier = @"haul0254";
    haul0254.length = 427;
    [edge0108.elements addObject:haul0254];
    
    MWDrawLine *drawLine0367 = [[MWDrawLine alloc] init];
    drawLine0367.startPoint = CGPointMake(2504.5, 1900);
    drawLine0367.endPoint = CGPointMake(2621.5, 1900);
    drawLine0367.width = 11;
    drawLine0367.color = line0011.color;
    [haul0254.drawPrimitives addObject:drawLine0367];

    // Добавляем станцию Strasbourg - Saint-Denis
    MWStation *station0264 = [[MWStation alloc] init];
    station0264.identifier = @"station0264";
    [edge0108.elements addObject:station0264];
    
    station0264.nameOriginal = @"Strasbourg - Saint-Denis";
    station0264.mapLocation = CGPointMake(2621.5, 1900);
    station0264.geoLocation = CGPointMake(48.869722, 2.353889);
    
    MWDrawFillCircle *fillCircle0317 = [[MWDrawFillCircle alloc] init];
    fillCircle0317.center = station0264.mapLocation;
    fillCircle0317.radius = 3;
    fillCircle0317.fillColor = [UIColor whiteColor];
    [station0264.drawPrimitives addObject:fillCircle0317];

    station0264.showNameOnMap = false;
    [station0264.nameOriginalTextPrimitives addObject:drawTextLine0124];
    [station0264.nameOriginalTextPrimitives addObject:drawTextLine0125];
    
    // Добавляем вершину
    edge0108.finishVertex = vertex0038;

    // Создаем участок линии Strasbourg - Saint-Denis - République
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0109 = [[MWEdge alloc] init];
    edge0109.identifier = @"edge0109";
    edge0109.developmentName = @"Ребро: Bonne Nouvelle - Strasbourg - Saint-Denis";
    [self.edges addObject:edge0109];
    
    // Добавляем линию
    edge0109.line = line0011;
    
    // Добавляем вершину
    edge0109.startVertex = vertex0038;

    // Добавляем станцию Strasbourg - Saint-Denis
    [edge0109.elements addObject:station0264];

    // Добавляем перегон
    MWHaul *haul0255 = [[MWHaul alloc] init];
    haul0255.identifier = @"haul0255";
    haul0255.length = 764;
    [edge0109.elements addObject:haul0255];
    
    MWDrawLine *drawLine0368 = [[MWDrawLine alloc] init];
    drawLine0368.startPoint = CGPointMake(2621, 1900);
    drawLine0368.endPoint = CGPointMake(2813, 1900);
    drawLine0368.width = 11;
    drawLine0368.color = line0011.color;
    [haul0255.drawPrimitives addObject:drawLine0368];

    MWDrawArc *drawArc0109 = [[MWDrawArc alloc] init];
    drawArc0109.center = CGPointMake(2812.5, 1930);
    drawArc0109.startDegrees = 270;
    drawArc0109.endDegrees = 315;
    drawArc0109.radius = 30;
    drawArc0109.width = 11;
    drawArc0109.color = line0011.color;
    [haul0255.drawPrimitives addObject:drawArc0109];

    MWDrawLine *drawLine0369 = [[MWDrawLine alloc] init];
    drawLine0369.startPoint = CGPointMake(2833.5, 1908.5);
    drawLine0369.endPoint = CGPointMake(2913, 1988);
    drawLine0369.width = 11;
    drawLine0369.color = line0011.color;
    [haul0255.drawPrimitives addObject:drawLine0369];

    // Добавляем станцию République
    MWStation *station0265 = [[MWStation alloc] init];
    station0265.identifier = @"station0265";
    [edge0109.elements addObject:station0265];
    
    station0265.nameOriginal = @"République";
    station0265.mapLocation = CGPointMake(2912, 1987);
    station0265.geoLocation = CGPointMake(48.867503, 2.363811);
    
    MWDrawFillCircle *fillCircle0318 = [[MWDrawFillCircle alloc] init];
    fillCircle0318.center = station0265.mapLocation;
    fillCircle0318.radius = 3;
    fillCircle0318.fillColor = [UIColor whiteColor];
    [station0265.drawPrimitives addObject:fillCircle0318];

    station0265.showNameOnMap = false;
    [station0265.nameOriginalTextPrimitives addObject:drawTextLine0095];
    
    // Добавляем вершину
    edge0109.finishVertex = vertex0030;

    // Создаем участок линии République - Oberkampf
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0110 = [[MWEdge alloc] init];
    edge0110.identifier = @"edge0110";
    edge0110.developmentName = @"Ребро: République - Oberkampf";
    [self.edges addObject:edge0110];
    
    // Добавляем линию
    edge0110.line = line0011;
    
    // Добавляем вершину
    edge0110.startVertex = vertex0030;

    // Добавляем станцию République
    [edge0110.elements addObject:station0265];

    // Добавляем перегон
    MWHaul *haul0256 = [[MWHaul alloc] init];
    haul0256.identifier = @"haul0256";
    haul0256.length = 450;
    [edge0110.elements addObject:haul0256];
    
    MWDrawLine *drawLine0370 = [[MWDrawLine alloc] init];
    drawLine0370.startPoint = CGPointMake(2912.5, 1987.5);
    drawLine0370.endPoint = CGPointMake(2997.5, 2073.5);
    drawLine0370.width = 11;
    drawLine0370.color = line0011.color;
    [haul0256.drawPrimitives addObject:drawLine0370];

    // Добавляем станцию Oberkampf
    MWStation *station0266 = [[MWStation alloc] init];
    station0266.identifier = @"station0266";
    [edge0110.elements addObject:station0266];
    
    station0266.nameOriginal = @"Oberkampf";
    station0266.mapLocation = CGPointMake(2997.5, 2073.5);
    station0266.geoLocation = CGPointMake(48.8635, 2.37025);
    
    MWDrawFillCircle *fillCircle0319 = [[MWDrawFillCircle alloc] init];
    fillCircle0319.center = station0266.mapLocation;
    fillCircle0319.radius = 3;
    fillCircle0319.fillColor = [UIColor whiteColor];
    [station0266.drawPrimitives addObject:fillCircle0319];

    station0266.showNameOnMap = false;
    [station0266.nameOriginalTextPrimitives addObject:drawTextLine0164];
    
    // Добавляем вершину
    edge0110.finishVertex = vertex0045;
    
    // Создаем участок линии Oberkampf - Nation
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0111 = [[MWEdge alloc] init];
    edge0111.identifier = @"edge0111";
    edge0111.developmentName = @"Ребро: Oberkampf - Nation";
    [self.edges addObject:edge0111];
    
    // Добавляем линию
    edge0111.line = line0011;
    
    // Добавляем вершину
    edge0111.startVertex = vertex0045;

    // Добавляем станцию Oberkampf
    [edge0111.elements addObject:station0266];

    // Добавляем перегон
    MWHaul *haul0257 = [[MWHaul alloc] init];
    haul0257.identifier = @"haul0257";
    haul0257.length = 550;
    [edge0111.elements addObject:haul0257];
    
    MWDrawLine *drawLine0371 = [[MWDrawLine alloc] init];
    drawLine0371.startPoint = CGPointMake(2997, 2073);
    drawLine0371.endPoint = CGPointMake(3210, 2286.5);
    drawLine0371.width = 11;
    drawLine0371.color = line0011.color;
    [haul0257.drawPrimitives addObject:drawLine0371];

    // Добавляем станцию Saint-Ambroise
    MWStation *station0267 = [[MWStation alloc] init];
    station0267.identifier = @"station0267";
    [edge0111.elements addObject:station0267];
    
    station0267.nameOriginal = @"Saint-Ambroise";
    station0267.mapLocation = CGPointMake(3210, 2286.5);
    station0267.geoLocation = CGPointMake(48.861295, 2.374211);

    MWDrawFillCircle *fillCircle0320 = [[MWDrawFillCircle alloc] init];
    fillCircle0320.center = station0267.mapLocation;
    fillCircle0320.radius = 12;
    fillCircle0320.fillColor = line0011.color;
    [station0267.drawPrimitives addObject:fillCircle0320];

    MWDrawTextLine *drawTextLine0348 = [[MWDrawTextLine alloc] init];
    drawTextLine0348.text = station0267.nameOriginal;
    drawTextLine0348.fontName = @"HelveticaNeue";
    drawTextLine0348.fontColor = [UIColor blackColor];
    drawTextLine0348.fontSize = 34;
    drawTextLine0348.kernSpacing = -0.6;
    drawTextLine0348.origin = CGPointMake(3221, 2239);
    [station0267.nameOriginalTextPrimitives addObject:drawTextLine0348];
    
    // Добавляем перегон
    MWHaul *haul0258 = [[MWHaul alloc] init];
    haul0258.identifier = @"haul0258";
    haul0258.length = 581;
    [edge0111.elements addObject:haul0258];
    
    MWDrawLine *drawLine0372 = [[MWDrawLine alloc] init];
    drawLine0372.startPoint = CGPointMake(3209.5, 2286);
    drawLine0372.endPoint = CGPointMake(3293, 2367.5);
    drawLine0372.width = 11;
    drawLine0372.color = line0011.color;
    [haul0258.drawPrimitives addObject:drawLine0372];

    // Добавляем станцию Voltaire
    MWStation *station0268 = [[MWStation alloc] init];
    station0268.identifier = @"station0268";
    [edge0111.elements addObject:station0268];
    
    station0268.nameOriginal = @"Voltaire";
    station0268.mapLocation = CGPointMake(3293, 2367.5);
    station0268.geoLocation = CGPointMake(48.857803, 2.380106);

    MWDrawFillCircle *fillCircle0321 = [[MWDrawFillCircle alloc] init];
    fillCircle0321.center = station0268.mapLocation;
    fillCircle0321.radius = 12;
    fillCircle0321.fillColor = line0011.color;
    [station0268.drawPrimitives addObject:fillCircle0321];

    MWDrawTextLine *drawTextLine0349 = [[MWDrawTextLine alloc] init];
    drawTextLine0349.text = station0268.nameOriginal;
    drawTextLine0349.fontName = @"HelveticaNeue";
    drawTextLine0349.fontColor = [UIColor blackColor];
    drawTextLine0349.fontSize = 34;
    drawTextLine0349.kernSpacing = 0.6;
    drawTextLine0349.origin = CGPointMake(3303, 2332);
    [station0268.nameOriginalTextPrimitives addObject:drawTextLine0349];

    // Добавляем перегон
    MWHaul *haul0259 = [[MWHaul alloc] init];
    haul0259.identifier = @"haul0259";
    haul0259.length = 448;
    [edge0111.elements addObject:haul0259];

    MWDrawLine *drawLine0373 = [[MWDrawLine alloc] init];
    drawLine0373.startPoint = CGPointMake(3292.5, 2367);
    drawLine0373.endPoint = CGPointMake(3369.5, 2445.5);
    drawLine0373.width = 11;
    drawLine0373.color = line0011.color;
    [haul0259.drawPrimitives addObject:drawLine0373];

    // Добавляем станцию Charonne
    MWStation *station0269 = [[MWStation alloc] init];
    station0269.identifier = @"station0269";
    [edge0111.elements addObject:station0269];
    
    station0269.nameOriginal = @"Charonne";
    station0269.mapLocation = CGPointMake(3369.5, 2445.5);
    station0269.geoLocation = CGPointMake(48.855103, 2.384639);

    MWDrawFillCircle *fillCircle0322 = [[MWDrawFillCircle alloc] init];
    fillCircle0322.center = station0269.mapLocation;
    fillCircle0322.radius = 12;
    fillCircle0322.fillColor = line0011.color;
    [station0269.drawPrimitives addObject:fillCircle0322];

    MWDrawTextLine *drawTextLine0350 = [[MWDrawTextLine alloc] init];
    drawTextLine0350.text = station0269.nameOriginal;
    drawTextLine0350.fontName = @"HelveticaNeue";
    drawTextLine0350.fontColor = [UIColor blackColor];
    drawTextLine0350.fontSize = 34;
    drawTextLine0350.kernSpacing = -0.4;
    drawTextLine0350.origin = CGPointMake(3215, 2446);
    [station0269.nameOriginalTextPrimitives addObject:drawTextLine0350];

    // Добавляем перегон
    MWHaul *haul0260 = [[MWHaul alloc] init];
    haul0260.identifier = @"haul0260";
    haul0260.length = 433;
    [edge0111.elements addObject:haul0260];
    
    MWDrawLine *drawLine0374 = [[MWDrawLine alloc] init];
    drawLine0374.startPoint = CGPointMake(3369, 2445);
    drawLine0374.endPoint = CGPointMake(3447.5, 2523.5);
    drawLine0374.width = 11;
    drawLine0374.color = line0011.color;
    [haul0260.drawPrimitives addObject:drawLine0374];

    // Добавляем станцию Rue des Boulets
    MWStation *station0270 = [[MWStation alloc] init];
    station0270.identifier = @"station0270";
    [edge0111.elements addObject:station0270];
    
    station0270.nameOriginal = @"Rue des Boulets";
    station0270.mapLocation = CGPointMake(3447.5, 2523.5);
    station0270.geoLocation = CGPointMake(48.851811, 2.390151);

    MWDrawFillCircle *fillCircle0323 = [[MWDrawFillCircle alloc] init];
    fillCircle0323.center = station0270.mapLocation;
    fillCircle0323.radius = 12;
    fillCircle0323.fillColor = line0011.color;
    [station0270.drawPrimitives addObject:fillCircle0323];

    MWDrawTextLine *drawTextLine0351 = [[MWDrawTextLine alloc] init];
    drawTextLine0351.text = @"Rue";
    drawTextLine0351.fontName = @"HelveticaNeue";
    drawTextLine0351.fontColor = [UIColor blackColor];
    drawTextLine0351.fontSize = 34;
    drawTextLine0351.kernSpacing = -0.6;
    drawTextLine0351.origin = CGPointMake(3369, 2505);
    [station0270.nameOriginalTextPrimitives addObject:drawTextLine0351];

    MWDrawTextLine *drawTextLine0352 = [[MWDrawTextLine alloc] init];
    drawTextLine0352.text = @"des Boulets";
    drawTextLine0352.fontName = @"HelveticaNeue";
    drawTextLine0352.fontColor = [UIColor blackColor];
    drawTextLine0352.fontSize = 34;
    drawTextLine0352.kernSpacing = -0.6;
    drawTextLine0352.origin = CGPointMake(3254, 2538);
    [station0270.nameOriginalTextPrimitives addObject:drawTextLine0352];

    // Добавляем перегон
    MWHaul *haul0261 = [[MWHaul alloc] init];
    haul0261.identifier = @"haul0261";
    haul0261.length = 653;
    [edge0111.elements addObject:haul0261];
    
    MWDrawLine *drawLine0375 = [[MWDrawLine alloc] init];
    drawLine0375.startPoint = CGPointMake(3447, 2523);
    drawLine0375.endPoint = CGPointMake(3572, 2646);
    drawLine0375.width = 11;
    drawLine0375.color = line0011.color;
    [haul0261.drawPrimitives addObject:drawLine0375];

    // Добавляем станцию Nation
    MWStation *station0271 = [[MWStation alloc] init];
    station0271.identifier = @"station0271";
    [edge0111.elements addObject:station0271];
    
    station0271.nameOriginal = @"Nation";
    station0271.mapLocation = CGPointMake(3572, 2646);
    station0271.geoLocation = CGPointMake(48.848389, 2.3958);

    MWDrawFillCircle *fillCircle0324 = [[MWDrawFillCircle alloc] init];
    fillCircle0324.center = station0271.mapLocation;
    fillCircle0324.radius = 3;
    fillCircle0324.fillColor = [UIColor whiteColor];
    [station0271.drawPrimitives addObject:fillCircle0324];

    station0271.showNameOnMap = false;
    [station0271.drawPrimitives addObject:drawTextLine0033];
    
    // Добавляем вершину
    edge0111.finishVertex = vertex0012;
    
    // Создаем участок линии Nation - Mairie de Montreuil
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0112 = [[MWEdge alloc] init];
    edge0112.identifier = @"edge0112";
    edge0112.developmentName = @"Ребро: Nation - Mairie de Montreuil";
    [self.edges addObject:edge0112];
    
    // Добавляем линию
    edge0112.line = line0011;
    
    // Добавляем вершину
    edge0112.startVertex = vertex0012;

    // Добавляем станцию Nation
    [edge0112.elements addObject:station0271];

    // Добавляем перегон
    MWHaul *haul0262 = [[MWHaul alloc] init];
    haul0262.identifier = @"haul0262";
    haul0262.length = 575;
    [edge0112.elements addObject:haul0262];
    
    MWDrawLine *drawLine0376 = [[MWDrawLine alloc] init];
    drawLine0376.startPoint = CGPointMake(3571.5, 2645.5);
    drawLine0376.endPoint = CGPointMake(3583.5, 2657.5);
    drawLine0376.width = 11;
    drawLine0376.color = line0011.color;
    [haul0261.drawPrimitives addObject:drawLine0376];

    MWDrawArc *drawArc0110 = [[MWDrawArc alloc] init];
    drawArc0110.center = CGPointMake(3594, 2646.5);
    drawArc0110.startDegrees = 45;
    drawArc0110.endDegrees = 135;
    drawArc0110.radius = 15;
    drawArc0110.width = 11;
    drawArc0110.color = line0011.color;
    [haul0262.drawPrimitives addObject:drawArc0110];

    MWDrawLine *drawLine0377 = [[MWDrawLine alloc] init];
    drawLine0377.startPoint = CGPointMake(3604.5, 2657.5);
    drawLine0377.endPoint = CGPointMake(3684, 2578.5);
    drawLine0377.width = 11;
    drawLine0377.color = line0011.color;
    [haul0262.drawPrimitives addObject:drawLine0377];

    // Добавляем станцию Buzenval
    MWStation *station0272 = [[MWStation alloc] init];
    station0272.identifier = @"station0272";
    [edge0112.elements addObject:station0272];

    station0272.nameOriginal = @"Buzenval";
    station0272.mapLocation = CGPointMake(3684, 2578.5);
    station0272.geoLocation = CGPointMake(48.851976, 2.402045);

    MWDrawFillCircle *fillCircle0325 = [[MWDrawFillCircle alloc] init];
    fillCircle0325.center = station0272.mapLocation;
    fillCircle0325.radius = 12;
    fillCircle0325.fillColor = line0011.color;
    [station0272.drawPrimitives addObject:fillCircle0325];

    MWDrawTextLine *drawTextLine0353 = [[MWDrawTextLine alloc] init];
    drawTextLine0353.text = station0272.nameOriginal;
    drawTextLine0353.fontName = @"HelveticaNeue";
    drawTextLine0353.fontColor = [UIColor blackColor];
    drawTextLine0353.fontSize = 34;
    drawTextLine0353.kernSpacing = -0.4;
    drawTextLine0353.origin = CGPointMake(3705, 2559);
    [station0272.nameOriginalTextPrimitives addObject:drawTextLine0353];
    
    // Добавляем перегон
    MWHaul *haul0263 = [[MWHaul alloc] init];
    haul0263.identifier = @"haul0263";
    haul0263.length = 365;
    [edge0112.elements addObject:haul0263];
    
    MWDrawLine *drawLine0378 = [[MWDrawLine alloc] init];
    drawLine0378.startPoint = CGPointMake(3683.5, 2579);
    drawLine0378.endPoint = CGPointMake(3745.5, 2517.5);
    drawLine0378.width = 11;
    drawLine0378.color = line0011.color;
    [haul0263.drawPrimitives addObject:drawLine0378];

    // Добавляем станцию Maraîchers
    MWStation *station0273 = [[MWStation alloc] init];
    station0273.identifier = @"station0273";
    [edge0112.elements addObject:station0273];
    
    station0273.nameOriginal = @"Maraîchers";
    station0273.mapLocation = CGPointMake(3745.5, 2517.5);
    station0273.geoLocation = CGPointMake(48.852851, 2.40699);

    MWDrawFillCircle *fillCircle0326 = [[MWDrawFillCircle alloc] init];
    fillCircle0326.center = station0273.mapLocation;
    fillCircle0326.radius = 12;
    fillCircle0326.fillColor = line0011.color;
    [station0273.drawPrimitives addObject:fillCircle0326];

    MWDrawTextLine *drawTextLine0354 = [[MWDrawTextLine alloc] init];
    drawTextLine0354.text = station0273.nameOriginal;
    drawTextLine0354.fontName = @"HelveticaNeue";
    drawTextLine0354.fontColor = [UIColor blackColor];
    drawTextLine0354.fontSize = 34;
    drawTextLine0354.kernSpacing = -0.5;
    drawTextLine0354.origin = CGPointMake(3585, 2463);
    [station0273.nameOriginalTextPrimitives addObject:drawTextLine0354];

    // Добавляем перегон
    MWHaul *haul0264 = [[MWHaul alloc] init];
    haul0264.identifier = @"haul0264";
    haul0264.length = 367;
    [edge0112.elements addObject:haul0264];
    
    MWDrawLine *drawLine0379 = [[MWDrawLine alloc] init];
    drawLine0379.startPoint = CGPointMake(3745, 2518);
    drawLine0379.endPoint = CGPointMake(3808.5, 2454);
    drawLine0379.width = 11;
    drawLine0379.color = line0011.color;
    [haul0264.drawPrimitives addObject:drawLine0379];

    // Добавляем станцию Porte de Montreuil
    MWStation *station0274 = [[MWStation alloc] init];
    station0274.identifier = @"station0274";
    [edge0112.elements addObject:station0274];
    
    station0274.nameOriginal = @"Porte de Montreuil";
    station0274.mapLocation = CGPointMake(3808.5, 2454);
    station0274.geoLocation = CGPointMake(48.853792, 2.412245);

    MWDrawFillCircle *fillCircle0327 = [[MWDrawFillCircle alloc] init];
    fillCircle0327.center = station0274.mapLocation;
    fillCircle0327.radius = 13;
    fillCircle0327.fillColor = [UIColor blackColor];
    [station0274.drawPrimitives addObject:fillCircle0327];
    
    MWDrawFillCircle *fillCircle0328 = [[MWDrawFillCircle alloc] init];
    fillCircle0328.center = station0274.mapLocation;
    fillCircle0328.radius = 11;
    fillCircle0328.fillColor = [UIColor whiteColor];
    [station0274.drawPrimitives addObject:fillCircle0328];

    MWDrawTextLine *drawTextLine0355 = [[MWDrawTextLine alloc] init];
    drawTextLine0355.text = station0274.nameOriginal;
    drawTextLine0355.fontName = @"HelveticaNeue";
    drawTextLine0355.fontColor = [UIColor blackColor];
    drawTextLine0355.fontSize = 34;
    drawTextLine0355.kernSpacing = 0.2;
    drawTextLine0355.origin = CGPointMake(3828, 2459);
    [station0274.nameOriginalTextPrimitives addObject:drawTextLine0355];

    // Добавляем перегон
    MWHaul *haul0265 = [[MWHaul alloc] init];
    haul0265.identifier = @"haul0265";
    haul0265.length = 952;
    [edge0112.elements addObject:haul0265];
    
    MWDrawLine *drawLine0380 = [[MWDrawLine alloc] init];
    drawLine0380.startPoint = CGPointMake(3808, 2454.5);
    drawLine0380.endPoint = CGPointMake(3867.5, 2395.5);
    drawLine0380.width = 11;
    drawLine0380.color = line0011.color;
    [haul0265.drawPrimitives addObject:drawLine0380];

    // Добавляем станцию Robespierre
    MWStation *station0275 = [[MWStation alloc] init];
    station0275.identifier = @"station0275";
    [edge0112.elements addObject:station0275];
    
    station0275.nameOriginal = @"Robespierre";
    station0275.mapLocation = CGPointMake(3867.5, 2395.5);
    station0275.geoLocation = CGPointMake(48.855683, 2.423678);

    MWDrawFillCircle *fillCircle0329 = [[MWDrawFillCircle alloc] init];
    fillCircle0329.center = station0275.mapLocation;
    fillCircle0329.radius = 12;
    fillCircle0329.fillColor = line0011.color;
    [station0275.drawPrimitives addObject:fillCircle0329];

    MWDrawTextLine *drawTextLine0356 = [[MWDrawTextLine alloc] init];
    drawTextLine0356.text = station0275.nameOriginal;
    drawTextLine0356.fontName = @"HelveticaNeue";
    drawTextLine0356.fontColor = [UIColor blackColor];
    drawTextLine0356.fontSize = 34;
    drawTextLine0356.kernSpacing = -0.6;
    drawTextLine0356.origin = CGPointMake(3878, 2398);
    [station0275.nameOriginalTextPrimitives addObject:drawTextLine0356];

    // Добавляем перегон
    MWHaul *haul0266 = [[MWHaul alloc] init];
    haul0266.identifier = @"haul0266";
    haul0266.length = 940;
    [edge0112.elements addObject:haul0266];
    
    MWDrawLine *drawLine0381 = [[MWDrawLine alloc] init];
    drawLine0381.startPoint = CGPointMake(3867, 2396);
    drawLine0381.endPoint = CGPointMake(3929, 2334);
    drawLine0381.width = 11;
    drawLine0381.color = line0011.color;
    [haul0266.drawPrimitives addObject:drawLine0381];

    // Добавляем станцию Croix de Chavaux
    MWStation *station0276 = [[MWStation alloc] init];
    station0276.identifier = @"station0276";
    [edge0112.elements addObject:station0276];
    
    station0276.nameOriginal = @"Croix de Chavaux";
    station0276.mapLocation = CGPointMake(3929, 2334);
    station0276.geoLocation = CGPointMake(48.858055, 2.435764);
    
    MWDrawFillCircle *fillCircle0330 = [[MWDrawFillCircle alloc] init];
    fillCircle0330.center = station0276.mapLocation;
    fillCircle0330.radius = 12;
    fillCircle0330.fillColor = line0011.color;
    [station0276.drawPrimitives addObject:fillCircle0330];

    MWDrawTextLine *drawTextLine0357 = [[MWDrawTextLine alloc] init];
    drawTextLine0357.text = station0276.nameOriginal;
    drawTextLine0357.fontName = @"HelveticaNeue";
    drawTextLine0357.fontColor = [UIColor blackColor];
    drawTextLine0357.fontSize = 34;
    drawTextLine0357.kernSpacing = -0.8;
    drawTextLine0357.origin = CGPointMake(3940, 2337);
    [station0276.nameOriginalTextPrimitives addObject:drawTextLine0357];

    // Добавляем перегон
    MWHaul *haul0267 = [[MWHaul alloc] init];
    haul0267.identifier = @"haul0267";
    haul0267.length = 673;
    [edge0112.elements addObject:haul0267];
    
    MWDrawLine *drawLine0382 = [[MWDrawLine alloc] init];
    drawLine0382.startPoint = CGPointMake(3928.5, 2334.5);
    drawLine0382.endPoint = CGPointMake(3991.5, 2271.5);
    drawLine0382.width = 11;
    drawLine0382.color = line0011.color;
    [haul0267.drawPrimitives addObject:drawLine0382];

    // Добавляем станцию Mairie de Montreuil
    MWStation *station0277 = [[MWStation alloc] init];
    station0277.identifier = @"station02577";
    [edge0112.elements addObject:station0277];
    
    station0277.nameOriginal = @"Mairie de Montreuil";
    station0277.mapLocation = CGPointMake(3991.5, 2271.5);
    station0277.geoLocation = CGPointMake(48.862283, 2.441847);

    MWDrawFillCircle *fillCircle0331 = [[MWDrawFillCircle alloc] init];
    fillCircle0331.center = station0277.mapLocation;
    fillCircle0331.radius = 12;
    fillCircle0331.fillColor = [UIColor blackColor];
    [station0277.drawPrimitives addObject:fillCircle0331];

    MWDrawFillCircle *fillCircle0332 = [[MWDrawFillCircle alloc] init];
    fillCircle0332.center = CGPointMake(4023.5, 2239);
    fillCircle0332.radius = 28;
    fillCircle0332.fillColor = line0011.color;
    [station0277.drawPrimitives addObject:fillCircle0332];
    
    MWDrawTextLine *drawTextLine0358 = [[MWDrawTextLine alloc] init];
    drawTextLine0358.text = @"9";
    drawTextLine0358.fontName = @"HelveticaNeue-Bold";
    drawTextLine0358.fontColor = [UIColor blackColor];
    drawTextLine0358.fontSize = 44;
    drawTextLine0358.origin = CGPointMake(4012, 2211);
    [station0277.drawPrimitives addObject:drawTextLine0358];

    MWDrawTextLine *drawTextLine0359 = [[MWDrawTextLine alloc] init];
    drawTextLine0359.text = @"Mairie";
    drawTextLine0359.fontName = @"Helvetica-Bold";
    drawTextLine0359.fontColor = [UIColor blackColor];
    drawTextLine0359.fontSize = 30;
    drawTextLine0359.kernSpacing = 2.8;
    drawTextLine0359.origin = CGPointMake(4058, 2206);
    [station0277.drawPrimitives addObject:drawTextLine0359];

    MWDrawTextLine *drawTextLine0360 = [[MWDrawTextLine alloc] init];
    drawTextLine0360.text = @"de Montreuil";
    drawTextLine0360.fontName = @"Helvetica-Bold";
    drawTextLine0360.fontColor = [UIColor blackColor];
    drawTextLine0360.fontSize = 30;
    drawTextLine0360.kernSpacing = 2.0;
    drawTextLine0360.origin = CGPointMake(4058, 2239);
    [station0277.drawPrimitives addObject:drawTextLine0360];

    // Добавляем вершину
    edge0112.finishVertex = vertex0074;

    ////////////////////////////////////////////////////////////////
    // Line 10
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Boulogne – Pont de Saint-Cloud	- Boulogne – Jean Jaurès
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0113 = [[MWEdge alloc] init];
    edge0113.identifier = @"edge0113";
    edge0113.developmentName = @"Ребро: Boulogne – Pont de Saint-Cloud - Boulogne – Jean Jaurès";
    [self.edges addObject:edge0113];
    
    // Добавляем линию
    edge0113.line = line0012;
    
    // Добавляем вершину
    edge0113.startVertex = vertex0075;
    
    // Добавляем станцию Boulogne – Pont de Saint-Cloud
    MWStation *station0278 = [[MWStation alloc] init];
    station0278.identifier = @"station0278";
    [edge0113.elements addObject:station0278];
    
    station0278.nameOriginal = @"Boulogne – Pont de Saint-Cloud";
    station0278.mapLocation = CGPointMake(319, 3290.5);
    station0278.geoLocation = CGPointMake(48.840684, 2.228331);
    
    MWDrawFillCircle *fillCircle0333 = [[MWDrawFillCircle alloc] init];
    fillCircle0333.center = CGPointMake(283, 3342.5);
    fillCircle0333.radius = 28;
    fillCircle0333.fillColor = line0012.color;
    [station0278.drawPrimitives addObject:fillCircle0333];
    
    MWDrawTextLine *drawTextLine0361 = [[MWDrawTextLine alloc] init];
    drawTextLine0361.text = @"10";
    drawTextLine0361.fontName = @"HelveticaNeue-Bold";
    drawTextLine0361.fontColor = [UIColor blackColor];
    drawTextLine0361.fontSize = 44;
    drawTextLine0361.origin = CGPointMake(258, 3314.5);
    [station0278.drawPrimitives addObject:drawTextLine0361];

    MWDrawTextLine *drawTextLine0362 = [[MWDrawTextLine alloc] init];
    drawTextLine0362.text = @"Boulogne";
    drawTextLine0362.fontName = @"Helvetica-Bold";
    drawTextLine0362.fontColor = [UIColor blackColor];
    drawTextLine0362.fontSize = 30;
    drawTextLine0362.kernSpacing = 1.2;
    drawTextLine0362.origin = CGPointMake(317, 3310);
    [station0278.drawPrimitives addObject:drawTextLine0362];

    MWDrawTextLine *drawTextLine0363 = [[MWDrawTextLine alloc] init];
    drawTextLine0363.text = @"Pont de St-Cloud";
    drawTextLine0363.fontName = @"Helvetica-Bold";
    drawTextLine0363.fontColor = [UIColor blackColor];
    drawTextLine0363.fontSize = 30;
    drawTextLine0363.kernSpacing = 1.0;
    drawTextLine0363.origin = CGPointMake(317, 3343);
    [station0278.drawPrimitives addObject:drawTextLine0363];

    MWDrawFillCircle *fillCircle0334 = [[MWDrawFillCircle alloc] init];
    fillCircle0334.center = station0278.mapLocation;
    fillCircle0334.radius = 13;
    fillCircle0334.fillColor = [UIColor blackColor];
    [station0278.drawPrimitives addObject:fillCircle0334];
    
    MWDrawFillCircle *fillCircle0335 = [[MWDrawFillCircle alloc] init];
    fillCircle0335.center = station0278.mapLocation;
    fillCircle0335.radius = 11;
    fillCircle0335.fillColor = [UIColor whiteColor];
    [station0278.drawPrimitives addObject:fillCircle0335];

    // Добавляем перегон
    MWHaul *haul0268 = [[MWHaul alloc] init];
    haul0268.identifier = @"haul0268";
    haul0268.length = 776;
    [edge0113.elements addObject:haul0268];
    
    MWDrawLine *drawLine0383 = [[MWDrawLine alloc] init];
    drawLine0383.startPoint = CGPointMake(319, 3290.5);
    drawLine0383.endPoint = CGPointMake(399.5, 3210);
    drawLine0383.width = 11;
    drawLine0383.color = line0012.color;
    [haul0268.drawPrimitives addObject:drawLine0383];

    // Добавляем станцию Boulogne – Jean Jaurès
    MWStation *station0279 = [[MWStation alloc] init];
    station0279.identifier = @"station0279";
    [edge0113.elements addObject:station0279];

    station0279.nameOriginal = @"Boulogne – Jean Jaurès";
    station0279.mapLocation = CGPointMake(399.5, 3210);
    station0279.geoLocation = CGPointMake(48.842278, 2.238877);
    
    MWDrawFillCircle *fillCircle0687 = [[MWDrawFillCircle alloc] init];
    fillCircle0687.center = station0279.mapLocation;
    fillCircle0687.radius = 3;
    fillCircle0687.fillColor = [UIColor whiteColor];
    [station0279.drawPrimitives addObject:fillCircle0687];

    MWDrawTextLine *drawTextLine0364 = [[MWDrawTextLine alloc] init];
    drawTextLine0364.text = @"Boulogne";
    drawTextLine0364.fontName = @"HelveticaNeue";
    drawTextLine0364.fontColor = [UIColor blackColor];
    drawTextLine0364.fontSize = 34;
    drawTextLine0364.kernSpacing = -0.6;
    drawTextLine0364.origin = CGPointMake(249, 3130);
    [station0279.drawPrimitives addObject:drawTextLine0364];

    MWDrawTextLine *drawTextLine0365 = [[MWDrawTextLine alloc] init];
    drawTextLine0365.text = @"Jean Jaurès";
    drawTextLine0365.fontName = @"HelveticaNeue";
    drawTextLine0365.fontColor = [UIColor blackColor];
    drawTextLine0365.fontSize = 34;
    drawTextLine0365.kernSpacing = -1.0;
    drawTextLine0365.origin = CGPointMake(216, 3163);
    [station0279.drawPrimitives addObject:drawTextLine0365];

    // Добавляем вершину
    edge0113.finishVertex = vertex0087;

    // Создаем участок линии Boulogne – Jean Jaurès - Michel-Ange – Molitor
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0114 = [[MWEdge alloc] init];
    edge0114.identifier = @"edge0114";
    edge0114.developmentName = @"Ребро: Boulogne – Jean Jaurès - Michel-Ange – Molitor";
    [self.edges addObject:edge0114];
    
    edge0114.directionFromStation = station0279;
    
    // Добавляем линию
    edge0114.line = line0012;
    
    // Добавляем вершину
    edge0114.startVertex = vertex0087;

    // Добавляем станцию Boulogne – Jean Jaurès
    [edge0114.elements addObject:station0279];

    // Добавляем перегон
    MWHaul *haul0269 = [[MWHaul alloc] init];
    haul0269.identifier = @"haul0269";
    haul0269.length = 1749;
    [edge0114.elements addObject:haul0269];
    
    MWDrawLine *drawLine0384 = [[MWDrawLine alloc] init];
    drawLine0384.startPoint = CGPointMake(399, 3210.5);
    drawLine0384.endPoint = CGPointMake(421.5, 3188);
    drawLine0384.width = 11;
    drawLine0384.color = line0012.color;
    [haul0269.drawPrimitives addObject:drawLine0384];

    MWDrawArc *drawArc0111 = [[MWDrawArc alloc] init];
    drawArc0111.center = CGPointMake(442.5, 3209.5);
    drawArc0111.startDegrees = 225;
    drawArc0111.endDegrees = 270;
    drawArc0111.radius = 30;
    drawArc0111.width = 11;
    drawArc0111.color = line0012.color;
    [haul0269.drawPrimitives addObject:drawArc0111];
    
    MWDrawLine *drawLine0385 = [[MWDrawLine alloc] init];
    drawLine0385.startPoint = CGPointMake(442, 3179.5);
    drawLine0385.endPoint = CGPointMake(608, 3179.5);
    drawLine0385.width = 11;
    drawLine0385.color = line0012.color;
    [haul0269.drawPrimitives addObject:drawLine0385];

    MWDrawFillCircle *fillCircle0338 = [[MWDrawFillCircle alloc] init];
    fillCircle0338.center = CGPointMake(500, 3162.5);
    fillCircle0338.radius = 2.5;
    fillCircle0338.fillColor = line0012.color;
    [haul0269.drawPrimitives addObject:fillCircle0338];

    MWDrawLine *drawLine0386 = [[MWDrawLine alloc] init];
    drawLine0386.startPoint = CGPointMake(500, 3162.5);
    drawLine0386.endPoint = CGPointMake(532, 3162.5);
    drawLine0386.width = 5;
    drawLine0386.color = line0012.color;
    [haul0269.drawPrimitives addObject:drawLine0386];

    MWDrawFillCircle *fillCircle0339 = [[MWDrawFillCircle alloc] init];
    fillCircle0339.center = CGPointMake(532, 3162.5);
    fillCircle0339.radius = 2.5;
    fillCircle0339.fillColor = line0012.color;
    [haul0269.drawPrimitives addObject:fillCircle0339];

    MWDrawLine *drawLine0387 = [[MWDrawLine alloc] init];
    drawLine0387.startPoint = CGPointMake(532, 3162.5);
    drawLine0387.endPoint = CGPointMake(516.5, 3147.5);
    drawLine0387.width = 5;
    drawLine0387.color = line0012.color;
    [haul0269.drawPrimitives addObject:drawLine0387];

    MWDrawFillCircle *fillCircle0340 = [[MWDrawFillCircle alloc] init];
    fillCircle0340.center = CGPointMake(516.5, 3147.5);
    fillCircle0340.radius = 2.5;
    fillCircle0340.fillColor = line0012.color;
    [haul0269.drawPrimitives addObject:fillCircle0340];

    // Добавляем станцию Michel-Ange – Molitor
    MWStation *station0280 = [[MWStation alloc] init];
    station0280.identifier = @"station0280";
    [edge0114.elements addObject:station0280];
    
    station0280.nameOriginal = @"Michel-Ange – Molitor";
    station0280.mapLocation = CGPointMake(608, 3179.5);
    station0280.geoLocation = CGPointMake(48.84496, 2.261194);

    MWDrawFillCircle *fillCircle0341 = [[MWDrawFillCircle alloc] init];
    fillCircle0341.center = station0280.mapLocation;
    fillCircle0341.radius = 3;
    fillCircle0341.fillColor = [UIColor whiteColor];
    [station0280.drawPrimitives addObject:fillCircle0341];

    station0280.showNameOnMap = false;
    [station0280.nameOriginalTextPrimitives addObject:drawTextLine0330];
    [station0280.nameOriginalTextPrimitives addObject:drawTextLine0331];
    [station0280.nameOriginalTextPrimitives addObject:drawTextLine0332];
    
    // Добавляем вершину
    edge0114.finishVertex = vertex0070;

    // Создаем участок линии Michel-Ange – Molitor - Javel – André Citroën
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0115 = [[MWEdge alloc] init];
    edge0115.identifier = @"edge0115";
    edge0115.developmentName = @"Ребро: Michel-Ange – Molitor - Javel – André Citroën";
    [self.edges addObject:edge0115];
    
    edge0115.directionFromStation = station0280;
    
    // Добавляем линию
    edge0115.line = line0012;
    
    // Добавляем вершину
    edge0115.startVertex = vertex0070;

    // Добавляем станцию Michel-Ange – Molitor
    [edge0115.elements addObject:station0280];

    // Добавляем перегон
    MWHaul *haul0270 = [[MWHaul alloc] init];
    haul0270.identifier = @"haul0270";
    haul0270.length = 321;
    [edge0115.elements addObject:haul0270];

    MWDrawLine *drawLine0388 = [[MWDrawLine alloc] init];
    drawLine0388.startPoint = CGPointMake(607.5, 3179.5);
    drawLine0388.endPoint = CGPointMake(683, 3179.5);
    drawLine0388.width = 11;
    drawLine0388.color = line0012.color;
    [haul0270.drawPrimitives addObject:drawLine0388];

    // Добавляем станцию Chardon Lagache
    MWStation *station0281 = [[MWStation alloc] init];
    station0281.identifier = @"station0281";
    [edge0115.elements addObject:station0281];
    
    station0281.nameOriginal = @"Chardon Lagache";
    station0281.mapLocation = CGPointMake(683, 3179.5);
    station0281.geoLocation = CGPointMake(48.845138, 2.266214);

    MWDrawFillCircle *fillCircle0342 = [[MWDrawFillCircle alloc] init];
    fillCircle0342.center = station0281.mapLocation;
    fillCircle0342.radius = 12;
    fillCircle0342.fillColor = line0012.color;
    [station0281.drawPrimitives addObject:fillCircle0342];

    MWDrawTextLine *drawTextLine0366 = [[MWDrawTextLine alloc] init];
    drawTextLine0366.text = @"Chardon";
    drawTextLine0366.fontName = @"HelveticaNeue";
    drawTextLine0366.fontColor = [UIColor blackColor];
    drawTextLine0366.fontSize = 34;
    drawTextLine0366.kernSpacing = -0.8;
    drawTextLine0366.origin = CGPointMake(672, 3191);
    [station0281.drawPrimitives addObject:drawTextLine0366];
    
    MWDrawTextLine *drawTextLine0367 = [[MWDrawTextLine alloc] init];
    drawTextLine0367.text = @"Lagache";
    drawTextLine0367.fontName = @"HelveticaNeue";
    drawTextLine0367.fontColor = [UIColor blackColor];
    drawTextLine0367.fontSize = 34;
    drawTextLine0367.kernSpacing = -1.2;
    drawTextLine0367.origin = CGPointMake(672, 3224);
    [station0281.drawPrimitives addObject:drawTextLine0367];

    // Добавляем перегон
    MWHaul *haul0271 = [[MWHaul alloc] init];
    haul0271.identifier = @"haul0271";
    haul0271.length = 513;
    [edge0115.elements addObject:haul0271];
    
    MWDrawLine *drawLine0389 = [[MWDrawLine alloc] init];
    drawLine0389.startPoint = CGPointMake(682.5, 3179.5);
    drawLine0389.endPoint = CGPointMake(740, 3179.5);
    drawLine0389.width = 11;
    drawLine0389.color = line0012.color;
    [haul0271.drawPrimitives addObject:drawLine0389];

    MWDrawArc *drawArc0112 = [[MWDrawArc alloc] init];
    drawArc0112.center = CGPointMake(739.5, 3149.5);
    drawArc0112.startDegrees = 45;
    drawArc0112.endDegrees = 90;
    drawArc0112.radius = 30;
    drawArc0112.width = 11;
    drawArc0112.color = line0012.color;
    [haul0271.drawPrimitives addObject:drawArc0112];

    MWDrawLine *drawLine0390 = [[MWDrawLine alloc] init];
    drawLine0390.startPoint = CGPointMake(760, 3171.5);
    drawLine0390.endPoint = CGPointMake(794, 3137.5);
    drawLine0390.width = 11;
    drawLine0390.color = line0012.color;
    [haul0271.drawPrimitives addObject:drawLine0390];

    MWDrawFillCircle *fillCircle0343 = [[MWDrawFillCircle alloc] init];
    fillCircle0343.center = CGPointMake(710.5, 3162.5);
    fillCircle0343.radius = 2.5;
    fillCircle0343.fillColor = line0012.color;
    [haul0271.drawPrimitives addObject:fillCircle0343];

    MWDrawLine *drawLine0391 = [[MWDrawLine alloc] init];
    drawLine0391.startPoint = CGPointMake(710.5, 3162.5);
    drawLine0391.endPoint = CGPointMake(742.5, 3162.5);
    drawLine0391.width = 5;
    drawLine0391.color = line0012.color;
    [haul0271.drawPrimitives addObject:drawLine0391];

    MWDrawFillCircle *fillCircle0344 = [[MWDrawFillCircle alloc] init];
    fillCircle0344.center = CGPointMake(742.5, 3162.5);
    fillCircle0344.radius = 2.5;
    fillCircle0344.fillColor = line0012.color;
    [haul0271.drawPrimitives addObject:fillCircle0344];

    MWDrawLine *drawLine0392 = [[MWDrawLine alloc] init];
    drawLine0392.startPoint = CGPointMake(742.5, 3162.5);
    drawLine0392.endPoint = CGPointMake(727, 3147.5);
    drawLine0392.width = 5;
    drawLine0392.color = line0012.color;
    [haul0271.drawPrimitives addObject:drawLine0392];

    MWDrawFillCircle *fillCircle0345 = [[MWDrawFillCircle alloc] init];
    fillCircle0345.center = CGPointMake(727, 3147.5);
    fillCircle0345.radius = 2.5;
    fillCircle0345.fillColor = line0012.color;
    [haul0271.drawPrimitives addObject:fillCircle0345];

    // Добавляем станцию Mirabeau
    MWStation *station0282 = [[MWStation alloc] init];
    station0282.identifier = @"station0282";
    [edge0115.elements addObject:station0282];
    
    station0282.nameOriginal = @"Mirabeau";
    station0282.mapLocation = CGPointMake(794, 3137.5);
    station0282.geoLocation = CGPointMake(48.84674, 2.27171);

    MWDrawFillCircle *fillCircle0346 = [[MWDrawFillCircle alloc] init];
    fillCircle0346.center = station0282.mapLocation;
    fillCircle0346.radius = 12;
    fillCircle0346.fillColor = line0012.color;
    [station0282.drawPrimitives addObject:fillCircle0346];
    
    MWDrawTextLine *drawTextLine0368 = [[MWDrawTextLine alloc] init];
    drawTextLine0368.text = station0282.nameOriginal;
    drawTextLine0368.fontName = @"HelveticaNeue";
    drawTextLine0368.fontColor = [UIColor blackColor];
    drawTextLine0368.fontSize = 34;
    drawTextLine0368.kernSpacing = -0.4;
    drawTextLine0368.origin = CGPointMake(642, 3090);
    [station0282.drawPrimitives addObject:drawTextLine0368];

    // Добавляем перегон
    MWHaul *haul0272 = [[MWHaul alloc] init];
    haul0272.identifier = @"haul0272";
    haul0272.length = 487;
    [edge0115.elements addObject:haul0272];
    
    MWDrawLine *drawLine0393 = [[MWDrawLine alloc] init];
    drawLine0393.startPoint = CGPointMake(793.5, 3138);
    drawLine0393.endPoint = CGPointMake(860.5, 3071);
    drawLine0393.width = 11;
    drawLine0393.color = line0012.color;
    [haul0272.drawPrimitives addObject:drawLine0393];

    MWDrawArc *drawArc0113 = [[MWDrawArc alloc] init];
    drawArc0113.center = CGPointMake(881, 3093);
    drawArc0113.startDegrees = 225;
    drawArc0113.endDegrees = 270;
    drawArc0113.radius = 30;
    drawArc0113.width = 11;
    drawArc0113.color = line0012.color;
    [haul0272.drawPrimitives addObject:drawArc0113];

    MWDrawLine *drawLine0394 = [[MWDrawLine alloc] init];
    drawLine0394.startPoint = CGPointMake(881, 3063);
    drawLine0394.endPoint = CGPointMake(930, 3063);
    drawLine0394.width = 11;
    drawLine0394.color = line0012.color;
    [haul0272.drawPrimitives addObject:drawLine0394];

    // Добавляем станцию Javel – André Citroën
    MWStation *station0283 = [[MWStation alloc] init];
    station0283.identifier = @"station0283";
    [edge0115.elements addObject:station0283];
    
    station0283.nameOriginal = @"Javel – André Citroën";
    station0283.mapLocation = CGPointMake(930, 3063);
    station0283.geoLocation = CGPointMake(48.846165, 2.278716);

    MWDrawFillCircle *fillCircle0688 = [[MWDrawFillCircle alloc] init];
    fillCircle0688.center = station0283.mapLocation;
    fillCircle0688.radius = 3;
    fillCircle0688.fillColor = [UIColor whiteColor];
    [station0283.drawPrimitives addObject:fillCircle0688];

    MWDrawTextLine *drawTextLine0369 = [[MWDrawTextLine alloc] init];
    drawTextLine0369.text = @"Javel";
    drawTextLine0369.fontName = @"HelveticaNeue";
    drawTextLine0369.fontColor = [UIColor blackColor];
    drawTextLine0369.fontSize = 34;
    drawTextLine0369.kernSpacing = -0.4;
    drawTextLine0369.origin = CGPointMake(916, 3074);
    [station0283.drawPrimitives addObject:drawTextLine0369];

    MWDrawTextLine *drawTextLine0370 = [[MWDrawTextLine alloc] init];
    drawTextLine0370.text = @"André";
    drawTextLine0370.fontName = @"HelveticaNeue";
    drawTextLine0370.fontColor = [UIColor blackColor];
    drawTextLine0370.fontSize = 34;
    drawTextLine0370.kernSpacing = -0.4;
    drawTextLine0370.origin = CGPointMake(922, 3107);
    [station0283.drawPrimitives addObject:drawTextLine0370];
    
    MWDrawTextLine *drawTextLine0371 = [[MWDrawTextLine alloc] init];
    drawTextLine0371.text = @"Citroën";
    drawTextLine0371.fontName = @"HelveticaNeue";
    drawTextLine0371.fontColor = [UIColor blackColor];
    drawTextLine0371.fontSize = 34;
    drawTextLine0371.kernSpacing = -0.2;
    drawTextLine0371.origin = CGPointMake(922, 3141);
    [station0283.drawPrimitives addObject:drawTextLine0371];

    // Добавляем вершину
    edge0115.finishVertex = vertex0088;

    // Создаем участок линии Javel – André Citroën - Michel-Ange – Auteuil
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0116 = [[MWEdge alloc] init];
    edge0116.identifier = @"edge0116";
    edge0116.developmentName = @"Ребро: Javel – André Citroën - Michel-Ange – Auteuil";
    [self.edges addObject:edge0116];
    
    edge0116.directionFromStation = station0283;
    
    // Добавляем линию
    edge0116.line = line0012;
    
    // Добавляем вершину
    edge0116.startVertex = vertex0088;

    // Добавляем станцию Javel – André Citroën
    [edge0116.elements addObject:station0283];

    // Добавляем перегон
    MWHaul *haul0273 = [[MWHaul alloc] init];
    haul0273.identifier = @"haul0273";
    haul0273.length = 492;
    [edge0116.elements addObject:haul0273];

    MWDrawLine *drawLine0395 = [[MWDrawLine alloc] init];
    drawLine0395.startPoint = CGPointMake(930.5, 3063);
    drawLine0395.endPoint = CGPointMake(741.5, 3063);
    drawLine0395.width = 11;
    drawLine0395.color = line0012.color;
    [haul0273.drawPrimitives addObject:drawLine0395];

    MWDrawFillCircle *fillCircle0349 = [[MWDrawFillCircle alloc] init];
    fillCircle0349.center = CGPointMake(819.5, 3079);
    fillCircle0349.radius = 2.5;
    fillCircle0349.fillColor = line0012.color;
    [haul0273.drawPrimitives addObject:fillCircle0349];

    MWDrawLine *drawLine0396 = [[MWDrawLine alloc] init];
    drawLine0396.startPoint = CGPointMake(819.5, 3079);
    drawLine0396.endPoint = CGPointMake(787.5, 3079);
    drawLine0396.width = 5;
    drawLine0396.color = line0012.color;
    [haul0273.drawPrimitives addObject:drawLine0396];

    MWDrawFillCircle *fillCircle0350 = [[MWDrawFillCircle alloc] init];
    fillCircle0350.center = CGPointMake(787.5, 3079);
    fillCircle0350.radius = 2.5;
    fillCircle0350.fillColor = line0012.color;
    [haul0273.drawPrimitives addObject:fillCircle0350];

    MWDrawLine *drawLine0397 = [[MWDrawLine alloc] init];
    drawLine0397.startPoint = CGPointMake(787.5, 3079);
    drawLine0397.endPoint = CGPointMake(803.5, 3094.5);
    drawLine0397.width = 5;
    drawLine0397.color = line0012.color;
    [haul0273.drawPrimitives addObject:drawLine0397];

    MWDrawFillCircle *fillCircle0351 = [[MWDrawFillCircle alloc] init];
    fillCircle0351.center = CGPointMake(803.5, 3094.5);
    fillCircle0351.radius = 2.5;
    fillCircle0351.fillColor = line0012.color;
    [haul0273.drawPrimitives addObject:fillCircle0351];

    // Добавляем станцию Église d'Auteuil
    MWStation *station0284 = [[MWStation alloc] init];
    station0284.identifier = @"station0284";
    [edge0116.elements addObject:station0284];
    
    station0284.nameOriginal = @"Église d'Auteuil";
    station0284.mapLocation = CGPointMake(741.5, 3063);
    station0284.geoLocation = CGPointMake(48.847169, 2.26902);

    MWDrawFillCircle *fillCircle0352 = [[MWDrawFillCircle alloc] init];
    fillCircle0352.center = station0284.mapLocation;
    fillCircle0352.radius = 12;
    fillCircle0352.fillColor = line0012.color;
    [station0284.drawPrimitives addObject:fillCircle0352];

    MWDrawTextLine *drawTextLine0372 = [[MWDrawTextLine alloc] init];
    drawTextLine0372.text = @"Église";
    drawTextLine0372.fontName = @"HelveticaNeue";
    drawTextLine0372.fontColor = [UIColor blackColor];
    drawTextLine0372.fontSize = 34;
    drawTextLine0372.kernSpacing = -0.8;
    drawTextLine0372.origin = CGPointMake(699, 2973);
    [station0284.drawPrimitives addObject:drawTextLine0372];

    MWDrawTextLine *drawTextLine0373 = [[MWDrawTextLine alloc] init];
    drawTextLine0373.text = @"d'Auteuil";
    drawTextLine0373.fontName = @"HelveticaNeue";
    drawTextLine0373.fontColor = [UIColor blackColor];
    drawTextLine0373.fontSize = 34;
    drawTextLine0373.kernSpacing = -0.0;
    drawTextLine0373.origin = CGPointMake(675, 3007);
    [station0284.drawPrimitives addObject:drawTextLine0373];

    // Добавляем перегон
    MWHaul *haul0274 = [[MWHaul alloc] init];
    haul0274.identifier = @"haul0274";
    haul0274.length = 255;
    [edge0116.elements addObject:haul0274];
    
    MWDrawLine *drawLine0398 = [[MWDrawLine alloc] init];
    drawLine0398.startPoint = CGPointMake(741.5, 3063);
    drawLine0398.endPoint = CGPointMake(608, 3063);
    drawLine0398.width = 11;
    drawLine0398.color = line0012.color;
    [haul0274.drawPrimitives addObject:drawLine0398];

    // Добавляем станцию Michel-Ange – Auteuil
    MWStation *station0285 = [[MWStation alloc] init];
    station0285.identifier = @"station0285";
    [edge0116.elements addObject:station0285];
    
    station0285.nameOriginal = @"Michel-Ange – Auteuil";
    station0285.mapLocation = CGPointMake(608, 3063);
    station0285.geoLocation = CGPointMake(48.8475, 2.263611);

    MWDrawFillCircle *fillCircle0353 = [[MWDrawFillCircle alloc] init];
    fillCircle0353.center = station0285.mapLocation;
    fillCircle0353.radius = 3;
    fillCircle0353.fillColor = [UIColor whiteColor];
    [station0285.drawPrimitives addObject:fillCircle0353];

    station0285.showNameOnMap = false;
    [station0285.nameOriginalTextPrimitives addObject:drawTextLine0333];
    [station0285.nameOriginalTextPrimitives addObject:drawTextLine0334];
    [station0285.nameOriginalTextPrimitives addObject:drawTextLine0335];
    
    // Добавляем вершину
    edge0116.finishVertex = vertex0071;
    
    // Создаем участок линии Michel-Ange – Auteuil - Boulogne – Jean Jaurès
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0117 = [[MWEdge alloc] init];
    edge0117.identifier = @"edge0117";
    edge0117.developmentName = @"Ребро: Michel-Ange – Auteuil - Boulogne – Jean Jaurès";
    [self.edges addObject:edge0117];
    
    edge0117.directionFromStation = station0285;
    
    // Добавляем линию
    edge0117.line = line0012;
    
    // Добавляем вершину
    edge0117.startVertex = vertex0071;

    // Добавляем станцию Michel-Ange – Auteuil
    [edge0117.elements addObject:station0285];

    // Добавляем перегон
    MWHaul *haul0275 = [[MWHaul alloc] init];
    haul0275.identifier = @"haul0275";
    haul0275.length = 366;
    [edge0117.elements addObject:haul0275];

    MWDrawLine *drawLine0399 = [[MWDrawLine alloc] init];
    drawLine0399.startPoint = CGPointMake(608.5, 3063);
    drawLine0399.endPoint = CGPointMake(558, 3063);
    drawLine0399.width = 11;
    drawLine0399.color = line0012.color;
    [haul0275.drawPrimitives addObject:drawLine0399];

    MWDrawArc *drawArc0114 = [[MWDrawArc alloc] init];
    drawArc0114.center = CGPointMake(558.5, 3093);
    drawArc0114.startDegrees = 225;
    drawArc0114.endDegrees = 270;
    drawArc0114.radius = 30;
    drawArc0114.width = 11;
    drawArc0114.color = line0012.color;
    [haul0275.drawPrimitives addObject:drawArc0114];

    MWDrawLine *drawLine0400 = [[MWDrawLine alloc] init];
    drawLine0400.startPoint = CGPointMake(537.5, 3071.5);
    drawLine0400.endPoint = CGPointMake(480, 3129);
    drawLine0400.width = 11;
    drawLine0400.color = line0012.color;
    [haul0275.drawPrimitives addObject:drawLine0400];

    MWDrawFillCircle *fillCircle0354 = [[MWDrawFillCircle alloc] init];
    fillCircle0354.center = CGPointMake(557.5, 3079.5);
    fillCircle0354.radius = 2.5;
    fillCircle0354.fillColor = line0012.color;
    [haul0275.drawPrimitives addObject:fillCircle0354];

    MWDrawLine *drawLine0401 = [[MWDrawLine alloc] init];
    drawLine0401.startPoint = CGPointMake(557.5, 3079.5);
    drawLine0401.endPoint = CGPointMake(535.5, 3101.5);
    drawLine0401.width = 5;
    drawLine0401.color = line0012.color;
    [haul0275.drawPrimitives addObject:drawLine0401];

    MWDrawFillCircle *fillCircle0355 = [[MWDrawFillCircle alloc] init];
    fillCircle0355.center = CGPointMake(535.5, 3101.5);
    fillCircle0355.radius = 2.5;
    fillCircle0355.fillColor = line0012.color;
    [haul0275.drawPrimitives addObject:fillCircle0355];

    MWDrawLine *drawLine0402 = [[MWDrawLine alloc] init];
    drawLine0402.startPoint = CGPointMake(535.5, 3101.5);
    drawLine0402.endPoint = CGPointMake(557.5, 3101.5);
    drawLine0402.width = 5;
    drawLine0402.color = line0012.color;
    [haul0275.drawPrimitives addObject:drawLine0402];

    MWDrawFillCircle *fillCircle0356 = [[MWDrawFillCircle alloc] init];
    fillCircle0356.center = CGPointMake(557.5, 3101.5);
    fillCircle0356.radius = 2.5;
    fillCircle0356.fillColor = line0012.color;
    [haul0275.drawPrimitives addObject:fillCircle0356];

    // Добавляем станцию Porte d'Auteuil
    MWStation *station0286 = [[MWStation alloc] init];
    station0286.identifier = @"station0286";
    [edge0117.elements addObject:station0286];
    
    station0286.nameOriginal = @"Porte d'Auteuil";
    station0286.mapLocation = CGPointMake(480, 3129);
    station0286.geoLocation = CGPointMake(48.848025, 2.25875);

    MWDrawFillCircle *fillCircle0357 = [[MWDrawFillCircle alloc] init];
    fillCircle0357.center = station0286.mapLocation;
    fillCircle0357.radius = 12;
    fillCircle0357.fillColor = line0012.color;
    [station0286.drawPrimitives addObject:fillCircle0357];

    MWDrawTextLine *drawTextLine0374 = [[MWDrawTextLine alloc] init];
    drawTextLine0374.text = @"Porte";
    drawTextLine0374.fontName = @"HelveticaNeue";
    drawTextLine0374.fontColor = [UIColor blackColor];
    drawTextLine0374.fontSize = 34;
    drawTextLine0374.kernSpacing = -0.4;
    drawTextLine0374.origin = CGPointMake(387, 3049);
    [station0286.drawPrimitives addObject:drawTextLine0374];

    MWDrawTextLine *drawTextLine0375 = [[MWDrawTextLine alloc] init];
    drawTextLine0375.text = @"d'Auteuil";
    drawTextLine0375.fontName = @"HelveticaNeue";
    drawTextLine0375.fontColor = [UIColor blackColor];
    drawTextLine0375.fontSize = 34;
    drawTextLine0375.kernSpacing = -0.0;
    drawTextLine0375.origin = CGPointMake(331, 3082);
    [station0286.drawPrimitives addObject:drawTextLine0375];

    // Добавляем перегон
    MWHaul *haul0276 = [[MWHaul alloc] init];
    haul0276.identifier = @"haul0276";
    haul0276.length = 1708;
    [edge0117.elements addObject:haul0276];

    MWDrawLine *drawLine0403 = [[MWDrawLine alloc] init];
    drawLine0403.startPoint = CGPointMake(480.5, 3128.5);
    drawLine0403.endPoint = CGPointMake(399, 3210.5);
    drawLine0403.width = 11;
    drawLine0403.color = line0012.color;
    [haul0276.drawPrimitives addObject:drawLine0403];

    // Добавляем станцию Boulogne – Jean Jaurès
    [edge0117.elements addObject:station0279];

    // Добавляем вершину
    edge0117.finishVertex = vertex0087;
    
    // Создаем участок линии Javel – André Citroën - La Motte-Picquet – Grenelle
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0118 = [[MWEdge alloc] init];
    edge0118.identifier = @"edge0118";
    edge0118.developmentName = @"Ребро: Javel – André Citroën - La Motte-Picquet – Grenelle";
    [self.edges addObject:edge0118];
    
    // Добавляем линию
    edge0118.line = line0012;
    
    // Добавляем вершину
    edge0118.startVertex = vertex0088;

    // Добавляем станцию Javel – André Citroën
    [edge0118.elements addObject:station0283];

    // Добавляем перегон
    MWHaul *haul0277 = [[MWHaul alloc] init];
    haul0277.identifier = @"haul0277";
    haul0277.length = 591;
    [edge0118.elements addObject:haul0277];

    MWDrawLine *drawLine0404 = [[MWDrawLine alloc] init];
    drawLine0404.startPoint = CGPointMake(929.5, 3063);
    drawLine0404.endPoint = CGPointMake(1012, 3063);
    drawLine0404.width = 11;
    drawLine0404.color = line0012.color;
    [haul0277.drawPrimitives addObject:drawLine0404];

    MWDrawArc *drawArc0115 = [[MWDrawArc alloc] init];
    drawArc0115.center = CGPointMake(1011.5, 3033);
    drawArc0115.startDegrees = 45;
    drawArc0115.endDegrees = 90;
    drawArc0115.radius = 30;
    drawArc0115.width = 11;
    drawArc0115.color = line0012.color;
    [haul0277.drawPrimitives addObject:drawArc0115];

    MWDrawLine *drawLine0405 = [[MWDrawLine alloc] init];
    drawLine0405.startPoint = CGPointMake(1032.5, 3054.5);
    drawLine0405.endPoint = CGPointMake(1058, 3029);
    drawLine0405.width = 11;
    drawLine0405.color = line0012.color;
    [haul0277.drawPrimitives addObject:drawLine0405];

    // Добавляем станцию Charles Michels
    MWStation *station0287 = [[MWStation alloc] init];
    station0287.identifier = @"station0287";
    [edge0118.elements addObject:station0287];
    
    station0287.nameOriginal = @"Charles Michels";
    station0287.mapLocation = CGPointMake(1058, 3029);
    station0287.geoLocation = CGPointMake(48.846591, 2.286942);

    MWDrawFillCircle *fillCircle0358 = [[MWDrawFillCircle alloc] init];
    fillCircle0358.center = station0287.mapLocation;
    fillCircle0358.radius = 12;
    fillCircle0358.fillColor = line0012.color;
    [station0287.drawPrimitives addObject:fillCircle0358];
    
    MWDrawTextLine *drawTextLine0376 = [[MWDrawTextLine alloc] init];
    drawTextLine0376.text = @"Charles";
    drawTextLine0376.fontName = @"HelveticaNeue";
    drawTextLine0376.fontColor = [UIColor blackColor];
    drawTextLine0376.fontSize = 34;
    drawTextLine0376.kernSpacing = -0.6;
    drawTextLine0376.origin = CGPointMake(1069, 3032);
    [station0287.drawPrimitives addObject:drawTextLine0376];

    MWDrawTextLine *drawTextLine0377 = [[MWDrawTextLine alloc] init];
    drawTextLine0377.text = @"Michels";
    drawTextLine0377.fontName = @"HelveticaNeue";
    drawTextLine0377.fontColor = [UIColor blackColor];
    drawTextLine0377.fontSize = 34;
    drawTextLine0377.kernSpacing = -0.2;
    drawTextLine0377.origin = CGPointMake(1069, 3066);
    [station0287.drawPrimitives addObject:drawTextLine0377];

    // Добавляем перегон
    MWHaul *haul0278 = [[MWHaul alloc] init];
    haul0278.identifier = @"haul0278";
    haul0278.length = 615;
    [edge0118.elements addObject:haul0278];
    
    MWDrawLine *drawLine0406 = [[MWDrawLine alloc] init];
    drawLine0406.startPoint = CGPointMake(1057.5, 3029.5);
    drawLine0406.endPoint = CGPointMake(1128, 2959.5);
    drawLine0406.width = 11;
    drawLine0406.color = line0012.color;
    [haul0278.drawPrimitives addObject:drawLine0406];

    // Добавляем станцию Avenue Émile Zola
    MWStation *station0288 = [[MWStation alloc] init];
    station0288.identifier = @"station0288";
    [edge0118.elements addObject:station0288];
    
    station0288.nameOriginal = @"Avenue Émile Zola";
    station0288.mapLocation = CGPointMake(1128, 2959.5);
    station0288.geoLocation = CGPointMake(48.846977, 2.294512);
    
    MWDrawFillCircle *fillCircle0359 = [[MWDrawFillCircle alloc] init];
    fillCircle0359.center = station0288.mapLocation;
    fillCircle0359.radius = 12;
    fillCircle0359.fillColor = line0012.color;
    [station0288.drawPrimitives addObject:fillCircle0359];

    MWDrawTextLine *drawTextLine0378 = [[MWDrawTextLine alloc] init];
    drawTextLine0378.text = @"Avenue";
    drawTextLine0378.fontName = @"HelveticaNeue";
    drawTextLine0378.fontColor = [UIColor blackColor];
    drawTextLine0378.fontSize = 34;
    drawTextLine0378.kernSpacing = -0.4;
    drawTextLine0378.origin = CGPointMake(1007, 2879);
    [station0288.drawPrimitives addObject:drawTextLine0378];

    MWDrawTextLine *drawTextLine0379 = [[MWDrawTextLine alloc] init];
    drawTextLine0379.text = @"Émile Zola";
    drawTextLine0379.fontName = @"HelveticaNeue";
    drawTextLine0379.fontColor = [UIColor blackColor];
    drawTextLine0379.fontSize = 34;
    drawTextLine0379.kernSpacing = -0.4;
    drawTextLine0379.origin = CGPointMake(961, 2913);
    [station0288.drawPrimitives addObject:drawTextLine0379];

    // Добавляем перегон
    MWHaul *haul0279 = [[MWHaul alloc] init];
    haul0279.identifier = @"haul0279";
    haul0279.length = 331;
    [edge0118.elements addObject:haul0279];

    MWDrawLine *drawLine0407 = [[MWDrawLine alloc] init];
    drawLine0407.startPoint = CGPointMake(1127.5, 2960);
    drawLine0407.endPoint = CGPointMake(1166.5, 2921);
    drawLine0407.width = 11;
    drawLine0407.color = line0012.color;
    [haul0279.drawPrimitives addObject:drawLine0407];

    MWDrawArc *drawArc0116 = [[MWDrawArc alloc] init];
    drawArc0116.center = CGPointMake(1187.5, 2942.5);
    drawArc0116.startDegrees = 225;
    drawArc0116.endDegrees = 270;
    drawArc0116.radius = 30;
    drawArc0116.width = 11;
    drawArc0116.color = line0012.color;
    [haul0279.drawPrimitives addObject:drawArc0116];

    MWDrawLine *drawLine0408 = [[MWDrawLine alloc] init];
    drawLine0408.startPoint = CGPointMake(1187, 2912.5);
    drawLine0408.endPoint = CGPointMake(1231, 2912.5);
    drawLine0408.width = 11;
    drawLine0408.color = line0012.color;
    [haul0279.drawPrimitives addObject:drawLine0408];

    // Добавляем станцию La Motte-Picquet – Grenelle
    MWStation *station0289 = [[MWStation alloc] init];
    station0289.identifier = @"station0289";
    [edge0118.elements addObject:station0289];
    
    station0289.nameOriginal = @"La Motte-Picquet — Grenelle";
    station0289.mapLocation = CGPointMake(1231, 2912.5);
    station0289.geoLocation = CGPointMake(48.849143, 2.29809);

    MWDrawFillCircle *fillCircle0360 = [[MWDrawFillCircle alloc] init];
    fillCircle0360.center = station0289.mapLocation;
    fillCircle0360.radius = 3;
    fillCircle0360.fillColor = [UIColor whiteColor];
    [station0289.drawPrimitives addObject:fillCircle0360];

    station0289.showNameOnMap = false;
    [station0289.nameOriginalTextPrimitives addObject:drawTextLine0187];
    [station0289.nameOriginalTextPrimitives addObject:drawTextLine0188];
    [station0289.nameOriginalTextPrimitives addObject:drawTextLine0189];
    
    // Добавляем вершину
    edge0118.finishVertex = vertex0049;
    
    // Создаем участок линии La Motte-Picquet – Grenelle - Duroc
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0119 = [[MWEdge alloc] init];
    edge0119.identifier = @"edge0119";
    edge0119.developmentName = @"Ребро: La Motte-Picquet – Grenelle - Duroc";
    [self.edges addObject:edge0119];
    
    // Добавляем линию
    edge0119.line = line0012;
    
    // Добавляем вершину
    edge0119.startVertex = vertex0049;

    // Добавляем станцию La Motte-Picquet – Grenelle
    [edge0119.elements addObject:station0289];

    // Добавляем перегон
    MWHaul *haul0280 = [[MWHaul alloc] init];
    haul0280.identifier = @"haul0280";
    haul0280.length = 913;
    [edge0119.elements addObject:haul0280];

    MWDrawLine *drawLine0409 = [[MWDrawLine alloc] init];
    drawLine0409.startPoint = CGPointMake(1230.5, 2912.5);
    drawLine0409.endPoint = CGPointMake(1378, 2912.5);
    drawLine0409.width = 11;
    drawLine0409.color = line0012.color;
    [haul0280.drawPrimitives addObject:drawLine0409];

    MWDrawArc *drawArc0117 = [[MWDrawArc alloc] init];
    drawArc0117.center = CGPointMake(1378, 2942.5);
    drawArc0117.startDegrees = 270;
    drawArc0117.endDegrees = 315;
    drawArc0117.radius = 30;
    drawArc0117.width = 11;
    drawArc0117.color = line0012.color;
    [haul0280.drawPrimitives addObject:drawArc0117];

    MWDrawLine *drawLine0410 = [[MWDrawLine alloc] init];
    drawLine0410.startPoint = CGPointMake(1398.5, 2920.5);
    drawLine0410.endPoint = CGPointMake(1504.5, 3026.5);
    drawLine0410.width = 11;
    drawLine0410.color = line0012.color;
    [haul0280.drawPrimitives addObject:drawLine0410];

    // Добавляем станцию Ségur
    MWStation *station0290 = [[MWStation alloc] init];
    station0290.identifier = @"station0290";
    [edge0119.elements addObject:station0290];
    
    station0290.nameOriginal = @"Ségur";
    station0290.mapLocation = CGPointMake(1504.5, 3026.5);
    station0290.geoLocation = CGPointMake(48.847434, 2.306853);

    MWDrawFillCircle *fillCircle0361 = [[MWDrawFillCircle alloc] init];
    fillCircle0361.center = station0290.mapLocation;
    fillCircle0361.radius = 12;
    fillCircle0361.fillColor = line0012.color;
    [station0290.drawPrimitives addObject:fillCircle0361];

    MWDrawTextLine *drawTextLine0380 = [[MWDrawTextLine alloc] init];
    drawTextLine0380.text = station0290.nameOriginal;
    drawTextLine0380.fontName = @"HelveticaNeue";
    drawTextLine0380.fontColor = [UIColor blackColor];
    drawTextLine0380.fontSize = 34;
    drawTextLine0380.kernSpacing = -1.2;
    drawTextLine0380.origin = CGPointMake(1514, 2979);
    [station0290.drawPrimitives addObject:drawTextLine0380];

    // Добавляем перегон
    MWHaul *haul0281 = [[MWHaul alloc] init];
    haul0281.identifier = @"haul0281";
    haul0281.length = 820;
    [edge0119.elements addObject:haul0281];

    MWDrawLine *drawLine0411 = [[MWDrawLine alloc] init];
    drawLine0411.startPoint = CGPointMake(1504, 3026);
    drawLine0411.endPoint = CGPointMake(1551, 3073);
    drawLine0411.width = 11;
    drawLine0411.color = line0012.color;
    [haul0281.drawPrimitives addObject:drawLine0411];

    MWDrawArc *drawArc0118 = [[MWDrawArc alloc] init];
    drawArc0118.center = CGPointMake(1561, 3062);
    drawArc0118.startDegrees = 45;
    drawArc0118.endDegrees = 135;
    drawArc0118.radius = 15;
    drawArc0118.width = 11;
    drawArc0118.color = line0012.color;
    [haul0281.drawPrimitives addObject:drawArc0118];

    MWDrawLine *drawLine0412 = [[MWDrawLine alloc] init];
    drawLine0412.startPoint = CGPointMake(1571, 3073);
    drawLine0412.endPoint = CGPointMake(1654, 2990);
    drawLine0412.width = 11;
    drawLine0412.color = line0012.color;
    [haul0281.drawPrimitives addObject:drawLine0412];

    // Добавляем станцию Duroc
    MWStation *station0291 = [[MWStation alloc] init];
    station0291.identifier = @"station0291";
    [edge0119.elements addObject:station0291];
    
    station0291.nameOriginal = @"Duroc";
    station0291.mapLocation = CGPointMake(1654, 2990);
    station0291.geoLocation = CGPointMake(48.846829, 2.316479);

    MWDrawFillCircle *fillCircle0362 = [[MWDrawFillCircle alloc] init];
    fillCircle0362.center = station0291.mapLocation;
    fillCircle0362.radius = 3;
    fillCircle0362.fillColor = [UIColor whiteColor];
    [station0291.drawPrimitives addObject:fillCircle0362];
    
    MWDrawTextLine *drawTextLine0381 = [[MWDrawTextLine alloc] init];
    drawTextLine0381.text = station0291.nameOriginal;
    drawTextLine0381.fontName = @"HelveticaNeue";
    drawTextLine0381.fontColor = [UIColor blackColor];
    drawTextLine0381.fontSize = 34;
    drawTextLine0381.kernSpacing = -0.4;
    drawTextLine0381.origin = CGPointMake(1670, 2976);
    [station0291.drawPrimitives addObject:drawTextLine0381];

    // Добавляем вершину
    edge0119.finishVertex = vertex0076;

    // Создаем участок линии Duroc - Sèvres – Babylone
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0120 = [[MWEdge alloc] init];
    edge0120.identifier = @"edge0120";
    edge0120.developmentName = @"Ребро: Duroc - Sèvres – Babylone";
    [self.edges addObject:edge0120];
    
    // Добавляем линию
    edge0120.line = line0012;
    
    // Добавляем вершину
    edge0120.startVertex = vertex0076;

    // Добавляем станцию Duroc
    [edge0120.elements addObject:station0291];

    // Добавляем перегон
    MWHaul *haul0282 = [[MWHaul alloc] init];
    haul0282.identifier = @"haul0282";
    haul0282.length = 442;
    [edge0120.elements addObject:haul0282];

    MWDrawLine *drawLine0413 = [[MWDrawLine alloc] init];
    drawLine0413.startPoint = CGPointMake(1653.5, 2990.5);
    drawLine0413.endPoint = CGPointMake(1745.5, 2898.5);
    drawLine0413.width = 11;
    drawLine0413.color = line0012.color;
    [haul0282.drawPrimitives addObject:drawLine0413];

    // Добавляем станцию Vaneau
    MWStation *station0292 = [[MWStation alloc] init];
    station0292.identifier = @"station0292";
    [edge0120.elements addObject:station0292];
    
    station0292.nameOriginal = @"Vaneau";
    station0292.mapLocation = CGPointMake(1745.5, 2898.5);
    station0292.geoLocation = CGPointMake(48.848947, 2.321557);

    MWDrawFillCircle *fillCircle0364 = [[MWDrawFillCircle alloc] init];
    fillCircle0364.center = station0292.mapLocation;
    fillCircle0364.radius = 12;
    fillCircle0364.fillColor = line0012.color;
    [station0292.drawPrimitives addObject:fillCircle0364];

    MWDrawTextLine *drawTextLine0382 = [[MWDrawTextLine alloc] init];
    drawTextLine0382.text = station0292.nameOriginal;
    drawTextLine0382.fontName = @"HelveticaNeue";
    drawTextLine0382.fontColor = [UIColor blackColor];
    drawTextLine0382.fontSize = 34;
    drawTextLine0382.kernSpacing = -0.5;
    drawTextLine0382.origin = CGPointMake(1624, 2852);
    [station0292.drawPrimitives addObject:drawTextLine0382];

    // Добавляем перегон
    MWHaul *haul0283 = [[MWHaul alloc] init];
    haul0283.identifier = @"haul0283";
    haul0283.length = 447;
    [edge0120.elements addObject:haul0283];

    MWDrawLine *drawLine0414 = [[MWDrawLine alloc] init];
    drawLine0414.startPoint = CGPointMake(1745, 2899);
    drawLine0414.endPoint = CGPointMake(1837.5, 2806.5);
    drawLine0414.width = 11;
    drawLine0414.color = line0012.color;
    [haul0283.drawPrimitives addObject:drawLine0414];

    // Добавляем станцию Sèvres – Babylone
    MWStation *station0293 = [[MWStation alloc] init];
    station0293.identifier = @"station0293";
    [edge0120.elements addObject:station0293];
    
    station0293.nameOriginal = @"Sèvres – Babylone";
    station0293.mapLocation = CGPointMake(1837.5, 2806.5);
    station0293.geoLocation = CGPointMake(48.85151, 2.326655);

    MWDrawFillCircle *fillCircle0365 = [[MWDrawFillCircle alloc] init];
    fillCircle0365.center = station0293.mapLocation;
    fillCircle0365.radius = 3;
    fillCircle0365.fillColor = [UIColor whiteColor];
    [station0293.drawPrimitives addObject:fillCircle0365];

    MWDrawTextLine *drawTextLine0383 = [[MWDrawTextLine alloc] init];
    drawTextLine0383.text = @"Sèvres";
    drawTextLine0383.fontName = @"HelveticaNeue";
    drawTextLine0383.fontColor = [UIColor blackColor];
    drawTextLine0383.fontSize = 34;
    drawTextLine0383.kernSpacing = -1.8;
    drawTextLine0383.origin = CGPointMake(1662, 2762);
    [station0293.drawPrimitives addObject:drawTextLine0383];

    MWDrawTextLine *drawTextLine0384 = [[MWDrawTextLine alloc] init];
    drawTextLine0384.text = @"Babylone";
    drawTextLine0384.fontName = @"HelveticaNeue";
    drawTextLine0384.fontColor = [UIColor blackColor];
    drawTextLine0384.fontSize = 34;
    drawTextLine0384.kernSpacing = -0.8;
    drawTextLine0384.origin = CGPointMake(1662, 2797);
    [station0293.drawPrimitives addObject:drawTextLine0384];

    // Добавляем вершину
    edge0120.finishVertex = vertex0077;
    
    // Создаем участок линии Sèvres – Babylone - Odéon
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0121 = [[MWEdge alloc] init];
    edge0121.identifier = @"edge0121";
    edge0121.developmentName = @"Ребро: Sèvres – Babylone - Odéon";
    [self.edges addObject:edge0121];
    
    // Добавляем линию
    edge0121.line = line0012;
    
    // Добавляем вершину
    edge0121.startVertex = vertex0077;

    // Добавляем станцию Sèvres – Babylone
    [edge0121.elements addObject:station0293];

    // Добавляем перегон
    MWHaul *haul0284 = [[MWHaul alloc] init];
    haul0284.identifier = @"haul0284";
    haul0284.length = 682;
    [edge0121.elements addObject:haul0284];

    MWDrawLine *drawLine0415 = [[MWDrawLine alloc] init];
    drawLine0415.startPoint = CGPointMake(1837, 2807);
    drawLine0415.endPoint = CGPointMake(1884.5, 2759.5);
    drawLine0415.width = 11;
    drawLine0415.color = line0012.color;
    [haul0284.drawPrimitives addObject:drawLine0415];

    MWDrawArc *drawArc0119 = [[MWDrawArc alloc] init];
    drawArc0119.center = CGPointMake(1905.5, 2781);
    drawArc0119.startDegrees = 225;
    drawArc0119.endDegrees = 270;
    drawArc0119.radius = 30;
    drawArc0119.width = 11;
    drawArc0119.color = line0012.color;
    [haul0284.drawPrimitives addObject:drawArc0119];
    
    MWDrawLine *drawLine0416 = [[MWDrawLine alloc] init];
    drawLine0416.startPoint = CGPointMake(1905, 2751);
    drawLine0416.endPoint = CGPointMake(2065.5, 2751);
    drawLine0416.width = 11;
    drawLine0416.color = line0012.color;
    [haul0284.drawPrimitives addObject:drawLine0416];

    // Добавляем станцию Mabillon
    MWStation *station0294 = [[MWStation alloc] init];
    station0294.identifier = @"station0294";
    [edge0121.elements addObject:station0294];
    
    station0294.nameOriginal = @"Mabillon";
    station0294.mapLocation = CGPointMake(2065.5, 2751);
    station0294.geoLocation = CGPointMake(48.852775, 2.335322);

    MWDrawFillCircle *fillCircle0366 = [[MWDrawFillCircle alloc] init];
    fillCircle0366.center = station0294.mapLocation;
    fillCircle0366.radius = 12;
    fillCircle0366.fillColor = line0012.color;
    [station0294.drawPrimitives addObject:fillCircle0366];

    MWDrawTextLine *drawTextLine0385 = [[MWDrawTextLine alloc] init];
    drawTextLine0385.text = station0294.nameOriginal;
    drawTextLine0385.fontName = @"HelveticaNeue";
    drawTextLine0385.fontColor = [UIColor blackColor];
    drawTextLine0385.fontSize = 34;
    drawTextLine0385.kernSpacing = 0.2;
    drawTextLine0385.origin = CGPointMake(2001, 2762);
    [station0294.drawPrimitives addObject:drawTextLine0385];

    // Добавляем перегон
    MWHaul *haul0285 = [[MWHaul alloc] init];
    haul0285.identifier = @"haul0285";
    haul0285.length = 377;
    [edge0121.elements addObject:haul0285];

    MWDrawLine *drawLine0417 = [[MWDrawLine alloc] init];
    drawLine0417.startPoint = CGPointMake(2065, 2751);
    drawLine0417.endPoint = CGPointMake(2204.5, 2751);
    drawLine0417.width = 11;
    drawLine0417.color = line0012.color;
    [haul0285.drawPrimitives addObject:drawLine0417];

    // Добавляем станцию Odéon
    MWStation *station0295 = [[MWStation alloc] init];
    station0295.identifier = @"station0295";
    [edge0121.elements addObject:station0295];
    
    station0295.nameOriginal = @"Odéon";
    station0295.mapLocation = CGPointMake(2204.5, 2751);
    station0295.geoLocation = CGPointMake(48.851944, 2.338889);

    MWDrawFillCircle *fillCircle0367 = [[MWDrawFillCircle alloc] init];
    fillCircle0367.center = station0295.mapLocation;
    fillCircle0367.radius = 3;
    fillCircle0367.fillColor = [UIColor whiteColor];
    [station0295.drawPrimitives addObject:fillCircle0367];

    station0295.showNameOnMap = false;
    [station0295.nameOriginalTextPrimitives addObject:drawTextLine0131];
    
    // Добавляем вершину
    edge0121.finishVertex = vertex0039;

    // Создаем участок линии Odéon - Jussieu
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0122 = [[MWEdge alloc] init];
    edge0122.identifier = @"edge0122";
    edge0122.developmentName = @"Ребро: Odéon - Jussieu";
    [self.edges addObject:edge0122];
    
    // Добавляем линию
    edge0122.line = line0012;
    
    // Добавляем вершину
    edge0122.startVertex = vertex0039;

    // Добавляем станцию Odéon
    [edge0122.elements addObject:station0295];
    
    // Добавляем перегон
    MWHaul *haul0286 = [[MWHaul alloc] init];
    haul0286.identifier = @"haul0286";
    haul0286.length = 340;
    [edge0122.elements addObject:haul0286];
    
    MWDrawLine *drawLine0418 = [[MWDrawLine alloc] init];
    drawLine0418.startPoint = CGPointMake(2204, 2751);
    drawLine0418.endPoint = CGPointMake(2321.5, 2751);
    drawLine0418.width = 11;
    drawLine0418.color = line0012.color;
    [haul0286.drawPrimitives addObject:drawLine0418];

    // Добавляем станцию Cluny – La Sorbonne
    MWStation *station0296 = [[MWStation alloc] init];
    station0296.identifier = @"station0296";
    [edge0122.elements addObject:station0296];
    
    station0296.nameOriginal = @"Cluny – La Sorbonne";
    station0296.mapLocation = CGPointMake(2321.5, 2751);
    station0296.geoLocation = CGPointMake(48.851019, 2.344583);

    MWDrawFillCircle *fillCircle0368 = [[MWDrawFillCircle alloc] init];
    fillCircle0368.center = station0296.mapLocation;
    fillCircle0368.radius = 13;
    fillCircle0368.fillColor = [UIColor blackColor];
    [station0296.drawPrimitives addObject:fillCircle0368];
    
    MWDrawFillCircle *fillCircle0369 = [[MWDrawFillCircle alloc] init];
    fillCircle0369.center = station0296.mapLocation;
    fillCircle0369.radius = 11;
    fillCircle0369.fillColor = [UIColor whiteColor];
    [station0296.drawPrimitives addObject:fillCircle0369];
    
    MWDrawTextLine *drawTextLine0386 = [[MWDrawTextLine alloc] init];
    drawTextLine0386.text = @"Cluny";
    drawTextLine0386.fontName = @"HelveticaNeue";
    drawTextLine0386.fontColor = [UIColor blackColor];
    drawTextLine0386.fontSize = 34;
    drawTextLine0386.kernSpacing = -0.4;
    drawTextLine0386.origin = CGPointMake(2331, 2668);
    [station0296.drawPrimitives addObject:drawTextLine0386];

    MWDrawTextLine *drawTextLine0387 = [[MWDrawTextLine alloc] init];
    drawTextLine0387.text = @"La Sorbonne";
    drawTextLine0387.fontName = @"HelveticaNeue";
    drawTextLine0387.fontColor = [UIColor blackColor];
    drawTextLine0387.fontSize = 34;
    drawTextLine0387.kernSpacing = -0.6;
    drawTextLine0387.origin = CGPointMake(2331, 2701);
    [station0296.drawPrimitives addObject:drawTextLine0387];

    // Добавляем перегон
    MWHaul *haul0287 = [[MWHaul alloc] init];
    haul0287.identifier = @"haul0287";
    haul0287.length = 263;
    [edge0122.elements addObject:haul0287];
    
    MWDrawLine *drawLine0419 = [[MWDrawLine alloc] init];
    drawLine0419.startPoint = CGPointMake(2321, 2751);
    drawLine0419.endPoint = CGPointMake(2337.5, 2751);
    drawLine0419.width = 11;
    drawLine0419.color = line0012.color;
    [haul0287.drawPrimitives addObject:drawLine0419];
    
    MWDrawArc *drawArc0120 = [[MWDrawArc alloc] init];
    drawArc0120.center = CGPointMake(2336.5, 2781);
    drawArc0120.startDegrees = 270;
    drawArc0120.endDegrees = 315;
    drawArc0120.radius = 30;
    drawArc0120.width = 11;
    drawArc0120.color = line0012.color;
    [haul0287.drawPrimitives addObject:drawArc0120];

    MWDrawLine *drawLine0420 = [[MWDrawLine alloc] init];
    drawLine0420.startPoint = CGPointMake(2357.5, 2759.5);
    drawLine0420.endPoint = CGPointMake(2424, 2826);
    drawLine0420.width = 11;
    drawLine0420.color = line0012.color;
    [haul0287.drawPrimitives addObject:drawLine0420];

    // Добавляем станцию Maubert – Mutualité
    MWStation *station0297 = [[MWStation alloc] init];
    station0297.identifier = @"station0297";
    [edge0122.elements addObject:station0297];
    
    station0297.nameOriginal = @"Maubert – Mutualité";
    station0297.mapLocation = CGPointMake(2424, 2826);
    station0297.geoLocation = CGPointMake(48.850193, 2.347936);

    MWDrawFillCircle *fillCircle0370 = [[MWDrawFillCircle alloc] init];
    fillCircle0370.center = station0297.mapLocation;
    fillCircle0370.radius = 12;
    fillCircle0370.fillColor = line0012.color;
    [station0297.drawPrimitives addObject:fillCircle0370];

    MWDrawTextLine *drawTextLine0388 = [[MWDrawTextLine alloc] init];
    drawTextLine0388.text = @"Maubert";
    drawTextLine0388.fontName = @"HelveticaNeue";
    drawTextLine0388.fontColor = [UIColor blackColor];
    drawTextLine0388.fontSize = 34;
    drawTextLine0388.kernSpacing = -0.0;
    drawTextLine0388.origin = CGPointMake(2436, 2746);
    [station0297.drawPrimitives addObject:drawTextLine0388];

    MWDrawTextLine *drawTextLine0389 = [[MWDrawTextLine alloc] init];
    drawTextLine0389.text = @"Mutualité";
    drawTextLine0389.fontName = @"HelveticaNeue";
    drawTextLine0389.fontColor = [UIColor blackColor];
    drawTextLine0389.fontSize = 34;
    drawTextLine0389.kernSpacing = 0.5;
    drawTextLine0389.origin = CGPointMake(2436, 2779);
    [station0297.drawPrimitives addObject:drawTextLine0389];

    // Добавляем перегон
    MWHaul *haul0288 = [[MWHaul alloc] init];
    haul0288.identifier = @"haul0288";
    haul0288.length = 486;
    [edge0122.elements addObject:haul0288];
    
    MWDrawLine *drawLine0421 = [[MWDrawLine alloc] init];
    drawLine0421.startPoint = CGPointMake(2423.5, 2825.5);
    drawLine0421.endPoint = CGPointMake(2502, 2903.5);
    drawLine0421.width = 11;
    drawLine0421.color = line0012.color;
    [haul0288.drawPrimitives addObject:drawLine0421];

    // Добавляем станцию Cardinal Lemoine
    MWStation *station0298 = [[MWStation alloc] init];
    station0298.identifier = @"station0298";
    [edge0122.elements addObject:station0298];
    
    station0298.nameOriginal = @"Cardinal Lemoine";
    station0298.mapLocation = CGPointMake(2502, 2903.5);
    station0298.geoLocation = CGPointMake(48.847139, 2.351203);

    MWDrawFillCircle *fillCircle0371 = [[MWDrawFillCircle alloc] init];
    fillCircle0371.center = station0298.mapLocation;
    fillCircle0371.radius = 12;
    fillCircle0371.fillColor = line0012.color;
    [station0298.drawPrimitives addObject:fillCircle0371];

    MWDrawTextLine *drawTextLine0390 = [[MWDrawTextLine alloc] init];
    drawTextLine0390.text = @"Cardinal";
    drawTextLine0390.fontName = @"HelveticaNeue";
    drawTextLine0390.fontColor = [UIColor blackColor];
    drawTextLine0390.fontSize = 34;
    drawTextLine0390.kernSpacing = -0.4;
    drawTextLine0390.origin = CGPointMake(2514, 2824);
    [station0298.drawPrimitives addObject:drawTextLine0390];

    MWDrawTextLine *drawTextLine0391 = [[MWDrawTextLine alloc] init];
    drawTextLine0391.text = @"Lemoine";
    drawTextLine0391.fontName = @"HelveticaNeue";
    drawTextLine0391.fontColor = [UIColor blackColor];
    drawTextLine0391.fontSize = 34;
    drawTextLine0391.kernSpacing = -0.0;
    drawTextLine0391.origin = CGPointMake(2514, 2857);
    [station0298.drawPrimitives addObject:drawTextLine0391];

    // Добавляем перегон
    MWHaul *haul0289 = [[MWHaul alloc] init];
    haul0289.identifier = @"haul0289";
    haul0289.length = 286;
    [edge0122.elements addObject:haul0289];

    MWDrawLine *drawLine0422 = [[MWDrawLine alloc] init];
    drawLine0422.startPoint = CGPointMake(2501.5, 2903);
    drawLine0422.endPoint = CGPointMake(2530.5, 2932);
    drawLine0422.width = 11;
    drawLine0422.color = line0012.color;
    [haul0289.drawPrimitives addObject:drawLine0422];

    MWDrawArc *drawArc0121 = [[MWDrawArc alloc] init];
    drawArc0121.center = CGPointMake(2551, 2910);
    drawArc0121.startDegrees = 90;
    drawArc0121.endDegrees = 135;
    drawArc0121.radius = 30;
    drawArc0121.width = 11;
    drawArc0121.color = line0012.color;
    [haul0289.drawPrimitives addObject:drawArc0121];

    MWDrawLine *drawLine0423 = [[MWDrawLine alloc] init];
    drawLine0423.startPoint = CGPointMake(2550.5, 2940);
    drawLine0423.endPoint = CGPointMake(2633, 2940);
    drawLine0423.width = 11;
    drawLine0423.color = line0012.color;
    [haul0289.drawPrimitives addObject:drawLine0423];

    // Добавляем станцию Jussieu
    MWStation *station0299 = [[MWStation alloc] init];
    station0299.identifier = @"station0299";
    [edge0122.elements addObject:station0299];
    
    station0299.nameOriginal = @"Jussieu";
    station0299.mapLocation = CGPointMake(2633, 2940);
    station0299.geoLocation = CGPointMake(48.846052, 2.355738);
    
    MWDrawFillCircle *fillCircle0372 = [[MWDrawFillCircle alloc] init];
    fillCircle0372.center = station0299.mapLocation;
    fillCircle0372.radius = 3;
    fillCircle0372.fillColor = [UIColor whiteColor];
    [station0299.drawPrimitives addObject:fillCircle0372];
    
    station0299.showNameOnMap = false;
    [station0299.nameOriginalTextPrimitives addObject:drawTextLine0237];
    
    // Добавляем вершину
    edge0122.finishVertex = vertex0057;

    // Создаем участок линии Jussieu - Gare d'Austerlitz
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0123 = [[MWEdge alloc] init];
    edge0123.identifier = @"edge0123";
    edge0123.developmentName = @"Ребро: Jussieu - Gare d'Austerlitz";
    [self.edges addObject:edge0123];
    
    // Добавляем линию
    edge0123.line = line0012;
    
    // Добавляем вершину
    edge0123.startVertex = vertex0057;

    // Добавляем станцию Jussieu
    [edge0123.elements addObject:station0299];

    // Добавляем перегон
    MWHaul *haul0290 = [[MWHaul alloc] init];
    haul0290.identifier = @"haul0290";
    haul0290.length = 954;
    [edge0123.elements addObject:haul0290];
    
    MWDrawLine *drawLine0424 = [[MWDrawLine alloc] init];
    drawLine0424.startPoint = CGPointMake(2632.5, 2940);
    drawLine0424.endPoint = CGPointMake(2717, 2940);
    drawLine0424.width = 11;
    drawLine0424.color = line0012.color;
    [haul0290.drawPrimitives addObject:drawLine0424];

    MWDrawArc *drawArc0122 = [[MWDrawArc alloc] init];
    drawArc0122.center = CGPointMake(2717, 2970);
    drawArc0122.startDegrees = 270;
    drawArc0122.endDegrees = 315;
    drawArc0122.radius = 30;
    drawArc0122.width = 11;
    drawArc0122.color = line0012.color;
    [haul0290.drawPrimitives addObject:drawArc0122];

    MWDrawLine *drawLine0425 = [[MWDrawLine alloc] init];
    drawLine0425.startPoint = CGPointMake(2737.5, 2948);
    drawLine0425.endPoint = CGPointMake(2871, 3081.5);
    drawLine0425.width = 11;
    drawLine0425.color = line0012.color;
    [haul0290.drawPrimitives addObject:drawLine0425];

    // Добавляем станцию Gare d'Austerlitz
    MWStation *station0300 = [[MWStation alloc] init];
    station0300.identifier = @"station0300";
    [edge0123.elements addObject:station0300];
    
    station0300.nameOriginal = @"Gare d'Austerlitz";
    station0300.mapLocation = CGPointMake(2871, 3081.5);
    station0300.geoLocation = CGPointMake(48.842626, 2.364971);
    
    MWDrawFillCircle *fillCircle0373 = [[MWDrawFillCircle alloc] init];
    fillCircle0373.center = station0300.mapLocation;
    fillCircle0373.radius = 5.5;
    fillCircle0373.fillColor = line0012.color;
    [station0300.drawPrimitives addObject:fillCircle0373];

    station0300.showNameOnMap = false;
    [station0300.nameOriginalTextPrimitives addObject:drawTextLine0171];
    [station0300.nameOriginalTextPrimitives addObject:drawTextLine0172];

    MWDrawFillCircle *fillCircle0374 = [[MWDrawFillCircle alloc] init];
    fillCircle0374.center = CGPointMake(2838, 3114.5);
    fillCircle0374.radius = 28;
    fillCircle0374.fillColor = line0012.color;
    [station0300.drawPrimitives addObject:fillCircle0374];

    MWDrawTextLine *drawTextLine0392 = [[MWDrawTextLine alloc] init];
    drawTextLine0392.text = @"10";
    drawTextLine0392.fontName = @"HelveticaNeue-Bold";
    drawTextLine0392.fontColor = [UIColor blackColor];
    drawTextLine0392.fontSize = 44;
    drawTextLine0392.origin = CGPointMake(2813, 3086.5);
    [station0300.drawPrimitives addObject:drawTextLine0392];

    // Добавляем вершину
    edge0123.finishVertex = vertex0046;
 
    ////////////////////////////////////////////////////////////////
    // Line 11
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Mairie des Lilas - Porte des Lilas
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0124 = [[MWEdge alloc] init];
    edge0124.identifier = @"edge0124";
    edge0124.developmentName = @"Ребро: Mairie des Lilas - Porte des Lilas";
    [self.edges addObject:edge0124];
    
    // Добавляем линию
    edge0124.line = line0013;
    
    // Добавляем вершину
    edge0124.startVertex = vertex0078;
    
    // Добавляем станцию Mairie des Lilas
    MWStation *station0301 = [[MWStation alloc] init];
    station0301.identifier = @"station0301";
    [edge0124.elements addObject:station0301];
    
    station0301.nameOriginal = @"Mairie des Lilas";
    station0301.mapLocation = CGPointMake(3991.5, 1531.5);
    station0301.geoLocation = CGPointMake(48.879788, 2.416289);
    
    MWDrawFillCircle *fillCircle0375 = [[MWDrawFillCircle alloc] init];
    fillCircle0375.center = CGPointMake(4037, 1529);
    fillCircle0375.radius = 28;
    fillCircle0375.fillColor = line0013.color;
    [station0301.drawPrimitives addObject:fillCircle0375];
    
    MWDrawTextLine *drawTextLine0393 = [[MWDrawTextLine alloc] init];
    drawTextLine0393.text = @"11";
    drawTextLine0393.fontName = @"HelveticaNeue-Bold";
    drawTextLine0393.fontColor = [UIColor whiteColor];
    drawTextLine0393.fontSize = 44;
    drawTextLine0393.origin = CGPointMake(4013, 1501);
    [station0301.drawPrimitives addObject:drawTextLine0393];

    MWDrawTextLine *drawTextLine0394 = [[MWDrawTextLine alloc] init];
    drawTextLine0394.text = station0301.nameOriginal;
    drawTextLine0394.fontName = @"Helvetica-Bold";
    drawTextLine0394.fontColor = [UIColor blackColor];
    drawTextLine0394.fontSize = 30;
    drawTextLine0394.kernSpacing = 1.2;
    drawTextLine0394.origin = CGPointMake(4073, 1512);
    [station0301.drawPrimitives addObject:drawTextLine0394];

    MWDrawFillCircle *fillCircle0376 = [[MWDrawFillCircle alloc] init];
    fillCircle0376.center = station0301.mapLocation;
    fillCircle0376.radius = 12;
    fillCircle0376.fillColor = [UIColor blackColor];
    [station0301.drawPrimitives addObject:fillCircle0376];

    // Добавляем перегон
    MWHaul *haul0291 = [[MWHaul alloc] init];
    haul0291.identifier = @"haul0291";
    haul0291.length = 781;
    [edge0124.elements addObject:haul0291];

    MWDrawLine *drawLine0426 = [[MWDrawLine alloc] init];
    drawLine0426.startPoint = CGPointMake(3991.5, 1531);
    drawLine0426.endPoint = CGPointMake(3866, 1657.5);
    drawLine0426.width = 11;
    drawLine0426.color = line0013.color;
    [haul0291.drawPrimitives addObject:drawLine0426];

    // Добавляем станцию Porte des Lilas
    MWStation *station0302 = [[MWStation alloc] init];
    station0302.identifier = @"station0302";
    [edge0124.elements addObject:station0302];
    
    station0302.nameOriginal = @"Porte des Lilas";
    station0302.mapLocation = CGPointMake(3866, 1657.5);
    station0302.geoLocation = CGPointMake(48.877183, 2.406655);

    MWDrawFillCircle *fillCircle0377 = [[MWDrawFillCircle alloc] init];
    fillCircle0377.center = station0302.mapLocation;
    fillCircle0377.radius = 3;
    fillCircle0377.fillColor = [UIColor whiteColor];
    [station0302.drawPrimitives addObject:fillCircle0377];

    station0302.showNameOnMap = false;
    [station0302.drawPrimitives addObject:drawTextLine0106];
    
    // Добавляем вершину
    edge0124.finishVertex = vertex0033;

    // Создаем участок линии Porte des Lilas - Place des Fêtes
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0125 = [[MWEdge alloc] init];
    edge0125.identifier = @"edge0125";
    edge0125.developmentName = @"Ребро: Porte des Lilas - Place des Fêtes";
    [self.edges addObject:edge0125];
    
    // Добавляем линию
    edge0125.line = line0013;
    
    // Добавляем вершину
    edge0125.startVertex = vertex0033;

    // Добавляем станцию Porte des Lilas
    [edge0125.elements addObject:station0302];

    // Добавляем перегон
    MWHaul *haul0292 = [[MWHaul alloc] init];
    haul0292.identifier = @"haul0292";
    haul0292.length = 581;
    [edge0125.elements addObject:haul0292];
    
    MWDrawLine *drawLine0427 = [[MWDrawLine alloc] init];
    drawLine0427.startPoint = CGPointMake(3866.5, 1657);
    drawLine0427.endPoint = CGPointMake(3859.5, 1664);
    drawLine0427.width = 11;
    drawLine0427.color = line0013.color;
    [haul0292.drawPrimitives addObject:drawLine0427];

    MWDrawArc *drawArc0123 = [[MWDrawArc alloc] init];
    drawArc0123.center = CGPointMake(3839, 1642);
    drawArc0123.startDegrees = 45;
    drawArc0123.endDegrees = 90;
    drawArc0123.radius = 30;
    drawArc0123.width = 11;
    drawArc0123.color = line0013.color;
    [haul0292.drawPrimitives addObject:drawArc0123];
    
    MWDrawLine *drawLine0428 = [[MWDrawLine alloc] init];
    drawLine0428.startPoint = CGPointMake(3839, 1672);
    drawLine0428.endPoint = CGPointMake(3767.5, 1672);
    drawLine0428.width = 11;
    drawLine0428.color = line0013.color;
    [haul0292.drawPrimitives addObject:drawLine0428];

    // Добавляем станцию Télégraphe
    MWStation *station0303 = [[MWStation alloc] init];
    station0303.identifier = @"station0303";
    [edge0125.elements addObject:station0303];
    
    station0303.nameOriginal = @"Télégraphe";
    station0303.mapLocation = CGPointMake(3767.5, 1672);
    station0303.geoLocation = CGPointMake(48.875463, 2.398434);
    
    MWDrawFillCircle *fillCircle0378 = [[MWDrawFillCircle alloc] init];
    fillCircle0378.center = station0303.mapLocation;
    fillCircle0378.radius = 12;
    fillCircle0378.fillColor = line0013.color;
    [station0303.drawPrimitives addObject:fillCircle0378];

    MWDrawTextLine *drawTextLine0395 = [[MWDrawTextLine alloc] init];
    drawTextLine0395.text = station0303.nameOriginal;
    drawTextLine0395.fontName = @"HelveticaNeue";
    drawTextLine0395.fontColor = [UIColor blackColor];
    drawTextLine0395.fontSize = 34;
    drawTextLine0395.kernSpacing = -0.8;
    drawTextLine0395.origin = CGPointMake(3691, 1683);
    [station0303.nameOriginalTextPrimitives addObject:drawTextLine0395];

    // Добавляем перегон
    MWHaul *haul0293 = [[MWHaul alloc] init];
    haul0293.identifier = @"haul0293";
    haul0293.length = 486;
    [edge0125.elements addObject:haul0293];

    MWDrawLine *drawLine0429 = [[MWDrawLine alloc] init];
    drawLine0429.startPoint = CGPointMake(3768, 1672);
    drawLine0429.endPoint = CGPointMake(3623, 1672);
    drawLine0429.width = 11;
    drawLine0429.color = line0013.color;
    [haul0293.drawPrimitives addObject:drawLine0429];

    // Добавляем станцию Place des Fêtes
    MWStation *station0304 = [[MWStation alloc] init];
    station0304.identifier = @"station0304";
    [edge0125.elements addObject:station0304];
    
    station0304.nameOriginal = @"Place des Fêtes";
    station0304.mapLocation = CGPointMake(3623, 1672);
    station0304.geoLocation = CGPointMake(48.87684, 2.39296);

    MWDrawFillCircle *fillCircle0379 = [[MWDrawFillCircle alloc] init];
    fillCircle0379.center = station0304.mapLocation;
    fillCircle0379.radius = 3;
    fillCircle0379.fillColor = [UIColor whiteColor];
    [station0304.drawPrimitives addObject:fillCircle0379];
    
    station0304.showNameOnMap = false;
    [station0304.nameOriginalTextPrimitives addObject:drawTextLine0271];
    [station0304.nameOriginalTextPrimitives addObject:drawTextLine0272];
    
    // Добавляем вершину
    edge0125.finishVertex = vertex0061;
    
    // Создаем участок линии Place des Fêtes - Belleville
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0126 = [[MWEdge alloc] init];
    edge0126.identifier = @"edge0126";
    edge0126.developmentName = @"Ребро: Place des Fêtes - Belleville";
    [self.edges addObject:edge0126];
    
    // Добавляем линию
    edge0126.line = line0013;
    
    // Добавляем вершину
    edge0126.startVertex = vertex0061;

    // Добавляем станцию Place des Fêtes
    [edge0126.elements addObject:station0304];

    // Добавляем перегон
    MWHaul *haul0294 = [[MWHaul alloc] init];
    haul0294.identifier = @"haul0294";
    haul0294.length = 370;
    [edge0126.elements addObject:haul0294];
    
    MWDrawLine *drawLine0430 = [[MWDrawLine alloc] init];
    drawLine0430.startPoint = CGPointMake(3623.5, 1672);
    drawLine0430.endPoint = CGPointMake(3478.5, 1672);
    drawLine0430.width = 11;
    drawLine0430.color = line0013.color;
    [haul0294.drawPrimitives addObject:drawLine0430];

    // Добавляем станцию Jourdain
    MWStation *station0305 = [[MWStation alloc] init];
    station0305.identifier = @"station0305";
    [edge0126.elements addObject:station0305];
    
    station0305.nameOriginal = @"Jourdain";
    station0305.mapLocation = CGPointMake(3478.5, 1672);
    station0305.geoLocation = CGPointMake(48.8752, 2.389508);
    
    MWDrawFillCircle *fillCircle0380 = [[MWDrawFillCircle alloc] init];
    fillCircle0380.center = station0305.mapLocation;
    fillCircle0380.radius = 12;
    fillCircle0380.fillColor = line0013.color;
    [station0305.drawPrimitives addObject:fillCircle0380];

    MWDrawTextLine *drawTextLine0396 = [[MWDrawTextLine alloc] init];
    drawTextLine0396.text = station0305.nameOriginal;
    drawTextLine0396.fontName = @"HelveticaNeue";
    drawTextLine0396.fontColor = [UIColor blackColor];
    drawTextLine0396.fontSize = 34;
    drawTextLine0396.kernSpacing = 0.2;
    drawTextLine0396.origin = CGPointMake(3403, 1683);
    [station0305.nameOriginalTextPrimitives addObject:drawTextLine0396];

    // Добавляем перегон
    MWHaul *haul0295 = [[MWHaul alloc] init];
    haul0295.identifier = @"haul0295";
    haul0295.length = 356;
    [edge0126.elements addObject:haul0295];
    
    MWDrawLine *drawLine0431 = [[MWDrawLine alloc] init];
    drawLine0431.startPoint = CGPointMake(3479, 1672);
    drawLine0431.endPoint = CGPointMake(3305.5, 1672);
    drawLine0431.width = 11;
    drawLine0431.color = line0013.color;
    [haul0295.drawPrimitives addObject:drawLine0431];

    // Добавляем станцию Pyrénées
    MWStation *station0306 = [[MWStation alloc] init];
    station0306.identifier = @"station0306";
    [edge0126.elements addObject:station0306];
    
    station0306.nameOriginal = @"Pyrénées";
    station0306.mapLocation = CGPointMake(3305.5, 1672);
    station0306.geoLocation = CGPointMake(48.873875, 2.385259);

    MWDrawFillCircle *fillCircle0381 = [[MWDrawFillCircle alloc] init];
    fillCircle0381.center = station0306.mapLocation;
    fillCircle0381.radius = 12;
    fillCircle0381.fillColor = line0013.color;
    [station0306.drawPrimitives addObject:fillCircle0381];
    
    MWDrawTextLine *drawTextLine0397 = [[MWDrawTextLine alloc] init];
    drawTextLine0397.text = station0306.nameOriginal;
    drawTextLine0397.fontName = @"HelveticaNeue";
    drawTextLine0397.fontColor = [UIColor blackColor];
    drawTextLine0397.fontSize = 34;
    drawTextLine0397.kernSpacing = -1.0;
    drawTextLine0397.origin = CGPointMake(3239, 1683);
    [station0306.nameOriginalTextPrimitives addObject:drawTextLine0397];

    // Добавляем перегон
    MWHaul *haul0296 = [[MWHaul alloc] init];
    haul0296.identifier = @"haul0296";
    haul0296.length = 644;
    [edge0126.elements addObject:haul0296];
    
    MWDrawLine *drawLine0432 = [[MWDrawLine alloc] init];
    drawLine0432.startPoint = CGPointMake(3306, 1672);
    drawLine0432.endPoint = CGPointMake(3240, 1672);
    drawLine0432.width = 11;
    drawLine0432.color = line0013.color;
    [haul0296.drawPrimitives addObject:drawLine0432];

    MWDrawArc *drawArc0124 = [[MWDrawArc alloc] init];
    drawArc0124.center = CGPointMake(3240.5, 1702);
    drawArc0124.startDegrees = 225;
    drawArc0124.endDegrees = 270;
    drawArc0124.radius = 30;
    drawArc0124.width = 11;
    drawArc0124.color = line0013.color;
    [haul0296.drawPrimitives addObject:drawArc0124];

    MWDrawLine *drawLine0433 = [[MWDrawLine alloc] init];
    drawLine0433.startPoint = CGPointMake(3220, 1680);
    drawLine0433.endPoint = CGPointMake(3161.5, 1738.5);
    drawLine0433.width = 11;
    drawLine0433.color = line0013.color;
    [haul0296.drawPrimitives addObject:drawLine0433];

    // Добавляем станцию Belleville
    MWStation *station0307 = [[MWStation alloc] init];
    station0307.identifier = @"station0307";
    [edge0126.elements addObject:station0307];
    
    station0307.nameOriginal = @"Belleville";
    station0307.mapLocation = CGPointMake(3161.5, 1738.5);
    station0307.geoLocation = CGPointMake(48.872083, 2.376947);

    MWDrawFillCircle *fillCircle0382 = [[MWDrawFillCircle alloc] init];
    fillCircle0382.center = station0307.mapLocation;
    fillCircle0382.radius = 3;
    fillCircle0382.fillColor = [UIColor whiteColor];
    [station0307.drawPrimitives addObject:fillCircle0382];

    station0307.showNameOnMap = false;
    [station0307.nameOriginalTextPrimitives addObject:drawTextLine0062];
    
    // Добавляем вершину
    edge0126.finishVertex = vertex0022;
    
    // Создаем участок линии Belleville - République
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0127 = [[MWEdge alloc] init];
    edge0127.identifier = @"edge0127";
    edge0127.developmentName = @"Ребро: Belleville - République";
    [self.edges addObject:edge0127];
    
    // Добавляем линию
    edge0127.line = line0013;
    
    // Добавляем вершину
    edge0127.startVertex = vertex0022;

    // Добавляем станцию Belleville
    [edge0127.elements addObject:station0307];

    // Добавляем перегон
    MWHaul *haul0297 = [[MWHaul alloc] init];
    haul0297.identifier = @"haul0297";
    haul0297.length = 500;
    [edge0127.elements addObject:haul0297];
    
    MWDrawLine *drawLine0434 = [[MWDrawLine alloc] init];
    drawLine0434.startPoint = CGPointMake(3162, 1738);
    drawLine0434.endPoint = CGPointMake(3049, 1850.5);
    drawLine0434.width = 11;
    drawLine0434.color = line0013.color;
    [haul0297.drawPrimitives addObject:drawLine0434];

    // Добавляем станцию Goncourt
    MWStation *station0308 = [[MWStation alloc] init];
    station0308.identifier = @"station0308";
    [edge0127.elements addObject:station0308];
    
    station0308.nameOriginal = @"Goncourt";
    station0308.mapLocation = CGPointMake(3049, 1850.5);
    station0308.geoLocation = CGPointMake(48.869831, 2.370687);

    MWDrawFillCircle *fillCircle0383 = [[MWDrawFillCircle alloc] init];
    fillCircle0383.center = station0308.mapLocation;
    fillCircle0383.radius = 12;
    fillCircle0383.fillColor = line0013.color;
    [station0308.drawPrimitives addObject:fillCircle0383];

    MWDrawTextLine *drawTextLine0398 = [[MWDrawTextLine alloc] init];
    drawTextLine0398.text = station0308.nameOriginal;
    drawTextLine0398.fontName = @"HelveticaNeue";
    drawTextLine0398.fontColor = [UIColor blackColor];
    drawTextLine0398.fontSize = 34;
    drawTextLine0398.kernSpacing = -0.6;
    drawTextLine0398.origin = CGPointMake(3061, 1854);
    [station0308.nameOriginalTextPrimitives addObject:drawTextLine0398];

    // Добавляем перегон
    MWHaul *haul0298 = [[MWHaul alloc] init];
    haul0298.identifier = @"haul0298";
    haul0298.length = 571;
    [edge0127.elements addObject:haul0298];
    
    MWDrawLine *drawLine0435 = [[MWDrawLine alloc] init];
    drawLine0435.startPoint = CGPointMake(3049.5, 1850);
    drawLine0435.endPoint = CGPointMake(2920, 1979);
    drawLine0435.width = 11;
    drawLine0435.color = line0013.color;
    [haul0298.drawPrimitives addObject:drawLine0435];

    // Добавляем станцию République
    MWStation *station0309 = [[MWStation alloc] init];
    station0309.identifier = @"station0309";
    [edge0127.elements addObject:station0309];
    
    station0309.nameOriginal = @"République";
    station0309.mapLocation = CGPointMake(2920, 1979);
    station0309.geoLocation = CGPointMake(48.867503, 2.363811);

    MWDrawFillCircle *fillCircle0384 = [[MWDrawFillCircle alloc] init];
    fillCircle0384.center = station0309.mapLocation;
    fillCircle0384.radius = 3;
    fillCircle0384.fillColor = [UIColor whiteColor];
    [station0309.drawPrimitives addObject:fillCircle0384];

    station0309.showNameOnMap = false;
    [station0309.nameOriginalTextPrimitives addObject:drawTextLine0095];
    
    // Добавляем вершину
    edge0127.finishVertex = vertex0030;

    // Создаем участок линии République - Arts et Métiers
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0128 = [[MWEdge alloc] init];
    edge0128.identifier = @"edge0128";
    edge0128.developmentName = @"Ребро: République - Arts et Métiers";
    [self.edges addObject:edge0128];
    
    // Добавляем линию
    edge0128.line = line0013;
    
    // Добавляем вершину
    edge0128.startVertex = vertex0030;
    
    // Добавляем станцию République
    [edge0128.elements addObject:station0309];

    // Добавляем перегон
    MWHaul *haul0299 = [[MWHaul alloc] init];
    haul0299.identifier = @"haul0299";
    haul0299.length = 629;
    [edge0128.elements addObject:haul0299];
    
    MWDrawLine *drawLine0436 = [[MWDrawLine alloc] init];
    drawLine0436.startPoint = CGPointMake(2920.5, 1978.5);
    drawLine0436.endPoint = CGPointMake(2781.5, 2119);
    drawLine0436.width = 11;
    drawLine0436.color = line0013.color;
    [haul0299.drawPrimitives addObject:drawLine0436];

    // Добавляем станцию Arts et Métiers
    MWStation *station0310 = [[MWStation alloc] init];
    station0310.identifier = @"station0310";
    [edge0128.elements addObject:station0310];
    
    station0310.nameOriginal = @"Arts et Métiers";
    station0310.mapLocation = CGPointMake(2781.5, 2119);
    station0310.geoLocation = CGPointMake(48.8655, 2.3561);
    
    MWDrawFillCircle *fillCircle0385 = [[MWDrawFillCircle alloc] init];
    fillCircle0385.center = station0310.mapLocation;
    fillCircle0385.radius = 3;
    fillCircle0385.fillColor = [UIColor whiteColor];
    [station0310.drawPrimitives addObject:fillCircle0385];

    station0310.showNameOnMap = false;
    [station0310.nameOriginalTextPrimitives addObject:drawTextLine0092];
    [station0310.nameOriginalTextPrimitives addObject:drawTextLine0093];

    // Добавляем вершину
    edge0128.finishVertex = vertex0029;

    // Создаем участок линии Arts et Métiers - Hôtel de Ville
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0129 = [[MWEdge alloc] init];
    edge0129.identifier = @"edge0129";
    edge0129.developmentName = @"Ребро: Arts et Métiers - Hôtel de Ville";
    [self.edges addObject:edge0129];
    
    // Добавляем линию
    edge0129.line = line0013;
    
    // Добавляем вершину
    edge0129.startVertex = vertex0029;

    // Добавляем станцию Arts et Métiers
    [edge0129.elements addObject:station0310];

    // Добавляем перегон
    MWHaul *haul0300 = [[MWHaul alloc] init];
    haul0300.identifier = @"haul0300";
    haul0300.length = 438;
    [edge0129.elements addObject:haul0300];
    
    MWDrawLine *drawLine0437 = [[MWDrawLine alloc] init];
    drawLine0437.startPoint = CGPointMake(2782, 2118.5);
    drawLine0437.endPoint = CGPointMake(2658, 2242);
    drawLine0437.width = 11;
    drawLine0437.color = line0013.color;
    [haul0300.drawPrimitives addObject:drawLine0437];

    // Добавляем станцию Rambuteau
    MWStation *station0311 = [[MWStation alloc] init];
    station0311.identifier = @"station0311";
    [edge0129.elements addObject:station0311];

    station0311.nameOriginal = @"Rambuteau";
    station0311.mapLocation = CGPointMake(2658, 2242);
    station0311.geoLocation = CGPointMake(48.86119, 2.35343);
    
    MWDrawFillCircle *fillCircle0386 = [[MWDrawFillCircle alloc] init];
    fillCircle0386.center = station0311.mapLocation;
    fillCircle0386.radius = 12;
    fillCircle0386.fillColor = line0013.color;
    [station0311.drawPrimitives addObject:fillCircle0386];

    MWDrawTextLine *drawTextLine0399 = [[MWDrawTextLine alloc] init];
    drawTextLine0399.text = station0311.nameOriginal;
    drawTextLine0399.fontName = @"HelveticaNeue";
    drawTextLine0399.fontColor = [UIColor blackColor];
    drawTextLine0399.fontSize = 34;
    drawTextLine0399.kernSpacing = -0.6;
    drawTextLine0399.origin = CGPointMake(2651, 2248);
    [station0311.nameOriginalTextPrimitives addObject:drawTextLine0399];

    // Добавляем перегон
    MWHaul *haul0301 = [[MWHaul alloc] init];
    haul0301.identifier = @"haul0301";
    haul0301.length = 524;
    [edge0129.elements addObject:haul0301];
    
    MWDrawLine *drawLine0438 = [[MWDrawLine alloc] init];
    drawLine0438.startPoint = CGPointMake(2658.5, 2241.5);
    drawLine0438.endPoint = CGPointMake(2545.5, 2354.5);
    drawLine0438.width = 11;
    drawLine0438.color = line0013.color;
    [haul0301.drawPrimitives addObject:drawLine0438];

    // Добавляем станцию Hôtel de Ville
    MWStation *station0312 = [[MWStation alloc] init];
    station0312.identifier = @"station0312";
    [edge0129.elements addObject:station0312];
    
    station0312.nameOriginal = @"Hôtel de Ville";
    station0312.mapLocation = CGPointMake(2545.5, 2354.5);
    station0312.geoLocation = CGPointMake(48.857487, 2.351525);

    MWDrawFillCircle *fillCircle0387 = [[MWDrawFillCircle alloc] init];
    fillCircle0387.center = station0312.mapLocation;
    fillCircle0387.radius = 3;
    fillCircle0387.fillColor = [UIColor whiteColor];
    [station0312.drawPrimitives addObject:fillCircle0387];

    station0312.showNameOnMap = false;
    [station0312.nameOriginalTextPrimitives addObject:drawTextLine0027];
    
    // Добавляем вершину
    edge0129.finishVertex = vertex0008;

    // Создаем участок линии Hôtel de Ville - Châtelet
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0130 = [[MWEdge alloc] init];
    edge0130.identifier = @"edge0130";
    edge0130.developmentName = @"Ребро: Hôtel de Ville - Châtelet";
    [self.edges addObject:edge0130];
    
    // Добавляем линию
    edge0130.line = line0013;
    
    // Добавляем вершину
    edge0130.startVertex = vertex0008;

    // Добавляем станцию Hôtel de Ville
    [edge0130.elements addObject:station0312];

    // Добавляем перегон
    MWHaul *haul0302 = [[MWHaul alloc] init];
    haul0302.identifier = @"haul0302";
    haul0302.length = 328;
    [edge0130.elements addObject:haul0302];
    
    MWDrawLine *drawLine0439 = [[MWDrawLine alloc] init];
    drawLine0439.startPoint = CGPointMake(2546, 2354);
    drawLine0439.endPoint = CGPointMake(2513.25, 2386.75);
    drawLine0439.width = 11;
    drawLine0439.color = line0013.color;
    [haul0302.drawPrimitives addObject:drawLine0439];

    MWDrawArc *drawArc0125 = [[MWDrawArc alloc] init];
    drawArc0125.center = CGPointMake(2492.5, 2365);
    drawArc0125.startDegrees = 45;
    drawArc0125.endDegrees = 90;
    drawArc0125.radius = 30;
    drawArc0125.width = 11;
    drawArc0125.color = line0013.color;
    [haul0302.drawPrimitives addObject:drawArc0125];

    MWDrawLine *drawLine0440 = [[MWDrawLine alloc] init];
    drawLine0440.startPoint = CGPointMake(2493, 2395);
    drawLine0440.endPoint = CGPointMake(2365.5, 2395);
    drawLine0440.width = 11;
    drawLine0440.color = line0013.color;
    [haul0302.drawPrimitives addObject:drawLine0440];

    // Добавляем станцию Châtelet
    MWStation *station0313 = [[MWStation alloc] init];
    station0313.identifier = @"station0313";
    [edge0130.elements addObject:station0313];
    
    station0313.nameOriginal = @"Châtelet";
    station0313.mapLocation = CGPointMake(2365.5, 2395);
    station0313.geoLocation = CGPointMake(48.858352, 2.347324);
    
    MWDrawFillCircle *fillCircle0388 = [[MWDrawFillCircle alloc] init];
    fillCircle0388.center = station0313.mapLocation;
    fillCircle0388.radius = 5.5;
    fillCircle0388.fillColor = line0013.color;
    [station0313.drawPrimitives addObject:fillCircle0388];

    station0313.showNameOnMap = false;
    [station0313.nameOriginalTextPrimitives addObject:drawTextLine0026];
    
    MWDrawFillCircle *fillCircle0389 = [[MWDrawFillCircle alloc] init];
    fillCircle0389.center = CGPointMake(2438, 2440);
    fillCircle0389.radius = 28;
    fillCircle0389.fillColor = line0013.color;
    [station0313.drawPrimitives addObject:fillCircle0389];
    
    MWDrawTextLine *drawTextLine0400 = [[MWDrawTextLine alloc] init];
    drawTextLine0400.text = @"11";
    drawTextLine0400.fontName = @"HelveticaNeue-Bold";
    drawTextLine0400.fontColor = [UIColor whiteColor];
    drawTextLine0400.fontSize = 44;
    drawTextLine0400.origin = CGPointMake(2414, 2412);
    [station0313.drawPrimitives addObject:drawTextLine0400];

    // Добавляем вершину
    edge0130.finishVertex = vertex0007;
    
    ////////////////////////////////////////////////////////////////
    // Line 12
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Front Populaire - Marcadet – Poissonniers
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0131 = [[MWEdge alloc] init];
    edge0131.identifier = @"edge0131";
    edge0131.developmentName = @"Ребро: Front Populaire - Marcadet – Poissonniers";
    [self.edges addObject:edge0131];
    
    // Добавляем линию
    edge0131.line = line0014;
    
    // Добавляем вершину
    edge0131.startVertex = vertex0079;

    // Добавляем станцию Front Populaire
    MWStation *station0314 = [[MWStation alloc] init];
    station0314.identifier = @"station0314";
    [edge0131.elements addObject:station0314];
    
    station0314.nameOriginal = @"Front Populaire";
    station0314.mapLocation = CGPointMake(2952.5, 886);
    station0314.geoLocation = CGPointMake(48.9068, 2.366);

    MWDrawFillCircle *fillCircle0390 = [[MWDrawFillCircle alloc] init];
    fillCircle0390.center = CGPointMake(2955, 839.5);
    fillCircle0390.radius = 28;
    fillCircle0390.fillColor = line0014.color;
    [station0314.drawPrimitives addObject:fillCircle0390];

    MWDrawTextLine *drawTextLine0401 = [[MWDrawTextLine alloc] init];
    drawTextLine0401.text = @"12";
    drawTextLine0401.fontName = @"HelveticaNeue-Bold";
    drawTextLine0401.fontColor = [UIColor whiteColor];
    drawTextLine0401.fontSize = 44;
    drawTextLine0401.origin = CGPointMake(2928, 811.5);
    [station0314.drawPrimitives addObject:drawTextLine0401];

    MWDrawTextLine *drawTextLine0402 = [[MWDrawTextLine alloc] init];
    drawTextLine0402.text = @"Front";
    drawTextLine0402.fontName = @"Helvetica-Bold";
    drawTextLine0402.fontColor = [UIColor blackColor];
    drawTextLine0402.fontSize = 30;
    drawTextLine0402.kernSpacing = 1.6;
    drawTextLine0402.origin = CGPointMake(2988, 833);
    [station0314.drawPrimitives addObject:drawTextLine0402];

    MWDrawTextLine *drawTextLine0403 = [[MWDrawTextLine alloc] init];
    drawTextLine0403.text = @"Populaire";
    drawTextLine0403.fontName = @"Helvetica-Bold";
    drawTextLine0403.fontColor = [UIColor blackColor];
    drawTextLine0403.fontSize = 30;
    drawTextLine0403.kernSpacing = 1.6;
    drawTextLine0403.origin = CGPointMake(2988, 867);
    [station0314.drawPrimitives addObject:drawTextLine0403];

    MWDrawFillCircle *fillCircle0391 = [[MWDrawFillCircle alloc] init];
    fillCircle0391.center = station0314.mapLocation;
    fillCircle0391.radius = 12;
    fillCircle0391.fillColor = [UIColor blackColor];
    [station0314.drawPrimitives addObject:fillCircle0391];

    // Добавляем перегон
    MWHaul *haul0303 = [[MWHaul alloc] init];
    haul0303.identifier = @"haul0303";
    haul0303.length = 1455;
    [edge0131.elements addObject:haul0303];
    
    MWDrawLine *drawLine0441 = [[MWDrawLine alloc] init];
    drawLine0441.startPoint = CGPointMake(2952.5, 886);
    drawLine0441.endPoint = CGPointMake(2815, 886);
    drawLine0441.width = 11;
    drawLine0441.color = line0014.color;
    [haul0303.drawPrimitives addObject:drawLine0441];

    MWDrawArc *drawArc0126 = [[MWDrawArc alloc] init];
    drawArc0126.center = CGPointMake(2815, 901);
    drawArc0126.startDegrees = 180;
    drawArc0126.endDegrees = 270;
    drawArc0126.radius = 15;
    drawArc0126.width = 11;
    drawArc0126.color = line0014.color;
    [haul0303.drawPrimitives addObject:drawArc0126];

    MWDrawLine *drawLine0442 = [[MWDrawLine alloc] init];
    drawLine0442.startPoint = CGPointMake(2800, 901);
    drawLine0442.endPoint = CGPointMake(2800, 950);
    drawLine0442.width = 11;
    drawLine0442.color = line0014.color;
    [haul0303.drawPrimitives addObject:drawLine0442];

    // Добавляем станцию Porte de la Chapelle
    MWStation *station0315 = [[MWStation alloc] init];
    station0315.identifier = @"station0315";
    [edge0131.elements addObject:station0315];
    
    station0315.nameOriginal = @"Porte de la Chapelle";
    station0315.mapLocation = CGPointMake(2800, 950);
    station0315.geoLocation = CGPointMake(48.897274, 2.359191);

    MWDrawFillCircle *fillCircle0392 = [[MWDrawFillCircle alloc] init];
    fillCircle0392.center = station0315.mapLocation;
    fillCircle0392.radius = 13;
    fillCircle0392.fillColor = [UIColor blackColor];
    [station0315.drawPrimitives addObject:fillCircle0392];

    MWDrawFillCircle *fillCircle0393 = [[MWDrawFillCircle alloc] init];
    fillCircle0393.center = station0315.mapLocation;
    fillCircle0393.radius = 11;
    fillCircle0393.fillColor = [UIColor whiteColor];
    [station0315.drawPrimitives addObject:fillCircle0393];

    MWDrawTextLine *drawTextLine0404 = [[MWDrawTextLine alloc] init];
    drawTextLine0404.text = @"Popte";
    drawTextLine0404.fontName = @"Helvetica-Bold";
    drawTextLine0404.fontColor = [UIColor blackColor];
    drawTextLine0404.fontSize = 30;
    drawTextLine0404.kernSpacing = 0.4;
    drawTextLine0404.origin = CGPointMake(2849, 891);
    [station0315.drawPrimitives addObject:drawTextLine0404];

    MWDrawTextLine *drawTextLine0405 = [[MWDrawTextLine alloc] init];
    drawTextLine0405.text = @"de la Chapelle";
    drawTextLine0405.fontName = @"Helvetica-Bold";
    drawTextLine0405.fontColor = [UIColor blackColor];
    drawTextLine0405.fontSize = 30;
    drawTextLine0405.kernSpacing = 1.4;
    drawTextLine0405.origin = CGPointMake(2849, 925);
    [station0315.drawPrimitives addObject:drawTextLine0405];

    // Добавляем перегон
    MWHaul *haul0304 = [[MWHaul alloc] init];
    haul0304.identifier = @"haul0304";
    haul0304.length = 733;
    [edge0131.elements addObject:haul0304];
    
    MWDrawLine *drawLine0443 = [[MWDrawLine alloc] init];
    drawLine0443.startPoint = CGPointMake(2800, 949.5);
    drawLine0443.endPoint = CGPointMake(2800, 1076.5);
    drawLine0443.width = 11;
    drawLine0443.color = line0014.color;
    [haul0304.drawPrimitives addObject:drawLine0443];

    // Добавляем станцию Marx Dormoy
    MWStation *station0316 = [[MWStation alloc] init];
    station0316.identifier = @"station0316";
    [edge0131.elements addObject:station0316];
    
    station0316.nameOriginal = @"Marx Dormoy";
    station0316.mapLocation = CGPointMake(2800, 1076.5);
    station0316.geoLocation = CGPointMake(48.891213, 2.359909);
    
    MWDrawFillCircle *fillCircle0394 = [[MWDrawFillCircle alloc] init];
    fillCircle0394.center = station0316.mapLocation;
    fillCircle0394.radius = 12;
    fillCircle0394.fillColor = line0014.color;
    [station0316.drawPrimitives addObject:fillCircle0394];

    MWDrawTextLine *drawTextLine0406 = [[MWDrawTextLine alloc] init];
    drawTextLine0406.text = @"Marx";
    drawTextLine0406.fontName = @"HelveticaNeue";
    drawTextLine0406.fontColor = [UIColor blackColor];
    drawTextLine0406.fontSize = 34;
    drawTextLine0406.kernSpacing = -0.6;
    drawTextLine0406.origin = CGPointMake(2819, 1021);
    [station0316.nameOriginalTextPrimitives addObject:drawTextLine0406];

    MWDrawTextLine *drawTextLine0407 = [[MWDrawTextLine alloc] init];
    drawTextLine0407.text = @"Dormoy";
    drawTextLine0407.fontName = @"HelveticaNeue";
    drawTextLine0407.fontColor = [UIColor blackColor];
    drawTextLine0407.fontSize = 34;
    drawTextLine0407.kernSpacing = -0.0;
    drawTextLine0407.origin = CGPointMake(2819, 1055);
    [station0316.nameOriginalTextPrimitives addObject:drawTextLine0407];

    // Добавляем перегон
    MWHaul *haul0305 = [[MWHaul alloc] init];
    haul0305.identifier = @"haul0305";
    haul0305.length = 799;
    [edge0131.elements addObject:haul0305];

    MWDrawLine *drawLine0444 = [[MWDrawLine alloc] init];
    drawLine0444.startPoint = CGPointMake(2800, 1076);
    drawLine0444.endPoint = CGPointMake(2800, 1106);
    drawLine0444.width = 11;
    drawLine0444.color = line0014.color;
    [haul0305.drawPrimitives addObject:drawLine0444];

    MWDrawArc *drawArc0127 = [[MWDrawArc alloc] init];
    drawArc0127.center = CGPointMake(2785, 1106);
    drawArc0127.startDegrees = 0;
    drawArc0127.endDegrees = 90;
    drawArc0127.radius = 15;
    drawArc0127.width = 11;
    drawArc0127.color = line0014.color;
    [haul0305.drawPrimitives addObject:drawArc0127];

    MWDrawLine *drawLine0445 = [[MWDrawLine alloc] init];
    drawLine0445.startPoint = CGPointMake(2785, 1121);
    drawLine0445.endPoint = CGPointMake(2442.5, 1121);
    drawLine0445.width = 11;
    drawLine0445.color = line0014.color;
    [haul0305.drawPrimitives addObject:drawLine0445];

    // Добавляем станцию Marcadet – Poissonniers
    MWStation *station0317 = [[MWStation alloc] init];
    station0317.identifier = @"station0317";
    [edge0131.elements addObject:station0317];
    
    station0317.nameOriginal = @"Marcadet – Poissonniers";
    station0317.mapLocation = CGPointMake(2442.5, 1121);
    station0317.geoLocation = CGPointMake(48.890278, 2.35);

    MWDrawFillCircle *fillCircle0395 = [[MWDrawFillCircle alloc] init];
    fillCircle0395.center = station0317.mapLocation;
    fillCircle0395.radius = 3;
    fillCircle0395.fillColor = [UIColor whiteColor];
    [station0317.drawPrimitives addObject:fillCircle0395];

    station0317.showNameOnMap = false;
    [station0317.nameOriginalTextPrimitives addObject:drawTextLine0115];
    [station0317.nameOriginalTextPrimitives addObject:drawTextLine0116];
    
    // Добавляем вершину
    edge0131.finishVertex = vertex0035;
    
    // Создаем участок линии Marcadet – Poissonniers - Pigalle
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0132 = [[MWEdge alloc] init];
    edge0132.identifier = @"edge0132";
    edge0132.developmentName = @"Ребро: Marcadet – Poissonniers - Pigalle";
    [self.edges addObject:edge0132];
    
    // Добавляем линию
    edge0132.line = line0014;
    
    // Добавляем вершину
    edge0132.startVertex = vertex0035;

    // Добавляем станцию Marcadet – Poissonniers
    [edge0132.elements addObject:station0317];

    // Добавляем перегон
    MWHaul *haul0306 = [[MWHaul alloc] init];
    haul0306.identifier = @"haul0306";
    haul0306.length = 397;
    [edge0132.elements addObject:haul0306];
    
    MWDrawLine *drawLine0446 = [[MWDrawLine alloc] init];
    drawLine0446.startPoint = CGPointMake(2443, 1121);
    drawLine0446.endPoint = CGPointMake(2312, 1121);
    drawLine0446.width = 11;
    drawLine0446.color = line0014.color;
    [haul0306.drawPrimitives addObject:drawLine0446];

    // Добавляем станцию Jules Joffrin
    MWStation *station0318 = [[MWStation alloc] init];
    station0318.identifier = @"station0318";
    [edge0132.elements addObject:station0318];
    
    station0318.nameOriginal = @"Jules Joffrin";
    station0318.mapLocation = CGPointMake(2312, 1121);
    station0318.geoLocation = CGPointMake(48.892437, 2.344782);

    MWDrawFillCircle *fillCircle0396 = [[MWDrawFillCircle alloc] init];
    fillCircle0396.center = station0318.mapLocation;
    fillCircle0396.radius = 12;
    fillCircle0396.fillColor = line0014.color;
    [station0318.drawPrimitives addObject:fillCircle0396];

    MWDrawTextLine *drawTextLine0408 = [[MWDrawTextLine alloc] init];
    drawTextLine0408.text = @"Jules";
    drawTextLine0408.fontName = @"HelveticaNeue";
    drawTextLine0408.fontColor = [UIColor blackColor];
    drawTextLine0408.fontSize = 34;
    drawTextLine0408.kernSpacing = -0.8;
    drawTextLine0408.origin = CGPointMake(2272, 1032);
    [station0318.nameOriginalTextPrimitives addObject:drawTextLine0408];

    MWDrawTextLine *drawTextLine0409 = [[MWDrawTextLine alloc] init];
    drawTextLine0409.text = @"Joffrin";
    drawTextLine0409.fontName = @"HelveticaNeue";
    drawTextLine0409.fontColor = [UIColor blackColor];
    drawTextLine0409.fontSize = 34;
    drawTextLine0409.kernSpacing = 0.8;
    drawTextLine0409.origin = CGPointMake(2260, 1066);
    [station0318.nameOriginalTextPrimitives addObject:drawTextLine0409];

    // Добавляем перегон
    MWHaul *haul0307 = [[MWHaul alloc] init];
    haul0307.identifier = @"haul0307";
    haul0307.length = 619;
    [edge0132.elements addObject:haul0307];
    
    MWDrawLine *drawLine0447 = [[MWDrawLine alloc] init];
    drawLine0447.startPoint = CGPointMake(2312.5, 1121);
    drawLine0447.endPoint = CGPointMake(2210, 1121);
    drawLine0447.width = 11;
    drawLine0447.color = line0014.color;
    [haul0307.drawPrimitives addObject:drawLine0447];

    MWDrawArc *drawArc0128 = [[MWDrawArc alloc] init];
    drawArc0128.center = CGPointMake(2210, 1136);
    drawArc0128.startDegrees = 180;
    drawArc0128.endDegrees = 270;
    drawArc0128.radius = 15;
    drawArc0128.width = 11;
    drawArc0128.color = line0014.color;
    [haul0307.drawPrimitives addObject:drawArc0128];

    MWDrawLine *drawLine0448 = [[MWDrawLine alloc] init];
    drawLine0448.startPoint = CGPointMake(2195, 1136);
    drawLine0448.endPoint = CGPointMake(2195, 1137.5);
    drawLine0448.width = 11;
    drawLine0448.color = line0014.color;
    [haul0307.drawPrimitives addObject:drawLine0448];

    // Добавляем станцию Lamarck – Caulaincourt
    MWStation *station0319 = [[MWStation alloc] init];
    station0319.identifier = @"station0319";
    [edge0132.elements addObject:station0319];
    
    station0319.nameOriginal = @"Lamarck – Caulaincourt";
    station0319.mapLocation = CGPointMake(2195, 1137.5);
    station0319.geoLocation = CGPointMake(48.889139, 2.338159);

    MWDrawFillCircle *fillCircle0397 = [[MWDrawFillCircle alloc] init];
    fillCircle0397.center = station0319.mapLocation;
    fillCircle0397.radius = 12;
    fillCircle0397.fillColor = line0014.color;
    [station0319.drawPrimitives addObject:fillCircle0397];

    MWDrawTextLine *drawTextLine0410 = [[MWDrawTextLine alloc] init];
    drawTextLine0410.text = @"Lamarck";
    drawTextLine0410.fontName = @"HelveticaNeue";
    drawTextLine0410.fontColor = [UIColor blackColor];
    drawTextLine0410.fontSize = 34;
    drawTextLine0410.kernSpacing = -1.0;
    drawTextLine0410.origin = CGPointMake(2047, 1072);
    [station0319.nameOriginalTextPrimitives addObject:drawTextLine0410];

    MWDrawTextLine *drawTextLine0411 = [[MWDrawTextLine alloc] init];
    drawTextLine0411.text = @"Caulaincourt";
    drawTextLine0411.fontName = @"HelveticaNeue";
    drawTextLine0411.fontColor = [UIColor blackColor];
    drawTextLine0411.fontSize = 34;
    drawTextLine0411.kernSpacing = -0.2;
    drawTextLine0411.origin = CGPointMake(1977, 1105);
    [station0319.nameOriginalTextPrimitives addObject:drawTextLine0411];

    // Добавляем перегон
    MWHaul *haul0308 = [[MWHaul alloc] init];
    haul0308.identifier = @"haul0308";
    haul0308.length = 595;
    [edge0132.elements addObject:haul0308];
    
    MWDrawLine *drawLine0449 = [[MWDrawLine alloc] init];
    drawLine0449.startPoint = CGPointMake(2195, 1137);
    drawLine0449.endPoint = CGPointMake(2195, 1232.5);
    drawLine0449.width = 11;
    drawLine0449.color = line0014.color;
    [haul0308.drawPrimitives addObject:drawLine0449];

    // Добавляем станцию Abbesses
    MWStation *station0320 = [[MWStation alloc] init];
    station0320.identifier = @"station0320";
    [edge0132.elements addObject:station0320];
    
    station0320.nameOriginal = @"Abbesses";
    station0320.mapLocation = CGPointMake(2195, 1232.5);
    station0320.geoLocation = CGPointMake(48.884849, 2.338688);

    MWDrawFillCircle *fillCircle0398 = [[MWDrawFillCircle alloc] init];
    fillCircle0398.center = station0320.mapLocation;
    fillCircle0398.radius = 13;
    fillCircle0398.fillColor = [UIColor blackColor];
    [station0320.drawPrimitives addObject:fillCircle0398];

    MWDrawFillCircle *fillCircle0399 = [[MWDrawFillCircle alloc] init];
    fillCircle0399.center = station0320.mapLocation;
    fillCircle0399.radius = 11;
    fillCircle0399.fillColor = [UIColor whiteColor];
    [station0320.drawPrimitives addObject:fillCircle0399];

    MWDrawTextLine *drawTextLine0412 = [[MWDrawTextLine alloc] init];
    drawTextLine0412.text = station0320.nameOriginal;
    drawTextLine0412.fontName = @"HelveticaNeue";
    drawTextLine0412.fontColor = [UIColor blackColor];
    drawTextLine0412.fontSize = 34;
    drawTextLine0412.kernSpacing = -1.8;
    drawTextLine0412.origin = CGPointMake(2040, 1210);
    [station0320.nameOriginalTextPrimitives addObject:drawTextLine0412];

    // Добавляем перегон
    MWHaul *haul0309 = [[MWHaul alloc] init];
    haul0309.identifier = @"haul0309";
    haul0309.length = 240;
    [edge0132.elements addObject:haul0309];
    
    MWDrawLine *drawLine0450 = [[MWDrawLine alloc] init];
    drawLine0450.startPoint = CGPointMake(2195, 1232);
    drawLine0450.endPoint = CGPointMake(2195, 1327);
    drawLine0450.width = 11;
    drawLine0450.color = line0014.color;
    [haul0309.drawPrimitives addObject:drawLine0450];

    // Добавляем станцию Pigalle
    MWStation *station0321 = [[MWStation alloc] init];
    station0321.identifier = @"station0321";
    [edge0132.elements addObject:station0321];
    
    station0321.nameOriginal = @"Pigalle";
    station0321.mapLocation = CGPointMake(2195, 1327);
    station0321.geoLocation = CGPointMake(48.882255, 2.337573);

    MWDrawFillCircle *fillCircle0400 = [[MWDrawFillCircle alloc] init];
    fillCircle0400.center = station0321.mapLocation;
    fillCircle0400.radius = 3;
    fillCircle0400.fillColor = [UIColor whiteColor];
    [station0321.drawPrimitives addObject:fillCircle0400];

    station0321.showNameOnMap = false;
    [station0321.nameOriginalTextPrimitives addObject:drawTextLine0053];
    
    // Добавляем вершину
    edge0132.finishVertex = vertex0017;
    
    // Создаем участок линии Pigalle - Saint-Lazare
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0133 = [[MWEdge alloc] init];
    edge0133.identifier = @"edge0133";
    edge0133.developmentName = @"Ребро: Pigalle - Saint-Lazare";
    [self.edges addObject:edge0133];
    
    // Добавляем линию
    edge0133.line = line0014;
    
    // Добавляем вершину
    edge0133.startVertex = vertex0017;

    // Добавляем станцию Pigalle
    [edge0133.elements addObject:station0321];

    // Добавляем перегон
    MWHaul *haul0310 = [[MWHaul alloc] init];
    haul0310.identifier = @"haul0310";
    haul0310.length = 454;
    [edge0133.elements addObject:haul0310];
    
    MWDrawLine *drawLine0451 = [[MWDrawLine alloc] init];
    drawLine0451.startPoint = CGPointMake(2195, 1326.5);
    drawLine0451.endPoint = CGPointMake(2195, 1488);
    drawLine0451.width = 11;
    drawLine0451.color = line0014.color;
    [haul0310.drawPrimitives addObject:drawLine0451];

    // Добавляем станцию Saint-Georges
    MWStation *station0322 = [[MWStation alloc] init];
    station0322.identifier = @"station0322";
    [edge0133.elements addObject:station0322];
    
    station0322.nameOriginal = @"Saint-Georges";
    station0322.mapLocation = CGPointMake(2195, 1488);
    station0322.geoLocation = CGPointMake(48.878449, 2.337382);

    MWDrawFillCircle *fillCircle0401 = [[MWDrawFillCircle alloc] init];
    fillCircle0401.center = station0322.mapLocation;
    fillCircle0401.radius = 12;
    fillCircle0401.fillColor = line0014.color;
    [station0322.drawPrimitives addObject:fillCircle0401];

    MWDrawTextLine *drawTextLine0413 = [[MWDrawTextLine alloc] init];
    drawTextLine0413.text = station0322.nameOriginal;
    drawTextLine0413.fontName = @"HelveticaNeue";
    drawTextLine0413.fontColor = [UIColor blackColor];
    drawTextLine0413.fontSize = 34;
    drawTextLine0413.kernSpacing = -1.0;
    drawTextLine0413.origin = CGPointMake(1970, 1466);
    [station0322.nameOriginalTextPrimitives addObject:drawTextLine0413];

    // Добавляем перегон
    MWHaul *haul0311 = [[MWHaul alloc] init];
    haul0311.identifier = @"haul0311";
    haul0311.length = 357;
    [edge0133.elements addObject:haul0311];
    
    MWDrawLine *drawLine0452 = [[MWDrawLine alloc] init];
    drawLine0452.startPoint = CGPointMake(2195, 1487.5);
    drawLine0452.endPoint = CGPointMake(2195, 1635);
    drawLine0452.width = 11;
    drawLine0452.color = line0014.color;
    [haul0311.drawPrimitives addObject:drawLine0452];

    MWDrawArc *drawArc0129 = [[MWDrawArc alloc] init];
    drawArc0129.center = CGPointMake(2180, 1634.5);
    drawArc0129.startDegrees = 0;
    drawArc0129.endDegrees = 90;
    drawArc0129.radius = 15;
    drawArc0129.width = 11;
    drawArc0129.color = line0014.color;
    [haul0311.drawPrimitives addObject:drawArc0129];

    MWDrawLine *drawLine0453 = [[MWDrawLine alloc] init];
    drawLine0453.startPoint = CGPointMake(2180, 1649.5);
    drawLine0453.endPoint = CGPointMake(2146.5, 1649.5);
    drawLine0453.width = 11;
    drawLine0453.color = line0014.color;
    [haul0311.drawPrimitives addObject:drawLine0453];

    // Добавляем станцию Notre-Dame-de-Lorette
    MWStation *station0323 = [[MWStation alloc] init];
    station0323.identifier = @"station0323";
    [edge0133.elements addObject:station0323];
    
    station0323.nameOriginal = @"Notre-Dame-de-Lorette";
    station0323.mapLocation = CGPointMake(2146.5, 1649.5);
    station0323.geoLocation = CGPointMake(48.87604, 2.337341);

    MWDrawFillCircle *fillCircle0402 = [[MWDrawFillCircle alloc] init];
    fillCircle0402.center = station0323.mapLocation;
    fillCircle0402.radius = 12;
    fillCircle0402.fillColor = line0014.color;
    [station0323.drawPrimitives addObject:fillCircle0402];

    MWDrawTextLine *drawTextLine0414 = [[MWDrawTextLine alloc] init];
    drawTextLine0414.text = @"Notre-Dame";
    drawTextLine0414.fontName = @"HelveticaNeue";
    drawTextLine0414.fontColor = [UIColor blackColor];
    drawTextLine0414.fontSize = 34;
    drawTextLine0414.kernSpacing = -0.4;
    drawTextLine0414.origin = CGPointMake(1972, 1563);
    [station0323.nameOriginalTextPrimitives addObject:drawTextLine0414];

    MWDrawTextLine *drawTextLine0415 = [[MWDrawTextLine alloc] init];
    drawTextLine0415.text = @"de-Lorette";
    drawTextLine0415.fontName = @"HelveticaNeue";
    drawTextLine0415.fontColor = [UIColor blackColor];
    drawTextLine0415.fontSize = 34;
    drawTextLine0415.kernSpacing = -0.4;
    drawTextLine0415.origin = CGPointMake(1997, 1597);
    [station0323.nameOriginalTextPrimitives addObject:drawTextLine0415];

    // Добавляем перегон
    MWHaul *haul0312 = [[MWHaul alloc] init];
    haul0312.identifier = @"haul0312";
    haul0312.length = 338;
    [edge0133.elements addObject:haul0312];
    
    MWDrawLine *drawLine0454 = [[MWDrawLine alloc] init];
    drawLine0454.startPoint = CGPointMake(2147, 1649.5);
    drawLine0454.endPoint = CGPointMake(1925.5, 1649.5);
    drawLine0454.width = 11;
    drawLine0454.color = line0014.color;
    [haul0312.drawPrimitives addObject:drawLine0454];

    // Добавляем станцию Trinité – d'Estienne d'Orves
    MWStation *station0324 = [[MWStation alloc] init];
    station0324.identifier = @"station0324";
    [edge0133.elements addObject:station0324];
    
    station0324.nameOriginal = @"Trinité – d'Estienne d'Orves";
    station0324.mapLocation = CGPointMake(1925.5, 1649.5);
    station0324.geoLocation = CGPointMake(48.876302, 2.333197);

    MWDrawFillCircle *fillCircle0403 = [[MWDrawFillCircle alloc] init];
    fillCircle0403.center = station0324.mapLocation;
    fillCircle0403.radius = 12;
    fillCircle0403.fillColor = line0014.color;
    [station0324.drawPrimitives addObject:fillCircle0403];

    MWDrawTextLine *drawTextLine0416 = [[MWDrawTextLine alloc] init];
    drawTextLine0416.text = @"Trinité";
    drawTextLine0416.fontName = @"HelveticaNeue";
    drawTextLine0416.fontColor = [UIColor blackColor];
    drawTextLine0416.fontSize = 34;
    drawTextLine0416.kernSpacing = 0.9;
    drawTextLine0416.origin = CGPointMake(1837, 1528);
    [station0324.nameOriginalTextPrimitives addObject:drawTextLine0416];

    MWDrawTextLine *drawTextLine0417 = [[MWDrawTextLine alloc] init];
    drawTextLine0417.text = @"d'Estienne";
    drawTextLine0417.fontName = @"HelveticaNeue";
    drawTextLine0417.fontColor = [UIColor blackColor];
    drawTextLine0417.fontSize = 34;
    drawTextLine0417.kernSpacing = -0.2;
    drawTextLine0417.origin = CGPointMake(1777, 1561);
    [station0324.nameOriginalTextPrimitives addObject:drawTextLine0417];

    MWDrawTextLine *drawTextLine0418 = [[MWDrawTextLine alloc] init];
    drawTextLine0418.text = @"d'Orves";
    drawTextLine0418.fontName = @"HelveticaNeue";
    drawTextLine0418.fontColor = [UIColor blackColor];
    drawTextLine0418.fontSize = 34;
    drawTextLine0418.kernSpacing = -1.0;
    drawTextLine0418.origin = CGPointMake(1821, 1594);
    [station0324.nameOriginalTextPrimitives addObject:drawTextLine0418];

    // Добавляем перегон
    MWHaul *haul0313 = [[MWHaul alloc] init];
    haul0313.identifier = @"haul0313";
    haul0313.length = 489;
    [edge0133.elements addObject:haul0313];
    
    MWDrawLine *drawLine0455 = [[MWDrawLine alloc] init];
    drawLine0455.startPoint = CGPointMake(1926, 1649.5);
    drawLine0455.endPoint = CGPointMake(1791, 1649.5);
    drawLine0455.width = 11;
    drawLine0455.color = line0014.color;
    [haul0313.drawPrimitives addObject:drawLine0455];

    MWDrawArc *drawArc0130 = [[MWDrawArc alloc] init];
    drawArc0130.center = CGPointMake(1791, 1664.5);
    drawArc0130.startDegrees = 180;
    drawArc0130.endDegrees = 270;
    drawArc0130.radius = 15;
    drawArc0130.width = 11;
    drawArc0130.color = line0014.color;
    [haul0313.drawPrimitives addObject:drawArc0130];

    MWDrawLine *drawLine0456 = [[MWDrawLine alloc] init];
    drawLine0456.startPoint = CGPointMake(1776, 1664);
    drawLine0456.endPoint = CGPointMake(1776, 1744);
    drawLine0456.width = 11;
    drawLine0456.color = line0014.color;
    [haul0313.drawPrimitives addObject:drawLine0456];

    // Добавляем станцию Saint-Lazare
    MWStation *station0325 = [[MWStation alloc] init];
    station0325.identifier = @"station0325";
    [edge0133.elements addObject:station0325];
    
    station0325.nameOriginal = @"Saint-Lazare";
    station0325.mapLocation = CGPointMake(1776, 1744);
    station0325.geoLocation = CGPointMake(48.87549, 2.32664);

    MWDrawFillCircle *fillCircle0404 = [[MWDrawFillCircle alloc] init];
    fillCircle0404.center = station0325.mapLocation;
    fillCircle0404.radius = 3;
    fillCircle0404.fillColor = [UIColor whiteColor];
    [station0325.drawPrimitives addObject:fillCircle0404];

    station0325.showNameOnMap = false;
    [station0325.drawPrimitives addObject:drawTextLine0083];
    
    // Добавляем вершину
    edge0133.finishVertex = vertex0025;

    // Создаем участок линии Saint-Lazare - Madeleine
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0134 = [[MWEdge alloc] init];
    edge0134.identifier = @"edge0134";
    edge0134.developmentName = @"Ребро: Saint-Lazare - Madeleine";
    [self.edges addObject:edge0134];
    
    // Добавляем линию
    edge0134.line = line0014;
    
    // Добавляем вершину
    edge0134.startVertex = vertex0025;

    // Добавляем станцию Saint-Lazare
    [edge0134.elements addObject:station0325];

    // Добавляем перегон
    MWHaul *haul0314 = [[MWHaul alloc] init];
    haul0314.identifier = @"haul0314";
    haul0314.length = 603;
    [edge0134.elements addObject:haul0314];
    
    MWDrawLine *drawLine0457 = [[MWDrawLine alloc] init];
    drawLine0457.startPoint = CGPointMake(1776, 1743.5);
    drawLine0457.endPoint = CGPointMake(1776, 1756);
    drawLine0457.width = 11;
    drawLine0457.color = line0014.color;
    [haul0314.drawPrimitives addObject:drawLine0457];

    MWDrawArc *drawArc0131 = [[MWDrawArc alloc] init];
    drawArc0131.center = CGPointMake(1746, 1756);
    drawArc0131.startDegrees = 0;
    drawArc0131.endDegrees = 45;
    drawArc0131.radius = 30;
    drawArc0131.width = 11;
    drawArc0131.color = line0014.color;
    [haul0314.drawPrimitives addObject:drawArc0131];

    MWDrawLine *drawLine0458 = [[MWDrawLine alloc] init];
    drawLine0458.startPoint = CGPointMake(1543, 2001.5);
    drawLine0458.endPoint = CGPointMake(1768, 1776.5);
    drawLine0458.width = 11;
    drawLine0458.color = line0014.color;
    [haul0314.drawPrimitives addObject:drawLine0458];

    MWDrawArc *drawArc0132 = [[MWDrawArc alloc] init];
    drawArc0132.center = CGPointMake(1565, 2022);
    drawArc0132.startDegrees = 180;
    drawArc0132.endDegrees = 225;
    drawArc0132.radius = 30;
    drawArc0132.width = 11;
    drawArc0132.color = line0014.color;
    [haul0314.drawPrimitives addObject:drawArc0132];

    MWDrawLine *drawLine0459 = [[MWDrawLine alloc] init];
    drawLine0459.startPoint = CGPointMake(1535, 2022);
    drawLine0459.endPoint = CGPointMake(1535, 2142);
    drawLine0459.width = 11;
    drawLine0459.color = line0014.color;
    [haul0314.drawPrimitives addObject:drawLine0459];

    // Добавляем станцию Madeleine
    MWStation *station0326 = [[MWStation alloc] init];
    station0326.identifier = @"station0326";
    [edge0134.elements addObject:station0326];
    
    station0326.nameOriginal = @"Madeleine";
    station0326.mapLocation = CGPointMake(1535, 2142);
    station0326.geoLocation = CGPointMake(48.86977, 2.3244);
    
    MWDrawFillCircle *fillCircle0405 = [[MWDrawFillCircle alloc] init];
    fillCircle0405.center = station0326.mapLocation;
    fillCircle0405.radius = 3;
    fillCircle0405.fillColor = [UIColor whiteColor];
    [station0326.drawPrimitives addObject:fillCircle0405];

    station0326.showNameOnMap = false;
    [station0326.nameOriginalTextPrimitives addObject:drawTextLine0289];
    
    // Добавляем вершину
    edge0134.finishVertex = vertex0064;
    
    // Создаем участок линии Madeleine - Concorde
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0135 = [[MWEdge alloc] init];
    edge0135.identifier = @"edge0135";
    edge0135.developmentName = @"Ребро: Madeleine - Concorde";
    [self.edges addObject:edge0135];
    
    // Добавляем линию
    edge0135.line = line0014;
    
    // Добавляем вершину
    edge0135.startVertex = vertex0064;

    // Добавляем станцию Madeleine
    [edge0135.elements addObject:station0326];

    // Добавляем перегон
    MWHaul *haul0315 = [[MWHaul alloc] init];
    haul0315.identifier = @"haul0315";
    haul0315.length = 466;
    [edge0135.elements addObject:haul0315];
    
    MWDrawLine *drawLine0460 = [[MWDrawLine alloc] init];
    drawLine0460.startPoint = CGPointMake(1535, 2141.5);
    drawLine0460.endPoint = CGPointMake(1535, 2302.5);
    drawLine0460.width = 11;
    drawLine0460.color = line0014.color;
    [haul0315.drawPrimitives addObject:drawLine0460];

    // Добавляем станцию Concorde
    MWStation *station0327 = [[MWStation alloc] init];
    station0327.identifier = @"station0327";
    [edge0135.elements addObject:station0327];
    
    station0327.nameOriginal = @"Concorde";
    station0327.mapLocation = CGPointMake(1535, 2302.5);
    station0327.geoLocation = CGPointMake(48.86541, 2.32111);
    
    MWDrawFillCircle *fillCircle0406 = [[MWDrawFillCircle alloc] init];
    fillCircle0406.center = station0327.mapLocation;
    fillCircle0406.radius = 3;
    fillCircle0406.fillColor = [UIColor whiteColor];
    [station0327.drawPrimitives addObject:fillCircle0406];

    station0327.showNameOnMap = false;
    [station0327.nameOriginalTextPrimitives addObject:drawTextLine0019];
    
    // Добавляем вершину
    edge0135.finishVertex = vertex0005;
    
    // Создаем участок линии Madeleine - Sèvres – Babylone
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0136 = [[MWEdge alloc] init];
    edge0136.identifier = @"edge0136";
    edge0136.developmentName = @"Ребро: Madeleine - Sèvres – Babylone";
    [self.edges addObject:edge0136];
    
    // Добавляем линию
    edge0136.line = line0014;
    
    // Добавляем вершину
    edge0136.startVertex = vertex0005;

    // Добавляем станцию Concorde
    [edge0136.elements addObject:station0327];

    // Добавляем перегон
    MWHaul *haul0316 = [[MWHaul alloc] init];
    haul0316.identifier = @"haul0316";
    haul0316.length = 701;
    [edge0136.elements addObject:haul0316];
    
    MWDrawLine *drawLine0461 = [[MWDrawLine alloc] init];
    drawLine0461.startPoint = CGPointMake(1535, 2302);
    drawLine0461.endPoint = CGPointMake(1535, 2491);
    drawLine0461.width = 11;
    drawLine0461.color = line0014.color;
    [haul0316.drawPrimitives addObject:drawLine0461];

    MWDrawArc *drawArc0133 = [[MWDrawArc alloc] init];
    drawArc0133.center = CGPointMake(1565, 2491);
    drawArc0133.startDegrees = 135;
    drawArc0133.endDegrees = 180;
    drawArc0133.radius = 30;
    drawArc0133.width = 11;
    drawArc0133.color = line0014.color;
    [haul0316.drawPrimitives addObject:drawArc0133];
    
    // Добавляем станцию Assemblée Nationale
    MWStation *station0328 = [[MWStation alloc] init];
    station0328.identifier = @"station0328";
    [edge0136.elements addObject:station0328];
    
    station0328.nameOriginal = @"Assemblée Nationale";
    station0328.mapLocation = CGPointMake(1542, 2511.5);
    station0328.geoLocation = CGPointMake(48.860655, 2.32113);

    MWDrawFillCircle *fillCircle0407 = [[MWDrawFillCircle alloc] init];
    fillCircle0407.center = station0328.mapLocation;
    fillCircle0407.radius = 12;
    fillCircle0407.fillColor = line0014.color;
    [station0328.drawPrimitives addObject:fillCircle0407];

    MWDrawTextLine *drawTextLine0419 = [[MWDrawTextLine alloc] init];
    drawTextLine0419.text = station0328.nameOriginal;
    drawTextLine0419.fontName = @"HelveticaNeue";
    drawTextLine0419.fontColor = [UIColor blackColor];
    drawTextLine0419.fontSize = 34;
    drawTextLine0419.kernSpacing = -0.4;
    drawTextLine0419.origin = CGPointMake(1564, 2484);
    [station0328.nameOriginalTextPrimitives addObject:drawTextLine0419];
    
    // Добавляем перегон
    MWHaul *haul0317 = [[MWHaul alloc] init];
    haul0317.identifier = @"haul0317";
    haul0317.length = 331;
    [edge0136.elements addObject:haul0317];
    
    MWDrawLine *drawLine0462 = [[MWDrawLine alloc] init];
    drawLine0462.startPoint = CGPointMake(1542.5, 2511);
    drawLine0462.endPoint = CGPointMake(1636, 2606);
    drawLine0462.width = 11;
    drawLine0462.color = line0014.color;
    [haul0317.drawPrimitives addObject:drawLine0462];

    // Добавляем станцию Solférino
    MWStation *station0329 = [[MWStation alloc] init];
    station0329.identifier = @"station0329";
    [edge0136.elements addObject:station0329];
    
    station0329.nameOriginal = @"Solférino";
    station0329.mapLocation = CGPointMake(1636, 2606);
    station0329.geoLocation = CGPointMake(48.858249, 2.323225);

    MWDrawFillCircle *fillCircle0408 = [[MWDrawFillCircle alloc] init];
    fillCircle0408.center = station0329.mapLocation;
    fillCircle0408.radius = 13;
    fillCircle0408.fillColor = [UIColor blackColor];
    [station0329.drawPrimitives addObject:fillCircle0408];
    
    MWDrawFillCircle *fillCircle0409 = [[MWDrawFillCircle alloc] init];
    fillCircle0409.center = station0329.mapLocation;
    fillCircle0409.radius = 11;
    fillCircle0409.fillColor = [UIColor whiteColor];
    [station0329.drawPrimitives addObject:fillCircle0409];

    MWDrawTextLine *drawTextLine0420 = [[MWDrawTextLine alloc] init];
    drawTextLine0420.text = station0329.nameOriginal;
    drawTextLine0420.fontName = @"HelveticaNeue";
    drawTextLine0420.fontColor = [UIColor blackColor];
    drawTextLine0420.fontSize = 34;
    drawTextLine0420.kernSpacing = -0.2;
    drawTextLine0420.origin = CGPointMake(1654, 2565);
    [station0329.nameOriginalTextPrimitives addObject:drawTextLine0420];

    // Добавляем перегон
    MWHaul *haul0318 = [[MWHaul alloc] init];
    haul0318.identifier = @"haul0318";
    haul0318.length = 309;
    [edge0136.elements addObject:haul0318];
    
    MWDrawLine *drawLine0463 = [[MWDrawLine alloc] init];
    drawLine0463.startPoint = CGPointMake(1635.5, 2605.5);
    drawLine0463.endPoint = CGPointMake(1743, 2712);
    drawLine0463.width = 11;
    drawLine0463.color = line0014.color;
    [haul0318.drawPrimitives addObject:drawLine0463];

    // Добавляем станцию Rue du Bac
    MWStation *station0330 = [[MWStation alloc] init];
    station0330.identifier = @"station0330";
    [edge0136.elements addObject:station0330];
    
    station0330.nameOriginal = @"Rue du Bac";
    station0330.mapLocation = CGPointMake(1743, 2712);
    station0330.geoLocation = CGPointMake(48.85569, 2.325607);

    MWDrawFillCircle *fillCircle0410 = [[MWDrawFillCircle alloc] init];
    fillCircle0410.center = station0330.mapLocation;
    fillCircle0410.radius = 12;
    fillCircle0410.fillColor = line0014.color;
    [station0330.drawPrimitives addObject:fillCircle0410];

    MWDrawTextLine *drawTextLine0421 = [[MWDrawTextLine alloc] init];
    drawTextLine0421.text = @"Rue";
    drawTextLine0421.fontName = @"HelveticaNeue";
    drawTextLine0421.fontColor = [UIColor blackColor];
    drawTextLine0421.fontSize = 34;
    drawTextLine0421.kernSpacing = -0.6;
    drawTextLine0421.origin = CGPointMake(1754, 2632);
    [station0330.nameOriginalTextPrimitives addObject:drawTextLine0421];

    MWDrawTextLine *drawTextLine0422 = [[MWDrawTextLine alloc] init];
    drawTextLine0422.text = @"du Bac";
    drawTextLine0422.fontName = @"HelveticaNeue";
    drawTextLine0422.fontColor = [UIColor blackColor];
    drawTextLine0422.fontSize = 34;
    drawTextLine0422.kernSpacing = -0.6;
    drawTextLine0422.origin = CGPointMake(1754, 2665);
    [station0330.nameOriginalTextPrimitives addObject:drawTextLine0422];

    // Добавляем перегон
    MWHaul *haul0319 = [[MWHaul alloc] init];
    haul0319.identifier = @"haul0319";
    haul0319.length = 516;
    [edge0136.elements addObject:haul0319];
    
    MWDrawLine *drawLine0464 = [[MWDrawLine alloc] init];
    drawLine0464.startPoint = CGPointMake(1742.5, 2711.5);
    drawLine0464.endPoint = CGPointMake(1837.5, 2806.5);
    drawLine0464.width = 11;
    drawLine0464.color = line0014.color;
    [haul0319.drawPrimitives addObject:drawLine0464];

    // Добавляем станцию Sèvres – Babylone
    MWStation *station0331 = [[MWStation alloc] init];
    station0331.identifier = @"station0331";
    [edge0136.elements addObject:station0331];
    
    station0331.nameOriginal = @"Sèvres – Babylone";
    station0331.mapLocation = CGPointMake(1837.5, 2806.5);
    station0331.geoLocation = CGPointMake(48.85151, 2.326655);

    MWDrawFillCircle *fillCircle0411 = [[MWDrawFillCircle alloc] init];
    fillCircle0411.center = station0331.mapLocation;
    fillCircle0411.radius = 3;
    fillCircle0411.fillColor = [UIColor whiteColor];
    [station0331.drawPrimitives addObject:fillCircle0411];

    station0331.showNameOnMap = false;
    [station0331.drawPrimitives addObject:drawTextLine0383];
    [station0331.drawPrimitives addObject:drawTextLine0384];
    
    // Добавляем вершину
    edge0136.finishVertex = vertex0077;

    // Создаем участок линии Sèvres – Babylone - Montparnasse – Bienvenüe
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0137 = [[MWEdge alloc] init];
    edge0137.identifier = @"edge0137";
    edge0137.developmentName = @"Ребро: Sèvres – Babylone - Montparnasse – Bienvenüe";
    [self.edges addObject:edge0137];
    
    // Добавляем линию
    edge0137.line = line0014;
    
    // Добавляем вершину
    edge0137.startVertex = vertex0077;

    // Добавляем станцию Sèvres – Babylone
    [edge0137.elements addObject:station0331];

    // Добавляем перегон
    MWHaul *haul0320 = [[MWHaul alloc] init];
    haul0320.identifier = @"haul0320";
    haul0320.length = 320;
    [edge0137.elements addObject:haul0320];
    
    MWDrawLine *drawLine0465 = [[MWDrawLine alloc] init];
    drawLine0465.startPoint = CGPointMake(1837, 2806);
    drawLine0465.endPoint = CGPointMake(1932.5, 2901.5);
    drawLine0465.width = 11;
    drawLine0465.color = line0014.color;
    [haul0320.drawPrimitives addObject:drawLine0465];

    // Добавляем станцию Rennes
    MWStation *station0332 = [[MWStation alloc] init];
    station0332.identifier = @"station0332";
    [edge0137.elements addObject:station0332];
    
    station0332.nameOriginal = @"Rennes";
    station0332.mapLocation = CGPointMake(1932.5, 2901.5);
    station0332.geoLocation = CGPointMake(48.848193, 2.327763);

    MWDrawFillCircle *fillCircle0412 = [[MWDrawFillCircle alloc] init];
    fillCircle0412.center = station0332.mapLocation;
    fillCircle0412.radius = 12;
    fillCircle0412.fillColor = line0014.color;
    [station0332.drawPrimitives addObject:fillCircle0412];

    MWDrawTextLine *drawTextLine0423 = [[MWDrawTextLine alloc] init];
    drawTextLine0423.text = station0332.nameOriginal;
    drawTextLine0423.fontName = @"HelveticaNeue";
    drawTextLine0423.fontColor = [UIColor blackColor];
    drawTextLine0423.fontSize = 34;
    drawTextLine0423.kernSpacing = -0.8;
    drawTextLine0423.origin = CGPointMake(1810, 2889);
    [station0332.nameOriginalTextPrimitives addObject:drawTextLine0423];

    // Добавляем перегон
    MWHaul *haul0321 = [[MWHaul alloc] init];
    haul0321.identifier = @"haul0321";
    haul0321.length = 379;
    [edge0137.elements addObject:haul0321];
    
    MWDrawLine *drawLine0466 = [[MWDrawLine alloc] init];
    drawLine0466.startPoint = CGPointMake(1932, 2901);
    drawLine0466.endPoint = CGPointMake(2023.5, 2992.5);
    drawLine0466.width = 11;
    drawLine0466.color = line0014.color;
    [haul0321.drawPrimitives addObject:drawLine0466];

    MWDrawArc *drawArc0134 = [[MWDrawArc alloc] init];
    drawArc0134.center = CGPointMake(2002, 3013.5);
    drawArc0134.startDegrees = 315;
    drawArc0134.endDegrees = 0;
    drawArc0134.radius = 30;
    drawArc0134.width = 11;
    drawArc0134.color = line0014.color;
    [haul0321.drawPrimitives addObject:drawArc0134];

    MWDrawLine *drawLine0467 = [[MWDrawLine alloc] init];
    drawLine0467.startPoint = CGPointMake(2032, 3013);
    drawLine0467.endPoint = CGPointMake(2032, 3040);
    drawLine0467.width = 11;
    drawLine0467.color = line0014.color;
    [haul0321.drawPrimitives addObject:drawLine0467];

    // Добавляем станцию Notre-Dame-des-Champs
    MWStation *station0333 = [[MWStation alloc] init];
    station0333.identifier = @"station0333";
    [edge0137.elements addObject:station0333];
    
    station0333.nameOriginal = @"Notre-Dame-des-Champs";
    station0333.mapLocation = CGPointMake(2032, 3040);
    station0333.geoLocation = CGPointMake(48.844568, 2.328788);

    MWDrawFillCircle *fillCircle0413 = [[MWDrawFillCircle alloc] init];
    fillCircle0413.center = station0333.mapLocation;
    fillCircle0413.radius = 12;
    fillCircle0413.fillColor = line0014.color;
    [station0333.drawPrimitives addObject:fillCircle0413];

    MWDrawTextLine *drawTextLine0424 = [[MWDrawTextLine alloc] init];
    drawTextLine0424.text = @"Notre-Dame";
    drawTextLine0424.fontName = @"HelveticaNeue";
    drawTextLine0424.fontColor = [UIColor blackColor];
    drawTextLine0424.fontSize = 34;
    drawTextLine0424.kernSpacing = -0.2;
    drawTextLine0424.origin = CGPointMake(2052, 2986);
    [station0333.nameOriginalTextPrimitives addObject:drawTextLine0424];

    MWDrawTextLine *drawTextLine0425 = [[MWDrawTextLine alloc] init];
    drawTextLine0425.text = @"des-Champs";
    drawTextLine0425.fontName = @"HelveticaNeue";
    drawTextLine0425.fontColor = [UIColor blackColor];
    drawTextLine0425.fontSize = 34;
    drawTextLine0425.kernSpacing = -1.6;
    drawTextLine0425.origin = CGPointMake(2052, 3018);
    [station0333.nameOriginalTextPrimitives addObject:drawTextLine0425];

    // Добавляем перегон
    MWHaul *haul0322 = [[MWHaul alloc] init];
    haul0322.identifier = @"haul0322";
    haul0322.length = 533;
    [edge0137.elements addObject:haul0322];
    
    MWDrawLine *drawLine0468 = [[MWDrawLine alloc] init];
    drawLine0468.startPoint = CGPointMake(2032, 3039.5);
    drawLine0468.endPoint = CGPointMake(2032, 3109);
    drawLine0468.width = 11;
    drawLine0468.color = line0014.color;
    [haul0322.drawPrimitives addObject:drawLine0468];

    MWDrawArc *drawArc0135 = [[MWDrawArc alloc] init];
    drawArc0135.center = CGPointMake(2017, 3109);
    drawArc0135.startDegrees = 0;
    drawArc0135.endDegrees = 90;
    drawArc0135.radius = 15;
    drawArc0135.width = 11;
    drawArc0135.color = line0014.color;
    [haul0322.drawPrimitives addObject:drawArc0135];

    MWDrawLine *drawLine0469 = [[MWDrawLine alloc] init];
    drawLine0469.startPoint = CGPointMake(2017, 3124);
    drawLine0469.endPoint = CGPointMake(1971, 3124);
    drawLine0469.width = 11;
    drawLine0469.color = line0014.color;
    [haul0322.drawPrimitives addObject:drawLine0469];

    // Добавляем станцию Montparnasse – Bienvenüe
    MWStation *station0334 = [[MWStation alloc] init];
    station0334.identifier = @"station0334";
    [edge0137.elements addObject:station0334];
    
    station0334.nameOriginal = @"Montparnasse – Bienvenüe";
    station0334.mapLocation = CGPointMake(1971, 3124);
    station0334.geoLocation = CGPointMake(48.843466, 2.323072);

    MWDrawFillCircle *fillCircle0414 = [[MWDrawFillCircle alloc] init];
    fillCircle0414.center = station0334.mapLocation;
    fillCircle0414.radius = 3;
    fillCircle0414.fillColor = [UIColor whiteColor];
    [station0334.drawPrimitives addObject:fillCircle0414];

    station0334.showNameOnMap = false;
    [station0334.nameOriginalTextPrimitives addObject:drawTextLine0137];
    [station0334.nameOriginalTextPrimitives addObject:drawTextLine0138];
    
    // Добавляем вершину
    edge0137.finishVertex = vertex0040;

    // Создаем участок линии Montparnasse – Bienvenüe - Pasteur
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0138 = [[MWEdge alloc] init];
    edge0138.identifier = @"edge0138";
    edge0138.developmentName = @"Ребро: Montparnasse – Bienvenüe - Pasteur";
    [self.edges addObject:edge0138];
    
    // Добавляем линию
    edge0138.line = line0014;
    
    // Добавляем вершину
    edge0138.startVertex = vertex0040;

    // Добавляем станцию Montparnasse – Bienvenüe
    [edge0138.elements addObject:station0334];

    // Добавляем перегон
    MWHaul *haul0323 = [[MWHaul alloc] init];
    haul0323.identifier = @"haul0323";
    haul0323.length = 511;
    [edge0138.elements addObject:haul0323];
    
    MWDrawLine *drawLine0470 = [[MWDrawLine alloc] init];
    drawLine0470.startPoint = CGPointMake(1971.5, 3124);
    drawLine0470.endPoint = CGPointMake(1755, 3124);
    drawLine0470.width = 11;
    drawLine0470.color = line0014.color;
    [haul0323.drawPrimitives addObject:drawLine0470];

    // Добавляем станцию Falguière
    MWStation *station0335 = [[MWStation alloc] init];
    station0335.identifier = @"station0335";
    [edge0138.elements addObject:station0335];

    station0335.nameOriginal = @"Falguière";
    station0335.mapLocation = CGPointMake(1755, 3124);
    station0335.geoLocation = CGPointMake(48.844566, 2.318287);

    MWDrawFillCircle *fillCircle0415 = [[MWDrawFillCircle alloc] init];
    fillCircle0415.center = station0335.mapLocation;
    fillCircle0415.radius = 12;
    fillCircle0415.fillColor = line0014.color;
    [station0335.drawPrimitives addObject:fillCircle0415];

    MWDrawTextLine *drawTextLine0426 = [[MWDrawTextLine alloc] init];
    drawTextLine0426.text = station0335.nameOriginal;
    drawTextLine0426.fontName = @"HelveticaNeue";
    drawTextLine0426.fontColor = [UIColor blackColor];
    drawTextLine0426.fontSize = 34;
    drawTextLine0426.kernSpacing = -0.4;
    drawTextLine0426.origin = CGPointMake(1609, 3078);
    [station0335.nameOriginalTextPrimitives addObject:drawTextLine0426];

    // Добавляем перегон
    MWHaul *haul0324 = [[MWHaul alloc] init];
    haul0324.identifier = @"haul0324";
    haul0324.length = 404;
    [edge0138.elements addObject:haul0324];
    
    MWDrawLine *drawLine0471 = [[MWDrawLine alloc] init];
    drawLine0471.startPoint = CGPointMake(1756, 3123);
    drawLine0471.endPoint = CGPointMake(1709.5, 3168.5);
    drawLine0471.width = 11;
    drawLine0471.color = line0014.color;
    [haul0324.drawPrimitives addObject:drawLine0471];

    // Добавляем станцию Pasteur
    MWStation *station0336 = [[MWStation alloc] init];
    station0336.identifier = @"station0336";
    [edge0138.elements addObject:station0336];
    
    station0336.nameOriginal = @"Pasteur";
    station0336.mapLocation = CGPointMake(1709.5, 3168.5);
    station0336.geoLocation = CGPointMake(48.842836, 2.312681);

    MWDrawFillCircle *fillCircle0416 = [[MWDrawFillCircle alloc] init];
    fillCircle0416.center = station0336.mapLocation;
    fillCircle0416.radius = 3;
    fillCircle0416.fillColor = [UIColor whiteColor];
    [station0336.drawPrimitives addObject:fillCircle0416];

    station0336.showNameOnMap = false;
    [station0336.nameOriginalTextPrimitives addObject:drawTextLine0193];
    
    // Добавляем вершину
    edge0138.finishVertex = vertex0050;

    // Создаем участок линии Pasteur - Mairie d'Issy
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0139 = [[MWEdge alloc] init];
    edge0139.identifier = @"edge0139";
    edge0139.developmentName = @"Ребро: Pasteur - Mairie d'Issy";
    [self.edges addObject:edge0139];
    
    // Добавляем линию
    edge0139.line = line0014;
    
    // Добавляем вершину
    edge0139.startVertex = vertex0050;

    // Добавляем станцию Pasteur
    [edge0139.elements addObject:station0336];

    // Добавляем перегон
    MWHaul *haul0325 = [[MWHaul alloc] init];
    haul0325.identifier = @"haul0325";
    haul0325.length = 381;
    [edge0139.elements addObject:haul0325];
    
    MWDrawLine *drawLine0472 = [[MWDrawLine alloc] init];
    drawLine0472.startPoint = CGPointMake(1710, 3168);
    drawLine0472.endPoint = CGPointMake(1587, 3291);
    drawLine0472.width = 11;
    drawLine0472.color = line0014.color;
    [haul0325.drawPrimitives addObject:drawLine0472];

    // Добавляем станцию Volontaires
    MWStation *station0337 = [[MWStation alloc] init];
    station0337.identifier = @"station0337";
    [edge0139.elements addObject:station0337];

    station0337.nameOriginal = @"Volontaires";
    station0337.mapLocation = CGPointMake(1587, 3291);
    station0337.geoLocation = CGPointMake(48.841343, 2.307504);

    MWDrawFillCircle *fillCircle0417 = [[MWDrawFillCircle alloc] init];
    fillCircle0417.center = station0337.mapLocation;
    fillCircle0417.radius = 12;
    fillCircle0417.fillColor = line0014.color;
    [station0337.drawPrimitives addObject:fillCircle0417];

    MWDrawTextLine *drawTextLine0427 = [[MWDrawTextLine alloc] init];
    drawTextLine0427.text = station0337.nameOriginal;
    drawTextLine0427.fontName = @"HelveticaNeue";
    drawTextLine0427.fontColor = [UIColor blackColor];
    drawTextLine0427.fontSize = 34;
    drawTextLine0427.kernSpacing = 0.2;
    drawTextLine0427.origin = CGPointMake(1597, 3294);
    [station0337.nameOriginalTextPrimitives addObject:drawTextLine0427];

    // Добавляем перегон
    MWHaul *haul0326 = [[MWHaul alloc] init];
    haul0326.identifier = @"haul0326";
    haul0326.length = 512;
    [edge0139.elements addObject:haul0326];
    
    MWDrawLine *drawLine0473 = [[MWDrawLine alloc] init];
    drawLine0473.startPoint = CGPointMake(1587.5, 3290.5);
    drawLine0473.endPoint = CGPointMake(1481, 3396);
    drawLine0473.width = 11;
    drawLine0473.color = line0014.color;
    [haul0326.drawPrimitives addObject:drawLine0473];

    // Добавляем станцию Vaugirard
    MWStation *station0338 = [[MWStation alloc] init];
    station0338.identifier = @"station0338";
    [edge0139.elements addObject:station0338];
    
    station0338.nameOriginal = @"Vaugirard";
    station0338.mapLocation = CGPointMake(1481, 3396);
    station0338.geoLocation = CGPointMake(48.839649, 2.301491);

    MWDrawFillCircle *fillCircle0418 = [[MWDrawFillCircle alloc] init];
    fillCircle0418.center = station0338.mapLocation;
    fillCircle0418.radius = 12;
    fillCircle0418.fillColor = line0014.color;
    [station0338.drawPrimitives addObject:fillCircle0418];

    MWDrawTextLine *drawTextLine0428 = [[MWDrawTextLine alloc] init];
    drawTextLine0428.text = station0338.nameOriginal;
    drawTextLine0428.fontName = @"HelveticaNeue";
    drawTextLine0428.fontColor = [UIColor blackColor];
    drawTextLine0428.fontSize = 34;
    drawTextLine0428.kernSpacing = 0.0;
    drawTextLine0428.origin = CGPointMake(1491, 3399);
    [station0338.nameOriginalTextPrimitives addObject:drawTextLine0428];

    // Добавляем перегон
    MWHaul *haul0327 = [[MWHaul alloc] init];
    haul0327.identifier = @"haul0327";
    haul0327.length = 462;
    [edge0139.elements addObject:haul0327];
    
    MWDrawLine *drawLine0474 = [[MWDrawLine alloc] init];
    drawLine0474.startPoint = CGPointMake(1481.5, 3395.5);
    drawLine0474.endPoint = CGPointMake(1376, 3502);
    drawLine0474.width = 11;
    drawLine0474.color = line0014.color;
    [haul0327.drawPrimitives addObject:drawLine0474];

    // Добавляем станцию Convention
    MWStation *station0339 = [[MWStation alloc] init];
    station0339.identifier = @"station0339";
    [edge0139.elements addObject:station0339];
    
    station0339.nameOriginal = @"Convention";
    station0339.mapLocation = CGPointMake(1376, 3502);
    station0339.geoLocation = CGPointMake(48.837419, 2.296795);

    MWDrawFillCircle *fillCircle0419 = [[MWDrawFillCircle alloc] init];
    fillCircle0419.center = station0339.mapLocation;
    fillCircle0419.radius = 12;
    fillCircle0419.fillColor = line0014.color;
    [station0339.drawPrimitives addObject:fillCircle0419];

    MWDrawTextLine *drawTextLine0429 = [[MWDrawTextLine alloc] init];
    drawTextLine0429.text = station0339.nameOriginal;
    drawTextLine0429.fontName = @"HelveticaNeue";
    drawTextLine0429.fontColor = [UIColor blackColor];
    drawTextLine0429.fontSize = 34;
    drawTextLine0429.kernSpacing = -0.2;
    drawTextLine0429.origin = CGPointMake(1386, 3505);
    [station0339.nameOriginalTextPrimitives addObject:drawTextLine0429];

    // Добавляем перегон
    MWHaul *haul0328 = [[MWHaul alloc] init];
    haul0328.identifier = @"haul0328";
    haul0328.length = 835;
    [edge0139.elements addObject:haul0328];

    MWDrawLine *drawLine0475 = [[MWDrawLine alloc] init];
    drawLine0475.startPoint = CGPointMake(1376.5, 3501.5);
    drawLine0475.endPoint = CGPointMake(1289, 3589.5);
    drawLine0475.width = 11;
    drawLine0475.color = line0014.color;
    [haul0328.drawPrimitives addObject:drawLine0475];

    // Добавляем станцию Porte de Versailles
    MWStation *station0340 = [[MWStation alloc] init];
    station0340.identifier = @"station0340";
    [edge0139.elements addObject:station0340];
    
    station0340.nameOriginal = @"Porte de Versailles";
    station0340.mapLocation = CGPointMake(1289, 3589.5);
    station0340.geoLocation = CGPointMake(48.832328, 2.287841);
    
    MWDrawFillCircle *fillCircle0420 = [[MWDrawFillCircle alloc] init];
    fillCircle0420.center = station0340.mapLocation;
    fillCircle0420.radius = 13;
    fillCircle0420.fillColor = [UIColor blackColor];
    [station0340.drawPrimitives addObject:fillCircle0420];
    
    MWDrawFillCircle *fillCircle0421 = [[MWDrawFillCircle alloc] init];
    fillCircle0421.center = station0340.mapLocation;
    fillCircle0421.radius = 11;
    fillCircle0421.fillColor = [UIColor whiteColor];
    [station0340.drawPrimitives addObject:fillCircle0421];

    MWDrawTextLine *drawTextLine0430 = [[MWDrawTextLine alloc] init];
    drawTextLine0430.text = station0340.nameOriginal;
    drawTextLine0430.fontName = @"Helvetica-Bold";
    drawTextLine0430.fontColor = [UIColor blackColor];
    drawTextLine0430.fontSize = 30;
    drawTextLine0430.kernSpacing = 1.4;
    drawTextLine0430.origin = CGPointMake(1312, 3572);
    [station0340.drawPrimitives addObject:drawTextLine0430];

    // Добавляем перегон
    MWHaul *haul0329 = [[MWHaul alloc] init];
    haul0329.identifier = @"haul0329";
    haul0329.length = 857;
    [edge0139.elements addObject:haul0329];
    
    MWDrawLine *drawLine0476 = [[MWDrawLine alloc] init];
    drawLine0476.startPoint = CGPointMake(1289.5, 3589);
    drawLine0476.endPoint = CGPointMake(1111.5, 3767.5);
    drawLine0476.width = 11;
    drawLine0476.color = line0014.color;
    [haul0329.drawPrimitives addObject:drawLine0476];

    // Добавляем станцию Corentin Celton
    MWStation *station0341 = [[MWStation alloc] init];
    station0341.identifier = @"station0341";
    [edge0139.elements addObject:station0341];
    
    station0341.nameOriginal = @"Corentin Celton";
    station0341.mapLocation = CGPointMake(1111.5, 3767.5);
    station0341.geoLocation = CGPointMake(48.826833, 2.278985);

    MWDrawFillCircle *fillCircle0422 = [[MWDrawFillCircle alloc] init];
    fillCircle0422.center = station0341.mapLocation;
    fillCircle0422.radius = 12;
    fillCircle0422.fillColor = line0014.color;
    [station0341.drawPrimitives addObject:fillCircle0422];

    MWDrawTextLine *drawTextLine0431 = [[MWDrawTextLine alloc] init];
    drawTextLine0431.text = station0341.nameOriginal;
    drawTextLine0431.fontName = @"Helvetica-Bold";
    drawTextLine0431.fontColor = [UIColor blackColor];
    drawTextLine0431.fontSize = 30;
    drawTextLine0431.kernSpacing = 0.7;
    drawTextLine0431.origin = CGPointMake(1123, 3773);
    [station0341.drawPrimitives addObject:drawTextLine0431];

    // Добавляем перегон
    MWHaul *haul0330 = [[MWHaul alloc] init];
    haul0330.identifier = @"haul0330";
    haul0330.length = 560;
    [edge0139.elements addObject:haul0330];
    
    MWDrawLine *drawLine0477 = [[MWDrawLine alloc] init];
    drawLine0477.startPoint = CGPointMake(1112, 3767);
    drawLine0477.endPoint = CGPointMake(1022, 3856);
    drawLine0477.width = 11;
    drawLine0477.color = line0014.color;
    [haul0330.drawPrimitives addObject:drawLine0477];

    // Добавляем станцию Mairie d'Issy
    MWStation *station0342 = [[MWStation alloc] init];
    station0342.identifier = @"station0342";
    [edge0139.elements addObject:station0342];
    
    station0342.nameOriginal = @"Mairie d'Issy";
    station0342.mapLocation = CGPointMake(1022, 3856);
    station0342.geoLocation = CGPointMake(48.824152, 2.273434);

    MWDrawFillCircle *fillCircle0423 = [[MWDrawFillCircle alloc] init];
    fillCircle0423.center = station0342.mapLocation;
    fillCircle0423.radius = 12;
    fillCircle0423.fillColor = [UIColor blackColor];
    [station0342.drawPrimitives addObject:fillCircle0423];

    MWDrawFillCircle *fillCircle0424 = [[MWDrawFillCircle alloc] init];
    fillCircle0424.center = CGPointMake(1016.5, 3902.5);
    fillCircle0424.radius = 28;
    fillCircle0424.fillColor = line0014.color;
    [station0342.drawPrimitives addObject:fillCircle0424];
    
    MWDrawTextLine *drawTextLine0432 = [[MWDrawTextLine alloc] init];
    drawTextLine0432.text = @"12";
    drawTextLine0432.fontName = @"HelveticaNeue-Bold";
    drawTextLine0432.fontColor = [UIColor whiteColor];
    drawTextLine0432.fontSize = 44;
    drawTextLine0432.origin = CGPointMake(989.5, 3874.5);
    [station0342.drawPrimitives addObject:drawTextLine0432];

    // Добавляем вершину
    edge0139.finishVertex = vertex0080;

    ////////////////////////////////////////////////////////////////
    // Line 13
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Saint-Denis - Université - La Fourche
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0140 = [[MWEdge alloc] init];
    edge0140.identifier = @"edge0140";
    edge0140.developmentName = @"Ребро: Saint-Denis - Université - La Fourche";
    [self.edges addObject:edge0140];
    
    // Добавляем линию
    edge0140.line = line0015;
    
    // Добавляем вершину
    edge0140.startVertex = vertex0081;
    
    // Добавляем станцию Saint-Denis - Université
    MWStation *station0343 = [[MWStation alloc] init];
    station0343.identifier = @"station0343";
    [edge0140.elements addObject:station0343];
    
    station0343.nameOriginal = @"Saint-Denis - Université";
    station0343.mapLocation = CGPointMake(2682, 387);
    station0343.geoLocation = CGPointMake(48.94583, 2.36361);
    
    MWDrawFillCircle *fillCircle0425 = [[MWDrawFillCircle alloc] init];
    fillCircle0425.center = CGPointMake(2720.5, 360.5);
    fillCircle0425.radius = 28;
    fillCircle0425.fillColor = line0015.color;
    [station0343.drawPrimitives addObject:fillCircle0425];

    MWDrawTextLine *drawTextLine0433 = [[MWDrawTextLine alloc] init];
    drawTextLine0433.text = @"13";
    drawTextLine0433.fontName = @"HelveticaNeue-Bold";
    drawTextLine0433.fontColor = [UIColor blackColor];
    drawTextLine0433.fontSize = 44;
    drawTextLine0433.origin = CGPointMake(2695.5, 332.5);
    [station0343.drawPrimitives addObject:drawTextLine0433];

    MWDrawTextLine *drawTextLine0434 = [[MWDrawTextLine alloc] init];
    drawTextLine0434.text = station0343.nameOriginal;
    drawTextLine0434.fontName = @"Helvetica-Bold";
    drawTextLine0434.fontColor = [UIColor blackColor];
    drawTextLine0434.fontSize = 30;
    drawTextLine0434.kernSpacing = 1.2;
    drawTextLine0434.origin = CGPointMake(2755, 344);
    [station0343.drawPrimitives addObject:drawTextLine0434];

    MWDrawFillCircle *fillCircle0426 = [[MWDrawFillCircle alloc] init];
    fillCircle0426.center = station0343.mapLocation;
    fillCircle0426.radius = 13;
    fillCircle0426.fillColor = [UIColor blackColor];
    [station0343.drawPrimitives addObject:fillCircle0426];
    
    MWDrawFillCircle *fillCircle0427 = [[MWDrawFillCircle alloc] init];
    fillCircle0427.center = station0343.mapLocation;
    fillCircle0427.radius = 11;
    fillCircle0427.fillColor = [UIColor whiteColor];
    [station0343.drawPrimitives addObject:fillCircle0427];

    // Добавляем перегон
    MWHaul *haul0331 = [[MWHaul alloc] init];
    haul0331.identifier = @"haul0331";
    haul0331.length = 1079;
    [edge0140.elements addObject:haul0331];
    
    MWDrawLine *drawLine0478 = [[MWDrawLine alloc] init];
    drawLine0478.startPoint = CGPointMake(2682, 387);
    drawLine0478.endPoint = CGPointMake(2625, 444);
    drawLine0478.width = 11;
    drawLine0478.color = line0015.color;
    [haul0331.drawPrimitives addObject:drawLine0478];

    // Добавляем станцию Basilique de Saint-Denis
    MWStation *station0344 = [[MWStation alloc] init];
    station0344.identifier = @"station0344";
    [edge0140.elements addObject:station0344];
    
    station0344.nameOriginal = @"Basilique de Saint-Denis";
    station0344.mapLocation = CGPointMake(2625, 444);
    station0344.geoLocation = CGPointMake(48.93806, 2.36083);

    MWDrawFillCircle *fillCircle0428 = [[MWDrawFillCircle alloc] init];
    fillCircle0428.center = station0344.mapLocation;
    fillCircle0428.radius = 13;
    fillCircle0428.fillColor = [UIColor blackColor];
    [station0344.drawPrimitives addObject:fillCircle0428];
    
    MWDrawFillCircle *fillCircle0429 = [[MWDrawFillCircle alloc] init];
    fillCircle0429.center = station0344.mapLocation;
    fillCircle0429.radius = 11;
    fillCircle0429.fillColor = [UIColor whiteColor];
    [station0344.drawPrimitives addObject:fillCircle0429];

    MWDrawTextLine *drawTextLine0435 = [[MWDrawTextLine alloc] init];
    drawTextLine0435.text = @"Basilique";
    drawTextLine0435.fontName = @"HelveticaNeue";
    drawTextLine0435.fontColor = [UIColor blackColor];
    drawTextLine0435.fontSize = 34;
    drawTextLine0435.kernSpacing = -0.3;
    drawTextLine0435.origin = CGPointMake(2585, 480);
    [station0344.nameOriginalTextPrimitives addObject:drawTextLine0435];

    MWDrawTextLine *drawTextLine0436 = [[MWDrawTextLine alloc] init];
    drawTextLine0436.text = @"de St-Denis";
    drawTextLine0436.fontName = @"HelveticaNeue";
    drawTextLine0436.fontColor = [UIColor blackColor];
    drawTextLine0436.fontSize = 34;
    drawTextLine0436.kernSpacing = -0.9;
    drawTextLine0436.origin = CGPointMake(2585, 513);
    [station0344.nameOriginalTextPrimitives addObject:drawTextLine0436];

    // Добавляем перегон
    MWHaul *haul0332 = [[MWHaul alloc] init];
    haul0332.identifier = @"haul0332";
    haul0332.length = 987;
    [edge0140.elements addObject:haul0332];
    
    MWDrawLine *drawLine0479 = [[MWDrawLine alloc] init];
    drawLine0479.startPoint = CGPointMake(2625.5, 443.5);
    drawLine0479.endPoint = CGPointMake(2518.5, 550.5);
    drawLine0479.width = 11;
    drawLine0479.color = line0015.color;
    [haul0332.drawPrimitives addObject:drawLine0479];

    MWDrawArc *drawArc0136 = [[MWDrawArc alloc] init];
    drawArc0136.center = CGPointMake(2497.5, 529);
    drawArc0136.startDegrees = 45;
    drawArc0136.endDegrees = 90;
    drawArc0136.radius = 30;
    drawArc0136.width = 11;
    drawArc0136.color = line0015.color;
    [haul0332.drawPrimitives addObject:drawArc0136];

    MWDrawLine *drawLine0480 = [[MWDrawLine alloc] init];
    drawLine0480.startPoint = CGPointMake(2498, 559);
    drawLine0480.endPoint = CGPointMake(2321.5, 559);
    drawLine0480.width = 11;
    drawLine0480.color = line0015.color;
    [haul0332.drawPrimitives addObject:drawLine0480];

    // Добавляем станцию Saint-Denis - Porte de Paris
    MWStation *station0345 = [[MWStation alloc] init];
    station0345.identifier = @"station0345";
    [edge0140.elements addObject:station0345];
    
    station0345.nameOriginal = @"Saint-Denis - Porte de Paris";
    station0345.mapLocation = CGPointMake(2321.5, 559);
    station0345.geoLocation = CGPointMake(48.93028, 2.35778);

    MWDrawFillCircle *fillCircle0430 = [[MWDrawFillCircle alloc] init];
    fillCircle0430.center = station0345.mapLocation;
    fillCircle0430.radius = 13;
    fillCircle0430.fillColor = [UIColor blackColor];
    [station0345.drawPrimitives addObject:fillCircle0430];
    
    MWDrawFillCircle *fillCircle0431 = [[MWDrawFillCircle alloc] init];
    fillCircle0431.center = station0345.mapLocation;
    fillCircle0431.radius = 11;
    fillCircle0431.fillColor = [UIColor whiteColor];
    [station0345.drawPrimitives addObject:fillCircle0431];

    MWDrawTextLine *drawTextLine0437 = [[MWDrawTextLine alloc] init];
    drawTextLine0437.text = @"Saint-Denis";
    drawTextLine0437.fontName = @"Helvetica-Bold";
    drawTextLine0437.fontColor = [UIColor blackColor];
    drawTextLine0437.fontSize = 30;
    drawTextLine0437.kernSpacing = 1.2;
    drawTextLine0437.origin = CGPointMake(2300, 573);
    [station0345.drawPrimitives addObject:drawTextLine0437];

    MWDrawTextLine *drawTextLine0438 = [[MWDrawTextLine alloc] init];
    drawTextLine0438.text = @"Porte de Paris";
    drawTextLine0438.fontName = @"Helvetica-Bold";
    drawTextLine0438.fontColor = [UIColor blackColor];
    drawTextLine0438.fontSize = 30;
    drawTextLine0438.kernSpacing = 1.2;
    drawTextLine0438.origin = CGPointMake(2300, 606);
    [station0345.drawPrimitives addObject:drawTextLine0438];

    // Добавляем перегон
    MWHaul *haul0333 = [[MWHaul alloc] init];
    haul0333.identifier = @"haul0333";
    haul0333.length = 1486;
    [edge0140.elements addObject:haul0333];
    
    MWDrawLine *drawLine0481 = [[MWDrawLine alloc] init];
    drawLine0481.startPoint = CGPointMake(2322, 559);
    drawLine0481.endPoint = CGPointMake(2139, 559);
    drawLine0481.width = 11;
    drawLine0481.color = line0015.color;
    [haul0333.drawPrimitives addObject:drawLine0481];

    MWDrawArc *drawArc0137 = [[MWDrawArc alloc] init];
    drawArc0137.center = CGPointMake(2139, 589);
    drawArc0137.startDegrees = 225;
    drawArc0137.endDegrees = 270;
    drawArc0137.radius = 30;
    drawArc0137.width = 11;
    drawArc0137.color = line0015.color;
    [haul0333.drawPrimitives addObject:drawArc0137];

    MWDrawLine *drawLine0482 = [[MWDrawLine alloc] init];
    drawLine0482.startPoint = CGPointMake(2118, 567.5);
    drawLine0482.endPoint = CGPointMake(2068, 617.5);
    drawLine0482.width = 11;
    drawLine0482.color = line0015.color;
    [haul0333.drawPrimitives addObject:drawLine0482];

    // Добавляем станцию Carrefour Pleyel
    MWStation *station0346 = [[MWStation alloc] init];
    station0346.identifier = @"station0346";
    [edge0140.elements addObject:station0346];
    
    station0346.nameOriginal = @"Carrefour Pleyel";
    station0346.mapLocation = CGPointMake(2068, 617.5);
    station0346.geoLocation = CGPointMake(48.92, 2.34389);

    MWDrawFillCircle *fillCircle0432 = [[MWDrawFillCircle alloc] init];
    fillCircle0432.center = station0346.mapLocation;
    fillCircle0432.radius = 12;
    fillCircle0432.fillColor = line0015.color;
    [station0346.drawPrimitives addObject:fillCircle0432];
    
    MWDrawTextLine *drawTextLine0439 = [[MWDrawTextLine alloc] init];
    drawTextLine0439.text = @"Carrefour";
    drawTextLine0439.fontName = @"HelveticaNeue";
    drawTextLine0439.fontColor = [UIColor blackColor];
    drawTextLine0439.fontSize = 34;
    drawTextLine0439.kernSpacing = -0.2;
    drawTextLine0439.origin = CGPointMake(2079, 621);
    [station0346.nameOriginalTextPrimitives addObject:drawTextLine0439];

    MWDrawTextLine *drawTextLine0440 = [[MWDrawTextLine alloc] init];
    drawTextLine0440.text = @"Pleyel";
    drawTextLine0440.fontName = @"HelveticaNeue";
    drawTextLine0440.fontColor = [UIColor blackColor];
    drawTextLine0440.fontSize = 34;
    drawTextLine0440.kernSpacing = -0.4;
    drawTextLine0440.origin = CGPointMake(2079, 654);
    [station0346.nameOriginalTextPrimitives addObject:drawTextLine0440];
    
    // Добавляем перегон
    MWHaul *haul0334 = [[MWHaul alloc] init];
    haul0334.identifier = @"haul0334";
    haul0334.length = 1082;
    [edge0140.elements addObject:haul0334];
    
    MWDrawLine *drawLine0483 = [[MWDrawLine alloc] init];
    drawLine0483.startPoint = CGPointMake(2068.5, 617);
    drawLine0483.endPoint = CGPointMake(1962, 723);
    drawLine0483.width = 11;
    drawLine0483.color = line0015.color;
    [haul0334.drawPrimitives addObject:drawLine0483];

    // Добавляем станцию Mairie de Saint-Ouen
    MWStation *station0347 = [[MWStation alloc] init];
    station0347.identifier = @"station0347";
    [edge0140.elements addObject:station0347];
    
    station0347.nameOriginal = @"Mairie de Saint-Ouen";
    station0347.mapLocation = CGPointMake(1962, 723);
    station0347.geoLocation = CGPointMake(48.91167, 2.33389);

    MWDrawFillCircle *fillCircle0433 = [[MWDrawFillCircle alloc] init];
    fillCircle0433.center = station0347.mapLocation;
    fillCircle0433.radius = 12;
    fillCircle0433.fillColor = line0015.color;
    [station0347.drawPrimitives addObject:fillCircle0433];

    MWDrawTextLine *drawTextLine0441 = [[MWDrawTextLine alloc] init];
    drawTextLine0441.text = station0347.nameOriginal;
    drawTextLine0441.fontName = @"HelveticaNeue";
    drawTextLine0441.fontColor = [UIColor blackColor];
    drawTextLine0441.fontSize = 34;
    drawTextLine0441.kernSpacing = -0.2;
    drawTextLine0441.origin = CGPointMake(1972, 726);
    [station0347.nameOriginalTextPrimitives addObject:drawTextLine0441];

    // Добавляем перегон
    MWHaul *haul0335 = [[MWHaul alloc] init];
    haul0335.identifier = @"haul0335";
    haul0335.length = 645;
    [edge0140.elements addObject:haul0335];
    
    MWDrawLine *drawLine0484 = [[MWDrawLine alloc] init];
    drawLine0484.startPoint = CGPointMake(1962.5, 722.5);
    drawLine0484.endPoint = CGPointMake(1854, 831.5);
    drawLine0484.width = 11;
    drawLine0484.color = line0015.color;
    [haul0335.drawPrimitives addObject:drawLine0484];

    // Добавляем станцию Garibaldi
    MWStation *station0348 = [[MWStation alloc] init];
    station0348.identifier = @"station0348";
    [edge0140.elements addObject:station0348];
    
    station0348.nameOriginal = @"Garibaldi";
    station0348.mapLocation = CGPointMake(1854, 831.5);
    station0348.geoLocation = CGPointMake(48.90639, 2.33194);

    MWDrawFillCircle *fillCircle0434 = [[MWDrawFillCircle alloc] init];
    fillCircle0434.center = station0348.mapLocation;
    fillCircle0434.radius = 12;
    fillCircle0434.fillColor = line0015.color;
    [station0348.drawPrimitives addObject:fillCircle0434];

    MWDrawTextLine *drawTextLine0442 = [[MWDrawTextLine alloc] init];
    drawTextLine0442.text = station0348.nameOriginal;
    drawTextLine0442.fontName = @"HelveticaNeue";
    drawTextLine0442.fontColor = [UIColor blackColor];
    drawTextLine0442.fontSize = 34;
    drawTextLine0442.kernSpacing = -0.1;
    drawTextLine0442.origin = CGPointMake(1864, 834);
    [station0348.nameOriginalTextPrimitives addObject:drawTextLine0442];

    // Добавляем перегон
    MWHaul *haul0336 = [[MWHaul alloc] init];
    haul0336.identifier = @"haul0336";
    haul0336.length = 1011;
    [edge0140.elements addObject:haul0336];
    
    MWDrawLine *drawLine0485 = [[MWDrawLine alloc] init];
    drawLine0485.startPoint = CGPointMake(1854.5, 831);
    drawLine0485.endPoint = CGPointMake(1762.5, 923);
    drawLine0485.width = 11;
    drawLine0485.color = line0015.color;
    [haul0336.drawPrimitives addObject:drawLine0485];

    MWDrawArc *drawArc0138 = [[MWDrawArc alloc] init];
    drawArc0138.center = CGPointMake(1784, 944);
    drawArc0138.startDegrees = 180;
    drawArc0138.endDegrees = 225;
    drawArc0138.radius = 30;
    drawArc0138.width = 11;
    drawArc0138.color = line0015.color;
    [haul0336.drawPrimitives addObject:drawArc0138];

    MWDrawLine *drawLine0486 = [[MWDrawLine alloc] init];
    drawLine0486.startPoint = CGPointMake(1754, 944);
    drawLine0486.endPoint = CGPointMake(1754, 954);
    drawLine0486.width = 11;
    drawLine0486.color = line0015.color;
    [haul0336.drawPrimitives addObject:drawLine0486];

    // Добавляем станцию Porte de Saint-Ouen
    MWStation *station0349 = [[MWStation alloc] init];
    station0349.identifier = @"station0349";
    [edge0140.elements addObject:station0349];
    
    station0349.nameOriginal = @"Porte de Saint-Ouen";
    station0349.mapLocation = CGPointMake(1754, 954);
    station0349.geoLocation = CGPointMake(48.896667, 2.328611);

    MWDrawFillCircle *fillCircle0435 = [[MWDrawFillCircle alloc] init];
    fillCircle0435.center = station0349.mapLocation;
    fillCircle0435.radius = 12;
    fillCircle0435.fillColor = line0015.color;
    [station0349.drawPrimitives addObject:fillCircle0435];

    MWDrawTextLine *drawTextLine0443 = [[MWDrawTextLine alloc] init];
    drawTextLine0443.text = @"Porte";
    drawTextLine0443.fontName = @"HelveticaNeue";
    drawTextLine0443.fontColor = [UIColor blackColor];
    drawTextLine0443.fontSize = 34;
    drawTextLine0443.kernSpacing = -0.4;
    drawTextLine0443.origin = CGPointMake(1777, 974);
    [station0349.nameOriginalTextPrimitives addObject:drawTextLine0443];

    MWDrawTextLine *drawTextLine0444 = [[MWDrawTextLine alloc] init];
    drawTextLine0444.text = @"de Saint-Ouen";
    drawTextLine0444.fontName = @"HelveticaNeue";
    drawTextLine0444.fontColor = [UIColor blackColor];
    drawTextLine0444.fontSize = 34;
    drawTextLine0444.kernSpacing = -0.7;
    drawTextLine0444.origin = CGPointMake(1777, 1007);
    [station0349.nameOriginalTextPrimitives addObject:drawTextLine0444];

    // Добавляем перегон
    MWHaul *haul0337 = [[MWHaul alloc] init];
    haul0337.identifier = @"haul0337";
    haul0337.length = 536;
    [edge0140.elements addObject:haul0337];
    
    MWDrawLine *drawLine0487 = [[MWDrawLine alloc] init];
    drawLine0487.startPoint = CGPointMake(1754, 953.5);
    drawLine0487.endPoint = CGPointMake(1754, 1079);
    drawLine0487.width = 11;
    drawLine0487.color = line0015.color;
    [haul0337.drawPrimitives addObject:drawLine0487];

    // Добавляем станцию Guy Môquet
    MWStation *station0350 = [[MWStation alloc] init];
    station0350.identifier = @"station0350";
    [edge0140.elements addObject:station0350];
    
    station0350.nameOriginal = @"Guy Môquet";
    station0350.mapLocation = CGPointMake(1754, 1079);
    station0350.geoLocation = CGPointMake(48.892222, 2.327222);

    MWDrawFillCircle *fillCircle0436 = [[MWDrawFillCircle alloc] init];
    fillCircle0436.center = station0350.mapLocation;
    fillCircle0436.radius = 12;
    fillCircle0436.fillColor = line0015.color;
    [station0350.drawPrimitives addObject:fillCircle0436];

    MWDrawTextLine *drawTextLine0445 = [[MWDrawTextLine alloc] init];
    drawTextLine0445.text = @"Guy";
    drawTextLine0445.fontName = @"HelveticaNeue";
    drawTextLine0445.fontColor = [UIColor blackColor];
    drawTextLine0445.fontSize = 34;
    drawTextLine0445.kernSpacing = -0.8;
    drawTextLine0445.origin = CGPointMake(1772, 1057);
    [station0350.nameOriginalTextPrimitives addObject:drawTextLine0445];

    MWDrawTextLine *drawTextLine0446 = [[MWDrawTextLine alloc] init];
    drawTextLine0446.text = @"Môquet";
    drawTextLine0446.fontName = @"HelveticaNeue";
    drawTextLine0446.fontColor = [UIColor blackColor];
    drawTextLine0446.fontSize = 34;
    drawTextLine0446.kernSpacing = 0.1;
    drawTextLine0446.origin = CGPointMake(1772, 1090);
    [station0350.nameOriginalTextPrimitives addObject:drawTextLine0446];

    // Добавляем перегон
    MWHaul *haul0338 = [[MWHaul alloc] init];
    haul0338.identifier = @"haul0338";
    haul0338.length = 602;
    [edge0140.elements addObject:haul0338];
    
    MWDrawLine *drawLine0488 = [[MWDrawLine alloc] init];
    drawLine0488.startPoint = CGPointMake(1754, 1078.5);
    drawLine0488.endPoint = CGPointMake(1754, 1217.5);
    drawLine0488.width = 11;
    drawLine0488.color = line0015.color;
    [haul0338.drawPrimitives addObject:drawLine0488];

    // Добавляем станцию La Fourche
    MWStation *station0351 = [[MWStation alloc] init];
    station0351.identifier = @"station0351";
    [edge0140.elements addObject:station0351];
    
    station0351.nameOriginal = @"La Fourche";
    station0351.mapLocation = CGPointMake(1754, 1217.5);
    station0351.geoLocation = CGPointMake(48.886944, 2.325833);

    MWDrawFillCircle *fillCircle0686 = [[MWDrawFillCircle alloc] init];
    fillCircle0686.center = station0351.mapLocation;
    fillCircle0686.radius = 3;
    fillCircle0686.fillColor = [UIColor whiteColor];
    [station0351.drawPrimitives addObject:fillCircle0686];

    MWDrawTextLine *drawTextLine0447 = [[MWDrawTextLine alloc] init];
    drawTextLine0447.text = station0351.nameOriginal;
    drawTextLine0447.fontName = @"HelveticaNeue";
    drawTextLine0447.fontColor = [UIColor blackColor];
    drawTextLine0447.fontSize = 34;
    drawTextLine0447.kernSpacing = -0.8;
    drawTextLine0447.origin = CGPointMake(1774, 1196);
    [station0351.nameOriginalTextPrimitives addObject:drawTextLine0447];

    // Добавляем вершину
    edge0140.finishVertex = vertex0083;
    
    // Создаем участок линии Asnières – Gennevilliers – Les Courtilles - La Fourche
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0141 = [[MWEdge alloc] init];
    edge0141.identifier = @"edge0141";
    edge0141.developmentName = @"Ребро: Asnières – Gennevilliers – Les Courtilles - La Fourche";
    [self.edges addObject:edge0141];
    
    // Добавляем линию
    edge0141.line = line0015;
    
    // Добавляем вершину
    edge0141.startVertex = vertex0082;

    // Добавляем станцию Asnières – Gennevilliers – Les Courtilles
    MWStation *station0352 = [[MWStation alloc] init];
    station0352.identifier = @"station0352";
    [edge0141.elements addObject:station0352];
    
    station0352.nameOriginal = @"Asnières – Gennevilliers – Les Courtilles";
    station0352.mapLocation = CGPointMake(1111, 410);
    station0352.geoLocation = CGPointMake(48.930556, 2.283889);

    MWDrawFillCircle *fillCircle0439 = [[MWDrawFillCircle alloc] init];
    fillCircle0439.center = CGPointMake(1119.5, 348.5);
    fillCircle0439.radius = 28;
    fillCircle0439.fillColor = line0015.color;
    [station0352.drawPrimitives addObject:fillCircle0439];

    MWDrawTextLine *drawTextLine0448 = [[MWDrawTextLine alloc] init];
    drawTextLine0448.text = @"13";
    drawTextLine0448.fontName = @"HelveticaNeue-Bold";
    drawTextLine0448.fontColor = [UIColor blackColor];
    drawTextLine0448.fontSize = 44;
    drawTextLine0448.origin = CGPointMake(1094.5, 320.5);
    [station0352.drawPrimitives addObject:drawTextLine0448];

    MWDrawTextLine *drawTextLine0449 = [[MWDrawTextLine alloc] init];
    drawTextLine0449.text = @"Asnières – Gennevilliers";
    drawTextLine0449.fontName = @"HelveticaNeue-BoldItalic";
    drawTextLine0449.fontColor = [UIColor blackColor];
    drawTextLine0449.fontSize = 28;
    drawTextLine0449.kernSpacing = -0.4;
    drawTextLine0449.origin = CGPointMake(1156, 312);
    [station0352.nameOriginalTextPrimitives addObject:drawTextLine0449];

    MWDrawTextLine *drawTextLine0450 = [[MWDrawTextLine alloc] init];
    drawTextLine0450.text = @"Les Courtilles";
    drawTextLine0450.fontName = @"Helvetica-Bold";
    drawTextLine0450.fontColor = [UIColor blackColor];
    drawTextLine0450.fontSize = 30;
    drawTextLine0450.kernSpacing = 0.8;
    drawTextLine0450.origin = CGPointMake(1156, 342);
    [station0352.nameOriginalTextPrimitives addObject:drawTextLine0450];

    MWDrawFillCircle *fillCircle0440 = [[MWDrawFillCircle alloc] init];
    fillCircle0440.center = station0352.mapLocation;
    fillCircle0440.radius = 13;
    fillCircle0440.fillColor = [UIColor blackColor];
    [station0352.drawPrimitives addObject:fillCircle0440];
    
    MWDrawFillCircle *fillCircle0441 = [[MWDrawFillCircle alloc] init];
    fillCircle0441.center = station0352.mapLocation;
    fillCircle0441.radius = 11;
    fillCircle0441.fillColor = [UIColor whiteColor];
    [station0352.drawPrimitives addObject:fillCircle0441];

    // Добавляем перегон
    MWHaul *haul0339 = [[MWHaul alloc] init];
    haul0339.identifier = @"haul0339";
    haul0339.length = 845;
    [edge0141.elements addObject:haul0339];
    
    MWDrawLine *drawLine0489 = [[MWDrawLine alloc] init];
    drawLine0489.startPoint = CGPointMake(1111, 410);
    drawLine0489.endPoint = CGPointMake(1111, 536);
    drawLine0489.width = 11;
    drawLine0489.color = line0015.color;
    [haul0339.drawPrimitives addObject:drawLine0489];

    MWDrawArc *drawArc0139 = [[MWDrawArc alloc] init];
    drawArc0139.center = CGPointMake(1141, 536);
    drawArc0139.startDegrees = 135;
    drawArc0139.endDegrees = 180;
    drawArc0139.radius = 30;
    drawArc0139.width = 11;
    drawArc0139.color = line0015.color;
    [haul0339.drawPrimitives addObject:drawArc0139];

    MWDrawLine *drawLine0490 = [[MWDrawLine alloc] init];
    drawLine0490.startPoint = CGPointMake(1119.5, 557);
    drawLine0490.endPoint = CGPointMake(1180, 617.5);
    drawLine0490.width = 11;
    drawLine0490.color = line0015.color;
    [haul0339.drawPrimitives addObject:drawLine0490];

    // Добавляем станцию Les Agnettes
    MWStation *station0353 = [[MWStation alloc] init];
    station0353.identifier = @"station0353";
    [edge0141.elements addObject:station0353];
    
    station0353.nameOriginal = @"Les Agnettes";
    station0353.mapLocation = CGPointMake(1180, 617.5);
    station0353.geoLocation = CGPointMake(48.923056, 2.285833);

    MWDrawFillCircle *fillCircle0442 = [[MWDrawFillCircle alloc] init];
    fillCircle0442.center = station0353.mapLocation;
    fillCircle0442.radius = 12;
    fillCircle0442.fillColor = line0015.color;
    [station0353.drawPrimitives addObject:fillCircle0442];

    MWDrawTextLine *drawTextLine0451 = [[MWDrawTextLine alloc] init];
    drawTextLine0451.text = station0353.nameOriginal;
    drawTextLine0451.fontName = @"HelveticaNeue";
    drawTextLine0451.fontColor = [UIColor blackColor];
    drawTextLine0451.fontSize = 34;
    drawTextLine0451.kernSpacing = -0.8;
    drawTextLine0451.origin = CGPointMake(1197, 574);
    [station0353.nameOriginalTextPrimitives addObject:drawTextLine0451];

    // Добавляем перегон
    MWHaul *haul0340 = [[MWHaul alloc] init];
    haul0340.identifier = @"haul0340";
    haul0340.length = 961;
    [edge0141.elements addObject:haul0340];

    MWDrawLine *drawLine0491 = [[MWDrawLine alloc] init];
    drawLine0491.startPoint = CGPointMake(1179.5, 617);
    drawLine0491.endPoint = CGPointMake(1249.5, 686);
    drawLine0491.width = 11;
    drawLine0491.color = line0015.color;
    [haul0340.drawPrimitives addObject:drawLine0491];

    // Добавляем станцию Gabriel Péri
    MWStation *station0354 = [[MWStation alloc] init];
    station0354.identifier = @"station0354";
    [edge0141.elements addObject:station0354];
    
    station0354.nameOriginal = @"Gabriel Péri";
    station0354.mapLocation = CGPointMake(1249.5, 686);
    station0354.geoLocation = CGPointMake(48.916667, 2.294444);

    MWDrawFillCircle *fillCircle0443 = [[MWDrawFillCircle alloc] init];
    fillCircle0443.center = station0354.mapLocation;
    fillCircle0443.radius = 12;
    fillCircle0443.fillColor = line0015.color;
    [station0354.drawPrimitives addObject:fillCircle0443];
    
    MWDrawTextLine *drawTextLine0452 = [[MWDrawTextLine alloc] init];
    drawTextLine0452.text = station0354.nameOriginal;
    drawTextLine0452.fontName = @"HelveticaNeue";
    drawTextLine0452.fontColor = [UIColor blackColor];
    drawTextLine0452.fontSize = 34;
    drawTextLine0452.kernSpacing = -0.4;
    drawTextLine0452.origin = CGPointMake(1264, 641);
    [station0354.nameOriginalTextPrimitives addObject:drawTextLine0452];

    // Добавляем перегон
    MWHaul *haul0341 = [[MWHaul alloc] init];
    haul0341.identifier = @"haul0341";
    haul0341.length = 1724;
    [edge0141.elements addObject:haul0341];
    
    MWDrawLine *drawLine0492 = [[MWDrawLine alloc] init];
    drawLine0492.startPoint = CGPointMake(1249, 685.5);
    drawLine0492.endPoint = CGPointMake(1408, 845);
    drawLine0492.width = 11;
    drawLine0492.color = line0015.color;
    [haul0341.drawPrimitives addObject:drawLine0492];

    // Добавляем станцию Mairie de Clichy
    MWStation *station0355 = [[MWStation alloc] init];
    station0355.identifier = @"station0355";
    [edge0141.elements addObject:station0355];
    
    station0355.nameOriginal = @"Mairie de Clichy";
    station0355.mapLocation = CGPointMake(1408, 845);
    station0355.geoLocation = CGPointMake(48.903959, 2.305343);

    MWDrawFillCircle *fillCircle0444 = [[MWDrawFillCircle alloc] init];
    fillCircle0444.center = station0355.mapLocation;
    fillCircle0444.radius = 12;
    fillCircle0444.fillColor = line0015.color;
    [station0355.drawPrimitives addObject:fillCircle0444];

    MWDrawTextLine *drawTextLine0453 = [[MWDrawTextLine alloc] init];
    drawTextLine0453.text = @"Mairie";
    drawTextLine0453.fontName = @"HelveticaNeue";
    drawTextLine0453.fontColor = [UIColor blackColor];
    drawTextLine0453.fontSize = 34;
    drawTextLine0453.kernSpacing = 0.2;
    drawTextLine0453.origin = CGPointMake(1302, 840);
    [station0355.nameOriginalTextPrimitives addObject:drawTextLine0453];

    MWDrawTextLine *drawTextLine0454 = [[MWDrawTextLine alloc] init];
    drawTextLine0454.text = @"de Clichy";
    drawTextLine0454.fontName = @"HelveticaNeue";
    drawTextLine0454.fontColor = [UIColor blackColor];
    drawTextLine0454.fontSize = 34;
    drawTextLine0454.kernSpacing = -0.4;
    drawTextLine0454.origin = CGPointMake(1257, 873);
    [station0355.nameOriginalTextPrimitives addObject:drawTextLine0454];

    // Добавляем перегон
    MWHaul *haul0342 = [[MWHaul alloc] init];
    haul0342.identifier = @"haul0342";
    haul0342.length = 1184;
    [edge0141.elements addObject:haul0342];
    
    MWDrawLine *drawLine0493 = [[MWDrawLine alloc] init];
    drawLine0493.startPoint = CGPointMake(1407.5, 844.5);
    drawLine0493.endPoint = CGPointMake(1568.5, 1006);
    drawLine0493.width = 11;
    drawLine0493.color = line0015.color;
    [haul0342.drawPrimitives addObject:drawLine0493];

    // Добавляем станцию Porte de Clichy
    MWStation *station0356 = [[MWStation alloc] init];
    station0356.identifier = @"station0356";
    [edge0141.elements addObject:station0356];
    
    station0356.nameOriginal = @"Porte de Clichy";
    station0356.mapLocation = CGPointMake(1568.5, 1006);
    station0356.geoLocation = CGPointMake(48.894444, 2.313611);

    MWDrawFillCircle *fillCircle0445 = [[MWDrawFillCircle alloc] init];
    fillCircle0445.center = station0356.mapLocation;
    fillCircle0445.radius = 13;
    fillCircle0445.fillColor = [UIColor blackColor];
    [station0356.drawPrimitives addObject:fillCircle0445];
    
    MWDrawFillCircle *fillCircle0446 = [[MWDrawFillCircle alloc] init];
    fillCircle0446.center = station0356.mapLocation;
    fillCircle0446.radius = 11;
    fillCircle0446.fillColor = [UIColor whiteColor];
    [station0356.drawPrimitives addObject:fillCircle0446];

    MWDrawTextLine *drawTextLine0455 = [[MWDrawTextLine alloc] init];
    drawTextLine0455.text = station0356.nameOriginal;
    drawTextLine0455.fontName = @"HelveticaNeue";
    drawTextLine0455.fontColor = [UIColor blackColor];
    drawTextLine0455.fontSize = 34;
    drawTextLine0455.kernSpacing = -0.4;
    drawTextLine0455.origin = CGPointMake(1318, 977);
    [station0356.nameOriginalTextPrimitives addObject:drawTextLine0455];

    // Добавляем перегон
    MWHaul *haul0343 = [[MWHaul alloc] init];
    haul0343.identifier = @"haul0343";
    haul0343.length = 627;
    [edge0141.elements addObject:haul0343];
    
    MWDrawLine *drawLine0494 = [[MWDrawLine alloc] init];
    drawLine0494.startPoint = CGPointMake(1568, 1005.5);
    drawLine0494.endPoint = CGPointMake(1658.5, 1096);
    drawLine0494.width = 11;
    drawLine0494.color = line0015.color;
    [haul0343.drawPrimitives addObject:drawLine0494];

    // Добавляем станцию Brochant
    MWStation *station0357 = [[MWStation alloc] init];
    station0357.identifier = @"station0357";
    [edge0141.elements addObject:station0357];
    
    station0357.nameOriginal = @"Brochant";
    station0357.mapLocation = CGPointMake(1658.5, 1096);
    station0357.geoLocation = CGPointMake(48.890833, 2.319722);

    MWDrawFillCircle *fillCircle0447 = [[MWDrawFillCircle alloc] init];
    fillCircle0447.center = station0357.mapLocation;
    fillCircle0447.radius = 12;
    fillCircle0447.fillColor = line0015.color;
    [station0357.drawPrimitives addObject:fillCircle0447];

    MWDrawTextLine *drawTextLine0456 = [[MWDrawTextLine alloc] init];
    drawTextLine0456.text = station0357.nameOriginal;
    drawTextLine0456.fontName = @"HelveticaNeue";
    drawTextLine0456.fontColor = [UIColor blackColor];
    drawTextLine0456.fontSize = 34;
    drawTextLine0456.kernSpacing = -0.4;
    drawTextLine0456.origin = CGPointMake(1511, 1096);
    [station0357.nameOriginalTextPrimitives addObject:drawTextLine0456];

    // Добавляем перегон
    MWHaul *haul0344 = [[MWHaul alloc] init];
    haul0344.identifier = @"haul0344";
    haul0344.length = 535;
    [edge0141.elements addObject:haul0344];
    
    MWDrawLine *drawLine0495 = [[MWDrawLine alloc] init];
    drawLine0495.startPoint = CGPointMake(1658, 1095.5);
    drawLine0495.endPoint = CGPointMake(1745.5, 1183);
    drawLine0495.width = 11;
    drawLine0495.color = line0015.color;
    [haul0344.drawPrimitives addObject:drawLine0495];

    MWDrawArc *drawArc0140 = [[MWDrawArc alloc] init];
    drawArc0140.center = CGPointMake(1724, 1204);
    drawArc0140.startDegrees = 315;
    drawArc0140.endDegrees = 0;
    drawArc0140.radius = 30;
    drawArc0140.width = 11;
    drawArc0140.color = line0015.color;
    [haul0344.drawPrimitives addObject:drawArc0140];

    MWDrawLine *drawLine0496 = [[MWDrawLine alloc] init];
    drawLine0496.startPoint = CGPointMake(1754, 1204);
    drawLine0496.endPoint = CGPointMake(1754, 1217.5);
    drawLine0496.width = 11;
    drawLine0496.color = line0015.color;
    [haul0344.drawPrimitives addObject:drawLine0496];

    // Добавляем станцию La Fourche
    [edge0141.elements addObject:station0351];

    // Добавляем вершину
    edge0141.finishVertex = vertex0083;

    // Создаем участок линии La Fourche - Place de Clichy
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0142 = [[MWEdge alloc] init];
    edge0142.identifier = @"edge0142";
    edge0142.developmentName = @"Ребро: La Fourche - Place de Clichy";
    [self.edges addObject:edge0142];
    
    // Добавляем линию
    edge0142.line = line0015;
    
    // Добавляем вершину
    edge0142.startVertex = vertex0083;

    // Добавляем станцию La Fourche
    [edge0142.elements addObject:station0351];

    // Добавляем перегон
    MWHaul *haul0345 = [[MWHaul alloc] init];
    haul0345.identifier = @"haul0345";
    haul0345.length = 465;
    [edge0142.elements addObject:haul0345];
    
    MWDrawLine *drawLine0497 = [[MWDrawLine alloc] init];
    drawLine0497.startPoint = CGPointMake(1754, 1217);
    drawLine0497.endPoint = CGPointMake(1754, 1326.5);
    drawLine0497.width = 11;
    drawLine0497.color = line0015.color;
    [haul0345.drawPrimitives addObject:drawLine0497];

    // Добавляем станцию Place de Clichy
    MWStation *station0358 = [[MWStation alloc] init];
    station0358.identifier = @"station0358";
    [edge0142.elements addObject:station0358];
    
    station0358.nameOriginal = @"Place de Clichy";
    station0358.mapLocation = CGPointMake(1754, 1326.5);
    station0358.geoLocation = CGPointMake(48.883889, 2.3275);
    
    MWDrawFillCircle *fillCircle0448 = [[MWDrawFillCircle alloc] init];
    fillCircle0448.center = station0358.mapLocation;
    fillCircle0448.radius = 3;
    fillCircle0448.fillColor = [UIColor whiteColor];
    [station0358.drawPrimitives addObject:fillCircle0448];

    station0358.showNameOnMap = false;
    [station0358.nameOriginalTextPrimitives addObject:drawTextLine0050];
    [station0358.nameOriginalTextPrimitives addObject:drawTextLine0051];
    
    // Добавляем вершину
    edge0142.finishVertex = vertex0016;

    // Создаем участок линии Place de Clichy - Saint-Lazare
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0143 = [[MWEdge alloc] init];
    edge0143.identifier = @"edge0143";
    edge0143.developmentName = @"Ребро: Place de Clichy - Saint-Lazare";
    [self.edges addObject:edge0143];
    
    // Добавляем линию
    edge0143.line = line0015;
    
    // Добавляем вершину
    edge0143.startVertex = vertex0016;

    // Добавляем станцию Place de Clichy
    [edge0143.elements addObject:station0358];

    // Добавляем перегон
    MWHaul *haul0346 = [[MWHaul alloc] init];
    haul0346.identifier = @"haul0346";
    haul0346.length = 428;
    [edge0143.elements addObject:haul0346];

    MWDrawLine *drawLine0498 = [[MWDrawLine alloc] init];
    drawLine0498.startPoint = CGPointMake(1754, 1326);
    drawLine0498.endPoint = CGPointMake(1754, 1488);
    drawLine0498.width = 11;
    drawLine0498.color = line0015.color;
    [haul0346.drawPrimitives addObject:drawLine0498];

    // Добавляем станцию Liège
    MWStation *station0359 = [[MWStation alloc] init];
    station0359.identifier = @"station0359";
    [edge0143.elements addObject:station0359];
    
    station0359.nameOriginal = @"Liège";
    station0359.mapLocation = CGPointMake(1754, 1488);
    station0359.geoLocation = CGPointMake(48.879722, 2.326944);

    MWDrawFillCircle *fillCircle0449 = [[MWDrawFillCircle alloc] init];
    fillCircle0449.center = station0359.mapLocation;
    fillCircle0449.radius = 12;
    fillCircle0449.fillColor = line0015.color;
    [station0359.drawPrimitives addObject:fillCircle0449];

    MWDrawTextLine *drawTextLine0457 = [[MWDrawTextLine alloc] init];
    drawTextLine0457.text = station0359.nameOriginal;
    drawTextLine0457.fontName = @"HelveticaNeue";
    drawTextLine0457.fontColor = [UIColor blackColor];
    drawTextLine0457.fontSize = 34;
    drawTextLine0457.kernSpacing = -0.6;
    drawTextLine0457.origin = CGPointMake(1773, 1466);
    [station0359.nameOriginalTextPrimitives addObject:drawTextLine0457];

    // Добавляем перегон
    MWHaul *haul0347 = [[MWHaul alloc] init];
    haul0347.identifier = @"haul0347";
    haul0347.length = 477;
    [edge0143.elements addObject:haul0347];
    
    MWDrawLine *drawLine0499 = [[MWDrawLine alloc] init];
    drawLine0499.startPoint = CGPointMake(1754, 1487.5);
    drawLine0499.endPoint = CGPointMake(1754, 1744);
    drawLine0499.width = 11;
    drawLine0499.color = line0015.color;
    [haul0347.drawPrimitives addObject:drawLine0499];

    // Добавляем станцию Saint-Lazare
    MWStation *station0360 = [[MWStation alloc] init];
    station0360.identifier = @"station0360";
    [edge0143.elements addObject:station0360];
    
    station0360.nameOriginal = @"Saint-Lazare";
    station0360.mapLocation = CGPointMake(1754, 1744);
    station0360.geoLocation = CGPointMake(48.87549, 2.32664);

    MWDrawFillCircle *fillCircle0450 = [[MWDrawFillCircle alloc] init];
    fillCircle0450.center = station0360.mapLocation;
    fillCircle0450.radius = 3;
    fillCircle0450.fillColor = [UIColor whiteColor];
    [station0360.drawPrimitives addObject:fillCircle0450];

    station0360.showNameOnMap = false;
    [station0360.drawPrimitives addObject:drawTextLine0083];
    
    // Добавляем вершину
    edge0143.finishVertex = vertex0025;
    
    // Создаем участок линии Saint-Lazare - Miromesnil
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0144 = [[MWEdge alloc] init];
    edge0144.identifier = @"edge0144";
    edge0144.developmentName = @"Ребро: Saint-Lazare - Miromesnil";
    [self.edges addObject:edge0144];
    
    // Добавляем линию
    edge0144.line = line0015;
    
    // Добавляем вершину
    edge0144.startVertex = vertex0025;

    // Добавляем станцию Saint-Lazare
    [edge0144.elements addObject:station0360];

    // Добавляем перегон
    MWHaul *haul0348 = [[MWHaul alloc] init];
    haul0348.identifier = @"haul0348";
    haul0348.length = 940;
    [edge0144.elements addObject:haul0348];

    MWDrawLine *drawLine0500 = [[MWDrawLine alloc] init];
    drawLine0500.startPoint = CGPointMake(1754, 1743.5);
    drawLine0500.endPoint = CGPointMake(1754, 1747);
    drawLine0500.width = 11;
    drawLine0500.color = line0015.color;
    [haul0348.drawPrimitives addObject:drawLine0500];
    
    MWDrawArc *drawArc0141 = [[MWDrawArc alloc] init];
    drawArc0141.center = CGPointMake(1724, 1746.5);
    drawArc0141.startDegrees = 0;
    drawArc0141.endDegrees = 45;
    drawArc0141.radius = 30;
    drawArc0141.width = 11;
    drawArc0141.color = line0015.color;
    [haul0348.drawPrimitives addObject:drawArc0141];

    MWDrawLine *drawLine0501 = [[MWDrawLine alloc] init];
    drawLine0501.startPoint = CGPointMake(1746, 1767);
    drawLine0501.endPoint = CGPointMake(1591.5, 1921.5);
    drawLine0501.width = 11;
    drawLine0501.color = line0015.color;
    [haul0348.drawPrimitives addObject:drawLine0501];

    // Добавляем станцию Miromesnil
    MWStation *station0361 = [[MWStation alloc] init];
    station0361.identifier = @"station0361";
    [edge0144.elements addObject:station0361];
    
    station0361.nameOriginal = @"Miromesnil";
    station0361.mapLocation = CGPointMake(1591.5, 1921.5);
    station0361.geoLocation = CGPointMake(48.87367, 2.31446);
    
    MWDrawFillCircle *fillCircle0451 = [[MWDrawFillCircle alloc] init];
    fillCircle0451.center = station0361.mapLocation;
    fillCircle0451.radius = 3;
    fillCircle0451.fillColor = [UIColor whiteColor];
    [station0361.drawPrimitives addObject:fillCircle0451];

    station0361.showNameOnMap = false;
    [station0361.nameOriginalTextPrimitives addObject:drawTextLine0346];
    
    // Добавляем вершину
    edge0144.finishVertex = vertex0072;

    // Создаем участок линии Miromesnil - Champs-Élysées – Clemenceau
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0145 = [[MWEdge alloc] init];
    edge0145.identifier = @"edge0145";
    edge0145.developmentName = @"Ребро: Miromesnil - Champs-Élysées – Clemenceau";
    [self.edges addObject:edge0145];
    
    // Добавляем линию
    edge0145.line = line0015;
    
    // Добавляем вершину
    edge0145.startVertex = vertex0072;

    // Добавляем станцию Miromesnil
    [edge0145.elements addObject:station0361];

    // Добавляем перегон
    MWHaul *haul0349 = [[MWHaul alloc] init];
    haul0349.identifier = @"haul0349";
    haul0349.length = 728;
    [edge0145.elements addObject:haul0349];
    
    MWDrawLine *drawLine0502 = [[MWDrawLine alloc] init];
    drawLine0502.startPoint = CGPointMake(1592, 1921);
    drawLine0502.endPoint = CGPointMake(1454.5, 2058.5);
    drawLine0502.width = 11;
    drawLine0502.color = line0015.color;
    [haul0349.drawPrimitives addObject:drawLine0502];

    MWDrawArc *drawArc0142 = [[MWDrawArc alloc] init];
    drawArc0142.center = CGPointMake(1476, 2079.5);
    drawArc0142.startDegrees = 180;
    drawArc0142.endDegrees = 225;
    drawArc0142.radius = 30;
    drawArc0142.width = 11;
    drawArc0142.color = line0015.color;
    [haul0349.drawPrimitives addObject:drawArc0142];

    MWDrawLine *drawLine0503 = [[MWDrawLine alloc] init];
    drawLine0503.startPoint = CGPointMake(1446, 2079);
    drawLine0503.endPoint = CGPointMake(1446, 2214.5);
    drawLine0503.width = 11;
    drawLine0503.color = line0015.color;
    [haul0349.drawPrimitives addObject:drawLine0503];

    // Добавляем станцию Champs-Élysées – Clemenceau
    MWStation *station0362 = [[MWStation alloc] init];
    station0362.identifier = @"station0362";
    [edge0145.elements addObject:station0362];
    
    station0362.nameOriginal = @"Champs-Élysées – Clemenceau";
    station0362.mapLocation = CGPointMake(1446, 2214.5);
    station0362.geoLocation = CGPointMake(48.867531, 2.313542);
    
    MWDrawFillCircle *fillCircle0452 = [[MWDrawFillCircle alloc] init];
    fillCircle0452.center = station0362.mapLocation;
    fillCircle0452.radius = 3;
    fillCircle0452.fillColor = [UIColor whiteColor];
    [station0362.drawPrimitives addObject:fillCircle0452];

    station0362.showNameOnMap = false;
    [station0362.nameOriginalTextPrimitives addObject:drawTextLine0016];
    [station0362.nameOriginalTextPrimitives addObject:drawTextLine0017];
    [station0362.nameOriginalTextPrimitives addObject:drawTextLine0018];
    
    // Добавляем вершину
    edge0145.finishVertex = vertex0004;
    
    // Создаем участок линии Champs-Élysées – Clemenceau - Invalides
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0146 = [[MWEdge alloc] init];
    edge0146.identifier = @"edge0146";
    edge0146.developmentName = @"Ребро: Champs-Élysées – Clemenceau - Invalides";
    [self.edges addObject:edge0146];
    
    // Добавляем линию
    edge0146.line = line0015;
    
    // Добавляем вершину
    edge0146.startVertex = vertex0004;

    // Добавляем станцию Champs-Élysées – Clemenceau
    [edge0146.elements addObject:station0362];

    // Добавляем перегон
    MWHaul *haul0350 = [[MWHaul alloc] init];
    haul0350.identifier = @"haul0350";
    haul0350.length = 518;
    [edge0146.elements addObject:haul0350];
    
    MWDrawLine *drawLine0504 = [[MWDrawLine alloc] init];
    drawLine0504.startPoint = CGPointMake(1446, 2214);
    drawLine0504.endPoint = CGPointMake(1446, 2464.5);
    drawLine0504.width = 11;
    drawLine0504.color = line0015.color;
    [haul0350.drawPrimitives addObject:drawLine0504];

    // Добавляем станцию Invalides
    MWStation *station0363 = [[MWStation alloc] init];
    station0363.identifier = @"station0363";
    [edge0146.elements addObject:station0363];
    
    station0363.nameOriginal = @"Invalides";
    station0363.mapLocation = CGPointMake(1446, 2464.5);
    station0363.geoLocation = CGPointMake(48.86299, 2.31333);
    
    MWDrawFillCircle *fillCircle0453 = [[MWDrawFillCircle alloc] init];
    fillCircle0453.center = station0363.mapLocation;
    fillCircle0453.radius = 3;
    fillCircle0453.fillColor = [UIColor whiteColor];
    [station0363.drawPrimitives addObject:fillCircle0453];

    station0363.showNameOnMap = false;
    [station0363.nameOriginalTextPrimitives addObject:drawTextLine0288];
    
    // Добавляем вершину
    edge0146.finishVertex = vertex0063;
    
    // Создаем участок линии Invalides - Duroc
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0147 = [[MWEdge alloc] init];
    edge0147.identifier = @"edge0147";
    edge0147.developmentName = @"Ребро: Invalides - Duroc";
    [self.edges addObject:edge0147];
    
    // Добавляем линию
    edge0147.line = line0015;
    
    // Добавляем вершину
    edge0147.startVertex = vertex0063;

    // Добавляем станцию Invalides
    [edge0147.elements addObject:station0363];

    // Добавляем перегон
    MWHaul *haul0351 = [[MWHaul alloc] init];
    haul0351.identifier = @"haul0351";
    haul0351.length = 765;
    [edge0147.elements addObject:haul0351];
    
    MWDrawLine *drawLine0505 = [[MWDrawLine alloc] init];
    drawLine0505.startPoint = CGPointMake(1446, 2464);
    drawLine0505.endPoint = CGPointMake(1446, 2636);
    drawLine0505.width = 11;
    drawLine0505.color = line0015.color;
    [haul0351.drawPrimitives addObject:drawLine0505];

    // Добавляем станцию Varenne
    MWStation *station0364 = [[MWStation alloc] init];
    station0364.identifier = @"station0364";
    [edge0147.elements addObject:station0364];
    
    station0364.nameOriginal = @"Varenne";
    station0364.mapLocation = CGPointMake(1446, 2636);
    station0364.geoLocation = CGPointMake(48.856238, 2.314921);
    
    MWDrawFillCircle *fillCircle0454 = [[MWDrawFillCircle alloc] init];
    fillCircle0454.center = station0364.mapLocation;
    fillCircle0454.radius = 12;
    fillCircle0454.fillColor = line0015.color;
    [station0364.drawPrimitives addObject:fillCircle0454];

    MWDrawTextLine *drawTextLine0458 = [[MWDrawTextLine alloc] init];
    drawTextLine0458.text = station0364.nameOriginal;
    drawTextLine0458.fontName = @"HelveticaNeue";
    drawTextLine0458.fontColor = [UIColor blackColor];
    drawTextLine0458.fontSize = 34;
    drawTextLine0458.kernSpacing = -0.1;
    drawTextLine0458.origin = CGPointMake(1466, 2614);
    [station0364.nameOriginalTextPrimitives addObject:drawTextLine0458];

    // Добавляем перегон
    MWHaul *haul0352 = [[MWHaul alloc] init];
    haul0352.identifier = @"haul0352";
    haul0352.length = 516;
    [edge0147.elements addObject:haul0352];
    
    MWDrawLine *drawLine0506 = [[MWDrawLine alloc] init];
    drawLine0506.startPoint = CGPointMake(1446, 2635.5);
    drawLine0506.endPoint = CGPointMake(1446, 2770);
    drawLine0506.width = 11;
    drawLine0506.color = line0015.color;
    [haul0352.drawPrimitives addObject:drawLine0506];

    MWDrawArc *drawArc0143 = [[MWDrawArc alloc] init];
    drawArc0143.center = CGPointMake(1476, 2770);
    drawArc0143.startDegrees = 135;
    drawArc0143.endDegrees = 180;
    drawArc0143.radius = 30;
    drawArc0143.width = 11;
    drawArc0143.color = line0015.color;
    [haul0352.drawPrimitives addObject:drawArc0143];

    MWDrawLine *drawLine0507 = [[MWDrawLine alloc] init];
    drawLine0507.startPoint = CGPointMake(1454.5, 2791);
    drawLine0507.endPoint = CGPointMake(1512, 2848.5);
    drawLine0507.width = 11;
    drawLine0507.color = line0015.color;
    [haul0352.drawPrimitives addObject:drawLine0507];

    // Добавляем станцию Saint-François-Xavier
    MWStation *station0365 = [[MWStation alloc] init];
    station0365.identifier = @"station0365";
    [edge0147.elements addObject:station0365];
    
    station0365.nameOriginal = @"Saint-François-Xavier";
    station0365.mapLocation = CGPointMake(1512, 2848.5);
    station0365.geoLocation = CGPointMake(48.851951, 2.314475);

    MWDrawFillCircle *fillCircle0455 = [[MWDrawFillCircle alloc] init];
    fillCircle0455.center = station0365.mapLocation;
    fillCircle0455.radius = 12;
    fillCircle0455.fillColor = line0015.color;
    [station0365.drawPrimitives addObject:fillCircle0455];

    MWDrawTextLine *drawTextLine0459 = [[MWDrawTextLine alloc] init];
    drawTextLine0459.text = @"Saint";
    drawTextLine0459.fontName = @"HelveticaNeue";
    drawTextLine0459.fontColor = [UIColor blackColor];
    drawTextLine0459.fontSize = 34;
    drawTextLine0459.kernSpacing = -0.6;
    drawTextLine0459.origin = CGPointMake(1506, 2731);
    [station0365.nameOriginalTextPrimitives addObject:drawTextLine0459];

    MWDrawTextLine *drawTextLine0460 = [[MWDrawTextLine alloc] init];
    drawTextLine0460.text = @"François";
    drawTextLine0460.fontName = @"HelveticaNeue";
    drawTextLine0460.fontColor = [UIColor blackColor];
    drawTextLine0460.fontSize = 34;
    drawTextLine0460.kernSpacing = -0.6;
    drawTextLine0460.origin = CGPointMake(1506, 2765);
    [station0365.nameOriginalTextPrimitives addObject:drawTextLine0460];

    MWDrawTextLine *drawTextLine0461 = [[MWDrawTextLine alloc] init];
    drawTextLine0461.text = @"Xavier";
    drawTextLine0461.fontName = @"HelveticaNeue";
    drawTextLine0461.fontColor = [UIColor blackColor];
    drawTextLine0461.fontSize = 34;
    drawTextLine0461.kernSpacing = -0.5;
    drawTextLine0461.origin = CGPointMake(1506, 2798);
    [station0365.nameOriginalTextPrimitives addObject:drawTextLine0461];

    // Добавляем перегон
    MWHaul *haul0353 = [[MWHaul alloc] init];
    haul0353.identifier = @"haul0353";
    haul0353.length = 561;
    [edge0147.elements addObject:haul0353];
    
    MWDrawLine *drawLine0508 = [[MWDrawLine alloc] init];
    drawLine0508.startPoint = CGPointMake(1511.5, 2848);
    drawLine0508.endPoint = CGPointMake(1654, 2990);
    drawLine0508.width = 11;
    drawLine0508.color = line0015.color;
    [haul0353.drawPrimitives addObject:drawLine0508];

    // Добавляем станцию Duroc
    MWStation *station0366 = [[MWStation alloc] init];
    station0366.identifier = @"station0366";
    [edge0147.elements addObject:station0366];
    
    station0366.nameOriginal = @"Duroc";
    station0366.mapLocation = CGPointMake(1654, 2990);
    station0366.geoLocation = CGPointMake(48.846829, 2.316479);

    MWDrawFillCircle *fillCircle0363 = [[MWDrawFillCircle alloc] init];
    fillCircle0363.center = station0366.mapLocation;
    fillCircle0363.radius = 3;
    fillCircle0363.fillColor = [UIColor whiteColor];
    [station0366.drawPrimitives addObject:fillCircle0366];

    station0366.showNameOnMap = false;
    [station0366.drawPrimitives addObject:drawTextLine0381];
    
    // Добавляем вершину
    edge0147.finishVertex = vertex0076;

    // Создаем участок линии Duroc - Montparnasse - Bienvenüe
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0148 = [[MWEdge alloc] init];
    edge0148.identifier = @"edge0148";
    edge0148.developmentName = @"Ребро: Duroc - Montparnasse - Bienvenüe";
    [self.edges addObject:edge0148];
    
    // Добавляем линию
    edge0148.line = line0015;
    
    // Добавляем вершину
    edge0148.startVertex = vertex0076;

    // Добавляем станцию Duroc
    [edge0148.elements addObject:station0366];

    // Добавляем перегон
    MWHaul *haul0354 = [[MWHaul alloc] init];
    haul0354.identifier = @"haul0354";
    haul0354.length = 689;
    [edge0148.elements addObject:haul0354];
    
    MWDrawLine *drawLine0509 = [[MWDrawLine alloc] init];
    drawLine0509.startPoint = CGPointMake(1653.5, 2989.5);
    drawLine0509.endPoint = CGPointMake(1802, 3138);
    drawLine0509.width = 11;
    drawLine0509.color = line0015.color;
    [haul0354.drawPrimitives addObject:drawLine0509];

    MWDrawArc *drawArc0144 = [[MWDrawArc alloc] init];
    drawArc0144.center = CGPointMake(1822.5, 3116);
    drawArc0144.startDegrees = 90;
    drawArc0144.endDegrees = 135;
    drawArc0144.radius = 30;
    drawArc0144.width = 11;
    drawArc0144.color = line0015.color;
    [haul0354.drawPrimitives addObject:drawArc0144];
    
    MWDrawLine *drawLine0510 = [[MWDrawLine alloc] init];
    drawLine0510.startPoint = CGPointMake(1822, 3146);
    drawLine0510.endPoint = CGPointMake(1954, 3146);
    drawLine0510.width = 11;
    drawLine0510.color = line0015.color;
    [haul0354.drawPrimitives addObject:drawLine0510];

    // Добавляем станцию Montparnasse - Bienvenüe
    MWStation *station0367 = [[MWStation alloc] init];
    station0367.identifier = @"station0367";
    [edge0148.elements addObject:station0367];
    
    station0367.nameOriginal = @"Montparnasse - Bienvenüe";
    station0367.mapLocation = CGPointMake(1948.5, 3146);
    station0367.geoLocation = CGPointMake(48.843466, 2.323072);
    
    MWDrawFillCircle *fillCircle0456 = [[MWDrawFillCircle alloc] init];
    fillCircle0456.center = station0367.mapLocation;
    fillCircle0456.radius = 3;
    fillCircle0456.fillColor = [UIColor whiteColor];
    [station0367.drawPrimitives addObject:fillCircle0456];

    station0367.showNameOnMap = false;
    [station0367.nameOriginalTextPrimitives addObject:drawTextLine0137];
    [station0367.nameOriginalTextPrimitives addObject:drawTextLine0138];

    // Добавляем вершину
    edge0148.finishVertex = vertex0040;

    // Создаем участок линии Montparnasse - Bienvenüe - Châtillon - Montrouge
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0149 = [[MWEdge alloc] init];
    edge0149.identifier = @"edge0149";
    edge0149.developmentName = @"Ребро: Duroc - Montparnasse - Bienvenüe";
    [self.edges addObject:edge0149];
    
    // Добавляем линию
    edge0149.line = line0015;
    
    // Добавляем вершину
    edge0149.startVertex = vertex0040;

    // Добавляем станцию Montparnasse - Bienvenüe
    [edge0149.elements addObject:station0367];

    // Добавляем перегон
    MWHaul *haul0355 = [[MWHaul alloc] init];
    haul0355.identifier = @"haul0355";
    haul0355.length = 363;
    [edge0149.elements addObject:haul0355];
    
    MWDrawLine *drawLine0511 = [[MWDrawLine alloc] init];
    drawLine0511.startPoint = CGPointMake(1948.5, 3141);
    drawLine0511.endPoint = CGPointMake(1948.5, 3313);
    drawLine0511.width = 11;
    drawLine0511.color = line0015.color;
    [haul0355.drawPrimitives addObject:drawLine0511];

    // Добавляем станцию Gaîté
    MWStation *station0368 = [[MWStation alloc] init];
    station0368.identifier = @"station0368";
    [edge0149.elements addObject:station0368];
    
    station0368.nameOriginal = @"Gaîté";
    station0368.mapLocation = CGPointMake(1948.5, 3313);
    station0368.geoLocation = CGPointMake(48.838654, 2.322637);

    MWDrawFillCircle *fillCircle0457 = [[MWDrawFillCircle alloc] init];
    fillCircle0457.center = station0368.mapLocation;
    fillCircle0457.radius = 12;
    fillCircle0457.fillColor = line0015.color;
    [station0368.drawPrimitives addObject:fillCircle0457];

    MWDrawTextLine *drawTextLine0462 = [[MWDrawTextLine alloc] init];
    drawTextLine0462.text = station0368.nameOriginal;
    drawTextLine0462.fontName = @"HelveticaNeue";
    drawTextLine0462.fontColor = [UIColor blackColor];
    drawTextLine0462.fontSize = 34;
    drawTextLine0462.kernSpacing = -0.5;
    drawTextLine0462.origin = CGPointMake(1968, 3291);
    [station0368.nameOriginalTextPrimitives addObject:drawTextLine0462];

    // Добавляем перегон
    MWHaul *haul0356 = [[MWHaul alloc] init];
    haul0356.identifier = @"haul0356";
    haul0356.length = 648;
    [edge0149.elements addObject:haul0356];
    
    MWDrawLine *drawLine0512 = [[MWDrawLine alloc] init];
    drawLine0512.startPoint = CGPointMake(1948, 3312.5);
    drawLine0512.endPoint = CGPointMake(1948, 3340);
    drawLine0512.width = 11;
    drawLine0512.color = line0015.color;
    [haul0356.drawPrimitives addObject:drawLine0512];

    MWDrawArc *drawArc0145 = [[MWDrawArc alloc] init];
    drawArc0145.center = CGPointMake(1918, 3340);
    drawArc0145.startDegrees = 0;
    drawArc0145.endDegrees = 45;
    drawArc0145.radius = 30;
    drawArc0145.width = 11;
    drawArc0145.color = line0015.color;
    [haul0356.drawPrimitives addObject:drawArc0145];
    
    MWDrawLine *drawLine0513 = [[MWDrawLine alloc] init];
    drawLine0513.startPoint = CGPointMake(1939.5, 3361);
    drawLine0513.endPoint = CGPointMake(1887.5, 3413);
    drawLine0513.width = 11;
    drawLine0513.color = line0015.color;
    [haul0356.drawPrimitives addObject:drawLine0513];

    // Добавляем станцию Pernety
    MWStation *station0369 = [[MWStation alloc] init];
    station0369.identifier = @"station0369";
    [edge0149.elements addObject:station0369];
    
    station0369.nameOriginal = @"Pernety";
    station0369.mapLocation = CGPointMake(1887.5, 3413);
    station0369.geoLocation = CGPointMake(48.83421, 2.31851);

    MWDrawFillCircle *fillCircle0458 = [[MWDrawFillCircle alloc] init];
    fillCircle0458.center = station0369.mapLocation;
    fillCircle0458.radius = 12;
    fillCircle0458.fillColor = line0015.color;
    [station0369.drawPrimitives addObject:fillCircle0458];
    
    MWDrawTextLine *drawTextLine0463 = [[MWDrawTextLine alloc] init];
    drawTextLine0463.text = station0369.nameOriginal;
    drawTextLine0463.fontName = @"HelveticaNeue";
    drawTextLine0463.fontColor = [UIColor blackColor];
    drawTextLine0463.fontSize = 34;
    drawTextLine0463.kernSpacing = -0.3;
    drawTextLine0463.origin = CGPointMake(1897, 3416);
    [station0369.nameOriginalTextPrimitives addObject:drawTextLine0463];

    // Добавляем перегон
    MWHaul *haul0357 = [[MWHaul alloc] init];
    haul0357.identifier = @"haul0357";
    haul0357.length = 435;
    [edge0149.elements addObject:haul0357];
    
    MWDrawLine *drawLine0514 = [[MWDrawLine alloc] init];
    drawLine0514.startPoint = CGPointMake(1888, 3412.5);
    drawLine0514.endPoint = CGPointMake(1787, 3513);
    drawLine0514.width = 11;
    drawLine0514.color = line0015.color;
    [haul0357.drawPrimitives addObject:drawLine0514];

    // Добавляем станцию Plaisance
    MWStation *station0370 = [[MWStation alloc] init];
    station0370.identifier = @"station0370";
    [edge0149.elements addObject:station0370];
    
    station0370.nameOriginal = @"Plaisance";
    station0370.mapLocation = CGPointMake(1787, 3513);
    station0370.geoLocation = CGPointMake(48.831553, 2.313741);
    
    MWDrawFillCircle *fillCircle0459 = [[MWDrawFillCircle alloc] init];
    fillCircle0459.center = station0370.mapLocation;
    fillCircle0459.radius = 12;
    fillCircle0459.fillColor = line0015.color;
    [station0370.drawPrimitives addObject:fillCircle0459];
    
    MWDrawTextLine *drawTextLine0464 = [[MWDrawTextLine alloc] init];
    drawTextLine0464.text = station0370.nameOriginal;
    drawTextLine0464.fontName = @"HelveticaNeue";
    drawTextLine0464.fontColor = [UIColor blackColor];
    drawTextLine0464.fontSize = 34;
    drawTextLine0464.kernSpacing = -0.8;
    drawTextLine0464.origin = CGPointMake(1797, 3516);
    [station0370.nameOriginalTextPrimitives addObject:drawTextLine0464];

    // Добавляем перегон
    MWHaul *haul0358 = [[MWHaul alloc] init];
    haul0358.identifier = @"haul0358";
    haul0358.length = 775;
    [edge0149.elements addObject:haul0358];
    
    MWDrawLine *drawLine0515 = [[MWDrawLine alloc] init];
    drawLine0515.startPoint = CGPointMake(1787.5, 3512.5);
    drawLine0515.endPoint = CGPointMake(1666.5, 3634);
    drawLine0515.width = 11;
    drawLine0515.color = line0015.color;
    [haul0358.drawPrimitives addObject:drawLine0515];

    // Добавляем станцию Porte de Vanves
    MWStation *station0371 = [[MWStation alloc] init];
    station0371.identifier = @"station0371";
    [edge0149.elements addObject:station0371];
    
    station0371.nameOriginal = @"Porte de Vanves";
    station0371.mapLocation = CGPointMake(1666.5, 3634);
    station0371.geoLocation = CGPointMake(48.82794, 2.30588);
    
    MWDrawFillCircle *fillCircle0460 = [[MWDrawFillCircle alloc] init];
    fillCircle0460.center = station0371.mapLocation;
    fillCircle0460.radius = 13;
    fillCircle0460.fillColor = [UIColor blackColor];
    [station0371.drawPrimitives addObject:fillCircle0460];
    
    MWDrawFillCircle *fillCircle0461 = [[MWDrawFillCircle alloc] init];
    fillCircle0461.center = station0371.mapLocation;
    fillCircle0461.radius = 11;
    fillCircle0461.fillColor = [UIColor whiteColor];
    [station0371.drawPrimitives addObject:fillCircle0461];

    MWDrawTextLine *drawTextLine0465 = [[MWDrawTextLine alloc] init];
    drawTextLine0465.text = station0371.nameOriginal;
    drawTextLine0465.fontName = @"HelveticaNeue";
    drawTextLine0465.fontColor = [UIColor blackColor];
    drawTextLine0465.fontSize = 34;
    drawTextLine0465.kernSpacing = -0.6;
    drawTextLine0465.origin = CGPointMake(1695, 3613);
    [station0371.nameOriginalTextPrimitives addObject:drawTextLine0465];

    // Добавляем перегон
    MWHaul *haul0359 = [[MWHaul alloc] init];
    haul0359.identifier = @"haul0359";
    haul0359.length = 768;
    [edge0149.elements addObject:haul0359];
    
    MWDrawLine *drawLine0516 = [[MWDrawLine alloc] init];
    drawLine0516.startPoint = CGPointMake(1667, 3633.5);
    drawLine0516.endPoint = CGPointMake(1553.5, 3747);
    drawLine0516.width = 11;
    drawLine0516.color = line0015.color;
    [haul0359.drawPrimitives addObject:drawLine0516];

    // Добавляем станцию Malakoff - Plateau de Vanves
    MWStation *station0372 = [[MWStation alloc] init];
    station0372.identifier = @"station0372";
    [edge0149.elements addObject:station0372];
    
    station0372.nameOriginal = @"Malakoff - Plateau de Vanves";
    station0372.mapLocation = CGPointMake(1553.5, 3747);
    station0372.geoLocation = CGPointMake(48.82794, 2.30588);

    MWDrawFillCircle *fillCircle0462 = [[MWDrawFillCircle alloc] init];
    fillCircle0462.center = station0372.mapLocation;
    fillCircle0462.radius = 12;
    fillCircle0462.fillColor = line0015.color;
    [station0372.drawPrimitives addObject:fillCircle0462];
    
    MWDrawTextLine *drawTextLine0466 = [[MWDrawTextLine alloc] init];
    drawTextLine0466.text = @"Malakoff";
    drawTextLine0466.fontName = @"HelveticaNeue";
    drawTextLine0466.fontColor = [UIColor blackColor];
    drawTextLine0466.fontSize = 34;
    drawTextLine0466.kernSpacing = -0.4;
    drawTextLine0466.origin = CGPointMake(1592, 3708);
    [station0372.nameOriginalTextPrimitives addObject:drawTextLine0466];

    MWDrawTextLine *drawTextLine0467 = [[MWDrawTextLine alloc] init];
    drawTextLine0467.text = @"Plateau de Vanves";
    drawTextLine0467.fontName = @"HelveticaNeue";
    drawTextLine0467.fontColor = [UIColor blackColor];
    drawTextLine0467.fontSize = 34;
    drawTextLine0467.kernSpacing = -0.6;
    drawTextLine0467.origin = CGPointMake(1592, 3742);
    [station0372.nameOriginalTextPrimitives addObject:drawTextLine0467];

    // Добавляем перегон
    MWHaul *haul0360 = [[MWHaul alloc] init];
    haul0360.identifier = @"haul0360";
    haul0360.length = 908;
    [edge0149.elements addObject:haul0360];
    
    MWDrawLine *drawLine0517 = [[MWDrawLine alloc] init];
    drawLine0517.startPoint = CGPointMake(1554, 3746.5);
    drawLine0517.endPoint = CGPointMake(1478.5, 3821.5);
    drawLine0517.width = 11;
    drawLine0517.color = line0015.color;
    [haul0360.drawPrimitives addObject:drawLine0517];

    // Добавляем станцию Malakoff - Rue Étienne Dolet
    MWStation *station0373 = [[MWStation alloc] init];
    station0373.identifier = @"station0373";
    [edge0149.elements addObject:station0373];
    
    station0373.nameOriginal = @"Malakoff - Rue Étienne Dolet";
    station0373.mapLocation = CGPointMake(1478.5, 3821.5);
    station0373.geoLocation = CGPointMake(48.8147, 2.2973);

    MWDrawFillCircle *fillCircle0463 = [[MWDrawFillCircle alloc] init];
    fillCircle0463.center = station0373.mapLocation;
    fillCircle0463.radius = 12;
    fillCircle0463.fillColor = line0015.color;
    [station0373.drawPrimitives addObject:fillCircle0463];
    
    MWDrawTextLine *drawTextLine0468 = [[MWDrawTextLine alloc] init];
    drawTextLine0468.text = @"Malakoff";
    drawTextLine0468.fontName = @"HelveticaNeue";
    drawTextLine0468.fontColor = [UIColor blackColor];
    drawTextLine0468.fontSize = 34;
    drawTextLine0468.kernSpacing = -0.3;
    drawTextLine0468.origin = CGPointMake(1500, 3800);
    [station0373.nameOriginalTextPrimitives addObject:drawTextLine0468];

    // Добавляем перегон
    MWHaul *haul0361 = [[MWHaul alloc] init];
    haul0361.identifier = @"haul0361";
    haul0361.length = 617;
    [edge0149.elements addObject:haul0361];
    
    MWDrawLine *drawLine0518 = [[MWDrawLine alloc] init];
    drawLine0518.startPoint = CGPointMake(1479, 3821);
    drawLine0518.endPoint = CGPointMake(1356, 3945);
    drawLine0518.width = 11;
    drawLine0518.color = line0015.color;
    [haul0361.drawPrimitives addObject:drawLine0518];

    // Добавляем станцию Châtillon - Montrouge
    MWStation *station0374 = [[MWStation alloc] init];
    station0374.identifier = @"station0374";
    [edge0149.elements addObject:station0374];
    
    station0374.nameOriginal = @"Châtillon - Montrouge";
    station0374.mapLocation = CGPointMake(1356, 3945);
    station0374.geoLocation = CGPointMake(48.810539, 2.301826);
    
    MWDrawFillCircle *fillCircle0464 = [[MWDrawFillCircle alloc] init];
    fillCircle0464.center = station0374.mapLocation;
    fillCircle0464.radius = 13;
    fillCircle0464.fillColor = [UIColor blackColor];
    [station0374.drawPrimitives addObject:fillCircle0464];
    
    MWDrawFillCircle *fillCircle0465 = [[MWDrawFillCircle alloc] init];
    fillCircle0465.center = station0374.mapLocation;
    fillCircle0465.radius = 11;
    fillCircle0465.fillColor = [UIColor whiteColor];
    [station0374.drawPrimitives addObject:fillCircle0465];

    MWDrawFillCircle *fillCircle0466 = [[MWDrawFillCircle alloc] init];
    fillCircle0466.center = CGPointMake(1404, 3950);
    fillCircle0466.radius = 28;
    fillCircle0466.fillColor = line0015.color;
    [station0374.drawPrimitives addObject:fillCircle0466];

    MWDrawTextLine *drawTextLine0469 = [[MWDrawTextLine alloc] init];
    drawTextLine0469.text = @"13";
    drawTextLine0469.fontName = @"HelveticaNeue-Bold";
    drawTextLine0469.fontColor = [UIColor blackColor];
    drawTextLine0469.fontSize = 44;
    drawTextLine0469.origin = CGPointMake(1379, 3922);
    [station0374.drawPrimitives addObject:drawTextLine0469];

    MWDrawTextLine *drawTextLine0470 = [[MWDrawTextLine alloc] init];
    drawTextLine0470.text = station0374.nameOriginal;
    drawTextLine0470.fontName = @"Helvetica-Bold";
    drawTextLine0470.fontColor = [UIColor blackColor];
    drawTextLine0470.fontSize = 30;
    drawTextLine0470.kernSpacing = 1.6;
    drawTextLine0470.origin = CGPointMake(1439, 3933);
    [station0374.drawPrimitives addObject:drawTextLine0470];

    // Добавляем вершину
    edge0149.finishVertex = vertex0089;

    ////////////////////////////////////////////////////////////////
    // Line 14
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Saint-Lazare - Madeleine
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0150 = [[MWEdge alloc] init];
    edge0150.identifier = @"edge0150";
    edge0150.developmentName = @"Ребро: Saint-Lazare - Madeleine";
    [self.edges addObject:edge0150];
    
    // Добавляем линию
    edge0150.line = line0016;
    
    // Добавляем вершину
    edge0150.startVertex = vertex0025;
    
    // Добавляем станцию Saint-Lazare
    MWStation *station0375 = [[MWStation alloc] init];
    station0375.identifier = @"station0375";
    [edge0150.elements addObject:station0375];
    
    station0375.nameOriginal = @"Saint-Lazare";
    station0375.mapLocation = CGPointMake(1709.5, 1744);
    station0375.geoLocation = CGPointMake(48.87549, 2.32664);
    
    MWDrawFillCircle *fillCircle0467 = [[MWDrawFillCircle alloc] init];
    fillCircle0467.center = CGPointMake(1657.5, 1744.5);
    fillCircle0467.radius = 28;
    fillCircle0467.fillColor = line0016.color;
    [station0375.drawPrimitives addObject:fillCircle0467];

    MWDrawTextLine *drawTextLine0471 = [[MWDrawTextLine alloc] init];
    drawTextLine0471.text = @"14";
    drawTextLine0471.fontName = @"HelveticaNeue-Bold";
    drawTextLine0471.fontColor = [UIColor whiteColor];
    drawTextLine0471.fontSize = 44;
    drawTextLine0471.origin = CGPointMake(1632, 1716);
    [station0375.drawPrimitives addObject:drawTextLine0471];

    MWDrawFillCircle *fillCircle0468 = [[MWDrawFillCircle alloc] init];
    fillCircle0468.center = station0375.mapLocation;
    fillCircle0468.radius = 5.5;
    fillCircle0468.fillColor = line0016.color;
    [station0375.drawPrimitives addObject:fillCircle0468];

    station0375.showNameOnMap = false;
    [station0375.drawPrimitives addObject:drawTextLine0083];
    
    // Добавляем перегон
    MWHaul *haul0362 = [[MWHaul alloc] init];
    haul0362.identifier = @"haul0362";
    haul0362.length = 612;
    [edge0150.elements addObject:haul0362];

    MWDrawLine *drawLine0519 = [[MWDrawLine alloc] init];
    drawLine0519.startPoint = CGPointMake(1709.5, 1744);
    drawLine0519.endPoint = CGPointMake(1709.5, 1853);
    drawLine0519.width = 11;
    drawLine0519.color = line0016.color;
    [haul0362.drawPrimitives addObject:drawLine0519];

    MWDrawArc *drawArc0146 = [[MWDrawArc alloc] init];
    drawArc0146.center = CGPointMake(1679.5, 1853);
    drawArc0146.startDegrees = 0;
    drawArc0146.endDegrees = 45;
    drawArc0146.radius = 30;
    drawArc0146.width = 11;
    drawArc0146.color = line0016.color;
    [haul0362.drawPrimitives addObject:drawArc0146];

    MWDrawLine *drawLine0520 = [[MWDrawLine alloc] init];
    drawLine0520.startPoint = CGPointMake(1701.5, 1873.5);
    drawLine0520.endPoint = CGPointMake(1565, 2010);
    drawLine0520.width = 11;
    drawLine0520.color = line0016.color;
    [haul0362.drawPrimitives addObject:drawLine0520];

    MWDrawArc *drawArc0147 = [[MWDrawArc alloc] init];
    drawArc0147.center = CGPointMake(1587, 2030.5);
    drawArc0147.startDegrees = 180;
    drawArc0147.endDegrees = 225;
    drawArc0147.radius = 30;
    drawArc0147.width = 11;
    drawArc0147.color = line0016.color;
    [haul0362.drawPrimitives addObject:drawArc0147];

    MWDrawLine *drawLine0521 = [[MWDrawLine alloc] init];
    drawLine0521.startPoint = CGPointMake(1557, 2030);
    drawLine0521.endPoint = CGPointMake(1557, 2141.5);
    drawLine0521.width = 11;
    drawLine0521.color = line0016.color;
    [haul0362.drawPrimitives addObject:drawLine0521];

    // Добавляем станцию Madeleine
    MWStation *station0376 = [[MWStation alloc] init];
    station0376.identifier = @"station0376";
    [edge0150.elements addObject:station0376];
    
    station0376.nameOriginal = @"Madeleine";
    station0376.mapLocation = CGPointMake(1557, 2141.5);
    station0376.geoLocation = CGPointMake(48.86977, 2.3244);
    
    MWDrawFillCircle *fillCircle0469 = [[MWDrawFillCircle alloc] init];
    fillCircle0469.center = station0376.mapLocation;
    fillCircle0469.radius = 3;
    fillCircle0469.fillColor = [UIColor whiteColor];
    [station0376.drawPrimitives addObject:fillCircle0469];

    station0376.showNameOnMap = false;
    [station0376.nameOriginalTextPrimitives addObject:drawTextLine0289];
    
    // Добавляем вершину
    edge0150.finishVertex = vertex0064;

    // Создаем участок линии Madeleine - Pyramides
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0151 = [[MWEdge alloc] init];
    edge0151.identifier = @"edge0151";
    edge0151.developmentName = @"Ребро: Madeleine - Pyramides";
    [self.edges addObject:edge0151];
    
    // Добавляем линию
    edge0151.line = line0016;
    
    // Добавляем вершину
    edge0151.startVertex = vertex0064;

    // Добавляем станцию Madeleine
    [edge0151.elements addObject:station0376];

    // Добавляем перегон
    MWHaul *haul0363 = [[MWHaul alloc] init];
    haul0363.identifier = @"haul0363";
    haul0363.length = 830;
    [edge0151.elements addObject:haul0363];
    
    MWDrawLine *drawLine0522 = [[MWDrawLine alloc] init];
    drawLine0522.startPoint = CGPointMake(1557, 2141);
    drawLine0522.endPoint = CGPointMake(1557, 2149);
    drawLine0522.width = 11;
    drawLine0522.color = line0016.color;
    [haul0363.drawPrimitives addObject:drawLine0522];

    MWDrawArc *drawArc0148 = [[MWDrawArc alloc] init];
    drawArc0148.center = CGPointMake(1572, 2149);
    drawArc0148.startDegrees = 90;
    drawArc0148.endDegrees = 180;
    drawArc0148.radius = 15;
    drawArc0148.width = 11;
    drawArc0148.color = line0016.color;
    [haul0363.drawPrimitives addObject:drawArc0148];

    MWDrawLine *drawLine0523 = [[MWDrawLine alloc] init];
    drawLine0523.startPoint = CGPointMake(1572, 2164);
    drawLine0523.endPoint = CGPointMake(1895.5, 2164);
    drawLine0523.width = 11;
    drawLine0523.color = line0016.color;
    [haul0363.drawPrimitives addObject:drawLine0523];

    // Добавляем станцию Pyramides
    MWStation *station0377 = [[MWStation alloc] init];
    station0377.identifier = @"station0377";
    [edge0151.elements addObject:station0377];
    
    station0377.nameOriginal = @"Pyramides";
    station0377.mapLocation = CGPointMake(1895.5, 2164);
    station0377.geoLocation = CGPointMake(48.86587, 2.33467);
    
    MWDrawFillCircle *fillCircle0470 = [[MWDrawFillCircle alloc] init];
    fillCircle0470.center = station0376.mapLocation;
    fillCircle0470.radius = 3;
    fillCircle0470.fillColor = [UIColor whiteColor];
    [station0377.drawPrimitives addObject:fillCircle0470];

    station0377.showNameOnMap = false;
    [station0377.nameOriginalTextPrimitives addObject:drawTextLine0232];
    
    // Добавляем вершину
    edge0151.finishVertex = vertex0056;
    
    // Создаем участок линии Pyramides - Châtelet
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0152 = [[MWEdge alloc] init];
    edge0152.identifier = @"edge0152";
    edge0152.developmentName = @"Ребро: Pyramides - Châtelet";
    [self.edges addObject:edge0152];
    
    // Добавляем линию
    edge0152.line = line0016;
    
    // Добавляем вершину
    edge0152.startVertex = vertex0056;

    // Добавляем станцию Pyramides
    [edge0152.elements addObject:station0377];

    // Добавляем перегон
    MWHaul *haul0364 = [[MWHaul alloc] init];
    haul0364.identifier = @"haul0364";
    haul0364.length = 1278;
    [edge0152.elements addObject:haul0364];
    
    MWDrawLine *drawLine0524 = [[MWDrawLine alloc] init];
    drawLine0524.startPoint = CGPointMake(1895, 2164);
    drawLine0524.endPoint = CGPointMake(1991, 2164);
    drawLine0524.width = 11;
    drawLine0524.color = line0016.color;
    [haul0364.drawPrimitives addObject:drawLine0524];
    
    MWDrawArc *drawArc0149 = [[MWDrawArc alloc] init];
    drawArc0149.center = CGPointMake(1990.5, 2194);
    drawArc0149.startDegrees = 270;
    drawArc0149.endDegrees = 315;
    drawArc0149.radius = 30;
    drawArc0149.width = 11;
    drawArc0149.color = line0016.color;
    [haul0364.drawPrimitives addObject:drawArc0149];

    MWDrawLine *drawLine0525 = [[MWDrawLine alloc] init];
    drawLine0525.startPoint = CGPointMake(2011.5, 2172.5);
    drawLine0525.endPoint = CGPointMake(2159, 2320);
    drawLine0525.width = 11;
    drawLine0525.color = line0016.color;
    [haul0364.drawPrimitives addObject:drawLine0525];

    MWDrawArc *drawArc0150 = [[MWDrawArc alloc] init];
    drawArc0150.center = CGPointMake(2179.5, 2298);
    drawArc0150.startDegrees = 90;
    drawArc0150.endDegrees = 135;
    drawArc0150.radius = 30;
    drawArc0150.width = 11;
    drawArc0150.color = line0016.color;
    [haul0364.drawPrimitives addObject:drawArc0150];

    MWDrawLine *drawLine0526 = [[MWDrawLine alloc] init];
    drawLine0526.startPoint = CGPointMake(2179, 2328);
    drawLine0526.endPoint = CGPointMake(2366, 2328);
    drawLine0526.width = 11;
    drawLine0526.color = line0016.color;
    [haul0364.drawPrimitives addObject:drawLine0526];

    // Добавляем станцию Châtelet
    MWStation *station0378 = [[MWStation alloc] init];
    station0378.identifier = @"station0378";
    [edge0152.elements addObject:station0378];
    
    station0378.nameOriginal = @"Châtelet";
    station0378.mapLocation = CGPointMake(2366, 2328);
    station0378.geoLocation = CGPointMake(48.858352, 2.347324);
    
    MWDrawFillCircle *fillCircle0471 = [[MWDrawFillCircle alloc] init];
    fillCircle0471.center = station0378.mapLocation;
    fillCircle0471.radius = 3;
    fillCircle0471.fillColor = [UIColor whiteColor];
    [station0378.drawPrimitives addObject:fillCircle0471];

    station0378.showNameOnMap = false;
    [station0378.nameOriginalTextPrimitives addObject:drawTextLine0026];
    
    // Добавляем вершину
    edge0152.finishVertex = vertex0007;

    // Создаем участок линии Châtelet - Gare de Lyon
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0153 = [[MWEdge alloc] init];
    edge0153.identifier = @"edge0153";
    edge0153.developmentName = @"Ребро: Châtelet - Gare de Lyon";
    [self.edges addObject:edge0153];
    
    // Добавляем линию
    edge0153.line = line0016;
    
    // Добавляем вершину
    edge0153.startVertex = vertex0007;

    // Добавляем станцию Châtelet
    [edge0153.elements addObject:station0378];

    // Добавляем перегон
    MWHaul *haul0365 = [[MWHaul alloc] init];
    haul0365.identifier = @"haul0365";
    haul0365.length = 2528;
    [edge0153.elements addObject:haul0365];
    
    MWDrawLine *drawLine0527 = [[MWDrawLine alloc] init];
    drawLine0527.startPoint = CGPointMake(2365.5, 2328);
    drawLine0527.endPoint = CGPointMake(2397, 2328);
    drawLine0527.width = 11;
    drawLine0527.color = line0016.color;
    [haul0365.drawPrimitives addObject:drawLine0527];

    MWDrawArc *drawArc0151 = [[MWDrawArc alloc] init];
    drawArc0151.center = CGPointMake(2396.5, 2358);
    drawArc0151.startDegrees = 270;
    drawArc0151.endDegrees = 315;
    drawArc0151.radius = 30;
    drawArc0151.width = 11;
    drawArc0151.color = line0016.color;
    [haul0365.drawPrimitives addObject:drawArc0151];

    MWDrawLine *drawLine0528 = [[MWDrawLine alloc] init];
    drawLine0528.startPoint = CGPointMake(2417.5, 2336.5);
    drawLine0528.endPoint = CGPointMake(3047.5, 2966.5);
    drawLine0528.width = 11;
    drawLine0528.color = line0016.color;
    [haul0365.drawPrimitives addObject:drawLine0528];

    // Добавляем станцию Gare de Lyon
    MWStation *station0379 = [[MWStation alloc] init];
    station0379.identifier = @"station0379";
    [edge0153.elements addObject:station0379];
    
    station0379.nameOriginal = @"Gare de Lyon";
    station0379.mapLocation = CGPointMake( 3047.5, 2966.5);
    station0379.geoLocation = CGPointMake(48.844722, 2.373889);
    
    MWDrawFillCircle *fillCircle0472 = [[MWDrawFillCircle alloc] init];
    fillCircle0472.center = station0379.mapLocation;
    fillCircle0472.radius = 3;
    fillCircle0472.fillColor = [UIColor whiteColor];
    [station0379.drawPrimitives addObject:fillCircle0472];

    station0379.showNameOnMap = false;
    [station0379.nameOriginalTextPrimitives addObject:drawTextLine0030];
    [station0379.nameOriginalTextPrimitives addObject:drawTextLine0031];
    
    // Добавляем вершину
    edge0153.finishVertex = vertex0010;

    // Создаем участок линии Gare de Lyon - Bercy
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0154 = [[MWEdge alloc] init];
    edge0154.identifier = @"edge0154";
    edge0154.developmentName = @"Ребро: Gare de Lyon - Bercy";
    [self.edges addObject:edge0154];
    
    // Добавляем линию
    edge0154.line = line0016;
    
    // Добавляем вершину
    edge0154.startVertex = vertex0010;

    // Добавляем станцию Gare de Lyon
    [edge0154.elements addObject:station0379];

    // Добавляем перегон
    MWHaul *haul0366 = [[MWHaul alloc] init];
    haul0366.identifier = @"haul0366";
    haul0366.length = 667;
    [edge0154.elements addObject:haul0366];
    
    MWDrawLine *drawLine0529 = [[MWDrawLine alloc] init];
    drawLine0529.startPoint = CGPointMake(3047, 2966);
    drawLine0529.endPoint = CGPointMake(3302.5, 3221.5);
    drawLine0529.width = 11;
    drawLine0529.color = line0016.color;
    [haul0366.drawPrimitives addObject:drawLine0529];

    // Добавляем станцию Bercy
    MWStation *station0380 = [[MWStation alloc] init];
    station0380.identifier = @"station0380";
    [edge0154.elements addObject:station0380];
    
    station0380.nameOriginal = @"Bercy";
    station0380.mapLocation = CGPointMake(3302.5, 3221.5);
    station0380.geoLocation = CGPointMake(48.83993, 2.380418);
    
    MWDrawFillCircle *fillCircle0473 = [[MWDrawFillCircle alloc] init];
    fillCircle0473.center = station0380.mapLocation;
    fillCircle0473.radius = 3;
    fillCircle0473.fillColor = [UIColor whiteColor];
    [station0380.drawPrimitives addObject:fillCircle0473];

    station0380.showNameOnMap = false;
    [station0380.nameOriginalTextPrimitives addObject:drawTextLine0203];
    
    // Добавляем вершину
    edge0154.finishVertex = vertex0051;

    // Создаем участок линии Bercy - Olympiades
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0155 = [[MWEdge alloc] init];
    edge0155.identifier = @"edge0155";
    edge0155.developmentName = @"Ребро: Bercy - Olympiades";
    [self.edges addObject:edge0155];
    
    // Добавляем линию
    edge0155.line = line0016;
    
    // Добавляем вершину
    edge0155.startVertex = vertex0051;

    // Добавляем станцию Bercy
    [edge0155.elements addObject:station0380];

    // Добавляем перегон
    MWHaul *haul0367 = [[MWHaul alloc] init];
    haul0367.identifier = @"haul0367";
    haul0367.length = 991;
    [edge0155.elements addObject:haul0367];
    
    MWDrawLine *drawLine0530 = [[MWDrawLine alloc] init];
    drawLine0530.startPoint = CGPointMake(3302, 3221);
    drawLine0530.endPoint = CGPointMake(3394.5, 3313.5);
    drawLine0530.width = 11;
    drawLine0530.color = line0016.color;
    [haul0367.drawPrimitives addObject:drawLine0530];

    MWDrawArc *drawArc0152 = [[MWDrawArc alloc] init];
    drawArc0152.center = CGPointMake(3383.5, 3323.5);
    drawArc0152.startDegrees = 315;
    drawArc0152.endDegrees = 45;
    drawArc0152.radius = 15;
    drawArc0152.width = 11;
    drawArc0152.color = line0016.color;
    [haul0367.drawPrimitives addObject:drawArc0152];

    MWDrawLine *drawLine0531 = [[MWDrawLine alloc] init];
    drawLine0531.startPoint = CGPointMake(3395, 3333.5);
    drawLine0531.endPoint = CGPointMake(3362.5, 3366);
    drawLine0531.width = 11;
    drawLine0531.color = line0016.color;
    [haul0367.drawPrimitives addObject:drawLine0531];

    // Добавляем станцию Cour Saint-Émilion
    MWStation *station0381 = [[MWStation alloc] init];
    station0381.identifier = @"station0381";
    [edge0155.elements addObject:station0381];
    
    station0381.nameOriginal = @"Cour Saint-Émilion";
    station0381.mapLocation = CGPointMake(3362.5, 3366);
    station0381.geoLocation = CGPointMake(48.834, 2.386);

    MWDrawFillCircle *fillCircle0474 = [[MWDrawFillCircle alloc] init];
    fillCircle0474.center = station0381.mapLocation;
    fillCircle0474.radius = 12;
    fillCircle0474.fillColor = line0016.color;
    [station0381.drawPrimitives addObject:fillCircle0474];

    MWDrawTextLine *drawTextLine0472 = [[MWDrawTextLine alloc] init];
    drawTextLine0472.text = @"Cour";
    drawTextLine0472.fontName = @"HelveticaNeue";
    drawTextLine0472.fontColor = [UIColor blackColor];
    drawTextLine0472.fontSize = 34;
    drawTextLine0472.kernSpacing = -1.5;
    drawTextLine0472.origin = CGPointMake(3291, 3283);
    [station0381.nameOriginalTextPrimitives addObject:drawTextLine0472];
    
    MWDrawTextLine *drawTextLine0473 = [[MWDrawTextLine alloc] init];
    drawTextLine0473.text = @"St-Émilion";
    drawTextLine0473.fontName = @"HelveticaNeue";
    drawTextLine0473.fontColor = [UIColor blackColor];
    drawTextLine0473.fontSize = 34;
    drawTextLine0473.kernSpacing = -0.4;
    drawTextLine0473.origin = CGPointMake(3209, 3316);
    [station0381.nameOriginalTextPrimitives addObject:drawTextLine0473];

    // Добавляем перегон
    MWHaul *haul0368 = [[MWHaul alloc] init];
    haul0368.identifier = @"haul0368";
    haul0368.length = 744;
    [edge0155.elements addObject:haul0368];
    
    MWDrawLine *drawLine0532 = [[MWDrawLine alloc] init];
    drawLine0532.startPoint = CGPointMake(3363, 3365.5);
    drawLine0532.endPoint = CGPointMake(3276.5, 3452);
    drawLine0532.width = 11;
    drawLine0532.color = line0016.color;
    [haul0368.drawPrimitives addObject:drawLine0532];

    // Добавляем станцию Bibliothèque François Mitterrand
    MWStation *station0382 = [[MWStation alloc] init];
    station0382.identifier = @"station0382";
    [edge0155.elements addObject:station0382];
    
    station0382.nameOriginal = @"Bibliothèque François Mitterrand";
    station0382.mapLocation = CGPointMake(3276.5, 3452);
    station0382.geoLocation = CGPointMake(48.829822, 2.376781);

    MWDrawLine *drawLine0533 = [[MWDrawLine alloc] init];
    drawLine0533.startPoint = CGPointMake(3135, 3479);
    drawLine0533.endPoint = CGPointMake(3245, 3479);
    drawLine0533.width = 50;
    drawLine0533.color = [UIColor colorWithWhite:1 alpha:0.3];
    [station0382.drawPrimitives addObject:drawLine0533];
    
    MWDrawLine *drawLine0534 = [[MWDrawLine alloc] init];
    drawLine0534.startPoint = CGPointMake(3175, 3470);
    drawLine0534.endPoint = CGPointMake(3275, 3470);
    drawLine0534.width = 50;
    drawLine0534.color = [UIColor colorWithWhite:1 alpha:0.3];
    [station0382.drawPrimitives addObject:drawLine0534];

    MWDrawFillCircle *fillCircle0475 = [[MWDrawFillCircle alloc] init];
    fillCircle0475.center = station0382.mapLocation;
    fillCircle0475.radius = 13;
    fillCircle0475.fillColor = [UIColor blackColor];
    [station0382.drawPrimitives addObject:fillCircle0475];
    
    MWDrawFillCircle *fillCircle0476 = [[MWDrawFillCircle alloc] init];
    fillCircle0476.center = station0382.mapLocation;
    fillCircle0476.radius = 11;
    fillCircle0476.fillColor = [UIColor whiteColor];
    [station0382.drawPrimitives addObject:fillCircle0476];

    MWDrawTextLine *drawTextLine0474 = [[MWDrawTextLine alloc] init];
    drawTextLine0474.text = @"Bibliothèque";
    drawTextLine0474.fontName = @"HelveticaNeue";
    drawTextLine0474.fontColor = [UIColor blackColor];
    drawTextLine0474.fontSize = 34;
    drawTextLine0474.kernSpacing = -0.2;
    drawTextLine0474.origin = CGPointMake(3060, 3432);
    [station0382.nameOriginalTextPrimitives addObject:drawTextLine0474];

    MWDrawTextLine *drawTextLine0475 = [[MWDrawTextLine alloc] init];
    drawTextLine0475.text = @"Fr. Mitterrand";
    drawTextLine0475.fontName = @"HelveticaNeue";
    drawTextLine0475.fontColor = [UIColor blackColor];
    drawTextLine0475.fontSize = 34;
    drawTextLine0475.kernSpacing = -0.0;
    drawTextLine0475.origin = CGPointMake(3042, 3465);
    [station0382.nameOriginalTextPrimitives addObject:drawTextLine0475];

    // Добавляем перегон
    MWHaul *haul0369 = [[MWHaul alloc] init];
    haul0369.identifier = @"haul0369";
    haul0369.length = 810;
    [edge0155.elements addObject:haul0369];
    
    MWDrawLine *drawLine0535 = [[MWDrawLine alloc] init];
    drawLine0535.startPoint = CGPointMake(3277, 3451.5);
    drawLine0535.endPoint = CGPointMake(3205.5, 3523);
    drawLine0535.width = 11;
    drawLine0535.color = line0016.color;
    [haul0369.drawPrimitives addObject:drawLine0535];

    MWDrawArc *drawArc0153 = [[MWDrawArc alloc] init];
    drawArc0153.center = CGPointMake(3185, 3501);
    drawArc0153.startDegrees = 45;
    drawArc0153.endDegrees = 90;
    drawArc0153.radius = 30;
    drawArc0153.width = 11;
    drawArc0153.color = line0016.color;
    [haul0369.drawPrimitives addObject:drawArc0153];

    MWDrawLine *drawLine0536 = [[MWDrawLine alloc] init];
    drawLine0536.startPoint = CGPointMake(3185, 3531);
    drawLine0536.endPoint = CGPointMake(3062.5, 3531);
    drawLine0536.width = 11;
    drawLine0536.color = line0016.color;
    [haul0369.drawPrimitives addObject:drawLine0536];

    // Добавляем станцию Olympiades
    MWStation *station0383 = [[MWStation alloc] init];
    station0383.identifier = @"station0383";
    [edge0155.elements addObject:station0383];
    
    station0383.nameOriginal = @"Olympiades";
    station0383.mapLocation = CGPointMake(3062.5, 3531);
    station0383.geoLocation = CGPointMake(48.827222, 2.368333);

    MWDrawFillCircle *fillCircle0477 = [[MWDrawFillCircle alloc] init];
    fillCircle0477.center = station0383.mapLocation;
    fillCircle0477.radius = 12;
    fillCircle0477.fillColor = [UIColor blackColor];
    [station0383.drawPrimitives addObject:fillCircle0477];

    MWDrawFillCircle *fillCircle0478 = [[MWDrawFillCircle alloc] init];
    fillCircle0478.center = CGPointMake(3018, 3530.5);
    fillCircle0478.radius = 28;
    fillCircle0478.fillColor = line0016.color;
    [station0383.drawPrimitives addObject:fillCircle0478];

    MWDrawTextLine *drawTextLine0476 = [[MWDrawTextLine alloc] init];
    drawTextLine0476.text = @"14";
    drawTextLine0476.fontName = @"HelveticaNeue-Bold";
    drawTextLine0476.fontColor = [UIColor whiteColor];
    drawTextLine0476.fontSize = 44;
    drawTextLine0476.origin = CGPointMake(2992.5, 3502.5);
    [station0383.drawPrimitives addObject:drawTextLine0476];

    MWDrawTextLine *drawTextLine0477 = [[MWDrawTextLine alloc] init];
    drawTextLine0477.text = station0383.nameOriginal;
    drawTextLine0477.fontName = @"Helvetica-Bold";
    drawTextLine0477.fontColor = [UIColor blackColor];
    drawTextLine0477.fontSize = 30;
    drawTextLine0477.kernSpacing = 1.4;
    drawTextLine0477.origin = CGPointMake(2795, 3513);
    [station0383.drawPrimitives addObject:drawTextLine0477];

    // Добавляем вершину
    edge0155.finishVertex = vertex0085;

    ////////
    
    MWDrawLine *drawLine0616 = [[MWDrawLine alloc] init];
    drawLine0616.startPoint = CGPointMake(540, 1257);
    drawLine0616.endPoint = CGPointMake(540, 1275);
    drawLine0616.width = 4.5;
    drawLine0616.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0616];

    MWDrawLine *drawLine0620 = [[MWDrawLine alloc] init];
    drawLine0620.startPoint = CGPointMake(539, 1315.5);
    drawLine0620.endPoint = CGPointMake(557, 1315.5);
    drawLine0620.width = 1.5;
    drawLine0620.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0620];

    MWDrawFillCircle *fillCircle0689 = [[MWDrawFillCircle alloc] init];
    fillCircle0689.center = CGPointMake(815, 1573);
    fillCircle0689.radius = 6;
    fillCircle0689.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0689];

    MWDrawFillCircle *fillCircle0691 = [[MWDrawFillCircle alloc] init];
    fillCircle0691.center = CGPointMake(816, 1573);
    fillCircle0691.radius = 6;
    fillCircle0691.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0691];

    MWDrawFillCircle *fillCircle0690 = [[MWDrawFillCircle alloc] init];
    fillCircle0690.center = CGPointMake(815, 1573);
    fillCircle0690.radius = 2;
    fillCircle0690.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0690];

    MWDrawLine *drawLine0617 = [[MWDrawLine alloc] init];
    drawLine0617.startPoint = CGPointMake(816, 1573);
    drawLine0617.endPoint = CGPointMake(822, 1573);
    drawLine0617.width = 4.5;
    drawLine0617.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0617];

    MWDrawLine *drawLine0618 = [[MWDrawLine alloc] init];
    drawLine0618.startPoint = CGPointMake(819.5, 1573.5);
    drawLine0618.endPoint = CGPointMake(824, 1569);
    drawLine0618.width = 3.5;
    drawLine0618.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0618];

    MWDrawLine *drawLine0619 = [[MWDrawLine alloc] init];
    drawLine0619.startPoint = CGPointMake(864.5, 1639);
    drawLine0619.endPoint = CGPointMake(864.5, 1710);
    drawLine0619.width = 5;
    drawLine0619.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0619];

    MWDrawLine *drawLine0621 = [[MWDrawLine alloc] init];
    drawLine0621.startPoint = CGPointMake(3696.5, 2713);
    drawLine0621.endPoint = CGPointMake(3696.5, 2726);
    drawLine0621.width = 1.5;
    drawLine0621.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0621];

    MWDrawLine *drawLine0622 = [[MWDrawLine alloc] init];
    drawLine0622.startPoint = CGPointMake(3759.5, 2713);
    drawLine0622.endPoint = CGPointMake(3759.5, 2726);
    drawLine0622.width = 1.5;
    drawLine0622.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0622];

    MWDrawFillCircle *fillCircle0693 = [[MWDrawFillCircle alloc] init];
    fillCircle0693.center = CGPointMake(3830, 2743);
    fillCircle0693.radius = 28;
    fillCircle0693.fillColor = [UIColor colorWithRed:(21/255.0) green:(72/255.0) blue:(159/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:fillCircle0693];

    MWDrawFillCircle *fillCircle0694 = [[MWDrawFillCircle alloc] init];
    fillCircle0694.center = CGPointMake(3830, 2743);
    fillCircle0694.radius = 24;
    fillCircle0694.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0694];

    MWDrawTextLine *drawTextLine0478 = [[MWDrawTextLine alloc] init];
    drawTextLine0478.text = @"T";
    drawTextLine0478.fontName = @"ArialRoundedMTBold";
    drawTextLine0478.fontColor = [UIColor colorWithRed:(21/255.0) green:(72/255.0) blue:(159/255.0) alpha:1];
    drawTextLine0478.fontSize = 42;
    drawTextLine0478.kernSpacing = 1.4;
    drawTextLine0478.origin = CGPointMake(3817, 2720);
    [self.additionalOverMapPrimitives addObject:drawTextLine0478];

    MWDrawLine *drawLine0623 = [[MWDrawLine alloc] init];
    drawLine0623.startPoint = CGPointMake(1286.5, 1292);
    drawLine0623.endPoint = CGPointMake(1331.5, 1284);
    drawLine0623.width = 5;
    drawLine0623.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0623];

    MWDrawLine *drawLine0624 = [[MWDrawLine alloc] init];
    drawLine0624.startPoint = CGPointMake(1692, 1687);
    drawLine0624.endPoint = CGPointMake(1736.5, 1732.5);
    drawLine0624.width = 2;
    drawLine0624.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0624];

    MWDrawLine *drawLine0625 = [[MWDrawLine alloc] init];
    drawLine0625.startPoint = CGPointMake(1690, 1694);
    drawLine0625.endPoint = CGPointMake(1727.5, 1732.5);
    drawLine0625.width = 2;
    drawLine0625.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0625];

    MWDrawLine *drawLine0626 = [[MWDrawLine alloc] init];
    drawLine0626.startPoint = CGPointMake(1690.5, 1690);
    drawLine0626.endPoint = CGPointMake(1734, 1734.5);
    drawLine0626.width = 5;
    drawLine0626.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0626];

    MWDrawLine *drawLine0627 = [[MWDrawLine alloc] init];
    drawLine0627.startPoint = CGPointMake(1809.5, 1886);
    drawLine0627.endPoint = CGPointMake(1809.5, 1913);
    drawLine0627.width = 5;
    drawLine0627.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0627];

    MWDrawLine *drawLine0628 = [[MWDrawLine alloc] init];
    drawLine0628.startPoint = CGPointMake(1814, 1982.5);
    drawLine0628.endPoint = CGPointMake(1877, 1982.5);
    drawLine0628.width = 2;
    drawLine0628.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0628];

    MWDrawLine *drawLine0629 = [[MWDrawLine alloc] init];
    drawLine0629.startPoint = CGPointMake(1822, 1989.5);
    drawLine0629.endPoint = CGPointMake(1882, 1989.5);
    drawLine0629.width = 2;
    drawLine0629.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0629];

    MWDrawLine *drawLine0630 = [[MWDrawLine alloc] init];
    drawLine0630.startPoint = CGPointMake(1876, 1986);
    drawLine0630.endPoint = CGPointMake(1883, 1986);
    drawLine0630.width = 4.5;
    drawLine0630.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0630];

    MWDrawLine *drawLine0631 = [[MWDrawLine alloc] init];
    drawLine0631.startPoint = CGPointMake(3811.5, 2115);
    drawLine0631.endPoint = CGPointMake(3811.5, 2128);
    drawLine0631.width = 1.5;
    drawLine0631.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0631];

    MWDrawLine *drawLine0632 = [[MWDrawLine alloc] init];
    drawLine0632.startPoint = CGPointMake(3874.5, 2115);
    drawLine0632.endPoint = CGPointMake(3874.5, 2128);
    drawLine0632.width = 1.5;
    drawLine0632.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0632];

    MWDrawLine *drawLine0633 = [[MWDrawLine alloc] init];
    drawLine0633.startPoint = CGPointMake(3860, 1697);
    drawLine0633.endPoint = CGPointMake(3872, 1697);
    drawLine0633.width = 1.5;
    drawLine0633.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0633];

    MWDrawLine *drawLine0634 = [[MWDrawLine alloc] init];
    drawLine0634.startPoint = CGPointMake(2710, 1427);
    drawLine0634.endPoint = CGPointMake(2714, 1427);
    drawLine0634.width = 4.5;
    drawLine0634.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0634];

    MWDrawLine *drawLine0635 = [[MWDrawLine alloc] init];
    drawLine0635.startPoint = CGPointMake(2808, 1429);
    drawLine0635.endPoint = CGPointMake(2814, 1435);
    drawLine0635.width = 5;
    drawLine0635.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0635];

    MWDrawLine *drawLine0636 = [[MWDrawLine alloc] init];
    drawLine0636.startPoint = CGPointMake(2372.5, 2279);
    drawLine0636.endPoint = CGPointMake(2376, 2282.5);
    drawLine0636.width = 5;
    drawLine0636.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0636];

    MWDrawLine *drawLine0637 = [[MWDrawLine alloc] init];
    drawLine0637.startPoint = CGPointMake(2375.5, 2318);
    drawLine0637.endPoint = CGPointMake(2371.5, 2323);
    drawLine0637.width = 5.5;
    drawLine0637.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0637];

    MWDrawLine *drawLine0638 = [[MWDrawLine alloc] init];
    drawLine0638.startPoint = CGPointMake(1923.5, 3172);
    drawLine0638.endPoint = CGPointMake(1923.5, 3182);
    drawLine0638.width = 5;
    drawLine0638.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0638];

    MWDrawArc *drawArc0154 = [[MWDrawArc alloc] init];
    drawArc0154.center = CGPointMake(2152, 3617.5);
    drawArc0154.startDegrees = 288;
    drawArc0154.endDegrees = 0;
    drawArc0154.radius = 6;
    drawArc0154.width = 1;
    drawArc0154.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawArc0154];

    MWDrawLine *drawLine0639 = [[MWDrawLine alloc] init];
    drawLine0639.startPoint = CGPointMake(2158.5, 3617.5);
    drawLine0639.endPoint = CGPointMake(2158.5, 3625);
    drawLine0639.width = 1.5;
    drawLine0639.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0639];

    MWDrawLine *drawLine0640 = [[MWDrawLine alloc] init];
    drawLine0640.startPoint = CGPointMake(2133, 3675);
    drawLine0640.endPoint = CGPointMake(2146, 3675);
    drawLine0640.width = 1.5;
    drawLine0640.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0640];

    MWDrawArc *drawArc0155 = [[MWDrawArc alloc] init];
    drawArc0155.center = CGPointMake(3966.5, 1028);
    drawArc0155.startDegrees = 100;
    drawArc0155.endDegrees = 180;
    drawArc0155.radius = 6;
    drawArc0155.width = 1;
    drawArc0155.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawArc0155];

    MWDrawLine *drawLine0641 = [[MWDrawLine alloc] init];
    drawLine0641.startPoint = CGPointMake(3960.5, 1021);
    drawLine0641.endPoint = CGPointMake(3960.5, 1029);
    drawLine0641.width = 1.5;
    drawLine0641.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0641];

    MWDrawLine *drawLine0642 = [[MWDrawLine alloc] init];
    drawLine0642.startPoint = CGPointMake(3557.5, 1260);
    drawLine0642.endPoint = CGPointMake(3557.5, 1271);
    drawLine0642.width = 1.5;
    drawLine0642.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0642];

    MWDrawLine *drawLine0643 = [[MWDrawLine alloc] init];
    drawLine0643.startPoint = CGPointMake(3494.5, 1260);
    drawLine0643.endPoint = CGPointMake(3494.5, 1271);
    drawLine0643.width = 1.5;
    drawLine0643.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0643];

    MWDrawLine *drawLine0645 = [[MWDrawLine alloc] init];
    drawLine0645.startPoint = CGPointMake(2809.5, 1589.5);
    drawLine0645.endPoint = CGPointMake(2806, 1593);
    drawLine0645.width = 5;
    drawLine0645.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0645];

    MWDrawLine *drawLine0646 = [[MWDrawLine alloc] init];
    drawLine0646.startPoint = CGPointMake(969.5, 2693);
    drawLine0646.endPoint = CGPointMake(969.5, 2696);
    drawLine0646.width = 5;
    drawLine0646.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0646];

    MWDrawLine *drawLine0647 = [[MWDrawLine alloc] init];
    drawLine0647.startPoint = CGPointMake(3495, 698);
    drawLine0647.endPoint = CGPointMake(3507, 698);
    drawLine0647.width = 1.5;
    drawLine0647.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0647];

    MWDrawLine *drawLine0648 = [[MWDrawLine alloc] init];
    drawLine0648.startPoint = CGPointMake(3315, 1011);
    drawLine0648.endPoint = CGPointMake(3332, 1011);
    drawLine0648.width = 1.5;
    drawLine0648.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0648];

    MWDrawLine *drawLine0649 = [[MWDrawLine alloc] init];
    drawLine0649.startPoint = CGPointMake(3274, 1052);
    drawLine0649.endPoint = CGPointMake(3274, 1068);
    drawLine0649.width = 1.5;
    drawLine0649.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0649];

    MWDrawLine *drawLine0650 = [[MWDrawLine alloc] init];
    drawLine0650.startPoint = CGPointMake(2917, 1535.5);
    drawLine0650.endPoint = CGPointMake(2920, 1535.5);
    drawLine0650.width = 5;
    drawLine0650.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0650];

    MWDrawArc *drawArc0156 = [[MWDrawArc alloc] init];
    drawArc0156.center = CGPointMake(2703, 3988);
    drawArc0156.startDegrees = 230;
    drawArc0156.endDegrees = 325;
    drawArc0156.radius = 6;
    drawArc0156.width = 1;
    drawArc0156.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawArc0156];

    MWDrawLine *drawLine0651 = [[MWDrawLine alloc] init];
    drawLine0651.startPoint = CGPointMake(2698, 3984);
    drawLine0651.endPoint = CGPointMake(2700, 3982);
    drawLine0651.width = 1.5;
    drawLine0651.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0651];

    MWDrawLine *drawLine0652 = [[MWDrawLine alloc] init];
    drawLine0652.startPoint = CGPointMake(2710.5, 3986.5);
    drawLine0652.endPoint = CGPointMake(2707.5, 3983.5);
    drawLine0652.width = 1.5;
    drawLine0652.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0652];

    MWDrawLine *drawLine0653 = [[MWDrawLine alloc] init];
    drawLine0653.startPoint = CGPointMake(2807.5, 3684);
    drawLine0653.endPoint = CGPointMake(2807.5, 3697);
    drawLine0653.width = 1.5;
    drawLine0653.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0653];

    MWDrawLine *drawLine0654 = [[MWDrawLine alloc] init];
    drawLine0654.startPoint = CGPointMake(2848, 3684.5);
    drawLine0654.endPoint = CGPointMake(2848, 3697);
    drawLine0654.width = 1.5;
    drawLine0654.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0654];

    MWDrawLine *drawLine0655 = [[MWDrawLine alloc] init];
    drawLine0655.startPoint = CGPointMake(2952, 3684.5);
    drawLine0655.endPoint = CGPointMake(2952, 3697);
    drawLine0655.width = 1.5;
    drawLine0655.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0655];

    MWDrawLine *drawLine0656 = [[MWDrawLine alloc] init];
    drawLine0656.startPoint = CGPointMake(2992.5, 3684);
    drawLine0656.endPoint = CGPointMake(2992.5, 3697);
    drawLine0656.width = 1.5;
    drawLine0656.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0656];

    MWDrawLine *drawLine0657 = [[MWDrawLine alloc] init];
    drawLine0657.startPoint = CGPointMake(3095.5, 3684);
    drawLine0657.endPoint = CGPointMake(3095.5, 3697);
    drawLine0657.width = 1.5;
    drawLine0657.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0657];

    MWDrawLine *drawLine0658 = [[MWDrawLine alloc] init];
    drawLine0658.startPoint = CGPointMake(3136, 3684.5);
    drawLine0658.endPoint = CGPointMake(3136, 3697);
    drawLine0658.width = 1.5;
    drawLine0658.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0658];

    MWDrawLine *drawLine0659 = [[MWDrawLine alloc] init];
    drawLine0659.startPoint = CGPointMake(1009, 3504);
    drawLine0659.endPoint = CGPointMake(1027, 3504);
    drawLine0659.width = 1.5;
    drawLine0659.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0659];

    MWDrawLine *drawLine0660 = [[MWDrawLine alloc] init];
    drawLine0660.startPoint = CGPointMake(1789, 1749);
    drawLine0660.endPoint = CGPointMake(1785, 1745);
    drawLine0660.width = 5;
    drawLine0660.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0660];

    MWDrawLine *drawLine0661 = [[MWDrawLine alloc] init];
    drawLine0661.startPoint = CGPointMake(3620, 3156.5);
    drawLine0661.endPoint = CGPointMake(3637, 3156.5);
    drawLine0661.width = 1.5;
    drawLine0661.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0661];

    MWDrawLine *drawLine0662 = [[MWDrawLine alloc] init];
    drawLine0662.startPoint = CGPointMake(3607, 3217.5);
    drawLine0662.endPoint = CGPointMake(3624, 3217.5);
    drawLine0662.width = 1.5;
    drawLine0662.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0662];

    MWDrawLine *drawLine0663 = [[MWDrawLine alloc] init];
    drawLine0663.startPoint = CGPointMake(3562.5, 3261.5);
    drawLine0663.endPoint = CGPointMake(3562.5, 3279);
    drawLine0663.width = 1.5;
    drawLine0663.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0663];

    MWDrawLine *drawLine0664 = [[MWDrawLine alloc] init];
    drawLine0664.startPoint = CGPointMake(3518, 3313);
    drawLine0664.endPoint = CGPointMake(3532, 3313);
    drawLine0664.width = 1.5;
    drawLine0664.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0664];

    MWDrawLine *drawLine0665 = [[MWDrawLine alloc] init];
    drawLine0665.startPoint = CGPointMake(598.5, 2549.5);
    drawLine0665.endPoint = CGPointMake(603, 2545);
    drawLine0665.width = 5;
    drawLine0665.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0665];

    MWDrawLine *drawLine0666 = [[MWDrawLine alloc] init];
    drawLine0666.startPoint = CGPointMake(3773, 2481.5);
    drawLine0666.endPoint = CGPointMake(3792, 2481.5);
    drawLine0666.width = 1.5;
    drawLine0666.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0666];

    MWDrawLine *drawLine0667 = [[MWDrawLine alloc] init];
    drawLine0667.startPoint = CGPointMake(3828.5, 2426.5);
    drawLine0667.endPoint = CGPointMake(3828.5, 2444);
    drawLine0667.width = 1.5;
    drawLine0667.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0667];

    MWDrawLine *drawLine0668 = [[MWDrawLine alloc] init];
    drawLine0668.startPoint = CGPointMake(2321.5, 2738);
    drawLine0668.endPoint = CGPointMake(2321.5, 2748);
    drawLine0668.width = 5;
    drawLine0668.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0668];

    MWDrawLine *drawLine0669 = [[MWDrawLine alloc] init];
    drawLine0669.startPoint = CGPointMake(2247, 2645);
    drawLine0669.endPoint = CGPointMake(2243, 2649);
    drawLine0669.width = 5;
    drawLine0669.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0669];

    MWDrawLine *drawLine0670 = [[MWDrawLine alloc] init];
    drawLine0670.startPoint = CGPointMake(3845, 1665);
    drawLine0670.endPoint = CGPointMake(3845, 1677);
    drawLine0670.width = 1.5;
    drawLine0670.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0670];

    MWDrawLine *drawLine0671 = [[MWDrawLine alloc] init];
    drawLine0671.startPoint = CGPointMake(3878, 1635.5);
    drawLine0671.endPoint = CGPointMake(3895, 1635.5);
    drawLine0671.width = 1.5;
    drawLine0671.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0671];

    MWDrawLine *drawLine0672 = [[MWDrawLine alloc] init];
    drawLine0672.startPoint = CGPointMake(2794, 930.5);
    drawLine0672.endPoint = CGPointMake(2806, 930.5);
    drawLine0672.width = 1.5;
    drawLine0672.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0672];

    MWDrawLine *drawLine0673 = [[MWDrawLine alloc] init];
    drawLine0673.startPoint = CGPointMake(2794, 991.5);
    drawLine0673.endPoint = CGPointMake(2806, 991.5);
    drawLine0673.width = 1.5;
    drawLine0673.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0673];

    MWDrawArc *drawArc0157 = [[MWDrawArc alloc] init];
    drawArc0157.center = CGPointMake(1299.5, 3578);
    drawArc0157.startDegrees = 270;
    drawArc0157.endDegrees = 10;
    drawArc0157.radius = 8;
    drawArc0157.width = 1.5;
    drawArc0157.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawArc0157];

    MWDrawLine *drawLine0674 = [[MWDrawLine alloc] init];
    drawLine0674.startPoint = CGPointMake(1213, 3658);
    drawLine0674.endPoint = CGPointMake(1228.5, 3658);
    drawLine0674.width = 1.5;
    drawLine0674.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0674];

    MWDrawLine *drawLine0675 = [[MWDrawLine alloc] init];
    drawLine0675.startPoint = CGPointMake(1373.5, 3924);
    drawLine0675.endPoint = CGPointMake(1373.5, 3936);
    drawLine0675.width = 1.5;
    drawLine0675.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0675];

    MWDrawArc *drawArc0158 = [[MWDrawArc alloc] init];
    drawArc0158.center = CGPointMake(1368, 3926);
    drawArc0158.startDegrees = 310;
    drawArc0158.endDegrees = 340;
    drawArc0158.radius = 6;
    drawArc0158.width = 1.5;
    drawArc0158.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawArc0158];

    MWDrawArc *drawArc0159 = [[MWDrawArc alloc] init];
    drawArc0159.center = CGPointMake(1683.5, 3620);
    drawArc0159.startDegrees = 270;
    drawArc0159.endDegrees = 0;
    drawArc0159.radius = 6;
    drawArc0159.width = 1.5;
    drawArc0159.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawArc0159];

    MWDrawLine *drawLine0676 = [[MWDrawLine alloc] init];
    drawLine0676.startPoint = CGPointMake(1678.5, 3614);
    drawLine0676.endPoint = CGPointMake(1683.5, 3614);
    drawLine0676.width = 1.5;
    drawLine0676.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0676];

    MWDrawLine *drawLine0677 = [[MWDrawLine alloc] init];
    drawLine0677.startPoint = CGPointMake(1678.5, 3614);
    drawLine0677.endPoint = CGPointMake(1683.5, 3614);
    drawLine0677.width = 1.5;
    drawLine0677.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0677];

    MWDrawLine *drawLine0678 = [[MWDrawLine alloc] init];
    drawLine0678.startPoint = CGPointMake(1649, 3643);
    drawLine0678.endPoint = CGPointMake(1649, 3660);
    drawLine0678.width = 1.5;
    drawLine0678.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0678];

    MWDrawLine *drawLine0679 = [[MWDrawLine alloc] init];
    drawLine0679.startPoint = CGPointMake(1105, 442.5);
    drawLine0679.endPoint = CGPointMake(1117, 442.5);
    drawLine0679.width = 1.5;
    drawLine0679.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0679];

    MWDrawLine *drawLine0680 = [[MWDrawLine alloc] init];
    drawLine0680.startPoint = CGPointMake(2297.5, 553);
    drawLine0680.endPoint = CGPointMake(2297.5, 565);
    drawLine0680.width = 1.5;
    drawLine0680.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0680];

    MWDrawLine *drawLine0681 = [[MWDrawLine alloc] init];
    drawLine0681.startPoint = CGPointMake(2344.75, 553);
    drawLine0681.endPoint = CGPointMake(2344.75, 565);
    drawLine0681.width = 1.5;
    drawLine0681.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0681];

    MWDrawLine *drawLine0682 = [[MWDrawLine alloc] init];
    drawLine0682.startPoint = CGPointMake(2602.5, 458);
    drawLine0682.endPoint = CGPointMake(2602.5, 475);
    drawLine0682.width = 1.5;
    drawLine0682.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0682];

    MWDrawArc *drawArc0160 = [[MWDrawArc alloc] init];
    drawArc0160.center = CGPointMake(2643.75, 427.5);
    drawArc0160.startDegrees = 270;
    drawArc0160.endDegrees = 0;
    drawArc0160.radius = 6;
    drawArc0160.width = 1.5;
    drawArc0160.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawArc0160];

    MWDrawLine *drawLine0683 = [[MWDrawLine alloc] init];
    drawLine0683.startPoint = CGPointMake(2638.5, 421.75);
    drawLine0683.endPoint = CGPointMake(2644.5, 421.75);
    drawLine0683.width = 1.5;
    drawLine0683.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0683];

    return self;
}

@end
