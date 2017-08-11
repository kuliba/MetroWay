//
//  MMLosAngelesMetro.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 03.04.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//

#import "MWLosAngelesMetro.h"
#import "MWLine.h"
#import "MWVertex.h"
#import "MWEdge.h"
#import "MWHaul.h"
#import "MWDrawLine.h"
#import "MWDrawFillCircle.h"
#import "MWDrawTextLine.h"
#import "MWDrawArc.h"

//  History:
//  001. [23.05.2014] Initial version
//  002. [11.07.2015] Добавлена станция Тропарево. Пофиксены мелкие баги

@implementation MWLosAngelesMetro

- (id)init
{
    // Инициализируем
    self = [super init];

    self.identifier = @"los_angeles_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Blue Line
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Blue Line";
    line0001.color = [UIColor colorWithRed:(75/255.0) green:(121/255.0) blue:(187/255.0) alpha:1];
    [self.lines addObject:line0001];

    // 2. Red Line
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"Red Line";
    line0002.color = [UIColor colorWithRed:(210/255.0) green:(74/255.0) blue:(67/255.0) alpha:1];
    [self.lines addObject:line0002];

    // 3. Purple Line
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"Purple Line";
    line0003.color = [UIColor colorWithRed:(145/255.0) green:(109/255.0) blue:(171/255.0) alpha:1];
    [self.lines addObject:line0003];

    // 4. Green Line
    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"Green Line";
    line0004.color = [UIColor colorWithRed:(137/255.0) green:(191/255.0) blue:(114/255.0) alpha:1];
    [self.lines addObject:line0004];

    // 5. Gold Line
    MWLine *line0005 = [[MWLine alloc] init];
    line0005.identifier = @"line0005";
    line0005.nameOriginal = @"Gold Line";
    line0005.color = [UIColor colorWithRed:(236/255.0) green:(178/255.0) blue:(68/255.0) alpha:1];
    [self.lines addObject:line0005];

    // 6. Expo Line
    MWLine *line0006 = [[MWLine alloc] init];
    line0006.identifier = @"line0006";
    line0006.nameOriginal = @"Expo Line";
    line0006.color = [UIColor colorWithRed:(83/255.0) green:(183/255.0) blue:(220/255.0) alpha:1];
    [self.lines addObject:line0006];

    // 7. Metro Orange Line
    MWLine *line0007 = [[MWLine alloc] init];
    line0007.identifier = @"lin0007";
    line0007.nameOriginal = @"Metro Orange Line";
    line0007.color = [UIColor colorWithRed:(219/255.0) green:(119/255.0) blue:(67/255.0) alpha:1];
    [self.lines addObject:line0007];

    // 8. Metro Silver Line
    MWLine *line0008 = [[MWLine alloc] init];
    line0008.identifier = @"line0008";
    line0008.nameOriginal = @"Metro Silver Line";
    line0008.color = [UIColor colorWithRed:(164/255.0) green:(169/255.0) blue:(173/255.0) alpha:1];
    [self.lines addObject:line0008];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0007];
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0008];
    [self.drawLinesOrder addObject:line0004];
    [self.drawLinesOrder addObject:line0006];
    [self.drawLinesOrder addObject:line0005];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Downtown Long Beach - Виртуальная вершина, разрывающая кольцо
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Downtown Long Beach";
    [self.vertices addObject:vertex0001];
    
    // Anaheim St
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Anaheim St";
    [self.vertices addObject:vertex0002];

    // Willowbrook
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Willowbrook";
    [self.vertices addObject:vertex0003];

    MWDrawLine *drawLine0185 = [[MWDrawLine alloc] init];
    drawLine0185.startPoint = CGPointMake(2523.5, 3218.5);
    drawLine0185.endPoint = CGPointMake(2552.5, 3247.5);
    drawLine0185.width = 16;
    drawLine0185.color = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:drawLine0185];
    
    MWDrawFillCircle *fillCircle0144 = [[MWDrawFillCircle alloc] init];
    fillCircle0144.center = CGPointMake(2523.5, 3218.5);
    fillCircle0144.radius = 20.5;
    fillCircle0144.fillColor = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:fillCircle0144];
    
    MWDrawFillCircle *fillCircle0143 = [[MWDrawFillCircle alloc] init];
    fillCircle0143.center = CGPointMake(2523.5, 3218.5);
    fillCircle0143.radius = 15;
    fillCircle0143.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0143];

    MWDrawFillCircle *fillCircle0145 = [[MWDrawFillCircle alloc] init];
    fillCircle0145.center = CGPointMake(2552.5, 3247.5);
    fillCircle0145.radius = 20.5;
    fillCircle0145.fillColor = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:fillCircle0145];

    MWDrawFillCircle *fillCircle0146 = [[MWDrawFillCircle alloc] init];
    fillCircle0146.center = CGPointMake(2552.5, 3247.5);
    fillCircle0146.radius = 15;
    fillCircle0146.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0146];

    MWDrawLine *drawLine0186 = [[MWDrawLine alloc] init];
    drawLine0186.startPoint = CGPointMake(2523.5, 3218.5);
    drawLine0186.endPoint = CGPointMake(2552.5, 3247.5);
    drawLine0186.width = 6;
    drawLine0186.color = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:drawLine0186];

    // Pico
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Pico";
    [self.vertices addObject:vertex0004];

    MWDrawFillCircle *fillCircle0147 = [[MWDrawFillCircle alloc] init];
    fillCircle0147.center = CGPointMake(2312.5, 2133);
    fillCircle0147.radius = 20.5;
    fillCircle0147.fillColor = [UIColor blackColor];
    [vertex0004.drawPrimitives addObject:fillCircle0147];
    
    MWDrawFillCircle *fillCircle0148 = [[MWDrawFillCircle alloc] init];
    fillCircle0148.center = CGPointMake(2312.5, 2133);
    fillCircle0148.radius = 15;
    fillCircle0148.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0148];

    // 7th St/Metro Ctr
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: 7th Street/Metro Center";
    [self.vertices addObject:vertex0005];

    MWDrawLine *drawLine0187 = [[MWDrawLine alloc] init];
    drawLine0187.startPoint = CGPointMake(2427, 2015.5);
    drawLine0187.endPoint = CGPointMake(2427, 1969.5);
    drawLine0187.width = 16;
    drawLine0187.color = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:drawLine0187];

    MWDrawFillCircle *fillCircle0149 = [[MWDrawFillCircle alloc] init];
    fillCircle0149.center = CGPointMake(2427, 2015.5);
    fillCircle0149.radius = 20.5;
    fillCircle0149.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0149];
    
    MWDrawFillCircle *fillCircle0150 = [[MWDrawFillCircle alloc] init];
    fillCircle0150.center = CGPointMake(2427, 2015.5);
    fillCircle0150.radius = 15;
    fillCircle0150.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0150];

    MWDrawFillCircle *fillCircle0151 = [[MWDrawFillCircle alloc] init];
    fillCircle0151.center = CGPointMake(2427, 1969.5);
    fillCircle0151.radius = 20.5;
    fillCircle0151.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0151];
    
    MWDrawFillCircle *fillCircle0152 = [[MWDrawFillCircle alloc] init];
    fillCircle0152.center = CGPointMake(2427, 1969.5);
    fillCircle0152.radius = 15;
    fillCircle0152.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0152];

    MWDrawLine *drawLine0188 = [[MWDrawLine alloc] init];
    drawLine0188.startPoint = CGPointMake(2427, 2015.5);
    drawLine0188.endPoint = CGPointMake(2427, 1969.5);
    drawLine0188.width = 6;
    drawLine0188.color = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:drawLine0188];

    // North Hollywood
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: North Hollywood";
    [self.vertices addObject:vertex0006];

    MWDrawLine *drawLine0191 = [[MWDrawLine alloc] init];
    drawLine0191.startPoint = CGPointMake(1818.5, 1085.5);
    drawLine0191.endPoint = CGPointMake(1760, 1085.5);
    drawLine0191.width = 16;
    drawLine0191.color = [UIColor blackColor];
    [vertex0006.drawPrimitives addObject:drawLine0191];

    MWDrawFillCircle *fillCircle0153 = [[MWDrawFillCircle alloc] init];
    fillCircle0153.center = CGPointMake(1818.5, 1085.5);
    fillCircle0153.radius = 20.5;
    fillCircle0153.fillColor = [UIColor blackColor];
    [vertex0006.drawPrimitives addObject:fillCircle0153];
    
    MWDrawFillCircle *fillCircle0154 = [[MWDrawFillCircle alloc] init];
    fillCircle0154.center = CGPointMake(1818.5, 1085.5);
    fillCircle0154.radius = 15;
    fillCircle0154.fillColor = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:fillCircle0154];

    MWDrawLine *drawLine0189 = [[MWDrawLine alloc] init];
    drawLine0189.startPoint = CGPointMake(1739.5, 1085.5);
    drawLine0189.endPoint = CGPointMake(1781.5, 1085.5);
    drawLine0189.width = 42;
    drawLine0189.color = [UIColor blackColor];
    [vertex0006.drawPrimitives addObject:drawLine0189];
    
    MWDrawLine *drawLine0190 = [[MWDrawLine alloc] init];
    drawLine0190.startPoint = CGPointMake(1745.5, 1085.5);
    drawLine0190.endPoint = CGPointMake(1775.5, 1085.5);
    drawLine0190.width = 30;
    drawLine0190.color = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:drawLine0190];

    MWDrawLine *drawLine0192 = [[MWDrawLine alloc] init];
    drawLine0192.startPoint = CGPointMake(1818.5, 1085.5);
    drawLine0192.endPoint = CGPointMake(1760, 1085.5);
    drawLine0192.width = 6;
    drawLine0192.color = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:drawLine0192];
    
    // Wilshire/Vermont
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Wilshire/Vermont";
    [self.vertices addObject:vertex0007];

    MWDrawFillCircle *fillCircle0155 = [[MWDrawFillCircle alloc] init];
    fillCircle0155.center = CGPointMake(2136.5, 1836.5);
    fillCircle0155.radius = 20.5;
    fillCircle0155.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0155];
    
    MWDrawFillCircle *fillCircle0156 = [[MWDrawFillCircle alloc] init];
    fillCircle0156.center = CGPointMake(2136.5, 1836.5);
    fillCircle0156.radius = 15;
    fillCircle0156.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0156];

    MWDrawFillCircle *fillCircle0157 = [[MWDrawFillCircle alloc] init];
    fillCircle0157.center = CGPointMake(2109.5, 1863.5);
    fillCircle0157.radius = 20.5;
    fillCircle0157.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0157];
    
    MWDrawFillCircle *fillCircle0158 = [[MWDrawFillCircle alloc] init];
    fillCircle0158.center = CGPointMake(2109.5, 1863.5);
    fillCircle0158.radius = 15;
    fillCircle0158.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0158];

    MWDrawLine *drawLine0193 = [[MWDrawLine alloc] init];
    drawLine0193.startPoint = CGPointMake(2136.5, 1836.5);
    drawLine0193.endPoint = CGPointMake(2109.5, 1863.5);
    drawLine0193.width = 6;
    drawLine0193.color = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:drawLine0193];

    // Westlake/MacArthur Park
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Westlake/MacArthur Park";
    [self.vertices addObject:vertex0008];

    MWDrawFillCircle *fillCircle0159 = [[MWDrawFillCircle alloc] init];
    fillCircle0159.center = CGPointMake(2224, 1951);
    fillCircle0159.radius = 20.5;
    fillCircle0159.fillColor = [UIColor blackColor];
    [vertex0008.drawPrimitives addObject:fillCircle0159];
    
    MWDrawFillCircle *fillCircle0160 = [[MWDrawFillCircle alloc] init];
    fillCircle0160.center = CGPointMake(2224, 1951);
    fillCircle0160.radius = 15;
    fillCircle0160.fillColor = [UIColor whiteColor];
    [vertex0008.drawPrimitives addObject:fillCircle0160];

    // Pershing Square
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Pershing Square";
    [self.vertices addObject:vertex0009];

    MWDrawFillCircle *fillCircle0161 = [[MWDrawFillCircle alloc] init];
    fillCircle0161.center = CGPointMake(2488.5, 1910.5);
    fillCircle0161.radius = 20.5;
    fillCircle0161.fillColor = [UIColor blackColor];
    [vertex0009.drawPrimitives addObject:fillCircle0161];
    
    MWDrawFillCircle *fillCircle0162 = [[MWDrawFillCircle alloc] init];
    fillCircle0162.center = CGPointMake(2488.5, 1910.5);
    fillCircle0162.radius = 15;
    fillCircle0162.fillColor = [UIColor whiteColor];
    [vertex0009.drawPrimitives addObject:fillCircle0162];

    // Civil Center/Grand Park
    MWVertex *vertex0010 = [[MWVertex alloc] init];
    vertex0010.identifier = @"vertex0010";
    vertex0010.developmentName = @"Вершина: Civil Center/Grand Park";
    [self.vertices addObject:vertex0010];

    MWDrawFillCircle *fillCircle0163 = [[MWDrawFillCircle alloc] init];
    fillCircle0163.center = CGPointMake(2646, 1785);
    fillCircle0163.radius = 20.5;
    fillCircle0163.fillColor = [UIColor blackColor];
    [vertex0010.drawPrimitives addObject:fillCircle0163];
    
    MWDrawFillCircle *fillCircle0164 = [[MWDrawFillCircle alloc] init];
    fillCircle0164.center = CGPointMake(2646, 1785);
    fillCircle0164.radius = 15;
    fillCircle0164.fillColor = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:fillCircle0164];

    // Union Station
    MWVertex *vertex0011 = [[MWVertex alloc] init];
    vertex0011.identifier = @"vertex0011";
    vertex0011.developmentName = @"Вершина: Union Station";
    [self.vertices addObject:vertex0011];

    MWDrawLine *drawLine0196 = [[MWDrawLine alloc] init];
    drawLine0196.startPoint = CGPointMake(2803.5, 1785);
    drawLine0196.endPoint = CGPointMake(2920, 1785);
    drawLine0196.width = 16;
    drawLine0196.color = [UIColor blackColor];
    [vertex0011.drawPrimitives addObject:drawLine0196];

    MWDrawFillCircle *fillCircle0165 = [[MWDrawFillCircle alloc] init];
    fillCircle0165.center = CGPointMake(2803.5, 1785);
    fillCircle0165.radius = 20.5;
    fillCircle0165.fillColor = [UIColor blackColor];
    [vertex0011.drawPrimitives addObject:fillCircle0165];
    
    MWDrawFillCircle *fillCircle0166 = [[MWDrawFillCircle alloc] init];
    fillCircle0166.center = CGPointMake(2803.5, 1785);
    fillCircle0166.radius = 15;
    fillCircle0166.fillColor = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:fillCircle0166];

    MWDrawFillCircle *fillCircle0167 = [[MWDrawFillCircle alloc] init];
    fillCircle0167.center = CGPointMake(2844.5, 1785);
    fillCircle0167.radius = 20.5;
    fillCircle0167.fillColor = [UIColor blackColor];
    [vertex0011.drawPrimitives addObject:fillCircle0167];
    
    MWDrawFillCircle *fillCircle0168 = [[MWDrawFillCircle alloc] init];
    fillCircle0168.center = CGPointMake(2844.5, 1785);
    fillCircle0168.radius = 15;
    fillCircle0168.fillColor = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:fillCircle0168];

    MWDrawLine *drawLine0194 = [[MWDrawLine alloc] init];
    drawLine0194.startPoint = CGPointMake(2899.5, 1770.5);
    drawLine0194.endPoint = CGPointMake(2929, 1800);
    drawLine0194.width = 42;
    drawLine0194.color = [UIColor blackColor];
    [vertex0011.drawPrimitives addObject:drawLine0194];
    
    MWDrawLine *drawLine0195 = [[MWDrawLine alloc] init];
    drawLine0195.startPoint = CGPointMake(2904, 1775);
    drawLine0195.endPoint = CGPointMake(2924.5, 1795.5);
    drawLine0195.width = 30;
    drawLine0195.color = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:drawLine0195];

    MWDrawLine *drawLine0197 = [[MWDrawLine alloc] init];
    drawLine0197.startPoint = CGPointMake(2803.5, 1785);
    drawLine0197.endPoint = CGPointMake(2920, 1785);
    drawLine0197.width = 6;
    drawLine0197.color = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:drawLine0197];

    // Wilshire/Western
    MWVertex *vertex0012 = [[MWVertex alloc] init];
    vertex0012.identifier = @"vertex0012";
    vertex0012.developmentName = @"Вершина: Wilshire/Western";
    [self.vertices addObject:vertex0012];

    // Redondo Beach
    MWVertex *vertex0013 = [[MWVertex alloc] init];
    vertex0013.identifier = @"vertex0013";
    vertex0013.developmentName = @"Вершина: Redondo Beach";
    [self.vertices addObject:vertex0013];

    // Harbor Freeway
    MWVertex *vertex0014 = [[MWVertex alloc] init];
    vertex0014.identifier = @"vertex0014";
    vertex0014.developmentName = @"Вершина: Harbor Freeway";
    [self.vertices addObject:vertex0014];

    MWDrawLine *drawLine0200 = [[MWDrawLine alloc] init];
    drawLine0200.startPoint = CGPointMake(2084.5, 3217.5);
    drawLine0200.endPoint = CGPointMake(2113.5, 3247.5);
    drawLine0200.width = 16;
    drawLine0200.color = [UIColor blackColor];
    [vertex0014.drawPrimitives addObject:drawLine0200];

    MWDrawLine *drawLine0198 = [[MWDrawLine alloc] init];
    drawLine0198.startPoint = CGPointMake(2063.5, 3217.5);
    drawLine0198.endPoint = CGPointMake(2105.5, 3217.5);
    drawLine0198.width = 40;
    drawLine0198.color = [UIColor blackColor];
    [vertex0014.drawPrimitives addObject:drawLine0198];

    MWDrawLine *drawLine0199 = [[MWDrawLine alloc] init];
    drawLine0199.startPoint = CGPointMake(2068.5, 3217.5);
    drawLine0199.endPoint = CGPointMake(2100.5, 3217.5);
    drawLine0199.width = 30;
    drawLine0199.color = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:drawLine0199];

    MWDrawFillCircle *fillCircle0169 = [[MWDrawFillCircle alloc] init];
    fillCircle0169.center = CGPointMake(2113.5, 3247.5);
    fillCircle0169.radius = 20.5;
    fillCircle0169.fillColor = [UIColor blackColor];
    [vertex0014.drawPrimitives addObject:fillCircle0169];
    
    MWDrawFillCircle *fillCircle0170 = [[MWDrawFillCircle alloc] init];
    fillCircle0170.center = CGPointMake(2113.5, 3247.5);
    fillCircle0170.radius = 15;
    fillCircle0170.fillColor = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:fillCircle0170];

    MWDrawLine *drawLine0201 = [[MWDrawLine alloc] init];
    drawLine0201.startPoint = CGPointMake(2084.5, 3217.5);
    drawLine0201.endPoint = CGPointMake(2113.5, 3247.5);
    drawLine0201.width = 6;
    drawLine0201.color = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:drawLine0201];

    // Norwalk
    MWVertex *vertex0015 = [[MWVertex alloc] init];
    vertex0015.identifier = @"vertex0015";
    vertex0015.developmentName = @"Вершина: Norwalk";
    [self.vertices addObject:vertex0015];

    // Atlantic
    MWVertex *vertex0016 = [[MWVertex alloc] init];
    vertex0016.identifier = @"vertex0016";
    vertex0016.developmentName = @"Вершина: Atlantic";
    [self.vertices addObject:vertex0016];

    // Sierra Madre Villa
    MWVertex *vertex0017 = [[MWVertex alloc] init];
    vertex0017.identifier = @"vertex0017";
    vertex0017.developmentName = @"Вершина: Sierra Madre Villa";
    [self.vertices addObject:vertex0017];

    // Culver City
    MWVertex *vertex0018 = [[MWVertex alloc] init];
    vertex0018.identifier = @"vertex0018";
    vertex0018.developmentName = @"Вершина: Culver City";
    [self.vertices addObject:vertex0018];

    // Chatsworth
    MWVertex *vertex0019 = [[MWVertex alloc] init];
    vertex0019.identifier = @"vertex0019";
    vertex0019.developmentName = @"Вершина: Chatsworth";
    [self.vertices addObject:vertex0019];

    // Warner Ctr
    MWVertex *vertex0020 = [[MWVertex alloc] init];
    vertex0020.identifier = @"vertex0020";
    vertex0020.developmentName = @"Вершина: Warner Ctr";
    [self.vertices addObject:vertex0020];

    // Canoga
    MWVertex *vertex0021 = [[MWVertex alloc] init];
    vertex0021.identifier = @"vertex0021";
    vertex0021.developmentName = @"Вершина: Canoga";
    [self.vertices addObject:vertex0021];

    MWDrawLine *drawLine0202 = [[MWDrawLine alloc] init];
    drawLine0202.startPoint = CGPointMake(516.5, 1049.5);
    drawLine0202.endPoint = CGPointMake(480, 1085.5);
    drawLine0202.width = 9;
    drawLine0202.color = line0007.color;
    [vertex0021.drawPrimitives addObject:drawLine0202];

    // De Soto
    MWVertex *vertex0022 = [[MWVertex alloc] init];
    vertex0022.identifier = @"vertex0022";
    vertex0022.developmentName = @"Вершина: De Soto";
    [self.vertices addObject:vertex0022];

    // Harbor Gateway Transit Center
    MWVertex *vertex0023 = [[MWVertex alloc] init];
    vertex0023.identifier = @"vertex0023";
    vertex0023.developmentName = @"Вершина: Harbor Gateway Transit Center";
    [self.vertices addObject:vertex0023];

    // El Monte Station
    MWVertex *vertex0024 = [[MWVertex alloc] init];
    vertex0024.identifier = @"vertex0024";
    vertex0024.developmentName = @"Вершина: El Monte Station";
    [self.vertices addObject:vertex0024];

    ////////////////////////////////////////////////////////////////
    // 1. Blue Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Downtown Long Beach - Anaheim St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Downtown Long Beach - Anaheim St";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавлям станцию "Downtown Long Beach"
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];

    station0001.nameOriginal = @"Downtown Long Beach";
    station0001.mapLocation = CGPointMake(2403, 4326.5);
    station0001.geoLocation = CGPointMake(33.768159, -118.192923);
    
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = station0001.mapLocation;
    fillCircle0001.radius = 20;
    fillCircle0001.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0001.mapLocation;
    fillCircle0002.radius = 15;
    fillCircle0002.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0002];

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = @"Downtown";
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 38;
    drawTextLine0001.kernSpacing = 1.0;
    drawTextLine0001.origin = CGPointMake(2175, 4302.5);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = @"Long Beach";
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 38;
    drawTextLine0002.kernSpacing = -0.8;
    drawTextLine0002.origin = CGPointMake(2167, 4343);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0002];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 540;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = station0001.mapLocation;
    drawLine0001.endPoint = CGPointMake(2403, 4220.5);
    drawLine0001.width = 16;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];

    // Добавлям станцию "Pacific"
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Pacific";
    station0002.mapLocation = CGPointMake(2403, 4220.5);
    station0002.geoLocation = CGPointMake(33.772389, -118.193722);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0002.mapLocation;
    fillCircle0003.radius = 20;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0003];
    
    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0002.mapLocation;
    fillCircle0004.radius = 15;
    fillCircle0004.fillColor = line0001.color;
    [station0002.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = @"Pacific Av";
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 38;
    drawTextLine0003.kernSpacing = -0.9;
    drawTextLine0003.origin = CGPointMake(2211, 4197);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.length = 1439;
    haul0002.identifier = @"haul0002";
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(2403, 4221);
    drawLine0002.endPoint = CGPointMake(2403, 4177);
    drawLine0002.width = 16;
    drawLine0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0002];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(2427, 4177);
    drawArc0001.startRadians = 180 * M_PI / 180;
    drawArc0001.endRadians = 270 * M_PI / 180;
    drawArc0001.radius = 24;
    drawArc0001.width = 16;
    drawArc0001.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(2427, 4153);
    drawLine0003.endPoint = CGPointMake(2500, 4153);
    drawLine0003.width = 16;
    drawLine0003.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0003];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(2499.5, 4129);
    drawArc0002.startRadians = 0 * M_PI / 180;
    drawArc0002.endRadians = 90 * M_PI / 180;
    drawArc0002.radius = 24;
    drawArc0002.width = 16;
    drawArc0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawArc0002];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(2523.5, 4129);
    drawLine0004.endPoint = CGPointMake(2523.5, 4098.5);
    drawLine0004.width = 16;
    drawLine0004.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0004];

    // Добавлям станцию "Anaheim"
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Anaheim";
    station0003.mapLocation = CGPointMake(2523.5, 4098.5);
    station0003.geoLocation = CGPointMake(33.781910, -118.189395);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0003.mapLocation;
    fillCircle0005.radius = 20;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0005];
    
    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0003.mapLocation;
    fillCircle0006.radius = 15;
    fillCircle0006.fillColor = line0001.color;
    [station0003.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = @"Anaheim St";
    drawTextLine0027.radians = 315 * M_PI / 180;
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 38;
    drawTextLine0027.kernSpacing = -0.4;
    drawTextLine0027.origin = CGPointMake(2547, 4087);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0027];

    // Указываем направление движения
    edge0001.directionFromStation = station0001;
    
    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    // Создаем участок линии Anaheim St - Downtown Long Beach
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Anaheim St - Downtown Long Beach";
    [self.edges addObject:edge0002];

    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;
    
    // Добавляем станцию Anaheim St
    [edge0002.elements addObject:station0003];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 915;
    [edge0002.elements addObject:haul0003];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(2523.5, 4098.5);
    drawLine0005.endPoint = CGPointMake(2523.5, 4220.5);
    drawLine0005.width = 16;
    drawLine0005.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0005];

    // Добавлям станцию 5th Street
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0002.elements addObject:station0004];
    
    station0004.nameOriginal = @"5th Street";
    station0004.mapLocation = CGPointMake(2523.5, 4220.5);
    station0004.geoLocation = CGPointMake(33.773670, -118.189415);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0004.mapLocation;
    fillCircle0007.radius = 20;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0007];
    
    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0004.mapLocation;
    fillCircle0008.radius = 15;
    fillCircle0008.fillColor = line0001.color;
    [station0004.drawPrimitives addObject:fillCircle0008];
    

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"5th St";
    drawTextLine0028.radians = 315 * M_PI / 180;
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 38;
    drawTextLine0028.kernSpacing = -0.5;
    drawTextLine0028.origin = CGPointMake(2546, 4210);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0028];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 540;
    [edge0002.elements addObject:haul0004];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(2523.5, 4220);
    drawLine0006.endPoint = CGPointMake(2523.5, 4326.5);
    drawLine0006.width = 16;
    drawLine0006.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0006];
    
    // Добавлям станцию 1th Street
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0002.elements addObject:station0005];
    
    station0005.nameOriginal = @"1th Street";
    station0005.mapLocation = CGPointMake(2523.5, 4326.5);
    station0005.geoLocation = CGPointMake(33.768805, -118.189358);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0005.mapLocation;
    fillCircle0009.radius = 20;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0009];

    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0005.mapLocation;
    fillCircle0010.radius = 15;
    fillCircle0010.fillColor = line0001.color;
    [station0005.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = @"1st St";
    drawTextLine0029.radians = 315 * M_PI / 180;
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 38;
    drawTextLine0029.kernSpacing = -2.4;
    drawTextLine0029.origin = CGPointMake(2546, 4316);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0029];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 398;
    [edge0002.elements addObject:haul0005];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(2523.5, 4326);
    drawLine0007.endPoint = CGPointMake(2523.5, 4352);
    drawLine0007.width = 16;
    drawLine0007.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0007];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(2499.5, 4352);
    drawArc0003.startRadians = 0 * M_PI / 180;
    drawArc0003.endRadians = 90 * M_PI / 180;
    drawArc0003.radius = 24;
    drawArc0003.width = 16;
    drawArc0003.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(2427, 4376);
    drawLine0008.endPoint = CGPointMake(2500, 4376);
    drawLine0008.width = 16;
    drawLine0008.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0008];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(2427, 4352);
    drawArc0004.startRadians = 90 * M_PI / 180;
    drawArc0004.endRadians = 180 * M_PI / 180;
    drawArc0004.radius = 24;
    drawArc0004.width = 16;
    drawArc0004.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(2403, 4352);
    drawLine0009.endPoint = CGPointMake(2403, 4326.5);
    drawLine0009.width = 16;
    drawLine0009.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию Downtown Long Beach
    [edge0002.elements addObject:station0001];

    // Указываем направление движения
    edge0002.directionFromStation = station0003;
    
    // Добавляем вершину
    edge0002.finishVertex = vertex0001;

    // Создаем участок линии Anaheim St - Willowbrook
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Anaheim St - Willowbrook";
    [self.edges addObject:edge0003];

    // Добавляем линию
    edge0003.line = line0001;

    // Добавляем вершину
    edge0003.startVertex = vertex0002;
    
    // Добавляем станцию Anaheim St
    [edge0003.elements addObject:station0003];
    
    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.length = 809;
    haul0006.identifier = @"haul0006";
    [edge0003.elements addObject:haul0006];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(2523.5, 4099);
    drawLine0010.endPoint = CGPointMake(2523.5, 3984.5);
    drawLine0010.width = 16;
    drawLine0010.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0010];

    // Добавлям станцию Pacific Coast Highway
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0003.elements addObject:station0006];
    
    station0006.nameOriginal = @"Pacific Coast Highway";
    station0006.mapLocation = CGPointMake(2523.5, 3984.5);
    station0006.geoLocation = CGPointMake(33.789163, -118.189374);
    
    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0006.mapLocation;
    fillCircle0011.radius = 20;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0011];
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0006.mapLocation;
    fillCircle0012.radius = 15;
    fillCircle0012.fillColor = line0001.color;
    [station0006.drawPrimitives addObject:fillCircle0012];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"Pacific Coast Hwy";
    drawTextLine0030.radians = 315 * M_PI / 180;
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 38;
    drawTextLine0030.kernSpacing = -1.1;
    drawTextLine0030.origin = CGPointMake(2546, 3974);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0030];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.length = 2005;
    haul0007.identifier = @"haul0007";
    
    [edge0003.elements addObject:haul0007];

    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(2523.5, 3985);
    drawLine0011.endPoint = CGPointMake(2523.5, 3871.5);
    drawLine0011.width = 16;
    drawLine0011.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0011];

    // Добавлям станцию Willow
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0003.elements addObject:station0007];
    
    station0007.nameOriginal = @"Willow";
    station0007.mapLocation = CGPointMake(2523.5, 3871.5);
    station0007.geoLocation = CGPointMake(33.806776, -118.189700);

    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0007.mapLocation;
    fillCircle0013.radius = 20;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0013];

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0007.mapLocation;
    fillCircle0014.radius = 15;
    fillCircle0014.fillColor = line0001.color;
    [station0007.drawPrimitives addObject:fillCircle0014];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"Willow St";
    drawTextLine0031.radians = 315 * M_PI / 180;
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 38;
    drawTextLine0031.kernSpacing = -0.4;
    drawTextLine0031.origin = CGPointMake(2546, 3860);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0031];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.length = 1535;
    haul0008.identifier = @"haul0008";
    [edge0003.elements addObject:haul0008];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(2523.5, 3872);
    drawLine0012.endPoint = CGPointMake(2523.5, 3758);
    drawLine0012.width = 16;
    drawLine0012.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0012];

    // Добавлям станцию Wardlow
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0003.elements addObject:station0008];
    
    station0008.nameOriginal = @"Wardlow";
    station0008.mapLocation = CGPointMake(2523.5, 3758);
    station0008.geoLocation = CGPointMake(33.819985, -118.196169);

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0008.mapLocation;
    fillCircle0015.radius = 20;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0015];
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0008.mapLocation;
    fillCircle0016.radius = 15;
    fillCircle0016.fillColor = line0001.color;
    [station0008.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0008.nameOriginal;
    drawTextLine0032.radians = 315 * M_PI / 180;
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 38;
    drawTextLine0032.kernSpacing = 0.2;
    drawTextLine0032.origin = CGPointMake(2546, 3747);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0032];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 3412;
    [edge0003.elements addObject:haul0009];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(2523.5, 3758.5);
    drawLine0013.endPoint = CGPointMake(2523.5, 3644.5);
    drawLine0013.width = 16;
    drawLine0013.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0013];

    // Добавлям станцию Del Amo
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0003.elements addObject:station0009];
    
    station0009.nameOriginal = @"Del Amo";
    station0009.mapLocation = CGPointMake(2523.5, 3644.5);
    station0009.geoLocation = CGPointMake(33.847859, -118.210853);              

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0009.mapLocation;
    fillCircle0017.radius = 20;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0017];
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0009.mapLocation;
    fillCircle0018.radius = 15;
    fillCircle0018.fillColor = line0001.color;
    [station0009.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0009.nameOriginal;
    drawTextLine0033.radians = 315 * M_PI / 180;
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 38;
    drawTextLine0033.kernSpacing = 0.2;
    drawTextLine0033.origin = CGPointMake(2546, 3636);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0033];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 3313;
    [edge0003.elements addObject:haul0010];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(2523.5, 3645);
    drawLine0014.endPoint = CGPointMake(2523.5, 3531.5);
    drawLine0014.width = 16;
    drawLine0014.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0014];

    // Добавлям станцию Artesia
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0003.elements addObject:station0010];
    
    station0010.nameOriginal = @"Artesia";
    station0010.mapLocation = CGPointMake(2523.5, 3531.5);
    station0010.geoLocation = CGPointMake(33.876080, -118.222496);

    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0010.mapLocation;
    fillCircle0019.radius = 20;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0019];
    
    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0010.mapLocation;
    fillCircle0020.radius = 15;
    fillCircle0020.fillColor = line0001.color;
    [station0010.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0010.nameOriginal;
    drawTextLine0034.radians = 315 * M_PI / 180;
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 38;
    drawTextLine0034.kernSpacing = -0.2;
    drawTextLine0034.origin = CGPointMake(2547, 3520);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0034];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 2428;
    [edge0003.elements addObject:haul0011];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(2523.5, 3532);
    drawLine0015.endPoint = CGPointMake(2523.5, 3418);
    drawLine0015.width = 16;
    drawLine0015.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0015];

    // Добавлям станцию Compton
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0003.elements addObject:station0011];
    
    station0011.nameOriginal = @"Compton";
    station0011.mapLocation = CGPointMake(2523.5, 3418);
    station0011.geoLocation = CGPointMake(33.897815, -118.224281);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0011.mapLocation;
    fillCircle0021.radius = 20;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0021];
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0011.mapLocation;
    fillCircle0022.radius = 15;
    fillCircle0022.fillColor = line0001.color;
    [station0011.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0011.nameOriginal;
    drawTextLine0035.radians = 315 * M_PI / 180;
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 38;
    drawTextLine0035.kernSpacing = -0.0;
    drawTextLine0035.origin = CGPointMake(2546, 3408);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0035];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 3597;
    [edge0003.elements addObject:haul0012];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(2523.5, 3418.5);
    drawLine0016.endPoint = CGPointMake(2523.5, 3218.5);
    drawLine0016.width = 16;
    drawLine0016.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0016];

    // Добавлям станцию Willowbrook
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0003.elements addObject:station0012];
    
    station0012.nameOriginal = @"Willowbrook";
    station0012.mapLocation = CGPointMake(2523.5, 3218.5);
    station0012.geoLocation = CGPointMake(33.928090, -118.237553);
    
    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = station0012.nameOriginal;
    drawTextLine0036.radians = 315 * M_PI / 180;
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 38;
    drawTextLine0036.kernSpacing = 0.6;
    drawTextLine0036.origin = CGPointMake(2549, 3190);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0036];

    MWDrawFillCircle *fillCircle0183 = [[MWDrawFillCircle alloc] init];
    fillCircle0183.center = station0012.mapLocation;
    fillCircle0183.radius = 4;
    fillCircle0183.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0183];

    // Добавляем вершину
    edge0003.finishVertex = vertex0003;
    
    // Создаем участок линии Willowbrook - Pico
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Willowbrook - Pico";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0001;

    // Добавляем вершину
    edge0004.startVertex = vertex0003;
    
    // Добавляем станцию Willowbrook
    [edge0004.elements addObject:station0012];
    
    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 1673;
    [edge0004.elements addObject:haul0013];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(2523.5, 3219);
    drawLine0017.endPoint = CGPointMake(2523.5, 3083.5);
    drawLine0017.width = 16;
    drawLine0017.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0017];

    // Добавлям станцию 103rd Street/Watts Towers
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0004.elements addObject:station0013];
    
    station0013.nameOriginal = @"103rd Street/Watts Towers";
    station0013.mapLocation = CGPointMake(2523.5, 3083.5);
    station0013.geoLocation = CGPointMake(33.942251, -118.243161);
    
    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0013.mapLocation;
    fillCircle0023.radius = 20;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0023];
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0013.mapLocation;
    fillCircle0024.radius = 15;
    fillCircle0024.fillColor = line0001.color;
    [station0013.drawPrimitives addObject:fillCircle0024];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"103rd St/Watt Towers";
    drawTextLine0037.radians = 315 * M_PI / 180;
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 38;
    drawTextLine0037.kernSpacing = 0.6;
    drawTextLine0037.origin = CGPointMake(2545, 3067);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0037];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1924;
    [edge0004.elements addObject:haul0014];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(2523.5, 3084);
    drawLine0018.endPoint = CGPointMake(2523.5, 2965.5);
    drawLine0018.width = 16;
    drawLine0018.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0018];

    // Добавлям станцию Firestone
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0004.elements addObject:station0014];
    
    station0014.nameOriginal = @"Firestone";
    station0014.mapLocation = CGPointMake(2523.5, 2965.5);
    station0014.geoLocation = CGPointMake(33.959551, -118.243203);

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0014.mapLocation;
    fillCircle0025.radius = 20;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0025];
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0014.mapLocation;
    fillCircle0026.radius = 15;
    fillCircle0026.fillColor = line0001.color;
    [station0014.drawPrimitives addObject:fillCircle0026];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = station0014.nameOriginal;
    drawTextLine0038.radians = 315 * M_PI / 180;
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 38;
    drawTextLine0038.kernSpacing = 0.1;
    drawTextLine0038.origin = CGPointMake(2546, 2954);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0038];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.length = 1576;
    haul0015.identifier = @"haul0015";
    [edge0004.elements addObject:haul0015];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(2523.5, 2966);
    drawLine0019.endPoint = CGPointMake(2523.5, 2847.5);
    drawLine0019.width = 16;
    drawLine0019.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0019];

    // Добавлям станцию Florence
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0004.elements addObject:station0015];
    
    station0015.nameOriginal = @"Florence";
    station0015.mapLocation = CGPointMake(2523.5, 2847.5);
    station0015.geoLocation = CGPointMake(33.973767, -118.243273);
    
    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0015.mapLocation;
    fillCircle0027.radius = 20;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0027];
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0015.mapLocation;
    fillCircle0028.radius = 15;
    fillCircle0028.fillColor = line0001.color;
    [station0015.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = station0015.nameOriginal;
    drawTextLine0039.radians = 315 * M_PI / 180;
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 38;
    drawTextLine0039.kernSpacing = 0.1;
    drawTextLine0039.origin = CGPointMake(2546, 2840);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0039];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.length = 1668;
    haul0016.identifier = @"haul0016";
    [edge0004.elements addObject:haul0016];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(2523.5, 2848);
    drawLine0020.endPoint = CGPointMake(2523.5, 2729.5);
    drawLine0020.width = 16;
    drawLine0020.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0020];

    // Добавлям станцию Slauson
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0004.elements addObject:station0016];
    
    station0016.nameOriginal = @"Slauson";
    station0016.mapLocation = CGPointMake(2523.5, 2729.5);
    station0016.geoLocation = CGPointMake(33.988799, -118.243396);
    
    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0016.mapLocation;
    fillCircle0029.radius = 20;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0029];
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0016.mapLocation;
    fillCircle0030.radius = 15;
    fillCircle0030.fillColor = line0001.color;
    [station0016.drawPrimitives addObject:fillCircle0030];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = station0016.nameOriginal;
    drawTextLine0040.radians = 315 * M_PI / 180;
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 38;
    drawTextLine0040.kernSpacing = 0.1;
    drawTextLine0040.origin = CGPointMake(2543, 2731);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0040];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 3237;
    [edge0004.elements addObject:haul0017];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(2523.5, 2730);
    drawLine0021.endPoint = CGPointMake(2523.5, 2611);
    drawLine0021.width = 16;
    drawLine0021.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0021];

    // Добавлям станцию Vernon
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0004.elements addObject:station0017];
    
    station0017.nameOriginal = @"Vernon";
    station0017.mapLocation = CGPointMake(2523.5, 2611);
    station0017.geoLocation = CGPointMake(34.002957, -118.243303);

    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0017.mapLocation;
    fillCircle0031.radius = 20;
    fillCircle0031.fillColor = [UIColor whiteColor];
    [station0017.drawPrimitives addObject:fillCircle0031];
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0017.mapLocation;
    fillCircle0032.radius = 15;
    fillCircle0032.fillColor = line0001.color;
    [station0017.drawPrimitives addObject:fillCircle0032];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0017.nameOriginal;
    drawTextLine0041.radians = 315 * M_PI / 180;
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 38;
    drawTextLine0041.kernSpacing = 0.6;
    drawTextLine0041.origin = CGPointMake(2545, 2599);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0041];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1855;
    [edge0004.elements addObject:haul0018];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(2523.5, 2611.5);
    drawLine0022.endPoint = CGPointMake(2523.5, 2479);
    drawLine0022.width = 16;
    drawLine0022.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0022];

    // Добавлям станцию Washington
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0004.elements addObject:station0018];
    
    station0018.nameOriginal = @"Washington";
    station0018.mapLocation = CGPointMake(2523.5, 2479);
    station0018.geoLocation = CGPointMake(34.019666, -118.243068);
    
    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0018.mapLocation;
    fillCircle0033.radius = 20;
    fillCircle0033.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0033];
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0018.mapLocation;
    fillCircle0034.radius = 15;
    fillCircle0034.fillColor = line0001.color;
    [station0018.drawPrimitives addObject:fillCircle0034];
    
    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = station0018.nameOriginal;
    drawTextLine0042.radians = 315 * M_PI / 180;
    drawTextLine0042.fontName = @"HelveticaNeue";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 38;
    drawTextLine0042.kernSpacing = 0.4;
    drawTextLine0042.origin = CGPointMake(2543, 2462);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0042];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.length = 1439;
    haul0019.identifier = @"haul0019";
    [edge0004.elements addObject:haul0019];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(2523.5, 2479.5);
    drawLine0023.endPoint = CGPointMake(2523.5, 2444);
    drawLine0023.width = 16;
    drawLine0023.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0023];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(2463.5, 2444);
    drawArc0005.startRadians = 315 * M_PI / 180;
    drawArc0005.endRadians = 0 * M_PI / 180;
    drawArc0005.radius = 60;
    drawArc0005.width = 16;
    drawArc0005.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(2506.5, 2402);
    drawLine0024.endPoint = CGPointMake(2461, 2356.5);
    drawLine0024.width = 16;
    drawLine0024.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0024];

    // Добавлям станцию San Pedro
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0004.elements addObject:station0019];
    
    station0019.nameOriginal = @"San Pedro";
    station0019.mapLocation = CGPointMake(2461, 2356.5);
    station0019.geoLocation = CGPointMake(34.026807, -118.255511);
    
    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0019.mapLocation;
    fillCircle0035.radius = 20;
    fillCircle0035.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0035];
    
    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0019.mapLocation;
    fillCircle0036.radius = 15;
    fillCircle0036.fillColor = line0001.color;
    [station0019.drawPrimitives addObject:fillCircle0036];
    
    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = @"San Pedro St";
    drawTextLine0043.radians = 315 * M_PI / 180;
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 38;
    drawTextLine0043.kernSpacing = -1.2;
    drawTextLine0043.origin = CGPointMake(2468, 2320);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0043];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.length = 1459;
    haul0020.identifier = @"haul0020";
    [edge0004.elements addObject:haul0020];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(2461.5, 2357);
    drawLine0025.endPoint = CGPointMake(2374.5, 2270.5);
    drawLine0025.width = 16;
    drawLine0025.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0025];

    // Добавлям станцию Grand
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0004.elements addObject:station0020];
    
    station0020.nameOriginal = @"Grand";
    station0020.mapLocation = CGPointMake(2374.5, 2270.5);
    station0020.geoLocation = CGPointMake(34.033158, -118.269341);

    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0020.mapLocation;
    fillCircle0037.radius = 20;
    fillCircle0037.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0037];
    
    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0020.mapLocation;
    fillCircle0038.radius = 15;
    fillCircle0038.fillColor = line0001.color;
    [station0020.drawPrimitives addObject:fillCircle0038];
    
    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = station0020.nameOriginal;
    drawTextLine0044.radians = 315 * M_PI / 180;
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 38;
    drawTextLine0044.radians = 315 * M_PI / 180;
    drawTextLine0044.kernSpacing = -0.5;
    drawTextLine0044.origin = CGPointMake(2380, 2239);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.length = 1009;
    haul0021.identifier = @"haul0021";
    [edge0004.elements addObject:haul0021];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(2375, 2271);
    drawLine0026.endPoint = CGPointMake(2310, 2206);
    drawLine0026.width = 16;
    drawLine0026.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0026];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(2339, 2178);
    drawArc0006.startRadians = 135 * M_PI / 180;
    drawArc0006.endRadians = 225 * M_PI / 180;
    drawArc0006.radius = 40;
    drawArc0006.width = 16;
    drawArc0006.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawArc0006];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(2310, 2150.5);
    drawLine0027.endPoint = CGPointMake(2320, 2140.5);
    drawLine0027.width = 16;
    drawLine0027.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0027];

    // Добавлям станцию Pico
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0004.elements addObject:station0021];
    
    station0021.nameOriginal = @"Pico";
