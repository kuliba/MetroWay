//
//  MMMoscowMetro.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 04.11.13.
//  Copyright (c) 2013 Valentin Ozerov. All rights reserved.
//
//  History:
//  001. Initial version
//  002. Добавлена станция Тропарево. Пофиксены мелкие баги
//  003. [15.03.2015] Пофиксены мелкие баги
//  004. [02.07.2015] Пофиксены мелкие баги
//  005. [06.07.2015] Пофиксены мелкие баги
//  006. [08.07.2015] Улица Побдельского переименована в Бульвар Рокоссовского
//  007. [13.07.2015] Пофиксены мелкие баги
//  008. [14.12.2015] Добавлена станция Котельники
//  009. [13.02.2015] Добавлена станция Румянцево

// Удалено:
// drawGradientArc0002
// drawGradientArc0011
// drawGradientArc0013
// drawGradientArc0015
// drawGradientArc0017
// drawGradientArc0019
// drawGradientArc0020
// drawGradientArc0023
// drawGradientArc0025
// drawGradientArc0027
// drawGradientArc0029
// drawGradientArc0031
// drawGradientArc0033
// drawGradientArc0035
// drawGradientArc0037
// drawGradientArc0039

#import "MWMoscowMetro.h"
#import "MWEdge.h"
#import "MWStation.h"
#import "MWHaul.h"
#import "MWVertex.h"
#import "MWDrawLine.h"
#import "MWDrawArc.h"
#import "MWDrawTextLine.h"
#import "MWDrawGradientRect.h"
#import "MWDrawFillCircle.h"
#import "MWDrawGradientArc.h"
#import "MWGraphStatus.h"

@implementation MWMoscowMetro

- (id)init
{
    // Инициализируем
    self = [super init];
    
    [self setIdentifier:@"moscow_metro"];
//    [self setMinimumZoomScale: 0.15];
//    [self setMaximumZoomScale: 1.2];
//    [self setInitialZoomScale: 0.25];
//    [self setContentOffset:CGPointMake(197, 162)];
    
    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Сокольническая линия
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"1. Сокольническая линия";
    line0001.nameEnglish = @"Sokolnicheskaya Line";
    line0001.color = [UIColor colorWithRed:(237/255.0) green:(27/255.0) blue:(53/255.0) alpha:1];
    [self.lines addObject:line0001];
    
    // 2. Замоскворецкая линия
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"2. Замоскворецкая линия";
    line0002.nameEnglish = @"Zamoskvoretskaya Line";
    line0002.color = [UIColor colorWithRed:(71/255.0) green:(175/255.0) blue:(79/255.0) alpha:1];
    [self.lines addObject:line0002];
    
    // 3. Арбатско-Покровская линия
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"3. Арбатско-Покровская линия";
    line0003.nameEnglish = @"Arbatsko-Pokrovskaya Line";
    line0003.color = [UIColor colorWithRed:(0/255.0) green:(114/255.0) blue:(186/255.0) alpha:1];
    [self.lines addObject:line0003];

    // 4. Филевская линия
    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"4. Филёвская линия";
    line0004.nameEnglish = @"Filyovskaya Line";
    line0004.color = [UIColor colorWithRed:(38/255.0) green:(188/255.0) blue:(239/255.0) alpha:1];
    [self.lines addObject:line0004];
    
    // 5. Кольцевая линия
    MWLine *line0005 = [[MWLine alloc] init];
    line0005.identifier = @"line0005";
    line0005.nameOriginal = @"5. Кольцевая линия";
    line0005.nameEnglish = @"Koltsevaya Line (Circle Line)";
    line0005.color = [UIColor colorWithRed:(145/255.0) green:(81/255.0) blue:(51/255.0) alpha:1];
    [self.lines addObject:line0005];
    
    // 6. Калужско-Рижская линия
    MWLine *line0006 = [[MWLine alloc] init];
    line0006.identifier = @"line0006";
    line0006.nameOriginal = @"6. Калужско-Рижская линия";
    line0006.nameEnglish = @"Kaluzhsko-Rizhskaya Line";
    line0006.color = [UIColor colorWithRed:(240/255.0) green:(126/255.0) blue:(33/255.0) alpha:1];
    [self.lines addObject:line0006];
    
    // 7. Таганско-Краснопресненская линия
    MWLine *line0007 = [[MWLine alloc] init];
    line0007.identifier = @"line0007";
    line0007.nameOriginal = @"7. Таганско-Краснопресненская линия";
    line0007.nameEnglish = @"Tagansko-Krasnopresnenskaya Line";
    line0007.color = [UIColor colorWithRed:(148/255.0) green:(62/255.0) blue:(144/255.0) alpha:1];
    [self.lines addObject:line0007];
    
    // 8. Калининская линия
    MWLine *line0008 = [[MWLine alloc] init];
    line0008.identifier = @"line0008";
    line0008.nameOriginal = @"8. Калининская линия";
    line0008.nameEnglish = @"Kalininskaya Line";
    line0008.color = [UIColor colorWithRed:(254/255.0) green:(205/255.0) blue:(31/255.0) alpha:1];
    [self.lines addObject:line0008];
    
    // 9. Серпуховско-Тимирязевская линия
    MWLine *line0009 = [[MWLine alloc] init];
    line0009.identifier = @"line0009";
    line0009.nameOriginal = @"9. Серпуховско-Тимирязевская линия";
    line0009.nameEnglish = @"Serpukhovsko-Timiryazevskaya Line";
    line0009.color = [UIColor colorWithRed:(172/255.0) green:(171/255.0) blue:(172/255.0) alpha:1];
    [self.lines addObject:line0009];
    
    // 10. Люблинская линия
    MWLine *line0010 = [[MWLine alloc] init];
    line0010.identifier = @"line0010";
    line0010.nameOriginal = @"10. Люблинская линия";
    line0010.nameEnglish = @"Lyublinsko-Dmitrovskaya Line";
    line0010.color = [UIColor colorWithRed:(189/255.0) green:(209/255.0) blue:(37	/255.0) alpha:1];
    [self.lines addObject:line0010];
    
    // 11. Каховская линия
    MWLine *line0011 = [[MWLine alloc] init];
    line0011.identifier = @"line0011";
    line0011.nameOriginal = @"11. Каховская линия";
    line0011.nameEnglish = @"Kakhovskaya Line";
    line0011.color = [UIColor colorWithRed:(136/255.0) green:(204/255.0) blue:(207/255.0) alpha:1];
    [self.lines addObject:line0011];
    
    // 12. Бутовская линия
    MWLine *line0012 = [[MWLine alloc] init];
    line0012.identifier = @"line0012";
    line0012.nameOriginal = @"12. Бутовская линия";
    line0012.nameEnglish = @"Butovskaya Line";
    line0012.color = [UIColor colorWithRed:(185/255.0) green:(199/255.0) blue:(231/255.0) alpha:1];
    [self.lines addObject:line0012];
    
    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0010];
    [self.drawLinesOrder addObject:line0006];
    [self.drawLinesOrder addObject:line0009];
    [self.drawLinesOrder addObject:line0007];
    [self.drawLinesOrder addObject:line0008];
    [self.drawLinesOrder addObject:line0005];
    [self.drawLinesOrder addObject:line0002];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0004];
    [self.drawLinesOrder addObject:line0011];
    [self.drawLinesOrder addObject:line0012];
    
    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Румянцево
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Румянцево";
    [self.vertices addObject:vertex0001];
    
    // Парк культуры
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Парк культуры";
    [self.vertices addObject:vertex0002];
    
    MWDrawGradientRect *drawGradientRect0001 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0001.startColor = line0001.color;
    drawGradientRect0001.endColor = line0005.color;
    drawGradientRect0001.point1 = CGPointMake(963, 2024);
    drawGradientRect0001.point2 = CGPointMake(980, 2024);
    drawGradientRect0001.point3 = CGPointMake(980, 2058);
    drawGradientRect0001.point4 = CGPointMake(962, 2058);
    [vertex0002.drawPrimitives addObject:drawGradientRect0001];
    
    MWDrawArc *drawArc0064 = [[MWDrawArc alloc] init];
    drawArc0064.center = CGPointMake(971, 2007);
    drawArc0064.startRadians = M_PI * 2;
    drawArc0064.endRadians = 0;
    drawArc0064.radius = 14;
    drawArc0064.width = 10;
    drawArc0064.color = line0001.color;
    [vertex0002.drawPrimitives addObject:drawArc0064];

    MWDrawArc *drawArc0065 = [[MWDrawArc alloc] init];
    drawArc0065.center = CGPointMake(971, 2075);
    drawArc0065.startRadians = M_PI * 2;
    drawArc0065.endRadians = 0;
    drawArc0065.radius = 14;
    drawArc0065.width = 10;
    drawArc0065.color = line0005.color;
    [vertex0002.drawPrimitives addObject:drawArc0065];
    
    MWDrawLine *drawLine0341 = [[MWDrawLine alloc] init];
    drawLine0341.startPoint = CGPointMake(971, 2007);
    drawLine0341.endPoint = CGPointMake(971, 2075);
    drawLine0341.width = 6;
    drawLine0341.color = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:drawLine0341];
    
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(971, 2007);
    fillCircle0001.radius = 9;
    fillCircle0001.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = CGPointMake(971, 2075);
    fillCircle0002.radius = 9;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0002];
    
    // Библиотека им. Ленина - Боровицкая - Арбатская - Александровский сад
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Библиотека им. Ленина - Боровицкая - Арбатская - Александровский сад";
    [self.vertices addObject:vertex0003];
    
    /*
    MMDrawGradientArc *drawGradientArc0001 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0001.startColor = line0001.color;
    drawGradientArc0001.endColor = line0009.color;
    drawGradientArc0001.width = 6;
    drawGradientArc0001.center = CGPointMake(1182, 1856.5);
    drawGradientArc0001.startGradient = CGPointMake(1235, 1907);
    drawGradientArc0001.endGradient = CGPointMake(1130, 1907);
    drawGradientArc0001.radius = 70;
    drawGradientArc0001.startRadians = 44 * M_PI / 180;
    drawGradientArc0001.endRadians = 136 * M_PI / 180;
    [vertex0003.drawPrimitives addObject:drawGradientArc0001];

    MMDrawGradientArc *drawGradientArc0002 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0002.startColor = line0001.color;
    drawGradientArc0002.endColor = line0009.color;
    drawGradientArc0002.width = 6;
    drawGradientArc0002.center = CGPointMake(1182, 1856.5);
    drawGradientArc0002.startGradient = CGPointMake(1235, 1907);
    drawGradientArc0002.endGradient = CGPointMake(1144, 1907);
    drawGradientArc0002.radius = 58;
    drawGradientArc0002.startRadians = 44 * M_PI / 180;
    drawGradientArc0002.endRadians = 136 * M_PI / 180;
    [vertex0003.drawPrimitives addObject:drawGradientArc0002];
*/
     
    MWDrawGradientArc *drawGradientArc0001 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0001.startColor = line0001.color;
    drawGradientArc0001.endColor = line0009.color;
    drawGradientArc0001.width = 18;
    drawGradientArc0001.center = CGPointMake(1182, 1856.5);
    drawGradientArc0001.startGradient = CGPointMake(1235, 1907);
    drawGradientArc0001.endGradient = CGPointMake(1130, 1907);
    drawGradientArc0001.radius = 64;
    drawGradientArc0001.startRadians = 44 * M_PI / 180;
    drawGradientArc0001.endRadians = 136 * M_PI / 180;
    [vertex0003.drawPrimitives addObject:drawGradientArc0001];

    MWDrawGradientArc *drawGradientArc0003 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0003.startColor = line0009.color;
    drawGradientArc0003.endColor = line0003.color;
    drawGradientArc0003.width = 18;
    drawGradientArc0003.center = CGPointMake(1182, 1856.5);
    drawGradientArc0003.startGradient = CGPointMake(1113, 1867);
    drawGradientArc0003.endGradient = CGPointMake(1158, 1794);
    drawGradientArc0003.radius = 64;
    drawGradientArc0003.startRadians = 166 * M_PI / 180;
    drawGradientArc0003.endRadians = 254 * M_PI / 180;
    [vertex0003.drawPrimitives addObject:drawGradientArc0003];

    MWDrawGradientArc *drawGradientArc0004 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0004.startColor = line0003.color;
    drawGradientArc0004.endColor = line0001.color;
    drawGradientArc0004.width = 18;
    drawGradientArc0004.center = CGPointMake(1182, 1856.5);
    drawGradientArc0004.startGradient = CGPointMake(1220, 1787);
    drawGradientArc0004.endGradient = CGPointMake(1253, 1869);
    drawGradientArc0004.radius = 64;
    drawGradientArc0004.startRadians = 284 * M_PI / 180;
    drawGradientArc0004.endRadians = 14 * M_PI / 180;
    [vertex0003.drawPrimitives addObject:drawGradientArc0004];
    
    MWDrawGradientArc *drawGradientArc0005 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0005.startColor = line0001.color;
    drawGradientArc0005.endColor = line0004.color;
    drawGradientArc0005.width = 18;
    drawGradientArc0005.center = CGPointMake(1236.5, 1824);
    drawGradientArc0005.startGradient = CGPointMake(1219, 1894);
    drawGradientArc0005.endGradient = CGPointMake(1186, 1874);
    drawGradientArc0005.radius = 64;
    drawGradientArc0005.startRadians = 104 * M_PI / 180;
    drawGradientArc0005.endRadians = 135 * M_PI / 180;
    [vertex0003.drawPrimitives addObject:drawGradientArc0005];
    
    MWDrawGradientArc *drawGradientArc0006 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0006.startColor = line0004.color;
    drawGradientArc0006.endColor = line0003.color;
    drawGradientArc0006.width = 18;
    drawGradientArc0006.center = CGPointMake(1236.5, 1824);
    drawGradientArc0006.startGradient = CGPointMake(1167, 1839);
    drawGradientArc0006.endGradient = CGPointMake(1166, 1804);
    drawGradientArc0006.radius = 64;
    drawGradientArc0006.startRadians = 165 * M_PI / 180;
    drawGradientArc0006.endRadians = 198 * M_PI / 180;
    [vertex0003.drawPrimitives addObject:drawGradientArc0006];

    MWDrawArc *drawArc0066 = [[MWDrawArc alloc] init];
    drawArc0066.center = CGPointMake(1237, 1889);
    drawArc0066.startRadians = M_PI * 2;
    drawArc0066.endRadians = 0;
    drawArc0066.radius = 14;
    drawArc0066.width = 10;
    drawArc0066.color = line0001.color;
    [vertex0003.drawPrimitives addObject:drawArc0066];

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = CGPointMake(1237, 1889);
    fillCircle0003.radius = 9;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0003];
    
    MWDrawArc *drawArc0067 = [[MWDrawArc alloc] init];
    drawArc0067.center = CGPointMake(1126.5, 1888.5);
    drawArc0067.startRadians = M_PI * 2;
    drawArc0067.endRadians = 0;
    drawArc0067.radius = 14;
    drawArc0067.width = 10;
    drawArc0067.color = line0009.color;
    [vertex0003.drawPrimitives addObject:drawArc0067];

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = CGPointMake(1126.5, 1888.5);
    fillCircle0004.radius = 9;
    fillCircle0004.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0004];

    MWDrawArc *drawArc0068 = [[MWDrawArc alloc] init];
    drawArc0068.center = CGPointMake(1181, 1792);
    drawArc0068.startRadians = M_PI * 2;
    drawArc0068.endRadians = 0;
    drawArc0068.radius = 14;
    drawArc0068.width = 10;
    drawArc0068.color = line0003.color;
    [vertex0003.drawPrimitives addObject:drawArc0068];
    
    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = CGPointMake(1181, 1792	);
    fillCircle0005.radius = 9;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0005];
    
    MWDrawArc *drawArc0069 = [[MWDrawArc alloc] init];
    drawArc0069.center = CGPointMake(1181.5, 1856.5);
    drawArc0069.startRadians = M_PI * 2;
    drawArc0069.endRadians = 0;
    drawArc0069.radius = 14;
    drawArc0069.width = 10;
    drawArc0069.color = line0004.color;
    [vertex0003.drawPrimitives addObject:drawArc0069];

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = CGPointMake(1181.5, 1856.5);
    fillCircle0006.radius = 9;
    fillCircle0006.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0006];
    
    MWDrawArc *drawArc0070 = [[MWDrawArc alloc] init];
    drawArc0070.center = CGPointMake(1182, 1856.5);
    drawArc0070.startRadians = M_PI * 2;
    drawArc0070.endRadians = 0;
    drawArc0070.radius = 64;
    drawArc0070.width = 5.5;
    drawArc0070.color = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:drawArc0070];

    MWDrawArc *drawArc0071 = [[MWDrawArc alloc] init];
    drawArc0071.center = CGPointMake(1236.5, 1824);
    drawArc0071.startRadians = 90 * M_PI / 180;
    drawArc0071.endRadians = 215 * M_PI / 180;
    drawArc0071.radius = 64;
    drawArc0071.width = 5.5;
    drawArc0071.color = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:drawArc0071];

    // Охотный Ряд - Театральная - Пл. Революции
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Охотный Ряд - Театральная - Пл. Революции";
    [self.vertices addObject:vertex0004];
    
    MWDrawGradientRect *drawGradientRect0002 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0002.startColor = line0001.color;
    drawGradientRect0002.endColor = line0002.color;
    drawGradientRect0002.point1 = CGPointMake(1461, 1689);
    drawGradientRect0002.point2 = CGPointMake(1473, 1678);
    drawGradientRect0002.point3 = CGPointMake(1486, 1691);
    drawGradientRect0002.point4 = CGPointMake(1474, 1702);
    [vertex0004.drawPrimitives addObject:drawGradientRect0002];

    MWDrawGradientRect *drawGradientRect0003 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0003.startColor = line0002.color;
    drawGradientRect0003.endColor = line0003.color;
    drawGradientRect0003.point1 = CGPointMake(1497, 1725);
    drawGradientRect0003.point2 = CGPointMake(1509, 1714);
    drawGradientRect0003.point3 = CGPointMake(1521, 1726);
    drawGradientRect0003.point4 = CGPointMake(1509, 1737);
    [vertex0004.drawPrimitives addObject:drawGradientRect0003];

    MWDrawArc *drawArc0072 = [[MWDrawArc alloc] init];
    drawArc0072.center = CGPointMake(1455, 1671);
    drawArc0072.startRadians = M_PI * 2;
    drawArc0072.endRadians = 0;
    drawArc0072.radius = 14;
    drawArc0072.width = 10;
    drawArc0072.color = line0001.color;
    [vertex0004.drawPrimitives addObject:drawArc0072];
    
    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = CGPointMake(1455, 1671);
    fillCircle0007.radius = 9;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0007];
    
    MWDrawArc *drawArc0073 = [[MWDrawArc alloc] init];
    drawArc0073.center = CGPointMake(1491.5, 1707.5);
    drawArc0073.startRadians = M_PI * 2;
    drawArc0073.endRadians = 0;
    drawArc0073.radius = 14;
    drawArc0073.width = 10;
    drawArc0073.color = line0002.color;
    [vertex0004.drawPrimitives addObject:drawArc0073];
    
    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = CGPointMake(1491.5, 1707.5);
    fillCircle0008.radius = 9;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0008];

    MWDrawArc *drawArc0074 = [[MWDrawArc alloc] init];
    drawArc0074.center = CGPointMake(1527, 1743.5);
    drawArc0074.startRadians = M_PI * 2;
    drawArc0074.endRadians = 0;
    drawArc0074.radius = 14;
    drawArc0074.width = 10;
    drawArc0074.color = line0003.color;
    [vertex0004.drawPrimitives addObject:drawArc0074];
    
    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = CGPointMake(1527, 1743.5);
    fillCircle0009.radius = 9;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0009];
    
    MWDrawLine *drawLine0342 = [[MWDrawLine alloc] init];
    drawLine0342.startPoint = CGPointMake(1455, 1671);
    drawLine0342.endPoint = CGPointMake(1527, 1743.5 );
    drawLine0342.width = 5;
    drawLine0342.color = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:drawLine0342];
    
    // Кузнецкий Мост - Лубянка
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Кузнецкий Мост - Лубянка";
    [self.vertices addObject:vertex0005];

    MWDrawGradientRect *drawGradientRect0004 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0004.startColor = line0007.color;
    drawGradientRect0004.endColor = line0001.color;
    drawGradientRect0004.point1 = CGPointMake(1558, 1494);
    drawGradientRect0004.point2 = CGPointMake(1570, 1483);
    drawGradientRect0004.point3 = CGPointMake(1595, 1508);
    drawGradientRect0004.point4 = CGPointMake(1583, 1519);
    [vertex0005.drawPrimitives addObject:drawGradientRect0004];

    MWDrawArc *drawArc0075 = [[MWDrawArc alloc] init];
    drawArc0075.center = CGPointMake(1552.5, 1477.5);
    drawArc0075.startRadians = M_PI * 2;
    drawArc0075.endRadians = 0;
    drawArc0075.radius = 14;
    drawArc0075.width = 10;
    drawArc0075.color = line0007.color;
    [vertex0005.drawPrimitives addObject:drawArc0075];
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = CGPointMake(1552.5, 1477.5);
    fillCircle0010.radius = 9;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0010];

    MWDrawArc *drawArc0076 = [[MWDrawArc alloc] init];
    drawArc0076.center = CGPointMake(1601, 1525);
    drawArc0076.startRadians = M_PI * 2;
    drawArc0076.endRadians = 0;
    drawArc0076.radius = 14;
    drawArc0076.width = 10;
    drawArc0076.color = line0001.color;
    [vertex0005.drawPrimitives addObject:drawArc0076];
    
    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = CGPointMake(1601, 1525);
    fillCircle0011.radius = 9;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0011];

    MWDrawLine *drawLine0343 = [[MWDrawLine alloc] init];
    drawLine0343.startPoint = CGPointMake(1552.5, 1477.5);
    drawLine0343.endPoint = CGPointMake(1601, 1525);
    drawLine0343.width = 5;
    drawLine0343.color = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:drawLine0343];
    
    // Чистые пруды - Тургеневская - Сретенский бульвар
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Чистые пруды - Тургеневская - Сретенский бульвар";
    [self.vertices addObject:vertex0006];

    MWDrawGradientArc *drawGradientArc0007 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0007.startColor = line0006.color;
    drawGradientArc0007.endColor = line0001.color;
    drawGradientArc0007.width = 16; // 18
    drawGradientArc0007.center = CGPointMake(1681, 1393);
    drawGradientArc0007.startGradient = CGPointMake(1666, 1400);
    drawGradientArc0007.endGradient = CGPointMake(1696, 1400);
    drawGradientArc0007.radius = 37.5;
    drawGradientArc0007.startRadians = 55 * M_PI / 180;
    drawGradientArc0007.endRadians = 120 * M_PI / 180;
    [vertex0006.drawPrimitives addObject:drawGradientArc0007];

    MWDrawGradientArc *drawGradientArc0008 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0008.startColor = line0006.color;
    drawGradientArc0008.endColor = line0010.color;
    drawGradientArc0008.width = 16; // 18
    drawGradientArc0008.center = CGPointMake(1682, 1393);
    drawGradientArc0008.startGradient = CGPointMake(1635, 1391);
    drawGradientArc0008.endGradient = CGPointMake(1658, 1359);
    drawGradientArc0008.radius = 37.5;
    drawGradientArc0008.startRadians = 176 * M_PI / 180;
    drawGradientArc0008.endRadians = 244 * M_PI / 180;
    [vertex0006.drawPrimitives addObject:drawGradientArc0008];

    MWDrawGradientArc *drawGradientArc0009 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0009.startColor = line0010.color;
    drawGradientArc0009.endColor = line0001.color;
    drawGradientArc0009.width = 16; // 18
    drawGradientArc0009.center = CGPointMake(1682, 1393);
    drawGradientArc0009.startGradient = CGPointMake(1695, 1365);
    drawGradientArc0009.endGradient = CGPointMake(1720, 1400);
    drawGradientArc0009.radius = 37.5;
    drawGradientArc0009.startRadians = 298 * M_PI / 180;
    drawGradientArc0009.endRadians = 3 * M_PI / 180;
    [vertex0006.drawPrimitives addObject:drawGradientArc0009];

    MWDrawArc *drawArc0077 = [[MWDrawArc alloc] init];
    drawArc0077.center = CGPointMake(1714, 1412);
    drawArc0077.startRadians = M_PI * 2;
    drawArc0077.endRadians = 0;
    drawArc0077.radius = 14;
    drawArc0077.width = 10;
    drawArc0077.color = line0001.color;
    [vertex0006.drawPrimitives addObject:drawArc0077];
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = CGPointMake(1714, 1412);
    fillCircle0012.radius = 9;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:fillCircle0012];

    MWDrawArc *drawArc0078 = [[MWDrawArc alloc] init];
    drawArc0078.center = CGPointMake(1681.5, 1356.5);
    drawArc0078.startRadians = M_PI * 2;
    drawArc0078.endRadians = 0;
    drawArc0078.radius = 14;
    drawArc0078.width = 10;
    drawArc0078.color = line0010.color;
    [vertex0006.drawPrimitives addObject:drawArc0078];
    
    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = CGPointMake(1681.5, 1356.5);
    fillCircle0013.radius = 9;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:fillCircle0013];

    MWDrawArc *drawArc0079 = [[MWDrawArc alloc] init];
    drawArc0079.center = CGPointMake(1649.5, 1412.5);
    drawArc0079.startRadians = M_PI * 2;
    drawArc0079.endRadians = 0;
    drawArc0079.radius = 14;
    drawArc0079.width = 10;
    drawArc0079.color = line0006.color;
    [vertex0006.drawPrimitives addObject:drawArc0079];
    
    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = CGPointMake(1649.5, 1412.5);
    fillCircle0014.radius = 9;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:fillCircle0014];

    MWDrawArc *drawArc0080 = [[MWDrawArc alloc] init];
    drawArc0080.center = CGPointMake(1682, 1393);
    drawArc0080.startRadians = M_PI * 2;
    drawArc0080.endRadians = 0;
    drawArc0080.radius = 37.5;
    drawArc0080.width = 5.5;
    drawArc0080.color = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:drawArc0080];
    
    // Комсомольская
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Комсомольская";
    [self.vertices addObject:vertex0007];
    
    MWDrawGradientRect *drawGradientRect0005 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0005.startColor = line0001.color;
    drawGradientRect0005.endColor = line0005.color;
    drawGradientRect0005.point1 = CGPointMake(1912, 1222);
    drawGradientRect0005.point2 = CGPointMake(1930, 1222);
    drawGradientRect0005.point3 = CGPointMake(1930, 1257);
    drawGradientRect0005.point4 = CGPointMake(1912, 1257);
    [vertex0007.drawPrimitives addObject:drawGradientRect0005];
    
    MWDrawArc *drawArc0081 = [[MWDrawArc alloc] init];
    drawArc0081.center = CGPointMake(1920.5, 1205.5);
    drawArc0081.startRadians = M_PI * 2;
    drawArc0081.endRadians = 0;
    drawArc0081.radius = 14;
    drawArc0081.width = 10;
    drawArc0081.color = line0001.color;
    [vertex0007.drawPrimitives addObject:drawArc0081];
    
    MWDrawArc *drawArc0082 = [[MWDrawArc alloc] init];
    drawArc0082.center = CGPointMake(1920.5, 1273.5);
    drawArc0082.startRadians = M_PI * 2;
    drawArc0082.endRadians = 0;
    drawArc0082.radius = 14;
    drawArc0082.width = 10;
    drawArc0082.color = line0005.color;
    [vertex0007.drawPrimitives addObject:drawArc0082];
    
    MWDrawLine *drawLine0344 = [[MWDrawLine alloc] init];
    drawLine0344.startPoint = CGPointMake(1921, 1205.5);
    drawLine0344.endPoint = CGPointMake(1921, 1273.5);
    drawLine0344.width = 6;
    drawLine0344.color = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:drawLine0344];

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = CGPointMake(1920.5, 1205.5);
    fillCircle0015.radius = 9;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0015];
    
    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = CGPointMake(1920.5, 1273.5);
    fillCircle0016.radius = 9;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0016];
    
    // Бульвар Рокоссовского
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Бульвар Рокоссовского";
    [self.vertices addObject:vertex0008];
    
    // Алма-Атинская
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Алма-Атинская";
    [self.vertices addObject:vertex0009];
    
    // Красногвардейская - Зябликово
    MWVertex *vertex0010 = [[MWVertex alloc] init];
    vertex0010.identifier = @"vertex0010";
    vertex0010.developmentName = @"Вершина: Красногвардейская - Зябликово";
    [self.vertices addObject:vertex0010];

    MWDrawGradientRect *drawGradientRect0006 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0006.startColor = line0010.color;
    drawGradientRect0006.endColor = line0002.color;
    drawGradientRect0006.point1 = CGPointMake(2003, 3004);
    drawGradientRect0006.point2 = CGPointMake(2015, 2993);
    drawGradientRect0006.point3 = CGPointMake(2040, 3018);
    drawGradientRect0006.point4 = CGPointMake(2028, 3029);
    [vertex0010.drawPrimitives addObject:drawGradientRect0006];
    
    MWDrawArc *drawArc0083 = [[MWDrawArc alloc] init];
    drawArc0083.center = CGPointMake(1997.5, 2986.5);
    drawArc0083.startRadians = M_PI * 2;
    drawArc0083.endRadians = 0;
    drawArc0083.radius = 14;
    drawArc0083.width = 10;
    drawArc0083.color = line0010.color;
    [vertex0010.drawPrimitives addObject:drawArc0083];
    
    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = CGPointMake(1997.5, 2986.5);
    fillCircle0017.radius = 9;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:fillCircle0017];
    
    MWDrawArc *drawArc0084 = [[MWDrawArc alloc] init];
    drawArc0084.center = CGPointMake(2045, 3035);
    drawArc0084.startRadians = M_PI * 2;
    drawArc0084.endRadians = 0;
    drawArc0084.radius = 14;
    drawArc0084.width = 10;
    drawArc0084.color = line0002.color;
    [vertex0010.drawPrimitives addObject:drawArc0084];
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = CGPointMake(2045, 3035);
    fillCircle0018.radius = 9;
    fillCircle0018.fillColor = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:fillCircle0018];
    
    MWDrawLine *drawLine0345 = [[MWDrawLine alloc] init];
    drawLine0345.startPoint = CGPointMake(1997.5, 2986.5);
    drawLine0345.endPoint = CGPointMake(2045, 3035);
    drawLine0345.width = 5;
    drawLine0345.color = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:drawLine0345];
    
    // Каширская
    MWVertex *vertex0011 = [[MWVertex alloc] init];
    
    vertex0011.developmentName = @"Вершина: Каширская";
    vertex0011.identifier = @"vertex0011";
    [self.vertices addObject:vertex0011];

    MWDrawGradientRect *drawGradientRect0007 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0007.startColor = line0002.color;
    drawGradientRect0007.endColor = line0011.color;
    drawGradientRect0007.point1 = CGPointMake(1694, 2595);
    drawGradientRect0007.point2 = CGPointMake(1706, 2584);
    drawGradientRect0007.point3 = CGPointMake(1720, 2597);
    drawGradientRect0007.point4 = CGPointMake(1708, 2608);
    [vertex0011.drawPrimitives addObject:drawGradientRect0007];
    
    MWDrawArc *drawArc0085 = [[MWDrawArc alloc] init];
    drawArc0085.center = CGPointMake(1689, 2578.5);
    drawArc0085.startRadians = M_PI * 2;
    drawArc0085.endRadians = 0;
    drawArc0085.radius = 14;
    drawArc0085.width = 10;
    drawArc0085.color = line0002.color;
    [vertex0011.drawPrimitives addObject:drawArc0085];
    
    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = CGPointMake(1689, 2578.5);
    fillCircle0019.radius = 9;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:fillCircle0019];
    
    MWDrawArc *drawArc0086 = [[MWDrawArc alloc] init];
    drawArc0086.center = CGPointMake(1724.5, 2614.5);
    drawArc0086.startRadians = M_PI * 2;
    drawArc0086.endRadians = 0;
    drawArc0086.radius = 14;
    drawArc0086.width = 10;
    drawArc0086.color = line0011.color;
    [vertex0011.drawPrimitives addObject:drawArc0086];
    
    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = CGPointMake(1724.5, 2614.5);
    fillCircle0020.radius = 9;
    fillCircle0020.fillColor = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:fillCircle0020];
    
    MWDrawLine *drawLine0346 = [[MWDrawLine alloc] init];
    drawLine0346.startPoint = CGPointMake(1689, 2579);
    drawLine0346.endPoint = CGPointMake(1724.5, 2613);
    drawLine0346.width = 5;
    drawLine0346.color = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:drawLine0346];
    
    // Павелецкая
    MWVertex *vertex0012 = [[MWVertex alloc] init];
    vertex0012.identifier = @"vertex0012";
    vertex0012.developmentName = @"Вершина: Павелецкая";
    [self.vertices addObject:vertex0012];
    
    MWDrawGradientRect *drawGradientRect0008 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0008.startColor = line0002.color;
    drawGradientRect0008.endColor = line0005.color;
    drawGradientRect0008.point1 = CGPointMake(1698.5, 2236.5);
    drawGradientRect0008.point2 = CGPointMake(1693.5, 2231.5);
    drawGradientRect0008.point3 = CGPointMake(1716, 2209);
    drawGradientRect0008.point4 = CGPointMake(1725, 2211.5);
    [vertex0012.drawPrimitives addObject:drawGradientRect0008];

    MWDrawGradientRect *drawGradientRect0009 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0009.startColor = line0002.color;
    drawGradientRect0009.endColor = line0005.color;
    drawGradientRect0009.point1 = CGPointMake(1706.5, 2245.5);
    drawGradientRect0009.point2 = CGPointMake(1703.5, 2238.5);
    drawGradientRect0009.point3 = CGPointMake(1725, 2215);
    drawGradientRect0009.point4 = CGPointMake(1734, 2216.5);
    [vertex0012.drawPrimitives addObject:drawGradientRect0009];
    
    MWDrawArc *drawArc0087 = [[MWDrawArc alloc] init];
    drawArc0087.center = CGPointMake(1689, 2249);
    drawArc0087.startRadians = M_PI * 2;
    drawArc0087.endRadians = 0;
    drawArc0087.radius = 14;
    drawArc0087.width = 10;
    drawArc0087.color = line0002.color;
    [vertex0012.drawPrimitives addObject:drawArc0087];
    
    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = CGPointMake(1689, 2249);
    fillCircle0021.radius = 9;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:fillCircle0021];
    
    MWDrawArc *drawArc0088 = [[MWDrawArc alloc] init];
    drawArc0088.center = CGPointMake(1736.5, 2201.5);
    drawArc0088.startRadians = M_PI * 2;
    drawArc0088.endRadians = 0;
    drawArc0088.radius = 14;
    drawArc0088.width = 10;
    drawArc0088.color = line0005.color;
    [vertex0012.drawPrimitives addObject:drawArc0088];
    
    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = CGPointMake(1736.5, 2201.5);
    fillCircle0022.radius = 9;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:fillCircle0022];
    
    MWDrawLine *drawLine0347 = [[MWDrawLine alloc] init];
    drawLine0347.startPoint = CGPointMake(1689, 2249.5);
    drawLine0347.endPoint = CGPointMake(1736.5, 2201.5);
    drawLine0347.width = 5;
    drawLine0347.color = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:drawLine0347];
    
    // Новокузнецкая - Третьяковская
    MWVertex *vertex0013 = [[MWVertex alloc] init];
    vertex0013.identifier = @"vertex0013";
    vertex0013.developmentName = @"Вершина: Новокузценкая - Третьяковская";
    [self.vertices addObject:vertex0013];
/*
    MMDrawGradientArc *drawGradientArc0010 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0010.startColor = line0006.color;
    drawGradientArc0010.endColor = line0002.color;
    drawGradientArc0010.width = 6.5;
    drawGradientArc0010.center = CGPointMake(1661.5, 2019.5);
    drawGradientArc0010.startGradient = CGPointMake(1622, 2011);
    drawGradientArc0010.endGradient = CGPointMake(1685, 1991);
    drawGradientArc0010.radius = 43.5;
    drawGradientArc0010.startRadians = 204 * M_PI / 180;
    drawGradientArc0010.endRadians = 293 * M_PI / 180;
    [vertex0013.drawPrimitives addObject:drawGradientArc0010];

    MMDrawGradientArc *drawGradientArc0011 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0011.startColor = line0006.color;
    drawGradientArc0011.endColor = line0002.color;
    drawGradientArc0011.width = 6.5;
    drawGradientArc0011.center = CGPointMake(1661.5, 2019.5);
    drawGradientArc0011.startGradient = CGPointMake(1633, 2004);
    drawGradientArc0011.endGradient = CGPointMake(1673, 1993);
    drawGradientArc0011.radius = 31.5;
    drawGradientArc0011.startRadians = 204 * M_PI / 180;
    drawGradientArc0011.endRadians = 293 * M_PI / 180;
    [vertex0013.drawPrimitives addObject:drawGradientArc0011]; */

    MWDrawGradientArc *drawGradientArc0010 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0010.startColor = line0006.color;
    drawGradientArc0010.endColor = line0002.color;
    drawGradientArc0010.width = 18;
    drawGradientArc0010.center = CGPointMake(1661.5, 2019.5);
    drawGradientArc0010.startGradient = CGPointMake(1619, 2001);
    drawGradientArc0010.endGradient = CGPointMake(1680, 1976);
    drawGradientArc0010.radius = 37.5;
    drawGradientArc0010.startRadians = 204 * M_PI / 180;
    drawGradientArc0010.endRadians = 293 * M_PI / 180;
    [vertex0013.drawPrimitives addObject:drawGradientArc0010];
    
/*    MMDrawGradientArc *drawGradientArc0012 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0012.startColor = line0002.color;
    drawGradientArc0012.endColor = line0008.color;
    drawGradientArc0012.width = 6.5;
    drawGradientArc0012.center = CGPointMake(1661.5, 2019.5);
    drawGradientArc0012.startGradient = CGPointMake(1670, 2003);
    drawGradientArc0012.endGradient = CGPointMake(1670, 2062);
    drawGradientArc0012.radius = 43.5;
    drawGradientArc0012.startRadians = 339 * M_PI / 180;
    drawGradientArc0012.endRadians = 66 * M_PI / 180;
    [vertex0013.drawPrimitives addObject:drawGradientArc0012];

    MMDrawGradientArc *drawGradientArc0013 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0013.startColor = line0002.color;
    drawGradientArc0013.endColor = line0008.color;
    drawGradientArc0013.width = 6.5;
    drawGradientArc0013.center = CGPointMake(1661.5, 2019.5);
    drawGradientArc0013.startGradient = CGPointMake(1670, 2009);
    drawGradientArc0013.endGradient = CGPointMake(1670, 2050);
    drawGradientArc0013.radius = 31.5;
    drawGradientArc0013.startRadians = 338 * M_PI / 180;
    drawGradientArc0013.endRadians = 60 * M_PI / 180;
    [vertex0013.drawPrimitives addObject:drawGradientArc0013]; */

    MWDrawGradientArc *drawGradientArc0012 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0012.startColor = line0002.color;
    drawGradientArc0012.endColor = line0008.color;
    drawGradientArc0012.width = 18;
    drawGradientArc0012.center = CGPointMake(1661.5, 2019.5);
    drawGradientArc0012.startGradient = CGPointMake(1670, 2003);
    drawGradientArc0012.endGradient = CGPointMake(1670, 2062);
    drawGradientArc0012.radius = 37.5;
    drawGradientArc0012.startRadians = 339 * M_PI / 180;
    drawGradientArc0012.endRadians = 66 * M_PI / 180;
    [vertex0013.drawPrimitives addObject:drawGradientArc0012];

/*    MMDrawGradientArc *drawGradientArc0014 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0014.startColor = line0006.color;
    drawGradientArc0014.endColor = line0008.color;
    drawGradientArc0014.width = 6.5;
    drawGradientArc0014.center = CGPointMake(1661.5, 2019.5);
    drawGradientArc0014.startGradient = CGPointMake(1627, 2047);
    drawGradientArc0014.endGradient = CGPointMake(1643, 2053.5);
    drawGradientArc0014.radius = 31.5;
    drawGradientArc0014.startRadians = 120 * M_PI / 180;
    drawGradientArc0014.endRadians = 150 * M_PI / 180;
    [vertex0013.drawPrimitives addObject:drawGradientArc0014];
    
    MMDrawGradientArc *drawGradientArc0015 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0015.startColor = line0006.color;
    drawGradientArc0015.endColor = line0008.color;
    drawGradientArc0015.width = 6.5;
    drawGradientArc0015.center = CGPointMake(1661.5, 2019.5);
    drawGradientArc0015.startGradient = CGPointMake(1645, 2031);
    drawGradientArc0015.endGradient = CGPointMake(1652, 2062);
    drawGradientArc0015.radius = 43.5;
    drawGradientArc0015.startRadians = 114 * M_PI / 180;
    drawGradientArc0015.endRadians = 156 * M_PI / 180;
    [vertex0013.drawPrimitives addObject:drawGradientArc0015]; */
  
    MWDrawGradientArc *drawGradientArc0014 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0014.startColor = line0006.color;
    drawGradientArc0014.endColor = line0008.color;
    drawGradientArc0014.width = 18;
    drawGradientArc0014.center = CGPointMake(1661.5, 2019.5);
    drawGradientArc0014.startGradient = CGPointMake(1618, 2039);
    drawGradientArc0014.endGradient = CGPointMake(1644, 2061.5);
    drawGradientArc0014.radius = 37.5;
    drawGradientArc0014.startRadians = 114 * M_PI / 180;
    drawGradientArc0014.endRadians = 156 * M_PI / 180;
    [vertex0013.drawPrimitives addObject:drawGradientArc0014];
    
    MWDrawArc *drawArc0089 = [[MWDrawArc alloc] init];
    drawArc0089.center = CGPointMake(1624.5, 2019.5);
    drawArc0089.startRadians = M_PI * 2;
    drawArc0089.endRadians = 0;
    drawArc0089.radius = 14;
    drawArc0089.width = 10;
    drawArc0089.color = line0006.color;
    [vertex0013.drawPrimitives addObject:drawArc0089];
    
    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = CGPointMake(1624.5, 2019.5);
    fillCircle0023.radius = 9;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [vertex0013.drawPrimitives addObject:fillCircle0023];
    
    MWDrawArc *drawArc0090 = [[MWDrawArc alloc] init];
    drawArc0090.center = CGPointMake(1661.5, 2056.5);
    drawArc0090.startRadians = M_PI * 2;
    drawArc0090.endRadians = 0;
    drawArc0090.radius = 14;
    drawArc0090.width = 10;
    drawArc0090.color = line0008.color;
    [vertex0013.drawPrimitives addObject:drawArc0090];
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = CGPointMake(1661.5, 2056.5);
    fillCircle0024.radius = 9;
    fillCircle0024.fillColor = [UIColor whiteColor];
    [vertex0013.drawPrimitives addObject:fillCircle0024];
    
    MWDrawArc *drawArc0091 = [[MWDrawArc alloc] init];
    drawArc0091.center = CGPointMake(1688.5, 1993);
    drawArc0091.startRadians = M_PI * 2;
    drawArc0091.endRadians = 0;
    drawArc0091.radius = 14;
    drawArc0091.width = 10;
    drawArc0091.color = line0002.color;
    [vertex0013.drawPrimitives addObject:drawArc0091];
    
    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = CGPointMake(1688.5, 1993);
    fillCircle0025.radius = 9;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [vertex0013.drawPrimitives addObject:fillCircle0025];
    
    MWDrawArc *drawArc0092 = [[MWDrawArc alloc] init];
    drawArc0092.center = CGPointMake(1661.5, 2019.5);
    drawArc0092.startRadians = M_PI * 2;
    drawArc0092.endRadians = 0;
    drawArc0092.radius = 37.5;
    drawArc0092.width = 6.5;
    drawArc0092.color = [UIColor whiteColor];
    [vertex0013.drawPrimitives addObject:drawArc0092];

    // Тверская - Пушкинская - Чеховская
    MWVertex *vertex0014 = [[MWVertex alloc] init];
    vertex0014.identifier = @"vertex0014";
    vertex0014.developmentName = @"Вершина: Тверская - Пушкинская - Чеховская";
    [self.vertices addObject:vertex0014];
/*
    MMDrawGradientArc *drawGradientArc0016 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0016.startColor = line0002.color;
    drawGradientArc0016.endColor = line0009.color;
    drawGradientArc0016.width = 6.5;
    drawGradientArc0016.center = CGPointMake(1213.5, 1514.5);
    drawGradientArc0016.startGradient = CGPointMake(1180, 1500);
    drawGradientArc0016.endGradient = CGPointMake(1242, 1500);
    drawGradientArc0016.radius = 43.5;
    drawGradientArc0016.startRadians = 52 * M_PI / 180;
    drawGradientArc0016.endRadians = 129 * M_PI / 180;
    [vertex0014.drawPrimitives addObject:drawGradientArc0016];
    
    MMDrawGradientArc *drawGradientArc0017 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0017.startColor = line0002.color;
    drawGradientArc0017.endColor = line0009.color;
    drawGradientArc0017.width = 6.5;
    drawGradientArc0017.center = CGPointMake(1213.5, 1514.5);
    drawGradientArc0017.startGradient = CGPointMake(1198, 1500);
    drawGradientArc0017.endGradient = CGPointMake(1228, 1500);
    drawGradientArc0017.radius = 31.5;
    drawGradientArc0017.startRadians = 60 * M_PI / 180;
    drawGradientArc0017.endRadians = 122 * M_PI / 180;
    [vertex0014.drawPrimitives addObject:drawGradientArc0017];
*/
    MWDrawGradientArc *drawGradientArc0016 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0016.startColor = line0002.color;
    drawGradientArc0016.endColor = line0009.color;
    drawGradientArc0016.width = 18;
    drawGradientArc0016.center = CGPointMake(1213.5, 1514.5);
    drawGradientArc0016.startGradient = CGPointMake(1180, 1500);
    drawGradientArc0016.endGradient = CGPointMake(1242, 1500);
    drawGradientArc0016.radius = 37.5;
    drawGradientArc0016.startRadians = 52 * M_PI / 180;
    drawGradientArc0016.endRadians = 129 * M_PI / 180;
    [vertex0014.drawPrimitives addObject:drawGradientArc0016];

/*   MMDrawGradientArc *drawGradientArc0018 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0018.startColor = line0007.color;
    drawGradientArc0018.endColor = line0002.color;
    drawGradientArc0018.width = 6.5;
    drawGradientArc0018.center = CGPointMake(1213.5, 1514.5);
    drawGradientArc0018.startGradient = CGPointMake(1250, 1478);
    drawGradientArc0018.endGradient = CGPointMake(1250, 1515);
    drawGradientArc0018.radius = 43.5;
    drawGradientArc0018.startRadians = 175 * M_PI / 180;
    drawGradientArc0018.endRadians = 248 * M_PI / 180;
    [vertex0014.drawPrimitives addObject:drawGradientArc0018];
    
    MMDrawGradientArc *drawGradientArc0019 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0019.startColor = line0007.color;
    drawGradientArc0019.endColor = line0002.color;
    drawGradientArc0019.width = 6.5;
    drawGradientArc0019.center = CGPointMake(1213.5, 1514.5);
    drawGradientArc0019.startGradient = CGPointMake(1250, 1485);
    drawGradientArc0019.endGradient = CGPointMake(1250, 1515);
    drawGradientArc0019.radius = 31.5;
    drawGradientArc0019.startRadians = 179 * M_PI / 180;
    drawGradientArc0019.endRadians = 241 * M_PI / 180;
    [vertex0014.drawPrimitives addObject:drawGradientArc0019];
*/
    MWDrawGradientArc *drawGradientArc0018 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0018.startColor = line0007.color;
    drawGradientArc0018.endColor = line0002.color;
    drawGradientArc0018.width = 18;
    drawGradientArc0018.center = CGPointMake(1213.5, 1514.5);
    drawGradientArc0018.startGradient = CGPointMake(1250, 1478);
    drawGradientArc0018.endGradient = CGPointMake(1250, 1515);
    drawGradientArc0018.radius = 37.5;
    drawGradientArc0018.startRadians = 175 * M_PI / 180;
    drawGradientArc0018.endRadians = 248 * M_PI / 180;
    [vertex0014.drawPrimitives addObject:drawGradientArc0018];

/*  MMDrawGradientArc *drawGradientArc0020 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0020.startColor = line0007.color;
    drawGradientArc0020.endColor = line0009.color;
    drawGradientArc0020.width = 6.5;
    drawGradientArc0020.center = CGPointMake(1213.5, 1514.5);
    drawGradientArc0020.startGradient = CGPointMake(1225, 1485);
    drawGradientArc0020.endGradient = CGPointMake(1225, 1515);
    drawGradientArc0020.radius = 31.5;
    drawGradientArc0020.startRadians = 300 * M_PI / 180;
    drawGradientArc0020.endRadians = 1 * M_PI / 180;
    [vertex0014.drawPrimitives addObject:drawGradientArc0020];
    
    MMDrawGradientArc *drawGradientArc0021 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0021.startColor = line0007.color;
    drawGradientArc0021.endColor = line0009.color;
    drawGradientArc0021.width = 6.5;
    drawGradientArc0021.center = CGPointMake(1213.5, 1514.5);
    drawGradientArc0021.startGradient = CGPointMake(1225, 1480);
    drawGradientArc0021.endGradient = CGPointMake(1225, 1520);
    drawGradientArc0021.radius = 43.5;
    drawGradientArc0021.startRadians = 292 * M_PI / 180;
    drawGradientArc0021.endRadians = 10 * M_PI / 180;
    [vertex0014.drawPrimitives addObject:drawGradientArc0021]; */

    MWDrawGradientArc *drawGradientArc0021 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0021.startColor = line0007.color;
    drawGradientArc0021.endColor = line0009.color;
    drawGradientArc0021.width = 18;
    drawGradientArc0021.center = CGPointMake(1213.5, 1514.5);
    drawGradientArc0021.startGradient = CGPointMake(1225, 1480);
    drawGradientArc0021.endGradient = CGPointMake(1225, 1515);
    drawGradientArc0021.radius = 37.5;
    drawGradientArc0021.startRadians = 292 * M_PI / 180;
    drawGradientArc0021.endRadians = 1 * M_PI / 180;
    [vertex0014.drawPrimitives addObject:drawGradientArc0021];

    MWDrawArc *drawArc0093 = [[MWDrawArc alloc] init];
    drawArc0093.center = CGPointMake(1213.5, 1477.5);
    drawArc0093.startRadians = M_PI * 2;
    drawArc0093.endRadians = 0;
    drawArc0093.radius = 14;
    drawArc0093.width = 10;
    drawArc0093.color = line0007.color;
    [vertex0014.drawPrimitives addObject:drawArc0093];
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = CGPointMake(1213.5, 1477.5);
    fillCircle0026.radius = 9;
    fillCircle0026.fillColor = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:fillCircle0026];
    
    MWDrawArc *drawArc0094 = [[MWDrawArc alloc] init];
    drawArc0094.center = CGPointMake(1181, 1533);
    drawArc0094.startRadians = M_PI * 2;
    drawArc0094.endRadians = 0;
    drawArc0094.radius = 14;
    drawArc0094.width = 10;
    drawArc0094.color = line0002.color;
    [vertex0014.drawPrimitives addObject:drawArc0094];
    
    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = CGPointMake(1181, 1533);
    fillCircle0027.radius = 9;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:fillCircle0027];
    
    MWDrawArc *drawArc0095 = [[MWDrawArc alloc] init];
    drawArc0095.center = CGPointMake(1245.5, 1533.5);
    drawArc0095.startRadians = M_PI * 2;
    drawArc0095.endRadians = 0;
    drawArc0095.radius = 14;
    drawArc0095.width = 10;
    drawArc0095.color = line0009.color;
    [vertex0014.drawPrimitives addObject:drawArc0095];
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = CGPointMake(1245.5, 1533.5);
    fillCircle0028.radius = 9;
    fillCircle0028.fillColor = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:fillCircle0028];
    
    MWDrawArc *drawArc0096 = [[MWDrawArc alloc] init];
    drawArc0096.center = CGPointMake(1213.5, 1514.5);
    drawArc0096.startRadians = M_PI * 2;
    drawArc0096.endRadians = 0;
    drawArc0096.radius = 37.5;
    drawArc0096.width = 6.5;
    drawArc0096.color = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:drawArc0096];
    
    // Белорусская
    MWVertex *vertex0015 = [[MWVertex alloc] init];
    vertex0015.identifier = @"vertex0015";
    vertex0015.developmentName = @"Вершина: Белорусская";
    [self.vertices addObject:vertex0015];
    
    MWDrawGradientRect *drawGradientRect0010 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0010.startColor = line0002.color;
    drawGradientRect0010.endColor = line0005.color;
    drawGradientRect0010.point1 = CGPointMake(898, 1276);
    drawGradientRect0010.point2 = CGPointMake(916, 1276);
    drawGradientRect0010.point3 = CGPointMake(916, 1301);
    drawGradientRect0010.point4 = CGPointMake(898, 1301);
    [vertex0015.drawPrimitives addObject:drawGradientRect0010];
    
    MWDrawArc *drawArc0097 = [[MWDrawArc alloc] init];
    drawArc0097.center = CGPointMake(907, 1259);
    drawArc0097.startRadians = M_PI * 2;
    drawArc0097.endRadians = 0;
    drawArc0097.radius = 14;
    drawArc0097.width = 10;
    drawArc0097.color = line0002.color;
    [vertex0015.drawPrimitives addObject:drawArc0097];
    
    MWDrawArc *drawArc0098 = [[MWDrawArc alloc] init];
    drawArc0098.center = CGPointMake(907.5, 1317.5);
    drawArc0098.startRadians = M_PI * 2;
    drawArc0098.endRadians = 0;
    drawArc0098.radius = 14;
    drawArc0098.width = 10;
    drawArc0098.color = line0005.color;
    [vertex0015.drawPrimitives addObject:drawArc0098];
    
    MWDrawLine *drawLine0348 = [[MWDrawLine alloc] init];
    drawLine0348.startPoint = CGPointMake(907, 1259);
    drawLine0348.endPoint = CGPointMake(907, 1317.5);
    drawLine0348.width = 6;
    drawLine0348.color = [UIColor whiteColor];
    [vertex0015.drawPrimitives addObject:drawLine0348];

    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = CGPointMake(907, 1259);
    fillCircle0029.radius = 9;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [vertex0015.drawPrimitives addObject:fillCircle0029];
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = CGPointMake(907.5, 1317.5);
    fillCircle0030.radius = 9;
    fillCircle0030.fillColor = [UIColor whiteColor];
    [vertex0015.drawPrimitives addObject:fillCircle0030];
    
    // Речной вокзал
    MWVertex *vertex0016 = [[MWVertex alloc] init];
    vertex0016.identifier = @"vertex0016";
    vertex0016.developmentName = @"Вершина: Речной вокзал";
    [self.vertices addObject:vertex0016];
    
    // Пятницкое шоссе
    MWVertex *vertex0017 = [[MWVertex alloc] init];
    vertex0017.identifier = @"vertex0017";
    vertex0017.developmentName = @"Вершина: Пятницкое шоссе";
    [self.vertices addObject:vertex0017];
    
    // Кунцевская
    MWVertex *vertex0018 = [[MWVertex alloc] init];
    vertex0018.identifier = @"vertex0018";
    vertex0018.developmentName = @"Вершина: Кунцевская";
    [self.vertices addObject:vertex0018];
    
    MWDrawGradientRect *drawGradientRect0011 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0011.startColor = line0003.color;
    drawGradientRect0011.endColor = line0004.color;
    drawGradientRect0011.point1 = CGPointMake(118, 1323);
    drawGradientRect0011.point2 = CGPointMake(130, 1312);
    drawGradientRect0011.point3 = CGPointMake(142, 1324);
    drawGradientRect0011.point4 = CGPointMake(131, 1335);
    [vertex0018.drawPrimitives addObject:drawGradientRect0011];
    
    MWDrawArc *drawArc0099 = [[MWDrawArc alloc] init];
    drawArc0099.center = CGPointMake(112.5, 1305.5);
    drawArc0099.startRadians = M_PI * 2;
    drawArc0099.endRadians = 0;
    drawArc0099.radius = 14;
    drawArc0099.width = 10;
    drawArc0099.color = line0003.color;
    [vertex0018.drawPrimitives addObject:drawArc0099];
    
    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = CGPointMake(112.5, 1305.5);
    fillCircle0031.radius = 9;
    fillCircle0031.fillColor = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:fillCircle0031];
    
    MWDrawArc *drawArc0100 = [[MWDrawArc alloc] init];
    drawArc0100.center = CGPointMake(148.5, 1341.5);
    drawArc0100.startRadians = M_PI * 2;
    drawArc0100.endRadians = 0;
    drawArc0100.radius = 14;
    drawArc0100.width = 10;
    drawArc0100.color = line0004.color;
    [vertex0018.drawPrimitives addObject:drawArc0100];
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = CGPointMake(148.5, 1341.5);
    fillCircle0032.radius = 9;
    fillCircle0032.fillColor = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:fillCircle0032];
    
    MWDrawLine *drawLine0349 = [[MWDrawLine alloc] init];
    drawLine0349.startPoint = CGPointMake(112.5, 1305.5);
    drawLine0349.endPoint = CGPointMake(148.5, 1341.5);
    drawLine0349.width = 5;
    drawLine0349.color = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:drawLine0349];

    // Киевская
    MWVertex *vertex0019 = [[MWVertex alloc] init];
    vertex0019.identifier = @"vertex0019";
    vertex0019.developmentName = @"Вершина: Киевская";
    [self.vertices addObject:vertex0019];

/*    MMDrawGradientArc *drawGradientArc0022 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0022.startColor = line0004.color;
    drawGradientArc0022.endColor = line0003.color;
    drawGradientArc0022.width = 6.5;
    drawGradientArc0022.center = CGPointMake(761, 1745);
    drawGradientArc0022.startGradient = CGPointMake(700, 1713);
    drawGradientArc0022.endGradient = CGPointMake(700, 1778);
    drawGradientArc0022.radius =  48.5;
    drawGradientArc0022.startRadians = 140 * M_PI / 180;
    drawGradientArc0022.endRadians = 220 * M_PI / 180;
    [vertex0019.drawPrimitives addObject:drawGradientArc0022];
 
    MMDrawGradientArc *drawGradientArc0023 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0023.startColor = line0004.color;
    drawGradientArc0023.endColor = line0003.color;
    drawGradientArc0023.width = 6.5;
    drawGradientArc0023.center = CGPointMake(761, 1745);
    drawGradientArc0023.startGradient = CGPointMake(700, 1705);
    drawGradientArc0023.endGradient = CGPointMake(700, 1785);
    drawGradientArc0023.radius = 60.5;
    drawGradientArc0023.startRadians = 138 * M_PI / 180;
    drawGradientArc0023.endRadians = 222 * M_PI / 180;
    [vertex0019.drawPrimitives addObject:drawGradientArc0023]; */
  
    MWDrawGradientArc *drawGradientArc0022 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0022.startColor = line0004.color;
    drawGradientArc0022.endColor = line0003.color;
    drawGradientArc0022.width = 18;
    drawGradientArc0022.center = CGPointMake(761, 1745);
    drawGradientArc0022.startGradient = CGPointMake(700, 1705);
    drawGradientArc0022.endGradient = CGPointMake(700, 1785);
    drawGradientArc0022.radius =  54.5;
    drawGradientArc0022.startRadians = 138 * M_PI / 180;
    drawGradientArc0022.endRadians = 222 * M_PI / 180;
    [vertex0019.drawPrimitives addObject:drawGradientArc0022];
    
/*    MMDrawGradientArc *drawGradientArc0024 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0024.startColor = line0004.color;
    drawGradientArc0024.endColor = line0005.color;
    drawGradientArc0024.width = 6.5;
    drawGradientArc0024.center = CGPointMake(761, 1745);
    drawGradientArc0024.startGradient = CGPointMake(750, 100);
    drawGradientArc0024.endGradient = CGPointMake(805, 100);
    drawGradientArc0024.radius = 48.5;
    drawGradientArc0024.startRadians = 260 * M_PI / 180;
    drawGradientArc0024.endRadians = 340 * M_PI / 180;
    [vertex0019.drawPrimitives addObject:drawGradientArc0024];
    
    MMDrawGradientArc *drawGradientArc0025 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0025.startColor = line0004.color;
    drawGradientArc0025.endColor = line0005.color;
    drawGradientArc0025.width = 6.5;
    drawGradientArc0025.center = CGPointMake(761, 1745);
    drawGradientArc0025.startGradient = CGPointMake(745, 100);
    drawGradientArc0025.endGradient = CGPointMake(820, 100);
    drawGradientArc0025.radius = 60.5;
    drawGradientArc0025.startRadians = 230 * M_PI / 180;
    drawGradientArc0025.endRadians = 342 * M_PI / 180;
    [vertex0019.drawPrimitives addObject:drawGradientArc0025]; */
    
    MWDrawGradientArc *drawGradientArc0024 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0024.startColor = line0004.color;
    drawGradientArc0024.endColor = line0005.color;
    drawGradientArc0024.width = 18;
    drawGradientArc0024.center = CGPointMake(761, 1745);
    drawGradientArc0024.startGradient = CGPointMake(746, 100);
    drawGradientArc0024.endGradient = CGPointMake(823, 100);
    drawGradientArc0024.radius = 54.5;
    drawGradientArc0024.startRadians = 256 * M_PI / 180;
    drawGradientArc0024.endRadians = 343 * M_PI / 180;
    [vertex0019.drawPrimitives addObject:drawGradientArc0024];
    
/*    MMDrawGradientArc *drawGradientArc0026 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0026.startColor = line0005.color;
    drawGradientArc0026.endColor = line0003.color;
    drawGradientArc0026.width = 6.5;
    drawGradientArc0026.center = CGPointMake(761, 1745);
    drawGradientArc0026.startGradient = CGPointMake(810, 100);
    drawGradientArc0026.endGradient = CGPointMake(750, 100);
    drawGradientArc0026.radius = 48.5;
    drawGradientArc0026.startRadians = 19 * M_PI / 180;
    drawGradientArc0026.endRadians = 100 * M_PI / 180;
    [vertex0019.drawPrimitives addObject:drawGradientArc0026];
    
    MMDrawGradientArc *drawGradientArc0027 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0027.startColor = line0005.color;
    drawGradientArc0027.endColor = line0003.color;
    drawGradientArc0027.width = 6.5;
    drawGradientArc0027.center = CGPointMake(761, 1745);
    drawGradientArc0027.startGradient = CGPointMake(820, 100);
    drawGradientArc0027.endGradient = CGPointMake(745, 100);
    drawGradientArc0027.radius = 60.5;
    drawGradientArc0027.startRadians = 16 * M_PI / 180;
    drawGradientArc0027.endRadians = 104 * M_PI / 180;
    [vertex0019.drawPrimitives addObject:drawGradientArc0027]; */

    MWDrawGradientArc *drawGradientArc0026 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0026.startColor = line0005.color;
    drawGradientArc0026.endColor = line0003.color;
    drawGradientArc0026.width = 18;
    drawGradientArc0026.center = CGPointMake(761, 1745);
    drawGradientArc0026.startGradient = CGPointMake(814, 100);
    drawGradientArc0026.endGradient = CGPointMake(746, 100);
    drawGradientArc0026.radius = 54.5;
    drawGradientArc0026.startRadians = 16 * M_PI / 180;
    drawGradientArc0026.endRadians = 104 * M_PI / 180;
    [vertex0019.drawPrimitives addObject:drawGradientArc0026];

    MWDrawArc *drawArc0101 = [[MWDrawArc alloc] init];
    drawArc0101.center = CGPointMake(733.5, 1792);
    drawArc0101.startRadians = M_PI * 2;
    drawArc0101.endRadians = 0;
    drawArc0101.radius = 14;
    drawArc0101.width = 10;
    drawArc0101.color = line0003.color;
    [vertex0019.drawPrimitives addObject:drawArc0101];
 
    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = CGPointMake(733.5, 1792.5);
    fillCircle0033.radius = 9;
    fillCircle0033.fillColor = [UIColor whiteColor];
    [vertex0019.drawPrimitives addObject:fillCircle0033];
    
    MWDrawArc *drawArc0102 = [[MWDrawArc alloc] init];
    drawArc0102.center = CGPointMake(733.5, 1698.5);
    drawArc0102.startRadians = M_PI * 2;
    drawArc0102.endRadians = 0;
    drawArc0102.radius = 14;
    drawArc0102.width = 10;
    drawArc0102.color = line0004.color;
    [vertex0019.drawPrimitives addObject:drawArc0102];
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = CGPointMake(733.5, 1698.5);
    fillCircle0034.radius = 9;
    fillCircle0034.fillColor = [UIColor whiteColor];
    [vertex0019.drawPrimitives addObject:fillCircle0034];
    
    MWDrawArc *drawArc0103 = [[MWDrawArc alloc] init];
    drawArc0103.center = CGPointMake(815, 1744.5);
    drawArc0103.startRadians = M_PI * 2;
    drawArc0103.endRadians = 0;
    drawArc0103.radius = 14;
    drawArc0103.width = 10;
    drawArc0103.color = line0005.color;
    [vertex0019.drawPrimitives addObject:drawArc0103];
    
    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = CGPointMake(815, 1744.5);
    fillCircle0035.radius = 9;
    fillCircle0035.fillColor = [UIColor whiteColor];
    [vertex0019.drawPrimitives addObject:fillCircle0035];
    
    MWDrawArc *drawArc0104 = [[MWDrawArc alloc] init];
    drawArc0104.center = CGPointMake(761, 1745);
    drawArc0104.startRadians = M_PI * 2;
    drawArc0104.endRadians = 0;
    drawArc0104.radius = 54.5;
    drawArc0104.width = 6.5;
    drawArc0104.color = [UIColor whiteColor];
    [vertex0019.drawPrimitives addObject:drawArc0104];
    
    // Курская
    MWVertex *vertex0020 = [[MWVertex alloc] init];
    vertex0020.identifier = @"vertex0020";
    vertex0020.developmentName = @"Вершина: Курская - Чкаловская";
    [self.vertices addObject:vertex0020];

/*    MMDrawGradientArc *drawGradientArc0028 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0028.startColor = line0010.color;
    drawGradientArc0028.endColor = line0005.color;
    drawGradientArc0028.width = 6.5;
    drawGradientArc0028.center = CGPointMake(2005, 1551);
    drawGradientArc0028.startGradient = CGPointMake(1995, 1000);
    drawGradientArc0028.endGradient = CGPointMake(2042, 1000);
    drawGradientArc0028.radius = 43.5;
    drawGradientArc0028.startRadians = 25 * M_PI / 180;
    drawGradientArc0028.endRadians = 108 * M_PI / 180;
    [vertex0020.drawPrimitives addObject:drawGradientArc0028];
   
    MMDrawGradientArc *drawGradientArc0029 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0029.startColor = line0010.color;
    drawGradientArc0029.endColor = line0005.color;
    drawGradientArc0029.width = 6.5;
    drawGradientArc0029.center = CGPointMake(2005, 1551);
    drawGradientArc0029.startGradient = CGPointMake(1996, 1000);
    drawGradientArc0029.endGradient = CGPointMake(2035, 1000);
    drawGradientArc0029.radius = 31.5;
    drawGradientArc0029.startRadians = 30 * M_PI / 180;
    drawGradientArc0029.endRadians = 106 * M_PI / 180;
    [vertex0020.drawPrimitives addObject:drawGradientArc0029]; */
  
    MWDrawGradientArc *drawGradientArc0028 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0028.startColor = line0010.color;
    drawGradientArc0028.endColor = line0005.color;
    drawGradientArc0028.width = 18;
    drawGradientArc0028.center = CGPointMake(2005, 1551);
    drawGradientArc0028.startGradient = CGPointMake(1996, 1000);
    drawGradientArc0028.endGradient = CGPointMake(2042, 1000);
    drawGradientArc0028.radius = 37.5;
    drawGradientArc0028.startRadians = 26 * M_PI / 180;
    drawGradientArc0028.endRadians = 106 * M_PI / 180;
    [vertex0020.drawPrimitives addObject:drawGradientArc0028];
    
/*    MMDrawGradientArc *drawGradientArc0030 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0030.startColor = line0003.color;
    drawGradientArc0030.endColor = line0010.color;
    drawGradientArc0030.width = 6.5;
    drawGradientArc0030.center = CGPointMake(2005, 1551);
    drawGradientArc0030.startGradient = CGPointMake(1000, 1507);
    drawGradientArc0030.endGradient = CGPointMake(1000, 1565);
    drawGradientArc0030.radius = 43.5;
    drawGradientArc0030.startRadians = 158 * M_PI / 180;
    drawGradientArc0030.endRadians = 248 * M_PI / 180;
    [vertex0020.drawPrimitives addObject:drawGradientArc0030];
    
    MMDrawGradientArc *drawGradientArc0031 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0031.startColor = line0003.color;
    drawGradientArc0031.endColor = line0010.color;
    drawGradientArc0031.width = 6.5;
    drawGradientArc0031.center = CGPointMake(2005, 1551);
    drawGradientArc0031.startGradient = CGPointMake(1000, 1520);
    drawGradientArc0031.endGradient = CGPointMake(1000, 1561);
    drawGradientArc0031.radius = 31.5;
    drawGradientArc0031.startRadians = 162 * M_PI / 180;
    drawGradientArc0031.endRadians = 241 * M_PI / 180;
    [vertex0020.drawPrimitives addObject:drawGradientArc0031]; */
  
    MWDrawGradientArc *drawGradientArc0030 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0030.startColor = line0003.color;
    drawGradientArc0030.endColor = line0010.color;
    drawGradientArc0030.width = 18;
    drawGradientArc0030.center = CGPointMake(2005, 1551);
    drawGradientArc0030.startGradient = CGPointMake(1000, 1507);
    drawGradientArc0030.endGradient = CGPointMake(1000, 1565);
    drawGradientArc0030.radius = 37.5;
    drawGradientArc0030.startRadians = 158 * M_PI / 180;
    drawGradientArc0030.endRadians = 248 * M_PI / 180;
    [vertex0020.drawPrimitives addObject:drawGradientArc0030];

/*    MMDrawGradientArc *drawGradientArc0032 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0032.startColor = line0003.color;
    drawGradientArc0032.endColor = line0005.color;
    drawGradientArc0032.width = 6.5;
    drawGradientArc0032.center = CGPointMake(2005, 1551);
    drawGradientArc0032.startGradient = CGPointMake(1000, 1522);
    drawGradientArc0032.endGradient = CGPointMake(1000, 1538);
    drawGradientArc0032.radius = 31.5;
    drawGradientArc0032.startRadians = 301 * M_PI / 180;
    drawGradientArc0032.endRadians = 332 * M_PI / 180;
    [vertex0020.drawPrimitives addObject:drawGradientArc0032];
    
    MMDrawGradientArc *drawGradientArc0033 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0033.startColor = line0003.color;
    drawGradientArc0033.endColor = line0005.color;
    drawGradientArc0033.width = 6.5;
    drawGradientArc0033.center = CGPointMake(2005, 1551);
    drawGradientArc0033.startGradient = CGPointMake(1000, 1500);
    drawGradientArc0033.endGradient = CGPointMake(1000, 1536);
    drawGradientArc0033.radius = 43.5;
    drawGradientArc0033.startRadians = 296 * M_PI / 180;
    drawGradientArc0033.endRadians = 336 * M_PI / 180;
    [vertex0020.drawPrimitives addObject:drawGradientArc0033]; */
  
    MWDrawGradientArc *drawGradientArc0032 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0032.startColor = line0003.color;
    drawGradientArc0032.endColor = line0005.color;
    drawGradientArc0032.width = 18;
    drawGradientArc0032.center = CGPointMake(2005, 1551);
    drawGradientArc0032.startGradient = CGPointMake(1000, 1500);
    drawGradientArc0032.endGradient = CGPointMake(1000, 1538);
    drawGradientArc0032.radius = 37.5;
    drawGradientArc0032.startRadians = 296 * M_PI / 180;
    drawGradientArc0032.endRadians = 336 * M_PI / 180;
    [vertex0020.drawPrimitives addObject:drawGradientArc0032];

    MWDrawArc *drawArc0105 = [[MWDrawArc alloc] init];
    drawArc0105.center = CGPointMake(2006, 1513);
    drawArc0105.startRadians = M_PI * 2;
    drawArc0105.endRadians = 0;
    drawArc0105.radius = 14;
    drawArc0105.width = 10;
    drawArc0105.color = line0003.color;
    [vertex0020.drawPrimitives addObject:drawArc0105];
    
    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = CGPointMake(2006, 1513);
    fillCircle0036.radius = 9;
    fillCircle0036.fillColor = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:fillCircle0036];
    
    MWDrawArc *drawArc0106 = [[MWDrawArc alloc] init];
    drawArc0106.center = CGPointMake(2042.5, 1551.5);
    drawArc0106.startRadians = M_PI * 2;
    drawArc0106.endRadians = 0;
    drawArc0106.radius = 14;
    drawArc0106.width = 10;
    drawArc0106.color = line0005.color;
    [vertex0020.drawPrimitives addObject:drawArc0106];
    
    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = CGPointMake(2042.5, 1551.5);
    fillCircle0037.radius = 9;
    fillCircle0037.fillColor = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:fillCircle0037];
    
    MWDrawArc *drawArc0107 = [[MWDrawArc alloc] init];
    drawArc0107.center = CGPointMake(1978.5, 1578.5);
    drawArc0107.startRadians = M_PI * 2;
    drawArc0107.endRadians = 0;
    drawArc0107.radius = 14;
    drawArc0107.width = 10;
    drawArc0107.color = line0010.color;
    [vertex0020.drawPrimitives addObject:drawArc0107];
    
    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = CGPointMake(1978.5, 1578.5);
    fillCircle0038.radius = 9;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:fillCircle0038];
    
    MWDrawArc *drawArc0108 = [[MWDrawArc alloc] init];
    drawArc0108.center = CGPointMake(2005, 1551);
    drawArc0108.startRadians = M_PI * 2;
    drawArc0108.endRadians = 0;
    drawArc0108.radius = 37.5;
    drawArc0108.width = 6.5;
    drawArc0108.color = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:drawArc0108];
    
    // Щелковская
    MWVertex *vertex0021 = [[MWVertex alloc] init];
    vertex0021.identifier = @"vertex0021";
    vertex0021.developmentName = @"Вершина: Щелковская";
    [self.vertices addObject:vertex0021];
    
    // Международная
    MWVertex *vertex0022 = [[MWVertex alloc] init];
    vertex0022.identifier = @"vertex0022";
    vertex0022.developmentName = @"Вершина: Международная";
    [self.vertices addObject:vertex0022];
    
    // Добрынинская - Серпуховская
    MWVertex *vertex0023 = [[MWVertex alloc] init];
    vertex0023.identifier = @"vertex0023";
    vertex0023.developmentName = @"Вершина: Добрынинская - Серпуховская";
    [self.vertices addObject:vertex0023];
    
    MWDrawGradientRect *drawGradientRect0012 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0012.startColor = line0005.color;
    drawGradientRect0012.endColor = line0009.color;
    drawGradientRect0012.point1 = CGPointMake(1292.5, 2278.5);
    drawGradientRect0012.point2 = CGPointMake(1305.5, 2266.5);
    drawGradientRect0012.point3 = CGPointMake(1330, 2291);
    drawGradientRect0012.point4 = CGPointMake(1317, 2304);
    [vertex0023.drawPrimitives addObject:drawGradientRect0012];
    
    MWDrawArc *drawArc0109 = [[MWDrawArc alloc] init];
    drawArc0109.center = CGPointMake(1287.5, 2260.5);
    drawArc0109.startRadians = M_PI * 2;
    drawArc0109.endRadians = 0;
    drawArc0109.radius = 14;
    drawArc0109.width = 10;
    drawArc0109.color = line0005.color;
    [vertex0023.drawPrimitives addObject:drawArc0109];
    
    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = CGPointMake(1287.5, 2260.5);
    fillCircle0039.radius = 9;
    fillCircle0039.fillColor = [UIColor whiteColor];
    [vertex0023.drawPrimitives addObject:fillCircle0039];
    
    MWDrawArc *drawArc0110 = [[MWDrawArc alloc] init];
    drawArc0110.center = CGPointMake(1335.5, 2308.5);
    drawArc0110.startRadians = M_PI * 2;
    drawArc0110.endRadians = 0;
    drawArc0110.radius = 14;
    drawArc0110.width = 10;
    drawArc0110.color = line0009.color;
    [vertex0023.drawPrimitives addObject:drawArc0110];
    
    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = CGPointMake(1335.5, 2308.5);
    fillCircle0040.radius = 9;
    fillCircle0040.fillColor = [UIColor whiteColor];
    [vertex0023.drawPrimitives addObject:fillCircle0040];
    
    MWDrawLine *drawLine0350 = [[MWDrawLine alloc] init];
    drawLine0350.startPoint = CGPointMake(1287.5, 2260.5);
    drawLine0350.endPoint = CGPointMake(1335.5, 2308.5);
    drawLine0350.width = 5;
    drawLine0350.color = [UIColor whiteColor];
    [vertex0023.drawPrimitives addObject:drawLine0350];
    
    // Октябрьская
    MWVertex *vertex0024 = [[MWVertex alloc] init];
    vertex0024.identifier = @"vertex0024";
    vertex0024.developmentName = @"Вершина: Октябрьская";
    [self.vertices addObject:vertex0024];
    
    MWDrawGradientRect *drawGradientRect0013 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0013.startColor = line0006.color;
    drawGradientRect0013.endColor = line0005.color;
    drawGradientRect0013.point1 = CGPointMake(1108.4, 2159);
    drawGradientRect0013.point2 = CGPointMake(1125.4, 2150);
    drawGradientRect0013.point3 = CGPointMake(1125.4, 2176);
    drawGradientRect0013.point4 = CGPointMake(1108.4, 2176);
    [vertex0024.drawPrimitives addObject:drawGradientRect0013];
    
    MWDrawArc *drawArc0111 = [[MWDrawArc alloc] init];
    drawArc0111.center = CGPointMake(1117.5, 2192.5);
    drawArc0111.startRadians = M_PI * 2;
    drawArc0111.endRadians = 0;
    drawArc0111.radius = 14;
    drawArc0111.width = 10;
    drawArc0111.color = line0005.color;
    [vertex0024.drawPrimitives addObject:drawArc0111];
    
    MWDrawArc *drawArc0112 = [[MWDrawArc alloc] init];
    drawArc0112.center = CGPointMake(1116.5, 2141.5);
    drawArc0112.startRadians = M_PI * 2;
    drawArc0112.endRadians = 0;
    drawArc0112.radius = 14;
    drawArc0112.width = 10;
    drawArc0112.color = line0006.color;
    [vertex0024.drawPrimitives addObject:drawArc0112];
    
    MWDrawLine *drawLine0351 = [[MWDrawLine alloc] init];
    drawLine0351.startPoint = CGPointMake(1117.5, 2192.5);
    drawLine0351.endPoint = CGPointMake(1116.5, 2141.5);
    drawLine0351.width = 6;
    drawLine0351.color = [UIColor whiteColor];
    [vertex0024.drawPrimitives addObject:drawLine0351];
    
    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = CGPointMake(1117.5, 2192);
    fillCircle0041.radius = 9;
    fillCircle0041.fillColor = [UIColor whiteColor];
    [vertex0024.drawPrimitives addObject:fillCircle0041];
    
    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = CGPointMake(1116.5, 2141.5);
    fillCircle0042.radius = 9;
    fillCircle0042.fillColor = [UIColor whiteColor];
    [vertex0024.drawPrimitives addObject:fillCircle0042];

    // Баррикадная - Краснопресненская
    MWVertex *vertex0025 = [[MWVertex alloc] init];
    vertex0025.identifier = @"vertex0025";
    vertex0025.developmentName = @"Вершина: Баррикадная - Краснопресненская";
    [self.vertices addObject:vertex0025];

    MWDrawGradientRect *drawGradientRect0014 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0014.startColor = line0005.color;
    drawGradientRect0014.endColor = line0007.color;
    drawGradientRect0014.point1 = CGPointMake(831.5, 1511.5);
    drawGradientRect0014.point2 = CGPointMake(827.5, 1504.5);
    drawGradientRect0014.point3 = CGPointMake(851, 1483);
    drawGradientRect0014.point4 = CGPointMake(859, 1485.5);
    [vertex0025.drawPrimitives addObject:drawGradientRect0014];
    
    MWDrawGradientRect *drawGradientRect0015 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0015.startColor = line0005.color;
    drawGradientRect0015.endColor = line0007.color;
    drawGradientRect0015.point1 = CGPointMake(837.5, 1522.5);
    drawGradientRect0015.point2 = CGPointMake(834.5, 1515.5);
    drawGradientRect0015.point3 = CGPointMake(856.5, 1492);
    drawGradientRect0015.point4 = CGPointMake(866, 1493.5);
    [vertex0025.drawPrimitives addObject:drawGradientRect0015];
  
    MWDrawArc *drawArc0113 = [[MWDrawArc alloc] init];
    drawArc0113.center = CGPointMake(869.5, 1477.5);
    drawArc0113.startRadians = M_PI * 2;
    drawArc0113.endRadians = 0;
    drawArc0113.radius = 14;
    drawArc0113.width = 10;
    drawArc0113.color = line0007.color;
    [vertex0025.drawPrimitives addObject:drawArc0113];
    
    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = CGPointMake(869.5, 1477.5);
    fillCircle0043.radius = 9;
    fillCircle0043.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0043];
    
    MWDrawArc *drawArc0114 = [[MWDrawArc alloc] init];
    drawArc0114.center = CGPointMake(820.5, 1525.5);
    drawArc0114.startRadians = M_PI * 2;
    drawArc0114.endRadians = 0;
    drawArc0114.radius = 14;
    drawArc0114.width = 10;
    drawArc0114.color = line0005.color;
    [vertex0025.drawPrimitives addObject:drawArc0114];
    
    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = CGPointMake(820.5, 1525.5);
    fillCircle0044.radius = 9;
    fillCircle0044.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0044];
    
    MWDrawLine *drawLine0352 = [[MWDrawLine alloc] init];
    drawLine0352.startPoint = CGPointMake(869.5, 1477.5);
    drawLine0352.endPoint = CGPointMake(820.5, 1525.5);
    drawLine0352.width = 5;
    drawLine0352.color = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:drawLine0352];
    
    // Менделеевская - Новослободская
    MWVertex *vertex0026 = [[MWVertex alloc] init];
    vertex0026.identifier = @"vertex0026";
    vertex0026.developmentName = @"Вершина: Менделеевская - Новослободская";
    [self.vertices addObject:vertex0026];

    MWDrawGradientRect *drawGradientRect0016 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0016.startColor = line0009.color;
    drawGradientRect0016.endColor = line0005.color;
    drawGradientRect0016.point1 = CGPointMake(1092.5, 1071);
    drawGradientRect0016.point2 = CGPointMake(1110.5, 1071);
    drawGradientRect0016.point3 = CGPointMake(1110.5, 1110);
    drawGradientRect0016.point4 = CGPointMake(1092.5, 1110);
    [vertex0026.drawPrimitives addObject:drawGradientRect0016];
    
    MWDrawArc *drawArc0116 = [[MWDrawArc alloc] init];
    drawArc0116.center = CGPointMake(1101.5, 1054.5);
    drawArc0116.startRadians = M_PI * 2;
    drawArc0116.endRadians = 0;
    drawArc0116.radius = 14;
    drawArc0116.width = 10;
    drawArc0116.color = line0009.color;
    [vertex0026.drawPrimitives addObject:drawArc0116];
    
    MWDrawArc *drawArc0117 = [[MWDrawArc alloc] init];
    drawArc0117.center = CGPointMake(1101.5, 1127);
    drawArc0117.startRadians = M_PI * 2;
    drawArc0117.endRadians = 0;
    drawArc0117.radius = 14;
    drawArc0117.width = 10;
    drawArc0117.color = line0005.color;
    [vertex0026.drawPrimitives addObject:drawArc0117];
    
    MWDrawLine *drawLine0353 = [[MWDrawLine alloc] init];
    drawLine0353.startPoint = CGPointMake(1101.5, 1054.5);
    drawLine0353.endPoint = CGPointMake(1101.5, 1127);
    drawLine0353.width = 6;
    drawLine0353.color = [UIColor whiteColor];
    [vertex0026.drawPrimitives addObject:drawLine0353];
    
    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = CGPointMake(1101.5, 1054.5);
    fillCircle0045.radius = 9;
    fillCircle0045.fillColor = [UIColor whiteColor];
    [vertex0026.drawPrimitives addObject:fillCircle0045];
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = CGPointMake(1101.5, 1127);
    fillCircle0046.radius = 9;
    fillCircle0046.fillColor = [UIColor whiteColor];
    [vertex0026.drawPrimitives addObject:fillCircle0046];
    
    // Проспект Мира
    MWVertex *vertex0027 = [[MWVertex alloc] init];
    vertex0027.identifier = @"vertex0027";
    vertex0027.developmentName = @"Вершина: Проспект Мира";
    [self.vertices addObject:vertex0027];

    MWDrawGradientRect *drawGradientRect0017 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0017.startColor = line0006.color;
    drawGradientRect0017.endColor = line0005.color;
    drawGradientRect0017.point1 = CGPointMake(1639, 1038);
    drawGradientRect0017.point2 = CGPointMake(1657, 1038);
    drawGradientRect0017.point3 = CGPointMake(1657, 1057);
    drawGradientRect0017.point4 = CGPointMake(1639, 1057);
    [vertex0027.drawPrimitives addObject:drawGradientRect0017];
    
    MWDrawArc *drawArc0118 = [[MWDrawArc alloc] init];
    drawArc0118.center = CGPointMake(1648.5, 1073.5);
    drawArc0118.startRadians = M_PI * 2;
    drawArc0118.endRadians = 0;
    drawArc0118.radius = 14;
    drawArc0118.width = 10;
    drawArc0118.color = line0005.color;
    [vertex0027.drawPrimitives addObject:drawArc0118];
    
    MWDrawArc *drawArc0119 = [[MWDrawArc alloc] init];
    drawArc0119.center = CGPointMake(1647.5, 1022);
    drawArc0119.startRadians = M_PI * 2;
    drawArc0119.endRadians = 0;
    drawArc0119.radius = 14;
    drawArc0119.width = 10;
    drawArc0119.color = line0006.color;
    [vertex0027.drawPrimitives addObject:drawArc0119];
    
    MWDrawLine *drawLine0354 = [[MWDrawLine alloc] init];
    drawLine0354.startPoint = CGPointMake(1648.5, 1073.5);
    drawLine0354.endPoint = CGPointMake(1647.5, 1022);
    drawLine0354.width = 6;
    drawLine0354.color = [UIColor whiteColor];
    [vertex0027.drawPrimitives addObject:drawLine0354];
    
    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = CGPointMake(1648.5, 1073.5);
    fillCircle0047.radius = 9;
    fillCircle0047.fillColor = [UIColor whiteColor];
    [vertex0027.drawPrimitives addObject:fillCircle0047];
    
    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = CGPointMake(1647.5, 1022.5);
    fillCircle0048.radius = 9;
    fillCircle0048.fillColor = [UIColor whiteColor];
    [vertex0027.drawPrimitives addObject:fillCircle0048];
    
    // Таганская - Марксистская
    MWVertex *vertex0028 = [[MWVertex alloc] init];
    vertex0028.identifier = @"vertex0028";
    vertex0028.developmentName = @"Вершина: Таганская - Марксистская";
    [self.vertices addObject:vertex0028];

/*    MMDrawGradientArc *drawGradientArc0034 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0034.startColor = line0005.color;
    drawGradientArc0034.endColor = line0008.color;
    drawGradientArc0034.width = 6.5;
    drawGradientArc0034.center = CGPointMake(2021.5, 1946);
    drawGradientArc0034.startGradient = CGPointMake(1978, 1000);
    drawGradientArc0034.endGradient = CGPointMake(2035, 1000);
    drawGradientArc0034.radius = 43.5;
    drawGradientArc0034.startRadians = 70 * M_PI / 180;
    drawGradientArc0034.endRadians = 164 * M_PI / 180;
    [vertex0028.drawPrimitives addObject:drawGradientArc0034];
   
    MMDrawGradientArc *drawGradientArc0035 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0035.startColor = line0005.color;
    drawGradientArc0035.endColor = line0008.color;
    drawGradientArc0035.width = 6.5;
    drawGradientArc0035.center = CGPointMake(2021.5, 1946);
    drawGradientArc0035.startGradient = CGPointMake(1989, 1000);
    drawGradientArc0035.endGradient = CGPointMake(2031, 1000);
    drawGradientArc0035.radius = 31.5;
    drawGradientArc0035.startRadians = 71 * M_PI / 180;
    drawGradientArc0035.endRadians = 161 * M_PI / 180;
    [vertex0028.drawPrimitives addObject:drawGradientArc0035]; */
  
    MWDrawGradientArc *drawGradientArc0034 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0034.startColor = line0005.color;
    drawGradientArc0034.endColor = line0008.color;
    drawGradientArc0034.width = 18;
    drawGradientArc0034.center = CGPointMake(2021.5, 1946);
    drawGradientArc0034.startGradient = CGPointMake(1978, 1000);
    drawGradientArc0034.endGradient = CGPointMake(2035, 1000);
    drawGradientArc0034.radius = 37.5;
    drawGradientArc0034.startRadians = 70 * M_PI / 180;
    drawGradientArc0034.endRadians = 164 * M_PI / 180;
    [vertex0028.drawPrimitives addObject:drawGradientArc0034];

/*    MMDrawGradientArc *drawGradientArc0036 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0036.startColor = line0007.color;
    drawGradientArc0036.endColor = line0008.color;
    drawGradientArc0036.width = 6.5;
    drawGradientArc0036.center = CGPointMake(2021.5, 1946);
    drawGradientArc0036.startGradient = CGPointMake(2000, 1903);
    drawGradientArc0036.endGradient = CGPointMake(2000, 1960);
    drawGradientArc0036.radius = 43.5;
    drawGradientArc0036.startRadians = 294 * M_PI / 180;
    drawGradientArc0036.endRadians = 18 * M_PI / 180;
    [vertex0028.drawPrimitives addObject:drawGradientArc0036];
    
    MMDrawGradientArc *drawGradientArc0037 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0037.startColor = line0007.color;
    drawGradientArc0037.endColor = line0008.color;
    drawGradientArc0037.width = 6.5;
    drawGradientArc0037.center = CGPointMake(2021.5, 1946);
    drawGradientArc0037.startGradient = CGPointMake(2000, 1916);
    drawGradientArc0037.endGradient = CGPointMake(2000, 1955);
    drawGradientArc0037.radius = 31.5;
    drawGradientArc0037.startRadians = 301 * M_PI / 180;
    drawGradientArc0037.endRadians = 15 * M_PI / 180;
    [vertex0028.drawPrimitives addObject:drawGradientArc0037]; */
    
    MWDrawGradientArc *drawGradientArc0036 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0036.startColor = line0007.color;
    drawGradientArc0036.endColor = line0008.color;
    drawGradientArc0036.width = 18;
    drawGradientArc0036.center = CGPointMake(2021.5, 1946);
    drawGradientArc0036.startGradient = CGPointMake(2000, 1903);
    drawGradientArc0036.endGradient = CGPointMake(2000, 1960);
    drawGradientArc0036.radius = 37.5;
    drawGradientArc0036.startRadians = 294 * M_PI / 180;
    drawGradientArc0036.endRadians = 15 * M_PI / 180;
    [vertex0028.drawPrimitives addObject:drawGradientArc0036];

/*    MMDrawGradientArc *drawGradientArc0038 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0038.startColor = line0007.color;
    drawGradientArc0038.endColor = line0005.color;
    drawGradientArc0038.width = 6.5;
    drawGradientArc0038.center = CGPointMake(2021.5, 1946);
    drawGradientArc0038.startGradient = CGPointMake(1000, 1915);
    drawGradientArc0038.endGradient = CGPointMake(1000, 1927);
    drawGradientArc0038.radius = 31.5;
    drawGradientArc0038.startRadians = 220 * M_PI / 180;
    drawGradientArc0038.endRadians = 241 * M_PI / 180;
    [vertex0028.drawPrimitives addObject:drawGradientArc0038];
    
    MMDrawGradientArc *drawGradientArc0039 = [[MMDrawGradientArc alloc] init];
    drawGradientArc0039.startColor = line0007.color;
    drawGradientArc0039.endColor = line0005.color;
    drawGradientArc0039.width = 6.5;
    drawGradientArc0039.center = CGPointMake(2021.5, 1946);
    drawGradientArc0039.startGradient = CGPointMake(1000, 1903);
    drawGradientArc0039.endGradient = CGPointMake(1000, 1920);
    drawGradientArc0039.radius = 43.5;
    drawGradientArc0039.startRadians = 214 * M_PI / 180;
    drawGradientArc0039.endRadians = 246 * M_PI / 180;
    [vertex0028.drawPrimitives addObject:drawGradientArc0039]; */
    
    MWDrawGradientArc *drawGradientArc0038 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0038.startColor = line0007.color;
    drawGradientArc0038.endColor = line0005.color;
    drawGradientArc0038.width = 18;
    drawGradientArc0038.center = CGPointMake(2021.5, 1946);
    drawGradientArc0038.startGradient = CGPointMake(1000, 1903);
    drawGradientArc0038.endGradient = CGPointMake(1000, 1927);
    drawGradientArc0038.radius = 37.5;
    drawGradientArc0038.startRadians = 214 * M_PI / 180;
    drawGradientArc0038.endRadians = 246 * M_PI / 180;
    [vertex0028.drawPrimitives addObject:drawGradientArc0038];

    MWDrawArc *drawArc0120 = [[MWDrawArc alloc] init];
    drawArc0120.center = CGPointMake(1985, 1939);
    drawArc0120.startRadians = M_PI * 2;
    drawArc0120.endRadians = 0;
    drawArc0120.radius = 14;
    drawArc0120.width = 10;
    drawArc0120.color = line0005.color;
    [vertex0028.drawPrimitives addObject:drawArc0120];
    
    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = CGPointMake(1985, 1939);
    fillCircle0049.radius = 9;
    fillCircle0049.fillColor = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:fillCircle0049];
    
    MWDrawArc *drawArc0121 = [[MWDrawArc alloc] init];
    drawArc0121.center = CGPointMake(2021.5, 1908.5);
    drawArc0121.startRadians = M_PI * 2;
    drawArc0121.endRadians = 0;
    drawArc0121.radius = 14;
    drawArc0121.width = 10;
    drawArc0121.color = line0007.color;
    [vertex0028.drawPrimitives addObject:drawArc0121];
    
    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = CGPointMake(2021.5, 1908.5);
    fillCircle0050.radius = 9;
    fillCircle0050.fillColor = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:fillCircle0050];
    
    MWDrawArc *drawArc0122 = [[MWDrawArc alloc] init];
    drawArc0122.center = CGPointMake(2048.5, 1972.5);
    drawArc0122.startRadians = M_PI * 2;
    drawArc0122.endRadians = 0;
    drawArc0122.radius = 14;
    drawArc0122.width = 10;
    drawArc0122.color = line0008.color;
    [vertex0028.drawPrimitives addObject:drawArc0122];
    
    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = CGPointMake(2048.5, 1972.5);
    fillCircle0051.radius = 9;
    fillCircle0051.fillColor = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:fillCircle0051];
    
    MWDrawArc *drawArc0123 = [[MWDrawArc alloc] init];
    drawArc0123.center = CGPointMake(2021.5, 1946);
    drawArc0123.startRadians = M_PI * 2;
    drawArc0123.endRadians = 0;
    drawArc0123.radius = 37.5;
    drawArc0123.width = 6.5;
    drawArc0123.color = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:drawArc0123];
    
    // Новоясеневская
    MWVertex *vertex0029 = [[MWVertex alloc] init];
    vertex0029.identifier = @"vertex0029";
    vertex0029.developmentName = @"Вершина: Новоясеневская / Битцевский парк";
    [self.vertices addObject:vertex0029];
    
    MWDrawGradientRect *drawGradientRect0028 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0028.startColor = line0006.color;
    drawGradientRect0028.endColor = line0012.color;
    drawGradientRect0028.point1 = CGPointMake(1005.5, 3052);
    drawGradientRect0028.point2 = CGPointMake(1020.5, 3052);
    drawGradientRect0028.point3 = CGPointMake(1020.5, 3085.5);
    drawGradientRect0028.point4 = CGPointMake(1005.5, 3085.5);
    [vertex0029.drawPrimitives addObject:drawGradientRect0028];
    
    // Китай-город
    MWVertex *vertex0030 = [[MWVertex alloc] init];
    vertex0030.identifier = @"vertex0030";
    vertex0030.developmentName = @"Вершина: Китай-город";
    [self.vertices addObject:vertex0030];
    
    MWDrawGradientRect *drawGradientRect0018 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0018.startColor = line0006.color;
    drawGradientRect0018.endColor = line0007.color;
    drawGradientRect0018.point1 = CGPointMake(1805, 1735);
    drawGradientRect0018.point2 = CGPointMake(1805, 1716);
    drawGradientRect0018.point3 = CGPointMake(1822, 1716);
    drawGradientRect0018.point4 = CGPointMake(1822, 1735);
    [vertex0030.drawPrimitives addObject:drawGradientRect0018];
    
    MWDrawArc *drawArc0124 = [[MWDrawArc alloc] init];
    drawArc0124.center = CGPointMake(1788.5, 1725.5);
    drawArc0124.startRadians = M_PI * 2;
    drawArc0124.endRadians = 0;
    drawArc0124.radius = 14;
    drawArc0124.width = 10;
    drawArc0124.color = line0006.color;
    [vertex0030.drawPrimitives addObject:drawArc0124];
    
    MWDrawArc *drawArc0125 = [[MWDrawArc alloc] init];
    drawArc0125.center = CGPointMake(1838.5, 1725.5);
    drawArc0125.startRadians = M_PI * 2;
    drawArc0125.endRadians = 0;
    drawArc0125.radius = 14;
    drawArc0125.width = 10;
    drawArc0125.color = line0007.color;
    [vertex0030.drawPrimitives addObject:drawArc0125];
    
    MWDrawLine *drawLine0355 = [[MWDrawLine alloc] init];
    drawLine0355.startPoint = CGPointMake(1788.5, 1725.5);
    drawLine0355.endPoint = CGPointMake(1838.5, 1725.5);
    drawLine0355.width = 6;
    drawLine0355.color = [UIColor whiteColor];
    [vertex0030.drawPrimitives addObject:drawLine0355];
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = CGPointMake(1788.5, 1725.5);
    fillCircle0052.radius = 9;
    fillCircle0052.fillColor = [UIColor whiteColor];
    [vertex0030.drawPrimitives addObject:fillCircle0052];
    
    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = CGPointMake(1838.5, 1725.5);
    fillCircle0053.radius = 9;
    fillCircle0053.fillColor = [UIColor whiteColor];
    [vertex0030.drawPrimitives addObject:fillCircle0053];
    
    // Медведково
    MWVertex *vertex0031 = [[MWVertex alloc] init];
    vertex0031.identifier = @"vertex0031";
    vertex0031.developmentName = @"Вершина: Медведково";
    [self.vertices addObject:vertex0031];
    
    // Котельники
    MWVertex *vertex0032 = [[MWVertex alloc] init];
    vertex0032.identifier = @"vertex0032";
    vertex0032.developmentName = @"Вершина: Котельники";
    [self.vertices addObject:vertex0032];
    
    // Крестьянская Застава - Пролетарская
    MWVertex *vertex0033 = [[MWVertex alloc] init];
    vertex0033.identifier = @"vertex0033";
    vertex0033.developmentName = @"Вершина: Крестьянская Застава - Пролетарская";
    [self.vertices addObject:vertex0033];

    MWDrawGradientRect *drawGradientRect0019 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0019.startColor = line0010.color;
    drawGradientRect0019.endColor = line0007.color;
    drawGradientRect0019.point1 = CGPointMake(2158.5, 2119.5);
    drawGradientRect0019.point2 = CGPointMake(2155.5, 2112.5);
    drawGradientRect0019.point3 = CGPointMake(2178.5, 2089);
    drawGradientRect0019.point4 = CGPointMake(2186.5, 2090.5);
    [vertex0033.drawPrimitives addObject:drawGradientRect0019];
    
    MWDrawGradientRect *drawGradientRect0020 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0020.startColor = line0010.color;
    drawGradientRect0020.endColor = line0007.color;
    drawGradientRect0020.point1 = CGPointMake(2165.5, 2128.5);
    drawGradientRect0020.point2 = CGPointMake(2162.5, 2121.5);
    drawGradientRect0020.point3 = CGPointMake(2184.5, 2098);
    drawGradientRect0020.point4 = CGPointMake(2192.5, 2099.5);
    [vertex0033.drawPrimitives addObject:drawGradientRect0020];
    
    MWDrawArc *drawArc0126 = [[MWDrawArc alloc] init];
    drawArc0126.center = CGPointMake(2149.5, 2131.5);
    drawArc0126.startRadians = M_PI * 2;
    drawArc0126.endRadians = 0;
    drawArc0126.radius = 14;
    drawArc0126.width = 10;
    drawArc0126.color = line0010.color;
    [vertex0033.drawPrimitives addObject:drawArc0126];
    
    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = CGPointMake(2149.5, 2131.5);
    fillCircle0054.radius = 9;
    fillCircle0054.fillColor = [UIColor whiteColor];
    [vertex0033.drawPrimitives addObject:fillCircle0054];
    
    MWDrawArc *drawArc0127 = [[MWDrawArc alloc] init];
    drawArc0127.center = CGPointMake(2196.5, 2083.5);
    drawArc0127.startRadians = M_PI * 2;
    drawArc0127.endRadians = 0;
    drawArc0127.radius = 14;
    drawArc0127.width = 10;
    drawArc0127.color = line0007.color;
    [vertex0033.drawPrimitives addObject:drawArc0127];
    
    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = CGPointMake(2196.5, 2083.5);
    fillCircle0055.radius = 9;
    fillCircle0055.fillColor = [UIColor whiteColor];
    [vertex0033.drawPrimitives addObject:fillCircle0055];
    
    MWDrawLine *drawLine0356 = [[MWDrawLine alloc] init];
    drawLine0356.startPoint = CGPointMake(2149.5, 2131.5);
    drawLine0356.endPoint = CGPointMake(2196.5, 2083.5);
    drawLine0356.width = 5;
    drawLine0356.color = [UIColor whiteColor];
    [vertex0033.drawPrimitives addObject:drawLine0356];
    
    // Планерная
    MWVertex *vertex0034 = [[MWVertex alloc] init];
    vertex0034.identifier = @"vertex0034";
    vertex0034.developmentName = @"Вершина: Планерная";
    [self.vertices addObject:vertex0034];
    
    // Новокосино
    MWVertex *vertex0035 = [[MWVertex alloc] init];
    vertex0035.identifier = @"vertex0035";
    vertex0035.developmentName = @"Вершина: Новокосино";
    [self.vertices addObject:vertex0035];
    
    // Римская - Площадь Ильича
    MWVertex *vertex0036 = [[MWVertex alloc] init];
    vertex0036.identifier = @"vertex0036";
    vertex0036.developmentName = @"Вершина: Римская - Площадь Ильича";
    [self.vertices addObject:vertex0036];

    MWDrawGradientRect *drawGradientRect0021 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0021.startColor = line0010.color;
    drawGradientRect0021.endColor = line0008.color;
    drawGradientRect0021.point1 = CGPointMake(2166, 1813);
    drawGradientRect0021.point2 = CGPointMake(2166, 1794);
    drawGradientRect0021.point3 = CGPointMake(2200, 1794);
    drawGradientRect0021.point4 = CGPointMake(2200, 1813);
    [vertex0036.drawPrimitives addObject:drawGradientRect0021];
    
    MWDrawArc *drawArc0128 = [[MWDrawArc alloc] init];
    drawArc0128.center = CGPointMake(2149.5, 1803.5);
    drawArc0128.startRadians = M_PI * 2;
    drawArc0128.endRadians = 0;
    drawArc0128.radius = 14;
    drawArc0128.width = 10;
    drawArc0128.color = line0010.color;
    [vertex0036.drawPrimitives addObject:drawArc0128];
    
    MWDrawArc *drawArc0129 = [[MWDrawArc alloc] init];
    drawArc0129.center = CGPointMake(2216.5, 1803.5);
    drawArc0129.startRadians = M_PI * 2;
    drawArc0129.endRadians = 0;
    drawArc0129.radius = 14;
    drawArc0129.width = 10;
    drawArc0129.color = line0008.color;
    [vertex0036.drawPrimitives addObject:drawArc0129];
    
    MWDrawLine *drawLine0357 = [[MWDrawLine alloc] init];
    drawLine0357.startPoint = CGPointMake(2149.5, 1803.5);
    drawLine0357.endPoint = CGPointMake(2216.5, 1803.5);
    drawLine0357.width = 6;
    drawLine0357.color = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:drawLine0357];
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = CGPointMake(2149.5, 1803.5);
    fillCircle0056.radius = 9;
    fillCircle0056.fillColor = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:fillCircle0056];
    
    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = CGPointMake(2216.5, 1803.5);
    fillCircle0057.radius = 9;
    fillCircle0057.fillColor = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:fillCircle0057];
    
    // Бульвар Дмитрия Донского - Улица Старокачаловская
    MWVertex *vertex0037 = [[MWVertex alloc] init];
    vertex0037.identifier = @"vertex0037";
    vertex0037.developmentName = @"Вершина: Бульвар Дмитрия Донского - Улица Старокачаловская";
    [self.vertices addObject:vertex0037];

    MWDrawGradientRect *drawGradientRect0022 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0022.startColor = line0012.color;
    drawGradientRect0022.endColor = line0009.color;
    drawGradientRect0022.point1 = CGPointMake(1296, 3173.5);
    drawGradientRect0022.point2 = CGPointMake(1291, 3168.5);
    drawGradientRect0022.point3 = CGPointMake(1317, 3143);
    drawGradientRect0022.point4 = CGPointMake(1325, 3145.5);
    [vertex0037.drawPrimitives addObject:drawGradientRect0022];
    
    MWDrawGradientRect *drawGradientRect0023 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0023.startColor = line0012.color;
    drawGradientRect0023.endColor = line0009.color;
    drawGradientRect0023.point1 = CGPointMake(1305.5, 3180.5);
    drawGradientRect0023.point2 = CGPointMake(1300.5, 3175.5);
    drawGradientRect0023.point3 = CGPointMake(1324, 3152);
    drawGradientRect0023.point4 = CGPointMake(1333, 3153);
    [vertex0037.drawPrimitives addObject:drawGradientRect0023];
    
    MWDrawArc *drawArc0130 = [[MWDrawArc alloc] init];
    drawArc0130.center = CGPointMake(1335.5, 3137.5);
    drawArc0130.startRadians = M_PI * 2;
    drawArc0130.endRadians = 0;
    drawArc0130.radius = 14;
    drawArc0130.width = 10;
    drawArc0130.color = line0009.color;
    [vertex0037.drawPrimitives addObject:drawArc0130];
    
    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = CGPointMake(1335.5, 3137.5);
    fillCircle0058.radius = 9;
    fillCircle0058.fillColor = [UIColor whiteColor];
    [vertex0037.drawPrimitives addObject:fillCircle0058];
    
    MWDrawArc *drawArc0131 = [[MWDrawArc alloc] init];
    drawArc0131.center = CGPointMake(1287.5, 3185);
    drawArc0131.startRadians = M_PI * 2;
    drawArc0131.endRadians = 0;
    drawArc0131.radius = 14;
    drawArc0131.width = 10;
    drawArc0131.color = line0012.color;
    [vertex0037.drawPrimitives addObject:drawArc0131];
    
    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = CGPointMake(1287.5, 3185);
    fillCircle0059.radius = 9;
    fillCircle0059.fillColor = [UIColor whiteColor];
    [vertex0037.drawPrimitives addObject:fillCircle0059];
    
    MWDrawLine *drawLine0358 = [[MWDrawLine alloc] init];
    drawLine0358.startPoint = CGPointMake(1335.5, 3137.5);
    drawLine0358.endPoint = CGPointMake(1287.5, 3185);
    drawLine0358.width = 5;
    drawLine0358.color = [UIColor whiteColor];
    [vertex0037.drawPrimitives addObject:drawLine0358];
    
    // Севастопольская - Каховская
    MWVertex *vertex0038 = [[MWVertex alloc] init];
    vertex0038.identifier = @"vertex0038";
    vertex0038.developmentName = @"Вершина: Севастопольская - Каховская";
    [self.vertices addObject:vertex0038];

    MWDrawGradientRect *drawGradientRect0024 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0024.startColor = line0011.color;
    drawGradientRect0024.endColor = line0009.color;
    drawGradientRect0024.point1 = CGPointMake(1292, 2704);
    drawGradientRect0024.point2 = CGPointMake(1305, 2692);
    drawGradientRect0024.point3 = CGPointMake(1331, 2718);
    drawGradientRect0024.point4 = CGPointMake(1318, 2730);
    [vertex0038.drawPrimitives addObject:drawGradientRect0024];
    
    MWDrawArc *drawArc0132 = [[MWDrawArc alloc] init];
    drawArc0132.center = CGPointMake(1335.5, 2735.5);
    drawArc0132.startRadians = M_PI * 2;
    drawArc0132.endRadians = 0;
    drawArc0132.radius = 14;
    drawArc0132.width = 10;
    drawArc0132.color = line0009.color;
    [vertex0038.drawPrimitives addObject:drawArc0132];
    
    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = CGPointMake(1335.5, 2735.5);
    fillCircle0060.radius = 9;
    fillCircle0060.fillColor = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:fillCircle0060];
    
    MWDrawArc *drawArc0133 = [[MWDrawArc alloc] init];
    drawArc0133.center = CGPointMake(1287.5, 2686.5);
    drawArc0133.startRadians = M_PI * 2;
    drawArc0133.endRadians = 0;
    drawArc0133.radius = 14;
    drawArc0133.width = 10;
    drawArc0133.color = line0011.color;
    [vertex0038.drawPrimitives addObject:drawArc0133];
    
    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = CGPointMake(1287.5, 2686.5);
    fillCircle0061.radius = 9;
    fillCircle0061.fillColor = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:fillCircle0061];
    
    MWDrawLine *drawLine0359 = [[MWDrawLine alloc] init];
    drawLine0359.startPoint = CGPointMake(1335.5, 2735.5);
    drawLine0359.endPoint = CGPointMake(1287.5, 2686.5);
    drawLine0359.width = 5;
    drawLine0359.color = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:drawLine0359];
    
    // Цветной бульвар - Трубная
    MWVertex *vertex0039 = [[MWVertex alloc] init];
    vertex0039.identifier = @"vertex0039";
    vertex0039.developmentName = @"Вершина: Цветной бульвар - Трубная";
    [self.vertices addObject:vertex0039];
    
    MWDrawGradientRect *drawGradientRect0025 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0025.startColor = line0009.color;
    drawGradientRect0025.endColor = line0010.color;
    drawGradientRect0025.point1 = CGPointMake(1304, 1250);
    drawGradientRect0025.point2 = CGPointMake(1304, 1232);
    drawGradientRect0025.point3 = CGPointMake(1339, 1232);
    drawGradientRect0025.point4 = CGPointMake(1339, 1250);
    [vertex0039.drawPrimitives addObject:drawGradientRect0025];
    
    MWDrawArc *drawArc0134 = [[MWDrawArc alloc] init];
    drawArc0134.center = CGPointMake(1287.5, 1240.5);
    drawArc0134.startRadians = M_PI * 2;
    drawArc0134.endRadians = 0;
    drawArc0134.radius = 14;
    drawArc0134.width = 10;
    drawArc0134.color = line0009.color;
    [vertex0039.drawPrimitives addObject:drawArc0134];
    
    MWDrawArc *drawArc0135 = [[MWDrawArc alloc] init];
    drawArc0135.center = CGPointMake(1355.5, 1240.5);
    drawArc0135.startRadians = M_PI * 2;
    drawArc0135.endRadians = 0;
    drawArc0135.radius = 14;
    drawArc0135.width = 10;
    drawArc0135.color = line0010.color;
    [vertex0039.drawPrimitives addObject:drawArc0135];
    
    MWDrawLine *drawLine0360 = [[MWDrawLine alloc] init];
    drawLine0360.startPoint = CGPointMake(1287.5, 1240.5);
    drawLine0360.endPoint = CGPointMake(1355.5, 1240.5);
    drawLine0360.width = 6;
    drawLine0360.color = [UIColor whiteColor];
    [vertex0039.drawPrimitives addObject:drawLine0360];
    
    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = CGPointMake(1287.5, 1240.5);
    fillCircle0062.radius = 9;
    fillCircle0062.fillColor = [UIColor whiteColor];
    [vertex0039.drawPrimitives addObject:fillCircle0062];
    
    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = CGPointMake(1355.5, 1240.5);
    fillCircle0063.radius = 9;
    fillCircle0063.fillColor = [UIColor whiteColor];
    [vertex0039.drawPrimitives addObject:fillCircle0063];
    
    // Алтуфьево
    MWVertex *vertex0040 = [[MWVertex alloc] init];
    vertex0040.identifier = @"vertex0040";
    vertex0040.developmentName = @"Вершина: Алтуфьево";
    [self.vertices addObject:vertex0040];
    
    // Марьина Роща
    MWVertex *vertex0041 = [[MWVertex alloc] init];
    vertex0041.identifier = @"vertex0041";
    vertex0041.developmentName = @"Вершина: Марьина Роща";
    [self.vertices addObject:vertex0041];
    
    // Бунинская аллея
    MWVertex *vertex0042 = [[MWVertex alloc] init];
    vertex0042.identifier = @"vertex0042";
    vertex0042.developmentName = @"Вершина: Бунинская аллея";
    [self.vertices addObject:vertex0042];
    
    // Парк Победы (добавлен 11.04.2014 в версии 2)
    MWVertex *vertex0043 = [[MWVertex alloc] init];
    vertex0043.identifier = @"vertex0043";
    vertex0043.developmentName = @"Вершина: Парк Победы";
    [self.vertices addObject:vertex0043];

    MWDrawGradientRect *drawGradientRect0026 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0026.startColor = line0003.color;
    drawGradientRect0026.endColor = line0008.color;
    drawGradientRect0026.point1 = CGPointMake(395, 1808.5);
    drawGradientRect0026.point2 = CGPointMake(405, 1798.5);
    drawGradientRect0026.point3 = CGPointMake(418, 1811);
    drawGradientRect0026.point4 = CGPointMake(408, 1821);
    [vertex0043.drawPrimitives addObject:drawGradientRect0026];
    
    // Деловой центр (добавлен 11.04.2014 в версии 2)
    MWVertex *vertex0044 = [[MWVertex alloc] init];
    vertex0044.identifier = @"vertex0044";
    vertex0044.developmentName = @"Вершина: Деловой центр / Выставочная";
    [self.vertices addObject:vertex0044];

    MWDrawGradientRect *drawGradientRect0027 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0027.startColor = line0008.color;
    drawGradientRect0027.endColor = line0004.color;
    drawGradientRect0027.point1 = CGPointMake(440.5, 1607);
    drawGradientRect0027.point2 = CGPointMake(440.5, 1593);
    drawGradientRect0027.point3 = CGPointMake(476, 1593);
    drawGradientRect0027.point4 = CGPointMake(476, 1607);
    [vertex0043.drawPrimitives addObject:drawGradientRect0027];

/*    MMDrawLine *drawLine0374 = [[MMDrawLine alloc] init];
    drawLine0374.startPoint = CGPointMake(440, 1600);
    drawLine0374.endPoint = CGPointMake(475.5, 1600);
    drawLine0374.width = 14.5;
    drawLine0374.color = line0008.color;
    [vertex0044.drawPrimitives addObject:drawLine0374];
 */
    ////////////////////////////////////////////////////////////////
    // 1. Сокольническая линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Румянцево" до "Парк культуры"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Тропарево - Парк культуры";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;

    // Добавляем станцию "Румянцево"
    MWStation *station0198 = [[MWStation alloc] init];
    station0198.identifier = @"station0198";
    [edge0001.elements addObject:station0198];
    
    station0198.nameOriginal = @"Румянцево";
    station0198.nameEnglish = @"Rumyantsevo";
    station0198.mapLocation = CGPointMake(650.5, 2725.5);
    station0198.geoLocation = CGPointMake(55.633, 37.4419);

    MWDrawLine *drawLine0389 = [[MWDrawLine alloc] init];
    drawLine0389.startPoint = CGPointMake(630, 2726);
    drawLine0389.endPoint = CGPointMake(670, 2726);
    drawLine0389.width = 12;
    drawLine0389.color = line0001.color;
    [station0198.drawPrimitives addObject:drawLine0389];

    MWDrawTextLine *drawTextLine0425 = [[MWDrawTextLine alloc] init];
    drawTextLine0425.text = station0198.nameOriginal;
    drawTextLine0425.fontName = @"HelveticaNeue";
    drawTextLine0425.fontColor = [UIColor blackColor];
    drawTextLine0425.fontSize = 32;
    drawTextLine0425.origin = CGPointMake(678, 2703);
    [station0198.nameOriginalTextPrimitives addObject:drawTextLine0425];

    MWDrawTextLine *drawTextLine0426 = [[MWDrawTextLine alloc] init];
    drawTextLine0426.text = station0198.nameEnglish;
    drawTextLine0426.fontName = @"HelveticaNeue";
    drawTextLine0426.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0426.fontSize = 18;
    drawTextLine0426.origin = CGPointMake(672, 2735);
    [station0198.nameEnglishTextPrimitives addObject:drawTextLine0426];

    // Добавляем перегон
    MWHaul *haul0186 = [[MWHaul alloc] init];
    haul0186.identifier = @"haul0186";
    haul0186.length = 2420;
    [edge0001.elements addObject:haul0186];

    MWDrawLine *drawLine0390 = [[MWDrawLine alloc] init];
    drawLine0390.startPoint = CGPointMake(650.5, 2726);
    drawLine0390.endPoint = CGPointMake(650.5, 2645);
    drawLine0390.width = 14.5;
    drawLine0390.color = line0001.color;
    [haul0186.drawPrimitives addObject:drawLine0390];

    // Добавляем станцию "Тропарево"
    MWStation *station0196 = [[MWStation alloc] init];
    station0196.identifier = @"station0196";
    [edge0001.elements addObject:station0196];

    station0196.nameOriginal = @"Тропарёво";
    station0196.nameEnglish = @"Troparevo";
    station0196.mapLocation = CGPointMake(650.5, 2645);
    station0196.geoLocation = CGPointMake(55.6459, 37.4725);

    MWDrawLine *drawLine0385 = [[MWDrawLine alloc] init];
    drawLine0385.startPoint = CGPointMake(650, 2645.5);
    drawLine0385.endPoint = CGPointMake(670, 2645.5);
    drawLine0385.width = 12;
    drawLine0385.color = line0001.color;
    [station0196.drawPrimitives addObject:drawLine0385];

    MWDrawTextLine *drawTextLine0421 = [[MWDrawTextLine alloc] init];
    drawTextLine0421.text = station0196.nameOriginal;
    drawTextLine0421.fontName = @"HelveticaNeue";
    drawTextLine0421.fontColor = [UIColor blackColor];
    drawTextLine0421.fontSize = 32;
    drawTextLine0421.origin = CGPointMake(678, 2622.5);
    [station0196.nameOriginalTextPrimitives addObject:drawTextLine0421];
    
    MWDrawTextLine *drawTextLine0422 = [[MWDrawTextLine alloc] init];
    drawTextLine0422.text = station0196.nameEnglish;
    drawTextLine0422.fontName = @"HelveticaNeue";
    drawTextLine0422.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0422.fontSize = 18;
    drawTextLine0422.origin = CGPointMake(672, 2654.5);
    [station0196.nameEnglishTextPrimitives addObject:drawTextLine0422];
    
    // Добавляем перегон
    MWHaul *haul0184 = [[MWHaul alloc] init];
    haul0184.identifier = @"haul0184";
    haul0184.length = 2100;
    [edge0001.elements addObject:haul0184];

    MWDrawLine *drawLine0386 = [[MWDrawLine alloc] init];
    drawLine0386.startPoint = CGPointMake(650.5, 2645);
    drawLine0386.endPoint = CGPointMake(650.5, 2566);
    drawLine0386.width = 14.5;
    drawLine0386.color = line0001.color;
    [haul0184.drawPrimitives addObject:drawLine0386];

    // Добавляем станцию "Юго-западная"
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Юго-Западная";
    station0001.nameEnglish = @"Yugo-Zapadnaya";
    station0001.mapLocation = CGPointMake(650.5, 2564.5);
    station0001.geoLocation = CGPointMake(55.663750, 37.483152);
    
    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(650, 2565);
    drawLine0001.endPoint = CGPointMake(670, 2565);
    drawLine0001.width = 12;
    drawLine0001.color = line0001.color;
    [station0001.drawPrimitives addObject:drawLine0001];
    
    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0001.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 32;
    drawTextLine0001.origin = CGPointMake(678, 2542);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];
    
    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0001.nameEnglish;
    drawTextLine0002.fontName = @"HelveticaNeue";
    drawTextLine0002.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0002.fontSize = 18;
    drawTextLine0002.origin = CGPointMake(672, 2574);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0002];
    
    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 2150;
    [edge0001.elements addObject:haul0001];
    
    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(650.5, 2566);
    drawLine0002.endPoint = CGPointMake(650.5, 2453);
    drawLine0002.width = 14.5;
    drawLine0002.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0002];
    
    // Добавляем станцию "Проспект Вернадского"
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Проспект Вернадского";
    station0002.nameEnglish = @"Prospekt Vernadskogo";
    station0002.mapLocation = CGPointMake(650, 2453.5);
    station0002.geoLocation = CGPointMake(55.676978, 37.506314);
    
    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(650, 2454);
    drawLine0003.endPoint = CGPointMake(670, 2454);
    drawLine0003.width = 12;
    drawLine0003.color = line0001.color;
    [station0002.drawPrimitives addObject:drawLine0003];
    
    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = @"Проспект";
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 32;
    drawTextLine0003.origin = CGPointMake(678, 2430);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0003];
    
    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = @"Вернадского";
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 32;
    drawTextLine0004.origin = CGPointMake(678, 2461);
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0004];
    
    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0002.nameEnglish;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0005.fontSize = 18;
    drawTextLine0005.origin = CGPointMake(672, 2496);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0005];
    
    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 2500;
    [edge0001.elements addObject:haul0002];
    
    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(650.5, 2454);
    drawLine0004.endPoint = CGPointMake(650.5, 2373);
    drawLine0004.width = 14.5;
    drawLine0004.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0004];
    
    // Добавляем станцию "Университет"
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Университет";
    station0003.nameEnglish = @"Universitet";
    station0003.mapLocation = CGPointMake(650, 2373);
    station0003.geoLocation = CGPointMake(55.692551, 37.534592);
    
    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(650, 2373.5);
    drawLine0005.endPoint = CGPointMake(670, 2373.5);
    drawLine0005.width = 12;
    drawLine0005.color = line0001.color;
    [station0003.drawPrimitives addObject:drawLine0005];
    
    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = @"Университет";
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 32;
    drawTextLine0006.origin = CGPointMake(678, 2349);
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0006];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0003.nameEnglish;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0007.fontSize = 18;
    drawTextLine0007.origin = CGPointMake(672, 2384);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0007];
    
    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 2540;
    [edge0001.elements addObject:haul0003];
    
    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(650.5, 2373);
    drawLine0006.endPoint = CGPointMake(650.5, 2308);
    drawLine0006.width = 14.5;
    drawLine0006.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0006];
    
    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(746.5, 2309);
    drawArc0001.startRadians = 3.15;
    drawArc0001.endRadians = 4.03;
    drawArc0001.radius = 96;
    drawArc0001.width = 14.5;
    drawArc0001.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawArc0001];
    
    // Добавляем станцию "Воробьевы горы"
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];

    station0004.nameOriginal = @"Воробьевы горы";
    station0004.nameEnglish = @"Vorobyovy Gory";
    station0004.mapLocation = CGPointMake(686, 2235);
    station0004.geoLocation = CGPointMake(55.710409, 37.559425);
    
    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(680.7, 2229.7);
    drawLine0007.endPoint = CGPointMake(699, 2248);
    drawLine0007.width = 12;
    drawLine0007.color = line0001.color;
    [station0004.drawPrimitives addObject:drawLine0007];
    
    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = @"Воробьёвы";
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 32;
    drawTextLine0008.origin = CGPointMake(702, 2247);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0008];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = @"горы";
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 32;
    drawTextLine0009.origin = CGPointMake(702, 2278);
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0009];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = station0004.nameEnglish;
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0010.fontSize = 18;
    drawTextLine0010.origin = CGPointMake(696, 2313);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0010];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 1480;
    [edge0001.elements addObject:haul0004];
    
    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(685, 2235);
    drawLine0008.endPoint = CGPointMake(742.5, 2177.5);
    drawLine0008.width = 14.5;
    drawLine0008.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0008];
    
    // Добавляем станцию "Спортивная"
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];

    station0005.nameOriginal = @"Спортивная";
    station0005.nameEnglish = @"Sportivnaya";
    station0005.mapLocation = CGPointMake(743, 2178);
    station0005.geoLocation = CGPointMake(55.723338, 37.564069);
    
    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(743, 2178);
    drawLine0009.endPoint = CGPointMake(756, 2191);
    drawLine0009.width = 12;
    drawLine0009.color = line0001.color;
    [station0005.drawPrimitives addObject:drawLine0009];
    
    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = station0005.nameOriginal;
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 32;
    drawTextLine0011.origin = CGPointMake(758, 2186);
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0011];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = station0005.nameEnglish;
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0012.fontSize = 18;
    drawTextLine0012.origin = CGPointMake(752, 2221);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0012];
    
    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1290;
    [edge0001.elements addObject:haul0005];
    
    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(742, 2178);
    drawLine0010.endPoint = CGPointMake(797, 2123);
    drawLine0010.width = 14.5;
    drawLine0010.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0010];
    
    // Добавляем станцию "Фрунзенская"
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Фрунзенская";
    station0006.nameEnglish = @"Frunzenskaya";
    station0006.mapLocation = CGPointMake(797.5, 2123.5);
    station0006.geoLocation = CGPointMake(55.727474, 37.580684);
    
    MWGraphStatus *status = [[MWGraphStatus alloc] init];
    status.status = MWGraphObjectStatusClosed;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    NSString *dateString = @"1.3.2017";
    NSDate *date = [dateFormatter dateFromString:dateString];
    status.toDate = date;

    [station0006.states addObject:status];
    
    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(797.5, 2123.5);
    drawLine0011.endPoint = CGPointMake(810, 2137);
    drawLine0011.width = 12;
    drawLine0011.color = line0001.color;
    [station0006.drawPrimitives addObject:drawLine0011];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = station0006.nameOriginal;
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 32;
    drawTextLine0013.origin = CGPointMake(814, 2132);
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0013];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0006.nameEnglish;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0014.fontSize = 18;
    drawTextLine0014.origin = CGPointMake(808, 2167);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0014];
    
    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1350;
    [edge0001.elements addObject:haul0006];
    
    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(797, 2123);
    drawLine0012.endPoint = CGPointMake(897.0, 2023);
    drawLine0012.width = 14.5;
    drawLine0012.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0012];
    
    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(937.85, 2066.9);
    drawArc0002.startRadians = 3.955;
    drawArc0002.endRadians = 4.8;
    drawArc0002.radius = 60;
    drawArc0002.width = 14.5;
    drawArc0002.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawArc0002];
    
    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(942, 2007);
    drawLine0013.endPoint = CGPointMake(972 , 2007);
    drawLine0013.width = 14.5;
    drawLine0013.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0013];
    
    // Добавляем станцию "Парк культуры"
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"Парк культуры";
    station0007.nameEnglish = @"Park Kultury";
    station0007.mapLocation = CGPointMake(972, 2007);
    station0007.geoLocation = CGPointMake(55.735204, 37.593074);
    
    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0007.nameOriginal;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 32;
    drawTextLine0015.origin = CGPointMake(987, 2019);
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0015];
    
    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0007.nameEnglish;
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0016.fontSize = 18;
    drawTextLine0016.origin = CGPointMake(995, 2054);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0016];
    
    MWDrawFillCircle *fillCircle0083 = [[MWDrawFillCircle alloc] init];
    fillCircle0083.center = CGPointMake(972, 2007);
    fillCircle0083.radius = 4;
    fillCircle0083.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0083];
    
    // Добавляем вершину
    edge0001.finishVertex = vertex0002;
    
    // Создаем участок линии от "Парк культуры" до "Библиотека им. Ленина"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Парк культуры - Библиотека им. Ленина";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;
    
    // Добавляем станцию "Парк культуры"
    [edge0002.elements addObject:station0007];
    
    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 1130;
    [edge0002.elements addObject:haul0007];
    
    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(971.5, 2007);
    drawLine0014.endPoint = CGPointMake(1076, 2007);
    drawLine0014.width = 14.5;
    drawLine0014.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0014];		
    
    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(1071, 1890);
    drawArc0003.startRadians = 7.05;
    drawArc0003.endRadians = 7.82;
    drawArc0003.radius = 117;
    drawArc0003.width = 14.5;
    drawArc0003.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawArc0003];
    
    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(1154.6, 1971.7);
    drawLine0015.endPoint = CGPointMake(1165.5, 1960.5);
    drawLine0015.width = 14.5;
    drawLine0015.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0015];
    
    // Добавляем станцию "Кропоткинская"
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0002.elements addObject:station0008];
    
    station0008.nameOriginal = @"Кропоткинская";
    station0008.nameEnglish = @"Kropotkinskaya";
    station0008.mapLocation = CGPointMake(1166, 1960);
    station0008.geoLocation = CGPointMake(55.745155, 37.603031);
    
    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(1166, 1961);
    drawLine0016.endPoint = CGPointMake(1179, 1974);
    drawLine0016.width = 12;
    drawLine0016.color = line0001.color;
    [station0008.drawPrimitives addObject:drawLine0016];
    
    MWDrawLine *drawLine0371 = [[MWDrawLine alloc] init];
    drawLine0371.startPoint = CGPointMake(1208, 1993.5);
    drawLine0371.endPoint = CGPointMake(1258, 1993.5);
    drawLine0371.width = 22;
    drawLine0371.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0008.nameOriginalTextPrimitives addObject:drawLine0371];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0008.nameOriginal;
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 32;
    drawTextLine0017.origin = CGPointMake(1185, 1971);
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0017];
    
    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0008.nameEnglish;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0018.fontSize = 18;
    drawTextLine0018.origin = CGPointMake(1282, 1957);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0018];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length= 970;
    [edge0002.elements addObject:haul0008];
    
    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(1165, 1961);
    drawLine0017.endPoint = CGPointMake(1238, 1888);
    drawLine0017.width = 14.5;
    drawLine0017.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0017];
    
    // Добавляем станцию "Библиотека им. Ленина"
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0002.elements addObject:station0009];
    
    station0009.nameOriginal = @"Библиотека им. Ленина";
    station0009.nameEnglish = @"Biblioteka Imeni Lenina";
    station0009.mapLocation = CGPointMake(1237, 1889);
    station0009.geoLocation = CGPointMake(55.752251, 37.610493);
    
    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0009.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 32;
    drawTextLine0019.origin = CGPointMake(1248, 1901);
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0019];
    
    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0009.nameEnglish;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0020.fontSize = 18;
    drawTextLine0020.origin = CGPointMake(1248, 1933);
    [station0009.nameEnglishTextPrimitives addObject:drawTextLine0020];
    
    // Добавляем вершину
    edge0002.finishVertex = vertex0003;
    
    // Создаем участок линии от "Библиотеки им. Ленина" до "Охотный ряд"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Библиотека им. Ленинка - Охотный ряд (красная линия)";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;
    
    // Добавляем станцию "Библиотека им. Ленина"
    [edge0003.elements addObject:station0009];
    
    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 497;
    [edge0003.elements addObject:haul0009];
    
    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(1237.5, 1888.5);
    drawLine0018.endPoint = CGPointMake(1455.5, 1670.5);
    drawLine0018.width = 14.5;
    drawLine0018.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0018];
    
    // Добавляем станцию "Охотный ряд"
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0003.elements addObject:station0010];
    
    station0010.nameOriginal = @"Охотный ряд";
    station0010.nameEnglish = @"Ohotny Ryad";
    station0010.mapLocation = CGPointMake(1455, 1671);
    station0010.geoLocation = CGPointMake(55.757877, 37.616638);
    
    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = @"Охотный";
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 32;
    drawTextLine0021.origin = CGPointMake(1302, 1603);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0021];
    
    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = @"Ряд";
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 32;
    drawTextLine0022.origin = CGPointMake(1375, 1632);
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0022];
    
    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0010.nameEnglish;
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0023.fontSize = 18;
    drawTextLine0023.origin = CGPointMake(1325, 1587);
    [station0010.nameEnglishTextPrimitives addObject:drawTextLine0023];
    
    // Добавляем вершину
    edge0003.finishVertex = vertex0004;
    
    // Создаем участок линии от "Охотный ряд" до "Лубянка"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: Охотный ряд - Лубянка";
    [self.edges addObject:(edge0004)];
    
    // Добавляем линию
    edge0004.line = line0001;

    // Добавляем вершину
    edge0004.startVertex = vertex0004;
    
    // Добавляем станцию "Охотный ряд"
    [edge0004.elements addObject:station0010];
    
    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 826;
    [edge0004.elements addObject:haul0010];
    
    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(1455, 1671);
    drawLine0019.endPoint = CGPointMake(1601.5, 1524.5);
    drawLine0019.width = 14.5;
    drawLine0019.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0019];
    
    // Добавляем станцию "Лубянка"
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0004.elements addObject:station0011];
    
    station0011.nameOriginal = @"Лубянка";
    station0011.nameEnglish = @"Lubyanka";
    station0011.mapLocation = CGPointMake(1601, 1525);
    station0011.geoLocation = CGPointMake(55.759658, 37.626579);

    // Рисуем подложку для текста
    MWDrawLine *drawLine0363 = [[MWDrawLine alloc] init];
    drawLine0363.startPoint = CGPointMake(1653, 1565.5);
    drawLine0363.endPoint = CGPointMake(1713, 1565.5);
    drawLine0363.width = 22;
    drawLine0363.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0011.nameOriginalTextPrimitives addObject:drawLine0363];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = station0011.nameOriginal;
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 32;
    drawTextLine0024.origin = CGPointMake(1593, 1543);
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0024];
    
    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = station0011.nameEnglish;
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0025.fontSize = 18;
    drawTextLine0025.origin = CGPointMake(1590, 1578);
    [station0011.nameEnglishTextPrimitives addObject:drawTextLine0025];
    
    // Добавляем вершину
    edge0004.finishVertex = vertex0005;
    
    // Создаем участок линии от "Лубянка" до "Чистые пруды"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: Лубянка - Чистые пруды";
    [self.edges addObject:edge0005];
    
    // Добавляем линию
    edge0005.line = line0001;

    // Добавляем вершину
    edge0005.startVertex = vertex0005;
    
    // Добавляем станцию "Лубянка"
    [edge0005.elements addObject:station0011];
    
    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 999;
    [edge0005.elements addObject:haul0011];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(1601, 1525);
    drawLine0020.endPoint = CGPointMake(1715, 1411);
    drawLine0020.width = 14.5;
    drawLine0020.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0020];
    
    // Добавляем станцию "Чистые пруды"
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0005.elements addObject:station0012];
    
    station0012.nameOriginal = @"Чистые пруды";
    station0012.nameEnglish = @"Chistye Prudy";
    station0012.mapLocation = CGPointMake(1714, 1412);
    station0012.geoLocation = CGPointMake(55.764930, 37.638435);

    // Подложка под текст
    MWDrawLine *drawLine0362 = [[MWDrawLine alloc] init];
    drawLine0362.startPoint = CGPointMake(1813, 1449);
    drawLine0362.endPoint = CGPointMake(1873, 1449);
    drawLine0362.width = 28;
    drawLine0362.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0012.nameOriginalTextPrimitives addObject:drawLine0362];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0012.nameOriginal;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 32;
    drawTextLine0026.origin = CGPointMake(1727, 1423);
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0026];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0012.nameEnglish;
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0027.fontSize = 18;
    drawTextLine0027.origin = CGPointMake(1727, 1457);
    [station0012.nameEnglishTextPrimitives addObject:drawTextLine0027];
    
    // Добавляем вершину
    edge0005.finishVertex = vertex0006;
    
    // Создаем участок линии от "Чистые пруды" до "Комсомольская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: Чистые пруды - Комсомольская";
    [self.edges addObject:edge0006];
    
    // Добавляем линию
    edge0006.line = line0001;

    // Добавляем вершину
    edge0006.startVertex = vertex0006;
    
    // Добавляем станцию "Чистые пруды"
    [edge0006.elements addObject:station0012];
    
    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 796;
    [edge0006.elements addObject:haul0012];
    
    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(1714.5, 1411.5);
    drawLine0021.endPoint = CGPointMake(1806.5, 1319.5);
    drawLine0021.width = 14.5;
    drawLine0021.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0021];
    
    // Добавляем станцию "Красные ворота"
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    station0013.nameOriginal = @"Красные ворота";
    [edge0006.elements addObject:station0013];
    
    station0013.nameOriginal = @"Красные Ворота";
    station0013.nameEnglish = @"Krasnye Vorota";
    station0013.mapLocation = CGPointMake(1806, 1319);
    station0013.geoLocation = CGPointMake(55.769079, 37.649105);
    
    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(1806, 1319);
    drawLine0022.endPoint = CGPointMake(1820, 1333);
    drawLine0022.width = 12;
    drawLine0022.color = line0001.color;
    [station0013.drawPrimitives addObject:drawLine0022];
    
    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = @"Красные";
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 32;
    drawTextLine0028.origin = CGPointMake(1825, 1330);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0028];
    
    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = @"Ворота";
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 32;
    drawTextLine0029.origin = CGPointMake(1825, 1361);
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0029];
    
    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = station0013.nameEnglish;
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0030.fontSize = 18;
    drawTextLine0030.origin = CGPointMake(1831, 1396);
    [station0013.nameEnglishTextPrimitives addObject:drawTextLine0030];
    
    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 757;
    [edge0006.elements addObject:haul0013];
    
    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(1806, 1320);
    drawLine0023.endPoint = CGPointMake(1921, 1205);
    drawLine0023.width = 14.5;
    drawLine0023.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0023];
    
    // Добавляем станцию "Комсомольская"
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0006.elements addObject:station0014];
    
    station0014.nameOriginal = @"Комсомольская";
    station0014.nameEnglish = @"Komsomolskaya";
    station0014.mapLocation = CGPointMake(1920.5, 1205.5);
    station0014.geoLocation = CGPointMake(55.776241, 37.655869);
    
    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = station0014.nameOriginal;
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 32;
    drawTextLine0031.origin = CGPointMake(1942, 1213);
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0031];
    
    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0014.nameEnglish;
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0032.fontSize = 18;
    drawTextLine0032.origin = CGPointMake(1995, 1197);
    [station0014.nameEnglishTextPrimitives addObject:drawTextLine0032];
    
    MWDrawFillCircle *fillCircle0081 = [[MWDrawFillCircle alloc] init];
    fillCircle0081.center = station0014.mapLocation;
    fillCircle0081.radius = 4;
    fillCircle0081.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0081];

    // Добавляем вершину
    edge0006.finishVertex = vertex0007;
    
    // Создаем участок линии от "Комсомольская" до "Бульвара Рокоссовского"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Комсомолькая - Бульвар Рокоссовского";
    [self.edges addObject:edge0007];
    
    // Добавляем линию
    edge0007.line = line0001;

    // Добавляем вершину
    edge0007.startVertex = vertex0007;
    
    // Добавляем станцию "Комсомольская"
    [edge0007.elements addObject:station0014];
    
    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1050;
    [edge0007.elements addObject:haul0014];
    
    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(1920.5, 1205.5);
    drawLine0024.endPoint = CGPointMake(1966.5, 1159.5);
    drawLine0024.width = 14.5;
    drawLine0024.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0024];
    
    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(1886, 1083);
    drawArc0004.startRadians = 0;
    drawArc0004.endRadians = 0.77;
    drawArc0004.radius = 111;
    drawArc0004.width = 14.5;
    drawArc0004.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawArc0004];
    
    // Добавляем станцию "Красносельская"
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0007.elements addObject:station0015];

    station0015.nameOriginal = @"Красносельская";
    station0015.nameEnglish = @"Krasnoselskaya";
    station0015.mapLocation = CGPointMake(1997, 1084);
    station0015.geoLocation = CGPointMake(55.779997, 37.666080);
    
    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(2002, 1083.5);
    drawLine0025.endPoint = CGPointMake(2016, 1083.5);
    drawLine0025.width = 12;
    drawLine0025.color = line0001.color;
    [station0015.drawPrimitives addObject:drawLine0025];
    
    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0015.nameOriginal;
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 32;
    drawTextLine0033.origin = CGPointMake(2025, 1059);
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0033];
    
    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0015.nameEnglish;
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0034.fontSize = 18;
    drawTextLine0034.origin = CGPointMake(2020, 1093);
    [station0015.nameEnglishTextPrimitives addObject:drawTextLine0034];
    
    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 1370;
    [edge0007.elements addObject:haul0015];
    
    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(1997, 1083);
    drawLine0026.endPoint = CGPointMake(1997, 1012);
    drawLine0026.width = 14.5;
    drawLine0026.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0026];
    
    // Добавляем станцию "Сокольники"
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0007.elements addObject:station0016];

    station0016.nameOriginal = @"Сокольники";
    station0016.nameEnglish = @"Sokolniki";
    station0016.mapLocation = CGPointMake(1997, 1012);
    station0016.geoLocation = CGPointMake(55.789252, 37.679684);

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(2002, 1012);
    drawLine0027.endPoint = CGPointMake(2016, 1012);
    drawLine0027.width = 12;
    drawLine0027.color = line0001.color;
    [station0016.drawPrimitives addObject:drawLine0027];
    
    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0016.nameOriginal;
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 32;
    drawTextLine0035.origin = CGPointMake(2024, 987);
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0035];
    
    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = station0016.nameEnglish;
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0036.fontSize = 18;
    drawTextLine0036.origin = CGPointMake(2020, 1020);
    [station0016.nameEnglishTextPrimitives addObject:drawTextLine0036];
    
    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 2440;
    [edge0007.elements addObject:haul0016];
    
    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(1997, 1012);
    drawLine0028.endPoint = CGPointMake(1997, 892);
    drawLine0028.width = 14.5;
    drawLine0028.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0028];
    
    // Добавляем станцию "Преображенская площадь"
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0007.elements addObject:station0017];

    station0017.nameOriginal = @"Преображенская площадь";
    station0017.nameEnglish = @"Preobrazhenskaya Ploschad";
    station0017.mapLocation = CGPointMake(1997, 892);
    station0017.geoLocation = CGPointMake(55.796240, 37.715474);

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(2002, 892);
    drawLine0029.endPoint = CGPointMake(2016, 892);
    drawLine0029.width = 12;
    drawLine0029.color = line0001.color;
    [station0017.drawPrimitives addObject:drawLine0029];
    
    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"Преображенская";
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 32;
    drawTextLine0037.origin = CGPointMake(2025, 868);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0037];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"площадь";
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 32;
    drawTextLine0038.origin = CGPointMake(2025, 895);
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0038];
    
    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = @"Preobrazhenskaya";
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0039.fontSize = 18;
    drawTextLine0039.origin = CGPointMake(2020, 929);
    [station0017.nameEnglishTextPrimitives addObject:drawTextLine0039];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = @"Ploschad";
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0040.fontSize = 18;
    drawTextLine0040.origin = CGPointMake(2020, 949);
    [station0017.nameEnglishTextPrimitives addObject:drawTextLine0040];
    
    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 2070;
    [edge0007.elements addObject:haul0017];
    
    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(1997, 892);
    drawLine0030.endPoint = CGPointMake(1997, 820);
    drawLine0030.width = 14.5;
    drawLine0030.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0030];
    
    // Добавляем станцию "Черкизовская"
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0007.elements addObject:station0018];

    station0018.nameOriginal = @"Черкизовская";
    station0018.nameEnglish = @"Cherkizovskaya";
    station0018.mapLocation = CGPointMake(1997, 821);
    station0018.geoLocation = CGPointMake(55.803944, 37.744760);
    
    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(2002, 820);
    drawLine0031.endPoint = CGPointMake(2017, 820);
    drawLine0031.width = 12;
    drawLine0031.color = line0001.color;
    [station0018.drawPrimitives addObject:drawLine0031];
    
    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0018.nameOriginal;
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 32;
    drawTextLine0041.origin = CGPointMake(2024, 796);
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0041];
    
    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = station0018.nameEnglish;
    drawTextLine0042.fontName = @"HelveticaNeue";
    drawTextLine0042.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0042.fontSize = 18;
    drawTextLine0042.origin = CGPointMake(2020, 830);
    [station0018.nameEnglishTextPrimitives addObject:drawTextLine0042];
    
    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1060;
    [edge0007.elements addObject:haul0018];
    
    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(1997, 820);
    drawLine0032.endPoint = CGPointMake(1997, 718);
    drawLine0032.width = 14.5;
    drawLine0032.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0032];
    
    // Добавляем станцию "Бульвар Рокоссовского"
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0007.elements addObject:station0019];
    
    station0019.nameOriginal = @"Бульвар Рокоссовского";
    station0019.nameEnglish = @"Bulvar Rokossovskogo";
    station0019.mapLocation = CGPointMake(1997, 718);
    station0019.geoLocation = CGPointMake(55.814528, 37.734261);
    
    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(1977, 718);
    drawLine0033.endPoint = CGPointMake(2017, 718);
    drawLine0033.width = 12;
    drawLine0033.color = line0001.color;
    [station0019.drawPrimitives addObject:drawLine0033];
    
    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = @"Бульвар";
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 32;
    drawTextLine0043.origin = CGPointMake(2024, 693);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0043];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = @"Рокоссовского";
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 32;
    drawTextLine0044.origin = CGPointMake(2024, 724);
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0044];
    
    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = station0019.nameEnglish;
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0045.fontSize = 18;
    drawTextLine0045.origin = CGPointMake(2020, 757);
    [station0019.nameEnglishTextPrimitives addObject:drawTextLine0045];
    
    // Добавляем вершину
    edge0007.finishVertex = vertex0008;
    
    ////////////////////////////////////////////////////////////////
    // 2 - Замоскворецкая линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Алма-Атинской" до "Красногвардейской"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Алма-Атинская - Красногвардейская";
    [self.edges addObject:edge0008];
    
    // Добавляем линию
    edge0008.line = line0002;

    // Добавляем вершину
    edge0008.startVertex = vertex0009;
    
    // Добавляем станцию "Алма-Атинская"
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0008.elements addObject:station0020];

    station0020.nameOriginal = @"Алма-Атинская";
    station0020.nameEnglish = @"Alma-Atinskaya";
    station0020.mapLocation = CGPointMake(2192, 3036);
    station0020.geoLocation = CGPointMake(55.632812, 37.766058);
    
    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(2192, 3015);
    drawLine0034.endPoint = CGPointMake(2192, 3055);
    drawLine0034.width = 12;
    drawLine0034.color = line0002.color;
    [station0020.drawPrimitives addObject:drawLine0034];
    
    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = station0020.nameOriginal;
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 32;
    drawTextLine0046.origin = CGPointMake(2170, 3052);
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0046];
    
    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = station0020.nameEnglish;
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0047.fontSize = 18;
    drawTextLine0047.origin = CGPointMake(2170, 3085);
    [station0020.nameEnglishTextPrimitives addObject:drawTextLine0047];
    
    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 2840;
    [edge0008.elements addObject:haul0019];
    
    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(2192, 3035);
    drawLine0035.endPoint = CGPointMake(2045, 3035);
    drawLine0035.width = 14.5;
    drawLine0035.color = line0002.color;
    [haul0019.drawPrimitives addObject:drawLine0035];
    
    // Добавляем станцию "Красногвардейская"
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0008.elements addObject:station0021];

    station0021.nameOriginal = @"Красногвардейская";
    station0021.nameEnglish = @"Krasnogvardeyskaya";
    station0021.mapLocation = CGPointMake(2045, 3035);
    station0021.geoLocation = CGPointMake(55.613868, 37.744543);

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0021.nameOriginal;
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 32;
    drawTextLine0048.origin = CGPointMake(1813, 3052);
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0048];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0021.nameEnglish;
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0049.fontSize = 18;
    drawTextLine0049.origin = CGPointMake(1934 , 3085);
    [station0021.nameEnglishTextPrimitives addObject:drawTextLine0049];
    
    // Добавляем вершину
    edge0008.finishVertex = vertex0010;
    
    // Создаем участок линии от "Красногвардейской" до "Каширской"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: Красногвардейская - Каширская";
    [self.edges addObject:edge0009];
    
    // Добавляем линию
    edge0009.line = line0002;

    // Добавляем вершину
    edge0009.startVertex = vertex0010;
    
    // Добавляем станцию "Красногвардейская"
    [edge0009.elements addObject:station0021];
    
    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 1830;
    [edge0009.elements addObject:haul0020];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(2045, 3035);
    drawLine0036.endPoint = CGPointMake(1805, 3035);
    drawLine0036.width = 14.5;
    drawLine0036.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0036];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(1809.3, 2952);
    drawArc0005.startRadians = 1.6;
    drawArc0005.endRadians = 2.34;
    drawArc0005.radius = 83;
    drawArc0005.width = 14.5;
    drawArc0005.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawArc0005];
    
    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(1752, 3012);
    drawLine0037.endPoint = CGPointMake(1713.5, 2973.5);
    drawLine0037.width = 14.5;
    drawLine0037.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0037];
    
    // Добавляем станцию "Домодедовская"
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0009.elements addObject:station0022];

    station0022.nameOriginal = @"Домодедовская";
    station0022.nameEnglish = @"Domodedovskaya";
    station0022.mapLocation = CGPointMake(1713, 2972.5);
    station0022.geoLocation = CGPointMake(55.610952, 37.719091);
    
    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(1713.5, 2972.5);
    drawLine0038.endPoint = CGPointMake(1726.5, 2959.5);
    drawLine0038.width = 12;
    drawLine0038.color = line0002.color;
    [station0022.drawPrimitives addObject:drawLine0038];
    
    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = station0022.nameOriginal;
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 32;
    drawTextLine0050.origin = CGPointMake(1732, 2921);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0050];
    
    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = station0022.nameEnglish;
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0051.fontSize = 18;
    drawTextLine0051.origin = CGPointMake(1727, 2903);
    [station0022.nameEnglishTextPrimitives addObject:drawTextLine0051];
    
    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 1460;
    [edge0009.elements addObject:haul0021];
    
    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(1771, 2913.5);
    drawArc0006.startRadians = 2.33;
    drawArc0006.endRadians = 3.2;
    drawArc0006.radius = 83;
    drawArc0006.width = 14.5;
    drawArc0006.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawArc0006];
    
    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(1688, 2910);
    drawLine0039.endPoint = CGPointMake(1688, 2855.5);
    drawLine0039.width = 14.5;
    drawLine0039.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawLine0039];
    
    // Добавляем станцию "Орехово"
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0009.elements addObject:station0023];
    
    station0023.nameOriginal = @"Орехово";
    station0023.nameEnglish = @"Orehovo";
    station0023.mapLocation = CGPointMake(1689, 2855);
    station0023.geoLocation = CGPointMake(55.613196, 37.694965);

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(1688, 2856);
    drawLine0040.endPoint = CGPointMake(1707, 2856);
    drawLine0040.width = 12;
    drawLine0040.color = line0002.color;
    [station0023.drawPrimitives addObject:drawLine0040];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0023.nameOriginal;
    drawTextLine0052.fontName = @"HelveticaNeue";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 32;
    drawTextLine0052.origin = CGPointMake(1716, 2831);
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0052];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = station0023.nameEnglish;
    drawTextLine0053.fontName = @"HelveticaNeue";
    drawTextLine0053.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0053.fontSize = 18;
    drawTextLine0053.origin = CGPointMake(1710, 2865);
    [station0023.nameEnglishTextPrimitives addObject:drawTextLine0053];
    
    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 1890;
    [edge0009.elements addObject:haul0022];

    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(1688, 2856);
    drawLine0041.endPoint = CGPointMake(1688, 2775.5);
    drawLine0041.width = 14.5;
    drawLine0041.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0041];

    // Добавляем станцию "Царицино"
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0009.elements addObject:station0024];

    station0024.nameOriginal = @"Царицино";
    station0024.nameEnglish = @"Tsaritsyno";
    station0024.mapLocation = CGPointMake(1689, 2775.5);
    station0024.geoLocation = CGPointMake(55.621456, 37.669453);
    
    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(1688, 2775.5);
    drawLine0042.endPoint = CGPointMake(1707, 2775.5);
    drawLine0042.width = 12;
    drawLine0042.color = line0002.color;
    [station0024.drawPrimitives addObject:drawLine0042];
    
    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = station0024.nameOriginal;
    drawTextLine0054.fontName = @"HelveticaNeue";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 32;
    drawTextLine0054.origin = CGPointMake(1716, 2747);
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0054];
    
    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = station0024.nameEnglish;
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0055.fontSize = 18;
    drawTextLine0055.origin = CGPointMake(1710, 2781);
    [station0024.nameEnglishTextPrimitives addObject:drawTextLine0055];
    
    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 1880;
    [edge0009.elements addObject:haul0023];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(1688, 2776);
    drawLine0043.endPoint = CGPointMake(1688, 2695.5);
    drawLine0043.width = 14.5;
    drawLine0043.color = line0002.color;
    [haul0023.drawPrimitives addObject:drawLine0043];
    
    // Добавляем станцию "Кантемировская"
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0009.elements addObject:station0025];

    station0025.nameOriginal = @"Кантемировская";
    station0025.nameEnglish = @"Kantemirovskaya";
    station0025.mapLocation = CGPointMake(1689, 2695);
    station0025.geoLocation = CGPointMake(55.635716, 37.656596);

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(1688, 2695);
    drawLine0044.endPoint = CGPointMake(1707, 2695);
    drawLine0044.width = 12;
    drawLine0044.color = line0002.color;
    [station0025.drawPrimitives addObject:drawLine0044];
    
    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = station0025.nameOriginal;
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor blackColor];
    drawTextLine0056.fontSize = 32;
    drawTextLine0056.origin = CGPointMake(1716, 2671);
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0056];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = station0025.nameEnglish;
    drawTextLine0057.fontName = @"HelveticaNeue";
    drawTextLine0057.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0057.fontSize = 18;
    drawTextLine0057.origin = CGPointMake(1710, 2704);
    [station0025.nameEnglishTextPrimitives addObject:drawTextLine0057];
    
    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 2230;
    [edge0009.elements addObject:haul0024];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(1688, 2696);
    drawLine0045.endPoint = CGPointMake(1688, 2578);
    drawLine0045.width = 14.5;
    drawLine0045.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0045];
    
    // Добавляем станцию "Каширская"
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0009.elements addObject:station0026];

    station0026.nameOriginal = @"Каширская";
    station0026.nameEnglish = @"Kashirskaya";
    station0026.mapLocation = CGPointMake(1689, 2578);
    station0026.geoLocation = CGPointMake(55.655134, 37.648845);

    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = station0026.nameOriginal;
    drawTextLine0058.fontName = @"HelveticaNeue";
    drawTextLine0058.fontColor = [UIColor blackColor];
    drawTextLine0058.fontSize = 32;
    drawTextLine0058.origin = CGPointMake(1716, 2553);
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0058];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = station0026.nameEnglish;
    drawTextLine0059.fontName = @"HelveticaNeue";
    drawTextLine0059.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0059.fontSize = 18;
    drawTextLine0059.origin = CGPointMake(1710, 2536);
    [station0026.nameEnglishTextPrimitives addObject:drawTextLine0059];
    
    // Добавляем вершину
    edge0009.finishVertex = vertex0011;
    
    // Создаем участок линии от "Каширской" до "Павелецкой"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Каширская - Павелецкая";
    [self.edges addObject:edge0010];
    
    // Добавляем линию
    edge0010.line = line0002;

    // Добавляем вершину
    edge0010.startVertex = vertex0011;
    
    // Добавляем станцию "Каширская"
    [edge0010.elements addObject:station0026];
    
    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 2630;
    [edge0010.elements addObject:haul0025];
    
    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(1688, 2578);
    drawLine0046.endPoint = CGPointMake(1688, 2467);
    drawLine0046.width = 14.5;
    drawLine0046.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0046];
    
    // Добавляем станцию "Коломенская"
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0010.elements addObject:station0027];

    station0027.nameOriginal = @"Коломенская";
    station0027.nameEnglish = @"Kolomenskaya";
    station0027.mapLocation = CGPointMake(1689, 2467);
    station0027.geoLocation = CGPointMake(55.678270, 37.663842);
    
    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(1688, 2467);
    drawLine0047.endPoint = CGPointMake(1707, 2467);
    drawLine0047.width = 12;
    drawLine0047.color = line0002.color;
    [station0027.drawPrimitives addObject:drawLine0047];
    
    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = station0027.nameOriginal;
    drawTextLine0060.fontName = @"HelveticaNeue";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 32;
    drawTextLine0060.origin = CGPointMake(1716, 2443);
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0060];
    
    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = station0027.nameEnglish;
    drawTextLine0061.fontName = @"HelveticaNeue";
    drawTextLine0061.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0061.fontSize = 18;
    drawTextLine0061.origin = CGPointMake(1710, 2476);
    [station0027.nameEnglishTextPrimitives addObject:drawTextLine0061];
    
    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 3310;
    [edge0010.elements addObject:haul0026];
    
    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(1688, 2467);
    drawLine0048.endPoint = CGPointMake(1688, 2383.5);
    drawLine0048.width = 14.5;
    drawLine0048.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0048];
    
    // Добавляем станцию "Автозаводская"
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0010.elements addObject:station0028];

    station0028.nameOriginal = @"Автозаводская";
    station0028.nameEnglish = @"Avtozavodskaya";
    station0028.mapLocation = CGPointMake(1689, 2383.5);
    station0028.geoLocation = CGPointMake(55.707392, 37.657299);
    
    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(1688, 2383.5);
    drawLine0049.endPoint = CGPointMake(1707, 2383.5);
    drawLine0049.width = 12;
    drawLine0049.color = line0002.color;
    [station0028.drawPrimitives addObject:drawLine0049];
    
    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = station0028.nameOriginal;
    drawTextLine0062.fontName = @"HelveticaNeue";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 32;
    drawTextLine0062.origin = CGPointMake(1716, 2359);
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0062];
    
    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = station0028.nameEnglish;
    drawTextLine0063.fontName = @"HelveticaNeue";
    drawTextLine0063.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0063.fontSize = 18;
    drawTextLine0063.origin = CGPointMake(1710, 2393);
    [station0028.nameEnglishTextPrimitives addObject:drawTextLine0063];
    
    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 2820;
    [edge0010.elements addObject:haul0027];
    
    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(1688, 2384);
    drawLine0050.endPoint = CGPointMake(1688, 2249);
    drawLine0050.width = 14.5;
    drawLine0050.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0050];
    
    // Добавляем станцию "Павелецкая"
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0010.elements addObject:station0029];

    station0029.nameOriginal = @"Павелецкая";
    station0029.nameEnglish = @"Paveletskaya";
    station0029.mapLocation = CGPointMake(1689, 2249);
    station0029.geoLocation = CGPointMake(55.731267, 37.636264);
    
    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = station0029.nameOriginal;
    drawTextLine0064.fontName = @"HelveticaNeue";
    drawTextLine0064.fontColor = [UIColor blackColor];
    drawTextLine0064.fontSize = 32;
    drawTextLine0064.origin = CGPointMake(1720, 2226);
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0064];
    
    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = station0029.nameEnglish;
    drawTextLine0065.fontName = @"HelveticaNeue";
    drawTextLine0065.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0065.fontSize = 18;
    drawTextLine0065.origin = CGPointMake(1755, 2213);
    [station0029.nameEnglishTextPrimitives addObject:drawTextLine0065];
    
    MWDrawFillCircle *fillCircle0082 = [[MWDrawFillCircle alloc] init];
    fillCircle0082.center = CGPointMake(1688.5, 2249);
    fillCircle0082.radius = 4;
    fillCircle0082.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0082];
    
    // Добавляем вершину
    edge0010.finishVertex = vertex0012;
    
    // Создаем участок линии от "Павелецкой" до "Новокузнецкой"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0011 = [[MWEdge alloc] init];
    edge0011.identifier = @"edge0011";
    edge0011.developmentName = @"Ребро: Павелецкая - Новокузнецкая";
    [self.edges addObject:edge0011];
    
    // Добавляем линию
    edge0011.line = line0002;

    // Добавляем вершину
    edge0011.startVertex = vertex0012;
    
    // Добавляем станцию "Павелецкая"
    [edge0011.elements addObject:station0029];
    
    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 1530;
    [edge0011.elements addObject:haul0028];
    
    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(1688, 2249);
    drawLine0051.endPoint = CGPointMake(1688, 1993);
    drawLine0051.width = 14.5;
    drawLine0051.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawLine0051];
    
    // Добавляем станцию "Новокузнецкая"
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0011.elements addObject:station0030];

    station0030.nameOriginal = @"Новокузнецкая";
    station0030.nameEnglish = @"Novokuznetskaya";
    station0030.mapLocation = CGPointMake(1689, 1993);
    station0030.geoLocation = CGPointMake(55.742426, 37.629261);

    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = station0030.nameOriginal;
    drawTextLine0066.fontName = @"HelveticaNeue";
    drawTextLine0066.fontColor = [UIColor blackColor];
    drawTextLine0066.fontSize = 32;
    drawTextLine0066.origin = CGPointMake(1712, 1958);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0066];
    
    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = station0030.nameEnglish;
    drawTextLine0067.fontName = @"HelveticaNeue";
    drawTextLine0067.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0067.fontSize = 18;
    drawTextLine0067.origin = CGPointMake(1713, 1944);
    [station0030.nameEnglishTextPrimitives addObject:drawTextLine0067];
    
    // Добавляем вершину
    edge0011.finishVertex = vertex0013;
    
    // Создаем участок линии от "Новокузнецкой" до "Театральной"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0012 = [[MWEdge alloc] init];
    edge0012.identifier = @"edge0012";
    edge0012.developmentName = @"Ребро: Новокузнецкая - Театральная";
    [self.edges addObject:edge0012];
    
    // Добавляем линию
    edge0012.line = line0002;

    // Добавляем вершину
    edge0012.startVertex = vertex0013;
    
    // Добавляем станцию "Новокузнецкая"
    [edge0012.elements addObject:station0030];
    
    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 1980;
    [edge0012.elements addObject:haul0029];
    
    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(1688, 1993);
    drawLine0052.endPoint = CGPointMake(1688, 1830);
    drawLine0052.width = 14.5;
    drawLine0052.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0052];
    
    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(1636, 1832.25);
    drawArc0007.startRadians = 5.5;
    drawArc0007.endRadians = 6.27;
    drawArc0007.radius = 52;
    drawArc0007.width = 14.5;
    drawArc0007.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(1673.5, 1796);
    drawLine0053.endPoint = CGPointMake(1599.5, 1722.0);
    drawLine0053.width = 14.5;
    drawLine0053.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0053];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(1563.5, 1759.5);
    drawArc0008.startRadians = 4.7;
    drawArc0008.endRadians = 5.5;
    drawArc0008.radius = 52;
    drawArc0008.width = 14.5;
    drawArc0008.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawArc0008];
    
    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(1563, 1707.5);
    drawLine0060.endPoint = CGPointMake(1491, 1707.5);
    drawLine0060.width = 14.5;
    drawLine0060.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0060];
    
    // Добавляем станцию "Театральная"
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0012.elements addObject:station0031];
    
    station0031.nameOriginal = @"Театральная";
    station0031.nameEnglish = @"Teatralnaya";
    station0031.mapLocation = CGPointMake(1491.5, 1707.5);
    station0031.geoLocation = CGPointMake(55.757599, 37.618739);

    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = station0031.nameOriginal;
    drawTextLine0068.fontName = @"HelveticaNeue";
    drawTextLine0068.fontColor = [UIColor blackColor];
    drawTextLine0068.fontSize = 32;
    drawTextLine0068.origin = CGPointMake(1499, 1656);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0068];
    
    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = station0031.nameEnglish;
    drawTextLine0069.fontName = @"HelveticaNeue";
    drawTextLine0069.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0069.fontSize = 18;
    drawTextLine0069.origin = CGPointMake(1499, 1641);
    [station0031.nameEnglishTextPrimitives addObject:drawTextLine0069];
    
    // Добавляем вершину
    edge0012.finishVertex = vertex0004;
    
    // Создаем участок линии от "Театральной" до "Тверской"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0013 = [[MWEdge alloc] init];
    edge0013.identifier = @"edge0013";
    edge0013.developmentName = @"Ребро: Театральная - Тверская";
    [self.edges addObject:(edge0013)];
    
    // Добавляем линию
    edge0013.line = line0002;

    // Добавляем вершину
    edge0013.startVertex = vertex0004;
    
    // Добавляем станцию "Театральная"
    [edge0013.elements addObject:station0031];
    
    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 968;
    [edge0013.elements addObject:haul0030];
    
    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(1493, 1707.5);
    drawLine0061.endPoint = CGPointMake(1376.01, 1707.5);
    drawLine0061.width = 14.5;
    drawLine0061.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0061];
    
    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(1377.1, 1655.5);
    drawArc0009.startRadians = 7.87;
    drawArc0009.endRadians = 8.632;
    drawArc0009.radius = 52;
    drawArc0009.width = 14.5;
    drawArc0009.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawArc0009];

    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(1340.9, 1692.9);
    drawLine0062.endPoint = CGPointMake(1181, 1533);
    drawLine0062.width = 14.5;
    drawLine0062.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0062];
    
    // Добавляем станцию "Тверская"
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0013.elements addObject:station0032];

    station0032.nameOriginal = @"Тверская";
    station0032.nameEnglish = @"Tverskaya";
    station0032.mapLocation = CGPointMake(1181, 1533);
    station0032.geoLocation = CGPointMake(55.764847, 37.604858);
    
    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = station0032.nameOriginal;
    drawTextLine0070.fontName = @"HelveticaNeue";
    drawTextLine0070.fontColor = [UIColor blackColor];
    drawTextLine0070.fontSize = 32;
    drawTextLine0070.origin = CGPointMake(1051, 1546);
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0070];
    
    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = station0032.nameEnglish;
    drawTextLine0071.fontName = @"HelveticaNeue";
    drawTextLine0071.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0071.fontSize = 18;
    drawTextLine0071.origin = CGPointMake(1078, 1581);
    [station0032.nameEnglishTextPrimitives addObject:drawTextLine0071];
    
    // Добавляем вершину
    edge0013.finishVertex = vertex0014;
    
    // Создаем участок линии от "Тверской" до "Белорусской"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0014 = [[MWEdge alloc] init];
    edge0014.identifier = @"edge0014";
    edge0014.developmentName = @"Ребро: Тверская - Белорусская";
    [self.edges addObject:(edge0014)];
    
    // Добавляем линию
    edge0014.line = line0002;

    // Добавляем вершину
    edge0014.startVertex = vertex0014;
    
    // Добавляем станцию "Тверская"
    [edge0014.elements addObject:station0032];
    
    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 857;
    [edge0014.elements addObject:haul0031];
    
    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(1181.5, 1533.5);
    drawLine0063.endPoint = CGPointMake(1036, 1388);
    drawLine0063.width = 14.5;
    drawLine0063.color = line0002.color;
    [haul0031.drawPrimitives addObject:drawLine0063];
    
    // Добавляем станцию "Маяковская"
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0014.elements addObject:station0033];

    station0033.nameOriginal = @"Маяковская";
    station0033.nameEnglish = @"Mayakovskaya";
    station0033.mapLocation = CGPointMake(1036.5, 1388);
    station0033.geoLocation = CGPointMake(55.770113, 37.595956);
    
    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(1036.5, 1388);
    drawLine0064.endPoint = CGPointMake(1050, 1374.5);
    drawLine0064.width = 12;
    drawLine0064.color = line0002.color;
    [station0033.drawPrimitives addObject:drawLine0064];
    
    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = station0033.nameOriginal;
    drawTextLine0072.fontName = @"HelveticaNeue";
    drawTextLine0072.fontColor = [UIColor blackColor];
    drawTextLine0072.fontSize = 32;
    drawTextLine0072.origin = CGPointMake(1055, 1338);
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0072];
    
    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = station0033.nameEnglish;
    drawTextLine0073.fontName = @"HelveticaNeue";
    drawTextLine0073.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0073.fontSize = 18;
    drawTextLine0073.origin = CGPointMake(1049, 1320);
    [station0033.nameEnglishTextPrimitives addObject:drawTextLine0073];
    
    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 1230;
    [edge0014.elements addObject:haul0032];

    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(1036.5, 1388.5);
    drawLine0065.endPoint = CGPointMake(907, 1259);
    drawLine0065.width = 14.5;
    drawLine0065.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0065];
    
    // Добавляем станцию "Белорусская"
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0014.elements addObject:station0034];

    station0034.nameOriginal = @"Белорусская";
    station0034.nameEnglish = @"Belorusskaya";
    station0034.mapLocation = CGPointMake(907, 1259);
    station0034.geoLocation = CGPointMake(55.777093, 37.581844);
    
    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = station0034.nameOriginal;
    drawTextLine0074.fontName = @"HelveticaNeue";
    drawTextLine0074.fontColor = [UIColor blackColor];
    drawTextLine0074.fontSize = 32;
    drawTextLine0074.origin = CGPointMake(682, 1246);
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0074];

    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = station0034.nameEnglish;
    drawTextLine0075.fontName = @"HelveticaNeue";
    drawTextLine0075.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0075.fontSize = 18;
    drawTextLine0075.origin = CGPointMake(679, 1229);
    [station0034.nameEnglishTextPrimitives addObject:drawTextLine0075];
    
    // Добавляем вершину
    edge0014.finishVertex = vertex0015;
    
    // Создаем участок линии от "Белорусской" до "Речной вокзал"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0015 = [[MWEdge alloc] init];
    edge0015.identifier = @"edge0015";
    edge0015.developmentName = @"Ребро: Белорусская - Речной вокзал";
    [self.edges addObject:edge0015];
    
    // Добавляем линию
    edge0015.line = line0002;

    // Добавляем вершину
    edge0015.startVertex = vertex0015;
    
    // Добавляем станцию "Белорусская"
    [edge0015.elements addObject:station0034];
    
    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 2040;
    [edge0015.elements addObject:haul0033];
    
    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(907.5, 1259.5);
    drawLine0066.endPoint = CGPointMake(797, 1149);
    drawLine0066.width = 14.5;
    drawLine0066.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0066];
    
    // Добавляем станцию "Динамо"
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0015.elements addObject:station0035];

    station0035.nameOriginal = @"Динамо";
    station0035.nameEnglish = @"Dinamo";
    station0035.mapLocation = CGPointMake(797, 1149);
    station0035.geoLocation = CGPointMake(55.789710, 37.558185);
    
    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(797, 1149);
    drawLine0067.endPoint = CGPointMake(811, 1135);
    drawLine0067.width = 12;
    drawLine0067.color = line0002.color;
    [station0035.drawPrimitives addObject:drawLine0067];
    
    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0035.nameOriginal;
    drawTextLine0076.fontName = @"HelveticaNeue";
    drawTextLine0076.fontColor = [UIColor blackColor];
    drawTextLine0076.fontSize = 32;
    drawTextLine0076.origin = CGPointMake(816, 1096);
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0076];
    
    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = station0035.nameEnglish;
    drawTextLine0077.fontName = @"HelveticaNeue";
    drawTextLine0077.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0077.fontSize = 18;
    drawTextLine0077.origin = CGPointMake(813, 1080);
    [station0035.nameEnglishTextPrimitives addObject:drawTextLine0077];
    
    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 1980;
    [edge0015.elements addObject:haul0034];
    
    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(797.5, 1149.5);
    drawLine0068.endPoint = CGPointMake(768.6, 1120.6);
    drawLine0068.width = 14.5;
    drawLine0068.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0068];
    
    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(854, 1036.4);
    drawArc0010.startRadians = 8.64;
    drawArc0010.endRadians = 9.42;
    drawArc0010.radius = 120;
    drawArc0010.width = 14.5;
    drawArc0010.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawArc0010];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(734, 1010);
    drawLine0069.endPoint = CGPointMake(734, 1038);
    drawLine0069.width = 14.5;
    drawLine0069.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0069];
    
    // Добавляем станцию "Аэропорт"
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0015.elements addObject:station0036];

    station0036.nameOriginal = @"Аэропорт";
    station0036.nameEnglish = @"Aeroport";
    station0036.mapLocation = CGPointMake(734, 1010);
    station0036.geoLocation = CGPointMake(55.800365, 37.532631);
    
    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(734, 1010);
    drawLine0070.endPoint = CGPointMake(753, 1010);
    drawLine0070.width = 12;
    drawLine0070.color = line0002.color;
    [station0036.drawPrimitives addObject:drawLine0070];
    
    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = station0036.nameOriginal;
    drawTextLine0078.fontName = @"HelveticaNeue";
    drawTextLine0078.fontColor = [UIColor blackColor];
    drawTextLine0078.fontSize = 32;
    drawTextLine0078.origin = CGPointMake(761, 986);
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0078];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = station0036.nameEnglish;
    drawTextLine0079.fontName = @"HelveticaNeue";
    drawTextLine0079.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0079.fontSize = 18;
    drawTextLine0079.origin = CGPointMake(754, 1020);
    [station0036.nameEnglishTextPrimitives addObject:drawTextLine0079];
    
    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 1250;
    [edge0015.elements addObject:haul0035];
    
    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(734, 1010);
    drawLine0071.endPoint = CGPointMake(734, 935);
    drawLine0071.width = 14.5;
    drawLine0071.color = line0002.color;
    [haul0035.drawPrimitives addObject:drawLine0071];
    
    // Добавляем станцию "Сокол"
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0015.elements addObject:station0037];

    station0037.nameOriginal = @"Сокол";
    station0037.nameEnglish = @"Sokol";
    station0037.mapLocation = CGPointMake(734, 935.5);
    station0037.geoLocation = CGPointMake(55.804781, 37.515548);
    
    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(734, 935.5);
    drawLine0072.endPoint = CGPointMake(753, 935.5);
    drawLine0072.width = 12;
    drawLine0072.color = line0002.color;
    [station0037.drawPrimitives addObject:drawLine0072];
    
    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = station0037.nameOriginal;
    drawTextLine0080.fontName = @"HelveticaNeue";
    drawTextLine0080.fontColor = [UIColor blackColor];
    drawTextLine0080.fontSize = 32;
    drawTextLine0080.origin = CGPointMake(762, 910);
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0080];
    
    MWDrawTextLine *drawTextLine0081 = [[MWDrawTextLine alloc] init];
    drawTextLine0081.text = station0037.nameEnglish;
    drawTextLine0081.fontName = @"HelveticaNeue";
    drawTextLine0081.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0081.fontSize = 18;
    drawTextLine0081.origin = CGPointMake(755, 944);
    [station0037.nameEnglishTextPrimitives addObject:drawTextLine0081];
    
    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 1890;
    [edge0015.elements addObject:haul0036];
    
    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(734, 935);
    drawLine0073.endPoint = CGPointMake(734, 860);
    drawLine0073.width = 14.5;
    drawLine0073.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0073];
    
    // Добавляем станцию "Войковская"
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0015.elements addObject:station0038];

    station0038.nameOriginal = @"Войковская";
    station0038.nameEnglish = @"Voykovskaya";
    station0038.mapLocation = CGPointMake(734, 860);
    station0038.geoLocation = CGPointMake(55.819089, 37.497887);
    
    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(734, 860);
    drawLine0074.endPoint = CGPointMake(753, 860);
    drawLine0074.width = 12;
    drawLine0074.color = line0002.color;
    [station0038.drawPrimitives addObject:drawLine0074];
    
    MWDrawTextLine *drawTextLine0082 = [[MWDrawTextLine alloc] init];
    drawTextLine0082.text = station0038.nameOriginal;
    drawTextLine0082.fontName = @"HelveticaNeue";
    drawTextLine0082.fontColor = [UIColor blackColor];
    drawTextLine0082.fontSize = 32;
    drawTextLine0082.origin = CGPointMake(762, 835);
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0082];
    
    MWDrawTextLine *drawTextLine0083 = [[MWDrawTextLine alloc] init];
    drawTextLine0083.text = station0038.nameEnglish;
    drawTextLine0083.fontName = @"HelveticaNeue";
    drawTextLine0083.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0083.fontSize = 18;
    drawTextLine0083.origin = CGPointMake(755, 869);
    [station0038.nameEnglishTextPrimitives addObject:drawTextLine0083];
    
    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 2480;
    [edge0015.elements addObject:haul0037];
    
    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(734, 860);
    drawLine0075.endPoint = CGPointMake(734, 789);
    drawLine0075.width = 14.5;
    drawLine0075.color = line0002.color;
    [haul0037.drawPrimitives addObject:drawLine0075];
    
    // Добавляем станцию "Водный стадион"
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0015.elements addObject:station0039];

    station0039.nameOriginal = @"Водный стадион";
    station0039.nameEnglish = @"Vodny Stadion";
    station0039.mapLocation = CGPointMake(734, 789);
    station0039.geoLocation = CGPointMake(55.839996, 37.486818);

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(734, 789);
    drawLine0076.endPoint = CGPointMake(753, 789);
    drawLine0076.width = 12;
    drawLine0076.color = line0002.color;
    [station0039.drawPrimitives addObject:drawLine0076];
    
    MWDrawTextLine *drawTextLine0084 = [[MWDrawTextLine alloc] init];
    drawTextLine0084.text = station0039.nameOriginal;
    drawTextLine0084.fontName = @"HelveticaNeue";
    drawTextLine0084.fontColor = [UIColor blackColor];
    drawTextLine0084.fontSize = 32;
    drawTextLine0084.origin = CGPointMake(762, 764);
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0084];
    
    MWDrawTextLine *drawTextLine0085 = [[MWDrawTextLine alloc] init];
    drawTextLine0085.text = station0039.nameEnglish;
    drawTextLine0085.fontName = @"HelveticaNeue";
    drawTextLine0085.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0085.fontSize = 18;
    drawTextLine0085.origin = CGPointMake(755, 798);
    [station0039.nameEnglishTextPrimitives addObject:drawTextLine0085];
    
    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 1780;
    [edge0015.elements addObject:haul0038];
    
    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(734, 789);
    drawLine0077.endPoint = CGPointMake(734, 718.5);
    drawLine0077.width = 14.5;
    drawLine0077.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawLine0077];
    
    // Добавляем станцию "Речной вокзал"
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0015.elements addObject:station0040];

    station0040.nameOriginal = @"Речной вокзал";
    station0040.nameEnglish = @"Rechnoy Vokzal";
    station0040.mapLocation = CGPointMake(734, 718.5);
    station0040.geoLocation = CGPointMake(55.855056, 37.476106);
    
    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(715, 718.5);
    drawLine0078.endPoint = CGPointMake(753, 718.5);
    drawLine0078.width = 12;
    drawLine0078.color = line0002.color;
    [station0040.drawPrimitives addObject:drawLine0078];
    
    MWDrawTextLine *drawTextLine0086 = [[MWDrawTextLine alloc] init];
    drawTextLine0086.text = station0040.nameOriginal;
    drawTextLine0086.fontName = @"HelveticaNeue";
    drawTextLine0086.fontColor = [UIColor blackColor];
    drawTextLine0086.fontSize = 32;
    drawTextLine0086.origin = CGPointMake(762, 693);
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0086];
    
    MWDrawTextLine *drawTextLine0087 = [[MWDrawTextLine alloc] init];
    drawTextLine0087.text = station0040.nameEnglish;
    drawTextLine0087.fontName = @"HelveticaNeue";
    drawTextLine0087.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0087.fontSize = 18;
    drawTextLine0087.origin = CGPointMake(755, 727);
    [station0040.nameEnglishTextPrimitives addObject:drawTextLine0087];
    
    // Добавляем вершину
    edge0015.finishVertex = vertex0016;
    
    ////////////////////////////////////////////////////////////////
    // 3 - Арбатско-покровская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Пятницкое шоссе" до "Кунцевская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0016 = [[MWEdge alloc] init];
    edge0016.identifier = @"edge0016";
    edge0016.developmentName = @"Ребро: Пятницкое шоссе - Кунцевская";
    [self.edges addObject:(edge0016)];
    
    // Добавляем линию
    edge0016.line = line0003;

    // Добавляем вершину
    edge0016.startVertex = vertex0017;
    
    // Добавляем станцию "Пятницкое шоссе"
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0016.elements addObject:station0041];
    
    station0041.nameOriginal = @"Пятницкое шоссе";
    station0041.nameEnglish = @"Pyantitskoe Shosse";
    station0041.mapLocation = CGPointMake(112.5, 822.5);
    station0041.geoLocation = CGPointMake(55.855878, 37.354182);
    
    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(93, 822.5);
    drawLine0079.endPoint = CGPointMake(132, 822.5);
    drawLine0079.width = 12;
    drawLine0079.color = line0003.color;
    [station0041.drawPrimitives addObject:drawLine0079];
    
    MWDrawTextLine *drawTextLine0088 = [[MWDrawTextLine alloc] init];
    drawTextLine0088.text = @"Пятницкое";
    drawTextLine0088.fontName = @"HelveticaNeue";
    drawTextLine0088.fontColor = [UIColor blackColor];
    drawTextLine0088.fontSize = 32;
    drawTextLine0088.origin = CGPointMake(141, 798);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0088];

    MWDrawTextLine *drawTextLine0089 = [[MWDrawTextLine alloc] init];
    drawTextLine0089.text = @"шоссе";
    drawTextLine0089.fontName = @"HelveticaNeue";
    drawTextLine0089.fontColor = [UIColor blackColor];
    drawTextLine0089.fontSize = 32;
    drawTextLine0089.origin = CGPointMake(141, 826);
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0089];

    MWDrawTextLine *drawTextLine0090 = [[MWDrawTextLine alloc] init];
    drawTextLine0090.text = station0041.nameEnglish;
    drawTextLine0090.fontName = @"HelveticaNeue";
    drawTextLine0090.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0090.fontSize = 18;
    drawTextLine0090.origin = CGPointMake(134, 860);
    [station0041.nameEnglishTextPrimitives addObject:drawTextLine0090];
    
    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 1250;
    [edge0016.elements addObject:haul0039];
    
    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(112.5, 822);
    drawLine0080.endPoint = CGPointMake(112.5, 917);
    drawLine0080.width = 14.5;
    drawLine0080.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawLine0080];
    
    // Добавляем станцию "Митино"
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0016.elements addObject:station0042];

    station0042.nameOriginal = @"Митино";
    station0042.nameEnglish = @"Mitino";
    station0042.mapLocation = CGPointMake(112.5, 916.5);
    station0042.geoLocation = CGPointMake(55.846007, 37.361364);
    
    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(110, 916.5);
    drawLine0081.endPoint = CGPointMake(132, 916.5);
    drawLine0081.width = 12;
    drawLine0081.color = line0003.color;
    [station0042.drawPrimitives addObject:drawLine0081];
    
    MWDrawTextLine *drawTextLine0091 = [[MWDrawTextLine alloc] init];
    drawTextLine0091.text = station0042.nameOriginal;
    drawTextLine0091.fontName = @"HelveticaNeue";
    drawTextLine0091.fontColor = [UIColor blackColor];
    drawTextLine0091.fontSize = 32;
    drawTextLine0091.origin = CGPointMake(141, 892);
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0091];
    
    MWDrawTextLine *drawTextLine0092 = [[MWDrawTextLine alloc] init];
    drawTextLine0092.text = station0042.nameEnglish;
    drawTextLine0092.fontName = @"HelveticaNeue";
    drawTextLine0092.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0092.fontSize = 18;
    drawTextLine0092.origin = CGPointMake(134, 926);
    [station0042.nameEnglishTextPrimitives addObject:drawTextLine0092];
    
    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 1780;
    [edge0016.elements addObject:haul0040];
    
    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(112.5, 917);
    drawLine0082.endPoint = CGPointMake(112.5, 979);
    drawLine0082.width = 14.5;
    drawLine0082.color = line0003.color;
    [haul0040.drawPrimitives addObject:drawLine0082];
    
    // Добавляем станцию "Волоколамская"
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0016.elements addObject:station0043];

    station0043.nameOriginal = @"Волоколамская";
    station0043.nameEnglish = @"Volokolamskaya";
    station0043.mapLocation = CGPointMake(112.5, 978.5);
    station0043.geoLocation = CGPointMake(55.835748, 37.381989);

    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(110, 978.5);
    drawLine0083.endPoint = CGPointMake(132, 978.5);
    drawLine0083.width = 12;
    drawLine0083.color = line0003.color;
    [station0043.drawPrimitives addObject:drawLine0083];
    
    MWDrawTextLine *drawTextLine0093 = [[MWDrawTextLine alloc] init];
    drawTextLine0093.text = station0043.nameOriginal;
    drawTextLine0093.fontName = @"HelveticaNeue";
    drawTextLine0093.fontColor = [UIColor blackColor];
    drawTextLine0093.fontSize = 32;
    drawTextLine0093.origin = CGPointMake(141, 954);
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0093];
    
    MWDrawTextLine *drawTextLine0094 = [[MWDrawTextLine alloc] init];
    drawTextLine0094.text = station0043.nameEnglish;
    drawTextLine0094.fontName = @"HelveticaNeue";
    drawTextLine0094.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0094.fontSize = 18;
    drawTextLine0094.origin = CGPointMake(134, 988);
    [station0043.nameEnglishTextPrimitives addObject:drawTextLine0094];
    
    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 1320;
    [edge0016.elements addObject:haul0041];
    
    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(112.5, 979);
    drawLine0084.endPoint = CGPointMake(112.5, 1040.5);
    drawLine0084.width = 14.5;
    drawLine0084.color = line0003.color;
    [haul0041.drawPrimitives addObject:drawLine0084];
    
    // Добавляем станцию "Мякинино"
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0016.elements addObject:station0044];
    
    station0044.nameOriginal = @"Мякинино";
    station0044.nameEnglish = @"Myakinino";
    station0044.mapLocation = CGPointMake(112.5, 1040.5);
    station0044.geoLocation = CGPointMake(55.825477, 37.385372);
    
    MWDrawLine *drawLine0085 = [[MWDrawLine alloc] init];
    drawLine0085.startPoint = CGPointMake(110, 1040.5);
    drawLine0085.endPoint = CGPointMake(132, 1040.5);
    drawLine0085.width = 12;
    drawLine0085.color = line0003.color;
    [station0044.drawPrimitives addObject:drawLine0085];
    
    MWDrawTextLine *drawTextLine0095 = [[MWDrawTextLine alloc] init];
    drawTextLine0095.text = station0044.nameOriginal;
    drawTextLine0095.fontName = @"HelveticaNeue";
    drawTextLine0095.fontColor = [UIColor blackColor];
    drawTextLine0095.fontSize = 32;
    drawTextLine0095.origin = CGPointMake(141, 1016);
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0095];
    
    MWDrawTextLine *drawTextLine0096 = [[MWDrawTextLine alloc] init];
    drawTextLine0096.text = station0044.nameEnglish;
    drawTextLine0096.fontName = @"HelveticaNeue";
    drawTextLine0096.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0096.fontSize = 18;
    drawTextLine0096.origin = CGPointMake(134, 1050);
    [station0044.nameEnglishTextPrimitives addObject:drawTextLine0096];
    
    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 2860;
    [edge0016.elements addObject:haul0042];
    
    MWDrawLine *drawLine0086 = [[MWDrawLine alloc] init];
    drawLine0086.startPoint = CGPointMake(112.5, 1040);
    drawLine0086.endPoint = CGPointMake(112.5, 1103);
    drawLine0086.width = 14.5;
    drawLine0086.color = line0003.color;
    [haul0042.drawPrimitives addObject:drawLine0086];

    // Добавляем станцию "Строгино"
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0016.elements addObject:station0045];
    
    station0045.nameOriginal = @"Строгино";
    station0045.nameEnglish = @"Strogino";
    station0045.mapLocation = CGPointMake(112.5, 1102.5);
    station0045.geoLocation = CGPointMake(55.803723, 37.403083);

    MWDrawLine *drawLine0087 = [[MWDrawLine alloc] init];
    drawLine0087.startPoint = CGPointMake(110, 1102.5);
    drawLine0087.endPoint = CGPointMake(132, 1102.5);
    drawLine0087.width = 12;
    drawLine0087.color = line0003.color;
    [station0045.drawPrimitives addObject:drawLine0087];
    
    MWDrawTextLine *drawTextLine0097 = [[MWDrawTextLine alloc] init];
    drawTextLine0097.text = station0045.nameOriginal;
    drawTextLine0097.fontName = @"HelveticaNeue";
    drawTextLine0097.fontColor = [UIColor blackColor];
    drawTextLine0097.fontSize = 32;
    drawTextLine0097.origin = CGPointMake(141, 1078);
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0097];
    
    MWDrawTextLine *drawTextLine0098 = [[MWDrawTextLine alloc] init];
    drawTextLine0098.text = station0045.nameEnglish;
    drawTextLine0098.fontName = @"HelveticaNeue";
    drawTextLine0098.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0098.fontSize = 18;
    drawTextLine0098.origin = CGPointMake(134, 1112);
    [station0045.nameEnglishTextPrimitives addObject:drawTextLine0098];
    
    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 5510;
    [edge0016.elements addObject:haul0043];

    MWDrawLine *drawLine0088 = [[MWDrawLine alloc] init];
    drawLine0088.startPoint = CGPointMake(112.5, 1103);
    drawLine0088.endPoint = CGPointMake(112.5, 1165);
    drawLine0088.width = 14.5;
    drawLine0088.color = line0003.color;
    [haul0043.drawPrimitives addObject:drawLine0088];
    
    // Добавляем станцию "Крылатское"
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0016.elements addObject:station0046];
    
    station0046.nameOriginal = @"Крылатское";
    station0046.nameEnglish = @"Krylatskoe";
    station0046.mapLocation = CGPointMake(112.5, 1164.5);
    station0046.geoLocation = CGPointMake(55.756836, 37.408014);

    MWDrawLine *drawLine0089 = [[MWDrawLine alloc] init];
    drawLine0089.startPoint = CGPointMake(110, 1164.5);
    drawLine0089.endPoint = CGPointMake(132, 1164.5);
    drawLine0089.width = 12;
    drawLine0089.color = line0003.color;
    [station0046.drawPrimitives addObject:drawLine0089];
    
    MWDrawTextLine *drawTextLine0099 = [[MWDrawTextLine alloc] init];
    drawTextLine0099.text = station0046.nameOriginal;
    drawTextLine0099.fontName = @"HelveticaNeue";
    drawTextLine0099.fontColor = [UIColor blackColor];
    drawTextLine0099.fontSize = 32;
    drawTextLine0099.origin = CGPointMake(141, 1140);
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0099];
    
    MWDrawTextLine *drawTextLine0100 = [[MWDrawTextLine alloc] init];
    drawTextLine0100.text = station0046.nameEnglish;
    drawTextLine0100.fontName = @"HelveticaNeue";
    drawTextLine0100.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0100.fontSize = 18;
    drawTextLine0100.origin = CGPointMake(134, 1174);
    [station0046.nameEnglishTextPrimitives addObject:drawTextLine0100];
    
    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 1880;
    [edge0016.elements addObject:haul0044];
    
    MWDrawLine *drawLine0090 = [[MWDrawLine alloc] init];
    drawLine0090.startPoint = CGPointMake(112.5, 1165);
    drawLine0090.endPoint = CGPointMake(112.5, 1226.5);
    drawLine0090.width = 14.5;
    drawLine0090.color = line0003.color;
    [haul0044.drawPrimitives addObject:drawLine0090];
    
    // Добавляем станцию "Молодежная"
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0016.elements addObject:station0047];

    station0047.nameOriginal = @"Молодежная";
    station0047.nameEnglish = @"Molodezhnaya";
    station0047.mapLocation = CGPointMake(112.5, 1226.5);
    station0047.geoLocation = CGPointMake(55.740611, 37.416917);

    MWDrawLine *drawLine0091 = [[MWDrawLine alloc] init];
    drawLine0091.startPoint = CGPointMake(110, 1226.5);
    drawLine0091.endPoint = CGPointMake(132, 1226.5);
    drawLine0091.width = 12;
    drawLine0091.color = line0003.color;
    [station0047.drawPrimitives addObject:drawLine0091];
    
    MWDrawTextLine *drawTextLine0101 = [[MWDrawTextLine alloc] init];
    drawTextLine0101.text = station0047.nameOriginal;
    drawTextLine0101.fontName = @"HelveticaNeue";
    drawTextLine0101.fontColor = [UIColor blackColor];
    drawTextLine0101.fontSize = 32;
    drawTextLine0101.origin = CGPointMake(141, 1202);
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0101];
    
    MWDrawTextLine *drawTextLine0102 = [[MWDrawTextLine alloc] init];
    drawTextLine0102.text = station0047.nameEnglish;
    drawTextLine0102.fontName = @"HelveticaNeue";
    drawTextLine0102.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0102.fontSize = 18;
    drawTextLine0102.origin = CGPointMake(134, 1236);
    [station0047.nameEnglishTextPrimitives addObject:drawTextLine0102];
    
    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 2190;
    [edge0016.elements addObject:haul0045];
    
    MWDrawLine *drawLine0092 = [[MWDrawLine alloc] init];
    drawLine0092.startPoint = CGPointMake(112.5, 1226);
    drawLine0092.endPoint = CGPointMake(112.5, 1305.5);
    drawLine0092.width = 14.5;
    drawLine0092.color = line0003.color;
    [haul0045.drawPrimitives addObject:drawLine0092];
    
    // Добавляем станцию "Кунцевская"
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0016.elements addObject:station0048];

    station0048.nameOriginal = @"Кунцевская";
    station0048.nameEnglish = @"Kuntsevskaya";
    station0048.mapLocation = CGPointMake(112.5, 1305.5);
    station0048.geoLocation = CGPointMake(55.730757, 37.445927);
    
    MWDrawTextLine *drawTextLine0103 = [[MWDrawTextLine alloc] init];
    drawTextLine0103.text = station0048.nameOriginal;
    drawTextLine0103.fontName = @"HelveticaNeue";
    drawTextLine0103.fontColor = [UIColor blackColor];
    drawTextLine0103.fontSize = 32;
    drawTextLine0103.origin = CGPointMake(141, 1279);
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0103];
    
    MWDrawTextLine *drawTextLine0104 = [[MWDrawTextLine alloc] init];
    drawTextLine0104.text = station0048.nameEnglish;
    drawTextLine0104.fontName = @"HelveticaNeue";
    drawTextLine0104.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0104.fontSize = 18;
    drawTextLine0104.origin = CGPointMake(134, 1263);
    [station0048.nameEnglishTextPrimitives addObject:drawTextLine0104];
    
    // Добавляем вершину
    edge0016.finishVertex = vertex0018;
    
    // Создаем участок линии от "Кунцевская" до "Парк Победы"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0017 = [[MWEdge alloc] init];
    edge0017.identifier = @"edge0017";
    edge0017.developmentName = @"Ребро: Кунцевская - Парк Победы (синяя ветка)";
    [self.edges addObject:edge0017];
    
    // Добавляем линию
    edge0017.line = line0003;

    // Добавляем вершину
    edge0017.startVertex = vertex0018;
    
    // Добавляем станцию "Кунцевская"
    [edge0017.elements addObject:station0048];
    
    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 1710;
    [edge0017.elements addObject:haul0046];

    MWDrawLine *drawLine0093 = [[MWDrawLine alloc] init];
    drawLine0093.startPoint = CGPointMake(112.5, 1305);
    drawLine0093.endPoint = CGPointMake(112.5, 1733);
    drawLine0093.width = 14.5;
    drawLine0093.color = line0003.color;
    [haul0046.drawPrimitives addObject:drawLine0093];
    
    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(172.5, 1732);
    drawArc0011.startRadians = 7.85;
    drawArc0011.endRadians = 9.42;
    drawArc0011.radius = 60;
    drawArc0011.width = 14.5;
    drawArc0011.color = line0003.color;
    [haul0046.drawPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0094 = [[MWDrawLine alloc] init];
    drawLine0094.startPoint = CGPointMake(172, 1792);
    drawLine0094.endPoint = CGPointMake(200.5, 1792);
    drawLine0094.width = 14.5;
    drawLine0094.color = line0003.color;
    [haul0046.drawPrimitives addObject:drawLine0094];
    
    // Добавляем станцию "Славянский бульвар"
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0017.elements addObject:station0049];
    
    station0049.nameOriginal = @"Славянский бульвар";
    station0049.nameEnglish = @"Slavyanskiy Bulvar";
    station0049.mapLocation = CGPointMake(200.5, 1792);
    station0049.geoLocation = CGPointMake(55.729576, 37.470719);
    
    MWDrawLine *drawLine0095 = [[MWDrawLine alloc] init];
    drawLine0095.startPoint = CGPointMake(200.5, 1792);
    drawLine0095.endPoint = CGPointMake(200.5, 1811);
    drawLine0095.width = 12;
    drawLine0095.color = line0003.color;
    [station0049.drawPrimitives addObject:drawLine0095];
    
    MWDrawTextLine *drawTextLine0105 = [[MWDrawTextLine alloc] init];
    drawTextLine0105.text = @"Славянский";
    drawTextLine0105.fontName = @"HelveticaNeue";
    drawTextLine0105.fontColor = [UIColor blackColor];
    drawTextLine0105.fontSize = 32;
    drawTextLine0105.origin = CGPointMake(72, 1808);
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0105];
    
    MWDrawTextLine *drawTextLine0106 = [[MWDrawTextLine alloc] init];
    drawTextLine0106.text = @"бульвар";
    drawTextLine0106.fontName = @"HelveticaNeue";
    drawTextLine0106.fontColor = [UIColor blackColor];
    drawTextLine0106.fontSize = 32;
    drawTextLine0106.origin = CGPointMake(91, 1839);
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0106];
    
    MWDrawTextLine *drawTextLine0107 = [[MWDrawTextLine alloc] init];
    drawTextLine0107.text = station0049.nameEnglish;
    drawTextLine0107.fontName = @"HelveticaNeue";
    drawTextLine0107.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0107.fontSize = 18;
    drawTextLine0107.origin = CGPointMake(75, 1875);
    [station0049.nameEnglishTextPrimitives addObject:drawTextLine0107];
    
    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 2910;
    [edge0017.elements addObject:haul0047];
    
    MWDrawLine *drawLine0096 = [[MWDrawLine alloc] init];
    drawLine0096.startPoint = CGPointMake(200, 1792);
    drawLine0096.endPoint = CGPointMake(371, 1792); //CGPointMake(388.5, 1792);
    drawLine0096.width = 14.5;
    drawLine0096.color = line0003.color;
    [haul0047.drawPrimitives addObject:drawLine0096];
    
    // Добавляем станцию "Парк Победы"
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0017.elements addObject:station0050];

    station0050.nameOriginal = @"Парк Победы";
    station0050.nameEnglish = @"Park Pobedy";
    station0050.mapLocation = CGPointMake(388.5, 1792);
    station0050.geoLocation = CGPointMake(55.736218, 37.516834);
    
    MWDrawArc *drawArc0115 = [[MWDrawArc alloc] init];
    drawArc0115.center = CGPointMake(388.5, 1792);
    drawArc0115.startRadians = M_PI * 2;
    drawArc0115.endRadians = 0;
    drawArc0115.radius = 14;
    drawArc0115.width = 10;
    drawArc0115.color = line0003.color;
    [station0050.drawPrimitives addObject:drawArc0115];

    MWDrawTextLine *drawTextLine0108 = [[MWDrawTextLine alloc] init];
    drawTextLine0108.text = @"Парк";
    drawTextLine0108.fontName = @"HelveticaNeue";
    drawTextLine0108.fontColor = [UIColor blackColor];
    drawTextLine0108.fontSize = 32;
    drawTextLine0108.origin = CGPointMake(325 , 1808);
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0108];

    MWDrawTextLine *drawTextLine0109 = [[MWDrawTextLine alloc] init];
    drawTextLine0109.text = @"Победы";
    drawTextLine0109.fontName = @"HelveticaNeue";
    drawTextLine0109.fontColor = [UIColor blackColor];
    drawTextLine0109.fontSize = 32;
    drawTextLine0109.origin = CGPointMake(287 , 1839);
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0109];

    MWDrawTextLine *drawTextLine0110 = [[MWDrawTextLine alloc] init];
    drawTextLine0110.text = station0050.nameEnglish;
    drawTextLine0110.fontName = @"HelveticaNeue";
    drawTextLine0110.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0110.fontSize = 18;
    drawTextLine0110.origin = CGPointMake(293, 1875);
    [station0050.nameEnglishTextPrimitives addObject:drawTextLine0110];
    
    // Добавляем вершину
    edge0017.finishVertex = vertex0043;
    
    // Создаем участок линии от "Парк Победы" до "Киевская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0068 = [[MWEdge alloc] init];
    edge0068.identifier = @"edge0068";
    edge0068.developmentName = @"Ребро: Парк Победы - Киевская (синяя ветка)";
    [self.edges addObject:edge0068];
    
    // Добавляем линию
    edge0068.line = line0003;
    
    // Добавляем вершину
    edge0068.startVertex = vertex0043;
    
    // Добавляем станцию "Парк Победы"
    [edge0068.elements addObject:station0050];
    
    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 3070;
    [edge0068.elements addObject:haul0048];
    
    MWDrawLine *drawLine0097 = [[MWDrawLine alloc] init];
    drawLine0097.startPoint = CGPointMake(400, 1792);
    drawLine0097.endPoint = CGPointMake(734, 1792);
    drawLine0097.width = 14.5;
    drawLine0097.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawLine0097];
    
    // Добавляем станцию "Киевская"
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0068.elements addObject:station0051];
    
    station0051.nameOriginal = @"Киевская";
    station0051.nameEnglish = @"Kievskaya";
    station0051.mapLocation = CGPointMake(733.5, 1792);
    station0051.geoLocation = CGPointMake(55.746333, 37.566489);
    
    MWDrawLine *drawLine0368 = [[MWDrawLine alloc] init];
    drawLine0368.startPoint = CGPointMake(672, 1735.5);
    drawLine0368.endPoint = CGPointMake(772, 1735.5);
    drawLine0368.width = 22;
    drawLine0368.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0051.nameOriginalTextPrimitives addObject:drawLine0368];

    MWDrawTextLine *drawTextLine0111 = [[MWDrawTextLine alloc] init];
    drawTextLine0111.text = station0051.nameOriginal;
    drawTextLine0111.fontName = @"HelveticaNeue";
    drawTextLine0111.fontColor = [UIColor blackColor];
    drawTextLine0111.fontSize = 32;
    drawTextLine0111.origin = CGPointMake(644 , 1713);
    [station0051.nameOriginalTextPrimitives addObject:drawTextLine0111];

    MWDrawLine *drawLine0383 = [[MWDrawLine alloc] init];
    drawLine0383.startPoint = CGPointMake(672, 1760.5);
    drawLine0383.endPoint = CGPointMake(772, 1760.5);
    drawLine0383.width = 16;
    drawLine0383.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0051.nameEnglishTextPrimitives addObject:drawLine0383];

    MWDrawTextLine *drawTextLine0112 = [[MWDrawTextLine alloc] init];
    drawTextLine0112.text = station0051.nameEnglish;
    drawTextLine0112.fontName = @"HelveticaNeue";
    drawTextLine0112.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0112.fontSize = 18;
    drawTextLine0112.origin = CGPointMake(645, 1746);
    [station0051.nameEnglishTextPrimitives addObject:drawTextLine0112];
    
    // Добавляем вершину
    edge0068.finishVertex = vertex0019;
    
    // Создаем участок линии от "Киевская" до "Арбатская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0018 = [[MWEdge alloc] init];
    edge0018.identifier = @"edge0018";
    edge0018.developmentName = @"Ребро: Киевская - Арбатская";
    [self.edges addObject:edge0018];
    
    // Добавляем линию
    edge0018.line = line0003;

    // Добавляем вершину
    edge0018.startVertex = vertex0019;
    
    // Добавляем станцию "Киевская"
    [edge0018.elements addObject:station0051];
    
    // Добавляем перегон
    MWHaul *haul0049 = [[MWHaul alloc] init];
    haul0049.identifier = @"haul0049";
    haul0049.length = 1340;
    [edge0018.elements addObject:haul0049];

    MWDrawLine *drawLine0098 = [[MWDrawLine alloc] init];
    drawLine0098.startPoint = CGPointMake(734, 1792);
    drawLine0098.endPoint = CGPointMake(970.5, 1792);
    drawLine0098.width = 14.5;
    drawLine0098.color = line0003.color;
    [haul0049.drawPrimitives addObject:drawLine0098];
    
    // Добавляем станцию "Смоленская"
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0018.elements addObject:station0052];
    
    station0052.nameOriginal = @"Смоленская";
    station0052.nameEnglish = @"Smolenskaya";
    station0052.mapLocation = CGPointMake(970.5, 1792);
    station0052.geoLocation = CGPointMake(55.747731, 37.583846);
    
    MWDrawLine *drawLine0099 = [[MWDrawLine alloc] init];
    drawLine0099.startPoint = CGPointMake(970.5, 1792);
    drawLine0099.endPoint = CGPointMake(970.5, 1811);
    drawLine0099.width = 12;
    drawLine0099.color = line0003.color;
    [station0052.drawPrimitives addObject:drawLine0099];
    
    MWDrawTextLine *drawTextLine0113 = [[MWDrawTextLine alloc] init];
    drawTextLine0113.text = station0052.nameOriginal;
    drawTextLine0113.fontName = @"HelveticaNeue";
    drawTextLine0113.fontColor = [UIColor colorWithRed:(0/255.0) green:(114/255.0) blue:(186/255.0) alpha:1];
    drawTextLine0113.fontSize = 32;
    drawTextLine0113.origin = CGPointMake(877 , 1810);
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0113];
    
    MWDrawTextLine *drawTextLine0114 = [[MWDrawTextLine alloc] init];
    drawTextLine0114.text = station0052.nameEnglish;
    drawTextLine0114.fontName = @"HelveticaNeue";
    drawTextLine0114.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0114.fontSize = 18;
    drawTextLine0114.origin = CGPointMake(920, 1846);
    [station0052.nameEnglishTextPrimitives addObject:drawTextLine0114];
    
    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 1390;
    [edge0018.elements addObject:haul0050];

    MWDrawLine *drawLine0100 = [[MWDrawLine alloc] init];
    drawLine0100.startPoint = CGPointMake(970, 1792);
    drawLine0100.endPoint = CGPointMake(1182, 1792);
    drawLine0100.width = 14.5;
    drawLine0100.color = line0003.color;
    [haul0050.drawPrimitives addObject:drawLine0100];
    
    // Добавляем станцию "Арбатская"
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0018.elements addObject:station0053];
    
    station0053.nameOriginal = @"Арбатская";
    station0053.nameEnglish = @"Arbatskaya";
    station0053.mapLocation = CGPointMake(1181, 1792);
    station0053.geoLocation = CGPointMake(55.752387, 37.603287);
    
    MWDrawTextLine *drawTextLine0115 = [[MWDrawTextLine alloc] init];
    drawTextLine0115.text = station0053.nameOriginal;
    drawTextLine0115.fontName = @"HelveticaNeue";
    drawTextLine0115.fontColor = [UIColor colorWithRed:(0/255.0) green:(114/255.0) blue:(186/255.0) alpha:1];
    drawTextLine0115.fontSize = 32;
    drawTextLine0115.origin = CGPointMake(1130 , 1735);
    [station0053.nameOriginalTextPrimitives addObject:drawTextLine0115];
    
    MWDrawTextLine *drawTextLine0116 = [[MWDrawTextLine alloc] init];
    drawTextLine0116.text = station0053.nameEnglish;
    drawTextLine0116.fontName = @"HelveticaNeue";
    drawTextLine0116.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0116.fontSize = 18;
    drawTextLine0116.origin = CGPointMake(1164, 1717);
    [station0053.nameEnglishTextPrimitives addObject:drawTextLine0116];
    
    // Добавляем вершину
    edge0018.finishVertex = vertex0003;
    
    // Создаем участок линии от "Арбатская" до "Пл. Революции"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0019 = [[MWEdge alloc] init];
    edge0019.identifier = @"edge0019";
    edge0019.developmentName = @"Ребро: Арбатская - Пл. Революции";
    [self.edges addObject:edge0019];
    
    // Добавляем линию
    edge0019.line = line0003;

    // Добавляем вершину
    edge0019.startVertex = vertex0003;
    
    // Добавляем станцию "Арбатская"
    [edge0019.elements addObject:station0053];
    
    // Добавляем перегон
    MWHaul *haul0051 = [[MWHaul alloc] init];
    haul0051.identifier = @"haul0051";
    haul0051.length = 1230;
    [edge0019.elements addObject:haul0051];
    
    MWDrawLine *drawLine0101 = [[MWDrawLine alloc] init];
    drawLine0101.startPoint = CGPointMake(1182, 1792);
    drawLine0101.endPoint = CGPointMake(1270, 1792);
    drawLine0101.width = 14.5;
    drawLine0101.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawLine0101];
    
    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(1269.5, 1728);
    drawArc0012.startRadians = 6.94;
    drawArc0012.endRadians = 7.85;
    drawArc0012.radius = 64;
    drawArc0012.width = 14.5;
    drawArc0012.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawArc0012];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(1370, 1807.5);
    drawArc0013.startRadians = 10.095;
    drawArc0013.endRadians = 11;
    drawArc0013.radius = 64;
    drawArc0013.width = 14.5;
    drawArc0013.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawArc0013];
    
    MWDrawLine *drawLine0102 = [[MWDrawLine alloc] init];
    drawLine0102.startPoint = CGPointMake(1370, 1743.5);
    drawLine0102.endPoint = CGPointMake(1527, 1743.5);
    drawLine0102.width = 14.5;
    drawLine0102.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawLine0102];
    
    // Добавляем станцию "Пл. Революции"
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0019.elements addObject:station0054];
    
    station0054.nameOriginal = @"Пл. Революции";
    station0054.nameEnglish = @"Ploschad Revolutsii (Red Square)";
    station0054.mapLocation = CGPointMake(1527, 1743.5);
    station0054.geoLocation = CGPointMake(55.756573, 37.621656);
    
    MWDrawTextLine *drawTextLine0117 = [[MWDrawTextLine alloc] init];
    drawTextLine0117.text = station0054.nameOriginal;
    drawTextLine0117.fontName = @"HelveticaNeue";
    drawTextLine0117.fontColor = [UIColor blackColor];
    drawTextLine0117.fontSize = 32;
    drawTextLine0117.origin = CGPointMake(1393 , 1755);
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0117];
    
    MWDrawTextLine *drawTextLine0118 = [[MWDrawTextLine alloc] init];
    drawTextLine0118.text = station0054.nameEnglish;
    drawTextLine0118.fontName = @"HelveticaNeue";
    drawTextLine0118.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0118.fontSize = 18;
    drawTextLine0118.origin = CGPointMake(1394, 1789);
    [station0054.nameEnglishTextPrimitives addObject:drawTextLine0118];
    
    // Добавляем вершину
    edge0019.finishVertex = vertex0004;
    
    // Создаем участок линии от "Пл. Революции" до "Курская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0020 = [[MWEdge alloc] init];
    edge0020.identifier = @"edge0020";
    edge0020.developmentName = @"Ребро: Пл. Революции - Курская";
    [self.edges addObject:(edge0020)];
    
    // Добавляем линию
    edge0020.line = line0003;

    // Добавляем вершину
    edge0020.startVertex = vertex0004;
    
    // Добавляем станцию "Пл. Революции"
    [edge0020.elements addObject:station0054];
    
    // Добавляем перегон
    MWHaul *haul0052 = [[MWHaul alloc] init];
    haul0052.identifier = @"haul0052";
    haul0052.length = 2390;
    [edge0020.elements addObject:haul0052];

    MWDrawLine *drawLine0103 = [[MWDrawLine alloc] init];
    drawLine0103.startPoint = CGPointMake(1527, 1743.5);
    drawLine0103.endPoint = CGPointMake(1598, 1743.5);
    drawLine0103.width = 14.5;
    drawLine0103.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0103];
    
    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(1599.3, 1623.5);
    drawArc0014.startRadians = 13.343;
    drawArc0014.endRadians = 14.149;
    drawArc0014.radius = 120;
    drawArc0014.width = 14.5;
    drawArc0014.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0104 = [[MWDrawLine alloc] init];
    drawLine0104.startPoint = CGPointMake(1684.5, 1708);
    drawLine0104.endPoint = CGPointMake(1813.9, 1578.6);
    drawLine0104.width = 14.5;
    drawLine0104.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0104];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(1899, 1663);
    drawArc0015.startRadians = 10.2;
    drawArc0015.endRadians = 11;
    drawArc0015.radius = 120;
    drawArc0015.width = 14.5;
    drawArc0015.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0105 = [[MWDrawLine alloc] init];
    drawLine0105.startPoint = CGPointMake(1899, 1543);
    drawLine0105.endPoint = CGPointMake(1952, 1543);
    drawLine0105.width = 14.5;
    drawLine0105.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0105];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(1951.2, 1483);
    drawArc0016.startRadians = 13.36;
    drawArc0016.endRadians = 14.13;
    drawArc0016.radius = 60;
    drawArc0016.width = 14.5;
    drawArc0016.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawArc0016];
    
    MWDrawLine *drawLine0106 = [[MWDrawLine alloc] init];
    drawLine0106.startPoint = CGPointMake(1992.6, 1526.4);
    drawLine0106.endPoint = CGPointMake(2006.0, 1513.0);
    drawLine0106.width = 14.5;
    drawLine0106.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0106];
    
    // Добавляем станцию "Курская"
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0020.elements addObject:station0055];
    
    station0055.nameOriginal = @"Курская";
    station0055.nameEnglish = @"Kurskaya";
    station0055.mapLocation = CGPointMake(2006, 1513.0);
    station0055.geoLocation = CGPointMake(55.758727, 37.659576);
    
    MWDrawTextLine *drawTextLine0119 = [[MWDrawTextLine alloc] init];
    drawTextLine0119.text = station0055.nameOriginal;
    drawTextLine0119.fontName = @"HelveticaNeue";
    drawTextLine0119.fontColor = [UIColor blackColor];
    drawTextLine0119.fontSize = 32;
    drawTextLine0119.origin = CGPointMake(2049 , 1484);
    [station0055.nameOriginalTextPrimitives addObject:drawTextLine0119];
    
    MWDrawTextLine *drawTextLine0120 = [[MWDrawTextLine alloc] init];
    drawTextLine0120.text = station0055.nameEnglish;
    drawTextLine0120.fontName = @"HelveticaNeue";
    drawTextLine0120.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0120.fontSize = 18;
    drawTextLine0120.origin = CGPointMake(2068, 1468);
    [station0055.nameEnglishTextPrimitives addObject:drawTextLine0120];
    
    // Добавляем вершину
    edge0020.finishVertex = vertex0020;
    
    // Создаем участок линии от "Курская" до "Щелковская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0021 = [[MWEdge alloc] init];
    edge0021.identifier = @"edge0021";
    edge0021.developmentName = @"Ребро: Курская - Щелковская";
    [self.edges addObject:edge0021];
    
    // Добавляем линию
    edge0021.line = line0003;

    // Добавляем вершину
    edge0021.startVertex = vertex0020;
    
    // Добавляем станцию "Курская"
    [edge0021.elements addObject:station0055];
    
    // Добавляем перегон
    MWHaul *haul0053 = [[MWHaul alloc] init];
    haul0053.identifier = @"haul0053";
    haul0053.length = 2040;
    [edge0021.elements addObject:haul0053];
    
    MWDrawLine *drawLine0107 = [[MWDrawLine alloc] init];
    drawLine0107.startPoint = CGPointMake(2005.5, 1513.5);
    drawLine0107.endPoint = CGPointMake(2152, 1367);
    drawLine0107.width = 14.5;
    drawLine0107.color = line0003.color;
    [haul0053.drawPrimitives addObject:drawLine0107];
    
    // Добавляем станцию "Бауманская"
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0021.elements addObject:station0056];
    
    station0056.nameOriginal = @"Бауманская";
    station0056.nameEnglish = @"Baumanskaya";
    station0056.mapLocation = CGPointMake(2152, 1366.5);
    station0056.geoLocation = CGPointMake(55.772482, 37.679160);
    
    MWDrawLine *drawLine0108 = [[MWDrawLine alloc] init];
    drawLine0108.startPoint = CGPointMake(2152, 1366.5);
    drawLine0108.endPoint = CGPointMake(2166, 1380.5);
    drawLine0108.width = 12;
    drawLine0108.color = line0003.color;
    [station0056.drawPrimitives addObject:drawLine0108];
    
    MWDrawTextLine *drawTextLine0121 = [[MWDrawTextLine alloc] init];
    drawTextLine0121.text = station0056.nameOriginal;
    drawTextLine0121.fontName = @"HelveticaNeue";
    drawTextLine0121.fontColor = [UIColor blackColor];
    drawTextLine0121.fontSize = 32;
    drawTextLine0121.origin = CGPointMake(2168, 1378);
    [station0056.nameOriginalTextPrimitives addObject:drawTextLine0121];
    
    MWDrawTextLine *drawTextLine0122 = [[MWDrawTextLine alloc] init];
    drawTextLine0122.text = station0056.nameEnglish;
    drawTextLine0122.fontName = @"HelveticaNeue";
    drawTextLine0122.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0122.fontSize = 18;
    drawTextLine0122.origin = CGPointMake(2164, 1413);
    [station0056.nameEnglishTextPrimitives addObject:drawTextLine0122];
    
    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 2080;
    [edge0021.elements addObject:haul0054];
    
    MWDrawLine *drawLine0109 = [[MWDrawLine alloc] init];
    drawLine0109.startPoint = CGPointMake(2151.5, 1367.5);
    drawLine0109.endPoint = CGPointMake(2245, 1274);
    drawLine0109.width = 14.5;
    drawLine0109.color = line0003.color;
    [haul0054.drawPrimitives addObject:drawLine0109];
    
    // Добавляем станцию "Электрозаводская"
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0021.elements addObject:station0057];

    station0057.nameOriginal = @"Электрозаводская";
    station0057.nameEnglish = @"Electrozavodskaya";
    station0057.mapLocation = CGPointMake(2245, 1273.5);
    station0057.geoLocation = CGPointMake(55.782096, 37.705285);
    
    MWDrawLine *drawLine0110 = [[MWDrawLine alloc] init];
    drawLine0110.startPoint = CGPointMake(2245, 1273.5);
    drawLine0110.endPoint = CGPointMake(2259, 1287.5);
    drawLine0110.width = 12;
    drawLine0110.color = line0003.color;
    [station0057.drawPrimitives addObject:drawLine0110];
    
    MWDrawTextLine *drawTextLine0123 = [[MWDrawTextLine alloc] init];
    drawTextLine0123.text = station0057.nameOriginal;
    drawTextLine0123.fontName = @"HelveticaNeue";
    drawTextLine0123.fontColor = [UIColor blackColor];
    drawTextLine0123.fontSize = 32;
    drawTextLine0123.origin = CGPointMake(2257, 1284);
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0123];
    
    MWDrawTextLine *drawTextLine0124 = [[MWDrawTextLine alloc] init];
    drawTextLine0124.text = station0056.nameEnglish;
    drawTextLine0124.fontName = @"HelveticaNeue";
    drawTextLine0124.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0124.fontSize = 18;
    drawTextLine0124.origin = CGPointMake(2253, 1319);
    [station0057.nameEnglishTextPrimitives addObject:drawTextLine0124];
    
    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 926;
    [edge0021.elements addObject:haul0055];
    
    MWDrawLine *drawLine0111 = [[MWDrawLine alloc] init];
    drawLine0111.startPoint = CGPointMake(2244.5, 1274.5);
    drawLine0111.endPoint = CGPointMake(2279.5, 1239.5);
    drawLine0111.width = 14.5;
    drawLine0111.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawLine0111];
    
    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(2208, 1169.5);
    drawArc0017.startRadians = 12.57;
    drawArc0017.endRadians = 13.35;
    drawArc0017.radius = 100;
    drawArc0017.width = 14.5;
    drawArc0017.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawArc0017];
    
    MWDrawLine *drawLine0112 = [[MWDrawLine alloc] init];
    drawLine0112.startPoint = CGPointMake(2308, 1170);
    drawLine0112.endPoint = CGPointMake(2308, 1164.5);
    drawLine0112.width = 14.5;
    drawLine0112.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawLine0112];
    
    // Добавляем станцию "Семеновская"
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0021.elements addObject:station0058];
    
    station0058.nameOriginal = @"Семеновская";
    station0058.nameEnglish = @"Semenovskaya";
    station0058.mapLocation = CGPointMake(2308, 1164.5);
    station0058.geoLocation = CGPointMake(55.783060, 37.719419);
    
    MWDrawLine *drawLine0113 = [[MWDrawLine alloc] init];
    drawLine0113.startPoint = CGPointMake(2308, 1164.5);
    drawLine0113.endPoint = CGPointMake(2327, 1164.5);
    drawLine0113.width = 12;
    drawLine0113.color = line0003.color;
    [station0058.drawPrimitives addObject:drawLine0113];

    MWDrawTextLine *drawTextLine0125 = [[MWDrawTextLine alloc] init];
    drawTextLine0125.text = station0058.nameOriginal;
    drawTextLine0125.fontName = @"HelveticaNeue";
    drawTextLine0125.fontColor = [UIColor blackColor];
    drawTextLine0125.fontSize = 32;
    drawTextLine0125.origin = CGPointMake(2335, 1142);
    [station0058.nameOriginalTextPrimitives addObject:drawTextLine0125];

    MWDrawTextLine *drawTextLine0126 = [[MWDrawTextLine alloc] init];
    drawTextLine0126.text = station0058.nameEnglish;
    drawTextLine0126.fontName = @"HelveticaNeue";
    drawTextLine0126.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0126.fontSize = 18;
    drawTextLine0126.origin = CGPointMake(2331, 1177);
    [station0058.nameEnglishTextPrimitives addObject:drawTextLine0126];
    
    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 2020;
    [edge0021.elements addObject:haul0056];

    MWDrawLine *drawLine0114 = [[MWDrawLine alloc] init];
    drawLine0114.startPoint = CGPointMake(2308, 1165);
    drawLine0114.endPoint = CGPointMake(2308, 1081);
    drawLine0114.width = 14.5;
    drawLine0114.color = line0003.color;
    [haul0056.drawPrimitives addObject:drawLine0114];
    
    // Добавляем станцию "Партизанская"
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0021.elements addObject:station0059];
    
    station0059.nameOriginal = @"Партизанская";
    station0059.nameEnglish = @"Partizanskaya";
    station0059.mapLocation = CGPointMake(2308, 1081);
    station0059.geoLocation = CGPointMake(55.788451, 37.749615);

    MWDrawLine *drawLine0115 = [[MWDrawLine alloc] init];
    drawLine0115.startPoint = CGPointMake(2308, 1081);
    drawLine0115.endPoint = CGPointMake(2327, 1081);
    drawLine0115.width = 12;
    drawLine0115.color = line0003.color;
    [station0059.drawPrimitives addObject:drawLine0115];

    MWDrawTextLine *drawTextLine0127 = [[MWDrawTextLine alloc] init];
    drawTextLine0127.text = station0059.nameOriginal;
    drawTextLine0127.fontName = @"HelveticaNeue";
    drawTextLine0127.fontColor = [UIColor blackColor];
    drawTextLine0127.fontSize = 32;
    drawTextLine0127.origin = CGPointMake(2335, 1056);
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0127];
    
    MWDrawTextLine *drawTextLine0128 = [[MWDrawTextLine alloc] init];
    drawTextLine0128.text = station0059.nameEnglish;
    drawTextLine0128.fontName = @"HelveticaNeue";
    drawTextLine0128.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0128.fontSize = 18;
    drawTextLine0128.origin = CGPointMake(2331, 1091);
    [station0059.nameEnglishTextPrimitives addObject:drawTextLine0128];
    
    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 2030;
    [edge0021.elements addObject:haul0057];

    MWDrawLine *drawLine0116 = [[MWDrawLine alloc] init];
    drawLine0116.startPoint = CGPointMake(2308, 1081);
    drawLine0116.endPoint = CGPointMake(2308, 997);
    drawLine0116.width = 14.5;
    drawLine0116.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawLine0116];
    
    // Добавляем станцию "Измайловская"
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0021.elements addObject:station0060];
    
    station0060.nameOriginal = @"Измайловская";
    station0060.nameEnglish = @"Izmaylovskaya";
    station0060.mapLocation = CGPointMake(2308, 997);
    station0060.geoLocation = CGPointMake(55.787777, 37.781435);

    MWDrawLine *drawLine0117 = [[MWDrawLine alloc] init];
    drawLine0117.startPoint = CGPointMake(2308, 997);
    drawLine0117.endPoint = CGPointMake(2327, 997);
    drawLine0117.width = 12;
    drawLine0117.color = line0003.color;
    [station0060.drawPrimitives addObject:drawLine0117];
    
    MWDrawTextLine *drawTextLine0129 = [[MWDrawTextLine alloc] init];
    drawTextLine0129.text = station0060.nameOriginal;
    drawTextLine0129.fontName = @"HelveticaNeue";
    drawTextLine0129.fontColor = [UIColor blackColor];
    drawTextLine0129.fontSize = 32;
    drawTextLine0129.origin = CGPointMake(2335, 972);
    [station0060.nameOriginalTextPrimitives addObject:drawTextLine0129];

    MWDrawTextLine *drawTextLine0130 = [[MWDrawTextLine alloc] init];
    drawTextLine0130.text = station0060.nameEnglish;
    drawTextLine0130.fontName = @"HelveticaNeue";
    drawTextLine0130.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0130.fontSize = 18;
    drawTextLine0130.origin = CGPointMake(2331, 1007);
    [station0060.nameEnglishTextPrimitives addObject:drawTextLine0130];
    
    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 1380;
    [edge0021.elements addObject:haul0058];
    
    MWDrawLine *drawLine0118 = [[MWDrawLine alloc] init];
    drawLine0118.startPoint = CGPointMake(2308, 997);
    drawLine0118.endPoint = CGPointMake(2308, 913.5);
    drawLine0118.width = 14.5;
    drawLine0118.color = line0003.color;
    [haul0058.drawPrimitives addObject:drawLine0118];
    
    // Добавляем станцию "Первомайская"
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0021.elements addObject:station0061];
    
    station0061.nameOriginal = @"Первомайская";
    station0061.nameEnglish = @"Pervomayskaya";
    station0061.mapLocation = CGPointMake(2308, 913.5);
    station0061.geoLocation = CGPointMake(55.794506, 37.799361);
    
    MWDrawLine *drawLine0119 = [[MWDrawLine alloc] init];
    drawLine0119.startPoint = CGPointMake(2308, 913.5);
    drawLine0119.endPoint = CGPointMake(2327, 913.5);
    drawLine0119.width = 12;
    drawLine0119.color = line0003.color;
    [station0061.drawPrimitives addObject:drawLine0119];

    MWDrawTextLine *drawTextLine0131 = [[MWDrawTextLine alloc] init];
    drawTextLine0131.text = station0061.nameOriginal;
    drawTextLine0131.fontName = @"HelveticaNeue";
    drawTextLine0131.fontColor = [UIColor blackColor];
    drawTextLine0131.fontSize = 32;
    drawTextLine0131.origin = CGPointMake(2335, 888);
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0131];

    MWDrawTextLine *drawTextLine0132 = [[MWDrawTextLine alloc] init];
    drawTextLine0132.text = station0061.nameEnglish;
    drawTextLine0132.fontName = @"HelveticaNeue";
    drawTextLine0132.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0132.fontSize = 18;
    drawTextLine0132.origin = CGPointMake(2331, 923);
    [station0061.nameEnglishTextPrimitives addObject:drawTextLine0132];
    
    // Добавляем перегон
    MWHaul *haul0059 = [[MWHaul alloc] init];
    haul0059.identifier = @"haul0059";
    haul0059.length = 1870;
    [edge0021.elements addObject:haul0059];

    MWDrawLine *drawLine0120 = [[MWDrawLine alloc] init];
    drawLine0120.startPoint = CGPointMake(2308, 914);
    drawLine0120.endPoint = CGPointMake(2308, 822.5);
    drawLine0120.width = 14.5;
    drawLine0120.color = line0003.color;
    [haul0059.drawPrimitives addObject:drawLine0120];
    
    // Добавляем станцию "Щелковская"
    MWStation *station0062 = [[MWStation alloc] init];
    station0062.identifier = @"station0062";
    [edge0021.elements addObject:station0062];
    
    station0062.nameOriginal = @"Щёлковская";
    station0062.nameEnglish = @"Schelkovskaya";
    station0062.mapLocation = CGPointMake(2308, 822.5);
    station0062.geoLocation = CGPointMake(55.809287, 37.798627);

    MWDrawLine *drawLine0121 = [[MWDrawLine alloc] init];
    drawLine0121.startPoint = CGPointMake(2288, 822.5);
    drawLine0121.endPoint = CGPointMake(2327, 822.5);
    drawLine0121.width = 12;
    drawLine0121.color = line0003.color;
    [station0062.drawPrimitives addObject:drawLine0121];

    MWDrawTextLine *drawTextLine0133 = [[MWDrawTextLine alloc] init];
    drawTextLine0133.text = station0062.nameOriginal;
    drawTextLine0133.fontName = @"HelveticaNeue";
    drawTextLine0133.fontColor = [UIColor blackColor];
    drawTextLine0133.fontSize = 32;
    drawTextLine0133.origin = CGPointMake(2335, 798);
    [station0062.nameOriginalTextPrimitives addObject:drawTextLine0133];

    MWDrawTextLine *drawTextLine0134 = [[MWDrawTextLine alloc] init];
    drawTextLine0134.text = station0062.nameEnglish;
    drawTextLine0134.fontName = @"HelveticaNeue";
    drawTextLine0134.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0134.fontSize = 18;
    drawTextLine0134.origin = CGPointMake(2350, 780);
    [station0062.nameEnglishTextPrimitives addObject:drawTextLine0134];
    
    // Добавляем вершину
    edge0021.finishVertex = vertex0021;
    
    ////////////////////////////////////////////////////////////////
    // 4 - Филевская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Кунцевская" до "Киевская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0022 = [[MWEdge alloc] init];
    edge0022.identifier = @"edge0022";
    edge0022.developmentName = @"Ребро: Кунцевская - Киевская";
    [self.edges addObject:edge0022];
    
    // Добавляем линию
    edge0022.line = line0004;

    // Добавляем вершину
    edge0022.startVertex = vertex0018;
    
    // Добавляем станцию "Кунцевская"
    MWStation *station0063 = [[MWStation alloc] init];
    station0063.identifier = @"station0063";
    [edge0022.elements addObject:station0063];

    station0063.nameOriginal = @"Кунцевская";
    station0063.nameEnglish = @"Kuntsevskaya";
    station0063.mapLocation = CGPointMake(148.5, 1341.5);
    station0063.geoLocation = CGPointMake(55.730754, 37.445928);
    
    [station0063.nameOriginalTextPrimitives addObject:drawTextLine0103];
    [station0063.nameEnglishTextPrimitives addObject:drawTextLine0104];
    station0063.showNameOnMap = false;

    // Добавляем перегон
    MWHaul *haul0060 = [[MWHaul alloc] init];
    haul0060.identifier = @"haul0060";
    haul0060.length = 1380;
    [edge0022.elements addObject:haul0060];
    
    MWDrawLine *drawLine0122 = [[MWDrawLine alloc] init];
    drawLine0122.startPoint = CGPointMake(148.5, 1341.5);
    drawLine0122.endPoint = CGPointMake(148.5, 1402.5);
    drawLine0122.width = 14.5;
    drawLine0122.color = line0004.color;
    [haul0060.drawPrimitives addObject:drawLine0122];
    
    // Добавляем станцию "Пионерская"
    MWStation *station0064 = [[MWStation alloc] init];
    station0064.identifier = @"station0064";
    [edge0022.elements addObject:station0064];
   
    station0064.nameOriginal = @"Пионерская";
    station0064.nameEnglish = @"Pionerskaya";
    station0064.mapLocation = CGPointMake(148.5, 1402.5);
    station0064.geoLocation = CGPointMake(55.736040, 37.467070);

    MWDrawLine *drawLine0123 = [[MWDrawLine alloc] init];
    drawLine0123.startPoint = CGPointMake(148.5, 1402.5);
    drawLine0123.endPoint = CGPointMake(168, 1402.5);
    drawLine0123.width = 12;
    drawLine0123.color = line0004.color;
    [station0064.drawPrimitives addObject:drawLine0123];
    
    MWDrawTextLine *drawTextLine0135 = [[MWDrawTextLine alloc] init];
    drawTextLine0135.text = station0064.nameOriginal;
    drawTextLine0135.fontName = @"HelveticaNeue";
    drawTextLine0135.fontColor = [UIColor blackColor];
    drawTextLine0135.fontSize = 32;
    drawTextLine0135.origin = CGPointMake(177, 1378);
    [station0064.nameOriginalTextPrimitives addObject:drawTextLine0135];
    
    MWDrawTextLine *drawTextLine0136 = [[MWDrawTextLine alloc] init];
    drawTextLine0136.text = station0064.nameEnglish;
    drawTextLine0136.fontName = @"HelveticaNeue";
    drawTextLine0136.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0136.fontSize = 18;
    drawTextLine0136.origin = CGPointMake(173, 1413);
    [station0064.nameEnglishTextPrimitives addObject:drawTextLine0136];
    
    // Добавляем перегон
    MWHaul *haul0061 = [[MWHaul alloc] init];
    haul0061.identifier = @"haul0061";
    haul0061.length = 1080;
    [edge0022.elements addObject:haul0061];
    
    MWDrawLine *drawLine0124 = [[MWDrawLine alloc] init];
    drawLine0124.startPoint = CGPointMake(148.5, 1402);
    drawLine0124.endPoint = CGPointMake(148.5, 1466.5);
    drawLine0124.width = 14.5;
    drawLine0124.color = line0004.color;
    [haul0061.drawPrimitives addObject:drawLine0124];
    
    // Добавляем станцию "Филевский Парк"
    MWStation *station0065 = [[MWStation alloc] init];
    station0065.identifier = @"station0065";
    [edge0022.elements addObject:station0065];
    
    station0065.nameOriginal = @"Филёвский Парк";
    station0065.nameEnglish = @"Filevsky Park";
    station0065.mapLocation = CGPointMake(148.5, 1466.5);
    station0065.geoLocation = CGPointMake(55.739618, 37.483215);
    
    MWDrawLine *drawLine0125 = [[MWDrawLine alloc] init];
    drawLine0125.startPoint = CGPointMake(148.5, 1466.5);
    drawLine0125.endPoint = CGPointMake(168, 1466.5);
    drawLine0125.width = 12;
    drawLine0125.color = line0004.color;
    [station0065.drawPrimitives addObject:drawLine0125];
    
    MWDrawTextLine *drawTextLine0137 = [[MWDrawTextLine alloc] init];
    drawTextLine0137.text = station0065.nameOriginal;
    drawTextLine0137.fontName = @"HelveticaNeue";
    drawTextLine0137.fontColor = [UIColor blackColor];
    drawTextLine0137.fontSize = 32;
    drawTextLine0137.origin = CGPointMake(176, 1441);
    [station0065.nameOriginalTextPrimitives addObject:drawTextLine0137];
    
    MWDrawTextLine *drawTextLine0138 = [[MWDrawTextLine alloc] init];
    drawTextLine0138.text = station0065.nameEnglish;
    drawTextLine0138.fontName = @"HelveticaNeue";
    drawTextLine0138.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0138.fontSize = 18;
    drawTextLine0138.origin = CGPointMake(173, 1476);
    [station0065.nameEnglishTextPrimitives addObject:drawTextLine0138];
    
    // Добавляем перегон
    MWHaul *haul0062 = [[MWHaul alloc] init];
    haul0062.identifier = @"haul0062";
    haul0062.length = 1030;
    [edge0022.elements addObject:haul0062];
    
    MWDrawLine *drawLine0126 = [[MWDrawLine alloc] init];
    drawLine0126.startPoint = CGPointMake(148.5, 1466);
    drawLine0126.endPoint = CGPointMake(148.5, 1530.5);
    drawLine0126.width = 14.5;
    drawLine0126.color = line0004.color;
    [haul0062.drawPrimitives addObject:drawLine0126];
    
    // Добавляем станцию "Багратионовская"
    MWStation *station0066 = [[MWStation alloc] init];
    station0066.identifier = @"station0066";
    [edge0022.elements addObject:station0066];
    
    station0066.nameOriginal = @"Багратионовская";
    station0066.nameEnglish = @"Bagrationovskaya";
    station0066.mapLocation = CGPointMake(148.5, 1530.5);
    station0066.geoLocation = CGPointMake(55.743793, 37.497744);
    
    MWDrawLine *drawLine0127 = [[MWDrawLine alloc] init];
    drawLine0127.startPoint = CGPointMake(148.5, 1530.5);
    drawLine0127.endPoint = CGPointMake(168, 1530.5);
    drawLine0127.width = 12;
    drawLine0127.color = line0004.color;
    [station0066.drawPrimitives addObject:drawLine0127];

    MWDrawTextLine *drawTextLine0139 = [[MWDrawTextLine alloc] init];
    drawTextLine0139.text = station0066.nameOriginal;
    drawTextLine0139.fontName = @"HelveticaNeue";
    drawTextLine0139.fontColor = [UIColor blackColor];
    drawTextLine0139.fontSize = 32;
    drawTextLine0139.origin = CGPointMake(176, 1503);
    [station0066.nameOriginalTextPrimitives addObject:drawTextLine0139];
    
    MWDrawTextLine *drawTextLine0140 = [[MWDrawTextLine alloc] init];
    drawTextLine0140.text = station0066.nameEnglish;
    drawTextLine0140.fontName = @"HelveticaNeue";
    drawTextLine0140.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0140.fontSize = 18;
    drawTextLine0140.origin = CGPointMake(173, 1538);
    [station0066.nameEnglishTextPrimitives addObject:drawTextLine0140];
    
    // Добавляем перегон
    MWHaul *haul0063 = [[MWHaul alloc] init];
    haul0063.identifier = @"haul0063";
    haul0063.length = 1120;
    [edge0022.elements addObject:haul0063];

    MWDrawLine *drawLine0128 = [[MWDrawLine alloc] init];
    drawLine0128.startPoint = CGPointMake(148.5, 1530);
    drawLine0128.endPoint = CGPointMake(148.5, 1594.5);
    drawLine0128.width = 14.5;
    drawLine0128.color = line0004.color;
    [haul0063.drawPrimitives addObject:drawLine0128];
    
    // Добавляем станцию "Фили"
    MWStation *station0067 = [[MWStation alloc] init];
    station0067.identifier = @"station0067";
    [edge0022.elements addObject:station0067];
    
    station0067.nameOriginal = @"Фили";
    station0067.nameEnglish = @"Fili";
    station0067.mapLocation = CGPointMake(148.5, 1594.5);
    station0067.geoLocation = CGPointMake(55.746101, 37.514794);

    MWDrawLine *drawLine0129 = [[MWDrawLine alloc] init];
    drawLine0129.startPoint = CGPointMake(148.5, 1594.5);
    drawLine0129.endPoint = CGPointMake(168, 1594.5);
    drawLine0129.width = 12;
    drawLine0129.color = line0004.color;
    [station0067.drawPrimitives addObject:drawLine0129];
    
    MWDrawTextLine *drawTextLine0141 = [[MWDrawTextLine alloc] init];
    drawTextLine0141.text = station0067.nameOriginal;
    drawTextLine0141.fontName = @"HelveticaNeue";
    drawTextLine0141.fontColor = [UIColor blackColor];
    drawTextLine0141.fontSize = 32;
    drawTextLine0141.origin = CGPointMake(176, 1569);
    [station0067.nameOriginalTextPrimitives addObject:drawTextLine0141];

    MWDrawTextLine *drawTextLine0142 = [[MWDrawTextLine alloc] init];
    drawTextLine0142.text = station0067.nameEnglish;
    drawTextLine0142.fontName = @"HelveticaNeue";
    drawTextLine0142.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0142.fontSize = 18;
    drawTextLine0142.origin = CGPointMake(173, 1604);
    [station0067.nameEnglishTextPrimitives addObject:drawTextLine0142];
    
    // Добавляем перегон
    MWHaul *haul0064 = [[MWHaul alloc] init];
    haul0064.identifier = @"haul0064";
    haul0064.length = 1390;
    [edge0022.elements addObject:haul0064];

    MWDrawLine *drawLine0130 = [[MWDrawLine alloc] init];
    drawLine0130.startPoint = CGPointMake(148.5, 1594);
    drawLine0130.endPoint = CGPointMake(148.5, 1639.5);
    drawLine0130.width = 14.5;
    drawLine0130.color = line0004.color;
    [haul0064.drawPrimitives addObject:drawLine0130];
    
    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(208.5, 1638.5);
    drawArc0018.startRadians = 14.12;
    drawArc0018.endRadians = 15.7;
    drawArc0018.radius = 60;
    drawArc0018.width = 14.5;
    drawArc0018.color = line0004.color;
    [haul0064.drawPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0131 = [[MWDrawLine alloc] init];
    drawLine0131.startPoint = CGPointMake(209, 1698.5);
    drawLine0131.endPoint = CGPointMake(257.5, 1698.5);
    drawLine0131.width = 14.5;
    drawLine0131.color = line0004.color;
    [haul0064.drawPrimitives addObject:drawLine0131];
    
    // Добавляем станцию "Кутузовская"
    MWStation *station0068 = [[MWStation alloc] init];
    station0068.identifier = @"station0068";
    [edge0022.elements addObject:station0068];

    station0068.nameOriginal = @"Кутузовская";
    station0068.nameEnglish = @"Kutuzovskaya";
    station0068.mapLocation = CGPointMake(257.5, 1698.5);
    station0068.geoLocation = CGPointMake(55.740005, 37.534378);
    
    MWDrawLine *drawLine0132 = [[MWDrawLine alloc] init];
    drawLine0132.startPoint = CGPointMake(257.5, 1698.5);
    drawLine0132.endPoint = CGPointMake(257.5, 1717);
    drawLine0132.width = 12;
    drawLine0132.color = line0004.color;
    [station0068.drawPrimitives addObject:drawLine0132];
    
    MWDrawTextLine *drawTextLine0143 = [[MWDrawTextLine alloc] init];
    drawTextLine0143.text = station0068.nameOriginal;
    drawTextLine0143.fontName = @"HelveticaNeue";
    drawTextLine0143.fontColor = [UIColor blackColor];
    drawTextLine0143.fontSize = 32;
    drawTextLine0143.origin = CGPointMake(163, 1713);
    [station0068.nameOriginalTextPrimitives addObject:drawTextLine0143];

    MWDrawTextLine *drawTextLine0144 = [[MWDrawTextLine alloc] init];
    drawTextLine0144.text = station0068.nameEnglish;
    drawTextLine0144.fontName = @"HelveticaNeue";
    drawTextLine0144.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0144.fontSize = 18;
    drawTextLine0144.origin = CGPointMake(202, 1748);
    [station0068.nameEnglishTextPrimitives addObject:drawTextLine0144];
    
    // Добавляем перегон
    MWHaul *haul0065 = [[MWHaul alloc] init];
    haul0065.identifier = @"haul0065";
    haul0065.length = 904;
    [edge0022.elements addObject:haul0065];
    
    MWDrawLine *drawLine0133 = [[MWDrawLine alloc] init];
    drawLine0133.startPoint = CGPointMake(257, 1698.5);
    drawLine0133.endPoint = CGPointMake(479.5, 1698.5);
    drawLine0133.width = 14.5;
    drawLine0133.color = line0004.color;
    [haul0065.drawPrimitives addObject:drawLine0133];
    
    // Добавляем станцию "Студенческая"
    MWStation *station0069 = [[MWStation alloc] init];
    station0069.identifier = @"station0069";
    [edge0022.elements addObject:station0069];
    
    station0069.nameOriginal = @"Студенческая";
    station0069.nameEnglish = @"Studencheskaya";
    station0069.mapLocation = CGPointMake(479.5, 1698.5);
    station0069.geoLocation = CGPointMake(55.738879, 37.548340);

    MWDrawLine *drawLine0134 = [[MWDrawLine alloc] init];
    drawLine0134.startPoint = CGPointMake(479.5, 1698.5);
    drawLine0134.endPoint = CGPointMake(479.5, 1717);
    drawLine0134.width = 12;
    drawLine0134.color = line0004.color;
    [station0069.drawPrimitives addObject:drawLine0134];
    
    MWDrawTextLine *drawTextLine0145 = [[MWDrawTextLine alloc] init];
    drawTextLine0145.text = station0069.nameOriginal;
    drawTextLine0145.fontName = @"HelveticaNeue";
    drawTextLine0145.fontColor = [UIColor blackColor];
    drawTextLine0145.fontSize = 32;
    drawTextLine0145.origin = CGPointMake(390, 1713);
    [station0069.nameOriginalTextPrimitives addObject:drawTextLine0145];

    MWDrawTextLine *drawTextLine0146 = [[MWDrawTextLine alloc] init];
    drawTextLine0146.text = station0069.nameEnglish;
    drawTextLine0146.fontName = @"HelveticaNeue";
    drawTextLine0146.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0146.fontSize = 18;
    drawTextLine0146.origin = CGPointMake(430, 1748);
    [station0069.nameEnglishTextPrimitives addObject:drawTextLine0146];
    
    // Добавляем перегон
    MWHaul *haul0066 = [[MWHaul alloc] init];
    haul0066.identifier = @"haul0066";
    haul0066.length = 1300;
    [edge0022.elements addObject:haul0066];
    
    MWDrawLine *drawLine0135 = [[MWDrawLine alloc] init];
    drawLine0135.startPoint = CGPointMake(479, 1698.5);
    drawLine0135.endPoint = CGPointMake(733.5, 1698.5);
    drawLine0135.width = 14.5;
    drawLine0135.color = line0004.color;
    [haul0066.drawPrimitives addObject:drawLine0135];
    
    // Добавляем станцию "Киевская"
    MWStation *station0070 = [[MWStation alloc] init];
    station0070.identifier = @"station0070";
    [edge0022.elements addObject:station0070];

    station0070.nameOriginal = @"Киевская";
    station0070.nameEnglish = @"Kievskaya";
    station0070.mapLocation = CGPointMake(733.5, 1698.5);
    station0070.geoLocation = CGPointMake(55.743629, 37.566485);
    
    [station0070.nameOriginalTextPrimitives addObject:drawTextLine0111];
    [station0070.nameEnglishTextPrimitives addObject:drawTextLine0112];
    station0070.showNameOnMap = false;
    
    // Добавляем вершину
    edge0022.finishVertex = vertex0019;
    
    // Создаем участок линии от "Международная" до "Выставочная"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0023 = [[MWEdge alloc] init];
    edge0023.identifier = @"edge0023";
    edge0023.developmentName = @"Ребро: Международная - Выставочная";
    [self.edges addObject:edge0023];
    
    // Добавляем линию
    edge0023.line = line0004;

    // Добавляем вершину
    edge0023.startVertex = vertex0022;
    
    // Добавляем станцию "Международная"
    MWStation *station0071 = [[MWStation alloc] init];
    station0071.identifier = @"station0071";
    [edge0023.elements addObject:station0071];
    
    station0071.nameOriginal = @"Международная";
    station0071.nameEnglish = @"Mezhdunarodnaya";
    station0071.mapLocation = CGPointMake(493.5, 1541.5);
    station0071.geoLocation = CGPointMake(55.747810, 37.533180);
    
    MWDrawLine *drawLine0136 = [[MWDrawLine alloc] init];
    drawLine0136.startPoint = CGPointMake(474, 1541.5);
    drawLine0136.endPoint = CGPointMake(512, 1541.5);
    drawLine0136.width = 12;
    drawLine0136.color = line0004.color;
    [station0071.drawPrimitives addObject:drawLine0136];
    
    MWDrawTextLine *drawTextLine0147 = [[MWDrawTextLine alloc] init];
    drawTextLine0147.text = station0071.nameOriginal;
    drawTextLine0147.fontName = @"HelveticaNeue";
    drawTextLine0147.fontColor = [UIColor blackColor];
    drawTextLine0147.fontSize = 32;
    drawTextLine0147.origin = CGPointMake(521 , 1516);
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0147];
    
    MWDrawTextLine *drawTextLine0148 = [[MWDrawTextLine alloc] init];
    drawTextLine0148.text = station0071.nameEnglish;
    drawTextLine0148.fontName = @"HelveticaNeue";
    drawTextLine0148.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0148.fontSize = 18;
    drawTextLine0148.origin = CGPointMake(517, 1551);
    [station0071.nameEnglishTextPrimitives addObject:drawTextLine0148];
    
    // Добавляем перегон
    MWHaul *haul0067 = [[MWHaul alloc] init];
    haul0067.identifier = @"haul0067";
    haul0067.length = 637;
    [edge0023.elements addObject:haul0067];
    
    MWDrawLine *drawLine0137 = [[MWDrawLine alloc] init];
    drawLine0137.startPoint = CGPointMake(493.5, 1541.5);
    drawLine0137.endPoint = CGPointMake(493.5, 1585);
    drawLine0137.width = 14.5;
    drawLine0137.color = line0004.color;
    [haul0067.drawPrimitives addObject:drawLine0137];
    
    // Добавляем станцию "Выставочная"
    MWStation *station0072 = [[MWStation alloc] init];
    station0072.identifier = @"station0072";
    [edge0023.elements addObject:station0072];
    
    station0072.nameOriginal = @"Выставочная";
    station0072.nameEnglish = @"Vystavochnaya";
    station0072.mapLocation = CGPointMake(493.5, 1600);
    station0072.geoLocation = CGPointMake(55.749158, 37.543833);

    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(493.5, 1600);
    drawArc0019.startRadians = M_PI * 2;
    drawArc0019.endRadians = 0;
    drawArc0019.radius = 14;
    drawArc0019.width = 10;
    drawArc0019.color = line0004.color;
    [station0072.drawPrimitives addObject:drawArc0019];
    
    MWDrawTextLine *drawTextLine0149 = [[MWDrawTextLine alloc] init];
    drawTextLine0149.text = station0072.nameOriginal;
    drawTextLine0149.fontName = @"HelveticaNeue";
    drawTextLine0149.fontColor = [UIColor blackColor];
    drawTextLine0149.fontSize = 32;
    drawTextLine0149.origin = CGPointMake(521, 1581);
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0149];
    
    MWDrawTextLine *drawTextLine0150 = [[MWDrawTextLine alloc] init];
    drawTextLine0150.text = station0072.nameEnglish;
    drawTextLine0150.fontName = @"HelveticaNeue";
    drawTextLine0150.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0150.fontSize = 18;
    drawTextLine0150.origin = CGPointMake(517, 1616);
    [station0072.nameEnglishTextPrimitives addObject:drawTextLine0150];
    
    // Добавляем вершину
    edge0023.finishVertex = vertex0044;
    
    // Создаем участок линии от "Выставочная" до "Киевская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0069 = [[MWEdge alloc] init];
    edge0069.identifier = @"edge0069";
    edge0069.developmentName = @"Ребро: Выставочная - Киевская";
    [self.edges addObject:edge0069];
    
    // Добавляем линию
    edge0069.line = line0004;
    
    // Добавляем вершину
    edge0069.startVertex = vertex0044;
    
    // Добавляем станцию "Выставочная"
    [edge0069.elements addObject:station0072];
    
    // Добавляем перегон
    MWHaul *haul0068 = [[MWHaul alloc] init];
    haul0068.identifier = @"haul0068";
    haul0068.length = 1630;
    [edge0069.elements addObject:haul0068];
    
    MWDrawLine *drawLine0138 = [[MWDrawLine alloc] init];
    drawLine0138.startPoint = CGPointMake(493.5, 1615);
    drawLine0138.endPoint = CGPointMake(493.5, 1629);
    drawLine0138.width = 14.5;
    drawLine0138.color = line0004.color;
    [haul0068.drawPrimitives addObject:drawLine0138];
    
    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(563.5, 1628.5);
    drawArc0020.startRadians = M_PI / 2;
    drawArc0020.endRadians = M_PI;
    drawArc0020.radius = 70;
    drawArc0020.width = 14.5;
    drawArc0020.color = line0004.color;
    [haul0068.drawPrimitives addObject:drawArc0020];
    
    MWDrawLine *drawLine0378 = [[MWDrawLine alloc] init];
    drawLine0378.startPoint = CGPointMake(563, 1698.5);
    drawLine0378.endPoint = CGPointMake(733.5, 1698.5);
    drawLine0378.width = 14.5;
    drawLine0378.color = line0004.color;
    [haul0068.drawPrimitives addObject:drawLine0378];
    
    // Добавляем станцию "Киевская"
    [edge0069.elements addObject:station0070];
    
    // Добавляем вершину
    edge0069.finishVertex = vertex0019;
    
    // Создаем участок линии от "Киевская" до "Александровский сад"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0024 = [[MWEdge alloc] init];
    edge0024.identifier = @"edge0024";
    edge0024.developmentName = @"Ребро: Киевская - Александровский сад";
    [self.edges addObject:(edge0024)];
    
    // Добавляем линию
    edge0024.line = line0004;

    // Добавляем вершину
    edge0024.startVertex = vertex0019;
    
    // Добавляем станцию "Киевская"
    [edge0024.elements addObject:station0070];
    
    // Добавляем перегон
    MWHaul *haul0069 = [[MWHaul alloc] init];
    haul0069.identifier = @"haul0069";
    haul0069.length = 1110;
    [edge0024.elements addObject:haul0069];
    
    MWDrawLine *drawLine0139 = [[MWDrawLine alloc] init];
    drawLine0139.startPoint = CGPointMake(733, 1698.5);
    drawLine0139.endPoint = CGPointMake(969.5, 1698.5);
    drawLine0139.width = 14.5;
    drawLine0139.color = line0004.color;
    [haul0069.drawPrimitives addObject:drawLine0139];
    
    // Добавляем станцию "Смоленская"
    MWStation *station0073 = [[MWStation alloc] init];
    station0073.identifier = @"station0073";
    [edge0024.elements addObject:station0073];
    
    station0073.nameOriginal = @"Смоленская";
    station0073.nameEnglish = @"Smolenskaya";
    station0073.mapLocation = CGPointMake(969.5, 1698.5);
    station0073.geoLocation = CGPointMake(55.749023, 37.582166);
    
    MWDrawLine *drawLine0140 = [[MWDrawLine alloc] init];
    drawLine0140.startPoint = CGPointMake(969.5, 1698.5);
    drawLine0140.endPoint = CGPointMake(969.5, 1679);
    drawLine0140.width = 12;
    drawLine0140.color = line0004.color;
    [station0073.drawPrimitives addObject:drawLine0140];
    
    MWDrawTextLine *drawTextLine0151 = [[MWDrawTextLine alloc] init];
    drawTextLine0151.text = station0073.nameOriginal;
    drawTextLine0151.fontName = @"HelveticaNeue";
    drawTextLine0151.fontColor = [UIColor colorWithRed:(38/255.0) green:(188/255.0) blue:(239/255.0) alpha:1];
    drawTextLine0151.fontSize = 32;
    drawTextLine0151.origin = CGPointMake(876, 1637);
    [station0073.nameOriginalTextPrimitives addObject:drawTextLine0151];
    
    MWDrawTextLine *drawTextLine0152 = [[MWDrawTextLine alloc] init];
    drawTextLine0152.text = station0073.nameEnglish;
    drawTextLine0152.fontName = @"HelveticaNeue";
    drawTextLine0152.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0152.fontSize = 18;
    drawTextLine0152.origin = CGPointMake(920, 1622);
    [station0073.nameEnglishTextPrimitives addObject:drawTextLine0152];
    
    // Добавляем перегон
    MWHaul *haul0070 = [[MWHaul alloc] init];
    haul0070.identifier = @"haul0070";
    haul0070.length = 1290;
    [edge0024.elements addObject:haul0070];

    MWDrawLine *drawLine0141 = [[MWDrawLine alloc] init];
    drawLine0141.startPoint = CGPointMake(969, 1698.5);
    drawLine0141.endPoint = CGPointMake(1001, 1698.5);
    drawLine0141.width = 14.5;
    drawLine0141.color = line0004.color;
    [haul0070.drawPrimitives addObject:drawLine0141];

    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(1000.6, 1758.5);
    drawArc0021.startRadians = M_PI * 1.5;
    drawArc0021.endRadians = M_PI * 1.75;
    drawArc0021.radius = 60;
    drawArc0021.width = 14.5;
    drawArc0021.color = line0004.color;
    [haul0070.drawPrimitives addObject:drawArc0021];
    
    MWDrawLine *drawLine0142 = [[MWDrawLine alloc] init];
    drawLine0142.startPoint = CGPointMake(1042.5, 1715.5);
    drawLine0142.endPoint = CGPointMake(1054.5, 1727.5);
    drawLine0142.width = 14.5;
    drawLine0142.color = line0004.color;
    [haul0070.drawPrimitives addObject:drawLine0142];
    
    // Добавляем станцию "Арбатская"
    MWStation *station0074 = [[MWStation alloc] init];
    station0074.identifier = @"station0074";
    [edge0024.elements addObject:station0074];
    
    station0074.nameOriginal = @"Арбатская";
    station0074.nameEnglish = @"Arbatskaya";
    station0074.mapLocation = CGPointMake(1054.5, 1727.5);
    station0074.geoLocation = CGPointMake(55.752159, 37.601520);
    
    MWDrawLine *drawLine0143 = [[MWDrawLine alloc] init];
    drawLine0143.startPoint = CGPointMake(1054.5, 1727.5);
    drawLine0143.endPoint = CGPointMake(1067.5, 1714.5);
    drawLine0143.width = 12;
    drawLine0143.color = line0004.color;
    [station0074.drawPrimitives addObject:drawLine0143];
    
    MWDrawLine *drawLine0372 = [[MWDrawLine alloc] init];
    drawLine0372.startPoint = CGPointMake(1078, 1703.5);
    drawLine0372.endPoint = CGPointMake(1128, 1703.5);
    drawLine0372.width = 26;
    drawLine0372.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0074.nameOriginalTextPrimitives addObject:drawLine0372];

    MWDrawTextLine *drawTextLine0153 = [[MWDrawTextLine alloc] init];
    drawTextLine0153.text = station0074.nameOriginal;
    drawTextLine0153.fontName = @"HelveticaNeue";
    drawTextLine0153.fontColor = [UIColor colorWithRed:(38/255.0) green:(188/255.0) blue:(239/255.0) alpha:1];
    drawTextLine0153.fontSize = 32;
    drawTextLine0153.origin = CGPointMake(1072, 1678);
    [station0074.nameOriginalTextPrimitives addObject:drawTextLine0153];
    
    MWDrawTextLine *drawTextLine0154 = [[MWDrawTextLine alloc] init];
    drawTextLine0154.text = station0074.nameEnglish;
    drawTextLine0154.fontName = @"HelveticaNeue";
    drawTextLine0154.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0154.fontSize = 18;
    drawTextLine0154.origin = CGPointMake(1139, 1661);
    [station0074.nameEnglishTextPrimitives addObject:drawTextLine0154];
    
    // Добавляем перегон
    MWHaul *haul0071 = [[MWHaul alloc] init];
    haul0071.identifier = @"haul0071";
    haul0071.length = 494;
    [edge0024.elements addObject:haul0071];
    
    MWDrawLine *drawLine0144 = [[MWDrawLine alloc] init];
    drawLine0144.startPoint = CGPointMake(1054, 1727);
    drawLine0144.endPoint = CGPointMake(1181.5, 1856.5);
    drawLine0144.width = 14.5;
    drawLine0144.color = line0004.color;
    [haul0071.drawPrimitives addObject:drawLine0144];
    
    // Добавляем станцию "Александровский сад"
    MWStation *station0075 = [[MWStation alloc] init];
    station0075.identifier = @"station0075";
    [edge0024.elements addObject:station0075];

    station0075.nameOriginal = @"Александровский сад";
    station0075.nameEnglish = @"Aleksandrovsky Sad";
    station0075.mapLocation = CGPointMake(1181.5, 1856.5);
    station0075.geoLocation = CGPointMake(55.752289, 37.608660);

    MWDrawLine *drawLine0367 = [[MWDrawLine alloc] init];
    drawLine0367.startPoint = CGPointMake(1222, 1837.5);
    drawLine0367.endPoint = CGPointMake(1323, 1837.5);
    drawLine0367.width = 22;
    drawLine0367.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0075.nameOriginalTextPrimitives addObject:drawLine0367];

    MWDrawTextLine *drawTextLine0155 = [[MWDrawTextLine alloc] init];
    drawTextLine0155.text = station0075.nameOriginal;
    drawTextLine0155.fontName = @"HelveticaNeue";
    drawTextLine0155.fontColor = [UIColor blackColor];
    drawTextLine0155.fontSize = 32;
    drawTextLine0155.origin = CGPointMake(1205, 1815);
    [station0075.nameOriginalTextPrimitives addObject:drawTextLine0155];

    MWDrawTextLine *drawTextLine0156 = [[MWDrawTextLine alloc] init];
    drawTextLine0156.text = station0075.nameEnglish;
    drawTextLine0156.fontName = @"HelveticaNeue";
    drawTextLine0156.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0156.fontSize = 18;
    drawTextLine0156.origin = CGPointMake(1372, 1850);
    [station0075.nameEnglishTextPrimitives addObject:drawTextLine0156];
    
    // Добавляем вершину
    edge0024.finishVertex = vertex0003;
    
    ////////////////////////////////////////////////////////////////
    // 5 - Кольцевая линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Добрынинская" до "Октябрьская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0025 = [[MWEdge alloc] init];
    edge0025.identifier = @"edge0025";
    edge0025.developmentName = @"Ребро: Добрынинская - Октябрьская";
    [self.edges addObject:edge0025];
    
    // Добавляем линию
    edge0025.line = line0005;

    // Добавляем вершину
    edge0025.startVertex = vertex0023;
    
    // Добавляем станцию "Добрынинская"
    MWStation *station0076 = [[MWStation alloc] init];
    station0076.identifier = @"station0076";
    [edge0025.elements addObject:station0076];
    
    station0076.nameOriginal = @"Добрынинская";
    station0076.nameEnglish = @"Dobryninskaya";
    station0076.mapLocation = CGPointMake(1287.5, 2260.5);
    station0076.geoLocation = CGPointMake(55.728985, 37.622779);
    
    MWDrawTextLine *drawTextLine0157 = [[MWDrawTextLine alloc] init];
    drawTextLine0157.text = station0076.nameOriginal;
    drawTextLine0157.fontName = @"HelveticaNeue";
    drawTextLine0157.fontColor = [UIColor blackColor];
    drawTextLine0157.fontSize = 32;
    drawTextLine0157.origin = CGPointMake(1068, 2272);
    [station0076.nameOriginalTextPrimitives addObject:drawTextLine0157];
    
    MWDrawTextLine *drawTextLine0158 = [[MWDrawTextLine alloc] init];
    drawTextLine0158.text = station0076.nameEnglish;
    drawTextLine0158.fontName = @"HelveticaNeue";
    drawTextLine0158.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0158.fontSize = 18;
    drawTextLine0158.origin = CGPointMake(1170, 2307);
    [station0076.nameEnglishTextPrimitives addObject:drawTextLine0158];
    
    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = CGPointMake(1287.5, 2260.5);
    fillCircle0067.radius = 4;
    fillCircle0067.fillColor = [UIColor whiteColor];
    [station0076.drawPrimitives addObject:fillCircle0067];
    
    // Добавляем перегон
    MWHaul *haul0072 = [[MWHaul alloc] init];
    haul0072.identifier = @"haul0072";
    haul0072.length = 736;
    [edge0025.elements addObject:haul0072];

    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(1430, 1655);
    drawArc0022.startRadians = M_PI / 1.745;
    drawArc0022.endRadians = M_PI / 1.4965;
    drawArc0022.radius = 622;
    drawArc0022.width = 14.5;
    drawArc0022.color = line0005.color;
    [haul0072.drawPrimitives addObject:drawArc0022];
    
    // Добавляем станцию "Октябрьская"
    MWStation *station0077 = [[MWStation alloc] init];
    station0077.identifier = @"station0077";
    [edge0025.elements addObject:station0077];

    station0077.nameOriginal = @"Октябрьская";
    station0077.nameEnglish = @"Oktyabrskaya";
    station0077.mapLocation = CGPointMake(1117.5, 2192.5);
    station0077.geoLocation = CGPointMake(55.729254, 37.611311);

    MWDrawTextLine *drawTextLine0159 = [[MWDrawTextLine alloc] init];
    drawTextLine0159.text = station0077.nameOriginal;
    drawTextLine0159.fontName = @"HelveticaNeue";
    drawTextLine0159.fontColor = [UIColor blackColor];
    drawTextLine0159.fontSize = 32;
    drawTextLine0159.origin = CGPointMake(1129, 2147);
    [station0077.nameOriginalTextPrimitives addObject:drawTextLine0159];

    MWDrawTextLine *drawTextLine0160 = [[MWDrawTextLine alloc] init];
    drawTextLine0160.text = station0077.nameEnglish;
    drawTextLine0160.fontName = @"HelveticaNeue";
    drawTextLine0160.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0160.fontSize = 18;
    drawTextLine0160.origin = CGPointMake(1170, 2130);
    [station0077.nameEnglishTextPrimitives addObject:drawTextLine0160];
    
    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = CGPointMake(1117.5, 2192.5);
    fillCircle0068.radius = 4;
    fillCircle0068.fillColor = [UIColor whiteColor];
    [station0077.drawPrimitives addObject:fillCircle0068];

    // Добавляем вершину
    edge0025.finishVertex = vertex0024;
    
    // Создаем участок линии от "Октябрьская" до "Парк Культуры"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0026 = [[MWEdge alloc] init];
    edge0026.identifier = @"edge0026";
    edge0026.developmentName = @"Ребро: Октябрьская - Парк Культуры";
    [self.edges addObject:edge0026];
    
    // Добавляем линию
    edge0026.line = line0005;

    // Добавляем вершину
    edge0026.startVertex = vertex0024;
    
    // Добавляем станцию "Октябрьская"
    [edge0026.elements addObject:station0077];
    
    // Добавляем перегон
    MWHaul *haul0073 = [[MWHaul alloc] init];
    haul0073.identifier = @"haul0073";
    haul0073.length = 1330;
    [edge0026.elements addObject:haul0073];
    
    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(1430, 1655);
    drawArc0023.startRadians = M_PI / 1.4973;
    drawArc0023.endRadians = M_PI / 1.308;
    drawArc0023.radius = 622;
    drawArc0023.width = 14.5;
    drawArc0023.color = line0005.color;
    [haul0073.drawPrimitives addObject:drawArc0023];
    
    // Добавляем станцию "Парк Культуры"
    MWStation *station0078 = [[MWStation alloc] init];
    station0078.identifier = @"station0078";
    [edge0026.elements addObject:station0078];
    
    station0078.nameOriginal = @"Парк Культуры";
    station0078.nameEnglish = @"Park Kultury";
    station0078.mapLocation = CGPointMake(971.5, 2074.5);
    station0078.geoLocation = CGPointMake(55.735204, 37.593076);

    [station0078.nameOriginalTextPrimitives addObject:drawTextLine0015];
    [station0078.nameEnglishTextPrimitives addObject:drawTextLine0016];
    station0078.showNameOnMap = false;
    
    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = CGPointMake(971.5, 2074.5);
    fillCircle0069.radius = 4;
    fillCircle0069.fillColor = [UIColor whiteColor];
    [station0078.drawPrimitives addObject:fillCircle0069];

    // Добавляем вершину
    edge0026.finishVertex = vertex0002;
    
    // Создаем участок линии от "Парк Культуры" до "Киевская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0027 = [[MWEdge alloc] init];
    edge0027.identifier = @"edge0027";
    edge0027.developmentName = @"Ребро: Парк Культуры - Киевская";
    [self.edges addObject:edge0027];
    
    // Добавляем линию
    edge0027.line = line0005;

    // Добавляем вершину
    edge0027.startVertex = vertex0002;
    
    // Добавляем станцию "Парк Культуры"
    [edge0027.elements addObject:station0078];
    
    // Добавляем перегон
    MWHaul *haul0074 = [[MWHaul alloc] init];
    haul0074.identifier = @"haul0074";
    haul0074.length = 1970;
    [edge0027.elements addObject:haul0074];
    
    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(1430, 1655);
    drawArc0024.startRadians = M_PI / 1.3087;
    drawArc0024.endRadians = M_PI / 1.048;
    drawArc0024.radius = 622;
    drawArc0024.width = 14.5;
    drawArc0024.color = line0005.color;
    [haul0074.drawPrimitives addObject:drawArc0024];
    
    // Добавляем станцию "Киевская"
    MWStation *station0079 = [[MWStation alloc] init];
    station0079.identifier = @"station0079";
    [edge0027.elements addObject:station0079];
    
    station0079.nameOriginal = @"Киевская";
    station0079.nameEnglish = @"Kievskaya";
    station0079.mapLocation = CGPointMake(815, 1744.5);
    station0079.geoLocation = CGPointMake(55.743631, 37.566483);

    [station0079.nameOriginalTextPrimitives addObject:drawTextLine0111];
    [station0079.nameEnglishTextPrimitives addObject:drawTextLine0112];
    station0079.showNameOnMap = false;
    
    MWDrawFillCircle *fillCircle0070 = [[MWDrawFillCircle alloc] init];
    fillCircle0070.center = CGPointMake(815, 1744.5);
    fillCircle0070.radius = 4;
    fillCircle0070.fillColor = [UIColor whiteColor];
    [station0079.drawPrimitives addObject:fillCircle0070];
    
    // Добавляем вершину
    edge0027.finishVertex = vertex0019;
    
    // Создаем участок линии от "Киевская" до "Краснопресненская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0028 = [[MWEdge alloc] init];
    edge0028.identifier = @"edge0028";
    edge0028.developmentName = @"Ребро: Киевская - Краснопресненская";
    [self.edges addObject:edge0028];
    
    // Добавляем линию
    edge0028.line = line0005;

    // Добавляем вершину
    edge0028.startVertex = vertex0019;
    
    // Добавляем станцию "Киевская"
    [edge0028.elements addObject:station0079];
    
    // Добавляем перегон
    MWHaul *haul0075 = [[MWHaul alloc] init];
    haul0075.identifier = @"haul0075";
    haul0075.length = 1890;
    [edge0028.elements addObject:haul0075];
    
    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(1430, 1655);
    drawArc0025.startRadians = M_PI / 1.0484;
    drawArc0025.endRadians = M_PI / 0.937;
    drawArc0025.radius = 622;
    drawArc0025.width = 14.5;
    drawArc0025.color = line0005.color;
    [haul0075.drawPrimitives addObject:drawArc0025];
    
    // Добавляем станцию "Краснопресненская"
    MWStation *station0080 = [[MWStation alloc] init];
    station0080.identifier = @"station0080";
    [edge0028.elements addObject:station0080];
    
    station0080.nameOriginal = @"Краснопресненская";
    station0080.nameEnglish = @"Krasnopresnenskaya";
    station0080.mapLocation = CGPointMake(821.5, 1525.5);
    station0080.geoLocation = CGPointMake(55.760325, 37.577226);
    
    MWDrawTextLine *drawTextLine0161 = [[MWDrawTextLine alloc] init];
    drawTextLine0161.text = station0080.nameOriginal;
    drawTextLine0161.fontName = @"HelveticaNeue";
    drawTextLine0161.fontColor = [UIColor blackColor];
    drawTextLine0161.fontSize = 32;
    drawTextLine0161.origin = CGPointMake(847, 1513);
    [station0080.nameOriginalTextPrimitives addObject:drawTextLine0161];
    
    MWDrawTextLine *drawTextLine0162 = [[MWDrawTextLine alloc] init];
    drawTextLine0162.text = station0080.nameEnglish;
    drawTextLine0162.fontName = @"HelveticaNeue";
    drawTextLine0162.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0162.fontSize = 18;
    drawTextLine0162.origin = CGPointMake(843, 1548);
    [station0080.nameEnglishTextPrimitives addObject:drawTextLine0162];
    
    MWDrawFillCircle *fillCircle0071 = [[MWDrawFillCircle alloc] init];
    fillCircle0071.center = CGPointMake(821.5, 1525.5);
    fillCircle0071.radius = 4;
    fillCircle0071.fillColor = [UIColor whiteColor];
    [station0080.drawPrimitives addObject:fillCircle0071];

    // Добавляем вершину
    edge0028.finishVertex = vertex0025;
    
    // Создаем участок линии от "Краснопресненская" до "Белорусская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0029 = [[MWEdge alloc] init];
    edge0029.identifier = @"edge0029";
    edge0029.developmentName = @"Ребро: Краснопресненская - Белорусская";
    [self.edges addObject:edge0029];
    
    // Добавляем линию
    edge0029.line = line0005;

    // Добавляем вершину
    edge0029.startVertex = vertex0025;
    
    // Добавляем станцию "Краснопресненская"
    [edge0029.elements addObject:station0080];
    
    // Добавляем перегон
    MWHaul *haul0076 = [[MWHaul alloc] init];
    haul0076.identifier = @"haul0076";
    haul0076.length = 2080;
    [edge0029.elements addObject:haul0076];
    
    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(1430, 1655);
    drawArc0026.startRadians = 191 * M_PI / 180;
    drawArc0026.endRadians = M_PI / 0.8434;
    drawArc0026.radius = 622;
    drawArc0026.width = 14.5;
    drawArc0026.color = line0005.color;
    [haul0076.drawPrimitives addObject:drawArc0026];
    
    // Добавляем станцию "Белорусская"
    MWStation *station0081 = [[MWStation alloc] init];
    station0081.identifier = @"station0081";
    [edge0029.elements addObject:station0081];
    
    station0081.nameOriginal = @"Белорусская";
    station0081.nameEnglish = @"Belorusskaya";
    station0081.mapLocation = CGPointMake(907.5, 1317.5);
    station0081.geoLocation = CGPointMake(55.777091, 37.581847);
    
    [station0081.nameOriginalTextPrimitives addObject:drawTextLine0074];
    [station0081.nameEnglishTextPrimitives addObject:drawTextLine0075];
    station0081.showNameOnMap = false;
    
    MWDrawFillCircle *fillCircle0072 = [[MWDrawFillCircle alloc] init];
    fillCircle0072.center = CGPointMake(907.5, 1317.5);
    fillCircle0072.radius = 4;
    fillCircle0072.fillColor = [UIColor whiteColor];
    [station0081.drawPrimitives addObject:fillCircle0072];

    // Добавляем вершину
    edge0029.finishVertex = vertex0015;
    
    // Создаем участок линии от "Белорусская" до "Новослободская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0030 = [[MWEdge alloc] init];
    edge0030.identifier = @"edge0030";
    edge0030.developmentName = @"Ребро: Белорусская - Новослободская";
    [self.edges addObject:edge0030];
    
    // Добавляем линию
    edge0030.line = line0005;

    // Добавляем вершину
    edge0030.startVertex = vertex0015;
    
    // Добавляем станцию "Белорусская"
    [edge0030.elements addObject:station0081];
    
    // Добавляем перегон
    MWHaul *haul0077 = [[MWHaul alloc] init];
    haul0077.identifier = @"haul0077";
    haul0077.length = 1020;
    [edge0030.elements addObject:haul0077];

    MWDrawArc *drawArc0027 = [[MWDrawArc alloc] init];
    drawArc0027.center = CGPointMake(1430, 1655);
    drawArc0027.startRadians = M_PI / 0.8436;
    drawArc0027.endRadians = M_PI / 0.755;
    drawArc0027.radius = 622;
    drawArc0027.width = 14.5;
    drawArc0027.color = line0005.color;
    [haul0077.drawPrimitives addObject:drawArc0027];
    
    // Добавляем станцию "Новослободская"
    MWStation *station0082 = [[MWStation alloc] init];
    station0082.identifier = @"station0082";
    [edge0030.elements addObject:station0082];
    
    station0082.nameOriginal = @"Новослободская";
    station0082.nameEnglish = @"Novoslobodskaya";
    station0082.mapLocation = CGPointMake(1101.5, 1127);
    station0082.geoLocation = CGPointMake(55.779515, 37.601061);

    // Подложка под текст
    MWDrawLine *drawLine0361 = [[MWDrawLine alloc] init];
    drawLine0361.startPoint = CGPointMake(1187, 1165);
    drawLine0361.endPoint = CGPointMake(1237, 1165);
    drawLine0361.width = 22;
    drawLine0361.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0082.nameOriginalTextPrimitives addObject:drawLine0361];

    MWDrawTextLine *drawTextLine0163 = [[MWDrawTextLine alloc] init];
    drawTextLine0163.text = station0082.nameOriginal;
    drawTextLine0163.fontName = @"HelveticaNeue";
    drawTextLine0163.fontColor = [UIColor blackColor];
    drawTextLine0163.fontSize = 32;
    drawTextLine0163.origin = CGPointMake(1087, 1143);
    [station0082.nameOriginalTextPrimitives addObject:drawTextLine0163];

    MWDrawTextLine *drawTextLine0164 = [[MWDrawTextLine alloc] init];
    drawTextLine0164.text = station0082.nameEnglish;
    drawTextLine0164.fontName = @"HelveticaNeue";
    drawTextLine0164.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0164.fontSize = 18;
    drawTextLine0164.origin = CGPointMake(1075, 1178);
    [station0082.nameEnglishTextPrimitives addObject:drawTextLine0164];
    
    MWDrawFillCircle *fillCircle0073 = [[MWDrawFillCircle alloc] init];
    fillCircle0073.center = CGPointMake(1101.5, 1127);
    fillCircle0073.radius = 4;
    fillCircle0073.fillColor = [UIColor whiteColor];
    [station0082.drawPrimitives addObject:fillCircle0073];

    // Добавляем вершину
    edge0030.finishVertex = vertex0026;
    
    // Создаем участок линии от "Новослободская" до "Проспект Мира"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0031 = [[MWEdge alloc] init];
    edge0031.identifier = @"edge0031";
    edge0031.developmentName = @"Ребро: Новослободская - Проспект Мира";
    [self.edges addObject:edge0031];
    
    // Добавляем линию
    edge0031.line = line0005;
    
    // Добавляем вершину
    edge0031.startVertex = vertex0026;

    // Добавляем станцию "Новослободская"
    [edge0031.elements addObject:station0082];
    
    // Добавляем перегон
    MWHaul *haul0078 = [[MWHaul alloc] init];
    haul0078.identifier = @"haul0078";
    haul0078.length = 2020;
    [edge0031.elements addObject:haul0078];
    
    MWDrawArc *drawArc0028 = [[MWDrawArc alloc] init];
    drawArc0028.center = CGPointMake(1430, 1655);
    drawArc0028.startRadians = M_PI / 0.7554;
    drawArc0028.endRadians = M_PI / 0.6194;
    drawArc0028.radius = 622;
    drawArc0028.width = 14.5;
    drawArc0028.color = line0005.color;
    [haul0078.drawPrimitives addObject:drawArc0028];
    
    // Добавляем станцию "Проспект Мира"
    MWStation *station0083 = [[MWStation alloc] init];
    station0083.identifier = @"station0083";
    [edge0031.elements addObject:station0083];
    
    station0083.nameOriginal = @"Проспект Мира";
    station0083.nameEnglish = @"Prospekt Mira";
    station0083.mapLocation = CGPointMake(1648.5, 1072.5);
    station0083.geoLocation = CGPointMake(55.779651, 37.633617);
    
    MWDrawTextLine *drawTextLine0165 = [[MWDrawTextLine alloc] init];
    drawTextLine0165.text = station0083.nameOriginal;
    drawTextLine0165.fontName = @"HelveticaNeue";
    drawTextLine0165.fontColor = [UIColor blackColor];
    drawTextLine0165.fontSize = 32;
    drawTextLine0165.origin = CGPointMake(1668, 1028);
    [station0083.nameOriginalTextPrimitives addObject:drawTextLine0165];
    
    MWDrawTextLine *drawTextLine0166 = [[MWDrawTextLine alloc] init];
    drawTextLine0166.text = station0083.nameEnglish;
    drawTextLine0166.fontName = @"HelveticaNeue";
    drawTextLine0166.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0166.fontSize = 18;
    drawTextLine0166.origin = CGPointMake(1673, 1012);
    [station0083.nameEnglishTextPrimitives addObject:drawTextLine0166];
    
    MWDrawFillCircle *fillCircle0074 = [[MWDrawFillCircle alloc] init];
    fillCircle0074.center = CGPointMake(1648.5, 1072.5);
    fillCircle0074.radius = 4;
    fillCircle0074.fillColor = [UIColor whiteColor];
    [station0083.drawPrimitives addObject:fillCircle0074];
    
    // Добавляем вершину
    edge0031.finishVertex = vertex0027;
    
    // Создаем участок линии от "Проспект Мира" до "Комсомольская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0032 = [[MWEdge alloc] init];
    edge0032.identifier = @"edge0032";
    edge0032.developmentName = @"Ребро: Проспект Мира - Комсомольская";
    [self.edges addObject:edge0032];
    
    // Добавляем линию
    edge0032.line = line0005;

    // Добавляем вершину
    edge0032.startVertex = vertex0027;
    
    // Добавляем станцию "Проспект Мира"
    [edge0032.elements addObject:station0083];
    
    // Добавляем перегон
    MWHaul *haul0079 = [[MWHaul alloc] init];
    haul0079.identifier = @"haul0079";
    haul0079.length = 1470;
    [edge0032.elements addObject:haul0079];
    
    MWDrawArc *drawArc0029 = [[MWDrawArc alloc] init];
    drawArc0029.center = CGPointMake(1430, 1655);
    drawArc0029.startRadians = M_PI / 0.6198;
    drawArc0029.endRadians = M_PI / 0.5586;
    drawArc0029.radius = 622;
    drawArc0029.width = 14.5;
    drawArc0029.color = line0005.color;
    [haul0079.drawPrimitives addObject:drawArc0029];
    
    // Добавляем станцию "Комсомольская"
    MWStation *station0084 = [[MWStation alloc] init];
    station0084.identifier = @"station0084";
    [edge0032.elements addObject:station0084];
    
    station0084.nameOriginal = @"Комсомольская";
    station0084.nameEnglish = @"Komsomolskaya";
    station0084.mapLocation = CGPointMake(1920.5, 1272.5);
    station0084.geoLocation = CGPointMake(55.776240, 37.655872);

    [station0084.nameOriginalTextPrimitives addObject:drawTextLine0031];
    [station0084.nameEnglishTextPrimitives addObject:drawTextLine0032];
    station0084.showNameOnMap = false;
    
    MWDrawFillCircle *fillCircle0075 = [[MWDrawFillCircle alloc] init];
    fillCircle0075.center = CGPointMake(1920.5, 1272.5);
    fillCircle0075.radius = 4;
    fillCircle0075.fillColor = [UIColor whiteColor];
    [station0084.drawPrimitives addObject:fillCircle0075];

    // Добавляем вершину
    edge0032.finishVertex = vertex0007;
    
    // Создаем участок линии от "Комсомольская" до "Курская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0033 = [[MWEdge alloc] init];
    edge0033.identifier = @"edge0033";
    edge0033.developmentName = @"Ребро: Комсомольская - Курская";
    [self.edges addObject:edge0033];
    
    // Добавляем линию
    edge0033.line = line0005;

    // Добавляем вершину
    edge0033.startVertex = vertex0007;
    
    // Добавляем станцию "Комсомольская"
    [edge0033.elements addObject:station0084];
    
    // Добавляем перегон
    MWHaul *haul0080 = [[MWHaul alloc] init];
    haul0080.identifier = @"haul0080";
    haul0080.length = 1990;
    [edge0033.elements addObject:haul0080];
    
    MWDrawArc *drawArc0030 = [[MWDrawArc alloc] init];
    drawArc0030.center = CGPointMake(1430, 1655);
    drawArc0030.startRadians = M_PI / 0.5590;
    drawArc0030.endRadians = M_PI / 0.5135;
    drawArc0030.radius = 622;
    drawArc0030.width = 14.5;
    drawArc0030.color = line0005.color;
    [haul0080.drawPrimitives addObject:drawArc0030];
    
    // Добавляем станцию "Курская"
    MWStation *station0085 = [[MWStation alloc] init];
    station0085.identifier = @"station0085";
    [edge0033.elements addObject:station0085];
    
    station0085.nameOriginal = @"Курская";
    station0085.nameEnglish = @"Kurskaya";
    station0085.mapLocation = CGPointMake(2043, 1551.5);
    station0085.geoLocation = CGPointMake(55.758727, 37.659575);
    
    [station0085.nameOriginalTextPrimitives addObject:drawTextLine0119];
    [station0085.nameEnglishTextPrimitives addObject:drawTextLine0120];
    station0085.showNameOnMap = false;
    
    MWDrawFillCircle *fillCircle0076 = [[MWDrawFillCircle alloc] init];
    fillCircle0076.center = CGPointMake(2043, 1551.5);
    fillCircle0076.radius = 4;
    fillCircle0076.fillColor = [UIColor whiteColor];
    [station0085.drawPrimitives addObject:fillCircle0076];

    // Добавляем вершину
    edge0033.finishVertex = vertex0020;
    
    // Создаем участок линии от "Курская" до "Таганская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0034 = [[MWEdge alloc] init];
    edge0034.identifier = @"edge0034";
    edge0034.developmentName = @"Ребро: Курская - Таганская";
    [self.edges addObject:edge0034];
    
    // Добавляем линию
    edge0034.line = line0005;

    // Добавляем вершину
    edge0034.startVertex = vertex0020;
    
    // Добавляем станцию "Курская"
    [edge0034.elements addObject:station0085];
    
    // Добавляем перегон
    MWHaul *haul0081 = [[MWHaul alloc] init];
    haul0081.identifier = @"haul0081";
    haul0081.length = 1850;
    [edge0034.elements addObject:haul0081];

    MWDrawArc *drawArc0031 = [[MWDrawArc alloc] init];
    drawArc0031.center = CGPointMake(1430, 1655);
    drawArc0031.startRadians =  M_PI / 0.5136;
    drawArc0031.endRadians = M_PI / 0.4642;
    drawArc0031.radius = 622;
    drawArc0031.width = 14.5;
    drawArc0031.color = line0005.color;
    [haul0081.drawPrimitives addObject:drawArc0031];
    
    // Добавляем станцию "Таганская"
    MWStation *station0086 = [[MWStation alloc] init];
    station0086.identifier = @"station0086";
    [edge0034.elements addObject:station0086];
    
    station0086.nameOriginal = @"Таганская";
    station0086.nameEnglish = @"Taganskaya";
    station0086.mapLocation = CGPointMake(1984, 1938);
    station0086.geoLocation = CGPointMake(55.739458, 37.653242);
    
    MWDrawTextLine *drawTextLine0167 = [[MWDrawTextLine alloc] init];
    drawTextLine0167.text = station0086.nameOriginal;
    drawTextLine0167.fontName = @"HelveticaNeue";
    drawTextLine0167.fontColor = [UIColor blackColor];
    drawTextLine0167.fontSize = 32;
    drawTextLine0167.origin = CGPointMake(1832, 1879);
    [station0086.nameOriginalTextPrimitives addObject:drawTextLine0167];
    
    MWDrawTextLine *drawTextLine0168 = [[MWDrawTextLine alloc] init];
    drawTextLine0168.text = station0086.nameEnglish;
    drawTextLine0168.fontName = @"HelveticaNeue";
    drawTextLine0168.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0168.fontSize = 18;
    drawTextLine0168.origin = CGPointMake(1852, 1863);
    [station0086.nameEnglishTextPrimitives addObject:drawTextLine0168];
    
    MWDrawFillCircle *fillCircle0077 = [[MWDrawFillCircle alloc] init];
    fillCircle0077.center = CGPointMake(1984, 1938);
    fillCircle0077.radius = 4;
    fillCircle0077.fillColor = [UIColor whiteColor];
    [station0086.drawPrimitives addObject:fillCircle0077];

    // Добавляем вершину
    edge0034.finishVertex = vertex0028;
    
    // Создаем участок линии от "Таганская" до "Павелецкая"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0035 = [[MWEdge alloc] init];
    edge0035.identifier = @"edge0035";
    edge0035.developmentName = @"Ребро: Таганская - Павелецкая";
    [self.edges addObject:edge0035];
    
    // Добавляем линию
    edge0035.line = line0005;

    // Добавляем вершину
    edge0035.startVertex = vertex0028;
    
    // Добавляем станцию "Таганская"
    [edge0035.elements addObject:station0086];
    
    // Добавляем перегон
    MWHaul *haul0082 = [[MWHaul alloc] init];
    haul0082.identifier = @"haul0082";
    haul0082.length = 1620;
    [edge0035.elements addObject:haul0082];
    
    MWDrawArc *drawArc0032 = [[MWDrawArc alloc] init];
    drawArc0032.center = CGPointMake(1430, 1655);
    drawArc0032.startRadians = M_PI / 0.4646;
    drawArc0032.endRadians = M_PI / 0.4279;
    drawArc0032.radius = 622;
    drawArc0032.width = 14.5;
    drawArc0032.color = line0005.color;
    [haul0082.drawPrimitives addObject:drawArc0032];
    
    // Добавляем станцию "Павелецкая"
    MWStation *station0087 = [[MWStation alloc] init];
    station0087.identifier = @"station0087";
    [edge0035.elements addObject:station0087];
    
    station0087.nameOriginal = @"Павелецкая";
    station0087.nameEnglish = @"Paveletskaya";
    station0087.mapLocation = CGPointMake(1734.5, 2197.5);
    station0087.geoLocation = CGPointMake(55.731267, 37.636262);
    
    [station0087.nameOriginalTextPrimitives addObject:drawTextLine0064];
    [station0087.nameOriginalTextPrimitives addObject:drawTextLine0065];
    station0087.showNameOnMap = false;
    
    MWDrawFillCircle *fillCircle0078 = [[MWDrawFillCircle alloc] init];
    fillCircle0078.center = CGPointMake(1734.5, 2197.5);
    fillCircle0078.radius = 4;
    fillCircle0078.fillColor = [UIColor whiteColor];
    [station0087.drawPrimitives addObject:fillCircle0078];

    // Добавляем вершину
    edge0035.finishVertex = vertex0012;
    
    // Создаем участок линии от "Павелецкой" до "Добрынинской"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0036 = [[MWEdge alloc] init];
    edge0036.identifier = @"edge0036";
    edge0036.developmentName = @"Ребро: Павелецкая - Добрынинская";
    [self.edges addObject:edge0036];
    
    // Добавляем линию
    edge0036.line = line0005;

    // Добавляем вершину
    edge0036.startVertex = vertex0012;
    
    // Добавляем станцию "Павелецкая"
    [edge0036.elements addObject:station0087];
    
    // Добавляем перегон
    MWHaul *haul0083 = [[MWHaul alloc] init];
    haul0083.identifier = @"haul0083";
    haul0083.length = 914;
    [edge0036.elements addObject:haul0083];
    
    MWDrawArc *drawArc0033 = [[MWDrawArc alloc] init];
    drawArc0033.center = CGPointMake(1430, 1655);
    drawArc0033.startRadians = M_PI / 0.4287;
    drawArc0033.endRadians = M_PI / 1.7438;
    drawArc0033.radius = 622;
    drawArc0033.width = 14.5;
    drawArc0033.color = line0005.color;
    [haul0083.drawPrimitives addObject:drawArc0033];
    
    // Добавляем станцию "Добрынинская"
    [edge0036.elements addObject:station0076];
    
    // Добавляем вершину
    edge0036.finishVertex = vertex0023;
    
    ////////////////////////////////////////////////////////////////
    // 6 - Калужско-рижская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Новоясеневская" до "Октябрьская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0037 = [[MWEdge alloc] init];
    edge0037.identifier = @"edge0037";
    edge0037.developmentName = @"Ребро: Новоясеневская - Октябрьская";
    [self.edges addObject:edge0037];
    
    // Добавляем линию
    edge0037.line = line0006;

    // Добавляем вершину
    edge0037.startVertex = vertex0029;
    
    // Добавляем станцию "Новоясеневская"
    MWStation *station0088 = [[MWStation alloc] init];
    station0088.identifier = @"station0088";
    [edge0037.elements addObject:station0088];

    station0088.nameOriginal = @"Новоясеневская";
    station0088.nameEnglish = @"Novoyasenevskaya";
    station0088.mapLocation = CGPointMake(1013.5, 3034.5);
    station0088.geoLocation = CGPointMake(55.601916, 37.552814);
    
    MWDrawArc *drawArc0034 = [[MWDrawArc alloc] init];
    drawArc0034.center = CGPointMake(1013.5, 3034.5);
    drawArc0034.startRadians = M_PI * 2;
    drawArc0034.endRadians = 0;
    drawArc0034.radius = 14;
    drawArc0034.width = 10;
    drawArc0034.color = line0006.color;
    [station0088.drawPrimitives addObject:drawArc0034];
    
    MWDrawTextLine *drawTextLine0169 = [[MWDrawTextLine alloc] init];
    drawTextLine0169.text = station0088.nameOriginal;
    drawTextLine0169.fontName = @"HelveticaNeue";
    drawTextLine0169.fontColor = [UIColor blackColor];
    drawTextLine0169.fontSize = 32;
    drawTextLine0169.origin = CGPointMake(1004, 2975);
    [station0088.nameOriginalTextPrimitives addObject:drawTextLine0169];
    
    MWDrawTextLine *drawTextLine0170 = [[MWDrawTextLine alloc] init];
    drawTextLine0170.text = station0088.nameEnglish;
    drawTextLine0170.fontName = @"HelveticaNeue";
    drawTextLine0170.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0170.fontSize = 18;
    drawTextLine0170.origin = CGPointMake(1000, 2961);
    [station0088.nameEnglishTextPrimitives addObject:drawTextLine0170];
    
    // Добавляем перегон
    MWHaul *haul0084 = [[MWHaul alloc] init];
    haul0084.identifier = @"haul0084";
    haul0084.length = 1390;
    [edge0037.elements addObject:haul0084];
    
    MWDrawLine *drawLine0145 = [[MWDrawLine alloc] init];
    drawLine0145.startPoint = CGPointMake(1003.5, 3024.5);
    drawLine0145.endPoint = CGPointMake(984.1, 3005.1);
    drawLine0145.width = 14.5;
    drawLine0145.color = line0006.color;
    [haul0084.drawPrimitives addObject:drawLine0145];
    
    MWDrawArc *drawArc0035 = [[MWDrawArc alloc] init];
    drawArc0035.center = CGPointMake(1016.5, 2973.7);
    drawArc0035.startRadians = 135  * M_PI / 180;
    drawArc0035.endRadians = 180 * M_PI / 180;
    drawArc0035.radius = 45;
    drawArc0035.width = 14.5;
    drawArc0035.color = line0006.color;
    [haul0084.drawPrimitives addObject:drawArc0035];

    MWDrawLine *drawLine0146 = [[MWDrawLine alloc] init];
    drawLine0146.startPoint = CGPointMake(971.5, 2974);
    drawLine0146.endPoint = CGPointMake(971.5, 2930.5);
    drawLine0146.width = 14.5;
    drawLine0146.color = line0006.color;
    [haul0084.drawPrimitives addObject:drawLine0146];
    
    // Добавляем станцию "Ясенево"
    MWStation *station0089 = [[MWStation alloc] init];
    station0089.identifier = @"station0089";
    [edge0037.elements addObject:station0089];

    station0089.nameOriginal = @"Ясенево";
    station0089.nameEnglish = @"Yasenevo";
    station0089.mapLocation = CGPointMake(971.5, 2930.5);
    station0089.geoLocation = CGPointMake(55.606166, 37.533609);

    MWDrawLine *drawLine0147 = [[MWDrawLine alloc] init];
    drawLine0147.startPoint = CGPointMake(971.5, 2930.5);
    drawLine0147.endPoint = CGPointMake(991.5, 2930.5);
    drawLine0147.width = 12;
    drawLine0147.color = line0006.color;
    [station0089.drawPrimitives addObject:drawLine0147];
    
    MWDrawTextLine *drawTextLine0171 = [[MWDrawTextLine alloc] init];
    drawTextLine0171.text = station0089.nameOriginal;
    drawTextLine0171.fontName = @"HelveticaNeue";
    drawTextLine0171.fontColor = [UIColor blackColor];
    drawTextLine0171.fontSize = 32;
    drawTextLine0171.origin = CGPointMake(1000, 2906);
    [station0089.nameOriginalTextPrimitives addObject:drawTextLine0171];
    
    MWDrawTextLine *drawTextLine0172 = [[MWDrawTextLine alloc] init];
    drawTextLine0172.text = station0089.nameEnglish;
    drawTextLine0172.fontName = @"HelveticaNeue";
    drawTextLine0172.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0172.fontSize = 18;
    drawTextLine0172.origin = CGPointMake(996, 2938);
    [station0089.nameEnglishTextPrimitives addObject:drawTextLine0172];
    
    // Добавляем перегон
    MWHaul *haul0085 = [[MWHaul alloc] init];
    haul0085.identifier = @"haul0085";
    haul0085.length = 2600;
    [edge0037.elements addObject:haul0085];
    
    MWDrawLine *drawLine0148 = [[MWDrawLine alloc] init];
    drawLine0148.startPoint = CGPointMake(971.5, 2931);
    drawLine0148.endPoint = CGPointMake(971.5, 2867.5);
    drawLine0148.width = 14.5;
    drawLine0148.color = line0006.color;
    [haul0085.drawPrimitives addObject:drawLine0148];
    
    // Добавляем станцию "Теплый Стан"
    MWStation *station0090 = [[MWStation alloc] init];
    station0090.identifier = @"station0090";
    [edge0037.elements addObject:station0090];
 
    station0090.nameOriginal = @"Тёплый Стан";
    station0090.nameEnglish = @"Tyoply Stan";
    station0090.mapLocation = CGPointMake(971.5, 2867.5);
    station0090.geoLocation = CGPointMake(55.618529, 37.507384);
    
    MWDrawLine *drawLine0149 = [[MWDrawLine alloc] init];
    drawLine0149.startPoint = CGPointMake(971.5, 2867.5);
    drawLine0149.endPoint = CGPointMake(991.5, 2867.5);
    drawLine0149.width = 12;
    drawLine0149.color = line0006.color;
    [station0090.drawPrimitives addObject:drawLine0149];
    
    MWDrawTextLine *drawTextLine0173 = [[MWDrawTextLine alloc] init];
    drawTextLine0173.text = station0090.nameOriginal;
    drawTextLine0173.fontName = @"HelveticaNeue";
    drawTextLine0173.fontColor = [UIColor blackColor];
    drawTextLine0173.fontSize = 32;
    drawTextLine0173.origin = CGPointMake(998, 2843.5);
    [station0090.nameOriginalTextPrimitives addObject:drawTextLine0173];

    MWDrawTextLine *drawTextLine0174 = [[MWDrawTextLine alloc] init];
    drawTextLine0174.text = station0090.nameEnglish;
    drawTextLine0174.fontName = @"HelveticaNeue";
    drawTextLine0174.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0174.fontSize = 18;
    drawTextLine0174.origin = CGPointMake(996, 2878);
    [station0090.nameEnglishTextPrimitives addObject:drawTextLine0174];
    
    // Добавляем перегон
    MWHaul *haul0086 = [[MWHaul alloc] init];
    haul0086.identifier = @"haul0086";
    haul0086.length = 1900;
    [edge0037.elements addObject:haul0086];
    
    MWDrawLine *drawLine0150 = [[MWDrawLine alloc] init];
    drawLine0150.startPoint = CGPointMake(971.5, 2868);
    drawLine0150.endPoint = CGPointMake(971.5, 2804.5);
    drawLine0150.width = 14.5;
    drawLine0150.color = line0006.color;
    [haul0086.drawPrimitives addObject:drawLine0150];
    
    // Добавляем станцию "Коньково"
    MWStation *station0091 = [[MWStation alloc] init];
    station0091.identifier = @"station0091";
    [edge0037.elements addObject:station0091];

    station0091.nameOriginal = @"Коньково";
    station0091.nameEnglish = @"Konkovo";
    station0091.mapLocation = CGPointMake(971.5, 2804.5);
    station0091.geoLocation = CGPointMake(55.633311, 37.519266);

    MWDrawLine *drawLine0151 = [[MWDrawLine alloc] init];
    drawLine0151.startPoint = CGPointMake(971.5, 2804.5);
    drawLine0151.endPoint = CGPointMake(991.5, 2804.5);
    drawLine0151.width = 12;
    drawLine0151.color = line0006.color;
    [station0091.drawPrimitives addObject:drawLine0151];
    
    MWDrawTextLine *drawTextLine0175 = [[MWDrawTextLine alloc] init];
    drawTextLine0175.text = station0091.nameOriginal;
    drawTextLine0175.fontName = @"HelveticaNeue";
    drawTextLine0175.fontColor = [UIColor blackColor];
    drawTextLine0175.fontSize = 32;
    drawTextLine0175.origin = CGPointMake(999, 2780.5);
    [station0091.nameOriginalTextPrimitives addObject:drawTextLine0175];
    
    MWDrawTextLine *drawTextLine0176 = [[MWDrawTextLine alloc] init];
    drawTextLine0176.text = station0091.nameEnglish;
    drawTextLine0176.fontName = @"HelveticaNeue";
    drawTextLine0176.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0176.fontSize = 18;
    drawTextLine0176.origin = CGPointMake(996, 2815);
    [station0091.nameEnglishTextPrimitives addObject:drawTextLine0176];
    
    // Добавляем перегон
    MWHaul *haul0087 = [[MWHaul alloc] init];
    haul0087.identifier = @"haul0087";
    haul0087.length = 1040;
    [edge0037.elements addObject:haul0087];
    
    MWDrawLine *drawLine0152 = [[MWDrawLine alloc] init];
    drawLine0152.startPoint = CGPointMake(971.5, 2741.5);
    drawLine0152.endPoint = CGPointMake(971.5, 2805);
    drawLine0152.width = 14.5;
    drawLine0152.color = line0006.color;
    [haul0087.drawPrimitives addObject:drawLine0152];
    
    // Добавляем станцию "Беляево"
    MWStation *station0092 = [[MWStation alloc] init];
    station0092.identifier = @"station0092";
    [edge0037.elements addObject:station0092];

    station0092.nameOriginal = @"Беляево";
    station0092.nameEnglish = @"Belyaevo";
    station0092.mapLocation = CGPointMake(971.5, 2741.5);
    station0092.geoLocation = CGPointMake(55.642667, 37.526563);
    
    MWDrawLine *drawLine0153 = [[MWDrawLine alloc] init];
    drawLine0153.startPoint = CGPointMake(971.5, 2741.5);
    drawLine0153.endPoint = CGPointMake(991.5, 2741.5);
    drawLine0153.width = 12;
    drawLine0153.color = line0006.color;
    [station0092.drawPrimitives addObject:drawLine0153];

    MWDrawTextLine *drawTextLine0177 = [[MWDrawTextLine alloc] init];
    drawTextLine0177.text = station0092.nameOriginal;
    drawTextLine0177.fontName = @"HelveticaNeue";
    drawTextLine0177.fontColor = [UIColor blackColor];
    drawTextLine0177.fontSize = 32;
    drawTextLine0177.origin = CGPointMake(999, 2717.5);
    [station0092.nameOriginalTextPrimitives addObject:drawTextLine0177];
    
    MWDrawTextLine *drawTextLine0178 = [[MWDrawTextLine alloc] init];
    drawTextLine0178.text = station0092.nameEnglish;
    drawTextLine0178.fontName = @"HelveticaNeue";
    drawTextLine0178.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0178.fontSize = 18;
    drawTextLine0178.origin = CGPointMake(996, 2752.5);
    [station0092.nameEnglishTextPrimitives addObject:drawTextLine0178];
    
    // Добавляем перегон
    MWHaul *haul0088 = [[MWHaul alloc] init];
    haul0088.identifier = @"haul0088";
    haul0088.length = 1820;
    [edge0037.elements addObject:haul0088];

    MWDrawLine *drawLine0154 = [[MWDrawLine alloc] init];
    drawLine0154.startPoint = CGPointMake(971.5, 2742);
    drawLine0154.endPoint = CGPointMake(971.5, 2678.5);
    drawLine0154.width = 14.5;
    drawLine0154.color = line0006.color;
    [haul0088.drawPrimitives addObject:drawLine0154];

    // Добавляем станцию "Калужская"
    MWStation *station0093 = [[MWStation alloc] init];
    station0093.identifier = @"station0093";
    [edge0037.elements addObject:station0093];

    station0093.nameOriginal = @"Калужская";
    station0093.nameEnglish = @"Kaluzhskaya";
    station0093.mapLocation = CGPointMake(971.5, 2678.5);
    station0093.geoLocation = CGPointMake(55.657135,  37.540428);

    MWDrawLine *drawLine0155 = [[MWDrawLine alloc] init];
    drawLine0155.startPoint = CGPointMake(971.5, 2678.5);
    drawLine0155.endPoint = CGPointMake(991.5, 2678.5);
    drawLine0155.width = 12;
    drawLine0155.color = line0006.color;
    [station0093.drawPrimitives addObject:drawLine0155];

    MWDrawTextLine *drawTextLine0179 = [[MWDrawTextLine alloc] init];
    drawTextLine0179.text = station0093.nameOriginal;
    drawTextLine0179.fontName = @"HelveticaNeue";
    drawTextLine0179.fontColor = [UIColor blackColor];
    drawTextLine0179.fontSize = 32;
    drawTextLine0179.origin = CGPointMake(999, 2654.5);
    [station0093.nameOriginalTextPrimitives addObject:drawTextLine0179];

    MWDrawTextLine *drawTextLine0180 = [[MWDrawTextLine alloc] init];
    drawTextLine0180.text = station0093.nameEnglish;
    drawTextLine0180.fontName = @"HelveticaNeue";
    drawTextLine0180.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0180.fontSize = 18;
    drawTextLine0180.origin = CGPointMake(996, 2689.5);
    [station0093.nameEnglishTextPrimitives addObject:drawTextLine0180];
    
    // Добавляем перегон
    MWHaul *haul0089 = [[MWHaul alloc] init];
    haul0089.identifier = @"haul0089";
    haul0089.length = 1750;
    [edge0037.elements addObject:haul0089];
    
    MWDrawLine *drawLine0156 = [[MWDrawLine alloc] init];
    drawLine0156.startPoint = CGPointMake(971.5, 2679);
    drawLine0156.endPoint = CGPointMake(971.5, 2615.5);
    drawLine0156.width = 14.5;
    drawLine0156.color = line0006.color;
    [haul0089.drawPrimitives addObject:drawLine0156];
    
    // Добавляем станцию "Новые Черемушки"
    MWStation *station0094 = [[MWStation alloc] init];
    station0094.identifier = @"station0094";
    [edge0037.elements addObject:station0094];
    
    station0094.nameOriginal = @"Новые Черёмушки";
    station0094.nameEnglish = @"Novye Cheryomushki";
    station0094.mapLocation = CGPointMake(971.5, 2615.5);
    station0094.geoLocation = CGPointMake(55.670382, 37.554717);
    
    MWDrawLine *drawLine0157 = [[MWDrawLine alloc] init];
    drawLine0157.startPoint = CGPointMake(971.5, 2615.5);
    drawLine0157.endPoint = CGPointMake(991.5, 2615.5);
    drawLine0157.width = 12;
    drawLine0157.color = line0006.color;
    [station0094.drawPrimitives addObject:drawLine0157];

    MWDrawTextLine *drawTextLine0181 = [[MWDrawTextLine alloc] init];
    drawTextLine0181.text = station0094.nameOriginal;
    drawTextLine0181.fontName = @"HelveticaNeue";
    drawTextLine0181.fontColor = [UIColor blackColor];
    drawTextLine0181.fontSize = 32;
    drawTextLine0181.origin = CGPointMake(999, 2591.5);
    [station0094.nameOriginalTextPrimitives addObject:drawTextLine0181];

    MWDrawTextLine *drawTextLine0182 = [[MWDrawTextLine alloc] init];
    drawTextLine0182.text = station0094.nameEnglish;
    drawTextLine0182.fontName = @"HelveticaNeue";
    drawTextLine0182.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0182.fontSize = 18;
    drawTextLine0182.origin = CGPointMake(996, 2626.5);
    [station0094.nameEnglishTextPrimitives addObject:drawTextLine0182];
    
    // Добавляем перегон
    MWHaul *haul0090 = [[MWHaul alloc] init];
    haul0090.identifier = @"haul0090";
    haul0090.length = 981;
    [edge0037.elements addObject:haul0090];
    
    MWDrawLine *drawLine0158 = [[MWDrawLine alloc] init];
    drawLine0158.startPoint = CGPointMake(971.5, 2616);
    drawLine0158.endPoint = CGPointMake(971.5, 2552.5);
    drawLine0158.width = 14.5;
    drawLine0158.color = line0006.color;
    [haul0090.drawPrimitives addObject:drawLine0158];
    
    // Добавляем станцию "Профсоюзная"
    MWStation *station0095 = [[MWStation alloc] init];
    station0095.identifier = @"station0095";
    [edge0037.elements addObject:station0095];

    station0095.nameOriginal = @"Профсоюзная";
    station0095.nameEnglish = @"Profsoyuznaya";
    station0095.mapLocation = CGPointMake(971.5, 2552.5);
    station0095.geoLocation = CGPointMake(55.677985, 37.562870);
    
    MWDrawLine *drawLine0159 = [[MWDrawLine alloc] init];
    drawLine0159.startPoint = CGPointMake(971.5, 2552.5);
    drawLine0159.endPoint = CGPointMake(991.5, 2552.5);
    drawLine0159.width = 12;
    drawLine0159.color = line0006.color;
    [station0095.drawPrimitives addObject:drawLine0159];
    
    MWDrawTextLine *drawTextLine0183 = [[MWDrawTextLine alloc] init];
    drawTextLine0183.text = station0095.nameOriginal;
    drawTextLine0183.fontName = @"HelveticaNeue";
    drawTextLine0183.fontColor = [UIColor blackColor];
    drawTextLine0183.fontSize = 32;
    drawTextLine0183.origin = CGPointMake(999, 2528);
    [station0095.nameOriginalTextPrimitives addObject:drawTextLine0183];

    MWDrawTextLine *drawTextLine0184 = [[MWDrawTextLine alloc] init];
    drawTextLine0184.text = station0095.nameEnglish;
    drawTextLine0184.fontName = @"HelveticaNeue";
    drawTextLine0184.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0184.fontSize = 18;
    drawTextLine0184.origin = CGPointMake(996, 2563);
    [station0095.nameEnglishTextPrimitives addObject:drawTextLine0184];
    
    // Добавляем перегон
    MWHaul *haul0091 = [[MWHaul alloc] init];
    haul0091.identifier = @"haul0091";
    haul0091.length = 1310;
    [edge0037.elements addObject:haul0091];
    
    MWDrawLine *drawLine0160 = [[MWDrawLine alloc] init];
    drawLine0160.startPoint = CGPointMake(971.5, 2553);
    drawLine0160.endPoint = CGPointMake(971.5, 2489.5);
    drawLine0160.width = 14.5;
    drawLine0160.color = line0006.color;
    [haul0091.drawPrimitives addObject:drawLine0160];
    
    // Добавляем станцию "Академическая"
    MWStation *station0096 = [[MWStation alloc] init];
    station0096.identifier = @"station0096";
    [edge0037.elements addObject:station0096];
    
    station0096.nameOriginal = @"Академическая";
    station0096.nameEnglish = @"Akademicheskaya";
    station0096.mapLocation = CGPointMake(971.5, 2489.5);
    station0096.geoLocation = CGPointMake(55.687912, 37.573531);
    
    MWDrawLine *drawLine0161 = [[MWDrawLine alloc] init];
    drawLine0161.startPoint = CGPointMake(971.5, 2489.5);
    drawLine0161.endPoint = CGPointMake(991.5, 2489.5);
    drawLine0161.width = 12;
    drawLine0161.color = line0006.color;
    [station0096.drawPrimitives addObject:drawLine0161];
    
    MWDrawTextLine *drawTextLine0185 = [[MWDrawTextLine alloc] init];
    drawTextLine0185.text = station0096.nameOriginal;
    drawTextLine0185.fontName = @"HelveticaNeue";
    drawTextLine0185.fontColor = [UIColor blackColor];
    drawTextLine0185.fontSize = 32;
    drawTextLine0185.origin = CGPointMake(999, 2465);
    [station0096.nameOriginalTextPrimitives addObject:drawTextLine0185];
    
    MWDrawTextLine *drawTextLine0186 = [[MWDrawTextLine alloc] init];
    drawTextLine0186.text = station0096.nameEnglish;
    drawTextLine0186.fontName = @"HelveticaNeue";
    drawTextLine0186.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0186.fontSize = 18;
    drawTextLine0186.origin = CGPointMake(996, 2500);
    [station0096.nameEnglishTextPrimitives addObject:drawTextLine0186];
    
    // Добавляем перегон
    MWHaul *haul0092 = [[MWHaul alloc] init];
    haul0092.identifier = @"haul0092";
    haul0092.length = 2390;
    [edge0037.elements addObject:haul0092];
    
    MWDrawLine *drawLine0162 = [[MWDrawLine alloc] init];
    drawLine0162.startPoint = CGPointMake(971.5, 2490);
    drawLine0162.endPoint = CGPointMake(971.5, 2426.5);
    drawLine0162.width = 14.5;
    drawLine0162.color = line0006.color;
    [haul0092.drawPrimitives addObject:drawLine0162];
    
    // Добавляем станцию "Ленинский проспект"
    MWStation *station0097 = [[MWStation alloc] init];
    station0097.identifier = @"station0097";
    [edge0037.elements addObject:station0097];

    station0097.nameOriginal = @"Ленинский проспект";
    station0097.nameEnglish = @"Leninsky Prospect";
    station0097.mapLocation = CGPointMake(971.5, 2426.5);
    station0097.geoLocation = CGPointMake(55.707593, 37.586469);

    MWDrawLine *drawLine0163 = [[MWDrawLine alloc] init];
    drawLine0163.startPoint = CGPointMake(971.5, 2426.5);
    drawLine0163.endPoint = CGPointMake(991.5, 2426.5);
    drawLine0163.width = 12;
    drawLine0163.color = line0006.color;
    [station0097.drawPrimitives addObject:drawLine0163];

    MWDrawTextLine *drawTextLine0187 = [[MWDrawTextLine alloc] init];
    drawTextLine0187.text = station0097.nameOriginal;
    drawTextLine0187.fontName = @"HelveticaNeue";
    drawTextLine0187.fontColor = [UIColor blackColor];
    drawTextLine0187.fontSize = 32;
    drawTextLine0187.origin = CGPointMake(999, 2402);
    [station0097.nameOriginalTextPrimitives addObject:drawTextLine0187];
    
    MWDrawTextLine *drawTextLine0188 = [[MWDrawTextLine alloc] init];
    drawTextLine0188.text = station0097.nameEnglish;
    drawTextLine0188.fontName = @"HelveticaNeue";
    drawTextLine0188.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0188.fontSize = 18;
    drawTextLine0188.origin = CGPointMake(996, 2437);
    [station0097.nameEnglishTextPrimitives addObject:drawTextLine0188];
    
    // Добавляем перегон
    MWHaul *haul0093 = [[MWHaul alloc] init];
    haul0093.identifier = @"haul0093";
    haul0093.length = 1880;
    [edge0037.elements addObject:haul0093];
    
    MWDrawLine *drawLine0164 = [[MWDrawLine alloc] init];
    drawLine0164.startPoint = CGPointMake(971.5, 2427);
    drawLine0164.endPoint = CGPointMake(971.5, 2363.5);
    drawLine0164.width = 14.5;
    drawLine0164.color = line0006.color;
    [haul0093.drawPrimitives addObject:drawLine0164];
    
    // Добавляем станцию "Шаболовская"
    MWStation *station0098 = [[MWStation alloc] init];
    station0098.identifier = @"station0098";
    [edge0037.elements addObject:station0098];
    
    station0098.nameOriginal = @"Шаболовская";
    station0098.nameEnglish = @"Shabolovskaya";
    station0098.mapLocation = CGPointMake(971.5, 2363.5);
    station0098.geoLocation = CGPointMake(55.718816, 37.608139);
    
    MWDrawLine *drawLine0165 = [[MWDrawLine alloc] init];
    drawLine0165.startPoint = CGPointMake(971.5, 2363.5);
    drawLine0165.endPoint = CGPointMake(991.5, 2363.5);
    drawLine0165.width = 12;
    drawLine0165.color = line0006.color;
    [station0098.drawPrimitives addObject:drawLine0165];

    MWDrawTextLine *drawTextLine0189 = [[MWDrawTextLine alloc] init];
    drawTextLine0189.text = station0098.nameOriginal;
    drawTextLine0189.fontName = @"HelveticaNeue";
    drawTextLine0189.fontColor = [UIColor blackColor];
    drawTextLine0189.fontSize = 32;
    drawTextLine0189.origin = CGPointMake(999, 2339);
    [station0098.nameOriginalTextPrimitives addObject:drawTextLine0189];
    
    MWDrawTextLine *drawTextLine0190 = [[MWDrawTextLine alloc] init];
    drawTextLine0190.text = station0098.nameEnglish;
    drawTextLine0190.fontName = @"HelveticaNeue";
    drawTextLine0190.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0190.fontSize = 18;
    drawTextLine0190.origin = CGPointMake(996, 2374);
    [station0098.nameEnglishTextPrimitives addObject:drawTextLine0190];
    
    // Добавляем перегон
    MWHaul *haul0094 = [[MWHaul alloc] init];
    haul0094.identifier = @"haul0094";
    haul0094.length = 1440;
    [edge0037.elements addObject:haul0094];

    MWDrawLine *drawLine0166 = [[MWDrawLine alloc] init];
    drawLine0166.startPoint = CGPointMake(971.5, 2364);
    drawLine0166.endPoint = CGPointMake(971.5, 2327);
    drawLine0166.width = 14.5;
    drawLine0166.color = line0006.color;
    [haul0094.drawPrimitives addObject:drawLine0166];

    MWDrawArc *drawArc0036 = [[MWDrawArc alloc] init];
    drawArc0036.center = CGPointMake(1069.5, 2327.5);
    drawArc0036.startRadians = 180  * M_PI / 180;
    drawArc0036.endRadians = 225 * M_PI / 180;
    drawArc0036.radius = 98;
    drawArc0036.width = 14.5;
    drawArc0036.color = line0006.color;
    [haul0094.drawPrimitives addObject:drawArc0036];

    MWDrawLine *drawLine0167 = [[MWDrawLine alloc] init];
    drawLine0167.startPoint = CGPointMake(999.5, 2259.0);
    drawLine0167.endPoint = CGPointMake(1117.0, 2141.5);
    drawLine0167.width = 14.5;
    drawLine0167.color = line0006.color;
    [haul0094.drawPrimitives addObject:drawLine0167];
    
    // Добавляем станцию "Октябрьская"
    MWStation *station0099 = [[MWStation alloc] init];
    station0099.identifier = @"station0099";
    [edge0037.elements addObject:station0099];
    
    station0099.nameOriginal = @"Октябрьская";
    station0099.nameEnglish = @"Oktyabrskaya";
    station0099.mapLocation = CGPointMake(1116.5, 2141.5);
    station0099.geoLocation = CGPointMake(55.729254, 37.611317);

    [station0099.nameOriginalTextPrimitives addObject:drawTextLine0159];
    [station0099.nameEnglishTextPrimitives addObject:drawTextLine0160];
    station0099.showNameOnMap = FALSE;
    
    // Добавляем вершину
    edge0037.finishVertex = vertex0024;
    
    // Создаем участок линии от "Октябрьская" до "Третьяковская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0038 = [[MWEdge alloc] init];
    edge0038.identifier = @"edge0038";
    edge0038.developmentName = @"Ребро: Октябрьская - Третьяковская";
    [self.edges addObject:edge0038];
    
    // Добавляем линию
    edge0038.line = line0006;

    // Добавляем вершину
    edge0038.startVertex = vertex0024;
    
    // Добавляем станцию "Октябрьская"
    [edge0038.elements addObject:station0099];
    
    // Добавляем перегон
    MWHaul *haul0095 = [[MWHaul alloc] init];
    haul0095.identifier = @"haul0095";
    haul0095.length = 1420;
    [edge0038.elements addObject:haul0095];
    
    MWDrawLine *drawLine0168 = [[MWDrawLine alloc] init];
    drawLine0168.startPoint = CGPointMake(1116.5, 2142.0);
    drawLine0168.endPoint = CGPointMake(1129.0, 2129.5);
    drawLine0168.width = 14.5;
    drawLine0168.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawLine0168];
    
    MWDrawArc *drawArc0037 = [[MWDrawArc alloc] init];
    drawArc0037.center = CGPointMake(1171.0, 2172.5);
    drawArc0037.startRadians = 225  * M_PI / 180;
    drawArc0037.endRadians = 270 * M_PI / 180;
    drawArc0037.radius = 60;
    drawArc0037.width = 14.5;
    drawArc0037.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawArc0037];

    MWDrawLine *drawLine0169 = [[MWDrawLine alloc] init];
    drawLine0169.startPoint = CGPointMake(1171, 2112.5);
    drawLine0169.endPoint = CGPointMake(1490, 2112.5);
    drawLine0169.width = 14.5;
    drawLine0169.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawLine0169];

    MWDrawArc *drawArc0038 = [[MWDrawArc alloc] init];
    drawArc0038.center = CGPointMake(1490.0, 2012.5);
    drawArc0038.startRadians = 45  * M_PI / 180;
    drawArc0038.endRadians = 90 * M_PI / 180;
    drawArc0038.radius = 100;
    drawArc0038.width = 14.5;
    drawArc0038.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawArc0038];

    MWDrawLine *drawLine0170 = [[MWDrawLine alloc] init];
    drawLine0170.startPoint = CGPointMake(1560.5, 2083.5);
    drawLine0170.endPoint = CGPointMake(1624.5, 2019.5);
    drawLine0170.width = 14.5;
    drawLine0170.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawLine0170];
    
    // Добавляем станцию "Третьяковская"
    MWStation *station0100 = [[MWStation alloc] init];
    station0100.identifier = @"station0100";
    [edge0038.elements addObject:station0100];

    station0100.nameOriginal = @"Третьяковская";
    station0100.nameEnglish = @"Tretyakovskaya";
    station0100.mapLocation = CGPointMake(1624.5, 2019.5);
    station0100.geoLocation = CGPointMake(55.740729, 37.625591);
    
    MWDrawLine *drawLine0370 = [[MWDrawLine alloc] init];
    drawLine0370.startPoint = CGPointMake(1556, 2063.5);
    drawLine0370.endPoint = CGPointMake(1606, 2063.5);
    drawLine0370.width = 22;
    drawLine0370.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0100.nameOriginalTextPrimitives addObject:drawLine0370];

    MWDrawTextLine *drawTextLine0191 = [[MWDrawTextLine alloc] init];
    drawTextLine0191.text = station0100.nameOriginal;
    drawTextLine0191.fontName = @"HelveticaNeue";
    drawTextLine0191.fontColor = [UIColor blackColor];
    drawTextLine0191.fontSize = 32;
    drawTextLine0191.origin = CGPointMake(1402, 2041);
    [station0100.nameOriginalTextPrimitives addObject:drawTextLine0191];
    
    MWDrawTextLine *drawTextLine0192 = [[MWDrawTextLine alloc] init];
    drawTextLine0192.text = station0100.nameEnglish;
    drawTextLine0192.fontName = @"HelveticaNeue";
    drawTextLine0192.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0192.fontSize = 18;
    drawTextLine0192.origin = CGPointMake(1440, 2025);
    [station0100.nameEnglishTextPrimitives addObject:drawTextLine0192];
    
    // Добавляем вершину
    edge0038.finishVertex = vertex0013;
    
    // Создаем участок линии от "Третьяковская" до "Китай-город"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0039 = [[MWEdge alloc] init];
    edge0039.identifier = @"edge0039";
    edge0039.developmentName = @"Ребро: Третьяковская - Китай-город";
    [self.edges addObject:edge0039];
    
    // Добавляем линию
    edge0039.line = line0006;

    // Добавляем вершину
    edge0039.startVertex = vertex0013;
    
    // Добавляем станцию "Третьяковская"
    [edge0039.elements addObject:station0100];
    
    // Добавляем перегон
    MWHaul *haul0096 = [[MWHaul alloc] init];
    haul0096.identifier = @"haul0096";
    haul0096.length = 1850;
    [edge0039.elements addObject:haul0096];
    
    MWDrawLine *drawLine0171 = [[MWDrawLine alloc] init];
    drawLine0171.startPoint = CGPointMake(1624, 2020);
    drawLine0171.endPoint = CGPointMake(1759.8, 1884.2);
    drawLine0171.width = 14.5;
    drawLine0171.color = line0006.color;
    [haul0096.drawPrimitives addObject:drawLine0171];
    
    MWDrawArc *drawArc0039 = [[MWDrawArc alloc] init];
    drawArc0039.center = CGPointMake(1688.5, 1814);
    drawArc0039.startRadians = 0  * M_PI / 180;
    drawArc0039.endRadians = 45 * M_PI / 180;
    drawArc0039.radius = 100;
    drawArc0039.width = 14.5;
    drawArc0039.color = line0006.color;
    [haul0096.drawPrimitives addObject:drawArc0039];

    MWDrawLine *drawLine0172 = [[MWDrawLine alloc] init];
    drawLine0172.startPoint = CGPointMake(1788.5, 1814);
    drawLine0172.endPoint = CGPointMake(1788.5, 1725.5);
    drawLine0172.width = 14.5;
    drawLine0172.color = line0006.color;
    [haul0096.drawPrimitives addObject:drawLine0172];
    
    // Добавляем станцию "Китай-город"
    MWStation *station0101 = [[MWStation alloc] init];
    station0101.identifier = @"station0101";
    [edge0039.elements addObject:station0101];
    
    station0101.nameOriginal = @"Китай-город";
    station0101.nameEnglish = @"Kitay-gorod";
    station0101.mapLocation = CGPointMake(1788.5, 1725.5);
    station0101.geoLocation = CGPointMake(55.756952, 37.630937);
    
    MWDrawLine *drawLine0364 = [[MWDrawLine alloc] init];
    drawLine0364.startPoint = CGPointMake(1850, 1760);
    drawLine0364.endPoint = CGPointMake(1923, 1760);
    drawLine0364.width = 26;
    drawLine0364.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0101.nameOriginalTextPrimitives addObject:drawLine0364];

    MWDrawTextLine *drawTextLine0193 = [[MWDrawTextLine alloc] init];
    drawTextLine0193.text = station0101.nameOriginal;
    drawTextLine0193.fontName = @"HelveticaNeue";
    drawTextLine0193.fontColor = [UIColor blackColor];
    drawTextLine0193.fontSize = 32;
    drawTextLine0193.origin = CGPointMake(1806, 1740);
    [station0101.nameOriginalTextPrimitives addObject:drawTextLine0193];

    MWDrawLine *drawLine0381 = [[MWDrawLine alloc] init];
    drawLine0381.startPoint = CGPointMake(1850, 1786.5);
    drawLine0381.endPoint = CGPointMake(1923, 1786.5);
    drawLine0381.width = 16;
    drawLine0381.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0101.nameEnglishTextPrimitives addObject:drawLine0381];

    MWDrawTextLine *drawTextLine0194 = [[MWDrawTextLine alloc] init];
    drawTextLine0194.text = station0101.nameEnglish;
    drawTextLine0194.fontName = @"HelveticaNeue";
    drawTextLine0194.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0194.fontSize = 18;
    drawTextLine0194.origin = CGPointMake(1804, 1775);
    [station0101.nameEnglishTextPrimitives addObject:drawTextLine0194];

    // Добавляем вершину
    edge0039.finishVertex = vertex0030;
    
    // Создаем участок линии от "Китай-город" до "Тургеневская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0040 = [[MWEdge alloc] init];
    edge0040.identifier = @"edge0040";
    edge0040.developmentName = @"Ребро: Китай-город - Тургеневская";
    [self.edges addObject:edge0040];
    
    // Добавляем линию
    edge0040.line = line0006;

    // Добавляем вершину
    edge0040.startVertex = vertex0030;
    
    // Добавляем станцию "Китай-город"
    [edge0040.elements addObject:station0101];
    
    // Добавляем перегон
    MWHaul *haul0097 = [[MWHaul alloc] init];
    haul0097.identifier = @"haul0097";
    haul0097.length = 1190;
    [edge0040.elements addObject:haul0097];

    MWDrawLine *drawLine0173 = [[MWDrawLine alloc] init];
    drawLine0173.startPoint = CGPointMake(1788.5, 1726);
    drawLine0173.endPoint = CGPointMake(1788.5, 1593);
    drawLine0173.width = 14.5;
    drawLine0173.color = line0006.color;
    [haul0097.drawPrimitives addObject:drawLine0173];
    
    MWDrawArc *drawArc0040 = [[MWDrawArc alloc] init];
    drawArc0040.center = CGPointMake(1688.5, 1593);
    drawArc0040.startRadians = 315  * M_PI / 180;
    drawArc0040.endRadians = 0 * M_PI / 180;
    drawArc0040.radius = 100;
    drawArc0040.width = 14.5;
    drawArc0040.color = line0006.color;
    [haul0097.drawPrimitives addObject:drawArc0040];

    MWDrawLine *drawLine0174 = [[MWDrawLine alloc] init];
    drawLine0174.startPoint = CGPointMake(1759.8, 1522.8);
    drawLine0174.endPoint = CGPointMake(1649.5, 1412.5);
    drawLine0174.width = 14.5;
    drawLine0174.color = line0006.color;
    [haul0097.drawPrimitives addObject:drawLine0174];
    
    // Добавляем станцию "Тургеневская"
    MWStation *station0102 = [[MWStation alloc] init];
    station0102.identifier = @"station0102";
    [edge0040.elements addObject:station0102];
    
    station0102.nameOriginal = @"Тургеневская";
    station0102.nameEnglish = @"Turgenevskaya";
    station0102.mapLocation = CGPointMake(1649.5, 1412.5);
    station0102.geoLocation = CGPointMake(55.765839, 37.636776);
    
    MWDrawTextLine *drawTextLine0195 = [[MWDrawTextLine alloc] init];
    drawTextLine0195.text = station0102.nameOriginal;
    drawTextLine0195.fontName = @"HelveticaNeue";
    drawTextLine0195.fontColor = [UIColor blackColor];
    drawTextLine0195.fontSize = 32;
    drawTextLine0195.origin = CGPointMake(1422, 1389);
    [station0102.nameOriginalTextPrimitives addObject:drawTextLine0195];
    
    MWDrawTextLine *drawTextLine0196 = [[MWDrawTextLine alloc] init];
    drawTextLine0196.text = station0102.nameEnglish;
    drawTextLine0196.fontName = @"HelveticaNeue";
    drawTextLine0196.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0196.fontSize = 18;
    drawTextLine0196.origin = CGPointMake(1465, 1373);
    [station0102.nameEnglishTextPrimitives addObject:drawTextLine0196];
    
    // Добавляем вершину
    edge0040.finishVertex = vertex0006;
    
    // Создаем участок линии от "Тургеневская" до "Проспект Мира"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0041 = [[MWEdge alloc] init];
    edge0041.identifier = @"edge0041";
    edge0041.developmentName = @"Ребро: Тургеневская - Проспект Мира";
    [self.edges addObject:edge0041];
    
    // Добавляем линию
    edge0041.line = line0006;

    // Добавляем вершину
    edge0041.startVertex = vertex0006;
    
    // Добавляем станцию "Тургеневская"
    [edge0041.elements addObject:station0102];
    
    // Добавляем перегон
    MWHaul *haul0098 = [[MWHaul alloc] init];
    haul0098.identifier = @"haul0098";
    haul0098.length = 729;
    [edge0041.elements addObject:haul0098];
    
    MWDrawLine *drawLine0175 = [[MWDrawLine alloc] init];
    drawLine0175.startPoint = CGPointMake(1650, 1413);
    drawLine0175.endPoint = CGPointMake(1573, 1336);
    drawLine0175.width = 14.5;
    drawLine0175.color = line0006.color;
    [haul0098.drawPrimitives addObject:drawLine0175];
    
    MWDrawArc *drawArc0041 = [[MWDrawArc alloc] init];
    drawArc0041.center = CGPointMake(1644.5, 1266.0);
    drawArc0041.startRadians = 135  * M_PI / 180;
    drawArc0041.endRadians = 180 * M_PI / 180;
    drawArc0041.radius = 100;
    drawArc0041.width = 14.5;
    drawArc0041.color = line0006.color;
    [haul0098.drawPrimitives addObject:drawArc0041];

    MWDrawLine *drawLine0176 = [[MWDrawLine alloc] init];
    drawLine0176.startPoint = CGPointMake(1544.5, 1266);
    drawLine0176.endPoint = CGPointMake(1544.5, 1187.5);
    drawLine0176.width = 14.5;
    drawLine0176.color = line0006.color;
    [haul0098.drawPrimitives addObject:drawLine0176];
    
    // Добавляем станцию "Сухаревская"
    MWStation *station0103 = [[MWStation alloc] init];
    station0103.identifier = @"station0103";
    [edge0041.elements addObject:station0103];
    
    station0103.nameOriginal = @"Сухаревская";
    station0103.nameEnglish = @"Suharevskaya";
    station0103.mapLocation = CGPointMake(1544.5, 1187.5);
    station0103.geoLocation = CGPointMake(55.772295, 37.632444);
    
    MWDrawLine *drawLine0177 = [[MWDrawLine alloc] init];
    drawLine0177.startPoint = CGPointMake(1544.5, 1187.5);
    drawLine0177.endPoint = CGPointMake(1564, 1187.5);
    drawLine0177.width = 12;
    drawLine0177.color = line0006.color;
    [station0103.drawPrimitives addObject:drawLine0177];
    
    MWDrawTextLine *drawTextLine0197 = [[MWDrawTextLine alloc] init];
    drawTextLine0197.text = station0103.nameOriginal;
    drawTextLine0197.fontName = @"HelveticaNeue";
    drawTextLine0197.fontColor = [UIColor blackColor];
    drawTextLine0197.fontSize = 32;
    drawTextLine0197.origin = CGPointMake(1573, 1163);
    [station0103.nameOriginalTextPrimitives addObject:drawTextLine0197];
    
    MWDrawTextLine *drawTextLine0198 = [[MWDrawTextLine alloc] init];
    drawTextLine0198.text = station0103.nameEnglish;
    drawTextLine0198.fontName = @"HelveticaNeue";
    drawTextLine0198.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0198.fontSize = 18;
    drawTextLine0198.origin = CGPointMake(1569, 1198);
    [station0103.nameEnglishTextPrimitives addObject:drawTextLine0198];
    
    // Добавляем перегон
    MWHaul *haul0099 = [[MWHaul alloc] init];
    haul0099.identifier = @"haul0099";
    haul0099.length = 1060;
    [edge0041.elements addObject:haul0099];
    
    MWDrawLine *drawLine0178 = [[MWDrawLine alloc] init];
    drawLine0178.startPoint = CGPointMake(1544.5, 1188);
    drawLine0178.endPoint = CGPointMake(1544.5, 1167);
    drawLine0178.width = 14.5;
    drawLine0178.color = line0006.color;
    [haul0099.drawPrimitives addObject:drawLine0178];
    
    MWDrawArc *drawArc0042 = [[MWDrawArc alloc] init];
    drawArc0042.center = CGPointMake(1644.5, 1167);
    drawArc0042.startRadians = 180  * M_PI / 180;
    drawArc0042.endRadians = 225 * M_PI / 180;
    drawArc0042.radius = 100;
    drawArc0042.width = 14.5;
    drawArc0042.color = line0006.color;
    [haul0099.drawPrimitives addObject:drawArc0042];

    MWDrawLine *drawLine0179 = [[MWDrawLine alloc] init];
    drawLine0179.startPoint = CGPointMake(1573, 1097);
    drawLine0179.endPoint = CGPointMake(1647.5, 1022.5);
    drawLine0179.width = 14.5;
    drawLine0179.color = line0006.color;
    [haul0099.drawPrimitives addObject:drawLine0179];
    
    // Добавляем станцию "Проспект Мира"
    MWStation *station0104 = [[MWStation alloc] init];
    station0104.identifier = @"station0104";
    [edge0041.elements addObject:station0104];

    station0104.nameOriginal = @"Проспект Мира";
    station0104.nameEnglish = @"Prospekt Mira";
    station0104.mapLocation = CGPointMake(1647.5, 1022.5);
    station0104.geoLocation = CGPointMake(55.779652, 37.633618);

    [station0104.nameOriginalTextPrimitives addObject:drawTextLine0165];
    [station0104.nameEnglishTextPrimitives addObject:drawTextLine0166];
    station0104.showNameOnMap = FALSE;
    
    // Добавляем вершину
    edge0041.finishVertex = vertex0027;
    
    // Создаем участок линии от "Проспект Мира" до "Медведково"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0042 = [[MWEdge alloc] init];
    edge0042.identifier = @"edge0042";
    edge0042.developmentName = @"Ребро: Проспект Мира - Медведково";
    [self.edges addObject:edge0042];
    
    // Добавляем линию
    edge0042.line = line0006;

    // Добавляем вершину
    edge0042.startVertex = vertex0027;
    
    // Добавляем станцию "Проспект Мира"
    [edge0042.elements addObject:station0104];
    
    // Добавляем перегон
    MWHaul *haul0100 = [[MWHaul alloc] init];
    haul0100.identifier = @"haul0100";
    haul0100.length = 1210;
    [edge0042.elements addObject:haul0100];

    MWDrawLine *drawLine0180 = [[MWDrawLine alloc] init];
    drawLine0180.startPoint = CGPointMake(1647, 1023);
    drawLine0180.endPoint = CGPointMake(1669, 1001);
    drawLine0180.width = 14.5;
    drawLine0180.color = line0006.color;
    [haul0100.drawPrimitives addObject:drawLine0180];
    
    MWDrawArc *drawArc0043 = [[MWDrawArc alloc] init];
    drawArc0043.center = CGPointMake(1626, 959);
    drawArc0043.startRadians = 0  * M_PI / 180;
    drawArc0043.endRadians = 45 * M_PI / 180;
    drawArc0043.radius = 60;
    drawArc0043.width = 14.5;
    drawArc0043.color = line0006.color;
    [haul0100.drawPrimitives addObject:drawArc0043];

    MWDrawLine *drawLine0181 = [[MWDrawLine alloc] init];
    drawLine0181.startPoint = CGPointMake(1686, 959);
    drawLine0181.endPoint = CGPointMake(1686, 935.5);
    drawLine0181.width = 14.5;
    drawLine0181.color = line0006.color;
    [haul0100.drawPrimitives addObject:drawLine0181];
    
    // Добавляем станцию "Рижская"
    MWStation *station0105 = [[MWStation alloc] init];
    station0105.identifier = @"station0105";
    [edge0042.elements addObject:station0105];
    
    station0105.nameOriginal = @"Рижская";
    station0105.nameEnglish = @"Rizhskaya";
    station0105.mapLocation = CGPointMake(1685.5, 935.5);
    station0105.geoLocation = CGPointMake(55.792497, 37.636151);
    
    MWDrawLine *drawLine0182 = [[MWDrawLine alloc] init];
    drawLine0182.startPoint = CGPointMake(1685.5, 935.5);
    drawLine0182.endPoint = CGPointMake(1705.5, 935.5);
    drawLine0182.width = 12;
    drawLine0182.color = line0006.color;
    [station0105.drawPrimitives addObject:drawLine0182];
    
    MWDrawTextLine *drawTextLine0199 = [[MWDrawTextLine alloc] init];
    drawTextLine0199.text = station0105.nameOriginal;
    drawTextLine0199.fontName = @"HelveticaNeue";
    drawTextLine0199.fontColor = [UIColor blackColor];
    drawTextLine0199.fontSize = 32;
    drawTextLine0199.origin = CGPointMake(1711, 911);
    [station0105.nameOriginalTextPrimitives addObject:drawTextLine0199];
    
    MWDrawTextLine *drawTextLine0200 = [[MWDrawTextLine alloc] init];
    drawTextLine0200.text = station0105.nameEnglish;
    drawTextLine0200.fontName = @"HelveticaNeue";
    drawTextLine0200.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0200.fontSize = 18;
    drawTextLine0200.origin = CGPointMake(1760, 896);
    [station0105.nameEnglishTextPrimitives addObject:drawTextLine0200];
    
    // Добавляем перегон
    MWHaul *haul0101 = [[MWHaul alloc] init];
    haul0101.identifier = @"haul0101";
    haul0101.length = 1730;
    [edge0042.elements addObject:haul0101];

    MWDrawLine *drawLine0183 = [[MWDrawLine alloc] init];
    drawLine0183.startPoint = CGPointMake(1686, 936);
    drawLine0183.endPoint = CGPointMake(1686, 853.5);
    drawLine0183.width = 14.5;
    drawLine0183.color = line0006.color;
    [haul0101.drawPrimitives addObject:drawLine0183];
    
    // Добавляем станцию "Алексеевская"
    MWStation *station0106 = [[MWStation alloc] init];
    station0106.identifier = @"station0106";
    [edge0042.elements addObject:station0106];

    station0106.nameOriginal = @"Алексеевская";
    station0106.nameEnglish = @"Alekseevskaya";
    station0106.mapLocation = CGPointMake(1686.5, 853.5);
    station0106.geoLocation = CGPointMake(55.807775, 37.638702);

    MWDrawLine *drawLine0184 = [[MWDrawLine alloc] init];
    drawLine0184.startPoint = CGPointMake(1685.5, 853.5);
    drawLine0184.endPoint = CGPointMake(1705.5, 853.5);
    drawLine0184.width = 12;
    drawLine0184.color = line0006.color;
    [station0106.drawPrimitives addObject:drawLine0184];
    
    MWDrawTextLine *drawTextLine0201 = [[MWDrawTextLine alloc] init];
    drawTextLine0201.text = station0106.nameOriginal;
    drawTextLine0201.fontName = @"HelveticaNeue";
    drawTextLine0201.fontColor = [UIColor blackColor];
    drawTextLine0201.fontSize = 32;
    drawTextLine0201.origin = CGPointMake(1711, 828);
    [station0106.nameOriginalTextPrimitives addObject:drawTextLine0201];

    MWDrawTextLine *drawTextLine0202 = [[MWDrawTextLine alloc] init];
    drawTextLine0202.text = station0106.nameEnglish;
    drawTextLine0202.fontName = @"HelveticaNeue";
    drawTextLine0202.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0202.fontSize = 18;
    drawTextLine0202.origin = CGPointMake(1707, 863);
    [station0106.nameEnglishTextPrimitives addObject:drawTextLine0202];
    
    // Добавляем перегон
    MWHaul *haul0102 = [[MWHaul alloc] init];
    haul0102.identifier = @"haul0102";
    haul0102.length = 1530;
    [edge0042.elements addObject:haul0102];
    
    MWDrawLine *drawLine0185 = [[MWDrawLine alloc] init];
    drawLine0185.startPoint = CGPointMake(1686, 854);
    drawLine0185.endPoint = CGPointMake(1686, 776);
    drawLine0185.width = 14.5;
    drawLine0185.color = line0006.color;
    [haul0102.drawPrimitives addObject:drawLine0185];
    
    // Добавляем станцию "ВДНХ"
    MWStation *station0107 = [[MWStation alloc] init];
    station0107.identifier = @"station0107";
    [edge0042.elements addObject:station0107];
    
    station0107.nameOriginal = @"ВДНХ";
    station0107.nameEnglish = @"VDNKh";
    station0107.mapLocation = CGPointMake(1686.5, 776);
    station0107.geoLocation = CGPointMake(55.821061, 37.641477);

    MWDrawLine *drawLine0186 = [[MWDrawLine alloc] init];
    drawLine0186.startPoint = CGPointMake(1685.5, 776);
    drawLine0186.endPoint = CGPointMake(1705.5, 776);
    drawLine0186.width = 12;
    drawLine0186.color = line0006.color;
    [station0107.drawPrimitives addObject:drawLine0186];
    
    MWDrawTextLine *drawTextLine0203 = [[MWDrawTextLine alloc] init];
    drawTextLine0203.text = station0107.nameOriginal;
    drawTextLine0203.fontName = @"HelveticaNeue";
    drawTextLine0203.fontColor = [UIColor blackColor];
    drawTextLine0203.fontSize = 32;
    drawTextLine0203.origin = CGPointMake(1711, 752);
    [station0107.nameOriginalTextPrimitives addObject:drawTextLine0203];
    
    MWDrawTextLine *drawTextLine0204 = [[MWDrawTextLine alloc] init];
    drawTextLine0204.text = station0107.nameEnglish;
    drawTextLine0204.fontName = @"HelveticaNeue";
    drawTextLine0204.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0204.fontSize = 18;
    drawTextLine0204.origin = CGPointMake(1707, 731);
    [station0107.nameEnglishTextPrimitives addObject:drawTextLine0204];
    
    // Добавляем перегон
    MWHaul *haul0103 = [[MWHaul alloc] init];
    haul0103.identifier = @"haul0103";
    haul0103.length = 2590;
    [edge0042.elements addObject:haul0103];
    
    MWDrawLine *drawLine0187 = [[MWDrawLine alloc] init];
    drawLine0187.startPoint = CGPointMake(1686, 776.5);
    drawLine0187.endPoint = CGPointMake(1686, 632.5);
    drawLine0187.width = 14.5;
    drawLine0187.color = line0006.color;
    [haul0103.drawPrimitives addObject:drawLine0187];
    
    // Добавляем станцию "Ботанический сад"
    MWStation *station0108 = [[MWStation alloc] init];
    station0108.identifier = @"station0108";
    [edge0042.elements addObject:station0108];
    
    station0108.nameOriginal = @"Ботанический сад";
    station0108.nameEnglish = @"Botanichesky Sad";
    station0108.mapLocation = CGPointMake(1686.5, 632.5);
    station0108.geoLocation = CGPointMake(55.845340, 37.638712);
    
    MWDrawLine *drawLine0188 = [[MWDrawLine alloc] init];
    drawLine0188.startPoint = CGPointMake(1685.5, 632.5);
    drawLine0188.endPoint = CGPointMake(1705.5, 632.5);
    drawLine0188.width = 12;
    drawLine0188.color = line0006.color;
    [station0108.drawPrimitives addObject:drawLine0188];
    
    MWDrawTextLine *drawTextLine0205 = [[MWDrawTextLine alloc] init];
    drawTextLine0205.text = @"Ботанический";
    drawTextLine0205.fontName = @"HelveticaNeue";
    drawTextLine0205.fontColor = [UIColor blackColor];
    drawTextLine0205.fontSize = 32;
    drawTextLine0205.origin = CGPointMake(1714, 605);
    [station0108.nameOriginalTextPrimitives addObject:drawTextLine0205];

    MWDrawTextLine *drawTextLine0206 = [[MWDrawTextLine alloc] init];
    drawTextLine0206.text = @"сад";
    drawTextLine0206.fontName = @"HelveticaNeue";
    drawTextLine0206.fontColor = [UIColor blackColor];
    drawTextLine0206.fontSize = 32;
    drawTextLine0206.origin = CGPointMake(1714, 633);
    [station0108.nameOriginalTextPrimitives addObject:drawTextLine0206];
    
    MWDrawTextLine *drawTextLine0207 = [[MWDrawTextLine alloc] init];
    drawTextLine0207.text = station0108.nameEnglish;
    drawTextLine0207.fontName = @"HelveticaNeue";
    drawTextLine0207.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0207.fontSize = 18;
    drawTextLine0207.origin = CGPointMake(1710, 666);
    [station0108.nameEnglishTextPrimitives addObject:drawTextLine0207];
    
    // Добавляем перегон
    MWHaul *haul0104 = [[MWHaul alloc] init];
    haul0104.identifier = @"haul0104";
    haul0104.length = 1660;
    [edge0042.elements addObject:haul0104];
    
    MWDrawLine *drawLine0189 = [[MWDrawLine alloc] init];
    drawLine0189.startPoint = CGPointMake(1686, 633);
    drawLine0189.endPoint = CGPointMake(1686, 564.5);
    drawLine0189.width = 14.5;
    drawLine0189.color = line0006.color;
    [haul0104.drawPrimitives addObject:drawLine0189];
    
    // Добавляем станцию "Свиблово"
    MWStation *station0109 = [[MWStation alloc] init];
    station0109.identifier = @"station0109";
    [edge0042.elements addObject:station0109];
    
    station0109.nameOriginal = @"Свиблово";
    station0109.nameEnglish = @"Sviblovo";
    station0109.mapLocation = CGPointMake(1686.5, 564.5);
    station0109.geoLocation = CGPointMake(55.855265, 37.653062);
    
    MWDrawLine *drawLine0190 = [[MWDrawLine alloc] init];
    drawLine0190.startPoint = CGPointMake(1685.5, 564.5);
    drawLine0190.endPoint = CGPointMake(1705.5, 564.5);
    drawLine0190.width = 12;
    drawLine0190.color = line0006.color;
    [station0109.drawPrimitives addObject:drawLine0190];

    MWDrawTextLine *drawTextLine0208 = [[MWDrawTextLine alloc] init];
    drawTextLine0208.text = station0109.nameOriginal;
    drawTextLine0208.fontName = @"HelveticaNeue";
    drawTextLine0208.fontColor = [UIColor blackColor];
    drawTextLine0208.fontSize = 32;
    drawTextLine0208.origin = CGPointMake(1714, 538);
    [station0109.nameOriginalTextPrimitives addObject:drawTextLine0208];
    
    MWDrawTextLine *drawTextLine0209 = [[MWDrawTextLine alloc] init];
    drawTextLine0209.text = station0109.nameEnglish;
    drawTextLine0209.fontName = @"HelveticaNeue";
    drawTextLine0209.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0209.fontSize = 18;
    drawTextLine0209.origin = CGPointMake(1710, 573);
    [station0109.nameEnglishTextPrimitives addObject:drawTextLine0209];
    
    // Добавляем перегон
    MWHaul *haul0105 = [[MWHaul alloc] init];
    haul0105.identifier = @"haul0105";
    haul0105.length = 1920;
    [edge0042.elements addObject:haul0105];
    
    MWDrawLine *drawLine0191 = [[MWDrawLine alloc] init];
    drawLine0191.startPoint = CGPointMake(1686, 565);
    drawLine0191.endPoint = CGPointMake(1686, 496.5);
    drawLine0191.width = 14.5;
    drawLine0191.color = line0006.color;
    [haul0105.drawPrimitives addObject:drawLine0191];
    
    // Добавляем станцию "Бабушкинская"
    MWStation *station0110 = [[MWStation alloc] init];
    station0110.identifier = @"station0110";
    [edge0042.elements addObject:station0110];
    
    station0110.nameOriginal = @"Бабушкинская";
    station0110.nameEnglish = @"Babushkinskaya";
    station0110.mapLocation = CGPointMake(1686.5, 496.5);
    station0110.geoLocation = CGPointMake(55.869503, 37.664156);
    
    MWDrawLine *drawLine0192 = [[MWDrawLine alloc] init];
    drawLine0192.startPoint = CGPointMake(1685.5, 496.5);
    drawLine0192.endPoint = CGPointMake(1705.5, 496.5);
    drawLine0192.width = 12;
    drawLine0192.color = line0006.color;
    [station0110.drawPrimitives addObject:drawLine0192];

    MWDrawTextLine *drawTextLine0210 = [[MWDrawTextLine alloc] init];
    drawTextLine0210.text = station0110.nameOriginal;
    drawTextLine0210.fontName = @"HelveticaNeue";
    drawTextLine0210.fontColor = [UIColor blackColor];
    drawTextLine0210.fontSize = 32;
    drawTextLine0210.origin = CGPointMake(1714, 469);
    [station0110.nameOriginalTextPrimitives addObject:drawTextLine0210];
    
    MWDrawTextLine *drawTextLine0211 = [[MWDrawTextLine alloc] init];
    drawTextLine0211.text = station0110.nameEnglish;
    drawTextLine0211.fontName = @"HelveticaNeue";
    drawTextLine0211.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0211.fontSize = 18;
    drawTextLine0211.origin = CGPointMake(1710, 504);
    [station0110.nameEnglishTextPrimitives addObject:drawTextLine0211];
    
    // Добавляем перегон
    MWHaul *haul0106 = [[MWHaul alloc] init];
    haul0106.identifier = @"haul0106";
    haul0106.length = 1990;
    [edge0042.elements addObject:haul0106];
    
    MWDrawLine *drawLine0193 = [[MWDrawLine alloc] init];
    drawLine0193.startPoint = CGPointMake(1686, 497);
    drawLine0193.endPoint = CGPointMake(1686, 428.5);
    drawLine0193.width = 14.5;
    drawLine0193.color = line0006.color;
    [haul0106.drawPrimitives addObject:drawLine0193];
    
    // Добавляем станцию "Медведково"
    MWStation *station0111 = [[MWStation alloc] init];
    station0111.identifier = @"station0111";
    [edge0042.elements addObject:station0111];
    
    station0111.nameOriginal = @"Медведково";
    station0111.nameEnglish = @"Medvedkovo";
    station0111.mapLocation = CGPointMake(1686.5, 428.5);
    station0111.geoLocation = CGPointMake(55.887205, 37.661470);
    
    MWDrawLine *drawLine0194 = [[MWDrawLine alloc] init];
    drawLine0194.startPoint = CGPointMake(1667, 428.5);
    drawLine0194.endPoint = CGPointMake(1705.5, 428.5);
    drawLine0194.width = 12;
    drawLine0194.color = line0006.color;
    [station0111.drawPrimitives addObject:drawLine0194];
    
    MWDrawTextLine *drawTextLine0212 = [[MWDrawTextLine alloc] init];
    drawTextLine0212.text = station0111.nameOriginal;
    drawTextLine0212.fontName = @"HelveticaNeue";
    drawTextLine0212.fontColor = [UIColor blackColor];
    drawTextLine0212.fontSize = 32;
    drawTextLine0212.origin = CGPointMake(1714, 403);
    [station0111.nameOriginalTextPrimitives addObject:drawTextLine0212];
    
    MWDrawTextLine *drawTextLine0213 = [[MWDrawTextLine alloc] init];
    drawTextLine0213.text = station0111.nameEnglish;
    drawTextLine0213.fontName = @"HelveticaNeue";
    drawTextLine0213.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0213.fontSize = 18;
    drawTextLine0213.origin = CGPointMake(1710, 438);
    [station0111.nameEnglishTextPrimitives addObject:drawTextLine0213];
    
    // Добавляем вершину
    edge0042.finishVertex = vertex0031;
    
    ////////////////////////////////////////////////////////////////
    // 7 - Таганско-Краснопресненская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Котельники" до "Пролетарская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0043 = [[MWEdge alloc] init];
    edge0043.identifier = @"edge0043";
    edge0043.developmentName = @"Ребро: Котельники - Пролетарская";
    [self.edges addObject:edge0043];
    
    // Добавляем линию
    edge0043.line = line0007;

    // Добавляем вершину
    edge0043.startVertex = vertex0032;
    
    // Добавляем станцию "Котельники"
    MWStation *station0197 = [[MWStation alloc] init];
    station0197.identifier = @"station0197";
    [edge0043.elements addObject:station0197];
    
    station0197.nameOriginal = @"Котельники";
    station0197.nameEnglish = @"Kotelniki";
    station0197.mapLocation = CGPointMake(2307.5, 2857);
    station0197.geoLocation = CGPointMake(55.6743, 37.8582);

    MWDrawLine *drawLine0387 = [[MWDrawLine alloc] init];
    drawLine0387.startPoint = CGPointMake(2288, 2857);
    drawLine0387.endPoint = CGPointMake(2326.5, 2857);
    drawLine0387.width = 12;
    drawLine0387.color = line0007.color;
    [station0197.drawPrimitives addObject:drawLine0387];

    MWDrawTextLine *drawTextLine0423 = [[MWDrawTextLine alloc] init];
    drawTextLine0423.text = station0197.nameOriginal;
    drawTextLine0423.fontName = @"HelveticaNeue";
    drawTextLine0423.fontColor = [UIColor blackColor];
    drawTextLine0423.fontSize = 32;
    drawTextLine0423.origin = CGPointMake(2335, 2831.5);
    [station0197.nameOriginalTextPrimitives addObject:drawTextLine0423];
    
    MWDrawTextLine *drawTextLine0424 = [[MWDrawTextLine alloc] init];
    drawTextLine0424.text = station0197.nameEnglish;
    drawTextLine0424.fontName = @"HelveticaNeue";
    drawTextLine0424.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0424.fontSize = 18;
    drawTextLine0424.origin = CGPointMake(2331, 2866.5);
    [station0197.nameEnglishTextPrimitives addObject:drawTextLine0424];

    // Добавляем перегон
    MWHaul *haul0185 = [[MWHaul alloc] init];
    haul0185.identifier = @"haul0185";
    haul0185.length = 1460;
    [edge0043.elements addObject:haul0185];
    
    MWDrawLine *drawLine0388 = [[MWDrawLine alloc] init];
    drawLine0388.startPoint = CGPointMake(2307.5, 2768);
    drawLine0388.endPoint = CGPointMake(2307.5, 2857);
    drawLine0388.width = 14.5;
    drawLine0388.color = line0007.color;
    [haul0185.drawPrimitives addObject:drawLine0388];
    
    // Добавляем станцию "Жулебино"
    MWStation *station0112 = [[MWStation alloc] init];
    station0112.identifier = @"station0112";
    [edge0043.elements addObject:station0112];
    
    station0112.nameOriginal = @"Жулебино";
    station0112.nameEnglish = @"Zhulebino";
    station0112.mapLocation = CGPointMake(2307.5, 2768.5);
    station0112.geoLocation = CGPointMake(55.684259, 37.854868);
    
    MWDrawLine *drawLine0195 = [[MWDrawLine alloc] init];
    drawLine0195.startPoint = CGPointMake(2307.5, 2768.5);
    drawLine0195.endPoint = CGPointMake(2326.5, 2768.5);
    drawLine0195.width = 12;
    drawLine0195.color = line0007.color;
    [station0112.drawPrimitives addObject:drawLine0195];
    
    MWDrawTextLine *drawTextLine0214 = [[MWDrawTextLine alloc] init];
    drawTextLine0214.text = station0112.nameOriginal;
    drawTextLine0214.fontName = @"HelveticaNeue";
    drawTextLine0214.fontColor = [UIColor blackColor];
    drawTextLine0214.fontSize = 32;
    drawTextLine0214.origin = CGPointMake(2335, 2743);
    [station0112.nameOriginalTextPrimitives addObject:drawTextLine0214];
    
    MWDrawTextLine *drawTextLine0215 = [[MWDrawTextLine alloc] init];
    drawTextLine0215.text = station0112.nameEnglish;
    drawTextLine0215.fontName = @"HelveticaNeue";
    drawTextLine0215.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0215.fontSize = 18;
    drawTextLine0215.origin = CGPointMake(2331, 2778);
    [station0112.nameEnglishTextPrimitives addObject:drawTextLine0215];
    
    // Добавляем перегон
    MWHaul *haul0107 = [[MWHaul alloc] init];
    haul0107.identifier = @"haul0107";
    haul0107.length = 2090;
    [edge0043.elements addObject:haul0107];
    
    MWDrawLine *drawLine0196 = [[MWDrawLine alloc] init];
    drawLine0196.startPoint = CGPointMake(2307.5, 2768.5);
    drawLine0196.endPoint = CGPointMake(2307.5, 2652.5);
    drawLine0196.width = 14.5;
    drawLine0196.color = line0007.color;
    [haul0107.drawPrimitives addObject:drawLine0196];
    
    // Добавляем станцию "Лермонтовский проспект"
    MWStation *station0113 = [[MWStation alloc] init];
    station0113.identifier = @"station0113";
    [edge0043.elements addObject:station0113];

    station0113.nameOriginal = @"Лермонтовский проспект";
    station0113.nameEnglish = @"Lermontovsky Prospekt";
    station0113.mapLocation = CGPointMake(2307.5, 2652.5);
    station0113.geoLocation = CGPointMake(55.701248, 37.852571);
    
    MWDrawLine *drawLine0197 = [[MWDrawLine alloc] init];
    drawLine0197.startPoint = CGPointMake(2307.5, 2652.5);
    drawLine0197.endPoint = CGPointMake(2326.5, 2652.5);
    drawLine0197.width = 12;
    drawLine0197.color = line0007.color;
    [station0113.drawPrimitives addObject:drawLine0197];
    
    MWDrawTextLine *drawTextLine0216 = [[MWDrawTextLine alloc] init];
    drawTextLine0216.text = @"Лермонтовский";
    drawTextLine0216.fontName = @"HelveticaNeue";
    drawTextLine0216.fontColor = [UIColor blackColor];
    drawTextLine0216.fontSize = 32;
    drawTextLine0216.origin = CGPointMake(2335, 2627);
    [station0113.nameOriginalTextPrimitives addObject:drawTextLine0216];

    MWDrawTextLine *drawTextLine0217 = [[MWDrawTextLine alloc] init];
    drawTextLine0217.text = @"проспект";
    drawTextLine0217.fontName = @"HelveticaNeue";
    drawTextLine0217.fontColor = [UIColor blackColor];
    drawTextLine0217.fontSize = 32;
    drawTextLine0217.origin = CGPointMake(2335, 2660);
    [station0113.nameOriginalTextPrimitives addObject:drawTextLine0217];
    
    MWDrawTextLine *drawTextLine0218 = [[MWDrawTextLine alloc] init];
    drawTextLine0218.text = station0113.nameEnglish;
    drawTextLine0218.fontName = @"HelveticaNeue";
    drawTextLine0218.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0218.fontSize = 18;
    drawTextLine0218.origin = CGPointMake(2331, 2695);
    [station0113.nameEnglishTextPrimitives addObject:drawTextLine0218];
    
    // Добавляем перегон
    MWHaul *haul0108 = [[MWHaul alloc] init];
    haul0108.identifier = @"haul0108";
    haul0108.length = 2680;
    [edge0043.elements addObject:haul0108];

    MWDrawLine *drawLine0198 = [[MWDrawLine alloc] init];
    drawLine0198.startPoint = CGPointMake(2307.5, 2653);
    drawLine0198.endPoint = CGPointMake(2307.5, 2565.5);
    drawLine0198.width = 14.5;
    drawLine0198.color = line0007.color;
    [haul0108.drawPrimitives addObject:drawLine0198];
    
    // Добавляем станцию "Выхино"
    MWStation *station0114 = [[MWStation alloc] init];
    station0114.identifier = @"station0114";
    [edge0043.elements addObject:station0114];

    station0114.nameOriginal = @"Выхино";
    station0114.nameEnglish = @"Vyhino";
    station0114.mapLocation = CGPointMake(2307.5, 2565.5);
    station0114.geoLocation = CGPointMake(55.715650, 37.817906);

    MWDrawLine *drawLine0199 = [[MWDrawLine alloc] init];
    drawLine0199.startPoint = CGPointMake(2307.5, 2565.5);
    drawLine0199.endPoint = CGPointMake(2326.5, 2565.5);
    drawLine0199.width = 12;
    drawLine0199.color = line0007.color;
    [station0114.drawPrimitives addObject:drawLine0199];

    MWDrawTextLine *drawTextLine0219 = [[MWDrawTextLine alloc] init];
    drawTextLine0219.text = station0114.nameOriginal;
    drawTextLine0219.fontName = @"HelveticaNeue";
    drawTextLine0219.fontColor = [UIColor blackColor];
    drawTextLine0219.fontSize = 32;
    drawTextLine0219.origin = CGPointMake(2335, 2540);
    [station0114.nameOriginalTextPrimitives addObject:drawTextLine0219];

    MWDrawTextLine *drawTextLine0220 = [[MWDrawTextLine alloc] init];
    drawTextLine0220.text = station0114.nameEnglish;
    drawTextLine0220.fontName = @"HelveticaNeue";
    drawTextLine0220.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0220.fontSize = 18;
    drawTextLine0220.origin = CGPointMake(2331, 2575);
    [station0114.nameEnglishTextPrimitives addObject:drawTextLine0220];
    
    // Добавляем перегон
    MWHaul *haul0109 = [[MWHaul alloc] init];
    haul0109.identifier = @"haul0109";
    haul0109.length = 1600;
    [edge0043.elements addObject:haul0109];
    
    MWDrawLine *drawLine0200 = [[MWDrawLine alloc] init];
    drawLine0200.startPoint = CGPointMake(2307.5, 2566);
    drawLine0200.endPoint = CGPointMake(2307.5, 2446.0);
    drawLine0200.width = 14.5;
    drawLine0200.color = line0007.color;
    [haul0109.drawPrimitives addObject:drawLine0200];
    
    // Добавляем станцию "Рязанский проспект"
    MWStation *station0115 = [[MWStation alloc] init];
    station0115.identifier = @"station0115";
    [edge0043.elements addObject:station0115];
    
    station0115.nameOriginal = @"Рязанский проспект";
    station0115.nameEnglish = @"Ryazansky Prospekt";
    station0115.mapLocation = CGPointMake(2307.5, 2446.0);
    station0115.geoLocation = CGPointMake(55.716923, 37.793282);
    
    MWDrawLine *drawLine0201 = [[MWDrawLine alloc] init];
    drawLine0201.startPoint = CGPointMake(2307.5, 2446.0);
    drawLine0201.endPoint = CGPointMake(2326.5, 2446.0);
    drawLine0201.width = 12;
    drawLine0201.color = line0007.color;
    [station0115.drawPrimitives addObject:drawLine0201];
    
    MWDrawTextLine *drawTextLine0221 = [[MWDrawTextLine alloc] init];
    drawTextLine0221.text = @"Рязанский";
    drawTextLine0221.fontName = @"HelveticaNeue";
    drawTextLine0221.fontColor = [UIColor blackColor];
    drawTextLine0221.fontSize = 32;
    drawTextLine0221.origin = CGPointMake(2335, 2421.5);
    [station0115.nameOriginalTextPrimitives addObject:drawTextLine0221];
    
    MWDrawTextLine *drawTextLine0222 = [[MWDrawTextLine alloc] init];
    drawTextLine0222.text = @"проспект";
    drawTextLine0222.fontName = @"HelveticaNeue";
    drawTextLine0222.fontColor = [UIColor blackColor];
    drawTextLine0222.fontSize = 32;
    drawTextLine0222.origin = CGPointMake(2335, 2453);
    [station0115.nameOriginalTextPrimitives addObject:drawTextLine0222];
    
    MWDrawTextLine *drawTextLine0223 = [[MWDrawTextLine alloc] init];
    drawTextLine0223.text = station0115.nameEnglish;
    drawTextLine0223.fontName = @"HelveticaNeue";
    drawTextLine0223.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0223.fontSize = 18;
    drawTextLine0223.origin = CGPointMake(2331, 2488);
    [station0115.nameEnglishTextPrimitives addObject:drawTextLine0223];
    
    // Добавляем перегон
    MWHaul *haul0110 = [[MWHaul alloc] init];
    haul0110.identifier = @"haul0110";
    haul0110.length = 2220;
    [edge0043.elements addObject:haul0110];
    
    MWDrawLine *drawLine0202 = [[MWDrawLine alloc] init];
    drawLine0202.startPoint = CGPointMake(2307.5, 2446.5);
    drawLine0202.endPoint = CGPointMake(2307.5, 2357.5);
    drawLine0202.width = 14.5;
    drawLine0202.color = line0007.color;
    [haul0110.drawPrimitives addObject:drawLine0202];
    
    // Добавляем станцию "Кузьминки"
    MWStation *station0116 = [[MWStation alloc] init];
    station0116.identifier = @"station0116";
    [edge0043.elements addObject:station0116];
    
    station0116.nameOriginal = @"Кузьминки";
    station0116.nameEnglish = @"Kuzminki";
    station0116.mapLocation = CGPointMake(2307.5, 2357.5);
    station0116.geoLocation = CGPointMake(55.705475, 37.765666);
    
    MWDrawLine *drawLine0203 = [[MWDrawLine alloc] init];
    drawLine0203.startPoint = CGPointMake(2307.5, 2357.5);
    drawLine0203.endPoint = CGPointMake(2326.5, 2357.5);
    drawLine0203.width = 12;
    drawLine0203.color = line0007.color;
    [station0116.drawPrimitives addObject:drawLine0203];
    
    MWDrawTextLine *drawTextLine0224 = [[MWDrawTextLine alloc] init];
    drawTextLine0224.text = station0116.nameOriginal;
    drawTextLine0224.fontName = @"HelveticaNeue";
    drawTextLine0224.fontColor = [UIColor blackColor];
    drawTextLine0224.fontSize = 32;
    drawTextLine0224.origin = CGPointMake(2335, 2333);
    [station0116.nameOriginalTextPrimitives addObject:drawTextLine0224];
    
    MWDrawTextLine *drawTextLine0225 = [[MWDrawTextLine alloc] init];
    drawTextLine0225.text = station0116.nameEnglish;
    drawTextLine0225.fontName = @"HelveticaNeue";
    drawTextLine0225.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0225.fontSize = 18;
    drawTextLine0225.origin = CGPointMake(2331, 2368);
    [station0116.nameEnglishTextPrimitives addObject:drawTextLine0225];
    
    // Добавляем перегон
    MWHaul *haul0111 = [[MWHaul alloc] init];
    haul0111.identifier = @"station0111";
    haul0111.length = 2240;
    [edge0043.elements addObject:haul0111];
    
    MWDrawLine *drawLine0204 = [[MWDrawLine alloc] init];
    drawLine0204.startPoint = CGPointMake(2307.5, 2358.0);
    drawLine0204.endPoint = CGPointMake(2307.5, 2269.5);
    drawLine0204.width = 14.5;
    drawLine0204.color = line0007.color;
    [haul0111.drawPrimitives addObject:drawLine0204];
    
    // Добавляем станцию "Текстильщики"
    MWStation *station0117 = [[MWStation alloc] init];
    station0117.identifier = @"station0117";
    [edge0043.elements addObject:station0117];
    
    station0117.nameOriginal = @"Текстильщики";
    station0117.nameEnglish = @"Tekstilshchiki";
    station0117.mapLocation = CGPointMake(2307.5, 2269.5);
    station0117.geoLocation = CGPointMake(55.708955, 37.731287);

    MWDrawLine *drawLine0205 = [[MWDrawLine alloc] init];
    drawLine0205.startPoint = CGPointMake(2307.5, 2269.5);
    drawLine0205.endPoint = CGPointMake(2326.5, 2269.5);
    drawLine0205.width = 12;
    drawLine0205.color = line0007.color;
    [station0117.drawPrimitives addObject:drawLine0205];

    MWDrawTextLine *drawTextLine0226 = [[MWDrawTextLine alloc] init];
    drawTextLine0226.text = station0117.nameOriginal;
    drawTextLine0226.fontName = @"HelveticaNeue";
    drawTextLine0226.fontColor = [UIColor blackColor];
    drawTextLine0226.fontSize = 32;
    drawTextLine0226.origin = CGPointMake(2334, 2245);
    [station0117.nameOriginalTextPrimitives addObject:drawTextLine0226];
    
    MWDrawTextLine *drawTextLine0227 = [[MWDrawTextLine alloc] init];
    drawTextLine0227.text = station0117.nameEnglish;
    drawTextLine0227.fontName = @"HelveticaNeue";
    drawTextLine0227.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0227.fontSize = 18;
    drawTextLine0227.origin = CGPointMake(2331, 2280);
    [station0117.nameEnglishTextPrimitives addObject:drawTextLine0227];
    
    // Добавляем перегон
    MWHaul *haul0112 = [[MWHaul alloc] init];
    haul0112.identifier = @"haul0112";
    haul0112.length = 3370;
    [edge0043.elements addObject:haul0112];
    
    MWDrawLine *drawLine0206 = [[MWDrawLine alloc] init];
    drawLine0206.startPoint = CGPointMake(2307.5, 2270);
    drawLine0206.endPoint = CGPointMake(2307.5, 2240);
    drawLine0206.width = 14.5;
    drawLine0206.color = line0007.color;
    [haul0112.drawPrimitives addObject:drawLine0206];
    
    MWDrawArc *drawArc0044 = [[MWDrawArc alloc] init];
    drawArc0044.center = CGPointMake(2197.5, 2240);
    drawArc0044.startRadians = 315  * M_PI / 180;
    drawArc0044.endRadians = 0 * M_PI / 180;
    drawArc0044.radius = 110;
    drawArc0044.width = 14.5;
    drawArc0044.color = line0007.color;
    [haul0112.drawPrimitives addObject:drawArc0044];

    // Добавляем станцию "Волгоградский проспект"
    MWStation *station0118 = [[MWStation alloc] init];
    station0118.identifier = @"station0118";
    [edge0043.elements addObject:station0118];
    
    station0118.nameOriginal = @"Волгоградский проспект";
    station0118.nameEnglish = @"Volgogradsky Prospekt";
    station0118.mapLocation = CGPointMake(2275.5, 2161.5);
    station0118.geoLocation = CGPointMake(55.725000, 37.686930);

    MWDrawLine *drawLine0207 = [[MWDrawLine alloc] init];
    drawLine0207.startPoint = CGPointMake(2274.5, 2160.5);
    drawLine0207.endPoint = CGPointMake(2287.5, 2147.5);
    drawLine0207.width = 12;
    drawLine0207.color = line0007.color;
    [station0118.drawPrimitives addObject:drawLine0207];
    
    MWDrawTextLine *drawTextLine0228 = [[MWDrawTextLine alloc] init];
    drawTextLine0228.text = @"Волгоградский";
    drawTextLine0228.fontName = @"HelveticaNeue";
    drawTextLine0228.fontColor = [UIColor blackColor];
    drawTextLine0228.fontSize = 32;
    drawTextLine0228.origin = CGPointMake(2292, 2083);
    [station0118.nameOriginalTextPrimitives addObject:drawTextLine0228];

    MWDrawTextLine *drawTextLine0229 = [[MWDrawTextLine alloc] init];
    drawTextLine0229.text = @"проспект";
    drawTextLine0229.fontName = @"HelveticaNeue";
    drawTextLine0229.fontColor = [UIColor blackColor];
    drawTextLine0229.fontSize = 32;
    drawTextLine0229.origin = CGPointMake(2292, 2112);
    [station0118.nameOriginalTextPrimitives addObject:drawTextLine0229];
    
    MWDrawTextLine *drawTextLine0230 = [[MWDrawTextLine alloc] init];
    drawTextLine0230.text = station0118.nameEnglish;
    drawTextLine0230.fontName = @"HelveticaNeue";
    drawTextLine0230.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0230.fontSize = 18;
    drawTextLine0230.origin = CGPointMake(2300, 2147);
    [station0118.nameEnglishTextPrimitives addObject:drawTextLine0230];
    
    // Добавляем перегон
    MWHaul *haul0113 = [[MWHaul alloc] init];
    haul0113.identifier = @"haul0113";
    haul0113.length = 1480;
    [edge0043.elements addObject:haul0113];
    
    MWDrawLine *drawLine0208 = [[MWDrawLine alloc] init];
    drawLine0208.startPoint = CGPointMake(2275.8, 2162.8);
    drawLine0208.endPoint = CGPointMake(2196.5, 2083.5);
    drawLine0208.width = 14.5;
    drawLine0208.color = line0007.color;
    [haul0113.drawPrimitives addObject:drawLine0208];
    
    // Добавляем станцию "Пролетарская"
    MWStation *station0119 = [[MWStation alloc] init];
    station0119.identifier = @"station0119";
    [edge0043.elements addObject:station0119];
    
    station0119.nameOriginal = @"Пролетарская";
    station0119.nameEnglish = @"Proletarskaya";
    station0119.mapLocation = CGPointMake(2196.5, 2083.5);
    station0119.geoLocation = CGPointMake(55.731711, 37.666370);
    
    MWDrawTextLine *drawTextLine0231 = [[MWDrawTextLine alloc] init];
    drawTextLine0231.text = station0119.nameOriginal;
    drawTextLine0231.fontName = @"HelveticaNeue";
    drawTextLine0231.fontColor = [UIColor blackColor];
    drawTextLine0231.fontSize = 32;
    drawTextLine0231.origin = CGPointMake(2196, 2026);
    [station0119.nameOriginalTextPrimitives addObject:drawTextLine0231];
    
    MWDrawTextLine *drawTextLine0232 = [[MWDrawTextLine alloc] init];
    drawTextLine0232.text = station0119.nameEnglish;
    drawTextLine0232.fontName = @"HelveticaNeue";
    drawTextLine0232.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0232.fontSize = 18;
    drawTextLine0232.origin = CGPointMake(2253, 2010);
    [station0119.nameEnglishTextPrimitives addObject:drawTextLine0232];
    
    // Добавляем вершину
    edge0043.finishVertex = vertex0033;
    
    // Создаем участок линии от "Пролетарская" до "Таганская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0044 = [[MWEdge alloc] init];
    edge0044.identifier = @"edge0044";
    edge0044.developmentName = @"Ребро: Пролетарская - Таганская";
    [self.edges addObject:edge0044];
    
    // Добавляем линию
    edge0044.line = line0007;

    // Добавляем вершину
    edge0044.startVertex = vertex0033;
    
    // Добавляем станцию "Пролетарская"
    [edge0044.elements addObject:station0119];
    
    // Добавляем перегон
    MWHaul *haul0114 = [[MWHaul alloc] init];
    haul0114.identifier = @"haul0114";
    haul0114.length = 1200;
    [edge0044.elements addObject:haul0114];
    
    MWDrawLine *drawLine0209 = [[MWDrawLine alloc] init];
    drawLine0209.startPoint = CGPointMake(2197, 2084);
    drawLine0209.endPoint = CGPointMake(2021.5, 1908.5);
    drawLine0209.width = 14.5;
    drawLine0209.color = line0007.color;
    [haul0114.drawPrimitives addObject:drawLine0209];
    
    // Добавляем станцию "Таганская"
    MWStation *station0120 = [[MWStation alloc] init];
    station0120.identifier = @"station0120";
    [edge0044.elements addObject:station0120];
    
    station0120.nameOriginal = @"Таганская";
    station0120.nameEnglish = @"Taganskaya";
    station0120.mapLocation = CGPointMake(2021.5, 1908.5);
    station0120.geoLocation = CGPointMake(55.739456, 37.653244);
    
    [station0120.nameOriginalTextPrimitives addObject:drawTextLine0167];
    [station0120.nameEnglishTextPrimitives addObject:drawTextLine0168];
    station0120.showNameOnMap = false;
    
    // Добавляем вершину
    edge0044.finishVertex = vertex0028;
    
    // Создаем участок линии от "Таганская" до "Китай-город"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0045 = [[MWEdge alloc] init];
    edge0045.identifier = @"edge0045";
    edge0045.developmentName = @"Ребро: Таганская - Китай-город";
    [self.edges addObject:edge0045];
    
    // Добавляем линию
    edge0045.line = line0007;

    // Добавляем вершину
    edge0045.startVertex = vertex0028;
    
    // Добавляем станцию "Таганская"
    [edge0045.elements addObject:station0120];
    
    // Добавляем перегон
    MWHaul *haul0115 = [[MWHaul alloc] init];
    haul0115.identifier = @"haul0115";
    haul0115.length = 2100;
    [edge0045.elements addObject:haul0115];
    
    MWDrawLine *drawLine0210 = [[MWDrawLine alloc] init];
    drawLine0210.startPoint = CGPointMake(1838.5, 1725.5);
    drawLine0210.endPoint = CGPointMake(2022, 1909);
    drawLine0210.width = 14.5;
    drawLine0210.color = line0007.color;
    [haul0115.drawPrimitives addObject:drawLine0210];
    
    // Добавляем станцию "Китай-город"
    MWStation *station0121 = [[MWStation alloc] init];
    station0121.identifier = @"station0121";
    [edge0045.elements addObject:station0121];
    
    station0121.nameOriginal = @"Китай-город";
    station0121.nameEnglish = @"Kitay-gorod";
    station0121.mapLocation = CGPointMake(1838.5, 1725.5);
    station0121.geoLocation = CGPointMake(55.756951, 37.630934);

    [station0121.nameOriginalTextPrimitives addObject:drawTextLine0193];
    [station0121.nameEnglishTextPrimitives addObject:drawTextLine0194];
    station0121.showNameOnMap = false;
    
    // Добавляем вершину
    edge0045.finishVertex = vertex0030;
    
    // Создаем участок линии от "Китай-город" до "Кузнецкий мост"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0046 = [[MWEdge alloc] init];
    edge0046.identifier = @"edge0046";
    edge0046.developmentName = @"Ребро: Китай-город - Кузнецкий мост";
    [self.edges addObject:edge0046];
    
    // Добавляем линию
    edge0046.line = line0007;

    // Добавляем вершину
    edge0046.startVertex = vertex0030;
    
    // Добавляем станцию "Китай-город"
    [edge0046.elements addObject:station0121];
    
    // Добавляем перегон
    MWHaul *haul0116 = [[MWHaul alloc] init];
    haul0116.identifier = @"haul0116";
    haul0116.length = 994;
    [edge0046.elements addObject:haul0116];

    MWDrawLine *drawLine0211 = [[MWDrawLine alloc] init];
    drawLine0211.startPoint = CGPointMake(1839, 1726);
    drawLine0211.endPoint = CGPointMake(1607.5, 1494.5);
    drawLine0211.width = 14.5;
    drawLine0211.color = line0007.color;
    [haul0116.drawPrimitives addObject:drawLine0211];
    
    MWDrawArc *drawArc0045 = [[MWDrawArc alloc] init];
    drawArc0045.center = CGPointMake(1565.5, 1537.5);
    drawArc0045.startRadians = 270  * M_PI / 180;
    drawArc0045.endRadians = 315 * M_PI / 180;
    drawArc0045.radius = 60;
    drawArc0045.width = 14.5;
    drawArc0045.color = line0007.color;
    [haul0116.drawPrimitives addObject:drawArc0045];
    
    MWDrawLine *drawLine0212 = [[MWDrawLine alloc] init];
    drawLine0212.startPoint = CGPointMake(1566, 1477.5);
    drawLine0212.endPoint = CGPointMake(1552.5, 1477.5);
    drawLine0212.width = 14.5;
    drawLine0212.color = line0007.color;
    [haul0116.drawPrimitives addObject:drawLine0212];
    
    // Добавляем станцию "Кузнецкий мост"
    MWStation *station0122 = [[MWStation alloc] init];
    station0122.identifier = @"station0122";
    [edge0046.elements addObject:station0122];
    
    station0122.nameOriginal = @"Кузнецкий мост";
    station0122.nameEnglish = @"Kuznetsky Most";
    station0122.mapLocation = CGPointMake(1552.5, 1477.5);
    station0122.geoLocation = CGPointMake(55.761549, 37.624413);
    
    MWDrawTextLine *drawTextLine0233 = [[MWDrawTextLine alloc] init];
    drawTextLine0233.text = @"Кузнецкий";
    drawTextLine0233.fontName = @"HelveticaNeue";
    drawTextLine0233.fontColor = [UIColor blackColor];
    drawTextLine0233.fontSize = 32;
    drawTextLine0233.origin = CGPointMake(1382, 1489);
    [station0122.nameOriginalTextPrimitives addObject:drawTextLine0233];

    MWDrawTextLine *drawTextLine0234 = [[MWDrawTextLine alloc] init];
    drawTextLine0234.text = @"Мост";
    drawTextLine0234.fontName = @"HelveticaNeue";
    drawTextLine0234.fontColor = [UIColor blackColor];
    drawTextLine0234.fontSize = 32;
    drawTextLine0234.origin = CGPointMake(1467, 1518);
    [station0122.nameOriginalTextPrimitives addObject:drawTextLine0234];

    MWDrawTextLine *drawTextLine0235 = [[MWDrawTextLine alloc] init];
    drawTextLine0235.text = station0122.nameEnglish;
    drawTextLine0235.fontName = @"HelveticaNeue";
    drawTextLine0235.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0235.fontSize = 18;
    drawTextLine0235.origin = CGPointMake(1416, 1551);
    [station0122.nameEnglishTextPrimitives addObject:drawTextLine0235];
    
    // Добавляем вершину
    edge0046.finishVertex = vertex0005;
    
    // Создаем участок линии от "Кузнецкий мост" до "Пушкинская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0047 = [[MWEdge alloc] init];
    edge0047.identifier = @"edge0047";
    edge0047.developmentName = @"Ребро: Кузнецкий мост - Пушкинская";
    [self.edges addObject:edge0047];
    
    // Добавляем линию
    edge0047.line = line0007;

    // Добавляем вершину
    edge0047.startVertex = vertex0005;
    
    // Добавляем станцию "Кузнецкий мост"
    [edge0047.elements addObject:station0122];
    
    // Добавляем перегон
    MWHaul *haul0117 = [[MWHaul alloc] init];
    haul0117.identifier = @"haul0117";
    haul0117.length = 1400;
    [edge0047.elements addObject:haul0117];

    MWDrawLine *drawLine0213 = [[MWDrawLine alloc] init];
    drawLine0213.startPoint = CGPointMake(1553, 1477.5);
    drawLine0213.endPoint = CGPointMake(1213.5, 1477.5);
    drawLine0213.width = 14.5;
    drawLine0213.color = line0007.color;
    [haul0117.drawPrimitives addObject:drawLine0213];
    
    // Добавляем станцию "Пушкинская"
    MWStation *station0123 = [[MWStation alloc] init];
    station0123.identifier = @"station0123";
    [edge0047.elements addObject:station0123];
    
    station0123.nameOriginal = @"Пушкинская";
    station0123.nameEnglish = @"Pushkinskaya";
    station0123.mapLocation = CGPointMake(1213.5, 1477.5);
    station0123.geoLocation = CGPointMake(55.764956, 37.605908);
    
    MWDrawFillCircle *fillCircle0080 = [[MWDrawFillCircle alloc] init];
    fillCircle0080.center = CGPointMake(1213.5, 1477.5);
    fillCircle0080.radius = 4;
    fillCircle0080.fillColor = [UIColor whiteColor];
    [station0123.drawPrimitives addObject:fillCircle0080];

    MWDrawTextLine *drawTextLine0236 = [[MWDrawTextLine alloc] init];
    drawTextLine0236.text = station0123.nameOriginal;;
    drawTextLine0236.fontName = @"HelveticaNeue";
    drawTextLine0236.fontColor = [UIColor blackColor];
    drawTextLine0236.fontSize = 32;
    drawTextLine0236.origin = CGPointMake(1122, 1420);
    [station0123.nameOriginalTextPrimitives addObject:drawTextLine0236];
    
    MWDrawTextLine *drawTextLine0237 = [[MWDrawTextLine alloc] init];
    drawTextLine0237.text = station0123.nameEnglish;
    drawTextLine0237.fontName = @"HelveticaNeue";
    drawTextLine0237.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0237.fontSize = 18;
    drawTextLine0237.origin = CGPointMake(1161, 1403);
    [station0123.nameEnglishTextPrimitives addObject:drawTextLine0237];
    
    // Добавляем вершину
    edge0047.finishVertex = vertex0014;
    
    // Создаем участок линии от "Пушкинская" до "Баррикадная"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0048 = [[MWEdge alloc] init];
    edge0048.identifier = @"edge0048";
    edge0048.developmentName = @"Ребро: Пушкинская - Баррикадная";
    [self.edges addObject:edge0048];
    
    // Добавляем линию
    edge0048.line = line0007;

    // Добавляем вершину
    edge0048.startVertex = vertex0014;
    
    // Добавляем станцию "Пушкинская"
    [edge0048.elements addObject:station0123];
    
    // Добавляем перегон
    MWHaul *haul0118 = [[MWHaul alloc] init];
    haul0118.identifier = @"edge0118";
    haul0118.length = 1540;
    [edge0048.elements addObject:haul0118];
    
    MWDrawLine *drawLine0214 = [[MWDrawLine alloc] init];
    drawLine0214.startPoint = CGPointMake(1214, 1477.5);
    drawLine0214.endPoint = CGPointMake(869.5, 1477.5);
    drawLine0214.width = 14.5;
    drawLine0214.color = line0007.color;
    [haul0118.drawPrimitives addObject:drawLine0214];
    
    // Добавляем станцию "Баррикадная"
    MWStation *station0124 = [[MWStation alloc] init];
    station0124.identifier = @"station0124";
    [edge0048.elements addObject:station0124];
    
    station0124.nameOriginal = @"Баррикадная";
    station0124.nameEnglish = @"Barrikadnaya";
    station0124.mapLocation = CGPointMake(869.5, 1477.5);
    station0124.geoLocation = CGPointMake(55.760707, 37.581250);
    
    MWDrawFillCircle *fillCircle0079 = [[MWDrawFillCircle alloc] init];
    fillCircle0079.center = CGPointMake(869.5, 1477.5);
    fillCircle0079.radius = 4;
    fillCircle0079.fillColor = [UIColor whiteColor];
    [station0124.drawPrimitives addObject:fillCircle0079];

    MWDrawTextLine *drawTextLine0238 = [[MWDrawTextLine alloc] init];
    drawTextLine0238.text = station0124.nameOriginal;
    drawTextLine0238.fontName = @"HelveticaNeue";
    drawTextLine0238.fontColor = [UIColor blackColor];
    drawTextLine0238.fontSize = 32;
    drawTextLine0238.origin = CGPointMake(864, 1420);
    [station0124.nameOriginalTextPrimitives addObject:drawTextLine0238];
    
    MWDrawTextLine *drawTextLine0239 = [[MWDrawTextLine alloc] init];
    drawTextLine0239.text = station0124.nameEnglish;
    drawTextLine0239.fontName = @"HelveticaNeue";
    drawTextLine0239.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0239.fontSize = 18;
    drawTextLine0239.origin = CGPointMake(875, 1403);
    [station0124.nameEnglishTextPrimitives addObject:drawTextLine0239];
    
    // Добавляем вершину
    edge0048.finishVertex = vertex0025;
    
    // Создаем участок линии от "Баррикадная" до "Планерная"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0049 = [[MWEdge alloc] init];
    edge0049.identifier = @"edge0049";
    edge0049.developmentName = @"Ребро: Баррикадная - Планерная";
    [self.edges addObject:edge0049];
    
    // Добавляем линию
    edge0049.line = line0007;

    // Добавляем вершину
    edge0049.startVertex = vertex0025;
    
    // Добавляем станцию "Баррикадная"
    [edge0049.elements addObject:station0124];
    
    // Добавляем перегон
    MWHaul *haul0119 = [[MWHaul alloc] init];
    haul0119.identifier = @"haul0119";
    haul0119.length = 1330;
    [edge0049.elements addObject:haul0119];
    
    MWDrawLine *drawLine0215 = [[MWDrawLine alloc] init];
    drawLine0215.startPoint = CGPointMake(870, 1477.5);
    drawLine0215.endPoint = CGPointMake(774.5, 1477.5);
    drawLine0215.width = 14.5;
    drawLine0215.color = line0007.color;
    [haul0119.drawPrimitives addObject:drawLine0215];
    
    MWDrawArc *drawArc0046 = [[MWDrawArc alloc] init];
    drawArc0046.center = CGPointMake(775, 1377.5);
    drawArc0046.startRadians = 90  * M_PI / 180;
    drawArc0046.endRadians = 135 * M_PI / 180;
    drawArc0046.radius = 100;
    drawArc0046.width = 14.5;
    drawArc0046.color = line0007.color;
    [haul0119.drawPrimitives addObject:drawArc0046];

    MWDrawLine *drawLine0216 = [[MWDrawLine alloc] init];
    drawLine0216.startPoint = CGPointMake(704.8, 1448.8);
    drawLine0216.endPoint = CGPointMake(637,1381);
    drawLine0216.width = 14.5;
    drawLine0216.color = line0007.color;
    [haul0119.drawPrimitives addObject:drawLine0216];
    
    // Добавляем станцию "Улица 1905 года"
    MWStation *station0125 = [[MWStation alloc] init];
    station0125.identifier = @"station0125";
    [edge0049.elements addObject:station0125];
    
    station0125.nameOriginal = @"Улица 1905 года";
    station0125.nameEnglish = @"Ulitsa 1905 goda";
    station0125.mapLocation = CGPointMake(637, 1380.5);
    station0125.geoLocation = CGPointMake(55.764702, 37.561448);
    
    MWDrawLine *drawLine0217 = [[MWDrawLine alloc] init];
    drawLine0217.startPoint = CGPointMake(637, 1381);
    drawLine0217.endPoint = CGPointMake(623, 1395);
    drawLine0217.width = 12;
    drawLine0217.color = line0007.color;
    [station0125.drawPrimitives addObject:drawLine0217];
    
    MWDrawTextLine *drawTextLine0240 = [[MWDrawTextLine alloc] init];
    drawTextLine0240.text = @"Улица";
    drawTextLine0240.fontName = @"HelveticaNeue";
    drawTextLine0240.fontColor = [UIColor blackColor];
    drawTextLine0240.fontSize = 32;
    drawTextLine0240.origin = CGPointMake(530, 1387);
    [station0125.nameOriginalTextPrimitives addObject:drawTextLine0240];

    MWDrawTextLine *drawTextLine0241 = [[MWDrawTextLine alloc] init];
    drawTextLine0241.text = @"1905 года";
    drawTextLine0241.fontName = @"HelveticaNeue";
    drawTextLine0241.fontColor = [UIColor blackColor];
    drawTextLine0241.fontSize = 32;
    drawTextLine0241.origin = CGPointMake(473, 1415);
    [station0125.nameOriginalTextPrimitives addObject:drawTextLine0241];
    
    MWDrawTextLine *drawTextLine0242 = [[MWDrawTextLine alloc] init];
    drawTextLine0242.text = @"Ulitsa 1905 (tysyacha";
    drawTextLine0242.fontName = @"HelveticaNeue";
    drawTextLine0242.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0242.fontSize = 18;
    drawTextLine0242.origin = CGPointMake(480, 1450);
    [station0125.nameEnglishTextPrimitives addObject:drawTextLine0242];

    MWDrawTextLine *drawTextLine0409 = [[MWDrawTextLine alloc] init];
    drawTextLine0409.text = @"devyatsot pyatogo) goda";
    drawTextLine0409.fontName = @"HelveticaNeue";
    drawTextLine0409.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0409.fontSize = 18;
    drawTextLine0409.origin = CGPointMake(480, 1470);
    [station0125.nameEnglishTextPrimitives addObject:drawTextLine0409];
    
    // Добавляем перегон
    MWHaul *haul0120 = [[MWHaul alloc] init];
    haul0120.identifier = @"haul0120";
    haul0120.length = 1430;
    [edge0049.elements addObject:haul0120];
    
    MWDrawLine *drawLine0218 = [[MWDrawLine alloc] init];
    drawLine0218.startPoint = CGPointMake(637.5, 1381.5);
    drawLine0218.endPoint = CGPointMake(550.5, 1294.6);
    drawLine0218.width = 14.5;
    drawLine0218.color = line0007.color;
    [haul0120.drawPrimitives addObject:drawLine0218];
    
    // Добавляем станцию "Беговая"
    MWStation *station0126 = [[MWStation alloc] init];
    station0126.identifier = @"station0126";
    [edge0049.elements addObject:station0126];
    
    station0126.nameOriginal = @"Беговая";
    station0126.nameEnglish = @"Begovaya";
    station0126.mapLocation = CGPointMake(550.5, 1294.5);
    station0126.geoLocation = CGPointMake(55.773662, 37.546757);
    
    MWDrawLine *drawLine0219 = [[MWDrawLine alloc] init];
    drawLine0219.startPoint = CGPointMake(550.5, 1294.5);
    drawLine0219.endPoint = CGPointMake(536, 1308);
    drawLine0219.width = 12;
    drawLine0219.color = line0007.color;
    [station0126.drawPrimitives addObject:drawLine0219];
    
    MWDrawTextLine *drawTextLine0243 = [[MWDrawTextLine alloc] init];
    drawTextLine0243.text = station0126.nameOriginal;
    drawTextLine0243.fontName = @"HelveticaNeue";
    drawTextLine0243.fontColor = [UIColor blackColor];
    drawTextLine0243.fontSize = 32;
    drawTextLine0243.origin = CGPointMake(420, 1302);
    [station0126.nameOriginalTextPrimitives addObject:drawTextLine0243];
    
    MWDrawTextLine *drawTextLine0244 = [[MWDrawTextLine alloc] init];
    drawTextLine0244.text = station0126.nameEnglish;
    drawTextLine0244.fontName = @"HelveticaNeue";
    drawTextLine0244.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0244.fontSize = 18;
    drawTextLine0244.origin = CGPointMake(460, 1337);
    [station0126.nameEnglishTextPrimitives addObject:drawTextLine0244];
    
    // Добавляем перегон
    MWHaul *haul0121 = [[MWHaul alloc] init];
    haul0121.identifier = @"haul0121";
    haul0121.length = 1810;
    [edge0049.elements addObject:haul0121];
    
    MWDrawLine *drawLine0220 = [[MWDrawLine alloc] init];
    drawLine0220.startPoint = CGPointMake(551, 1295);
    drawLine0220.endPoint = CGPointMake(485.5, 1229.6);
    drawLine0220.width = 14.5;
    drawLine0220.color = line0007.color;
    [haul0121.drawPrimitives addObject:drawLine0220];
    
    // Добавляем станцию "Полежаевская"
    MWStation *station0127 = [[MWStation alloc] init];
    station0127.identifier = @"station0127";
    [edge0049.elements addObject:station0127];
    
    station0127.nameOriginal = @"Полежаевская";
    station0127.nameEnglish = @"Polezhaevskaya";
    station0127.mapLocation = CGPointMake(485.5, 1229.5);
    station0127.geoLocation = CGPointMake(55.777523, 37.519503);

    MWDrawLine *drawLine0221 = [[MWDrawLine alloc] init];
    drawLine0221.startPoint = CGPointMake(485.5, 1229.5);
    drawLine0221.endPoint = CGPointMake(499.5, 1215.5);
    drawLine0221.width = 12;
    drawLine0221.color = line0007.color;
    [station0127.drawPrimitives addObject:drawLine0221];
    
    MWDrawTextLine *drawTextLine0245 = [[MWDrawTextLine alloc] init];
    drawTextLine0245.text = station0127.nameOriginal;
    drawTextLine0245.fontName = @"HelveticaNeue";
    drawTextLine0245.fontColor = [UIColor blackColor];
    drawTextLine0245.fontSize = 32;
    drawTextLine0245.origin = CGPointMake(505, 1178);
    [station0127.nameOriginalTextPrimitives addObject:drawTextLine0245];
    
    MWDrawTextLine *drawTextLine0246 = [[MWDrawTextLine alloc] init];
    drawTextLine0246.text = station0127.nameEnglish;
    drawTextLine0246.fontName = @"HelveticaNeue";
    drawTextLine0246.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0246.fontSize = 18;
    drawTextLine0246.origin = CGPointMake(501, 1161);
    [station0127.nameEnglishTextPrimitives addObject:drawTextLine0246];
    
    // Добавляем перегон
    MWHaul *haul0122 = [[MWHaul alloc] init];
    haul0122.identifier = @"haul0122";
    haul0122.length = 2490;
    [edge0049.elements addObject:haul0122];
    
    MWDrawLine *drawLine0222 = [[MWDrawLine alloc] init];
    drawLine0222.startPoint = CGPointMake(486, 1230);
    drawLine0222.endPoint = CGPointMake(450, 1194);
    drawLine0222.width = 14.5;
    drawLine0222.color = line0007.color;
    [haul0122.drawPrimitives addObject:drawLine0222];
    
    MWDrawArc *drawArc0047 = [[MWDrawArc alloc] init];
    drawArc0047.center = CGPointMake(521.5, 1124);
    drawArc0047.startRadians = 135 * M_PI / 180;
    drawArc0047.endRadians = 180 * M_PI / 180;
    drawArc0047.radius = 100;
    drawArc0047.width = 14.5;
    drawArc0047.color = line0007.color;
    [haul0122.drawPrimitives addObject:drawArc0047];

    MWDrawLine *drawLine0223 = [[MWDrawLine alloc] init];
    drawLine0223.startPoint = CGPointMake(421.5, 1124);
    drawLine0223.endPoint = CGPointMake(421.5, 1073.5);
    drawLine0223.width = 14.5;
    drawLine0223.color = line0007.color;
    [haul0122.drawPrimitives addObject:drawLine0223];
    
    // Добавляем станцию "Октябрьское поле"
    MWStation *station0128 = [[MWStation alloc] init];
    station0128.identifier = @"station0128";
    [edge0049.elements addObject:station0128];
    
    station0128.nameOriginal = @"Октябрьское поле";
    station0128.nameEnglish = @"Oktyabrskoe Pole";
    station0128.mapLocation = CGPointMake(421.5, 1073.5);
    station0128.geoLocation = CGPointMake(55.793520, 37.493537);

    MWDrawLine *drawLine0224 = [[MWDrawLine alloc] init];
    drawLine0224.startPoint = CGPointMake(421.5, 1073.5);
    drawLine0224.endPoint = CGPointMake(440.5, 1073.5);
    drawLine0224.width = 12;
    drawLine0224.color = line0007.color;
    [station0128.drawPrimitives addObject:drawLine0224];
    
    MWDrawTextLine *drawTextLine0247 = [[MWDrawTextLine alloc] init];
    drawTextLine0247.text = @"Октябрьское";
    drawTextLine0247.fontName = @"HelveticaNeue";
    drawTextLine0247.fontColor = [UIColor blackColor];
    drawTextLine0247.fontSize = 32;
    drawTextLine0247.origin = CGPointMake(448, 1049);
    [station0128.nameOriginalTextPrimitives addObject:drawTextLine0247];

    MWDrawTextLine *drawTextLine0248 = [[MWDrawTextLine alloc] init];
    drawTextLine0248.text = @"Поле";
    drawTextLine0248.fontName = @"HelveticaNeue";
    drawTextLine0248.fontColor = [UIColor blackColor];
    drawTextLine0248.fontSize = 32;
    drawTextLine0248.origin = CGPointMake(449, 1080);
    [station0128.nameOriginalTextPrimitives addObject:drawTextLine0248];
    
    MWDrawTextLine *drawTextLine0249 = [[MWDrawTextLine alloc] init];
    drawTextLine0249.text = station0128.nameEnglish;
    drawTextLine0249.fontName = @"HelveticaNeue";
    drawTextLine0249.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0249.fontSize = 18;
    drawTextLine0249.origin = CGPointMake(445, 1115);
    [station0128.nameEnglishTextPrimitives addObject:drawTextLine0249];
    
    // Добавляем перегон
    MWHaul *haul0123 = [[MWHaul alloc] init];
    haul0123.identifier = @"haul0123";
    haul0123.length = 2520;
    [edge0049.elements addObject:haul0123];

    MWDrawLine *drawLine0225 = [[MWDrawLine alloc] init];
    drawLine0225.startPoint = CGPointMake(421.5, 1074);
    drawLine0225.endPoint = CGPointMake(421.5, 1002.5);
    drawLine0225.width = 14.5;
    drawLine0225.color = line0007.color;
    [haul0123.drawPrimitives addObject:drawLine0225];
    
    // Добавляем станцию "Щукинская"
    MWStation *station0129 = [[MWStation alloc] init];
    station0129.identifier = @"station0129";
    [edge0049.elements addObject:station0129];
    
    station0129.nameOriginal = @"Щукинская";
    station0129.nameEnglish = @"Shchukinskaya";
    station0129.mapLocation = CGPointMake(421.5, 1002.5);
    station0129.geoLocation = CGPointMake(55.808519, 37.464391);
    
    MWDrawLine *drawLine0226 = [[MWDrawLine alloc] init];
    drawLine0226.startPoint = CGPointMake(421.5, 1002.5);
    drawLine0226.endPoint = CGPointMake(440.5, 1002.5);
    drawLine0226.width = 12;
    drawLine0226.color = line0007.color;
    [station0129.drawPrimitives addObject:drawLine0226];
    
    MWDrawTextLine *drawTextLine0250 = [[MWDrawTextLine alloc] init];
    drawTextLine0250.text = station0129.nameOriginal;
    drawTextLine0250.fontName = @"HelveticaNeue";
    drawTextLine0250.fontColor = [UIColor blackColor];
    drawTextLine0250.fontSize = 32;
    drawTextLine0250.origin = CGPointMake(448, 978.5);
    [station0129.nameOriginalTextPrimitives addObject:drawTextLine0250];
    
    MWDrawTextLine *drawTextLine0251 = [[MWDrawTextLine alloc] init];
    drawTextLine0251.text = station0129.nameEnglish;
    drawTextLine0251.fontName = @"HelveticaNeue";
    drawTextLine0251.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0251.fontSize = 18;
    drawTextLine0251.origin = CGPointMake(445, 1013.5);
    [station0129.nameEnglishTextPrimitives addObject:drawTextLine0251];
    
    // Добавляем перегон
    MWHaul *haul0124 = [[MWHaul alloc] init];
    haul0124.identifier = @"haul0124";
    haul0124.length = 2640;
    [edge0049.elements addObject:haul0124];
    
    MWDrawLine *drawLine0227 = [[MWDrawLine alloc] init];
    drawLine0227.startPoint = CGPointMake(421.5, 1003);
    drawLine0227.endPoint = CGPointMake(421.5, 931.5);
    drawLine0227.width = 14.5;
    drawLine0227.color = line0007.color;
    [haul0124.drawPrimitives addObject:drawLine0227];

    // Добавляем станцию "Спартак"
    MWStation *station0195 = [[MWStation alloc] init];
    station0195.identifier = @"station0195";
    [edge0049.elements addObject:station0195];
    
    station0195.nameOriginal = @"Спартак";
    station0195.nameEnglish = @"Spartak";
    station0195.mapLocation = CGPointMake(421.5, 931.5);
    station0195.geoLocation = CGPointMake(55.8182, 37.4352);

    MWDrawLine *drawLine0379 = [[MWDrawLine alloc] init];
    drawLine0379.startPoint = CGPointMake(421.5, 931.5);
    drawLine0379.endPoint = CGPointMake(440.5, 931.5);
    drawLine0379.width = 12;
    drawLine0379.color = line0007.color;
    [station0195.drawPrimitives addObject:drawLine0379];

    MWDrawTextLine *drawTextLine0419 = [[MWDrawTextLine alloc] init];
    drawTextLine0419.text = station0195.nameOriginal;
    drawTextLine0419.fontName = @"HelveticaNeue";
    drawTextLine0419.fontColor = [UIColor blackColor];
    drawTextLine0419.fontSize = 32;
    drawTextLine0419.origin = CGPointMake(448, 907.5);
    [station0195.nameOriginalTextPrimitives addObject:drawTextLine0419];

    MWDrawTextLine *drawTextLine0420 = [[MWDrawTextLine alloc] init];
    drawTextLine0420.text = station0195.nameEnglish;
    drawTextLine0420.fontName = @"HelveticaNeue";
    drawTextLine0420.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0420.fontSize = 18;
    drawTextLine0420.origin = CGPointMake(445, 942.5);
    [station0195.nameEnglishTextPrimitives addObject:drawTextLine0420];

    // Добавляем перегон
    MWHaul *haul0183 = [[MWHaul alloc] init];
    haul0183.identifier = @"haul0183";
    haul0183.length = 2640;
    [edge0049.elements addObject:haul0183];

    MWDrawLine *drawLine0380 = [[MWDrawLine alloc] init];
    drawLine0380.startPoint = CGPointMake(421.5, 860.5);
    drawLine0380.endPoint = CGPointMake(421.5, 932);
    drawLine0380.width = 14.5;
    drawLine0380.color = line0007.color;
    [haul0183.drawPrimitives addObject:drawLine0380];

    // Добавляем станцию "Тушинская"
    MWStation *station0130 = [[MWStation alloc] init];
    station0130.identifier = @"station0130";
    [edge0049.elements addObject:station0130];
    
    station0130.nameOriginal = @"Тушинская";
    station0130.nameEnglish = @"Tushinskaya";
    station0130.mapLocation = CGPointMake(421.5, 860.5);
    station0130.geoLocation = CGPointMake(55.826508, 37.437055);

    MWDrawLine *drawLine0228 = [[MWDrawLine alloc] init];
    drawLine0228.startPoint = CGPointMake(421.5, 860.5);
    drawLine0228.endPoint = CGPointMake(440.5, 860.5);
    drawLine0228.width = 12;
    drawLine0228.color = line0007.color;
    [station0130.drawPrimitives addObject:drawLine0228];

    MWDrawTextLine *drawTextLine0252 = [[MWDrawTextLine alloc] init];
    drawTextLine0252.text = station0130.nameOriginal;
    drawTextLine0252.fontName = @"HelveticaNeue";
    drawTextLine0252.fontColor = [UIColor blackColor];
    drawTextLine0252.fontSize = 32;
    drawTextLine0252.origin = CGPointMake(448, 837);
    [station0130.nameOriginalTextPrimitives addObject:drawTextLine0252];
    
    MWDrawTextLine *drawTextLine0253 = [[MWDrawTextLine alloc] init];
    drawTextLine0253.text = station0130.nameEnglish;
    drawTextLine0253.fontName = @"HelveticaNeue";
    drawTextLine0253.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0253.fontSize = 18;
    drawTextLine0253.origin = CGPointMake(445, 872);
    [station0130.nameEnglishTextPrimitives addObject:drawTextLine0253];
    
    // Добавляем перегон
    MWHaul *haul0125 = [[MWHaul alloc] init];
    haul0125.identifier = @"haul0125";
    haul0125.length = 2660;
    [edge0049.elements addObject:haul0125];

    MWDrawLine *drawLine0229 = [[MWDrawLine alloc] init];
    drawLine0229.startPoint = CGPointMake(421.5, 861);
    drawLine0229.endPoint = CGPointMake(421.5, 789.5);
    drawLine0229.width = 14.5;
    drawLine0229.color = line0007.color;
    [haul0125.drawPrimitives addObject:drawLine0229];
    
    // Добавляем станцию "Сходненская"
    MWStation *station0131 = [[MWStation alloc] init];
    station0131.identifier = @"station0131";
    [edge0049.elements addObject:station0131];
    
    station0131.nameOriginal = @"Сходненская";
    station0131.nameEnglish = @"Shodnenskaya";
    station0131.mapLocation = CGPointMake(421.5, 789.5);
    station0131.geoLocation = CGPointMake(55.850644, 37.439859);
    
    MWDrawLine *drawLine0230 = [[MWDrawLine alloc] init];
    drawLine0230.startPoint = CGPointMake(421.5, 789.5);
    drawLine0230.endPoint = CGPointMake(440.5, 789.5);
    drawLine0230.width = 12;
    drawLine0230.color = line0007.color;
    [station0131.drawPrimitives addObject:drawLine0230];
    
    MWDrawTextLine *drawTextLine0254 = [[MWDrawTextLine alloc] init];
    drawTextLine0254.text = station0131.nameOriginal;
    drawTextLine0254.fontName = @"HelveticaNeue";
    drawTextLine0254.fontColor = [UIColor blackColor];
    drawTextLine0254.fontSize = 32;
    drawTextLine0254.origin = CGPointMake(448, 765);
    [station0131.nameOriginalTextPrimitives addObject:drawTextLine0254];
    
    MWDrawTextLine *drawTextLine0255 = [[MWDrawTextLine alloc] init];
    drawTextLine0255.text = station0131.nameEnglish;
    drawTextLine0255.fontName = @"HelveticaNeue";
    drawTextLine0255.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0255.fontSize = 18;
    drawTextLine0255.origin = CGPointMake(445, 800);
    [station0131.nameEnglishTextPrimitives addObject:drawTextLine0255];
    
    // Добавляем перегон
    MWHaul *haul0126 = [[MWHaul alloc] init];
    haul0126.identifier = @"haul0126";
    haul0126.length = 1160;
    [edge0049.elements addObject:haul0126];
    
    MWDrawLine *drawLine0231 = [[MWDrawLine alloc] init];
    drawLine0231.startPoint = CGPointMake(421.5, 790);
    drawLine0231.endPoint = CGPointMake(421.5, 718.5);
    drawLine0231.width = 14.5;
    drawLine0231.color = line0007.color;
    [haul0126.drawPrimitives addObject:drawLine0231];
    
    // Добавляем станцию "Планерная"
    MWStation *station0132 = [[MWStation alloc] init];
    station0132.identifier = @"station0132";
    [edge0049.elements addObject:station0132];
    
    station0132.nameOriginal = @"Планерная";
    station0132.nameEnglish = @"Planernaya";
    station0132.mapLocation = CGPointMake(421.5, 718.5);
    station0132.geoLocation = CGPointMake(55.860729, 37.436459);

    MWDrawLine *drawLine0232 = [[MWDrawLine alloc] init];
    drawLine0232.startPoint = CGPointMake(402.5, 718.5);
    drawLine0232.endPoint = CGPointMake(441, 718.5);
    drawLine0232.width = 12;
    drawLine0232.color = line0007.color;
    [station0132.drawPrimitives addObject:drawLine0232];
    
    MWDrawTextLine *drawTextLine0256 = [[MWDrawTextLine alloc] init];
    drawTextLine0256.text = station0132.nameOriginal;
    drawTextLine0256.fontName = @"HelveticaNeue";
    drawTextLine0256.fontColor = [UIColor blackColor];
    drawTextLine0256.fontSize = 32;
    drawTextLine0256.origin = CGPointMake(450, 693);
    [station0132.nameOriginalTextPrimitives addObject:drawTextLine0256];
    
    MWDrawTextLine *drawTextLine0257 = [[MWDrawTextLine alloc] init];
    drawTextLine0257.text = station0132.nameEnglish;
    drawTextLine0257.fontName = @"HelveticaNeue";
    drawTextLine0257.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0257.fontSize = 18;
    drawTextLine0257.origin = CGPointMake(445, 728);
    [station0132.nameEnglishTextPrimitives addObject:drawTextLine0257];
    
    // Добавляем вершину
    edge0049.finishVertex = vertex0034;
    
    ////////////////////////////////////////////////////////////////
    // 8 - Калининская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Новокосино" до "Площадь Ильича"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0050 = [[MWEdge alloc] init];
    edge0050.identifier = @"edge0050";
    edge0050.developmentName = @"Ребро: Новокосино - Площадь Ильича";
    [self.edges addObject:edge0050];
    
    // Добавляем линию
    edge0050.line = line0008;

    // Добавляем вершину
    edge0050.startVertex = vertex0035;
    
    // Добавляем станцию "Новокосино"
    MWStation *station0133 = [[MWStation alloc] init];
    station0133.identifier = @"station0133";
    [edge0050.elements addObject:station0133];
    
    station0133.nameOriginal = @"Новокосино";
    station0133.nameEnglish = @"Novokosino";
    station0133.mapLocation = CGPointMake(2307.5, 1481);
    station0133.geoLocation = CGPointMake(55.745108, 37.864013);
    
    MWDrawLine *drawLine0233 = [[MWDrawLine alloc] init];
    drawLine0233.startPoint = CGPointMake(2326.5, 1481);
    drawLine0233.endPoint = CGPointMake(2288, 1481);
    drawLine0233.width = 12;
    drawLine0233.color = line0008.color;
    [station0133.drawPrimitives addObject:drawLine0233];

    MWDrawTextLine *drawTextLine0258 = [[MWDrawTextLine alloc] init];
    drawTextLine0258.text = station0133.nameOriginal;
    drawTextLine0258.fontName = @"HelveticaNeue";
    drawTextLine0258.fontColor = [UIColor blackColor];
    drawTextLine0258.fontSize = 32;
    drawTextLine0258.origin = CGPointMake(2335, 1455);
    [station0133.nameOriginalTextPrimitives addObject:drawTextLine0258];

    MWDrawTextLine *drawTextLine0259 = [[MWDrawTextLine alloc] init];
    drawTextLine0259.text = station0133.nameEnglish;
    drawTextLine0259.fontName = @"HelveticaNeue";
    drawTextLine0259.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0259.fontSize = 18;
    drawTextLine0259.origin = CGPointMake(2331, 1490);
    [station0133.nameEnglishTextPrimitives addObject:drawTextLine0259];
    
    // Добавляем перегон
    MWHaul *haul0127 = [[MWHaul alloc] init];
    haul0127.identifier = @"haul0127";
    haul0127.length = 3170;
    [edge0050.elements addObject:haul0127];

    MWDrawLine *drawLine0234 = [[MWDrawLine alloc] init];
    drawLine0234.startPoint = CGPointMake(2307.5, 1481);
    drawLine0234.endPoint = CGPointMake(2307.5, 1545);
    drawLine0234.width = 14.5;
    drawLine0234.color = line0008.color;
    [haul0127.drawPrimitives addObject:drawLine0234];
    
    // Добавляем станцию "Новогиреево"
    MWStation *station0134 = [[MWStation alloc] init];
    station0134.identifier = @"station0134";
    [edge0050.elements addObject:station0134];

    station0134.nameOriginal = @"Новогиреево";
    station0134.nameEnglish = @"Novogireevo";
    station0134.mapLocation = CGPointMake(2307.5, 1545);
    station0134.geoLocation = CGPointMake(55.751700, 37.816644);

    MWDrawLine *drawLine0235 = [[MWDrawLine alloc] init];
    drawLine0235.startPoint = CGPointMake(2307.5, 1545);
    drawLine0235.endPoint = CGPointMake(2327.5, 1545);
    drawLine0235.width = 12;
    drawLine0235.color = line0008.color;
    [station0134.drawPrimitives addObject:drawLine0235];

    MWDrawTextLine *drawTextLine0260 = [[MWDrawTextLine alloc] init];
    drawTextLine0260.text = station0134.nameOriginal;
    drawTextLine0260.fontName = @"HelveticaNeue";
    drawTextLine0260.fontColor = [UIColor blackColor];
    drawTextLine0260.fontSize = 32;
    drawTextLine0260.origin = CGPointMake(2335, 1520);
    [station0134.nameOriginalTextPrimitives addObject:drawTextLine0260];
    
    MWDrawTextLine *drawTextLine0261 = [[MWDrawTextLine alloc] init];
    drawTextLine0261.text = station0134.nameEnglish;
    drawTextLine0261.fontName = @"HelveticaNeue";
    drawTextLine0261.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0261.fontSize = 18;
    drawTextLine0261.origin = CGPointMake(2331, 1555);
    [station0134.nameEnglishTextPrimitives addObject:drawTextLine0261];
    
    // Добавляем перегон
    MWHaul *haul0128 = [[MWHaul alloc] init];
    haul0128.identifier = @"haul0128";
    haul0128.length = 1950;
    [edge0050.elements addObject:haul0128];
    
    MWDrawLine *drawLine0236 = [[MWDrawLine alloc] init];
    drawLine0236.startPoint = CGPointMake(2307.5, 1544.5);
    drawLine0236.endPoint = CGPointMake(2307.5, 1608.5);
    drawLine0236.width = 14.5;
    drawLine0236.color = line0008.color;
    [haul0128.drawPrimitives addObject:drawLine0236];
    
    // Добавляем станцию "Перово"
    MWStation *station0135 = [[MWStation alloc] init];
    station0135.identifier = @"station0135";
    [edge0050.elements addObject:station0135];
    
    station0135.nameOriginal = @"Перово";
    station0135.nameEnglish = @"Perovo";
    station0135.mapLocation = CGPointMake(2307.5, 1608.5);
    station0135.geoLocation = CGPointMake(55.751190, 37.786652);
    
    MWDrawLine *drawLine0237 = [[MWDrawLine alloc] init];
    drawLine0237.startPoint = CGPointMake(2307.5, 1608.5);
    drawLine0237.endPoint = CGPointMake(2327.5, 1608.5);
    drawLine0237.width = 12;
    drawLine0237.color = line0008.color;
    [station0135.drawPrimitives addObject:drawLine0237];
    
    MWDrawTextLine *drawTextLine0262 = [[MWDrawTextLine alloc] init];
    drawTextLine0262.text = station0135.nameOriginal;
    drawTextLine0262.fontName = @"HelveticaNeue";
    drawTextLine0262.fontColor = [UIColor blackColor];
    drawTextLine0262.fontSize = 32;
    drawTextLine0262.origin = CGPointMake(2335, 1584);
    [station0135.nameOriginalTextPrimitives addObject:drawTextLine0262];
    
    MWDrawTextLine *drawTextLine0263 = [[MWDrawTextLine alloc] init];
    drawTextLine0263.text = station0135.nameEnglish;
    drawTextLine0263.fontName = @"HelveticaNeue";
    drawTextLine0263.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0263.fontSize = 18;
    drawTextLine0263.origin = CGPointMake(2331, 1619);
    [station0135.nameEnglishTextPrimitives addObject:drawTextLine0263];
    
    // Добавляем перегон
    MWHaul *haul0129 = [[MWHaul alloc] init];
    haul0129.identifier = @"haul0129";
    haul0129.length = 2470;
    [edge0050.elements addObject:haul0129];
    
    MWDrawLine *drawLine0238 = [[MWDrawLine alloc] init];
    drawLine0238.startPoint = CGPointMake(2307.5, 1608);
    drawLine0238.endPoint = CGPointMake(2307.5, 1672.5);
    drawLine0238.width = 14.5;
    drawLine0238.color = line0008.color;
    [haul0129.drawPrimitives addObject:drawLine0238];
    
    // Добавляем станцию "Шоссе Энтузиастов"
    MWStation *station0136 = [[MWStation alloc] init];
    station0136.identifier = @"station0136";
    [edge0050.elements addObject:station0136];
    
    station0136.nameOriginal = @"Шоссе Энтузиастов";
    station0136.nameEnglish = @"Shosse Entuziastov";
    station0136.mapLocation = CGPointMake(2307.5, 1672.5);
    station0136.geoLocation = CGPointMake(55.758304, 37.751520);
    
    MWDrawLine *drawLine0239 = [[MWDrawLine alloc] init];
    drawLine0239.startPoint = CGPointMake(2307.5, 1672.5);
    drawLine0239.endPoint = CGPointMake(2327.5, 1672.5);
    drawLine0239.width = 12;
    drawLine0239.color = line0008.color;
    [station0136.drawPrimitives addObject:drawLine0239];
    
    MWDrawTextLine *drawTextLine0264 = [[MWDrawTextLine alloc] init];
    drawTextLine0264.text = station0136.nameOriginal;
    drawTextLine0264.fontName = @"HelveticaNeue";
    drawTextLine0264.fontColor = [UIColor blackColor];
    drawTextLine0264.fontSize = 32;
    drawTextLine0264.origin = CGPointMake(2335, 1648);
    [station0136.nameOriginalTextPrimitives addObject:drawTextLine0264];
    
    MWDrawTextLine *drawTextLine0265 = [[MWDrawTextLine alloc] init];
    drawTextLine0265.text = station0136.nameEnglish;
    drawTextLine0265.fontName = @"HelveticaNeue";
    drawTextLine0265.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0265.fontSize = 18;
    drawTextLine0265.origin = CGPointMake(2331, 1683);
    [station0136.nameEnglishTextPrimitives addObject:drawTextLine0265];
    
    // Добавляем перегон
    MWHaul *haul0130 = [[MWHaul alloc] init];
    haul0130.identifier = @"haul0130";
    haul0130.length = 2330;
    [edge0050.elements addObject:haul0130];
    
    MWDrawArc *drawArc0048 = [[MWDrawArc alloc] init];
    drawArc0048.center = CGPointMake(2207.5, 1672);
    drawArc0048.startRadians = 0 * M_PI / 180;
    drawArc0048.endRadians = 45 * M_PI / 180;
    drawArc0048.radius = 100;
    drawArc0048.width = 14.5;
    drawArc0048.color = line0008.color;
    [haul0130.drawPrimitives addObject:drawArc0048];
    
    MWDrawLine *drawLine0240 = [[MWDrawLine alloc] init];
    drawLine0240.startPoint = CGPointMake(2279, 1742);
    drawLine0240.endPoint = CGPointMake(2270.5, 1750.5);
    drawLine0240.width = 14.5;
    drawLine0240.color = line0008.color;
    [haul0130.drawPrimitives addObject:drawLine0240];
    
    // Добавляем станцию "Авиамоторная"
    MWStation *station0137 = [[MWStation alloc] init];
    station0137.identifier = @"station0137";
    [edge0050.elements addObject:station0137];
    
    station0137.nameOriginal = @"Авиамоторная";
    station0137.nameEnglish = @"Aviamotornaya";
    station0137.mapLocation = CGPointMake(2270.5, 1750.5);
    station0137.geoLocation = CGPointMake(55.751620, 37.717218);
    
    MWDrawLine *drawLine0241 = [[MWDrawLine alloc] init];
    drawLine0241.startPoint = CGPointMake(2270.5, 1750.5);
    drawLine0241.endPoint = CGPointMake(2284.5, 1764.5);
    drawLine0241.width = 12;
    drawLine0241.color = line0008.color;
    [station0137.drawPrimitives addObject:drawLine0241];
    
    MWDrawTextLine *drawTextLine0266 = [[MWDrawTextLine alloc] init];
    drawTextLine0266.text = station0137.nameOriginal;
    drawTextLine0266.fontName = @"HelveticaNeue";
    drawTextLine0266.fontColor = [UIColor blackColor];
    drawTextLine0266.fontSize = 32;
    drawTextLine0266.origin = CGPointMake(2283, 1761);
    [station0137.nameOriginalTextPrimitives addObject:drawTextLine0266];
    
    MWDrawTextLine *drawTextLine0267 = [[MWDrawTextLine alloc] init];
    drawTextLine0267.text = station0137.nameEnglish;
    drawTextLine0267.fontName = @"HelveticaNeue";
    drawTextLine0267.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0267.fontSize = 18;
    drawTextLine0267.origin = CGPointMake(2279, 1796);
    [station0137.nameEnglishTextPrimitives addObject:drawTextLine0267];
    
    // Добавляем перегон
    MWHaul *haul0131 = [[MWHaul alloc] init];
    haul0131.identifier = @"haul0131";
    haul0131.length = 2310;
    [edge0050.elements addObject:haul0131];
    
    MWDrawLine *drawLine0242 = [[MWDrawLine alloc] init];
    drawLine0242.startPoint = CGPointMake(2270.5, 1750.5);
    drawLine0242.endPoint = CGPointMake(2216.5, 1803.5);
    drawLine0242.width = 14.5;
    drawLine0242.color = line0008.color;
    [haul0131.drawPrimitives addObject:drawLine0242];
    
    // Добавляем станцию "Площадь Ильича"
    MWStation *station0138 = [[MWStation alloc] init];
    station0138.identifier = @"station0138";
    [edge0050.elements addObject:station0138];
    
    station0138.nameOriginal = @"Площадь Ильича";
    station0138.nameEnglish = @"Ploshchad Ilicha";
    station0138.mapLocation = CGPointMake(2216.5, 1803.5);
    station0138.geoLocation = CGPointMake(55.746823, 37.680966);

    MWDrawTextLine *drawTextLine0268 = [[MWDrawTextLine alloc] init];
    drawTextLine0268.text = @"Площадь";
    drawTextLine0268.fontName = @"HelveticaNeue";
    drawTextLine0268.fontColor = [UIColor blackColor];
    drawTextLine0268.fontSize = 32;
    drawTextLine0268.origin = CGPointMake(2212, 1821);
    [station0138.nameOriginalTextPrimitives addObject:drawTextLine0268];

    MWDrawTextLine *drawTextLine0269 = [[MWDrawTextLine alloc] init];
    drawTextLine0269.text = @"Ильича";
    drawTextLine0269.fontName = @"HelveticaNeue";
    drawTextLine0269.fontColor = [UIColor blackColor];
    drawTextLine0269.fontSize = 32;
    drawTextLine0269.origin = CGPointMake(2212, 1852);
    [station0138.nameOriginalTextPrimitives addObject:drawTextLine0269];
    
    MWDrawTextLine *drawTextLine0270 = [[MWDrawTextLine alloc] init];
    drawTextLine0270.text = station0138.nameEnglish;
    drawTextLine0270.fontName = @"HelveticaNeue";
    drawTextLine0270.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0270.fontSize = 18;
    drawTextLine0270.origin = CGPointMake(2208, 1887);
    [station0138.nameEnglishTextPrimitives addObject:drawTextLine0270];
    
    // Добавляем вершину
    edge0050.finishVertex = vertex0036;
    
    // Создаем участок линии от "Площадь Ильича" до "Марксистская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0051 = [[MWEdge alloc] init];
    edge0051.identifier = @"edge0051";
    edge0051.developmentName = @"Ребро: Площадь Ильича - Марксистская";
    [self.edges addObject:(edge0051)];
    
    // Добавляем линию
    edge0051.line = line0008;

    // Добавляем вершину
    edge0051.startVertex = vertex0036;
    
    // Добавляем станцию "Площадь Ильича"
    [edge0051.elements addObject:station0138];
    
    // Добавляем перегон
    MWHaul *haul0132 = [[MWHaul alloc] init];
    haul0132.identifier = @"haul0132";
    haul0132.length = 1650;
    [edge0051.elements addObject:haul0132];
    
    MWDrawLine *drawLine0243 = [[MWDrawLine alloc] init];
    drawLine0243.startPoint = CGPointMake(2217, 1803);
    drawLine0243.endPoint = CGPointMake(2048.5, 1972.5);
    drawLine0243.width = 14.5;
    drawLine0243.color = line0008.color;
    [haul0132.drawPrimitives addObject:drawLine0243];
    
    // Добавляем станцию "Марксистская"
    MWStation *station0139 = [[MWStation alloc] init];
    station0139.identifier = @"station0139";
    [edge0051.elements addObject:station0139];
    
    station0139.nameOriginal = @"Марксистская";
    station0139.nameEnglish = @"Marksistskaya";
    station0139.mapLocation = CGPointMake(2048.5, 1972.5);
    station0139.geoLocation = CGPointMake(55.740882, 37.656518);
    
    MWDrawLine *drawLine0365 = [[MWDrawLine alloc] init];
    drawLine0365.startPoint = CGPointMake(1962, 2007.5);
    drawLine0365.endPoint = CGPointMake(2043, 2007.5);
    drawLine0365.width = 22;
    drawLine0365.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0139.nameOriginalTextPrimitives addObject:drawLine0365];

    MWDrawLine *drawLine0366 = [[MWDrawLine alloc] init];
    drawLine0366.startPoint = CGPointMake(2082, 2007.5);
    drawLine0366.endPoint = CGPointMake(2183, 2007.5);
    drawLine0366.width = 22;
    drawLine0366.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0139.nameOriginalTextPrimitives addObject:drawLine0366];

    MWDrawTextLine *drawTextLine0271 = [[MWDrawTextLine alloc] init];
    drawTextLine0271.text = station0139.nameOriginal;
    drawTextLine0271.fontName = @"HelveticaNeue";
    drawTextLine0271.fontColor = [UIColor blackColor];
    drawTextLine0271.fontSize = 32;
    drawTextLine0271.origin = CGPointMake(1980, 1985);
    [station0139.nameOriginalTextPrimitives addObject:drawTextLine0271];

    MWDrawLine *drawLine0382 = [[MWDrawLine alloc] init];
    drawLine0382.startPoint = CGPointMake(1962, 2031.5);
    drawLine0382.endPoint = CGPointMake(2063, 2031.5);
    drawLine0382.width = 16;
    drawLine0382.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0139.nameEnglishTextPrimitives addObject:drawLine0382];

    MWDrawTextLine *drawTextLine0272 = [[MWDrawTextLine alloc] init];
    drawTextLine0272.text = station0139.nameEnglish;
    drawTextLine0272.fontName = @"HelveticaNeue";
    drawTextLine0272.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0272.fontSize = 18;
    drawTextLine0272.origin = CGPointMake(1976, 2020);
    [station0139.nameEnglishTextPrimitives addObject:drawTextLine0272];
    
    // Добавляем вершину
    edge0051.finishVertex = vertex0028;
    
    // Создаем участок линии от "Марксистская" до "Третьяковская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0052 = [[MWEdge alloc] init];
    edge0052.identifier = @"edge0052";
    edge0052.developmentName = @"Ребро: Марксистская - Третьяковская";
    [self.edges addObject:(edge0052)];
    
    // Добавляем линию
    edge0052.line = line0008;

    // Добавляем вершину
    edge0052.startVertex = vertex0028;
    
    // Добавляем станцию "Марксистская"
    [edge0052.elements addObject:station0139];
    
    // Добавляем перегон
    MWHaul *haul0133 = [[MWHaul alloc] init];
    haul0133.identifier = @"haul0133";
    haul0133.length = 2060;
    [edge0052.elements addObject:haul0133];
    
    MWDrawLine *drawLine0244 = [[MWDrawLine alloc] init];
    drawLine0244.startPoint = CGPointMake(2049, 1972);
    drawLine0244.endPoint = CGPointMake(1993.5, 2027.5);
    drawLine0244.width = 14.5;
    drawLine0244.color = line0008.color;
    [haul0133.drawPrimitives addObject:drawLine0244];
    
    MWDrawArc *drawArc0049 = [[MWDrawArc alloc] init];
    drawArc0049.center = CGPointMake(1923, 1956.5);
    drawArc0049.startRadians = 45 * M_PI / 180;
    drawArc0049.endRadians = 90 * M_PI / 180;
    drawArc0049.radius = 100;
    drawArc0049.width = 14.5;
    drawArc0049.color = line0008.color;
    [haul0133.drawPrimitives addObject:drawArc0049];

    MWDrawLine *drawLine0245 = [[MWDrawLine alloc] init];
    drawLine0245.startPoint = CGPointMake(1923, 2056.5);
    drawLine0245.endPoint = CGPointMake(1661.5, 2056.5);
    drawLine0245.width = 14.5;
    drawLine0245.color = line0008.color;
    [haul0133.drawPrimitives addObject:drawLine0245];
    
    // Добавляем станцию "Третьяковская"
    MWStation *station0140 = [[MWStation alloc] init];
    station0140.identifier = @"station0140";
    [edge0052.elements addObject:station0140];
    
    station0140.nameOriginal = @"Третьяковская";
    station0140.nameEnglish = @"Tretyakovskaya";
    station0140.mapLocation = CGPointMake(1661.5, 2056.5);
    station0140.geoLocation = CGPointMake(55.740729, 37.625592);

    [station0140.nameOriginalTextPrimitives addObject:drawTextLine0191];
    [station0140.nameEnglishTextPrimitives addObject:drawTextLine0192];
    station0140.showNameOnMap = false;
    
    // Добавляем вершину
    edge0052.finishVertex = vertex0013;

    // Создаем участок линии от "Делового центра" до "Парк Победы"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0070 = [[MWEdge alloc] init];
    edge0070.identifier = @"edge0070";
    edge0070.developmentName = @"Ребро: Деловой центр - Парк Победы";
    [self.edges addObject:(edge0070)];
    
    // Добавляем линию
    edge0070.line = line0008;
    
    // Добавляем вершину
    edge0070.startVertex = vertex0044;
    
    // Добавляем станцию "Деловой центр"
    MWStation *station0191 = [[MWStation alloc] init];
    station0191.identifier = @"station0191";
    [edge0070.elements addObject:station0191];
    
    station0191.nameOriginal = @"Деловой центр";
    station0191.nameEnglish = @"Delovoy Centr";
    station0191.mapLocation = CGPointMake(425, 1600);
    station0191.geoLocation = CGPointMake(55.752415, 37.541699);

    MWDrawArc *drawArc0136 = [[MWDrawArc alloc] init];
    drawArc0136.center = CGPointMake(425, 1600);
    drawArc0136.startRadians = M_PI * 2;
    drawArc0136.endRadians = 0;
    drawArc0136.radius = 14;
    drawArc0136.width = 10;
    drawArc0136.color = line0008.color;
    [station0191.drawPrimitives addObject:drawArc0136];

    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = CGPointMake(425, 1600);
    fillCircle0064.radius = 9;
    fillCircle0064.fillColor = [UIColor whiteColor];
    [station0191.drawPrimitives addObject:fillCircle0064];

    MWDrawTextLine *drawTextLine0412 = [[MWDrawTextLine alloc] init];
    drawTextLine0412.text = @"Деловой";
    drawTextLine0412.fontName = @"HelveticaNeue";
    drawTextLine0412.fontColor = [UIColor blackColor];
    drawTextLine0412.fontSize = 32;
    drawTextLine0412.origin = CGPointMake(267, 1594);
    [station0191.nameOriginalTextPrimitives addObject:drawTextLine0412];
    
    MWDrawTextLine *drawTextLine0413 = [[MWDrawTextLine alloc] init];
    drawTextLine0413.text = @"Центр";
    drawTextLine0413.fontName = @"HelveticaNeue";
    drawTextLine0413.fontColor = [UIColor blackColor];
    drawTextLine0413.fontSize = 32;
    drawTextLine0413.origin = CGPointMake(305 , 1625);
    [station0191.nameOriginalTextPrimitives addObject:drawTextLine0413];
    
    MWDrawTextLine *drawTextLine0414 = [[MWDrawTextLine alloc] init];
    drawTextLine0414.text = station0191.nameEnglish;
    drawTextLine0414.fontName = @"HelveticaNeue";
    drawTextLine0414.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0414.fontSize = 18;
    drawTextLine0414.origin = CGPointMake(282, 1661);
    [station0191.nameEnglishTextPrimitives addObject:drawTextLine0414];
    
    // Добавляем перегон
    MWHaul *haul0180 = [[MWHaul alloc] init];
    haul0180.identifier = @"haul0180";
    haul0180.length = 2390;
    [edge0070.elements addObject:haul0180];
 
    MWDrawLine *drawLine0373 = [[MWDrawLine alloc] init];
    drawLine0373.startPoint = CGPointMake(425, 1600);
    drawLine0373.endPoint = CGPointMake(425, 1828);
    drawLine0373.width = 14.5;
    drawLine0373.color = line0008.color;
    [haul0180.drawPrimitives addObject:drawLine0373];
    
    // Добавляем станцию "Парк Победы"
    MWStation *station0192 = [[MWStation alloc] init];
    station0192.identifier = @"station0192";
    [edge0070.elements addObject:station0192];
    
    station0192.nameOriginal = @"Парк Победы";
    station0192.nameEnglish = @"Park Pobedy";
    station0192.mapLocation = CGPointMake(425, 1828);
    station0192.geoLocation = CGPointMake(55.736227, 37.516832);
    
    MWDrawArc *drawArc0137 = [[MWDrawArc alloc] init];
    drawArc0137.center = CGPointMake(425, 1828);
    drawArc0137.startRadians = M_PI * 2;
    drawArc0137.endRadians = 0;
    drawArc0137.radius = 14;
    drawArc0137.width = 10;
    drawArc0137.color = line0008.color;
    [station0192.drawPrimitives addObject:drawArc0137];
    
    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = CGPointMake(425, 1828);
    fillCircle0065.radius = 9;
    fillCircle0065.fillColor = [UIColor whiteColor];
    [station0192.drawPrimitives addObject:fillCircle0065];

    [station0192.nameOriginalTextPrimitives addObject:drawTextLine0108];
    [station0192.nameOriginalTextPrimitives addObject:drawTextLine0109];
    [station0192.nameEnglishTextPrimitives addObject:drawTextLine0110];
    station0192.showNameOnMap = false;
    
    // Добавляем вершину
    edge0070.finishVertex = vertex0043;

    ////////////////////////////////////////////////////////////////
    // 9 - Серпуховско-Тимирязевская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Бульвар Дмитрия Донского" до "Севастопольская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0053 = [[MWEdge alloc] init];
    edge0053.identifier = @"edge0053";
    edge0053.developmentName = @"Ребро: Бульвар Дмитрия Донского - Севастопольская";
    [self.edges addObject:edge0053];
    
    // Добавляем линию
    edge0053.line = line0009;

    // Добавляем вершину
    edge0053.startVertex = vertex0037;
    
    // Добавляем станцию "Бульвар Дмитрия Донского"
    MWStation *station0141 = [[MWStation alloc] init];
    station0141.identifier = @"station0141";
    [edge0053.elements addObject:station0141];
    
    station0141.nameOriginal = @"Бульвар Дмитрия Донского";
    station0141.nameEnglish = @"Bulvar Dmitriya Donskogo";
    station0141.mapLocation = CGPointMake(1335.5, 3137.5);
    station0141.geoLocation = CGPointMake(55.569498, 37.576439);
   
    MWDrawTextLine *drawTextLine0273 = [[MWDrawTextLine alloc] init];
    drawTextLine0273.text = @"Бульвар Дмитрия";
    drawTextLine0273.fontName = @"HelveticaNeue";
    drawTextLine0273.fontColor = [UIColor blackColor];
    drawTextLine0273.fontSize = 32;
    drawTextLine0273.origin = CGPointMake(1363, 3092);
    [station0141.nameOriginalTextPrimitives addObject:drawTextLine0273];

    MWDrawTextLine *drawTextLine0274 = [[MWDrawTextLine alloc] init];
    drawTextLine0274.text = @"Донского";
    drawTextLine0274.fontName = @"HelveticaNeue";
    drawTextLine0274.fontColor = [UIColor blackColor];
    drawTextLine0274.fontSize = 32;
    drawTextLine0274.origin = CGPointMake(1363, 3123);
    [station0141.nameOriginalTextPrimitives addObject:drawTextLine0274];
    
    MWDrawTextLine *drawTextLine0275 = [[MWDrawTextLine alloc] init];
    drawTextLine0275.text = station0141.nameEnglish;
    drawTextLine0275.fontName = @"HelveticaNeue";
    drawTextLine0275.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0275.fontSize = 18;
    drawTextLine0275.origin = CGPointMake(1359, 3158);
    [station0141.nameEnglishTextPrimitives addObject:drawTextLine0275];
    
    // Добавляем перегон
    MWHaul *haul0134 = [[MWHaul alloc] init];
    haul0134.identifier = @"haul0134";
    haul0134.length = 1990;
    [edge0053.elements addObject:haul0134];
    
    MWDrawLine *drawLine0246 = [[MWDrawLine alloc] init];
    drawLine0246.startPoint = CGPointMake(1335.5, 3137.5);
    drawLine0246.endPoint = CGPointMake(1335.5, 3062.5);
    drawLine0246.width = 14.5;
    drawLine0246.color = line0009.color;
    [haul0134.drawPrimitives addObject:drawLine0246];
    
    // Добавляем станцию "Аннино"
    MWStation *station0142 = [[MWStation alloc] init];
    station0142.identifier = @"station0142";
    [edge0053.elements addObject:station0142];
    
    station0142.nameOriginal = @"Аннино";
    station0142.nameEnglish = @"Annino";
    station0142.mapLocation = CGPointMake(1335.5, 3062.5);
    station0142.geoLocation = CGPointMake(55.583643, 37.596827);
    
    MWDrawLine *drawLine0247 = [[MWDrawLine alloc] init];
    drawLine0247.startPoint = CGPointMake(1335.5, 3062.5);
    drawLine0247.endPoint = CGPointMake(1355.5, 3062.5);
    drawLine0247.width = 12;
    drawLine0247.color = line0009.color;
    [station0142.drawPrimitives addObject:drawLine0247];
    
    MWDrawTextLine *drawTextLine0276 = [[MWDrawTextLine alloc] init];
    drawTextLine0276.text = station0142.nameOriginal;
    drawTextLine0276.fontName = @"HelveticaNeue";
    drawTextLine0276.fontColor = [UIColor blackColor];
    drawTextLine0276.fontSize = 32;
    drawTextLine0276.origin = CGPointMake(1363, 3038);
    [station0142.nameOriginalTextPrimitives addObject:drawTextLine0276];
    
    MWDrawTextLine *drawTextLine0277 = [[MWDrawTextLine alloc] init];
    drawTextLine0277.text = station0142.nameEnglish;
    drawTextLine0277.fontName = @"HelveticaNeue";
    drawTextLine0277.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0277.fontSize = 18;
    drawTextLine0277.origin = CGPointMake(1359, 3072);
    [station0142.nameEnglishTextPrimitives addObject:drawTextLine0277];
    
    // Добавляем перегон
    MWHaul *haul0135 = [[MWHaul alloc] init];
    haul0135.identifier = @"haul0135";
    haul0135.length = 1440;
    [edge0053.elements addObject:haul0135];

    MWDrawLine *drawLine0248 = [[MWDrawLine alloc] init];
    drawLine0248.startPoint = CGPointMake(1335.5, 3063);
    drawLine0248.endPoint = CGPointMake(1335.5, 2976.5);
    drawLine0248.width = 14.5;
    drawLine0248.color = line0009.color;
    [haul0135.drawPrimitives addObject:drawLine0248];
    
    // Добавляем станцию "Улица Академика Янгеля"
    MWStation *station0143 = [[MWStation alloc] init];
    station0143.identifier = @"station0143";
    [edge0053.elements addObject:station0143];

    station0143.nameOriginal = @"Улица Академика Янгеля";
    station0143.nameEnglish = @"Ulitsa Akademika Yangelya";
    station0143.mapLocation = CGPointMake(1335.5, 2976.5);
    station0143.geoLocation = CGPointMake(55.595156, 37.601372);
    
    MWDrawLine *drawLine0249 = [[MWDrawLine alloc] init];
    drawLine0249.startPoint = CGPointMake(1335.5, 2976.5);
    drawLine0249.endPoint = CGPointMake(1355.5, 2976.5);
    drawLine0249.width = 12;
    drawLine0249.color = line0009.color;
    [station0143.drawPrimitives addObject:drawLine0249];

    MWDrawTextLine *drawTextLine0278 = [[MWDrawTextLine alloc] init];
    drawTextLine0278.text = @"Улица Академика";
    drawTextLine0278.fontName = @"HelveticaNeue";
    drawTextLine0278.fontColor = [UIColor blackColor];
    drawTextLine0278.fontSize = 32;
    drawTextLine0278.origin = CGPointMake(1363, 2952);
    [station0143.nameOriginalTextPrimitives addObject:drawTextLine0278];

    MWDrawTextLine *drawTextLine0279 = [[MWDrawTextLine alloc] init];
    drawTextLine0279.text = @"Янгеля";
    drawTextLine0279.fontName = @"HelveticaNeue";
    drawTextLine0279.fontColor = [UIColor blackColor];
    drawTextLine0279.fontSize = 32;
    drawTextLine0279.origin = CGPointMake(1363, 2983);
    [station0143.nameOriginalTextPrimitives addObject:drawTextLine0279];
    
    MWDrawTextLine *drawTextLine0280 = [[MWDrawTextLine alloc] init];
    drawTextLine0280.text = station0143.nameEnglish;
    drawTextLine0280.fontName = @"HelveticaNeue";
    drawTextLine0280.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0280.fontSize = 18;
    drawTextLine0280.origin = CGPointMake(1359, 3018);
    [station0143.nameEnglishTextPrimitives addObject:drawTextLine0280];
    
    // Добавляем перегон
    MWHaul *haul0136 = [[MWHaul alloc] init];
    haul0136.identifier = @"haul0136";
    haul0136.length = 1810;
    [edge0053.elements addObject:haul0136];
    
    MWDrawLine *drawLine0250 = [[MWDrawLine alloc] init];
    drawLine0250.startPoint = CGPointMake(1335.5, 2977);
    drawLine0250.endPoint = CGPointMake(1335.5, 2920.5);
    drawLine0250.width = 14.5;
    drawLine0250.color = line0009.color;
    [haul0136.drawPrimitives addObject:drawLine0250];
    
    // Добавляем станцию "Пражская"
    MWStation *station0144 = [[MWStation alloc] init];
    station0144.identifier = @"station0144";
    [edge0053.elements addObject:station0144];
    
    station0144.nameOriginal = @"Пражская";
    station0144.nameEnglish = @"Prazhskaya";
    station0144.mapLocation = CGPointMake(1335.5, 2920.5);
    station0144.geoLocation = CGPointMake(55.612322, 37.604173);
    
    MWDrawLine *drawLine0251 = [[MWDrawLine alloc] init];
    drawLine0251.startPoint = CGPointMake(1335.5, 2920.5);
    drawLine0251.endPoint = CGPointMake(1355.5, 2920.5);
    drawLine0251.width = 12;
    drawLine0251.color = line0009.color;
    [station0144.drawPrimitives addObject:drawLine0251];
    
    MWDrawTextLine *drawTextLine0281 = [[MWDrawTextLine alloc] init];
    drawTextLine0281.text = station0144.nameOriginal;
    drawTextLine0281.fontName = @"HelveticaNeue";
    drawTextLine0281.fontColor = [UIColor blackColor];
    drawTextLine0281.fontSize = 32;
    drawTextLine0281.origin = CGPointMake(1363, 2895);
    [station0144.nameOriginalTextPrimitives addObject:drawTextLine0281];
    
    MWDrawTextLine *drawTextLine0282 = [[MWDrawTextLine alloc] init];
    drawTextLine0282.text = station0144.nameEnglish;
    drawTextLine0282.fontName = @"HelveticaNeue";
    drawTextLine0282.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0282.fontSize = 18;
    drawTextLine0282.origin = CGPointMake(1359, 2930);
    [station0144.nameEnglishTextPrimitives addObject:drawTextLine0282];
    
    // Добавляем перегон
    MWHaul *haul0137 = [[MWHaul alloc] init];
    haul0137.identifier = @"haul0137";
    haul0137.length = 1240;
    [edge0053.elements addObject:haul0137];
    
    MWDrawLine *drawLine0252 = [[MWDrawLine alloc] init];
    drawLine0252.startPoint = CGPointMake(1335.5, 2921);
    drawLine0252.endPoint = CGPointMake(1335.5, 2861.5);
    drawLine0252.width = 14.5;
    drawLine0252.color = line0009.color;
    [haul0137.drawPrimitives addObject:drawLine0252];
    
    // Добавляем станцию "Южная"
    MWStation *station0145 = [[MWStation alloc] init];
    station0145.identifier = @"station0145";
    [edge0053.elements addObject:station0145];
    
    station0145.nameOriginal = @"Южная";
    station0145.nameEnglish = @"Yuzhnaya";
    station0145.mapLocation = CGPointMake(1335.5, 2861.5);
    station0145.geoLocation = CGPointMake(55.622450, 37.608709);
    
    MWDrawLine *drawLine0253 = [[MWDrawLine alloc] init];
    drawLine0253.startPoint = CGPointMake(1335.5, 2861.5);
    drawLine0253.endPoint = CGPointMake(1355.5, 2861.5);
    drawLine0253.width = 12;
    drawLine0253.color = line0009.color;
    [station0145.drawPrimitives addObject:drawLine0253];
    
    MWDrawTextLine *drawTextLine0283 = [[MWDrawTextLine alloc] init];
    drawTextLine0283.text = station0145.nameOriginal;
    drawTextLine0283.fontName = @"HelveticaNeue";
    drawTextLine0283.fontColor = [UIColor blackColor];
    drawTextLine0283.fontSize = 32;
    drawTextLine0283.origin = CGPointMake(1363, 2837);
    [station0145.nameOriginalTextPrimitives addObject:drawTextLine0283];
    
    MWDrawTextLine *drawTextLine0284 = [[MWDrawTextLine alloc] init];
    drawTextLine0284.text = station0145.nameEnglish;
    drawTextLine0284.fontName = @"HelveticaNeue";
    drawTextLine0284.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0284.fontSize = 18;
    drawTextLine0284.origin = CGPointMake(1359, 2872);
    [station0145.nameEnglishTextPrimitives addObject:drawTextLine0284];
    
    // Добавляем перегон
    MWHaul *haul0138 = [[MWHaul alloc] init];
    haul0138.identifier = @"haul0138";
    haul0138.length = 2070;
    [edge0053.elements addObject:haul0138];
    
    MWDrawLine *drawLine0254 = [[MWDrawLine alloc] init];
    drawLine0254.startPoint = CGPointMake(1335.5, 2862);
    drawLine0254.endPoint = CGPointMake(1335.5, 2803.5);
    drawLine0254.width = 14.5;
    drawLine0254.color = line0009.color;
    [haul0138.drawPrimitives addObject:drawLine0254];
    
    // Добавляем станцию "Чертановская"
    MWStation *station0146 = [[MWStation alloc] init];
    station0146.identifier = @"station0146";
    [edge0053.elements addObject:station0146];

    station0146.nameOriginal = @"Чертановская";
    station0146.nameEnglish = @"Chertanovskaya";
    station0146.mapLocation = CGPointMake(1335.5, 2803.5);
    station0146.geoLocation = CGPointMake(55.640834, 37.606229);
    
    MWDrawLine *drawLine0255 = [[MWDrawLine alloc] init];
    drawLine0255.startPoint = CGPointMake(1335.5, 2803.5);
    drawLine0255.endPoint = CGPointMake(1355.5, 2803.5);
    drawLine0255.width = 12;
    drawLine0255.color = line0009.color;
    [station0146.drawPrimitives addObject:drawLine0255];
    
    MWDrawTextLine *drawTextLine0285 = [[MWDrawTextLine alloc] init];
    drawTextLine0285.text = station0146.nameOriginal;
    drawTextLine0285.fontName = @"HelveticaNeue";
    drawTextLine0285.fontColor = [UIColor blackColor];
    drawTextLine0285.fontSize = 32;
    drawTextLine0285.origin = CGPointMake(1363, 2778);
    [station0146.nameOriginalTextPrimitives addObject:drawTextLine0285];
    
    MWDrawTextLine *drawTextLine0286 = [[MWDrawTextLine alloc] init];
    drawTextLine0286.text = station0146.nameEnglish;
    drawTextLine0286.fontName = @"HelveticaNeue";
    drawTextLine0286.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0286.fontSize = 18;
    drawTextLine0286.origin = CGPointMake(1359, 2813);
    [station0146.nameEnglishTextPrimitives addObject:drawTextLine0286];
    
    // Добавляем перегон
    MWHaul *haul0139 = [[MWHaul alloc] init];
    haul0139.identifier = @"haul0139";
    haul0139.length = 1330;
    [edge0053.elements addObject:haul0139];
    
    MWDrawLine *drawLine0256 = [[MWDrawLine alloc] init];
    drawLine0256.startPoint = CGPointMake(1335.5, 2804);
    drawLine0256.endPoint = CGPointMake(1335.5, 2735.5);
    drawLine0256.width = 14.5;
    drawLine0256.color = line0009.color;
    [haul0139.drawPrimitives addObject:drawLine0256];
    
    // Добавляем станцию "Севастопольская"
    MWStation *station0147 = [[MWStation alloc] init];
    station0147.identifier = @"station0147";
    [edge0053.elements addObject:station0147];
    
    station0147.nameOriginal = @"Севастопольская";
    station0147.nameEnglish = @"Sevastopolskaya";
    station0147.mapLocation = CGPointMake(1335.5, 2735.5);
    station0147.geoLocation = CGPointMake(55.651317, 37.598340);
    
    MWDrawTextLine *drawTextLine0287 = [[MWDrawTextLine alloc] init];
    drawTextLine0287.text = station0147.nameOriginal;
    drawTextLine0287.fontName = @"HelveticaNeue";
    drawTextLine0287.fontColor = [UIColor blackColor];
    drawTextLine0287.fontSize = 32;
    drawTextLine0287.origin = CGPointMake(1363, 2720);
    [station0147.nameOriginalTextPrimitives addObject:drawTextLine0287];

    MWDrawTextLine *drawTextLine0288 = [[MWDrawTextLine alloc] init];
    drawTextLine0288.text = station0147.nameEnglish;
    drawTextLine0288.fontName = @"HelveticaNeue";
    drawTextLine0288.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0288.fontSize = 18;
    drawTextLine0288.origin = CGPointMake(1359, 2755);
    [station0147.nameEnglishTextPrimitives addObject:drawTextLine0288];
    
    // Добавляем вершину
    edge0053.finishVertex = vertex0038;
    
    // Создаем участок линии от "Севастопольская" до "Серпуховская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0054 = [[MWEdge alloc] init];
    edge0054.identifier = @"edge0054";
    edge0054.developmentName = @"Ребро: Севастопольская - Серпуховская";
    [self.edges addObject:(edge0054)];
    
    // Добавляем линию
    edge0054.line = line0009;

    // Добавляем вершину
    edge0054.startVertex = vertex0038;
    
    // Добавляем станцию "Севастопольская"
    [edge0054.elements addObject:station0147];
    
    // Добавляем перегон
    MWHaul *haul0140 = [[MWHaul alloc] init];
    haul0140.identifier = @"haul0140";
    haul0140.length = 1340;
    [edge0054.elements addObject:haul0140];
    
    MWDrawLine *drawLine0258 = [[MWDrawLine alloc] init];
    drawLine0258.startPoint = CGPointMake(1335.5, 2736);
    drawLine0258.endPoint = CGPointMake(1335.5, 2558.5);
    drawLine0258.width = 14.5;
    drawLine0258.color = line0009.color;
    [haul0140.drawPrimitives addObject:drawLine0258];
    
    // Добавляем станцию "Нахимовский проспект"
    MWStation *station0148 = [[MWStation alloc] init];
    station0148.identifier = @"station0148";
    [edge0054.elements addObject:station0148];
    
    station0148.nameOriginal = @"Нахимовский проспект";
    station0148.nameEnglish = @"Nahimovsky Prospekt";
    station0148.mapLocation = CGPointMake(1335.5, 2558.5);
    station0148.geoLocation = CGPointMake(55.662595, 37.605322);
    
    MWDrawLine *drawLine0259 = [[MWDrawLine alloc] init];
    drawLine0259.startPoint = CGPointMake(1335.5, 2558.5);
    drawLine0259.endPoint = CGPointMake(1355.5, 2558.5);
    drawLine0259.width = 12;
    drawLine0259.color = line0009.color;
    [station0148.drawPrimitives addObject:drawLine0259];
    
    MWDrawTextLine *drawTextLine0289 = [[MWDrawTextLine alloc] init];
    drawTextLine0289.text = @"Нахимовский";
    drawTextLine0289.fontName = @"HelveticaNeue";
    drawTextLine0289.fontColor = [UIColor blackColor];
    drawTextLine0289.fontSize = 32;
    drawTextLine0289.origin = CGPointMake(1363, 2533);
    [station0148.nameOriginalTextPrimitives addObject:drawTextLine0289];
    
    MWDrawTextLine *drawTextLine0290 = [[MWDrawTextLine alloc] init];
    drawTextLine0290.text = @"проспект";
    drawTextLine0290.fontName = @"HelveticaNeue";
    drawTextLine0290.fontColor = [UIColor blackColor];
    drawTextLine0290.fontSize = 32;
    drawTextLine0290.origin = CGPointMake(1363, 2564);
    [station0148.nameOriginalTextPrimitives addObject:drawTextLine0290];
    
    MWDrawTextLine *drawTextLine0291 = [[MWDrawTextLine alloc] init];
    drawTextLine0291.text = station0148.nameEnglish;
    drawTextLine0291.fontName = @"HelveticaNeue";
    drawTextLine0291.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0291.fontSize = 18;
    drawTextLine0291.origin = CGPointMake(1359, 2597);
    [station0148.nameEnglishTextPrimitives addObject:drawTextLine0291];
    
    // Добавляем перегон
    MWHaul *haul0141 = [[MWHaul alloc] init];
    haul0141.identifier = @"haul0141";
    haul0141.length = 1220;
    [edge0054.elements addObject:haul0141];
    
    MWDrawLine *drawLine0260 = [[MWDrawLine alloc] init];
    drawLine0260.startPoint = CGPointMake(1335.5, 2559);
    drawLine0260.endPoint = CGPointMake(1335.5, 2501.5);
    drawLine0260.width = 14.5;
    drawLine0260.color = line0009.color;
    [haul0141.drawPrimitives addObject:drawLine0260];
    
    // Добавляем станцию "Нагорная"
    MWStation *station0149 = [[MWStation alloc] init];
    station0149.identifier = @"station0149";
    [edge0054.elements addObject:station0149];
    
    station0149.nameOriginal = @"Нагорная";
    station0149.nameEnglish = @"Nagornaya";
    station0149.mapLocation = CGPointMake(1335.5, 2501.5);
    station0149.geoLocation = CGPointMake(55.672997, 37.610834);
    
    MWDrawLine *drawLine0261 = [[MWDrawLine alloc] init];
    drawLine0261.startPoint = CGPointMake(1335.5, 2501.5);
    drawLine0261.endPoint = CGPointMake(1355.5, 2501.5);
    drawLine0261.width = 12;
    drawLine0261.color = line0009.color;
    [station0149.drawPrimitives addObject:drawLine0261];
    
    MWDrawTextLine *drawTextLine0292 = [[MWDrawTextLine alloc] init];
    drawTextLine0292.text = station0149.nameOriginal;
    drawTextLine0292.fontName = @"HelveticaNeue";
    drawTextLine0292.fontColor = [UIColor blackColor];
    drawTextLine0292.fontSize = 32;
    drawTextLine0292.origin = CGPointMake(1363, 2477);
    [station0149.nameOriginalTextPrimitives addObject:drawTextLine0292];
    
    MWDrawTextLine *drawTextLine0293 = [[MWDrawTextLine alloc] init];
    drawTextLine0293.text = station0149.nameEnglish;
    drawTextLine0293.fontName = @"HelveticaNeue";
    drawTextLine0293.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0293.fontSize = 18;
    drawTextLine0293.origin = CGPointMake(1359, 2512);
    [station0149.nameEnglishTextPrimitives addObject:drawTextLine0293];
    
    // Добавляем перегон
    MWHaul *haul0142 = [[MWHaul alloc] init];
    haul0142.identifier = @"haul0142";
    haul0142.length = 1420;
    [edge0054.elements addObject:haul0142];
    
    MWDrawLine *drawLine0262 = [[MWDrawLine alloc] init];
    drawLine0262.startPoint = CGPointMake(1335.5, 2502);
    drawLine0262.endPoint = CGPointMake(1335.5, 2445.5);
    drawLine0262.width = 14.5;
    drawLine0262.color = line0009.color;
    [haul0142.drawPrimitives addObject:drawLine0262];
    
    // Добавляем станцию "Нагатинская"
    MWStation *station0150 = [[MWStation alloc] init];
    station0150.identifier = @"station0150";
    [edge0054.elements addObject:station0150];
    
    station0150.nameOriginal = @"Нагатинская";
    station0150.nameEnglish = @"Nagatinskaya";
    station0150.mapLocation = CGPointMake(1335.5, 2445.5);
    station0150.geoLocation = CGPointMake(55.683003, 37.621756);
    
    MWDrawLine *drawLine0263 = [[MWDrawLine alloc] init];
    drawLine0263.startPoint = CGPointMake(1335.5, 2445.5);
    drawLine0263.endPoint = CGPointMake(1355.5, 2445.5);
    drawLine0263.width = 12;
    drawLine0263.color = line0009.color;
    [station0150.drawPrimitives addObject:drawLine0263];
    
    MWDrawTextLine *drawTextLine0294 = [[MWDrawTextLine alloc] init];
    drawTextLine0294.text = station0150.nameOriginal;
    drawTextLine0294.fontName = @"HelveticaNeue";
    drawTextLine0294.fontColor = [UIColor blackColor];
    drawTextLine0294.fontSize = 32;
    drawTextLine0294.origin = CGPointMake(1363, 2421);
    [station0150.nameOriginalTextPrimitives addObject:drawTextLine0294];
    
    MWDrawTextLine *drawTextLine0295 = [[MWDrawTextLine alloc] init];
    drawTextLine0295.text = station0150.nameEnglish;
    drawTextLine0295.fontName = @"HelveticaNeue";
    drawTextLine0295.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0295.fontSize = 18;
    drawTextLine0295.origin = CGPointMake(1359, 2456);
    [station0150.nameEnglishTextPrimitives addObject:drawTextLine0295];
    
    // Добавляем перегон
    MWHaul *haul0143 = [[MWHaul alloc] init];
    haul0143.identifier = @"haul0143";
    haul0143.length = 2820;
    [edge0054.elements addObject:haul0143];
    
    MWDrawLine *drawLine0264 = [[MWDrawLine alloc] init];
    drawLine0264.startPoint = CGPointMake(1335.5, 2446);
    drawLine0264.endPoint = CGPointMake(1335.5, 2389.5);
    drawLine0264.width = 14.5;
    drawLine0264.color = line0009.color;
    [haul0143.drawPrimitives addObject:drawLine0264];
    
    // Добавляем станцию "Тульская"
    MWStation *station0151 = [[MWStation alloc] init];
    station0151.identifier = @"station0151";
    [edge0054.elements addObject:station0151];
    
    station0151.nameOriginal = @"Тульская";
    station0151.nameEnglish = @"Tulskaya";
    station0151.mapLocation = CGPointMake(1335.5, 2389.5);
    station0151.geoLocation = CGPointMake(55.708677, 37.622425);
    
    MWDrawLine *drawLine0265 = [[MWDrawLine alloc] init];
    drawLine0265.startPoint = CGPointMake(1335.5, 2389.5);
    drawLine0265.endPoint = CGPointMake(1355.5, 2389.5);
    drawLine0265.width = 12;
    drawLine0265.color = line0009.color;
    [station0151.drawPrimitives addObject:drawLine0265];
    
    MWDrawTextLine *drawTextLine0296 = [[MWDrawTextLine alloc] init];
    drawTextLine0296.text = station0151.nameOriginal;
    drawTextLine0296.fontName = @"HelveticaNeue";
    drawTextLine0296.fontColor = [UIColor blackColor];
    drawTextLine0296.fontSize = 32;
    drawTextLine0296.origin = CGPointMake(1362, 2365);
    [station0151.nameOriginalTextPrimitives addObject:drawTextLine0296];
    
    MWDrawTextLine *drawTextLine0297 = [[MWDrawTextLine alloc] init];
    drawTextLine0297.text = station0151.nameEnglish;
    drawTextLine0297.fontName = @"HelveticaNeue";
    drawTextLine0297.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0297.fontSize = 18;
    drawTextLine0297.origin = CGPointMake(1359, 2400);
    [station0151.nameEnglishTextPrimitives addObject:drawTextLine0297];
    
    // Добавляем перегон
    MWHaul *haul0144 = [[MWHaul alloc] init];
    haul0144.identifier = @"haul0144";
    haul0144.length = 2100;
    [edge0054.elements addObject:haul0144];
    
    MWDrawLine *drawLine0266 = [[MWDrawLine alloc] init];
    drawLine0266.startPoint = CGPointMake(1335.5, 2390);
    drawLine0266.endPoint = CGPointMake(1335.5, 2308.5);
    drawLine0266.width = 14.5;
    drawLine0266.color = line0009.color;
    [haul0144.drawPrimitives addObject:drawLine0266];
    
    // Добавляем станцию "Серпуховская"
    MWStation *station0152 = [[MWStation alloc] init];
    station0152.identifier = @"station0152";
    [edge0054.elements addObject:station0152];
    
    station0152.nameOriginal = @"Серпуховская";
    station0152.nameEnglish = @"Serpuhovskaya";
    station0152.mapLocation = CGPointMake(1335.5, 2308.5);
    station0152.geoLocation = CGPointMake(55.726800, 37.625285);
    
    MWDrawTextLine *drawTextLine0298 = [[MWDrawTextLine alloc] init];
    drawTextLine0298.text = station0152.nameOriginal;
    drawTextLine0298.fontName = @"HelveticaNeue";
    drawTextLine0298.fontColor = [UIColor blackColor];
    drawTextLine0298.fontSize = 32;
    drawTextLine0298.origin = CGPointMake(1357, 2308);
    [station0152.nameOriginalTextPrimitives addObject:drawTextLine0298];
    
    MWDrawTextLine *drawTextLine0299 = [[MWDrawTextLine alloc] init];
    drawTextLine0299.text = station0152.nameEnglish;
    drawTextLine0299.fontName = @"HelveticaNeue";
    drawTextLine0299.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0299.fontSize = 18;
    drawTextLine0299.origin = CGPointMake(1359, 2343);
    [station0152.nameEnglishTextPrimitives addObject:drawTextLine0299];
    
    // Добавляем вершину
    edge0054.finishVertex = vertex0023;
    
    // Создаем участок линии от "Серпуховская" до "Боровицкая"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0055 = [[MWEdge alloc] init];
    edge0055.identifier = @"edge0055";
    edge0055.developmentName = @"Ребро: Серпуховская - Боровицкая";
    [self.edges addObject:edge0055];
    
    // Добавляем линию
    edge0055.line = line0009;

    // Добавляем вершину
    edge0055.startVertex = vertex0023;
    
    // Добавляем станцию "Серпуховская"
    [edge0055.elements addObject:station0152];
    
    // Добавляем перегон
    MWHaul *haul0145 = [[MWHaul alloc] init];
    haul0145.identifier = @"haul0145";
    haul0145.length = 1260;
    [edge0055.elements addObject:haul0145];
    
    MWDrawLine *drawLine0267 = [[MWDrawLine alloc] init];
    drawLine0267.startPoint = CGPointMake(1335.5, 2309);
    drawLine0267.endPoint = CGPointMake(1335.5, 2186.5);
    drawLine0267.width = 14.5;
    drawLine0267.color = line0009.color;
    [haul0145.drawPrimitives addObject:drawLine0267];
    
    // Добавляем станцию "Полянка"
    MWStation *station0153 = [[MWStation alloc] init];
    station0153.identifier = @"station0153";
    [edge0055.elements addObject:station0153];
    
    station0153.nameOriginal = @"Полянка";
    station0153.nameEnglish = @"Polyanka";
    station0153.mapLocation = CGPointMake(1335.5, 2186.5);
    station0153.geoLocation = CGPointMake(55.736801, 37.618577);
    
    MWDrawLine *drawLine0268 = [[MWDrawLine alloc] init];
    drawLine0268.startPoint = CGPointMake(1335.5, 2186.5);
    drawLine0268.endPoint = CGPointMake(1355.5, 2186.5);
    drawLine0268.width = 12;
    drawLine0268.color = line0009.color;
    [station0153.drawPrimitives addObject:drawLine0268];
    
    MWDrawTextLine *drawTextLine0300 = [[MWDrawTextLine alloc] init];
    drawTextLine0300.text = station0153.nameOriginal;
    drawTextLine0300.fontName = @"HelveticaNeue";
    drawTextLine0300.fontColor = [UIColor blackColor];
    drawTextLine0300.fontSize = 32;
    drawTextLine0300.origin = CGPointMake(1363, 2162);
    [station0153.nameOriginalTextPrimitives addObject:drawTextLine0300];
    
    MWDrawTextLine *drawTextLine0301 = [[MWDrawTextLine alloc] init];
    drawTextLine0301.text = station0153.nameEnglish;
    drawTextLine0301.fontName = @"HelveticaNeue";
    drawTextLine0301.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0301.fontSize = 18;
    drawTextLine0301.origin = CGPointMake(1359, 2197);
    [station0153.nameEnglishTextPrimitives addObject:drawTextLine0301];
    
    // Добавляем перегон
    MWHaul *haul0146 = [[MWHaul alloc] init];
    haul0146.identifier = @"haul0146";
    haul0146.length = 1660;
    [edge0055.elements addObject:haul0146];
    
    MWDrawLine *drawLine0269 = [[MWDrawLine alloc] init];
    drawLine0269.startPoint = CGPointMake(1335.5, 2187);
    drawLine0269.endPoint = CGPointMake(1335.5, 2139);
    drawLine0269.width = 14.5;
    drawLine0269.color = line0009.color;
    [haul0146.drawPrimitives addObject:drawLine0269];
    
    MWDrawArc *drawArc0050 = [[MWDrawArc alloc] init];
    drawArc0050.center = CGPointMake(1235.5, 2139);
    drawArc0050.startRadians = 315 * M_PI / 180;
    drawArc0050.endRadians = 0 * M_PI / 180;
    drawArc0050.radius = 100;
    drawArc0050.width = 14.5;
    drawArc0050.color = line0009.color;
    [haul0146.drawPrimitives addObject:drawArc0050];
    
    MWDrawLine *drawLine0270 = [[MWDrawLine alloc] init];
    drawLine0270.startPoint = CGPointMake(1306.7, 2068.7);
    drawLine0270.endPoint = CGPointMake(1126.5, 1888.5);
    drawLine0270.width = 14.5;
    drawLine0270.color = line0009.color;
    [haul0146.drawPrimitives addObject:drawLine0270];
    
    // Добавляем станцию "Боровицкая"
    MWStation *station0154 = [[MWStation alloc] init];
    station0154.identifier = @"station0154";
    [edge0055.elements addObject:station0154];
    
    station0154.nameOriginal = @"Боровицкая";
    station0154.nameEnglish = @"Borovitskaya";
    station0154.mapLocation = CGPointMake(1126.5, 1888.5);
    station0154.geoLocation = CGPointMake(55.750509, 37.609153);
    
    MWDrawTextLine *drawTextLine0302 = [[MWDrawTextLine alloc] init];
    drawTextLine0302.text = station0154.nameOriginal;
    drawTextLine0302.fontName = @"HelveticaNeue";
    drawTextLine0302.fontColor = [UIColor blackColor];
    drawTextLine0302.fontSize = 32;
    drawTextLine0302.origin = CGPointMake(934, 1894);
    [station0154.nameOriginalTextPrimitives addObject:drawTextLine0302];
    
    MWDrawTextLine *drawTextLine0303 = [[MWDrawTextLine alloc] init];
    drawTextLine0303.text = station0154.nameEnglish;
    drawTextLine0303.fontName = @"HelveticaNeue";
    drawTextLine0303.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0303.fontSize = 18;
    drawTextLine0303.origin = CGPointMake(1010, 1929);
    [station0154.nameEnglishTextPrimitives addObject:drawTextLine0303];
    
    // Добавляем вершину
    edge0055.finishVertex = vertex0003;
    
    // Создаем участок линии от "Боровицкая" до "Чеховская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0056 = [[MWEdge alloc] init];
    edge0056.identifier = @"edge0056";
    edge0056.developmentName = @"Ребро: Боровицкая - Чеховская";
    [self.edges addObject:edge0056];
    
    // Добавляем линию
    edge0056.line = line0009;

    // Добавляем вершину
    edge0056.startVertex = vertex0003;
    
    // Добавляем станцию "Боровицкая"
    [edge0056.elements addObject:station0154];
    
    // Добавляем перегон
    MWHaul *haul0147 = [[MWHaul alloc] init];
    haul0147.identifier = @"haul0147";
    haul0147.length = 1860;
    [edge0056.elements addObject:haul0147];

    MWDrawLine *drawLine0271 = [[MWDrawLine alloc] init];
    drawLine0271.startPoint = CGPointMake(1127, 1889);
    drawLine0271.endPoint = CGPointMake(1122.5, 1884.5);
    drawLine0271.width = 14.5;
    drawLine0271.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawLine0271];
    
    MWDrawArc *drawArc0051 = [[MWDrawArc alloc] init];
    drawArc0051.center = CGPointMake(1194, 1814.5);
    drawArc0051.startRadians = 135 * M_PI / 180;
    drawArc0051.endRadians = 180 * M_PI / 180;
    drawArc0051.radius = 100;
    drawArc0051.width = 14.5;
    drawArc0051.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawArc0051];
    
    MWDrawLine *drawLine0272 = [[MWDrawLine alloc] init];
    drawLine0272.startPoint = CGPointMake(1094, 1815);
    drawLine0272.endPoint = CGPointMake(1094, 1726);
    drawLine0272.width = 14.5;
    drawLine0272.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawLine0272];
    
    MWDrawArc *drawArc0052 = [[MWDrawArc alloc] init];
    drawArc0052.center = CGPointMake(1194, 1726.5);
    drawArc0052.startRadians = 180 * M_PI / 180;
    drawArc0052.endRadians = 225 * M_PI / 180;
    drawArc0052.radius = 100;
    drawArc0052.width = 14.5;
    drawArc0052.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawArc0052];
    
    MWDrawLine *drawLine0273 = [[MWDrawLine alloc] init];
    drawLine0273.startPoint = CGPointMake(1122.5, 1656.5);
    drawLine0273.endPoint = CGPointMake(1245.5, 1533.5);
    drawLine0273.width = 14.5;
    drawLine0273.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawLine0273];
    
    // Добавляем станцию "Чеховская"
    MWStation *station0155 = [[MWStation alloc] init];
    station0155.identifier = @"station0155";
    [edge0056.elements addObject:station0155];
    
    station0155.nameOriginal = @"Чеховская";
    station0155.nameEnglish = @"Chehovskaya";
    station0155.mapLocation = CGPointMake(1245.5, 1533.5);
    station0155.geoLocation = CGPointMake(55.765892, 37.608306);
    
    MWDrawTextLine *drawTextLine0304 = [[MWDrawTextLine alloc] init];
    drawTextLine0304.text = station0155.nameOriginal;
    drawTextLine0304.fontName = @"HelveticaNeue";
    drawTextLine0304.fontColor = [UIColor blackColor];
    drawTextLine0304.fontSize = 32;
    drawTextLine0304.origin = CGPointMake(1243, 1549);
    [station0155.nameOriginalTextPrimitives addObject:drawTextLine0304];
    
    MWDrawTextLine *drawTextLine0305 = [[MWDrawTextLine alloc] init];
    drawTextLine0305.text = station0155.nameEnglish;
    drawTextLine0305.fontName = @"HelveticaNeue";
    drawTextLine0305.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0305.fontSize = 18;
    drawTextLine0305.origin = CGPointMake(1270, 1533);
    [station0155.nameEnglishTextPrimitives addObject:drawTextLine0305];
    
    // Добавляем вершину
    edge0056.finishVertex = vertex0014;
    
    // Создаем участок линии от "Чеховская" до "Цветной бульвар"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0057 = [[MWEdge alloc] init];
    edge0057.identifier = @"edge0057";
    edge0057.developmentName = @"Ребро: Чеховская - Цветной бульвар";
    [self.edges addObject:edge0057];
    
    // Добавляем линию
    edge0057.line = line0009;

    // Добавляем вершину
    edge0057.startVertex = vertex0014;
    
    // Добавляем станцию "Чеховская"
    [edge0057.elements addObject:station0155];
    
    // Добавляем перегон
    MWHaul *haul0148 = [[MWHaul alloc] init];
    haul0148.identifier = @"haul0148";
    haul0148.length = 1080;
    [edge0057.elements addObject:haul0148];
    
    MWDrawLine *drawLine0274 = [[MWDrawLine alloc] init];
    drawLine0274.startPoint = CGPointMake(1245, 1534);
    drawLine0274.endPoint = CGPointMake(1306.5, 1472.5);
    drawLine0274.width = 14.5;
    drawLine0274.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawLine0274];
    
    MWDrawArc *drawArc0053 = [[MWDrawArc alloc] init];
    drawArc0053.center = CGPointMake(1235, 1402.5);
    drawArc0053.startRadians = 0 * M_PI / 180;
    drawArc0053.endRadians = 45 * M_PI / 180;
    drawArc0053.radius = 100;
    drawArc0053.width = 14.5;
    drawArc0053.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawArc0053];
    
    MWDrawLine *drawLine0275 = [[MWDrawLine alloc] init];
    drawLine0275.startPoint = CGPointMake(1335, 1403);
    drawLine0275.endPoint = CGPointMake(1335, 1329);
    drawLine0275.width = 14.5;
    drawLine0275.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawLine0275];

    MWDrawArc *drawArc0054 = [[MWDrawArc alloc] init];
    drawArc0054.center = CGPointMake(1235, 1329.5);
    drawArc0054.startRadians = 315 * M_PI / 180;
    drawArc0054.endRadians = 0 * M_PI / 180;
    drawArc0054.radius = 100;
    drawArc0054.width = 14.5;
    drawArc0054.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawArc0054];

    MWDrawLine *drawLine0276 = [[MWDrawLine alloc] init];
    drawLine0276.startPoint = CGPointMake(1306.5, 1259.5);
    drawLine0276.endPoint = CGPointMake(1287.5, 1240.5);
    drawLine0276.width = 14.5;
    drawLine0276.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawLine0276];
    
    // Добавляем станцию "Цветной бульвар"
    MWStation *station0156 = [[MWStation alloc] init];
    station0156.identifier = @"station0156";
    [edge0057.elements addObject:station0156];

    station0156.nameOriginal = @"Цветной бульвар";
    station0156.nameEnglish = @"Tsvetnoy Bulvar";
    station0156.mapLocation = CGPointMake(1287.5, 1240.5);
    station0156.geoLocation = CGPointMake(55.771680, 37.620683);
    
    MWDrawTextLine *drawTextLine0306 = [[MWDrawTextLine alloc] init];
    drawTextLine0306.text = @"Цветной";
    drawTextLine0306.fontName = @"HelveticaNeue";
    drawTextLine0306.fontColor = [UIColor blackColor];
    drawTextLine0306.fontSize = 32;
    drawTextLine0306.origin = CGPointMake(1138, 1229);
    [station0156.nameOriginalTextPrimitives addObject:drawTextLine0306];
    
    MWDrawTextLine *drawTextLine0307 = [[MWDrawTextLine alloc] init];
    drawTextLine0307.text = @"бульвар";
    drawTextLine0307.fontName = @"HelveticaNeue";
    drawTextLine0307.fontColor = [UIColor blackColor];
    drawTextLine0307.fontSize = 32;
    drawTextLine0307.origin = CGPointMake(1142, 1262);
    [station0156.nameOriginalTextPrimitives addObject:drawTextLine0307];
    
    MWDrawTextLine *drawTextLine0308 = [[MWDrawTextLine alloc] init];
    drawTextLine0308.text = station0156.nameEnglish;
    drawTextLine0308.fontName = @"HelveticaNeue";
    drawTextLine0308.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0308.fontSize = 18;
    drawTextLine0308.origin = CGPointMake(1138, 1297);
    [station0156.nameEnglishTextPrimitives addObject:drawTextLine0308];
    
    MWDrawFillCircle *fillCircle0084 = [[MWDrawFillCircle alloc] init];
    fillCircle0084.center = CGPointMake(1287.5, 1240.5);
    fillCircle0084.radius = 4;
    fillCircle0084.fillColor = [UIColor whiteColor];
    [station0156.drawPrimitives addObject:fillCircle0084];

    // Добавляем вершину
    edge0057.finishVertex = vertex0039;
    
    // Создаем участок линии от "Цветной бульвар" до "Менделеевская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0058 = [[MWEdge alloc] init];
    edge0058.identifier = @"edge0058";
    edge0058.developmentName = @"Ребро: Цветной бульвар - Менделеевская";
    [self.edges addObject:edge0058];
    
    // Добавляем линию
    edge0058.line = line0009;

    // Добавляем вершину
    edge0058.startVertex = vertex0039;
    
    // Добавляем станцию "Цветной бульвар"
    [edge0058.elements addObject:station0156];
    
    // Добавляем перегон
    MWHaul *haul0149 = [[MWHaul alloc] init];
    haul0149.identifier = @"haul0149";
    haul0149.length = 1850;
    [edge0058.elements addObject:haul0149];
    
    MWDrawLine *drawLine0277 = [[MWDrawLine alloc] init];
    drawLine0277.startPoint = CGPointMake(1288, 1241);
    drawLine0277.endPoint = CGPointMake(1101.5, 1054.5);
    drawLine0277.width = 14.5;
    drawLine0277.color = line0009.color;
    [haul0149.drawPrimitives addObject:drawLine0277];
    
    // Добавляем станцию "Менделеевская"
    MWStation *station0157 = [[MWStation alloc] init];
    station0157.identifier = @"station0157";
    [edge0058.elements addObject:station0157];
    
    station0157.nameOriginal = @"Мендеевская";
    station0157.nameEnglish = @"Mendeleevskaya";
    station0157.mapLocation = CGPointMake(1101.5, 1054.5);
    station0157.geoLocation = CGPointMake(55.781803, 37.599058);
    
    MWDrawTextLine *drawTextLine0309 = [[MWDrawTextLine alloc] init];
    drawTextLine0309.text = station0157.nameOriginal;
    drawTextLine0309.fontName = @"HelveticaNeue";
    drawTextLine0309.fontColor = [UIColor blackColor];
    drawTextLine0309.fontSize = 32;
    drawTextLine0309.origin = CGPointMake(1093, 997);
    [station0157.nameOriginalTextPrimitives addObject:drawTextLine0309];
    
    MWDrawTextLine *drawTextLine0310 = [[MWDrawTextLine alloc] init];
    drawTextLine0310.text = station0157.nameEnglish;
    drawTextLine0310.fontName = @"HelveticaNeue";
    drawTextLine0310.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0310.fontSize = 18;
    drawTextLine0310.origin = CGPointMake(1089, 984);
    [station0157.nameEnglishTextPrimitives addObject:drawTextLine0310];
    
    // Добавляем вершину
    edge0058.finishVertex = vertex0026;
    
    // Создаем участок линии от "Менделеевская" до "Алтуфьево"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0059 = [[MWEdge alloc] init];
    edge0059.identifier = @"edge0059";
    edge0059.developmentName = @"Ребро: Менделеевская - Алтуфьево";
    [self.edges addObject:edge0059];
    
    // Добавляем линию
    edge0059.line = line0009;

    // Добавляем вершину
    edge0059.startVertex = vertex0026;
    
    // Добавляем станцию "Менделеевская"
    [edge0059.elements addObject:station0157];
    
    // Добавляем перегон
    MWHaul *haul0150 = [[MWHaul alloc] init];
    haul0150.identifier = @"haul0150";
    haul0150.length = 1440;
    [edge0059.elements addObject:haul0150];
    
    MWDrawLine *drawLine0278 = [[MWDrawLine alloc] init];
    drawLine0278.startPoint = CGPointMake(1102, 1055);
    drawLine0278.endPoint = CGPointMake(1073.2, 1026.2);
    drawLine0278.width = 14.5;
    drawLine0278.color = line0009.color;
    [haul0150.drawPrimitives addObject:drawLine0278];
    
    MWDrawArc *drawArc0055 = [[MWDrawArc alloc] init];
    drawArc0055.center = CGPointMake(1144.5, 956);
    drawArc0055.startRadians = 135 * M_PI / 180;
    drawArc0055.endRadians = 180 * M_PI / 180;
    drawArc0055.radius = 100;
    drawArc0055.width = 14.5;
    drawArc0055.color = line0009.color;
    [haul0150.drawPrimitives addObject:drawArc0055];

    MWDrawLine *drawLine0279 = [[MWDrawLine alloc] init];
    drawLine0279.startPoint = CGPointMake(1044.5, 956.4);
    drawLine0279.endPoint = CGPointMake(1044.5, 935.5);
    drawLine0279.width = 14.5;
    drawLine0279.color = line0009.color;
    [haul0150.drawPrimitives addObject:drawLine0279];
    
    // Добавляем станцию "Савеловская"
    MWStation *station0158 = [[MWStation alloc] init];
    station0158.identifier = @"station0158";
    [edge0059.elements addObject:station0158];
    
    station0158.nameOriginal = @"Савёловская";
    station0158.nameEnglish = @"Savelovskaya";
    station0158.mapLocation = CGPointMake(1044.5, 935.5);
    station0158.geoLocation = CGPointMake(55.794162, 37.588146);
    
    MWDrawLine *drawLine0280 = [[MWDrawLine alloc] init];
    drawLine0280.startPoint = CGPointMake(1044.5, 935.5);
    drawLine0280.endPoint = CGPointMake(1065, 935.5);
    drawLine0280.width = 12;
    drawLine0280.color = line0009.color;
    [haul0150.drawPrimitives addObject:drawLine0280];
    
    MWDrawTextLine *drawTextLine0311 = [[MWDrawTextLine alloc] init];
    drawTextLine0311.text = station0158.nameOriginal;
    drawTextLine0311.fontName = @"HelveticaNeue";
    drawTextLine0311.fontColor = [UIColor blackColor];
    drawTextLine0311.fontSize = 32;
    drawTextLine0311.origin = CGPointMake(1073, 911);
    [station0158.nameOriginalTextPrimitives addObject:drawTextLine0311];
    
    MWDrawTextLine *drawTextLine0312 = [[MWDrawTextLine alloc] init];
    drawTextLine0312.text = station0158.nameEnglish;
    drawTextLine0312.fontName = @"HelveticaNeue";
    drawTextLine0312.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0312.fontSize = 18;
    drawTextLine0312.origin = CGPointMake(1069, 895);
    [station0158.nameEnglishTextPrimitives addObject:drawTextLine0312];
    
    // Добавляем перегон
    MWHaul *haul0151 = [[MWHaul alloc] init];
    haul0151.identifier = @"haul0151";
    haul0151.length = 1700;
    [edge0059.elements addObject:haul0151];
    
    MWDrawLine *drawLine0281 = [[MWDrawLine alloc] init];
    drawLine0281.startPoint = CGPointMake(1044.5, 936);
    drawLine0281.endPoint = CGPointMake(1044.5, 859.5);
    drawLine0281.width = 14.5;
    drawLine0281.color = line0009.color;
    [haul0151.drawPrimitives addObject:drawLine0281];
    
    // Добавляем станцию "Дмитровская"
    MWStation *station0159 = [[MWStation alloc] init];
    station0159.identifier = @"station0159";
    [edge0059.elements addObject:station0159];
    
    station0159.nameOriginal = @"Дмитровская";
    station0159.nameEnglish = @"Dmitrovskaya";
    station0159.mapLocation = CGPointMake(1044.5, 859.5);
    station0159.geoLocation = CGPointMake(55.807992, 37.581177);
    
    MWDrawLine *drawLine0282 = [[MWDrawLine alloc] init];
    drawLine0282.startPoint = CGPointMake(1044.5, 859.5);
    drawLine0282.endPoint = CGPointMake(1065, 859.5);
    drawLine0282.width = 12;
    drawLine0282.color = line0009.color;
    [haul0151.drawPrimitives addObject:drawLine0282];
    
    MWDrawTextLine *drawTextLine0313 = [[MWDrawTextLine alloc] init];
    drawTextLine0313.text = station0159.nameOriginal;
    drawTextLine0313.fontName = @"HelveticaNeue";
    drawTextLine0313.fontColor = [UIColor blackColor];
    drawTextLine0313.fontSize = 32;
    drawTextLine0313.origin = CGPointMake(1072, 834);
    [station0159.nameOriginalTextPrimitives addObject:drawTextLine0313];

    MWDrawTextLine *drawTextLine0314 = [[MWDrawTextLine alloc] init];
    drawTextLine0314.text = station0159.nameEnglish;
    drawTextLine0314.fontName = @"HelveticaNeue";
    drawTextLine0314.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0314.fontSize = 18;
    drawTextLine0314.origin = CGPointMake(1069, 818);
    [station0159.nameEnglishTextPrimitives addObject:drawTextLine0314];
    
    // Добавляем перегон
    MWHaul *haul0152 = [[MWHaul alloc] init];
    haul0152.identifier = @"haul0152";
    haul0152.length = 1270;
    [edge0059.elements addObject:haul0152];

    MWDrawLine *drawLine0283 = [[MWDrawLine alloc] init];
    drawLine0283.startPoint = CGPointMake(1044.5, 860);
    drawLine0283.endPoint = CGPointMake(1044.5, 717.5);
    drawLine0283.width = 14.5;
    drawLine0283.color = line0009.color;
    [haul0152.drawPrimitives addObject:drawLine0283];
    
    // Добавляем станцию "Тимирязевская"
    MWStation *station0160 = [[MWStation alloc] init];
    station0160.identifier = @"station0160";
    [edge0059.elements addObject:station0160];
    
    station0160.nameOriginal = @"Тимирязевская";
    station0160.nameEnglish = @"Timiryazevskaya";
    station0160.mapLocation = CGPointMake(1044.5, 717.5);
    station0160.geoLocation = CGPointMake(55.819010, 37.578896);
    
    MWDrawLine *drawLine0284 = [[MWDrawLine alloc] init];
    drawLine0284.startPoint = CGPointMake(1044.5, 717.5);
    drawLine0284.endPoint = CGPointMake(1065, 717.5);
    drawLine0284.width = 12;
    drawLine0284.color = line0009.color;
    [station0160.drawPrimitives addObject:drawLine0284];
    
    MWDrawTextLine *drawTextLine0315 = [[MWDrawTextLine alloc] init];
    drawTextLine0315.text = station0160.nameOriginal;
    drawTextLine0315.fontName = @"HelveticaNeue";
    drawTextLine0315.fontColor = [UIColor blackColor];
    drawTextLine0315.fontSize = 32;
    drawTextLine0315.origin = CGPointMake(1072, 693);
    [station0160.nameOriginalTextPrimitives addObject:drawTextLine0315];
    
    MWDrawTextLine *drawTextLine0316 = [[MWDrawTextLine alloc] init];
    drawTextLine0316.text = station0160.nameEnglish;
    drawTextLine0316.fontName = @"HelveticaNeue";
    drawTextLine0316.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0316.fontSize = 18;
    drawTextLine0316.origin = CGPointMake(1100, 728);
    [station0160.nameEnglishTextPrimitives addObject:drawTextLine0316];
    
    // Добавляем перегон
    MWHaul *haul0153 = [[MWHaul alloc] init];
    haul0153.identifier = @"haul0153";
    haul0153.length = 2000;
    [edge0059.elements addObject:haul0153];
    
    MWDrawLine *drawLine0285 = [[MWDrawLine alloc] init];
    drawLine0285.startPoint = CGPointMake(1044.5, 718);
    drawLine0285.endPoint = CGPointMake(1044.5, 660);
    drawLine0285.width = 14.5;
    drawLine0285.color = line0009.color;
    [haul0153.drawPrimitives addObject:drawLine0285];
    
    // Добавляем станцию "Петровско-Разумовская"
    MWStation *station0161 = [[MWStation alloc] init];
    station0161.identifier = @"station0161";
    [edge0059.elements addObject:station0161];

    station0161.nameOriginal = @"Петровско-Разумовская";
    station0161.nameEnglish = @"Petrovsko-Razumovskaya";
    station0161.mapLocation = CGPointMake(1044.5, 660);
    station0161.geoLocation = CGPointMake(55.836663, 37.575353);
    
    MWDrawLine *drawLine0286 = [[MWDrawLine alloc] init];
    drawLine0286.startPoint = CGPointMake(1044.5, 660);
    drawLine0286.endPoint = CGPointMake(1065, 660);
    drawLine0286.width = 12;
    drawLine0286.color = line0009.color;
    [station0161.drawPrimitives addObject:drawLine0286];
    
    MWDrawTextLine *drawTextLine0317 = [[MWDrawTextLine alloc] init];
    drawTextLine0317.text = station0161.nameOriginal;
    drawTextLine0317.fontName = @"HelveticaNeue";
    drawTextLine0317.fontColor = [UIColor blackColor];
    drawTextLine0317.fontSize = 32;
    drawTextLine0317.origin = CGPointMake(1073, 635);
    [station0161.nameOriginalTextPrimitives addObject:drawTextLine0317];
    
    MWDrawTextLine *drawTextLine0318 = [[MWDrawTextLine alloc] init];
    drawTextLine0318.text = station0161.nameEnglish;
    drawTextLine0318.fontName = @"HelveticaNeue";
    drawTextLine0318.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0318.fontSize = 18;
    drawTextLine0318.origin = CGPointMake(1069, 670);
    [station0161.nameEnglishTextPrimitives addObject:drawTextLine0318];
    
    // Добавляем перегон
    MWHaul *haul0154 = [[MWHaul alloc] init];
    haul0154.identifier = @"haul0154";
    haul0154.length = 1640;
    [edge0059.elements addObject:haul0154];
    
    MWDrawLine *drawLine0287 = [[MWDrawLine alloc] init];
    drawLine0287.startPoint = CGPointMake(1044.5, 660.5);
    drawLine0287.endPoint = CGPointMake(1044.5, 602.5);
    drawLine0287.width = 14.5;
    drawLine0287.color = line0009.color;
    [haul0154.drawPrimitives addObject:drawLine0287];
    
    // Добавляем станцию "Владыкино"
    MWStation *station0162 = [[MWStation alloc] init];
    station0162.identifier = @"station0162";
    [edge0059.elements addObject:station0162];
    
    station0162.nameOriginal = @"Владыкино";
    station0162.nameEnglish = @"Vladykino";
    station0162.mapLocation = CGPointMake(1044.5, 602.5);
    station0162.geoLocation = CGPointMake(55.847249, 37.589849);
    
    MWDrawLine *drawLine0288 = [[MWDrawLine alloc] init];
    drawLine0288.startPoint = CGPointMake(1044.5, 602.5);
    drawLine0288.endPoint = CGPointMake(1065, 602.5);
    drawLine0288.width = 12;
    drawLine0288.color = line0009.color;
    [station0162.drawPrimitives addObject:drawLine0288];
    
    MWDrawTextLine *drawTextLine0319 = [[MWDrawTextLine alloc] init];
    drawTextLine0319.text = station0162.nameOriginal;
    drawTextLine0319.fontName = @"HelveticaNeue";
    drawTextLine0319.fontColor = [UIColor blackColor];
    drawTextLine0319.fontSize = 32;
    drawTextLine0319.origin = CGPointMake(1073, 577);
    [station0162.nameOriginalTextPrimitives addObject:drawTextLine0319];
    
    MWDrawTextLine *drawTextLine0320 = [[MWDrawTextLine alloc] init];
    drawTextLine0320.text = station0162.nameEnglish;
    drawTextLine0320.fontName = @"HelveticaNeue";
    drawTextLine0320.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0320.fontSize = 18;
    drawTextLine0320.origin = CGPointMake(1069, 612);
    [station0162.nameEnglishTextPrimitives addObject:drawTextLine0320];
    
    // Добавляем перегон
    MWHaul *haul0155 = [[MWHaul alloc] init];
    haul0155.identifier = @"haul0155";
    haul0155.length = 1960;
    [edge0059.elements addObject:haul0155];
    
    MWDrawLine *drawLine0289 = [[MWDrawLine alloc] init];
    drawLine0289.startPoint = CGPointMake(1044.5, 603);
    drawLine0289.endPoint = CGPointMake(1044.5, 544);
    drawLine0289.width = 14.5;
    drawLine0289.color = line0009.color;
    [haul0155.drawPrimitives addObject:drawLine0289];
    
    // Добавляем станцию "Отрадное"
    MWStation *station0163 = [[MWStation alloc] init];
    station0163.identifier = @"station0163";
    [edge0059.elements addObject:station0163];
    
    station0163.nameOriginal = @"Отрадное";
    station0163.nameEnglish = @"Otradnoe";
    station0163.mapLocation = CGPointMake(1044.5, 544);
    station0163.geoLocation = CGPointMake(55.863398, 37.604620);
    
    MWDrawLine *drawLine0290 = [[MWDrawLine alloc] init];
    drawLine0290.startPoint = CGPointMake(1044.5, 544);
    drawLine0290.endPoint = CGPointMake(1065, 544);
    drawLine0290.width = 12;
    drawLine0290.color = line0009.color;
    [station0163.drawPrimitives addObject:drawLine0290];
    
    MWDrawTextLine *drawTextLine0321 = [[MWDrawTextLine alloc] init];
    drawTextLine0321.text = station0163.nameOriginal;
    drawTextLine0321.fontName = @"HelveticaNeue";
    drawTextLine0321.fontColor = [UIColor blackColor];
    drawTextLine0321.fontSize = 32;
    drawTextLine0321.origin = CGPointMake(1073, 519);
    [station0163.nameOriginalTextPrimitives addObject:drawTextLine0321];
    
    MWDrawTextLine *drawTextLine0322 = [[MWDrawTextLine alloc] init];
    drawTextLine0322.text = station0163.nameEnglish;
    drawTextLine0322.fontName = @"HelveticaNeue";
    drawTextLine0322.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0322.fontSize = 18;
    drawTextLine0322.origin = CGPointMake(1069, 554);
    [station0163.nameEnglishTextPrimitives addObject:drawTextLine0322];
    
    // Добавляем перегон
    MWHaul *haul0156 = [[MWHaul alloc] init];
    haul0156.identifier = @"haul0156";
    haul0156.length = 2290;
    [edge0059.elements addObject:haul0156];
    
    MWDrawLine *drawLine0291 = [[MWDrawLine alloc] init];
    drawLine0291.startPoint = CGPointMake(1044.5, 544.5);
    drawLine0291.endPoint = CGPointMake(1044.5, 486);
    drawLine0291.width = 14.5;
    drawLine0291.color = line0009.color;
    [haul0156.drawPrimitives addObject:drawLine0291];
    
    // Добавляем станцию "Бибирево"
    MWStation *station0164 = [[MWStation alloc] init];
    station0164.identifier = @"station0164";
    [edge0059.elements addObject:station0164];
    
    station0164.nameOriginal = @"Бибирево";
    station0164.nameEnglish = @"Bibirevo";
    station0164.mapLocation = CGPointMake(1044.5, 486);
    station0164.geoLocation = CGPointMake(55.883990, 37.603605);
    
    MWDrawLine *drawLine0292 = [[MWDrawLine alloc] init];
    drawLine0292.startPoint = CGPointMake(1044.5, 486);
    drawLine0292.endPoint = CGPointMake(1065, 486);
    drawLine0292.width = 12;
    drawLine0292.color = line0009.color;
    [station0164.drawPrimitives addObject:drawLine0292];
    
    MWDrawTextLine *drawTextLine0323 = [[MWDrawTextLine alloc] init];
    drawTextLine0323.text = station0164.nameOriginal;
    drawTextLine0323.fontName = @"HelveticaNeue";
    drawTextLine0323.fontColor = [UIColor blackColor];
    drawTextLine0323.fontSize = 32;
    drawTextLine0323.origin = CGPointMake(1073, 461);
    [station0164.nameOriginalTextPrimitives addObject:drawTextLine0323];

    MWDrawTextLine *drawTextLine0324 = [[MWDrawTextLine alloc] init];
    drawTextLine0324.text = station0164.nameEnglish;
    drawTextLine0324.fontName = @"HelveticaNeue";
    drawTextLine0324.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0324.fontSize = 18;
    drawTextLine0324.origin = CGPointMake(1069, 496);
    [station0164.nameEnglishTextPrimitives addObject:drawTextLine0324];
    
    // Добавляем перегон
    MWHaul *haul0157 = [[MWHaul alloc] init];
    haul0157.identifier = @"haul0157";
    haul0157.length = 1920;
    [edge0059.elements addObject:haul0157];
    
    MWDrawLine *drawLine0293 = [[MWDrawLine alloc] init];
    drawLine0293.startPoint = CGPointMake(1044.5, 486.5);
    drawLine0293.endPoint = CGPointMake(1044.5, 428.5);
    drawLine0293.width = 14.5;
    drawLine0293.color = line0009.color;
    [haul0157.drawPrimitives addObject:drawLine0293];
    
    // Добавляем станцию "Алтуфьево"
    MWStation *station0165 = [[MWStation alloc] init];
    station0165.identifier = @"station0165";
    [edge0059.elements addObject:station0165];
    
    station0165.nameOriginal = @"Алтуфьево";
    station0165.nameEnglish = @"Altufyevo";
    station0165.mapLocation = CGPointMake(1044.5, 428.5);
    station0165.geoLocation = CGPointMake(55.897863, 37.587083);
    
    MWDrawLine *drawLine0294 = [[MWDrawLine alloc] init];
    drawLine0294.startPoint = CGPointMake(1024.5, 428.5);
    drawLine0294.endPoint = CGPointMake(1065, 428.5);
    drawLine0294.width = 12;
    drawLine0294.color = line0009.color;
    [station0165.drawPrimitives addObject:drawLine0294];

    MWDrawTextLine *drawTextLine0325 = [[MWDrawTextLine alloc] init];
    drawTextLine0325.text = station0165.nameOriginal;
    drawTextLine0325.fontName = @"HelveticaNeue";
    drawTextLine0325.fontColor = [UIColor blackColor];
    drawTextLine0325.fontSize = 32;
    drawTextLine0325.origin = CGPointMake(1073, 403);
    [station0165.nameOriginalTextPrimitives addObject:drawTextLine0325];

    MWDrawTextLine *drawTextLine0326 = [[MWDrawTextLine alloc] init];
    drawTextLine0326.text = station0165.nameEnglish;
    drawTextLine0326.fontName = @"HelveticaNeue";
    drawTextLine0326.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0326.fontSize = 18;
    drawTextLine0326.origin = CGPointMake(1069, 438);
    [station0165.nameEnglishTextPrimitives addObject:drawTextLine0326];
    
    // Добавляем вершину
    edge0059.finishVertex = vertex0040 ;
    
    ////////////////////////////////////////////////////////////////
    // 10 - Люблинская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Зябликово" до "Крестьянская застава"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0060 = [[MWEdge alloc] init];
    edge0060.identifier = @"edge0060";
    edge0060.developmentName = @"Ребро: Зябликово - Крестьянская застава";
    [self.edges addObject:edge0060];
    
    // Добавляем линию
    edge0060.line = line0010;

    // Добавляем вершину
    edge0060.startVertex = vertex0010;
    
    // Добавляем станцию "Зябликово"
    MWStation *station0166 = [[MWStation alloc] init];
    station0166.identifier = @"station0166";
    [edge0060.elements addObject:station0166];

    station0166.nameOriginal = @"Зябликово";
    station0166.nameEnglish = @"Zyablikovo";
    station0166.mapLocation = CGPointMake(1997.5, 2986.5);
    station0166.geoLocation = CGPointMake(55.612030, 37.744947);
    
    MWDrawTextLine *drawTextLine0327 = [[MWDrawTextLine alloc] init];
    drawTextLine0327.text = station0166.nameOriginal;
    drawTextLine0327.fontName = @"HelveticaNeue";
    drawTextLine0327.fontColor = [UIColor blackColor];
    drawTextLine0327.fontSize = 32;
    drawTextLine0327.origin = CGPointMake(2020, 2956);
    [station0166.nameOriginalTextPrimitives addObject:drawTextLine0327];
    
    MWDrawTextLine *drawTextLine0328 = [[MWDrawTextLine alloc] init];
    drawTextLine0328.text = station0166.nameEnglish;
    drawTextLine0328.fontName = @"HelveticaNeue";
    drawTextLine0328.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0328.fontSize = 18;
    drawTextLine0328.origin = CGPointMake(2016, 2938);
    [station0166.nameEnglishTextPrimitives addObject:drawTextLine0328];
    
    // Добавляем перегон
    MWHaul *haul0158 = [[MWHaul alloc] init];
    haul0158.identifier = @"haul0158";
    haul0158.length = 957;
    [edge0060.elements addObject:haul0158];
    
    MWDrawLine *drawLine0295 = [[MWDrawLine alloc] init];
    drawLine0295.startPoint = CGPointMake(1997.5, 2973.5);
    drawLine0295.endPoint = CGPointMake(1997.5, 2891.5);
    drawLine0295.width = 14.5;
    drawLine0295.color = line0010.color;
    [haul0158.drawPrimitives addObject:drawLine0295];
    
    // Добавляем станцию "Шипиловская"
    MWStation *station0167 = [[MWStation alloc] init];
    station0167.identifier = @"station0167";
    [edge0060.elements addObject:station0167];
    
    station0167.nameOriginal = @"Шипиловская";
    station0167.nameEnglish = @"Shipilovskaya";
    station0167.mapLocation = CGPointMake(1997.5, 2891.5);
    station0167.geoLocation = CGPointMake(55.621005, 37.743598);
    
    MWDrawLine *drawLine0296 = [[MWDrawLine alloc] init];
    drawLine0296.startPoint = CGPointMake(1997.5, 2891.5);
    drawLine0296.endPoint = CGPointMake(2016.5, 2891.5);
    drawLine0296.width = 12;
    drawLine0296.color = line0010.color;
    [station0167.drawPrimitives addObject:drawLine0296];
    
    MWDrawTextLine *drawTextLine0329 = [[MWDrawTextLine alloc] init];
    drawTextLine0329.text = station0167.nameOriginal;
    drawTextLine0329.fontName = @"HelveticaNeue";
    drawTextLine0329.fontColor = [UIColor blackColor];
    drawTextLine0329.fontSize = 32;
    drawTextLine0329.origin = CGPointMake(2024, 2867);
    [station0167.nameOriginalTextPrimitives addObject:drawTextLine0329];
    
    MWDrawTextLine *drawTextLine0330 = [[MWDrawTextLine alloc] init];
    drawTextLine0330.text = station0167.nameEnglish;
    drawTextLine0330.fontName = @"HelveticaNeue";
    drawTextLine0330.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0330.fontSize = 18;
    drawTextLine0330.origin = CGPointMake(2020, 2902);
    [station0167.nameEnglishTextPrimitives addObject:drawTextLine0330];
    
    // Добавляем перегон
    MWHaul *haul0159 = [[MWHaul alloc] init];
    haul0159.identifier = @"haul0159";
    haul0159.length = 1420;
    [edge0060.elements addObject:haul0159];
    
    MWDrawLine *drawLine0297 = [[MWDrawLine alloc] init];
    drawLine0297.startPoint = CGPointMake(1997.5, 2892);
    drawLine0297.endPoint = CGPointMake(1997.5, 2818.5);
    drawLine0297.width = 14.5;
    drawLine0297.color = line0010.color;
    [haul0159.drawPrimitives addObject:drawLine0297];
    
    // Добавляем станцию "Борисово"
    MWStation *station0168 = [[MWStation alloc] init];
    station0168.identifier = @"station0168";
    [edge0060.elements addObject:station0168];
    
    station0168.nameOriginal = @"Борисово";
    station0168.nameEnglish = @"Borisovo";
    station0168.mapLocation = CGPointMake(1997.5, 2818.5);
    station0168.geoLocation = CGPointMake(55.633463, 37.744071);
    
    MWDrawLine *drawLine0298 = [[MWDrawLine alloc] init];
    drawLine0298.startPoint = CGPointMake(1997.5, 2818.5);
    drawLine0298.endPoint = CGPointMake(2016.5, 2818.5);
    drawLine0298.width = 12;
    drawLine0298.color = line0010.color;
    [station0168.drawPrimitives addObject:drawLine0298];
    
    MWDrawTextLine *drawTextLine0331 = [[MWDrawTextLine alloc] init];
    drawTextLine0331.text = station0168.nameOriginal;
    drawTextLine0331.fontName = @"HelveticaNeue";
    drawTextLine0331.fontColor = [UIColor blackColor];
    drawTextLine0331.fontSize = 32;
    drawTextLine0331.origin = CGPointMake(2024, 2794);
    [station0168.nameOriginalTextPrimitives addObject:drawTextLine0331];
    
    MWDrawTextLine *drawTextLine0332 = [[MWDrawTextLine alloc] init];
    drawTextLine0332.text = station0168.nameEnglish;
    drawTextLine0332.fontName = @"HelveticaNeue";
    drawTextLine0332.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0332.fontSize = 18;
    drawTextLine0332.origin = CGPointMake(2020, 2829);
    [station0168.nameEnglishTextPrimitives addObject:drawTextLine0332];
    
    // Добавляем перегон
    MWHaul *haul0160 = [[MWHaul alloc] init];
    haul0160.identifier = @"haul0160";
    haul0160.length = 1760;
    [edge0060.elements addObject:haul0160];
    
    MWDrawLine *drawLine0299 = [[MWDrawLine alloc] init];
    drawLine0299.startPoint = CGPointMake(1997.5, 2819);
    drawLine0299.endPoint = CGPointMake(1997.5, 2746.5);
    drawLine0299.width = 14.5;
    drawLine0299.color = line0010.color;
    [haul0160.drawPrimitives addObject:drawLine0299];
    
    // Добавляем станцию "Марьино"
    MWStation *station0169 = [[MWStation alloc] init];
    station0169.identifier = @"station0169";
    [edge0060.elements addObject:station0169];
    
    station0169.nameOriginal = @"Марьино";
    station0169.nameEnglish = @"Maryino";
    station0169.mapLocation = CGPointMake(1997.5, 2746.5);
    station0169.geoLocation = CGPointMake(55.650168, 37.743736);
    
    MWDrawLine *drawLine0300 = [[MWDrawLine alloc] init];
    drawLine0300.startPoint = CGPointMake(1997.5, 2746.5);
    drawLine0300.endPoint = CGPointMake(2016.5, 2746.5);
    drawLine0300.width = 12;
    drawLine0300.color = line0010.color;
    [station0169.drawPrimitives addObject:drawLine0300];
    
    MWDrawTextLine *drawTextLine0333 = [[MWDrawTextLine alloc] init];
    drawTextLine0333.text = station0169.nameOriginal;
    drawTextLine0333.fontName = @"HelveticaNeue";
    drawTextLine0333.fontColor = [UIColor blackColor];
    drawTextLine0333.fontSize = 32;
    drawTextLine0333.origin = CGPointMake(2024, 2722);
    [station0169.nameOriginalTextPrimitives addObject:drawTextLine0333];
    
    MWDrawTextLine *drawTextLine0334 = [[MWDrawTextLine alloc] init];
    drawTextLine0334.text = station0169.nameEnglish;
    drawTextLine0334.fontName = @"HelveticaNeue";
    drawTextLine0334.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0334.fontSize = 18;
    drawTextLine0334.origin = CGPointMake(2020, 2757);
    [station0169.nameEnglishTextPrimitives addObject:drawTextLine0334];
    
    // Добавляем перегон
    MWHaul *haul0161 = [[MWHaul alloc] init];
    haul0161.identifier = @"haul0161";
    haul0161.length = 1210;
    [edge0060.elements addObject:haul0161];
    
    MWDrawLine *drawLine0301 = [[MWDrawLine alloc] init];
    drawLine0301.startPoint = CGPointMake(1997.5, 2747);
    drawLine0301.endPoint = CGPointMake(1997.5, 2674.5);
    drawLine0301.width = 14.5;
    drawLine0301.color = line0010.color;
    [haul0161.drawPrimitives addObject:drawLine0301];
    
    // Добавляем станцию "Братиславская"
    MWStation *station0170 = [[MWStation alloc] init];
    station0170.identifier = @"station0170";
    [edge0060.elements addObject:station0170];
    
    station0170.nameOriginal = @"Братиславская";
    station0170.nameEnglish = @"Bratislavskaya";
    station0170.mapLocation = CGPointMake(1997.5, 2674.5);
    station0170.geoLocation = CGPointMake(55.659529, 37.750613);
    
    MWDrawLine *drawLine0302 = [[MWDrawLine alloc] init];
    drawLine0302.startPoint = CGPointMake(1997.5, 2674.5);
    drawLine0302.endPoint = CGPointMake(2016.5, 2674.5);
    drawLine0302.width = 12;
    drawLine0302.color = line0010.color;
    [station0170.drawPrimitives addObject:drawLine0302];
    
    MWDrawTextLine *drawTextLine0335 = [[MWDrawTextLine alloc] init];
    drawTextLine0335.text = station0170.nameOriginal;
    drawTextLine0335.fontName = @"HelveticaNeue";
    drawTextLine0335.fontColor = [UIColor blackColor];
    drawTextLine0335.fontSize = 32;
    drawTextLine0335.origin = CGPointMake(2024, 2649);
    [station0170.nameOriginalTextPrimitives addObject:drawTextLine0335];
    
    MWDrawTextLine *drawTextLine0336 = [[MWDrawTextLine alloc] init];
    drawTextLine0336.text = station0169.nameEnglish;
    drawTextLine0336.fontName = @"HelveticaNeue";
    drawTextLine0336.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0336.fontSize = 18;
    drawTextLine0336.origin = CGPointMake(2020, 2684);
    [station0170.nameEnglishTextPrimitives addObject:drawTextLine0336];
    
    // Добавляем перегон
    MWHaul *haul0162 = [[MWHaul alloc] init];
    haul0162.identifier = @"haul0162";
    haul0162.length = 2000;
    [edge0060.elements addObject:haul0162];
    
    MWDrawLine *drawLine0303 = [[MWDrawLine alloc] init];
    drawLine0303.startPoint = CGPointMake(1997.5, 2675);
    drawLine0303.endPoint = CGPointMake(1997.5, 2601.5);
    drawLine0303.width = 14.5;
    drawLine0303.color = line0010.color;
    [haul0162.drawPrimitives addObject:drawLine0303];
    
    // Добавляем станцию "Люблино"
    MWStation *station0171 = [[MWStation alloc] init];
    station0171.identifier = @"station0171";
    [edge0060.elements addObject:station0171];
    
    station0171.nameOriginal = @"Люблино";
    station0171.nameEnglish = @"Lyublino";
    station0171.mapLocation = CGPointMake(1997.5, 2601.5);
    station0171.geoLocation = CGPointMake(55.675683, 37.761760);
    
    MWDrawLine *drawLine0304 = [[MWDrawLine alloc] init];
    drawLine0304.startPoint = CGPointMake(1997.5, 2601.5);
    drawLine0304.endPoint = CGPointMake(2016.5, 2601.5);
    drawLine0304.width = 12;
    drawLine0304.color = line0010.color;
    [station0171.drawPrimitives addObject:drawLine0304];
    
    MWDrawTextLine *drawTextLine0337 = [[MWDrawTextLine alloc] init];
    drawTextLine0337.text = station0171.nameOriginal;
    drawTextLine0337.fontName = @"HelveticaNeue";
    drawTextLine0337.fontColor = [UIColor blackColor];
    drawTextLine0337.fontSize = 32;
    drawTextLine0337.origin = CGPointMake(2024, 2577);
    [station0171.nameOriginalTextPrimitives addObject:drawTextLine0337];
    
    MWDrawTextLine *drawTextLine0338 = [[MWDrawTextLine alloc] init];
    drawTextLine0338.text = station0171.nameEnglish;
    drawTextLine0338.fontName = @"HelveticaNeue";
    drawTextLine0338.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0338.fontSize = 18;
    drawTextLine0338.origin = CGPointMake(2020, 2612);
    [station0171.nameEnglishTextPrimitives addObject:drawTextLine0338];
    
    // Добавляем перегон
    MWHaul *haul0163 = [[MWHaul alloc] init];
    haul0163.identifier = @"haul0163";
    haul0163.length = 1720;
    [edge0060.elements addObject:haul0163];
    
    MWDrawLine *drawLine0305 = [[MWDrawLine alloc] init];
    drawLine0305.startPoint = CGPointMake(1997.5, 2602);
    drawLine0305.endPoint = CGPointMake(1997.5, 2529.5);
    drawLine0305.width = 14.5;
    drawLine0305.color = line0010.color;
    [haul0163.drawPrimitives addObject:drawLine0305];
    
    // Добавляем станцию "Волжская"
    MWStation *station0172 = [[MWStation alloc] init];
    station0172.identifier = @"station0172";
    [[edge0060 elements] addObject:station0172];
    
    station0172.nameOriginal = @"Волжская";
    station0172.nameEnglish = @"Volzhskaya";
    station0172.mapLocation = CGPointMake(1997.5, 2529.5);
    station0172.geoLocation = CGPointMake(55.690906, 37.753321);
    
    MWDrawLine *drawLine0306 = [[MWDrawLine alloc] init];
    drawLine0306.startPoint = CGPointMake(1997.5, 2529.5);
    drawLine0306.endPoint = CGPointMake(2016.5, 2529.5);
    drawLine0306.width = 12;
    drawLine0306.color = line0010.color;
    [station0172.drawPrimitives addObject:drawLine0306];
    
    MWDrawTextLine *drawTextLine0339 = [[MWDrawTextLine alloc] init];
    drawTextLine0339.text = station0172.nameOriginal;
    drawTextLine0339.fontName = @"HelveticaNeue";
    drawTextLine0339.fontColor = [UIColor blackColor];
    drawTextLine0339.fontSize = 32;
    drawTextLine0339.origin = CGPointMake(2024, 2505);
    [station0172.nameOriginalTextPrimitives addObject:drawTextLine0339];

    MWDrawTextLine *drawTextLine0340 = [[MWDrawTextLine alloc] init];
    drawTextLine0340.text = station0172.nameEnglish;
    drawTextLine0340.fontName = @"HelveticaNeue";
    drawTextLine0340.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0340.fontSize = 18;
    drawTextLine0340.origin = CGPointMake(2020, 2540);
    [station0172.nameEnglishTextPrimitives addObject:drawTextLine0340];
    
    // Добавляем перегон
    MWHaul *haul0164 = [[MWHaul alloc] init];
    haul0164.identifier = @"haul164";
    haul0164.length = 1670;
    [edge0060.elements addObject:haul0164];
    
    MWDrawLine *drawLine0307 = [[MWDrawLine alloc] init];
    drawLine0307.startPoint = CGPointMake(1997.5, 2530);
    drawLine0307.endPoint = CGPointMake(1997.5, 2456.5);
    drawLine0307.width = 14.5;
    drawLine0307.color = line0010.color;
    [haul0164.drawPrimitives addObject:drawLine0307];
    
    // Добавляем станцию "Печатники"
    MWStation *station0173 = [[MWStation alloc] init];
    station0173.identifier = @"station0173";
    [edge0060.elements addObject:station0173];
    
    station0173.nameOriginal = @"Печатники";
    station0173.nameEnglish = @"Pechatniki";
    station0173.mapLocation = CGPointMake(1997.5, 2456.5);
    station0173.geoLocation = CGPointMake(55.693162, 37.726901);
    
    MWDrawLine *drawLine0308 = [[MWDrawLine alloc] init];
    drawLine0308.startPoint = CGPointMake(1997.5, 2456.5);
    drawLine0308.endPoint = CGPointMake(2016.5, 2456.5);
    drawLine0308.width = 12;
    drawLine0308.color = line0010.color;
    [station0173.drawPrimitives addObject:drawLine0308];
    
    MWDrawTextLine *drawTextLine0341 = [[MWDrawTextLine alloc] init];
    drawTextLine0341.text = station0173.nameOriginal;
    drawTextLine0341.fontName = @"HelveticaNeue";
    drawTextLine0341.fontColor = [UIColor blackColor];
    drawTextLine0341.fontSize = 32;
    drawTextLine0341.origin = CGPointMake(2024, 2432);
    [station0173.nameOriginalTextPrimitives addObject:drawTextLine0341];
    
    MWDrawTextLine *drawTextLine0342 = [[MWDrawTextLine alloc] init];
    drawTextLine0342.text = station0173.nameEnglish;
    drawTextLine0342.fontName = @"HelveticaNeue";
    drawTextLine0342.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0342.fontSize = 18;
    drawTextLine0342.origin = CGPointMake(2020, 2467);
    [station0173.nameEnglishTextPrimitives addObject:drawTextLine0342];
    
    // Добавляем перегон
    MWHaul *haul0165 = [[MWHaul alloc] init];
    haul0165.identifier = @"haul0165";
    haul0165.length = 2980;
    [edge0060.elements addObject:haul0165];
    
    MWDrawLine *drawLine0309 = [[MWDrawLine alloc] init];
    drawLine0309.startPoint = CGPointMake(1997.5, 2457);
    drawLine0309.endPoint = CGPointMake(1997.5, 2417);
    drawLine0309.width = 14.5;
    drawLine0309.color = line0010.color;
    [haul0165.drawPrimitives addObject:drawLine0309];
    
    MWDrawArc *drawArc0056 = [[MWDrawArc alloc] init];
    drawArc0056.center = CGPointMake(2097.5, 2417.5);
    drawArc0056.startRadians = 180 * M_PI / 180;
    drawArc0056.endRadians = 225 * M_PI / 180;
    drawArc0056.radius = 100;
    drawArc0056.width = 14.5;
    drawArc0056.color = line0010.color;
    [haul0165.drawPrimitives addObject:drawArc0056];
    
    MWDrawLine *drawLine0310 = [[MWDrawLine alloc] init];
    drawLine0310.startPoint = CGPointMake(2026, 2347.5);
    drawLine0310.endPoint = CGPointMake(2039.5, 2334);
    drawLine0310.width = 14.5;
    drawLine0310.color = line0010.color;
    [haul0165.drawPrimitives addObject:drawLine0310];
    
    // Добавляем станцию "Кожуховская"
    MWStation *station0174 = [[MWStation alloc] init];
    station0174.identifier = @"station0174";
    [edge0060.elements addObject:station0174];
    
    station0174.nameOriginal = @"Кожуховская";
    station0174.nameEnglish = @"Kozhuhovskaya";
    station0174.mapLocation = CGPointMake(2039.5, 2334.5);
    station0174.geoLocation = CGPointMake(55.706289, 37.685596);
    
    MWDrawLine *drawLine0311 = [[MWDrawLine alloc] init];
    drawLine0311.startPoint = CGPointMake(2039.5, 2334.5);
    drawLine0311.endPoint = CGPointMake(2052.5, 2347.5);
    drawLine0311.width = 12;
    drawLine0311.color = line0010.color;
    [station0174.drawPrimitives addObject:drawLine0311];
    
    MWDrawTextLine *drawTextLine0343 = [[MWDrawTextLine alloc] init];
    drawTextLine0343.text = station0174.nameOriginal;
    drawTextLine0343.fontName = @"HelveticaNeue";
    drawTextLine0343.fontColor = [UIColor blackColor];
    drawTextLine0343.fontSize = 32;
    drawTextLine0343.origin = CGPointMake(2057, 2346);
    [station0174.nameOriginalTextPrimitives addObject:drawTextLine0343];
    
    MWDrawTextLine *drawTextLine0344 = [[MWDrawTextLine alloc] init];
    drawTextLine0344.text = station0174.nameEnglish;
    drawTextLine0344.fontName = @"HelveticaNeue";
    drawTextLine0344.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0344.fontSize = 18;
    drawTextLine0344.origin = CGPointMake(2053, 2381);
    [station0174.nameEnglishTextPrimitives addObject:drawTextLine0344];
    
    // Добавляем перегон
    MWHaul *haul0166 = [[MWHaul alloc] init];
    haul0166.identifier = @"haul0166";
    haul0166.length = 1440;
    [edge0060.elements addObject:haul0166];
    
    MWDrawLine *drawLine0312 = [[MWDrawLine alloc] init];
    drawLine0312.startPoint = CGPointMake(2039, 2335);
    drawLine0312.endPoint = CGPointMake(2107.5, 2266.5);
    drawLine0312.width = 14.5;
    drawLine0312.color = line0010.color;
    [haul0166.drawPrimitives addObject:drawLine0312];
    
    // Добавляем станцию "Дубровка"
    MWStation *station0175 = [[MWStation alloc] init];
    station0175.identifier = @"station0175";
    [edge0060.elements addObject:station0175];
    
    station0175.nameOriginal = @"Дубровка";
    station0175.nameEnglish = @"Dubrovka";
    station0175.mapLocation = CGPointMake(2107.5, 2266.5);
    station0175.geoLocation = CGPointMake(55.717874, 37.676548);
    
    MWDrawLine *drawLine0313 = [[MWDrawLine alloc] init];
    drawLine0313.startPoint = CGPointMake(2107.5, 2266.5);
    drawLine0313.endPoint = CGPointMake(2120.5, 2279.5);
    drawLine0313.width = 12;
    drawLine0313.color = line0010.color;
    [station0175.drawPrimitives addObject:drawLine0313];
    
    MWDrawTextLine *drawTextLine0345 = [[MWDrawTextLine alloc] init];
    drawTextLine0345.text = station0175.nameOriginal;
    drawTextLine0345.fontName = @"HelveticaNeue";
    drawTextLine0345.fontColor = [UIColor blackColor];
    drawTextLine0345.fontSize = 32;
    drawTextLine0345.origin = CGPointMake(2120, 2277);
    [station0175.nameOriginalTextPrimitives addObject:drawTextLine0345];
    
    MWDrawTextLine *drawTextLine0346 = [[MWDrawTextLine alloc] init];
    drawTextLine0346.text = station0175.nameEnglish;
    drawTextLine0346.fontName = @"HelveticaNeue";
    drawTextLine0346.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0346.fontSize = 18;
    drawTextLine0346.origin = CGPointMake(2116, 2312);
    [station0175.nameEnglishTextPrimitives addObject:drawTextLine0346];
    
    // Добавляем перегон
    MWHaul *haul0167 = [[MWHaul alloc] init];
    haul0167.identifier = @"haul0167";
    haul0167.length = 1750;
    [edge0060.elements addObject:haul0167];
    
    MWDrawLine *drawLine0314 = [[MWDrawLine alloc] init];
    drawLine0314.startPoint = CGPointMake(2107, 2267);
    drawLine0314.endPoint = CGPointMake(2120.5, 2253.5);
    drawLine0314.width = 14.5;
    drawLine0314.color = line0010.color;
    [haul0167.drawPrimitives addObject:drawLine0314];

    MWDrawArc *drawArc0057 = [[MWDrawArc alloc] init];
    drawArc0057.center = CGPointMake(2039, 2179.5);
    drawArc0057.startRadians = 0 * M_PI / 180;
    drawArc0057.endRadians = 45 * M_PI / 180;
    drawArc0057.radius = 110;
    drawArc0057.width = 14.5;
    drawArc0057.color = line0010.color;
    [haul0167.drawPrimitives addObject:drawArc0057];

    MWDrawLine *drawLine0315 = [[MWDrawLine alloc] init];
    drawLine0315.startPoint = CGPointMake(2149, 2180);
    drawLine0315.endPoint = CGPointMake(2149, 2131.5);
    drawLine0315.width = 14.5;
    drawLine0315.color = line0010.color;
    [haul0167.drawPrimitives addObject:drawLine0315];
    
    // Добавляем станцию "Крестьянская Застава"
    MWStation *station0176 = [[MWStation alloc] init];
    station0176.identifier = @"station0176";
    [edge0060.elements addObject:station0176];
    
    station0176.nameOriginal = @"Крестьянская Застава";
    station0176.nameEnglish = @"Krestyanskaya Zastava";
    station0176.mapLocation = CGPointMake(2149.5, 2131.5);
    station0176.geoLocation = CGPointMake(55.732275,  37.665523);
    
    MWDrawTextLine *drawTextLine0347 = [[MWDrawTextLine alloc] init];
    drawTextLine0347.text = @"Крестьянская";
    drawTextLine0347.fontName = @"HelveticaNeue";
    drawTextLine0347.fontColor = [UIColor blackColor];
    drawTextLine0347.fontSize = 32;
    drawTextLine0347.origin = CGPointMake(1916, 2109);
    [station0176.nameOriginalTextPrimitives addObject:drawTextLine0347];

    MWDrawTextLine *drawTextLine0348 = [[MWDrawTextLine alloc] init];
    drawTextLine0348.text = @"Застава";
    drawTextLine0348.fontName = @"HelveticaNeue";
    drawTextLine0348.fontColor = [UIColor blackColor];
    drawTextLine0348.fontSize = 32;
    drawTextLine0348.origin = CGPointMake(2003, 2137);
    [station0176.nameOriginalTextPrimitives addObject:drawTextLine0348];
    
    MWDrawTextLine *drawTextLine0349 = [[MWDrawTextLine alloc] init];
    drawTextLine0349.text = station0176.nameEnglish;
    drawTextLine0349.fontName = @"HelveticaNeue";
    drawTextLine0349.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0349.fontSize = 18;
    drawTextLine0349.origin = CGPointMake(1939, 2172);
    [station0176.nameEnglishTextPrimitives addObject:drawTextLine0349];
    
    // Добавляем вершину
    edge0060.finishVertex = vertex0033;
    
    // Создаем участок линии от "Крестьянская Застава" до "Римская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0061 = [[MWEdge alloc] init];
    edge0061.identifier = @"edge0061";
    edge0061.developmentName = @"Ребро: Крестьянская Застава - Римская";
    [self.edges addObject:edge0061];
    
    // Добавляем линию
    edge0061.line = line0010;

    // Добавляем вершину
    edge0061.startVertex = vertex0033;
    
    // Добавляем станцию "Крестьянская Застава"
    [edge0061.elements addObject:station0176];
    
    // Добавляем перегон
    MWHaul *haul0168 = [[MWHaul alloc] init];
    haul0168.identifier = @"haul0168";
    haul0168.length = 2090;
    [edge0061.elements addObject:haul0168];
    
    MWDrawLine *drawLine0316 = [[MWDrawLine alloc] init];
    drawLine0316.startPoint = CGPointMake(2149, 2132);
    drawLine0316.endPoint = CGPointMake(2149, 1803.5);
    drawLine0316.width = 14.5;
    drawLine0316.color = line0010.color;
    [haul0168.drawPrimitives addObject:drawLine0316];
    
    // Добавляем станцию "Римская"
    MWStation *station0177 = [[MWStation alloc] init];
    station0177.identifier = @"station0177";
    [edge0061.elements addObject:station0177];
    
    station0177.nameOriginal = @"Римская";
    station0177.nameEnglish = @"Rimskaya";
    station0177.mapLocation = CGPointMake(2149.5, 1803.5);
    station0177.geoLocation = CGPointMake(55.746689, 37.679514);
    
    MWDrawLine *drawLine0369 = [[MWDrawLine alloc] init];
    drawLine0369.startPoint = CGPointMake(2122, 1769.5);
    drawLine0369.endPoint = CGPointMake(2172, 1769.5);
    drawLine0369.width = 22;
    drawLine0369.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0177.nameOriginalTextPrimitives addObject:drawLine0369];

    MWDrawTextLine *drawTextLine0350 = [[MWDrawTextLine alloc] init];
    drawTextLine0350.text = station0177.nameOriginal;
    drawTextLine0350.fontName = @"HelveticaNeue";
    drawTextLine0350.fontColor = [UIColor blackColor];
    drawTextLine0350.fontSize = 32;
    drawTextLine0350.origin = CGPointMake(2068, 1747);
    [station0177.nameOriginalTextPrimitives addObject:drawTextLine0350];

    MWDrawLine *drawLine0384 = [[MWDrawLine alloc] init];
    drawLine0384.startPoint = CGPointMake(2122, 1744.5);
    drawLine0384.endPoint = CGPointMake(2172, 1744.5);
    drawLine0384.width = 16;
    drawLine0384.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0177.nameEnglishTextPrimitives addObject:drawLine0384];

    MWDrawTextLine *drawTextLine0351 = [[MWDrawTextLine alloc] init];
    drawTextLine0351.text = station0177.nameEnglish;
    drawTextLine0351.fontName = @"HelveticaNeue";
    drawTextLine0351.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0351.fontSize = 18;
    drawTextLine0351.origin = CGPointMake(2116, 1733);
    [station0177.nameEnglishTextPrimitives addObject:drawTextLine0351];
    
    // Добавляем вершину
    edge0061.finishVertex = vertex0036;
    
    // Создаем участок линии от "Римская" до "Чкаловская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0062 = [[MWEdge alloc] init];
    edge0062.identifier = @"edge0062";
    edge0062.developmentName = @"Ребро: Римская - Чкаловская";
    [self.edges addObject:edge0062];
    
    // Добавляем линию
    edge0062.line = line0010;

    // Добавляем вершину
    edge0062.startVertex = vertex0036;
    
    // Добавляем станцию "Римская"
    [edge0062.elements addObject:station0177];
    
    // Добавляем перегон
    MWHaul *haul0169 = [[MWHaul alloc] init];
    haul0169.identifier = @"haul0169";
    haul0169.length = 1770;
    [edge0062.elements addObject:haul0169];

    MWDrawLine *drawLine0317 = [[MWDrawLine alloc] init];
    drawLine0317.startPoint = CGPointMake(2149, 1804);
    drawLine0317.endPoint = CGPointMake(2149, 1782);
    drawLine0317.width = 14.5;
    drawLine0317.color = line0010.color;
    [haul0169.drawPrimitives addObject:drawLine0317];
    
    MWDrawArc *drawArc0058 = [[MWDrawArc alloc] init];
    drawArc0058.center = CGPointMake(2069, 1782);
    drawArc0058.startRadians = 315 * M_PI / 180;
    drawArc0058.endRadians = 0 * M_PI / 180;
    drawArc0058.radius = 80;
    drawArc0058.width = 14.5;
    drawArc0058.color = line0010.color;
    [haul0169.drawPrimitives addObject:drawArc0058];
    
    MWDrawLine *drawLine0318 = [[MWDrawLine alloc] init];
    drawLine0318.startPoint = CGPointMake(2126, 1726);
    drawLine0318.endPoint = CGPointMake(1978.5, 1578.5);
    drawLine0318.width = 14.5;
    drawLine0318.color = line0010.color;
    [haul0169.drawPrimitives addObject:drawLine0318];
    
    // Добавляем станцию "Чкаловская"
    MWStation *station0178 = [[MWStation alloc] init];
    station0178.identifier = @"station0178";
    [edge0062.elements addObject:station0178];
    
    station0178.nameOriginal = @"Чкаловская";
    station0178.nameEnglish = @"Chkalovskayaя";
    station0178.mapLocation = CGPointMake(1978.5, 1578.5);
    station0178.geoLocation = CGPointMake(55.756027, 37.659394);
    
    MWDrawTextLine *drawTextLine0352 = [[MWDrawTextLine alloc] init];
    drawTextLine0352.text = station0178.nameOriginal;
    drawTextLine0352.fontName = @"HelveticaNeue";
    drawTextLine0352.fontColor = [UIColor blackColor];
    drawTextLine0352.fontSize = 32;
    drawTextLine0352.origin = CGPointMake(1810, 1590);
    [station0178.nameOriginalTextPrimitives addObject:drawTextLine0352];
    
    MWDrawTextLine *drawTextLine0353 = [[MWDrawTextLine alloc] init];
    drawTextLine0353.text = station0178.nameEnglish;
    drawTextLine0353.fontName = @"HelveticaNeue";
    drawTextLine0353.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0353.fontSize = 18;
    drawTextLine0353.origin = CGPointMake(1864, 1625);
    [station0178.nameEnglishTextPrimitives addObject:drawTextLine0353];
    
    // Добавляем вершину
    edge0062.finishVertex = vertex0020;
    
    // Создаем участок линии от "Чкаловская" до "Сретенский бульвар"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0063 = [[MWEdge alloc] init];
    edge0063.identifier = @"edge0063";
    edge0063.developmentName = @"Ребро: Чкаловская - Сретенский бульвар";
    [self.edges addObject:edge0063];
    
    // Добавляем линию
    edge0063.line = line0010;

    // Добавляем вершину
    edge0063.startVertex = vertex0020;
    
    // Добавляем станцию "Чкаловская"
    [edge0063.elements addObject:station0178];
    
    // Добавляем перегон
    MWHaul *haul0170 = [[MWHaul alloc] init];
    haul0170.identifier = @"haul0170";
    haul0170.length = 1830;
    [edge0063.elements addObject:haul0170];
    
    MWDrawLine *drawLine0319 = [[MWDrawLine alloc] init];
    drawLine0319.startPoint = CGPointMake(1979, 1579);
    drawLine0319.endPoint = CGPointMake(1785, 1385);
    drawLine0319.width = 14.5;
    drawLine0319.color = line0010.color;
    [haul0170.drawPrimitives addObject:drawLine0319];
    
    MWDrawArc *drawArc0059 = [[MWDrawArc alloc] init];
    drawArc0059.center = CGPointMake(1714.7, 1456);
    drawArc0059.startRadians = 270 * M_PI / 180;
    drawArc0059.endRadians = 315 * M_PI / 180;
    drawArc0059.radius = 100;
    drawArc0059.width = 14.5;
    drawArc0059.color = line0010.color;
    [haul0170.drawPrimitives addObject:drawArc0059];

    MWDrawLine *drawLine0320 = [[MWDrawLine alloc] init];
    drawLine0320.startPoint = CGPointMake(1715, 1356);
    drawLine0320.endPoint = CGPointMake(1681.5, 1356);
    drawLine0320.width = 14.5;
    drawLine0320.color = line0010.color;
    [haul0170.drawPrimitives addObject:drawLine0320];
    
    // Добавляем станцию "Сретенский бульвар"
    MWStation *station0179 = [[MWStation alloc] init];
    station0179.identifier = @"station0179";
    [edge0063.elements addObject:station0179];
    
    station0179.nameOriginal = @"Сретенский бульвар";
    station0179.nameEnglish = @"Sretensky Bulvar";
    station0179.mapLocation = CGPointMake(1681.5, 1356.5);
    station0179.geoLocation = CGPointMake(55.765801, 37.639253);
    
    MWDrawTextLine *drawTextLine0354 = [[MWDrawTextLine alloc] init];
    drawTextLine0354.text = @"Сретенский";
    drawTextLine0354.fontName = @"HelveticaNeue";
    drawTextLine0354.fontColor = [UIColor blackColor];
    drawTextLine0354.fontSize = 32;
    drawTextLine0354.origin = CGPointMake(1591, 1272);
    [station0179.nameOriginalTextPrimitives addObject:drawTextLine0354];
    
    MWDrawTextLine *drawTextLine0355 = [[MWDrawTextLine alloc] init];
    drawTextLine0355.text = @"бульвар";
    drawTextLine0355.fontName = @"HelveticaNeue";
    drawTextLine0355.fontColor = [UIColor blackColor];
    drawTextLine0355.fontSize = 32;
    drawTextLine0355.origin = CGPointMake(1621, 1300);
    [station0179.nameOriginalTextPrimitives addObject:drawTextLine0355];
    
    MWDrawTextLine *drawTextLine0356 = [[MWDrawTextLine alloc] init];
    drawTextLine0356.text = station0179.nameEnglish;
    drawTextLine0356.fontName = @"HelveticaNeue";
    drawTextLine0356.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0356.fontSize = 18;
    drawTextLine0356.origin = CGPointMake(1614, 1255);
    [station0179.nameEnglishTextPrimitives addObject:drawTextLine0356];
    
    // Добавляем вершину
    edge0063.finishVertex = vertex0006;
    
    // Создаем участок линии от "Сретенский бульвар" до "Трубная"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0064 = [[MWEdge alloc] init];
    edge0064.identifier = @"edge0064";
    edge0064.developmentName = @"Ребро: Сретенский бульвар - Трубная";
    [self.edges addObject:edge0064];
    
    // Добавляем линию
    edge0064.line = line0010;

    // Добавляем вершину
    edge0064.startVertex = vertex0006;
    
    // Добавляем станцию "Сретенский бульвар"
    [edge0064.elements addObject:station0179];
    
    // Добавляем перегон
    MWHaul *haul0171 = [[MWHaul alloc] init];
    haul0171.identifier = @"haul0171";
    haul0171.length = 969;
    [edge0064.elements addObject:haul0171];
    
    MWDrawLine *drawLine0321 = [[MWDrawLine alloc] init];
    drawLine0321.startPoint = CGPointMake(1682, 1356);
    drawLine0321.endPoint = CGPointMake(1479, 1356);
    drawLine0321.width = 14.5;
    drawLine0321.color = line0010.color;
    [haul0171.drawPrimitives addObject:drawLine0321];
    
    MWDrawArc *drawArc0060 = [[MWDrawArc alloc] init];
    drawArc0060.center = CGPointMake(1479, 1256);
    drawArc0060.startRadians = 90 * M_PI / 180;
    drawArc0060.endRadians = 135 * M_PI / 180;
    drawArc0060.radius = 100;
    drawArc0060.width = 14.5;
    drawArc0060.color = line0010.color;
    [haul0171.drawPrimitives addObject:drawArc0060];

    MWDrawLine *drawLine0322 = [[MWDrawLine alloc] init];
    drawLine0322.startPoint = CGPointMake(1409, 1327.5);
    drawLine0322.endPoint = CGPointMake(1375.5, 1294);
    drawLine0322.width = 14.5;
    drawLine0322.color = line0010.color;
    [haul0171.drawPrimitives addObject:drawLine0322];
    
    MWDrawArc *drawArc0061 = [[MWDrawArc alloc] init];
    drawArc0061.center = CGPointMake(1425.5, 1245);
    drawArc0061.startRadians = 135 * M_PI / 180;
    drawArc0061.endRadians = 180 * M_PI / 180;
    drawArc0061.radius = 70;
    drawArc0061.width = 14.5;
    drawArc0061.color = line0010.color;
    [haul0171.drawPrimitives addObject:drawArc0061];
    
    MWDrawLine *drawLine0323 = [[MWDrawLine alloc] init];
    drawLine0323.startPoint = CGPointMake(1355.5, 1240);
    drawLine0323.endPoint = CGPointMake(1355.5, 1245.5);
    drawLine0323.width = 14.5;
    drawLine0323.color = line0010.color;
    [haul0171.drawPrimitives addObject:drawLine0323];
    
    // Добавляем станцию "Трубная"
    MWStation *station0180 = [[MWStation alloc] init];
    station0180.identifier = @"station0180";
    [edge0064.elements addObject:station0180];
    
    station0180.nameOriginal = @"Трубная";
    station0180.nameEnglish = @"Trubnaya";
    station0180.mapLocation = CGPointMake(1355.5, 1240.5);
    station0180.geoLocation = CGPointMake(55.767800, 37.621908);
    
    MWDrawTextLine *drawTextLine0357 = [[MWDrawTextLine alloc] init];
    drawTextLine0357.text = station0180.nameOriginal;
    drawTextLine0357.fontName = @"HelveticaNeue";
    drawTextLine0357.fontColor = [UIColor blackColor];
    drawTextLine0357.fontSize = 32;
    drawTextLine0357.origin = CGPointMake(1371, 1198);
    [station0180.nameOriginalTextPrimitives addObject:drawTextLine0357];
    
    MWDrawTextLine *drawTextLine0358 = [[MWDrawTextLine alloc] init];
    drawTextLine0358.text = station0180.nameEnglish;
    drawTextLine0358.fontName = @"HelveticaNeue";
    drawTextLine0358.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0358.fontSize = 18;
    drawTextLine0358.origin = CGPointMake(1367, 1181);
    [station0180.nameEnglishTextPrimitives addObject:drawTextLine0358];
    
    // Добавляем вершину
    edge0064.finishVertex = vertex0039;
    
    // Создаем участок линии от "Трубная" до "Марьина Роща"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0065 = [[MWEdge alloc] init];
    edge0065.identifier = @"edge0065";
    edge0065.developmentName = @"Ребро: Трубная - Марьина Роща";
    [self.edges addObject:edge0065];
    
    // Добавляем линию
    edge0065.line = line0010;

    // Добавляем вершину
    edge0065.startVertex = vertex0039;
    
    // Добавляем станцию "Трубная"
    [edge0065.elements addObject:station0180];
    
    // Добавляем перегон
    MWHaul *haul0172 = [[MWHaul alloc] init];
    haul0172.identifier = @"haul0172";
    haul0172.length = 1600;
    [edge0065.elements addObject:haul0172];
    
    MWDrawLine *drawLine0324 = [[MWDrawLine alloc] init];
    drawLine0324.startPoint = CGPointMake(1355.5, 1240.5);
    drawLine0324.endPoint = CGPointMake(1355.5, 967.5);
    drawLine0324.width = 14.5;
    drawLine0324.color = line0010.color;
    [haul0172.drawPrimitives addObject:drawLine0324];
    
    // Добавляем станцию "Достоевская"
    MWStation *station0181 = [[MWStation alloc] init];
    station0181.identifier = @"station0181";
    [edge0065.elements addObject:station0181];
    
    station0181.nameOriginal = @"Достоевская";
    station0181.nameEnglish = @"Dostoevskaya";
    station0181.mapLocation = CGPointMake(1355.5, 967.5);
    station0181.geoLocation = CGPointMake(55.781314, 37.613786);
    
    MWDrawLine *drawLine0325 = [[MWDrawLine alloc] init];
    drawLine0325.startPoint = CGPointMake(1355.5, 967.5);
    drawLine0325.endPoint = CGPointMake(1375, 967.5);
    drawLine0325.width = 12;
    drawLine0325.color = line0010.color;
    [station0181.drawPrimitives addObject:drawLine0325];
    
    MWDrawTextLine *drawTextLine0359 = [[MWDrawTextLine alloc] init];
    drawTextLine0359.text = station0181.nameOriginal;
    drawTextLine0359.fontName = @"HelveticaNeue";
    drawTextLine0359.fontColor = [UIColor blackColor];
    drawTextLine0359.fontSize = 32;
    drawTextLine0359.origin = CGPointMake(1381, 942);
    [station0181.nameOriginalTextPrimitives addObject:drawTextLine0359];
    
    MWDrawTextLine *drawTextLine0360 = [[MWDrawTextLine alloc] init];
    drawTextLine0360.text = station0181.nameEnglish;
    drawTextLine0360.fontName = @"HelveticaNeue";
    drawTextLine0360.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0360.fontSize = 18;
    drawTextLine0360.origin = CGPointMake(1377, 977);
    [station0181.nameEnglishTextPrimitives addObject:drawTextLine0360];
    
    // Добавляем перегон
    MWHaul *haul0173 = [[MWHaul alloc] init];
    haul0173.identifier = @"haul0173";
    haul0173.length = 1360;
    [edge0065.elements addObject:haul0173];
    
    MWDrawLine *drawLine0326 = [[MWDrawLine alloc] init];
    drawLine0326.startPoint = CGPointMake(1355.5, 968);
    drawLine0326.endPoint = CGPointMake(1355.5, 902.5);
    drawLine0326.width = 14.5;
    drawLine0326.color = line0010.color;
    [haul0173.drawPrimitives addObject:drawLine0326];
    
    // Добавляем станцию "Марьина Роща"
    MWStation *station0182 = [[MWStation alloc] init];
    station0182.identifier = @"station0182";
    [edge0065.elements addObject:station0182];
    
    station0182.nameOriginal = @"Марьина Роща";
    station0182.nameEnglish = @"Maryina Roshcha";
    station0182.mapLocation = CGPointMake(1355.5, 902.5);
    station0182.geoLocation = CGPointMake(55.793573, 37.616328);
    
    MWDrawLine *drawLine0327 = [[MWDrawLine alloc] init];
    drawLine0327.startPoint = CGPointMake(1335.5, 902.5);
    drawLine0327.endPoint = CGPointMake(1375, 902.5);
    drawLine0327.width = 12;
    drawLine0327.color = line0010.color;
    [station0182.drawPrimitives addObject:drawLine0327];
    
    MWDrawTextLine *drawTextLine0361 = [[MWDrawTextLine alloc] init];
    drawTextLine0361.text = station0182.nameOriginal;
    drawTextLine0361.fontName = @"HelveticaNeue";
    drawTextLine0361.fontColor = [UIColor blackColor];
    drawTextLine0361.fontSize = 32;
    drawTextLine0361.origin = CGPointMake(1383, 877);
    [station0182.nameOriginalTextPrimitives addObject:drawTextLine0361];
    
    MWDrawTextLine *drawTextLine0362 = [[MWDrawTextLine alloc] init];
    drawTextLine0362.text = station0182.nameEnglish;
    drawTextLine0362.fontName = @"HelveticaNeue";
    drawTextLine0362.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0362.fontSize = 18;
    drawTextLine0362.origin = CGPointMake(1379, 912);
    [station0182.nameEnglishTextPrimitives addObject:drawTextLine0362];
    
    // Добавляем вершину
    edge0065.finishVertex = vertex0041;
    
    ////////////////////////////////////////////////////////////////
    // 11 - Каховская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Каховская" до "Каширская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0066 = [[MWEdge alloc] init];
    edge0066.identifier = @"edge0066";
    edge0066.developmentName = @"Ребро: Каховская - Каширская";
    [self.edges addObject:edge0066];
    
    // Добавляем линию
    edge0066.line = line0011;

    // Добавляем вершину
    edge0066.startVertex = vertex0038;
    
    // Добавляем станцию "Каховская"
    MWStation *station0183 = [[MWStation alloc] init];
    station0183.identifier = @"station0183";
    [edge0066.elements addObject:station0183];
    
    station0183.nameOriginal = @"Каховская";
    station0183.nameEnglish = @"Kahovskaya";
    station0183.mapLocation = CGPointMake(1287.5, 2686.5);
    station0183.geoLocation = CGPointMake(55.653075, 37.598478);
    
    MWDrawTextLine *drawTextLine0363 = [[MWDrawTextLine alloc] init];
    drawTextLine0363.text = station0183.nameOriginal;
    drawTextLine0363.fontName = @"HelveticaNeue";
    drawTextLine0363.fontColor = [UIColor blackColor];
    drawTextLine0363.fontSize = 32;
    drawTextLine0363.origin = CGPointMake(1133, 2698);
    [station0183.nameOriginalTextPrimitives addObject:drawTextLine0363];
    
    MWDrawTextLine *drawTextLine0364 = [[MWDrawTextLine alloc] init];
    drawTextLine0364.text = station0183.nameEnglish;
    drawTextLine0364.fontName = @"HelveticaNeue";
    drawTextLine0364.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0364.fontSize = 18;
    drawTextLine0364.origin = CGPointMake(1192, 2733);
    [station0183.nameEnglishTextPrimitives addObject:drawTextLine0364];
    
    // Добавляем перегон
    MWHaul *haul0174 = [[MWHaul alloc] init];
    haul0174.identifier = @"haul0174";
    haul0174.length = 1340;
    [edge0066.elements addObject:haul0174];
    
    MWDrawLine *drawLine0328 = [[MWDrawLine alloc] init];
    drawLine0328.startPoint = CGPointMake(1287.5, 2686.5);
    drawLine0328.endPoint = CGPointMake(1471.5, 2686.5);
    drawLine0328.width = 14.5;
    drawLine0328.color = line0011.color;
    [haul0174.drawPrimitives addObject:drawLine0328];
    
    // Добавляем станцию "Варшавская"
    MWStation *station0184 = [[MWStation alloc] init];
    station0184.identifier = @"station0184";
    [edge0066.elements addObject:station0184];
    
    station0184.nameOriginal = @"Варшавская";
    station0184.nameEnglish = @"Varshavskaya";
    station0184.mapLocation = CGPointMake(1471.5, 2686.5);
    station0184.geoLocation = CGPointMake(55.653342, 37.619966);
    
    MWDrawLine *drawLine0329 = [[MWDrawLine alloc] init];
    drawLine0329.startPoint = CGPointMake(1471, 2686.5);
    drawLine0329.endPoint = CGPointMake(1471, 2667.5);
    drawLine0329.width = 12;
    drawLine0329.color = line0011.color;
    [station0184.drawPrimitives addObject:drawLine0329];
    
    MWDrawTextLine *drawTextLine0365 = [[MWDrawTextLine alloc] init];
    drawTextLine0365.text = station0184.nameOriginal;
    drawTextLine0365.fontName = @"HelveticaNeue";
    drawTextLine0365.fontColor = [UIColor blackColor];
    drawTextLine0365.fontSize = 32;
    drawTextLine0365.origin = CGPointMake(1444, 2626);
    [station0184.nameOriginalTextPrimitives addObject:drawTextLine0365];
    
    MWDrawTextLine *drawTextLine0366 = [[MWDrawTextLine alloc] init];
    drawTextLine0366.text = station0184.nameEnglish;
    drawTextLine0366.fontName = @"HelveticaNeue";
    drawTextLine0366.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0366.fontSize = 18;
    drawTextLine0366.origin = CGPointMake(1440, 2614);
    [station0184.nameEnglishTextPrimitives addObject:drawTextLine0366];
    
    // Добавляем перегон
    MWHaul *haul0175 = [[MWHaul alloc] init];
    haul0175.identifier = @"haul0175";
    haul0175.length = 1830;
    [edge0066.elements addObject:haul0175];
    
    MWDrawLine *drawLine0330 = [[MWDrawLine alloc] init];
    drawLine0330.startPoint = CGPointMake(1471, 2686.5);
    drawLine0330.endPoint = CGPointMake(1624, 2686.5);
    drawLine0330.width = 14.5;
    drawLine0330.color = line0011.color;
    [haul0175.drawPrimitives addObject:drawLine0330];
    
    MWDrawArc *drawArc0062 = [[MWDrawArc alloc] init];
    drawArc0062.center = CGPointMake(1623.5, 2616.5);
    drawArc0062.startRadians = 45 * M_PI / 180;
    drawArc0062.endRadians = 90 * M_PI / 180;
    drawArc0062.radius = 70;
    drawArc0062.width = 14.5;
    drawArc0062.color = line0011.color;
    [haul0175.drawPrimitives addObject:drawArc0062];

    MWDrawLine *drawLine0331 = [[MWDrawLine alloc] init];
    drawLine0331.startPoint = CGPointMake(1672.5, 2666.5);
    drawLine0331.endPoint = CGPointMake(1724.5, 2614.5);
    drawLine0331.width = 14.5;
    drawLine0331.color = line0011.color;
    [haul0175.drawPrimitives addObject:drawLine0331];
    
    // Добавляем станцию "Каширская"
    MWStation *station0185 = [[MWStation alloc] init];
    station0185.identifier = @"station0185";
    [edge0066.elements addObject:station0185];
    
    station0185.nameOriginal = @"Каширская";
    station0185.nameEnglish = @"Kashirskaya";
    station0185.mapLocation = CGPointMake(1724.5, 2614.5);
    station0185.geoLocation = CGPointMake(55.655134, 37.648840);

    [station0185.nameOriginalTextPrimitives addObject:drawTextLine0058];
    [station0185.nameEnglishTextPrimitives addObject:drawTextLine0059];
    station0185.showNameOnMap = false;
    
    // Добавляем вершину
    edge0066.finishVertex = vertex0011;
    
    ////////////////////////////////////////////////////////////////
    // 12 - Бутовская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии от "Бунинская аллея" до "Улица Старокачаловская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0067 = [[MWEdge alloc] init];
    edge0067.identifier = @"edge0067";
    edge0067.developmentName = @"Ребро: Бунинская аллея - Улица Старокачаловская";
    [self.edges addObject:edge0067];
    
    // Добавляем линию
    edge0067.line = line0012;

    // Добавляем вершину
    edge0067.startVertex = vertex0042;
    
    // Добавляем станцию "Бунинская аллея"
    MWStation *station0186 = [[MWStation alloc] init];
    station0186.identifier = @"station0186";
    [edge0067.elements addObject:station0186];
    
    station0186.nameOriginal = @"Бунинская аллея";
    station0186.nameEnglish = @"Buninskaya Alleya";
    station0186.mapLocation = CGPointMake(796.5, 3295.5);
    station0186.geoLocation = CGPointMake(55.537949, 37.515379);
    
    MWDrawLine *drawLine0332 = [[MWDrawLine alloc] init];
    drawLine0332.startPoint = CGPointMake(796.5, 3274.5);
    drawLine0332.endPoint = CGPointMake(796.5, 3314.5);
    drawLine0332.width = 12;
    drawLine0332.color = line0012.color;
    [station0186.drawPrimitives addObject:drawLine0332];
    
    MWDrawTextLine *drawTextLine0367 = [[MWDrawTextLine alloc] init];
    drawTextLine0367.text = station0186.nameOriginal;
    drawTextLine0367.fontName = @"HelveticaNeue";
    drawTextLine0367.fontColor = [UIColor blackColor];
    drawTextLine0367.fontSize = 32;
    drawTextLine0367.origin = CGPointMake(664, 3237);
    [station0186.nameOriginalTextPrimitives addObject:drawTextLine0367];
    
    MWDrawTextLine *drawTextLine0368 = [[MWDrawTextLine alloc] init];
    drawTextLine0368.text = station0186.nameEnglish;
    drawTextLine0368.fontName = @"HelveticaNeue";
    drawTextLine0368.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0368.fontSize = 18;
    drawTextLine0368.origin = CGPointMake(720, 3222);
    [station0186.nameEnglishTextPrimitives addObject:drawTextLine0368];
    
    // Добавляем перегон
    MWHaul *haul0176 = [[MWHaul alloc] init];
    haul0176.identifier = @"haul0176";
    haul0176.length = 1060;
    [edge0067.elements addObject:haul0176];
    
    MWDrawLine *drawLine0333 = [[MWDrawLine alloc] init];
    drawLine0333.startPoint = CGPointMake(796.5, 3295.5);
    drawLine0333.endPoint = CGPointMake(982.5, 3295.5);
    drawLine0333.width = 14.5;
    drawLine0333.color = line0012.color;
    [haul0176.drawPrimitives addObject:drawLine0333];
    
    // Добавляем станцию "Улица Горчакова"
    MWStation *station0187 = [[MWStation alloc] init];
    station0187.identifier = @"station0187";
    [edge0067.elements addObject:station0187];
    
    station0187.nameOriginal = @"Улица Горчакова";
    station0187.nameEnglish = @"Ulitsa Gorchakova";
    station0187.mapLocation = CGPointMake(982.5, 3295.5);
    station0187.geoLocation = CGPointMake(55.542107, 37.531717);
    
    MWDrawLine *drawLine0334 = [[MWDrawLine alloc] init];
    drawLine0334.startPoint = CGPointMake(982.5, 3295.5);
    drawLine0334.endPoint = CGPointMake(982.5, 3314.5);
    drawLine0334.width = 12;
    drawLine0334.color = line0012.color;
    [station0187.drawPrimitives addObject:drawLine0334];
    
    MWDrawTextLine *drawTextLine0369 = [[MWDrawTextLine alloc] init];
    drawTextLine0369.text = station0187.nameOriginal;
    drawTextLine0369.fontName = @"HelveticaNeue";
    drawTextLine0369.fontColor = [UIColor blackColor];
    drawTextLine0369.fontSize = 32;
    drawTextLine0369.origin = CGPointMake(850, 3307);
    [station0187.nameOriginalTextPrimitives addObject:drawTextLine0369];
    
    MWDrawTextLine *drawTextLine0370 = [[MWDrawTextLine alloc] init];
    drawTextLine0370.text = station0187.nameEnglish;
    drawTextLine0370.fontName = @"HelveticaNeue";
    drawTextLine0370.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0370.fontSize = 18;
    drawTextLine0370.origin = CGPointMake(908, 3342);
    [station0187.nameEnglishTextPrimitives addObject:drawTextLine0370];
    
    // Добавляем перегон
    MWHaul *haul0177 = [[MWHaul alloc] init];
    haul0177.identifier = @"haul0177";
    haul0177.length = 795;
    [edge0067.elements addObject:haul0177];
    
    MWDrawLine *drawLine0335 = [[MWDrawLine alloc] init];
    drawLine0335.startPoint = CGPointMake(982, 3295.5);
    drawLine0335.endPoint = CGPointMake(1190.5, 3295.5);
    drawLine0335.width = 14.5;
    drawLine0335.color = line0012.color;
    [haul0177.drawPrimitives addObject:drawLine0335];
    
    // Добавляем станцию "Бульвар Адмирала Ушакова"
    MWStation *station0188 = [[MWStation alloc] init];
    station0188.identifier = @"station0188";
    [edge0067.elements addObject:station0188];
    
    station0188.nameOriginal = @"Бульвар Адмирала Ушакова";
    station0188.nameEnglish = @"Bulvar Admirala Ushakova";
    station0188.mapLocation = CGPointMake(1190.5, 3295.5);
    station0188.geoLocation = CGPointMake(55.545169, 37.542289);

    MWDrawLine *drawLine0336 = [[MWDrawLine alloc] init];
    drawLine0336.startPoint = CGPointMake(1190.5, 3295.5);
    drawLine0336.endPoint = CGPointMake(1190.5, 3314.5);
    drawLine0336.width = 12;
    drawLine0336.color = line0012.color;
    [station0188.drawPrimitives addObject:drawLine0336];
    
    MWDrawTextLine *drawTextLine0371 = [[MWDrawTextLine alloc] init];
    drawTextLine0371.text = @"Бульвар";
    drawTextLine0371.fontName = @"HelveticaNeue";
    drawTextLine0371.fontColor = [UIColor blackColor];
    drawTextLine0371.fontSize = 32;
    drawTextLine0371.origin = CGPointMake(1146, 3308);
    [station0188.nameOriginalTextPrimitives addObject:drawTextLine0371];

    MWDrawTextLine *drawTextLine0372 = [[MWDrawTextLine alloc] init];
    drawTextLine0372.text = @"Адмирала Ушакова";
    drawTextLine0372.fontName = @"HelveticaNeue";
    drawTextLine0372.fontColor = [UIColor blackColor];
    drawTextLine0372.fontSize = 32;
    drawTextLine0372.origin = CGPointMake(1146, 3338);
    [station0188.nameOriginalTextPrimitives addObject:drawTextLine0372];
    
    MWDrawTextLine *drawTextLine0373 = [[MWDrawTextLine alloc] init];
    drawTextLine0373.text = station0188.nameEnglish;
    drawTextLine0373.fontName = @"HelveticaNeue";
    drawTextLine0373.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0373.fontSize = 18;
    drawTextLine0373.origin = CGPointMake(1142, 3373);
    [station0188.nameEnglishTextPrimitives addObject:drawTextLine0373];
    
    // Добавляем перегон
    MWHaul *haul0178 = [[MWHaul alloc] init];
    haul0178.identifier = @"haul0178";
    haul0178.length = 838;
    [edge0067.elements addObject:haul0178];
    
    MWDrawLine *drawLine0337 = [[MWDrawLine alloc] init];
    drawLine0337.startPoint = CGPointMake(1190, 3295.5);
    drawLine0337.endPoint = CGPointMake(1237, 3295.5);
    drawLine0337.width = 14.5;
    drawLine0337.color = line0012.color;
    [haul0178.drawPrimitives addObject:drawLine0337];
    
    MWDrawArc *drawArc0063 = [[MWDrawArc alloc] init];
    drawArc0063.center = CGPointMake(1237, 3245.5);
    drawArc0063.startRadians = 0 * M_PI / 180;
    drawArc0063.endRadians = 90 * M_PI / 180;
    drawArc0063.radius = 50;
    drawArc0063.width = 14.5;
    drawArc0063.color = line0012.color;
    [haul0178.drawPrimitives addObject:drawArc0063];
    
    MWDrawLine *drawLine0338 = [[MWDrawLine alloc] init];
    drawLine0338.startPoint = CGPointMake(1287, 3246);
    drawLine0338.endPoint = CGPointMake(1287, 3243.5);
    drawLine0338.width = 14.5;
    drawLine0338.color = line0012.color;
    [haul0178.drawPrimitives addObject:drawLine0338];
    
    // Добавляем станцию "Улица Скобелевская"
    MWStation *station0189 = [[MWStation alloc] init];
    station0189.identifier = @"station0189";
    [edge0067.elements addObject:station0189];
    
    station0189.nameOriginal = @"Улица Скобелевская";
    station0189.nameEnglish = @"Ulitsa Skobelevskaya";
    station0189.mapLocation = CGPointMake(1287.5, 3243.5);
    station0189.geoLocation = CGPointMake(55.548142, 37.554662);
    
    MWDrawLine *drawLine0339 = [[MWDrawLine alloc] init];
    drawLine0339.startPoint = CGPointMake(1287.5, 3243.5);
    drawLine0339.endPoint = CGPointMake(1307.5, 3243.5);
    drawLine0339.width = 12;
    drawLine0339.color = line0012.color;
    [station0189.drawPrimitives addObject:drawLine0339];

    MWDrawTextLine *drawTextLine0375 = [[MWDrawTextLine alloc] init];
    drawTextLine0375.text = @"Улица";
    drawTextLine0375.fontName = @"HelveticaNeue";
    drawTextLine0375.fontColor = [UIColor blackColor];
    drawTextLine0375.fontSize = 32;
    drawTextLine0375.origin = CGPointMake(1310, 3219);
    [station0189.nameOriginalTextPrimitives addObject:drawTextLine0375];

    MWDrawTextLine *drawTextLine0376 = [[MWDrawTextLine alloc] init];
    drawTextLine0376.text = @"Скобелевская";
    drawTextLine0376.fontName = @"HelveticaNeue";
    drawTextLine0376.fontColor = [UIColor blackColor];
    drawTextLine0376.fontSize = 32;
    drawTextLine0376.origin = CGPointMake(1312, 3249);
    [station0189.nameOriginalTextPrimitives addObject:drawTextLine0376];
    
    MWDrawTextLine *drawTextLine0377 = [[MWDrawTextLine alloc] init];
    drawTextLine0377.text = station0189.nameEnglish;
    drawTextLine0377.fontName = @"HelveticaNeue";
    drawTextLine0377.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0377.fontSize = 18;
    drawTextLine0377.origin = CGPointMake(1308, 3284);
    [station0189.nameEnglishTextPrimitives addObject:drawTextLine0377];
    
    // Добавляем перегон
    MWHaul *haul0179 = [[MWHaul alloc] init];
    haul0179.identifier = @"haul0179";
    haul0179.length = 2870;
    [edge0067.elements addObject:haul0179];
    
    MWDrawLine *drawLine0340 = [[MWDrawLine alloc] init];
    drawLine0340.startPoint = CGPointMake(1287, 3244);
    drawLine0340.endPoint = CGPointMake(1287, 3185);
    drawLine0340.width = 14.5;
    drawLine0340.color = line0012.color;
    [haul0179.drawPrimitives addObject:drawLine0340];
    
    // Добавляем станцию "Улица Старокачаловская"
    MWStation *station0190 = [[MWStation alloc] init];
    station0190.identifier = @"station0190";
    [edge0067.elements addObject:station0190];
    
    station0190.nameOriginal = @"Улица Старокачаловская";
    station0190.nameEnglish = @"Ulitsa Starokachalovskaya";
    station0190.mapLocation = CGPointMake(1287.5, 3185);
    station0190.geoLocation = CGPointMake(55.569340, 37.576513);
    
    MWDrawTextLine *drawTextLine0378 = [[MWDrawTextLine alloc] init];
    drawTextLine0378.text = @"Улица";
    drawTextLine0378.fontName = @"HelveticaNeue";
    drawTextLine0378.fontColor = [UIColor blackColor];
    drawTextLine0378.fontSize = 32;
    drawTextLine0378.origin = CGPointMake(1172, 3158);
    [station0190.nameOriginalTextPrimitives addObject:drawTextLine0378];

    MWDrawTextLine *drawTextLine0379 = [[MWDrawTextLine alloc] init];
    drawTextLine0379.text = @"Старокачаловская";
    drawTextLine0379.fontName = @"HelveticaNeue";
    drawTextLine0379.fontColor = [UIColor blackColor];
    drawTextLine0379.fontSize = 32;
    drawTextLine0379.origin = CGPointMake(982, 3187);
    [station0190.nameOriginalTextPrimitives addObject:drawTextLine0379];
    
    MWDrawTextLine *drawTextLine0380 = [[MWDrawTextLine alloc] init];
    drawTextLine0380.text = station0190.nameEnglish;
    drawTextLine0380.fontName = @"HelveticaNeue";
    drawTextLine0380.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0380.fontSize = 18;
    drawTextLine0380.origin = CGPointMake(1050, 3222);
    [station0190.nameEnglishTextPrimitives addObject:drawTextLine0380];
    
    // Добавляем вершину
    edge0067.finishVertex = vertex0037;

    // Создаем участок линии от "Битцевский парк" до "Улица Старокачаловская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0071 = [[MWEdge alloc] init];
    edge0071.identifier = @"edge0071";
    edge0071.developmentName = @"Ребро: Битцевский парк - Улица Старокачаловская";
    [self.edges addObject:edge0071];
    
    // Добавляем линию
    edge0071.line = line0012;
    
    // Добавляем вершину
    edge0071.startVertex = vertex0029;
    
    // Добавляем станцию "Битцевский парк"
    MWStation *station0193 = [[MWStation alloc] init];
    station0193.identifier = @"station0193";
    [edge0071.elements addObject:station0193];
    
    station0193.nameOriginal = @"Битцевский парк";
    station0193.nameEnglish = @"Bitcevsky Park";
    station0193.mapLocation = CGPointMake(1013.5, 3102.5);
    station0193.geoLocation = CGPointMake(55.600478, 37.555521);

    MWDrawArc *drawArc0138 = [[MWDrawArc alloc] init];
    drawArc0138.center = CGPointMake(1013.5, 3102.5);
    drawArc0138.startRadians = M_PI * 2;
    drawArc0138.endRadians = 0;
    drawArc0138.radius = 14;
    drawArc0138.width = 10;
    drawArc0138.color = line0012.color;
    [station0193.drawPrimitives addObject:drawArc0138];
    
    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = CGPointMake(1013.5, 3102.5);
    fillCircle0066.radius = 9;
    fillCircle0066.fillColor = [UIColor whiteColor];
    [station0193.drawPrimitives addObject:fillCircle0066];
    
    MWDrawTextLine *drawTextLine0415 = [[MWDrawTextLine alloc] init];
    drawTextLine0415.text = station0193.nameOriginal;
    drawTextLine0415.fontName = @"HelveticaNeue";
    drawTextLine0415.fontColor = [UIColor blackColor];
    drawTextLine0415.fontSize = 32;
    drawTextLine0415.origin = CGPointMake(731, 3072);
    [station0193.nameOriginalTextPrimitives addObject:drawTextLine0415];
    
    MWDrawTextLine *drawTextLine0416 = [[MWDrawTextLine alloc] init];
    drawTextLine0416.text = station0193.nameEnglish;
    drawTextLine0416.fontName = @"HelveticaNeue";
    drawTextLine0416.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0416.fontSize = 18;
    drawTextLine0416.origin = CGPointMake(869, 3108);
    [station0193.nameEnglishTextPrimitives addObject:drawTextLine0416];

    // Добавляем перегон
    MWHaul *haul0181 = [[MWHaul alloc] init];
    haul0181.identifier = @"haul0181";
    haul0181.length = 2490;
    [edge0071.elements addObject:haul0181];

    MWDrawLine *drawLine0374 = [[MWDrawLine alloc] init];
    drawLine0374.startPoint = CGPointMake(1013.5, 3102.5);
    drawLine0374.endPoint = CGPointMake(1176, 3102.5);
    drawLine0374.width = 14.5;
    drawLine0374.color = line0012.color;
    [haul0181.drawPrimitives addObject:drawLine0374];
    
    // Добавляем станцию "Лесопарковая"
    MWStation *station0194 = [[MWStation alloc] init];
    station0194.identifier = @"station0194";
    [edge0071.elements addObject:station0194];
    
    station0194.nameOriginal = @"Лесопарковая";
    station0194.nameEnglish = @"Lesoparkovaya";
    station0194.mapLocation = CGPointMake(1176, 3102.5);
    station0194.geoLocation = CGPointMake(55.582022, 37.577054);

    MWDrawLine *drawLine0375 = [[MWDrawLine alloc] init];
    drawLine0375.startPoint = CGPointMake(1176, 3102.5);
    drawLine0375.endPoint = CGPointMake(1176, 3082.5);
    drawLine0375.width = 12;
    drawLine0375.color = line0012.color;
    [station0194.drawPrimitives addObject:drawLine0375];
    
    MWDrawTextLine *drawTextLine0417 = [[MWDrawTextLine alloc] init];
    drawTextLine0417.text = station0194.nameOriginal;
    drawTextLine0417.fontName = @"HelveticaNeue";
    drawTextLine0417.fontColor = [UIColor blackColor];
    drawTextLine0417.fontSize = 32;
    drawTextLine0417.origin = CGPointMake(1069, 3040);
    [station0194.nameOriginalTextPrimitives addObject:drawTextLine0417];
    
    MWDrawTextLine *drawTextLine0418 = [[MWDrawTextLine alloc] init];
    drawTextLine0418.text = station0194.nameEnglish;
    drawTextLine0418.fontName = @"HelveticaNeue";
    drawTextLine0418.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0418.fontSize = 18;
    drawTextLine0418.origin = CGPointMake(1122, 3026);
    [station0194.nameEnglishTextPrimitives addObject:drawTextLine0418];

    // Добавляем перегон
    MWHaul *haul0182 = [[MWHaul alloc] init];
    haul0182.identifier = @"haul0182";
    haul0182.length = 1380;
    [edge0071.elements addObject:haul0182];

    MWDrawLine *drawLine0376 = [[MWDrawLine alloc] init];
    drawLine0376.startPoint = CGPointMake(1176, 3102.5);
    drawLine0376.endPoint = CGPointMake(1238, 3102.5);
    drawLine0376.width = 14.5;
    drawLine0376.color = line0012.color;
    [haul0182.drawPrimitives addObject:drawLine0376];

    MWDrawArc *drawArc0139 = [[MWDrawArc alloc] init];
    drawArc0139.center = CGPointMake(1237.5, 3152.5);
    drawArc0139.startRadians = 270 * M_PI / 180;
    drawArc0139.endRadians = 0 * M_PI /180;
    drawArc0139.radius = 50;
    drawArc0139.width = 14.5;
    drawArc0139.color = line0012.color;
    [haul0182.drawPrimitives addObject:drawArc0139];

    MWDrawLine *drawLine0377 = [[MWDrawLine alloc] init];
    drawLine0377.startPoint = CGPointMake(1287.5, 3152);
    drawLine0377.endPoint = CGPointMake(1287.5, 3185);
    drawLine0377.width = 14.5;
    drawLine0377.color = line0012.color;
    [haul0182.drawPrimitives addObject:drawLine0377];

    // Добавляем станцию "Улица Старокачаловская"
    [edge0071.elements addObject:station0190];
    
    // Добавляем вершину
    edge0071.finishVertex = vertex0037;
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Конец схеме
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // Добавляем дополнительные надписи на родном языке
    
    MWDrawTextLine *drawTextLine0410 = [[MWDrawTextLine alloc] init];
    drawTextLine0410.text = @"а также скоростных автобусов, электропоездов и аэроэкспрессов";
    drawTextLine0410.fontName = @"HelveticaNeue";
    drawTextLine0410.fontColor = [UIColor blackColor];
    drawTextLine0410.fontSize = 24;
    drawTextLine0410.origin = CGPointMake(998, 300);
    [self.additionalOverMapPrimitives addObject:drawTextLine0410];
    
    // Добавляем дополнительные надписи на английском языке
    
    MWDrawTextLine *drawTextLine0381 = [[MWDrawTextLine alloc] init];
    drawTextLine0381.text = @"Kazansky,";
    drawTextLine0381.fontName = @"HelveticaNeue";
    drawTextLine0381.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0381.fontSize = 18;
    drawTextLine0381.origin = CGPointMake(1985, 1320);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0381];

    MWDrawTextLine *drawTextLine0382 = [[MWDrawTextLine alloc] init];
    drawTextLine0382.text = @"Leningradsky,";
    drawTextLine0382.fontName = @"HelveticaNeue";
    drawTextLine0382.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0382.fontSize = 18;
    drawTextLine0382.origin = CGPointMake(1995, 1340);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0382];
    
    MWDrawTextLine *drawTextLine0383 = [[MWDrawTextLine alloc] init];
    drawTextLine0383.text = @"Yaroslavsky rail";
    drawTextLine0383.fontName = @"HelveticaNeue";
    drawTextLine0383.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0383.fontSize = 18;
    drawTextLine0383.origin = CGPointMake(2000, 1360);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0383];

    MWDrawTextLine *drawTextLine0384 = [[MWDrawTextLine alloc] init];
    drawTextLine0384.text = @"terminals";
    drawTextLine0384.fontName = @"HelveticaNeue";
    drawTextLine0384.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0384.fontSize = 18;
    drawTextLine0384.origin = CGPointMake(2010, 1380);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0384];
    
    MWDrawTextLine *drawTextLine0385 = [[MWDrawTextLine alloc] init];
    drawTextLine0385.text = @"Vnukovo Airport・VKO";
    drawTextLine0385.fontName = @"HelveticaNeue";
    drawTextLine0385.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0385.fontSize = 18;
    drawTextLine0385.origin = CGPointMake(725, 2798);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0385];
    
    MWDrawTextLine *drawTextLine0386 = [[MWDrawTextLine alloc] init];
    drawTextLine0386.text = @"Novo-Peredelkino";
    drawTextLine0386.fontName = @"HelveticaNeue";
    drawTextLine0386.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0386.fontSize = 18;
    drawTextLine0386.origin = CGPointMake(675, 2980);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0386];
    
    MWDrawTextLine *drawTextLine0387 = [[MWDrawTextLine alloc] init];
    drawTextLine0387.text = @"4 Mikrorayon Mitino";
    drawTextLine0387.fontName = @"HelveticaNeue";
    drawTextLine0387.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0387.fontSize = 18;
    drawTextLine0387.origin = CGPointMake(120, 600);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0387];
    
    MWDrawTextLine *drawTextLine0388 = [[MWDrawTextLine alloc] init];
    drawTextLine0388.text = @"Sheremetyevo Airport・SKO";
    drawTextLine0388.fontName = @"HelveticaNeue";
    drawTextLine0388.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0388.fontSize = 18;
    drawTextLine0388.origin = CGPointMake(480, 440);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0388];
    
    MWDrawTextLine *drawTextLine0389 = [[MWDrawTextLine alloc] init];
    drawTextLine0389.text = @"Belorussky rail term.";
    drawTextLine0389.fontName = @"HelveticaNeue";
    drawTextLine0389.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0389.fontSize = 18;
    drawTextLine0389.origin = CGPointMake(685, 1355);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0389];
    
    MWDrawTextLine *drawTextLine0390 = [[MWDrawTextLine alloc] init];
    drawTextLine0390.text = @"Express train";
    drawTextLine0390.fontName = @"HelveticaNeue";
    drawTextLine0390.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0390.fontSize = 18;
    drawTextLine0390.origin = CGPointMake(685, 1375);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0390];
    
    MWDrawTextLine *drawTextLine0391 = [[MWDrawTextLine alloc] init];
    drawTextLine0391.text = @"to Sheremetyevo";
    drawTextLine0391.fontName = @"HelveticaNeue";
    drawTextLine0391.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0391.fontSize = 18;
    drawTextLine0391.origin = CGPointMake(685, 1395);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0391];
    
    MWDrawTextLine *drawTextLine0392 = [[MWDrawTextLine alloc] init];
    drawTextLine0392.text = @"Paveletsky rail terminal";
    drawTextLine0392.fontName = @"HelveticaNeue";
    drawTextLine0392.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0392.fontSize = 18;
    drawTextLine0392.origin = CGPointMake(1741, 2315);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0392];

    MWDrawTextLine *drawTextLine0393 = [[MWDrawTextLine alloc] init];
    drawTextLine0393.text = @"Express train to Domodedovo";
    drawTextLine0393.fontName = @"HelveticaNeue";
    drawTextLine0393.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0393.fontSize = 18;
    drawTextLine0393.origin = CGPointMake(1741, 2335);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0393];
    
    MWDrawTextLine *drawTextLine0394 = [[MWDrawTextLine alloc] init];
    drawTextLine0394.text = @"Domodedovo Airport・DME";
    drawTextLine0394.fontName = @"HelveticaNeue";
    drawTextLine0394.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0394.fontSize = 18;
    drawTextLine0394.origin = CGPointMake(2120, 3307);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0394];
    
    MWDrawTextLine *drawTextLine0395 = [[MWDrawTextLine alloc] init];
    drawTextLine0395.text = @"Zagorye";
    drawTextLine0395.fontName = @"HelveticaNeue";
    drawTextLine0395.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0395.fontSize = 18;
    drawTextLine0395.origin = CGPointMake(1870, 3157);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0395];
    
    MWDrawTextLine *drawTextLine0396 = [[MWDrawTextLine alloc] init];
    drawTextLine0396.text = @"Scholkovsky bus terminal";
    drawTextLine0396.fontName = @"HelveticaNeue";
    drawTextLine0396.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0396.fontSize = 18;
    drawTextLine0396.origin = CGPointMake(2366, 862);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0396];
    
    MWDrawTextLine *drawTextLine0397 = [[MWDrawTextLine alloc] init];
    drawTextLine0397.text = @"Kursky rail terminal";
    drawTextLine0397.fontName = @"HelveticaNeue";
    drawTextLine0397.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0397.fontSize = 18;
    drawTextLine0397.origin = CGPointMake(2087, 1550);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0397];
    
    MWDrawTextLine *drawTextLine0398 = [[MWDrawTextLine alloc] init];
    drawTextLine0398.text = @"Kievsky rail terminal";
    drawTextLine0398.fontName = @"HelveticaNeue";
    drawTextLine0398.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0398.fontSize = 18;
    drawTextLine0398.origin = CGPointMake(628, 1860);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0398];
    
    MWDrawTextLine *drawTextLine0399 = [[MWDrawTextLine alloc] init];
    drawTextLine0399.text = @"Express train to Vnukovo";
    drawTextLine0399.fontName = @"HelveticaNeue";
    drawTextLine0399.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0399.fontSize = 18;
    drawTextLine0399.origin = CGPointMake(587, 1880);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0399];
    
    MWDrawTextLine *drawTextLine0400 = [[MWDrawTextLine alloc] init];
    drawTextLine0400.text = @"Rizhsky rail terminal";
    drawTextLine0400.fontName = @"HelveticaNeue";
    drawTextLine0400.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0400.fontSize = 18;
    drawTextLine0400.origin = CGPointMake(1733, 976);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0400];
    
    MWDrawTextLine *drawTextLine0401 = [[MWDrawTextLine alloc] init];
    drawTextLine0401.text = @"Улица Сергея";
    drawTextLine0401.fontName = @"HelveticaNeue";
    drawTextLine0401.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0401.fontSize = 18;
    drawTextLine0401.origin = CGPointMake(1806, 772);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0401];

    MWDrawTextLine *drawTextLine0402 = [[MWDrawTextLine alloc] init];
    drawTextLine0402.text = @"Eyzenshteyna";
    drawTextLine0402.fontName = @"HelveticaNeue";
    drawTextLine0402.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0402.fontSize = 18;
    drawTextLine0402.origin = CGPointMake(1806, 792);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0402];
    
    MWDrawTextLine *drawTextLine0403 = [[MWDrawTextLine alloc] init];
    drawTextLine0403.text = @"Vystavochny Centre";
    drawTextLine0403.fontName = @"HelveticaNeue";
    drawTextLine0403.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0403.fontSize = 18;
    drawTextLine0403.origin = CGPointMake(1481, 665);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0403];

    MWDrawTextLine *drawTextLine0404 = [[MWDrawTextLine alloc] init];
    drawTextLine0404.text = @"Ulitsa Akademika Korolyova";
    drawTextLine0404.fontName = @"HelveticaNeue";
    drawTextLine0404.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0404.fontSize = 18;
    drawTextLine0404.origin = CGPointMake(1421, 816);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0404];
    
    MWDrawTextLine *drawTextLine0405 = [[MWDrawTextLine alloc] init];
    drawTextLine0405.text = @"Telecentr";
    drawTextLine0405.fontName = @"HelveticaNeue";
    drawTextLine0405.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0405.fontSize = 18;
    drawTextLine0405.origin = CGPointMake(1389, 728);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0405];
    
    MWDrawTextLine *drawTextLine0406 = [[MWDrawTextLine alloc] init];
    drawTextLine0406.text = @"Ulitsa Milashenkova";
    drawTextLine0406.fontName = @"HelveticaNeue";
    drawTextLine0406.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0406.fontSize = 18;
    drawTextLine0406.origin = CGPointMake(1207, 816);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0406];
    
    MWDrawTextLine *drawTextLine0407 = [[MWDrawTextLine alloc] init];
    drawTextLine0407.text = @"Holmogorskaya Ulitsa";
    drawTextLine0407.fontName = @"HelveticaNeue";
    drawTextLine0407.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0407.fontSize = 18;
    drawTextLine0407.origin = CGPointMake(1860, 370);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0407];
    
    MWDrawTextLine *drawTextLine0408 = [[MWDrawTextLine alloc] init];
    drawTextLine0408.text = @"Savelovsky rail terminal";
    drawTextLine0408.fontName = @"HelveticaNeue";
    drawTextLine0408.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0408.fontSize = 18;
    drawTextLine0408.origin = CGPointMake(1091, 964);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0408];
    
    MWDrawTextLine *drawTextLine0411 = [[MWDrawTextLine alloc] init];
    drawTextLine0411.text = @"Moscow metro, connection to rail system, express buses, and airport transportation map";
    drawTextLine0411.fontName = @"HelveticaNeue";
    drawTextLine0411.fontColor = [UIColor colorWithRed:(139/255.0) green:(151/255.0) blue:(158/255.0) alpha:1];
    drawTextLine0411.fontSize = 18;
    drawTextLine0411.origin = CGPointMake(1023, 330);
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0411];
    
    ///////////////////////////////////////////////////////////////////
    // Добавляем станции, связанные узлом, но без возможности перехода
    ///////////////////////////////////////////////////////////////////

    [self.stationsWithoutTransfer addObject:station0154]; // Боровицкая
    [self.stationsWithoutTransfer addObject:station0075]; // Александровский сад

    [self.stationsWithoutTransfer addObject:station0075]; // Александровский сад
    [self.stationsWithoutTransfer addObject:station0154]; // Боровицкая

//    [self.stationsWithoutSwitch addObject:station0147]; // Севастопольская
//    [self.stationsWithoutSwitch addObject:station0183]; // Каховская
   
    // Для тестирование добавляем начальную и конечную станции маршрута
//    self.startStation = station0139; // Марксистская
//    self.finishStation = station0092; // Беляево

    return self;
}

@end
