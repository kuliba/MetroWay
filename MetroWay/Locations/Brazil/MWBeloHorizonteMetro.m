//
//  MMBeloHorizonteMetro.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 06.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//

#import "MWBeloHorizonteMetro.h"
#import "MWLine.h"
#import "MWVertex.h"
#import "MWEdge.h"
#import "MWStation.h"
#import "MWHaul.h"
#import "MWDrawLine.h"
#import "MWDrawTextLine.h"
#import "MWDrawArc.h"

@implementation MWBeloHorizonteMetro

- (id)init
{
    // Инициализируем
    self = [super init];
    
    self.identifier = @"belo_horizonte_metro";
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Azul
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"1. Azul";
    line0001.color = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(128/255.0) alpha:1];
    [self.lines addObject:line0001];
    
    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0001];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Estação Vilarinho
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Vilarinho";
    [self.vertices addObject:vertex0001];
    
    // Estação Eldorado
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Eldorado";
    [self.vertices addObject:vertex0002];
    
    // Estação по португальски "Станция"
    
    ////////////////////////////////////////////////////////////////
    // 1. Azul
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Vilarinho" до "Eldorado"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Vilarinho - Eldorado";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавлям станцию "Vilarinho"
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Vilarinho";
    station0001.mapLocation = CGPointMake(1747, 927);
    station0001.geoLocation = CGPointMake(-19.821487, -43.946745);
    
    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(1727, 927);
    drawLine0001.endPoint = CGPointMake(1767, 927);
    drawLine0001.width = 12;
    drawLine0001.color = line0001.color;
    [station0001.drawPrimitives addObject:drawLine0001];
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 32;
    drawTextLine0001.origin = CGPointMake(1786, 908);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];
    
    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1594;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(1747, 927);
    drawLine0002.endPoint = CGPointMake(1747, 979);
    drawLine0002.width = 14.5;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(1827, 979);
    drawArc0001.startRadians = 135 * M_PI / 180;
    drawArc0001.endRadians = 180 * M_PI / 180;
    drawArc0001.radius = 80;
    drawArc0001.width = 14.5;
    drawArc0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawArc0001];
    
    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(1770, 1035);
    drawLine0003.endPoint = CGPointMake(1831, 1096);
    drawLine0003.width = 14.5;
    drawLine0003.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0003];
    
    // Добавлям станцию "Floramar"
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Floramar";
    station0002.mapLocation = CGPointMake(1831, 1096);
    station0002.geoLocation = CGPointMake(-19.833903, -43.940443);

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(1831, 1096);
    drawLine0004.endPoint = CGPointMake(1851, 1076);
    drawLine0004.width = 12;
    drawLine0004.color = line0001.color;
    [station0002.drawPrimitives addObject:drawLine0004];
    
    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0002.nameOriginal;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 32;
    drawTextLine0002.origin = CGPointMake(1868, 1033);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0002];
    
    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1817;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(1830.5, 1095.5);
    drawLine0005.endPoint = CGPointMake(2002, 1268);
    drawLine0005.width = 14.5;
    drawLine0005.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0005];
    
    // Добавлям станцию "Waldomiro Lobo"
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Waldomiro Lobo";
    station0003.mapLocation = CGPointMake(2002, 1268);
    station0003.geoLocation = CGPointMake(-19.847984, -43.932731);

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(2002, 1268);
    drawLine0006.endPoint = CGPointMake(1982, 1288);
    drawLine0006.width = 12;
    drawLine0006.color = line0001.color;
    [station0003.drawPrimitives addObject:drawLine0006];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = @"Waldomiro";
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 32;
    drawTextLine0003.origin = CGPointMake(1783, 1281);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0003];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = @"Lobo";
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 32;
    drawTextLine0004.origin = CGPointMake(1891, 1317);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0004];
    
    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1200;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(2001.5, 1267.5);
    drawLine0007.endPoint = CGPointMake(2064, 1330);
    drawLine0007.width = 14.5;
    drawLine0007.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0007];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(2007, 1386);
    drawArc0002.startRadians = 315 * M_PI / 180;
    drawArc0002.endRadians = 360 * M_PI / 180;
    drawArc0002.radius = 80;
    drawArc0002.width = 14.5;
    drawArc0002.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawArc0002];
    
    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(2087, 1386);
    drawLine0008.endPoint = CGPointMake(2087, 1475);
    drawLine0008.width = 14.5;
    drawLine0008.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0008];
    
    // Добавлям станцию "Primeiro de Maio"
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Primeiro de Maio";
    station0004.mapLocation = CGPointMake(2087, 1475);
    station0004.geoLocation = CGPointMake(-19.858699, -43.934198);
    
    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(2087, 1475);
    drawLine0009.endPoint = CGPointMake(2067, 1475);
    drawLine0009.width = 12;
    drawLine0009.color = line0001.color;
    [station0004.drawPrimitives addObject:drawLine0009];
    
    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = @"Primeiro";
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 32;
    drawTextLine0005.origin = CGPointMake(1903, 1425);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0005];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = @"de Maio";
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 32;
    drawTextLine0006.origin = CGPointMake(1916, 1461);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0006];
    
    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 1143;
    [edge0001.elements addObject:haul0004];
    
    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(2087, 1474.5);
    drawLine0010.endPoint = CGPointMake(2087, 1609);
    drawLine0010.width = 14.5;
    drawLine0010.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0010];
    
    // Добавлям станцию "São Gabriel"
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"São Gabriel";
    station0005.mapLocation = CGPointMake(2087, 1607.5);
    station0005.geoLocation = CGPointMake(-19.863500, -43.926510);
    
    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(2087, 1607.5);
    drawLine0011.endPoint = CGPointMake(2067, 1607.5);
    drawLine0011.width = 12;
    drawLine0011.color = line0001.color;
    [station0005.drawPrimitives addObject:drawLine0011];
    
    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = @"São";
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 32;
    drawTextLine0007.origin = CGPointMake(1981, 1566);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0007];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = @"Gabriel";
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 32;
    drawTextLine0008.origin = CGPointMake(1920, 1603);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0008];
    
    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1035;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(2087, 1607);
    drawLine0012.endPoint = CGPointMake(2087, 1660);
    drawLine0012.width = 14.5;
    drawLine0012.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0012];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(2167, 1660);
    drawArc0003.startRadians = 135 * M_PI / 180;
    drawArc0003.endRadians = 180 * M_PI / 180;
    drawArc0003.radius = 80;
    drawArc0003.width = 14.5;
    drawArc0003.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawArc0003];
    
    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(2110, 1716);
    drawLine0013.endPoint = CGPointMake(2177, 1783);
    drawLine0013.width = 14.5;
    drawLine0013.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0013];

    // Добавлям станцию "Minas Shopping"
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Minas Shopping";
    station0006.mapLocation = CGPointMake(2177, 1783);
    station0006.geoLocation = CGPointMake(-19.872180, -43.925202);

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(2177, 1783);
    drawLine0014.endPoint = CGPointMake(2197, 1763);
    drawLine0014.width = 12;
    drawLine0014.color = line0001.color;
    [station0006.drawPrimitives addObject:drawLine0014];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0006.nameOriginal;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 32;
    drawTextLine0009.origin = CGPointMake(2219, 1733);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0009];
    
    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1825;
    [edge0001.elements addObject:haul0006];
    
    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(2176.5, 1782.5);
    drawLine0015.endPoint = CGPointMake(2257, 1863);
    drawLine0015.width = 14.5;
    drawLine0015.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0015];
    
     // Добавлям станцию "José Cândido"
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"José Cândido";
    station0007.mapLocation = CGPointMake(2257, 1863);
    station0007.geoLocation = CGPointMake(-19.883498, -43.912929);

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(2257, 1863);
    drawLine0016.endPoint = CGPointMake(2277, 1843);
    drawLine0016.width = 12;
    drawLine0016.color = line0001.color;
    [station0007.drawPrimitives addObject:drawLine0016];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0007.nameOriginal;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 32;
    drawTextLine0010.origin = CGPointMake(2296, 1814);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0010];
    
    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 1361;
    [edge0001.elements addObject:haul0007];

    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(2256.5, 1862.5);
    drawLine0017.endPoint = CGPointMake(2343, 1949);
    drawLine0017.width = 14.5;
    drawLine0017.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0017];
    
    // Добавлям станцию "Santa Inés"
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"Santa Inés";
    station0008.mapLocation = CGPointMake(2343, 1949);
    station0008.geoLocation = CGPointMake(-19.894998, -43.910899);

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(2343, 1949);
    drawLine0018.endPoint = CGPointMake(2363, 1929);
    drawLine0018.width = 12;
    drawLine0018.color = line0001.color;
    [station0008.drawPrimitives addObject:drawLine0018];
    
    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0008.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 32;
    drawTextLine0011.origin = CGPointMake(2373, 1893);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0011];
    
    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 1330;
    [edge0001.elements addObject:haul0008];
    
    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(2342.5, 1948.5);
    drawLine0019.endPoint = CGPointMake(2427, 2033);
    drawLine0019.width = 14.5;
    drawLine0019.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0019];
    
    // Добавлям станцию "Horto Florestal"
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0001.elements addObject:station0009];
    
    station0009.nameOriginal = @"Horto Florestal";
    station0009.mapLocation = CGPointMake(2427, 2033);
    station0009.geoLocation = CGPointMake(-19.906900, -43.912998);

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(2427, 2033);
    drawLine0020.endPoint = CGPointMake(2447, 2013);
    drawLine0020.width = 12;
    drawLine0020.color = line0001.color;
    [station0009.drawPrimitives addObject:drawLine0020];
    
    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0009.nameOriginal;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 32;
    drawTextLine0012.origin = CGPointMake(2457, 1980);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0012];
    
    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 1709;
    [edge0001.elements addObject:haul0009];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(2426.5, 2032.5);
    drawLine0021.endPoint = CGPointMake(2489, 2095);
    drawLine0021.width = 14.5;
    drawLine0021.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0021];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(2432, 2151);
    drawArc0004.startRadians = 315 * M_PI / 180;
    drawArc0004.endRadians = 0 * M_PI / 180;
    drawArc0004.radius = 80;
    drawArc0004.width = 14.5;
    drawArc0004.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(2512, 2151);
    drawLine0022.endPoint = CGPointMake(2512, 2203);
    drawLine0022.width = 14.5;
    drawLine0022.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0022];
    
    // Добавлям станцию "Santa Tereza"
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0001.elements addObject:station0010];
    
    station0010.nameOriginal = @"Santa Tereza";
    station0010.mapLocation = CGPointMake(2512, 2203);
    station0010.geoLocation = CGPointMake(-19.918000, -43.912703);

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(2512, 2203);
    drawLine0023.endPoint = CGPointMake(2532, 2203);
    drawLine0023.width = 12;
    drawLine0023.color = line0001.color;
    [station0010.drawPrimitives addObject:drawLine0023];
    
    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = @"Santa";
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 32;
    drawTextLine0013.origin = CGPointMake(2550, 2164);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0013];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = @"Tereza";
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 32;
    drawTextLine0014.origin = CGPointMake(2550, 2194);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0014];
    
    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1042;
    [edge0001.elements addObject:haul0010];
    
    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(2512, 2202.5);
    drawLine0024.endPoint = CGPointMake(2512, 2333);
    drawLine0024.width = 14.5;
    drawLine0024.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0024];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(2472, 2333);
    drawArc0005.startRadians = 0 * M_PI / 180;
    drawArc0005.endRadians = 90 * M_PI / 180;
    drawArc0005.radius = 40;
    drawArc0005.width = 14.5;
    drawArc0005.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawArc0005];
    
    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(2473, 2373);
    drawLine0025.endPoint = CGPointMake(2322, 2373);
    drawLine0025.width = 14.5;
    drawLine0025.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0025];
    
    // Добавлям станцию "Santa Efigênia"
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0001.elements addObject:station0011];
    
    station0011.nameOriginal = @"Santa Efigênia";
    station0011.mapLocation = CGPointMake(2322, 2373);
    station0011.geoLocation = CGPointMake(-19.919907, -43.923031);
    
    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(2322, 2373);
    drawLine0026.endPoint = CGPointMake(2322, 2353);
    drawLine0026.width = 12;
    drawLine0026.color = line0001.color;
    [station0011.drawPrimitives addObject:drawLine0026];
    
    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0011.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 32;
    drawTextLine0015.origin = CGPointMake(2222, 2293);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0015];
    
    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 1575;
    [edge0001.elements addObject:haul0011];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(2322, 2373);
    drawLine0027.endPoint = CGPointMake(2132, 2373);
    drawLine0027.width = 14.5;
    drawLine0027.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0027];
    
    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(2132, 2331);
    drawArc0006.startRadians = 90 * M_PI / 180;
    drawArc0006.endRadians = 180 * M_PI / 180;
    drawArc0006.radius = 42;
    drawArc0006.width = 14.5;
    drawArc0006.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawArc0006];
    
    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(2048, 2331);
    drawArc0007.startRadians = 270 * M_PI / 180;
    drawArc0007.endRadians = 360 * M_PI / 180;
    drawArc0007.radius = 42;
    drawArc0007.width = 14.5;
    drawArc0007.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(2048, 2289);
    drawLine0028.endPoint = CGPointMake(2001, 2289);
    drawLine0028.width = 14.5;
    drawLine0028.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0028];
    
    // Добавлям станцию "Central"
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0001.elements addObject:station0012];
    
    station0012.nameOriginal = @"Central";
    station0012.mapLocation = CGPointMake(2001, 2289);
    station0012.geoLocation = CGPointMake(-19.917801, -43.933370);

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(2001, 2289);
    drawLine0029.endPoint = CGPointMake(2001, 2269);
    drawLine0029.width = 12;
    drawLine0029.color = line0001.color;
    [station0012.drawPrimitives addObject:drawLine0029];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0012.nameOriginal;
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 32;
    drawTextLine0016.origin = CGPointMake(2020, 2221);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0016];
    
    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1528;
    [edge0001.elements addObject:haul0012];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(2001.5, 2289);
    drawLine0030.endPoint = CGPointMake(1910, 2289);
    drawLine0030.width = 14.5;
    drawLine0030.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0030];
    
    // Добавлям станцию "Lagoinha"
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0001.elements addObject:station0013];
    
    station0013.nameOriginal = @"Lagoinha";
    station0013.mapLocation = CGPointMake(1910, 2289);
    station0013.geoLocation = CGPointMake(-19.912823, -43.942604);
    
    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(1910, 2289);
    drawLine0031.endPoint = CGPointMake(1910, 2309);
    drawLine0031.width = 12;
    drawLine0031.color = line0001.color;
    [station0013.drawPrimitives addObject:drawLine0031];
    
    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0013.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 32;
    drawTextLine0017.origin = CGPointMake(1755, 2312);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0017];
    
    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 1682;
    [edge0001.elements addObject:haul0013];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(1910, 2289);
    drawLine0032.endPoint = CGPointMake(1779, 2289);
    drawLine0032.width = 14.5;
    drawLine0032.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0032];
    
    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(1779, 2369);
    drawArc0008.startRadians = 225 * M_PI / 180;
    drawArc0008.endRadians = 270 * M_PI / 180;
    drawArc0008.radius = 80;
    drawArc0008.width = 14.5;
    drawArc0008.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(1723, 2312);
    drawLine0033.endPoint = CGPointMake(1600, 2435);
    drawLine0033.width = 14.5;
    drawLine0033.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0033];
    
    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(1544, 2378);
    drawArc0009.startRadians = 45 * M_PI / 180;
    drawArc0009.endRadians = 90 * M_PI / 180;
    drawArc0009.radius = 80;
    drawArc0009.width = 14.5;
    drawArc0009.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawArc0009];
    
    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(1544, 2458);
    drawLine0034.endPoint = CGPointMake(1491, 2458);
    drawLine0034.width = 14.5;
    drawLine0034.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0034];
    
    // Добавлям станцию "Carlos Prates"
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0001.elements addObject:station0014];
    
    station0014.nameOriginal = @"Carlos Prates";
    station0014.mapLocation = CGPointMake(1491, 2458);
    station0014.geoLocation = CGPointMake(-19.917831, -43.956493);
    
    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(1491, 2458);
    drawLine0035.endPoint = CGPointMake(1491, 2478);
    drawLine0035.width = 12;
    drawLine0035.color = line0001.color;
    [station0014.drawPrimitives addObject:drawLine0035];
    
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = @"Carlos";
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 32;
    drawTextLine0018.origin = CGPointMake(1511, 2480);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0018];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = @"Prates";
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 32;
    drawTextLine0019.origin = CGPointMake(1521, 2516);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0019];
    
    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1671;
    [edge0001.elements addObject:haul0014];
    
    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(1491.5, 2458);
    drawLine0036.endPoint = CGPointMake(1235, 2458);
    drawLine0036.width = 14.5;
    drawLine0036.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0036];
    
    // Добавлям станцию "Calafate"
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0001.elements addObject:station0015];
    
    station0015.nameOriginal = @"Calafate";
    station0015.mapLocation = CGPointMake(1235, 2458);
    station0015.geoLocation = CGPointMake(-19.922527, -43.970341);

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(1235, 2458);
    drawLine0037.endPoint = CGPointMake(1235, 2438);
    drawLine0037.width = 12;
    drawLine0037.color = line0001.color;
    [station0015.drawPrimitives addObject:drawLine0037];
    
    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0015.nameOriginal;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 32;
    drawTextLine0020.origin = CGPointMake(1255, 2392);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0020];
    
    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 2092;
    [edge0001.elements addObject:haul0015];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(1235.5, 2458);
    drawLine0038.endPoint = CGPointMake(975, 2458);
    drawLine0038.width = 14.5;
    drawLine0038.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0038];
    
    // Добавлям станцию "Gameleira"
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0001.elements addObject:station0016];
    
    station0016.nameOriginal = @"Gameleira";
    station0016.mapLocation = CGPointMake(975, 2458);
    station0016.geoLocation = CGPointMake(-19.927999, -43.988203);

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(975, 2458);
    drawLine0039.endPoint = CGPointMake(975, 2438);
    drawLine0039.width = 12;
    drawLine0039.color = line0001.color;
    [station0016.drawPrimitives addObject:drawLine0039];
    
    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0016.nameOriginal;
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 32;
    drawTextLine0021.origin = CGPointMake(800, 2391);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0021];
    
    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 2196;
    [edge0001.elements addObject:haul0016];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(975, 2458);
    drawLine0040.endPoint = CGPointMake(936, 2458);
    drawLine0040.width = 14.5;
    drawLine0040.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0040];
    
    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(936, 2498);
    drawArc0010.startRadians = 180 * M_PI / 180;
    drawArc0010.endRadians = 270 * M_PI / 180;
    drawArc0010.radius = 40;
    drawArc0010.width = 14.5;
    drawArc0010.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawArc0010];
    
    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(896, 2498);
    drawLine0041.endPoint = CGPointMake(896, 2586);
    drawLine0041.width = 14.5;
    drawLine0041.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0041];
    
    // Добавлям станцию "Vila Oeste"
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0001.elements addObject:station0017];
    
    station0017.nameOriginal = @"Vila Oeste";
    station0017.mapLocation = CGPointMake(896, 2586);
    station0017.geoLocation = CGPointMake(-19.939000, -44.003101);

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(896, 2586);
    drawLine0042.endPoint = CGPointMake(876, 2586);
    drawLine0042.width = 12;
    drawLine0042.color = line0001.color;
    [station0017.drawPrimitives addObject:drawLine0042];
    
    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = @"Vila";
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 32;
    drawTextLine0022.origin = CGPointMake(784, 2545);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0022];
    
    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = @"Oeste";
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 32;
    drawTextLine0023.origin = CGPointMake(754, 2581);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0023];
    
    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 1663;
    [edge0001.elements addObject:haul0017];
    
    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(896, 2585.5);
    drawLine0043.endPoint = CGPointMake(896, 2756);
    drawLine0043.width = 14.5;
    drawLine0043.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0043];
    
    // Добавлям станцию "Cidade Industrial"
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0001.elements addObject:station0018];
    
    station0018.nameOriginal = @"Cidade Industrial";
    station0018.mapLocation = CGPointMake(896, 2756);
    station0018.geoLocation = CGPointMake(-19.946222, -44.016999);
    
    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(896, 2756);
    drawLine0044.endPoint = CGPointMake(876, 2756);
    drawLine0044.width = 12;
    drawLine0044.color = line0001.color;
    [station0018.drawPrimitives addObject:drawLine0044];
    
    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = @"Cidade";
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 32;
    drawTextLine0024.origin = CGPointMake(732, 2718);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0024];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"Industrial";
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 32;
    drawTextLine0025.origin = CGPointMake(682, 2754);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0025];
    
    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1605;
    [edge0001.elements addObject:haul0018];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(896, 2755.5);
    drawLine0045.endPoint = CGPointMake(896, 2843);
    drawLine0045.width = 14.5;
    drawLine0045.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0045];
    
    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(856, 2843);
    drawArc0011.startRadians = 0 * M_PI / 180;
    drawArc0011.endRadians = 90 * M_PI / 180;
    drawArc0011.radius = 40;
    drawArc0011.width = 14.5;
    drawArc0011.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0011];
    
    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(856, 2883);
    drawLine0046.endPoint = CGPointMake(556, 2883);
    drawLine0046.width = 14.5;
    drawLine0046.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0046];
    
    // Добавлям станцию "Eldorado"
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0001.elements addObject:station0019];
    
    station0019.nameOriginal = @"Eldorado";
    station0019.mapLocation = CGPointMake(556, 2883);
    station0019.geoLocation = CGPointMake(-19.938485, -44.029928);

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(556, 2863);
    drawLine0047.endPoint = CGPointMake(556, 2903);
    drawLine0047.width = 12;
    drawLine0047.color = line0001.color;
    [station0019.drawPrimitives addObject:drawLine0047];
    
    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0019.nameOriginal;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 32;
    drawTextLine0026.origin = CGPointMake(373, 2861);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0026];
    
    // Добавляем вершину
    edge0001.finishVertex = vertex0002;
    
    return self;
}

@end