//    station0021.mapLocation = CGPointMake(2312.5, 2133);
    station0021.mapLocation = CGPointMake(2318.5, 2137.5);
    station0021.geoLocation = CGPointMake(34.040723, -118.266115);
    
    MWDrawFillCircle *fillCircle0175 = [[MWDrawFillCircle alloc] init];
    fillCircle0175.center = station0021.mapLocation;
    fillCircle0175.radius = 4;
    fillCircle0175.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0175];
    
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = @"Pico";
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 38;
    drawTextLine0004.kernSpacing = -1.0;
    drawTextLine0004.origin = CGPointMake(2332, 2141);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0004];
    
    // Добавляем вершину
    edge0004.finishVertex = vertex0004;

    // Создаем участок линии Pico - 7th St/Metro Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Pico - 7th St/Metro Center";
    [self.edges addObject:edge0005];
    
    // Добавляем линию
    edge0005.line = line0001;

    // Добавляем вершину
    edge0005.startVertex = vertex0004;
    
    // Добавляем станцию Pico
    [edge0005.elements addObject:station0021];
    
    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.length = 1118;
    haul0022.identifier = @"haul0022";
    [edge0005.elements addObject:haul0022];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(2319.5, 2141);
    drawLine0028.endPoint = CGPointMake(2436.5, 2021);
    drawLine0028.width = 16;
    drawLine0028.color = line0001.color;
    [haul0022.drawPrimitives addObject:drawLine0028];

    // Добавлям станцию 7th St/Metro Center
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0005.elements addObject:station0022];
    
    station0022.nameOriginal = @"7th St/Metro Center";
//    station0022.mapLocation = CGPointMake(2427, 2015.5);
    station0022.mapLocation = CGPointMake(2435.5, 2020);
    station0022.geoLocation = CGPointMake(34.048724, -118.258762);
    
    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = @"7th St/Metro Ctr";
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 38;
    drawTextLine0005.kernSpacing = -0.3;
    drawTextLine0005.origin = CGPointMake(2446, 2028);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0005];

    // Добавляем вершину
    edge0005.finishVertex = vertex0005;

    ////////////////////////////////////////////////////////////////
    // 2. Red Line
    ////////////////////////////////////////////////////////////////

    // Создаем участок линии North Hollywood - Wilshire/Vermont
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: North Hollywood - Wilshire/Vermont";
    [self.edges addObject:edge0006];
    
    // Добавляем линию
    edge0006.line = line0002;

    // Добавляем вершину
    edge0006.startVertex = vertex0006;

    // Добавлям станцию North Hollywood
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0006.elements addObject:station0023];
    
    station0023.nameOriginal = @"North Hollywood";
    station0023.mapLocation = CGPointMake(1818.5, 1085.5);
    station0023.geoLocation = CGPointMake(34.168551, -118.376814);
    
    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = station0023.nameOriginal;
    drawTextLine0045.radians = 315 * M_PI / 180;
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 38;
    drawTextLine0045.kernSpacing = 0.2;
    drawTextLine0045.origin = CGPointMake(1780, 1028);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0045];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 3492;
    [edge0006.elements addObject:haul0023];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(1818.5, 1085.5);
    drawLine0029.endPoint = CGPointMake(1878.5, 1144.5);
    drawLine0029.width = 16;
    drawLine0029.color = line0002.color;
    [haul0023.drawPrimitives addObject:drawLine0029];
    
    // Добавлям станцию Universal City/Studio City
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0006.elements addObject:station0024];
    
    station0024.nameOriginal = @"Universal City/Studio City";
    station0024.mapLocation = CGPointMake(1878.5, 1144.5);
    station0024.geoLocation = CGPointMake(34.140035, -118.362635);
    
    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0024.mapLocation;
    fillCircle0039.radius = 20;
    fillCircle0039.fillColor = [UIColor whiteColor];
    [station0024.drawPrimitives addObject:fillCircle0039];

    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0024.mapLocation;
    fillCircle0040.radius = 15;
    fillCircle0040.fillColor = line0002.color;
    [station0024.drawPrimitives addObject:fillCircle0040];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = @"Universal City/";
    drawTextLine0046.radians = 315 * M_PI / 180;
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 38;
    drawTextLine0046.kernSpacing = -0.2;
    drawTextLine0046.origin = CGPointMake(1870, 1091);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0046];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = @"Studio City";
    drawTextLine0047.radians = 315 * M_PI / 180;
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 38;
    drawTextLine0047.kernSpacing = -0.2;
    drawTextLine0047.origin = CGPointMake(1898, 1120);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0047];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 5270;
    [edge0006.elements addObject:haul0024];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(1878, 1144);
    drawLine0030.endPoint = CGPointMake(1957.5, 1224.5);
    drawLine0030.width = 16;
    drawLine0030.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0030];

    // Добавлям станцию Hollywood/Highland
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0006.elements addObject:station0025];
    
    station0025.nameOriginal = @"Hollywood/Highland";
    station0025.mapLocation = CGPointMake(1957.5, 1224.5);
    station0025.geoLocation = CGPointMake(34.101566, -118.338535);
    
    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0025.mapLocation;
    fillCircle0041.radius = 20;
    fillCircle0041.fillColor = [UIColor whiteColor];
    [station0025.drawPrimitives addObject:fillCircle0041];
    
    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = station0025.mapLocation;
    fillCircle0042.radius = 15;
    fillCircle0042.fillColor = line0002.color;
    [station0025.drawPrimitives addObject:fillCircle0042];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0025.nameOriginal;
    drawTextLine0048.radians = 315 * M_PI / 180;
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 38;
    drawTextLine0048.kernSpacing = 0.4;
    drawTextLine0048.origin = CGPointMake(1965, 1185);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0048];

    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 1234;
    [edge0006.elements addObject:haul0025];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(1957, 1224);
    drawLine0031.endPoint = CGPointMake(2037, 1304);
    drawLine0031.width = 16;
    drawLine0031.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0031];

    // Добавлям станцию Hollywood/Vine
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0006.elements addObject:station0026];
    
    station0026.nameOriginal = @"Hollywood/Vine";
    station0026.mapLocation = CGPointMake(2037, 1304);
    station0026.geoLocation = CGPointMake(34.101642, -118.325206);
    
    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = station0026.mapLocation;
    fillCircle0043.radius = 20;
    fillCircle0043.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0043];

    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0026.mapLocation;
    fillCircle0044.radius = 15;
    fillCircle0044.fillColor = line0002.color;
    [station0026.drawPrimitives addObject:fillCircle0044];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0026.nameOriginal;
    drawTextLine0049.radians = 315 * M_PI / 180;
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 38;
    drawTextLine0049.kernSpacing = 0.7;
    drawTextLine0049.origin = CGPointMake(2044, 1278);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0049];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 1575;
    [edge0006.elements addObject:haul0026];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(2036.5, 1303.5);
    drawLine0032.endPoint = CGPointMake(2116.5, 1383.5);
    drawLine0032.width = 16;
    drawLine0032.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0032];

    // Добавлям станцию Hollywood/Western
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0006.elements addObject:station0027];
    
    station0027.nameOriginal = @"Hollywood/Western";
    station0027.mapLocation = CGPointMake(2116.5, 1383.5);
    station0027.geoLocation = CGPointMake(34.101751, -118.308120);
    
    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0027.mapLocation;
    fillCircle0045.radius = 20;
    fillCircle0045.fillColor = [UIColor whiteColor];
    [station0027.drawPrimitives addObject:fillCircle0045];
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0027.mapLocation;
    fillCircle0046.radius = 15;
    fillCircle0046.fillColor = line0002.color;
    [station0027.drawPrimitives addObject:fillCircle0046];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = station0027.nameOriginal;
    drawTextLine0050.radians = 315 * M_PI / 180;
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 38;
    drawTextLine0050.kernSpacing = -0.2;
    drawTextLine0050.origin = CGPointMake(2123.5, 1357);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0050];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 1909;
    [edge0006.elements addObject:haul0027];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(2116, 1383);
    drawLine0033.endPoint = CGPointMake(2119.5, 1386.5);
    drawLine0033.width = 16;
    drawLine0033.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0033];
    
    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(2076.5, 1428.5);
    drawArc0007.startRadians = 315 * M_PI / 180;
    drawArc0007.endRadians = 0 * M_PI / 180;
    drawArc0007.radius = 60;
    drawArc0007.width = 16;
    drawArc0007.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawArc0007];
    
    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(2136.5, 1428);
    drawLine0034.endPoint = CGPointMake(2136.5, 1484);
    drawLine0034.width = 16;
    drawLine0034.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0034];
    
    // Добавлям станцию Vermont/Sunset
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0006.elements addObject:station0028];
    
    station0028.nameOriginal = @"Vermont/Sunset";
    station0028.mapLocation = CGPointMake(2136.5, 1484);
    station0028.geoLocation = CGPointMake(34.097759, -118.291755);
    
    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = station0028.mapLocation;
    fillCircle0047.radius = 20;
    fillCircle0047.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0047];
    
    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = station0028.mapLocation;
    fillCircle0048.radius = 15;
    fillCircle0048.fillColor = line0002.color;
    [station0028.drawPrimitives addObject:fillCircle0048];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0028.nameOriginal;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 38;
    drawTextLine0006.kernSpacing = -0.0;
    drawTextLine0006.origin = CGPointMake(1833, 1461);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0006];
    
    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 866;
    [edge0006.elements addObject:haul0028];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(2136.5, 1483.5);
    drawLine0035.endPoint = CGPointMake(2136.5, 1601.5);
    drawLine0035.width = 16;
    drawLine0035.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawLine0035];

    // Добавлям станцию Vermont/Santa Monica
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0006.elements addObject:station0029];
    
    station0029.nameOriginal = @"Vermont/Santa Monica";
    station0029.mapLocation = CGPointMake(2136.5, 1601.5);
    station0029.geoLocation = CGPointMake(34.089967, -118.291734);

    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = station0029.mapLocation;
    fillCircle0049.radius = 20;
    fillCircle0049.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0049];
    
    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = station0029.mapLocation;
    fillCircle0050.radius = 15;
    fillCircle0050.fillColor = line0002.color;
    [station0029.drawPrimitives addObject:fillCircle0050];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0029.nameOriginal;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 38;
    drawTextLine0007.kernSpacing = -0.3;
    drawTextLine0007.origin = CGPointMake(1722, 1578);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0007];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 1486;
    [edge0006.elements addObject:haul0029];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(2136.5, 1601);
    drawLine0036.endPoint = CGPointMake(2136.5, 1719);
    drawLine0036.width = 16;
    drawLine0036.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0036];

    // Добавлям станцию Vermont/Beverly
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0006.elements addObject:station0030];
    
    station0030.nameOriginal = @"Vermont/Beverly";
    station0030.mapLocation = CGPointMake(2136.5, 1719);
    station0030.geoLocation = CGPointMake(34.076583, -118.291691);

    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = station0030.mapLocation;
    fillCircle0051.radius = 20;
    fillCircle0051.fillColor = [UIColor whiteColor];
    [station0030.drawPrimitives addObject:fillCircle0051];
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = station0030.mapLocation;
    fillCircle0052.radius = 15;
    fillCircle0052.fillColor = line0002.color;
    [station0030.drawPrimitives addObject:fillCircle0052];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0030.nameOriginal;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 38;
    drawTextLine0008.kernSpacing = -0.1;
    drawTextLine0008.origin = CGPointMake(1827, 1696);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 1627;
    [edge0006.elements addObject:haul0030];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(2136.5, 1718.5);
    drawLine0037.endPoint = CGPointMake(2136.5, 1836.5);
    drawLine0037.width = 16;
    drawLine0037.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0037];

    // Добавлям станцию Wilshire/Vermont
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0006.elements addObject:station0031];
    
    station0031.nameOriginal = @"Wilshire/Vermont";
    station0031.mapLocation = CGPointMake(2136.5, 1836.5);
    station0031.geoLocation = CGPointMake(34.062428, -118.290085);
    
    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = station0031.mapLocation;
    fillCircle0053.radius = 20;
    fillCircle0053.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0053];
    
    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = station0031.mapLocation;
    fillCircle0054.radius = 15;
    fillCircle0054.fillColor = line0002.color;
    [station0031.drawPrimitives addObject:fillCircle0054];
    
    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = station0031.nameOriginal;
    drawTextLine0051.radians = 315 * M_PI / 180;
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 38;
    drawTextLine0051.kernSpacing = 0.1;
    drawTextLine0051.origin = CGPointMake(1894.5, 2089);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0051];

    // Добавляем вершину
    edge0006.finishVertex = vertex0007;
 
    // Создаем участок линии Wilshire/Vermont - Westlake/MacArthur Park
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Wilshire/Vermont - Westlake/MacArthur Park";
    [self.edges addObject:edge0007];
    
    // Добавляем линию
    edge0007.line = line0002;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0007;
    
    // Добавляем станцию "Wilshire/Vermont"
    [edge0007.elements addObject:station0031];
    
    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 1604;
    [edge0007.elements addObject:haul0031];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(2131.5, 1843.5);
    drawLine0038.endPoint = CGPointMake(2231.5, 1943.5);
    drawLine0038.width = 16;
    drawLine0038.color = line0002.color;
    [haul0031.drawPrimitives addObject:drawLine0038];

    // Добавлям станцию Westlake/MacArthur Park
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0007.elements addObject:station0032];
    
    station0032.nameOriginal = @"Westlake/MacArthur Park";
//    station0032.mapLocation = CGPointMake(2224, 1951);
    station0032.mapLocation = CGPointMake(2230.5, 1942.5);
    station0032.geoLocation = CGPointMake(34.056539, -118.274797);

    MWDrawFillCircle *fillCircle0171 = [[MWDrawFillCircle alloc] init];
    fillCircle0171.center = station0032.mapLocation;
    fillCircle0171.radius = 4;
    fillCircle0171.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0171];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = @"Westlake/";
    drawTextLine0052.radians = 315 * M_PI / 180;
    drawTextLine0052.fontName = @"HelveticaNeue";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 38;
    drawTextLine0052.kernSpacing = -0.4;
    drawTextLine0052.origin = CGPointMake(2066, 2076.5);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0052];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = @"MacArthur Park";
    drawTextLine0053.radians = 315 * M_PI / 180;
    drawTextLine0053.fontName = @"HelveticaNeue";
    drawTextLine0053.fontColor = [UIColor blackColor];
    drawTextLine0053.fontSize = 38;
    drawTextLine0053.kernSpacing = -0.4;
    drawTextLine0053.origin = CGPointMake(2024, 2175);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0053];

    // Добавляем вершину
    edge0007.finishVertex = vertex0008;

    // Создаем участок линии Westlake/MacArthur Park - 7th Street/Metro Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Westlake/MacArthur Park - 7th Street/Metro Center";
    [self.edges addObject:edge0008];
    
    // Добавляем линию
    edge0008.line = line0002;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0008;
    
    // Добавляем станцию "Westlake/MacArthur Park"
    [edge0008.elements addObject:station0032];
    
    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 1723;
    [edge0008.elements addObject:haul0032];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(2231, 1943);
    drawLine0039.endPoint = CGPointMake(2237.5, 1949.5);
    drawLine0039.width = 16;
    drawLine0039.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0039];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(2279.5, 1906.5);
    drawArc0008.startRadians = 90 * M_PI / 180;
    drawArc0008.endRadians = 135 * M_PI / 180;
    drawArc0008.radius = 60;
    drawArc0008.width = 16;
    drawArc0008.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(2279, 1966.5);
    drawLine0040.endPoint = CGPointMake(2393, 1966.5);
    drawLine0040.width = 16;
    drawLine0040.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0040];

/*    MMDrawArc *drawArc0009 = [[MMDrawArc alloc] init];
    drawArc0009.center = CGPointMake(2392.5, 1906.5);
    drawArc0009.startRadians = 45 * M_PI / 180;
    drawArc0009.endRadians = 78 * M_PI / 180;
    drawArc0009.radius = 60;
    drawArc0009.width = 16;
    drawArc0009.color = [UIColor greenColor]; // line0002.color;
    [haul0032.drawPrimitives addObject:drawArc0009]; */

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(2392.5, 1906.5);
    drawArc0009.startRadians = 61 * M_PI / 180;
    drawArc0009.endRadians = 90 * M_PI / 180;
    drawArc0009.radius = 60;
    drawArc0009.width = 16;
    drawArc0009.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawArc0009];
    
    // Добавлям станцию 7th Street/Metro Center
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0008.elements addObject:station0033];
    
    station0033.nameOriginal = @"7th Street/Metro Center";
//    station0033.mapLocation = CGPointMake(2427, 1969.5);
    station0033.mapLocation = CGPointMake(2420.5, 1959);
    station0033.geoLocation = CGPointMake(34.048717, -118.258741);

    MWDrawFillCircle *fillCircle0172 = [[MWDrawFillCircle alloc] init];
    fillCircle0172.center = station0033.mapLocation;
    fillCircle0172.radius = 4;
    fillCircle0172.fillColor = [UIColor whiteColor];
    [station0033.drawPrimitives addObject:fillCircle0172];

    station0033.showNameOnMap = false;
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0005];
    
    // Добавляем вершину
    edge0008.finishVertex = vertex0005;

    // Создаем участок линии 7th Street/Metro Center - Pershing Square
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: 7th Street/Metro Center - Pershing Square";
    [self.edges addObject:edge0009];
    
    // Добавляем линию
    edge0009.line = line0002;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0005;
    
    // Добавляем станцию "7th Street/Metro Center"
    [edge0009.elements addObject:station0033];
    
    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 752;
    [edge0009.elements addObject:haul0033];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(2392.5, 1906.5);
    drawArc0010.startRadians = 45 * M_PI / 180;
    drawArc0010.endRadians = 61.5 * M_PI / 180;
    drawArc0010.radius = 60;
    drawArc0010.width = 16;
    drawArc0010.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawArc0010];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(2434.5, 1949.5);
    drawLine0041.endPoint = CGPointMake(2481, 1903);
    drawLine0041.width = 16;
    drawLine0041.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0041];

    // Добавлям станцию Pershing Square
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0009.elements addObject:station0034];
    
    station0034.nameOriginal = @"Pershing Square";
//    station0034.mapLocation = CGPointMake(2488.5, 1910.5);
    station0034.mapLocation = CGPointMake(2481.5, 1902.5);
    station0034.geoLocation = CGPointMake(34.049445, -118.251344);
    
    MWDrawFillCircle *fillCircle0173 = [[MWDrawFillCircle alloc] init];
    fillCircle0173.center = station0034.mapLocation;
    fillCircle0173.radius = 4;
    fillCircle0173.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0173];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = @"Pershing Sq";
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 38;
    drawTextLine0009.kernSpacing = -0.6;
    drawTextLine0009.origin = CGPointMake(2507, 1924);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0009];

    // Добавляем вершину
    edge0009.finishVertex = vertex0009;

    // Создаем участок линии Pershing Square - Civic Center/Grand Park
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Pershing Square - Civic Center/Grand Park";
    [self.edges addObject:edge0010];
    
    // Добавляем линию
    edge0010.line = line0002;
    
    // Добавляем вершину
    edge0010.startVertex = vertex0009;
    
    // Добавляем станцию "Pershing Square"
    [edge0010.elements addObject:station0034];
    
    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 783;
    [edge0010.elements addObject:haul0034];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(2480.5, 1903.5);
    drawLine0042.endPoint = CGPointMake(2592.5, 1791.5);
    drawLine0042.width = 16;
    drawLine0042.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0042];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(2634.5, 1834.5);
    drawArc0011.startRadians = 225 * M_PI / 180;
    drawArc0011.endRadians = 270 * M_PI / 180;
    drawArc0011.radius = 60;
    drawArc0011.width = 16;
    drawArc0011.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(2634, 1774.5);
    drawLine0043.endPoint = CGPointMake(2646.5, 1774.5);
    drawLine0043.width = 16;
    drawLine0043.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0043];

    // Добавлям станцию Civic Center/Grand Park
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0010.elements addObject:station0035];
    
    station0035.nameOriginal = @"Civic Center/Grand Park";
//    station0035.mapLocation = CGPointMake(2646, 1785);
    station0035.mapLocation = CGPointMake(2646, 1774.5);
    station0035.geoLocation = CGPointMake(34.055050, -118.246158);
  
    MWDrawFillCircle *fillCircle0174 = [[MWDrawFillCircle alloc] init];
    fillCircle0174.center = station0035.mapLocation;
    fillCircle0174.radius = 4;
    fillCircle0174.fillColor = [UIColor whiteColor];
    [station0035.drawPrimitives addObject:fillCircle0174];
    
    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = @"Civic Center/";
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 38;
    drawTextLine0010.kernSpacing = -0.6;
    drawTextLine0010.origin = CGPointMake(2528, 1676);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0010];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = @"Grand Park";
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 38;
    drawTextLine0011.kernSpacing = -0.8;
    drawTextLine0011.origin = CGPointMake(2528, 1716);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0011];

    // Добавляем вершину
    edge0010.finishVertex = vertex0010;

    // Создаем участок линии Civic Center/Grand Park - Union Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0011 = [[MWEdge alloc] init];
    edge0011.identifier = @"edge0011";
    edge0011.developmentName = @"Ребро Civic Center/Grand Park - Union Station";
    [self.edges addObject:edge0011];
    
    // Добавляем линию
    edge0011.line = line0002;
    
    // Добавляем вершину
    edge0011.startVertex = vertex0010;
    
    // Добавляем станцию "Civic Center/Grand Park"
    [edge0011.elements addObject:station0035];
    
    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 1338;
    [edge0011.elements addObject:haul0035];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(2646, 1774.5);
    drawLine0044.endPoint = CGPointMake(2803.5, 1774.5);
    drawLine0044.width = 16;
    drawLine0044.color = line0002.color;
    [haul0035.drawPrimitives addObject:drawLine0044];
    
    // Добавлям станцию Union Station
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0011.elements addObject:station0036];
    
    station0036.nameOriginal = @"Union Station";
//    station0036.mapLocation = CGPointMake(2803.5, 1785);
    station0036.mapLocation = CGPointMake(2803.5, 1774.5);
    station0036.geoLocation = CGPointMake(34.055367, -118.234984);
    
    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = station0036.nameOriginal;
    drawTextLine0054.radians = 315 * M_PI / 180;
    drawTextLine0054.fontName = @"HelveticaNeue";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 38;
    drawTextLine0054.kernSpacing = -0.0;
    drawTextLine0054.origin = CGPointMake(2865, 1728);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0054];

    // Добавляем вершину
    edge0011.finishVertex = vertex0011;

    ////////////////////////////////////////////////////////////////
    // 3. Purple Line
    ////////////////////////////////////////////////////////////////

    // Создаем участок линии Wilshire/Western - Wilshire/Vermont
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0012 = [[MWEdge alloc] init];
    edge0012.identifier = @"edge0012";
    edge0012.developmentName = @"Ребро Wilshire/Western - Wilshire/Vermont";
    [self.edges addObject:edge0012];
    
    // Добавляем линию
    edge0012.line = line0003;
    
    // Добавляем вершину
    edge0012.startVertex = vertex0012;

    // Добавлям станцию Wilshire/Western
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0012.elements addObject:station0037];
    
    station0037.nameOriginal = @"Wilshire/Western";
    station0037.mapLocation = CGPointMake(1795, 1862.5);
    station0037.geoLocation = CGPointMake(34.061723, -118.308808);
    
    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = station0037.mapLocation;
    fillCircle0055.radius = 20;
    fillCircle0055.fillColor = [UIColor whiteColor];
    [station0037.drawPrimitives addObject:fillCircle0055];
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = station0037.mapLocation;
    fillCircle0056.radius = 15;
    fillCircle0056.fillColor = line0003.color;
    [station0037.drawPrimitives addObject:fillCircle0056];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = station0037.nameOriginal;
    drawTextLine0055.radians = 315 * M_PI / 180;
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 38;
    drawTextLine0055.kernSpacing = -0.1;
    drawTextLine0055.origin = CGPointMake(1584, 2084.5);
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0055];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 674;
    [edge0012.elements addObject:haul0036];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(1795, 1862.5);
    drawLine0045.endPoint = CGPointMake(1952, 1862.5);
    drawLine0045.width = 16;
    drawLine0045.color = line0003.color;
    [haul0036.drawPrimitives addObject:drawLine0045];

    // Добавлям станцию Wilshire/Normandie
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0012.elements addObject:station0038];
    
    station0038.nameOriginal = @"Wilshire/Normandie";
    station0038.mapLocation = CGPointMake(1952, 1862.5);
    station0038.geoLocation = CGPointMake(34.061772, -118.301498);

    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = station0038.mapLocation;
    fillCircle0057.radius = 20;
    fillCircle0057.fillColor = [UIColor whiteColor];
    [station0038.drawPrimitives addObject:fillCircle0057];
    
    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = station0038.mapLocation;
    fillCircle0058.radius = 15;
    fillCircle0058.fillColor = line0003.color;
    [station0038.drawPrimitives addObject:fillCircle0058];

    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = station0038.nameOriginal;
    drawTextLine0056.radians = 315 * M_PI / 180;
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor blackColor];
    drawTextLine0056.fontSize = 38;
    drawTextLine0056.kernSpacing = 0.3;
    drawTextLine0056.origin = CGPointMake(1705, 2122);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0056];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 1146;
    [edge0012.elements addObject:haul0037];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(1951.5, 1862.5);
    drawLine0046.endPoint = CGPointMake(2124, 1862.5);
    drawLine0046.width = 16;
    drawLine0046.color = line0003.color;
    [haul0037.drawPrimitives addObject:drawLine0046];

    // Добавлям станцию Wilshire/Vermont
    MWStation *station0113 = [[MWStation alloc] init];
    station0113.identifier = @"station0113";
    [edge0012.elements addObject:station0113];
    
    station0113.nameOriginal = @"Wilshire/Vermont";
    station0113.mapLocation = CGPointMake(2109, 1863.5);
    station0113.geoLocation = CGPointMake(34.062428, -118.290085);
    
    MWDrawFillCircle *fillCircle0176 = [[MWDrawFillCircle alloc] init];
    fillCircle0176.center = station0113.mapLocation;
    fillCircle0176.radius = 20;
    fillCircle0176.fillColor = [UIColor whiteColor];
    [station0113.drawPrimitives addObject:fillCircle0176];
    
    MWDrawFillCircle *fillCircle0177 = [[MWDrawFillCircle alloc] init];
    fillCircle0177.center = station0113.mapLocation;
    fillCircle0177.radius = 15;
    fillCircle0177.fillColor = line0003.color;
    [station0113.drawPrimitives addObject:fillCircle0177];
    
    [station0113.nameOriginalTextPrimitives addObject:drawTextLine0051];
    station0113.showNameOnMap = NO;
    
    // Добавляем вершину
    edge0012.finishVertex = vertex0007;

    // Создаем участок линии Wilshire/Vermont - Westlake/MacArthur Park
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0013 = [[MWEdge alloc] init];
    edge0013.identifier = @"edge0013";
    edge0013.developmentName = @"Ребро Wilshire/Vermont - Westlake/MacArthur Park";
    [self.edges addObject:edge0013];
    
    // Добавляем линию
    edge0013.line = line0003;
    
    // Добавляем вершину
    edge0013.startVertex = vertex0007;
    
    // Добавлям станцию Wilshire/Vermont
    [edge0013.elements addObject:station0113];
    
    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = haul0031.length;
    [edge0013.elements addObject:haul0038];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(2118.5, 1860.5);
    drawLine0047.endPoint = CGPointMake(2217, 1959);
    drawLine0047.width = 16;
    drawLine0047.color = line0003.color;
    [haul0038.drawPrimitives addObject:drawLine0047];

    // Добавлям станцию Westlake/MacArthur Park
    MWStation *station0114 = [[MWStation alloc] init];
    station0114.identifier = @"station0114";
    [edge0013.elements addObject:station0114];
    
    station0114.nameOriginal = @"Westlake/MacArthur Park";
    //    station0032.mapLocation = CGPointMake(2224, 1951);
    station0114.mapLocation = CGPointMake(2216.5, 1958.5);
    station0114.geoLocation = CGPointMake(34.056539, -118.274797);
    
    MWDrawFillCircle *fillCircle0178 = [[MWDrawFillCircle alloc] init];
    fillCircle0178.center = station0114.mapLocation;
    fillCircle0178.radius = 4;
    fillCircle0178.fillColor = [UIColor whiteColor];
    [station0114.drawPrimitives addObject:fillCircle0178];

    station0114.showNameOnMap = NO;
    [station0114.nameOriginalTextPrimitives addObject:drawTextLine0052];
    [station0114.nameOriginalTextPrimitives addObject:drawTextLine0053];
    
    // Добавляем вершину
    edge0013.finishVertex = vertex0008;

    // Создаем участок линии Westlake/MacArthur Park - 7th Street/Metro Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0014 = [[MWEdge alloc] init];
    edge0014.identifier = @"edge0014";
    edge0014.developmentName = @"Ребро Westlake/MacArthur Park - 7th Street/Metro Center";
    [self.edges addObject:edge0014];
    
    // Добавляем линию
    edge0014.line = line0003;
    
    // Добавляем вершину
    edge0014.startVertex = vertex0008;
    
    // Добавлям станцию Westlake/MacArthur Park
    [edge0014.elements addObject:station0114];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = haul0032.length;
    [edge0014.elements addObject:haul0039];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(2216.5, 1958.5);
    drawLine0048.endPoint = CGPointMake(2229, 1971);
    drawLine0048.width = 16;
    drawLine0048.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawLine0048];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(2271, 1928);
    drawArc0012.startRadians = 90 * M_PI / 180;
    drawArc0012.endRadians = 135 * M_PI / 180;
    drawArc0012.radius = 60;
    drawArc0012.width = 16;
    drawArc0012.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawArc0012];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(2270, 1988);
    drawLine0049.endPoint = CGPointMake(2401, 1988);
    drawLine0049.width = 16;
    drawLine0049.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawLine0049];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(2401, 1928);
    drawArc0013.startRadians = 61 * M_PI / 180;
    drawArc0013.endRadians = 90 * M_PI / 180;
    drawArc0013.radius = 60;
    drawArc0013.width = 16;
    drawArc0013.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawArc0013];

    // Добавлям станцию 7th Street/Metro Center
    MWStation *station0115 = [[MWStation alloc] init];
    station0115.identifier = @"station0115";
    [edge0014.elements addObject:station0115];
    
    station0115.nameOriginal = @"7th Street/Metro Center";
    //    station0033.mapLocation = CGPointMake(2427, 1969.5);
    station0115.mapLocation = CGPointMake(2436, 1977);
    station0115.geoLocation = CGPointMake(34.048717, -118.258741);
    
    MWDrawFillCircle *fillCircle0179 = [[MWDrawFillCircle alloc] init];
    fillCircle0179.center = station0115.mapLocation;
    fillCircle0179.radius = 4;
    fillCircle0179.fillColor = [UIColor whiteColor];
    [station0115.drawPrimitives addObject:fillCircle0179];
    
    station0115.showNameOnMap = false;
    [station0115.nameOriginalTextPrimitives addObject:drawTextLine0005];
    
    // Добавляем вершину
    edge0014.finishVertex = vertex0005;

    // Создаем участок линии 7th Street/Metro Center - Pershing Square
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0015 = [[MWEdge alloc] init];
    edge0015.identifier = @"edge0015";
    edge0015.developmentName = @"Участок 7th Street/Metro Center - Pershing Square";
    [self.edges addObject:edge0015];
    
    // Добавляем линию
    edge0015.line = line0003;
    
    // Добавляем вершину
    edge0015.startVertex = vertex0005;
    
    // Добавлям станцию 7th Street/Metro Center
    [edge0015.elements addObject:station0115];
    
    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = haul0033.length;
    [edge0015.elements addObject:haul0040];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(2401, 1928);
    drawArc0014.startRadians = 45 * M_PI / 180;
    drawArc0014.endRadians = 61.5 * M_PI / 180;
    drawArc0014.radius = 60;
    drawArc0014.width = 16;
    drawArc0014.color = line0003.color;
    [haul0040.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(2443, 1971);
    drawLine0050.endPoint = CGPointMake(2497, 1917);
    drawLine0050.width = 16;
    drawLine0050.color = line0003.color;
    [haul0040.drawPrimitives addObject:drawLine0050];

    // Добавлям станцию Pershing Square
    MWStation *station0116 = [[MWStation alloc] init];
    station0116.identifier = @"station0116";
    [edge0015.elements addObject:station0116];
    
    station0116.nameOriginal = @"Pershing Square";
    //    station0034.mapLocation = CGPointMake(2488.5, 1910.5);
    station0116.mapLocation = CGPointMake(2494.5, 1917.5);
    station0116.geoLocation = CGPointMake(34.049445, -118.251344);
    
    MWDrawFillCircle *fillCircle0180 = [[MWDrawFillCircle alloc] init];
    fillCircle0180.center = station0116.mapLocation;
    fillCircle0180.radius = 4;
    fillCircle0180.fillColor = [UIColor whiteColor];
    [station0116.drawPrimitives addObject:fillCircle0180];

    station0116.showNameOnMap = NO;
    [station0116.nameOriginalTextPrimitives addObject:drawTextLine0009];

    // Добавляем вершину
    edge0015.finishVertex = vertex0009;

    // Создаем участок линии Pershing Square - Civil Center/Grand Park
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0016 = [[MWEdge alloc] init];
    edge0016.identifier = @"edge0016";
    edge0016.developmentName = @"Участок Pershing Square - Civil Center/Grand Park";
    [self.edges addObject:edge0016];

    // Добавляем линию
    edge0016.line = line0003;
    
    // Добавляем вершину
    edge0016.startVertex = vertex0009;

    // Добавлям станцию Pershing Square
    [edge0016.elements addObject:station0116];
    
    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = haul0034.length;
    [edge0016.elements addObject:haul0041];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(2496.5, 1917.5);
    drawLine0051.endPoint = CGPointMake(2601.5, 1812.5);
    drawLine0051.width = 16;
    drawLine0051.color = line0003.color;
    [haul0041.drawPrimitives addObject:drawLine0051];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(2643.5, 1855.5);
    drawArc0015.startRadians = 225 * M_PI / 180;
    drawArc0015.endRadians = 270 * M_PI / 180;
    drawArc0015.radius = 60;
    drawArc0015.width = 16;
    drawArc0015.color = line0003.color;
    [haul0041.drawPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(2642.5, 1795.5);
    drawLine0052.endPoint = CGPointMake(2647, 1795.5);
    drawLine0052.width = 16;
    drawLine0052.color = line0003.color;
    [haul0041.drawPrimitives addObject:drawLine0052];

    // Добавлям станцию Civic Center/Grand Park
    MWStation *station0117 = [[MWStation alloc] init];
    station0117.identifier = @"station0117";
    [edge0016.elements addObject:station0117];
    
    station0117.nameOriginal = @"Civic Center/Grand Park";
    //    station0035.mapLocation = CGPointMake(2646, 1785);
    station0117.mapLocation = CGPointMake(2646, 1795);
    station0117.geoLocation = CGPointMake(34.055050, -118.246158);
    
    MWDrawFillCircle *fillCircle0181 = [[MWDrawFillCircle alloc] init];
    fillCircle0181.center = station0117.mapLocation;
    fillCircle0181.radius = 4;
    fillCircle0181.fillColor = [UIColor whiteColor];
    [station0117.drawPrimitives addObject:fillCircle0181];

    station0117.showNameOnMap = NO;
    [station0117.nameOriginalTextPrimitives addObject:drawTextLine0010];
    [station0117.nameOriginalTextPrimitives addObject:drawTextLine0011];

    // Добавляем вершину
    edge0016.finishVertex = vertex0010;

    // Создаем участок линии Civil Center/Grand Park - Union Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0017 = [[MWEdge alloc] init];
    edge0017.identifier = @"edge0017";
    edge0017.developmentName = @"Участок Civil Center/Grand Park - Union Station";
    [self.edges addObject:edge0017];

    // Добавляем линию
    edge0017.line = line0003;
    
    // Добавляем вершину
    edge0017.startVertex = vertex0010;

    // Добавлям станцию Civil Center/Grand Park
    [edge0017.elements addObject:station0117];
    
    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = haul0035.length;
    [edge0017.elements addObject:haul0042];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(2646.5, 1795.5);
    drawLine0053.endPoint = CGPointMake(2803.5, 1795.5);
    drawLine0053.width = 16;
    drawLine0053.color = line0003.color;
    [haul0042.drawPrimitives addObject:drawLine0053];

    // Добавлям станцию Union Station
    MWStation *station0118 = [[MWStation alloc] init];
    station0118.identifier = @"station0118";
    [edge0017.elements addObject:station0118];
    
    station0118.nameOriginal = @"Union Station";
    station0118.mapLocation = CGPointMake(2803.5, 1795);
    station0118.geoLocation = CGPointMake(34.055367, -118.234984);

    station0118.showNameOnMap = NO;
    [station0118.nameOriginalTextPrimitives addObject:drawTextLine0054];

    // Добавляем вершину
    edge0017.finishVertex = vertex0011;

    ////////////////////////////////////////////////////////////////
    // 4. Green Line
    ////////////////////////////////////////////////////////////////

    // Создаем участок линии Redondo Beach - Harbor Freeway
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0018 = [[MWEdge alloc] init];
    edge0018.identifier = @"edge0018";
    edge0018.developmentName = @"Участок Redondo Beach - Harbor Freeway";
    [self.edges addObject:edge0018];

    // Добавляем линию
    edge0018.line = line0004;
    
    // Добавляем вершину
    edge0018.startVertex = vertex0013;

    // Добавлям станцию Redondo Beach
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0018.elements addObject:station0039];
    
    station0039.nameOriginal = @"Redondo Beach";
    station0039.mapLocation = CGPointMake(1252.5, 3758);
    station0039.geoLocation = CGPointMake(33.894621, -118.369149);
    
    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = station0039.mapLocation;
    fillCircle0059.radius = 20;
    fillCircle0059.fillColor = [UIColor whiteColor];
    [station0039.drawPrimitives addObject:fillCircle0059];
    
    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = station0039.mapLocation;
    fillCircle0060.radius = 15;
    fillCircle0060.fillColor = line0004.color;
    [station0039.drawPrimitives addObject:fillCircle0060];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0039.nameOriginal;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 38;
    drawTextLine0012.kernSpacing = -1.2;
    drawTextLine0012.origin = CGPointMake(960, 3735);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0012];
    
    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 1760;
    [edge0018.elements addObject:haul0043];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(1252.5, 3758);
    drawLine0054.endPoint = CGPointMake(1252.5, 3626);
    drawLine0054.width = 16;
    drawLine0054.color = line0004.color;
    [haul0043.drawPrimitives addObject:drawLine0054];

    // Добавлям станцию Douglas
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0018.elements addObject:station0040];
    
    station0040.nameOriginal = @"Douglas";
    station0040.mapLocation = CGPointMake(1252.5, 3626);
    station0040.geoLocation = CGPointMake(33.905243, -118.383070);

    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = station0040.mapLocation;
    fillCircle0061.radius = 20;
    fillCircle0061.fillColor = [UIColor whiteColor];
    [station0040.drawPrimitives addObject:fillCircle0061];
    
    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = station0040.mapLocation;
    fillCircle0062.radius = 15;
    fillCircle0062.fillColor = line0004.color;
    [station0040.drawPrimitives addObject:fillCircle0062];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0040.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 38;
    drawTextLine0013.kernSpacing = -0.2;
    drawTextLine0013.origin = CGPointMake(1082, 3600.5);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0013];

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 1337;
    [edge0018.elements addObject:haul0044];

    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(1252.5, 3626.5);
    drawLine0055.endPoint = CGPointMake(1252.5, 3493.5);
    drawLine0055.width = 16;
    drawLine0055.color = line0004.color;
    [haul0044.drawPrimitives addObject:drawLine0055];

    // Добавлям станцию El Segundo
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0018.elements addObject:station0041];
    
    station0041.nameOriginal = @"El Segundo";
    station0041.mapLocation = CGPointMake(1252.5, 3493.5);
    station0041.geoLocation = CGPointMake(33.916182, -118.386723);
    
    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = station0041.mapLocation;
    fillCircle0063.radius = 20;
    fillCircle0063.fillColor = [UIColor whiteColor];
    [station0041.drawPrimitives addObject:fillCircle0063];
    
    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = station0041.mapLocation;
    fillCircle0064.radius = 15;
    fillCircle0064.fillColor = line0004.color;
    [station0041.drawPrimitives addObject:fillCircle0064];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0041.nameOriginal;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 38;
    drawTextLine0014.kernSpacing = -0.8;
    drawTextLine0014.origin = CGPointMake(1032, 3469.5);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 804;
    [edge0018.elements addObject:haul0045];

    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(1252.5, 3494);
    drawLine0056.endPoint = CGPointMake(1252.5, 3361);
    drawLine0056.width = 16;
    drawLine0056.color = line0004.color;
    [haul0045.drawPrimitives addObject:drawLine0056];

    // Добавлям станцию Mariposa
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0018.elements addObject:station0042];
    
    station0042.nameOriginal = @"Mariposa";
    station0042.mapLocation = CGPointMake(1252.5, 3361);
    station0042.geoLocation = CGPointMake(33.923207, -118.387586);
    
    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = station0042.mapLocation;
    fillCircle0065.radius = 20;
    fillCircle0065.fillColor = [UIColor whiteColor];
    [station0042.drawPrimitives addObject:fillCircle0065];
    
    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = station0042.mapLocation;
    fillCircle0066.radius = 15;
    fillCircle0066.fillColor = line0004.color;
    [station0042.drawPrimitives addObject:fillCircle0066];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0042.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 38;
    drawTextLine0015.kernSpacing = -0.7;
    drawTextLine0015.origin = CGPointMake(1066, 3337.5);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0015];

    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 1480;
    [edge0018.elements addObject:haul0046];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(1252.5, 3361.5);
    drawLine0057.endPoint = CGPointMake(1252.5, 3287);
    drawLine0057.width = 16;
    drawLine0057.color = line0004.color;
    [haul0046.drawPrimitives addObject:drawLine0057];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(1292.5, 3287.5);
    drawArc0016.startRadians = 180 * M_PI / 180;
    drawArc0016.endRadians = 270 * M_PI / 180;
    drawArc0016.radius = 40;
    drawArc0016.width = 16;
    drawArc0016.color = line0004.color;
    [haul0046.drawPrimitives addObject:drawArc0016];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(1292, 3247.5);
    drawLine0058.endPoint = CGPointMake(1297.5, 3247.5);
    drawLine0058.width = 16;
    drawLine0058.color = line0004.color;
    [haul0046.drawPrimitives addObject:drawLine0058];

    // Добавлям станцию Aviation / LAX
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0018.elements addObject:station0043];
    
    station0043.nameOriginal = @"Aviation / LAX";
    station0043.mapLocation = CGPointMake(1297.5, 3247.5);
    station0043.geoLocation = CGPointMake(33.929631, -118.377185);
    
    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = station0043.mapLocation;
    fillCircle0067.radius = 20.5;
    fillCircle0067.fillColor = [UIColor blackColor];
    [station0043.drawPrimitives addObject:fillCircle0067];

    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = station0043.mapLocation;
    fillCircle0068.radius = 15;
    fillCircle0068.fillColor = [UIColor whiteColor];
    [station0043.drawPrimitives addObject:fillCircle0068];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = @"Aviation/";
    drawTextLine0057.radians = 315 * M_PI / 180;
    drawTextLine0057.fontName = @"HelveticaNeue";
    drawTextLine0057.fontColor = [UIColor blackColor];
    drawTextLine0057.fontSize = 38;
    drawTextLine0057.kernSpacing = 0.5;
    drawTextLine0057.origin = CGPointMake(1274, 3188);
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0057];

    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = @"LAX";
    drawTextLine0058.radians = 315 * M_PI / 180;
    drawTextLine0058.fontName = @"HelveticaNeue";
    drawTextLine0058.fontColor = [UIColor blackColor];
    drawTextLine0058.fontSize = 38;
    drawTextLine0058.kernSpacing = -0.6;
    drawTextLine0058.origin = CGPointMake(1325, 3193);
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0058];

    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 2430;
    [edge0018.elements addObject:haul0047];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(1297, 3247.5);
    drawLine0059.endPoint = CGPointMake(1493.5, 3247.5);
    drawLine0059.width = 16;
    drawLine0059.color = line0004.color;
    [haul0047.drawPrimitives addObject:drawLine0059];

    // Добавлям станцию Hawthorne / Lennox
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0018.elements addObject:station0044];
    
    station0044.nameOriginal = @"Hawthorne / Lennox";
    station0044.mapLocation = CGPointMake(1493.5, 3247.5);
    station0044.geoLocation = CGPointMake(33.933431, -118.351701);
    
    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = station0044.mapLocation;
    fillCircle0069.radius = 20;
    fillCircle0069.fillColor = [UIColor whiteColor];
    [station0044.drawPrimitives addObject:fillCircle0069];
    
    MWDrawFillCircle *fillCircle0070 = [[MWDrawFillCircle alloc] init];
    fillCircle0070.center = station0044.mapLocation;
    fillCircle0070.radius = 15;
    fillCircle0070.fillColor = line0004.color;
    [station0044.drawPrimitives addObject:fillCircle0070];
    
    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = @"Hawthorne/";
    drawTextLine0059.radians = 315 * M_PI / 180;
    drawTextLine0059.fontName = @"HelveticaNeue";
    drawTextLine0059.fontColor = [UIColor blackColor];
    drawTextLine0059.fontSize = 38;
    drawTextLine0059.kernSpacing = -0.2;
    drawTextLine0059.origin = CGPointMake(1483, 3190);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0059];

    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = @"Lennox";
    drawTextLine0060.radians = 315 * M_PI / 180;
    drawTextLine0060.fontName = @"HelveticaNeue";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 38;
    drawTextLine0060.kernSpacing = -0.2;
    drawTextLine0060.origin = CGPointMake(1537, 3195);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0060];

    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 2620;
    [edge0018.elements addObject:haul0048];

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(1493, 3247.5);
    drawLine0060.endPoint = CGPointMake(1690.5, 3247.5);
    drawLine0060.width = 16;
    drawLine0060.color = line0004.color;
    [haul0048.drawPrimitives addObject:drawLine0060];

    // Добавлям станцию Crenshaw
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0018.elements addObject:station0045];
    
    station0045.nameOriginal = @"Crenshaw";
    station0045.mapLocation = CGPointMake(1690.5, 3247.5);
    station0045.geoLocation = CGPointMake(33.925213, -118.326488);
    
    MWDrawFillCircle *fillCircle0071 = [[MWDrawFillCircle alloc] init];
    fillCircle0071.center = station0045.mapLocation;
    fillCircle0071.radius = 20;
    fillCircle0071.fillColor = [UIColor whiteColor];
    [station0045.drawPrimitives addObject:fillCircle0071];
    
    MWDrawFillCircle *fillCircle0072 = [[MWDrawFillCircle alloc] init];
    fillCircle0072.center = station0045.mapLocation;
    fillCircle0072.radius = 15;
    fillCircle0072.fillColor = line0004.color;
    [station0045.drawPrimitives addObject:fillCircle0072];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = station0045.nameOriginal;
    drawTextLine0061.radians = 315 * M_PI / 180;
    drawTextLine0061.fontName = @"HelveticaNeue";
    drawTextLine0061.fontColor = [UIColor blackColor];
    drawTextLine0061.fontSize = 38;
    drawTextLine0061.kernSpacing = -0.4;
    drawTextLine0061.origin = CGPointMake(1674, 3194);
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0061];

    // Добавляем перегон
    MWHaul *haul0049 = [[MWHaul alloc] init];
    haul0049.identifier = @"haul0049";
    haul0049.length = 3255;
    [edge0018.elements addObject:haul0049];

    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(1690, 3247.5);
    drawLine0061.endPoint = CGPointMake(1886.5, 3247.5);
    drawLine0061.width = 16;
    drawLine0061.color = line0004.color;
    [haul0049.drawPrimitives addObject:drawLine0061];

    // Добавлям станцию Vermont / Athens
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0018.elements addObject:station0046];
    
    station0046.nameOriginal = @"Vermont / Athens";
    station0046.mapLocation = CGPointMake(1886.5, 3247.5);
    station0046.geoLocation = CGPointMake(33.928711, -118.291764);

    MWDrawFillCircle *fillCircle0073 = [[MWDrawFillCircle alloc] init];
    fillCircle0073.center = station0046.mapLocation;
    fillCircle0073.radius = 20;
    fillCircle0073.fillColor = [UIColor whiteColor];
    [station0046.drawPrimitives addObject:fillCircle0073];
    
    MWDrawFillCircle *fillCircle0074 = [[MWDrawFillCircle alloc] init];
    fillCircle0074.center = station0046.mapLocation;
    fillCircle0074.radius = 15;
    fillCircle0074.fillColor = line0004.color;
    [station0046.drawPrimitives addObject:fillCircle0074];

    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = @"Vermont/";
    drawTextLine0062.radians = 315 * M_PI / 180;
    drawTextLine0062.fontName = @"HelveticaNeue";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 38;
    drawTextLine0062.kernSpacing = 0.8;
    drawTextLine0062.origin = CGPointMake(1861, 3194);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0062];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = @"Athens";
    drawTextLine0063.radians = 315 * M_PI / 180;
    drawTextLine0063.fontName = @"HelveticaNeue";
    drawTextLine0063.fontColor = [UIColor blackColor];
    drawTextLine0063.fontSize = 38;
    drawTextLine0063.kernSpacing = 0.4;
    drawTextLine0063.origin = CGPointMake(1921, 3192);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0063];

    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 964;
    [edge0018.elements addObject:haul0050];

    MWDrawLine *drawLine0146 = [[MWDrawLine alloc] init];
    drawLine0146.startPoint = CGPointMake(1886, 3247.5);
    drawLine0146.endPoint = CGPointMake(2113.5, 3247.5);
    drawLine0146.width = 20;
    drawLine0146.color = [UIColor whiteColor];
    [haul0050.drawPrimitives addObject:drawLine0146];

    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(1886, 3247.5);
    drawLine0062.endPoint = CGPointMake(2113.5, 3247.5);
    drawLine0062.width = 16;
    drawLine0062.color = line0004.color;
    [haul0050.drawPrimitives addObject:drawLine0062];

    // Добавлям станцию Harbor Freeway
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0018.elements addObject:station0047];
    
    station0047.nameOriginal = @"Harbor Freeway";
    station0047.mapLocation = CGPointMake(2113.5, 3247.5);
    station0047.geoLocation = CGPointMake(33.928700, -118.281342);
    
    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = @"Harbor Fwy";
    drawTextLine0064.radians = 315 * M_PI / 180;
    drawTextLine0064.fontName = @"HelveticaNeue";
    drawTextLine0064.fontColor = [UIColor blackColor];
    drawTextLine0064.fontSize = 38;
    drawTextLine0064.kernSpacing = -0.4;
    drawTextLine0064.origin = CGPointMake(2110.5, 3190.5);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0064];

    // Добавляем вершину
    edge0018.finishVertex = vertex0014;

    // Создаем участок линии Harbor Freeway - Willowbrook
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0019 = [[MWEdge alloc] init];
    edge0019.identifier = @"edge0019";
    edge0019.developmentName = @"Участок Harbor Freeway - Willowbrook";
    [self.edges addObject:edge0019];

    // Добавляем линию
    edge0019.line = line0004;
    
    // Добавляем вершину
    edge0019.startVertex = vertex0014;

    // Добавлям станцию Harbor Freeway
    [edge0019.elements addObject:station0047];

    // Добавляем перегон
    MWHaul *haul0051 = [[MWHaul alloc] init];
    haul0051.identifier = @"haul0051";
    haul0051.length = 1508;
    [edge0019.elements addObject:haul0051];

    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(2113, 3247.5);
    drawLine0063.endPoint = CGPointMake(2304, 3247.5);
    drawLine0063.width = 16;
    drawLine0063.color = line0004.color;
    [haul0051.drawPrimitives addObject:drawLine0063];

    // Добавлям станцию Avalon
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0019.elements addObject:station0048];
    
    station0048.nameOriginal = @"Avalon";
    station0048.mapLocation = CGPointMake(2304, 3247.5);
    station0048.geoLocation = CGPointMake(33.927476, -118.265169);
    
    MWDrawFillCircle *fillCircle0075 = [[MWDrawFillCircle alloc] init];
    fillCircle0075.center = station0048.mapLocation;
    fillCircle0075.radius = 20;
    fillCircle0075.fillColor = [UIColor whiteColor];
    [station0048.drawPrimitives addObject:fillCircle0075];
    
    MWDrawFillCircle *fillCircle0076 = [[MWDrawFillCircle alloc] init];
    fillCircle0076.center = station0048.mapLocation;
    fillCircle0076.radius = 15;
    fillCircle0076.fillColor = line0004.color;
    [station0048.drawPrimitives addObject:fillCircle0076];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = station0048.nameOriginal;
    drawTextLine0065.radians = 315 * M_PI / 180;
    drawTextLine0065.fontName = @"HelveticaNeue";
    drawTextLine0065.fontColor = [UIColor blackColor];
    drawTextLine0065.fontSize = 38;
    drawTextLine0065.kernSpacing = -0.0;
    drawTextLine0065.origin = CGPointMake(2277, 3188);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0065];

    // Добавляем перегон
    MWHaul *haul0052 = [[MWHaul alloc] init];
    haul0052.identifier = @"haul0052";
    haul0052.length = 2530;
    [edge0019.elements addObject:haul0052];

    MWDrawLine *drawLine0144 = [[MWDrawLine alloc] init];
    drawLine0144.startPoint = CGPointMake(2303.5, 3247.5);
    drawLine0144.endPoint = CGPointMake(2533, 3247.5);
    drawLine0144.width = 20;
    drawLine0144.color = [UIColor whiteColor];
    [haul0052.drawPrimitives addObject:drawLine0144];
    
    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(2303.5, 3247.5);
    drawLine0064.endPoint = CGPointMake(2533, 3247.5);
    drawLine0064.width = 16;
    drawLine0064.color = line0004.color;
    [haul0052.drawPrimitives addObject:drawLine0064];
    
    // Добавлям станцию Willowbrook
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0019.elements addObject:station0049];
    
    station0049.showNameOnMap = NO;
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0036];
    
    station0049.nameOriginal = @"Willowbrook";
    station0049.mapLocation = CGPointMake(2552.5, 3247.5);
    station0049.geoLocation = CGPointMake(33.928243, -118.237993);
    
    MWDrawFillCircle *fillCircle0184 = [[MWDrawFillCircle alloc] init];
    fillCircle0184.center = station0049.mapLocation;
    fillCircle0184.radius = 4;
    fillCircle0184.fillColor = [UIColor whiteColor];
    [station0049.drawPrimitives addObject:fillCircle0184];
    
    // Добавляем вершину
    edge0019.finishVertex = vertex0003;

    // Создаем участок линии Willowbrook - Norwalk
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0020 = [[MWEdge alloc] init];
    edge0020.identifier = @"edge0020";
    edge0020.developmentName = @"Участок Willowbrook - Norwalk";
    [self.edges addObject:edge0020];

    // Добавляем линию
    edge0020.line = line0004;
    
    // Добавляем вершину
    edge0020.startVertex = vertex0003;
    
    // Добавлям станцию Willowbrook
    [edge0020.elements addObject:station0049];

    // Добавляем перегон
    MWHaul *haul0053 = [[MWHaul alloc] init];
    haul0053.identifier = @"haul0053";
    haul0053.length = 2737;
    [edge0020.elements addObject:haul0053];

    MWDrawLine *drawLine0143 = [[MWDrawLine alloc] init];
    drawLine0143.startPoint = CGPointMake(2532.5, 3247.5);
    drawLine0143.endPoint = CGPointMake(2748, 3247.5);
    drawLine0143.width = 16;
    drawLine0143.color = line0004.color;
    [haul0053.drawPrimitives addObject:drawLine0143];
    
    // Добавлям станцию Long Beach
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0020.elements addObject:station0050];
    
    station0050.nameOriginal = @"Long Beach";
    station0050.mapLocation = CGPointMake(2748, 3247.5);
    station0050.geoLocation = CGPointMake(33.924901, -118.209942);
    
    MWDrawFillCircle *fillCircle0077 = [[MWDrawFillCircle alloc] init];
    fillCircle0077.center = station0050.mapLocation;
    fillCircle0077.radius = 20;
    fillCircle0077.fillColor = [UIColor whiteColor];
    [station0050.drawPrimitives addObject:fillCircle0077];
    
    MWDrawFillCircle *fillCircle0078 = [[MWDrawFillCircle alloc] init];
    fillCircle0078.center = station0050.mapLocation;
    fillCircle0078.radius = 15;
    fillCircle0078.fillColor = line0004.color;
    [station0050.drawPrimitives addObject:fillCircle0078];

    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = @"Long Beach Bl";
    drawTextLine0066.radians = 315 * M_PI / 180;
    drawTextLine0066.fontName = @"HelveticaNeue";
    drawTextLine0066.fontColor = [UIColor blackColor];
    drawTextLine0066.fontSize = 38;
    drawTextLine0066.kernSpacing = -1.2;
    drawTextLine0066.origin = CGPointMake(2726, 3190);
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0066];

    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 6770;
    [edge0020.elements addObject:haul0054];

    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(2747.5, 3247.5);
    drawLine0065.endPoint = CGPointMake(2971.5, 3247.5);
    drawLine0065.width = 16;
    drawLine0065.color = line0004.color;
    [haul0054.drawPrimitives addObject:drawLine0065];

    // Добавлям станцию Lakewood
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0020.elements addObject:station0051];
    
    station0051.nameOriginal = @"Lakewood";
    station0051.mapLocation = CGPointMake(2971.5, 3247.5);
    station0051.geoLocation = CGPointMake(33.913124, -118.140596);

    MWDrawFillCircle *fillCircle0079 = [[MWDrawFillCircle alloc] init];
    fillCircle0079.center = station0051.mapLocation;
    fillCircle0079.radius = 20;
    fillCircle0079.fillColor = [UIColor whiteColor];
    [station0051.drawPrimitives addObject:fillCircle0079];
    
    MWDrawFillCircle *fillCircle0080 = [[MWDrawFillCircle alloc] init];
    fillCircle0080.center = station0051.mapLocation;
    fillCircle0080.radius = 15;
    fillCircle0080.fillColor = line0004.color;
    [station0051.drawPrimitives addObject:fillCircle0080];

    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = @"Lakewood Bl";
    drawTextLine0067.radians = 315 * M_PI / 180;
    drawTextLine0067.fontName = @"HelveticaNeue";
    drawTextLine0067.fontColor = [UIColor blackColor];
    drawTextLine0067.fontSize = 38;
    drawTextLine0067.kernSpacing = -0.8;
    drawTextLine0067.origin = CGPointMake(2948, 3190);
    [station0051.nameOriginalTextPrimitives addObject:drawTextLine0067];

    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 3316;
    [edge0020.elements addObject:haul0055];

    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(2971, 3247.5);
    drawLine0066.endPoint = CGPointMake(3195.5, 3247.5);
    drawLine0066.width = 16;
    drawLine0066.color = line0004.color;
    [haul0055.drawPrimitives addObject:drawLine0066];

    // Добавлям станцию Norwalk
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0020.elements addObject:station0052];
    
    station0052.nameOriginal = @"Norwalk";
    station0052.mapLocation = CGPointMake(3195.5, 3247.5);
    station0052.geoLocation = CGPointMake(33.914004, -118.104789);
    
    MWDrawFillCircle *fillCircle0081 = [[MWDrawFillCircle alloc] init];
    fillCircle0081.center = station0052.mapLocation;
    fillCircle0081.radius = 20;
    fillCircle0081.fillColor = [UIColor whiteColor];
    [station0052.drawPrimitives addObject:fillCircle0081];
    
    MWDrawFillCircle *fillCircle0082 = [[MWDrawFillCircle alloc] init];
    fillCircle0082.center = station0052.mapLocation;
    fillCircle0082.radius = 15;
    fillCircle0082.fillColor = line0004.color;
    [station0052.drawPrimitives addObject:fillCircle0082];

    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = station0052.nameOriginal;
    drawTextLine0068.radians = 315 * M_PI / 180;
    drawTextLine0068.fontName = @"HelveticaNeue";
    drawTextLine0068.fontColor = [UIColor blackColor];
    drawTextLine0068.fontSize = 38;
    drawTextLine0068.kernSpacing = 0.2;
    drawTextLine0068.origin = CGPointMake(3170.5, 3190.5);
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0068];

    // Добавляем вершину
    edge0020.finishVertex = vertex0015;
    
    ////////////////////////////////////////////////////////////////
    // 5. Gold Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Atlantic - Union Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0021 = [[MWEdge alloc] init];
    edge0021.identifier = @"edge0021";
    edge0021.developmentName = @"Участок Atlantic - Union Station";
    [self.edges addObject:edge0021];

    // Добавляем линию
    edge0021.line = line0005;
    
    // Добавляем вершину
    edge0021.startVertex = vertex0016;

    // Добавлям станцию Atlantic
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0021.elements addObject:station0053];
    
    station0053.nameOriginal = @"Atlantic";
    station0053.mapLocation = CGPointMake(3576.5, 2048.5);
    station0053.geoLocation = CGPointMake(34.033408, -118.154465);

    MWDrawFillCircle *fillCircle0083 = [[MWDrawFillCircle alloc] init];
    fillCircle0083.center = station0053.mapLocation;
    fillCircle0083.radius = 20;
    fillCircle0083.fillColor = [UIColor whiteColor];
    [station0053.drawPrimitives addObject:fillCircle0083];
    
    MWDrawFillCircle *fillCircle0084 = [[MWDrawFillCircle alloc] init];
    fillCircle0084.center = station0053.mapLocation;
    fillCircle0084.radius = 15;
    fillCircle0084.fillColor = line0005.color;
    [station0053.drawPrimitives addObject:fillCircle0084];

    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = station0053.nameOriginal;
    drawTextLine0069.radians = 315 * M_PI / 180;
    drawTextLine0069.fontName = @"HelveticaNeue";
    drawTextLine0069.fontColor = [UIColor blackColor];
    drawTextLine0069.fontSize = 38;
    drawTextLine0069.kernSpacing = 0.2;
    drawTextLine0069.origin = CGPointMake(3475, 2160);
    [station0053.nameOriginalTextPrimitives addObject:drawTextLine0069];

    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 621;
    [edge0021.elements addObject:haul0056];

    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(3576.5, 2048.5);
    drawLine0067.endPoint = CGPointMake(3460, 2048.5);
    drawLine0067.width = 16;
    drawLine0067.color = line0005.color;
    [haul0056.drawPrimitives addObject:drawLine0067];

    // Добавлям станцию East L.A. Civic Center
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0021.elements addObject:station0054];
    
    station0054.nameOriginal = @"East L.A. Civic Center";
    station0054.mapLocation = CGPointMake(3460, 2048.5);
    station0054.geoLocation = CGPointMake(34.033364, -118.161186);

    MWDrawFillCircle *fillCircle0085 = [[MWDrawFillCircle alloc] init];
    fillCircle0085.center = station0054.mapLocation;
    fillCircle0085.radius = 20;
    fillCircle0085.fillColor = [UIColor whiteColor];
    [station0054.drawPrimitives addObject:fillCircle0085];
    
    MWDrawFillCircle *fillCircle0086 = [[MWDrawFillCircle alloc] init];
    fillCircle0086.center = station0054.mapLocation;
    fillCircle0086.radius = 15;
    fillCircle0086.fillColor = line0005.color;
    [station0054.drawPrimitives addObject:fillCircle0086];

    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = @"East LA Civic Ctr";
    drawTextLine0070.radians = 315 * M_PI / 180;
    drawTextLine0070.fontName = @"HelveticaNeue";
    drawTextLine0070.fontColor = [UIColor blackColor];
    drawTextLine0070.fontSize = 38;
    drawTextLine0070.kernSpacing = -1.2;
    drawTextLine0070.origin = CGPointMake(3261, 2259);
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0070];

    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 641;
    [edge0021.elements addObject:haul0057];

    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(3460.5, 2048.5);
    drawLine0068.endPoint = CGPointMake(3343.5, 2048.5);
    drawLine0068.width = 16;
    drawLine0068.color = line0005.color;
    [haul0057.drawPrimitives addObject:drawLine0068];

    // Добавлям станцию Maravilla
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0021.elements addObject:station0055];
    
    station0055.nameOriginal = @"Maravilla";
    station0055.mapLocation = CGPointMake(3343.5, 2048.5);
    station0055.geoLocation = CGPointMake(34.033316, -118.168125);

    MWDrawFillCircle *fillCircle0087 = [[MWDrawFillCircle alloc] init];
    fillCircle0087.center = station0055.mapLocation;
    fillCircle0087.radius = 20;
    fillCircle0087.fillColor = [UIColor whiteColor];
    [station0055.drawPrimitives addObject:fillCircle0087];
    
    MWDrawFillCircle *fillCircle0088 = [[MWDrawFillCircle alloc] init];
    fillCircle0088.center = station0055.mapLocation;
    fillCircle0088.radius = 15;
    fillCircle0088.fillColor = line0005.color;
    [station0055.drawPrimitives addObject:fillCircle0088];

    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = station0055.nameOriginal;
    drawTextLine0071.radians = 315 * M_PI / 180;
    drawTextLine0071.fontName = @"HelveticaNeue";
    drawTextLine0071.fontColor = [UIColor blackColor];
    drawTextLine0071.fontSize = 38;
    drawTextLine0071.kernSpacing = -0.0;
    drawTextLine0071.origin = CGPointMake(3227, 2176);
    [station0055.nameOriginalTextPrimitives addObject:drawTextLine0071];

    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 2313;
    [edge0021.elements addObject:haul0058];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(3344, 2048.5);
    drawLine0069.endPoint = CGPointMake(3227.5, 2048.5);
    drawLine0069.width = 16;
    drawLine0069.color = line0005.color;
    [haul0058.drawPrimitives addObject:drawLine0069];

    // Добавлям станцию Indiana
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0021.elements addObject:station0056];
    
    station0056.nameOriginal = @"Indiana";
    station0056.mapLocation = CGPointMake(3227.5, 2048.5);
    station0056.geoLocation = CGPointMake(34.034298, -118.192169);
    
    MWDrawFillCircle *fillCircle0089 = [[MWDrawFillCircle alloc] init];
    fillCircle0089.center = station0056.mapLocation;
    fillCircle0089.radius = 20;
    fillCircle0089.fillColor = [UIColor whiteColor];
    [station0056.drawPrimitives addObject:fillCircle0089];
    
    MWDrawFillCircle *fillCircle0090 = [[MWDrawFillCircle alloc] init];
    fillCircle0090.center = station0056.mapLocation;
    fillCircle0090.radius = 15;
    fillCircle0090.fillColor = line0005.color;
    [station0056.drawPrimitives addObject:fillCircle0090];

    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = station0056.nameOriginal;
    drawTextLine0072.radians = 315 * M_PI / 180;
    drawTextLine0072.fontName = @"HelveticaNeue";
    drawTextLine0072.fontColor = [UIColor blackColor];
    drawTextLine0072.fontSize = 38;
    drawTextLine0072.kernSpacing = 0.2;
    drawTextLine0072.origin = CGPointMake(3129, 2158);
    [station0056.nameOriginalTextPrimitives addObject:drawTextLine0072];

    // Добавляем перегон
    MWHaul *haul0059 = [[MWHaul alloc] init];
    haul0059.identifier = @"haul0059";
    haul0059.length = 2034;
    [edge0021.elements addObject:haul0059];

    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(3228, 2048.5);
    drawLine0070.endPoint = CGPointMake(3111, 2048.5);
    drawLine0070.width = 16;
    drawLine0070.color = line0005.color;
    [haul0059.drawPrimitives addObject:drawLine0070];

    // Добавлям станцию Soto
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0021.elements addObject:station0057];
    
    station0057.nameOriginal = @"Soto";
    station0057.mapLocation = CGPointMake(3111, 2048.5);
    station0057.geoLocation = CGPointMake(34.043847, -118.210023);

    MWDrawFillCircle *fillCircle0091 = [[MWDrawFillCircle alloc] init];
    fillCircle0091.center = station0057.mapLocation;
    fillCircle0091.radius = 20;
    fillCircle0091.fillColor = [UIColor whiteColor];
    [station0057.drawPrimitives addObject:fillCircle0091];
    
    MWDrawFillCircle *fillCircle0092 = [[MWDrawFillCircle alloc] init];
    fillCircle0092.center = station0057.mapLocation;
    fillCircle0092.radius = 15;
    fillCircle0092.fillColor = line0005.color;
    [station0057.drawPrimitives addObject:fillCircle0092];

    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = station0057.nameOriginal;
    drawTextLine0073.radians = 315 * M_PI / 180;
    drawTextLine0073.fontName = @"HelveticaNeue";
    drawTextLine0073.fontColor = [UIColor blackColor];
    drawTextLine0073.fontSize = 38;
    drawTextLine0073.kernSpacing = 0.2;
    drawTextLine0073.origin = CGPointMake(3045, 2126);
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0073];

    // Добавляем перегон
    MWHaul *haul0060 = [[MWHaul alloc] init];
    haul0060.identifier = @"haul0060";
    haul0060.length = 977;
    [edge0021.elements addObject:haul0060];

    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(3111.5, 2048.5);
    drawLine0071.endPoint = CGPointMake(2995, 2048.5);
    drawLine0071.width = 16;
    drawLine0071.color = line0005.color;
    [haul0060.drawPrimitives addObject:drawLine0071];

    // Добавлям станцию Mariachi Plaza
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0021.elements addObject:station0058];
    
    station0058.nameOriginal = @"Mariachi Plaza";
    station0058.mapLocation = CGPointMake(2995, 2048.5);
    station0058.geoLocation = CGPointMake(34.047238, -118.219648);

    MWDrawFillCircle *fillCircle0093 = [[MWDrawFillCircle alloc] init];
    fillCircle0093.center = station0058.mapLocation;
    fillCircle0093.radius = 20;
    fillCircle0093.fillColor = [UIColor whiteColor];
    [station0058.drawPrimitives addObject:fillCircle0093];
    
    MWDrawFillCircle *fillCircle0094 = [[MWDrawFillCircle alloc] init];
    fillCircle0094.center = station0058.mapLocation;
    fillCircle0094.radius = 15;
    fillCircle0094.fillColor = line0005.color;
    [station0058.drawPrimitives addObject:fillCircle0094];

    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = station0058.nameOriginal;
    drawTextLine0074.radians = 315 * M_PI / 180;
    drawTextLine0074.fontName = @"HelveticaNeue";
    drawTextLine0074.fontColor = [UIColor blackColor];
    drawTextLine0074.fontSize = 38;
    drawTextLine0074.kernSpacing = -0.6;
    drawTextLine0074.origin = CGPointMake(2816, 2239);
    [station0058.nameOriginalTextPrimitives addObject:drawTextLine0074];

    // Добавляем перегон
    MWHaul *haul0061 = [[MWHaul alloc] init];
    haul0061.identifier = @"haul0061";
    haul0061.length = 578;
    [edge0021.elements addObject:haul0061];

    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(2995.5, 2048.5);
    drawLine0072.endPoint = CGPointMake(2957, 2048.5);
    drawLine0072.width = 16;
    drawLine0072.color = line0005.color;
    [haul0061.drawPrimitives addObject:drawLine0072];

    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(2957.5, 1988.5);
    drawArc0017.startRadians = 90 * M_PI / 180;
    drawArc0017.endRadians = 135 * M_PI / 180;
    drawArc0017.radius = 60;
    drawArc0017.width = 16;
    drawArc0017.color = line0005.color;
    [haul0061.drawPrimitives addObject:drawArc0017];

    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(2915.5, 2031.5);
    drawLine0073.endPoint = CGPointMake(2889.5, 2005.5);
    drawLine0073.width = 16;
    drawLine0073.color = line0005.color;
    [haul0061.drawPrimitives addObject:drawLine0073];

    // Добавлям станцию Pico/Aliso
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0021.elements addObject:station0059];
    
    station0059.nameOriginal = @"Pico/Aliso";
    station0059.mapLocation = CGPointMake(2889.5, 2005.5);
    station0059.geoLocation = CGPointMake(34.047623, -118.225886);
    
    MWDrawFillCircle *fillCircle0095 = [[MWDrawFillCircle alloc] init];
    fillCircle0095.center = station0059.mapLocation;
    fillCircle0095.radius = 20;
    fillCircle0095.fillColor = [UIColor whiteColor];
    [station0059.drawPrimitives addObject:fillCircle0095];

    MWDrawFillCircle *fillCircle0096 = [[MWDrawFillCircle alloc] init];
    fillCircle0096.center = station0059.mapLocation;
    fillCircle0096.radius = 15;
    fillCircle0096.fillColor = line0005.color;
    [station0059.drawPrimitives addObject:fillCircle0096];

    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = station0059.nameOriginal;
    drawTextLine0075.radians = 315 * M_PI / 180;
    drawTextLine0075.fontName = @"HelveticaNeue";
    drawTextLine0075.fontColor = [UIColor blackColor];
    drawTextLine0075.fontSize = 38;
    drawTextLine0075.kernSpacing = -0.6;
    drawTextLine0075.origin = CGPointMake(2735, 2127);
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0075];

    // Добавляем перегон
    MWHaul *haul0062 = [[MWHaul alloc] init];
    haul0062.identifier = @"haul0062";
    haul0062.length= 1236;
    [edge0021.elements addObject:haul0062];

    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(2890, 2006);
    drawLine0074.endPoint = CGPointMake(2861.5, 1977.5);
    drawLine0074.width = 16;
    drawLine0074.color = line0005.color;
    [haul0062.drawPrimitives addObject:drawLine0074];

    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(2904.5, 1935.5);
    drawArc0018.startRadians = 135 * M_PI / 180;
    drawArc0018.endRadians = 180 * M_PI / 180;
    drawArc0018.radius = 60;
    drawArc0018.width = 16;
    drawArc0018.color = line0005.color;
    [haul0062.drawPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(2844.5, 1936);
    drawLine0075.endPoint = CGPointMake(2844.5, 1901);
    drawLine0075.width = 16;
    drawLine0075.color = line0005.color;
    [haul0062.drawPrimitives addObject:drawLine0075];

    // Добавлям станцию Little Tokyo/Arts District
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0021.elements addObject:station0060];
    
    station0060.nameOriginal = @"Little Tokyo/Arts District";
    station0060.mapLocation = CGPointMake(2844.5, 1901);
    station0060.geoLocation = CGPointMake(34.050159, -118.237913);
    
    MWDrawFillCircle *fillCircle0097 = [[MWDrawFillCircle alloc] init];
    fillCircle0097.center = station0060.mapLocation;
    fillCircle0097.radius = 20;
    fillCircle0097.fillColor = [UIColor whiteColor];
    [station0060.drawPrimitives addObject:fillCircle0097];
    
    MWDrawFillCircle *fillCircle0098 = [[MWDrawFillCircle alloc] init];
    fillCircle0098.center = station0060.mapLocation;
    fillCircle0098.radius = 15;
    fillCircle0098.fillColor = line0005.color;
    [station0060.drawPrimitives addObject:fillCircle0098];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = @"Little Tokyo/";
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 38;
    drawTextLine0016.kernSpacing = -0.6;
    drawTextLine0016.origin = CGPointMake(2876, 1877);
    [station0060.nameOriginalTextPrimitives addObject:drawTextLine0016];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = @"Arts Dist";
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 38;
    drawTextLine0017.kernSpacing = -1.1;
    drawTextLine0017.origin = CGPointMake(2876, 1917);
    [station0060.nameOriginalTextPrimitives addObject:drawTextLine0017];

    // Добавляем перегон
    MWHaul *haul0063 = [[MWHaul alloc] init];
    haul0063.identifier = @"haul0063";
    haul0063.length = 789;
    [edge0021.elements addObject:haul0063];

    MWDrawLine *drawLine0175 = [[MWDrawLine alloc] init];
    drawLine0175.startPoint = CGPointMake(2844.5, 1901.5);
    drawLine0175.endPoint = CGPointMake(2844.5, 1785);
    drawLine0175.width = 20;
    drawLine0175.color = [UIColor whiteColor];
    [haul0063.drawPrimitives addObject:drawLine0175];

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(2844.5, 1901.5);
    drawLine0076.endPoint = CGPointMake(2844.5, 1785);
    drawLine0076.width = 16;
    drawLine0076.color = line0005.color;
    [haul0063.drawPrimitives addObject:drawLine0076];

    // Добавлям станцию Union Station
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0021.elements addObject:station0061];
    
    station0061.nameOriginal = @"Union Station";
    station0061.mapLocation = CGPointMake(2844.5, 1785);
    station0061.geoLocation = CGPointMake(34.055367, -118.234978);
    
    station0061.showNameOnMap = false;
    [station0061.drawPrimitives addObject:drawTextLine0054];

    MWDrawFillCircle *fillCircle0185 = [[MWDrawFillCircle alloc] init];
    fillCircle0185.center = station0061.mapLocation;
    fillCircle0185.radius = 4;
    fillCircle0185.fillColor = [UIColor whiteColor];
    [station0061.drawPrimitives addObject:fillCircle0185];

    // Добавляем вершину
    edge0021.finishVertex = vertex0011;
    
    // Создаем участок линии Union Station - Sierra Madre Villa
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0022 = [[MWEdge alloc] init];
    edge0022.identifier = @"edge0022";
    edge0022.developmentName = @"Участок Union Station - Sierra Madre Villa";
    [self.edges addObject:edge0022];

    // Добавляем линию
    edge0022.line = line0005;
    
    // Добавляем вершину
    edge0022.startVertex = vertex0011;

    // Добавлям станцию Union Station
    [edge0022.elements addObject:station0061];

    // Добавляем перегон
    MWHaul *haul0064 = [[MWHaul alloc] init];
    haul0064.identifier = @"haul0064";
    haul0064.length = 1075;
    [edge0022.elements addObject:haul0064];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(2844.5, 1785.5);
    drawLine0077.endPoint = CGPointMake(2844.5, 1637);
    drawLine0077.width = 16;
    drawLine0077.color = line0005.color;
    [haul0064.drawPrimitives addObject:drawLine0077];

    // Добавлям станцию Chinatown
    MWStation *station0062 = [[MWStation alloc] init];
    station0062.identifier = @"station0062";
    [edge0022.elements addObject:station0062];
    
    station0062.nameOriginal = @"Chinatown";
    station0062.mapLocation = CGPointMake(2844.5, 1637);
    station0062.geoLocation = CGPointMake(34.063887, -118.235838);
    
    MWDrawFillCircle *fillCircle0099 = [[MWDrawFillCircle alloc] init];
    fillCircle0099.center = station0062.mapLocation;
    fillCircle0099.radius = 20;
    fillCircle0099.fillColor = [UIColor whiteColor];
    [station0062.drawPrimitives addObject:fillCircle0099];
    
    MWDrawFillCircle *fillCircle0100 = [[MWDrawFillCircle alloc] init];
    fillCircle0100.center = station0062.mapLocation;
    fillCircle0100.radius = 15;
    fillCircle0100.fillColor = line0005.color;
    [station0062.drawPrimitives addObject:fillCircle0100];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0062.nameOriginal;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 38;
    drawTextLine0018.kernSpacing = 0.2;
    drawTextLine0018.origin = CGPointMake(2629, 1614);
    [station0062.nameOriginalTextPrimitives addObject:drawTextLine0018];
    
    // Добавляем перегон
    MWHaul *haul0065 = [[MWHaul alloc] init];
    haul0065.identifier = @"haul0065";
    haul0065.length = 2492;
    [edge0022.elements addObject:haul0065];

    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(2844.5, 1637.5);
    drawLine0078.endPoint = CGPointMake(2844.5, 1528);
    drawLine0078.width = 16;
    drawLine0078.color = line0005.color;
    [haul0065.drawPrimitives addObject:drawLine0078];

    // Добавлям станцию Lincoln/Cypress
    MWStation *station0063 = [[MWStation alloc] init];
    station0063.identifier = @"station0063";
    [edge0022.elements addObject:station0063];
    
    station0063.nameOriginal = @"Lincoln/Cypress";
    station0063.mapLocation = CGPointMake(2844.5, 1528);
    station0063.geoLocation = CGPointMake(34.080984, -118.220431);
    
    MWDrawFillCircle *fillCircle0101 = [[MWDrawFillCircle alloc] init];
    fillCircle0101.center = station0063.mapLocation;
    fillCircle0101.radius = 20;
    fillCircle0101.fillColor = [UIColor whiteColor];
    [station0063.drawPrimitives addObject:fillCircle0101];
    
    MWDrawFillCircle *fillCircle0102 = [[MWDrawFillCircle alloc] init];
    fillCircle0102.center = station0063.mapLocation;
    fillCircle0102.radius = 15;
    fillCircle0102.fillColor = line0005.color;
    [station0063.drawPrimitives addObject:fillCircle0102];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0063.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 38;
    drawTextLine0019.kernSpacing = -0.6;
    drawTextLine0019.origin = CGPointMake(2548, 1505);
    [station0063.nameOriginalTextPrimitives addObject:drawTextLine0019];

    // Добавляем перегон
    MWHaul *haul0066 = [[MWHaul alloc] init];
    haul0066.length = 966;
    haul0066.identifier = @"haul0066";
    [edge0022.elements addObject:haul0066];

    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(2844.5, 1528.5);
    drawLine0079.endPoint = CGPointMake(2844.5, 1486);
    drawLine0079.width = 16;
    drawLine0079.color = line0005.color;
    [haul0066.drawPrimitives addObject:drawLine0079];

    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(2904.5, 1486.5);
    drawArc0019.startRadians = 180 * M_PI / 180;
    drawArc0019.endRadians = 225 * M_PI / 180;
    drawArc0019.radius = 60;
    drawArc0019.width = 16;
    drawArc0019.color = line0005.color;
    [haul0066.drawPrimitives addObject:drawArc0019];

    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(2861.5, 1444.5);
    drawLine0080.endPoint = CGPointMake(2881.5, 1424.5);
    drawLine0080.width = 16;
    drawLine0080.color = line0005.color;
    [haul0066.drawPrimitives addObject:drawLine0080];
    
    // Добавлям станцию Heritage Square
    MWStation *station0064 = [[MWStation alloc] init];
    station0064.identifier = @"station0064";
    [edge0022.elements addObject:station0064];
    
    station0064.nameOriginal = @"Heritage Square";
    station0064.mapLocation = CGPointMake(2881.5, 1424.5);
    station0064.geoLocation = CGPointMake(34.087263, -118.213215);

    MWDrawFillCircle *fillCircle0103 = [[MWDrawFillCircle alloc] init];
    fillCircle0103.center = station0064.mapLocation;
    fillCircle0103.radius = 20;
    fillCircle0103.fillColor = [UIColor whiteColor];
    [station0064.drawPrimitives addObject:fillCircle0103];
    
    MWDrawFillCircle *fillCircle0104 = [[MWDrawFillCircle alloc] init];
    fillCircle0104.center = station0064.mapLocation;
    fillCircle0104.radius = 15;
    fillCircle0104.fillColor = line0005.color;
    [station0064.drawPrimitives addObject:fillCircle0104];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = @"Heritage  Sq";
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 38;
    drawTextLine0020.kernSpacing = -1.5;
    drawTextLine0020.origin = CGPointMake(2664, 1366);
    [station0064.nameOriginalTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0067 = [[MWHaul alloc] init];
    haul0067.identifier = @"haul0067";
    haul0067.length = 1425;
    [edge0022.elements addObject:haul0067];

    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(2881, 1425);
    drawLine0081.endPoint = CGPointMake(2961, 1345.5);
    drawLine0081.width = 16;
    drawLine0081.color = line0005.color;
    [haul0067.drawPrimitives addObject:drawLine0081];

    // Добавлям станцию Southwest Museum
    MWStation *station0065 = [[MWStation alloc] init];
    station0065.identifier = @"station0065";
    [edge0022.elements addObject:station0065];
    
    station0065.nameOriginal = @"Southwest Museum";
    station0065.mapLocation = CGPointMake(2961, 1345.5);
    station0065.geoLocation = CGPointMake(34.098281, -118.206717);

    MWDrawFillCircle *fillCircle0105 = [[MWDrawFillCircle alloc] init];
    fillCircle0105.center = station0065.mapLocation;
    fillCircle0105.radius = 20;
    fillCircle0105.fillColor = [UIColor whiteColor];
    [station0065.drawPrimitives addObject:fillCircle0105];
    
    MWDrawFillCircle *fillCircle0106 = [[MWDrawFillCircle alloc] init];
    fillCircle0106.center = station0065.mapLocation;
    fillCircle0106.radius = 15;
    fillCircle0106.fillColor = line0005.color;
    [station0065.drawPrimitives addObject:fillCircle0106];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0065.nameOriginal;
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 38;
    drawTextLine0021.kernSpacing = -0.4;
    drawTextLine0021.origin = CGPointMake(2609, 1286.5);
    [station0065.nameOriginalTextPrimitives addObject:drawTextLine0021];

    // Добавляем перегон
    MWHaul *haul0068 = [[MWHaul alloc] init];
    haul0068.identifier = @"haul0068";
    haul0068.length = 2086;
    [edge0022.elements addObject:haul0068];

    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(2960.5, 1346);
    drawLine0082.endPoint = CGPointMake(3040.5, 1265.5);
    drawLine0082.width = 16;
    drawLine0082.color = line0005.color;
    [haul0068.drawPrimitives addObject:drawLine0082];

    // Добавлям станцию Highland Park
    MWStation *station0066 = [[MWStation alloc] init];
    station0066.identifier = @"station0066";
    [edge0022.elements addObject:station0066];
    
    station0066.nameOriginal = @"Highland Park";
    station0066.mapLocation = CGPointMake(3040.5, 1265.5);
    station0066.geoLocation = CGPointMake(34.111200, -118.192592);

    MWDrawFillCircle *fillCircle0107 = [[MWDrawFillCircle alloc] init];
    fillCircle0107.center = station0066.mapLocation;
    fillCircle0107.radius = 20;
    fillCircle0107.fillColor = [UIColor whiteColor];
    [station0066.drawPrimitives addObject:fillCircle0107];
    
    MWDrawFillCircle *fillCircle0108 = [[MWDrawFillCircle alloc] init];
    fillCircle0108.center = station0066.mapLocation;
    fillCircle0108.radius = 15;
    fillCircle0108.fillColor = line0005.color;
    [station0066.drawPrimitives addObject:fillCircle0108];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0066.nameOriginal;
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 38;
    drawTextLine0022.kernSpacing = -0.0;
    drawTextLine0022.origin = CGPointMake(2781, 1207);
    [station0066.nameOriginalTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0069 = [[MWHaul alloc] init];
    haul0069.identifier = @"haul0069";
    haul0069.length = 3415;
    [edge0022.elements addObject:haul0069];

    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(3040, 1266);
    drawLine0083.endPoint = CGPointMake(3119.5, 1186.5);
    drawLine0083.width = 16;
    drawLine0083.color = line0005.color;
    [haul0069.drawPrimitives addObject:drawLine0083];

    // Добавлям станцию South Pasadena
    MWStation *station0067 = [[MWStation alloc] init];
    station0067.identifier = @"station0067";
    [edge0022.elements addObject:station0067];
    
    station0067.nameOriginal = @"South Pasadena";
    station0067.mapLocation = CGPointMake(3119.5, 1186.5);
    station0067.geoLocation = CGPointMake(34.115221, -118.157871);

    MWDrawFillCircle *fillCircle0109 = [[MWDrawFillCircle alloc] init];
    fillCircle0109.center = station0067.mapLocation;
    fillCircle0109.radius = 20;
    fillCircle0109.fillColor = [UIColor whiteColor];
    [station0067.drawPrimitives addObject:fillCircle0109];
    
    MWDrawFillCircle *fillCircle0110 = [[MWDrawFillCircle alloc] init];
    fillCircle0110.center = station0067.mapLocation;
    fillCircle0110.radius = 15;
    fillCircle0110.fillColor = line0005.color;
    [station0067.drawPrimitives addObject:fillCircle0110];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0067.nameOriginal;
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 38;
    drawTextLine0023.kernSpacing = -1.0;
    drawTextLine0023.origin = CGPointMake(2830, 1128);
    [station0067.nameOriginalTextPrimitives addObject:drawTextLine0023];

    // Добавляем перегон
    MWHaul *haul0070 = [[MWHaul alloc] init];
    haul0070.identifier = @"haul0070";
    haul0070.length = 2397;
    [edge0022.elements addObject:haul0070];

    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(3119, 1187);
    drawLine0084.endPoint = CGPointMake(3146, 1160);
    drawLine0084.width = 16;
    drawLine0084.color = line0005.color;
    [haul0070.drawPrimitives addObject:drawLine0084];

    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(3188, 1203);
    drawArc0020.startRadians = 225 * M_PI / 180;
    drawArc0020.endRadians = 270 * M_PI / 180;
    drawArc0020.radius = 60;
    drawArc0020.width = 16;
    drawArc0020.color = line0005.color;
    [haul0070.drawPrimitives addObject:drawArc0020];

    MWDrawLine *drawLine0085 = [[MWDrawLine alloc] init];
    drawLine0085.startPoint = CGPointMake(3188, 1143);
    drawLine0085.endPoint = CGPointMake(3212, 1143);
    drawLine0085.width = 16;
    drawLine0085.color = line0005.color;
    [haul0070.drawPrimitives addObject:drawLine0085];
    
    // Добавлям станцию Fillmore
    MWStation *station0068 = [[MWStation alloc] init];
    station0068.identifier = @"station0068";
    [edge0022.elements addObject:station0068];
    
    station0068.nameOriginal = @"Fillmore";
    station0068.mapLocation = CGPointMake(3212, 1143);
    station0068.geoLocation = CGPointMake(34.133532, -118.148122);

    MWDrawFillCircle *fillCircle0111 = [[MWDrawFillCircle alloc] init];
    fillCircle0111.center = station0068.mapLocation;
    fillCircle0111.radius = 20;
    fillCircle0111.fillColor = [UIColor whiteColor];
    [station0068.drawPrimitives addObject:fillCircle0111];
    
    MWDrawFillCircle *fillCircle0112 = [[MWDrawFillCircle alloc] init];
    fillCircle0112.center = station0068.mapLocation;
    fillCircle0112.radius = 15;
    fillCircle0112.fillColor = line0005.color;
    [station0068.drawPrimitives addObject:fillCircle0112];

    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0068.nameOriginal;
    drawTextLine0076.radians = 315 * M_PI / 180;
    drawTextLine0076.fontName = @"HelveticaNeue";
    drawTextLine0076.fontColor = [UIColor blackColor];
    drawTextLine0076.fontSize = 38;
    drawTextLine0076.kernSpacing = 0.4;
    drawTextLine0076.origin = CGPointMake(3187, 1086);
    [station0068.nameOriginalTextPrimitives addObject:drawTextLine0076];

    // Добавляем перегон
    MWHaul *haul0071 = [[MWHaul alloc] init];
    haul0071.identifier = @"haul0071";
    haul0071.length = 934;
    [edge0022.elements addObject:haul0071];

    MWDrawLine *drawLine0086 = [[MWDrawLine alloc] init];
    drawLine0086.startPoint = CGPointMake(3211.5, 1143);
    drawLine0086.endPoint = CGPointMake(3321, 1143);
    drawLine0086.width = 16;
    drawLine0086.color = line0005.color;
    [haul0071.drawPrimitives addObject:drawLine0086];

    // Добавлям станцию Del Mar
    MWStation *station0069 = [[MWStation alloc] init];
    station0069.identifier = @"station0069";
    [edge0022.elements addObject:station0069];
    
    station0069.nameOriginal = @"Del Mar";
    station0069.mapLocation = CGPointMake(3321, 1143);
    station0069.geoLocation = CGPointMake(34.141934, -118.148213);
    
    MWDrawFillCircle *fillCircle0113 = [[MWDrawFillCircle alloc] init];
    fillCircle0113.center = station0069.mapLocation;
    fillCircle0113.radius = 20;
    fillCircle0113.fillColor = [UIColor whiteColor];
    [station0069.drawPrimitives addObject:fillCircle0113];
    
    MWDrawFillCircle *fillCircle0114 = [[MWDrawFillCircle alloc] init];
    fillCircle0114.center = station0069.mapLocation;
    fillCircle0114.radius = 15;
    fillCircle0114.fillColor = line0005.color;
    [station0069.drawPrimitives addObject:fillCircle0114];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = station0069.nameOriginal;
    drawTextLine0077.radians = 315 * M_PI / 180;
    drawTextLine0077.fontName = @"HelveticaNeue";
    drawTextLine0077.fontColor = [UIColor blackColor];
    drawTextLine0077.fontSize = 38;
    drawTextLine0077.kernSpacing = -0.3;
    drawTextLine0077.origin = CGPointMake(3296, 1085);
    [station0069.nameOriginalTextPrimitives addObject:drawTextLine0077];

    // Добавляем перегон
    MWHaul *haul0072 = [[MWHaul alloc] init];
    haul0072.identifier = @"haul0072";
    haul0072.length = 727;
    [edge0022.elements addObject:haul0072];

    MWDrawLine *drawLine0087 = [[MWDrawLine alloc] init];
    drawLine0087.startPoint = CGPointMake(3320.5, 1143);
    drawLine0087.endPoint = CGPointMake(3429.5, 1143);
    drawLine0087.width = 16;
    drawLine0087.color = line0005.color;
    [haul0072.drawPrimitives addObject:drawLine0087];

    // Добавлям станцию Memorial Park
    MWStation *station0070 = [[MWStation alloc] init];
    station0070.identifier = @"station0070";
    [edge0022.elements addObject:station0070];
    
    station0070.nameOriginal = @"Memorial Park";
    station0070.mapLocation = CGPointMake(3429.5, 1143);
    station0070.geoLocation = CGPointMake(34.148390, -118.147512);

    MWDrawFillCircle *fillCircle0115 = [[MWDrawFillCircle alloc] init];
    fillCircle0115.center = station0070.mapLocation;
    fillCircle0115.radius = 20;
    fillCircle0115.fillColor = [UIColor whiteColor];
    [station0070.drawPrimitives addObject:fillCircle0115];
    
    MWDrawFillCircle *fillCircle0116 = [[MWDrawFillCircle alloc] init];
    fillCircle0116.center = station0070.mapLocation;
    fillCircle0116.radius = 15;
    fillCircle0116.fillColor = line0005.color;
    [station0070.drawPrimitives addObject:fillCircle0116];

    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = station0070.nameOriginal;
    drawTextLine0078.radians = 315 * M_PI / 180;
    drawTextLine0078.fontName = @"HelveticaNeue";
    drawTextLine0078.fontColor = [UIColor blackColor];
    drawTextLine0078.fontSize = 38;
    drawTextLine0078.kernSpacing = -0.3;
    drawTextLine0078.origin = CGPointMake(3404, 1086);
    [station0070.nameOriginalTextPrimitives addObject:drawTextLine0078];

    // Добавляем перегон
    MWHaul *haul0073 = [[MWHaul alloc] init];
    haul0073.identifier = @"haul0073";
    haul0073.length = 1714;
    [edge0022.elements addObject:haul0073];

    MWDrawLine *drawLine0088 = [[MWDrawLine alloc] init];
    drawLine0088.startPoint = CGPointMake(3429, 1143);
    drawLine0088.endPoint = CGPointMake(3538.5, 1143);
    drawLine0088.width = 16;
    drawLine0088.color = line0005.color;
    [haul0073.drawPrimitives addObject:drawLine0088];

    // Добавлям станцию Lake
    MWStation *station0071 = [[MWStation alloc] init];
    station0071.identifier = @"station0071";
    [edge0022.elements addObject:station0071];
    
    station0071.nameOriginal = @"Lake";
    station0071.mapLocation = CGPointMake(3538.5, 1143);
    station0071.geoLocation = CGPointMake(34.151829, -118.131388);

    MWDrawFillCircle *fillCircle0117 = [[MWDrawFillCircle alloc] init];
    fillCircle0117.center = station0071.mapLocation;
    fillCircle0117.radius = 20;
    fillCircle0117.fillColor = [UIColor whiteColor];
    [station0071.drawPrimitives addObject:fillCircle0117];
    
    MWDrawFillCircle *fillCircle0118 = [[MWDrawFillCircle alloc] init];
    fillCircle0118.center = station0071.mapLocation;
    fillCircle0118.radius = 15;
    fillCircle0118.fillColor = line0005.color;
    [station0071.drawPrimitives addObject:fillCircle0118];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = station0071.nameOriginal;
    drawTextLine0079.radians = 315 * M_PI / 180;
    drawTextLine0079.fontName = @"HelveticaNeue";
    drawTextLine0079.fontColor = [UIColor blackColor];
    drawTextLine0079.fontSize = 38;
    drawTextLine0079.kernSpacing = -1.1;
    drawTextLine0079.origin = CGPointMake(3514, 1085);
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0079];

    // Добавляем перегон
    MWHaul *haul0074 = [[MWHaul alloc] init];
    haul0074.identifier = @"haul0074";
    haul0074.length = 1619;
    [edge0022.elements addObject:haul0074];

    MWDrawLine *drawLine0089 = [[MWDrawLine alloc] init];
    drawLine0089.startPoint = CGPointMake(3538, 1143);
    drawLine0089.endPoint = CGPointMake(3647.5, 1143);
    drawLine0089.width = 16;
    drawLine0089.color = line0005.color;
    [haul0074.drawPrimitives addObject:drawLine0089];

    // Добавлям станцию Allen
    MWStation *station0072 = [[MWStation alloc] init];
    station0072.identifier = @"station0072";
    [edge0022.elements addObject:station0072];
    
    station0072.nameOriginal = @"Allen";
    station0072.mapLocation = CGPointMake(3647.5, 1143);
    station0072.geoLocation = CGPointMake(34.152413, -118.113864);

    MWDrawFillCircle *fillCircle0119 = [[MWDrawFillCircle alloc] init];
    fillCircle0119.center = station0072.mapLocation;
    fillCircle0119.radius = 20;
    fillCircle0119.fillColor = [UIColor whiteColor];
    [station0072.drawPrimitives addObject:fillCircle0119];
    
    MWDrawFillCircle *fillCircle0120 = [[MWDrawFillCircle alloc] init];
    fillCircle0120.center = station0072.mapLocation;
    fillCircle0120.radius = 15;
    fillCircle0120.fillColor = line0005.color;
    [station0072.drawPrimitives addObject:fillCircle0120];

    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = station0072.nameOriginal;
    drawTextLine0080.radians = 315 * M_PI / 180;
    drawTextLine0080.fontName = @"HelveticaNeue";
    drawTextLine0080.fontColor = [UIColor blackColor];
    drawTextLine0080.fontSize = 38;
    drawTextLine0080.kernSpacing = 0.4;
    drawTextLine0080.origin = CGPointMake(3623, 1085);
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0080];

    // Добавляем перегон
    MWHaul *haul0075 = [[MWHaul alloc] init];
    haul0075.identifier = @"haul0075";
    haul0075.length = 3164;
    [edge0022.elements addObject:haul0075];

    MWDrawLine *drawLine0090 = [[MWDrawLine alloc] init];
    drawLine0090.startPoint = CGPointMake(3647, 1143);
    drawLine0090.endPoint = CGPointMake(3756, 1143);
    drawLine0090.width = 16;
    drawLine0090.color = line0005.color;
    [haul0075.drawPrimitives addObject:drawLine0090];

    // Добавлям станцию Sierra Madre Villa
    MWStation *station0073 = [[MWStation alloc] init];
    station0073.identifier = @"station0073";
    [edge0022.elements addObject:station0073];
    
    station0073.nameOriginal = @"Sierra Madre Villa";
    station0073.mapLocation = CGPointMake(3756, 1143);
    station0073.geoLocation = CGPointMake(34.147754, -118.081430);

    MWDrawFillCircle *fillCircle0121 = [[MWDrawFillCircle alloc] init];
    fillCircle0121.center = station0073.mapLocation;
    fillCircle0121.radius = 20;
    fillCircle0121.fillColor = [UIColor whiteColor];
    [station0073.drawPrimitives addObject:fillCircle0121];
    
    MWDrawFillCircle *fillCircle0122 = [[MWDrawFillCircle alloc] init];
    fillCircle0122.center = station0073.mapLocation;
    fillCircle0122.radius = 15;
    fillCircle0122.fillColor = line0005.color;
    [station0073.drawPrimitives addObject:fillCircle0122];

    MWDrawTextLine *drawTextLine0081 = [[MWDrawTextLine alloc] init];
    drawTextLine0081.text = station0073.nameOriginal;
    drawTextLine0081.radians = 315 * M_PI / 180;
    drawTextLine0081.fontName = @"HelveticaNeue";
    drawTextLine0081.fontColor = [UIColor blackColor];
    drawTextLine0081.fontSize = 38;
    drawTextLine0081.kernSpacing = -0.4;
    drawTextLine0081.origin = CGPointMake(3731, 1085);
    [station0073.nameOriginalTextPrimitives addObject:drawTextLine0081];

    // Добавляем вершину
    edge0022.finishVertex = vertex0017;
    
    ////////////////////////////////////////////////////////////////
    // 6. Expo Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Culver City - Pico
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0023 = [[MWEdge alloc] init];
    edge0023.identifier = @"edge0023";
    edge0023.developmentName = @"Участок Culver City - Pico";
    [self.edges addObject:edge0023];
    
    // Добавляем линию
    edge0023.line = line0006;
    
    // Добавляем вершину
    edge0023.startVertex = vertex0018;
    
    // Добавлям станцию Culver City
    MWStation *station0074 = [[MWStation alloc] init];
    station0074.identifier = @"station0074";
    [edge0023.elements addObject:station0074];
    
    station0074.nameOriginal = @"Culver City";
    station0074.mapLocation = CGPointMake(1319, 2392.5);
    station0074.geoLocation = CGPointMake(34.027884, -118.388843);

    MWDrawFillCircle *fillCircle0123 = [[MWDrawFillCircle alloc] init];
    fillCircle0123.center = station0074.mapLocation;
    fillCircle0123.radius = 20;
    fillCircle0123.fillColor = [UIColor whiteColor];
    [station0074.drawPrimitives addObject:fillCircle0123];
    
    MWDrawFillCircle *fillCircle0124 = [[MWDrawFillCircle alloc] init];
    fillCircle0124.center = station0074.mapLocation;
    fillCircle0124.radius = 15;
    fillCircle0124.fillColor = line0006.color;
    [station0074.drawPrimitives addObject:fillCircle0124];

    MWDrawTextLine *drawTextLine0082 = [[MWDrawTextLine alloc] init];
    drawTextLine0082.text = station0074.nameOriginal;
    drawTextLine0082.radians = 315 * M_PI / 180;
    drawTextLine0082.fontName = @"HelveticaNeue";
    drawTextLine0082.fontColor = [UIColor blackColor];
    drawTextLine0082.fontSize = 38;
    drawTextLine0082.kernSpacing = -0.4;
    drawTextLine0082.origin = CGPointMake(1175.5, 2545.5);
    [station0074.nameOriginalTextPrimitives addObject:drawTextLine0082];

    // Добавляем перегон
    MWHaul *haul0076 = [[MWHaul alloc] init];
    haul0076.identifier = @"haul0076";
    haul0076.length = 1556;
    [edge0023.elements addObject:haul0076];

    MWDrawLine *drawLine0091 = [[MWDrawLine alloc] init];
    drawLine0091.startPoint = CGPointMake(1319, 2392.5);
    drawLine0091.endPoint = CGPointMake(1417.5, 2392.5);
    drawLine0091.width = 16;
    drawLine0091.color = line0006.color;
    [haul0076.drawPrimitives addObject:drawLine0091];

    // Добавлям станцию La Cienega/Jefferson
    MWStation *station0075 = [[MWStation alloc] init];
    station0075.identifier = @"station0075";
    [edge0023.elements addObject:station0075];
    
    station0075.nameOriginal = @"La Cienega/Jefferson";
    station0075.mapLocation = CGPointMake(1417.5, 2392.5);
    station0075.geoLocation = CGPointMake(34.026359, -118.372103);

    MWDrawFillCircle *fillCircle0125 = [[MWDrawFillCircle alloc] init];
    fillCircle0125.center = station0075.mapLocation;
    fillCircle0125.radius = 20;
    fillCircle0125.fillColor = [UIColor whiteColor];
    [station0075.drawPrimitives addObject:fillCircle0125];
    
    MWDrawFillCircle *fillCircle0126 = [[MWDrawFillCircle alloc] init];
    fillCircle0126.center = station0075.mapLocation;
    fillCircle0126.radius = 15;
    fillCircle0126.fillColor = line0006.color;
    [station0075.drawPrimitives addObject:fillCircle0126];

    MWDrawTextLine *drawTextLine0083 = [[MWDrawTextLine alloc] init];
    drawTextLine0083.text = station0075.nameOriginal;
    drawTextLine0083.radians = 315 * M_PI / 180;
    drawTextLine0083.fontName = @"HelveticaNeue";
    drawTextLine0083.fontColor = [UIColor blackColor];
    drawTextLine0083.fontSize = 38;
    drawTextLine0083.kernSpacing = -0.7;
    drawTextLine0083.origin = CGPointMake(1163, 2663);
    [station0075.nameOriginalTextPrimitives addObject:drawTextLine0083];

    // Добавляем перегон
    MWHaul *haul0077 = [[MWHaul alloc] init];
    haul0077.identifier = @"haul0077";
    haul0077.length = 1576;
    [edge0023.elements addObject:haul0077];

    MWDrawLine *drawLine0092 = [[MWDrawLine alloc] init];
    drawLine0092.startPoint = CGPointMake(1417, 2392.5);
    drawLine0092.endPoint = CGPointMake(1515.5, 2392.5);
    drawLine0092.width = 16;
    drawLine0092.color = line0006.color;
    [haul0077.drawPrimitives addObject:drawLine0092];

    // Добавлям станцию Expo/La Brea
    MWStation *station0076 = [[MWStation alloc] init];
    station0076.identifier = @"station0076";
    [edge0023.elements addObject:station0076];
    
    station0076.nameOriginal = @"Expo/La Brea";
    station0076.mapLocation = CGPointMake(1515.5, 2392.5);
    station0076.geoLocation = CGPointMake(34.024817, -118.355167);
    
    MWDrawFillCircle *fillCircle0127 = [[MWDrawFillCircle alloc] init];
    fillCircle0127.center = station0076.mapLocation;
    fillCircle0127.radius = 20.5;
    fillCircle0127.fillColor = [UIColor blackColor];
    [station0076.drawPrimitives addObject:fillCircle0127];
    
    MWDrawFillCircle *fillCircle0128 = [[MWDrawFillCircle alloc] init];
    fillCircle0128.center = station0076.mapLocation;
    fillCircle0128.radius = 15;
    fillCircle0128.fillColor = [UIColor whiteColor];
    [station0076.drawPrimitives addObject:fillCircle0128];

    MWDrawTextLine *drawTextLine0084 = [[MWDrawTextLine alloc] init];
    drawTextLine0084.text = station0076.nameOriginal;
    drawTextLine0084.radians = 315 * M_PI / 180;
    drawTextLine0084.fontName = @"HelveticaNeue";
    drawTextLine0084.fontColor = [UIColor blackColor];
    drawTextLine0084.fontSize = 38;
    drawTextLine0084.kernSpacing = -1.0;
    drawTextLine0084.origin = CGPointMake(1356, 2568);
    [station0076.nameOriginalTextPrimitives addObject:drawTextLine0084];

    // Добавляем перегон
    MWHaul *haul0078 = [[MWHaul alloc] init];
    haul0078.identifier = @"haul0078";
    haul0078.length = 843;
    [edge0023.elements addObject:haul0078];

    MWDrawLine *drawLine0093 = [[MWDrawLine alloc] init];
    drawLine0093.startPoint = CGPointMake(1515, 2392.5);
    drawLine0093.endPoint = CGPointMake(1614, 2392.5);
    drawLine0093.width = 16;
    drawLine0093.color = line0006.color;
    [haul0078.drawPrimitives addObject:drawLine0093];

    // Добавлям станцию Farmdale
    MWStation *station0077 = [[MWStation alloc] init];
    station0077.identifier = @"station0077";
    [edge0023.elements addObject:station0077];
    
    station0077.nameOriginal = @"Farmdale";
    station0077.mapLocation = CGPointMake(1614, 2392.5);
    station0077.geoLocation = CGPointMake(34.023937, -118.346063);

    MWDrawFillCircle *fillCircle0129 = [[MWDrawFillCircle alloc] init];
    fillCircle0129.center = station0077.mapLocation;
    fillCircle0129.radius = 20;
    fillCircle0129.fillColor = [UIColor whiteColor];
    [station0077.drawPrimitives addObject:fillCircle0129];
    
    MWDrawFillCircle *fillCircle0130 = [[MWDrawFillCircle alloc] init];
    fillCircle0130.center = station0077.mapLocation;
    fillCircle0130.radius = 15;
    fillCircle0130.fillColor = line0006.color;
    [station0077.drawPrimitives addObject:fillCircle0130];

    MWDrawTextLine *drawTextLine0085 = [[MWDrawTextLine alloc] init];
    drawTextLine0085.text = station0077.nameOriginal;
    drawTextLine0085.radians = 315 * M_PI / 180;
    drawTextLine0085.fontName = @"HelveticaNeue";
    drawTextLine0085.fontColor = [UIColor blackColor];
    drawTextLine0085.fontSize = 38;
    drawTextLine0085.kernSpacing = -0.3;
    drawTextLine0085.origin = CGPointMake(1491, 2527);
    [station0077.nameOriginalTextPrimitives addObject:drawTextLine0085];

    // Добавляем перегон
    MWHaul *haul0079 = [[MWHaul alloc] init];
    haul0079.identifier = @"haul0079";
    haul0079.length = 1030;
    [edge0023.elements addObject:haul0079];

    MWDrawLine *drawLine0094 = [[MWDrawLine alloc] init];
    drawLine0094.startPoint = CGPointMake(1613.5, 2392.5);
    drawLine0094.endPoint = CGPointMake(1712, 2392.5);
    drawLine0094.width = 16;
    drawLine0094.color = line0006.color;
    [haul0079.drawPrimitives addObject:drawLine0094];

    // Добавлям станцию Expo/Crenshaw
    MWStation *station0078 = [[MWStation alloc] init];
    station0078.identifier = @"station0078";
    [edge0023.elements addObject:station0078];
    
    station0078.nameOriginal = @"Expo/Crenshaw";
    station0078.mapLocation = CGPointMake(1712, 2392.5);
    station0078.geoLocation = CGPointMake(34.022545, -118.335080);

    MWDrawFillCircle *fillCircle0131 = [[MWDrawFillCircle alloc] init];
    fillCircle0131.center = station0078.mapLocation;
    fillCircle0131.radius = 20;
    fillCircle0131.fillColor = [UIColor whiteColor];
    [station0078.drawPrimitives addObject:fillCircle0131];
    
    MWDrawFillCircle *fillCircle0132 = [[MWDrawFillCircle alloc] init];
    fillCircle0132.center = station0078.mapLocation;
    fillCircle0132.radius = 15;
    fillCircle0132.fillColor = line0006.color;
    [station0078.drawPrimitives addObject:fillCircle0132];

    MWDrawTextLine *drawTextLine0086 = [[MWDrawTextLine alloc] init];
    drawTextLine0086.text = station0078.nameOriginal;
    drawTextLine0086.radians = 315 * M_PI / 180;
    drawTextLine0086.fontName = @"HelveticaNeue";
    drawTextLine0086.fontColor = [UIColor blackColor];
    drawTextLine0086.fontSize = 38;
    drawTextLine0086.kernSpacing = -0.7;
    drawTextLine0086.origin = CGPointMake(1518, 2601);
    [station0078.nameOriginalTextPrimitives addObject:drawTextLine0086];

    // Добавляем перегон
    MWHaul *haul0080 = [[MWHaul alloc] init];
    haul0080.length = 2475;
    haul0080.identifier = @"haul0080";
    [edge0023.elements addObject:haul0080];

    MWDrawLine *drawLine0095 = [[MWDrawLine alloc] init];
    drawLine0095.startPoint = CGPointMake(1711.5, 2392.5);
    drawLine0095.endPoint = CGPointMake(1810, 2392.5);
    drawLine0095.width = 16;
    drawLine0095.color = line0006.color;
    [haul0080.drawPrimitives addObject:drawLine0095];

    // Добавлям станцию Expo/Western
    MWStation *station0079 = [[MWStation alloc] init];
    station0079.identifier = @"station0079";
    [edge0023.elements addObject:station0079];
    
    station0079.nameOriginal = @"Expo/Western";
    station0079.mapLocation = CGPointMake(1810.5, 2392.5);
    station0079.geoLocation = CGPointMake(34.018344, -118.308904);

    MWDrawFillCircle *fillCircle0133 = [[MWDrawFillCircle alloc] init];
    fillCircle0133.center = station0079.mapLocation;
    fillCircle0133.radius = 20;
    fillCircle0133.fillColor = [UIColor whiteColor];
    [station0079.drawPrimitives addObject:fillCircle0133];
    
    MWDrawFillCircle *fillCircle0134 = [[MWDrawFillCircle alloc] init];
    fillCircle0134.center = station0079.mapLocation;
    fillCircle0134.radius = 15;
    fillCircle0134.fillColor = line0006.color;
    [station0079.drawPrimitives addObject:fillCircle0134];

    MWDrawTextLine *drawTextLine0087 = [[MWDrawTextLine alloc] init];
    drawTextLine0087.text = station0079.nameOriginal;
    drawTextLine0087.radians = 315 * M_PI / 180;
    drawTextLine0087.fontName = @"HelveticaNeue";
    drawTextLine0087.fontColor = [UIColor blackColor];
    drawTextLine0087.fontSize = 38;
    drawTextLine0087.kernSpacing = -0.4;
    drawTextLine0087.origin = CGPointMake(1632, 2580);
    [station0079.nameOriginalTextPrimitives addObject:drawTextLine0087];

    // Добавляем перегон
    MWHaul *haul0081 = [[MWHaul alloc] init];
    haul0081.identifier = @"haul0081";
    haul0081.length = 1605;
    [edge0023.elements addObject:haul0081];

    MWDrawLine *drawLine0096 = [[MWDrawLine alloc] init];
    drawLine0096.startPoint = CGPointMake(1809.5, 2392.5);
    drawLine0096.endPoint = CGPointMake(1909, 2392.5);
    drawLine0096.width = 16;
    drawLine0096.color = line0006.color;
    [haul0081.drawPrimitives addObject:drawLine0096];

    // Добавлям станцию Expo/Vermont
    MWStation *station0080 = [[MWStation alloc] init];
    station0080.identifier = @"station0080";
    [edge0023.elements addObject:station0080];
    
    station0080.nameOriginal = @"Expo/Vermont";
    station0080.mapLocation = CGPointMake(1909, 2392.5);
    station0080.geoLocation = CGPointMake(34.018258, -118.291540);

    MWDrawFillCircle *fillCircle0135 = [[MWDrawFillCircle alloc] init];
    fillCircle0135.center = station0080.mapLocation;
    fillCircle0135.radius = 20;
    fillCircle0135.fillColor = [UIColor whiteColor];
    [station0080.drawPrimitives addObject:fillCircle0135];
    
    MWDrawFillCircle *fillCircle0136 = [[MWDrawFillCircle alloc] init];
    fillCircle0136.center = station0080.mapLocation;
    fillCircle0136.radius = 15;
    fillCircle0136.fillColor = line0006.color;
    [station0080.drawPrimitives addObject:fillCircle0136];

    MWDrawTextLine *drawTextLine0088 = [[MWDrawTextLine alloc] init];
    drawTextLine0088.text = station0080.nameOriginal;
    drawTextLine0088.radians = 315 * M_PI / 180;
    drawTextLine0088.fontName = @"HelveticaNeue";
    drawTextLine0088.fontColor = [UIColor blackColor];
    drawTextLine0088.fontSize = 38;
    drawTextLine0088.kernSpacing = 0.1;
    drawTextLine0088.origin = CGPointMake(1729, 2588);
    [station0080.nameOriginalTextPrimitives addObject:drawTextLine0088];

    // Добавляем перегон
    MWHaul *haul0082 = [[MWHaul alloc] init];
    haul0082.identifier = @"haul0082";
    haul0082.length = 537;
    [edge0023.elements addObject:haul0082];

    MWDrawLine *drawLine0097 = [[MWDrawLine alloc] init];
    drawLine0097.startPoint = CGPointMake(1908.5, 2392.5);
    drawLine0097.endPoint = CGPointMake(2007, 2392.5);
    drawLine0097.width = 16;
    drawLine0097.color = line0006.color;
    [haul0082.drawPrimitives addObject:drawLine0097];

    // Добавлям станцию Expo Park/USC
    MWStation *station0081 = [[MWStation alloc] init];
    station0081.identifier = @"station0081";
    [edge0023.elements addObject:station0081];
    
    station0081.nameOriginal = @"Expo Park/USC";
    station0081.mapLocation = CGPointMake(2007, 2392.5);
    station0081.geoLocation = CGPointMake(34.018239, -118.285729);

    MWDrawFillCircle *fillCircle0137 = [[MWDrawFillCircle alloc] init];
    fillCircle0137.center = station0081.mapLocation;
    fillCircle0137.radius = 20;
    fillCircle0137.fillColor = [UIColor whiteColor];
    [station0081.drawPrimitives addObject:fillCircle0137];
    
    MWDrawFillCircle *fillCircle0138 = [[MWDrawFillCircle alloc] init];
    fillCircle0138.center = station0081.mapLocation;
    fillCircle0138.radius = 15;
    fillCircle0138.fillColor = line0006.color;
    [station0081.drawPrimitives addObject:fillCircle0138];

    MWDrawTextLine *drawTextLine0089 = [[MWDrawTextLine alloc] init];
    drawTextLine0089.text = station0081.nameOriginal;
    drawTextLine0089.radians = 315 * M_PI / 180;
    drawTextLine0089.fontName = @"HelveticaNeue";
    drawTextLine0089.fontColor = [UIColor blackColor];
    drawTextLine0089.fontSize = 38;
    drawTextLine0089.kernSpacing = -1.2;
    drawTextLine0089.origin = CGPointMake(1824, 2594);
    [station0081.nameOriginalTextPrimitives addObject:drawTextLine0089];

    // Добавляем перегон
    MWHaul *haul0083 = [[MWHaul alloc] init];
    haul0083.identifier = @"haul0083";
    haul0083.length = 949;
    [edge0023.elements addObject:haul0083];

    MWDrawLine *drawLine0098 = [[MWDrawLine alloc] init];
    drawLine0098.startPoint = CGPointMake(2006.5, 2392.5);
    drawLine0098.endPoint = CGPointMake(2018, 2392.5);
    drawLine0098.width = 16;
    drawLine0098.color = line0006.color;
    [haul0083.drawPrimitives addObject:drawLine0098];

    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(2017.5, 2332.5);
    drawArc0021.startRadians = 45 * M_PI / 180;
    drawArc0021.endRadians = 90 * M_PI / 180;
    drawArc0021.radius = 60;
    drawArc0021.width = 16;
    drawArc0021.color = line0006.color;
    [haul0083.drawPrimitives addObject:drawArc0021];

    MWDrawLine *drawLine0154 = [[MWDrawLine alloc] init];
    drawLine0154.startPoint = CGPointMake(2059.5, 2375.5);
    drawLine0154.endPoint = CGPointMake(2113.5, 2321.5);
    drawLine0154.width = 20;
    drawLine0154.color = [UIColor whiteColor];
    [haul0083.drawPrimitives addObject:drawLine0154];

    MWDrawLine *drawLine0099 = [[MWDrawLine alloc] init];
    drawLine0099.startPoint = CGPointMake(2059, 2376);
    drawLine0099.endPoint = CGPointMake(2113.5, 2321.5);
    drawLine0099.width = 16;
    drawLine0099.color = line0006.color;
    [haul0083.drawPrimitives addObject:drawLine0099];

    // Добавлям станцию Jefferson/USC
    MWStation *station0082 = [[MWStation alloc] init];
    station0082.identifier = @"station0082";
    [edge0023.elements addObject:station0082];
    
    station0082.nameOriginal = @"Jefferson/USC";
    station0082.mapLocation = CGPointMake(2113.5, 2321.5);
    station0082.geoLocation = CGPointMake(34.022135, -118.278116);
    
    MWDrawFillCircle *fillCircle0139 = [[MWDrawFillCircle alloc] init];
    fillCircle0139.center = station0082.mapLocation;
    fillCircle0139.radius = 20;
    fillCircle0139.fillColor = [UIColor whiteColor];
    [station0082.drawPrimitives addObject:fillCircle0139];
    
    MWDrawFillCircle *fillCircle0140 = [[MWDrawFillCircle alloc] init];
    fillCircle0140.center = station0082.mapLocation;
    fillCircle0140.radius = 15;
    fillCircle0140.fillColor = line0006.color;
    [station0082.drawPrimitives addObject:fillCircle0140];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"Jefferson/";
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 38;
    drawTextLine0024.kernSpacing = -0.6;
    drawTextLine0024.origin = CGPointMake(2120, 2327);
    [station0082.nameOriginalTextPrimitives addObject:drawTextLine0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"USC";
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 38;
    drawTextLine0025.kernSpacing = -1.8;
    drawTextLine0025.origin = CGPointMake(2120, 2363);
    [station0082.nameOriginalTextPrimitives addObject:drawTextLine0025];

    // Добавляем перегон
    MWHaul *haul0084 = [[MWHaul alloc] init];
    haul0084.identifier = @"haul0084";
    haul0084.length = 884;
    [edge0023.elements addObject:haul0084];

    MWDrawLine *drawLine0100 = [[MWDrawLine alloc] init];
    drawLine0100.startPoint = CGPointMake(2113, 2322);
    drawLine0100.endPoint = CGPointMake(2204, 2226.5);
    drawLine0100.width = 16;
    drawLine0100.color = line0006.color;
    [haul0084.drawPrimitives addObject:drawLine0100];

    // Добавлям станцию 23rd St
    MWStation *station0083 = [[MWStation alloc] init];
    station0083.identifier = @"station0083";
    [edge0023.elements addObject:station0083];
    
    station0083.nameOriginal = @"23rd St";
    station0083.mapLocation = CGPointMake(2204, 2226.5);
    station0083.geoLocation = CGPointMake(34.029127, -118.273600);
    
    MWDrawFillCircle *fillCircle0141 = [[MWDrawFillCircle alloc] init];
    fillCircle0141.center = station0083.mapLocation;
    fillCircle0141.radius = 20;
    fillCircle0141.fillColor = [UIColor whiteColor];
    [station0083.drawPrimitives addObject:fillCircle0141];
    
    MWDrawFillCircle *fillCircle0142 = [[MWDrawFillCircle alloc] init];
    fillCircle0142.center = station0083.mapLocation;
    fillCircle0142.radius = 15;
    fillCircle0142.fillColor = line0006.color;
    [station0083.drawPrimitives addObject:fillCircle0142];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0083.nameOriginal;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 38;
    drawTextLine0026.kernSpacing = -1.5;
    drawTextLine0026.origin = CGPointMake(2200, 2245);
    [station0083.nameOriginalTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0085 = [[MWHaul alloc] init];
    haul0085.identifier = @"haul0085";
    haul0085.length = 1465;
    [edge0023.elements addObject:haul0085];

    MWDrawLine *drawLine0101 = [[MWDrawLine alloc] init];
    drawLine0101.startPoint = CGPointMake(2203.5, 2227);
    drawLine0101.endPoint = CGPointMake(2306, 2124.5);
    drawLine0101.width = 16;
    drawLine0101.color = line0006.color;
    [haul0085.drawPrimitives addObject:drawLine0101];

    // Добавлям станцию Pico
    MWStation *station0119 = [[MWStation alloc] init];
    station0119.identifier = @"station0119";
    [edge0023.elements addObject:station0119];
    
    station0119.nameOriginal = @"Pico";
    station0119.mapLocation = CGPointMake(2305.5, 2125.5);
    station0119.geoLocation = CGPointMake(34.040723, -118.266115);
    
    MWDrawFillCircle *fillCircle0182 = [[MWDrawFillCircle alloc] init];
    fillCircle0182.center = station0119.mapLocation;
    fillCircle0182.radius = 4;
    fillCircle0182.fillColor = [UIColor whiteColor];
    [station0119.drawPrimitives addObject:fillCircle0182];
    
    station0119.showNameOnMap = NO;
    [station0119.nameOriginalTextPrimitives addObject:drawTextLine0004];
    
    // Добавляем вершину
    edge0023.finishVertex = vertex0004;

    // Создаем участок линии Pico - 7th St/Metro Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0024 = [[MWEdge alloc] init];
    edge0024.identifier = @"edge0024";
    edge0024.developmentName = @"Участок Pico - 7th St/Metro Ctr";
    [self.edges addObject:edge0024];
    
    // Добавляем линию
    edge0024.line = line0006;
    
    // Добавляем вершину
    edge0024.startVertex = vertex0004;
    
    // Добавлям станцию Pico
    [edge0024.elements addObject:station0119];
    
    // Добавляем перегон
    MWHaul *haul0086 = [[MWHaul alloc] init];
    haul0086.identifier = @"haul0086";
    haul0086.length = 1118;
    [edge0024.elements addObject:haul0086];

    MWDrawLine *drawLine0102 = [[MWDrawLine alloc] init];
    drawLine0102.startPoint = CGPointMake(2305.5, 2125);
    drawLine0102.endPoint = CGPointMake(2423, 2007.5);
    drawLine0102.width = 16;
    drawLine0102.color = line0006.color;
    [haul0086.drawPrimitives addObject:drawLine0102];

    // Добавлям станцию 7th St/Metro Center
    MWStation *station0120 = [[MWStation alloc] init];
    station0120.identifier = @"station0120";
    [edge0024.elements addObject:station0120];
    
    station0120.nameOriginal = @"7th St/Metro Center";
    station0120.mapLocation = CGPointMake(2422.5, 2005);
    station0120.geoLocation = CGPointMake(34.048724, -118.258762);

    station0120.showNameOnMap = NO;
    [station0120.nameOriginalTextPrimitives addObject:drawTextLine0005];
    
    // Добавляем вершину
    edge0024.finishVertex = vertex0005;

    ////////////////////////////////////////////////////////////////
    // 7. Metro Orange Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Chatsworth - Canoga (верхняя)
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0025 = [[MWEdge alloc] init];
    edge0025.identifier = @"edge0025";
    edge0025.developmentName = @"Участок Chatsworth - Canoga (верхняя)";
    [self.edges addObject:edge0025];
    
    // Добавляем линию
    edge0025.line = line0007;
    
    // Добавляем вершину
    edge0025.startVertex = vertex0019;
    
    // Добавлям станцию Chatsworth
    MWStation *station0084 = [[MWStation alloc] init];
    station0084.identifier = @"station0084";
    [edge0025.elements addObject:station0084];
    
    station0084.nameOriginal = @"Chatsworth";
    station0084.mapLocation = CGPointMake(475, 597.5);
    station0084.geoLocation = CGPointMake(34.252081, -118.599328);

    MWDrawLine *drawLine0103 = [[MWDrawLine alloc] init];
    drawLine0103.startPoint = CGPointMake(475, 578.5);
    drawLine0103.endPoint = CGPointMake(475, 617.5);
    drawLine0103.width = 40;
    drawLine0103.color = [UIColor blackColor];
    [station0084.drawPrimitives addObject:drawLine0103];

    MWDrawLine *drawLine0104 = [[MWDrawLine alloc] init];
    drawLine0104.startPoint = CGPointMake(475, 583);
    drawLine0104.endPoint = CGPointMake(475, 612);
    drawLine0104.width = 29.25;
    drawLine0104.color = [UIColor whiteColor];
    [station0084.drawPrimitives addObject:drawLine0104];

    MWDrawTextLine *drawTextLine0090 = [[MWDrawTextLine alloc] init];
    drawTextLine0090.text = station0084.nameOriginal;
    drawTextLine0090.radians = 315 * M_PI / 180;
    drawTextLine0090.fontName = @"HelveticaNeue";
    drawTextLine0090.fontColor = [UIColor blackColor];
    drawTextLine0090.fontSize = 38;
    drawTextLine0090.kernSpacing = -0.2;
    drawTextLine0090.origin = CGPointMake(286, 744);
    [station0084.nameOriginalTextPrimitives addObject:drawTextLine0090];

    // Добавляем перегон
    MWHaul *haul0087 = [[MWHaul alloc] init];
    haul0087.identifier = @"haul0087";
    haul0087.length = 1891;
    [edge0025.elements addObject:haul0087];

    MWDrawLine *drawLine0105 = [[MWDrawLine alloc] init];
    drawLine0105.startPoint = CGPointMake(475, 597.5);
    drawLine0105.endPoint = CGPointMake(475, 699);
    drawLine0105.width = 16;
    drawLine0105.color = line0007.color;
    [haul0087.drawPrimitives addObject:drawLine0105];

    // Добавлям станцию Nordhoff
    MWStation *station0085 = [[MWStation alloc] init];
    station0085.identifier = @"station0085";
    [edge0025.elements addObject:station0085];
    
    station0085.nameOriginal = @"Nordhoff";
    station0085.mapLocation = CGPointMake(475, 719.5);
    station0085.geoLocation = CGPointMake(34.234699, -118.597329);

    MWDrawLine *drawLine0106 = [[MWDrawLine alloc] init];
    drawLine0106.startPoint = CGPointMake(475, 704);
    drawLine0106.endPoint = CGPointMake(475, 735);
    drawLine0106.width = 31;
    drawLine0106.color = line0007.color;
    [station0085.drawPrimitives addObject:drawLine0106];

    MWDrawTextLine *drawTextLine0091 = [[MWDrawTextLine alloc] init];
    drawTextLine0091.text = station0085.nameOriginal;
    drawTextLine0091.radians = 315 * M_PI / 180;
    drawTextLine0091.fontName = @"HelveticaNeue";
    drawTextLine0091.fontColor = [UIColor blackColor];
    drawTextLine0091.fontSize = 38;
    drawTextLine0091.kernSpacing = 0.6;
    drawTextLine0091.origin = CGPointMake(317, 817);
    [station0085.nameOriginalTextPrimitives addObject:drawTextLine0091];

    // Добавляем перегон
    MWHaul *haul0088 = [[MWHaul alloc] init];
    haul0088.identifier = @"haul0088";
    haul0088.length = 1735;
    [edge0025.elements addObject:haul0088];

    MWDrawLine *drawLine0107 = [[MWDrawLine alloc] init];
    drawLine0107.startPoint = CGPointMake(475, 740);
    drawLine0107.endPoint = CGPointMake(475, 821);
    drawLine0107.width = 16;
    drawLine0107.color = line0007.color;
    [haul0088.drawPrimitives addObject:drawLine0107];

    // Добавлям станцию Roscoe
    MWStation *station0086 = [[MWStation alloc] init];
    station0086.identifier = @"station0086";
    [edge0025.elements addObject:station0086];
    
    station0086.nameOriginal = @"Roscoe";
    station0086.mapLocation = CGPointMake(475, 841.5);
    station0086.geoLocation = CGPointMake(34.219058, -118.597289);

    MWDrawLine *drawLine0108 = [[MWDrawLine alloc] init];
    drawLine0108.startPoint = CGPointMake(475, 826);
    drawLine0108.endPoint = CGPointMake(475, 857);
    drawLine0108.width = 31;
    drawLine0108.color = line0007.color;
    [station0086.drawPrimitives addObject:drawLine0108];

    MWDrawTextLine *drawTextLine0092 = [[MWDrawTextLine alloc] init];
    drawTextLine0092.text = station0086.nameOriginal;
    drawTextLine0092.radians = 315 * M_PI / 180;
    drawTextLine0092.fontName = @"HelveticaNeue";
    drawTextLine0092.fontColor = [UIColor blackColor];
    drawTextLine0092.fontSize = 38;
    drawTextLine0092.kernSpacing = -1.6;
    drawTextLine0092.origin = CGPointMake(340, 913);
    [station0086.nameOriginalTextPrimitives addObject:drawTextLine0092];

    // Добавляем перегон
    MWHaul *haul0089 = [[MWHaul alloc] init];
    haul0089.identifier = @"haul0089";
    haul0089.length = 2083;
    [edge0025.elements addObject:haul0089];

    MWDrawLine *drawLine0109 = [[MWDrawLine alloc] init];
    drawLine0109.startPoint = CGPointMake(475, 862);
    drawLine0109.endPoint = CGPointMake(475, 943);
    drawLine0109.width = 16;
    drawLine0109.color = line0007.color;
    [haul0089.drawPrimitives addObject:drawLine0109];

    // Добавлям станцию Sherman Way
    MWStation *station0087 = [[MWStation alloc] init];
    station0087.identifier = @"station0087";
    [edge0025.elements addObject:station0087];
    
    station0087.nameOriginal = @"Sherman Way";
    station0087.mapLocation = CGPointMake(475, 963);
    station0087.geoLocation = CGPointMake(34.200287, -118.597204);

    MWDrawLine *drawLine0110 = [[MWDrawLine alloc] init];
    drawLine0110.startPoint = CGPointMake(475, 948);
    drawLine0110.endPoint = CGPointMake(475, 979);
    drawLine0110.width = 31;
    drawLine0110.color = line0007.color;
    [station0087.drawPrimitives addObject:drawLine0110];

    MWDrawTextLine *drawTextLine0093 = [[MWDrawTextLine alloc] init];
    drawTextLine0093.text = @"Sherman";
    drawTextLine0093.radians = 315 * M_PI / 180;
    drawTextLine0093.fontName = @"HelveticaNeue";
    drawTextLine0093.fontColor = [UIColor blackColor];
    drawTextLine0093.fontSize = 38;
    drawTextLine0093.kernSpacing = -0.0;
    drawTextLine0093.origin = CGPointMake(493, 943);
    [station0087.nameOriginalTextPrimitives addObject:drawTextLine0093];

    MWDrawTextLine *drawTextLine0094 = [[MWDrawTextLine alloc] init];
    drawTextLine0094.text = @"Way";
    drawTextLine0094.radians = 315 * M_PI / 180;
    drawTextLine0094.fontName = @"HelveticaNeue";
    drawTextLine0094.fontColor = [UIColor blackColor];
    drawTextLine0094.fontSize = 38;
    drawTextLine0094.kernSpacing = -0.0;
    drawTextLine0094.origin = CGPointMake(523, 971);
    [station0087.nameOriginalTextPrimitives addObject:drawTextLine0094];

    // Добавляем перегон
    MWHaul *haul0090 = [[MWHaul alloc] init];
    haul0090.identifier = @"haul0090";
    haul0090.length = 1030;
    [edge0025.elements addObject:haul0090];

    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(535, 984);
    drawArc0022.startRadians = 135 * M_PI / 180;
    drawArc0022.endRadians = 180 * M_PI / 180;
    drawArc0022.radius = 60;
    drawArc0022.width = 16;
    drawArc0022.color = line0007.color;
    [haul0090.drawPrimitives addObject:drawArc0022];

    MWDrawLine *drawLine0111 = [[MWDrawLine alloc] init];
    drawLine0111.startPoint = CGPointMake(491.5, 1025.5);
    drawLine0111.endPoint = CGPointMake(501.5, 1035.5);
    drawLine0111.width = 16;
    drawLine0111.color = line0007.color;
    [haul0090.drawPrimitives addObject:drawLine0111];

    // Добавлям станцию Canoga (верхняя)
    MWStation *station0088 = [[MWStation alloc] init];
    station0088.identifier = @"station0088";
    [edge0025.elements addObject:station0088];
    
    station0088.nameOriginal = @"Canoga";
    station0088.mapLocation = CGPointMake(516.5, 1049.5);
    station0088.geoLocation = CGPointMake(34.191161, -118.596297);
    
    MWDrawLine *drawLine0112 = [[MWDrawLine alloc] init];
    drawLine0112.startPoint = CGPointMake(505, 1039.5);
    drawLine0112.endPoint = CGPointMake(526, 1060.5);
    drawLine0112.width = 30;
    drawLine0112.color = line0007.color;
    [station0088.drawPrimitives addObject:drawLine0112];

    MWDrawTextLine *drawTextLine0095 = [[MWDrawTextLine alloc] init];
    drawTextLine0095.text = station0088.nameOriginal;
    drawTextLine0095.radians = 315 * M_PI / 180;
    drawTextLine0095.fontName = @"HelveticaNeue";
    drawTextLine0095.fontColor = [UIColor blackColor];
    drawTextLine0095.fontSize = 38;
    drawTextLine0095.kernSpacing = -0.6;
    drawTextLine0095.origin = CGPointMake(380, 1189);
    [station0088.nameOriginalTextPrimitives addObject:drawTextLine0095];

    // Добавляем вершину
    edge0025.finishVertex = vertex0021;

    // Создаем участок линии Warner Ctr - Canoga (нижняя)
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0026 = [[MWEdge alloc] init];
    edge0026.identifier = @"edge0026";
    edge0026.developmentName = @"Участок Warner Ctr - Canoga (нижняя)";
    [self.edges addObject:edge0026];
    
    // Добавляем линию
    edge0026.line = line0007;
    
    // Добавляем вершину
    edge0026.startVertex = vertex0020;
    
    // Добавлям станцию Warner Ctr
    MWStation *station0089 = [[MWStation alloc] init];
    station0089.identifier = @"station0089";
    [edge0026.elements addObject:station0089];
    
    station0089.nameOriginal = @"Warner Ctr";
    station0089.mapLocation = CGPointMake(384.5, 1085.5);
    station0089.geoLocation = CGPointMake(34.180449, -118.601379);
    
    MWDrawLine *drawLine0113 = [[MWDrawLine alloc] init];
    drawLine0113.startPoint = CGPointMake(368.5, 1085.5);
    drawLine0113.endPoint = CGPointMake(399.5, 1085.5);
    drawLine0113.width = 31;
    drawLine0113.color = line0007.color;
    [station0089.drawPrimitives addObject:drawLine0113];

    MWDrawTextLine *drawTextLine0096 = [[MWDrawTextLine alloc] init];
    drawTextLine0096.text = station0089.nameOriginal;
    drawTextLine0096.radians = 315 * M_PI / 180;
    drawTextLine0096.fontName = @"HelveticaNeue";
    drawTextLine0096.fontColor = [UIColor blackColor];
    drawTextLine0096.fontSize = 38;
    drawTextLine0096.kernSpacing = -0.6;
    drawTextLine0096.origin = CGPointMake(244, 1226);
    [station0089.nameOriginalTextPrimitives addObject:drawTextLine0096];

    // Добавляем перегон
    MWHaul *haul0091 = [[MWHaul alloc] init];
    haul0091.identifier = @"haul0091";
    haul0091.length = 1550;
    [edge0026.elements addObject:haul0091];
    
    MWDrawLine *drawLine0114 = [[MWDrawLine alloc] init];
    drawLine0114.startPoint = CGPointMake(404.5, 1085.5);
    drawLine0114.endPoint = CGPointMake(459.5, 1085.5);
    drawLine0114.width = 16;
    drawLine0114.color = line0007.color;
    [haul0091.drawPrimitives addObject:drawLine0114];
    
    // Добавлям станцию Canoga (нижняя)
    MWStation *station0090 = [[MWStation alloc] init];
    station0090.identifier = @"station0090";
    [edge0026.elements addObject:station0090];
    
    station0090.nameOriginal = @"Canoga";
    station0090.mapLocation = CGPointMake(480, 1085.5);
    station0090.geoLocation = CGPointMake(34.190475, -118.596473);

    MWDrawLine *drawLine0115 = [[MWDrawLine alloc] init];
    drawLine0115.startPoint = CGPointMake(464.5, 1085.5);
    drawLine0115.endPoint = CGPointMake(494.5, 1085.5);
    drawLine0115.width = 31;
    drawLine0115.color = line0007.color;
    [station0090.drawPrimitives addObject:drawLine0115];

    station0090.showNameOnMap = NO;
    [station0090.drawPrimitives addObject:drawTextLine0095];
    
    // Добавляем вершину
    edge0026.finishVertex = vertex0021;

    // Создаем участок линии Canoga (верхняя) - De Soto
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0027 = [[MWEdge alloc] init];
    edge0027.identifier = @"edge0027";
    edge0027.developmentName = @"Участок Canoga (верхняя) - De Soto";
    [self.edges addObject:edge0027];
    
    // Добавляем линию
    edge0027.line = line0007;
    
    // Добавляем вершину
    edge0027.startVertex = vertex0021;

    // Добавлям станцию Canoga (верхняя)
    [edge0027.elements addObject:station0088];

    // Добавляем перегон
    MWHaul *haul0092 = [[MWHaul alloc] init];
    haul0092.identifier = @"haul0092";
    haul0092.length = 747;
    [edge0027.elements addObject:haul0092];

    MWDrawLine *drawLine0116 = [[MWDrawLine alloc] init];
    drawLine0116.startPoint = CGPointMake(529.5, 1066);
    drawLine0116.endPoint = CGPointMake(533.5, 1070);
    drawLine0116.width = 16;
    drawLine0116.color = line0007.color;
    [haul0092.drawPrimitives addObject:drawLine0116];

    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(571, 1031);
    drawArc0023.startRadians = 90 * M_PI / 180;
    drawArc0023.endRadians = 135 * M_PI / 180;
    drawArc0023.radius = 54;
    drawArc0023.width = 16;
    drawArc0023.color = line0007.color;
    [haul0092.drawPrimitives addObject:drawArc0023];
    
    // Добавлям станцию De Soto
    MWStation *station0091 = [[MWStation alloc] init];
    station0091.identifier = @"station0091";
    [edge0027.elements addObject:station0091];
    
    station0091.nameOriginal = @"De Soto";
    station0091.mapLocation = CGPointMake(592.5, 1085.5);
    station0091.geoLocation = CGPointMake(34.188588, -118.587656);
 
    MWDrawLine *drawLine0117 = [[MWDrawLine alloc] init];
    drawLine0117.startPoint = CGPointMake(577.5, 1085.5);
    drawLine0117.endPoint = CGPointMake(607.5, 1085.5);
    drawLine0117.width = 31;
    drawLine0117.color = line0007.color;
    [station0091.drawPrimitives addObject:drawLine0117];
    
    MWDrawTextLine *drawTextLine0097 = [[MWDrawTextLine alloc] init];
    drawTextLine0097.text = station0091.nameOriginal;
    drawTextLine0097.radians = 315 * M_PI / 180;
    drawTextLine0097.fontName = @"HelveticaNeue";
    drawTextLine0097.fontColor = [UIColor blackColor];
    drawTextLine0097.fontSize = 38;
    drawTextLine0097.kernSpacing = -0.6;
    drawTextLine0097.origin = CGPointMake(566.5, 1027);
    [station0091.nameOriginalTextPrimitives addObject:drawTextLine0097];

    // Добавляем вершину
    edge0027.finishVertex = vertex0022;

    // Создаем участок линии Canoga (нижняя) - De Soto
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0028 = [[MWEdge alloc] init];
    edge0028.identifier = @"edge0028";
    edge0028.developmentName = @"Участок Canoga (нижняя) - De Soto";
    [self.edges addObject:edge0028];
    
    // Добавляем линию
    edge0028.line = line0007;
    
    // Добавляем вершину
    edge0028.startVertex = vertex0021;
    
    // Добавлям станцию Canoga (нижняя)
    [edge0028.elements addObject:station0090];
    
    // Добавляем перегон
    MWHaul *haul0093 = [[MWHaul alloc] init];
    haul0093.identifier = @"haul0093";
    haul0093.length = 870;
    [edge0028.elements addObject:haul0093];
    
    MWDrawLine *drawLine0118 = [[MWDrawLine alloc] init];
    drawLine0118.startPoint = CGPointMake(500, 1085.5);
    drawLine0118.endPoint = CGPointMake(571, 1085.5);
    drawLine0118.width = 16;
    drawLine0118.color = line0007.color;
    [haul0093.drawPrimitives addObject:drawLine0118];

    // Добавлям станцию De Soto
    [edge0028.elements addObject:station0091];
    
    // Добавляем вершину
    edge0028.finishVertex = vertex0022;

    // Создаем участок линии De Soto - North Hollywood
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0029 = [[MWEdge alloc] init];
    edge0029.identifier = @"edge0029";
    edge0029.developmentName = @"Участок De Soto - North Hollywood";
    [self.edges addObject:edge0029];

    // Добавляем линию
    edge0029.line = line0007;
    
    // Добавляем вершину
    edge0029.startVertex = vertex0022;

    // Добавлям станцию De Soto
    [edge0029.elements addObject:station0091];

    // Добавляем перегон
    MWHaul *haul0094 = [[MWHaul alloc] init];
    haul0094.identifier = @"haul0094";
    haul0094.length = 1643;
    [edge0029.elements addObject:haul0094];

    MWDrawLine *drawLine0119 = [[MWDrawLine alloc] init];
    drawLine0119.startPoint = CGPointMake(612.5, 1085.5);
    drawLine0119.endPoint = CGPointMake(678.5, 1085.5);
    drawLine0119.width = 16;
    drawLine0119.color = line0007.color;
    [haul0094.drawPrimitives addObject:drawLine0119];

    // Добавлям станцию Pierce College
    MWStation *station0092 = [[MWStation alloc] init];
    station0092.identifier = @"station0092";
    [edge0029.elements addObject:station0092];
    
    station0092.nameOriginal = @"Pierce College";
    station0092.mapLocation = CGPointMake(698.5, 1085.5);
    station0092.geoLocation = CGPointMake(34.186870, -118.570216);
    
    MWDrawLine *drawLine0120 = [[MWDrawLine alloc] init];
    drawLine0120.startPoint = CGPointMake(683.5, 1085.5);
    drawLine0120.endPoint = CGPointMake(714, 1085.5);
    drawLine0120.width = 31;
    drawLine0120.color = line0007.color;
    [station0092.drawPrimitives addObject:drawLine0120];

    MWDrawTextLine *drawTextLine0098 = [[MWDrawTextLine alloc] init];
    drawTextLine0098.text = station0092.nameOriginal;
    drawTextLine0098.radians = 315 * M_PI / 180;
    drawTextLine0098.fontName = @"HelveticaNeue";
    drawTextLine0098.fontColor = [UIColor blackColor];
    drawTextLine0098.fontSize = 38;
    drawTextLine0098.kernSpacing = -0.4;
    drawTextLine0098.origin = CGPointMake(673, 1028);
    [station0092.nameOriginalTextPrimitives addObject:drawTextLine0098];

    // Добавляем перегон
    MWHaul *haul0095 = [[MWHaul alloc] init];
    haul0095.identifier = @"haul0095";
    haul0095.length = 1742;
    [edge0029.elements addObject:haul0095];

    MWDrawLine *drawLine0121 = [[MWDrawLine alloc] init];
    drawLine0121.startPoint = CGPointMake(719, 1085.5);
    drawLine0121.endPoint = CGPointMake(785, 1085.5);
    drawLine0121.width = 16;
    drawLine0121.color = line0007.color;
    [haul0095.drawPrimitives addObject:drawLine0121];

    // Добавлям станцию Tampa
    MWStation *station0093 = [[MWStation alloc] init];
    station0093.identifier = @"station0093";
    [edge0029.elements addObject:station0093];
    
    station0093.nameOriginal = @"Tampa";
    station0093.mapLocation = CGPointMake(805.5, 1085.5);
    station0093.geoLocation = CGPointMake(34.180929, -118.552756);

    MWDrawLine *drawLine0122 = [[MWDrawLine alloc] init];
    drawLine0122.startPoint = CGPointMake(790, 1085.5);
    drawLine0122.endPoint = CGPointMake(821, 1085.5);
    drawLine0122.width = 31;
    drawLine0122.color = line0007.color;
    [station0093.drawPrimitives addObject:drawLine0122];

    MWDrawTextLine *drawTextLine0099 = [[MWDrawTextLine alloc] init];
    drawTextLine0099.text = station0093.nameOriginal;
    drawTextLine0099.radians = 315 * M_PI / 180;
    drawTextLine0099.fontName = @"HelveticaNeue";
    drawTextLine0099.fontColor = [UIColor blackColor];
    drawTextLine0099.fontSize = 38;
    drawTextLine0099.kernSpacing = -0.4;
    drawTextLine0099.origin = CGPointMake(779, 1029);
    [station0093.nameOriginalTextPrimitives addObject:drawTextLine0099];

    // Добавляем перегон
    MWHaul *haul0096 = [[MWHaul alloc] init];
    haul0096.identifier = @"haul0096";
    haul0096.length = 1621;
    [edge0029.elements addObject:haul0096];

    MWDrawLine *drawLine0123 = [[MWDrawLine alloc] init];
    drawLine0123.startPoint = CGPointMake(826, 1085.5);
    drawLine0123.endPoint = CGPointMake(892, 1085.5);
    drawLine0123.width = 16;
    drawLine0123.color = line0007.color;
    [haul0096.drawPrimitives addObject:drawLine0123];

    // Добавлям станцию Reseda
    MWStation *station0094 = [[MWStation alloc] init];
    station0094.identifier = @"station0094";
    [edge0029.elements addObject:station0094];
    
    station0094.nameOriginal = @"Reseda";
    station0094.mapLocation = CGPointMake(912.5, 1085.5);
    station0094.geoLocation = CGPointMake(34.180309, -118.535248);

    MWDrawLine *drawLine0124 = [[MWDrawLine alloc] init];
    drawLine0124.startPoint = CGPointMake(897, 1085.5);
    drawLine0124.endPoint = CGPointMake(928, 1085.5);
    drawLine0124.width = 31;
    drawLine0124.color = line0007.color;
    [station0094.drawPrimitives addObject:drawLine0124];

    MWDrawTextLine *drawTextLine0100 = [[MWDrawTextLine alloc] init];
    drawTextLine0100.text = station0094.nameOriginal;
    drawTextLine0100.radians = 315 * M_PI / 180;
    drawTextLine0100.fontName = @"HelveticaNeue";
    drawTextLine0100.fontColor = [UIColor blackColor];
    drawTextLine0100.fontSize = 38;
    drawTextLine0100.kernSpacing = -2.0;
    drawTextLine0100.origin = CGPointMake(887, 1028);
    [station0094.nameOriginalTextPrimitives addObject:drawTextLine0100];

    // Добавляем перегон
    MWHaul *haul0097 = [[MWHaul alloc] init];
    haul0097.identifier = @"haul0097";
    haul0097.length = 3492;
    [edge0029.elements addObject:haul0097];

    MWDrawLine *drawLine0125 = [[MWDrawLine alloc] init];
    drawLine0125.startPoint = CGPointMake(933, 1085.5);
    drawLine0125.endPoint = CGPointMake(999, 1085.5);
    drawLine0125.width = 16;
    drawLine0125.color = line0007.color;
    [haul0097.drawPrimitives addObject:drawLine0125];

    // Добавлям станцию Balboa
    MWStation *station0095 = [[MWStation alloc] init];
    station0095.identifier = @"station0095";
    [edge0029.elements addObject:station0095];
    
    station0095.nameOriginal = @"Balboa";
    station0095.mapLocation = CGPointMake(1019, 1085.5);
    station0095.geoLocation = CGPointMake(34.185840, -118.500330);

    MWDrawLine *drawLine0126 = [[MWDrawLine alloc] init];
    drawLine0126.startPoint = CGPointMake(1003.5, 1085.5);
    drawLine0126.endPoint = CGPointMake(1034.5, 1085.5);
    drawLine0126.width = 31;
    drawLine0126.color = line0007.color;
    [station0095.drawPrimitives addObject:drawLine0126];

    MWDrawTextLine *drawTextLine0101 = [[MWDrawTextLine alloc] init];
    drawTextLine0101.text = station0095.nameOriginal;
    drawTextLine0101.radians = 315 * M_PI / 180;
    drawTextLine0101.fontName = @"HelveticaNeue";
    drawTextLine0101.fontColor = [UIColor blackColor];
    drawTextLine0101.fontSize = 38;
    drawTextLine0101.kernSpacing = -1.2;
    drawTextLine0101.origin = CGPointMake(995, 1028);
    [station0095.nameOriginalTextPrimitives addObject:drawTextLine0101];

    // Добавляем перегон
    MWHaul *haul0098 = [[MWHaul alloc] init];
    haul0098.identifier = @"haul0098";
    haul0098.length = 1614;
    [edge0029.elements addObject:haul0098];

    MWDrawLine *drawLine0127 = [[MWDrawLine alloc] init];
    drawLine0127.startPoint = CGPointMake(1039.5, 1085.5);
    drawLine0127.endPoint = CGPointMake(1105.5, 1085.5);
    drawLine0127.width = 16;
    drawLine0127.color = line0007.color;
    [haul0098.drawPrimitives addObject:drawLine0127];

    // Добавлям станцию Woodley
    MWStation *station0096 = [[MWStation alloc] init];
    station0096.identifier = @"station0096";
    [edge0029.elements addObject:station0096];
    
    station0096.nameOriginal = @"Woodley";
    station0096.mapLocation = CGPointMake(1126, 1085.5);
    station0096.geoLocation = CGPointMake(34.186153, -118.482872);

    MWDrawLine *drawLine0128 = [[MWDrawLine alloc] init];
    drawLine0128.startPoint = CGPointMake(1110.5, 1085.5);
    drawLine0128.endPoint = CGPointMake(1141.5, 1085.5);
    drawLine0128.width = 31;
    drawLine0128.color = line0007.color;
    [station0096.drawPrimitives addObject:drawLine0128];

    MWDrawTextLine *drawTextLine0102 = [[MWDrawTextLine alloc] init];
    drawTextLine0102.text = station0096.nameOriginal;
    drawTextLine0102.radians = 315 * M_PI / 180;
    drawTextLine0102.fontName = @"HelveticaNeue";
    drawTextLine0102.fontColor = [UIColor blackColor];
    drawTextLine0102.fontSize = 38;
    drawTextLine0102.kernSpacing = -0.0;
    drawTextLine0102.origin = CGPointMake(1101, 1027);
    [station0096.nameOriginalTextPrimitives addObject:drawTextLine0102];

    // Добавляем перегон
    MWHaul *haul0099 = [[MWHaul alloc] init];
    haul0099.length = 1571;
    haul0099.identifier = @"haul0099";
    [edge0029.elements addObject:haul0099];

    MWDrawLine *drawLine0129 = [[MWDrawLine alloc] init];
    drawLine0129.startPoint = CGPointMake(1146.5, 1085.5);
    drawLine0129.endPoint = CGPointMake(1212.5, 1085.5);
    drawLine0129.width = 16;
    drawLine0129.color = line0007.color;
    [haul0099.drawPrimitives addObject:drawLine0129];

    // Добавлям станцию Sepulveda
    MWStation *station0097 = [[MWStation alloc] init];
    station0097.identifier = @"station0097";
    [edge0029.elements addObject:station0097];
    
    station0097.nameOriginal = @"Sepulveda";
    station0097.mapLocation = CGPointMake(1233.5, 1085.5);
    station0097.geoLocation = CGPointMake(34.180693, -118.468877);

    MWDrawLine *drawLine0130 = [[MWDrawLine alloc] init];
    drawLine0130.startPoint = CGPointMake(1217.5, 1085.5);
    drawLine0130.endPoint = CGPointMake(1248.5, 1085.5);
    drawLine0130.width = 31;
    drawLine0130.color = line0007.color;
    [station0097.drawPrimitives addObject:drawLine0130];

    MWDrawTextLine *drawTextLine0103 = [[MWDrawTextLine alloc] init];
    drawTextLine0103.text = station0097.nameOriginal;
    drawTextLine0103.radians = 315 * M_PI / 180;
    drawTextLine0103.fontName = @"HelveticaNeue";
    drawTextLine0103.fontColor = [UIColor blackColor];
    drawTextLine0103.fontSize = 38;
    drawTextLine0103.kernSpacing = -0.6;
    drawTextLine0103.origin = CGPointMake(1207, 1029);
    [station0097.nameOriginalTextPrimitives addObject:drawTextLine0103];

    // Добавляем перегон
    MWHaul *haul0100 = [[MWHaul alloc] init];
    haul0100.identifier = @"haul0100";
    haul0100.length = 1928;
    [edge0029.elements addObject:haul0100];

    MWDrawLine *drawLine0131 = [[MWDrawLine alloc] init];
    drawLine0131.startPoint = CGPointMake(1253.5, 1085.5);
    drawLine0131.endPoint = CGPointMake(1319, 1085.5);
    drawLine0131.width = 16;
    drawLine0131.color = line0007.color;
    [haul0100.drawPrimitives addObject:drawLine0131];

    // Добавлям станцию Van Nuys
    MWStation *station0098 = [[MWStation alloc] init];
    station0098.identifier = @"station0098";
    [edge0029.elements addObject:station0098];
    
    station0098.nameOriginal = @"Van Nuys";
    station0098.mapLocation = CGPointMake(1339.5, 1085.5);
    station0098.geoLocation = CGPointMake(34.180475, -118.448105);

    MWDrawLine *drawLine0132 = [[MWDrawLine alloc] init];
    drawLine0132.startPoint = CGPointMake(1324, 1085.5);
    drawLine0132.endPoint = CGPointMake(1355, 1085.5);
    drawLine0132.width = 31;
    drawLine0132.color = line0007.color;
    [station0098.drawPrimitives addObject:drawLine0132];

    MWDrawTextLine *drawTextLine0104 = [[MWDrawTextLine alloc] init];
    drawTextLine0104.text = station0098.nameOriginal;
    drawTextLine0104.radians = 315 * M_PI / 180;
    drawTextLine0104.fontName = @"HelveticaNeue";
    drawTextLine0104.fontColor = [UIColor blackColor];
    drawTextLine0104.fontSize = 38;
    drawTextLine0104.kernSpacing = -0.6;
    drawTextLine0104.origin = CGPointMake(1314, 1028);
    [station0098.nameOriginalTextPrimitives addObject:drawTextLine0104];

    // Добавляем перегон
    MWHaul *haul0101 = [[MWHaul alloc] init];
    haul0101.identifier = @"haul0101";
    haul0101.length = 1754;
    [edge0029.elements addObject:haul0101];

    MWDrawLine *drawLine0133 = [[MWDrawLine alloc] init];
    drawLine0133.startPoint = CGPointMake(1360, 1085.5);
    drawLine0133.endPoint = CGPointMake(1426, 1085.5);
    drawLine0133.width = 16;
    drawLine0133.color = line0007.color;
    [haul0101.drawPrimitives addObject:drawLine0133];

    // Добавлям станцию Woodman
    MWStation *station0099 = [[MWStation alloc] init];
    station0099.identifier = @"station0099";
    [edge0029.elements addObject:station0099];
    
    station0099.nameOriginal = @"Woodman";
    station0099.mapLocation = CGPointMake(1446.5, 1085.5);
    station0099.geoLocation = CGPointMake(34.178964, -118.429651);

    MWDrawLine *drawLine0134 = [[MWDrawLine alloc] init];
    drawLine0134.startPoint = CGPointMake(1431, 1085.5);
    drawLine0134.endPoint = CGPointMake(1462, 1085.5);
    drawLine0134.width = 31;
    drawLine0134.color = line0007.color;
    [station0099.drawPrimitives addObject:drawLine0134];

    MWDrawTextLine *drawTextLine0105 = [[MWDrawTextLine alloc] init];
    drawTextLine0105.text = station0099.nameOriginal;
    drawTextLine0105.radians = 315 * M_PI / 180;
    drawTextLine0105.fontName = @"HelveticaNeue";
    drawTextLine0105.fontColor = [UIColor blackColor];
    drawTextLine0105.fontSize = 38;
    drawTextLine0105.kernSpacing = -0.6;
    drawTextLine0105.origin = CGPointMake(1421, 1028);
    [station0099.nameOriginalTextPrimitives addObject:drawTextLine0105];

    // Добавляем перегон
    MWHaul *haul0102 = [[MWHaul alloc] init];
    haul0102.identifier = @"haul0102";
    haul0102.length = 1072;
    [edge0029.elements addObject:haul0102];

    MWDrawLine *drawLine0135 = [[MWDrawLine alloc] init];
    drawLine0135.startPoint = CGPointMake(1467, 1085.5);
    drawLine0135.endPoint = CGPointMake(1533, 1085.5);
    drawLine0135.width = 16;
    drawLine0135.color = line0007.color;
    [haul0102.drawPrimitives addObject:drawLine0135];

    // Добавлям станцию Valley College
    MWStation *station0100 = [[MWStation alloc] init];
    station0100.identifier = @"station0100";
    [edge0029.elements addObject:station0100];
    
    station0100.nameOriginal = @"Valley College";
    station0100.mapLocation = CGPointMake(1553.5, 1085.5);
    station0100.geoLocation = CGPointMake(34.171716, -118.442028);

    MWDrawLine *drawLine0136 = [[MWDrawLine alloc] init];
    drawLine0136.startPoint = CGPointMake(1538, 1085.5);
    drawLine0136.endPoint = CGPointMake(1569, 1085.5);
    drawLine0136.width = 31;
    drawLine0136.color = line0007.color;
    [station0100.drawPrimitives addObject:drawLine0136];

    MWDrawTextLine *drawTextLine0106 = [[MWDrawTextLine alloc] init];
    drawTextLine0106.text = station0100.nameOriginal;
    drawTextLine0106.radians = 315 * M_PI / 180;
    drawTextLine0106.fontName = @"HelveticaNeue";
    drawTextLine0106.fontColor = [UIColor blackColor];
    drawTextLine0106.fontSize = 38;
    drawTextLine0106.kernSpacing = -0.3;
    drawTextLine0106.origin = CGPointMake(1528, 1028);
    [station0100.nameOriginalTextPrimitives addObject:drawTextLine0106];

    // Добавляем перегон
    MWHaul *haul0103 = [[MWHaul alloc] init];
    haul0103.identifier = @"haul0103";
    haul0103.length = 2530;
    [edge0029.elements addObject:haul0103];

    MWDrawLine *drawLine0137 = [[MWDrawLine alloc] init];
    drawLine0137.startPoint = CGPointMake(1574, 1085.5);
    drawLine0137.endPoint = CGPointMake(1640, 1085.5);
    drawLine0137.width = 16;
    drawLine0137.color = line0007.color;
    [haul0103.drawPrimitives addObject:drawLine0137];

    // Добавлям станцию Laurel Canyon
    MWStation *station0101 = [[MWStation alloc] init];
    station0101.identifier = @"station0101";
    [edge0029.elements addObject:station0101];
    
    station0101.nameOriginal = @"Laurel Canyon";
    station0101.mapLocation = CGPointMake(1660, 1085.5);
    station0101.geoLocation = CGPointMake(34.168465, -118.395696);

    MWDrawLine *drawLine0138 = [[MWDrawLine alloc] init];
    drawLine0138.startPoint = CGPointMake(1645, 1085.5);
    drawLine0138.endPoint = CGPointMake(1675.5, 1085.5);
    drawLine0138.width = 31;
    drawLine0138.color = line0007.color;
    [station0101.drawPrimitives addObject:drawLine0138];

    MWDrawTextLine *drawTextLine0107 = [[MWDrawTextLine alloc] init];
    drawTextLine0107.text = station0101.nameOriginal;
    drawTextLine0107.radians = 315 * M_PI / 180;
    drawTextLine0107.fontName = @"HelveticaNeue";
    drawTextLine0107.fontColor = [UIColor blackColor];
    drawTextLine0107.fontSize = 38;
    drawTextLine0107.kernSpacing = -0.6;
    drawTextLine0107.origin = CGPointMake(1635, 1029);
    [station0101.nameOriginalTextPrimitives addObject:drawTextLine0107];

    // Добавляем перегон
    MWHaul *haul0104 = [[MWHaul alloc] init];
    haul0104.identifier = @"haul0104";
    haul0104.length = 1630;
    [edge0029.elements addObject:haul0104];

    MWDrawLine *drawLine0139 = [[MWDrawLine alloc] init];
    drawLine0139.startPoint = CGPointMake(1680.5, 1085.5);
    drawLine0139.endPoint = CGPointMake(1760, 1085.5);
    drawLine0139.width = 16;
    drawLine0139.color = line0007.color;
    [haul0104.drawPrimitives addObject:drawLine0139];

    // Добавлям станцию North Hollywood
    MWStation *station0102 = [[MWStation alloc] init];
    station0102.identifier = @"station0102";
    [edge0029.elements addObject:station0102];
    
    station0102.nameOriginal = @"North Hollywood";
    station0102.mapLocation = CGPointMake(1760, 1085.5);
    station0102.geoLocation = CGPointMake(34.168484, -118.377991);
    
    station0102.showNameOnMap = NO;
    [station0102.drawPrimitives addObject:drawTextLine0045];
    
    // Добавляем вершину
    edge0029.finishVertex = vertex0006;

    ////////////////////////////////////////////////////////////////
    // 8. Metro Silver Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Harbor Gateway Transit Center - Harbor Freeway
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0030 = [[MWEdge alloc] init];
    edge0030.identifier = @"edge0030";
    edge0030.developmentName = @"Участок Harbor Gateway Transit Center - Harbor Freeway";
    [self.edges addObject:edge0030];

    // Добавляем линию
    edge0030.line = line0008;
    
    // Добавляем вершину
    edge0030.startVertex = vertex0023;
    
    // Добавлям станцию Harbor Gateway Transit Center
    MWStation *station0103 = [[MWStation alloc] init];
    station0103.identifier = @"station0103";
    [edge0030.elements addObject:station0103];
    
    station0103.nameOriginal = @"Harbor Gateway Transit Center";
    station0103.mapLocation = CGPointMake(2084.5, 3758);
    station0103.geoLocation = CGPointMake(33.869290, -118.287452);

    MWDrawLine *drawLine0140 = [[MWDrawLine alloc] init];
    drawLine0140.startPoint = CGPointMake(2084.5, 3743);
    drawLine0140.endPoint = CGPointMake(2084.5, 3773.5);
    drawLine0140.width = 31;
    drawLine0140.color = line0008.color;
    [station0103.drawPrimitives addObject:drawLine0140];

    MWDrawTextLine *drawTextLine0108 = [[MWDrawTextLine alloc] init];
    drawTextLine0108.text = @"Harbor Gateway";
    drawTextLine0108.radians = 315 * M_PI / 180;
    drawTextLine0108.fontName = @"HelveticaNeue";
    drawTextLine0108.fontColor = [UIColor blackColor];
    drawTextLine0108.fontSize = 38;
    drawTextLine0108.kernSpacing = -0.4;
    drawTextLine0108.origin = CGPointMake(2110, 3753);
    [station0103.nameOriginalTextPrimitives addObject:drawTextLine0108];

    MWDrawTextLine *drawTextLine0109 = [[MWDrawTextLine alloc] init];
    drawTextLine0109.text = @"Transit Center";
    drawTextLine0109.radians = 315 * M_PI / 180;
    drawTextLine0109.fontName = @"HelveticaNeue";
    drawTextLine0109.fontColor = [UIColor blackColor];
    drawTextLine0109.fontSize = 38;
    drawTextLine0109.kernSpacing = -0.3;
    drawTextLine0109.origin = CGPointMake(2114, 3807);
    [station0103.nameOriginalTextPrimitives addObject:drawTextLine0109];

    // Добавляем перегон
    MWHaul *haul0105 = [[MWHaul alloc] init];
    haul0105.identifier = @"haul0105";
    haul0105.length = 3940;
    [edge0030.elements addObject:haul0105];

    MWDrawLine *drawLine0141 = [[MWDrawLine alloc] init];
    drawLine0141.startPoint = CGPointMake(2084.5, 3738);
    drawLine0141.endPoint = CGPointMake(2084.5, 3516);
    drawLine0141.width = 16;
    drawLine0141.color = line0008.color;
    [haul0105.drawPrimitives addObject:drawLine0141];

    // Добавлям станцию Rosecrans
    MWStation *station0104 = [[MWStation alloc] init];
    station0104.identifier = @"station0104";
    [edge0030.elements addObject:station0104];
    
    station0104.nameOriginal = @"Rosecrans";
    station0104.mapLocation = CGPointMake(2084.5, 3494.5);
    station0104.geoLocation = CGPointMake(33.901910, -118.286613);

    MWDrawLine *drawLine0142 = [[MWDrawLine alloc] init];
    drawLine0142.startPoint = CGPointMake(2084.5, 3510.5);
    drawLine0142.endPoint = CGPointMake(2084.5, 3480);
    drawLine0142.width = 31;
    drawLine0142.color = line0008.color;
    [station0104.drawPrimitives addObject:drawLine0142];

    MWDrawTextLine *drawTextLine0110 = [[MWDrawTextLine alloc] init];
    drawTextLine0110.text = station0104.nameOriginal;
    drawTextLine0110.radians = 315 * M_PI / 180;
    drawTextLine0110.fontName = @"HelveticaNeue";
    drawTextLine0110.fontColor = [UIColor blackColor];
    drawTextLine0110.fontSize = 38;
    drawTextLine0110.kernSpacing = -1.4;
    drawTextLine0110.origin = CGPointMake(2107, 3485);
    [station0104.nameOriginalTextPrimitives addObject:drawTextLine0110];

    // Добавляем перегон
    MWHaul *haul0106 = [[MWHaul alloc] init];
    haul0106.identifier = @"haul0106";
    haul0106.length = 3124;
    [edge0030.elements addObject:haul0106];

    MWDrawLine *drawLine0145 = [[MWDrawLine alloc] init];
    drawLine0145.startPoint = CGPointMake(2084.5, 3475);
    drawLine0145.endPoint = CGPointMake(2084.5, 3218.5);
    drawLine0145.width = 16;
    drawLine0145.color = line0008.color;
    [haul0106.drawPrimitives addObject:drawLine0145];

    // Добавлям станцию Harbow Freeway
    MWStation *station0105 = [[MWStation alloc] init];
    station0105.identifier = @"station0105";
    [edge0030.elements addObject:station0105];
    
    station0105.nameOriginal = @"Harbor Freeway";
    station0105.mapLocation = CGPointMake(2084.5, 3217.5);
    station0105.geoLocation = CGPointMake(33.928739, -118.280747);
    
    station0105.showNameOnMap = NO;
    [station0105.drawPrimitives addObject:drawTextLine0064];
    
    // Добавляем вершину
    edge0030.finishVertex = vertex0014;
    
    // Создаем участок линии Harbor Freeway - Union Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0031 = [[MWEdge alloc] init];
    edge0031.identifier = @"edge0031";
    edge0031.developmentName = @"Участок Harbor Freeway - Union Station";
    [self.edges addObject:edge0031];
    
    // Добавляем линию
    edge0031.line = line0008;
    
    // Добавляем вершину
    edge0031.startVertex = vertex0014;
    
    // Добавлям станцию Harbor Freeway
    [edge0031.elements addObject:station0105];

    // Добавляем перегон
    MWHaul *haul0107 = [[MWHaul alloc] init];
    haul0107.identifier = @"haul0107";
    haul0107.length = 3491;
    [edge0031.elements addObject:haul0107];

    MWDrawLine *drawLine0147 = [[MWDrawLine alloc] init];
    drawLine0147.startPoint = CGPointMake(2084.5, 3219);
    drawLine0147.endPoint = CGPointMake(2084.5, 3001.5);
    drawLine0147.width = 16;
    drawLine0147.color = line0008.color;
    [haul0107.drawPrimitives addObject:drawLine0147];

    // Добавлям станцию Manchester
    MWStation *station0106 = [[MWStation alloc] init];
    station0106.identifier = @"station0106";
    [edge0031.elements addObject:station0106];
    
    station0106.nameOriginal = @"Manchester";
    station0106.mapLocation = CGPointMake(2084.5, 2981.5);
    station0106.geoLocation = CGPointMake(33.960126, -118.280856);
    
    MWDrawLine *drawLine0148 = [[MWDrawLine alloc] init];
    drawLine0148.startPoint = CGPointMake(2084.5, 2996.5);
    drawLine0148.endPoint = CGPointMake(2084.5, 2966);
    drawLine0148.width = 31;
    drawLine0148.color = line0008.color;
    [station0106.drawPrimitives addObject:drawLine0148];

    MWDrawTextLine *drawTextLine0111 = [[MWDrawTextLine alloc] init];
    drawTextLine0111.text = station0106.nameOriginal;
    drawTextLine0111.radians = 315 * M_PI / 180;
    drawTextLine0111.fontName = @"HelveticaNeue";
    drawTextLine0111.fontColor = [UIColor blackColor];
    drawTextLine0111.fontSize = 38;
    drawTextLine0111.kernSpacing = -0.2;
    drawTextLine0111.origin = CGPointMake(2106, 2954);
    [station0106.nameOriginalTextPrimitives addObject:drawTextLine0111];

    // Добавляем перегон
    MWHaul *haul0108 = [[MWHaul alloc] init];
    haul0108.identifier = @"haul0108";
    haul0108.length = 3169;
    [edge0031.elements addObject:haul0108];

    MWDrawLine *drawLine0149 = [[MWDrawLine alloc] init];
    drawLine0149.startPoint = CGPointMake(2084.5, 2961);
    drawLine0149.endPoint = CGPointMake(2084.5, 2766);
    drawLine0149.width = 16;
    drawLine0149.color = line0008.color;
    [haul0108.drawPrimitives addObject:drawLine0149];

    // Добавлям станцию Slauson
    MWStation *station0107 = [[MWStation alloc] init];
    station0107.identifier = @"station0107";
    [edge0031.elements addObject:station0107];
    
    station0107.nameOriginal = @"Slauson";
    station0107.mapLocation = CGPointMake(2084.5, 2745.5);
    station0107.geoLocation = CGPointMake(33.988682, -118.280505);

    MWDrawLine *drawLine0150 = [[MWDrawLine alloc] init];
    drawLine0150.startPoint = CGPointMake(2084.5, 2761);
    drawLine0150.endPoint = CGPointMake(2084.5, 2730);
    drawLine0150.width = 31;
    drawLine0150.color = line0008.color;
    [station0107.drawPrimitives addObject:drawLine0150];

    MWDrawTextLine *drawTextLine0112 = [[MWDrawTextLine alloc] init];
    drawTextLine0112.text = station0107.nameOriginal;
    drawTextLine0112.radians = 315 * M_PI / 180;
    drawTextLine0112.fontName = @"HelveticaNeue";
    drawTextLine0112.fontColor = [UIColor blackColor];
    drawTextLine0112.fontSize = 38;
    drawTextLine0112.kernSpacing = -0.6;
    drawTextLine0112.origin = CGPointMake(2106, 2726);
    [station0107.nameOriginalTextPrimitives addObject:drawTextLine0112];

    // Добавляем перегон
    MWHaul *haul0109 = [[MWHaul alloc] init];
    haul0109.identifier = @"haul0109";
    haul0109.length = 3244;
    [edge0031.elements addObject:haul0109];

    MWDrawLine *drawLine0151 = [[MWDrawLine alloc] init];
    drawLine0151.startPoint = CGPointMake(2084.5, 2725);
    drawLine0151.endPoint = CGPointMake(2084.5, 2529.5);
    drawLine0151.width = 16;
    drawLine0151.color = line0008.color;
    [haul0109.drawPrimitives addObject:drawLine0151];

    // Добавлям станцию 37th Street/USC
    MWStation *station0108 = [[MWStation alloc] init];
    station0108.identifier = @"station0108";
    [edge0031.elements addObject:station0108];
    
    station0108.nameOriginal = @"37th Street/USC";
    station0108.mapLocation = CGPointMake(2084.5, 2509.5);
    station0108.geoLocation = CGPointMake(34.017837, -118.280148);

    MWDrawLine *drawLine0152 = [[MWDrawLine alloc] init];
    drawLine0152.startPoint = CGPointMake(2084.5, 2524);
    drawLine0152.endPoint = CGPointMake(2084.5, 2494);
    drawLine0152.width = 31;
    drawLine0152.color = line0008.color;
    [station0108.drawPrimitives addObject:drawLine0152];

    MWDrawTextLine *drawTextLine0113 = [[MWDrawTextLine alloc] init];
    drawTextLine0113.text = @"37th St/";
    drawTextLine0113.radians = 315 * M_PI / 180;
    drawTextLine0113.fontName = @"HelveticaNeue";
    drawTextLine0113.fontColor = [UIColor blackColor];
    drawTextLine0113.fontSize = 38;
    drawTextLine0113.kernSpacing = -0.6;
    drawTextLine0113.origin = CGPointMake(2107, 2502);
    [station0108.nameOriginalTextPrimitives addObject:drawTextLine0113];

    MWDrawTextLine *drawTextLine0114 = [[MWDrawTextLine alloc] init];
    drawTextLine0114.text = @"USC";
    drawTextLine0114.radians = 315 * M_PI / 180;
    drawTextLine0114.fontName = @"HelveticaNeue";
    drawTextLine0114.fontColor = [UIColor blackColor];
    drawTextLine0114.fontSize = 38;
    drawTextLine0114.kernSpacing = -1.6;
    drawTextLine0114.origin = CGPointMake(2108, 2557);
    [station0108.nameOriginalTextPrimitives addObject:drawTextLine0114];

    // Добавляем перегон
    MWHaul *haul0110 = [[MWHaul alloc] init];
    haul0110.identifier = @"haul0110";
    haul0110.length = 7700;
    [edge0031.elements addObject:haul0110];

    MWDrawLine *drawLine0153 = [[MWDrawLine alloc] init];
    drawLine0153.startPoint = CGPointMake(2084.5, 2489);
    drawLine0153.endPoint = CGPointMake(2084.5, 2281);
    drawLine0153.width = 16;
    drawLine0153.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawLine0153];

    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(2138.5, 2281);
    drawArc0024.startRadians = 180 * M_PI / 180;
    drawArc0024.endRadians = 225 * M_PI / 180;
    drawArc0024.radius = 54;
    drawArc0024.width = 16;
    drawArc0024.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawArc0024];

    MWDrawLine *drawLine0170 = [[MWDrawLine alloc] init];
    drawLine0170.startPoint = CGPointMake(2299.5, 2042.75);
    drawLine0170.endPoint = CGPointMake(2401, 1940);
    drawLine0170.width = 20;
    drawLine0170.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0170];

    MWDrawLine *drawLine0169 = [[MWDrawLine alloc] init];
    drawLine0169.startPoint = CGPointMake(2099.5, 2243.5);
    drawLine0169.endPoint = CGPointMake(2504, 1836.5);
    drawLine0169.width = 16;
    drawLine0169.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawLine0169];

    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(2542, 1875);
    drawArc0025.startRadians = 225 * M_PI / 180;
    drawArc0025.endRadians = 270 * M_PI / 180;
    drawArc0025.radius = 54;
    drawArc0025.width = 16;
    drawArc0025.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawArc0025];

    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(2214, 2052);
    drawArc0026.startRadians = 0 * M_PI / 180;
    drawArc0026.endRadians = 45 * M_PI / 180;
    drawArc0026.radius = 54;
    drawArc0026.width = 16;
    drawArc0026.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawArc0026];

    MWDrawArc *drawArc0027 = [[MWDrawArc alloc] init];
    drawArc0027.center = CGPointMake(2323, 2052);
    drawArc0027.startRadians = 180 * M_PI / 180;
    drawArc0027.endRadians = 225 * M_PI / 180;
    drawArc0027.radius = 55;
    drawArc0027.width = 16;
    drawArc0027.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawArc0027];

    MWDrawLine *drawLine0172 = [[MWDrawLine alloc] init];
    drawLine0172.startPoint = CGPointMake(2283.5, 2013.5);
    drawLine0172.endPoint = CGPointMake(2436.5, 1860);
    drawLine0172.width = 20;
    drawLine0172.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0172];

    MWDrawLine *drawLine0171 = [[MWDrawLine alloc] init];
    drawLine0171.startPoint = CGPointMake(2283, 2014);
    drawLine0171.endPoint = CGPointMake(2454, 1842.5);
    drawLine0171.width = 16;
    drawLine0171.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawLine0171];

    MWDrawLine *drawLine0174 = [[MWDrawLine alloc] init];
    drawLine0174.startPoint = CGPointMake(2540, 1821);
    drawLine0174.endPoint = CGPointMake(2650, 1821.5);
    drawLine0174.width = 20;
    drawLine0174.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0174];
    
    MWDrawArc *drawArc0028 = [[MWDrawArc alloc] init];
    drawArc0028.center = CGPointMake(2506.5, 1896);
    drawArc0028.startRadians = 225 * M_PI / 180;
    drawArc0028.endRadians = 270 * M_PI / 180;
    drawArc0028.radius = 75;
    drawArc0028.width = 16;
    drawArc0028.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawArc0028];

    MWDrawLine *drawLine0173 = [[MWDrawLine alloc] init];
    drawLine0173.startPoint = CGPointMake(2506, 1821);
    drawLine0173.endPoint = CGPointMake(2844.5, 1821.5);
    drawLine0173.width = 16;
    drawLine0173.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawLine0173];

    MWDrawArc *drawArc0029 = [[MWDrawArc alloc] init];
    drawArc0029.center = CGPointMake(2844.5, 1741.5);
    drawArc0029.startRadians = 45 * M_PI / 180;
    drawArc0029.endRadians = 90 * M_PI / 180;
    drawArc0029.radius = 80;
    drawArc0029.width = 16;
    drawArc0029.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawArc0029];

    MWDrawLine *drawLine0176 = [[MWDrawLine alloc] init];
    drawLine0176.startPoint = CGPointMake(2900.5, 1798.5);
    drawLine0176.endPoint = CGPointMake(2913, 1786.5);
    drawLine0176.width = 16;
    drawLine0176.color = line0008.color;
    [haul0110.drawPrimitives addObject:drawLine0176];

    MWDrawLine *drawLine0155 = [[MWDrawLine alloc] init];
    drawLine0155.startPoint = CGPointMake(2084.5, 2297);
    drawLine0155.endPoint = CGPointMake(2084.5, 2306);
    drawLine0155.width = 10;
    drawLine0155.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0155];

    MWDrawLine *drawLine0156 = [[MWDrawLine alloc] init];
    drawLine0156.startPoint = CGPointMake(2124.5, 2218.5);
    drawLine0156.endPoint = CGPointMake(2117, 2226);
    drawLine0156.width = 10;
    drawLine0156.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0156];

    MWDrawLine *drawLine0157 = [[MWDrawLine alloc] init];
    drawLine0157.startPoint = CGPointMake(2184.5, 2158);
    drawLine0157.endPoint = CGPointMake(2177, 2165.5);
    drawLine0157.width = 10;
    drawLine0157.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0157];

    MWDrawLine *drawLine0158 = [[MWDrawLine alloc] init];
    drawLine0158.startPoint = CGPointMake(2244.5, 2097.5);
    drawLine0158.endPoint = CGPointMake(2237, 2105);
    drawLine0158.width = 10;
    drawLine0158.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0158];

    MWDrawLine *drawLine0159 = [[MWDrawLine alloc] init];
    drawLine0159.startPoint = CGPointMake(2327, 2014);
    drawLine0159.endPoint = CGPointMake(2319.5, 2021.5);
    drawLine0159.width = 10;
    drawLine0159.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0159];

    MWDrawLine *drawLine0160 = [[MWDrawLine alloc] init];
    drawLine0160.startPoint = CGPointMake(2305, 1992);
    drawLine0160.endPoint = CGPointMake(2297.5, 1999.5);
    drawLine0160.width = 10;
    drawLine0160.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0160];

    MWDrawLine *drawLine0161 = [[MWDrawLine alloc] init];
    drawLine0161.startPoint = CGPointMake(2387, 1954);
    drawLine0161.endPoint = CGPointMake(2379.5, 1961.5);
    drawLine0161.width = 10;
    drawLine0161.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0161];

    MWDrawLine *drawLine0162 = [[MWDrawLine alloc] init];
    drawLine0162.startPoint = CGPointMake(2365, 1932);
    drawLine0162.endPoint = CGPointMake(2357.5, 1939.5);
    drawLine0162.width = 10;
    drawLine0162.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0162];

    MWDrawLine *drawLine0163 = [[MWDrawLine alloc] init];
    drawLine0163.startPoint = CGPointMake(2442, 1898.5);
    drawLine0163.endPoint = CGPointMake(2434.5, 1906);
    drawLine0163.width = 10;
    drawLine0163.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0163];

    MWDrawLine *drawLine0164 = [[MWDrawLine alloc] init];
    drawLine0164.startPoint = CGPointMake(2419.5, 1877);
    drawLine0164.endPoint = CGPointMake(2412.5, 1884);
    drawLine0164.width = 10;
    drawLine0164.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0164];

    MWDrawLine *drawLine0165 = [[MWDrawLine alloc] init];
    drawLine0165.startPoint = CGPointMake(2508, 1832.5);
    drawLine0165.endPoint = CGPointMake(2500.5, 1840);
    drawLine0165.width = 10;
    drawLine0165.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0165];

    MWDrawLine *drawLine0166 = [[MWDrawLine alloc] init];
    drawLine0166.startPoint = CGPointMake(2464.5, 1832.5);
    drawLine0166.endPoint = CGPointMake(2457, 1840);
    drawLine0166.width = 10;
    drawLine0166.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0166];

    MWDrawLine *drawLine0167 = [[MWDrawLine alloc] init];
    drawLine0167.startPoint = CGPointMake(2641, 1821);
    drawLine0167.endPoint = CGPointMake(2651, 1821);
    drawLine0167.width = 10;
    drawLine0167.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0167];

    MWDrawLine *drawLine0168 = [[MWDrawLine alloc] init];
    drawLine0168.startPoint = CGPointMake(2734, 1821.5);
    drawLine0168.endPoint = CGPointMake(2745, 1821.5);
    drawLine0168.width = 10;
    drawLine0168.color = [UIColor whiteColor];
    [haul0110.drawPrimitives addObject:drawLine0168];
    
    // Добавлям станцию Union Station
    MWStation *station0109 = [[MWStation alloc] init];
    station0109.identifier = @"station0109";
    [edge0031.elements addObject:station0109];
    
    station0109.nameOriginal = @"Union Station";
    station0109.mapLocation = CGPointMake(2914.5, 1785);
    station0109.geoLocation = CGPointMake(34.054318, -118.234300);
    
    station0109.showNameOnMap = NO;
    [station0109.drawPrimitives addObject:drawTextLine0054];
    
    // Добавляем вершину
    edge0031.finishVertex = vertex0011;
    
    // Создаем участок линии Union Station - El Monte Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0032 = [[MWEdge alloc] init];
    edge0032.identifier = @"edge0032";
    edge0032.developmentName = @"Участок Union Station - El Monte Station";
    [self.edges addObject:edge0032];
    
    // Добавляем линию
    edge0032.line = line0008;
    
    // Добавляем вершину
    edge0032.startVertex = vertex0011;
    
    // Добавлям станцию Union Station
    [edge0032.elements addObject:station0109];

    // Добавляем перегон
    MWHaul *haul0111 = [[MWHaul alloc] init];
    haul0111.identifier = @"haul0111";
    haul0111.length = 2359;
    [edge0032.elements addObject:haul0111];

    MWDrawLine *drawLine0177 = [[MWDrawLine alloc] init];
    drawLine0177.startPoint = CGPointMake(2912.5, 1787);
    drawLine0177.endPoint = CGPointMake(2928, 1771.5);
    drawLine0177.width = 16;
    drawLine0177.color = line0008.color;
    [haul0111.drawPrimitives addObject:drawLine0177];

    MWDrawArc *drawArc0030 = [[MWDrawArc alloc] init];
    drawArc0030.center = CGPointMake(2984, 1828.5);
    drawArc0030.startRadians = 225 * M_PI / 180;
    drawArc0030.endRadians = 270 * M_PI / 180;
    drawArc0030.radius = 80;
    drawArc0030.width = 16;
    drawArc0030.color = line0008.color;
    [haul0111.drawPrimitives addObject:drawArc0030];

    MWDrawLine *drawLine0178 = [[MWDrawLine alloc] init];
    drawLine0178.startPoint = CGPointMake(2983.5, 1748.5);
    drawLine0178.endPoint = CGPointMake(3189, 1748.5);
    drawLine0178.width = 16;
    drawLine0178.color = line0008.color;
    [haul0111.drawPrimitives addObject:drawLine0178];

    // Добавлям станцию LAC+USC Medical Center Station
    MWStation *station0110 = [[MWStation alloc] init];
    station0110.identifier = @"station0110";
    [edge0032.elements addObject:station0110];
    
    station0110.nameOriginal = @"LAC+USC Medical Center Station";
    station0110.mapLocation = CGPointMake(3210.5, 1748.5);
    station0110.geoLocation = CGPointMake(34.055433, -118.210431);

    MWDrawLine *drawLine0179 = [[MWDrawLine alloc] init];
    drawLine0179.startPoint = CGPointMake(3194, 1748.5);
    drawLine0179.endPoint = CGPointMake(3225, 1748.5);
    drawLine0179.width = 31;
    drawLine0179.color = line0008.color;
    [station0110.drawPrimitives addObject:drawLine0179];

    MWDrawTextLine *drawTextLine0115 = [[MWDrawTextLine alloc] init];
    drawTextLine0115.text = @"LAC+USC Medical Ctr";
    drawTextLine0115.radians = 315 * M_PI / 180;
    drawTextLine0115.fontName = @"HelveticaNeue";
    drawTextLine0115.fontColor = [UIColor blackColor];
    drawTextLine0115.fontSize = 38;
    drawTextLine0115.kernSpacing = -1.3;
    drawTextLine0115.origin = CGPointMake(3182, 1691);
    [station0110.nameOriginalTextPrimitives addObject:drawTextLine0115];

    // Добавляем перегон
    MWHaul *haul0112 = [[MWHaul alloc] init];
    haul0112.identifier = @"haul0112";
    haul0112.length = 4164;
    [edge0032.elements addObject:haul0112];

    MWDrawLine *drawLine0180 = [[MWDrawLine alloc] init];
    drawLine0180.startPoint = CGPointMake(3230, 1748.5);
    drawLine0180.endPoint = CGPointMake(3504.5, 1748.5);
    drawLine0180.width = 16;
    drawLine0180.color = line0008.color;
    [haul0112.drawPrimitives addObject:drawLine0180];

    // Добавлям станцию Cal State LA Station
    MWStation *station0111 = [[MWStation alloc] init];
    station0111.identifier = @"station0111";
    [edge0032.elements addObject:station0111];
    
    station0111.nameOriginal = @"Cal State LA Station";
    station0111.mapLocation = CGPointMake(3504.5, 1748.5);
    station0111.geoLocation = CGPointMake(34.062647, -118.168083);
    
    MWDrawLine *drawLine0181 = [[MWDrawLine alloc] init];
    drawLine0181.startPoint = CGPointMake(3505, 1727.5);
    drawLine0181.endPoint = CGPointMake(3505, 1769.5);
    drawLine0181.width = 42;
    drawLine0181.color = [UIColor blackColor];
    [station0111.drawPrimitives addObject:drawLine0181];
    
    MWDrawLine *drawLine0182 = [[MWDrawLine alloc] init];
    drawLine0182.startPoint = CGPointMake(3505, 1733);
    drawLine0182.endPoint = CGPointMake(3505, 1764);
    drawLine0182.width = 30;
    drawLine0182.color = [UIColor whiteColor];
    [station0111.drawPrimitives addObject:drawLine0182];
    
    MWDrawTextLine *drawTextLine0116 = [[MWDrawTextLine alloc] init];
    drawTextLine0116.text = @"Cal State LA";
    drawTextLine0116.radians = 315 * M_PI / 180;
    drawTextLine0116.fontName = @"HelveticaNeue";
    drawTextLine0116.fontColor = [UIColor blackColor];
    drawTextLine0116.fontSize = 38;
    drawTextLine0116.kernSpacing = -1.3;
    drawTextLine0116.origin = CGPointMake(3482, 1691);
    [station0111.nameOriginalTextPrimitives addObject:drawTextLine0116];

    // Добавляем перегон
    MWHaul *haul0113 = [[MWHaul alloc] init];
    haul0113.identifier = @"haul0113";
    haul0113.length = 11852;
    [edge0032.elements addObject:haul0113];

    MWDrawLine *drawLine0183 = [[MWDrawLine alloc] init];
    drawLine0183.startPoint = CGPointMake(3504, 1748.5);
    drawLine0183.endPoint = CGPointMake(3799.5, 1748.5);
    drawLine0183.width = 16;
    drawLine0183.color = line0008.color;
    [haul0113.drawPrimitives addObject:drawLine0183];

    // Добавлям станцию El Monte Station
    MWStation *station0112 = [[MWStation alloc] init];
    station0112.identifier = @"station0112";
    [edge0032.elements addObject:station0112];
    
    station0112.nameOriginal = @"El Monte Station";
    station0112.mapLocation = CGPointMake(3799.5, 1748.5);
    station0112.geoLocation = CGPointMake(34.072095, -118.045256);
    
    MWDrawLine *drawLine0184 = [[MWDrawLine alloc] init];
    drawLine0184.startPoint = CGPointMake(3784, 1748.5);
    drawLine0184.endPoint = CGPointMake(3815, 1748.5);
    drawLine0184.width = 31;
    drawLine0184.color = line0008.color;
    [station0112.drawPrimitives addObject:drawLine0184];

    MWDrawTextLine *drawTextLine0117 = [[MWDrawTextLine alloc] init];
    drawTextLine0117.text = @"El Monte";
    drawTextLine0117.radians = 315 * M_PI / 180;
    drawTextLine0117.fontName = @"HelveticaNeue";
    drawTextLine0117.fontColor = [UIColor blackColor];
    drawTextLine0117.fontSize = 38;
    drawTextLine0117.kernSpacing = -0.3;
    drawTextLine0117.origin = CGPointMake(3772, 1688);
    [station0112.nameOriginalTextPrimitives addObject:drawTextLine0117];

    // Добавляем вершину
    edge0032.finishVertex = vertex0024;

    return self;
}

@end