//
//  MWMoscowMetro2.m
//  MetroWay
//
//  Created by Valentin Ozerov on 23.06.16.
//  Copyright © 2016 Valentin Ozerov. All rights reserved.
//

#import "MWMoscowMetro2.h"
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
#import "MWTransfer.h"

@implementation MWMoscowMetro2

- (id)init
{
    UIColor *stationNamesEnglishColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];

    // Инициализируем
    self = [super init];
    
    [self setIdentifier:@"moscow_metro2"];
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
    line0001.nameEnglish = @"1. Sokolnicheskaya Line";
    line0001.color = [UIColor colorWithRed:(238/255.0) green:(49/255.0) blue:(36/255.0) alpha:1];
    [self.lines addObject:line0001];
    
    // 2. Замоскворецкая линия
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"2. Замоскворецкая линия";
    line0002.nameEnglish = @"2. Zamoskvoretskaya Line";
    line0002.color = [UIColor colorWithRed:(76/255.0) green:(184/255.0) blue:(94/255.0) alpha:1];
    [self.lines addObject:line0002];
    
    // 3. Арбатско-Покровская линия
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"3. Арбатско-Покровская линия";
    line0003.nameEnglish = @"3. Arbatsko-Pokrovskaya Line";
    line0003.color = [UIColor colorWithRed:(0/255.0) green:(120/255.0) blue:(191/255.0) alpha:1];
    [self.lines addObject:line0003];
    
    // 4. Филевская линия
    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"4. Филёвская линия";
    line0004.nameEnglish = @"4. Filyovskaya Line";
    line0004.color = [UIColor colorWithRed:(0/255.0) green:(192/255.0) blue:(243/255.0) alpha:1];
    [self.lines addObject:line0004];
    
    // 5. Кольцевая линия
    MWLine *line0005 = [[MWLine alloc] init];
    line0005.identifier = @"line0005";
    line0005.nameOriginal = @"5. Кольцевая линия";
    line0005.nameEnglish = @"5. Koltsevaya Line (Circle Line)";
    line0005.color = [UIColor colorWithRed:(156/255.0) green:(86/255.0) blue:(62/255.0) alpha:1];
    [self.lines addObject:line0005];
    
    // 6. Калужско-Рижская линия
    MWLine *line0006 = [[MWLine alloc] init];
    line0006.identifier = @"line0006";
    line0006.nameOriginal = @"6. Калужско-Рижская линия";
    line0006.nameEnglish = @"6. Kaluzhsko-Rizhskaya Line";
    line0006.color = [UIColor colorWithRed:(245/255.0) green:(130/255.0) blue:(51/255.0) alpha:1];
    [self.lines addObject:line0006];
    
    // 7. Таганско-Краснопресненская линия
    MWLine *line0007 = [[MWLine alloc] init];
    line0007.identifier = @"line0007";
    line0007.nameOriginal = @"7. Таганско-Краснопресненская линия";
    line0007.nameEnglish = @"7. Tagansko-Krasnopresnenskaya Line";
    line0007.color = [UIColor colorWithRed:(142/255.0) green:(71/255.0) blue:(155/255.0) alpha:1];
    [self.lines addObject:line0007];
    
    // 8. Калининская линия
    MWLine *line0008 = [[MWLine alloc] init];
    line0008.identifier = @"line0008";
    line0008.nameOriginal = @"8. Калининская линия";
    line0008.nameEnglish = @"8. Kalininskaya Line";
    line0008.color = [UIColor colorWithRed:(255/255.0) green:(204/255.0) blue:(50/255.0) alpha:1];
    [self.lines addObject:line0008];
    
    // 9. Серпуховско-Тимирязевская линия
    MWLine *line0009 = [[MWLine alloc] init];
    line0009.identifier = @"line0009";
    line0009.nameOriginal = @"9. Серпуховско-Тимирязевская линия";
    line0009.nameEnglish = @"9. Serpukhovsko-Timiryazevskaya Line";
    line0009.color = [UIColor colorWithRed:(161/255.0) green:(162/255.0) blue:(163/255.0) alpha:1];
    [self.lines addObject:line0009];
    
    // 10. Люблинская линия
    MWLine *line0010 = [[MWLine alloc] init];
    line0010.identifier = @"line0010";
    line0010.nameOriginal = @"10. Люблинская линия";
    line0010.nameEnglish = @"10. Lyublinsko-Dmitrovskaya Line";
    line0010.color = [UIColor colorWithRed:(180/255.0) green:(212/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0010];
    
    // 11. Каховская линия
    MWLine *line0011 = [[MWLine alloc] init];
    line0011.identifier = @"line0011";
    line0011.nameOriginal = @"11. Каховская линия";
    line0011.nameEnglish = @"11. Kakhovskaya Line";
    line0011.color = [UIColor colorWithRed:(121/255.0) green:(205/255.0) blue:(205/255.0) alpha:1];
    [self.lines addObject:line0011];
    
    // 12. Бутовская линия
    MWLine *line0012 = [[MWLine alloc] init];
    line0012.identifier = @"line0012";
    line0012.nameOriginal = @"12. Бутовская линия";
    line0012.nameEnglish = @"12. Butovskaya Line";
    line0012.color = [UIColor colorWithRed:(175/255.0) green:(191/255.0) blue:(208/255.0) alpha:1];
    [self.lines addObject:line0012];
    
    // 8A. Солнцевская линия
    MWLine *line0013 = [[MWLine alloc] init];
    line0013.identifier = @"line0013";
    line0013.nameOriginal = @"8А. Солнцевская линия";
    line0013.nameEnglish = @"8A. Solntsevskaya Line";
    line0013.color = [UIColor colorWithRed:(255/255.0) green:(204/255.0) blue:(50/255.0) alpha:1];
    [self.lines addObject:line0013];

    // 14. Московское центральное кольцо
    MWLine *line0014 = [[MWLine alloc] init];
    line0014.identifier = @"line0014";
    line0014.nameOriginal = @"14. Московское центральное кольцо";
    line0014.nameEnglish = @"14. Moscow Central Circle";
    line0014.color = [UIColor colorWithRed:(247/255.0) green:(190/255.0) blue:(209/255.0) alpha:1];
    line0014.middleSpeed = 40;
    [self.lines addObject:line0014];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0014];
    [self.drawLinesOrder addObject:line0013];
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
    
    // Саларьево
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Саларьево";
    [self.vertices addObject:vertex0001];
    
    // Парк культуры
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Парк культуры";
    [self.vertices addObject:vertex0002];
    
    MWDrawGradientRect *drawGradientRect0001 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0001.startColor = line0001.color;
    drawGradientRect0001.endColor = line0005.color;
    drawGradientRect0001.point1 = CGPointMake(1755.5, 3888.5);
    drawGradientRect0001.point2 = CGPointMake(1730, 3877.5);
    drawGradientRect0001.point3 = CGPointMake(1738, 3856.5);
    drawGradientRect0001.point4 = CGPointMake(1764.5, 3867.5);
    [vertex0002.drawPrimitives addObject:drawGradientRect0001];

    MWDrawFillCircle *fillCircle0273 = [[MWDrawFillCircle alloc] init];
    fillCircle0273.center = CGPointMake(1732, 3909);
    fillCircle0273.radius = 31.5;
    fillCircle0273.fillColor = line0001.color;
    [vertex0002.drawPrimitives addObject:fillCircle0273];
    
    MWDrawFillCircle *fillCircle0274 = [[MWDrawFillCircle alloc] init];
    fillCircle0274.center = CGPointMake(1732, 3909);
    fillCircle0274.radius = 14;
    fillCircle0274.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0274];

    MWDrawFillCircle *fillCircle0275 = [[MWDrawFillCircle alloc] init];
    fillCircle0275.center = CGPointMake(1762, 3836.5);
    fillCircle0275.radius = 31.5;
    fillCircle0275.fillColor = line0005.color;
    [vertex0002.drawPrimitives addObject:fillCircle0275];
    
    MWDrawFillCircle *fillCircle0276 = [[MWDrawFillCircle alloc] init];
    fillCircle0276.center = CGPointMake(1762, 3836.5);
    fillCircle0276.radius = 14;
    fillCircle0276.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0276];

    MWDrawLine *drawLine0418 = [[MWDrawLine alloc] init];
    drawLine0418.startPoint = CGPointMake(1732, 3909);
    drawLine0418.endPoint = CGPointMake(1762, 3836.5);
    drawLine0418.width = 9.5;
    drawLine0418.color = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:drawLine0418];

    // Библиотека им. Ленина - Боровицкая - Арбатская - Александровский сад
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Библиотека им. Ленина - Боровицкая - Арбатская - Александровский сад";
    [self.vertices addObject:vertex0003];
    
    MWDrawGradientArc *drawGradientArc0001 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0001.startColor = line0003.color;
    drawGradientArc0001.endColor = line0001.color;
    drawGradientArc0001.width = 27;
    drawGradientArc0001.center = CGPointMake(2153, 3571);
    drawGradientArc0001.startGradient = CGPointMake(2165, 3469.5);
    drawGradientArc0001.endGradient = CGPointMake(2252.5, 3595);
    drawGradientArc0001.radius = 102;
    drawGradientArc0001.startDegrees = 279;
    drawGradientArc0001.endDegrees = 30;
    [vertex0003.drawPrimitives addObject:drawGradientArc0001];
    
    MWDrawGradientArc *drawGradientArc0002 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0002.startColor = line0001.color;
    drawGradientArc0002.endColor = line0009.color;
    drawGradientArc0002.width = 27;
    drawGradientArc0002.center = CGPointMake(2153, 3571);
    drawGradientArc0002.startGradient = CGPointMake(2240, 3650);
    drawGradientArc0002.endGradient = CGPointMake(2070, 3638.5);
    drawGradientArc0002.radius = 102;
    drawGradientArc0002.startDegrees = 30;
    drawGradientArc0002.endDegrees = 136;
    [vertex0003.drawPrimitives addObject:drawGradientArc0002];
    
    MWDrawGradientArc *drawGradientArc0003 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0003.startColor = line0009.color;
    drawGradientArc0003.endColor = line0003.color;
    drawGradientArc0003.width = 27;
    drawGradientArc0003.center = CGPointMake(2153, 3571);
    drawGradientArc0003.startGradient = CGPointMake(2055, 3613);
    drawGradientArc0003.endGradient = CGPointMake(2143, 3470);
    drawGradientArc0003.radius = 102;
    drawGradientArc0003.startDegrees = 138;
    drawGradientArc0003.endDegrees = 275;
    [vertex0003.drawPrimitives addObject:drawGradientArc0003];
    
    MWDrawGradientArc *drawGradientArc0004 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0004.startColor = line0001.color;
    drawGradientArc0004.endColor = line0004.color;
    drawGradientArc0004.width = 27;
    drawGradientArc0004.center = CGPointMake(2241, 3519.5);
    drawGradientArc0004.startGradient = CGPointMake(2224, 3616);
    drawGradientArc0004.endGradient = CGPointMake(2166, 3587);
    drawGradientArc0004.radius = 102;
    drawGradientArc0004.startDegrees = 104;
    drawGradientArc0004.endDegrees = 135;
    [vertex0003.drawPrimitives addObject:drawGradientArc0004];
    
    MWDrawGradientArc *drawGradientArc0005 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0005.startColor = line0004.color;
    drawGradientArc0005.endColor = line0003.color;
    drawGradientArc0005.width = 27;
    drawGradientArc0005.center = CGPointMake(2241, 3519.5);
    drawGradientArc0005.startGradient = CGPointMake(2143.5, 3549);
    drawGradientArc0005.endGradient = CGPointMake(2142, 3490);
    drawGradientArc0005.radius = 102;
    drawGradientArc0005.startDegrees = 164;
    drawGradientArc0005.endDegrees = 195;
    [vertex0003.drawPrimitives addObject:drawGradientArc0005];

    MWDrawFillCircle *fillCircle0277 = [[MWDrawFillCircle alloc] init];
    fillCircle0277.center = CGPointMake(2152.5, 3469);
    fillCircle0277.radius = 31.5;
    fillCircle0277.fillColor = line0003.color;
    [vertex0003.drawPrimitives addObject:fillCircle0277];
    
    MWDrawFillCircle *fillCircle0278 = [[MWDrawFillCircle alloc] init];
    fillCircle0278.center = CGPointMake(2152.5, 3469);
    fillCircle0278.radius = 14;
    fillCircle0278.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0278];

    MWDrawFillCircle *fillCircle0279 = [[MWDrawFillCircle alloc] init];
    fillCircle0279.center = CGPointMake(2242, 3621.5);
    fillCircle0279.radius = 31.5;
    fillCircle0279.fillColor = line0001.color;
    [vertex0003.drawPrimitives addObject:fillCircle0279];
    
    MWDrawFillCircle *fillCircle0280 = [[MWDrawFillCircle alloc] init];
    fillCircle0280.center = CGPointMake(2242, 3621.5);
    fillCircle0280.radius = 14;
    fillCircle0280.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0280];

    MWDrawFillCircle *fillCircle0281 = [[MWDrawFillCircle alloc] init];
    fillCircle0281.center = CGPointMake(2065, 3622.5);
    fillCircle0281.radius = 31.5;
    fillCircle0281.fillColor = line0009.color;
    [vertex0003.drawPrimitives addObject:fillCircle0281];
    
    MWDrawFillCircle *fillCircle0282 = [[MWDrawFillCircle alloc] init];
    fillCircle0282.center = CGPointMake(2065, 3622.5);
    fillCircle0282.radius = 14;
    fillCircle0282.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0282];

    MWDrawFillCircle *fillCircle0283 = [[MWDrawFillCircle alloc] init];
    fillCircle0283.center = CGPointMake(2153, 3571);
    fillCircle0283.radius = 31.5;
    fillCircle0283.fillColor = line0004.color;
    [vertex0003.drawPrimitives addObject:fillCircle0283];
    
    MWDrawFillCircle *fillCircle0284 = [[MWDrawFillCircle alloc] init];
    fillCircle0284.center = CGPointMake(2153, 3571);
    fillCircle0284.radius = 14;
    fillCircle0284.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0284];

    MWDrawArc *drawArc0146 = [[MWDrawArc alloc] init];
    drawArc0146.center = CGPointMake(2153, 3571);
    drawArc0146.startDegrees = 0;
    drawArc0146.endDegrees = 360;
    drawArc0146.radius = 102;
    drawArc0146.width = 9.5;
    drawArc0146.color = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:drawArc0146];

    // Охотный Ряд - Театральная - Пл. Революции
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: Охотный Ряд - Театральная - Площадь Революции";
    [self.vertices addObject:vertex0004];
    
    MWDrawGradientRect *drawGradientRect0002 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0002.startColor = line0001.color;
    drawGradientRect0002.endColor = line0002.color;
    drawGradientRect0002.point1 = CGPointMake(2537.5, 3355.5);
    drawGradientRect0002.point2 = CGPointMake(2563.5, 3344.5);
    drawGradientRect0002.point3 = CGPointMake(2571.5, 3365.5);
    drawGradientRect0002.point4 = CGPointMake(2545.5, 3376.5);
    [vertex0004.drawPrimitives addObject:drawGradientRect0002];

    MWDrawGradientRect *drawGradientRect0003 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0003.startColor = line0002.color;
    drawGradientRect0003.endColor = line0003.color;
    drawGradientRect0003.point1 = CGPointMake(2566.5, 3427.5);
    drawGradientRect0003.point2 = CGPointMake(2592.5, 3417.5);
    drawGradientRect0003.point3 = CGPointMake(2601.5, 3438.5);
    drawGradientRect0003.point4 = CGPointMake(2575.5, 3448.5);
    [vertex0004.drawPrimitives addObject:drawGradientRect0003];

    MWDrawFillCircle *fillCircle0285 = [[MWDrawFillCircle alloc] init];
    fillCircle0285.center = CGPointMake(2539.5, 3324.5);
    fillCircle0285.radius = 31.5;
    fillCircle0285.fillColor = line0001.color;
    [vertex0004.drawPrimitives addObject:fillCircle0285];

    MWDrawFillCircle *fillCircle0286 = [[MWDrawFillCircle alloc] init];
    fillCircle0286.center = CGPointMake(2539.5, 3324.5);;
    fillCircle0286.radius = 14;
    fillCircle0286.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0286];

    MWDrawFillCircle *fillCircle0287 = [[MWDrawFillCircle alloc] init];
    fillCircle0287.center = CGPointMake(2569, 3397);
    fillCircle0287.radius = 31.5;
    fillCircle0287.fillColor = line0002.color;
    [vertex0004.drawPrimitives addObject:fillCircle0287];

    MWDrawFillCircle *fillCircle0288 = [[MWDrawFillCircle alloc] init];
    fillCircle0288.center = CGPointMake(2569, 3397);
    fillCircle0288.radius = 14;
    fillCircle0288.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0288];

    MWDrawFillCircle *fillCircle0289 = [[MWDrawFillCircle alloc] init];
    fillCircle0289.center = CGPointMake(2599, 3469);
    fillCircle0289.radius = 31.5;
    fillCircle0289.fillColor = line0003.color;
    [vertex0004.drawPrimitives addObject:fillCircle0289];
    
    MWDrawFillCircle *fillCircle0290 = [[MWDrawFillCircle alloc] init];
    fillCircle0290.center = CGPointMake(2599, 3469);
    fillCircle0290.radius = 14;
    fillCircle0290.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0290];

    MWDrawLine *drawLine0419 = [[MWDrawLine alloc] init];
    drawLine0419.startPoint = CGPointMake(2539.5, 3324.5);
    drawLine0419.endPoint = CGPointMake(2599, 3469);
    drawLine0419.width = 9.5;
    drawLine0419.color = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:drawLine0419];

    // Кузнецкий Мост - Лубянка
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: Кузнецкий Мост - Лубянка";
    [self.vertices addObject:vertex0005];
    
    MWDrawGradientRect *drawGradientRect0004 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0004.startColor = line0007.color;
    drawGradientRect0004.endColor = line0001.color;
    drawGradientRect0004.point1 = CGPointMake(2750.5, 3038.5);
    drawGradientRect0004.point2 = CGPointMake(2777.5, 3028.5);
    drawGradientRect0004.point3 = CGPointMake(2786.5, 3049.5);
    drawGradientRect0004.point4 = CGPointMake(2759.5, 3059.5);
    [vertex0005.drawPrimitives addObject:drawGradientRect0004];

    MWDrawFillCircle *fillCircle0291 = [[MWDrawFillCircle alloc] init];
    fillCircle0291.center = CGPointMake(2753.5, 3008);
    fillCircle0291.radius = 31.5;
    fillCircle0291.fillColor = line0007.color;
    [vertex0005.drawPrimitives addObject:fillCircle0291];
    
    MWDrawFillCircle *fillCircle0292 = [[MWDrawFillCircle alloc] init];
    fillCircle0292.center = CGPointMake(2753.5, 3008);
    fillCircle0292.radius = 14;
    fillCircle0292.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0292];

    MWDrawFillCircle *fillCircle0293 = [[MWDrawFillCircle alloc] init];
    fillCircle0293.center = CGPointMake(2783.5, 3080);
    fillCircle0293.radius = 31.5;
    fillCircle0293.fillColor = line0001.color;
    [vertex0005.drawPrimitives addObject:fillCircle0293];

    MWDrawFillCircle *fillCircle0294 = [[MWDrawFillCircle alloc] init];
    fillCircle0294.center = CGPointMake(2783.5, 3080);
    fillCircle0294.radius = 14;
    fillCircle0294.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0294];

    MWDrawLine *drawLine0420 = [[MWDrawLine alloc] init];
    drawLine0420.startPoint = CGPointMake(2753.5, 3008);
    drawLine0420.endPoint = CGPointMake(2783.5, 3080);
    drawLine0420.width = 9.5;
    drawLine0420.color = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:drawLine0420];

    // Чистые пруды - Тургеневская - Сретенский бульвар
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Чистые пруды - Тургеневская - Сретенский бульвар";
    [self.vertices addObject:vertex0006];
    
    MWDrawGradientArc *drawGradientArc0006 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0006.startColor = line0001.color;
    drawGradientArc0006.endColor = line0006.color;
    drawGradientArc0006.width = 27;
    drawGradientArc0006.center = CGPointMake(2970, 2821.5);
    drawGradientArc0006.startGradient = CGPointMake(3008, 2876);
    drawGradientArc0006.endGradient = CGPointMake(2933, 2876);
    drawGradientArc0006.radius = 53;
    drawGradientArc0006.startDegrees = 57;
    drawGradientArc0006.endDegrees = 123;
    [vertex0006.drawPrimitives addObject:drawGradientArc0006];

    MWDrawGradientArc *drawGradientArc0007 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0007.startColor = line0006.color;
    drawGradientArc0007.endColor = line0010.color;
    drawGradientArc0007.width = 27;
    drawGradientArc0007.center = CGPointMake(2970, 2821.5);
    drawGradientArc0007.startGradient = CGPointMake(2916.5, 2832);
    drawGradientArc0007.endGradient = CGPointMake(2943.5, 2775.5);
    drawGradientArc0007.radius = 53;
    drawGradientArc0007.startDegrees = 179;
    drawGradientArc0007.endDegrees = 242;
    [vertex0006.drawPrimitives addObject:drawGradientArc0007];

    MWDrawGradientArc *drawGradientArc0008 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0008.startColor = line0010.color;
    drawGradientArc0008.endColor = line0001.color;
    drawGradientArc0008.width = 27;
    drawGradientArc0008.center = CGPointMake(2970, 2821.5);
    drawGradientArc0008.startGradient = CGPointMake(2999, 2774.5);
    drawGradientArc0008.endGradient = CGPointMake(3025, 2823);
    drawGradientArc0008.radius = 53;
    drawGradientArc0008.startDegrees = 296;
    drawGradientArc0008.endDegrees = 2;
    [vertex0006.drawPrimitives addObject:drawGradientArc0008];

    MWDrawFillCircle *fillCircle0295 = [[MWDrawFillCircle alloc] init];
    fillCircle0295.center = CGPointMake(3015.5, 2848);
    fillCircle0295.radius = 31.5;
    fillCircle0295.fillColor = line0001.color;
    [vertex0006.drawPrimitives addObject:fillCircle0295];

    MWDrawFillCircle *fillCircle0296 = [[MWDrawFillCircle alloc] init];
    fillCircle0296.center = CGPointMake(3015.5, 2848);
    fillCircle0296.radius = 14;
    fillCircle0296.fillColor = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:fillCircle0296];

    MWDrawFillCircle *fillCircle0297 = [[MWDrawFillCircle alloc] init];
    fillCircle0297.center = CGPointMake(2924.5, 2848);
    fillCircle0297.radius = 31.5;
    fillCircle0297.fillColor = line0006.color;
    [vertex0006.drawPrimitives addObject:fillCircle0297];
    
    MWDrawFillCircle *fillCircle0298 = [[MWDrawFillCircle alloc] init];
    fillCircle0298.center = CGPointMake(2924.5, 2848);
    fillCircle0298.radius = 14;
    fillCircle0298.fillColor = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:fillCircle0298];

    MWDrawFillCircle *fillCircle0299 = [[MWDrawFillCircle alloc] init];
    fillCircle0299.center = CGPointMake(2970, 2769);
    fillCircle0299.radius = 31.5;
    fillCircle0299.fillColor = line0010.color;
    [vertex0006.drawPrimitives addObject:fillCircle0299];

    MWDrawFillCircle *fillCircle0300 = [[MWDrawFillCircle alloc] init];
    fillCircle0300.center = CGPointMake(2970, 2769);
    fillCircle0300.radius = 14;
    fillCircle0300.fillColor = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:fillCircle0300];

    MWDrawArc *drawArc0147 = [[MWDrawArc alloc] init];
    drawArc0147.center = CGPointMake(2970, 2821.5);
    drawArc0147.startDegrees = 0;
    drawArc0147.endDegrees = 360;
    drawArc0147.radius = 53;
    drawArc0147.width = 9.5;
    drawArc0147.color = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:drawArc0147];

    // Комсомольская
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Комсомольская";
    [self.vertices addObject:vertex0007];

    MWDrawGradientRect *drawGradientRect0005 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0005.startColor = line0001.color;
    drawGradientRect0005.endColor = line0005.color;
    drawGradientRect0005.point1 = CGPointMake(3287, 2590);
    drawGradientRect0005.point2 = CGPointMake(3315, 2590);
    drawGradientRect0005.point3 = CGPointMake(3315, 2613);
    drawGradientRect0005.point4 = CGPointMake(3287, 2613);
    [vertex0007.drawPrimitives addObject:drawGradientRect0005];

    MWDrawFillCircle *fillCircle0301 = [[MWDrawFillCircle alloc] init];
    fillCircle0301.center = CGPointMake(3301, 2641);
    fillCircle0301.radius = 31.5;
    fillCircle0301.fillColor = line0005.color;
    [vertex0007.drawPrimitives addObject:fillCircle0301];

    MWDrawFillCircle *fillCircle0302 = [[MWDrawFillCircle alloc] init];
    fillCircle0302.center = CGPointMake(3301, 2641);
    fillCircle0302.radius = 14;
    fillCircle0302.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0302];

    MWDrawFillCircle *fillCircle0303 = [[MWDrawFillCircle alloc] init];
    fillCircle0303.center = CGPointMake(3301, 2562.5);
    fillCircle0303.radius = 31.5;
    fillCircle0303.fillColor = line0001.color;
    [vertex0007.drawPrimitives addObject:fillCircle0303];

    MWDrawFillCircle *fillCircle0304 = [[MWDrawFillCircle alloc] init];
    fillCircle0304.center = CGPointMake(3301, 2562.5);
    fillCircle0304.radius = 14;
    fillCircle0304.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0304];

    MWDrawLine *drawLine0421 = [[MWDrawLine alloc] init];
    drawLine0421.startPoint = CGPointMake(3301, 2641);
    drawLine0421.endPoint = CGPointMake(3301, 2562.5);
    drawLine0421.width = 9.5;
    drawLine0421.color = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:drawLine0421];
    
    // Бульвар Рокоссовского
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Бульвар Рокоссовского";
    [self.vertices addObject:vertex0008];
    
    MWDrawFillCircle *fillCircle0305 = [[MWDrawFillCircle alloc] init];
    fillCircle0305.center = CGPointMake(3494, 1731);
    fillCircle0305.radius = 3.5;
    fillCircle0305.fillColor = line0001.color;
    [vertex0008.drawPrimitives addObject:fillCircle0305];

    MWDrawFillCircle *fillCircle0306 = [[MWDrawFillCircle alloc] init];
    fillCircle0306.center = CGPointMake(3512.5, 1731);
    fillCircle0306.radius = 3.5;
    fillCircle0306.fillColor = line0001.color;
    [vertex0008.drawPrimitives addObject:fillCircle0306];

    MWDrawFillCircle *fillCircle0307 = [[MWDrawFillCircle alloc] init];
    fillCircle0307.center = CGPointMake(3531, 1731);
    fillCircle0307.radius = 3.5;
    fillCircle0307.fillColor = line0001.color;
    [vertex0008.drawPrimitives addObject:fillCircle0307];

    MWDrawLine *drawLine0422 = [[MWDrawLine alloc] init];
    drawLine0422.startPoint = CGPointMake(3485, 1770);
    drawLine0422.endPoint = CGPointMake(3545, 1770);
    drawLine0422.width = 40;
    drawLine0422.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [vertex0008.drawPrimitives addObject:drawLine0422];

    MWDrawTextLine *drawTextLine0485 = [[MWDrawTextLine alloc] init];
    drawTextLine0485.text = @"6 мин";
    drawTextLine0485.fontName = @"HelveticaNeue";
    drawTextLine0485.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0485.fontSize = 18;
    drawTextLine0485.origin = CGPointMake(3494, 1742);
    drawTextLine0485.kernSpacing = 0.3;
    [vertex0008.drawPrimitives addObject:drawTextLine0485];

    MWDrawTextLine *drawTextLine0486 = [[MWDrawTextLine alloc] init];
    drawTextLine0486.text = @"6 min";
    drawTextLine0486.fontName = @"HelveticaNeue";
    drawTextLine0486.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0486.fontSize = 18;
    drawTextLine0486.origin = CGPointMake(3494, 1766);
    drawTextLine0486.kernSpacing = 0.3;
    [vertex0008.drawPrimitives addObject:drawTextLine0486];

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
    drawGradientRect0006.point1 = CGPointMake(3546.5, 6090.5);
    drawGradientRect0006.point2 = CGPointMake(3565.5, 6071.5);
    drawGradientRect0006.point3 = CGPointMake(3581.5, 6086.5);
    drawGradientRect0006.point4 = CGPointMake(3562.5, 6105.5);
    [vertex0010.drawPrimitives addObject:drawGradientRect0006];
    
    MWDrawFillCircle *fillCircle0308 = [[MWDrawFillCircle alloc] init];
    fillCircle0308.center = CGPointMake(3536, 6061);
    fillCircle0308.radius = 31.5;
    fillCircle0308.fillColor = line0010.color;
    [vertex0010.drawPrimitives addObject:fillCircle0308];

    MWDrawFillCircle *fillCircle0309 = [[MWDrawFillCircle alloc] init];
    fillCircle0309.center = CGPointMake(3536, 6061);
    fillCircle0309.radius = 14;
    fillCircle0309.fillColor = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:fillCircle0309];

    MWDrawFillCircle *fillCircle0310 = [[MWDrawFillCircle alloc] init];
    fillCircle0310.center = CGPointMake(3591, 6115);
    fillCircle0310.radius = 31.5;
    fillCircle0310.fillColor = line0002.color;
    [vertex0010.drawPrimitives addObject:fillCircle0310];
    
    MWDrawFillCircle *fillCircle0311 = [[MWDrawFillCircle alloc] init];
    fillCircle0311.center = CGPointMake(3591, 6115);
    fillCircle0311.radius = 14;
    fillCircle0311.fillColor = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:fillCircle0311];

    MWDrawLine *drawLine0423 = [[MWDrawLine alloc] init];
    drawLine0423.startPoint = CGPointMake(3536, 6061);
    drawLine0423.endPoint = CGPointMake(3591, 6115);
    drawLine0423.width = 9.5;
    drawLine0423.color = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:drawLine0423];
    
    // Каширская
    MWVertex *vertex0011 = [[MWVertex alloc] init];
    
    vertex0011.developmentName = @"Вершина: Каширская";
    vertex0011.identifier = @"vertex0011";
    [self.vertices addObject:vertex0011];
    
    MWDrawGradientRect *drawGradientRect0007 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0007.startColor = line0011.color;
    drawGradientRect0007.endColor = line0002.color;
    drawGradientRect0007.point1 = CGPointMake(2979.5, 5416.5);
    drawGradientRect0007.point2 = CGPointMake(2959.5, 5436.5);
    drawGradientRect0007.point3 = CGPointMake(2940.5, 5417.5);
    drawGradientRect0007.point4 = CGPointMake(2960.5, 5397.5);
    [vertex0011.drawPrimitives addObject:drawGradientRect0007];

    MWDrawFillCircle *fillCircle0312 = [[MWDrawFillCircle alloc] init];
    fillCircle0312.center = CGPointMake(2990, 5445);
    fillCircle0312.radius = 31.5;
    fillCircle0312.fillColor = line0011.color;
    [vertex0011.drawPrimitives addObject:fillCircle0312];
    
    MWDrawFillCircle *fillCircle0313 = [[MWDrawFillCircle alloc] init];
    fillCircle0313.center = CGPointMake(2990, 5445);
    fillCircle0313.radius = 14;
    fillCircle0313.fillColor = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:fillCircle0313];

    MWDrawFillCircle *fillCircle0314 = [[MWDrawFillCircle alloc] init];
    fillCircle0314.center = CGPointMake(2931, 5389.5);
    fillCircle0314.radius = 31.5;
    fillCircle0314.fillColor = line0002.color;
    [vertex0011.drawPrimitives addObject:fillCircle0314];

    MWDrawFillCircle *fillCircle0315 = [[MWDrawFillCircle alloc] init];
    fillCircle0315.center = CGPointMake(2931, 5389.5);
    fillCircle0315.radius = 14;
    fillCircle0315.fillColor = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:fillCircle0315];

    MWDrawLine *drawLine0424 = [[MWDrawLine alloc] init];
    drawLine0424.startPoint = CGPointMake(2990, 5445);
    drawLine0424.endPoint = CGPointMake(2931, 5389.5);
    drawLine0424.width = 9.5;
    drawLine0424.color = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:drawLine0424];

    MWDrawFillCircle *fillCircle0336 = [[MWDrawFillCircle alloc] init];
    fillCircle0336.center = CGPointMake(2990, 5445);
    fillCircle0336.radius = 7;
    fillCircle0336.fillColor = line0002.color;
    [vertex0011.drawPrimitives addObject:fillCircle0336];

    MWDrawFillCircle *fillCircle0337 = [[MWDrawFillCircle alloc] init];
    fillCircle0337.center = CGPointMake(2931, 5389.5);
    fillCircle0337.radius = 7;
    fillCircle0337.fillColor = line0011.color;
    [vertex0011.drawPrimitives addObject:fillCircle0337];

    // Павелецкая
    MWVertex *vertex0012 = [[MWVertex alloc] init];
    vertex0012.identifier = @"vertex0012";
    vertex0012.developmentName = @"Вершина: Павелецкая";
    [self.vertices addObject:vertex0012];
    
    MWDrawGradientRect *drawGradientRect0008 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0008.startColor = line0002.color;
    drawGradientRect0008.endColor = line0005.color;
    drawGradientRect0008.point1 = CGPointMake(2934.5, 4143.5);
    drawGradientRect0008.point2 = CGPointMake(2959, 4159.5);
    drawGradientRect0008.point3 = CGPointMake(2971.5, 4140.5);
    drawGradientRect0008.point4 = CGPointMake(2945, 4125);
    [vertex0012.drawPrimitives addObject:drawGradientRect0008];

    MWDrawFillCircle *fillCircle0316 = [[MWDrawFillCircle alloc] init];
    fillCircle0316.center = CGPointMake(2931, 4174);
    fillCircle0316.radius = 31.5;
    fillCircle0316.fillColor = line0002.color;
    [vertex0012.drawPrimitives addObject:fillCircle0316];
    
    MWDrawFillCircle *fillCircle0317 = [[MWDrawFillCircle alloc] init];
    fillCircle0317.center = CGPointMake(2931, 4174);
    fillCircle0317.radius = 14;
    fillCircle0317.fillColor = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:fillCircle0317];

    MWDrawFillCircle *fillCircle0318 = [[MWDrawFillCircle alloc] init];
    fillCircle0318.center = CGPointMake(2974.5, 4109);
    fillCircle0318.radius = 31.5;
    fillCircle0318.fillColor = line0005.color;
    [vertex0012.drawPrimitives addObject:fillCircle0318];

    MWDrawFillCircle *fillCircle0319 = [[MWDrawFillCircle alloc] init];
    fillCircle0319.center = CGPointMake(2974.5, 4109);
    fillCircle0319.radius = 14;
    fillCircle0319.fillColor = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:fillCircle0319];

    MWDrawLine *drawLine0425 = [[MWDrawLine alloc] init];
    drawLine0425.startPoint = CGPointMake(2931, 4174);
    drawLine0425.endPoint = CGPointMake(2974.5, 4109);
    drawLine0425.width = 9.5;
    drawLine0425.color = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:drawLine0425];

    // Новокузнецкая - Третьяковская
    MWVertex *vertex0013 = [[MWVertex alloc] init];
    vertex0013.identifier = @"vertex0013";
    vertex0013.developmentName = @"Вершина: Новокузценкая - Третьяковская";
    [self.vertices addObject:vertex0013];

    MWDrawGradientArc *drawGradientArc0009 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0009.startColor = line0002.color;
    drawGradientArc0009.endColor = line0008.color;
    drawGradientArc0009.width = 27;
    drawGradientArc0009.center = CGPointMake(2894, 3842.5);
    drawGradientArc0009.startGradient = CGPointMake(2958, 3822);
    drawGradientArc0009.endGradient = CGPointMake(2924, 3902);
    drawGradientArc0009.radius = 53;
    drawGradientArc0009.startDegrees = 341;
    drawGradientArc0009.endDegrees = 62.5;
    [vertex0013.drawPrimitives addObject:drawGradientArc0009];

    MWDrawGradientArc *drawGradientArc0010 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0010.startColor = line0008.color;
    drawGradientArc0010.endColor = line0006.color;
    drawGradientArc0010.width = 27;
    drawGradientArc0010.center = CGPointMake(2894, 3842.5);
    drawGradientArc0010.startGradient = CGPointMake(2863, 3901);
    drawGradientArc0010.endGradient = CGPointMake(2835, 3873);
    drawGradientArc0010.radius = 53;
    drawGradientArc0010.startDegrees = 117;
    drawGradientArc0010.endDegrees = 153;
    [vertex0013.drawPrimitives addObject:drawGradientArc0010];

    MWDrawGradientArc *drawGradientArc0011 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0011.startColor = line0006.color;
    drawGradientArc0011.endColor = line0002.color;
    drawGradientArc0011.width = 27;
    drawGradientArc0011.center = CGPointMake(2894, 3842.5);
    drawGradientArc0011.startGradient = CGPointMake(2834, 3812);
    drawGradientArc0011.endGradient = CGPointMake(2915, 3779);
    drawGradientArc0011.radius = 53;
    drawGradientArc0011.startDegrees = 206.5;
    drawGradientArc0011.endDegrees = 286;
    [vertex0013.drawPrimitives addObject:drawGradientArc0011];

    MWDrawFillCircle *fillCircle0320 = [[MWDrawFillCircle alloc] init];
    fillCircle0320.center = CGPointMake(2931, 3805);
    fillCircle0320.radius = 31.5;
    fillCircle0320.fillColor = line0002.color;
    [vertex0013.drawPrimitives addObject:fillCircle0320];

    MWDrawFillCircle *fillCircle0321 = [[MWDrawFillCircle alloc] init];
    fillCircle0321.center = CGPointMake(2931, 3805);
    fillCircle0321.radius = 14;
    fillCircle0321.fillColor = [UIColor whiteColor];
    [vertex0013.drawPrimitives addObject:fillCircle0321];

    MWDrawFillCircle *fillCircle0322 = [[MWDrawFillCircle alloc] init];
    fillCircle0322.center = CGPointMake(2841.5, 3842.5);
    fillCircle0322.radius = 31.5;
    fillCircle0322.fillColor = line0006.color;
    [vertex0013.drawPrimitives addObject:fillCircle0322];
    
    MWDrawFillCircle *fillCircle0323 = [[MWDrawFillCircle alloc] init];
    fillCircle0323.center = CGPointMake(2841.5, 3842.5);
    fillCircle0323.radius = 14;
    fillCircle0323.fillColor = [UIColor whiteColor];
    [vertex0013.drawPrimitives addObject:fillCircle0323];

    MWDrawFillCircle *fillCircle0324 = [[MWDrawFillCircle alloc] init];
    fillCircle0324.center = CGPointMake(2894, 3895);
    fillCircle0324.radius = 31.5;
    fillCircle0324.fillColor = line0008.color;
    [vertex0013.drawPrimitives addObject:fillCircle0324];

    MWDrawFillCircle *fillCircle0325 = [[MWDrawFillCircle alloc] init];
    fillCircle0325.center = CGPointMake(2894, 3895);
    fillCircle0325.radius = 14;
    fillCircle0325.fillColor = [UIColor whiteColor];
    [vertex0013.drawPrimitives addObject:fillCircle0325];

    MWDrawArc *drawArc0148 = [[MWDrawArc alloc] init];
    drawArc0148.center = CGPointMake(2894, 3842.5);
    drawArc0148.startDegrees = 0;
    drawArc0148.endDegrees = 360;
    drawArc0148.radius = 53;
    drawArc0148.width = 9.5;
    drawArc0148.color = [UIColor whiteColor];
    [vertex0013.drawPrimitives addObject:drawArc0148];

    MWDrawFillCircle *fillCircle0338 = [[MWDrawFillCircle alloc] init];
    fillCircle0338.center = CGPointMake(2841.5, 3842.5);
    fillCircle0338.radius = 7;
    fillCircle0338.fillColor = line0008.color;
    [vertex0013.drawPrimitives addObject:fillCircle0338];
    
    MWDrawFillCircle *fillCircle0339 = [[MWDrawFillCircle alloc] init];
    fillCircle0339.center = CGPointMake(2894, 3895);
    fillCircle0339.radius = 7;
    fillCircle0339.fillColor = line0006.color;
    [vertex0013.drawPrimitives addObject:fillCircle0339];

    // Тверская - Пушкинская - Чеховская
    MWVertex *vertex0014 = [[MWVertex alloc] init];
    vertex0014.identifier = @"vertex0014";
    vertex0014.developmentName = @"Вершина: Тверская - Пушкинская - Чеховская";
    [self.vertices addObject:vertex0014];

    MWDrawGradientArc *drawGradientArc0012 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0012.startColor = line0007.color;
    drawGradientArc0012.endColor = line0009.color;
    drawGradientArc0012.width = 27;
    drawGradientArc0012.center = CGPointMake(2165.5, 3060.5);
    drawGradientArc0012.startGradient = CGPointMake(2194.5, 3000);
    drawGradientArc0012.endGradient = CGPointMake(2232, 3064.5);
    drawGradientArc0012.radius = 53;
    drawGradientArc0012.startDegrees = 297;
    drawGradientArc0012.endDegrees = 5;
    [vertex0014.drawPrimitives addObject:drawGradientArc0012];

    MWDrawGradientArc *drawGradientArc0013 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0013.startColor = line0009.color;
    drawGradientArc0013.endColor = line0002.color;
    drawGradientArc0013.width = 27;
    drawGradientArc0013.center = CGPointMake(2165.5, 3060.5);
    drawGradientArc0013.startGradient = CGPointMake(2202, 3116);
    drawGradientArc0013.endGradient = CGPointMake(2129, 3116);
    drawGradientArc0013.radius = 53;
    drawGradientArc0013.startDegrees = 57;
    drawGradientArc0013.endDegrees = 123;
    [vertex0014.drawPrimitives addObject:drawGradientArc0013];

    MWDrawGradientArc *drawGradientArc0014 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0014.startColor = line0002.color;
    drawGradientArc0014.endColor = line0007.color;
    drawGradientArc0014.width = 27;
    drawGradientArc0014.center = CGPointMake(2165.5, 3060.5);
    drawGradientArc0014.startGradient = CGPointMake(2101, 3065);
    drawGradientArc0014.endGradient = CGPointMake(2137, 3000);
    drawGradientArc0014.radius = 53;
    drawGradientArc0014.startDegrees = 178;
    drawGradientArc0014.endDegrees = 243;
    [vertex0014.drawPrimitives addObject:drawGradientArc0014];

    MWDrawFillCircle *fillCircle0326 = [[MWDrawFillCircle alloc] init];
    fillCircle0326.center = CGPointMake(2165.5, 3008);
    fillCircle0326.radius = 31.5;
    fillCircle0326.fillColor = line0007.color;
    [vertex0014.drawPrimitives addObject:fillCircle0326];
    
    MWDrawFillCircle *fillCircle0327 = [[MWDrawFillCircle alloc] init];
    fillCircle0327.center = CGPointMake(2165.5, 3008);
    fillCircle0327.radius = 14;
    fillCircle0327.fillColor = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:fillCircle0327];

    MWDrawFillCircle *fillCircle0328 = [[MWDrawFillCircle alloc] init];
    fillCircle0328.center = CGPointMake(2211, 3086.5);
    fillCircle0328.radius = 31.5;
    fillCircle0328.fillColor = line0009.color;
    [vertex0014.drawPrimitives addObject:fillCircle0328];
    
    MWDrawFillCircle *fillCircle0329 = [[MWDrawFillCircle alloc] init];
    fillCircle0329.center = CGPointMake(2211, 3086.5);
    fillCircle0329.radius = 14;
    fillCircle0329.fillColor = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:fillCircle0329];

    MWDrawFillCircle *fillCircle0330 = [[MWDrawFillCircle alloc] init];
    fillCircle0330.center = CGPointMake(2120, 3086.5);
    fillCircle0330.radius = 31.5;
    fillCircle0330.fillColor = line0002.color;
    [vertex0014.drawPrimitives addObject:fillCircle0330];
    
    MWDrawFillCircle *fillCircle0331 = [[MWDrawFillCircle alloc] init];
    fillCircle0331.center = CGPointMake(2120, 3086.5);
    fillCircle0331.radius = 14;
    fillCircle0331.fillColor = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:fillCircle0331];

    MWDrawArc *drawArc0149 = [[MWDrawArc alloc] init];
    drawArc0149.center = CGPointMake(2165.5, 3060.5);
    drawArc0149.startDegrees = 0;
    drawArc0149.endDegrees = 360;
    drawArc0149.radius = 53;
    drawArc0149.width = 9.5;
    drawArc0149.color = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:drawArc0149];

    // Белорусская
    MWVertex *vertex0015 = [[MWVertex alloc] init];
    vertex0015.identifier = @"vertex0015";
    vertex0015.developmentName = @"Вершина: Белорусская";
    [self.vertices addObject:vertex0015];
    
    MWDrawGradientRect *drawGradientRect0009 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0009.startColor = line0002.color;
    drawGradientRect0009.endColor = line0005.color;
    drawGradientRect0009.point1 = CGPointMake(1681, 2690);
    drawGradientRect0009.point2 = CGPointMake(1710, 2690);
    drawGradientRect0009.point3 = CGPointMake(1710, 2712);
    drawGradientRect0009.point4 = CGPointMake(1681, 2712);
    [vertex0015.drawPrimitives addObject:drawGradientRect0009];
    
    MWDrawFillCircle *fillCircle0332 = [[MWDrawFillCircle alloc] init];
    fillCircle0332.center = CGPointMake(1695.5, 2740);
    fillCircle0332.radius = 31.5;
    fillCircle0332.fillColor = line0005.color;
    [vertex0015.drawPrimitives addObject:fillCircle0332];
    
    MWDrawFillCircle *fillCircle0333 = [[MWDrawFillCircle alloc] init];
    fillCircle0333.center = CGPointMake(1695.5, 2740);
    fillCircle0333.radius = 14;
    fillCircle0333.fillColor = [UIColor whiteColor];
    [vertex0015.drawPrimitives addObject:fillCircle0333];

    MWDrawFillCircle *fillCircle0334 = [[MWDrawFillCircle alloc] init];
    fillCircle0334.center = CGPointMake(1695.5, 2662);
    fillCircle0334.radius = 31.5;
    fillCircle0334.fillColor = line0002.color;
    [vertex0015.drawPrimitives addObject:fillCircle0334];
    
    MWDrawFillCircle *fillCircle0335 = [[MWDrawFillCircle alloc] init];
    fillCircle0335.center = CGPointMake(1695.5, 2662);
    fillCircle0335.radius = 14;
    fillCircle0335.fillColor = [UIColor whiteColor];
    [vertex0015.drawPrimitives addObject:fillCircle0335];
    
    MWDrawLine *drawLine0426 = [[MWDrawLine alloc] init];
    drawLine0426.startPoint = CGPointMake(1695.5, 2740);;
    drawLine0426.endPoint = CGPointMake(1695.5, 2662);
    drawLine0426.width = 9.5;
    drawLine0426.color = [UIColor whiteColor];
    [vertex0015.drawPrimitives addObject:drawLine0426];
    
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

    MWDrawGradientRect *drawGradientRect0010 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0010.startColor = line0003.color;
    drawGradientRect0010.endColor = line0004.color;
    drawGradientRect0010.point1 = CGPointMake(197.5, 2634);
    drawGradientRect0010.point2 = CGPointMake(222, 2618);
    drawGradientRect0010.point3 = CGPointMake(237.5, 2634.5);
    drawGradientRect0010.point4 = CGPointMake(217.5, 2655.5);
    [vertex0018.drawPrimitives addObject:drawGradientRect0010];

    MWDrawFillCircle *fillCircle0340 = [[MWDrawFillCircle alloc] init];
    fillCircle0340.center = CGPointMake(192, 2609);
    fillCircle0340.radius = 31.5;
    fillCircle0340.fillColor = line0003.color;
    [vertex0018.drawPrimitives addObject:fillCircle0340];
    
    MWDrawFillCircle *fillCircle0341 = [[MWDrawFillCircle alloc] init];
    fillCircle0341.center = CGPointMake(192, 2609);
    fillCircle0341.radius = 14;
    fillCircle0341.fillColor = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:fillCircle0341];

    MWDrawFillCircle *fillCircle0342 = [[MWDrawFillCircle alloc] init];
    fillCircle0342.center = CGPointMake(247, 2664.5);
    fillCircle0342.radius = 31.5;
    fillCircle0342.fillColor = line0004.color;
    [vertex0018.drawPrimitives addObject:fillCircle0342];
    
    MWDrawFillCircle *fillCircle0343 = [[MWDrawFillCircle alloc] init];
    fillCircle0343.center = CGPointMake(247, 2664.5);
    fillCircle0343.radius = 14;
    fillCircle0343.fillColor = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:fillCircle0343];

    MWDrawLine *drawLine0427 = [[MWDrawLine alloc] init];
    drawLine0427.startPoint = CGPointMake(192, 2609);
    drawLine0427.endPoint = CGPointMake(247, 2664.5);
    drawLine0427.width = 9.5;
    drawLine0427.color = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:drawLine0427];

    MWDrawFillCircle *fillCircle0344 = [[MWDrawFillCircle alloc] init];
    fillCircle0344.center = CGPointMake(192, 2609);
    fillCircle0344.radius = 7;
    fillCircle0344.fillColor = line0004.color;
    [vertex0018.drawPrimitives addObject:fillCircle0344];
    
    MWDrawFillCircle *fillCircle0345 = [[MWDrawFillCircle alloc] init];
    fillCircle0345.center = CGPointMake(247, 2664.5);
    fillCircle0345.radius = 7;
    fillCircle0345.fillColor = line0003.color;
    [vertex0018.drawPrimitives addObject:fillCircle0345];

    // Киевская
    MWVertex *vertex0019 = [[MWVertex alloc] init];
    vertex0019.identifier = @"vertex0019";
    vertex0019.developmentName = @"Вершина: Киевская";
    [self.vertices addObject:vertex0019];
    
    MWDrawGradientArc *drawGradientArc0015 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0015.startColor = line0004.color;
    drawGradientArc0015.endColor = line0005.color;
    drawGradientArc0015.width = 27;
    drawGradientArc0015.center = CGPointMake(1490, 3398.75);
    drawGradientArc0015.startGradient = CGPointMake(1471, 3306);
    drawGradientArc0015.endGradient = CGPointMake(1581, 3369);
    drawGradientArc0015.radius = 81;
    drawGradientArc0015.startDegrees = 259;
    drawGradientArc0015.endDegrees = 341.5;
    [vertex0019.drawPrimitives addObject:drawGradientArc0015];

    MWDrawGradientArc *drawGradientArc0016 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0016.startColor = line0005.color;
    drawGradientArc0016.endColor = line0003.color;
    drawGradientArc0016.width = 27;
    drawGradientArc0016.center = CGPointMake(1490, 3398.75);
    drawGradientArc0016.startGradient = CGPointMake(1580, 3429);
    drawGradientArc0016.endGradient = CGPointMake(1471, 3492);
    drawGradientArc0016.radius = 81;
    drawGradientArc0016.startDegrees = 17;
    drawGradientArc0016.endDegrees = 101;
    [vertex0019.drawPrimitives addObject:drawGradientArc0016];

    MWDrawGradientArc *drawGradientArc0017 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0017.startColor = line0003.color;
    drawGradientArc0017.endColor = line0004.color;
    drawGradientArc0017.width = 27;
    drawGradientArc0017.center = CGPointMake(1490, 3398.75);
    drawGradientArc0017.startGradient = CGPointMake(1417, 3459);
    drawGradientArc0017.endGradient = CGPointMake(1423, 3334);
    drawGradientArc0017.radius = 81;
    drawGradientArc0017.startDegrees = 138;
    drawGradientArc0017.endDegrees = 222;
    [vertex0019.drawPrimitives addObject:drawGradientArc0017];

    MWDrawFillCircle *fillCircle0346 = [[MWDrawFillCircle alloc] init];
    fillCircle0346.center = CGPointMake(1450, 3469);
    fillCircle0346.radius = 31.5;
    fillCircle0346.fillColor = line0003.color;
    [vertex0019.drawPrimitives addObject:fillCircle0346];
    
    MWDrawFillCircle *fillCircle0347 = [[MWDrawFillCircle alloc] init];
    fillCircle0347.center = CGPointMake(1450, 3469);
    fillCircle0347.radius = 14;
    fillCircle0347.fillColor = [UIColor whiteColor];
    [vertex0019.drawPrimitives addObject:fillCircle0347];

    MWDrawFillCircle *fillCircle0348 = [[MWDrawFillCircle alloc] init];
    fillCircle0348.center = CGPointMake(1450, 3328.5);
    fillCircle0348.radius = 31.5;
    fillCircle0348.fillColor = line0004.color;
    [vertex0019.drawPrimitives addObject:fillCircle0348];
    
    MWDrawFillCircle *fillCircle0349 = [[MWDrawFillCircle alloc] init];
    fillCircle0349.center = CGPointMake(1450, 3328.5);
    fillCircle0349.radius = 14;
    fillCircle0349.fillColor = [UIColor whiteColor];
    [vertex0019.drawPrimitives addObject:fillCircle0349];

    MWDrawFillCircle *fillCircle0350 = [[MWDrawFillCircle alloc] init];
    fillCircle0350.center = CGPointMake(1571, 3398.5);
    fillCircle0350.radius = 31.5;
    fillCircle0350.fillColor = line0005.color;
    [vertex0019.drawPrimitives addObject:fillCircle0350];
    
    MWDrawFillCircle *fillCircle0351 = [[MWDrawFillCircle alloc] init];
    fillCircle0351.center = CGPointMake(1571, 3398.5);
    fillCircle0351.radius = 14;
    fillCircle0351.fillColor = [UIColor whiteColor];
    [vertex0019.drawPrimitives addObject:fillCircle0351];

    MWDrawArc *drawArc0150 = [[MWDrawArc alloc] init];
    drawArc0150.center = CGPointMake(1490, 3398.75);
    drawArc0150.startDegrees = 0;
    drawArc0150.endDegrees = 360;
    drawArc0150.radius = 81;
    drawArc0150.width = 9.5;
    drawArc0150.color = [UIColor whiteColor];
    [vertex0019.drawPrimitives addObject:drawArc0150];

    // Курская
    MWVertex *vertex0020 = [[MWVertex alloc] init];
    vertex0020.identifier = @"vertex0020";
    vertex0020.developmentName = @"Вершина: Курская - Чкаловская";
    [self.vertices addObject:vertex0020];

    MWDrawGradientArc *drawGradientArc0018 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0018.startColor = line0005.color;
    drawGradientArc0018.endColor = line0003.color;
    drawGradientArc0018.width = 27;
    drawGradientArc0018.center = CGPointMake(3449, 3078);
    drawGradientArc0018.startGradient = CGPointMake(3513, 3057);
    drawGradientArc0018.endGradient = CGPointMake(3514, 3103);
    drawGradientArc0018.radius = 53;
    drawGradientArc0018.startDegrees = 342;
    drawGradientArc0018.endDegrees = 19;
    [vertex0020.drawPrimitives addObject:drawGradientArc0018];

    MWDrawGradientArc *drawGradientArc0019 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0019.startColor = line0003.color;
    drawGradientArc0019.endColor = line0010.color;
    drawGradientArc0019.width = 27;
    drawGradientArc0019.center = CGPointMake(3449, 3078);
    drawGradientArc0019.startGradient = CGPointMake(3472, 3142);
    drawGradientArc0019.endGradient = CGPointMake(3389, 3108);
    drawGradientArc0019.radius = 53;
    drawGradientArc0019.startDegrees = 72;
    drawGradientArc0019.endDegrees = 153;
    [vertex0020.drawPrimitives addObject:drawGradientArc0019];

    MWDrawGradientArc *drawGradientArc0020 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0020.startColor = line0010.color;
    drawGradientArc0020.endColor = line0005.color;
    drawGradientArc0020.width = 27;
    drawGradientArc0020.center = CGPointMake(3449, 3078);
    drawGradientArc0020.startGradient = CGPointMake(3388, 3049);
    drawGradientArc0020.endGradient = CGPointMake(3470, 3015);
    drawGradientArc0020.radius = 53;
    drawGradientArc0020.startDegrees = 207;
    drawGradientArc0020.endDegrees = 288;
    [vertex0020.drawPrimitives addObject:drawGradientArc0020];

    MWDrawFillCircle *fillCircle0352 = [[MWDrawFillCircle alloc] init];
    fillCircle0352.center = CGPointMake(3396.5, 3078);
    fillCircle0352.radius = 31.5;
    fillCircle0352.fillColor = line0010.color;
    [vertex0020.drawPrimitives addObject:fillCircle0352];
    
    MWDrawFillCircle *fillCircle0353 = [[MWDrawFillCircle alloc] init];
    fillCircle0353.center = CGPointMake(3396.5, 3078);
    fillCircle0353.radius = 14;
    fillCircle0353.fillColor = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:fillCircle0353];

    MWDrawFillCircle *fillCircle0354 = [[MWDrawFillCircle alloc] init];
    fillCircle0354.center = CGPointMake(1450, 3469);
    fillCircle0354.radius = 31.5;
    fillCircle0354.fillColor = line0003.color;
    [vertex0020.drawPrimitives addObject:fillCircle0354];
    
    MWDrawFillCircle *fillCircle0355 = [[MWDrawFillCircle alloc] init];
    fillCircle0355.center = CGPointMake(1450, 3469);
    fillCircle0355.radius = 14;
    fillCircle0355.fillColor = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:fillCircle0355];

    MWDrawFillCircle *fillCircle0356 = [[MWDrawFillCircle alloc] init];
    fillCircle0356.center = CGPointMake(1571, 3398.5);
    fillCircle0356.radius = 31.5;
    fillCircle0356.fillColor = line0005.color;
    [vertex0020.drawPrimitives addObject:fillCircle0356];
    
    MWDrawFillCircle *fillCircle0357 = [[MWDrawFillCircle alloc] init];
    fillCircle0357.center = CGPointMake(1571, 3398.5);
    fillCircle0357.radius = 14;
    fillCircle0357.fillColor = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:fillCircle0357];

    MWDrawArc *drawArc0151 = [[MWDrawArc alloc] init];
    drawArc0151.center = CGPointMake(3449, 3078);
    drawArc0151.startDegrees = 0;
    drawArc0151.endDegrees = 360;
    drawArc0151.radius = 53;
    drawArc0151.width = 9.5;
    drawArc0151.color = [UIColor whiteColor];
    [vertex0020.drawPrimitives addObject:drawArc0151];

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
    
    // Международная CGPointMake(718.5, 3328.5); Line 4
    // Деловой центр CGPointMake(773.5, 3383.5); Line 14
    
    MWDrawLine *drawLine0428 = [[MWDrawLine alloc] init];
    drawLine0428.startPoint = CGPointMake(718.5, 3328.5);
    drawLine0428.endPoint = CGPointMake(773.5, 3383.5);
    drawLine0428.width = 34;
    drawLine0428.color = [UIColor redColor];
    [vertex0022.drawPrimitives addObject:drawLine0428];
    
    MWDrawFillCircle *fillCircle0360 = [[MWDrawFillCircle alloc] init];
    fillCircle0360.center = CGPointMake(718.5, 3328.5);
    fillCircle0360.radius = 31.5;
    fillCircle0360.fillColor = [UIColor redColor];
    [vertex0022.drawPrimitives addObject:fillCircle0360];

    MWDrawFillCircle *fillCircle0358 = [[MWDrawFillCircle alloc] init];
    fillCircle0358.center = CGPointMake(718.5, 3328.5);
    fillCircle0358.radius = 27;
    fillCircle0358.fillColor = line0004.color;
    [vertex0022.drawPrimitives addObject:fillCircle0358];
    
    MWDrawFillCircle *fillCircle0359 = [[MWDrawFillCircle alloc] init];
    fillCircle0359.center = CGPointMake(718.5, 3328.5);
    fillCircle0359.radius = 14;
    fillCircle0359.fillColor = [UIColor whiteColor];
    [vertex0022.drawPrimitives addObject:fillCircle0359];

    MWDrawFillCircle *fillCircle0361 = [[MWDrawFillCircle alloc] init];
    fillCircle0361.center = CGPointMake(773.5, 3383.5);
    fillCircle0361.radius = 31.5;
    fillCircle0361.fillColor = [UIColor redColor];
    [vertex0022.drawPrimitives addObject:fillCircle0361];
    
    MWDrawFillCircle *fillCircle0362 = [[MWDrawFillCircle alloc] init];
    fillCircle0362.center = CGPointMake(773.5, 3383.5);
    fillCircle0362.radius = 27;
    fillCircle0362.fillColor = [UIColor whiteColor];
    [vertex0022.drawPrimitives addObject:fillCircle0362];
    
/*    MWDrawArc *drawArc0152 = [[MWDrawArc alloc] init];
    drawArc0152.center = CGPointMake(2533, 3241);
    drawArc0152.startDegrees = 174.2;
    drawArc0152.endDegrees = 176.6;
    drawArc0152.radius = 1764.5;
    drawArc0152.width = 21.5;
    drawArc0152.color = [UIColor whiteColor];
    [vertex0022.drawPrimitives addObject:drawArc0152]; */
    
    MWDrawGradientRect *drawGradientRect0011 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0011.startColor = line0004.color;
    drawGradientRect0011.endColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    drawGradientRect0011.point1 = CGPointMake(727, 3354);
    drawGradientRect0011.point2 = CGPointMake(744, 3337);
    drawGradientRect0011.point3 = CGPointMake(765, 3358);
    drawGradientRect0011.point4 = CGPointMake(748.5, 3375.5);
    [vertex0022.drawPrimitives addObject:drawGradientRect0011];

    MWDrawLine *drawLine0429 = [[MWDrawLine alloc] init];
    drawLine0429.startPoint = CGPointMake(718.5, 3328.5);
    drawLine0429.endPoint = CGPointMake(773.5, 3383.5);
    drawLine0429.width = 9.5;
    drawLine0429.color = [UIColor whiteColor];
    [vertex0022.drawPrimitives addObject:drawLine0429];
    
    MWDrawFillCircle *fillCircle0363 = [[MWDrawFillCircle alloc] init];
    fillCircle0363.center = CGPointMake(773.5, 3383.5);
    fillCircle0363.radius = 14.5;
    fillCircle0363.fillColor = [UIColor redColor];
    [vertex0022.drawPrimitives addObject:fillCircle0363];
    
    MWDrawFillCircle *fillCircle0364 = [[MWDrawFillCircle alloc] init];
    fillCircle0364.center = CGPointMake(773.5, 3383.5);
    fillCircle0364.radius = 11.5;
    fillCircle0364.fillColor = [UIColor whiteColor];
    [vertex0022.drawPrimitives addObject:fillCircle0364];

    // Добрынинская - Серпуховская
    MWVertex *vertex0023 = [[MWVertex alloc] init];
    vertex0023.identifier = @"vertex0023";
    vertex0023.developmentName = @"Вершина: Добрынинская - Серпуховская";
    [self.vertices addObject:vertex0023];
    
    MWDrawGradientRect *drawGradientRect0012 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0012.startColor = line0005.color;
    drawGradientRect0012.endColor =line0009.color;
    drawGradientRect0012.point1 = CGPointMake(2282, 4209);
    drawGradientRect0012.point2 = CGPointMake(2302, 4189);
    drawGradientRect0012.point3 = CGPointMake(2317.5, 4204.5);
    drawGradientRect0012.point4 = CGPointMake(2298, 4225);
    [vertex0023.drawPrimitives addObject:drawGradientRect0012];

    MWDrawFillCircle *fillCircle0365 = [[MWDrawFillCircle alloc] init];
    fillCircle0365.center = CGPointMake(2272.5, 4179.5);
    fillCircle0365.radius = 31.5;
    fillCircle0365.fillColor = line0005.color;
    [vertex0023.drawPrimitives addObject:fillCircle0365];
    
    MWDrawFillCircle *fillCircle0366 = [[MWDrawFillCircle alloc] init];
    fillCircle0366.center = CGPointMake(2272.5, 4179.5);
    fillCircle0366.radius = 14;
    fillCircle0366.fillColor = [UIColor whiteColor];
    [vertex0023.drawPrimitives addObject:fillCircle0366];

    MWDrawFillCircle *fillCircle0367 = [[MWDrawFillCircle alloc] init];
    fillCircle0367.center = CGPointMake(2328, 4234.5);
    fillCircle0367.radius = 31.5;
    fillCircle0367.fillColor = line0009.color;
    [vertex0023.drawPrimitives addObject:fillCircle0367];
    
    MWDrawFillCircle *fillCircle0368 = [[MWDrawFillCircle alloc] init];
    fillCircle0368.center = CGPointMake(2328, 4234.5);
    fillCircle0368.radius = 14;
    fillCircle0368.fillColor = [UIColor whiteColor];
    [vertex0023.drawPrimitives addObject:fillCircle0368];

    MWDrawLine *drawLine0430 = [[MWDrawLine alloc] init];
    drawLine0430.startPoint = CGPointMake(2272.5, 4179.5);
    drawLine0430.endPoint = CGPointMake(2328, 4234.5);
    drawLine0430.width = 9.5;
    drawLine0430.color = [UIColor whiteColor];
    [vertex0023.drawPrimitives addObject:drawLine0430];

    // Октябрьская
    MWVertex *vertex0024 = [[MWVertex alloc] init];
    vertex0024.identifier = @"vertex0024";
    vertex0024.developmentName = @"Вершина: Октябрьская";
    [self.vertices addObject:vertex0024];
    
    MWDrawGradientRect *drawGradientRect0013 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0013.startColor = line0005.color;
    drawGradientRect0013.endColor =line0006.color;
    drawGradientRect0013.point1 = CGPointMake(1944, 4055);
    drawGradientRect0013.point2 = CGPointMake(1972, 4055);
    drawGradientRect0013.point3 = CGPointMake(1972, 4077);
    drawGradientRect0013.point4 = CGPointMake(1944, 4077);
    [vertex0024.drawPrimitives addObject:drawGradientRect0013];

    MWDrawFillCircle *fillCircle0431 = [[MWDrawFillCircle alloc] init];
    fillCircle0431.center = CGPointMake(1958, 4105.5);
    fillCircle0431.radius = 31.5;
    fillCircle0431.fillColor = line0006.color;
    [vertex0024.drawPrimitives addObject:fillCircle0431];
    
    MWDrawFillCircle *fillCircle0432 = [[MWDrawFillCircle alloc] init];
    fillCircle0432.center = CGPointMake(1958, 4105.5);
    fillCircle0432.radius = 14;
    fillCircle0432.fillColor = [UIColor whiteColor];
    [vertex0024.drawPrimitives addObject:fillCircle0432];

    MWDrawFillCircle *fillCircle0433 = [[MWDrawFillCircle alloc] init];
    fillCircle0433.center = CGPointMake(1958, 4027);
    fillCircle0433.radius = 31.5;
    fillCircle0433.fillColor = line0005.color;
    [vertex0024.drawPrimitives addObject:fillCircle0433];
    
    MWDrawFillCircle *fillCircle0434 = [[MWDrawFillCircle alloc] init];
    fillCircle0434.center = CGPointMake(1958, 4027);
    fillCircle0434.radius = 14;
    fillCircle0434.fillColor = [UIColor whiteColor];
    [vertex0024.drawPrimitives addObject:fillCircle0434];

    MWDrawLine *drawLine0431 = [[MWDrawLine alloc] init];
    drawLine0431.startPoint = CGPointMake(1958, 4105.5);
    drawLine0431.endPoint = CGPointMake(1958, 4027);
    drawLine0431.width = 9.5;
    drawLine0431.color = [UIColor whiteColor];
    [vertex0024.drawPrimitives addObject:drawLine0431];

    // Баррикадная - Краснопресненская
    MWVertex *vertex0025 = [[MWVertex alloc] init];
    vertex0025.identifier = @"vertex0025";
    vertex0025.developmentName = @"Вершина: Баррикадная - Краснопресненская";
    [self.vertices addObject:vertex0025];
    
    MWDrawGradientRect *drawGradientRect0014 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0014.startColor = line0007.color;
    drawGradientRect0014.endColor =line0005.color;
    drawGradientRect0014.point1 = CGPointMake(1602.5, 3018.5);
    drawGradientRect0014.point2 = CGPointMake(1625, 3037.5);
    drawGradientRect0014.point3 = CGPointMake(1605.5, 3058.5);
    drawGradientRect0014.point4 = CGPointMake(1585.5, 3037.5);
    [vertex0025.drawPrimitives addObject:drawGradientRect0014];

    MWDrawFillCircle *fillCircle0435 = [[MWDrawFillCircle alloc] init];
    fillCircle0435.center = CGPointMake(1632.5, 3008);
    fillCircle0435.radius = 31.5;
    fillCircle0435.fillColor = line0007.color;
    [vertex0025.drawPrimitives addObject:fillCircle0435];
    
    MWDrawFillCircle *fillCircle0436 = [[MWDrawFillCircle alloc] init];
    fillCircle0436.center = CGPointMake(1632.5, 3008);
    fillCircle0436.radius = 14;
    fillCircle0436.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0436];
    
    MWDrawFillCircle *fillCircle0437 = [[MWDrawFillCircle alloc] init];
    fillCircle0437.center = CGPointMake(1577.5, 3067.5);
    fillCircle0437.radius = 31.5;
    fillCircle0437.fillColor = line0005.color;
    [vertex0025.drawPrimitives addObject:fillCircle0437];
    
    MWDrawFillCircle *fillCircle0438 = [[MWDrawFillCircle alloc] init];
    fillCircle0438.center = CGPointMake(1577.5, 3067.5);
    fillCircle0438.radius = 14;
    fillCircle0438.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0438];

    MWDrawLine *drawLine0432 = [[MWDrawLine alloc] init];
    drawLine0432.startPoint = CGPointMake(1632.5, 3008);
    drawLine0432.endPoint = CGPointMake(1577.5, 3067.5);
    drawLine0432.width = 9.5;
    drawLine0432.color = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:drawLine0432];

    // Менделеевская - Новослободская
    MWVertex *vertex0026 = [[MWVertex alloc] init];
    vertex0026.identifier = @"vertex0026";
    vertex0026.developmentName = @"Вершина: Менделеевская - Новослободская";
    [self.vertices addObject:vertex0026];
    
    MWDrawGradientRect *drawGradientRect0015 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0015.startColor = line0009.color;
    drawGradientRect0015.endColor =line0005.color;
    drawGradientRect0015.point1 = CGPointMake(2049, 2331);
    drawGradientRect0015.point2 = CGPointMake(2078, 2331);
    drawGradientRect0015.point3 = CGPointMake(2078, 2353);
    drawGradientRect0015.point4 = CGPointMake(2049, 2353);
    [vertex0026.drawPrimitives addObject:drawGradientRect0015];

    MWDrawFillCircle *fillCircle0439 = [[MWDrawFillCircle alloc] init];
    fillCircle0439.center = CGPointMake(2063.5, 2303);
    fillCircle0439.radius = 31.5;
    fillCircle0439.fillColor = line0009.color;
    [vertex0026.drawPrimitives addObject:fillCircle0439];
    
    MWDrawFillCircle *fillCircle0440 = [[MWDrawFillCircle alloc] init];
    fillCircle0440.center = CGPointMake(2063.5, 2303);
    fillCircle0440.radius = 14;
    fillCircle0440.fillColor = [UIColor whiteColor];
    [vertex0026.drawPrimitives addObject:fillCircle0440];

    MWDrawFillCircle *fillCircle0441 = [[MWDrawFillCircle alloc] init];
    fillCircle0441.center = CGPointMake(2063.5, 2381);
    fillCircle0441.radius = 31.5;
    fillCircle0441.fillColor = line0005.color;
    [vertex0026.drawPrimitives addObject:fillCircle0441];
    
    MWDrawFillCircle *fillCircle0442 = [[MWDrawFillCircle alloc] init];
    fillCircle0442.center = CGPointMake(2063.5, 2381);
    fillCircle0442.radius = 14;
    fillCircle0442.fillColor = [UIColor whiteColor];
    [vertex0026.drawPrimitives addObject:fillCircle0442];

    MWDrawLine *drawLine0433 = [[MWDrawLine alloc] init];
    drawLine0433.startPoint = CGPointMake(2063.5, 2303);
    drawLine0433.endPoint = CGPointMake(2063.5, 2381);
    drawLine0433.width = 9.5;
    drawLine0433.color = [UIColor whiteColor];
    [vertex0026.drawPrimitives addObject:drawLine0433];

    // Проспект Мира
    MWVertex *vertex0027 = [[MWVertex alloc] init];
    vertex0027.identifier = @"vertex0027";
    vertex0027.developmentName = @"Вершина: Проспект Мира";
    [self.vertices addObject:vertex0027];
    
    MWDrawGradientRect *drawGradientRect0016 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0016.startColor = line0006.color;
    drawGradientRect0016.endColor =line0005.color;
    drawGradientRect0016.point1 = CGPointMake(2872, 2282);
    drawGradientRect0016.point2 = CGPointMake(2901, 2282);
    drawGradientRect0016.point3 = CGPointMake(2901, 2304);
    drawGradientRect0016.point4 = CGPointMake(2872, 2304);
    [vertex0027.drawPrimitives addObject:drawGradientRect0016];

    MWDrawFillCircle *fillCircle0443 = [[MWDrawFillCircle alloc] init];
    fillCircle0443.center = CGPointMake(2886.5, 2254.5);
    fillCircle0443.radius = 31.5;
    fillCircle0443.fillColor = line0006.color;
    [vertex0027.drawPrimitives addObject:fillCircle0443];
    
    MWDrawFillCircle *fillCircle0444 = [[MWDrawFillCircle alloc] init];
    fillCircle0444.center = CGPointMake(2886.5, 2254.5);
    fillCircle0444.radius = 14;
    fillCircle0444.fillColor = [UIColor whiteColor];
    [vertex0027.drawPrimitives addObject:fillCircle0444];

    MWDrawFillCircle *fillCircle0445 = [[MWDrawFillCircle alloc] init];
    fillCircle0445.center = CGPointMake(2886.5, 2332);
    fillCircle0445.radius = 31.5;
    fillCircle0445.fillColor = line0005.color;
    [vertex0027.drawPrimitives addObject:fillCircle0445];
    
    MWDrawFillCircle *fillCircle0446 = [[MWDrawFillCircle alloc] init];
    fillCircle0446.center = CGPointMake(2886.5, 2332);
    fillCircle0446.radius = 14;
    fillCircle0446.fillColor = [UIColor whiteColor];
    [vertex0027.drawPrimitives addObject:fillCircle0446];

    MWDrawLine *drawLine0434 = [[MWDrawLine alloc] init];
    drawLine0434.startPoint = CGPointMake(2886.5, 2254.5);
    drawLine0434.endPoint = CGPointMake(2886.5, 2332);
    drawLine0434.width = 9.5;
    drawLine0434.color = [UIColor whiteColor];
    [vertex0027.drawPrimitives addObject:drawLine0434];

    // Таганская - Марксистская
    MWVertex *vertex0028 = [[MWVertex alloc] init];
    vertex0028.identifier = @"vertex0028";
    vertex0028.developmentName = @"Вершина: Таганская - Марксистская";
    [self.vertices addObject:vertex0028];
    
    MWDrawGradientArc *drawGradientArc0021 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0021.startColor = line0007.color;
    drawGradientArc0021.endColor = line0008.color;
    drawGradientArc0021.width = 27;
    drawGradientArc0021.center = CGPointMake(3488.75, 3605.75);
    drawGradientArc0021.startGradient = CGPointMake(3519, 3546);
    drawGradientArc0021.endGradient = CGPointMake(3552, 3627);
    drawGradientArc0021.radius = 53;
    drawGradientArc0021.startDegrees = 298;
    drawGradientArc0021.endDegrees = 17;
    [vertex0028.drawPrimitives addObject:drawGradientArc0021];

    MWDrawGradientArc *drawGradientArc0022 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0022.startColor = line0008.color;
    drawGradientArc0022.endColor = line0005.color;
    drawGradientArc0022.width = 27;
    drawGradientArc0022.center = CGPointMake(3488.75, 3605.75);
    drawGradientArc0022.startGradient = CGPointMake(3509, 3669);
    drawGradientArc0022.endGradient = CGPointMake(3432, 3641);
    drawGradientArc0022.radius = 53;
    drawGradientArc0022.startDegrees = 73;
    drawGradientArc0022.endDegrees = 153;
    [vertex0028.drawPrimitives addObject:drawGradientArc0022];

    MWDrawGradientArc *drawGradientArc0023 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0023.startColor = line0005.color;
    drawGradientArc0023.endColor = line0007.color;
    drawGradientArc0023.width = 27;
    drawGradientArc0023.center = CGPointMake(3488.75, 3605.75);
    drawGradientArc0023.startGradient = CGPointMake(3428, 3576);
    drawGradientArc0023.endGradient = CGPointMake(3459, 3546);
    drawGradientArc0023.radius = 53;
    drawGradientArc0023.startDegrees = 208;
    drawGradientArc0023.endDegrees = 242;
    [vertex0028.drawPrimitives addObject:drawGradientArc0023];

    MWDrawFillCircle *fillCircle0447 = [[MWDrawFillCircle alloc] init];
    fillCircle0447.center = CGPointMake(3488.5, 3553);
    fillCircle0447.radius = 31.5;
    fillCircle0447.fillColor = line0007.color;
    [vertex0028.drawPrimitives addObject:fillCircle0447];
    
    MWDrawFillCircle *fillCircle0448 = [[MWDrawFillCircle alloc] init];
    fillCircle0448.center = CGPointMake(3488.5, 3553);
    fillCircle0448.radius = 14;
    fillCircle0448.fillColor = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:fillCircle0448];

    MWDrawFillCircle *fillCircle0449 = [[MWDrawFillCircle alloc] init];
    fillCircle0449.center = CGPointMake(3436, 3605.5);
    fillCircle0449.radius = 31.5;
    fillCircle0449.fillColor = line0005.color;
    [vertex0028.drawPrimitives addObject:fillCircle0449];
    
    MWDrawFillCircle *fillCircle0450 = [[MWDrawFillCircle alloc] init];
    fillCircle0450.center = CGPointMake(3436, 3605.5);
    fillCircle0450.radius = 14;
    fillCircle0450.fillColor = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:fillCircle0450];

    MWDrawFillCircle *fillCircle0451 = [[MWDrawFillCircle alloc] init];
    fillCircle0451.center = CGPointMake(3526, 3643);
    fillCircle0451.radius = 31.5;
    fillCircle0451.fillColor = line0008.color;
    [vertex0028.drawPrimitives addObject:fillCircle0451];
    
    MWDrawFillCircle *fillCircle0452 = [[MWDrawFillCircle alloc] init];
    fillCircle0452.center = CGPointMake(3526, 3643);
    fillCircle0452.radius = 14;
    fillCircle0452.fillColor = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:fillCircle0452];

    MWDrawArc *drawArc0152 = [[MWDrawArc alloc] init];
    drawArc0152.center = CGPointMake(3488.75, 3605.75);
    drawArc0152.startDegrees = 0;
    drawArc0152.endDegrees = 360;
    drawArc0152.radius = 53;
    drawArc0152.width = 9.5;
    drawArc0152.color = [UIColor whiteColor];
    [vertex0028.drawPrimitives addObject:drawArc0152];
    
    // Новоясеневская
    MWVertex *vertex0029 = [[MWVertex alloc] init];
    vertex0029.identifier = @"vertex0029";
    vertex0029.developmentName = @"Вершина: Новоясеневская / Битцевский парк";
    [self.vertices addObject:vertex0029];
    
    MWDrawGradientRect *drawGradientRect0017 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0017.startColor = line0006.color;
    drawGradientRect0017.endColor =line0012.color;
    drawGradientRect0017.point1 = CGPointMake(1775, 6010);
    drawGradientRect0017.point2 = CGPointMake(1804, 6010);
    drawGradientRect0017.point3 = CGPointMake(1804, 6032);
    drawGradientRect0017.point4 = CGPointMake(1775, 6032);
    [vertex0029.drawPrimitives addObject:drawGradientRect0017];

    MWDrawFillCircle *fillCircle0453 = [[MWDrawFillCircle alloc] init];
    fillCircle0453.center = CGPointMake(1789.5, 5982);
    fillCircle0453.radius = 31.5;
    fillCircle0453.fillColor = line0006.color;
    [vertex0029.drawPrimitives addObject:fillCircle0453];
    
    MWDrawFillCircle *fillCircle0454 = [[MWDrawFillCircle alloc] init];
    fillCircle0454.center = CGPointMake(1789.5, 5982);
    fillCircle0454.radius = 14;
    fillCircle0454.fillColor = [UIColor whiteColor];
    [vertex0029.drawPrimitives addObject:fillCircle0454];

    MWDrawFillCircle *fillCircle0455 = [[MWDrawFillCircle alloc] init];
    fillCircle0455.center = CGPointMake(1789.5, 6060.5);
    fillCircle0455.radius = 31.5;
    fillCircle0455.fillColor = line0012.color;
    [vertex0029.drawPrimitives addObject:fillCircle0455];
    
    MWDrawFillCircle *fillCircle0456 = [[MWDrawFillCircle alloc] init];
    fillCircle0456.center = CGPointMake(1789.5, 6060.5);
    fillCircle0456.radius = 14;
    fillCircle0456.fillColor = [UIColor whiteColor];
    [vertex0029.drawPrimitives addObject:fillCircle0456];

    MWDrawLine *drawLine0435 = [[MWDrawLine alloc] init];
    drawLine0435.startPoint = CGPointMake(1789.5, 5982);
    drawLine0435.endPoint = CGPointMake(1789.5, 6060.5);
    drawLine0435.width = 9.5;
    drawLine0435.color = [UIColor whiteColor];
    [vertex0029.drawPrimitives addObject:drawLine0435];

    // Китай-город
    MWVertex *vertex0030 = [[MWVertex alloc] init];
    vertex0030.identifier = @"vertex0030";
    vertex0030.developmentName = @"Вершина: Китай-город";
    [self.vertices addObject:vertex0030];
    
    MWDrawGradientRect *drawGradientRect0018 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0018.startColor = line0007.color;
    drawGradientRect0018.endColor =line0006.color;
    drawGradientRect0018.point1 = CGPointMake(3055, 3147);
    drawGradientRect0018.point2 = CGPointMake(3065, 3174);
    drawGradientRect0018.point3 = CGPointMake(3045, 3182);
    drawGradientRect0018.point4 = CGPointMake(3034, 3156);
    [vertex0030.drawPrimitives addObject:drawGradientRect0018];
    
    MWDrawFillCircle *fillCircle0457 = [[MWDrawFillCircle alloc] init];
    fillCircle0457.center = CGPointMake(3085.5, 3150);
    fillCircle0457.radius = 31.5;
    fillCircle0457.fillColor = line0007.color;
    [vertex0030.drawPrimitives addObject:fillCircle0457];
    
    MWDrawFillCircle *fillCircle0458 = [[MWDrawFillCircle alloc] init];
    fillCircle0458.center = CGPointMake(3085.5, 3150);
    fillCircle0458.radius = 14;
    fillCircle0458.fillColor = [UIColor whiteColor];
    [vertex0030.drawPrimitives addObject:fillCircle0458];

    MWDrawFillCircle *fillCircle0459 = [[MWDrawFillCircle alloc] init];
    fillCircle0459.center = CGPointMake(3013.5, 3180);
    fillCircle0459.radius = 31.5;
    fillCircle0459.fillColor = line0006.color;
    [vertex0030.drawPrimitives addObject:fillCircle0459];
    
    MWDrawFillCircle *fillCircle0460 = [[MWDrawFillCircle alloc] init];
    fillCircle0460.center = CGPointMake(3013.5, 3180);
    fillCircle0460.radius = 14;
    fillCircle0460.fillColor = [UIColor whiteColor];
    [vertex0030.drawPrimitives addObject:fillCircle0460];

    MWDrawLine *drawLine0436 = [[MWDrawLine alloc] init];
    drawLine0436.startPoint = CGPointMake(3085.5, 3150);
    drawLine0436.endPoint = CGPointMake(3013.5, 3180);
    drawLine0436.width = 9.5;
    drawLine0436.color = [UIColor whiteColor];
    [vertex0030.drawPrimitives addObject:drawLine0436];

    MWDrawFillCircle *fillCircle0465 = [[MWDrawFillCircle alloc] init];
    fillCircle0465.center = CGPointMake(3013.5, 3180);
    fillCircle0465.radius = 7;
    fillCircle0465.fillColor = line0007.color;
    [vertex0030.drawPrimitives addObject:fillCircle0465];
    
    MWDrawFillCircle *fillCircle0466 = [[MWDrawFillCircle alloc] init];
    fillCircle0466.center = CGPointMake(3085.5, 3150);
    fillCircle0466.radius = 7;
    fillCircle0466.fillColor = line0006.color;
    [vertex0030.drawPrimitives addObject:fillCircle0466];

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
    drawGradientRect0019.startColor = line0007.color;
    drawGradientRect0019.endColor =line0010.color;
    drawGradientRect0019.point1 = CGPointMake(3934, 4026);
    drawGradientRect0019.point2 = CGPointMake(3944, 4052);
    drawGradientRect0019.point3 = CGPointMake(3923, 4061);
    drawGradientRect0019.point4 = CGPointMake(3913, 4035);
    [vertex0033.drawPrimitives addObject:drawGradientRect0019];

    MWDrawFillCircle *fillCircle0461 = [[MWDrawFillCircle alloc] init];
    fillCircle0461.center = CGPointMake(3964.5, 4029);
    fillCircle0461.radius = 31.5;
    fillCircle0461.fillColor = line0007.color;
    [vertex0033.drawPrimitives addObject:fillCircle0461];

    MWDrawFillCircle *fillCircle0462 = [[MWDrawFillCircle alloc] init];
    fillCircle0462.center = CGPointMake(3964.5, 4029);
    fillCircle0462.radius = 14;
    fillCircle0462.fillColor = [UIColor whiteColor];
    [vertex0033.drawPrimitives addObject:fillCircle0462];

    MWDrawFillCircle *fillCircle0463 = [[MWDrawFillCircle alloc] init];
    fillCircle0463.center = CGPointMake(3892.5, 4058.5);
    fillCircle0463.radius = 31.5;
    fillCircle0463.fillColor = line0010.color;
    [vertex0033.drawPrimitives addObject:fillCircle0463];
    
    MWDrawFillCircle *fillCircle0464 = [[MWDrawFillCircle alloc] init];
    fillCircle0464.center = CGPointMake(3892.5, 4058.5);
    fillCircle0464.radius = 14;
    fillCircle0464.fillColor = [UIColor whiteColor];
    [vertex0033.drawPrimitives addObject:fillCircle0464];

    MWDrawLine *drawLine0437 = [[MWDrawLine alloc] init];
    drawLine0437.startPoint = CGPointMake(3964.5, 4029);
    drawLine0437.endPoint = CGPointMake(3892.5, 4058.5);
    drawLine0437.width = 9.5;
    drawLine0437.color = [UIColor whiteColor];
    [vertex0033.drawPrimitives addObject:drawLine0437];

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
    
    MWDrawGradientRect *drawGradientRect0020 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0020.startColor = line0010.color;
    drawGradientRect0020.endColor =line0008.color;
    drawGradientRect0020.point1 = CGPointMake(3818, 3483);
    drawGradientRect0020.point2 = CGPointMake(3818, 3455);
    drawGradientRect0020.point3 = CGPointMake(3840, 3454.5);
    drawGradientRect0020.point4 = CGPointMake(3840, 3482.5);
    [vertex0036.drawPrimitives addObject:drawGradientRect0020];

    MWDrawFillCircle *fillCircle0467 = [[MWDrawFillCircle alloc] init];
    fillCircle0467.center = CGPointMake(3868, 3468);
    fillCircle0467.radius = 31.5;
    fillCircle0467.fillColor = line0008.color;
    [vertex0036.drawPrimitives addObject:fillCircle0467];
    
    MWDrawFillCircle *fillCircle0468 = [[MWDrawFillCircle alloc] init];
    fillCircle0468.center = CGPointMake(3868, 3468);
    fillCircle0468.radius = 14;
    fillCircle0468.fillColor = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:fillCircle0468];

    MWDrawFillCircle *fillCircle0469 = [[MWDrawFillCircle alloc] init];
    fillCircle0469.center = CGPointMake(3790.5, 3470);
    fillCircle0469.radius = 31.5;
    fillCircle0469.fillColor = line0010.color;
    [vertex0036.drawPrimitives addObject:fillCircle0469];
    
    MWDrawFillCircle *fillCircle0470 = [[MWDrawFillCircle alloc] init];
    fillCircle0470.center = CGPointMake(3790.5, 3470);
    fillCircle0470.radius = 14;
    fillCircle0470.fillColor = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:fillCircle0470];
    
    MWDrawLine *drawLine0438 = [[MWDrawLine alloc] init];
    drawLine0438.startPoint = CGPointMake(3868, 3468);
    drawLine0438.endPoint = CGPointMake(3790.5, 3470);
    drawLine0438.width = 9.5;
    drawLine0438.color = [UIColor whiteColor];
    [vertex0036.drawPrimitives addObject:drawLine0438];

    // Бульвар Дмитрия Донского - Улица Старокачаловская
    MWVertex *vertex0037 = [[MWVertex alloc] init];
    vertex0037.identifier = @"vertex0037";
    vertex0037.developmentName = @"Вершина: Бульвар Дмитрия Донского - Улица Старокачаловская";
    [self.vertices addObject:vertex0037];

    MWDrawGradientRect *drawGradientRect0021 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0021.startColor = line0012.color;
    drawGradientRect0021.endColor =line0009.color;
    drawGradientRect0021.point1 = CGPointMake(2278, 6326);
    drawGradientRect0021.point2 = CGPointMake(2278, 6298);
    drawGradientRect0021.point3 = CGPointMake(2300, 6298);
    drawGradientRect0021.point4 = CGPointMake(2300, 6326);
    [vertex0037.drawPrimitives addObject:drawGradientRect0021];

    MWDrawFillCircle *fillCircle0471 = [[MWDrawFillCircle alloc] init];
    fillCircle0471.center = CGPointMake(2328, 6312);
    fillCircle0471.radius = 31.5;
    fillCircle0471.fillColor = line0009.color;
    [vertex0037.drawPrimitives addObject:fillCircle0471];
    
    MWDrawFillCircle *fillCircle0472 = [[MWDrawFillCircle alloc] init];
    fillCircle0472.center = CGPointMake(2328, 6312);
    fillCircle0472.radius = 14;
    fillCircle0472.fillColor = [UIColor whiteColor];
    [vertex0037.drawPrimitives addObject:fillCircle0472];

    MWDrawFillCircle *fillCircle0473 = [[MWDrawFillCircle alloc] init];
    fillCircle0473.center = CGPointMake(2250, 6312);
    fillCircle0473.radius = 31.5;
    fillCircle0473.fillColor = line0012.color;
    [vertex0037.drawPrimitives addObject:fillCircle0473];
    
    MWDrawFillCircle *fillCircle0474 = [[MWDrawFillCircle alloc] init];
    fillCircle0474.center = CGPointMake(2250, 6312);
    fillCircle0474.radius = 14;
    fillCircle0474.fillColor = [UIColor whiteColor];
    [vertex0037.drawPrimitives addObject:fillCircle0474];

    MWDrawLine *drawLine0439 = [[MWDrawLine alloc] init];
    drawLine0439.startPoint = CGPointMake(2328, 6312);
    drawLine0439.endPoint = CGPointMake(2250, 6312);
    drawLine0439.width = 9.5;
    drawLine0439.color = [UIColor whiteColor];
    [vertex0037.drawPrimitives addObject:drawLine0439];

    // Севастопольская - Каховская
    MWVertex *vertex0038 = [[MWVertex alloc] init];
    vertex0038.identifier = @"vertex0038";
    vertex0038.developmentName = @"Вершина: Севастопольская - Каховская";
    [self.vertices addObject:vertex0038];
    
    MWDrawGradientRect *drawGradientRect0022 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0022.startColor = line0011.color;
    drawGradientRect0022.endColor =line0009.color;
    drawGradientRect0022.point1 = CGPointMake(2281.5, 5563.5);
    drawGradientRect0022.point2 = CGPointMake(2302.5, 5544.5);
    drawGradientRect0022.point3 = CGPointMake(2317.5, 5559.5);
    drawGradientRect0022.point4 = CGPointMake(2298.5, 5580.5);
    [vertex0038.drawPrimitives addObject:drawGradientRect0022];

    MWDrawFillCircle *fillCircle0475 = [[MWDrawFillCircle alloc] init];
    fillCircle0475.center = CGPointMake(2328, 5589.5);
    fillCircle0475.radius = 31.5;
    fillCircle0475.fillColor = line0009.color;
    [vertex0038.drawPrimitives addObject:fillCircle0475];
    
    MWDrawFillCircle *fillCircle0476 = [[MWDrawFillCircle alloc] init];
    fillCircle0476.center = CGPointMake(2328, 5589.5);
    fillCircle0476.radius = 14;
    fillCircle0476.fillColor = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:fillCircle0476];

    MWDrawFillCircle *fillCircle0477 = [[MWDrawFillCircle alloc] init];
    fillCircle0477.center = CGPointMake(2272.5, 5534);
    fillCircle0477.radius = 31.5;
    fillCircle0477.fillColor = line0011.color;
    [vertex0038.drawPrimitives addObject:fillCircle0477];
    
    MWDrawFillCircle *fillCircle0478 = [[MWDrawFillCircle alloc] init];
    fillCircle0478.center = CGPointMake(2272.5, 5534);
    fillCircle0478.radius = 14;
    fillCircle0478.fillColor = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:fillCircle0478];

    MWDrawLine *drawLine0440 = [[MWDrawLine alloc] init];
    drawLine0440.startPoint = CGPointMake(2328, 5589.5);
    drawLine0440.endPoint = CGPointMake(2272.5, 5534);
    drawLine0440.width = 9.5;
    drawLine0440.color = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:drawLine0440];

    // Цветной бульвар - Трубная
    MWVertex *vertex0039 = [[MWVertex alloc] init];
    vertex0039.identifier = @"vertex0039";
    vertex0039.developmentName = @"Вершина: Цветной бульвар - Трубная";
    [self.vertices addObject:vertex0039];
    
    MWDrawGradientRect *drawGradientRect0023 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0023.startColor = line0009.color;
    drawGradientRect0023.endColor =line0010.color;
    drawGradientRect0023.point1 = CGPointMake(2408, 2621);
    drawGradientRect0023.point2 = CGPointMake(2396, 2596);
    drawGradientRect0023.point3 = CGPointMake(2418, 2587);
    drawGradientRect0023.point4 = CGPointMake(2429, 2613);
    [vertex0039.drawPrimitives addObject:drawGradientRect0023];
    
    MWDrawFillCircle *fillCircle0479 = [[MWDrawFillCircle alloc] init];
    fillCircle0479.center = CGPointMake(2376.5, 2619);
    fillCircle0479.radius = 31.5;
    fillCircle0479.fillColor = line0009.color;
    [vertex0039.drawPrimitives addObject:fillCircle0479];
    
    MWDrawFillCircle *fillCircle0480 = [[MWDrawFillCircle alloc] init];
    fillCircle0480.center = CGPointMake(2376.5, 2619);
    fillCircle0480.radius = 14;
    fillCircle0480.fillColor = [UIColor whiteColor];
    [vertex0039.drawPrimitives addObject:fillCircle0480];

    MWDrawFillCircle *fillCircle0481 = [[MWDrawFillCircle alloc] init];
    fillCircle0481.center = CGPointMake(2448.5, 2589);
    fillCircle0481.radius = 31.5;
    fillCircle0481.fillColor = line0010.color;
    [vertex0039.drawPrimitives addObject:fillCircle0481];

    MWDrawFillCircle *fillCircle0482 = [[MWDrawFillCircle alloc] init];
    fillCircle0482.center = CGPointMake(2448.5, 2589);
    fillCircle0482.radius = 14;
    fillCircle0482.fillColor = [UIColor whiteColor];
    [vertex0039.drawPrimitives addObject:fillCircle0482];

    MWDrawLine *drawLine0441 = [[MWDrawLine alloc] init];
    drawLine0441.startPoint = CGPointMake(2376.5, 2619);
    drawLine0441.endPoint = CGPointMake(2448.5, 2589);
    drawLine0441.width = 9.5;
    drawLine0441.color = [UIColor whiteColor];
    [vertex0039.drawPrimitives addObject:drawLine0441];

    // Алтуфьево
    MWVertex *vertex0040 = [[MWVertex alloc] init];
    vertex0040.identifier = @"vertex0040";
    vertex0040.developmentName = @"Вершина: Алтуфьево";
    [self.vertices addObject:vertex0040];

    // Петровско-Разумовская
    MWVertex *vertex0041 = [[MWVertex alloc] init];
    vertex0041.identifier = @"vertex0041";
    vertex0041.developmentName = @"Вершина: Петровско-Разумовская";
    [self.vertices addObject:vertex0041];
    
    MWDrawGradientRect *drawGradientRect0024 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0024.startColor = line0009.color;
    drawGradientRect0024.endColor =line0010.color;
    drawGradientRect0024.point1 = CGPointMake(2076.5, 1613);
    drawGradientRect0024.point2 = CGPointMake(2106, 1613);
    drawGradientRect0024.point3 = CGPointMake(2106, 1635);
    drawGradientRect0024.point4 = CGPointMake(2076.5, 1635);
    [vertex0041.drawPrimitives addObject:drawGradientRect0024];

    MWDrawFillCircle *fillCircle0483 = [[MWDrawFillCircle alloc] init];
    fillCircle0483.center = CGPointMake(2091.5, 1663);
    fillCircle0483.radius = 31.5;
    fillCircle0483.fillColor = line0010.color;
    [vertex0041.drawPrimitives addObject:fillCircle0483];
    
    MWDrawFillCircle *fillCircle0484 = [[MWDrawFillCircle alloc] init];
    fillCircle0484.center = CGPointMake(2091.5, 1663);
    fillCircle0484.radius = 14;
    fillCircle0484.fillColor = [UIColor whiteColor];
    [vertex0041.drawPrimitives addObject:fillCircle0484];

    MWDrawFillCircle *fillCircle0485 = [[MWDrawFillCircle alloc] init];
    fillCircle0485.center = CGPointMake(2091.5, 1584.5);
    fillCircle0485.radius = 31.5;
    fillCircle0485.fillColor = line0009.color;
    [vertex0041.drawPrimitives addObject:fillCircle0485];
    
    MWDrawFillCircle *fillCircle0486 = [[MWDrawFillCircle alloc] init];
    fillCircle0486.center = CGPointMake(2091.5, 1584.5);
    fillCircle0486.radius = 14;
    fillCircle0486.fillColor = [UIColor whiteColor];
    [vertex0041.drawPrimitives addObject:fillCircle0486];

    MWDrawLine *drawLine0442 = [[MWDrawLine alloc] init];
    drawLine0442.startPoint = CGPointMake(2091.5, 1663);
    drawLine0442.endPoint = CGPointMake(2091.5, 1584.5);
    drawLine0442.width = 9.5;
    drawLine0442.color = [UIColor whiteColor];
    [vertex0041.drawPrimitives addObject:drawLine0442];

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

    MWDrawGradientRect *drawGradientRect0025 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0025.startColor = line0003.color;
    drawGradientRect0025.endColor =line0013.color;
    drawGradientRect0025.point1 = CGPointMake(604, 3786);
    drawGradientRect0025.point2 = CGPointMake(633, 3786);
    drawGradientRect0025.point3 = CGPointMake(633, 3808);
    drawGradientRect0025.point4 = CGPointMake(604, 3808);
    [vertex0043.drawPrimitives addObject:drawGradientRect0025];
    
    MWDrawFillCircle *fillCircle0487 = [[MWDrawFillCircle alloc] init];
    fillCircle0487.center = CGPointMake(618.5, 3758.5);
    fillCircle0487.radius = 31.5;
    fillCircle0487.fillColor = line0003.color;
    [vertex0043.drawPrimitives addObject:fillCircle0487];
    
    MWDrawFillCircle *fillCircle0488 = [[MWDrawFillCircle alloc] init];
    fillCircle0488.center = CGPointMake(618.5, 3758.5);
    fillCircle0488.radius = 14;
    fillCircle0488.fillColor = [UIColor whiteColor];
    [vertex0043.drawPrimitives addObject:fillCircle0488];

    MWDrawFillCircle *fillCircle0489 = [[MWDrawFillCircle alloc] init];
    fillCircle0489.center = CGPointMake(618.5, 3836.5);
    fillCircle0489.radius = 31.5;
    fillCircle0489.fillColor = line0013.color;
    [vertex0043.drawPrimitives addObject:fillCircle0489];
    
    MWDrawFillCircle *fillCircle0490 = [[MWDrawFillCircle alloc] init];
    fillCircle0490.center = CGPointMake(618.5, 3836.5);
    fillCircle0490.radius = 14;
    fillCircle0490.fillColor = [UIColor whiteColor];
    [vertex0043.drawPrimitives addObject:fillCircle0490];
    
    MWDrawLine *drawLine0443 = [[MWDrawLine alloc] init];
    drawLine0443.startPoint = CGPointMake(618.5, 3758.5);
    drawLine0443.endPoint = CGPointMake(618.5, 3836.5);
    drawLine0443.width = 9.5;
    drawLine0443.color = [UIColor whiteColor];
    [vertex0043.drawPrimitives addObject:drawLine0443];

    MWDrawFillCircle *fillCircle0491 = [[MWDrawFillCircle alloc] init];
    fillCircle0491.center = CGPointMake(618.5, 3758.5);
    fillCircle0491.radius = 7;
    fillCircle0491.fillColor = line0013.color;
    [vertex0043.drawPrimitives addObject:fillCircle0491];

    MWDrawFillCircle *fillCircle0492 = [[MWDrawFillCircle alloc] init];
    fillCircle0492.center = CGPointMake(618.5, 3836.5);
    fillCircle0492.radius = 7;
    fillCircle0492.fillColor = line0003.color;
    [vertex0043.drawPrimitives addObject:fillCircle0492];

    // Деловой центр (добавлен 11.04.2014 в версии 2)
    MWVertex *vertex0044 = [[MWVertex alloc] init];
    vertex0044.identifier = @"vertex0044";
    vertex0044.developmentName = @"Вершина: Деловой центр / Выставочная";
    [self.vertices addObject:vertex0044];

    MWDrawGradientArc *drawGradientArc0024 = [[MWDrawGradientArc alloc] init];
    drawGradientArc0024.startColor = line0004.color;
    drawGradientArc0024.endColor = line0013.color;
    drawGradientArc0024.width = 27;
    drawGradientArc0024.center = CGPointMake(965.5, 3381);
    drawGradientArc0024.startGradient = CGPointMake(995, 3317);
    drawGradientArc0024.endGradient = CGPointMake(1029, 3401);
    drawGradientArc0024.radius = 53;
    drawGradientArc0024.startDegrees = 285;
    drawGradientArc0024.endDegrees = 17;
    [vertex0044.drawPrimitives addObject:drawGradientArc0024];
    
    MWDrawFillCircle *fillCircle0493 = [[MWDrawFillCircle alloc] init];
    fillCircle0493.center = CGPointMake(1002.5, 3418);
    fillCircle0493.radius = 31.5;
    fillCircle0493.fillColor = line0013.color;
    [vertex0044.drawPrimitives addObject:fillCircle0493];
    
    MWDrawFillCircle *fillCircle0494 = [[MWDrawFillCircle alloc] init];
    fillCircle0494.center = CGPointMake(1002.5, 3418);
    fillCircle0494.radius = 14;
    fillCircle0494.fillColor = [UIColor whiteColor];
    [vertex0044.drawPrimitives addObject:fillCircle0494];

    MWDrawFillCircle *fillCircle0495 = [[MWDrawFillCircle alloc] init];
    fillCircle0495.center = CGPointMake(965.5, 3328.5);
    fillCircle0495.radius = 31.5;
    fillCircle0495.fillColor = line0004.color;
    [vertex0044.drawPrimitives addObject:fillCircle0495];
    
    MWDrawFillCircle *fillCircle0496 = [[MWDrawFillCircle alloc] init];
    fillCircle0496.center = CGPointMake(965.5, 3328.5);
    fillCircle0496.radius = 14;
    fillCircle0496.fillColor = [UIColor whiteColor];
    [vertex0044.drawPrimitives addObject:fillCircle0496];

    MWDrawArc *drawArc0153 = [[MWDrawArc alloc] init];
    drawArc0153.center = CGPointMake(965.5, 3381);
    drawArc0153.startDegrees = 270;
    drawArc0153.endDegrees = 90;
    drawArc0153.radius = 53;
    drawArc0153.width = 9.5;
    drawArc0153.color = [UIColor whiteColor];
    [vertex0044.drawPrimitives addObject:drawArc0153];

    // Владыкино
    MWVertex *vertex0045 = [[MWVertex alloc] init];
    vertex0045.identifier = @"vertex0045";
    vertex0045.developmentName = @"Вершина: Владыкино";
    [self.vertices addObject:vertex0045];

    // Владыкино CGPointMake(2166.5, 1447.5); Line 9
    // Владыкино CGPointMake(2221.5, 1502.5); Line 14
    
    MWDrawLine *drawLine0444 = [[MWDrawLine alloc] init];
    drawLine0444.startPoint = CGPointMake(2166.5, 1447.5);
    drawLine0444.endPoint = CGPointMake(2221.5, 1502.5);
    drawLine0444.width = 34;
    drawLine0444.color = [UIColor redColor];
    [vertex0045.drawPrimitives addObject:drawLine0444];
    
    MWDrawFillCircle *fillCircle0497 = [[MWDrawFillCircle alloc] init];
    fillCircle0497.center = CGPointMake(2166.5, 1447.5);
    fillCircle0497.radius = 31.5;
    fillCircle0497.fillColor = [UIColor redColor];
    [vertex0045.drawPrimitives addObject:fillCircle0497];
    
    MWDrawFillCircle *fillCircle0498 = [[MWDrawFillCircle alloc] init];
    fillCircle0498.center = CGPointMake(2166.5, 1447.5);
    fillCircle0498.radius = 27;
    fillCircle0498.fillColor = line0009.color;
    [vertex0045.drawPrimitives addObject:fillCircle0498];
    
    MWDrawFillCircle *fillCircle0499 = [[MWDrawFillCircle alloc] init];
    fillCircle0499.center = CGPointMake(2166.5, 1447.5);
    fillCircle0499.radius = 14;
    fillCircle0499.fillColor = [UIColor whiteColor];
    [vertex0045.drawPrimitives addObject:fillCircle0499];
    
    MWDrawFillCircle *fillCircle0500 = [[MWDrawFillCircle alloc] init];
    fillCircle0500.center = CGPointMake(2221.5, 1502.5);
    fillCircle0500.radius = 31.5;
    fillCircle0500.fillColor = [UIColor redColor];
    [vertex0045.drawPrimitives addObject:fillCircle0500];
    
    MWDrawFillCircle *fillCircle0501 = [[MWDrawFillCircle alloc] init];
    fillCircle0501.center = CGPointMake(2221.5, 1502.5);
    fillCircle0501.radius = 27;
    fillCircle0501.fillColor = [UIColor whiteColor];
    [vertex0045.drawPrimitives addObject:fillCircle0501];
    
    MWDrawGradientRect *drawGradientRect0026 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0026.startColor = line0009.color;
    drawGradientRect0026.endColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    drawGradientRect0026.point1 = CGPointMake(2175, 1472);
    drawGradientRect0026.point2 = CGPointMake(2192, 1456);
    drawGradientRect0026.point3 = CGPointMake(2213, 1478);
    drawGradientRect0026.point4 = CGPointMake(2197, 1494);
    [vertex0045.drawPrimitives addObject:drawGradientRect0026];
    
    MWDrawLine *drawLine0445 = [[MWDrawLine alloc] init];
    drawLine0445.startPoint = CGPointMake(2166.5, 1447.5);
    drawLine0445.endPoint = CGPointMake(2221.5, 1502.5);
    drawLine0445.width = 9.5;
    drawLine0445.color = [UIColor whiteColor];
    [vertex0045.drawPrimitives addObject:drawLine0445];
    
    MWDrawFillCircle *fillCircle0502 = [[MWDrawFillCircle alloc] init];
    fillCircle0502.center = CGPointMake(2221.5, 1502.5);
    fillCircle0502.radius = 14.5;
    fillCircle0502.fillColor = [UIColor redColor];
    [vertex0045.drawPrimitives addObject:fillCircle0502];
    
    MWDrawFillCircle *fillCircle0503 = [[MWDrawFillCircle alloc] init];
    fillCircle0503.center = CGPointMake(2221.5, 1502.5);
    fillCircle0503.radius = 11.5;
    fillCircle0503.fillColor = [UIColor whiteColor];
    [vertex0045.drawPrimitives addObject:fillCircle0503];
    
    // Ботанический сад
    MWVertex *vertex0046 = [[MWVertex alloc] init];
    vertex0046.identifier = @"vertex0046";
    vertex0046.developmentName = @"Вершина: Ботанический сад";
    [self.vertices addObject:vertex0046];

    MWDrawFillCircle *fillCircle0504 = [[MWDrawFillCircle alloc] init];
    fillCircle0504.center = CGPointMake(3104, 1570.5);
    fillCircle0504.radius = 31.5;
    fillCircle0504.fillColor = line0014.color;
    [vertex0046.drawPrimitives addObject:fillCircle0504];
    
    MWDrawFillCircle *fillCircle0505 = [[MWDrawFillCircle alloc] init];
    fillCircle0505.center = CGPointMake(3104, 1570.5);
    fillCircle0505.radius = 27;
    fillCircle0505.fillColor = [UIColor whiteColor];
    [vertex0046.drawPrimitives addObject:fillCircle0505];

    MWDrawArc *drawArc0154 = [[MWDrawArc alloc] init];
    drawArc0154.center = CGPointMake(2533, 3241);
    drawArc0154.startDegrees = 287.7;
    drawArc0154.endDegrees = 289.9;
    drawArc0154.radius = 1764.5;
    drawArc0154.width = 21.5;
    drawArc0154.color = [UIColor whiteColor];
    [vertex0046.drawPrimitives addObject:drawArc0154];
    
    MWDrawFillCircle *fillCircle0506 = [[MWDrawFillCircle alloc] init];
    fillCircle0506.center = CGPointMake(3104, 1570.5);
    fillCircle0506.radius = 14.5;
    fillCircle0506.fillColor = line0014.color;
    [vertex0046.drawPrimitives addObject:fillCircle0506];
    
    MWDrawFillCircle *fillCircle0507 = [[MWDrawFillCircle alloc] init];
    fillCircle0507.center = CGPointMake(3104, 1570.5);
    fillCircle0507.radius = 11.5;
    fillCircle0507.fillColor = [UIColor whiteColor];
    [vertex0046.drawPrimitives addObject:fillCircle0507];
    
    MWDrawFillCircle *fillCircle0508 = [[MWDrawFillCircle alloc] init];
    fillCircle0508.center = CGPointMake(3013, 1479);
    fillCircle0508.radius = 31.5;
    fillCircle0508.fillColor = line0006.color;
    [vertex0046.drawPrimitives addObject:fillCircle0508];
    
    MWDrawFillCircle *fillCircle0509 = [[MWDrawFillCircle alloc] init];
    fillCircle0509.center = CGPointMake(3013, 1479);
    fillCircle0509.radius = 14;
    fillCircle0509.fillColor = [UIColor whiteColor];
    [vertex0046.drawPrimitives addObject:fillCircle0509];

    MWDrawFillCircle *fillCircle0510 = [[MWDrawFillCircle alloc] init];
    fillCircle0510.center = CGPointMake(3045.5, 1511.5);
    fillCircle0510.radius = 3.5;
    fillCircle0510.fillColor = line0006.color;
    [vertex0046.drawPrimitives addObject:fillCircle0510];

    MWDrawFillCircle *fillCircle0511 = [[MWDrawFillCircle alloc] init];
    fillCircle0511.center = CGPointMake(3058.5, 1524.5);
    fillCircle0511.radius = 3.5;
    fillCircle0511.fillColor = [UIColor colorWithRed:(241/255.0) green:(93/255.0) blue:(41/255.0) alpha:1];
    [vertex0046.drawPrimitives addObject:fillCircle0511];

    MWDrawFillCircle *fillCircle0512 = [[MWDrawFillCircle alloc] init];
    fillCircle0512.center = CGPointMake(3071.5, 1537.5);
    fillCircle0512.radius = 3.5;
    fillCircle0512.fillColor = [UIColor redColor];
    [vertex0046.drawPrimitives addObject:fillCircle0512];

    MWDrawLine *drawLine0446 = [[MWDrawLine alloc] init];
    drawLine0446.startPoint = CGPointMake(3025, 1568);
    drawLine0446.endPoint = CGPointMake(3079, 1568);
    drawLine0446.width = 50;
    drawLine0446.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [vertex0046.drawPrimitives addObject:drawLine0446];

    MWDrawTextLine *drawTextLine0487 = [[MWDrawTextLine alloc] init];
    drawTextLine0487.text = @"2 мин";
    drawTextLine0487.fontName = @"HelveticaNeue";
    drawTextLine0487.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0487.fontSize = 18;
    drawTextLine0487.origin = CGPointMake(3028, 1544);
    drawTextLine0487.kernSpacing = 0.3;
    [vertex0046.drawPrimitives addObject:drawTextLine0487];
    
    MWDrawTextLine *drawTextLine0488 = [[MWDrawTextLine alloc] init];
    drawTextLine0488.text = @"2 min";
    drawTextLine0488.fontName = @"HelveticaNeue";
    drawTextLine0488.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0488.fontSize = 18;
    drawTextLine0488.origin = CGPointMake(3028, 1568);
    drawTextLine0488.kernSpacing = 0.3;
    [vertex0046.drawPrimitives addObject:drawTextLine0488];
  
    // Локомотив - Черкизовская
    MWVertex *vertex0047 = [[MWVertex alloc] init];
    vertex0047.identifier = @"vertex0047";
    vertex0047.developmentName = @"Вершина: Локомотив - Черкизовская";
    [self.vertices addObject:vertex0047];

    // Локомотив CGPointMake(3632, 1860); Line 14
    // Черкизовская CGPointMake(3577, 1915); Line 1
    
    MWDrawLine *drawLine0447 = [[MWDrawLine alloc] init];
    drawLine0447.startPoint = CGPointMake(3632, 1860);
    drawLine0447.endPoint = CGPointMake(3577, 1915);
    drawLine0447.width = 34;
    drawLine0447.color = [UIColor redColor];
    [vertex0047.drawPrimitives addObject:drawLine0447];

    MWDrawFillCircle *fillCircle0513 = [[MWDrawFillCircle alloc] init];
    fillCircle0513.center = CGPointMake(3577, 1915);
    fillCircle0513.radius = 31.5;
    fillCircle0513.fillColor = [UIColor redColor];
    [vertex0047.drawPrimitives addObject:fillCircle0513];
    
    MWDrawFillCircle *fillCircle0514 = [[MWDrawFillCircle alloc] init];
    fillCircle0514.center = CGPointMake(3577, 1915);
    fillCircle0514.radius = 27;
    fillCircle0514.fillColor = line0001.color;
    [vertex0047.drawPrimitives addObject:fillCircle0514];
    
    MWDrawFillCircle *fillCircle0515 = [[MWDrawFillCircle alloc] init];
    fillCircle0515.center = CGPointMake(3577, 1915);
    fillCircle0515.radius = 14;
    fillCircle0515.fillColor = [UIColor whiteColor];
    [vertex0047.drawPrimitives addObject:fillCircle0515];
    
    MWDrawFillCircle *fillCircle0516 = [[MWDrawFillCircle alloc] init];
    fillCircle0516.center = CGPointMake(3632, 1860);
    fillCircle0516.radius = 31.5;
    fillCircle0516.fillColor = [UIColor redColor];
    [vertex0047.drawPrimitives addObject:fillCircle0516];
    
    MWDrawFillCircle *fillCircle0517 = [[MWDrawFillCircle alloc] init];
    fillCircle0517.center = CGPointMake(3632, 1860);
    fillCircle0517.radius = 27;
    fillCircle0517.fillColor = [UIColor whiteColor];
    [vertex0047.drawPrimitives addObject:fillCircle0517];
    
    MWDrawGradientRect *drawGradientRect0027 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0027.startColor = line0001.color;
    drawGradientRect0027.endColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    drawGradientRect0027.point1 = CGPointMake(3602, 1906);
    drawGradientRect0027.point2 = CGPointMake(3585, 1889);
    drawGradientRect0027.point3 = CGPointMake(3607, 1868.5);
    drawGradientRect0027.point4 = CGPointMake(3623.5, 1884);
    [vertex0047.drawPrimitives addObject:drawGradientRect0027];
    
    MWDrawLine *drawLine0448 = [[MWDrawLine alloc] init];
    drawLine0448.startPoint = CGPointMake(3632, 1860);
    drawLine0448.endPoint = CGPointMake(3577, 1915);
    drawLine0448.width = 9.5;
    drawLine0448.color = [UIColor whiteColor];
    [vertex0047.drawPrimitives addObject:drawLine0448];
    
    MWDrawFillCircle *fillCircle0518 = [[MWDrawFillCircle alloc] init];
    fillCircle0518.center = CGPointMake(3632, 1860);
    fillCircle0518.radius = 14.5;
    fillCircle0518.fillColor = [UIColor redColor];
    [vertex0047.drawPrimitives addObject:fillCircle0518];
    
    MWDrawFillCircle *fillCircle0519 = [[MWDrawFillCircle alloc] init];
    fillCircle0519.center = CGPointMake(3632, 1860);
    fillCircle0519.radius = 11.5;
    fillCircle0519.fillColor = [UIColor whiteColor];
    [vertex0047.drawPrimitives addObject:fillCircle0519];
    
    // Партизанская - Измайловский Парк
    MWVertex *vertex0048 = [[MWVertex alloc] init];
    vertex0048.identifier = @"vertex0048";
    vertex0048.developmentName = @"Вершина: Партизанская - Измайлово";
    [self.vertices addObject:vertex0048];

    MWDrawFillCircle *fillCircle0520 = [[MWDrawFillCircle alloc] init];
    fillCircle0520.center = CGPointMake(4141.5, 2248);
    fillCircle0520.radius = 31.5;
    fillCircle0520.fillColor = line0003.color;
    [vertex0048.drawPrimitives addObject:fillCircle0520];
    
    MWDrawFillCircle *fillCircle0521 = [[MWDrawFillCircle alloc] init];
    fillCircle0521.center = CGPointMake(4141.5, 2248);
    fillCircle0521.radius = 14;
    fillCircle0521.fillColor = [UIColor whiteColor];
    [vertex0048.drawPrimitives addObject:fillCircle0521];

    MWDrawFillCircle *fillCircle0522 = [[MWDrawFillCircle alloc] init];
    fillCircle0522.center = CGPointMake(4050, 2339);
    fillCircle0522.radius = 31.5;
    fillCircle0522.fillColor = line0014.color;
    [vertex0048.drawPrimitives addObject:fillCircle0522];
    
    MWDrawFillCircle *fillCircle0523 = [[MWDrawFillCircle alloc] init];
    fillCircle0523.center = CGPointMake(4050, 2339);
    fillCircle0523.radius = 27;
    fillCircle0523.fillColor = [UIColor whiteColor];
    [vertex0048.drawPrimitives addObject:fillCircle0523];
    
    MWDrawArc *drawArc0155 = [[MWDrawArc alloc] init];
    drawArc0155.center = CGPointMake(2533, 3241);
    drawArc0155.startDegrees = 328.2;
    drawArc0155.endDegrees = 330.3;
    drawArc0155.radius = 1764.5;
    drawArc0155.width = 21.5;
    drawArc0155.color = [UIColor whiteColor];
    [vertex0048.drawPrimitives addObject:drawArc0155];
    
    MWDrawFillCircle *fillCircle0524 = [[MWDrawFillCircle alloc] init];
    fillCircle0524.center = CGPointMake(4050, 2339);
    fillCircle0524.radius = 14.5;
    fillCircle0524.fillColor = line0014.color;
    [vertex0048.drawPrimitives addObject:fillCircle0524];
    
    MWDrawFillCircle *fillCircle0525 = [[MWDrawFillCircle alloc] init];
    fillCircle0525.center = CGPointMake(4050, 2339);
    fillCircle0525.radius = 11.5;
    fillCircle0525.fillColor = [UIColor whiteColor];
    [vertex0048.drawPrimitives addObject:fillCircle0525];
    
    MWDrawFillCircle *fillCircle0526 = [[MWDrawFillCircle alloc] init];
    fillCircle0526.center = CGPointMake(4083, 2306.5);
    fillCircle0526.radius = 3.5;
    fillCircle0526.fillColor = [UIColor redColor];
    [vertex0048.drawPrimitives addObject:fillCircle0526];

    MWDrawFillCircle *fillCircle0527 = [[MWDrawFillCircle alloc] init];
    fillCircle0527.center = CGPointMake(4096, 2293.5);
    fillCircle0527.radius = 3.5;
    fillCircle0527.fillColor = [UIColor colorWithRed:(157/255.0) green:(99/255.0) blue:(111/255.0) alpha:1];
    [vertex0048.drawPrimitives addObject:fillCircle0527];

    MWDrawFillCircle *fillCircle0528 = [[MWDrawFillCircle alloc] init];
    fillCircle0528.center = CGPointMake(4109, 2280);
    fillCircle0528.radius = 3.5;
    fillCircle0528.fillColor = line0003.color;
    [vertex0048.drawPrimitives addObject:fillCircle0528];

    MWDrawTextLine *drawTextLine0489 = [[MWDrawTextLine alloc] init];
    drawTextLine0489.text = @"3 мин";
    drawTextLine0489.fontName = @"HelveticaNeue";
    drawTextLine0489.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0489.fontSize = 18;
    drawTextLine0489.origin = CGPointMake(4050, 2196);
    drawTextLine0489.kernSpacing = 0.3;
    [vertex0048.drawPrimitives addObject:drawTextLine0489];

    MWDrawTextLine *drawTextLine0490 = [[MWDrawTextLine alloc] init];
    drawTextLine0490.text = @"3 min";
    drawTextLine0490.fontName = @"HelveticaNeue";
    drawTextLine0490.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0490.fontSize = 18;
    drawTextLine0490.origin = CGPointMake(4054, 2215);
    drawTextLine0490.kernSpacing = 0.3;
    [vertex0048.drawPrimitives addObject:drawTextLine0490];

    // Шоссе Энтузиастов
    MWVertex *vertex0049 = [[MWVertex alloc] init];
    vertex0049.identifier = @"vertex0049";
    vertex0049.developmentName = @"Вершина: Шоссе Энтузиастов";
    [self.vertices addObject:vertex0049];

    MWDrawFillCircle *fillCircle0529 = [[MWDrawFillCircle alloc] init];
    fillCircle0529.center = CGPointMake(4296, 3171.5);
    fillCircle0529.radius = 31.5;
    fillCircle0529.fillColor = line0014.color;
    [vertex0049.drawPrimitives addObject:fillCircle0529];
    
    MWDrawFillCircle *fillCircle0530 = [[MWDrawFillCircle alloc] init];
    fillCircle0530.center = CGPointMake(4296, 3171.5);
    fillCircle0530.radius = 27;
    fillCircle0530.fillColor = [UIColor whiteColor];
    [vertex0049.drawPrimitives addObject:fillCircle0530];
    
    MWDrawArc *drawArc0156 = [[MWDrawArc alloc] init];
    drawArc0156.center = CGPointMake(4296, 3171.5);
    drawArc0156.startDegrees = 356.7;
    drawArc0156.endDegrees = 358.9;
    drawArc0156.radius = 1764.5;
    drawArc0156.width = 21.5;
    drawArc0156.color = [UIColor whiteColor];
    [vertex0049.drawPrimitives addObject:drawArc0156];
    
    MWDrawFillCircle *fillCircle0531 = [[MWDrawFillCircle alloc] init];
    fillCircle0531.center = CGPointMake(4296, 3171.5);
    fillCircle0531.radius = 14.5;
    fillCircle0531.fillColor = line0014.color;
    [vertex0049.drawPrimitives addObject:fillCircle0531];
    
    MWDrawFillCircle *fillCircle0532 = [[MWDrawFillCircle alloc] init];
    fillCircle0532.center = CGPointMake(4296, 3171.5);
    fillCircle0532.radius = 11.5;
    fillCircle0532.fillColor = [UIColor whiteColor];
    [vertex0049.drawPrimitives addObject:fillCircle0532];
    
    MWDrawFillCircle *fillCircle0533 = [[MWDrawFillCircle alloc] init];
    fillCircle0533.center = CGPointMake(4167, 3171.5);
    fillCircle0533.radius = 31.5;
    fillCircle0533.fillColor = line0008.color;
    [vertex0049.drawPrimitives addObject:fillCircle0533];
    
    MWDrawFillCircle *fillCircle0534 = [[MWDrawFillCircle alloc] init];
    fillCircle0534.center = CGPointMake(4167, 3171.5);
    fillCircle0534.radius = 14;
    fillCircle0534.fillColor = [UIColor whiteColor];
    [vertex0049.drawPrimitives addObject:fillCircle0534];

    MWDrawFillCircle *fillCircle0535 = [[MWDrawFillCircle alloc] init];
    fillCircle0535.center = CGPointMake(4213, 3171.5);
    fillCircle0535.radius = 3.5;
    fillCircle0535.fillColor = line0008.color;
    [vertex0049.drawPrimitives addObject:fillCircle0535];

    MWDrawFillCircle *fillCircle0536 = [[MWDrawFillCircle alloc] init];
    fillCircle0536.center = CGPointMake(4231.5, 3171.5);
    fillCircle0536.radius = 3.5;
    fillCircle0536.fillColor = [UIColor colorWithRed:(246/255.0) green:(139/255.0) blue:(42/255.0) alpha:1];
    [vertex0049.drawPrimitives addObject:fillCircle0536];

    MWDrawFillCircle *fillCircle0537 = [[MWDrawFillCircle alloc] init];
    fillCircle0537.center = CGPointMake(4250, 3171.5);
    fillCircle0537.radius = 3.5;
    fillCircle0537.fillColor = [UIColor redColor];
    [vertex0049.drawPrimitives addObject:fillCircle0537];

    MWDrawTextLine *drawTextLine0491 = [[MWDrawTextLine alloc] init];
    drawTextLine0491.text = @"6 мин";
    drawTextLine0491.fontName = @"HelveticaNeue";
    drawTextLine0491.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0491.fontSize = 18;
    drawTextLine0491.origin = CGPointMake(4209, 3177);
    drawTextLine0491.kernSpacing = 0.7;
    [vertex0049.drawPrimitives addObject:drawTextLine0491];

    MWDrawTextLine *drawTextLine0492 = [[MWDrawTextLine alloc] init];
    drawTextLine0492.text = @"6 min";
    drawTextLine0492.fontName = @"HelveticaNeue";
    drawTextLine0492.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0492.fontSize = 18;
    drawTextLine0492.origin = CGPointMake(4209, 3196);
    drawTextLine0492.kernSpacing = 0.5;
    [vertex0049.drawPrimitives addObject:drawTextLine0492];
    
    // Дубровка
    MWVertex *vertex0050 = [[MWVertex alloc] init];
    vertex0050.identifier = @"vertex0050";
    vertex0050.developmentName = @"Вершина: Дубровка";
    [self.vertices addObject:vertex0050];

    MWDrawFillCircle *fillCircle0538 = [[MWDrawFillCircle alloc] init];
    fillCircle0538.center = CGPointMake(3536, 4555.5);
    fillCircle0538.radius = 31.5;
    fillCircle0538.fillColor = line0010.color;
    [vertex0050.drawPrimitives addObject:fillCircle0538];
    
    MWDrawFillCircle *fillCircle0539 = [[MWDrawFillCircle alloc] init];
    fillCircle0539.center = CGPointMake(3536, 4555.5);
    fillCircle0539.radius = 14;
    fillCircle0539.fillColor = [UIColor whiteColor];
    [vertex0050.drawPrimitives addObject:fillCircle0539];

    MWDrawFillCircle *fillCircle0540 = [[MWDrawFillCircle alloc] init];
    fillCircle0540.center = CGPointMake(3457.5, 4744.5);
    fillCircle0540.radius = 31.5;
    fillCircle0540.fillColor = line0014.color;
    [vertex0050.drawPrimitives addObject:fillCircle0540];

    MWDrawFillCircle *fillCircle0541 = [[MWDrawFillCircle alloc] init];
    fillCircle0541.center = CGPointMake(3457.5, 4744.5);
    fillCircle0541.radius = 27;
    fillCircle0541.fillColor = [UIColor whiteColor];
    [vertex0050.drawPrimitives addObject:fillCircle0541];

    MWDrawArc *drawArc0157 = [[MWDrawArc alloc] init];
    drawArc0157.center = CGPointMake(2533, 3241);
    drawArc0157.startDegrees = 57.3;
    drawArc0157.endDegrees = 59.5;
    drawArc0157.radius = 1764.5;
    drawArc0157.width = 21.5;
    drawArc0157.color = [UIColor whiteColor];
    [vertex0050.drawPrimitives addObject:drawArc0157];

    MWDrawFillCircle *fillCircle0542 = [[MWDrawFillCircle alloc] init];
    fillCircle0542.center = CGPointMake(3457.5, 4744.5);
    fillCircle0542.radius = 14.5;
    fillCircle0542.fillColor = line0014.color;
    [vertex0050.drawPrimitives addObject:fillCircle0542];

    MWDrawFillCircle *fillCircle0543 = [[MWDrawFillCircle alloc] init];
    fillCircle0543.center = CGPointMake(3457.5, 4744.5);
    fillCircle0543.radius = 11.5;
    fillCircle0543.fillColor = [UIColor whiteColor];
    [vertex0050.drawPrimitives addObject:fillCircle0543];

    MWDrawFillCircle *fillCircle0544 = [[MWDrawFillCircle alloc] init];
    fillCircle0544.center = CGPointMake(3475, 4701.5);
    fillCircle0544.radius = 3.5;
    fillCircle0544.fillColor = [UIColor redColor];
    [vertex0050.drawPrimitives addObject:fillCircle0544];

    MWDrawFillCircle *fillCircle0545 = [[MWDrawFillCircle alloc] init];
    fillCircle0545.center = CGPointMake(3482.5, 4684.5);
    fillCircle0545.radius = 3.5;
    fillCircle0545.fillColor = [UIColor colorWithRed:(229/255.0) green:(96/255.0) blue:(40/255.0) alpha:1];
    [vertex0050.drawPrimitives addObject:fillCircle0545];

    MWDrawFillCircle *fillCircle0546 = [[MWDrawFillCircle alloc] init];
    fillCircle0546.center = CGPointMake(3489.5, 4667);
    fillCircle0546.radius = 3.5;
    fillCircle0546.fillColor = [UIColor colorWithRed:(221/255.0) green:(122/255.0) blue:(45/255.0) alpha:1];
    [vertex0050.drawPrimitives addObject:fillCircle0546];

    MWDrawFillCircle *fillCircle0547 = [[MWDrawFillCircle alloc] init];
    fillCircle0547.center = CGPointMake(3496.5, 4649.5);
    fillCircle0547.radius = 3.5;
    fillCircle0547.fillColor = [UIColor colorWithRed:(212/255.0) green:(145/255.0) blue:(50/255.0) alpha:1];
    [vertex0050.drawPrimitives addObject:fillCircle0547];

    MWDrawFillCircle *fillCircle0548 = [[MWDrawFillCircle alloc] init];
    fillCircle0548.center = CGPointMake(3504, 4632.5);
    fillCircle0548.radius = 3.5;
    fillCircle0548.fillColor = [UIColor colorWithRed:(204/255.0) green:(166/255.0) blue:(55/255.0) alpha:1];
    [vertex0050.drawPrimitives addObject:fillCircle0548];

    MWDrawFillCircle *fillCircle0549 = [[MWDrawFillCircle alloc] init];
    fillCircle0549.center = CGPointMake(3511, 4615);
    fillCircle0549.radius = 3.5;
    fillCircle0549.fillColor = [UIColor colorWithRed:(194/255.0) green:(188/255.0) blue:(63/255.0) alpha:1];
    [vertex0050.drawPrimitives addObject:fillCircle0549];

    MWDrawFillCircle *fillCircle0550 = [[MWDrawFillCircle alloc] init];
    fillCircle0550.center = CGPointMake(3518.5, 4598);
    fillCircle0550.radius = 3.5;
    fillCircle0550.fillColor = line0010.color;
    [vertex0050.drawPrimitives addObject:fillCircle0550];

    MWDrawTextLine *drawTextLine0493 = [[MWDrawTextLine alloc] init];
    drawTextLine0493.text = @"9 мин";
    drawTextLine0493.fontName = @"HelveticaNeue";
    drawTextLine0493.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0493.fontSize = 18;
    drawTextLine0493.origin = CGPointMake(3402, 4609);
    drawTextLine0493.kernSpacing = 0.8;
    [vertex0050.drawPrimitives addObject:drawTextLine0493];

    MWDrawTextLine *drawTextLine0494 = [[MWDrawTextLine alloc] init];
    drawTextLine0494.text = @"9 min";
    drawTextLine0494.fontName = @"HelveticaNeue";
    drawTextLine0494.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0494.fontSize = 18;
    drawTextLine0494.origin = CGPointMake(3405, 4628);
    drawTextLine0494.kernSpacing = 0.7;
    [vertex0050.drawPrimitives addObject:drawTextLine0494];

    // Автозаводская
    MWVertex *vertex0051 = [[MWVertex alloc] init];
    vertex0051.identifier = @"vertex0051";
    vertex0051.developmentName = @"Вершина: Автозаводская";
    [self.vertices addObject:vertex0051];

    MWDrawFillCircle *fillCircle0551 = [[MWDrawFillCircle alloc] init];
    fillCircle0551.center = CGPointMake(3022.5, 4936);
    fillCircle0551.radius = 31.5;
    fillCircle0551.fillColor = line0014.color;
    [vertex0051.drawPrimitives addObject:fillCircle0551];
    
    MWDrawFillCircle *fillCircle0552 = [[MWDrawFillCircle alloc] init];
    fillCircle0552.center = CGPointMake(3022.5, 4936);
    fillCircle0552.radius = 27;
    fillCircle0552.fillColor = [UIColor whiteColor];
    [vertex0051.drawPrimitives addObject:fillCircle0552];
    
    MWDrawArc *drawArc0158 = [[MWDrawArc alloc] init];
    drawArc0158.center = CGPointMake(2533, 3241);
    drawArc0158.startDegrees = 72.8;
    drawArc0158.endDegrees = 75.0;
    drawArc0158.radius = 1764.5;
    drawArc0158.width = 21.5;
    drawArc0158.color = [UIColor whiteColor];
    [vertex0051.drawPrimitives addObject:drawArc0158];
    
    MWDrawFillCircle *fillCircle0553 = [[MWDrawFillCircle alloc] init];
    fillCircle0553.center = CGPointMake(3022.5, 4936);
    fillCircle0553.radius = 14.5;
    fillCircle0553.fillColor = line0014.color;
    [vertex0051.drawPrimitives addObject:fillCircle0553];
    
    MWDrawFillCircle *fillCircle0554 = [[MWDrawFillCircle alloc] init];
    fillCircle0554.center = CGPointMake(3022.5, 4936);
    fillCircle0554.radius = 11.5;
    fillCircle0554.fillColor = [UIColor whiteColor];
    [vertex0051.drawPrimitives addObject:fillCircle0554];

    MWDrawFillCircle *fillCircle0555 = [[MWDrawFillCircle alloc] init];
    fillCircle0555.center = CGPointMake(2931, 4844.5);
    fillCircle0555.radius = 31.5;
    fillCircle0555.fillColor = line0002.color;
    [vertex0051.drawPrimitives addObject:fillCircle0555];

    MWDrawFillCircle *fillCircle0556 = [[MWDrawFillCircle alloc] init];
    fillCircle0556.center = CGPointMake(2931, 4844.5);
    fillCircle0556.radius = 14;
    fillCircle0556.fillColor = [UIColor whiteColor];
    [vertex0051.drawPrimitives addObject:fillCircle0556];

    MWDrawFillCircle *fillCircle0557 = [[MWDrawFillCircle alloc] init];
    fillCircle0557.center = CGPointMake(2963.5, 4877.5);
    fillCircle0557.radius = 3.5;
    fillCircle0557.fillColor = line0002.color;
    [vertex0051.drawPrimitives addObject:fillCircle0557];

    MWDrawFillCircle *fillCircle0558 = [[MWDrawFillCircle alloc] init];
    fillCircle0558.center = CGPointMake(2976.5, 4890);
    fillCircle0558.radius = 3.5;
    fillCircle0558.fillColor = [UIColor colorWithRed:(177/255.0) green:(137/255.0) blue:(63/255.0) alpha:1];
    [vertex0051.drawPrimitives addObject:fillCircle0558];

    MWDrawFillCircle *fillCircle0559 = [[MWDrawFillCircle alloc] init];
    fillCircle0559.center = CGPointMake(2988.5, 4903.5);
    fillCircle0559.radius = 3.5;
    fillCircle0559.fillColor = [UIColor redColor];
    [vertex0051.drawPrimitives addObject:fillCircle0559];

    MWDrawLine *drawLine0449 = [[MWDrawLine alloc] init];
    drawLine0449.startPoint = CGPointMake(2910, 4921);
    drawLine0449.endPoint = CGPointMake(2943, 4921);
    drawLine0449.width = 36;
    drawLine0449.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [vertex0051.drawPrimitives addObject:drawLine0449];

    MWDrawTextLine *drawTextLine0495 = [[MWDrawTextLine alloc] init];
    drawTextLine0495.text = @"9 мин";
    drawTextLine0495.fontName = @"HelveticaNeue";
    drawTextLine0495.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0495.fontSize = 18;
    drawTextLine0495.origin = CGPointMake(2892, 4898);
    drawTextLine0495.kernSpacing = 1.0;
    [vertex0051.drawPrimitives addObject:drawTextLine0495];

    MWDrawTextLine *drawTextLine0496 = [[MWDrawTextLine alloc] init];
    drawTextLine0496.text = @"9 min";
    drawTextLine0496.fontName = @"HelveticaNeue";
    drawTextLine0496.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0496.fontSize = 18;
    drawTextLine0496.origin = CGPointMake(2896, 4917);
    drawTextLine0496.kernSpacing = 1.0;
    [vertex0051.drawPrimitives addObject:drawTextLine0496];

    // Ленинский проспект - Пл. Гагарина
    MWVertex *vertex0052 = [[MWVertex alloc] init];
    vertex0052.identifier = @"vertex0052";
    vertex0052.developmentName = @"Вершина: Ленинский проспект - Площадь Гагарина";
    [self.vertices addObject:vertex0052];

    // Ленинский проспект CGPointMake(1722, 4723.5); Line 6
    // Площадь Гагарина CGPointMake(1666, 4778.5); Line 14
    
    MWDrawLine *drawLine0450 = [[MWDrawLine alloc] init];
    drawLine0450.startPoint = CGPointMake(1722, 4723.5);
    drawLine0450.endPoint = CGPointMake(1666, 4778.5);
    drawLine0450.width = 34;
    drawLine0450.color = [UIColor redColor];
    [vertex0052.drawPrimitives addObject:drawLine0450];
    
    MWDrawFillCircle *fillCircle0560 = [[MWDrawFillCircle alloc] init];
    fillCircle0560.center = CGPointMake(1722, 4723.5);
    fillCircle0560.radius = 31.5;
    fillCircle0560.fillColor = [UIColor redColor];
    [vertex0052.drawPrimitives addObject:fillCircle0560];
    
    MWDrawFillCircle *fillCircle0561 = [[MWDrawFillCircle alloc] init];
    fillCircle0561.center = CGPointMake(1722, 4723.5);
    fillCircle0561.radius = 27;
    fillCircle0561.fillColor = line0006.color;
    [vertex0052.drawPrimitives addObject:fillCircle0561];
    
    MWDrawFillCircle *fillCircle0562 = [[MWDrawFillCircle alloc] init];
    fillCircle0562.center = CGPointMake(1722, 4723.5);
    fillCircle0562.radius = 14;
    fillCircle0562.fillColor = [UIColor whiteColor];
    [vertex0052.drawPrimitives addObject:fillCircle0562];
    
    MWDrawFillCircle *fillCircle0563 = [[MWDrawFillCircle alloc] init];
    fillCircle0563.center = CGPointMake(1666, 4778.5);
    fillCircle0563.radius = 31.5;
    fillCircle0563.fillColor = [UIColor redColor];
    [vertex0052.drawPrimitives addObject:fillCircle0563];
    
    MWDrawFillCircle *fillCircle0564 = [[MWDrawFillCircle alloc] init];
    fillCircle0564.center = CGPointMake(1666, 4778.5);
    fillCircle0564.radius = 27;
    fillCircle0564.fillColor = [UIColor whiteColor];
    [vertex0052.drawPrimitives addObject:fillCircle0564];
    
    MWDrawGradientRect *drawGradientRect0028 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0028.startColor = line0006.color;
    drawGradientRect0028.endColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    drawGradientRect0028.point1 = CGPointMake(1697, 4731);
    drawGradientRect0028.point2 = CGPointMake(1713, 4749);
    drawGradientRect0028.point3 = CGPointMake(1691, 4771);
    drawGradientRect0028.point4 = CGPointMake(1674, 4754);
    [vertex0052.drawPrimitives addObject:drawGradientRect0028];
    
    MWDrawLine *drawLine0451 = [[MWDrawLine alloc] init];
    drawLine0451.startPoint = CGPointMake(1666, 4778.5);
    drawLine0451.endPoint = CGPointMake(1722, 4723.5);
    drawLine0451.width = 9.5;
    drawLine0451.color = [UIColor whiteColor];
    [vertex0052.drawPrimitives addObject:drawLine0451];
    
    MWDrawFillCircle *fillCircle0565 = [[MWDrawFillCircle alloc] init];
    fillCircle0565.center = CGPointMake(1666, 4778.5);
    fillCircle0565.radius = 14.5;
    fillCircle0565.fillColor = [UIColor redColor];
    [vertex0052.drawPrimitives addObject:fillCircle0565];
    
    MWDrawFillCircle *fillCircle0566 = [[MWDrawFillCircle alloc] init];
    fillCircle0566.center = CGPointMake(1666, 4778.5);
    fillCircle0566.radius = 11.5;
    fillCircle0566.fillColor = [UIColor whiteColor];
    [vertex0052.drawPrimitives addObject:fillCircle0566];
    
    // Спортивная - Лужники
    MWVertex *vertex0053 = [[MWVertex alloc] init];
    vertex0053.identifier = @"vertex0053";
    vertex0053.developmentName = @"Вершина: Спортивная - Лужники";
    [self.vertices addObject:vertex0053];

    MWDrawFillCircle *fillCircle0567 = [[MWDrawFillCircle alloc] init];
    fillCircle0567.center = CGPointMake(1117, 4498);
    fillCircle0567.radius = 31.5;
    fillCircle0567.fillColor = line0001.color;
    [vertex0053.drawPrimitives addObject:fillCircle0567];
    
    MWDrawFillCircle *fillCircle0568 = [[MWDrawFillCircle alloc] init];
    fillCircle0568.center = CGPointMake(1117, 4498);
    fillCircle0568.radius = 14;
    fillCircle0568.fillColor = [UIColor whiteColor];
    [vertex0053.drawPrimitives addObject:fillCircle0568];

    MWDrawFillCircle *fillCircle0569 = [[MWDrawFillCircle alloc] init];
    fillCircle0569.center = CGPointMake(1208.5, 4407);
    fillCircle0569.radius = 31.5;
    fillCircle0569.fillColor = line0014.color;
    [vertex0053.drawPrimitives addObject:fillCircle0569];

    MWDrawFillCircle *fillCircle0570 = [[MWDrawFillCircle alloc] init];
    fillCircle0570.center = CGPointMake(1208.5, 4407);
    fillCircle0570.radius = 27;
    fillCircle0570.fillColor = [UIColor whiteColor];
    [vertex0053.drawPrimitives addObject:fillCircle0570];

    MWDrawArc *drawArc0159 = [[MWDrawArc alloc] init];
    drawArc0159.center = CGPointMake(2533, 3241);
    drawArc0159.startDegrees = 137.5;
    drawArc0159.endDegrees = 139.9;
    drawArc0159.radius = 1764.5;
    drawArc0159.width = 21.5;
    drawArc0159.color = [UIColor whiteColor];
    [vertex0053.drawPrimitives addObject:drawArc0159];

    MWDrawFillCircle *fillCircle0571 = [[MWDrawFillCircle alloc] init];
    fillCircle0571.center = CGPointMake(1208.5, 4407);
    fillCircle0571.radius = 14.5;
    fillCircle0571.fillColor = line0014.color;
    [vertex0053.drawPrimitives addObject:fillCircle0571];

    MWDrawFillCircle *fillCircle0572 = [[MWDrawFillCircle alloc] init];
    fillCircle0572.center = CGPointMake(1208.5, 4407);
    fillCircle0572.radius = 11.5;
    fillCircle0572.fillColor = [UIColor whiteColor];
    [vertex0053.drawPrimitives addObject:fillCircle0572];

    MWDrawFillCircle *fillCircle0573 = [[MWDrawFillCircle alloc] init];
    fillCircle0573.center = CGPointMake(1150, 4465.5);
    fillCircle0573.radius = 3.5;
    fillCircle0573.fillColor = [UIColor redColor];
    [vertex0053.drawPrimitives addObject:fillCircle0573];

    MWDrawFillCircle *fillCircle0574 = [[MWDrawFillCircle alloc] init];
    fillCircle0574.center = CGPointMake(1162.5, 4452.5);
    fillCircle0574.radius = 3.5;
    fillCircle0574.fillColor = [UIColor redColor];
    [vertex0053.drawPrimitives addObject:fillCircle0574];

    MWDrawFillCircle *fillCircle0575 = [[MWDrawFillCircle alloc] init];
    fillCircle0575.center = CGPointMake(1176, 4439.5);
    fillCircle0575.radius = 3.5;
    fillCircle0575.fillColor = [UIColor redColor];
    [vertex0053.drawPrimitives addObject:fillCircle0575];

    MWDrawLine *drawLine0452 = [[MWDrawLine alloc] init];
    drawLine0452.startPoint = CGPointMake(1218, 4475);
    drawLine0452.endPoint = CGPointMake(1338, 4475);
    drawLine0452.width = 40;
    drawLine0452.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [vertex0053.drawPrimitives addObject:drawLine0452];

    MWDrawTextLine *drawTextLine0497 = [[MWDrawTextLine alloc] init];
    drawTextLine0497.text = @"3 мин";
    drawTextLine0497.fontName = @"HelveticaNeue";
    drawTextLine0497.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0497.fontSize = 18;
    drawTextLine0497.origin = CGPointMake(1212.5, 4453);
    drawTextLine0497.kernSpacing = 0.8;
    [vertex0053.drawPrimitives addObject:drawTextLine0497];

    MWDrawTextLine *drawTextLine0498 = [[MWDrawTextLine alloc] init];
    drawTextLine0498.text = @"3 min";
    drawTextLine0498.fontName = @"HelveticaNeue";
    drawTextLine0498.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0498.fontSize = 18;
    drawTextLine0498.origin = CGPointMake(1212.5, 4472);
    drawTextLine0498.kernSpacing = 0.8;
    [vertex0053.drawPrimitives addObject:drawTextLine0498];
    
    // Кутузовская
    MWVertex *vertex0054 = [[MWVertex alloc] init];
    vertex0054.identifier = @"vertex0054";
    vertex0054.developmentName = @"Вершина: Кутузовская";
    [self.vertices addObject:vertex0054];

    // Кутузовская CGPointMake(742.5, 3618.5); Line 4
    // Кутузовская CGPointMake(797.5, 3563.5); Line 14
    
    MWDrawLine *drawLine0453 = [[MWDrawLine alloc] init];
    drawLine0453.startPoint = CGPointMake(742.5, 3618.5);
    drawLine0453.endPoint = CGPointMake(797.5, 3563.5);
    drawLine0453.width = 34;
    drawLine0453.color = [UIColor redColor];
    [vertex0054.drawPrimitives addObject:drawLine0453];
    
    MWDrawFillCircle *fillCircle0576 = [[MWDrawFillCircle alloc] init];
    fillCircle0576.center = CGPointMake(742.5, 3618.5);
    fillCircle0576.radius = 31.5;
    fillCircle0576.fillColor = [UIColor redColor];
    [vertex0054.drawPrimitives addObject:fillCircle0576];
    
    MWDrawFillCircle *fillCircle0577 = [[MWDrawFillCircle alloc] init];
    fillCircle0577.center = CGPointMake(742.5, 3618.5);
    fillCircle0577.radius = 27;
    fillCircle0577.fillColor = line0004.color;
    [vertex0054.drawPrimitives addObject:fillCircle0577];
    
    MWDrawFillCircle *fillCircle0578 = [[MWDrawFillCircle alloc] init];
    fillCircle0578.center = CGPointMake(742.5, 3618.5);
    fillCircle0578.radius = 14;
    fillCircle0578.fillColor = [UIColor whiteColor];
    [vertex0054.drawPrimitives addObject:fillCircle0578];
    
    MWDrawFillCircle *fillCircle0579 = [[MWDrawFillCircle alloc] init];
    fillCircle0579.center = CGPointMake(797.5, 3563.5);
    fillCircle0579.radius = 31.5;
    fillCircle0579.fillColor = [UIColor redColor];
    [vertex0054.drawPrimitives addObject:fillCircle0579];
    
    MWDrawFillCircle *fillCircle0580 = [[MWDrawFillCircle alloc] init];
    fillCircle0580.center = CGPointMake(797.5, 3563.5);
    fillCircle0580.radius = 27;
    fillCircle0580.fillColor = [UIColor whiteColor];
    [vertex0054.drawPrimitives addObject:fillCircle0580];
    
    MWDrawGradientRect *drawGradientRect0029 = [[MWDrawGradientRect alloc] init];
    drawGradientRect0029.startColor = line0004.color;
    drawGradientRect0029.endColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    drawGradientRect0029.point1 = CGPointMake(768, 3611);
    drawGradientRect0029.point2 = CGPointMake(750, 3593);
    drawGradientRect0029.point3 = CGPointMake(772, 3572);
    drawGradientRect0029.point4 = CGPointMake(790, 3589);
    [vertex0054.drawPrimitives addObject:drawGradientRect0029];
    
    MWDrawLine *drawLine0454 = [[MWDrawLine alloc] init];
    drawLine0454.startPoint = CGPointMake(742.5, 3618.5);
    drawLine0454.endPoint = CGPointMake(797.5, 3563.5);
    drawLine0454.width = 9.5;
    drawLine0454.color = [UIColor whiteColor];
    [vertex0054.drawPrimitives addObject:drawLine0454];
    
    MWDrawFillCircle *fillCircle0581 = [[MWDrawFillCircle alloc] init];
    fillCircle0581.center = CGPointMake(797.5, 3563.5);
    fillCircle0581.radius = 14.5;
    fillCircle0581.fillColor = [UIColor redColor];
    [vertex0054.drawPrimitives addObject:fillCircle0581];
    
    MWDrawFillCircle *fillCircle0582 = [[MWDrawFillCircle alloc] init];
    fillCircle0582.center = CGPointMake(797.5, 3563.5);
    fillCircle0582.radius = 11.5;
    fillCircle0582.fillColor = [UIColor whiteColor];
    [vertex0054.drawPrimitives addObject:fillCircle0582];
    
    // Полежаевская - Хорошёво
    MWVertex *vertex0055 = [[MWVertex alloc] init];
    vertex0055.identifier = @"vertex0055";
    vertex0055.developmentName = @"Вершина: Полежаевская - Хорошёво";
    [self.vertices addObject:vertex0055];
    
    MWDrawFillCircle *fillCircle0583 = [[MWDrawFillCircle alloc] init];
    fillCircle0583.center = CGPointMake(1030.5, 2734.5);
    fillCircle0583.radius = 31.5;
    fillCircle0583.fillColor = line0007.color;
    [vertex0055.drawPrimitives addObject:fillCircle0583];
    
    MWDrawFillCircle *fillCircle0584 = [[MWDrawFillCircle alloc] init];
    fillCircle0584.center = CGPointMake(1030.5, 2734.5);
    fillCircle0584.radius = 14;
    fillCircle0584.fillColor = [UIColor whiteColor];
    [vertex0055.drawPrimitives addObject:fillCircle0584];

    MWDrawFillCircle *fillCircle0585 = [[MWDrawFillCircle alloc] init];
    fillCircle0585.center = CGPointMake(830, 2774.5);
    fillCircle0585.radius = 31.5;
    fillCircle0585.fillColor = line0014.color;
    [vertex0055.drawPrimitives addObject:fillCircle0585];
    
    MWDrawFillCircle *fillCircle0586 = [[MWDrawFillCircle alloc] init];
    fillCircle0586.center = CGPointMake(830, 2774.5);
    fillCircle0586.radius = 27;
    fillCircle0586.fillColor = [UIColor whiteColor];
    [vertex0055.drawPrimitives addObject:fillCircle0586];
    
    MWDrawArc *drawArc0160 = [[MWDrawArc alloc] init];
    drawArc0160.center = CGPointMake(2533, 3241);
    drawArc0160.startDegrees = 194.2;
    drawArc0160.endDegrees = 196.6;
    drawArc0160.radius = 1764.5;
    drawArc0160.width = 21.5;
    drawArc0160.color = [UIColor whiteColor];
    [vertex0055.drawPrimitives addObject:drawArc0160];
    
    MWDrawFillCircle *fillCircle0587 = [[MWDrawFillCircle alloc] init];
    fillCircle0587.center = CGPointMake(830, 2774.5);
    fillCircle0587.radius = 14.5;
    fillCircle0587.fillColor = line0014.color;
    [vertex0055.drawPrimitives addObject:fillCircle0587];
    
    MWDrawFillCircle *fillCircle0588 = [[MWDrawFillCircle alloc] init];
    fillCircle0588.center = CGPointMake(830, 2774.5);
    fillCircle0588.radius = 11.5;
    fillCircle0588.fillColor = [UIColor whiteColor];
    [vertex0055.drawPrimitives addObject:fillCircle0588];

    MWDrawFillCircle *fillCircle0589 = [[MWDrawFillCircle alloc] init];
    fillCircle0589.center = CGPointMake(875.5, 2765);
    fillCircle0589.radius = 3.5;
    fillCircle0589.fillColor = [UIColor redColor];
    [vertex0055.drawPrimitives addObject:fillCircle0589];

    MWDrawFillCircle *fillCircle0590 = [[MWDrawFillCircle alloc] init];
    fillCircle0590.center = CGPointMake(894, 2761.5);
    fillCircle0590.radius = 3.5;
    fillCircle0590.fillColor = [UIColor colorWithRed:(220/255.0) green:(53/255.0) blue:(61/255.0) alpha:1];
    [vertex0055.drawPrimitives addObject:fillCircle0590];

    MWDrawFillCircle *fillCircle0591 = [[MWDrawFillCircle alloc] init];
    fillCircle0591.center = CGPointMake(912, 2758);
    fillCircle0591.radius = 3.5;
    fillCircle0591.fillColor = [UIColor colorWithRed:(207/255.0) green:(59/255.0) blue:(80/255.0) alpha:1];
    [vertex0055.drawPrimitives addObject:fillCircle0591];

    MWDrawFillCircle *fillCircle0592 = [[MWDrawFillCircle alloc] init];
    fillCircle0592.center = CGPointMake(930.5, 2754);
    fillCircle0592.radius = 3.5;
    fillCircle0592.fillColor = [UIColor colorWithRed:(192/255.0) green:(62/255.0) blue:(98/255.0) alpha:1];
    [vertex0055.drawPrimitives addObject:fillCircle0592];

    MWDrawFillCircle *fillCircle0593 = [[MWDrawFillCircle alloc] init];
    fillCircle0593.center = CGPointMake(949, 2750.5);
    fillCircle0593.radius = 3.5;
    fillCircle0593.fillColor = [UIColor colorWithRed:(176/255.0) green:(66/255.0) blue:(115/255.0) alpha:1];
    [vertex0055.drawPrimitives addObject:fillCircle0593];
    
    MWDrawFillCircle *fillCircle0594 = [[MWDrawFillCircle alloc] init];
    fillCircle0594.center = CGPointMake(967, 2747);
    fillCircle0594.radius = 3.5;
    fillCircle0594.fillColor = [UIColor colorWithRed:(161/255.0) green:(68/255.0) blue:(133/255.0) alpha:1];
    [vertex0055.drawPrimitives addObject:fillCircle0594];

    MWDrawFillCircle *fillCircle0595 = [[MWDrawFillCircle alloc] init];
    fillCircle0595.center = CGPointMake(985.5, 2743);
    fillCircle0595.radius = 3.5;
    fillCircle0595.fillColor = line0007.color;
    [vertex0055.drawPrimitives addObject:fillCircle0595];

    MWDrawTextLine *drawTextLine0499 = [[MWDrawTextLine alloc] init];
    drawTextLine0499.text = @"8 мин";
    drawTextLine0499.fontName = @"HelveticaNeue";
    drawTextLine0499.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0499.fontSize = 18;
    drawTextLine0499.origin = CGPointMake(931, 2758);
    drawTextLine0499.kernSpacing = 0.8;
    [vertex0055.drawPrimitives addObject:drawTextLine0499];
    
    MWDrawTextLine *drawTextLine0500 = [[MWDrawTextLine alloc] init];
    drawTextLine0500.text = @"8 min";
    drawTextLine0500.fontName = @"HelveticaNeue";
    drawTextLine0500.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0500.fontSize = 18;
    drawTextLine0500.origin = CGPointMake(931, 2776);
    drawTextLine0500.kernSpacing = 0.8;
    [vertex0055.drawPrimitives addObject:drawTextLine0500];

    // Октябрьское поле - Ходынка
    MWVertex *vertex0056 = [[MWVertex alloc] init];
    vertex0056.identifier = @"vertex0056";
    vertex0056.developmentName = @"Вершина: Октябрьское поле - Панфиловская";
    [self.vertices addObject:vertex0056];

    MWDrawFillCircle *fillCircle0596 = [[MWDrawFillCircle alloc] init];
    fillCircle0596.center = CGPointMake(756, 2405.5);
    fillCircle0596.radius = 31.5;
    fillCircle0596.fillColor = line0007.color;
    [vertex0056.drawPrimitives addObject:fillCircle0596];
    
    MWDrawFillCircle *fillCircle0597 = [[MWDrawFillCircle alloc] init];
    fillCircle0597.center = CGPointMake(756, 2405.5);
    fillCircle0597.radius = 14;
    fillCircle0597.fillColor = [UIColor whiteColor];
    [vertex0056.drawPrimitives addObject:fillCircle0597];

    MWDrawFillCircle *fillCircle0598 = [[MWDrawFillCircle alloc] init];
    fillCircle0598.center = CGPointMake(956.5, 2445.5);
    fillCircle0598.radius = 31.5;
    fillCircle0598.fillColor = line0014.color;
    [vertex0056.drawPrimitives addObject:fillCircle0598];
    
    MWDrawFillCircle *fillCircle0599 = [[MWDrawFillCircle alloc] init];
    fillCircle0599.center = CGPointMake(956.5, 2445.5);
    fillCircle0599.radius = 27;
    fillCircle0599.fillColor = [UIColor whiteColor];
    [vertex0056.drawPrimitives addObject:fillCircle0599];
    
    MWDrawArc *drawArc0161 = [[MWDrawArc alloc] init];
    drawArc0161.center = CGPointMake(2533, 3241);
    drawArc0161.startDegrees = 205.6;
    drawArc0161.endDegrees = 208.0;
    drawArc0161.radius = 1764.5;
    drawArc0161.width = 21.5;
    drawArc0161.color = [UIColor whiteColor];
    [vertex0056.drawPrimitives addObject:drawArc0161];
    
    MWDrawFillCircle *fillCircle0600 = [[MWDrawFillCircle alloc] init];
    fillCircle0600.center = CGPointMake(956.5, 2445.5);
    fillCircle0600.radius = 14.5;
    fillCircle0600.fillColor = line0014.color;
    [vertex0056.drawPrimitives addObject:fillCircle0600];
    
    MWDrawFillCircle *fillCircle0601 = [[MWDrawFillCircle alloc] init];
    fillCircle0601.center = CGPointMake(956.5, 2445.5);
    fillCircle0601.radius = 11.5;
    fillCircle0601.fillColor = [UIColor whiteColor];
    [vertex0056.drawPrimitives addObject:fillCircle0601];

    MWDrawFillCircle *fillCircle0602 = [[MWDrawFillCircle alloc] init];
    fillCircle0602.center = CGPointMake(801, 2414.5);
    fillCircle0602.radius = 3.5;
    fillCircle0602.fillColor = line0007.color;
    [vertex0056.drawPrimitives addObject:fillCircle0602];

    MWDrawFillCircle *fillCircle0603 = [[MWDrawFillCircle alloc] init];
    fillCircle0603.center = CGPointMake(818.5, 2418);
    fillCircle0603.radius = 3.5;
    fillCircle0603.fillColor = [UIColor colorWithRed:(161/255.0) green:(68/255.0) blue:(133/255.0) alpha:1];
    [vertex0056.drawPrimitives addObject:fillCircle0603];

    MWDrawFillCircle *fillCircle0604 = [[MWDrawFillCircle alloc] init];
    fillCircle0604.center = CGPointMake(837.5, 2422);
    fillCircle0604.radius = 3.5;
    fillCircle0604.fillColor = [UIColor colorWithRed:(175/255.0) green:(66/255.0) blue:(117/255.0) alpha:1];
    [vertex0056.drawPrimitives addObject:fillCircle0604];

    MWDrawFillCircle *fillCircle0605 = [[MWDrawFillCircle alloc] init];
    fillCircle0605.center = CGPointMake(856, 2425.5);
    fillCircle0605.radius = 3.5;
    fillCircle0605.fillColor = [UIColor colorWithRed:(190/255.0) green:(64/255.0) blue:(101/255.0) alpha:1];
    [vertex0056.drawPrimitives addObject:fillCircle0605];

    MWDrawFillCircle *fillCircle0606 = [[MWDrawFillCircle alloc] init];
    fillCircle0606.center = CGPointMake(874.5, 2429);
    fillCircle0606.radius = 3.5;
    fillCircle0606.fillColor = [UIColor colorWithRed:(206/255.0) green:(60/255.0) blue:(81/255.0) alpha:1];
    [vertex0056.drawPrimitives addObject:fillCircle0606];

    MWDrawFillCircle *fillCircle0607 = [[MWDrawFillCircle alloc] init];
    fillCircle0607.center = CGPointMake(892.5, 2433);
    fillCircle0607.radius = 3.5;
    fillCircle0607.fillColor = [UIColor colorWithRed:(220/255.0) green:(53/255.0) blue:(62/255.0) alpha:1];
    [vertex0056.drawPrimitives addObject:fillCircle0607];

    MWDrawFillCircle *fillCircle0608 = [[MWDrawFillCircle alloc] init];
    fillCircle0608.center = CGPointMake(911, 2436.5);
    fillCircle0608.radius = 3.5;
    fillCircle0608.fillColor = [UIColor redColor];
    [vertex0056.drawPrimitives addObject:fillCircle0608];

    MWDrawTextLine *drawTextLine0501 = [[MWDrawTextLine alloc] init];
    drawTextLine0501.text = @"11 мин";
    drawTextLine0501.fontName = @"HelveticaNeue";
    drawTextLine0501.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0501.fontSize = 18;
    drawTextLine0501.origin = CGPointMake(846, 2446);
    drawTextLine0501.kernSpacing = 0.2;
    [vertex0056.drawPrimitives addObject:drawTextLine0501];

    MWDrawTextLine *drawTextLine0502 = [[MWDrawTextLine alloc] init];
    drawTextLine0502.text = @"11 min";
    drawTextLine0502.fontName = @"HelveticaNeue";
    drawTextLine0502.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0502.fontSize = 18;
    drawTextLine0502.origin = CGPointMake(846, 2465);
    drawTextLine0502.kernSpacing = 0.2;
    [vertex0056.drawPrimitives addObject:drawTextLine0502];

    // Войковская - Балтийская
    MWVertex *vertex0057 = [[MWVertex alloc] init];
    vertex0057.identifier = @"vertex0057";
    vertex0057.developmentName = @"Вершина: Войковская - Балтийская";
    [self.vertices addObject:vertex0057];

    MWDrawFillCircle *fillCircle0609 = [[MWDrawFillCircle alloc] init];
    fillCircle0609.center = CGPointMake(1242, 2037);
    fillCircle0609.radius = 31.5;
    fillCircle0609.fillColor = line0014.color;
    [vertex0057.drawPrimitives addObject:fillCircle0609];
    
    MWDrawFillCircle *fillCircle0610 = [[MWDrawFillCircle alloc] init];
    fillCircle0610.center = CGPointMake(1242, 2037);
    fillCircle0610.radius = 27;
    fillCircle0610.fillColor = [UIColor whiteColor];
    [vertex0057.drawPrimitives addObject:fillCircle0610];
    
    MWDrawArc *drawArc0162 = [[MWDrawArc alloc] init];
    drawArc0162.center = CGPointMake(2533, 3241);
    drawArc0162.startDegrees = 221.9;
    drawArc0162.endDegrees = 224.3;
    drawArc0162.radius = 1764.5;
    drawArc0162.width = 21.5;
    drawArc0162.color = [UIColor whiteColor];
    [vertex0057.drawPrimitives addObject:drawArc0162];
    
    MWDrawFillCircle *fillCircle0611 = [[MWDrawFillCircle alloc] init];
    fillCircle0611.center = CGPointMake(1242, 2037);
    fillCircle0611.radius = 14.5;
    fillCircle0611.fillColor = line0014.color;
    [vertex0057.drawPrimitives addObject:fillCircle0611];
    
    MWDrawFillCircle *fillCircle0612 = [[MWDrawFillCircle alloc] init];
    fillCircle0612.center = CGPointMake(1242, 2037);
    fillCircle0612.radius = 11.5;
    fillCircle0612.fillColor = [UIColor whiteColor];
    [vertex0057.drawPrimitives addObject:fillCircle0612];

    MWDrawFillCircle *fillCircle0613 = [[MWDrawFillCircle alloc] init];
    fillCircle0613.center = CGPointMake(1320, 1848.5);
    fillCircle0613.radius = 31.5;
    fillCircle0613.fillColor = line0002.color;
    [vertex0057.drawPrimitives addObject:fillCircle0613];

    MWDrawFillCircle *fillCircle0614 = [[MWDrawFillCircle alloc] init];
    fillCircle0614.center = CGPointMake(1320, 1848.5);
    fillCircle0614.radius = 14;
    fillCircle0614.fillColor = [UIColor whiteColor];
    [vertex0057.drawPrimitives addObject:fillCircle0614];

    MWDrawFillCircle *fillCircle0615 = [[MWDrawFillCircle alloc] init];
    fillCircle0615.center = CGPointMake(1259.5, 1994.5);
    fillCircle0615.radius = 3.5;
    fillCircle0615.fillColor = [UIColor redColor];
    [vertex0057.drawPrimitives addObject:fillCircle0615];

    MWDrawFillCircle *fillCircle0616 = [[MWDrawFillCircle alloc] init];
    fillCircle0616.center = CGPointMake(1266.5, 1977.5);
    fillCircle0616.radius = 3.5;
    fillCircle0616.fillColor = [UIColor colorWithRed:(215/255.0) green:(94/255.0) blue:(45/255.0) alpha:1];
    [vertex0057.drawPrimitives addObject:fillCircle0616];

    MWDrawFillCircle *fillCircle0617 = [[MWDrawFillCircle alloc] init];
    fillCircle0617.center = CGPointMake(1273.5, 1960);
    fillCircle0617.radius = 3.5;
    fillCircle0617.fillColor = [UIColor colorWithRed:(197/255.0) green:(118/255.0) blue:(54/255.0) alpha:1];
    [vertex0057.drawPrimitives addObject:fillCircle0617];

    MWDrawFillCircle *fillCircle0618 = [[MWDrawFillCircle alloc] init];
    fillCircle0618.center = CGPointMake(1281, 1942.5);
    fillCircle0618.radius = 3.5;
    fillCircle0618.fillColor = [UIColor colorWithRed:(177/255.0) green:(138/255.0) blue:(63/255.0) alpha:1];
    [vertex0057.drawPrimitives addObject:fillCircle0618];

    MWDrawFillCircle *fillCircle0619 = [[MWDrawFillCircle alloc] init];
    fillCircle0619.center = CGPointMake(1288, 1925.5);
    fillCircle0619.radius = 3.5;
    fillCircle0619.fillColor = [UIColor colorWithRed:(156/255.0) green:(153/255.0) blue:(72/255.0) alpha:1];
    [vertex0057.drawPrimitives addObject:fillCircle0619];

    MWDrawFillCircle *fillCircle0620 = [[MWDrawFillCircle alloc] init];
    fillCircle0620.center = CGPointMake(1295, 1908);
    fillCircle0620.radius = 3.5;
    fillCircle0620.fillColor = [UIColor colorWithRed:(129/255.0) green:(168/255.0) blue:(82/255.0) alpha:1];
    [vertex0057.drawPrimitives addObject:fillCircle0620];

    MWDrawFillCircle *fillCircle0621 = [[MWDrawFillCircle alloc] init];
    fillCircle0621.center = CGPointMake(1302.5, 1891);
    fillCircle0621.radius = 3.5;
    fillCircle0621.fillColor = line0002.color;
    [vertex0057.drawPrimitives addObject:fillCircle0621];

    MWDrawTextLine *drawTextLine0503 = [[MWDrawTextLine alloc] init];
    drawTextLine0503.text = @"11 мин";
    drawTextLine0503.fontName = @"HelveticaNeue";
    drawTextLine0503.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0503.fontSize = 18;
    drawTextLine0503.origin = CGPointMake(1170.5, 1921);
    drawTextLine0503.kernSpacing = 0.2;
    [vertex0057.drawPrimitives addObject:drawTextLine0503];

    MWDrawTextLine *drawTextLine0504 = [[MWDrawTextLine alloc] init];
    drawTextLine0504.text = @"11 min";
    drawTextLine0504.fontName = @"HelveticaNeue";
    drawTextLine0504.fontColor = [UIColor colorWithRed:(117/255.0) green:(135/255.0) blue:(125/255.0) alpha:1];
    drawTextLine0504.fontSize = 18;
    drawTextLine0504.origin = CGPointMake(1170.5, 1940);
    drawTextLine0504.kernSpacing = 0.2;
    [vertex0057.drawPrimitives addObject:drawTextLine0504];

    ////////////////////////////////////////////////////////////////
    // 1. Сокольническая линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Саларьево - Спортивная
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Саларьево - Спортивная";
    [self.edges addObject:(edge0001)];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;

    // Добавляем станцию "Саларьево"
    MWStation *station0199 = [[MWStation alloc] init];
    station0199.identifier = @"station0199";
    [edge0001.elements addObject:station0199];

    station0199.nameOriginal = @"Саларьево";
    station0199.nameEnglish = @"Salarievo";
    station0199.mapLocation = CGPointMake(1117, 5648);
    station0199.geoLocation = CGPointMake(55.6227, 37.424);

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = station0199.nameOriginal;
    drawTextLine0001.fontName = @"HelveticaNeue";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 42;
    drawTextLine0001.origin = CGPointMake(1157, 5618);
    [station0199.nameOriginalTextPrimitives addObject:drawTextLine0001];
    
    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = CGPointMake(1117, 5710.5);
    fillCircle0001.radius = 32;
    fillCircle0001.fillColor = line0001.color;
    [station0199.drawPrimitives addObject:fillCircle0001];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = @"1";
    drawTextLine0002.fontName = @"Georgia-Bold";
    drawTextLine0002.fontColor = [UIColor whiteColor];
    drawTextLine0002.fontSize = 56;
    drawTextLine0002.origin = CGPointMake(1103.5, 5673.5);
    [station0199.drawPrimitives addObject:drawTextLine0002];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0199.nameEnglish;
    drawTextLine0003.fontName = @"HelveticaNeue";
    drawTextLine0003.fontColor = stationNamesEnglishColor;
    drawTextLine0003.fontSize = 28;
    drawTextLine0003.origin = CGPointMake(1157, 5663);
    [station0199.nameEnglishTextPrimitives addObject:drawTextLine0003];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = CGPointMake(1085, 5648);
    drawLine0001.endPoint = CGPointMake(1149, 5648);
    drawLine0001.width = 21.5;
    drawLine0001.color = line0001.color;
    [station0199.drawPrimitives addObject:drawLine0001];

    // Добавляем перегон
    MWHaul *haul0187 = [[MWHaul alloc] init];
    haul0187.identifier = @"haul0187";
    haul0187.length = 1770;
    [edge0001.elements addObject:haul0187];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(1117, 5648);
    drawLine0002.endPoint = CGPointMake(1117, 5500);
    drawLine0002.width = 21.5;
    drawLine0002.color = line0001.color;
    [haul0187.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию "Румянцево"
    MWStation *station0198 = [[MWStation alloc] init];
    station0198.identifier = @"station0198";
    [edge0001.elements addObject:station0198];

    station0198.nameOriginal = @"Румянцево";
    station0198.nameEnglish = @"Rumyantsevo";
    station0198.mapLocation = CGPointMake(1117, 5500);
    station0198.geoLocation = CGPointMake(55.633, 37.4419);
    
    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(1117, 5500);
    drawLine0003.endPoint = CGPointMake(1149, 5500);
    drawLine0003.width = 21.5;
    drawLine0003.color = line0001.color;
    [station0198.drawPrimitives addObject:drawLine0003];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0198.nameOriginal;
    drawTextLine0004.fontName = @"HelveticaNeue";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 42;
    drawTextLine0004.origin = CGPointMake(1157, 5471);
    drawTextLine0004.kernSpacing = 0.9;
    [station0198.nameOriginalTextPrimitives addObject:drawTextLine0004];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0198.nameEnglish;
    drawTextLine0005.fontName = @"HelveticaNeue";
    drawTextLine0005.fontColor = stationNamesEnglishColor;
    drawTextLine0005.fontSize = 28;
    drawTextLine0005.kernSpacing = -0.5;
    drawTextLine0005.origin = CGPointMake(1157, 5516);
    [station0198.nameEnglishTextPrimitives addObject:drawTextLine0005];

    // Добавляем перегон
    MWHaul *haul0186 = [[MWHaul alloc] init];
    haul0186.identifier = @"haul0186";
    haul0186.length = 2420;
    [edge0001.elements addObject:haul0186];
    
    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(1117, 5500.5);
    drawLine0004.endPoint = CGPointMake(1117, 5352);
    drawLine0004.width = 21.5;
    drawLine0004.color = line0001.color;
    [haul0186.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию "Тропарево"
    MWStation *station0196 = [[MWStation alloc] init];
    station0196.identifier = @"station0196";
    [edge0001.elements addObject:station0196];
    
    station0196.nameOriginal = @"Тропарёво";
    station0196.nameEnglish = @"Troparyovo";
    station0196.mapLocation = CGPointMake(1117, 5352);
    station0196.geoLocation = CGPointMake(55.6459, 37.4725);

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(1117, 5352);
    drawLine0005.endPoint = CGPointMake(1149, 5352);
    drawLine0005.width = 21.5;
    drawLine0005.color = line0001.color;
    [station0196.drawPrimitives addObject:drawLine0005];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0196.nameOriginal;
    drawTextLine0006.fontName = @"HelveticaNeue";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 42;
    drawTextLine0006.origin = CGPointMake(1157, 5323);
    drawTextLine0006.kernSpacing = 0.9;
    [station0196.nameOriginalTextPrimitives addObject:drawTextLine0006];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = station0196.nameEnglish;
    drawTextLine0007.fontName = @"HelveticaNeue";
    drawTextLine0007.fontColor = stationNamesEnglishColor;
    drawTextLine0007.fontSize = 28;
    drawTextLine0007.kernSpacing = -0.1;
    drawTextLine0007.origin = CGPointMake(1157, 5368);
    [station0196.nameEnglishTextPrimitives addObject:drawTextLine0007];

    // Добавляем перегон
    MWHaul *haul0184 = [[MWHaul alloc] init];
    haul0184.identifier = @"haul0184";
    haul0184.length = 2100;
    [edge0001.elements addObject:haul0184];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(1117, 5352.5);
    drawLine0006.endPoint = CGPointMake(1117, 5204);
    drawLine0006.width = 21.5;
    drawLine0006.color = line0001.color;
    [haul0184.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию "Юго-западная"
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Юго-Западная";
    station0001.nameEnglish = @"Yugo-Zapadnaya";
    station0001.mapLocation = CGPointMake(1117, 5204);
    station0001.geoLocation = CGPointMake(55.663750, 37.483152);
    
    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(1117, 5204);
    drawLine0007.endPoint = CGPointMake(1149, 5204);
    drawLine0007.width = 21.5;
    drawLine0007.color = line0001.color;
    [station0001.drawPrimitives addObject:drawLine0007];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = station0001.nameOriginal;
    drawTextLine0008.fontName = @"HelveticaNeue";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 42;
    drawTextLine0008.origin = CGPointMake(1157, 5175);
    drawTextLine0008.kernSpacing = -0.2;
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0008];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = station0001.nameEnglish;
    drawTextLine0009.fontName = @"HelveticaNeue";
    drawTextLine0009.fontColor = stationNamesEnglishColor;
    drawTextLine0009.fontSize = 28;
    drawTextLine0009.kernSpacing = -0.2;
    drawTextLine0009.origin = CGPointMake(1157, 5220);
    [station0001.nameEnglishTextPrimitives addObject:drawTextLine0009];

    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 2150;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(1117, 5204.5);
    drawLine0008.endPoint = CGPointMake(1117, 5012);
    drawLine0008.width = 21.5;
    drawLine0008.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию "Проспект Вернадского"
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Проспект Вернадского";
    station0002.nameEnglish = @"Prospekt Vernadskogo";
    station0002.mapLocation = CGPointMake(1117, 5012);
    station0002.geoLocation = CGPointMake(55.676978, 37.506314);
    
    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(1117, 5012);
    drawLine0009.endPoint = CGPointMake(1149, 5012);
    drawLine0009.width = 21.5;
    drawLine0009.color = line0001.color;
    [station0002.drawPrimitives addObject:drawLine0009];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = @"Проспект";
    drawTextLine0010.fontName = @"HelveticaNeue";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 42;
    drawTextLine0010.origin = CGPointMake(1157, 4982);
    drawTextLine0010.kernSpacing = 1.2;
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0010];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = @"Вернадского";
    drawTextLine0011.fontName = @"HelveticaNeue";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 42;
    drawTextLine0011.origin = CGPointMake(1157, 5022);
    drawTextLine0011.kernSpacing = 0.4;
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0011];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = @"Prospekt";
    drawTextLine0012.fontName = @"HelveticaNeue";
    drawTextLine0012.fontColor = stationNamesEnglishColor;
    drawTextLine0012.fontSize = 28;
    drawTextLine0012.kernSpacing = 0.2;
    drawTextLine0012.origin = CGPointMake(1159, 5067);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0012];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = @"Vernadskogo";
    drawTextLine0013.fontName = @"HelveticaNeue";
    drawTextLine0013.fontColor = stationNamesEnglishColor;
    drawTextLine0013.fontSize = 28;
    drawTextLine0013.kernSpacing = -0.2;
    drawTextLine0013.origin = CGPointMake(1159, 5098);
    [station0002.nameEnglishTextPrimitives addObject:drawTextLine0013];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 2500;
    [edge0001.elements addObject:haul0002];
    
    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(1117, 5012.5);
    drawLine0010.endPoint = CGPointMake(1117, 4864);
    drawLine0010.width = 21.5;
    drawLine0010.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0010];

    // Добавляем станцию "Университет"
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Университет";
    station0003.nameEnglish = @"Universitet";
    station0003.mapLocation = CGPointMake(1117, 4864);
    station0003.geoLocation = CGPointMake(55.692551, 37.534592);
    
    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(1117, 4864);
    drawLine0011.endPoint = CGPointMake(1149, 4864);
    drawLine0011.width = 21.5;
    drawLine0011.color = line0001.color;
    [station0003.drawPrimitives addObject:drawLine0011];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0003.nameOriginal;
    drawTextLine0014.fontName = @"HelveticaNeue";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 42;
    drawTextLine0014.origin = CGPointMake(1157, 4834);
    drawTextLine0014.kernSpacing = 0.6;
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0014];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0003.nameEnglish;
    drawTextLine0015.fontName = @"HelveticaNeue";
    drawTextLine0015.fontColor = stationNamesEnglishColor;
    drawTextLine0015.fontSize = 28;
    drawTextLine0015.kernSpacing = 0.2;
    drawTextLine0015.origin = CGPointMake(1157, 4879);
    [station0003.nameEnglishTextPrimitives addObject:drawTextLine0015];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 2540;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(1117, 4864.5);
    drawLine0012.endPoint = CGPointMake(1117, 4671);
    drawLine0012.width = 21.5;
    drawLine0012.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию "Воробьевы горы"
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Воробьёвы горы";
    station0004.nameEnglish = @"Vorobyovy Gory";
    station0004.mapLocation = CGPointMake(1117, 4671);
    station0004.geoLocation = CGPointMake(55.710409, 37.559425);
    
    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(1117, 4671);
    drawLine0013.endPoint = CGPointMake(1149, 4671);
    drawLine0013.width = 21.5;
    drawLine0013.color = line0001.color;
    [station0004.drawPrimitives addObject:drawLine0013];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = @"Воробьёвы";
    drawTextLine0016.fontName = @"HelveticaNeue";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 42;
    drawTextLine0016.origin = CGPointMake(1157, 4641);
    drawTextLine0016.kernSpacing = 0.5;
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0016];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = @"горы";
    drawTextLine0017.fontName = @"HelveticaNeue";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 42;
    drawTextLine0017.origin = CGPointMake(1157, 4681);
    drawTextLine0017.kernSpacing = 0.5;
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0017];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0004.nameEnglish;
    drawTextLine0018.fontName = @"HelveticaNeue";
    drawTextLine0018.fontColor = stationNamesEnglishColor;
    drawTextLine0018.fontSize = 28;
    drawTextLine0018.kernSpacing = 0.2;
    drawTextLine0018.origin = CGPointMake(1157, 4726);
    [station0004.nameEnglishTextPrimitives addObject:drawTextLine0018];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 1480;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(1117, 4671.5);
    drawLine0014.endPoint = CGPointMake(1117, 4498);
    drawLine0014.width = 21.5;
    drawLine0014.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0014];

    // Добавляем станцию "Спортивная"
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"Спортивная";
    station0005.nameEnglish = @"Sportivnaya";
    station0005.mapLocation = CGPointMake(1117, 4498);
    station0005.geoLocation = CGPointMake(55.723338, 37.564069);

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0005.mapLocation;
    fillCircle0002.radius = 31.5;
    fillCircle0002.fillColor = line0001.color;
    [station0005.drawPrimitives addObject:fillCircle0002];

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0005.mapLocation;
    fillCircle0003.radius = 14;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0003];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0005.nameOriginal;
    drawTextLine0019.fontName = @"HelveticaNeue";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 42;
    drawTextLine0019.origin = CGPointMake(1159, 4487);
    drawTextLine0019.kernSpacing = 0.0;
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0019];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0005.nameEnglish;
    drawTextLine0020.fontName = @"HelveticaNeue";
    drawTextLine0020.fontColor = stationNamesEnglishColor;
    drawTextLine0020.fontSize = 28;
    drawTextLine0020.kernSpacing = 0.2;
    drawTextLine0020.origin = CGPointMake(1157, 4532);
    [station0005.nameEnglishTextPrimitives addObject:drawTextLine0020];

    // Добавляем вершину
    edge0001.finishVertex = vertex0053;
    
    // Создаем участок линии Спортивная - Парк культуры
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0080 = [[MWEdge alloc] init];
    edge0080.identifier = @"edge0080";
    edge0080.developmentName = @"Ребро: Спортивная - Парк культуры";
    [self.edges addObject:edge0080];
    
    // Добавляем линию
    edge0080.line = line0001;
    
    // Добавляем вершину
    edge0080.startVertex = vertex0053;
    
    // Добавляем станцию "Спортивная"
    [edge0080.elements addObject:station0005];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1290;
    [edge0080.elements addObject:haul0005];
    
    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(1117, 4498.5);
    drawLine0015.endPoint = CGPointMake(1117, 4260);
    drawLine0015.width = 21.5;
    drawLine0015.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0015];

    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(1237, 4260.5);
    drawArc0001.startDegrees = 180;
    drawArc0001.endDegrees = 225;
    drawArc0001.radius = 120;
    drawArc0001.width = 21.5;
    drawArc0001.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawArc0001];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(1152, 4176);
    drawLine0016.endPoint = CGPointMake(1281, 4047);
    drawLine0016.width = 21.5;
    drawLine0016.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию "Фрунзенская"
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0080.elements addObject:station0006];
    
    station0006.nameOriginal = @"Фрунзенская";
    station0006.nameEnglish = @"Frunzenskaya";
    station0006.mapLocation = CGPointMake(1281, 4047);
    station0006.geoLocation = CGPointMake(55.727474, 37.580684);
    
    MWGraphStatus *status = [[MWGraphStatus alloc] init];
    status.status = MWGraphObjectStatusClosed;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    NSString *dateString = @"1.3.2017";
    NSDate *date = [dateFormatter dateFromString:dateString];
    status.toDate = date;
    
    [station0006.states addObject:status];
    
    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(1281, 4048);
    drawLine0017.endPoint = CGPointMake(1304, 4071);
    drawLine0017.width = 21.5;
    drawLine0017.color = line0001.color;
    [station0006.drawPrimitives addObject:drawLine0017];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = station0006.nameOriginal;
    drawTextLine0021.fontName = @"HelveticaNeue";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 42;
    drawTextLine0021.origin = CGPointMake(1300, 4060);
    drawTextLine0021.kernSpacing = -0.8;
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0021];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0006.nameEnglish;
    drawTextLine0022.fontName = @"HelveticaNeue";
    drawTextLine0022.fontColor = stationNamesEnglishColor;
    drawTextLine0022.fontSize = 28;
    drawTextLine0022.kernSpacing = 1.3;
    drawTextLine0022.origin = CGPointMake(1303, 4110);
    [station0006.nameEnglishTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1350;
    [edge0080.elements addObject:haul0006];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(1280.5, 4047.5);
    drawLine0018.endPoint = CGPointMake(1384.5, 3943.5);
    drawLine0018.width = 21.5;
    drawLine0018.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0018];

    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(1468.5, 4029);
    drawArc0002.startDegrees = 225;
    drawArc0002.endDegrees = 270;
    drawArc0002.radius = 120;
    drawArc0002.width = 21.5;
    drawArc0002.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawArc0002];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(1468, 3909);
    drawLine0019.endPoint = CGPointMake(1732, 3909);
    drawLine0019.width = 21.5;
    drawLine0019.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0019];

    // Добавляем станцию "Парк культуры"
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0080.elements addObject:station0007];
    
    station0007.nameOriginal = @"Парк культуры";
    station0007.nameEnglish = @"Park Kultury";
    station0007.mapLocation = CGPointMake(1732, 3909);
    station0007.geoLocation = CGPointMake(55.735204, 37.593074);
    
    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0007.mapLocation;
    fillCircle0004.radius = 31.5;
    fillCircle0004.fillColor = line0001.color;
    [station0007.drawPrimitives addObject:fillCircle0004];
    
    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0007.mapLocation;
    fillCircle0005.radius = 14;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0005];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0007.nameOriginal;
    drawTextLine0023.fontName = @"HelveticaNeue";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 42;
    drawTextLine0023.origin = CGPointMake(1426, 3827);
    drawTextLine0023.kernSpacing = 0.1;
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0023];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = station0007.nameEnglish;
    drawTextLine0024.fontName = @"HelveticaNeue";
    drawTextLine0024.fontColor = stationNamesEnglishColor;
    drawTextLine0024.fontSize = 28;
    drawTextLine0024.kernSpacing = 0.0;
    drawTextLine0024.origin = CGPointMake(1550, 3801);
    [station0007.nameEnglishTextPrimitives addObject:drawTextLine0024];

    // Добавляем вершину
    edge0080.finishVertex = vertex0002;
    
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
    
    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(1731.5, 3909);
    drawLine0020.endPoint = CGPointMake(1892, 3909);
    drawLine0020.width = 21.5;
    drawLine0020.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0020];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(1892, 3759);
    drawArc0003.startDegrees = 45;
    drawArc0003.endDegrees = 90;
    drawArc0003.radius = 150;
    drawArc0003.width = 21.5;
    drawArc0003.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawArc0003];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(1997.5, 3865.5);
    drawLine0021.endPoint = CGPointMake(2022.5, 3840.5);
    drawLine0021.width = 21.5;
    drawLine0021.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0021];

    // Добавляем станцию "Кропоткинская"
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0002.elements addObject:station0008];
    
    station0008.nameOriginal = @"Кропоткинская";
    station0008.nameEnglish = @"Kropotkinskaya";
    station0008.mapLocation = CGPointMake(2022.5, 3840.5);
    station0008.geoLocation = CGPointMake(55.745155, 37.603031);
    
    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(2022.5, 3840.5);
    drawLine0022.endPoint = CGPointMake(2045.5, 3863.5);
    drawLine0022.width = 21.5;
    drawLine0022.color = line0001.color;
    [station0008.drawPrimitives addObject:drawLine0022];

    // Подложка
    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(2287, 3889);
    drawLine0023.endPoint = CGPointMake(2334, 3889);
    drawLine0023.width = 36;
    drawLine0023.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0008.nameOriginalTextPrimitives addObject:drawLine0023];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = station0008.nameOriginal;
    drawTextLine0025.fontName = @"HelveticaNeue";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 42;
    drawTextLine0025.origin = CGPointMake(2049, 3860);
    drawTextLine0025.kernSpacing = 0.4;
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0025];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0008.nameEnglish;
    drawTextLine0026.fontName = @"HelveticaNeue";
    drawTextLine0026.fontColor = stationNamesEnglishColor;
    drawTextLine0026.fontSize = 28;
    drawTextLine0026.kernSpacing = 0.1;
    drawTextLine0026.origin = CGPointMake(2049, 3905);
    [station0008.nameEnglishTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length= 970;
    [edge0002.elements addObject:haul0008];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(2022, 3841);
    drawLine0024.endPoint = CGPointMake(2242, 3621.5);
    drawLine0024.width = 21.5;
    drawLine0024.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию "Библиотека им. Ленина"
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0002.elements addObject:station0009];
    
    station0009.nameOriginal = @"Библиотека им. Ленина";
    station0009.nameEnglish = @"Biblioteka Imeni Lenina";
    station0009.mapLocation = CGPointMake(2242, 3621.5);
    station0009.geoLocation = CGPointMake(55.752251, 37.610493);
    
    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0009.mapLocation;
    fillCircle0006.radius = 31.5;
    fillCircle0006.fillColor = line0001.color;
    [station0009.drawPrimitives addObject:fillCircle0006];
    
    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0009.mapLocation;
    fillCircle0007.radius = 14;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0007];
    
    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0009.nameOriginal;
    drawTextLine0027.fontName = @"HelveticaNeue";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 42;
    drawTextLine0027.origin = CGPointMake(2268, 3635);
    drawTextLine0027.kernSpacing = 0.2;
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0027];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = station0009.nameEnglish;
    drawTextLine0028.fontName = @"HelveticaNeue";
    drawTextLine0028.fontColor = stationNamesEnglishColor;
    drawTextLine0028.fontSize = 28;
    drawTextLine0028.kernSpacing = 0.6;
    drawTextLine0028.origin = CGPointMake(2268, 3680);
    [station0009.nameEnglishTextPrimitives addObject:drawTextLine0028];

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
    
    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(2241.5, 3622);
    drawLine0025.endPoint = CGPointMake(2539.5, 3324.5);
    drawLine0025.width = 21.5;
    drawLine0025.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0025];

    // Добавляем станцию "Охотный ряд"
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0003.elements addObject:station0010];
    
    station0010.nameOriginal = @"Охотный Ряд";
    station0010.nameEnglish = @"Okhotny Riad";
    station0010.mapLocation = CGPointMake(2539.5, 3324.5);
    station0010.geoLocation = CGPointMake(55.757877, 37.616638);
    
    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0010.mapLocation;
    fillCircle0008.radius = 31.5;
    fillCircle0008.fillColor = line0001.color;
    [station0010.drawPrimitives addObject:fillCircle0008];
    
    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0010.mapLocation;
    fillCircle0009.radius = 14;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0009];

    // Подложка
    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(2313, 3282);
    drawLine0026.endPoint = CGPointMake(2363, 3282);
    drawLine0026.width = 44;
    drawLine0026.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0010.nameOriginalTextPrimitives addObject:drawLine0026];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = @"Охотный";
    drawTextLine0029.fontName = @"HelveticaNeue";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 42;
    drawTextLine0029.origin = CGPointMake(2320, 3258);
    drawTextLine0029.kernSpacing = 0.8;
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0029];

    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"Ряд";
    drawTextLine0030.fontName = @"HelveticaNeue";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 42;
    drawTextLine0030.origin = CGPointMake(2428, 3298);
    drawTextLine0030.kernSpacing = -1.2;
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0030];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = station0010.nameEnglish;
    drawTextLine0031.fontName = @"HelveticaNeue";
    drawTextLine0031.fontColor = stationNamesEnglishColor;
    drawTextLine0031.fontSize = 28;
    drawTextLine0031.kernSpacing = 0.0;
    drawTextLine0031.origin = CGPointMake(2327, 3237);
    [station0010.nameEnglishTextPrimitives addObject:drawTextLine0031];

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
    
    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(2539, 3325);
    drawLine0027.endPoint = CGPointMake(2783.5, 3080);
    drawLine0027.width = 21.5;
    drawLine0027.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0027];

    // Добавляем станцию "Лубянка"
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0004.elements addObject:station0011];
    
    station0011.nameOriginal = @"Лубянка";
    station0011.nameEnglish = @"Lubyanka";
    station0011.mapLocation = CGPointMake(2783.5, 3080);
    station0011.geoLocation = CGPointMake(55.759658, 37.626579);
    
    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0011.mapLocation;
    fillCircle0010.radius = 31.5;
    fillCircle0010.fillColor = line0001.color;
    [station0011.drawPrimitives addObject:fillCircle0010];

    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0011.mapLocation;
    fillCircle0011.radius = 14;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0011];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = station0011.nameOriginal;
    drawTextLine0032.fontName = @"HelveticaNeue";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 42;
    drawTextLine0032.origin = CGPointMake(2773, 3114);
    drawTextLine0032.kernSpacing = 0.6;
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0032];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = station0011.nameEnglish;
    drawTextLine0033.fontName = @"HelveticaNeue";
    drawTextLine0033.fontColor = stationNamesEnglishColor;
    drawTextLine0033.fontSize = 28;
    drawTextLine0033.kernSpacing = 0.0;
    drawTextLine0033.origin = CGPointMake(2773, 3159);
    [station0011.nameEnglishTextPrimitives addObject:drawTextLine0033];

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
    
    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(2783, 3080.5);
    drawLine0028.endPoint = CGPointMake(3015.5, 2848);
    drawLine0028.width = 21.5;
    drawLine0028.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0028];

    // Добавляем станцию "Чистые пруды"
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0005.elements addObject:station0012];
    
    station0012.nameOriginal = @"Чистые пруды";
    station0012.nameEnglish = @"Chistye Prudy";
    station0012.mapLocation = CGPointMake(3015.5, 2848);
    station0012.geoLocation = CGPointMake(55.764930, 37.638435);
    
    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0012.mapLocation;
    fillCircle0012.radius = 31.5;
    fillCircle0012.fillColor = line0001.color;
    [station0012.drawPrimitives addObject:fillCircle0012];
    
    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0012.mapLocation;
    fillCircle0013.radius = 14;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0013];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(3190, 2909);
    drawLine0029.endPoint = CGPointMake(3270, 2909);
    drawLine0029.width = 40;
    drawLine0029.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0012.nameOriginalTextPrimitives addObject:drawLine0029];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = station0012.nameOriginal;
    drawTextLine0034.fontName = @"HelveticaNeue";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 42;
    drawTextLine0034.origin = CGPointMake(3025, 2881);
    drawTextLine0034.kernSpacing = -0.2;
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0034];
    
    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0012.nameEnglish;
    drawTextLine0035.fontName = @"HelveticaNeue";
    drawTextLine0035.fontColor = stationNamesEnglishColor;
    drawTextLine0035.fontSize = 28;
    drawTextLine0035.kernSpacing = -0.2;
    drawTextLine0035.origin = CGPointMake(3045, 2925);
    [station0012.nameEnglishTextPrimitives addObject:drawTextLine0035];

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
    
    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(3015, 2848.5);
    drawLine0030.endPoint = CGPointMake(3153, 2711);
    drawLine0030.width = 21.5;
    drawLine0030.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0030];

    // Добавляем станцию "Красные ворота"
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    station0013.nameOriginal = @"Красные ворота";
    [edge0006.elements addObject:station0013];
    
    station0013.nameOriginal = @"Красные Ворота";
    station0013.nameEnglish = @"Krasnye Vorota";
    station0013.mapLocation = CGPointMake(3153, 2711);
    station0013.geoLocation = CGPointMake(55.769079, 37.649105);
    
    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(3153, 2711);
    drawLine0031.endPoint = CGPointMake(3176, 2734);
    drawLine0031.width = 21.5;
    drawLine0031.color = line0001.color;
    [station0013.drawPrimitives addObject:drawLine0031];
    
    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = @"Красные";
    drawTextLine0036.fontName = @"HelveticaNeue";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 42;
    drawTextLine0036.origin = CGPointMake(3177, 2732);
    drawTextLine0036.kernSpacing = 0.3;
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0036];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"Ворота";
    drawTextLine0037.fontName = @"HelveticaNeue";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 42;
    drawTextLine0037.origin = CGPointMake(3177, 2772);
    drawTextLine0037.kernSpacing = 0.5;
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0037];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = station0013.nameEnglish;
    drawTextLine0038.fontName = @"HelveticaNeue";
    drawTextLine0038.fontColor = stationNamesEnglishColor;
    drawTextLine0038.fontSize = 28;
    drawTextLine0038.kernSpacing = 0.0;
    drawTextLine0038.origin = CGPointMake(3179, 2817);
    [station0013.nameEnglishTextPrimitives addObject:drawTextLine0038];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 757;
    [edge0006.elements addObject:haul0013];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(3152.5, 2711.5);
    drawLine0032.endPoint = CGPointMake(3301, 2562.5);
    drawLine0032.width = 21.5;
    drawLine0032.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0032];

    // Добавляем станцию "Комсомольская"
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0006.elements addObject:station0014];
    
    station0014.nameOriginal = @"Комсомольская";
    station0014.nameEnglish = @"Komsomolskaya";
    station0014.mapLocation = CGPointMake(3301, 2562.5);
    station0014.geoLocation = CGPointMake(55.776241, 37.655869);
    
    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0014.mapLocation;
    fillCircle0014.radius = 31.5;
    fillCircle0014.fillColor = line0001.color;
    [station0014.drawPrimitives addObject:fillCircle0014];
    
    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0014.mapLocation;
    fillCircle0015.radius = 14;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0015];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = station0014.nameOriginal;
    drawTextLine0039.fontName = @"HelveticaNeue";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 42;
    drawTextLine0039.origin = CGPointMake(3333, 2578);
    drawTextLine0039.kernSpacing = 0.7;
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0039];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = station0014.nameEnglish;
    drawTextLine0040.fontName = @"HelveticaNeue";
    drawTextLine0040.fontColor = stationNamesEnglishColor;
    drawTextLine0040.fontSize = 28;
    drawTextLine0040.kernSpacing = -0.4;
    drawTextLine0040.origin = CGPointMake(3373, 2551);
    [station0014.nameEnglishTextPrimitives addObject:drawTextLine0040];

    // Добавляем вершину
    edge0006.finishVertex = vertex0007;
    
    // Создаем участок линии Комсомольская - Черкизовская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Комсомольская - Черкизовская";
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
    
    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(3300.5, 2563);
    drawLine0033.endPoint = CGPointMake(3484, 2379);
    drawLine0033.width = 21.5;
    drawLine0033.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0033];

    // Добавляем станцию "Красносельская"
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0007.elements addObject:station0015];
    
    station0015.nameOriginal = @"Красносельская";
    station0015.nameEnglish = @"Krasnoselskaya";
    station0015.mapLocation = CGPointMake(3484, 2379);
    station0015.geoLocation = CGPointMake(55.779997, 37.666080);
    
    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(3484, 2379);
    drawLine0034.endPoint = CGPointMake(3507, 2402);
    drawLine0034.width = 21.5;
    drawLine0034.color = line0001.color;
    [station0015.drawPrimitives addObject:drawLine0034];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0015.nameOriginal;
    drawTextLine0041.fontName = @"HelveticaNeue";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 42;
    drawTextLine0041.origin = CGPointMake(3509, 2399);
    drawTextLine0041.kernSpacing = -0.2;
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0041];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = station0015.nameEnglish;
    drawTextLine0042.fontName = @"HelveticaNeue";
    drawTextLine0042.fontColor = stationNamesEnglishColor;
    drawTextLine0042.fontSize = 28;
    drawTextLine0042.kernSpacing = -0.4;
    drawTextLine0042.origin = CGPointMake(3510, 2444);
    [station0015.nameEnglishTextPrimitives addObject:drawTextLine0042];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 1370;
    [edge0007.elements addObject:haul0015];
    
    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(3483.5, 2379.5);
    drawLine0035.endPoint = CGPointMake(3533.5, 2329.5);
    drawLine0035.width = 21.5;
    drawLine0035.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0035];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(3427, 2224);
    drawArc0004.startDegrees = 0;
    drawArc0004.endDegrees = 45;
    drawArc0004.radius = 150;
    drawArc0004.width = 21.5;
    drawArc0004.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(3577, 2224);
    drawLine0036.endPoint = CGPointMake(3577, 2205);
    drawLine0036.width = 21.5;
    drawLine0036.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0036];

    // Добавляем станцию "Сокольники"
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0007.elements addObject:station0016];
    
    station0016.nameOriginal = @"Сокольники";
    station0016.nameEnglish = @"Sokolniki";
    station0016.mapLocation = CGPointMake(3577, 2205);
    station0016.geoLocation = CGPointMake(55.789252, 37.679684);
    
    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(3577, 2205);
    drawLine0037.endPoint = CGPointMake(3608, 2205);
    drawLine0037.width = 21.5;
    drawLine0037.color = line0001.color;
    [station0016.drawPrimitives addObject:drawLine0037];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = station0016.nameOriginal;
    drawTextLine0043.fontName = @"HelveticaNeue";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 42;
    drawTextLine0043.origin = CGPointMake(3618, 2176);
    drawTextLine0043.kernSpacing = 0.2;
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0043];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = station0016.nameEnglish;
    drawTextLine0044.fontName = @"HelveticaNeue";
    drawTextLine0044.fontColor = stationNamesEnglishColor;
    drawTextLine0044.fontSize = 28;
    drawTextLine0044.kernSpacing = 0.4;
    drawTextLine0044.origin = CGPointMake(3618, 2221);
    [station0016.nameEnglishTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 2440;
    [edge0007.elements addObject:haul0016];
    
    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(3577, 2205.5);
    drawLine0038.endPoint = CGPointMake(3577, 2065);
    drawLine0038.width = 21.5;
    drawLine0038.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0038];

    // Добавляем станцию "Преображенская площадь"
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0007.elements addObject:station0017];
    
    station0017.nameOriginal = @"Преображенская площадь";
    station0017.nameEnglish = @"Preobrajenskaya Ploschad";
    station0017.mapLocation = CGPointMake(3577, 2065);
    station0017.geoLocation = CGPointMake(55.796240, 37.715474);
    
    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(3577, 2065);
    drawLine0039.endPoint = CGPointMake(3608, 2065);
    drawLine0039.width = 21.5;
    drawLine0039.color = line0001.color;
    [station0017.drawPrimitives addObject:drawLine0039];

    // Подложка
    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(3800, 2064);
    drawLine0040.endPoint = CGPointMake(3900, 2064);
    drawLine0040.width = 33;
    drawLine0040.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0017.nameOriginalTextPrimitives addObject:drawLine0040];

    // Подложка
    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(3850, 2139);
    drawLine0041.endPoint = CGPointMake(3950, 2139);
    drawLine0041.width = 24;
    drawLine0041.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0017.nameEnglishTextPrimitives addObject:drawLine0041];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = @"Преображенская";
    drawTextLine0045.fontName = @"HelveticaNeue";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 42;
    drawTextLine0045.origin = CGPointMake(3618, 2035);
    drawTextLine0045.kernSpacing = 0.8;
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0045];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = @"площадь";
    drawTextLine0046.fontName = @"HelveticaNeue";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 42;
    drawTextLine0046.origin = CGPointMake(3618, 2075);
    drawTextLine0046.kernSpacing = -0.7;
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0046];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = station0017.nameEnglish;
    drawTextLine0047.fontName = @"HelveticaNeue";
    drawTextLine0047.fontColor = stationNamesEnglishColor;
    drawTextLine0047.fontSize = 28;
    drawTextLine0047.kernSpacing = -0.2;
    drawTextLine0047.origin = CGPointMake(3618, 2120);
    [station0017.nameEnglishTextPrimitives addObject:drawTextLine0047];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 2070;
    [edge0007.elements addObject:haul0017];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(3577, 2065.5);
    drawLine0042.endPoint = CGPointMake(3577, 1915);
    drawLine0042.width = 21.5;
    drawLine0042.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0042];

    // Добавляем станцию "Черкизовская"
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0007.elements addObject:station0018];
    
    station0018.nameOriginal = @"Черкизовская";
    station0018.nameEnglish = @"Cherkizovskaya";
    station0018.mapLocation = CGPointMake(3577, 1915);
    station0018.geoLocation = CGPointMake(55.803944, 37.744760);

    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0018.mapLocation;
    fillCircle0016.radius = 31.5;
    fillCircle0016.fillColor = line0001.color;
    [station0018.drawPrimitives addObject:fillCircle0016];
    
    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0018.mapLocation;
    fillCircle0017.radius = 14;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0017];

    // Подложка
    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(3695, 1958);
    drawLine0043.endPoint = CGPointMake(3795, 1958);
    drawLine0043.width = 33;
    drawLine0043.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0018.nameOriginalTextPrimitives addObject:drawLine0043];

    // Подложка
    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(3733, 1993);
    drawLine0044.endPoint = CGPointMake(3833, 1993);
    drawLine0044.width = 24;
    drawLine0044.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0018.nameEnglishTextPrimitives addObject:drawLine0044];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0018.nameOriginal;
    drawTextLine0048.fontName = @"HelveticaNeue";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 42;
    drawTextLine0048.origin = CGPointMake(3615, 1928.5);
    drawTextLine0048.kernSpacing = 0.2;
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0048];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = station0018.nameEnglish;
    drawTextLine0049.fontName = @"HelveticaNeue";
    drawTextLine0049.fontColor = stationNamesEnglishColor;
    drawTextLine0049.fontSize = 28;
    drawTextLine0049.kernSpacing = -0.3;
    drawTextLine0049.origin = CGPointMake(3613, 1972.5);
    [station0018.nameEnglishTextPrimitives addObject:drawTextLine0049];

    // Добавляем вершину
    edge0007.finishVertex = vertex0047;
    
    // Создаем участок линии Черкизовская - Бульвар Рокоссовского
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0074 = [[MWEdge alloc] init];
    edge0074.identifier = @"edge0074";
    edge0074.developmentName = @"Ребро: Черкизовская - Бульвар Рокоссовского";
    [self.edges addObject:edge0074];
    
    // Добавляем линию
    edge0074.line = line0001;
    
    // Добавляем вершину
    edge0074.startVertex = vertex0047;
    
    // Добавляем станцию "Черкизовская"
    [edge0074.elements addObject:station0018];

    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1060;
    [edge0074.elements addObject:haul0018];
    
    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(3577, 1915.5);
    drawLine0045.endPoint = CGPointMake(3577, 1731);
    drawLine0045.width = 21.5;
    drawLine0045.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0045];

    // Добавляем станцию "Бульвар Рокоссовского"
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0074.elements addObject:station0019];
    
    station0019.nameOriginal = @"Бульвар Рокоссовского";
    station0019.nameEnglish = @"Bulvar Rokossovskogo";
    station0019.mapLocation = CGPointMake(3577, 1731);
    station0019.geoLocation = CGPointMake(55.814528, 37.734261);

    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0019.mapLocation;
    fillCircle0018.radius = 31.5;
    fillCircle0018.fillColor = line0001.color;
    [station0019.drawPrimitives addObject:fillCircle0018];
    
    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0019.mapLocation;
    fillCircle0019.radius = 14;
    fillCircle0019.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0019];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = station0019.nameOriginal;
    drawTextLine0050.fontName = @"HelveticaNeue";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 42;
    drawTextLine0050.origin = CGPointMake(3460, 1651);
    drawTextLine0050.kernSpacing = -0.3;
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0050];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = station0019.nameEnglish;
    drawTextLine0051.fontName = @"HelveticaNeue";
    drawTextLine0051.fontColor = stationNamesEnglishColor;
    drawTextLine0051.fontSize = 28;
    drawTextLine0051.kernSpacing = -0.6;
    drawTextLine0051.origin = CGPointMake(3460, 1624.5);
    [station0019.nameEnglishTextPrimitives addObject:drawTextLine0051];

    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = CGPointMake(3652, 1737.5); //(1117, 5710.5);
    fillCircle0020.radius = 32;
    fillCircle0020.fillColor = line0001.color;
    [station0019.drawPrimitives addObject:fillCircle0020];
    
    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = @"1";
    drawTextLine0052.fontName = @"Georgia-Bold";
    drawTextLine0052.fontColor = [UIColor whiteColor];
    drawTextLine0052.fontSize = 56;
    drawTextLine0052.origin = CGPointMake(3638.5, 1700.5);
    [station0019.drawPrimitives addObject:drawTextLine0052];
    
    // Добавляем вершину
    edge0074.finishVertex = vertex0008;
    
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
    station0020.mapLocation = CGPointMake(4062, 6115);
    station0020.geoLocation = CGPointMake(55.632812, 37.766058);
    
    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = CGPointMake(4124, 6115.5);
    fillCircle0021.radius = 32;
    fillCircle0021.fillColor = line0002.color;
    [station0020.drawPrimitives addObject:fillCircle0021];
    
    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = @"2";
    drawTextLine0053.fontName = @"Georgia-Bold";
    drawTextLine0053.fontColor = [UIColor whiteColor];
    drawTextLine0053.fontSize = 56;
    drawTextLine0053.origin = CGPointMake(4107.5, 6078.5);
    [station0020.drawPrimitives addObject:drawTextLine0053];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(4062, 6084);
    drawLine0046.endPoint = CGPointMake(4062, 6146);
    drawLine0046.width = 21.5;
    drawLine0046.color = line0002.color;
    [station0020.drawPrimitives addObject:drawLine0046];
    
    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = station0020.nameOriginal;
    drawTextLine0054.fontName = @"HelveticaNeue";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 42;
    drawTextLine0054.origin = CGPointMake(3948, 6141);
    drawTextLine0054.kernSpacing = 0.6;
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0054];

    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = station0020.nameEnglish;
    drawTextLine0055.fontName = @"HelveticaNeue";
    drawTextLine0055.fontColor = stationNamesEnglishColor;
    drawTextLine0055.fontSize = 28;
    drawTextLine0055.kernSpacing = -0.1;
    drawTextLine0055.origin = CGPointMake(3948, 6186);
    [station0020.nameEnglishTextPrimitives addObject:drawTextLine0055];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 2840;
    [edge0008.elements addObject:haul0019];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(4062, 6115);
    drawLine0047.endPoint = CGPointMake(3591, 6115);
    drawLine0047.width = 21.5;
    drawLine0047.color = line0002.color;
    [haul0019.drawPrimitives addObject:drawLine0047];

    // Добавляем станцию "Красногвардейская"
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0008.elements addObject:station0021];
    
    station0021.nameOriginal = @"Красногвардейская";
    station0021.nameEnglish = @"Krasnogvardeyskaya";
    station0021.mapLocation = CGPointMake(3591, 6115);
    station0021.geoLocation = CGPointMake(55.613868, 37.744543);

    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0021.mapLocation;
    fillCircle0022.radius = 31.5;
    fillCircle0022.fillColor = line0002.color;
    [station0021.drawPrimitives addObject:fillCircle0022];
    
    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0021.mapLocation;
    fillCircle0023.radius = 14;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0023];

    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = station0021.nameOriginal;
    drawTextLine0056.fontName = @"HelveticaNeue";
    drawTextLine0056.fontColor = [UIColor blackColor];
    drawTextLine0056.fontSize = 42;
    drawTextLine0056.origin = CGPointMake(3398, 6141);
    drawTextLine0056.kernSpacing = 0.1;
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0056];
    
    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = station0021.nameEnglish;
    drawTextLine0057.fontName = @"HelveticaNeue";
    drawTextLine0057.fontColor = stationNamesEnglishColor;
    drawTextLine0057.fontSize = 28;
    drawTextLine0057.kernSpacing = -0.4;
    drawTextLine0057.origin = CGPointMake(3470, 6186);
    [station0021.nameEnglishTextPrimitives addObject:drawTextLine0057];

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
    
    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(3591.5, 6115);
    drawLine0048.endPoint = CGPointMake(3041, 6115);
    drawLine0048.width = 21.5;
    drawLine0048.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0048];

    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(3041, 6005);
    drawArc0005.startDegrees = 90;
    drawArc0005.endDegrees = 180;
    drawArc0005.radius = 110;
    drawArc0005.width = 21.5;
    drawArc0005.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(2931, 6005.5);
    drawLine0049.endPoint = CGPointMake(2931, 5959);
    drawLine0049.width = 21.5;
    drawLine0049.color = line0002.color;
    [haul0020.drawPrimitives addObject:drawLine0049];

    // Добавляем станцию "Домодедовская"
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0009.elements addObject:station0022];
    
    station0022.nameOriginal = @"Домодедовская";
    station0022.nameEnglish = @"Domodedovskaya";
    station0022.mapLocation = CGPointMake(2931, 5959);
    station0022.geoLocation = CGPointMake(55.610952, 37.719091);
    
    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(2931, 5959);
    drawLine0050.endPoint = CGPointMake(2962, 5959);
    drawLine0050.width = 21.5;
    drawLine0050.color = line0002.color;
    [station0022.drawPrimitives addObject:drawLine0050];

    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = station0022.nameOriginal;
    drawTextLine0058.fontName = @"HelveticaNeue";
    drawTextLine0058.fontColor = [UIColor blackColor];
    drawTextLine0058.fontSize = 42;
    drawTextLine0058.origin = CGPointMake(2972, 5929);
    drawTextLine0058.kernSpacing = 0.4;
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0058];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = station0022.nameEnglish;
    drawTextLine0059.fontName = @"HelveticaNeue";
    drawTextLine0059.fontColor = stationNamesEnglishColor;
    drawTextLine0059.fontSize = 28;
    drawTextLine0059.kernSpacing = -0.4;
    drawTextLine0059.origin = CGPointMake(2972, 5974);
    [station0022.nameEnglishTextPrimitives addObject:drawTextLine0059];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 1460;
    [edge0009.elements addObject:haul0021];
    
    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(2931, 5959.5);
    drawLine0051.endPoint = CGPointMake(2931, 5816);
    drawLine0051.width = 21.5;
    drawLine0051.color = line0002.color;
    [haul0021.drawPrimitives addObject:drawLine0051];

    // Добавляем станцию "Орехово"
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0009.elements addObject:station0023];
    
    station0023.nameOriginal = @"Орехово";
    station0023.nameEnglish = @"Orekhovo";
    station0023.mapLocation = CGPointMake(2931, 5816);
    station0023.geoLocation = CGPointMake(55.613196, 37.694965);
    
    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(2931, 5816);
    drawLine0052.endPoint = CGPointMake(2962, 5816);
    drawLine0052.width = 21.5;
    drawLine0052.color = line0002.color;
    [station0023.drawPrimitives addObject:drawLine0052];

    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = station0023.nameOriginal;
    drawTextLine0060.fontName = @"HelveticaNeue";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 42;
    drawTextLine0060.origin = CGPointMake(2972, 5787);
    drawTextLine0060.kernSpacing = 1.2;
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0060];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = station0023.nameEnglish;
    drawTextLine0061.fontName = @"HelveticaNeue";
    drawTextLine0061.fontColor = stationNamesEnglishColor;
    drawTextLine0061.fontSize = 28;
    drawTextLine0061.kernSpacing = 0.3;
    drawTextLine0061.origin = CGPointMake(2973, 5832);
    [station0023.nameEnglishTextPrimitives addObject:drawTextLine0061];

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 1890;
    [edge0009.elements addObject:haul0022];
    
    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(2931, 5816.5);
    drawLine0053.endPoint = CGPointMake(2931, 5671.5);
    drawLine0053.width = 21.5;
    drawLine0053.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0053];

    // Добавляем станцию "Царицино"
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0009.elements addObject:station0024];
    
    station0024.nameOriginal = @"Царицино";
    station0024.nameEnglish = @"Tsaritsino";
    station0024.mapLocation = CGPointMake(2931, 5671.5);
    station0024.geoLocation = CGPointMake(55.621456, 37.669453);

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(2931, 5671.5);
    drawLine0054.endPoint = CGPointMake(2962, 5671.5);
    drawLine0054.width = 21.5;
    drawLine0054.color = line0002.color;
    [station0024.drawPrimitives addObject:drawLine0054];

    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = station0024.nameOriginal;
    drawTextLine0062.fontName = @"HelveticaNeue";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 42;
    drawTextLine0062.origin = CGPointMake(2972, 5641.5);
    drawTextLine0062.kernSpacing = 1.4;
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0062];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = station0024.nameEnglish;
    drawTextLine0063.fontName = @"HelveticaNeue";
    drawTextLine0063.fontColor = stationNamesEnglishColor;
    drawTextLine0063.fontSize = 28;
    drawTextLine0063.kernSpacing = 0.3;
    drawTextLine0063.origin = CGPointMake(2973, 5686);
    [station0024.nameEnglishTextPrimitives addObject:drawTextLine0063];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 1880;
    [edge0009.elements addObject:haul0023];
    
    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(2931, 5672);
    drawLine0055.endPoint = CGPointMake(2931, 5533);
    drawLine0055.width = 21.5;
    drawLine0055.color = line0002.color;
    [haul0023.drawPrimitives addObject:drawLine0055];

    // Добавляем станцию "Кантемировская"
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0009.elements addObject:station0025];
    
    station0025.nameOriginal = @"Кантемировская";
    station0025.nameEnglish = @"Kantemirovskaya";
    station0025.mapLocation = CGPointMake(2931, 5533);
    station0025.geoLocation = CGPointMake(55.635716, 37.656596);
    
    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(2931, 5533);
    drawLine0056.endPoint = CGPointMake(2962, 5533);
    drawLine0056.width = 21.5;
    drawLine0056.color = line0002.color;
    [station0025.drawPrimitives addObject:drawLine0056];

    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = station0025.nameOriginal;
    drawTextLine0064.fontName = @"HelveticaNeue";
    drawTextLine0064.fontColor = [UIColor blackColor];
    drawTextLine0064.fontSize = 42;
    drawTextLine0064.origin = CGPointMake(2972, 5503);
    drawTextLine0064.kernSpacing = 0.6;
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0064];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = station0025.nameEnglish;
    drawTextLine0065.fontName = @"HelveticaNeue";
    drawTextLine0065.fontColor = stationNamesEnglishColor;
    drawTextLine0065.fontSize = 28;
    drawTextLine0065.kernSpacing = -0.1;
    drawTextLine0065.origin = CGPointMake(2973, 5548);
    [station0025.nameEnglishTextPrimitives addObject:drawTextLine0065];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 2230;
    [edge0009.elements addObject:haul0024];
    
    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(2931, 5533.5);
    drawLine0057.endPoint = CGPointMake(2931, 5389.5);
    drawLine0057.width = 21.5;
    drawLine0057.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0057];

    // Добавляем станцию "Каширская"
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0009.elements addObject:station0026];
    
    station0026.nameOriginal = @"Каширская";
    station0026.nameEnglish = @"Kashirskaya";
    station0026.mapLocation = CGPointMake(2931, 5389.5);
    station0026.geoLocation = CGPointMake(55.655134, 37.648845);
    
    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0026.mapLocation;
    fillCircle0024.radius = 31.5;
    fillCircle0024.fillColor = line0002.color;
    [station0026.drawPrimitives addObject:fillCircle0024];
    
    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0026.mapLocation;
    fillCircle0025.radius = 14;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0025];

    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = station0026.nameOriginal;
    drawTextLine0066.fontName = @"HelveticaNeue";
    drawTextLine0066.fontColor = [UIColor blackColor];
    drawTextLine0066.fontSize = 42;
    drawTextLine0066.origin = CGPointMake(2973, 5361);
    drawTextLine0066.kernSpacing = 0.4;
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0066];
    
    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = station0026.nameEnglish;
    drawTextLine0067.fontName = @"HelveticaNeue";
    drawTextLine0067.fontColor = stationNamesEnglishColor;
    drawTextLine0067.fontSize = 28;
    drawTextLine0067.kernSpacing = -0.4;
    drawTextLine0067.origin = CGPointMake(2974, 5335);
    [station0026.nameEnglishTextPrimitives addObject:drawTextLine0067];

    // Добавляем вершину
    edge0009.finishVertex = vertex0011;
    
    // Создаем участок линии Каширская - Автозаводская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Каширская - Автозаводская";
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
    
    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(2931, 5390);
    drawLine0058.endPoint = CGPointMake(2931, 5230);
    drawLine0058.width = 21.5;
    drawLine0058.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0058];

    // Добавляем станцию "Коломенская"
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0010.elements addObject:station0027];
    
    station0027.nameOriginal = @"Коломенская";
    station0027.nameEnglish = @"Kolomenskaya";
    station0027.mapLocation = CGPointMake(2931, 5230);
    station0027.geoLocation = CGPointMake(55.678270, 37.663842);
    
    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(2931, 5230);
    drawLine0059.endPoint = CGPointMake(2962, 5230);
    drawLine0059.width = 21.5;
    drawLine0059.color = line0002.color;
    [station0027.drawPrimitives addObject:drawLine0059];

    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = station0027.nameOriginal;
    drawTextLine0068.fontName = @"HelveticaNeue";
    drawTextLine0068.fontColor = [UIColor blackColor];
    drawTextLine0068.fontSize = 42;
    drawTextLine0068.origin = CGPointMake(2973, 5201);
    drawTextLine0068.kernSpacing = 0.6;
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0068];

    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = station0027.nameEnglish;
    drawTextLine0069.fontName = @"HelveticaNeue";
    drawTextLine0069.fontColor = stationNamesEnglishColor;
    drawTextLine0069.fontSize = 28;
    drawTextLine0069.kernSpacing = -0.3;
    drawTextLine0069.origin = CGPointMake(2974, 5174);
    [station0027.nameEnglishTextPrimitives addObject:drawTextLine0069];

    // Добавляем перегон
    MWHaul *haul0188 = [[MWHaul alloc] init];
    haul0188.identifier = @"haul0188";
    haul0188.length = 1720;
    [edge0010.elements addObject:haul0188];

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(2931, 5230.5);
    drawLine0060.endPoint = CGPointMake(2931, 5094);
    drawLine0060.width = 21.5;
    drawLine0060.color = line0002.color;
    [haul0188.drawPrimitives addObject:drawLine0060];

    // Добавляем станцию "Технопарк"
    MWStation *station0200 = [[MWStation alloc] init];
    station0200.identifier = @"station0200";
    [edge0010.elements addObject:station0200];
    
    station0200.nameOriginal = @"Технопарк";
    station0200.nameEnglish = @"Tekhnopark";
    station0200.mapLocation = CGPointMake(2931, 5094);
    station0200.geoLocation = CGPointMake(55.695, 37.664167);

    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(2931, 5094);
    drawLine0061.endPoint = CGPointMake(2962, 5094);
    drawLine0061.width = 21.5;
    drawLine0061.color = line0002.color;
    [station0200.drawPrimitives addObject:drawLine0061];

    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = station0200.nameOriginal;
    drawTextLine0070.fontName = @"HelveticaNeue";
    drawTextLine0070.fontColor = [UIColor blackColor];
    drawTextLine0070.fontSize = 42;
    drawTextLine0070.origin = CGPointMake(2974, 5065);
    drawTextLine0070.kernSpacing = 1.0;
    [station0200.nameOriginalTextPrimitives addObject:drawTextLine0070];
    
    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = station0200.nameEnglish;
    drawTextLine0071.fontName = @"HelveticaNeue";
    drawTextLine0071.fontColor = stationNamesEnglishColor;
    drawTextLine0071.fontSize = 28;
    drawTextLine0071.kernSpacing = 0.4;
    drawTextLine0071.origin = CGPointMake(2974, 5039);
    [station0200.nameEnglishTextPrimitives addObject:drawTextLine0071];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 1480;
    [edge0010.elements addObject:haul0026];
    
    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(2931, 5094.5);
    drawLine0062.endPoint = CGPointMake(2931, 4844.5);
    drawLine0062.width = 21.5;
    drawLine0062.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0062];

    // Добавляем станцию "Автозаводская"
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0010.elements addObject:station0028];
    
    station0028.nameOriginal = @"Автозаводская";
    station0028.nameEnglish = @"Avtozavodskaya";
    station0028.mapLocation = CGPointMake(2931, 4844.5);
    station0028.geoLocation = CGPointMake(55.707392, 37.657299);

    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0028.mapLocation;
    fillCircle0026.radius = 31.5;
    fillCircle0026.fillColor = line0002.color;
    [station0028.drawPrimitives addObject:fillCircle0026];
    
    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0028.mapLocation;
    fillCircle0027.radius = 14;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0027];
    
    // Подложка
    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(3110, 4869);
    drawLine0063.endPoint = CGPointMake(3330, 4869);
    drawLine0063.width = 36;
    drawLine0063.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0028.nameOriginalTextPrimitives addObject:drawLine0063];

    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = station0028.nameOriginal;
    drawTextLine0072.fontName = @"HelveticaNeue";
    drawTextLine0072.fontColor = [UIColor blackColor];
    drawTextLine0072.fontSize = 42;
    drawTextLine0072.origin = CGPointMake(2987, 4841);
    drawTextLine0072.kernSpacing = -0.2;
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0072];
    
    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = station0028.nameEnglish;
    drawTextLine0073.fontName = @"HelveticaNeue";
    drawTextLine0073.fontColor = stationNamesEnglishColor;
    drawTextLine0073.fontSize = 28;
    drawTextLine0073.kernSpacing = -0.5;
    drawTextLine0073.origin = CGPointMake(2991, 4814);
    [station0028.nameEnglishTextPrimitives addObject:drawTextLine0073];

    // Добавляем вершину
    edge0010.finishVertex = vertex0051;
    
    // Создаем участок линии Каширская - Павелецкая
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0078 = [[MWEdge alloc] init];
    edge0078.identifier = @"edge0078";
    edge0078.developmentName = @"Ребро: Каширская - Павелецкая";
    [self.edges addObject:edge0078];
    
    // Добавляем линию
    edge0078.line = line0002;
    
    // Добавляем вершину
    edge0078.startVertex = vertex0051;

    // Добавляем станцию "Автозаводская"
    [edge0078.elements addObject:station0028];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 2820;
    [edge0078.elements addObject:haul0027];
    
    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(2931, 4845);
    drawLine0064.endPoint = CGPointMake(2931, 4174);
    drawLine0064.width = 21.5;
    drawLine0064.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0064];

    // Добавляем станцию "Павелецкая"
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0078.elements addObject:station0029];
    
    station0029.nameOriginal = @"Павелецкая";
    station0029.nameEnglish = @"Paveletskaya";
    station0029.mapLocation = CGPointMake(2931, 4174);
    station0029.geoLocation = CGPointMake(55.731267, 37.636264);
    
    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0029.mapLocation;
    fillCircle0028.radius = 31.5;
    fillCircle0028.fillColor = line0002.color;
    [station0029.drawPrimitives addObject:fillCircle0028];
    
    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0029.mapLocation;
    fillCircle0029.radius = 14;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0029];

    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = station0029.nameOriginal;
    drawTextLine0074.fontName = @"HelveticaNeue";
    drawTextLine0074.fontColor = [UIColor blackColor];
    drawTextLine0074.fontSize = 42;
    drawTextLine0074.origin = CGPointMake(2972, 4144);
    drawTextLine0074.kernSpacing = 0.4;
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0074];
    
    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = station0029.nameEnglish;
    drawTextLine0075.fontName = @"HelveticaNeue";
    drawTextLine0075.fontColor = stationNamesEnglishColor;
    drawTextLine0075.fontSize = 28;
    drawTextLine0075.kernSpacing = -0.4;
    drawTextLine0075.origin = CGPointMake(2972, 4189);
    [station0029.nameEnglishTextPrimitives addObject:drawTextLine0075];

    // Добавляем вершину
    edge0078.finishVertex = vertex0012;
    
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
    
    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(2931, 4174.5);
    drawLine0065.endPoint = CGPointMake(2931, 3805);
    drawLine0065.width = 21.5;
    drawLine0065.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawLine0065];

    // Добавляем станцию "Новокузнецкая"
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0011.elements addObject:station0030];
    
    station0030.nameOriginal = @"Новокузнецкая";
    station0030.nameEnglish = @"Novokuznetskaya";
    station0030.mapLocation = CGPointMake(2931, 3805);
    station0030.geoLocation = CGPointMake(55.742426, 37.629261);
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0030.mapLocation;
    fillCircle0030.radius = 31.5;
    fillCircle0030.fillColor = line0002.color;
    [station0030.drawPrimitives addObject:fillCircle0030];
    
    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0030.mapLocation;
    fillCircle0031.radius = 14;
    fillCircle0031.fillColor = [UIColor whiteColor];
    [station0030.drawPrimitives addObject:fillCircle0031];

    // Подложка
    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(2965, 3804);
    drawLine0066.endPoint = CGPointMake(3030, 3804);
    drawLine0066.width = 48;
    drawLine0066.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0030.nameOriginalTextPrimitives addObject:drawLine0066];

    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0030.nameOriginal;
    drawTextLine0076.fontName = @"HelveticaNeue";
    drawTextLine0076.fontColor = [UIColor blackColor];
    drawTextLine0076.fontSize = 42;
    drawTextLine0076.origin = CGPointMake(2971, 3780);
    drawTextLine0076.kernSpacing = 0.4;
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0076];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = station0030.nameEnglish;
    drawTextLine0077.fontName = @"HelveticaNeue";
    drawTextLine0077.fontColor = stationNamesEnglishColor;
    drawTextLine0077.fontSize = 28;
    drawTextLine0077.kernSpacing = -0.3;
    drawTextLine0077.origin = CGPointMake(2971, 3824);
    [station0030.nameEnglishTextPrimitives addObject:drawTextLine0077];

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
    
    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(2931, 3805.5);
    drawLine0067.endPoint = CGPointMake(2931, 3689);
    drawLine0067.width = 21.5;
    drawLine0067.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0067];

    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(2781, 3689);
    drawArc0006.startDegrees = 315;
    drawArc0006.endDegrees = 0;
    drawArc0006.radius = 150;
    drawArc0006.width = 21.5;
    drawArc0006.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawArc0006];

    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(2744.5, 3440.5);
    drawLine0068.endPoint = CGPointMake(2888, 3584);
    drawLine0068.width = 21.5;
    drawLine0068.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0068];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(2639, 3547);
    drawArc0007.startDegrees = 270;
    drawArc0007.endDegrees = 315;
    drawArc0007.radius = 150;
    drawArc0007.width = 21.5;
    drawArc0007.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(2639, 3397);
    drawLine0069.endPoint = CGPointMake(2569, 3397);
    drawLine0069.width = 21.5;
    drawLine0069.color = line0002.color;
    [haul0029.drawPrimitives addObject:drawLine0069];

    // Добавляем станцию "Театральная"
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0012.elements addObject:station0031];
    
    station0031.nameOriginal = @"Театральная";
    station0031.nameEnglish = @"Teatralnaya";
    station0031.mapLocation = CGPointMake(2569, 3397);
    station0031.geoLocation = CGPointMake(55.757599, 37.618739);
    
    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0031.mapLocation;
    fillCircle0032.radius = 31.5;
    fillCircle0032.fillColor = line0002.color;
    [station0031.drawPrimitives addObject:fillCircle0032];
    
    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0031.mapLocation;
    fillCircle0033.radius = 14;
    fillCircle0033.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0033];
    
    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = station0031.nameOriginal;
    drawTextLine0078.fontName = @"HelveticaNeue";
    drawTextLine0078.fontColor = [UIColor blackColor];
    drawTextLine0078.fontSize = 42;
    drawTextLine0078.origin = CGPointMake(2593, 3330);
    drawTextLine0078.kernSpacing = 0.1;
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0078];
    
    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = station0031.nameEnglish;
    drawTextLine0079.fontName = @"HelveticaNeue";
    drawTextLine0079.fontColor = stationNamesEnglishColor;
    drawTextLine0079.fontSize = 28;
    drawTextLine0079.kernSpacing = -1.4;
    drawTextLine0079.origin = CGPointMake(2852, 3342);
    [station0031.nameEnglishTextPrimitives addObject:drawTextLine0079];

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
    
    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(2569.5, 3397);
    drawLine0070.endPoint = CGPointMake(2492, 3397);
    drawLine0070.width = 21.5;
    drawLine0070.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0070];

    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(2492.5, 3247);
    drawArc0008.startDegrees = 90;
    drawArc0008.endDegrees = 135;
    drawArc0008.radius = 150;
    drawArc0008.width = 21.5;
    drawArc0008.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawArc0008];

    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(2387, 3353.5);
    drawLine0071.endPoint = CGPointMake(2120, 3086.5);
    drawLine0071.width = 21.5;
    drawLine0071.color = line0002.color;
    [haul0030.drawPrimitives addObject:drawLine0071];

    // Добавляем станцию "Тверская"
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0013.elements addObject:station0032];
    
    station0032.nameOriginal = @"Тверская";
    station0032.nameEnglish = @"Tverskaya";
    station0032.mapLocation = CGPointMake(2120, 3086.5);
    station0032.geoLocation = CGPointMake(55.764847, 37.604858);
    
    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0032.mapLocation;
    fillCircle0034.radius = 31.5;
    fillCircle0034.fillColor = line0002.color;
    [station0032.drawPrimitives addObject:fillCircle0034];
    
    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0032.mapLocation;
    fillCircle0035.radius = 14;
    fillCircle0035.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0035];

    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = station0032.nameOriginal;
    drawTextLine0080.fontName = @"HelveticaNeue";
    drawTextLine0080.fontColor = [UIColor blackColor];
    drawTextLine0080.fontSize = 42;
    drawTextLine0080.origin = CGPointMake(1905, 3093);
    drawTextLine0080.kernSpacing = 0.1;
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0080];
    
    MWDrawTextLine *drawTextLine0081 = [[MWDrawTextLine alloc] init];
    drawTextLine0081.text = station0032.nameEnglish;
    drawTextLine0081.fontName = @"HelveticaNeue";
    drawTextLine0081.fontColor = stationNamesEnglishColor;
    drawTextLine0081.fontSize = 28;
    drawTextLine0081.kernSpacing = -0.6;
    drawTextLine0081.origin = CGPointMake(1969, 3138);
    [station0032.nameEnglishTextPrimitives addObject:drawTextLine0081];

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
    
    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(2120, 3087);
    drawLine0072.endPoint = CGPointMake(1819, 2785);
    drawLine0072.width = 21.5;
    drawLine0072.color = line0002.color;
    [haul0031.drawPrimitives addObject:drawLine0072];

    // Добавляем станцию "Маяковская"
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0014.elements addObject:station0033];
    
    station0033.nameOriginal = @"Маяковская";
    station0033.nameEnglish = @"Mayakovskaya";
    station0033.mapLocation = CGPointMake(1819, 2785);
    station0033.geoLocation = CGPointMake(55.770113, 37.595956);
    
    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(1819, 2785);
    drawLine0073.endPoint = CGPointMake(1841, 2763);
    drawLine0073.width = 21.5;
    drawLine0073.color = line0002.color;
    [station0033.drawPrimitives addObject:drawLine0073];

    MWDrawTextLine *drawTextLine0082 = [[MWDrawTextLine alloc] init];
    drawTextLine0082.text = station0033.nameOriginal;
    drawTextLine0082.fontName = @"HelveticaNeue";
    drawTextLine0082.fontColor = [UIColor blackColor];
    drawTextLine0082.fontSize = 42;
    drawTextLine0082.origin = CGPointMake(1846, 2718);
    drawTextLine0082.kernSpacing = 0.9;
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0082];
    
    MWDrawTextLine *drawTextLine0083 = [[MWDrawTextLine alloc] init];
    drawTextLine0083.text = station0033.nameEnglish;
    drawTextLine0083.fontName = @"HelveticaNeue";
    drawTextLine0083.fontColor = stationNamesEnglishColor;
    drawTextLine0083.fontSize = 28;
    drawTextLine0083.kernSpacing = -0.2;
    drawTextLine0083.origin = CGPointMake(1848, 2691);
    [station0033.nameEnglishTextPrimitives addObject:drawTextLine0083];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 1230;
    [edge0014.elements addObject:haul0032];
    
    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(1819.5, 2785.5);
    drawLine0074.endPoint = CGPointMake(1695.5, 2662);
    drawLine0074.width = 21.5;
    drawLine0074.color = line0002.color;
    [haul0032.drawPrimitives addObject:drawLine0074];

    // Добавляем станцию "Белорусская"
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0014.elements addObject:station0034];
    
    station0034.nameOriginal = @"Белорусская";
    station0034.nameEnglish = @"Belorusskaya";
    station0034.mapLocation = CGPointMake(1695.5, 2662);
    station0034.geoLocation = CGPointMake(55.777093, 37.581844);
    
    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0034.mapLocation;
    fillCircle0036.radius = 31.5;
    fillCircle0036.fillColor = line0002.color;
    [station0034.drawPrimitives addObject:fillCircle0036];
    
    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0034.mapLocation;
    fillCircle0037.radius = 14;
    fillCircle0037.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0037];

    MWDrawTextLine *drawTextLine0084 = [[MWDrawTextLine alloc] init];
    drawTextLine0084.text = station0034.nameOriginal;
    drawTextLine0084.fontName = @"HelveticaNeue";
    drawTextLine0084.fontColor = [UIColor blackColor];
    drawTextLine0084.fontSize = 42;
    drawTextLine0084.origin = CGPointMake(1403, 2672);
    drawTextLine0084.kernSpacing = -1.0;
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0084];

    MWDrawTextLine *drawTextLine0085 = [[MWDrawTextLine alloc] init];
    drawTextLine0085.text = station0034.nameEnglish;
    drawTextLine0085.fontName = @"HelveticaNeue";
    drawTextLine0085.fontColor = stationNamesEnglishColor;
    drawTextLine0085.fontSize = 28;
    drawTextLine0085.kernSpacing = -0.2;
    drawTextLine0085.origin = CGPointMake(1470, 2645);
    [station0034.nameEnglishTextPrimitives addObject:drawTextLine0085];

    // Добавляем вершину
    edge0014.finishVertex = vertex0015;
    
    // Создаем участок линии Белорусская - Войковская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0015 = [[MWEdge alloc] init];
    edge0015.identifier = @"edge0015";
    edge0015.developmentName = @"Ребро: Белорусская - Войковская";
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
    
    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(1696, 2662.5);
    drawLine0075.endPoint = CGPointMake(1478.5, 2445);
    drawLine0075.width = 21.5;
    drawLine0075.color = line0002.color;
    [haul0033.drawPrimitives addObject:drawLine0075];

    // Добавляем станцию "Динамо"
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0015.elements addObject:station0035];
    
    station0035.nameOriginal = @"Динамо";
    station0035.nameEnglish = @"Dinamo";
    station0035.mapLocation = CGPointMake(1478.5, 2445);
    station0035.geoLocation = CGPointMake(55.789710, 37.558185);
    
    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0035.mapLocation;
    fillCircle0038.radius = 31.5;
    fillCircle0038.fillColor = line0002.color;
    [station0035.drawPrimitives addObject:fillCircle0038];
    
    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0035.mapLocation;
    fillCircle0039.radius = 14;
    fillCircle0039.fillColor = [UIColor whiteColor];
    [station0035.drawPrimitives addObject:fillCircle0039];

    MWDrawTextLine *drawTextLine0086 = [[MWDrawTextLine alloc] init];
    drawTextLine0086.text = station0035.nameOriginal;
    drawTextLine0086.fontName = @"HelveticaNeue";
    drawTextLine0086.fontColor = [UIColor blackColor];
    drawTextLine0086.fontSize = 42;
    drawTextLine0086.origin = CGPointMake(1522, 2416);
    drawTextLine0086.kernSpacing = 1.4;
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0086];
    
    MWDrawTextLine *drawTextLine0087 = [[MWDrawTextLine alloc] init];
    drawTextLine0087.text = station0035.nameEnglish;
    drawTextLine0087.fontName = @"HelveticaNeue";
    drawTextLine0087.fontColor = stationNamesEnglishColor;
    drawTextLine0087.fontSize = 28;
    drawTextLine0087.kernSpacing = 0.2;
    drawTextLine0087.origin = CGPointMake(1522, 2389);
    [station0035.nameEnglishTextPrimitives addObject:drawTextLine0087];

    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 1980;
    [edge0015.elements addObject:haul0034];

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(1479, 2445.5);
    drawLine0076.endPoint = CGPointMake(1363.5, 2330);
    drawLine0076.width = 21.5;
    drawLine0076.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0076];

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(1470, 2224.5);
    drawArc0009.startDegrees = 135;
    drawArc0009.endDegrees = 180;
    drawArc0009.radius = 150;
    drawArc0009.width = 21.5;
    drawArc0009.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawArc0009];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(1320, 2225);
    drawLine0077.endPoint = CGPointMake(1320, 2199.5);
    drawLine0077.width = 21.5;
    drawLine0077.color = line0002.color;
    [haul0034.drawPrimitives addObject:drawLine0077];

    // Добавляем станцию "Аэропорт"
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0015.elements addObject:station0036];
    
    station0036.nameOriginal = @"Аэропорт";
    station0036.nameEnglish = @"Aeroport";
    station0036.mapLocation = CGPointMake(1320, 2199.5);
    station0036.geoLocation = CGPointMake(55.800365, 37.532631);

    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(1320, 2199.5);
    drawLine0078.endPoint = CGPointMake(1352, 2199.5);
    drawLine0078.width = 21.5;
    drawLine0078.color = line0002.color;
    [station0036.drawPrimitives addObject:drawLine0078];

    MWDrawTextLine *drawTextLine0088 = [[MWDrawTextLine alloc] init];
    drawTextLine0088.text = station0036.nameOriginal;
    drawTextLine0088.fontName = @"HelveticaNeue";
    drawTextLine0088.fontColor = [UIColor blackColor];
    drawTextLine0088.fontSize = 42;
    drawTextLine0088.origin = CGPointMake(1361, 2170);
    drawTextLine0088.kernSpacing = 0.8;
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0088];
    
    MWDrawTextLine *drawTextLine0089 = [[MWDrawTextLine alloc] init];
    drawTextLine0089.text = station0036.nameEnglish;
    drawTextLine0089.fontName = @"HelveticaNeue";
    drawTextLine0089.fontColor = stationNamesEnglishColor;
    drawTextLine0089.fontSize = 28;
    drawTextLine0089.kernSpacing = 0.8;
    drawTextLine0089.origin = CGPointMake(1360, 2215);
    [station0036.nameEnglishTextPrimitives addObject:drawTextLine0089];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 1250;
    [edge0015.elements addObject:haul0035];
    
    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(1320, 2200);
    drawLine0079.endPoint = CGPointMake(1320, 2101);
    drawLine0079.width = 21.5;
    drawLine0079.color = line0002.color;
    [haul0035.drawPrimitives addObject:drawLine0079];

    // Добавляем станцию "Сокол"
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0015.elements addObject:station0037];
    
    station0037.nameOriginal = @"Сокол";
    station0037.nameEnglish = @"Sokol";
    station0037.mapLocation = CGPointMake(1320, 2101);
    station0037.geoLocation = CGPointMake(55.804781, 37.515548);
    
    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(1320, 2101);
    drawLine0080.endPoint = CGPointMake(1352, 2101);
    drawLine0080.width = 21.5;
    drawLine0080.color = line0002.color;
    [station0037.drawPrimitives addObject:drawLine0080];

    MWDrawTextLine *drawTextLine0090 = [[MWDrawTextLine alloc] init];
    drawTextLine0090.text = station0037.nameOriginal;
    drawTextLine0090.fontName = @"HelveticaNeue";
    drawTextLine0090.fontColor = [UIColor blackColor];
    drawTextLine0090.fontSize = 42;
    drawTextLine0090.origin = CGPointMake(1360, 2071);
    drawTextLine0090.kernSpacing = 0.2;
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0090];
    
    MWDrawTextLine *drawTextLine0091 = [[MWDrawTextLine alloc] init];
    drawTextLine0091.text = station0037.nameEnglish;
    drawTextLine0091.fontName = @"HelveticaNeue";
    drawTextLine0091.fontColor = stationNamesEnglishColor;
    drawTextLine0091.fontSize = 28;
    drawTextLine0091.kernSpacing = 0.0;
    drawTextLine0091.origin = CGPointMake(1360, 2116);
    [station0037.nameEnglishTextPrimitives addObject:drawTextLine0091];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 1890;
    [edge0015.elements addObject:haul0036];
    
    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(1320, 2101.5);
    drawLine0081.endPoint = CGPointMake(1320, 1848.5);
    drawLine0081.width = 21.5;
    drawLine0081.color = line0002.color;
    [haul0036.drawPrimitives addObject:drawLine0081];

    // Добавляем станцию "Войковская"
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0015.elements addObject:station0038];
    
    station0038.nameOriginal = @"Войковская";
    station0038.nameEnglish = @"Voykovskaya";
    station0038.mapLocation = CGPointMake(1320, 1848.5);
    station0038.geoLocation = CGPointMake(55.819089, 37.497887);

    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0038.mapLocation;
    fillCircle0040.radius = 31.5;
    fillCircle0040.fillColor = line0002.color;
    [station0038.drawPrimitives addObject:fillCircle0040];
    
    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0038.mapLocation;
    fillCircle0041.radius = 14;
    fillCircle0041.fillColor = [UIColor whiteColor];
    [station0038.drawPrimitives addObject:fillCircle0041];
    
    // Подложка
    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(1380, 1841);
    drawLine0082.endPoint = CGPointMake(1580, 1841);
    drawLine0082.width = 40;
    drawLine0082.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0038.nameOriginalTextPrimitives addObject:drawLine0082];

    // Подложка
    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(1430, 1812);
    drawLine0083.endPoint = CGPointMake(1500, 1812);
    drawLine0083.width = 24;
    drawLine0083.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0038.nameEnglishTextPrimitives addObject:drawLine0083];

    MWDrawTextLine *drawTextLine0092 = [[MWDrawTextLine alloc] init];
    drawTextLine0092.text = station0038.nameOriginal;
    drawTextLine0092.fontName = @"HelveticaNeue";
    drawTextLine0092.fontColor = [UIColor blackColor];
    drawTextLine0092.fontSize = 42;
    drawTextLine0092.origin = CGPointMake(1362, 1818);
    drawTextLine0092.kernSpacing = 0.0;
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0092];
    
    MWDrawTextLine *drawTextLine0093 = [[MWDrawTextLine alloc] init];
    drawTextLine0093.text = station0038.nameEnglish;
    drawTextLine0093.fontName = @"HelveticaNeue";
    drawTextLine0093.fontColor = stationNamesEnglishColor;
    drawTextLine0093.fontSize = 28;
    drawTextLine0093.kernSpacing = -2.4;
    drawTextLine0093.origin = CGPointMake(1362, 1792);
    [station0038.nameEnglishTextPrimitives addObject:drawTextLine0093];

    // Добавляем вершину
    edge0015.finishVertex = vertex0057;
    
    // Создаем участок линии Войковская - Речной вокзал
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0084 = [[MWEdge alloc] init];
    edge0084.identifier = @"edge0084";
    edge0084.developmentName = @"Ребро: Войковская - Речной вокзал";
    [self.edges addObject:edge0084];
    
    // Добавляем линию
    edge0084.line = line0002;
    
    // Добавляем вершину
    edge0084.startVertex = vertex0057;
    
    // Добавляем станцию "Войковская"
    [edge0084.elements addObject:station0038];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 2480;
    [edge0084.elements addObject:haul0037];

    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(1320, 1849);
    drawLine0084.endPoint = CGPointMake(1320, 1503);
    drawLine0084.width = 21.5;
    drawLine0084.color = line0002.color;
    [haul0037.drawPrimitives addObject:drawLine0084];

    // Добавляем станцию "Водный стадион"
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0084.elements addObject:station0039];
    
    station0039.nameOriginal = @"Водный стадион";
    station0039.nameEnglish = @"Vodny Stadion";
    station0039.mapLocation = CGPointMake(1320, 1503);
    station0039.geoLocation = CGPointMake(55.839996, 37.486818);
    
    MWDrawLine *drawLine0085 = [[MWDrawLine alloc] init];
    drawLine0085.startPoint = CGPointMake(1320, 1503);
    drawLine0085.endPoint = CGPointMake(1352, 1503);
    drawLine0085.width = 21.5;
    drawLine0085.color = line0002.color;
    [station0039.drawPrimitives addObject:drawLine0085];

    MWDrawTextLine *drawTextLine0094 = [[MWDrawTextLine alloc] init];
    drawTextLine0094.text = station0039.nameOriginal;
    drawTextLine0094.fontName = @"HelveticaNeue";
    drawTextLine0094.fontColor = [UIColor blackColor];
    drawTextLine0094.fontSize = 42;
    drawTextLine0094.origin = CGPointMake(1362, 1473);
    drawTextLine0094.kernSpacing = -0.5;
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0094];

    MWDrawTextLine *drawTextLine0095 = [[MWDrawTextLine alloc] init];
    drawTextLine0095.text = station0039.nameEnglish;
    drawTextLine0095.fontName = @"HelveticaNeue";
    drawTextLine0095.fontColor = stationNamesEnglishColor;
    drawTextLine0095.fontSize = 28;
    drawTextLine0095.kernSpacing = -0.0;
    drawTextLine0095.origin = CGPointMake(1361, 1518);
    [station0039.nameEnglishTextPrimitives addObject:drawTextLine0095];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 1780;
    [edge0084.elements addObject:haul0038];
    
    MWDrawLine *drawLine0086 = [[MWDrawLine alloc] init];
    drawLine0086.startPoint = CGPointMake(1320, 1503.5);
    drawLine0086.endPoint = CGPointMake(1320, 1340);
    drawLine0086.width = 21.5;
    drawLine0086.color = line0002.color;
    [haul0038.drawPrimitives addObject:drawLine0086];

    // Добавляем станцию "Речной вокзал"
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0084.elements addObject:station0040];
    
    station0040.nameOriginal = @"Речной вокзал";
    station0040.nameEnglish = @"Rechnoy Vokzal";
    station0040.mapLocation = CGPointMake(1320, 1340);
    station0040.geoLocation = CGPointMake(55.855056, 37.476106);
    
    MWDrawLine *drawLine0087 = [[MWDrawLine alloc] init];
    drawLine0087.startPoint = CGPointMake(1288, 1340);
    drawLine0087.endPoint = CGPointMake(1352, 1340);
    drawLine0087.width = 21.5;
    drawLine0087.color = line0002.color;
    [station0040.drawPrimitives addObject:drawLine0087];

    MWDrawTextLine *drawTextLine0096 = [[MWDrawTextLine alloc] init];
    drawTextLine0096.text = station0040.nameOriginal;
    drawTextLine0096.fontName = @"HelveticaNeue";
    drawTextLine0096.fontColor = [UIColor blackColor];
    drawTextLine0096.fontSize = 42;
    drawTextLine0096.origin = CGPointMake(1361.5, 1310);
    drawTextLine0096.kernSpacing = -0.1;
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0096];

    MWDrawTextLine *drawTextLine0097 = [[MWDrawTextLine alloc] init];
    drawTextLine0097.text = station0040.nameEnglish;
    drawTextLine0097.fontName = @"HelveticaNeue";
    drawTextLine0097.fontColor = stationNamesEnglishColor;
    drawTextLine0097.fontSize = 28;
    drawTextLine0097.kernSpacing = -0.0;
    drawTextLine0097.origin = CGPointMake(1361, 1355);
    [station0040.nameEnglishTextPrimitives addObject:drawTextLine0097];

    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = CGPointMake(1320.5, 1277.5);
    fillCircle0042.radius = 32;
    fillCircle0042.fillColor = line0002.color;
    [station0040.drawPrimitives addObject:fillCircle0042];
    
    MWDrawTextLine *drawTextLine0098 = [[MWDrawTextLine alloc] init];
    drawTextLine0098.text = @"2";
    drawTextLine0098.fontName = @"Georgia-Bold";
    drawTextLine0098.fontColor = [UIColor whiteColor];
    drawTextLine0098.fontSize = 56;
    drawTextLine0098.origin = CGPointMake(1304, 1240.5);
    [station0040.drawPrimitives addObject:drawTextLine0098];
    
    // Добавляем вершину
    edge0084.finishVertex = vertex0016;
    
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
    station0041.nameEnglish = @"Pyantitskoye Shosse";
    station0041.mapLocation = CGPointMake(192, 1681);
    station0041.geoLocation = CGPointMake(55.855878, 37.354182);

    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = CGPointMake(192, 1618.5);
    fillCircle0043.radius = 32;
    fillCircle0043.fillColor = line0003.color;
    [station0041.drawPrimitives addObject:fillCircle0043];
    
    MWDrawTextLine *drawTextLine0099 = [[MWDrawTextLine alloc] init];
    drawTextLine0099.text = @"3";
    drawTextLine0099.fontName = @"Georgia-Bold";
    drawTextLine0099.fontColor = [UIColor whiteColor];
    drawTextLine0099.fontSize = 56;
    drawTextLine0099.origin = CGPointMake(176, 1577);
    [station0041.drawPrimitives addObject:drawTextLine0099];

    MWDrawLine *drawLine0088 = [[MWDrawLine alloc] init];
    drawLine0088.startPoint = CGPointMake(160, 1681);
    drawLine0088.endPoint = CGPointMake(224, 1681);
    drawLine0088.width = 21.5;
    drawLine0088.color = line0003.color;
    [station0041.drawPrimitives addObject:drawLine0088];

    MWDrawTextLine *drawTextLine0100 = [[MWDrawTextLine alloc] init];
    drawTextLine0100.text = @"Пятницкое";
    drawTextLine0100.fontName = @"HelveticaNeue";
    drawTextLine0100.fontColor = [UIColor blackColor];
    drawTextLine0100.fontSize = 42;
    drawTextLine0100.origin = CGPointMake(232, 1651);
    drawTextLine0100.kernSpacing = 0.8;
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0100];

    MWDrawTextLine *drawTextLine0101 = [[MWDrawTextLine alloc] init];
    drawTextLine0101.text = @"шоссе";
    drawTextLine0101.fontName = @"HelveticaNeue";
    drawTextLine0101.fontColor = [UIColor blackColor];
    drawTextLine0101.fontSize = 42;
    drawTextLine0101.origin = CGPointMake(232, 1691);
    drawTextLine0101.kernSpacing = -0.2;
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0101];

    MWDrawTextLine *drawTextLine0102 = [[MWDrawTextLine alloc] init];
    drawTextLine0102.text = station0041.nameEnglish;
    drawTextLine0102.fontName = @"HelveticaNeue";
    drawTextLine0102.fontColor = stationNamesEnglishColor;
    drawTextLine0102.fontSize = 28;
    drawTextLine0102.kernSpacing = -0.5;
    drawTextLine0102.origin = CGPointMake(233, 1736);
    [station0041.nameEnglishTextPrimitives addObject:drawTextLine0102];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 1250;
    [edge0016.elements addObject:haul0039];
    
    MWDrawLine *drawLine0089 = [[MWDrawLine alloc] init];
    drawLine0089.startPoint = CGPointMake(192, 1681);
    drawLine0089.endPoint = CGPointMake(192, 1848);
    drawLine0089.width = 21.5;
    drawLine0089.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawLine0089];

    // Добавляем станцию "Митино"
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0016.elements addObject:station0042];
    
    station0042.nameOriginal = @"Митино";
    station0042.nameEnglish = @"Mitino";
    station0042.mapLocation = CGPointMake(192, 1848);
    station0042.geoLocation = CGPointMake(55.846007, 37.361364);
    
    MWDrawLine *drawLine0090 = [[MWDrawLine alloc] init];
    drawLine0090.startPoint = CGPointMake(192, 1848);
    drawLine0090.endPoint = CGPointMake(224, 1848);
    drawLine0090.width = 21.5;
    drawLine0090.color = line0003.color;
    [station0042.drawPrimitives addObject:drawLine0090];
    
    MWDrawTextLine *drawTextLine0103 = [[MWDrawTextLine alloc] init];
    drawTextLine0103.text = station0042.nameOriginal;
    drawTextLine0103.fontName = @"HelveticaNeue";
    drawTextLine0103.fontColor = [UIColor blackColor];
    drawTextLine0103.fontSize = 42;
    drawTextLine0103.origin = CGPointMake(232, 1818.5);
    drawTextLine0103.kernSpacing = 2.0;
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0103];

    MWDrawTextLine *drawTextLine0104 = [[MWDrawTextLine alloc] init];
    drawTextLine0104.text = station0042.nameEnglish;
    drawTextLine0104.fontName = @"HelveticaNeue";
    drawTextLine0104.fontColor = stationNamesEnglishColor;
    drawTextLine0104.fontSize = 28;
    drawTextLine0104.kernSpacing = 1.5;
    drawTextLine0104.origin = CGPointMake(234, 1864);
    [station0042.nameEnglishTextPrimitives addObject:drawTextLine0104];

    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 1780;
    [edge0016.elements addObject:haul0040];
    
    MWDrawLine *drawLine0091 = [[MWDrawLine alloc] init];
    drawLine0091.startPoint = CGPointMake(192, 1847.5);
    drawLine0091.endPoint = CGPointMake(192, 1975);
    drawLine0091.width = 21.5;
    drawLine0091.color = line0003.color;
    [haul0040.drawPrimitives addObject:drawLine0091];

    // Добавляем станцию "Волоколамская"
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0016.elements addObject:station0043];
    
    station0043.nameOriginal = @"Волоколамская";
    station0043.nameEnglish = @"Volokolamskaya";
    station0043.mapLocation = CGPointMake(192, 1975);
    station0043.geoLocation = CGPointMake(55.835748, 37.381989);

    MWDrawLine *drawLine0092 = [[MWDrawLine alloc] init];
    drawLine0092.startPoint = CGPointMake(192, 1975);
    drawLine0092.endPoint = CGPointMake(224, 1975);
    drawLine0092.width = 21.5;
    drawLine0092.color = line0003.color;
    [station0043.drawPrimitives addObject:drawLine0092];

    // Подложка
    MWDrawLine *drawLine0093 = [[MWDrawLine alloc] init];
    drawLine0093.startPoint = CGPointMake(290, 1973);
    drawLine0093.endPoint = CGPointMake(390, 1973);
    drawLine0093.width = 33;
    drawLine0093.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0043.nameOriginalTextPrimitives addObject:drawLine0093];

    // Подложка
    MWDrawLine *drawLine0094 = [[MWDrawLine alloc] init];
    drawLine0094.startPoint = CGPointMake(240, 2008);
    drawLine0094.endPoint = CGPointMake(340, 2008);
    drawLine0094.width = 30;
    drawLine0094.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0043.nameEnglishTextPrimitives addObject:drawLine0094];

    MWDrawTextLine *drawTextLine0105 = [[MWDrawTextLine alloc] init];
    drawTextLine0105.text = station0043.nameOriginal;
    drawTextLine0105.fontName = @"HelveticaNeue";
    drawTextLine0105.fontColor = [UIColor blackColor];
    drawTextLine0105.fontSize = 42;
    drawTextLine0105.origin = CGPointMake(232, 1945.5);
    drawTextLine0105.kernSpacing = 0.5;
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0105];

    MWDrawTextLine *drawTextLine0106 = [[MWDrawTextLine alloc] init];
    drawTextLine0106.text = station0043.nameEnglish;
    drawTextLine0106.fontName = @"HelveticaNeue";
    drawTextLine0106.fontColor = stationNamesEnglishColor;
    drawTextLine0106.fontSize = 28;
    drawTextLine0106.kernSpacing = -0.1;
    drawTextLine0106.origin = CGPointMake(235, 1990);
    [station0043.nameEnglishTextPrimitives addObject:drawTextLine0106];

    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 1320;
    [edge0016.elements addObject:haul0041];
    
    MWDrawLine *drawLine0095 = [[MWDrawLine alloc] init];
    drawLine0095.startPoint = CGPointMake(192, 1974.5);
    drawLine0095.endPoint = CGPointMake(192, 2102);
    drawLine0095.width = 21.5;
    drawLine0095.color = line0003.color;
    [haul0041.drawPrimitives addObject:drawLine0095];

    // Добавляем станцию "Мякинино"
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0016.elements addObject:station0044];
    
    station0044.nameOriginal = @"Мякинино";
    station0044.nameEnglish = @"Myakinino";
    station0044.mapLocation = CGPointMake(192, 2102);
    station0044.geoLocation = CGPointMake(55.825477, 37.385372);
    
    MWDrawLine *drawLine0096 = [[MWDrawLine alloc] init];
    drawLine0096.startPoint = CGPointMake(192, 2102);
    drawLine0096.endPoint = CGPointMake(224, 2102);
    drawLine0096.width = 21.5;
    drawLine0096.color = line0003.color;
    [station0044.drawPrimitives addObject:drawLine0096];

    MWDrawTextLine *drawTextLine0107 = [[MWDrawTextLine alloc] init];
    drawTextLine0107.text = station0044.nameOriginal;
    drawTextLine0107.fontName = @"HelveticaNeue";
    drawTextLine0107.fontColor = [UIColor blackColor];
    drawTextLine0107.fontSize = 42;
    drawTextLine0107.origin = CGPointMake(232, 2072.5);
    drawTextLine0107.kernSpacing = 1.7;
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0107];

    MWDrawTextLine *drawTextLine0108 = [[MWDrawTextLine alloc] init];
    drawTextLine0108.text = station0044.nameEnglish;
    drawTextLine0108.fontName = @"HelveticaNeue";
    drawTextLine0108.fontColor = stationNamesEnglishColor;
    drawTextLine0108.fontSize = 28;
    drawTextLine0108.kernSpacing = 0.6;
    drawTextLine0108.origin = CGPointMake(232, 2117);
    [station0044.nameEnglishTextPrimitives addObject:drawTextLine0108];

    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 2860;
    [edge0016.elements addObject:haul0042];

    MWDrawLine *drawLine0097 = [[MWDrawLine alloc] init];
    drawLine0097.startPoint = CGPointMake(192, 2101.5);
    drawLine0097.endPoint = CGPointMake(192, 2230);
    drawLine0097.width = 21.5;
    drawLine0097.color = line0003.color;
    [haul0042.drawPrimitives addObject:drawLine0097];

    // Добавляем станцию "Строгино"
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0016.elements addObject:station0045];
    
    station0045.nameOriginal = @"Строгино";
    station0045.nameEnglish = @"Strogino";
    station0045.mapLocation = CGPointMake(192, 2230);
    station0045.geoLocation = CGPointMake(55.803723, 37.403083);

    MWDrawLine *drawLine0098 = [[MWDrawLine alloc] init];
    drawLine0098.startPoint = CGPointMake(192, 2230);
    drawLine0098.endPoint = CGPointMake(224, 2230);
    drawLine0098.width = 21.5;
    drawLine0098.color = line0003.color;
    [station0045.drawPrimitives addObject:drawLine0098];

    MWDrawTextLine *drawTextLine0109 = [[MWDrawTextLine alloc] init];
    drawTextLine0109.text = station0045.nameOriginal;
    drawTextLine0109.fontName = @"HelveticaNeue";
    drawTextLine0109.fontColor = [UIColor blackColor];
    drawTextLine0109.fontSize = 42;
    drawTextLine0109.origin = CGPointMake(232, 2200);
    drawTextLine0109.kernSpacing = 0.6;
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0109];
    
    MWDrawTextLine *drawTextLine0110 = [[MWDrawTextLine alloc] init];
    drawTextLine0110.text = station0045.nameEnglish;
    drawTextLine0110.fontName = @"HelveticaNeue";
    drawTextLine0110.fontColor = stationNamesEnglishColor;
    drawTextLine0110.fontSize = 28;
    drawTextLine0110.kernSpacing = 0.2;
    drawTextLine0110.origin = CGPointMake(235, 2245);
    [station0045.nameEnglishTextPrimitives addObject:drawTextLine0110];

    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 5510;
    [edge0016.elements addObject:haul0043];

    MWDrawLine *drawLine0099 = [[MWDrawLine alloc] init];
    drawLine0099.startPoint = CGPointMake(192, 2229.5);
    drawLine0099.endPoint = CGPointMake(192, 2357);
    drawLine0099.width = 21.5;
    drawLine0099.color = line0003.color;
    [haul0043.drawPrimitives addObject:drawLine0099];

    // Добавляем станцию "Крылатское"
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0016.elements addObject:station0046];
    
    station0046.nameOriginal = @"Крылатское";
    station0046.nameEnglish = @"Krilatskoye";
    station0046.mapLocation = CGPointMake(192, 2357);
    station0046.geoLocation = CGPointMake(55.756836, 37.408014);
    
    MWDrawLine *drawLine0100 = [[MWDrawLine alloc] init];
    drawLine0100.startPoint = CGPointMake(192, 2357);
    drawLine0100.endPoint = CGPointMake(224, 2357);
    drawLine0100.width = 21.5;
    drawLine0100.color = line0003.color;
    [station0046.drawPrimitives addObject:drawLine0100];

    MWDrawTextLine *drawTextLine0111 = [[MWDrawTextLine alloc] init];
    drawTextLine0111.text = station0046.nameOriginal;
    drawTextLine0111.fontName = @"HelveticaNeue";
    drawTextLine0111.fontColor = [UIColor blackColor];
    drawTextLine0111.fontSize = 42;
    drawTextLine0111.origin = CGPointMake(232, 2327);
    drawTextLine0111.kernSpacing = 0.2;
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0111];
    
    MWDrawTextLine *drawTextLine0112 = [[MWDrawTextLine alloc] init];
    drawTextLine0112.text = station0046.nameEnglish;
    drawTextLine0112.fontName = @"HelveticaNeue";
    drawTextLine0112.fontColor = stationNamesEnglishColor;
    drawTextLine0112.fontSize = 28;
    drawTextLine0112.kernSpacing = 1.2;
    drawTextLine0112.origin = CGPointMake(231, 2372);
    [station0046.nameEnglishTextPrimitives addObject:drawTextLine0112];

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 1880;
    [edge0016.elements addObject:haul0044];
    
    MWDrawLine *drawLine0101 = [[MWDrawLine alloc] init];
    drawLine0101.startPoint = CGPointMake(192, 2356.5);
    drawLine0101.endPoint = CGPointMake(192, 2484);
    drawLine0101.width = 21.5;
    drawLine0101.color = line0003.color;
    [haul0044.drawPrimitives addObject:drawLine0101];

    // Добавляем станцию "Молодежная"
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0016.elements addObject:station0047];
    
    station0047.nameOriginal = @"Молодёжная";
    station0047.nameEnglish = @"Molodyojnaya";
    station0047.mapLocation = CGPointMake(192, 2484);
    station0047.geoLocation = CGPointMake(55.740611, 37.416917);
    
    MWDrawLine *drawLine0102 = [[MWDrawLine alloc] init];
    drawLine0102.startPoint = CGPointMake(192, 2484);
    drawLine0102.endPoint = CGPointMake(224, 2484);
    drawLine0102.width = 21.5;
    drawLine0102.color = line0003.color;
    [station0047.drawPrimitives addObject:drawLine0102];

    MWDrawTextLine *drawTextLine0113 = [[MWDrawTextLine alloc] init];
    drawTextLine0113.text = station0047.nameOriginal;
    drawTextLine0113.fontName = @"HelveticaNeue";
    drawTextLine0113.fontColor = [UIColor blackColor];
    drawTextLine0113.fontSize = 42;
    drawTextLine0113.origin = CGPointMake(232, 2454);
    drawTextLine0113.kernSpacing = 1.2;
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0113];
    
    MWDrawTextLine *drawTextLine0114 = [[MWDrawTextLine alloc] init];
    drawTextLine0114.text = station0047.nameEnglish;
    drawTextLine0114.fontName = @"HelveticaNeue";
    drawTextLine0114.fontColor = stationNamesEnglishColor;
    drawTextLine0114.fontSize = 28;
    drawTextLine0114.kernSpacing = 0.4;
    drawTextLine0114.origin = CGPointMake(234, 2499);
    [station0047.nameEnglishTextPrimitives addObject:drawTextLine0114];

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 2190;
    [edge0016.elements addObject:haul0045];
    
    MWDrawLine *drawLine0103 = [[MWDrawLine alloc] init];
    drawLine0103.startPoint = CGPointMake(192, 2483.5);
    drawLine0103.endPoint = CGPointMake(192, 2609);
    drawLine0103.width = 21.5;
    drawLine0103.color = line0003.color;
    [haul0045.drawPrimitives addObject:drawLine0103];

    // Добавляем станцию "Кунцевская"
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0016.elements addObject:station0048];
    
    station0048.nameOriginal = @"Кунцевская";
    station0048.nameEnglish = @"Kuntsevskaya";
    station0048.mapLocation = CGPointMake(192, 2609);
    station0048.geoLocation = CGPointMake(55.730757, 37.445927);
    
    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0048.mapLocation;
    fillCircle0044.radius = 31.5;
    fillCircle0044.fillColor = line0003.color;
    [station0048.drawPrimitives addObject:fillCircle0044];
    
    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0048.mapLocation;
    fillCircle0045.radius = 14;
    fillCircle0045.fillColor = [UIColor whiteColor];
    [station0048.drawPrimitives addObject:fillCircle0045];
    
    MWDrawTextLine *drawTextLine0115 = [[MWDrawTextLine alloc] init];
    drawTextLine0115.text = station0048.nameOriginal;
    drawTextLine0115.fontName = @"HelveticaNeue";
    drawTextLine0115.fontColor = [UIColor blackColor];
    drawTextLine0115.fontSize = 42;
    drawTextLine0115.origin = CGPointMake(232, 2579);
    drawTextLine0115.kernSpacing = 0.2;
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0115];

    MWDrawTextLine *drawTextLine0116 = [[MWDrawTextLine alloc] init];
    drawTextLine0116.text = station0048.nameEnglish;
    drawTextLine0116.fontName = @"HelveticaNeue";
    drawTextLine0116.fontColor = stationNamesEnglishColor;
    drawTextLine0116.fontSize = 28;
    drawTextLine0116.kernSpacing = -0.8;
    drawTextLine0116.origin = CGPointMake(233, 2552);
    [station0048.nameEnglishTextPrimitives addObject:drawTextLine0116];

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

    MWDrawLine *drawLine0104 = [[MWDrawLine alloc] init];
    drawLine0104.startPoint = CGPointMake(192, 2608.5);
    drawLine0104.endPoint = CGPointMake(192, 3659);
    drawLine0104.width = 21.5;
    drawLine0104.color = line0003.color;
    [haul0046.drawPrimitives addObject:drawLine0104];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(292, 3658.5);
    drawArc0010.startDegrees = 90;
    drawArc0010.endDegrees = 180;
    drawArc0010.radius = 100;
    drawArc0010.width = 21.5;
    drawArc0010.color = line0003.color;
    [haul0046.drawPrimitives addObject:drawArc0010];
    
    MWDrawLine *drawLine0105 = [[MWDrawLine alloc] init];
    drawLine0105.startPoint = CGPointMake(292, 3758.5);
    drawLine0105.endPoint = CGPointMake(385, 3758.5);
    drawLine0105.width = 21.5;
    drawLine0105.color = line0003.color;
    [haul0046.drawPrimitives addObject:drawLine0105];

    // Добавляем станцию "Славянский бульвар"
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0017.elements addObject:station0049];
    
    station0049.nameOriginal = @"Славянский бульвар";
    station0049.nameEnglish = @"Slavyansky Bulvar";
    station0049.mapLocation = CGPointMake(385, 3758.5);
    station0049.geoLocation = CGPointMake(55.729576, 37.470719);
    
    MWDrawLine *drawLine0106 = [[MWDrawLine alloc] init];
    drawLine0106.startPoint = CGPointMake(385, 3758.5);
    drawLine0106.endPoint = CGPointMake(385, 3791);
    drawLine0106.width = 21.5;
    drawLine0106.color = line0003.color;
    [station0049.drawPrimitives addObject:drawLine0106];
    
    MWDrawTextLine *drawTextLine0117 = [[MWDrawTextLine alloc] init];
    drawTextLine0117.text = @"Славянский";
    drawTextLine0117.fontName = @"HelveticaNeue";
    drawTextLine0117.fontColor = [UIColor blackColor];
    drawTextLine0117.fontSize = 42;
    drawTextLine0117.origin = CGPointMake(161, 3791.5);
    drawTextLine0117.kernSpacing = -0.3;
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0117];

    MWDrawTextLine *drawTextLine0118 = [[MWDrawTextLine alloc] init];
    drawTextLine0118.text = @"бульвар";
    drawTextLine0118.fontName = @"HelveticaNeue";
    drawTextLine0118.fontColor = [UIColor blackColor];
    drawTextLine0118.fontSize = 42;
    drawTextLine0118.origin = CGPointMake(234, 3831.5);
    drawTextLine0118.kernSpacing = -0.0;
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0118];

    MWDrawTextLine *drawTextLine0119 = [[MWDrawTextLine alloc] init];
    drawTextLine0119.text = station0049.nameEnglish;
    drawTextLine0119.fontName = @"HelveticaNeue";
    drawTextLine0119.fontColor = stationNamesEnglishColor;
    drawTextLine0119.fontSize = 28;
    drawTextLine0119.kernSpacing = -0.4;
    drawTextLine0119.origin = CGPointMake(175, 3876);
    [station0049.nameEnglishTextPrimitives addObject:drawTextLine0119];

    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 2910;
    [edge0017.elements addObject:haul0047];
    
    MWDrawLine *drawLine0107 = [[MWDrawLine alloc] init];
    drawLine0107.startPoint = CGPointMake(384.5, 3758.5);
    drawLine0107.endPoint = CGPointMake(618.5, 3758.5);
    drawLine0107.width = 21.5;
    drawLine0107.color = line0003.color;
    [haul0047.drawPrimitives addObject:drawLine0107];

    // Добавляем станцию "Парк Победы"
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0017.elements addObject:station0050];
    
    station0050.nameOriginal = @"Парк Победы";
    station0050.nameEnglish = @"Park Pobedy";
    station0050.mapLocation = CGPointMake(618.5, 3758.5);
    station0050.geoLocation = CGPointMake(55.736218, 37.516834);
    
    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0050.mapLocation;
    fillCircle0046.radius = 31.5;
    fillCircle0046.fillColor = line0003.color;
    [station0050.drawPrimitives addObject:fillCircle0046];
    
    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = station0050.mapLocation;
    fillCircle0047.radius = 14;
    fillCircle0047.fillColor = [UIColor whiteColor];
    [station0050.drawPrimitives addObject:fillCircle0047];

    // Подложка
    MWDrawLine *drawLine0108 = [[MWDrawLine alloc] init];
    drawLine0108.startPoint = CGPointMake(645, 3800);
    drawLine0108.endPoint = CGPointMake(710, 3800);
    drawLine0108.width = 46;
    drawLine0108.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0050.nameOriginalTextPrimitives addObject:drawLine0108];

    MWDrawTextLine *drawTextLine0120 = [[MWDrawTextLine alloc] init];
    drawTextLine0120.text = @"Парк";
    drawTextLine0120.fontName = @"HelveticaNeue";
    drawTextLine0120.fontColor = [UIColor blackColor];
    drawTextLine0120.fontSize = 42;
    drawTextLine0120.origin = CGPointMake(652, 3773);
    drawTextLine0120.kernSpacing = 1.4;
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0120];

    MWDrawTextLine *drawTextLine0121 = [[MWDrawTextLine alloc] init];
    drawTextLine0121.text = @"Победы";
    drawTextLine0121.fontName = @"HelveticaNeue";
    drawTextLine0121.fontColor = [UIColor blackColor];
    drawTextLine0121.fontSize = 42;
    drawTextLine0121.origin = CGPointMake(652, 3813);
    drawTextLine0121.kernSpacing = 0.7;
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0121];

    MWDrawTextLine *drawTextLine0122 = [[MWDrawTextLine alloc] init];
    drawTextLine0122.text = station0050.nameEnglish;
    drawTextLine0122.fontName = @"HelveticaNeue";
    drawTextLine0122.fontColor = stationNamesEnglishColor;
    drawTextLine0122.fontSize = 28;
    drawTextLine0122.kernSpacing = -0.3;
    drawTextLine0122.origin = CGPointMake(652, 3858);
    [station0050.nameEnglishTextPrimitives addObject:drawTextLine0122];

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

    MWDrawLine *drawLine0109 = [[MWDrawLine alloc] init];
    drawLine0109.startPoint = CGPointMake(618, 3758.5);
    drawLine0109.endPoint = CGPointMake(1009.5, 3758.5);
    drawLine0109.width = 21.5;
    drawLine0109.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawLine0109];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(1009, 3608.5);
    drawArc0011.startDegrees = 45;
    drawArc0011.endDegrees = 90;
    drawArc0011.radius = 150;
    drawArc0011.width = 21.5;
    drawArc0011.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0110 = [[MWDrawLine alloc] init];
    drawLine0110.startPoint = CGPointMake(1114.5, 3715);
    drawLine0110.endPoint = CGPointMake(1317, 3512.5);
    drawLine0110.width = 21.5;
    drawLine0110.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawLine0110];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(1422.5, 3619);
    drawArc0012.startDegrees = 225;
    drawArc0012.endDegrees = 270;
    drawArc0012.radius = 150;
    drawArc0012.width = 21.5;
    drawArc0012.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawArc0012];

    MWDrawLine *drawLine0111 = [[MWDrawLine alloc] init];
    drawLine0111.startPoint = CGPointMake(1422, 3469);
    drawLine0111.endPoint = CGPointMake(1450, 3469);
    drawLine0111.width = 21.5;
    drawLine0111.color = line0003.color;
    [haul0048.drawPrimitives addObject:drawLine0111];

    // Добавляем станцию "Киевская"
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0068.elements addObject:station0051];
    
    station0051.nameOriginal = @"Киевская";
    station0051.nameEnglish = @"Kiyevskaya";
    station0051.mapLocation = CGPointMake(1450, 3469);
    station0051.geoLocation = CGPointMake(55.746333, 37.566489);
    
    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = station0051.mapLocation;
    fillCircle0048.radius = 31.5;
    fillCircle0048.fillColor = line0003.color;
    [station0051.drawPrimitives addObject:fillCircle0048];
    
    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = station0051.mapLocation;
    fillCircle0049.radius = 14;
    fillCircle0049.fillColor = [UIColor whiteColor];
    [station0051.drawPrimitives addObject:fillCircle0049];

    // Подложка
    MWDrawLine *drawLine0112 = [[MWDrawLine alloc] init];
    drawLine0112.startPoint = CGPointMake(1390, 3383);
    drawLine0112.endPoint = CGPointMake(1440, 3383);
    drawLine0112.width = 33;
    drawLine0112.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0051.nameOriginalTextPrimitives addObject:drawLine0112];

    // Подложка
    MWDrawLine *drawLine0113 = [[MWDrawLine alloc] init];
    drawLine0113.startPoint = CGPointMake(1390, 3420);
    drawLine0113.endPoint = CGPointMake(1440, 3420);
    drawLine0113.width = 24;
    drawLine0113.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0051.nameOriginalTextPrimitives addObject:drawLine0113];

    MWDrawTextLine *drawTextLine0123 = [[MWDrawTextLine alloc] init];
    drawTextLine0123.text = station0051.nameOriginal;
    drawTextLine0123.fontName = @"HelveticaNeue";
    drawTextLine0123.fontColor = [UIColor blackColor];
    drawTextLine0123.fontSize = 42;
    drawTextLine0123.origin = CGPointMake(1346, 3354.5);
    drawTextLine0123.kernSpacing = -0.2;
    [station0051.nameOriginalTextPrimitives addObject:drawTextLine0123];

    MWDrawTextLine *drawTextLine0124 = [[MWDrawTextLine alloc] init];
    drawTextLine0124.text = station0051.nameEnglish;
    drawTextLine0124.fontName = @"HelveticaNeue";
    drawTextLine0124.fontColor = stationNamesEnglishColor;
    drawTextLine0124.fontSize = 28;
    drawTextLine0124.kernSpacing = -0.6;
    drawTextLine0124.origin = CGPointMake(1396, 3399.5);
    [station0051.nameEnglishTextPrimitives addObject:drawTextLine0124];

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
    
    MWDrawLine *drawLine0114 = [[MWDrawLine alloc] init];
    drawLine0114.startPoint = CGPointMake(1449.5, 3469);
    drawLine0114.endPoint = CGPointMake(1798, 3469);
    drawLine0114.width = 21.5;
    drawLine0114.color = line0003.color;
    [haul0049.drawPrimitives addObject:drawLine0114];

    // Добавляем станцию "Смоленская"
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0018.elements addObject:station0052];
    
    station0052.nameOriginal = @"Смоленская";
    station0052.nameEnglish = @"Smolenskaya";
    station0052.mapLocation = CGPointMake(1798, 3469);
    station0052.geoLocation = CGPointMake(55.747731, 37.583846);
    
    MWDrawLine *drawLine0115 = [[MWDrawLine alloc] init];
    drawLine0115.startPoint = CGPointMake(1798, 3469);
    drawLine0115.endPoint = CGPointMake(1798, 3436);
    drawLine0115.width = 21.5;
    drawLine0115.color = line0003.color;
    [station0052.drawPrimitives addObject:drawLine0115];
    
    MWDrawTextLine *drawTextLine0125 = [[MWDrawTextLine alloc] init];
    drawTextLine0125.text = station0052.nameOriginal;
    drawTextLine0125.fontName = @"HelveticaNeue";
    drawTextLine0125.fontColor = line0003.color;
    drawTextLine0125.fontSize = 42;
    drawTextLine0125.origin = CGPointMake(1675, 3386);
    drawTextLine0125.kernSpacing = 0.6;
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0125];

    MWDrawTextLine *drawTextLine0126 = [[MWDrawTextLine alloc] init];
    drawTextLine0126.text = station0052.nameEnglish;
    drawTextLine0126.fontName = @"HelveticaNeue";
    drawTextLine0126.fontColor = stationNamesEnglishColor;
    drawTextLine0126.fontSize = 28;
    drawTextLine0126.kernSpacing = -0.4;
    drawTextLine0126.origin = CGPointMake(1716, 3359);
    [station0052.nameEnglishTextPrimitives addObject:drawTextLine0126];

    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 1390;
    [edge0018.elements addObject:haul0050];
    
    MWDrawLine *drawLine0116 = [[MWDrawLine alloc] init];
    drawLine0116.startPoint = CGPointMake(1797.5, 3469);
    drawLine0116.endPoint = CGPointMake(2152.5, 3469);
    drawLine0116.width = 21.5;
    drawLine0116.color = line0003.color;
    [haul0050.drawPrimitives addObject:drawLine0116];

    // Добавляем станцию "Арбатская"
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0018.elements addObject:station0053];
    
    station0053.nameOriginal = @"Арбатская";
    station0053.nameEnglish = @"Arbatskaya";
    station0053.mapLocation = CGPointMake(2152.5, 3469);
    station0053.geoLocation = CGPointMake(55.752387, 37.603287);
    
    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = station0053.mapLocation;
    fillCircle0050.radius = 31.5;
    fillCircle0050.fillColor = line0003.color;
    [station0053.drawPrimitives addObject:fillCircle0050];
    
    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = station0053.mapLocation;
    fillCircle0051.radius = 14;
    fillCircle0051.fillColor = [UIColor whiteColor];
    [station0053.drawPrimitives addObject:fillCircle0051];

    MWDrawTextLine *drawTextLine0127 = [[MWDrawTextLine alloc] init];
    drawTextLine0127.text = station0053.nameOriginal;
    drawTextLine0127.fontName = @"HelveticaNeue";
    drawTextLine0127.fontColor = line0003.color;
    drawTextLine0127.fontSize = 42;
    drawTextLine0127.origin = CGPointMake(2133, 3386);
    drawTextLine0127.kernSpacing = 0.2;
    [station0053.nameOriginalTextPrimitives addObject:drawTextLine0127];
 
    MWDrawTextLine *drawTextLine0128 = [[MWDrawTextLine alloc] init];
    drawTextLine0128.text = station0053.nameEnglish;
    drawTextLine0128.fontName = @"HelveticaNeue";
    drawTextLine0128.fontColor = stationNamesEnglishColor;
    drawTextLine0128.fontSize = 28;
    drawTextLine0128.kernSpacing = -0.2;
    drawTextLine0128.origin = CGPointMake(2141, 3359);
    [station0053.nameEnglishTextPrimitives addObject:drawTextLine0128];

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
    
    MWDrawLine *drawLine0117 = [[MWDrawLine alloc] init];
    drawLine0117.startPoint = CGPointMake(2152, 3469);
    drawLine0117.endPoint = CGPointMake(2599, 3469);
    drawLine0117.width = 21.5;
    drawLine0117.color = line0003.color;
    [haul0051.drawPrimitives addObject:drawLine0117];

    // Добавляем станцию "Пл. Революции"
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0019.elements addObject:station0054];
    
    station0054.nameOriginal = @"Площадь Революции";
    station0054.nameEnglish = @"Ploschad Revolyutsii";
    station0054.mapLocation = CGPointMake(2599, 3469);
    station0054.geoLocation = CGPointMake(55.756573, 37.621656);
    
    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = station0054.mapLocation;
    fillCircle0052.radius = 31.5;
    fillCircle0052.fillColor = line0003.color;
    [station0054.drawPrimitives addObject:fillCircle0052];
    
    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = station0054.mapLocation;
    fillCircle0053.radius = 14;
    fillCircle0053.fillColor = [UIColor whiteColor];
    [station0054.drawPrimitives addObject:fillCircle0053];

    // Подложка
    MWDrawLine *drawLine0118 = [[MWDrawLine alloc] init];
    drawLine0118.startPoint = CGPointMake(2790, 3523);
    drawLine0118.endPoint = CGPointMake(2860, 3523);
    drawLine0118.width = 33;
    drawLine0118.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0054.nameOriginalTextPrimitives addObject:drawLine0118];

    // Подложка
    MWDrawLine *drawLine0119 = [[MWDrawLine alloc] init];
    drawLine0119.startPoint = CGPointMake(2825, 3557);
    drawLine0119.endPoint = CGPointMake(2895, 3557);
    drawLine0119.width = 24;
    drawLine0119.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0054.nameEnglishTextPrimitives addObject:drawLine0119];

    MWDrawTextLine *drawTextLine0129 = [[MWDrawTextLine alloc] init];
    drawTextLine0129.text = @"Пл. Революции";
    drawTextLine0129.fontName = @"HelveticaNeue";
    drawTextLine0129.fontColor = [UIColor blackColor];
    drawTextLine0129.fontSize = 42;
    drawTextLine0129.origin = CGPointMake(2623, 3495);
    drawTextLine0129.kernSpacing = -0.2;
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0129];

    MWDrawTextLine *drawTextLine0130 = [[MWDrawTextLine alloc] init];
    drawTextLine0130.text = station0054.nameEnglish;
    drawTextLine0130.fontName = @"HelveticaNeue";
    drawTextLine0130.fontColor = stationNamesEnglishColor;
    drawTextLine0130.fontSize = 28;
    drawTextLine0130.kernSpacing = -0.2;
    drawTextLine0130.origin = CGPointMake(2623, 3540);
    [station0054.nameEnglishTextPrimitives addObject:drawTextLine0130];

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

    MWDrawLine *drawLine0120 = [[MWDrawLine alloc] init];
    drawLine0120.startPoint = CGPointMake(2598.5, 3469);
    drawLine0120.endPoint = CGPointMake(3071.5, 3469);
    drawLine0120.width = 21.5;
    drawLine0120.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0120];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(3071, 3319);
    drawArc0013.startDegrees = 45;
    drawArc0013.endDegrees = 90;
    drawArc0013.radius = 150;
    drawArc0013.width = 21.5;
    drawArc0013.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawArc0013];
    
    MWDrawLine *drawLine0121 = [[MWDrawLine alloc] init];
    drawLine0121.startPoint = CGPointMake(3176.5, 3425.5);
    drawLine0121.endPoint = CGPointMake(3486.5, 3115.5);
    drawLine0121.width = 21.5;
    drawLine0121.color = line0003.color;
    [haul0052.drawPrimitives addObject:drawLine0121];

    // Добавляем станцию "Курская"
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0020.elements addObject:station0055];
    
    station0055.nameOriginal = @"Курская";
    station0055.nameEnglish = @"Kurskaya";
    station0055.mapLocation = CGPointMake(3486.5, 3115.5);
    station0055.geoLocation = CGPointMake(55.758727, 37.659576);
    
    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = station0055.mapLocation;
    fillCircle0054.radius = 31.5;
    fillCircle0054.fillColor = line0003.color;
    [station0055.drawPrimitives addObject:fillCircle0054];
    
    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = station0055.mapLocation;
    fillCircle0055.radius = 14;
    fillCircle0055.fillColor = [UIColor whiteColor];
    [station0055.drawPrimitives addObject:fillCircle0055];

    // Подложка
    MWDrawLine *drawLine0122 = [[MWDrawLine alloc] init];
    drawLine0122.startPoint = CGPointMake(3520, 3075);
    drawLine0122.endPoint = CGPointMake(3580, 3075);
    drawLine0122.width = 40;
    drawLine0122.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0055.nameOriginalTextPrimitives addObject:drawLine0122];

    MWDrawTextLine *drawTextLine0131 = [[MWDrawTextLine alloc] init];
    drawTextLine0131.text = station0055.nameOriginal;
    drawTextLine0131.fontName = @"HelveticaNeue";
    drawTextLine0131.fontColor = [UIColor blackColor];
    drawTextLine0131.fontSize = 42;
    drawTextLine0131.origin = CGPointMake(3527, 3048);
    drawTextLine0131.kernSpacing = 0.0;
    [station0055.nameOriginalTextPrimitives addObject:drawTextLine0131];

    // Подложка
    MWDrawLine *drawLine0123 = [[MWDrawLine alloc] init];
    drawLine0123.startPoint = CGPointMake(3520, 3040);
    drawLine0123.endPoint = CGPointMake(3600, 3040);
    drawLine0123.width = 24;
    drawLine0123.color = [UIColor colorWithWhite:1.0 alpha:0.1];
    [station0055.nameEnglishTextPrimitives addObject:drawLine0123];

    MWDrawTextLine *drawTextLine0132 = [[MWDrawTextLine alloc] init];
    drawTextLine0132.text = station0055.nameEnglish;
    drawTextLine0132.fontName = @"HelveticaNeue";
    drawTextLine0132.fontColor = stationNamesEnglishColor;
    drawTextLine0132.fontSize = 28;
    drawTextLine0132.kernSpacing = -0.8;
    drawTextLine0132.origin = CGPointMake(3526, 3023);
    [station0055.nameEnglishTextPrimitives addObject:drawTextLine0132];

    // Добавляем вершину
    edge0020.finishVertex = vertex0020;
    
    // Создаем участок линии Курская - Партизанская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0021 = [[MWEdge alloc] init];
    edge0021.identifier = @"edge0021";
    edge0021.developmentName = @"Ребро: Курская - Партизанская";
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
    
    MWDrawLine *drawLine0124 = [[MWDrawLine alloc] init];
    drawLine0124.startPoint = CGPointMake(3486, 3116);
    drawLine0124.endPoint = CGPointMake(3699, 2903);
    drawLine0124.width = 21.5;
    drawLine0124.color = line0003.color;
    [haul0053.drawPrimitives addObject:drawLine0124];

    // Добавляем станцию "Бауманская"
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0021.elements addObject:station0056];
    
    station0056.nameOriginal = @"Бауманская";
    station0056.nameEnglish = @"Baumanskaya";
    station0056.mapLocation = CGPointMake(3697, 2905);
    station0056.geoLocation = CGPointMake(55.772482, 37.679160);

    MWDrawLine *drawLine0125 = [[MWDrawLine alloc] init];
    drawLine0125.startPoint = CGPointMake(3697, 2905);
    drawLine0125.endPoint = CGPointMake(3719, 2927);
    drawLine0125.width = 21.5;
    drawLine0125.color = line0003.color;
    [station0056.drawPrimitives addObject:drawLine0125];

    MWDrawTextLine *drawTextLine0133 = [[MWDrawTextLine alloc] init];
    drawTextLine0133.text = station0056.nameOriginal;
    drawTextLine0133.fontName = @"HelveticaNeue";
    drawTextLine0133.fontColor = [UIColor blackColor];
    drawTextLine0133.fontSize = 42;
    drawTextLine0133.origin = CGPointMake(3724.5, 2923);
    drawTextLine0133.kernSpacing = 0.2;
    [station0056.nameOriginalTextPrimitives addObject:drawTextLine0133];

    MWDrawTextLine *drawTextLine0134 = [[MWDrawTextLine alloc] init];
    drawTextLine0134.text = station0056.nameEnglish;
    drawTextLine0134.fontName = @"HelveticaNeue";
    drawTextLine0134.fontColor = stationNamesEnglishColor;
    drawTextLine0134.fontSize = 28;
    drawTextLine0134.kernSpacing = -0.8;
    drawTextLine0134.origin = CGPointMake(3724, 2968);
    [station0056.nameEnglishTextPrimitives addObject:drawTextLine0134];

    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 2080;
    [edge0021.elements addObject:haul0054];

    MWDrawLine *drawLine0126 = [[MWDrawLine alloc] init];
    drawLine0126.startPoint = CGPointMake(3698.5, 2903.5);
    drawLine0126.endPoint = CGPointMake(3867, 2736);
    drawLine0126.width = 21.5;
    drawLine0126.color = line0003.color;
    [haul0054.drawPrimitives addObject:drawLine0126];

    // Добавляем станцию "Электрозаводская"
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0021.elements addObject:station0057];
    
    station0057.nameOriginal = @"Электрозаводская";
    station0057.nameEnglish = @"Elektrozavodskaya";
    station0057.mapLocation = CGPointMake(3866, 2737);
    station0057.geoLocation = CGPointMake(55.782096, 37.705285);
    
    MWDrawLine *drawLine0127 = [[MWDrawLine alloc] init];
    drawLine0127.startPoint = CGPointMake(3866, 2737);
    drawLine0127.endPoint = CGPointMake(3888, 2759);
    drawLine0127.width = 21.5;
    drawLine0127.color = line0003.color;
    [station0057.drawPrimitives addObject:drawLine0127];

    // Подложка
    MWDrawLine *drawLine0128 = [[MWDrawLine alloc] init];
    drawLine0128.startPoint = CGPointMake(4150, 2784);
    drawLine0128.endPoint = CGPointMake(4300, 2784);
    drawLine0128.width = 33;
    drawLine0128.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0057.nameOriginalTextPrimitives addObject:drawLine0128];

    MWDrawTextLine *drawTextLine0135 = [[MWDrawTextLine alloc] init];
    drawTextLine0135.text = station0057.nameOriginal;
    drawTextLine0135.fontName = @"HelveticaNeue";
    drawTextLine0135.fontColor = [UIColor blackColor];
    drawTextLine0135.fontSize = 42;
    drawTextLine0135.origin = CGPointMake(3891, 2755);
    drawTextLine0135.kernSpacing = -0.1;
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0135];

    MWDrawTextLine *drawTextLine0136 = [[MWDrawTextLine alloc] init];
    drawTextLine0136.text = station0057.nameEnglish;
    drawTextLine0136.fontName = @"HelveticaNeue";
    drawTextLine0136.fontColor = stationNamesEnglishColor;
    drawTextLine0136.fontSize = 28;
    drawTextLine0136.kernSpacing = -0.2;
    drawTextLine0136.origin = CGPointMake(3891, 2800);
    [station0057.nameEnglishTextPrimitives addObject:drawTextLine0136];

    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 926;
    [edge0021.elements addObject:haul0055];
    
    MWDrawLine *drawLine0129 = [[MWDrawLine alloc] init];
    drawLine0129.startPoint = CGPointMake(3866.5, 2736.5);
    drawLine0129.endPoint = CGPointMake(4036.5, 2565.5);
    drawLine0129.width = 21.5;
    drawLine0129.color = line0003.color;
    [haul0055.drawPrimitives addObject:drawLine0129];

    // Добавляем станцию "Семеновская"
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0021.elements addObject:station0058];
    
    station0058.nameOriginal = @"Семеновская";
    station0058.nameEnglish = @"Semyonovskaya";
    station0058.mapLocation = CGPointMake(4035, 2567);
    station0058.geoLocation = CGPointMake(55.783060, 37.719419);
    
    MWDrawLine *drawLine0130 = [[MWDrawLine alloc] init];
    drawLine0130.startPoint = CGPointMake(4035, 2567);
    drawLine0130.endPoint = CGPointMake(4057, 2589);
    drawLine0130.width = 21.5;
    drawLine0130.color = line0003.color;
    [station0058.drawPrimitives addObject:drawLine0130];

    // Подложка
    MWDrawLine *drawLine0131 = [[MWDrawLine alloc] init];
    drawLine0131.startPoint = CGPointMake(4130, 2616);
    drawLine0131.endPoint = CGPointMake(4230, 2616);
    drawLine0131.width = 40;
    drawLine0131.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0058.nameOriginalTextPrimitives addObject:drawLine0131];

    MWDrawTextLine *drawTextLine0137 = [[MWDrawTextLine alloc] init];
    drawTextLine0137.text = station0058.nameOriginal;
    drawTextLine0137.fontName = @"HelveticaNeue";
    drawTextLine0137.fontColor = [UIColor blackColor];
    drawTextLine0137.fontSize = 42;
    drawTextLine0137.origin = CGPointMake(4058, 2587);
    drawTextLine0137.kernSpacing = 0.6;
    [station0058.nameOriginalTextPrimitives addObject:drawTextLine0137];

    // Подложка
    MWDrawLine *drawLine0132 = [[MWDrawLine alloc] init];
    drawLine0132.startPoint = CGPointMake(4150, 2651);
    drawLine0132.endPoint = CGPointMake(4250, 2651);
    drawLine0132.width = 24;
    drawLine0132.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0058.nameOriginalTextPrimitives addObject:drawLine0132];

    MWDrawTextLine *drawTextLine0138 = [[MWDrawTextLine alloc] init];
    drawTextLine0138.text = station0058.nameEnglish;
    drawTextLine0138.fontName = @"HelveticaNeue";
    drawTextLine0138.fontColor = stationNamesEnglishColor;
    drawTextLine0138.fontSize = 28;
    drawTextLine0138.kernSpacing = -0.8;
    drawTextLine0138.origin = CGPointMake(4055, 2632);
    [station0058.nameEnglishTextPrimitives addObject:drawTextLine0138];

    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 2020;
    [edge0021.elements addObject:haul0056];
    
    MWDrawLine *drawLine0133 = [[MWDrawLine alloc] init];
    drawLine0133.startPoint = CGPointMake(4036, 2566);
    drawLine0133.endPoint = CGPointMake(4098, 2504);
    drawLine0133.width = 21.5;
    drawLine0133.color = line0003.color;
    [haul0056.drawPrimitives addObject:drawLine0133];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(3991.5, 2398.5);
    drawArc0014.startDegrees = 0;
    drawArc0014.endDegrees = 45;
    drawArc0014.radius = 150;
    drawArc0014.width = 21.5;
    drawArc0014.color = line0003.color;
    [haul0056.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0134 = [[MWDrawLine alloc] init];
    drawLine0134.startPoint = CGPointMake(4141.5, 2399);
    drawLine0134.endPoint = CGPointMake(4141.5, 2248);
    drawLine0134.width = 21.5;
    drawLine0134.color = line0003.color;
    [haul0056.drawPrimitives addObject:drawLine0134];

    // Добавляем станцию "Партизанская"
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0021.elements addObject:station0059];
    
    station0059.nameOriginal = @"Партизанская";
    station0059.nameEnglish = @"Partizanskaya";
    station0059.mapLocation = CGPointMake(4141.5, 2248);
    station0059.geoLocation = CGPointMake(55.788451, 37.749615);
    
    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = station0059.mapLocation;
    fillCircle0056.radius = 31.5;
    fillCircle0056.fillColor = line0003.color;
    [station0059.drawPrimitives addObject:fillCircle0056];
    
    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = station0059.mapLocation;
    fillCircle0057.radius = 14;
    fillCircle0057.fillColor = [UIColor whiteColor];
    [station0059.drawPrimitives addObject:fillCircle0057];
    
    MWDrawTextLine *drawTextLine0139 = [[MWDrawTextLine alloc] init];
    drawTextLine0139.text = station0059.nameOriginal;
    drawTextLine0139.fontName = @"HelveticaNeue";
    drawTextLine0139.fontColor = [UIColor blackColor];
    drawTextLine0139.fontSize = 42;
    drawTextLine0139.origin = CGPointMake(4182, 2218);
    drawTextLine0139.kernSpacing = 0.1;
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0139];

    MWDrawTextLine *drawTextLine0140 = [[MWDrawTextLine alloc] init];
    drawTextLine0140.text = station0059.nameEnglish;
    drawTextLine0140.fontName = @"HelveticaNeue";
    drawTextLine0140.fontColor = stationNamesEnglishColor;
    drawTextLine0140.fontSize = 28;
    drawTextLine0140.kernSpacing = -0.2;
    drawTextLine0140.origin = CGPointMake(4182, 2263);
    [station0059.nameEnglishTextPrimitives addObject:drawTextLine0140];

    // Добавляем вершину
    edge0021.finishVertex = vertex0048;
    
    // Создаем участок линии от Партизанская - Щелковская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0075 = [[MWEdge alloc] init];
    edge0075.identifier = @"edge0075";
    edge0075.developmentName = @"Ребро: Партизанская - Щелковская";
    [self.edges addObject:edge0075];
    
    // Добавляем линию
    edge0075.line = line0003;
    
    // Добавляем вершину
    edge0075.startVertex = vertex0048;

    // Добавляем станцию "Партизанская"
    [edge0075.elements addObject:station0059];

    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 2030;
    [edge0075.elements addObject:haul0057];

    MWDrawLine *drawLine0135 = [[MWDrawLine alloc] init];
    drawLine0135.startPoint = CGPointMake(4141.5, 2248.5);
    drawLine0135.endPoint = CGPointMake(4141.5, 2059);
    drawLine0135.width = 21.5;
    drawLine0135.color = line0003.color;
    [haul0057.drawPrimitives addObject:drawLine0135];

    // Добавляем станцию "Измайловская"
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0075.elements addObject:station0060];
    
    station0060.nameOriginal = @"Измайловская";
    station0060.nameEnglish = @"Izmaylovskaya";
    station0060.mapLocation = CGPointMake(4141.5, 2059);
    station0060.geoLocation = CGPointMake(55.787777, 37.781435);
    
    MWDrawLine *drawLine0136 = [[MWDrawLine alloc] init];
    drawLine0136.startPoint = CGPointMake(4141.5, 2059);
    drawLine0136.endPoint = CGPointMake(4173, 2059);
    drawLine0136.width = 21.5;
    drawLine0136.color = line0003.color;
    [station0060.drawPrimitives addObject:drawLine0136];
    
    MWDrawTextLine *drawTextLine0141 = [[MWDrawTextLine alloc] init];
    drawTextLine0141.text = station0060.nameOriginal;
    drawTextLine0141.fontName = @"HelveticaNeue";
    drawTextLine0141.fontColor = [UIColor blackColor];
    drawTextLine0141.fontSize = 42;
    drawTextLine0141.origin = CGPointMake(4182, 2029);
    drawTextLine0141.kernSpacing = 0.4;
    [station0060.nameOriginalTextPrimitives addObject:drawTextLine0141];

    MWDrawTextLine *drawTextLine0142 = [[MWDrawTextLine alloc] init];
    drawTextLine0142.text = station0060.nameEnglish;
    drawTextLine0142.fontName = @"HelveticaNeue";
    drawTextLine0142.fontColor = stationNamesEnglishColor;
    drawTextLine0142.fontSize = 28;
    drawTextLine0142.kernSpacing = -0.0;
    drawTextLine0142.origin = CGPointMake(4182, 2074);
    [station0060.nameEnglishTextPrimitives addObject:drawTextLine0142];

    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 1380;
    [edge0075.elements addObject:haul0058];
    
    MWDrawLine *drawLine0137 = [[MWDrawLine alloc] init];
    drawLine0137.startPoint = CGPointMake(4141.5, 2059.5);
    drawLine0137.endPoint = CGPointMake(4141.5, 1869);
    drawLine0137.width = 21.5;
    drawLine0137.color = line0003.color;
    [haul0058.drawPrimitives addObject:drawLine0137];

    // Добавляем станцию "Первомайская"
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0075.elements addObject:station0061];
    
    station0061.nameOriginal = @"Первомайская";
    station0061.nameEnglish = @"Pervomayskaya";
    station0061.mapLocation = CGPointMake(4141.5, 1869);
    station0061.geoLocation = CGPointMake(55.794506, 37.799361);

    MWDrawLine *drawLine0138 = [[MWDrawLine alloc] init];
    drawLine0138.startPoint = CGPointMake(4141.5, 1869);
    drawLine0138.endPoint = CGPointMake(4173, 1869);
    drawLine0138.width = 21.5;
    drawLine0138.color = line0003.color;
    [station0061.drawPrimitives addObject:drawLine0138];

    MWDrawTextLine *drawTextLine0143 = [[MWDrawTextLine alloc] init];
    drawTextLine0143.text = station0061.nameOriginal;
    drawTextLine0143.fontName = @"HelveticaNeue";
    drawTextLine0143.fontColor = [UIColor blackColor];
    drawTextLine0143.fontSize = 42;
    drawTextLine0143.origin = CGPointMake(4182, 1840);
    drawTextLine0143.kernSpacing = 0.8;
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0143];

    MWDrawTextLine *drawTextLine0144 = [[MWDrawTextLine alloc] init];
    drawTextLine0144.text = station0061.nameEnglish;
    drawTextLine0144.fontName = @"HelveticaNeue";
    drawTextLine0144.fontColor = stationNamesEnglishColor;
    drawTextLine0144.fontSize = 28;
    drawTextLine0144.kernSpacing = -0.5;
    drawTextLine0144.origin = CGPointMake(4182, 1885);
    [station0061.nameEnglishTextPrimitives addObject:drawTextLine0144];

    // Добавляем перегон
    MWHaul *haul0059 = [[MWHaul alloc] init];
    haul0059.identifier = @"haul0059";
    haul0059.length = 1870;
    [edge0075.elements addObject:haul0059];

    MWDrawLine *drawLine0139 = [[MWDrawLine alloc] init];
    drawLine0139.startPoint = CGPointMake(4141.5, 1869.5);
    drawLine0139.endPoint = CGPointMake(4141.5, 1681);
    drawLine0139.width = 21.5;
    drawLine0139.color = line0003.color;
    [haul0059.drawPrimitives addObject:drawLine0139];

    // Добавляем станцию "Щелковская"
    MWStation *station0062 = [[MWStation alloc] init];
    station0062.identifier = @"station0062";
    [edge0075.elements addObject:station0062];
    
    station0062.nameOriginal = @"Щёлковская";
    station0062.nameEnglish = @"Schyolkovskaya";
    station0062.mapLocation = CGPointMake(4141.5, 1681);
    station0062.geoLocation = CGPointMake(55.809287, 37.798627);

    MWDrawLine *drawLine0140 = [[MWDrawLine alloc] init];
    drawLine0140.startPoint = CGPointMake(4110, 1681);
    drawLine0140.endPoint = CGPointMake(4173, 1681);
    drawLine0140.width = 21.5;
    drawLine0140.color = line0003.color;
    [station0062.drawPrimitives addObject:drawLine0140];

    MWDrawTextLine *drawTextLine0145 = [[MWDrawTextLine alloc] init];
    drawTextLine0145.text = station0062.nameOriginal;
    drawTextLine0145.fontName = @"HelveticaNeue";
    drawTextLine0145.fontColor = [UIColor blackColor];
    drawTextLine0145.fontSize = 42;
    drawTextLine0145.origin = CGPointMake(4182, 1651);
    drawTextLine0145.kernSpacing = 0.0;
    [station0062.nameOriginalTextPrimitives addObject:drawTextLine0145];

    MWDrawTextLine *drawTextLine0146 = [[MWDrawTextLine alloc] init];
    drawTextLine0146.text = station0062.nameEnglish;
    drawTextLine0146.fontName = @"HelveticaNeue";
    drawTextLine0146.fontColor = stationNamesEnglishColor;
    drawTextLine0146.fontSize = 28;
    drawTextLine0146.kernSpacing = -0.8;
    drawTextLine0146.origin = CGPointMake(4179, 1696);
    [station0062.nameEnglishTextPrimitives addObject:drawTextLine0146];

    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = CGPointMake(4141, 1618.5); //(192, 1618.5);
    fillCircle0058.radius = 32;
    fillCircle0058.fillColor = line0003.color;
    [station0062.drawPrimitives addObject:fillCircle0058];
    
    MWDrawTextLine *drawTextLine0147 = [[MWDrawTextLine alloc] init];
    drawTextLine0147.text = @"3";
    drawTextLine0147.fontName = @"Georgia-Bold";
    drawTextLine0147.fontColor = [UIColor whiteColor];
    drawTextLine0147.fontSize = 56;
    drawTextLine0147.origin = CGPointMake(4125, 1577);
    [station0062.drawPrimitives addObject:drawTextLine0147];
    
    // Добавляем вершину
    edge0075.finishVertex = vertex0021;
    
    ////////////////////////////////////////////////////////////////
    // 4 - Филевская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Кунцевская - Кутузовская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0022 = [[MWEdge alloc] init];
    edge0022.identifier = @"edge0022";
    edge0022.developmentName = @"Ребро: Кунцевская - Кутузовская";
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
    station0063.mapLocation = CGPointMake(247, 2664.5);
    station0063.geoLocation = CGPointMake(55.730754, 37.445928);
    
    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = CGPointMake(330.5, 2664.5);
    fillCircle0059.radius = 32;
    fillCircle0059.fillColor = line0004.color;
    [station0063.drawPrimitives addObject:fillCircle0059];
    
    MWDrawTextLine *drawTextLine0148 = [[MWDrawTextLine alloc] init];
    drawTextLine0148.text = @"4";
    drawTextLine0148.fontName = @"Georgia-Bold";
    drawTextLine0148.fontColor = [UIColor whiteColor];
    drawTextLine0148.fontSize = 56;
    drawTextLine0148.origin = CGPointMake(311.5, 2622.5);
    [station0063.drawPrimitives addObject:drawTextLine0148];

    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = station0063.mapLocation;
    fillCircle0060.radius = 31.5;
    fillCircle0060.fillColor = line0004.color;
    [station0063.drawPrimitives addObject:fillCircle0060];
    
    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = station0063.mapLocation;
    fillCircle0061.radius = 14;
    fillCircle0061.fillColor = [UIColor whiteColor];
    [station0063.drawPrimitives addObject:fillCircle0061];

    station0063.showNameOnMap = false;
    [station0063.nameOriginalTextPrimitives addObject:drawTextLine0115];
    [station0063.nameEnglishTextPrimitives addObject:drawTextLine0116];
    
    // Добавляем перегон
    MWHaul *haul0060 = [[MWHaul alloc] init];
    haul0060.identifier = @"haul0060";
    haul0060.length = 1380;
    [edge0022.elements addObject:haul0060];

    MWDrawLine *drawLine0141 = [[MWDrawLine alloc] init];
    drawLine0141.startPoint = CGPointMake(247, 2664.5);
    drawLine0141.endPoint = CGPointMake(247, 2839);
    drawLine0141.width = 21.5;
    drawLine0141.color = line0004.color;
    [haul0060.drawPrimitives addObject:drawLine0141];

    // Добавляем станцию "Пионерская"
    MWStation *station0064 = [[MWStation alloc] init];
    station0064.identifier = @"station0064";
    [edge0022.elements addObject:station0064];
    
    station0064.nameOriginal = @"Пионерская";
    station0064.nameEnglish = @"Pionerskaya";
    station0064.mapLocation = CGPointMake(247, 2839);
    station0064.geoLocation = CGPointMake(55.736040, 37.467070);

    MWDrawLine *drawLine0142 = [[MWDrawLine alloc] init];
    drawLine0142.startPoint = CGPointMake(247, 2839);
    drawLine0142.endPoint = CGPointMake(278.5, 2839);
    drawLine0142.width = 21.5;
    drawLine0142.color = line0004.color;
    [station0064.drawPrimitives addObject:drawLine0142];

    MWDrawTextLine *drawTextLine0149 = [[MWDrawTextLine alloc] init];
    drawTextLine0149.text = station0064.nameOriginal;
    drawTextLine0149.fontName = @"HelveticaNeue";
    drawTextLine0149.fontColor = [UIColor blackColor];
    drawTextLine0149.fontSize = 42;
    drawTextLine0149.origin = CGPointMake(288, 2809);
    drawTextLine0149.kernSpacing = 0.6;
    [station0064.nameOriginalTextPrimitives addObject:drawTextLine0149];
    
    MWDrawTextLine *drawTextLine0150 = [[MWDrawTextLine alloc] init];
    drawTextLine0150.text = station0064.nameEnglish;
    drawTextLine0150.fontName = @"HelveticaNeue";
    drawTextLine0150.fontColor = stationNamesEnglishColor;
    drawTextLine0150.fontSize = 28;
    drawTextLine0150.kernSpacing = 0.0;
    drawTextLine0150.origin = CGPointMake(288, 2854);
    [station0064.nameEnglishTextPrimitives addObject:drawTextLine0150];

    // Добавляем перегон
    MWHaul *haul0061 = [[MWHaul alloc] init];
    haul0061.identifier = @"haul0061";
    haul0061.length = 1080;
    [edge0022.elements addObject:haul0061];
    
    MWDrawLine *drawLine0143 = [[MWDrawLine alloc] init];
    drawLine0143.startPoint = CGPointMake(247, 2838.5);
    drawLine0143.endPoint = CGPointMake(247, 2960);
    drawLine0143.width = 21.5;
    drawLine0143.color = line0004.color;
    [haul0061.drawPrimitives addObject:drawLine0143];

    // Добавляем станцию "Филевский Парк"
    MWStation *station0065 = [[MWStation alloc] init];
    station0065.identifier = @"station0065";
    [edge0022.elements addObject:station0065];
    
    station0065.nameOriginal = @"Филёвский парк";
    station0065.nameEnglish = @"Filyovsky Park";
    station0065.mapLocation = CGPointMake(247, 2960);
    station0065.geoLocation = CGPointMake(55.739618, 37.483215);

    MWDrawLine *drawLine0144 = [[MWDrawLine alloc] init];
    drawLine0144.startPoint = CGPointMake(247, 2960);
    drawLine0144.endPoint = CGPointMake(278.5, 2960);
    drawLine0144.width = 21.5;
    drawLine0144.color = line0004.color;
    [station0065.drawPrimitives addObject:drawLine0144];

    MWDrawTextLine *drawTextLine0151 = [[MWDrawTextLine alloc] init];
    drawTextLine0151.text = station0065.nameOriginal;
    drawTextLine0151.fontName = @"HelveticaNeue";
    drawTextLine0151.fontColor = [UIColor blackColor];
    drawTextLine0151.fontSize = 42;
    drawTextLine0151.origin = CGPointMake(290, 2930);
    drawTextLine0151.kernSpacing = 0.0;
    [station0065.nameOriginalTextPrimitives addObject:drawTextLine0151];

    MWDrawTextLine *drawTextLine0152 = [[MWDrawTextLine alloc] init];
    drawTextLine0152.text = station0065.nameEnglish;
    drawTextLine0152.fontName = @"HelveticaNeue";
    drawTextLine0152.fontColor = stationNamesEnglishColor;
    drawTextLine0152.fontSize = 28;
    drawTextLine0152.kernSpacing = -0.2;
    drawTextLine0152.origin = CGPointMake(288, 2974.5);
    [station0065.nameEnglishTextPrimitives addObject:drawTextLine0152];

    // Добавляем перегон
    MWHaul *haul0062 = [[MWHaul alloc] init];
    haul0062.identifier = @"haul0062";
    haul0062.length = 1030;
    [edge0022.elements addObject:haul0062];

    MWDrawLine *drawLine0145 = [[MWDrawLine alloc] init];
    drawLine0145.startPoint = CGPointMake(247, 2959.5);
    drawLine0145.endPoint = CGPointMake(247, 3080);
    drawLine0145.width = 21.5;
    drawLine0145.color = line0004.color;
    [haul0062.drawPrimitives addObject:drawLine0145];

    // Добавляем станцию "Багратионовская"
    MWStation *station0066 = [[MWStation alloc] init];
    station0066.identifier = @"station0066";
    [edge0022.elements addObject:station0066];
    
    station0066.nameOriginal = @"Багратионовская";
    station0066.nameEnglish = @"Bagratchionovskaya";
    station0066.mapLocation = CGPointMake(247, 3080);
    station0066.geoLocation = CGPointMake(55.743793, 37.497744);

    MWDrawLine *drawLine0146 = [[MWDrawLine alloc] init];
    drawLine0146.startPoint = CGPointMake(247, 3080);
    drawLine0146.endPoint = CGPointMake(278.5, 3080);
    drawLine0146.width = 21.5;
    drawLine0146.color = line0004.color;
    [station0066.drawPrimitives addObject:drawLine0146];

    MWDrawTextLine *drawTextLine0153 = [[MWDrawTextLine alloc] init];
    drawTextLine0153.text = station0066.nameOriginal;
    drawTextLine0153.fontName = @"HelveticaNeue";
    drawTextLine0153.fontColor = [UIColor blackColor];
    drawTextLine0153.fontSize = 42;
    drawTextLine0153.origin = CGPointMake(288, 3050);
    drawTextLine0153.kernSpacing = -0.2;
    [station0066.nameOriginalTextPrimitives addObject:drawTextLine0153];

    MWDrawTextLine *drawTextLine0154 = [[MWDrawTextLine alloc] init];
    drawTextLine0154.text = station0066.nameEnglish;
    drawTextLine0154.fontName = @"HelveticaNeue";
    drawTextLine0154.fontColor = stationNamesEnglishColor;
    drawTextLine0154.fontSize = 28;
    drawTextLine0154.kernSpacing = -0.3;
    drawTextLine0154.origin = CGPointMake(288, 3095);
    [station0066.nameEnglishTextPrimitives addObject:drawTextLine0154];

    // Добавляем перегон
    MWHaul *haul0063 = [[MWHaul alloc] init];
    haul0063.identifier = @"haul0063";
    haul0063.length = 1120;
    [edge0022.elements addObject:haul0063];
    
    MWDrawLine *drawLine0147 = [[MWDrawLine alloc] init];
    drawLine0147.startPoint = CGPointMake(247, 3079.5);
    drawLine0147.endPoint = CGPointMake(247, 3204);
    drawLine0147.width = 21.5;
    drawLine0147.color = line0004.color;
    [haul0063.drawPrimitives addObject:drawLine0147];

    // Добавляем станцию "Фили"
    MWStation *station0067 = [[MWStation alloc] init];
    station0067.identifier = @"station0067";
    [edge0022.elements addObject:station0067];
    
    station0067.nameOriginal = @"Фили";
    station0067.nameEnglish = @"Fili";
    station0067.mapLocation = CGPointMake(247, 3200);
    station0067.geoLocation = CGPointMake(55.746101, 37.514794);
    
    MWDrawLine *drawLine0148 = [[MWDrawLine alloc] init];
    drawLine0148.startPoint = CGPointMake(247, 3200);
    drawLine0148.endPoint = CGPointMake(278.5, 3200);
    drawLine0148.width = 21.5;
    drawLine0148.color = line0004.color;
    [station0067.drawPrimitives addObject:drawLine0148];

    MWDrawTextLine *drawTextLine0155 = [[MWDrawTextLine alloc] init];
    drawTextLine0155.text = station0067.nameOriginal;
    drawTextLine0155.fontName = @"HelveticaNeue";
    drawTextLine0155.fontColor = [UIColor blackColor];
    drawTextLine0155.fontSize = 42;
    drawTextLine0155.origin = CGPointMake(290, 3170);
    drawTextLine0155.kernSpacing = 0.2;
    [station0067.nameOriginalTextPrimitives addObject:drawTextLine0155];

    MWDrawTextLine *drawTextLine0156 = [[MWDrawTextLine alloc] init];
    drawTextLine0156.text = station0067.nameEnglish;
    drawTextLine0156.fontName = @"HelveticaNeue";
    drawTextLine0156.fontColor = stationNamesEnglishColor;
    drawTextLine0156.fontSize = 28;
    drawTextLine0156.kernSpacing = -0.4;
    drawTextLine0156.origin = CGPointMake(294, 3143);
    [station0067.nameEnglishTextPrimitives addObject:drawTextLine0156];

    // Добавляем перегон
    MWHaul *haul0064 = [[MWHaul alloc] init];
    haul0064.identifier = @"haul0064";
    haul0064.length = 1390;
    [edge0022.elements addObject:haul0064];

    MWDrawLine *drawLine0149 = [[MWDrawLine alloc] init];
    drawLine0149.startPoint = CGPointMake(247, 3203.5);
    drawLine0149.endPoint = CGPointMake(247, 3539);
    drawLine0149.width = 21.5;
    drawLine0149.color = line0004.color;
    [haul0064.drawPrimitives addObject:drawLine0149];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(327, 3538.5);
    drawArc0015.startDegrees = 90;
    drawArc0015.endDegrees = 180;
    drawArc0015.radius = 80;
    drawArc0015.width = 21.5;
    drawArc0015.color = line0004.color;
    [haul0064.drawPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0150 = [[MWDrawLine alloc] init];
    drawLine0150.startPoint = CGPointMake(326.5, 3618.5);
    drawLine0150.endPoint = CGPointMake(742.5, 3618.5);
    drawLine0150.width = 21.5;
    drawLine0150.color = line0004.color;
    [haul0064.drawPrimitives addObject:drawLine0150];

    // Добавляем станцию "Кутузовская"
    MWStation *station0068 = [[MWStation alloc] init];
    station0068.identifier = @"station0068";
    [edge0022.elements addObject:station0068];
    
    station0068.nameOriginal = @"Кутузовская";
    station0068.nameEnglish = @"Kutuzovskaya";
    station0068.mapLocation = CGPointMake(742.5, 3618.5);
    station0068.geoLocation = CGPointMake(55.740005, 37.534378);
    
    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = station0068.mapLocation;
    fillCircle0062.radius = 31.5;
    fillCircle0062.fillColor = line0004.color;
    [station0068.drawPrimitives addObject:fillCircle0062];
    
    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = station0068.mapLocation;
    fillCircle0063.radius = 14;
    fillCircle0063.fillColor = [UIColor whiteColor];
    [station0068.drawPrimitives addObject:fillCircle0063];
    
    MWDrawTextLine *drawTextLine0157 = [[MWDrawTextLine alloc] init];
    drawTextLine0157.text = station0068.nameOriginal;
    drawTextLine0157.fontName = @"HelveticaNeue";
    drawTextLine0157.fontColor = [UIColor blackColor];
    drawTextLine0157.fontSize = 42;
    drawTextLine0157.origin = CGPointMake(512, 3533.5);
    drawTextLine0157.kernSpacing = -0.3;
    [station0068.nameOriginalTextPrimitives addObject:drawTextLine0157];

    MWDrawTextLine *drawTextLine0158 = [[MWDrawTextLine alloc] init];
    drawTextLine0158.text = station0068.nameEnglish;
    drawTextLine0158.fontName = @"HelveticaNeue";
    drawTextLine0158.fontColor = stationNamesEnglishColor;
    drawTextLine0158.fontSize = 28;
    drawTextLine0158.kernSpacing = -0.6;
    drawTextLine0158.origin = CGPointMake(588, 3507);
    [station0068.nameEnglishTextPrimitives addObject:drawTextLine0158];

    // Добавляем вершину
    edge0022.finishVertex = vertex0054;
    
    // Создаем участок линии Кутузовская - Киевская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0081 = [[MWEdge alloc] init];
    edge0081.identifier = @"edge0081";
    edge0081.developmentName = @"Ребро: Кутузовская - Киевская";
    [self.edges addObject:edge0081];
    
    // Добавляем линию
    edge0081.line = line0004;
    
    // Добавляем вершину
    edge0081.startVertex = vertex0054;
    
    // Добавляем станцию "Кутузовская"
    [edge0081.elements addObject:station0068];

    // Добавляем перегон
    MWHaul *haul0065 = [[MWHaul alloc] init];
    haul0065.identifier = @"haul0065";
    haul0065.length = 904;
    [edge0081.elements addObject:haul0065];

    MWDrawLine *drawLine0151 = [[MWDrawLine alloc] init];
    drawLine0151.startPoint = CGPointMake(742, 3618.5);
    drawLine0151.endPoint = CGPointMake(928, 3618.5);
    drawLine0151.width = 21.5;
    drawLine0151.color = line0004.color;
    [haul0065.drawPrimitives addObject:drawLine0151];

    // Добавляем станцию "Студенческая"
    MWStation *station0069 = [[MWStation alloc] init];
    station0069.identifier = @"station0069";
    [edge0081.elements addObject:station0069];
    
    station0069.nameOriginal = @"Студенческая";
    station0069.nameEnglish = @"Studencheskaya";
    station0069.mapLocation = CGPointMake(928, 3618);
    station0069.geoLocation = CGPointMake(55.738879, 37.548340);

    MWDrawLine *drawLine0152 = [[MWDrawLine alloc] init];
    drawLine0152.startPoint = CGPointMake(928, 3618);
    drawLine0152.endPoint = CGPointMake(928, 3650);
    drawLine0152.width = 21.5;
    drawLine0152.color = line0004.color;
    [station0069.drawPrimitives addObject:drawLine0152];

    // Подложка
    MWDrawLine *drawLine0153 = [[MWDrawLine alloc] init];
    drawLine0153.startPoint = CGPointMake(1100, 3678);
    drawLine0153.endPoint = CGPointMake(1165, 3678);
    drawLine0153.width = 33;
    drawLine0153.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0069.drawPrimitives addObject:drawLine0153];

    MWDrawTextLine *drawTextLine0159 = [[MWDrawTextLine alloc] init];
    drawTextLine0159.text = station0069.nameOriginal;
    drawTextLine0159.fontName = @"HelveticaNeue";
    drawTextLine0159.fontColor = [UIColor blackColor];
    drawTextLine0159.fontSize = 42;
    drawTextLine0159.origin = CGPointMake(880, 3649);
    drawTextLine0159.kernSpacing = 0.2;
    [station0069.nameOriginalTextPrimitives addObject:drawTextLine0159];

    MWDrawTextLine *drawTextLine0160 = [[MWDrawTextLine alloc] init];
    drawTextLine0160.text = station0069.nameEnglish;
    drawTextLine0160.fontName = @"HelveticaNeue";
    drawTextLine0160.fontColor = stationNamesEnglishColor;
    drawTextLine0160.fontSize = 28;
    drawTextLine0160.kernSpacing = -0.4;
    drawTextLine0160.origin = CGPointMake(879, 3694);
    [station0069.nameEnglishTextPrimitives addObject:drawTextLine0160];

    // Добавляем перегон
    MWHaul *haul0066 = [[MWHaul alloc] init];
    haul0066.identifier = @"haul0066";
    haul0066.length = 1300;
    [edge0081.elements addObject:haul0066];
    
    MWDrawLine *drawLine0154 = [[MWDrawLine alloc] init];
    drawLine0154.startPoint = CGPointMake(927.5, 3618.5);
    drawLine0154.endPoint = CGPointMake(951, 3618.5);
    drawLine0154.width = 21.5;
    drawLine0154.color = line0004.color;
    [haul0066.drawPrimitives addObject:drawLine0154];

    MWDrawArc *drawArc0016 = [[MWDrawArc alloc] init];
    drawArc0016.center = CGPointMake(950.5, 3468.5);
    drawArc0016.startDegrees = 45;
    drawArc0016.endDegrees = 90;
    drawArc0016.radius = 150;
    drawArc0016.width = 21.5;
    drawArc0016.color = line0004.color;
    [haul0066.drawPrimitives addObject:drawArc0016];

    MWDrawLine *drawLine0155 = [[MWDrawLine alloc] init];
    drawLine0155.startPoint = CGPointMake(1056, 3575);
    drawLine0155.endPoint = CGPointMake(1259, 3372);
    drawLine0155.width = 21.5;
    drawLine0155.color = line0004.color;
    [haul0066.drawPrimitives addObject:drawLine0155];

    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(1364.5, 3478.5);
    drawArc0017.startDegrees = 225;
    drawArc0017.endDegrees = 270;
    drawArc0017.radius = 150;
    drawArc0017.width = 21.5;
    drawArc0017.color = line0004.color;
    [haul0066.drawPrimitives addObject:drawArc0017];

    MWDrawLine *drawLine0156 = [[MWDrawLine alloc] init];
    drawLine0156.startPoint = CGPointMake(1364, 3328.5);
    drawLine0156.endPoint = CGPointMake(1450, 3328.5);
    drawLine0156.width = 21.5;
    drawLine0156.color = line0004.color;
    [haul0066.drawPrimitives addObject:drawLine0156];

    // Добавляем станцию "Киевская"
    MWStation *station0070 = [[MWStation alloc] init];
    station0070.identifier = @"station0070";
    [edge0081.elements addObject:station0070];
    
    station0070.nameOriginal = @"Киевская";
    station0070.nameEnglish = @"Kiyevskaya";
    station0070.mapLocation = CGPointMake(1450, 3328.5);
    station0070.geoLocation = CGPointMake(55.743629, 37.566485);
    
    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = station0070.mapLocation;
    fillCircle0064.radius = 31.5;
    fillCircle0064.fillColor = line0004.color;
    [station0070.drawPrimitives addObject:fillCircle0064];

    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = station0070.mapLocation;
    fillCircle0065.radius = 14;
    fillCircle0065.fillColor = [UIColor whiteColor];
    [station0070.drawPrimitives addObject:fillCircle0065];

    station0070.showNameOnMap = false;
    [station0070.nameOriginalTextPrimitives addObject:drawLine0112];
    [station0070.nameOriginalTextPrimitives addObject:drawLine0113];
    [station0070.nameOriginalTextPrimitives addObject:drawTextLine0123];
    [station0070.nameEnglishTextPrimitives addObject:drawTextLine0124];
    
    // Добавляем вершину
    edge0081.finishVertex = vertex0019;
    
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
    station0071.nameEnglish = @"Mejhdunarodnaya";
    station0071.mapLocation = CGPointMake(718.5, 3328.5);
    station0071.geoLocation = CGPointMake(55.747810, 37.533180);
    
    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = station0071.mapLocation;
    fillCircle0066.radius = 31.5;
    fillCircle0066.fillColor = line0004.color;
    [station0071.drawPrimitives addObject:fillCircle0066];
    
    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = station0071.mapLocation;
    fillCircle0067.radius = 14;
    fillCircle0067.fillColor = [UIColor whiteColor];
    [station0071.drawPrimitives addObject:fillCircle0067];

    MWDrawTextLine *drawTextLine0161 = [[MWDrawTextLine alloc] init];
    drawTextLine0161.text = station0071.nameOriginal;
    drawTextLine0161.fontName = @"HelveticaNeue";
    drawTextLine0161.fontColor = [UIColor blackColor];
    drawTextLine0161.fontSize = 42;
    drawTextLine0161.origin = CGPointMake(340, 3307);
    drawTextLine0161.kernSpacing = 0.8;
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0161];

    MWDrawTextLine *drawTextLine0162 = [[MWDrawTextLine alloc] init];
    drawTextLine0162.text = station0071.nameEnglish;
    drawTextLine0162.fontName = @"HelveticaNeue";
    drawTextLine0162.fontColor = stationNamesEnglishColor;
    drawTextLine0162.fontSize = 28;
    drawTextLine0162.kernSpacing = -1.0;
    drawTextLine0162.origin = CGPointMake(462, 3280);
    [station0071.nameEnglishTextPrimitives addObject:drawTextLine0162];

    // Добавляем перегон
    MWHaul *haul0067 = [[MWHaul alloc] init];
    haul0067.identifier = @"haul0067";
    haul0067.length = 637;
    [edge0023.elements addObject:haul0067];
    
    MWDrawLine *drawLine0157 = [[MWDrawLine alloc] init];
    drawLine0157.startPoint = CGPointMake(718.5, 3328.5);
    drawLine0157.endPoint = CGPointMake(965.5, 3328.5);
    drawLine0157.width = 21.5;
    drawLine0157.color = line0004.color;
    [haul0067.drawPrimitives addObject:drawLine0157];

    // Добавляем станцию "Выставочная"
    MWStation *station0072 = [[MWStation alloc] init];
    station0072.identifier = @"station0072";
    [edge0023.elements addObject:station0072];
    
    station0072.nameOriginal = @"Выставочная";
    station0072.nameEnglish = @"Vistavochnaya";
    station0072.mapLocation = CGPointMake(965.5, 3328.5);
    station0072.geoLocation = CGPointMake(55.749158, 37.543833);

    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = station0072.mapLocation;
    fillCircle0068.radius = 31.5;
    fillCircle0068.fillColor = line0004.color;
    [station0072.drawPrimitives addObject:fillCircle0068];
    
    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = station0072.mapLocation;
    fillCircle0069.radius = 14;
    fillCircle0069.fillColor = [UIColor whiteColor];
    [station0072.drawPrimitives addObject:fillCircle0069];

    MWDrawTextLine *drawTextLine0163 = [[MWDrawTextLine alloc] init];
    drawTextLine0163.text = station0072.nameOriginal;
    drawTextLine0163.fontName = @"HelveticaNeue";
    drawTextLine0163.fontColor = [UIColor blackColor];
    drawTextLine0163.fontSize = 42;
    drawTextLine0163.origin = CGPointMake(895, 3243);
    drawTextLine0163.kernSpacing = -0.2;
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0163];

    MWDrawTextLine *drawTextLine0164 = [[MWDrawTextLine alloc] init];
    drawTextLine0164.text = station0072.nameEnglish;
    drawTextLine0164.fontName = @"HelveticaNeue";
    drawTextLine0164.fontColor = stationNamesEnglishColor;
    drawTextLine0164.fontSize = 28;
    drawTextLine0164.kernSpacing = -0.4;
    drawTextLine0164.origin = CGPointMake(895, 3216);
    [station0072.nameEnglishTextPrimitives addObject:drawTextLine0164];

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
    
    MWDrawLine *drawLine0158 = [[MWDrawLine alloc] init];
    drawLine0158.startPoint = CGPointMake(965, 3328.5);
    drawLine0158.endPoint = CGPointMake(1450, 3328.5);
    drawLine0158.width = 21.5;
    drawLine0158.color = line0004.color;
    [haul0068.drawPrimitives addObject:drawLine0158];

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
    
    MWDrawLine *drawLine0159 = [[MWDrawLine alloc] init];
    drawLine0159.startPoint = CGPointMake(1449.5, 3328.5);
    drawLine0159.endPoint = CGPointMake(1798, 3328.5);
    drawLine0159.width = 21.5;
    drawLine0159.color = line0004.color;
    [haul0069.drawPrimitives addObject:drawLine0159];

    // Добавляем станцию "Смоленская"
    MWStation *station0073 = [[MWStation alloc] init];
    station0073.identifier = @"station0073";
    [edge0024.elements addObject:station0073];
    
    station0073.nameOriginal = @"Смоленская";
    station0073.nameEnglish = @"Smolenskaya";
    station0073.mapLocation = CGPointMake(1798, 3328.5);
    station0073.geoLocation = CGPointMake(55.749023, 37.582166);
    
    MWDrawLine *drawLine0160 = [[MWDrawLine alloc] init];
    drawLine0160.startPoint = CGPointMake(1798, 3328.5);
    drawLine0160.endPoint = CGPointMake(1798, 3297);
    drawLine0160.width = 21.5;
    drawLine0160.color = line0004.color;
    [station0073.drawPrimitives addObject:drawLine0160];

    MWDrawTextLine *drawTextLine0165 = [[MWDrawTextLine alloc] init];
    drawTextLine0165.text = station0073.nameOriginal;
    drawTextLine0165.fontName = @"HelveticaNeue";
    drawTextLine0165.fontColor = line0004.color;
    drawTextLine0165.fontSize = 42;
    drawTextLine0165.origin = CGPointMake(1675, 3245);
    drawTextLine0165.kernSpacing = 0.5;
    [station0073.nameOriginalTextPrimitives addObject:drawTextLine0165];
    
    MWDrawTextLine *drawTextLine0166 = [[MWDrawTextLine alloc] init];
    drawTextLine0166.text = station0073.nameEnglish;
    drawTextLine0166.fontName = @"HelveticaNeue";
    drawTextLine0166.fontColor = stationNamesEnglishColor;
    drawTextLine0166.fontSize = 28;
    drawTextLine0166.kernSpacing = -0.4;
    drawTextLine0166.origin = CGPointMake(1717, 3224);
    [station0073.nameEnglishTextPrimitives addObject:drawTextLine0166];

    // Добавляем перегон
    MWHaul *haul0070 = [[MWHaul alloc] init];
    haul0070.identifier = @"haul0070";
    haul0070.length = 1290;
    [edge0024.elements addObject:haul0070];
    
    MWDrawLine *drawLine0161 = [[MWDrawLine alloc] init];
    drawLine0161.startPoint = CGPointMake(1797.5, 3328.5);
    drawLine0161.endPoint = CGPointMake(1848, 3328.5);
    drawLine0161.width = 21.5;
    drawLine0161.color = line0004.color;
    [haul0070.drawPrimitives addObject:drawLine0161];

    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(1848, 3478.5);
    drawArc0018.startDegrees = 270;
    drawArc0018.endDegrees = 315;
    drawArc0018.radius = 150;
    drawArc0018.width = 21.5;
    drawArc0018.color = line0004.color;
    [haul0070.drawPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0162 = [[MWDrawLine alloc] init];
    drawLine0162.startPoint = CGPointMake(1954, 3372);
    drawLine0162.endPoint = CGPointMake(1957.5, 3375.5);
    drawLine0162.width = 21.5;
    drawLine0162.color = line0004.color;
    [haul0070.drawPrimitives addObject:drawLine0162];

    // Добавляем станцию "Арбатская"
    MWStation *station0074 = [[MWStation alloc] init];
    station0074.identifier = @"station0074";
    [edge0024.elements addObject:station0074];
    
    station0074.nameOriginal = @"Арбатская";
    station0074.nameEnglish = @"Arbatskaya";
    station0074.mapLocation = CGPointMake(1957.5, 3375.5);
    station0074.geoLocation = CGPointMake(55.752159, 37.601520);
    
    MWDrawLine *drawLine0163 = [[MWDrawLine alloc] init];
    drawLine0163.startPoint = CGPointMake(1957.5, 3375.5);
    drawLine0163.endPoint = CGPointMake(1979, 3354);
    drawLine0163.width = 21.5;
    drawLine0163.color = line0004.color;
    [station0074.drawPrimitives addObject:drawLine0163];

    // Подложка
    MWDrawLine *drawLine0164 = [[MWDrawLine alloc] init];
    drawLine0164.startPoint = CGPointMake(2010, 3339);
    drawLine0164.endPoint = CGPointMake(2060, 3339);
    drawLine0164.width = 35;
    drawLine0164.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0074.nameOriginalTextPrimitives addObject:drawLine0164];

    // Подложка
    MWDrawLine *drawLine0165 = [[MWDrawLine alloc] init];
    drawLine0165.startPoint = CGPointMake(2015, 3298);
    drawLine0165.endPoint = CGPointMake(2065, 3298);
    drawLine0165.width = 24;
    drawLine0165.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0074.nameOriginalTextPrimitives addObject:drawLine0165];

    MWDrawTextLine *drawTextLine0167 = [[MWDrawTextLine alloc] init];
    drawTextLine0167.text = station0074.nameOriginal;
    drawTextLine0167.fontName = @"HelveticaNeue";
    drawTextLine0167.fontColor = line0004.color;
    drawTextLine0167.fontSize = 42;
    drawTextLine0167.origin = CGPointMake(1986, 3308);
    drawTextLine0167.kernSpacing = 0.2;
    [station0074.nameOriginalTextPrimitives addObject:drawTextLine0167];
    
    MWDrawTextLine *drawTextLine0168 = [[MWDrawTextLine alloc] init];
    drawTextLine0168.text = station0074.nameEnglish;
    drawTextLine0168.fontName = @"HelveticaNeue";
    drawTextLine0168.fontColor = stationNamesEnglishColor;
    drawTextLine0168.fontSize = 28;
    drawTextLine0168.kernSpacing = -0.4;
    drawTextLine0168.origin = CGPointMake(1985, 3281);
    [station0074.nameEnglishTextPrimitives addObject:drawTextLine0168];

    // Добавляем перегон
    MWHaul *haul0071 = [[MWHaul alloc] init];
    haul0071.identifier = @"haul0071";
    haul0071.length = 494;
    [edge0024.elements addObject:haul0071];
    
    MWDrawLine *drawLine0166 = [[MWDrawLine alloc] init];
    drawLine0166.startPoint = CGPointMake(1957, 3375);
    drawLine0166.endPoint = CGPointMake(2153, 3571);
    drawLine0166.width = 21.5;
    drawLine0166.color = line0004.color;
    [haul0071.drawPrimitives addObject:drawLine0166];

    // Добавляем станцию "Александровский сад"
    MWStation *station0075 = [[MWStation alloc] init];
    station0075.identifier = @"station0075";
    [edge0024.elements addObject:station0075];
    
    station0075.nameOriginal = @"Александровский сад";
    station0075.nameEnglish = @"Aleksandrovsky Sad";
    station0075.mapLocation = CGPointMake(2153, 3571);
    station0075.geoLocation = CGPointMake(55.752289, 37.608660);

    MWDrawFillCircle *fillCircle0070 = [[MWDrawFillCircle alloc] init];
    fillCircle0070.center = station0075.mapLocation;
    fillCircle0070.radius = 31.5;
    fillCircle0070.fillColor = line0004.color;
    [station0075.drawPrimitives addObject:fillCircle0070];
    
    MWDrawFillCircle *fillCircle0071 = [[MWDrawFillCircle alloc] init];
    fillCircle0071.center = station0075.mapLocation;
    fillCircle0071.radius = 14;
    fillCircle0071.fillColor = [UIColor whiteColor];
    [station0075.drawPrimitives addObject:fillCircle0071];

    // Подложка
    MWDrawLine *drawLine0167 = [[MWDrawLine alloc] init];
    drawLine0167.startPoint = CGPointMake(1950, 3570);
    drawLine0167.endPoint = CGPointMake(2080, 3570);
    drawLine0167.width = 40;
    drawLine0167.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0075.nameOriginalTextPrimitives addObject:drawLine0167];

    MWDrawTextLine *drawTextLine0169 = [[MWDrawTextLine alloc] init];
    drawTextLine0169.text = station0075.nameOriginal;
    drawTextLine0169.fontName = @"HelveticaNeue";
    drawTextLine0169.fontColor = [UIColor blackColor];
    drawTextLine0169.fontSize = 42;
    drawTextLine0169.origin = CGPointMake(1683, 3542);
    drawTextLine0169.kernSpacing = -0.2;
    [station0075.nameOriginalTextPrimitives addObject:drawTextLine0169];
    
    MWDrawTextLine *drawTextLine0170 = [[MWDrawTextLine alloc] init];
    drawTextLine0170.text = station0075.nameEnglish;
    drawTextLine0170.fontName = @"HelveticaNeue";
    drawTextLine0170.fontColor = stationNamesEnglishColor;
    drawTextLine0170.fontSize = 28;
    drawTextLine0170.kernSpacing = -0.3;
    drawTextLine0170.origin = CGPointMake(1771, 3587);
    [station0075.nameEnglishTextPrimitives addObject:drawTextLine0170];

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
    station0076.nameEnglish = @"Dobrininskaya";
    station0076.mapLocation = CGPointMake(2272.5, 4179.5);
    station0076.geoLocation = CGPointMake(55.728985, 37.622779);

    MWDrawFillCircle *fillCircle0072 = [[MWDrawFillCircle alloc] init];
    fillCircle0072.center = station0076.mapLocation;
    fillCircle0072.radius = 31.5;
    fillCircle0072.fillColor = line0005.color;
    [station0076.drawPrimitives addObject:fillCircle0072];

    MWDrawFillCircle *fillCircle0073 = [[MWDrawFillCircle alloc] init];
    fillCircle0073.center = station0076.mapLocation;
    fillCircle0073.radius = 14;
    fillCircle0073.fillColor = [UIColor whiteColor];
    [station0076.drawPrimitives addObject:fillCircle0073];

    MWDrawTextLine *drawTextLine0171 = [[MWDrawTextLine alloc] init];
    drawTextLine0171.text = station0076.nameOriginal;
    drawTextLine0171.fontName = @"HelveticaNeue";
    drawTextLine0171.fontColor = [UIColor blackColor];
    drawTextLine0171.fontSize = 42;
    drawTextLine0171.origin = CGPointMake(1960, 4192);
    drawTextLine0171.kernSpacing = -0.8;
    [station0076.nameOriginalTextPrimitives addObject:drawTextLine0171];

    MWDrawTextLine *drawTextLine0172 = [[MWDrawTextLine alloc] init];
    drawTextLine0172.text = station0076.nameEnglish;
    drawTextLine0172.fontName = @"HelveticaNeue";
    drawTextLine0172.fontColor = stationNamesEnglishColor;
    drawTextLine0172.fontSize = 28;
    drawTextLine0172.kernSpacing = -0.0;
    drawTextLine0172.origin = CGPointMake(2067, 4237);
    [station0076.nameEnglishTextPrimitives addObject:drawTextLine0172];

    // Добавляем перегон
    MWHaul *haul0072 = [[MWHaul alloc] init];
    haul0072.identifier = @"haul0072";
    haul0072.length = 736;
    [edge0025.elements addObject:haul0072];
    
    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(2533, 3241);
    drawArc0019.startDegrees = 105.4;
    drawArc0019.endDegrees = 126.2;
    drawArc0019.radius = 975;
    drawArc0019.width = 21.5;
    drawArc0019.color = line0005.color;
    [haul0072.drawPrimitives addObject:drawArc0019];

    // Добавляем станцию "Октябрьская"
    MWStation *station0077 = [[MWStation alloc] init];
    station0077.identifier = @"station0077";
    [edge0025.elements addObject:station0077];

    station0077.nameOriginal = @"Октябрьская";
    station0077.nameEnglish = @"Oktyabrskaya";
    station0077.mapLocation = CGPointMake(1958, 4027);
    station0077.geoLocation = CGPointMake(55.729254, 37.611311);
    
    MWDrawFillCircle *fillCircle0074 = [[MWDrawFillCircle alloc] init];
    fillCircle0074.center = station0077.mapLocation;
    fillCircle0074.radius = 31.5;
    fillCircle0074.fillColor = line0005.color;
    [station0077.drawPrimitives addObject:fillCircle0074];
    
    MWDrawFillCircle *fillCircle0075 = [[MWDrawFillCircle alloc] init];
    fillCircle0075.center = station0077.mapLocation;
    fillCircle0075.radius = 14;
    fillCircle0075.fillColor = [UIColor whiteColor];
    [station0077.drawPrimitives addObject:fillCircle0075];

    MWDrawTextLine *drawTextLine0173 = [[MWDrawTextLine alloc] init];
    drawTextLine0173.text = station0077.nameOriginal;
    drawTextLine0173.fontName = @"HelveticaNeue";
    drawTextLine0173.fontColor = [UIColor blackColor];
    drawTextLine0173.fontSize = 42;
    drawTextLine0173.origin = CGPointMake(1672, 4037);
    drawTextLine0173.kernSpacing = -0.1;
    [station0077.nameOriginalTextPrimitives addObject:drawTextLine0173];

    MWDrawTextLine *drawTextLine0174 = [[MWDrawTextLine alloc] init];
    drawTextLine0174.text = station0077.nameEnglish;
    drawTextLine0174.fontName = @"HelveticaNeue";
    drawTextLine0174.fontColor = stationNamesEnglishColor;
    drawTextLine0174.fontSize = 28;
    drawTextLine0174.kernSpacing = -0.2;
    drawTextLine0174.origin = CGPointMake(1745, 4082);
    [station0077.nameEnglishTextPrimitives addObject:drawTextLine0174];

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
    
    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(2533, 3241);
    drawArc0020.startDegrees = 126.1;
    drawArc0020.endDegrees = 142.4;
    drawArc0020.radius = 975;
    drawArc0020.width = 21.5;
    drawArc0020.color = line0005.color;
    [haul0073.drawPrimitives addObject:drawArc0020];

    // Добавляем станцию "Парк Культуры"
    MWStation *station0078 = [[MWStation alloc] init];
    station0078.identifier = @"station0078";
    [edge0026.elements addObject:station0078];
    
    station0078.nameOriginal = @"Парк Культуры";
    station0078.nameEnglish = @"Park Kultury";
    station0078.mapLocation = CGPointMake(1762, 3836.5);
    station0078.geoLocation = CGPointMake(55.735204, 37.593076);

    MWDrawFillCircle *fillCircle0076 = [[MWDrawFillCircle alloc] init];
    fillCircle0076.center = station0078.mapLocation;
    fillCircle0076.radius = 31.5;
    fillCircle0076.fillColor = line0005.color;
    [station0078.drawPrimitives addObject:fillCircle0076];
    
    MWDrawFillCircle *fillCircle0077 = [[MWDrawFillCircle alloc] init];
    fillCircle0077.center = station0078.mapLocation;
    fillCircle0077.radius = 14;
    fillCircle0077.fillColor = [UIColor whiteColor];
    [station0078.drawPrimitives addObject:fillCircle0077];

    station0078.showNameOnMap = false;
    [station0078.nameOriginalTextPrimitives addObject:drawTextLine0023];
    [station0078.nameEnglishTextPrimitives addObject:drawTextLine0024];
    
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
    
    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(2533, 3241);
    drawArc0021.startDegrees = 142.3;
    drawArc0021.endDegrees = 170.8;
    drawArc0021.radius = 975;
    drawArc0021.width = 21.5;
    drawArc0021.color = line0005.color;
    [haul0074.drawPrimitives addObject:drawArc0021];

    // Добавляем станцию "Киевская"
    MWStation *station0079 = [[MWStation alloc] init];
    station0079.identifier = @"station0079";
    [edge0027.elements addObject:station0079];
    
    station0079.nameOriginal = @"Киевская";
    station0079.nameEnglish = @"Kiyevskaya";
    station0079.mapLocation = CGPointMake(1571, 3398.5);
    station0079.geoLocation = CGPointMake(55.743631, 37.566483);
    
    MWDrawFillCircle *fillCircle0078 = [[MWDrawFillCircle alloc] init];
    fillCircle0078.center = station0079.mapLocation;
    fillCircle0078.radius = 31.5;
    fillCircle0078.fillColor = line0005.color;
    [station0079.drawPrimitives addObject:fillCircle0078];
    
    MWDrawFillCircle *fillCircle0079 = [[MWDrawFillCircle alloc] init];
    fillCircle0079.center = station0079.mapLocation;
    fillCircle0079.radius = 14;
    fillCircle0079.fillColor = [UIColor whiteColor];
    [station0079.drawPrimitives addObject:fillCircle0079];

    station0079.showNameOnMap = false;
    [station0079.nameOriginalTextPrimitives addObject:drawLine0112];
    [station0079.nameOriginalTextPrimitives addObject:drawLine0113];
    [station0079.nameOriginalTextPrimitives addObject:drawTextLine0123];
    [station0079.nameEnglishTextPrimitives addObject:drawTextLine0124];

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
    
    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(2533, 3241);
    drawArc0022.startDegrees = 170.7;
    drawArc0022.endDegrees = 190.4;
    drawArc0022.radius = 975;
    drawArc0022.width = 21.5;
    drawArc0022.color = line0005.color;
    [haul0075.drawPrimitives addObject:drawArc0022];

    // Добавляем станцию "Краснопресненская"
    MWStation *station0080 = [[MWStation alloc] init];
    station0080.identifier = @"station0080";
    [edge0028.elements addObject:station0080];
    
    station0080.nameOriginal = @"Краснопресненская";
    station0080.nameEnglish = @"Krasnopresnenskaya";
    station0080.mapLocation = CGPointMake(1577.5, 3067.5);
    station0080.geoLocation = CGPointMake(55.760325, 37.577226);
    
    MWDrawFillCircle *fillCircle0080 = [[MWDrawFillCircle alloc] init];
    fillCircle0080.center = station0080.mapLocation;
    fillCircle0080.radius = 31.5;
    fillCircle0080.fillColor = line0005.color;
    [station0080.drawPrimitives addObject:fillCircle0080];
    
    MWDrawFillCircle *fillCircle0081 = [[MWDrawFillCircle alloc] init];
    fillCircle0081.center = station0080.mapLocation;
    fillCircle0081.radius = 14;
    fillCircle0081.fillColor = [UIColor whiteColor];
    [station0080.drawPrimitives addObject:fillCircle0081];

    MWDrawTextLine *drawTextLine0175 = [[MWDrawTextLine alloc] init];
    drawTextLine0175.text = station0080.nameOriginal;
    drawTextLine0175.fontName = @"HelveticaNeue";
    drawTextLine0175.fontColor = [UIColor blackColor];
    drawTextLine0175.fontSize = 42;
    drawTextLine0175.origin = CGPointMake(1142, 3057);
    drawTextLine0175.kernSpacing = -0.1;
    [station0080.nameOriginalTextPrimitives addObject:drawTextLine0175];
    
    MWDrawTextLine *drawTextLine0176 = [[MWDrawTextLine alloc] init];
    drawTextLine0176.text = station0080.nameEnglish;
    drawTextLine0176.fontName = @"HelveticaNeue";
    drawTextLine0176.fontColor = stationNamesEnglishColor;
    drawTextLine0176.fontSize = 28;
    drawTextLine0176.kernSpacing = -0.3;
    drawTextLine0176.origin = CGPointMake(1281, 3102);
    [station0080.nameEnglishTextPrimitives addObject:drawTextLine0176];

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
    
    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(2533, 3241);
    drawArc0023.startDegrees = 190.3;
    drawArc0023.endDegrees = 211.0;
    drawArc0023.radius = 975;
    drawArc0023.width = 21.5;
    drawArc0023.color = line0005.color;
    [haul0076.drawPrimitives addObject:drawArc0023];
    
    // Добавляем станцию "Белорусская"
    MWStation *station0081 = [[MWStation alloc] init];
    station0081.identifier = @"station0081";
    [edge0029.elements addObject:station0081];
    
    station0081.nameOriginal = @"Белорусская";
    station0081.nameEnglish = @"Belorusskaya";
    station0081.mapLocation = CGPointMake(1695.5, 2740);
    station0081.geoLocation = CGPointMake(55.777091, 37.581847);
    
    MWDrawFillCircle *fillCircle0082 = [[MWDrawFillCircle alloc] init];
    fillCircle0082.center = station0081.mapLocation;
    fillCircle0082.radius = 31.5;
    fillCircle0082.fillColor = line0005.color;
    [station0081.drawPrimitives addObject:fillCircle0082];
    
    MWDrawFillCircle *fillCircle0083 = [[MWDrawFillCircle alloc] init];
    fillCircle0083.center = station0081.mapLocation;
    fillCircle0083.radius = 14;
    fillCircle0083.fillColor = [UIColor whiteColor];
    [station0081.drawPrimitives addObject:fillCircle0083];

    station0081.showNameOnMap = false;
    [station0081.nameOriginalTextPrimitives addObject:drawTextLine0084];
    [station0081.nameEnglishTextPrimitives addObject:drawTextLine0085];
    
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
    
    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(2533, 3241);
    drawArc0024.startDegrees = 210.9;
    drawArc0024.endDegrees = 241.5;
    drawArc0024.radius = 975;
    drawArc0024.width = 21.5;
    drawArc0024.color = line0005.color;
    [haul0077.drawPrimitives addObject:drawArc0024];

    MWDrawFillCircle *fillCircle0084 = [[MWDrawFillCircle alloc] init];
    fillCircle0084.center = CGPointMake(1951.5, 2538.5); //(330.5, 2664.5);
    fillCircle0084.radius = 32;
    fillCircle0084.fillColor = line0005.color;
    [haul0077.drawPrimitives addObject:fillCircle0084];
    
    MWDrawTextLine *drawTextLine0177 = [[MWDrawTextLine alloc] init];
    drawTextLine0177.text = @"5";
    drawTextLine0177.fontName = @"Georgia-Bold";
    drawTextLine0177.fontColor = [UIColor whiteColor];
    drawTextLine0177.fontSize = 56;
    drawTextLine0177.origin = CGPointMake(1935, 2496.5);
    [haul0077.drawPrimitives addObject:drawTextLine0177];

    // Добавляем станцию "Новослободская"
    MWStation *station0082 = [[MWStation alloc] init];
    station0082.identifier = @"station0082";
    [edge0030.elements addObject:station0082];
    
    station0082.nameOriginal = @"Новослободская";
    station0082.nameEnglish = @"Novoslobodskaya";
    station0082.mapLocation = CGPointMake(2063.5, 2381);
    station0082.geoLocation = CGPointMake(55.779515, 37.601061);

    MWDrawFillCircle *fillCircle0085 = [[MWDrawFillCircle alloc] init];
    fillCircle0085.center = station0082.mapLocation;
    fillCircle0085.radius = 31.5;
    fillCircle0085.fillColor = line0005.color;
    [station0082.drawPrimitives addObject:fillCircle0085];
    
    MWDrawFillCircle *fillCircle0086 = [[MWDrawFillCircle alloc] init];
    fillCircle0086.center = station0082.mapLocation;
    fillCircle0086.radius = 14;
    fillCircle0086.fillColor = [UIColor whiteColor];
    [station0082.drawPrimitives addObject:fillCircle0086];

    // Подложка
    MWDrawLine *drawLine0168 = [[MWDrawLine alloc] init];
    drawLine0168.startPoint = CGPointMake(2160, 2446);
    drawLine0168.endPoint = CGPointMake(2260, 2446);
    drawLine0168.width = 40;
    drawLine0168.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0082.nameOriginalTextPrimitives addObject:drawLine0168];

    // Подложка
    MWDrawLine *drawLine0169 = [[MWDrawLine alloc] init];
    drawLine0169.startPoint = CGPointMake(2200, 2485);
    drawLine0169.endPoint = CGPointMake(2300, 2485);
    drawLine0169.width = 24;
    drawLine0169.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0082.nameEnglishTextPrimitives addObject:drawLine0169];

    MWDrawTextLine *drawTextLine0178 = [[MWDrawTextLine alloc] init];
    drawTextLine0178.text = station0082.nameOriginal;
    drawTextLine0178.fontName = @"HelveticaNeue";
    drawTextLine0178.fontColor = [UIColor blackColor];
    drawTextLine0178.fontSize = 42;
    drawTextLine0178.origin = CGPointMake(2049, 2417);
    drawTextLine0178.kernSpacing = 0.1;
    [station0082.nameOriginalTextPrimitives addObject:drawTextLine0178];
    
    MWDrawTextLine *drawTextLine0179 = [[MWDrawTextLine alloc] init];
    drawTextLine0179.text = station0082.nameEnglish;
    drawTextLine0179.fontName = @"HelveticaNeue";
    drawTextLine0179.fontColor = stationNamesEnglishColor;
    drawTextLine0179.fontSize = 28;
    drawTextLine0179.kernSpacing = -0.5;
    drawTextLine0179.origin = CGPointMake(2048, 2466);
    [station0082.nameEnglishTextPrimitives addObject:drawTextLine0179];

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
    
    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(2533, 3241);
    drawArc0025.startDegrees = 241.4;
    drawArc0025.endDegrees = 291.4;
    drawArc0025.radius = 975;
    drawArc0025.width = 21.5;
    drawArc0025.color = line0005.color;
    [haul0078.drawPrimitives addObject:drawArc0025];

    // Добавляем станцию "Проспект Мира"
    MWStation *station0083 = [[MWStation alloc] init];
    station0083.identifier = @"station0083";
    [edge0031.elements addObject:station0083];

    station0083.nameOriginal = @"Проспект Мира";
    station0083.nameEnglish = @"Prospekt Mira";
    station0083.mapLocation = CGPointMake(2886.5, 2332);
    station0083.geoLocation = CGPointMake(55.779651, 37.633617);
    
    MWDrawFillCircle *fillCircle0087 = [[MWDrawFillCircle alloc] init];
    fillCircle0087.center = station0083.mapLocation;
    fillCircle0087.radius = 31.5;
    fillCircle0087.fillColor = line0005.color;
    [station0083.drawPrimitives addObject:fillCircle0087];
    
    MWDrawFillCircle *fillCircle0088 = [[MWDrawFillCircle alloc] init];
    fillCircle0088.center = station0083.mapLocation;
    fillCircle0088.radius = 14;
    fillCircle0088.fillColor = [UIColor whiteColor];
    [station0083.drawPrimitives addObject:fillCircle0088];

    MWDrawTextLine *drawTextLine0180 = [[MWDrawTextLine alloc] init];
    drawTextLine0180.text = station0083.nameOriginal;
    drawTextLine0180.fontName = @"HelveticaNeue";
    drawTextLine0180.fontColor = [UIColor blackColor];
    drawTextLine0180.fontSize = 42;
    drawTextLine0180.origin = CGPointMake(2918, 2270);
    drawTextLine0180.kernSpacing = 1.1;
    [station0083.nameOriginalTextPrimitives addObject:drawTextLine0180];
    
    MWDrawTextLine *drawTextLine0181 = [[MWDrawTextLine alloc] init];
    drawTextLine0181.text = station0083.nameEnglish;
    drawTextLine0181.fontName = @"HelveticaNeue";
    drawTextLine0181.fontColor = stationNamesEnglishColor;
    drawTextLine0181.fontSize = 28;
    drawTextLine0181.kernSpacing = 0.4;
    drawTextLine0181.origin = CGPointMake(2930, 2243);
    [station0083.nameEnglishTextPrimitives addObject:drawTextLine0181];
    
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
    
    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(2533, 3241);
    drawArc0026.startDegrees = 291.3;
    drawArc0026.endDegrees = 322.1;
    drawArc0026.radius = 975;
    drawArc0026.width = 21.5;
    drawArc0026.color = line0005.color;
    [haul0079.drawPrimitives addObject:drawArc0026];

    // Добавляем станцию "Комсомольская"
    MWStation *station0084 = [[MWStation alloc] init];
    station0084.identifier = @"station0084";
    [edge0032.elements addObject:station0084];
    
    station0084.nameOriginal = @"Комсомольская";
    station0084.nameEnglish = @"Komsomolskaya";
    station0084.mapLocation = CGPointMake(3301, 2641);
    station0084.geoLocation = CGPointMake(55.776240, 37.655872);

    MWDrawFillCircle *fillCircle0089 = [[MWDrawFillCircle alloc] init];
    fillCircle0089.center = station0084.mapLocation;
    fillCircle0089.radius = 31.5;
    fillCircle0089.fillColor = line0005.color;
    [station0084.drawPrimitives addObject:fillCircle0089];
    
    MWDrawFillCircle *fillCircle0090 = [[MWDrawFillCircle alloc] init];
    fillCircle0090.center = station0084.mapLocation;
    fillCircle0090.radius = 14;
    fillCircle0090.fillColor = [UIColor whiteColor];
    [station0084.drawPrimitives addObject:fillCircle0090];

    station0084.showNameOnMap = false;
    [station0084.nameOriginalTextPrimitives addObject:drawTextLine0039];
    [station0084.nameEnglishTextPrimitives addObject:drawTextLine0040];

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

    MWDrawArc *drawArc0027 = [[MWDrawArc alloc] init];
    drawArc0027.center = CGPointMake(2533, 3241);
    drawArc0027.startDegrees = 322.0;
    drawArc0027.endDegrees = 348.3;
    drawArc0027.radius = 975;
    drawArc0027.width = 21.5;
    drawArc0027.color = line0005.color;
    [haul0080.drawPrimitives addObject:drawArc0027];

    // Добавляем станцию "Курская"
    MWStation *station0085 = [[MWStation alloc] init];
    station0085.identifier = @"station0085";
    [edge0033.elements addObject:station0085];
    
    station0085.nameOriginal = @"Курская";
    station0085.nameEnglish = @"Kurskaya";
    station0085.mapLocation = CGPointMake(3486.5, 3041);
    station0085.geoLocation = CGPointMake(55.758727, 37.659575);
    
    MWDrawFillCircle *fillCircle0091 = [[MWDrawFillCircle alloc] init];
    fillCircle0091.center = station0085.mapLocation;
    fillCircle0091.radius = 31.5;
    fillCircle0091.fillColor = line0005.color;
    [station0085.drawPrimitives addObject:fillCircle0091];
    
    MWDrawFillCircle *fillCircle0092 = [[MWDrawFillCircle alloc] init];
    fillCircle0092.center = station0085.mapLocation;
    fillCircle0092.radius = 14;
    fillCircle0092.fillColor = [UIColor whiteColor];
    [station0085.drawPrimitives addObject:fillCircle0092];

    station0085.showNameOnMap = false;
    [station0085.nameOriginalTextPrimitives addObject:drawLine0122];
    [station0085.nameOriginalTextPrimitives addObject:drawTextLine0131];
    [station0085.nameEnglishTextPrimitives addObject:drawLine0123];
    [station0085.nameEnglishTextPrimitives addObject:drawTextLine0132];
    
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
    
    MWDrawArc *drawArc0028 = [[MWDrawArc alloc] init];
    drawArc0028.center = CGPointMake(2533, 3241);
    drawArc0028.startDegrees = 348.2;
    drawArc0028.endDegrees = 22.1;
    drawArc0028.radius = 975;
    drawArc0028.width = 21.5;
    drawArc0028.color = line0005.color;
    [haul0081.drawPrimitives addObject:drawArc0028];
    
    // Добавляем станцию "Таганская"
    MWStation *station0086 = [[MWStation alloc] init];
    station0086.identifier = @"station0086";
    [edge0034.elements addObject:station0086];
    
    station0086.nameOriginal = @"Таганская";
    station0086.nameEnglish = @"Taganskaya";
    station0086.mapLocation = CGPointMake(3436, 3605.5);
    station0086.geoLocation = CGPointMake(55.739458, 37.653242);
    
    MWDrawFillCircle *fillCircle0093 = [[MWDrawFillCircle alloc] init];
    fillCircle0093.center = station0086.mapLocation;
    fillCircle0093.radius = 31.5;
    fillCircle0093.fillColor = line0005.color;
    [station0086.drawPrimitives addObject:fillCircle0093];

    MWDrawFillCircle *fillCircle0094 = [[MWDrawFillCircle alloc] init];
    fillCircle0094.center = station0086.mapLocation;
    fillCircle0094.radius = 14;
    fillCircle0094.fillColor = [UIColor whiteColor];
    [station0086.drawPrimitives addObject:fillCircle0094];
    
    MWDrawTextLine *drawTextLine0182 = [[MWDrawTextLine alloc] init];
    drawTextLine0182.text = station0086.nameOriginal;
    drawTextLine0182.fontName = @"HelveticaNeue";
    drawTextLine0182.fontColor = [UIColor blackColor];
    drawTextLine0182.fontSize = 42;
    drawTextLine0182.origin = CGPointMake(3241, 3512);
    drawTextLine0182.kernSpacing = -0.1;
    [station0086.nameOriginalTextPrimitives addObject:drawTextLine0182];
    
    MWDrawTextLine *drawTextLine0183 = [[MWDrawTextLine alloc] init];
    drawTextLine0183.text = station0086.nameEnglish;
    drawTextLine0183.fontName = @"HelveticaNeue";
    drawTextLine0183.fontColor = stationNamesEnglishColor;
    drawTextLine0183.fontSize = 28;
    drawTextLine0183.kernSpacing = -0.6;
    drawTextLine0183.origin = CGPointMake(3272, 3485);
    [station0086.nameEnglishTextPrimitives addObject:drawTextLine0183];

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
    
    MWDrawArc *drawArc0029 = [[MWDrawArc alloc] init];
    drawArc0029.center = CGPointMake(2533, 3241);
    drawArc0029.startDegrees = 22.0;
    drawArc0029.endDegrees = 63.2;
    drawArc0029.radius = 975;
    drawArc0029.width = 21.5;
    drawArc0029.color = line0005.color;
    [haul0082.drawPrimitives addObject:drawArc0029];

    MWDrawFillCircle *fillCircle0095 = [[MWDrawFillCircle alloc] init];
    fillCircle0095.center = CGPointMake(3116, 3942); //(1951.5, 2538.5);
    fillCircle0095.radius = 32;
    fillCircle0095.fillColor = line0005.color;
    [haul0082.drawPrimitives addObject:fillCircle0095];
    
    MWDrawTextLine *drawTextLine0184 = [[MWDrawTextLine alloc] init];
    drawTextLine0184.text = @"5";
    drawTextLine0184.fontName = @"Georgia-Bold";
    drawTextLine0184.fontColor = [UIColor whiteColor];
    drawTextLine0184.fontSize = 56;
    drawTextLine0184.origin = CGPointMake(3099.5, 3900);
    [haul0082.drawPrimitives addObject:drawTextLine0184];
    
    // Добавляем станцию "Павелецкая"
    MWStation *station0087 = [[MWStation alloc] init];
    station0087.identifier = @"station0087";
    [edge0035.elements addObject:station0087];
    
    station0087.nameOriginal = @"Павелецкая";
    station0087.nameEnglish = @"Paveletskaya";
    station0087.mapLocation = CGPointMake(2974.5, 4109);
    station0087.geoLocation = CGPointMake(55.731267, 37.636262);

    MWDrawFillCircle *fillCircle0096 = [[MWDrawFillCircle alloc] init];
    fillCircle0096.center = station0087.mapLocation;
    fillCircle0096.radius = 31.5;
    fillCircle0096.fillColor = line0005.color;
    [station0087.drawPrimitives addObject:fillCircle0096];
    
    MWDrawFillCircle *fillCircle0097 = [[MWDrawFillCircle alloc] init];
    fillCircle0097.center = station0087.mapLocation;
    fillCircle0097.radius = 14;
    fillCircle0097.fillColor = [UIColor whiteColor];
    [station0087.drawPrimitives addObject:fillCircle0097];

    station0087.showNameOnMap = false;
    [station0087.nameOriginalTextPrimitives addObject:drawTextLine0074];
    [station0087.nameEnglishTextPrimitives addObject:drawTextLine0075];

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
    
    MWDrawArc *drawArc0030 = [[MWDrawArc alloc] init];
    drawArc0030.center = CGPointMake(2533, 3241);
    drawArc0030.startDegrees = 63.1;
    drawArc0030.endDegrees = 105.5;
    drawArc0030.radius = 975;
    drawArc0030.width = 21.5;
    drawArc0030.color = line0005.color;
    [haul0083.drawPrimitives addObject:drawArc0030];

    // Добавляем станцию "Добрынинская"
    [edge0036.elements addObject:station0076];
    
    // Добавляем вершину
    edge0036.finishVertex = vertex0023;
    
    ////////////////////////////////////////////////////////////////
    // 6 - Калужско-рижская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Новоясеневская - Ленинский проспект
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0037 = [[MWEdge alloc] init];
    edge0037.identifier = @"edge0037";
    edge0037.developmentName = @"Ребро: Новоясеневская - Ленинский проспект";
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
    station0088.mapLocation = CGPointMake(1789.5, 5982);
    station0088.geoLocation = CGPointMake(55.601916, 37.552814);
    
    MWDrawFillCircle *fillCircle0098 = [[MWDrawFillCircle alloc] init];
    fillCircle0098.center = CGPointMake(1706, 5982.5);
    fillCircle0098.radius = 32;
    fillCircle0098.fillColor = line0006.color;
    [station0088.drawPrimitives addObject:fillCircle0098];
    
    MWDrawTextLine *drawTextLine0185 = [[MWDrawTextLine alloc] init];
    drawTextLine0185.text = @"6";
    drawTextLine0185.fontName = @"Georgia-Bold";
    drawTextLine0185.fontColor = [UIColor whiteColor];
    drawTextLine0185.fontSize = 56;
    drawTextLine0185.origin = CGPointMake(1688, 5949);
    [station0088.drawPrimitives addObject:drawTextLine0185];

    MWDrawFillCircle *fillCircle0099 = [[MWDrawFillCircle alloc] init];
    fillCircle0099.center = station0088.mapLocation;
    fillCircle0099.radius = 31.5;
    fillCircle0099.fillColor = line0006.color;
    [station0088.drawPrimitives addObject:fillCircle0099];
    
    MWDrawFillCircle *fillCircle0100 = [[MWDrawFillCircle alloc] init];
    fillCircle0100.center = station0088.mapLocation;
    fillCircle0100.radius = 14;
    fillCircle0100.fillColor = [UIColor whiteColor];
    [station0088.drawPrimitives addObject:fillCircle0100];

    MWDrawTextLine *drawTextLine0186 = [[MWDrawTextLine alloc] init];
    drawTextLine0186.text = station0088.nameOriginal;
    drawTextLine0186.fontName = @"HelveticaNeue";
    drawTextLine0186.fontColor = [UIColor blackColor];
    drawTextLine0186.fontSize = 42;
    drawTextLine0186.origin = CGPointMake(1831, 5957);
    drawTextLine0186.kernSpacing = 0.1;
    [station0088.nameOriginalTextPrimitives addObject:drawTextLine0186];
    
    MWDrawTextLine *drawTextLine0187 = [[MWDrawTextLine alloc] init];
    drawTextLine0187.text = station0088.nameEnglish;
    drawTextLine0187.fontName = @"HelveticaNeue";
    drawTextLine0187.fontColor = stationNamesEnglishColor;
    drawTextLine0187.fontSize = 28;
    drawTextLine0187.kernSpacing = -0.5;
    drawTextLine0187.origin = CGPointMake(1831, 5929);
    [station0088.nameEnglishTextPrimitives addObject:drawTextLine0187];

    // Добавляем перегон
    MWHaul *haul0084 = [[MWHaul alloc] init];
    haul0084.identifier = @"haul0084";
    haul0084.length = 1390;
    [edge0037.elements addObject:haul0084];

    MWDrawArc *drawArc0031 = [[MWDrawArc alloc] init];
    drawArc0031.center = CGPointMake(1862, 5863);
    drawArc0031.startDegrees = 120;
    drawArc0031.endDegrees = 180;
    drawArc0031.radius = 140;
    drawArc0031.width = 21.5;
    drawArc0031.color = line0006.color;
    [haul0084.drawPrimitives addObject:drawArc0031];
    
    // Добавляем станцию "Ясенево"
    MWStation *station0089 = [[MWStation alloc] init];
    station0089.identifier = @"station0089";
    [edge0037.elements addObject:station0089];
    
    station0089.nameOriginal = @"Ясенево";
    station0089.nameEnglish = @"Yasenevo";
    station0089.mapLocation = CGPointMake(1722, 5863);
    station0089.geoLocation = CGPointMake(55.606166, 37.533609);
    
    MWDrawLine *drawLine0170 = [[MWDrawLine alloc] init];
    drawLine0170.startPoint = CGPointMake(1722, 5863);
    drawLine0170.endPoint = CGPointMake(1753, 5863);
    drawLine0170.width = 21.5;
    drawLine0170.color = line0006.color;
    [station0089.drawPrimitives addObject:drawLine0170];

    MWDrawTextLine *drawTextLine0188 = [[MWDrawTextLine alloc] init];
    drawTextLine0188.text = station0089.nameOriginal;
    drawTextLine0188.fontName = @"HelveticaNeue";
    drawTextLine0188.fontColor = [UIColor blackColor];
    drawTextLine0188.fontSize = 42;
    drawTextLine0188.origin = CGPointMake(1763, 5833);
    drawTextLine0188.kernSpacing = 0.1;
    [station0089.nameOriginalTextPrimitives addObject:drawTextLine0188];

    MWDrawTextLine *drawTextLine0189 = [[MWDrawTextLine alloc] init];
    drawTextLine0189.text = station0089.nameEnglish;
    drawTextLine0189.fontName = @"HelveticaNeue";
    drawTextLine0189.fontColor = stationNamesEnglishColor;
    drawTextLine0189.fontSize = 28;
    drawTextLine0189.kernSpacing = -0.2;
    drawTextLine0189.origin = CGPointMake(1761, 5878);
    [station0089.nameEnglishTextPrimitives addObject:drawTextLine0189];

    // Добавляем перегон
    MWHaul *haul0085 = [[MWHaul alloc] init];
    haul0085.identifier = @"haul0085";
    haul0085.length = 2600;
    [edge0037.elements addObject:haul0085];
    
    MWDrawLine *drawLine0171 = [[MWDrawLine alloc] init];
    drawLine0171.startPoint = CGPointMake(1722, 5863);
    drawLine0171.endPoint = CGPointMake(1722, 5741);
    drawLine0171.width = 21.5;
    drawLine0171.color = line0006.color;
    [haul0085.drawPrimitives addObject:drawLine0171];

    // Добавляем станцию "Теплый Стан"
    MWStation *station0090 = [[MWStation alloc] init];
    station0090.identifier = @"station0090";
    [edge0037.elements addObject:station0090];
    
    station0090.nameOriginal = @"Тёплый Стан";
    station0090.nameEnglish = @"Tyoply Stan";
    station0090.mapLocation = CGPointMake(1722, 5741);
    station0090.geoLocation = CGPointMake(55.618529, 37.507384);
    
    MWDrawLine *drawLine0172 = [[MWDrawLine alloc] init];
    drawLine0172.startPoint = CGPointMake(1722, 5741);
    drawLine0172.endPoint = CGPointMake(1753, 5741);
    drawLine0172.width = 21.5;
    drawLine0172.color = line0006.color;
    [station0090.drawPrimitives addObject:drawLine0172];

    MWDrawTextLine *drawTextLine0190 = [[MWDrawTextLine alloc] init];
    drawTextLine0190.text = station0090.nameOriginal;
    drawTextLine0190.fontName = @"HelveticaNeue";
    drawTextLine0190.fontColor = [UIColor blackColor];
    drawTextLine0190.fontSize = 42;
    drawTextLine0190.origin = CGPointMake(1763, 5711.5);
    drawTextLine0190.kernSpacing = -0.2;
    [station0090.nameOriginalTextPrimitives addObject:drawTextLine0190];

    MWDrawTextLine *drawTextLine0191 = [[MWDrawTextLine alloc] init];
    drawTextLine0191.text = station0090.nameEnglish;
    drawTextLine0191.fontName = @"HelveticaNeue";
    drawTextLine0191.fontColor = stationNamesEnglishColor;
    drawTextLine0191.fontSize = 28;
    drawTextLine0191.kernSpacing = -0.2;
    drawTextLine0191.origin = CGPointMake(1761, 5756.5);
    [station0090.nameEnglishTextPrimitives addObject:drawTextLine0191];

    // Добавляем перегон
    MWHaul *haul0086 = [[MWHaul alloc] init];
    haul0086.identifier = @"haul0086";
    haul0086.length = 1900;
    [edge0037.elements addObject:haul0086];
    
    MWDrawLine *drawLine0173 = [[MWDrawLine alloc] init];
    drawLine0173.startPoint = CGPointMake(1722, 5741.5);
    drawLine0173.endPoint = CGPointMake(1722, 5619);
    drawLine0173.width = 21.5;
    drawLine0173.color = line0006.color;
    [haul0086.drawPrimitives addObject:drawLine0173];

    // Добавляем станцию "Коньково"
    MWStation *station0091 = [[MWStation alloc] init];
    station0091.identifier = @"station0091";
    [edge0037.elements addObject:station0091];
    
    station0091.nameOriginal = @"Коньково";
    station0091.nameEnglish = @"Konkovo";
    station0091.mapLocation = CGPointMake(1722, 5619);
    station0091.geoLocation = CGPointMake(55.633311, 37.519266);
    
    MWDrawLine *drawLine0174 = [[MWDrawLine alloc] init];
    drawLine0174.startPoint = CGPointMake(1722, 5619);
    drawLine0174.endPoint = CGPointMake(1753, 5619);
    drawLine0174.width = 21.5;
    drawLine0174.color = line0006.color;
    [station0091.drawPrimitives addObject:drawLine0174];

    MWDrawTextLine *drawTextLine0192 = [[MWDrawTextLine alloc] init];
    drawTextLine0192.text = station0091.nameOriginal;
    drawTextLine0192.fontName = @"HelveticaNeue";
    drawTextLine0192.fontColor = [UIColor blackColor];
    drawTextLine0192.fontSize = 42;
    drawTextLine0192.origin = CGPointMake(1763, 5589);
    drawTextLine0192.kernSpacing = 0.2;
    [station0091.nameOriginalTextPrimitives addObject:drawTextLine0192];

    MWDrawTextLine *drawTextLine0193 = [[MWDrawTextLine alloc] init];
    drawTextLine0193.text = station0091.nameEnglish;
    drawTextLine0193.fontName = @"HelveticaNeue";
    drawTextLine0193.fontColor = stationNamesEnglishColor;
    drawTextLine0193.fontSize = 28;
    drawTextLine0193.kernSpacing = -0.4;
    drawTextLine0193.origin = CGPointMake(1765, 5634);
    [station0091.nameEnglishTextPrimitives addObject:drawTextLine0193];

    // Добавляем перегон
    MWHaul *haul0087 = [[MWHaul alloc] init];
    haul0087.identifier = @"haul0087";
    haul0087.length = 1040;
    [edge0037.elements addObject:haul0087];
    
    MWDrawLine *drawLine0175 = [[MWDrawLine alloc] init];
    drawLine0175.startPoint = CGPointMake(1722, 5619.5);
    drawLine0175.endPoint = CGPointMake(1722, 5497);
    drawLine0175.width = 21.5;
    drawLine0175.color = line0006.color;
    [haul0087.drawPrimitives addObject:drawLine0175];

    // Добавляем станцию "Беляево"
    MWStation *station0092 = [[MWStation alloc] init];
    station0092.identifier = @"station0092";
    [edge0037.elements addObject:station0092];
    
    station0092.nameOriginal = @"Беляево";
    station0092.nameEnglish = @"Belyayevo";
    station0092.mapLocation = CGPointMake(1722, 5497);
    station0092.geoLocation = CGPointMake(55.642667, 37.526563);
    
    MWDrawLine *drawLine0176 = [[MWDrawLine alloc] init];
    drawLine0176.startPoint = CGPointMake(1722, 5497);
    drawLine0176.endPoint = CGPointMake(1753, 5497);
    drawLine0176.width = 21.5;
    drawLine0176.color = line0006.color;
    [station0092.drawPrimitives addObject:drawLine0176];

    MWDrawTextLine *drawTextLine0194 = [[MWDrawTextLine alloc] init];
    drawTextLine0194.text = station0092.nameOriginal;
    drawTextLine0194.fontName = @"HelveticaNeue";
    drawTextLine0194.fontColor = [UIColor blackColor];
    drawTextLine0194.fontSize = 42;
    drawTextLine0194.origin = CGPointMake(1763, 5467.5);
    drawTextLine0194.kernSpacing = 0.0;
    [station0092.nameOriginalTextPrimitives addObject:drawTextLine0194];
    
    MWDrawTextLine *drawTextLine0195 = [[MWDrawTextLine alloc] init];
    drawTextLine0195.text = station0092.nameEnglish;
    drawTextLine0195.fontName = @"HelveticaNeue";
    drawTextLine0195.fontColor = stationNamesEnglishColor;
    drawTextLine0195.fontSize = 28;
    drawTextLine0195.kernSpacing = -0.6;
    drawTextLine0195.origin = CGPointMake(1763, 5512);
    [station0092.nameEnglishTextPrimitives addObject:drawTextLine0195];

    // Добавляем перегон
    MWHaul *haul0088 = [[MWHaul alloc] init];
    haul0088.identifier = @"haul0088";
    haul0088.length = 1820;
    [edge0037.elements addObject:haul0088];
    
    MWDrawLine *drawLine0177 = [[MWDrawLine alloc] init];
    drawLine0177.startPoint = CGPointMake(1722, 5497.5);
    drawLine0177.endPoint = CGPointMake(1722, 5375);
    drawLine0177.width = 21.5;
    drawLine0177.color = line0006.color;
    [haul0088.drawPrimitives addObject:drawLine0177];

    // Добавляем станцию "Калужская"
    MWStation *station0093 = [[MWStation alloc] init];
    station0093.identifier = @"station0093";
    [edge0037.elements addObject:station0093];
    
    station0093.nameOriginal = @"Калужская";
    station0093.nameEnglish = @"Kalujskaya";
    station0093.mapLocation = CGPointMake(1722, 5375);
    station0093.geoLocation = CGPointMake(55.657135,  37.540428);
    
    MWDrawLine *drawLine0178 = [[MWDrawLine alloc] init];
    drawLine0178.startPoint = CGPointMake(1722, 5375);
    drawLine0178.endPoint = CGPointMake(1753, 5375);
    drawLine0178.width = 21.5;
    drawLine0178.color = line0006.color;
    [station0093.drawPrimitives addObject:drawLine0178];

    MWDrawTextLine *drawTextLine0196 = [[MWDrawTextLine alloc] init];
    drawTextLine0196.text = station0093.nameOriginal;
    drawTextLine0196.fontName = @"HelveticaNeue";
    drawTextLine0196.fontColor = [UIColor blackColor];
    drawTextLine0196.fontSize = 42;
    drawTextLine0196.origin = CGPointMake(1763, 5345);
    drawTextLine0196.kernSpacing = 0.0;
    [station0093.nameOriginalTextPrimitives addObject:drawTextLine0196];

    MWDrawTextLine *drawTextLine0197 = [[MWDrawTextLine alloc] init];
    drawTextLine0197.text = station0093.nameEnglish;
    drawTextLine0197.fontName = @"HelveticaNeue";
    drawTextLine0197.fontColor = stationNamesEnglishColor;
    drawTextLine0197.fontSize = 28;
    drawTextLine0197.kernSpacing = -0.4;
    drawTextLine0197.origin = CGPointMake(1763, 5390);
    [station0093.nameEnglishTextPrimitives addObject:drawTextLine0197];

    // Добавляем перегон
    MWHaul *haul0089 = [[MWHaul alloc] init];
    haul0089.identifier = @"haul0089";
    haul0089.length = 1750;
    [edge0037.elements addObject:haul0089];
    
    MWDrawLine *drawLine0179 = [[MWDrawLine alloc] init];
    drawLine0179.startPoint = CGPointMake(1722, 5375.5);
    drawLine0179.endPoint = CGPointMake(1722, 5253);
    drawLine0179.width = 21.5;
    drawLine0179.color = line0006.color;
    [haul0089.drawPrimitives addObject:drawLine0179];

    // Добавляем станцию "Новые Черемушки"
    MWStation *station0094 = [[MWStation alloc] init];
    station0094.identifier = @"station0094";
    [edge0037.elements addObject:station0094];
    
    station0094.nameOriginal = @"Новые Черёмушки";
    station0094.nameEnglish = @"Novye Cheryomushki";
    station0094.mapLocation = CGPointMake(1722, 5253);
    station0094.geoLocation = CGPointMake(55.670382, 37.554717);

    MWDrawLine *drawLine0180 = [[MWDrawLine alloc] init];
    drawLine0180.startPoint = CGPointMake(1722, 5253);
    drawLine0180.endPoint = CGPointMake(1753, 5253);
    drawLine0180.width = 21.5;
    drawLine0180.color = line0006.color;
    [station0094.drawPrimitives addObject:drawLine0180];

    MWDrawTextLine *drawTextLine0198 = [[MWDrawTextLine alloc] init];
    drawTextLine0198.text = station0094.nameOriginal;
    drawTextLine0198.fontName = @"HelveticaNeue";
    drawTextLine0198.fontColor = [UIColor blackColor];
    drawTextLine0198.fontSize = 42;
    drawTextLine0198.origin = CGPointMake(1763, 5223);
    drawTextLine0198.kernSpacing = 0.9;
    [station0094.nameOriginalTextPrimitives addObject:drawTextLine0198];

    MWDrawTextLine *drawTextLine0199 = [[MWDrawTextLine alloc] init];
    drawTextLine0199.text = station0094.nameEnglish;
    drawTextLine0199.fontName = @"HelveticaNeue";
    drawTextLine0199.fontColor = stationNamesEnglishColor;
    drawTextLine0199.fontSize = 28;
    drawTextLine0199.kernSpacing = -0.0;
    drawTextLine0199.origin = CGPointMake(1763, 5268);
    [station0094.nameEnglishTextPrimitives addObject:drawTextLine0199];

    // Добавляем перегон
    MWHaul *haul0090 = [[MWHaul alloc] init];
    haul0090.identifier = @"haul0090";
    haul0090.length = 981;
    [edge0037.elements addObject:haul0090];

    MWDrawLine *drawLine0181 = [[MWDrawLine alloc] init];
    drawLine0181.startPoint = CGPointMake(1722, 5253.5);
    drawLine0181.endPoint = CGPointMake(1722, 5131);
    drawLine0181.width = 21.5;
    drawLine0181.color = line0006.color;
    [haul0090.drawPrimitives addObject:drawLine0181];

    // Добавляем станцию "Профсоюзная"
    MWStation *station0095 = [[MWStation alloc] init];
    station0095.identifier = @"station0095";
    [edge0037.elements addObject:station0095];
    
    station0095.nameOriginal = @"Профсоюзная";
    station0095.nameEnglish = @"Profsoyuznaya";
    station0095.mapLocation = CGPointMake(1722, 5131);
    station0095.geoLocation = CGPointMake(55.677985, 37.562870);
    
    MWDrawLine *drawLine0182 = [[MWDrawLine alloc] init];
    drawLine0182.startPoint = CGPointMake(1722, 5131);
    drawLine0182.endPoint = CGPointMake(1753, 5131);
    drawLine0182.width = 21.5;
    drawLine0182.color = line0006.color;
    [station0095.drawPrimitives addObject:drawLine0182];

    MWDrawTextLine *drawTextLine0200 = [[MWDrawTextLine alloc] init];
    drawTextLine0200.text = station0095.nameOriginal;
    drawTextLine0200.fontName = @"HelveticaNeue";
    drawTextLine0200.fontColor = [UIColor blackColor];
    drawTextLine0200.fontSize = 42;
    drawTextLine0200.origin = CGPointMake(1763, 5101);
    drawTextLine0200.kernSpacing = -0.2;
    [station0095.nameOriginalTextPrimitives addObject:drawTextLine0200];

    MWDrawTextLine *drawTextLine0201 = [[MWDrawTextLine alloc] init];
    drawTextLine0201.text = station0095.nameEnglish;
    drawTextLine0201.fontName = @"HelveticaNeue";
    drawTextLine0201.fontColor = stationNamesEnglishColor;
    drawTextLine0201.fontSize = 28;
    drawTextLine0201.kernSpacing = -0.4;
    drawTextLine0201.origin = CGPointMake(1763, 5146);
    [station0095.nameEnglishTextPrimitives addObject:drawTextLine0201];

    // Добавляем перегон
    MWHaul *haul0091 = [[MWHaul alloc] init];
    haul0091.identifier = @"haul0091";
    haul0091.length = 1310;
    [edge0037.elements addObject:haul0091];
    
    MWDrawLine *drawLine0183 = [[MWDrawLine alloc] init];
    drawLine0183.startPoint = CGPointMake(1722, 5131.5);
    drawLine0183.endPoint = CGPointMake(1722, 5009);
    drawLine0183.width = 21.5;
    drawLine0183.color = line0006.color;
    [haul0091.drawPrimitives addObject:drawLine0183];

    // Добавляем станцию "Академическая"
    MWStation *station0096 = [[MWStation alloc] init];
    station0096.identifier = @"station0096";
    [edge0037.elements addObject:station0096];
    
    station0096.nameOriginal = @"Академическая";
    station0096.nameEnglish = @"Akademicheskaya";
    station0096.mapLocation = CGPointMake(1722, 5009);
    station0096.geoLocation = CGPointMake(55.687912, 37.573531);

    MWDrawLine *drawLine0184 = [[MWDrawLine alloc] init];
    drawLine0184.startPoint = CGPointMake(1722, 5009);
    drawLine0184.endPoint = CGPointMake(1753, 5009);
    drawLine0184.width = 21.5;
    drawLine0184.color = line0006.color;
    [station0096.drawPrimitives addObject:drawLine0184];

    MWDrawTextLine *drawTextLine0202 = [[MWDrawTextLine alloc] init];
    drawTextLine0202.text = station0096.nameOriginal;
    drawTextLine0202.fontName = @"HelveticaNeue";
    drawTextLine0202.fontColor = [UIColor blackColor];
    drawTextLine0202.fontSize = 42;
    drawTextLine0202.origin = CGPointMake(1763, 4979);
    drawTextLine0202.kernSpacing = 0.8;
    [station0096.nameOriginalTextPrimitives addObject:drawTextLine0202];

    MWDrawTextLine *drawTextLine0203 = [[MWDrawTextLine alloc] init];
    drawTextLine0203.text = station0096.nameEnglish;
    drawTextLine0203.fontName = @"HelveticaNeue";
    drawTextLine0203.fontColor = stationNamesEnglishColor;
    drawTextLine0203.fontSize = 28;
    drawTextLine0203.kernSpacing = -0.3;
    drawTextLine0203.origin = CGPointMake(1763, 5024);
    [station0096.nameEnglishTextPrimitives addObject:drawTextLine0203];

    // Добавляем перегон
    MWHaul *haul0092 = [[MWHaul alloc] init];
    haul0092.identifier = @"haul0092";
    haul0092.length = 2390;
    [edge0037.elements addObject:haul0092];

    MWDrawLine *drawLine0185 = [[MWDrawLine alloc] init];
    drawLine0185.startPoint = CGPointMake(1722, 5009.5);
    drawLine0185.endPoint = CGPointMake(1722, 4723.5);
    drawLine0185.width = 21.5;
    drawLine0185.color = line0006.color;
    [haul0092.drawPrimitives addObject:drawLine0185];

    // Добавляем станцию "Ленинский проспект"
    MWStation *station0097 = [[MWStation alloc] init];
    station0097.identifier = @"station0097";
    [edge0037.elements addObject:station0097];
    
    station0097.nameOriginal = @"Ленинский проспект";
    station0097.nameEnglish = @"Leninsky Prospekt";
    station0097.mapLocation = CGPointMake(1722, 4723.5);
    station0097.geoLocation = CGPointMake(55.707593, 37.586469);
    
    MWDrawFillCircle *fillCircle0101 = [[MWDrawFillCircle alloc] init];
    fillCircle0101.center = station0097.mapLocation;
    fillCircle0101.radius = 31.5;
    fillCircle0101.fillColor = line0006.color;
    [station0097.drawPrimitives addObject:fillCircle0101];

    MWDrawFillCircle *fillCircle0102 = [[MWDrawFillCircle alloc] init];
    fillCircle0102.center = station0097.mapLocation;
    fillCircle0102.radius = 14;
    fillCircle0102.fillColor = [UIColor whiteColor];
    [station0097.drawPrimitives addObject:fillCircle0102];
    
    MWDrawTextLine *drawTextLine0204 = [[MWDrawTextLine alloc] init];
    drawTextLine0204.text = @"Ленинский";
    drawTextLine0204.fontName = @"HelveticaNeue";
    drawTextLine0204.fontColor = [UIColor blackColor];
    drawTextLine0204.fontSize = 42;
    drawTextLine0204.origin = CGPointMake(1763, 4670);
    drawTextLine0204.kernSpacing = 0.8;
    [station0097.nameOriginalTextPrimitives addObject:drawTextLine0204];

    MWDrawTextLine *drawTextLine0205 = [[MWDrawTextLine alloc] init];
    drawTextLine0205.text = @"проспект";
    drawTextLine0205.fontName = @"HelveticaNeue";
    drawTextLine0205.fontColor = [UIColor blackColor];
    drawTextLine0205.fontSize = 42;
    drawTextLine0205.origin = CGPointMake(1763, 4710);
    drawTextLine0205.kernSpacing = 0.7;
    [station0097.nameOriginalTextPrimitives addObject:drawTextLine0205];

    MWDrawTextLine *drawTextLine0206 = [[MWDrawTextLine alloc] init];
    drawTextLine0206.text = station0097.nameEnglish;
    drawTextLine0206.fontName = @"HelveticaNeue";
    drawTextLine0206.fontColor = stationNamesEnglishColor;
    drawTextLine0206.fontSize = 28;
    drawTextLine0206.kernSpacing = -0.0;
    drawTextLine0206.origin = CGPointMake(1763, 4643);
    [station0097.nameEnglishTextPrimitives addObject:drawTextLine0206];

    // Добавляем вершину
    edge0037.finishVertex = vertex0052;
    
    // Создаем участок линии Ленинский проспект - Октябрьская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0079 = [[MWEdge alloc] init];
    edge0079.identifier = @"edge0079";
    edge0079.developmentName = @"Ребро: Ленинский проспект - Октябрьская";
    [self.edges addObject:edge0079];
    
    // Добавляем линию
    edge0079.line = line0006;
    
    // Добавляем вершину
    edge0079.startVertex = vertex0052;
    
    // Добавляем станцию "Ленинский проспект"
    [edge0079.elements addObject:station0097];

    // Добавляем перегон
    MWHaul *haul0093 = [[MWHaul alloc] init];
    haul0093.identifier = @"haul0093";
    haul0093.length = 1880;
    [edge0079.elements addObject:haul0093];
    
    MWDrawLine *drawLine0186 = [[MWDrawLine alloc] init];
    drawLine0186.startPoint = CGPointMake(1722, 4724);
    drawLine0186.endPoint = CGPointMake(1722, 4458);
    drawLine0186.width = 21.5;
    drawLine0186.color = line0006.color;
    [haul0093.drawPrimitives addObject:drawLine0186];

    // Добавляем станцию "Шаболовская"
    MWStation *station0098 = [[MWStation alloc] init];
    station0098.identifier = @"station0098";
    [edge0079.elements addObject:station0098];
    
    station0098.nameOriginal = @"Шаболовская";
    station0098.nameEnglish = @"Shabolovskaya";
    station0098.mapLocation = CGPointMake(1722, 4458);
    station0098.geoLocation = CGPointMake(55.718816, 37.608139);
    
    MWDrawLine *drawLine0187 = [[MWDrawLine alloc] init];
    drawLine0187.startPoint = CGPointMake(1722, 4458);
    drawLine0187.endPoint = CGPointMake(1753, 4458);
    drawLine0187.width = 21.5;
    drawLine0187.color = line0006.color;
    [station0098.drawPrimitives addObject:drawLine0187];

    MWDrawTextLine *drawTextLine0207 = [[MWDrawTextLine alloc] init];
    drawTextLine0207.text = station0098.nameOriginal;
    drawTextLine0207.fontName = @"HelveticaNeue";
    drawTextLine0207.fontColor = [UIColor blackColor];
    drawTextLine0207.fontSize = 42;
    drawTextLine0207.origin = CGPointMake(1763, 4430);
    drawTextLine0207.kernSpacing = 0.0;
    [station0098.nameOriginalTextPrimitives addObject:drawTextLine0207];

    MWDrawTextLine *drawTextLine0208 = [[MWDrawTextLine alloc] init];
    drawTextLine0208.text = station0098.nameEnglish;
    drawTextLine0208.fontName = @"HelveticaNeue";
    drawTextLine0208.fontColor = stationNamesEnglishColor;
    drawTextLine0208.fontSize = 28;
    drawTextLine0208.kernSpacing = -0.5;
    drawTextLine0208.origin = CGPointMake(1761, 4474);
    [station0098.nameEnglishTextPrimitives addObject:drawTextLine0208];

    // Добавляем перегон
    MWHaul *haul0094 = [[MWHaul alloc] init];
    haul0094.identifier = @"haul0094";
    haul0094.length = 1440;
    [edge0079.elements addObject:haul0094];

    MWDrawLine *drawLine0188 = [[MWDrawLine alloc] init];
    drawLine0188.startPoint = CGPointMake(1722, 4458.5);
    drawLine0188.endPoint = CGPointMake(1722, 4403);
    drawLine0188.width = 21.5;
    drawLine0188.color = line0006.color;
    [haul0094.drawPrimitives addObject:drawLine0188];

    MWDrawArc *drawArc0032 = [[MWDrawArc alloc] init];
    drawArc0032.center = CGPointMake(1872, 4403.5);
    drawArc0032.startDegrees = 180;
    drawArc0032.endDegrees = 225;
    drawArc0032.radius = 150;
    drawArc0032.width = 21.5;
    drawArc0032.color = line0006.color;
    [haul0094.drawPrimitives addObject:drawArc0032];

    MWDrawLine *drawLine0189 = [[MWDrawLine alloc] init];
    drawLine0189.startPoint = CGPointMake(1765.5, 4298);
    drawLine0189.endPoint = CGPointMake(1958, 4105.5);
    drawLine0189.width = 21.5;
    drawLine0189.color = line0006.color;
    [haul0094.drawPrimitives addObject:drawLine0189];

    // Добавляем станцию "Октябрьская"
    MWStation *station0099 = [[MWStation alloc] init];
    station0099.identifier = @"station0099";
    [edge0079.elements addObject:station0099];
    
    station0099.nameOriginal = @"Октябрьская";
    station0099.nameEnglish = @"Oktyabrskaya";
    station0099.mapLocation = CGPointMake(1958, 4105.5);
    station0099.geoLocation = CGPointMake(55.729254, 37.611317);
    
    MWDrawFillCircle *fillCircle0103 = [[MWDrawFillCircle alloc] init];
    fillCircle0103.center = station0099.mapLocation;
    fillCircle0103.radius = 31.5;
    fillCircle0103.fillColor = line0006.color;
    [station0099.drawPrimitives addObject:fillCircle0103];
    
    MWDrawFillCircle *fillCircle0104 = [[MWDrawFillCircle alloc] init];
    fillCircle0104.center = station0099.mapLocation;
    fillCircle0104.radius = 14;
    fillCircle0104.fillColor = [UIColor whiteColor];
    [station0099.drawPrimitives addObject:fillCircle0104];

    station0099.showNameOnMap = false;
    [station0099.nameOriginalTextPrimitives addObject:drawTextLine0173];
    [station0099.nameEnglishTextPrimitives addObject:drawTextLine0174];

    // Добавляем вершину
    edge0079.finishVertex = vertex0024;
    
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
    
    MWDrawLine *drawLine0190 = [[MWDrawLine alloc] init];
    drawLine0190.startPoint = CGPointMake(1957.5, 4106);
    drawLine0190.endPoint = CGPointMake(2040, 4023.5);
    drawLine0190.width = 21.5;
    drawLine0190.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawLine0190];

    MWDrawArc *drawArc0033 = [[MWDrawArc alloc] init];
    drawArc0033.center = CGPointMake(2145.5, 4130);
    drawArc0033.startDegrees = 225;
    drawArc0033.endDegrees = 270;
    drawArc0033.radius = 150;
    drawArc0033.width = 21.5;
    drawArc0033.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawArc0033];

    MWDrawLine *drawLine0191 = [[MWDrawLine alloc] init];
    drawLine0191.startPoint = CGPointMake(2145, 3980);
    drawLine0191.endPoint = CGPointMake(2642.5, 3980);
    drawLine0191.width = 21.5;
    drawLine0191.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawLine0191];

    MWDrawArc *drawArc0034 = [[MWDrawArc alloc] init];
    drawArc0034.center = CGPointMake(2642, 3830);
    drawArc0034.startDegrees = 45;
    drawArc0034.endDegrees = 90;
    drawArc0034.radius = 150;
    drawArc0034.width = 21.5;
    drawArc0034.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawArc0034];

    MWDrawLine *drawLine0192 = [[MWDrawLine alloc] init];
    drawLine0192.startPoint = CGPointMake(2747.5, 3936.5);
    drawLine0192.endPoint = CGPointMake(2841.5, 3842.5);
    drawLine0192.width = 21.5;
    drawLine0192.color = line0006.color;
    [haul0095.drawPrimitives addObject:drawLine0192];

    // Добавляем станцию "Третьяковская"
    MWStation *station0100 = [[MWStation alloc] init];
    station0100.identifier = @"station0100";
    [edge0038.elements addObject:station0100];
    
    station0100.nameOriginal = @"Третьяковская";
    station0100.nameEnglish = @"Tretyakovskaya";
    station0100.mapLocation = CGPointMake(2841.5, 3842.5);
    station0100.geoLocation = CGPointMake(55.740729, 37.625591);

    MWDrawFillCircle *fillCircle0105 = [[MWDrawFillCircle alloc] init];
    fillCircle0105.center = station0100.mapLocation;
    fillCircle0105.radius = 31.5;
    fillCircle0105.fillColor = line0006.color;
    [station0100.drawPrimitives addObject:fillCircle0105];

    MWDrawFillCircle *fillCircle0106 = [[MWDrawFillCircle alloc] init];
    fillCircle0106.center = station0100.mapLocation;
    fillCircle0106.radius = 14;
    fillCircle0106.fillColor = [UIColor whiteColor];
    [station0100.drawPrimitives addObject:fillCircle0106];

    // Подложка
    MWDrawLine *drawLine0193 = [[MWDrawLine alloc] init];
    drawLine0193.startPoint = CGPointMake(2731, 3911);
    drawLine0193.endPoint = CGPointMake(2831, 3911);
    drawLine0193.width = 33;
    drawLine0193.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0100.nameOriginalTextPrimitives addObject:drawLine0193];

    MWDrawTextLine *drawTextLine0209 = [[MWDrawTextLine alloc] init];
    drawTextLine0209.text = station0100.nameOriginal;
    drawTextLine0209.fontName = @"HelveticaNeue";
    drawTextLine0209.fontColor = [UIColor blackColor];
    drawTextLine0209.fontSize = 42;
    drawTextLine0209.origin = CGPointMake(2551, 3882);
    drawTextLine0209.kernSpacing = -0.1;
    [station0100.nameOriginalTextPrimitives addObject:drawTextLine0209];

    // Подложка
    MWDrawLine *drawLine0194 = [[MWDrawLine alloc] init];
    drawLine0194.startPoint = CGPointMake(2690, 3947);
    drawLine0194.endPoint = CGPointMake(2790, 3947);
    drawLine0194.width = 24;
    drawLine0194.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0100.nameEnglishTextPrimitives addObject:drawLine0194];

    MWDrawTextLine *drawTextLine0210 = [[MWDrawTextLine alloc] init];
    drawTextLine0210.text = station0100.nameEnglish;
    drawTextLine0210.fontName = @"HelveticaNeue";
    drawTextLine0210.fontColor = stationNamesEnglishColor;
    drawTextLine0210.fontSize = 28;
    drawTextLine0210.kernSpacing = -0.3;
    drawTextLine0210.origin = CGPointMake(2655, 3927);
    [station0100.nameEnglishTextPrimitives addObject:drawTextLine0210];

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

    MWDrawLine *drawLine0195 = [[MWDrawLine alloc] init];
    drawLine0195.startPoint = CGPointMake(2841, 3843);
    drawLine0195.endPoint = CGPointMake(2970, 3714);
    drawLine0195.width = 21.5;
    drawLine0195.color = line0006.color;
    [haul0096.drawPrimitives addObject:drawLine0195];

    MWDrawArc *drawArc0035 = [[MWDrawArc alloc] init];
    drawArc0035.center = CGPointMake(2863.5, 3608.5);
    drawArc0035.startDegrees = 0;
    drawArc0035.endDegrees = 45;
    drawArc0035.radius = 150;
    drawArc0035.width = 21.5;
    drawArc0035.color = line0006.color;
    [haul0096.drawPrimitives addObject:drawArc0035];

    MWDrawLine *drawLine0196 = [[MWDrawLine alloc] init];
    drawLine0196.startPoint = CGPointMake(3013.5, 3609);
    drawLine0196.endPoint = CGPointMake(3013.5, 3180);
    drawLine0196.width = 21.5;
    drawLine0196.color = line0006.color;
    [haul0096.drawPrimitives addObject:drawLine0196];

    // Добавляем станцию "Китай-город"
    MWStation *station0101 = [[MWStation alloc] init];
    station0101.identifier = @"station0101";
    [edge0039.elements addObject:station0101];
    
    station0101.nameOriginal = @"Китай-город";
    station0101.nameEnglish = @"Kitay Gorod";
    station0101.mapLocation = CGPointMake(3013.5, 3180);
    station0101.geoLocation = CGPointMake(55.756952, 37.630937);
    
    MWDrawFillCircle *fillCircle0107 = [[MWDrawFillCircle alloc] init];
    fillCircle0107.center = station0101.mapLocation;
    fillCircle0107.radius = 31.5;
    fillCircle0107.fillColor = line0006.color;
    [station0101.drawPrimitives addObject:fillCircle0107];

    MWDrawFillCircle *fillCircle0108 = [[MWDrawFillCircle alloc] init];
    fillCircle0108.center = station0101.mapLocation;
    fillCircle0108.radius = 14;
    fillCircle0108.fillColor = [UIColor whiteColor];
    [station0101.drawPrimitives addObject:fillCircle0108];

    // Подложка
    MWDrawLine *drawLine0197 = [[MWDrawLine alloc] init];
    drawLine0197.startPoint = CGPointMake(3060, 3209);
    drawLine0197.endPoint = CGPointMake(3200, 3209);
    drawLine0197.width = 38;
    drawLine0197.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0101.nameOriginalTextPrimitives addObject:drawLine0197];

    MWDrawTextLine *drawTextLine0211 = [[MWDrawTextLine alloc] init];
    drawTextLine0211.text = station0101.nameOriginal;
    drawTextLine0211.fontName = @"HelveticaNeue";
    drawTextLine0211.fontColor = [UIColor blackColor];
    drawTextLine0211.fontSize = 42;
    drawTextLine0211.origin = CGPointMake(3052, 3183);
    drawTextLine0211.kernSpacing = -0.5;
    [station0101.nameOriginalTextPrimitives addObject:drawTextLine0211];

    // Подложка
    MWDrawLine *drawLine0198 = [[MWDrawLine alloc] init];
    drawLine0198.startPoint = CGPointMake(3080, 3246);
    drawLine0198.endPoint = CGPointMake(3220, 3246);
    drawLine0198.width = 27;
    drawLine0198.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0101.nameEnglishTextPrimitives addObject:drawLine0198];

    MWDrawTextLine *drawTextLine0212 = [[MWDrawTextLine alloc] init];
    drawTextLine0212.text = station0101.nameEnglish;
    drawTextLine0212.fontName = @"HelveticaNeue";
    drawTextLine0212.fontColor = stationNamesEnglishColor;
    drawTextLine0212.fontSize = 28;
    drawTextLine0212.kernSpacing = 0.4;
    drawTextLine0212.origin = CGPointMake(3052, 3227);
    [station0101.nameEnglishTextPrimitives addObject:drawTextLine0212];

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
    
    MWDrawLine *drawLine0199 = [[MWDrawLine alloc] init];
    drawLine0199.startPoint = CGPointMake(3013.5, 3180.5);
    drawLine0199.endPoint = CGPointMake(3013.5, 2998.5);
    drawLine0199.width = 21.5;
    drawLine0199.color = line0006.color;
    [haul0097.drawPrimitives addObject:drawLine0199];

    MWDrawArc *drawArc0036 = [[MWDrawArc alloc] init];
    drawArc0036.center = CGPointMake(2863.5, 2999);
    drawArc0036.startDegrees = 315;
    drawArc0036.endDegrees = 0;
    drawArc0036.radius = 150;
    drawArc0036.width = 21.5;
    drawArc0036.color = line0006.color;
    [haul0097.drawPrimitives addObject:drawArc0036];

    MWDrawLine *drawLine0200 = [[MWDrawLine alloc] init];
    drawLine0200.startPoint = CGPointMake(2970, 2893.5);
    drawLine0200.endPoint = CGPointMake(2924.5, 2848);
    drawLine0200.width = 21.5;
    drawLine0200.color = line0006.color;
    [haul0097.drawPrimitives addObject:drawLine0200];

    // Добавляем станцию "Тургеневская"
    MWStation *station0102 = [[MWStation alloc] init];
    station0102.identifier = @"station0102";
    [edge0040.elements addObject:station0102];
    
    station0102.nameOriginal = @"Тургеневская";
    station0102.nameEnglish = @"Turgenevskaya";
    station0102.mapLocation = CGPointMake(2924.5, 2848);
    station0102.geoLocation = CGPointMake(55.765839, 37.636776);
    
    MWDrawFillCircle *fillCircle0109 = [[MWDrawFillCircle alloc] init];
    fillCircle0109.center = station0102.mapLocation;
    fillCircle0109.radius = 31.5;
    fillCircle0109.fillColor = line0006.color;
    [station0102.drawPrimitives addObject:fillCircle0109];

    MWDrawFillCircle *fillCircle0110 = [[MWDrawFillCircle alloc] init];
    fillCircle0110.center = station0102.mapLocation;
    fillCircle0110.radius = 14;
    fillCircle0110.fillColor = [UIColor whiteColor];
    [station0102.drawPrimitives addObject:fillCircle0110];

    MWDrawTextLine *drawTextLine0213 = [[MWDrawTextLine alloc] init];
    drawTextLine0213.text = station0102.nameOriginal;
    drawTextLine0213.fontName = @"HelveticaNeue";
    drawTextLine0213.fontColor = [UIColor blackColor];
    drawTextLine0213.fontSize = 42;
    drawTextLine0213.origin = CGPointMake(2611, 2834);
    drawTextLine0213.kernSpacing = 0.2;
    [station0102.nameOriginalTextPrimitives addObject:drawTextLine0213];

    MWDrawTextLine *drawTextLine0214 = [[MWDrawTextLine alloc] init];
    drawTextLine0214.text = station0102.nameEnglish;
    drawTextLine0214.fontName = @"HelveticaNeue";
    drawTextLine0214.fontColor = stationNamesEnglishColor;
    drawTextLine0214.fontSize = 28;
    drawTextLine0214.kernSpacing = -0.2;
    drawTextLine0214.origin = CGPointMake(2670, 2807);
    [station0102.nameEnglishTextPrimitives addObject:drawTextLine0214];

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
    
    MWDrawLine *drawLine0201 = [[MWDrawLine alloc] init];
    drawLine0201.startPoint = CGPointMake(2925, 2848.5);
    drawLine0201.endPoint = CGPointMake(2771.5, 2695);
    drawLine0201.width = 21.5;
    drawLine0201.color = line0006.color;
    [haul0098.drawPrimitives addObject:drawLine0201];

    MWDrawArc *drawArc0037 = [[MWDrawArc alloc] init];
    drawArc0037.center = CGPointMake(2878, 2589.5);
    drawArc0037.startDegrees = 135;
    drawArc0037.endDegrees = 180;
    drawArc0037.radius = 150;
    drawArc0037.width = 21.5;
    drawArc0037.color = line0006.color;
    [haul0098.drawPrimitives addObject:drawArc0037];

    MWDrawLine *drawLine0202 = [[MWDrawLine alloc] init];
    drawLine0202.startPoint = CGPointMake(2728, 2590);
    drawLine0202.endPoint = CGPointMake(2728, 2498);
    drawLine0202.width = 21.5;
    drawLine0202.color = line0006.color;
    [haul0098.drawPrimitives addObject:drawLine0202];

    // Добавляем станцию "Сухаревская"
    MWStation *station0103 = [[MWStation alloc] init];
    station0103.identifier = @"station0103";
    [edge0041.elements addObject:station0103];
    
    station0103.nameOriginal = @"Сухаревская";
    station0103.nameEnglish = @"Sukharevskaya";
    station0103.mapLocation = CGPointMake(2728, 2498);
    station0103.geoLocation = CGPointMake(55.772295, 37.632444);

    MWDrawLine *drawLine0203 = [[MWDrawLine alloc] init];
    drawLine0203.startPoint = CGPointMake(2728, 2498);
    drawLine0203.endPoint = CGPointMake(2760, 2498);
    drawLine0203.width = 21.5;
    drawLine0203.color = line0006.color;
    [station0103.drawPrimitives addObject:drawLine0203];

    MWDrawTextLine *drawTextLine0215 = [[MWDrawTextLine alloc] init];
    drawTextLine0215.text = station0103.nameOriginal;
    drawTextLine0215.fontName = @"HelveticaNeue";
    drawTextLine0215.fontColor = [UIColor blackColor];
    drawTextLine0215.fontSize = 42;
    drawTextLine0215.origin = CGPointMake(2767, 2469);
    drawTextLine0215.kernSpacing = 0.1;
    [station0103.nameOriginalTextPrimitives addObject:drawTextLine0215];

    MWDrawTextLine *drawTextLine0216 = [[MWDrawTextLine alloc] init];
    drawTextLine0216.text = station0103.nameEnglish;
    drawTextLine0216.fontName = @"HelveticaNeue";
    drawTextLine0216.fontColor = stationNamesEnglishColor;
    drawTextLine0216.fontSize = 28;
    drawTextLine0216.kernSpacing = -0.2;
    drawTextLine0216.origin = CGPointMake(2769, 2442);
    [station0103.nameEnglishTextPrimitives addObject:drawTextLine0216];

    // Добавляем перегон
    MWHaul *haul0099 = [[MWHaul alloc] init];
    haul0099.identifier = @"haul0099";
    haul0099.length = 1060;
    [edge0041.elements addObject:haul0099];
    
    MWDrawLine *drawLine0204 = [[MWDrawLine alloc] init];
    drawLine0204.startPoint = CGPointMake(2728, 2498.5);
    drawLine0204.endPoint = CGPointMake(2728, 2474.5);
    drawLine0204.width = 21.5;
    drawLine0204.color = line0006.color;
    [haul0099.drawPrimitives addObject:drawLine0204];

    MWDrawArc *drawArc0038 = [[MWDrawArc alloc] init];
    drawArc0038.center = CGPointMake(2878, 2475);
    drawArc0038.startDegrees = 180;
    drawArc0038.endDegrees = 225;
    drawArc0038.radius = 150;
    drawArc0038.width = 21.5;
    drawArc0038.color = line0006.color;
    [haul0099.drawPrimitives addObject:drawArc0038];

    MWDrawLine *drawLine0205 = [[MWDrawLine alloc] init];
    drawLine0205.startPoint = CGPointMake(2771.5, 2369.5);
    drawLine0205.endPoint = CGPointMake(2886.5, 2254.5);
    drawLine0205.width = 21.5;
    drawLine0205.color = line0006.color;
    [haul0099.drawPrimitives addObject:drawLine0205];

    // Добавляем станцию "Проспект Мира"
    MWStation *station0104 = [[MWStation alloc] init];
    station0104.identifier = @"station0104";
    [edge0041.elements addObject:station0104];
    
    station0104.nameOriginal = @"Проспект Мира";
    station0104.nameEnglish = @"Prospekt Mira";
    station0104.mapLocation = CGPointMake(2886.5, 2254.5);
    station0104.geoLocation = CGPointMake(55.779652, 37.633618);
    
    MWDrawFillCircle *fillCircle0111 = [[MWDrawFillCircle alloc] init];
    fillCircle0111.center = station0104.mapLocation;
    fillCircle0111.radius = 31.5;
    fillCircle0111.fillColor = line0006.color;
    [station0104.drawPrimitives addObject:fillCircle0111];
    
    MWDrawFillCircle *fillCircle0112 = [[MWDrawFillCircle alloc] init];
    fillCircle0112.center = station0104.mapLocation;
    fillCircle0112.radius = 14;
    fillCircle0112.fillColor = [UIColor whiteColor];
    [station0104.drawPrimitives addObject:fillCircle0112];

    station0104.showNameOnMap = false;
    [station0104.nameOriginalTextPrimitives addObject:drawTextLine0180];
    [station0104.nameEnglishTextPrimitives addObject:drawTextLine0181];
    
    // Добавляем вершину
    edge0041.finishVertex = vertex0027;
    
    // Создаем участок линии Проспект Мира - Ботанический сад
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0042 = [[MWEdge alloc] init];
    edge0042.identifier = @"edge0042";
    edge0042.developmentName = @"Ребро: Проспект Мира - Ботанический сад";
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
    
    MWDrawLine *drawLine0206 = [[MWDrawLine alloc] init];
    drawLine0206.startPoint = CGPointMake(2886, 2255);
    drawLine0206.endPoint = CGPointMake(2969.5, 2171.5);
    drawLine0206.width = 21.5;
    drawLine0206.color = line0006.color;
    [haul0100.drawPrimitives addObject:drawLine0206];

    MWDrawArc *drawArc0039 = [[MWDrawArc alloc] init];
    drawArc0039.center = CGPointMake(2863, 2066);
    drawArc0039.startDegrees = 2;
    drawArc0039.endDegrees = 45;
    drawArc0039.radius = 150;
    drawArc0039.width = 21.5;
    drawArc0039.color = line0006.color;
    [haul0100.drawPrimitives addObject:drawArc0039];

    // Добавляем станцию "Рижская"
    MWStation *station0105 = [[MWStation alloc] init];
    station0105.identifier = @"station0105";
    [edge0042.elements addObject:station0105];
    
    station0105.nameOriginal = @"Рижская";
    station0105.nameEnglish = @"Rijskaya";
    station0105.mapLocation = CGPointMake(3013, 2074);
    station0105.geoLocation = CGPointMake(55.792497, 37.636151);
    
    MWDrawLine *drawLine0207 = [[MWDrawLine alloc] init];
    drawLine0207.startPoint = CGPointMake(3013, 2074);
    drawLine0207.endPoint = CGPointMake(3044, 2074);
    drawLine0207.width = 21.5;
    drawLine0207.color = line0006.color;
    [station0105.drawPrimitives addObject:drawLine0207];

    MWDrawTextLine *drawTextLine0217 = [[MWDrawTextLine alloc] init];
    drawTextLine0217.text = station0105.nameOriginal;
    drawTextLine0217.fontName = @"HelveticaNeue";
    drawTextLine0217.fontColor = [UIColor blackColor];
    drawTextLine0217.fontSize = 42;
    drawTextLine0217.origin = CGPointMake(3054, 2044);
    drawTextLine0217.kernSpacing = -0.2;
    [station0105.nameOriginalTextPrimitives addObject:drawTextLine0217];
    
    MWDrawTextLine *drawTextLine0218 = [[MWDrawTextLine alloc] init];
    drawTextLine0218.text = station0105.nameEnglish;
    drawTextLine0218.fontName = @"HelveticaNeue";
    drawTextLine0218.fontColor = stationNamesEnglishColor;
    drawTextLine0218.fontSize = 20;
    drawTextLine0218.kernSpacing = -0.2;
    drawTextLine0218.origin = CGPointMake(3217, 2020);
    [station0105.nameEnglishTextPrimitives addObject:drawTextLine0218];

    // Добавляем перегон
    MWHaul *haul0101 = [[MWHaul alloc] init];
    haul0101.identifier = @"haul0101";
    haul0101.length = 1730;
    [edge0042.elements addObject:haul0101];

    MWDrawArc *drawArc0040 = [[MWDrawArc alloc] init];
    drawArc0040.center = CGPointMake(2863, 2066);
    drawArc0040.startDegrees = 0;
    drawArc0040.endDegrees = 2.1;
    drawArc0040.radius = 150;
    drawArc0040.width = 21.5;
    drawArc0040.color = line0006.color;
    [haul0101.drawPrimitives addObject:drawArc0040];

    MWDrawLine *drawLine0208 = [[MWDrawLine alloc] init];
    drawLine0208.startPoint = CGPointMake(3013, 2066.5);
    drawLine0208.endPoint = CGPointMake(3013, 1955);
    drawLine0208.width = 21.5;
    drawLine0208.color = line0006.color;
    [haul0101.drawPrimitives addObject:drawLine0208];

    // Добавляем станцию "Алексеевская"
    MWStation *station0106 = [[MWStation alloc] init];
    station0106.identifier = @"station0106";
    [edge0042.elements addObject:station0106];
    
    station0106.nameOriginal = @"Алексеевская";
    station0106.nameEnglish = @"Alekseyevskaya";
    station0106.mapLocation = CGPointMake(3013, 1955);
    station0106.geoLocation = CGPointMake(55.807775, 37.638702);

    MWDrawLine *drawLine0209 = [[MWDrawLine alloc] init];
    drawLine0209.startPoint = CGPointMake(3013, 2074);
    drawLine0209.endPoint = CGPointMake(3044, 2074);
    drawLine0209.width = 21.5;
    drawLine0209.color = line0006.color;
    [station0106.drawPrimitives addObject:drawLine0209];

    MWDrawLine *drawLine0210 = [[MWDrawLine alloc] init];
    drawLine0210.startPoint = CGPointMake(3013, 1955);
    drawLine0210.endPoint = CGPointMake(3044, 1955);
    drawLine0210.width = 21.5;
    drawLine0210.color = line0006.color;
    [station0106.drawPrimitives addObject:drawLine0210];

    MWDrawTextLine *drawTextLine0219 = [[MWDrawTextLine alloc] init];
    drawTextLine0219.text = station0106.nameOriginal;
    drawTextLine0219.fontName = @"HelveticaNeue";
    drawTextLine0219.fontColor = [UIColor blackColor];
    drawTextLine0219.fontSize = 42;
    drawTextLine0219.origin = CGPointMake(3053, 1926);
    drawTextLine0219.kernSpacing = 0.2;
    [station0106.nameOriginalTextPrimitives addObject:drawTextLine0219];
    
    MWDrawTextLine *drawTextLine0220 = [[MWDrawTextLine alloc] init];
    drawTextLine0220.text = station0106.nameEnglish;
    drawTextLine0220.fontName = @"HelveticaNeue";
    drawTextLine0220.fontColor = stationNamesEnglishColor;
    drawTextLine0220.fontSize = 28;
    drawTextLine0220.kernSpacing = -0.4;
    drawTextLine0220.origin = CGPointMake(3051, 1970);
    [station0106.nameEnglishTextPrimitives addObject:drawTextLine0220];

    // Добавляем перегон
    MWHaul *haul0102 = [[MWHaul alloc] init];
    haul0102.identifier = @"haul0102";
    haul0102.length = 1530;
    [edge0042.elements addObject:haul0102];
    
    MWDrawLine *drawLine0211 = [[MWDrawLine alloc] init];
    drawLine0211.startPoint = CGPointMake(3013, 1955.5);
    drawLine0211.endPoint = CGPointMake(3013, 1830.5);
    drawLine0211.width = 21.5;
    drawLine0211.color = line0006.color;
    [haul0102.drawPrimitives addObject:drawLine0211];

    // Добавляем станцию "ВДНХ"
    MWStation *station0107 = [[MWStation alloc] init];
    station0107.identifier = @"station0107";
    [edge0042.elements addObject:station0107];
    
    station0107.nameOriginal = @"ВДНХ";
    station0107.nameEnglish = @"V.D.N.Ha.";
    station0107.mapLocation = CGPointMake(3013, 1830.5);
    station0107.geoLocation = CGPointMake(55.821061, 37.641477);

    MWDrawFillCircle *fillCircle0113 = [[MWDrawFillCircle alloc] init];
    fillCircle0113.center = station0107.mapLocation;
    fillCircle0113.radius = 31.5;
    fillCircle0113.fillColor = line0006.color;
    [station0107.drawPrimitives addObject:fillCircle0113];
    
    MWDrawFillCircle *fillCircle0114 = [[MWDrawFillCircle alloc] init];
    fillCircle0114.center = station0107.mapLocation;
    fillCircle0114.radius = 14;
    fillCircle0114.fillColor = [UIColor whiteColor];
    [station0107.drawPrimitives addObject:fillCircle0114];

    MWDrawTextLine *drawTextLine0221 = [[MWDrawTextLine alloc] init];
    drawTextLine0221.text = station0107.nameOriginal;
    drawTextLine0221.fontName = @"HelveticaNeue";
    drawTextLine0221.fontColor = [UIColor blackColor];
    drawTextLine0221.fontSize = 42;
    drawTextLine0221.origin = CGPointMake(3053, 1806.5);
    drawTextLine0221.kernSpacing = 4.4;
    [station0107.nameOriginalTextPrimitives addObject:drawTextLine0221];
    
    MWDrawTextLine *drawTextLine0222 = [[MWDrawTextLine alloc] init];
    drawTextLine0222.text = station0107.nameEnglish;
    drawTextLine0222.fontName = @"HelveticaNeue";
    drawTextLine0222.fontColor = stationNamesEnglishColor;
    drawTextLine0222.fontSize = 28;
    drawTextLine0222.kernSpacing = 0.4;
    drawTextLine0222.origin = CGPointMake(3053, 1851);
    [station0107.nameEnglishTextPrimitives addObject:drawTextLine0222];

    // Добавляем перегон
    MWHaul *haul0103 = [[MWHaul alloc] init];
    haul0103.identifier = @"haul0103";
    haul0103.length = 2590;
    [edge0042.elements addObject:haul0103];

    MWDrawLine *drawLine0212 = [[MWDrawLine alloc] init];
    drawLine0212.startPoint = CGPointMake(3013, 1831);
    drawLine0212.endPoint = CGPointMake(3013, 1479);
    drawLine0212.width = 21.5;
    drawLine0212.color = line0006.color;
    [haul0103.drawPrimitives addObject:drawLine0212];

    // Добавляем станцию "Ботанический сад"
    MWStation *station0108 = [[MWStation alloc] init];
    station0108.identifier = @"station0108";
    [edge0042.elements addObject:station0108];
    
    station0108.nameOriginal = @"Ботанический сад";
    station0108.nameEnglish = @"Botanichesky Sad";
    station0108.mapLocation = CGPointMake(3013, 1479);
    station0108.geoLocation = CGPointMake(55.845340, 37.638712);
    
    MWDrawFillCircle *fillCircle0115 = [[MWDrawFillCircle alloc] init];
    fillCircle0115.center = station0108.mapLocation;
    fillCircle0115.radius = 31.5;
    fillCircle0115.fillColor = line0006.color;
    [station0108.drawPrimitives addObject:fillCircle0115];
    
    MWDrawFillCircle *fillCircle0116 = [[MWDrawFillCircle alloc] init];
    fillCircle0116.center = station0108.mapLocation;
    fillCircle0116.radius = 14;
    fillCircle0116.fillColor = [UIColor whiteColor];
    [station0108.drawPrimitives addObject:fillCircle0116];
    
    MWDrawTextLine *drawTextLine0223 = [[MWDrawTextLine alloc] init];
    drawTextLine0223.text = @"Ботанический";
    drawTextLine0223.fontName = @"HelveticaNeue";
    drawTextLine0223.fontColor = [UIColor blackColor];
    drawTextLine0223.fontSize = 42;
    drawTextLine0223.origin = CGPointMake(3066, 1434);
    drawTextLine0223.kernSpacing = 0.4;
    [station0108.nameOriginalTextPrimitives addObject:drawTextLine0223];

    MWDrawTextLine *drawTextLine0224 = [[MWDrawTextLine alloc] init];
    drawTextLine0224.text = @"сад";
    drawTextLine0224.fontName = @"HelveticaNeue";
    drawTextLine0224.fontColor = [UIColor blackColor];
    drawTextLine0224.fontSize = 42;
    drawTextLine0224.origin = CGPointMake(3066, 1474);
    drawTextLine0224.kernSpacing = -0.4;
    [station0108.nameOriginalTextPrimitives addObject:drawTextLine0224];

    MWDrawTextLine *drawTextLine0225 = [[MWDrawTextLine alloc] init];
    drawTextLine0225.text = station0108.nameEnglish;
    drawTextLine0225.fontName = @"HelveticaNeue";
    drawTextLine0225.fontColor = stationNamesEnglishColor;
    drawTextLine0225.fontSize = 28;
    drawTextLine0225.kernSpacing = -0.4;
    drawTextLine0225.origin = CGPointMake(3066, 1407);
    [station0108.nameEnglishTextPrimitives addObject:drawTextLine0225];

    // Добавляем вершину
    edge0042.finishVertex = vertex0046;
    
    // Создаем участок линии Ботанический сад - Медведково
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0073 = [[MWEdge alloc] init];
    edge0073.identifier = @"edge0073";
    edge0073.developmentName = @"Ребро: Ботанический сад - Медведково";
    [self.edges addObject:edge0073];
    
    // Добавляем линию
    edge0073.line = line0006;
    
    // Добавляем вершину
    edge0073.startVertex = vertex0046;
    
    // Добавляем станцию "Ботанический сад"
    [edge0073.elements addObject:station0108];

    // Добавляем перегон
    MWHaul *haul0104 = [[MWHaul alloc] init];
    haul0104.identifier = @"haul0104";
    haul0104.length = 1660;
    [edge0073.elements addObject:haul0104];
    
    MWDrawLine *drawLine0213 = [[MWDrawLine alloc] init];
    drawLine0213.startPoint = CGPointMake(3013, 1479.5);
    drawLine0213.endPoint = CGPointMake(3013, 1300);
    drawLine0213.width = 21.5;
    drawLine0213.color = line0006.color;
    [haul0104.drawPrimitives addObject:drawLine0213];

    // Добавляем станцию "Свиблово"
    MWStation *station0109 = [[MWStation alloc] init];
    station0109.identifier = @"station0109";
    [edge0073.elements addObject:station0109];
    
    station0109.nameOriginal = @"Свиблово";
    station0109.nameEnglish = @"Sviblovo";
    station0109.mapLocation = CGPointMake(3013, 1300);
    station0109.geoLocation = CGPointMake(55.855265, 37.653062);
    
    MWDrawLine *drawLine0214 = [[MWDrawLine alloc] init];
    drawLine0214.startPoint = CGPointMake(3013, 1300);
    drawLine0214.endPoint = CGPointMake(3044, 1300);
    drawLine0214.width = 21.5;
    drawLine0214.color = line0006.color;
    [station0109.drawPrimitives addObject:drawLine0214];

    MWDrawTextLine *drawTextLine0226 = [[MWDrawTextLine alloc] init];
    drawTextLine0226.text = station0109.nameOriginal;
    drawTextLine0226.fontName = @"HelveticaNeue";
    drawTextLine0226.fontColor = [UIColor blackColor];
    drawTextLine0226.fontSize = 42;
    drawTextLine0226.origin = CGPointMake(3053, 1270);
    drawTextLine0226.kernSpacing = 0.0;
    [station0109.nameOriginalTextPrimitives addObject:drawTextLine0226];
    
    MWDrawTextLine *drawTextLine0227 = [[MWDrawTextLine alloc] init];
    drawTextLine0227.text = station0109.nameEnglish;
    drawTextLine0227.fontName = @"HelveticaNeue";
    drawTextLine0227.fontColor = stationNamesEnglishColor;
    drawTextLine0227.fontSize = 28;
    drawTextLine0227.kernSpacing = -0.2;
    drawTextLine0227.origin = CGPointMake(3053, 1315);
    [station0109.nameEnglishTextPrimitives addObject:drawTextLine0227];

    // Добавляем перегон
    MWHaul *haul0105 = [[MWHaul alloc] init];
    haul0105.identifier = @"haul0105";
    haul0105.length = 1920;
    [edge0073.elements addObject:haul0105];

    MWDrawLine *drawLine0215 = [[MWDrawLine alloc] init];
    drawLine0215.startPoint = CGPointMake(3013, 1300.5);
    drawLine0215.endPoint = CGPointMake(3013, 1137);
    drawLine0215.width = 21.5;
    drawLine0215.color = line0006.color;
    [haul0105.drawPrimitives addObject:drawLine0215];

    // Добавляем станцию "Бабушкинская"
    MWStation *station0110 = [[MWStation alloc] init];
    station0110.identifier = @"station0110";
    [edge0073.elements addObject:station0110];
    
    station0110.nameOriginal = @"Бабушкинская";
    station0110.nameEnglish = @"Babushkinskaya";
    station0110.mapLocation = CGPointMake(3013, 1137);
    station0110.geoLocation = CGPointMake(55.869503, 37.664156);

    MWDrawLine *drawLine0216 = [[MWDrawLine alloc] init];
    drawLine0216.startPoint = CGPointMake(3013, 1137);
    drawLine0216.endPoint = CGPointMake(3044, 1137);
    drawLine0216.width = 21.5;
    drawLine0216.color = line0006.color;
    [station0110.drawPrimitives addObject:drawLine0216];

    MWDrawTextLine *drawTextLine0228 = [[MWDrawTextLine alloc] init];
    drawTextLine0228.text = station0110.nameOriginal;
    drawTextLine0228.fontName = @"HelveticaNeue";
    drawTextLine0228.fontColor = [UIColor blackColor];
    drawTextLine0228.fontSize = 42;
    drawTextLine0228.origin = CGPointMake(3053, 1107.5);
    drawTextLine0228.kernSpacing = 0.1;
    [station0110.nameOriginalTextPrimitives addObject:drawTextLine0228];

    MWDrawTextLine *drawTextLine0229 = [[MWDrawTextLine alloc] init];
    drawTextLine0229.text = station0110.nameEnglish;
    drawTextLine0229.fontName = @"HelveticaNeue";
    drawTextLine0229.fontColor = stationNamesEnglishColor;
    drawTextLine0229.fontSize = 28;
    drawTextLine0229.kernSpacing = -0.5;
    drawTextLine0229.origin = CGPointMake(3055, 1152);
    [station0110.nameEnglishTextPrimitives addObject:drawTextLine0229];

    // Добавляем перегон
    MWHaul *haul0106 = [[MWHaul alloc] init];
    haul0106.identifier = @"haul0106";
    haul0106.length = 1990;
    [edge0073.elements addObject:haul0106];
    
    MWDrawLine *drawLine0217 = [[MWDrawLine alloc] init];
    drawLine0217.startPoint = CGPointMake(3013, 1137.5);
    drawLine0217.endPoint = CGPointMake(3013, 974);
    drawLine0217.width = 21.5;
    drawLine0217.color = line0006.color;
    [haul0106.drawPrimitives addObject:drawLine0217];

    // Добавляем станцию "Медведково"
    MWStation *station0111 = [[MWStation alloc] init];
    station0111.identifier = @"station0111";
    [edge0073.elements addObject:station0111];
    
    station0111.nameOriginal = @"Медведково";
    station0111.nameEnglish = @"Medvedkovo";
    station0111.mapLocation = CGPointMake(3013, 974);
    station0111.geoLocation = CGPointMake(55.887205, 37.661470);

    MWDrawLine *drawLine0218 = [[MWDrawLine alloc] init];
    drawLine0218.startPoint = CGPointMake(2982, 974);
    drawLine0218.endPoint = CGPointMake(3044, 974);
    drawLine0218.width = 21.5;
    drawLine0218.color = line0006.color;
    [station0111.drawPrimitives addObject:drawLine0218];

    MWDrawTextLine *drawTextLine0230 = [[MWDrawTextLine alloc] init];
    drawTextLine0230.text = station0111.nameOriginal;
    drawTextLine0230.fontName = @"HelveticaNeue";
    drawTextLine0230.fontColor = [UIColor blackColor];
    drawTextLine0230.fontSize = 42;
    drawTextLine0230.origin = CGPointMake(3053, 944);
    drawTextLine0230.kernSpacing = 1.2;
    [station0111.nameOriginalTextPrimitives addObject:drawTextLine0230];

    MWDrawTextLine *drawTextLine0231 = [[MWDrawTextLine alloc] init];
    drawTextLine0231.text = station0111.nameEnglish;
    drawTextLine0231.fontName = @"HelveticaNeue";
    drawTextLine0231.fontColor = stationNamesEnglishColor;
    drawTextLine0231.fontSize = 28;
    drawTextLine0231.kernSpacing = 0.1;
    drawTextLine0231.origin = CGPointMake(3053, 989);
    [station0111.nameEnglishTextPrimitives addObject:drawTextLine0231];

    MWDrawFillCircle *fillCircle0117 = [[MWDrawFillCircle alloc] init];
    fillCircle0117.center = CGPointMake(3012.5, 911.5); //(1706, 5982.5);
    fillCircle0117.radius = 32;
    fillCircle0117.fillColor = line0006.color;
    [station0111.drawPrimitives addObject:fillCircle0117];

    MWDrawTextLine *drawTextLine0232 = [[MWDrawTextLine alloc] init];
    drawTextLine0232.text = @"6";
    drawTextLine0232.fontName = @"Georgia-Bold";
    drawTextLine0232.fontColor = [UIColor whiteColor];
    drawTextLine0232.fontSize = 56;
    drawTextLine0232.origin = CGPointMake(2994.5, 878);
    [station0111.drawPrimitives addObject:drawTextLine0232];

    // Добавляем вершину
    edge0073.finishVertex = vertex0031;
    
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
    station0197.mapLocation = CGPointMake(4141, 5648);
    station0197.geoLocation = CGPointMake(55.6743, 37.8582);
    
    MWDrawFillCircle *fillCircle0118 = [[MWDrawFillCircle alloc] init];
    fillCircle0118.center = CGPointMake(4140.5, 5710.5);
    fillCircle0118.radius = 32;
    fillCircle0118.fillColor = line0007.color;
    [station0197.drawPrimitives addObject:fillCircle0118];
    
    MWDrawTextLine *drawTextLine0233 = [[MWDrawTextLine alloc] init];
    drawTextLine0233.text = @"7";
    drawTextLine0233.fontName = @"Georgia-Bold";
    drawTextLine0233.fontColor = [UIColor whiteColor];
    drawTextLine0233.fontSize = 56;
    drawTextLine0233.origin = CGPointMake(4124.5, 5670);
    [station0197.drawPrimitives addObject:drawTextLine0233];

    MWDrawLine *drawLine0219 = [[MWDrawLine alloc] init];
    drawLine0219.startPoint = CGPointMake(4110, 5648);
    drawLine0219.endPoint = CGPointMake(4172, 5648);
    drawLine0219.width = 21.5;
    drawLine0219.color = line0007.color;
    [station0197.drawPrimitives addObject:drawLine0219];

    MWDrawTextLine *drawTextLine0234 = [[MWDrawTextLine alloc] init];
    drawTextLine0234.text = station0197.nameOriginal;
    drawTextLine0234.fontName = @"HelveticaNeue";
    drawTextLine0234.fontColor = [UIColor blackColor];
    drawTextLine0234.fontSize = 42;
    drawTextLine0234.origin = CGPointMake(4182, 5619);
    drawTextLine0234.kernSpacing = 0.4;
    [station0197.nameOriginalTextPrimitives addObject:drawTextLine0234];

    MWDrawTextLine *drawTextLine0235 = [[MWDrawTextLine alloc] init];
    drawTextLine0235.text = station0197.nameEnglish;
    drawTextLine0235.fontName = @"HelveticaNeue";
    drawTextLine0235.fontColor = stationNamesEnglishColor;
    drawTextLine0235.fontSize = 28;
    drawTextLine0235.kernSpacing = 0.4;
    drawTextLine0235.origin = CGPointMake(4185, 5663);
    [station0197.nameEnglishTextPrimitives addObject:drawTextLine0235];

    // Добавляем перегон
    MWHaul *haul0185 = [[MWHaul alloc] init];
    haul0185.identifier = @"haul0185";
    haul0185.length = 1460;
    [edge0043.elements addObject:haul0185];
    
    MWDrawLine *drawLine0220 = [[MWDrawLine alloc] init];
    drawLine0220.startPoint = CGPointMake(4141, 5648);
    drawLine0220.endPoint = CGPointMake(4141, 5479);
    drawLine0220.width = 21.5;
    drawLine0220.color = line0007.color;
    [haul0185.drawPrimitives addObject:drawLine0220];

    // Добавляем станцию "Жулебино"
    MWStation *station0112 = [[MWStation alloc] init];
    station0112.identifier = @"station0112";
    [edge0043.elements addObject:station0112];
    
    station0112.nameOriginal = @"Жулебино";
    station0112.nameEnglish = @"Julebino";
    station0112.mapLocation = CGPointMake(4141, 5479);
    station0112.geoLocation = CGPointMake(55.684259, 37.854868);

    MWDrawLine *drawLine0221 = [[MWDrawLine alloc] init];
    drawLine0221.startPoint = CGPointMake(4141, 5479);
    drawLine0221.endPoint = CGPointMake(4172, 5479);
    drawLine0221.width = 21.5;
    drawLine0221.color = line0007.color;
    [station0112.drawPrimitives addObject:drawLine0221];

    MWDrawTextLine *drawTextLine0236 = [[MWDrawTextLine alloc] init];
    drawTextLine0236.text = station0112.nameOriginal;
    drawTextLine0236.fontName = @"HelveticaNeue";
    drawTextLine0236.fontColor = [UIColor blackColor];
    drawTextLine0236.fontSize = 42;
    drawTextLine0236.origin = CGPointMake(4182, 5449);
    drawTextLine0236.kernSpacing = 0.6;
    [station0112.nameOriginalTextPrimitives addObject:drawTextLine0236];

    MWDrawTextLine *drawTextLine0237 = [[MWDrawTextLine alloc] init];
    drawTextLine0237.text = station0112.nameEnglish;
    drawTextLine0237.fontName = @"HelveticaNeue";
    drawTextLine0237.fontColor = stationNamesEnglishColor;
    drawTextLine0237.fontSize = 28;
    drawTextLine0237.kernSpacing = 0.2;
    drawTextLine0237.origin = CGPointMake(4182, 5494);
    [station0112.nameEnglishTextPrimitives addObject:drawTextLine0237];

    // Добавляем перегон
    MWHaul *haul0107 = [[MWHaul alloc] init];
    haul0107.identifier = @"haul0107";
    haul0107.length = 2090;
    [edge0043.elements addObject:haul0107];
    
    MWDrawLine *drawLine0222 = [[MWDrawLine alloc] init];
    drawLine0222.startPoint = CGPointMake(4141, 5479.5);
    drawLine0222.endPoint = CGPointMake(4141, 5268.5);
    drawLine0222.width = 21.5;
    drawLine0222.color = line0007.color;
    [haul0107.drawPrimitives addObject:drawLine0222];

    // Добавляем станцию "Лермонтовский проспект"
    MWStation *station0113 = [[MWStation alloc] init];
    station0113.identifier = @"station0113";
    [edge0043.elements addObject:station0113];
    
    station0113.nameOriginal = @"Лермонтовский проспект";
    station0113.nameEnglish = @"Lermontovsky Prospekt";
    station0113.mapLocation = CGPointMake(4141, 5268.5);
    station0113.geoLocation = CGPointMake(55.701248, 37.852571);
    
    MWDrawLine *drawLine0223 = [[MWDrawLine alloc] init];
    drawLine0223.startPoint = CGPointMake(4141, 5268.5);
    drawLine0223.endPoint = CGPointMake(4172, 5268.5);
    drawLine0223.width = 21.5;
    drawLine0223.color = line0007.color;
    [station0113.drawPrimitives addObject:drawLine0223];

    MWDrawTextLine *drawTextLine0238 = [[MWDrawTextLine alloc] init];
    drawTextLine0238.text = @"Лермонтовский";
    drawTextLine0238.fontName = @"HelveticaNeue";
    drawTextLine0238.fontColor = [UIColor blackColor];
    drawTextLine0238.fontSize = 42;
    drawTextLine0238.origin = CGPointMake(4180, 5238.5);
    drawTextLine0238.kernSpacing = 1.0;
    [station0113.nameOriginalTextPrimitives addObject:drawTextLine0238];

    MWDrawTextLine *drawTextLine0239 = [[MWDrawTextLine alloc] init];
    drawTextLine0239.text = @"проспект";
    drawTextLine0239.fontName = @"HelveticaNeue";
    drawTextLine0239.fontColor = [UIColor blackColor];
    drawTextLine0239.fontSize = 42;
    drawTextLine0239.origin = CGPointMake(4182, 5279);
    drawTextLine0239.kernSpacing = 0.6;
    [station0113.nameOriginalTextPrimitives addObject:drawTextLine0239];

    MWDrawTextLine *drawTextLine0240 = [[MWDrawTextLine alloc] init];
    drawTextLine0240.text = station0113.nameEnglish;
    drawTextLine0240.fontName = @"HelveticaNeue";
    drawTextLine0240.fontColor = stationNamesEnglishColor;
    drawTextLine0240.fontSize = 28;
    drawTextLine0240.kernSpacing = -0.1;
    drawTextLine0240.origin = CGPointMake(4182, 5324);
    [station0113.nameEnglishTextPrimitives addObject:drawTextLine0240];

    // Добавляем перегон
    MWHaul *haul0108 = [[MWHaul alloc] init];
    haul0108.identifier = @"haul0108";
    haul0108.length = 2680;
    [edge0043.elements addObject:haul0108];
    
    MWDrawLine *drawLine0224 = [[MWDrawLine alloc] init];
    drawLine0224.startPoint = CGPointMake(4141, 5269);
    drawLine0224.endPoint = CGPointMake(4141, 5099);
    drawLine0224.width = 21.5;
    drawLine0224.color = line0007.color;
    [haul0108.drawPrimitives addObject:drawLine0224];

    // Добавляем станцию "Выхино"
    MWStation *station0114 = [[MWStation alloc] init];
    station0114.identifier = @"station0114";
    [edge0043.elements addObject:station0114];
    
    station0114.nameOriginal = @"Выхино";
    station0114.nameEnglish = @"Vikhino";
    station0114.mapLocation = CGPointMake(4141, 5099);
    station0114.geoLocation = CGPointMake(55.715650, 37.817906);

    MWDrawLine *drawLine0225 = [[MWDrawLine alloc] init];
    drawLine0225.startPoint = CGPointMake(4141, 5099);
    drawLine0225.endPoint = CGPointMake(4172, 5099);
    drawLine0225.width = 21.5;
    drawLine0225.color = line0007.color;
    [station0114.drawPrimitives addObject:drawLine0225];

    MWDrawTextLine *drawTextLine0241 = [[MWDrawTextLine alloc] init];
    drawTextLine0241.text = station0114.nameOriginal;
    drawTextLine0241.fontName = @"HelveticaNeue";
    drawTextLine0241.fontColor = [UIColor blackColor];
    drawTextLine0241.fontSize = 42;
    drawTextLine0241.origin = CGPointMake(4182, 5069.5);
    drawTextLine0241.kernSpacing = 0.2;
    [station0114.nameOriginalTextPrimitives addObject:drawTextLine0241];

    MWDrawTextLine *drawTextLine0242 = [[MWDrawTextLine alloc] init];
    drawTextLine0242.text = station0114.nameEnglish;
    drawTextLine0242.fontName = @"HelveticaNeue";
    drawTextLine0242.fontColor = stationNamesEnglishColor;
    drawTextLine0242.fontSize = 28;
    drawTextLine0242.kernSpacing = 0.6;
    drawTextLine0242.origin = CGPointMake(4182, 5115);
    [station0114.nameEnglishTextPrimitives addObject:drawTextLine0242];

    // Добавляем перегон
    MWHaul *haul0109 = [[MWHaul alloc] init];
    haul0109.identifier = @"haul0109";
    haul0109.length = 1600;
    [edge0043.elements addObject:haul0109];
    
    MWDrawLine *drawLine0226 = [[MWDrawLine alloc] init];
    drawLine0226.startPoint = CGPointMake(4141, 5099.5);
    drawLine0226.endPoint = CGPointMake(4141, 4890);
    drawLine0226.width = 21.5;
    drawLine0226.color = line0007.color;
    [haul0109.drawPrimitives addObject:drawLine0226];

    // Добавляем станцию "Рязанский проспект"
    MWStation *station0115 = [[MWStation alloc] init];
    station0115.identifier = @"station0115";
    [edge0043.elements addObject:station0115];
    
    station0115.nameOriginal = @"Рязанский проспект";
    station0115.nameEnglish = @"Ryazansky Prospekt";
    station0115.mapLocation = CGPointMake(4141, 4890);
    station0115.geoLocation = CGPointMake(55.716923, 37.793282);

    MWDrawLine *drawLine0227 = [[MWDrawLine alloc] init];
    drawLine0227.startPoint = CGPointMake(4141, 4890);
    drawLine0227.endPoint = CGPointMake(4172, 4890);
    drawLine0227.width = 21.5;
    drawLine0227.color = line0007.color;
    [station0115.drawPrimitives addObject:drawLine0227];

    MWDrawTextLine *drawTextLine0243 = [[MWDrawTextLine alloc] init];
    drawTextLine0243.text = @"Рязанский";
    drawTextLine0243.fontName = @"HelveticaNeue";
    drawTextLine0243.fontColor = [UIColor blackColor];
    drawTextLine0243.fontSize = 42;
    drawTextLine0243.origin = CGPointMake(4182, 4860);
    drawTextLine0243.kernSpacing = -0.5;
    [station0115.nameOriginalTextPrimitives addObject:drawTextLine0243];

    MWDrawTextLine *drawTextLine0244 = [[MWDrawTextLine alloc] init];
    drawTextLine0244.text = @"проспект";
    drawTextLine0244.fontName = @"HelveticaNeue";
    drawTextLine0244.fontColor = [UIColor blackColor];
    drawTextLine0244.fontSize = 42;
    drawTextLine0244.origin = CGPointMake(4182, 4900.5);
    drawTextLine0244.kernSpacing = 0.5;
    [station0115.nameOriginalTextPrimitives addObject:drawTextLine0244];

    MWDrawTextLine *drawTextLine0245 = [[MWDrawTextLine alloc] init];
    drawTextLine0245.text = station0115.nameEnglish;
    drawTextLine0245.fontName = @"HelveticaNeue";
    drawTextLine0245.fontColor = stationNamesEnglishColor;
    drawTextLine0245.fontSize = 28;
    drawTextLine0245.kernSpacing = -0.4;
    drawTextLine0245.origin = CGPointMake(4182, 4945);
    [station0115.nameEnglishTextPrimitives addObject:drawTextLine0245];

    // Добавляем перегон
    MWHaul *haul0110 = [[MWHaul alloc] init];
    haul0110.identifier = @"haul0110";
    haul0110.length = 2220;
    [edge0043.elements addObject:haul0110];
    
    MWDrawLine *drawLine0228 = [[MWDrawLine alloc] init];
    drawLine0228.startPoint = CGPointMake(4141, 4890.5);
    drawLine0228.endPoint = CGPointMake(4141, 4721);
    drawLine0228.width = 21.5;
    drawLine0228.color = line0007.color;
    [haul0110.drawPrimitives addObject:drawLine0228];

    // Добавляем станцию "Кузьминки"
    MWStation *station0116 = [[MWStation alloc] init];
    station0116.identifier = @"station0116";
    [edge0043.elements addObject:station0116];
    
    station0116.nameOriginal = @"Кузьминки";
    station0116.nameEnglish = @"Kuzminki";
    station0116.mapLocation = CGPointMake(4141, 4721);
    station0116.geoLocation = CGPointMake(55.705475, 37.765666);
    
    MWDrawLine *drawLine0229 = [[MWDrawLine alloc] init];
    drawLine0229.startPoint = CGPointMake(4141, 4721);
    drawLine0229.endPoint = CGPointMake(4172, 4721);
    drawLine0229.width = 21.5;
    drawLine0229.color = line0007.color;
    [station0116.drawPrimitives addObject:drawLine0229];

    MWDrawTextLine *drawTextLine0246 = [[MWDrawTextLine alloc] init];
    drawTextLine0246.text = station0116.nameOriginal;
    drawTextLine0246.fontName = @"HelveticaNeue";
    drawTextLine0246.fontColor = [UIColor blackColor];
    drawTextLine0246.fontSize = 42;
    drawTextLine0246.origin = CGPointMake(4182, 4691);
    drawTextLine0246.kernSpacing = 0.6;
    [station0116.nameOriginalTextPrimitives addObject:drawTextLine0246];
    
    MWDrawTextLine *drawTextLine0247 = [[MWDrawTextLine alloc] init];
    drawTextLine0247.text = station0116.nameEnglish;
    drawTextLine0247.fontName = @"HelveticaNeue";
    drawTextLine0247.fontColor = stationNamesEnglishColor;
    drawTextLine0247.fontSize = 28;
    drawTextLine0247.kernSpacing = 0.4;
    drawTextLine0247.origin = CGPointMake(4182, 4736);
    [station0116.nameEnglishTextPrimitives addObject:drawTextLine0247];

    // Добавляем перегон
    MWHaul *haul0111 = [[MWHaul alloc] init];
    haul0111.identifier = @"station0111";
    haul0111.length = 2240;
    [edge0043.elements addObject:haul0111];
    
    MWDrawLine *drawLine0230 = [[MWDrawLine alloc] init];
    drawLine0230.startPoint = CGPointMake(4141, 4721.5);
    drawLine0230.endPoint = CGPointMake(4141, 4551);
    drawLine0230.width = 21.5;
    drawLine0230.color = line0007.color;
    [haul0111.drawPrimitives addObject:drawLine0230];

    // Добавляем станцию "Текстильщики"
    MWStation *station0117 = [[MWStation alloc] init];
    station0117.identifier = @"station0117";
    [edge0043.elements addObject:station0117];
    
    station0117.nameOriginal = @"Текстильщики";
    station0117.nameEnglish = @"Tekstilshchiki";
    station0117.mapLocation = CGPointMake(4141, 4551);
    station0117.geoLocation = CGPointMake(55.708955, 37.731287);

    MWDrawLine *drawLine0231 = [[MWDrawLine alloc] init];
    drawLine0231.startPoint = CGPointMake(4141, 4551);
    drawLine0231.endPoint = CGPointMake(4172, 4551);
    drawLine0231.width = 21.5;
    drawLine0231.color = line0007.color;
    [station0117.drawPrimitives addObject:drawLine0231];
    
    MWDrawTextLine *drawTextLine0248 = [[MWDrawTextLine alloc] init];
    drawTextLine0248.text = station0117.nameOriginal;
    drawTextLine0248.fontName = @"HelveticaNeue";
    drawTextLine0248.fontColor = [UIColor blackColor];
    drawTextLine0248.fontSize = 42;
    drawTextLine0248.origin = CGPointMake(4183, 4521.5);
    drawTextLine0248.kernSpacing = 0.1;
    [station0117.nameOriginalTextPrimitives addObject:drawTextLine0248];
    
    MWDrawTextLine *drawTextLine0249 = [[MWDrawTextLine alloc] init];
    drawTextLine0249.text = station0117.nameEnglish;
    drawTextLine0249.fontName = @"HelveticaNeue";
    drawTextLine0249.fontColor = stationNamesEnglishColor;
    drawTextLine0249.fontSize = 28;
    drawTextLine0249.kernSpacing = -1.0;
    drawTextLine0249.origin = CGPointMake(4183, 4566);
    [station0117.nameEnglishTextPrimitives addObject:drawTextLine0249];

    // Добавляем перегон
    MWHaul *haul0112 = [[MWHaul alloc] init];
    haul0112.identifier = @"haul0112";
    haul0112.length = 3370;
    [edge0043.elements addObject:haul0112];
    
    MWDrawLine *drawLine0232 = [[MWDrawLine alloc] init];
    drawLine0232.startPoint = CGPointMake(4141, 4551.5);
    drawLine0232.endPoint = CGPointMake(4141, 4342);
    drawLine0232.width = 21.5;
    drawLine0232.color = line0007.color;
    [haul0112.drawPrimitives addObject:drawLine0232];

    // Добавляем станцию "Волгоградский проспект"
    MWStation *station0118 = [[MWStation alloc] init];
    station0118.identifier = @"station0118";
    [edge0043.elements addObject:station0118];
    
    station0118.nameOriginal = @"Волгоградский проспект";
    station0118.nameEnglish = @"Volgogradsky Prospekt";
    station0118.mapLocation = CGPointMake(4141, 4342);
    station0118.geoLocation = CGPointMake(55.725000, 37.686930);

    MWDrawLine *drawLine0233 = [[MWDrawLine alloc] init];
    drawLine0233.startPoint = CGPointMake(4141, 4342);
    drawLine0233.endPoint = CGPointMake(4172, 4342);
    drawLine0233.width = 21.5;
    drawLine0233.color = line0007.color;
    [station0118.drawPrimitives addObject:drawLine0233];

    MWDrawTextLine *drawTextLine0250 = [[MWDrawTextLine alloc] init];
    drawTextLine0250.text = @"Волгоградский";
    drawTextLine0250.fontName = @"HelveticaNeue";
    drawTextLine0250.fontColor = [UIColor blackColor];
    drawTextLine0250.fontSize = 42;
    drawTextLine0250.origin = CGPointMake(4181, 4312.5);
    drawTextLine0250.kernSpacing = 0.0;
    [station0118.nameOriginalTextPrimitives addObject:drawTextLine0250];

    MWDrawTextLine *drawTextLine0251 = [[MWDrawTextLine alloc] init];
    drawTextLine0251.text = @"проспект";
    drawTextLine0251.fontName = @"HelveticaNeue";
    drawTextLine0251.fontColor = [UIColor blackColor];
    drawTextLine0251.fontSize = 42;
    drawTextLine0251.origin = CGPointMake(4182, 4353);
    drawTextLine0251.kernSpacing = 0.4;
    [station0118.nameOriginalTextPrimitives addObject:drawTextLine0251];

    MWDrawTextLine *drawTextLine0252 = [[MWDrawTextLine alloc] init];
    drawTextLine0252.text = station0118.nameEnglish;
    drawTextLine0252.fontName = @"HelveticaNeue";
    drawTextLine0252.fontColor = stationNamesEnglishColor;
    drawTextLine0252.fontSize = 28;
    drawTextLine0252.kernSpacing = -0.2;
    drawTextLine0252.origin = CGPointMake(4181, 4398);
    [station0118.nameEnglishTextPrimitives addObject:drawTextLine0252];

    // Добавляем перегон
    MWHaul *haul0113 = [[MWHaul alloc] init];
    haul0113.identifier = @"haul0113";
    haul0113.length = 1480;
    [edge0043.elements addObject:haul0113];
    
    MWDrawLine *drawLine0234 = [[MWDrawLine alloc] init];
    drawLine0234.startPoint = CGPointMake(4141, 4342.5);
    drawLine0234.endPoint = CGPointMake(4141, 4267);
    drawLine0234.width = 21.5;
    drawLine0234.color = line0007.color;
    [haul0113.drawPrimitives addObject:drawLine0234];

    MWDrawArc *drawArc0041 = [[MWDrawArc alloc] init];
    drawArc0041.center = CGPointMake(3991, 4267.5);
    drawArc0041.startDegrees = 315;
    drawArc0041.endDegrees = 0;
    drawArc0041.radius = 150;
    drawArc0041.width = 21.5;
    drawArc0041.color = line0007.color;
    [haul0113.drawPrimitives addObject:drawArc0041];

    MWDrawLine *drawLine0235 = [[MWDrawLine alloc] init];
    drawLine0235.startPoint = CGPointMake(4097.5, 4162);
    drawLine0235.endPoint = CGPointMake(3964.5, 4029);
    drawLine0235.width = 21.5;
    drawLine0235.color = line0007.color;
    [haul0113.drawPrimitives addObject:drawLine0235];

    // Добавляем станцию "Пролетарская"
    MWStation *station0119 = [[MWStation alloc] init];
    station0119.identifier = @"station0119";
    [edge0043.elements addObject:station0119];
    
    station0119.nameOriginal = @"Пролетарская";
    station0119.nameEnglish = @"Proletarskaya";
    station0119.mapLocation = CGPointMake(3964.5, 4029);
    station0119.geoLocation = CGPointMake(55.731711, 37.666370);
    
    MWDrawFillCircle *fillCircle0119 = [[MWDrawFillCircle alloc] init];
    fillCircle0119.center = station0119.mapLocation;
    fillCircle0119.radius = 31.5;
    fillCircle0119.fillColor = line0007.color;
    [station0119.drawPrimitives addObject:fillCircle0119];
    
    MWDrawFillCircle *fillCircle0120 = [[MWDrawFillCircle alloc] init];
    fillCircle0120.center = station0119.mapLocation;
    fillCircle0120.radius = 14;
    fillCircle0120.fillColor = [UIColor whiteColor];
    [station0119.drawPrimitives addObject:fillCircle0120];

    // Подложка
    MWDrawLine *drawLine0236 = [[MWDrawLine alloc] init];
    drawLine0236.startPoint = CGPointMake(4080, 3994);
    drawLine0236.endPoint = CGPointMake(4180, 3994);
    drawLine0236.width = 33;
    drawLine0236.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0119.nameOriginalTextPrimitives addObject:drawLine0236];

    MWDrawTextLine *drawTextLine0253 = [[MWDrawTextLine alloc] init];
    drawTextLine0253.text = station0119.nameOriginal;
    drawTextLine0253.fontName = @"HelveticaNeue";
    drawTextLine0253.fontColor = [UIColor blackColor];
    drawTextLine0253.fontSize = 42;
    drawTextLine0253.origin = CGPointMake(3997, 3965);
    drawTextLine0253.kernSpacing = 0.5;
    [station0119.nameOriginalTextPrimitives addObject:drawTextLine0253];

    // Подложка
    MWDrawLine *drawLine0237 = [[MWDrawLine alloc] init];
    drawLine0237.startPoint = CGPointMake(4100, 3958);
    drawLine0237.endPoint = CGPointMake(4200, 3958);
    drawLine0237.width = 24;
    drawLine0237.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0119.nameEnglishTextPrimitives addObject:drawLine0237];

    MWDrawTextLine *drawTextLine0254 = [[MWDrawTextLine alloc] init];
    drawTextLine0254.text = station0119.nameEnglish;
    drawTextLine0254.fontName = @"HelveticaNeue";
    drawTextLine0254.fontColor = stationNamesEnglishColor;
    drawTextLine0254.fontSize = 28;
    drawTextLine0254.kernSpacing = -0.0;
    drawTextLine0254.origin = CGPointMake(3998, 3938);
    [station0119.nameEnglishTextPrimitives addObject:drawTextLine0254];

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
    
    MWDrawLine *drawLine0238 = [[MWDrawLine alloc] init];
    drawLine0238.startPoint = CGPointMake(3965, 4029.5);
    drawLine0238.endPoint = CGPointMake(3488.5, 3553);
    drawLine0238.width = 21.5;
    drawLine0238.color = line0007.color;
    [haul0114.drawPrimitives addObject:drawLine0238];

    // Добавляем станцию "Таганская"
    MWStation *station0120 = [[MWStation alloc] init];
    station0120.identifier = @"station0120";
    [edge0044.elements addObject:station0120];
    
    station0120.nameOriginal = @"Таганская";
    station0120.nameEnglish = @"Taganskaya";
    station0120.mapLocation = CGPointMake(3488.5, 3553);
    station0120.geoLocation = CGPointMake(55.739456, 37.653244);

    MWDrawFillCircle *fillCircle0121 = [[MWDrawFillCircle alloc] init];
    fillCircle0121.center = station0120.mapLocation;
    fillCircle0121.radius = 31.5;
    fillCircle0121.fillColor = line0007.color;
    [station0120.drawPrimitives addObject:fillCircle0121];

    MWDrawFillCircle *fillCircle0122 = [[MWDrawFillCircle alloc] init];
    fillCircle0122.center = station0120.mapLocation;
    fillCircle0122.radius = 14;
    fillCircle0122.fillColor = [UIColor whiteColor];
    [station0120.drawPrimitives addObject:fillCircle0122];

    station0120.showNameOnMap = false;
    [station0120.nameOriginalTextPrimitives addObject:drawTextLine0182];
    [station0120.nameEnglishTextPrimitives addObject:drawTextLine0183];

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

    MWDrawLine *drawLine0239 = [[MWDrawLine alloc] init];
    drawLine0239.startPoint = CGPointMake(3489, 3553.5);
    drawLine0239.endPoint = CGPointMake(3085.5, 3150);
    drawLine0239.width = 21.5;
    drawLine0239.color = line0007.color;
    [haul0115.drawPrimitives addObject:drawLine0239];

    // Добавляем станцию "Китай-город"
    MWStation *station0121 = [[MWStation alloc] init];
    station0121.identifier = @"station0121";
    [edge0045.elements addObject:station0121];
    
    station0121.nameOriginal = @"Китай-город";
    station0121.nameEnglish = @"Kitay Gorod";
    station0121.mapLocation = CGPointMake(3085.5, 3150);
    station0121.geoLocation = CGPointMake(55.756951, 37.630934);

    MWDrawFillCircle *fillCircle0123 = [[MWDrawFillCircle alloc] init];
    fillCircle0123.center = station0121.mapLocation;
    fillCircle0123.radius = 31.5;
    fillCircle0123.fillColor = line0007.color;
    [station0121.drawPrimitives addObject:fillCircle0123];

    MWDrawFillCircle *fillCircle0124 = [[MWDrawFillCircle alloc] init];
    fillCircle0124.center = station0121.mapLocation;
    fillCircle0124.radius = 14;
    fillCircle0124.fillColor = [UIColor whiteColor];
    [station0121.drawPrimitives addObject:fillCircle0124];

    station0121.showNameOnMap = false;
    [station0121.nameOriginalTextPrimitives addObject:drawLine0197];
    [station0121.nameOriginalTextPrimitives addObject:drawTextLine0211];
    [station0121.nameEnglishTextPrimitives addObject:drawLine0198];
    [station0121.nameEnglishTextPrimitives addObject:drawTextLine0212];
    
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
    
    MWDrawLine *drawLine0240 = [[MWDrawLine alloc] init];
    drawLine0240.startPoint = CGPointMake(3086, 3150.5);
    drawLine0240.endPoint = CGPointMake(2986.5, 3051);
    drawLine0240.width = 21.5;
    drawLine0240.color = line0007.color;
    [haul0116.drawPrimitives addObject:drawLine0240];

    MWDrawArc *drawArc0042 = [[MWDrawArc alloc] init];
    drawArc0042.center = CGPointMake(2881.5, 3158);
    drawArc0042.startDegrees = 270;
    drawArc0042.endDegrees = 315;
    drawArc0042.radius = 150;
    drawArc0042.width = 21.5;
    drawArc0042.color = line0007.color;
    [haul0116.drawPrimitives addObject:drawArc0042];

    MWDrawLine *drawLine0241 = [[MWDrawLine alloc] init];
    drawLine0241.startPoint = CGPointMake(2882, 3008);
    drawLine0241.endPoint = CGPointMake(2753.5, 3008);
    drawLine0241.width = 21.5;
    drawLine0241.color = line0007.color;
    [haul0116.drawPrimitives addObject:drawLine0241];

    // Добавляем станцию "Кузнецкий мост"
    MWStation *station0122 = [[MWStation alloc] init];
    station0122.identifier = @"station0122";
    [edge0046.elements addObject:station0122];
    
    station0122.nameOriginal = @"Кузнецкий Mост";
    station0122.nameEnglish = @"Kuznetsky Most";
    station0122.mapLocation = CGPointMake(2753.5, 3008);
    station0122.geoLocation = CGPointMake(55.761549, 37.624413);
    
    MWDrawFillCircle *fillCircle0125 = [[MWDrawFillCircle alloc] init];
    fillCircle0125.center = station0122.mapLocation;
    fillCircle0125.radius = 31.5;
    fillCircle0125.fillColor = line0007.color;
    [station0122.drawPrimitives addObject:fillCircle0125];
    
    MWDrawFillCircle *fillCircle0126 = [[MWDrawFillCircle alloc] init];
    fillCircle0126.center = station0122.mapLocation;
    fillCircle0126.radius = 14;
    fillCircle0126.fillColor = [UIColor whiteColor];
    [station0122.drawPrimitives addObject:fillCircle0126];

    MWDrawTextLine *drawTextLine0255 = [[MWDrawTextLine alloc] init];
    drawTextLine0255.text = station0122.nameOriginal;
    drawTextLine0255.fontName = @"HelveticaNeue";
    drawTextLine0255.fontColor = [UIColor blackColor];
    drawTextLine0255.fontSize = 42;
    drawTextLine0255.origin = CGPointMake(2449, 2924);
    drawTextLine0255.kernSpacing = -0.2;
    [station0122.nameOriginalTextPrimitives addObject:drawTextLine0255];

    MWDrawTextLine *drawTextLine0256 = [[MWDrawTextLine alloc] init];
    drawTextLine0256.text = station0122.nameEnglish;
    drawTextLine0256.fontName = @"HelveticaNeue";
    drawTextLine0256.fontColor = stationNamesEnglishColor;
    drawTextLine0256.fontSize = 28;
    drawTextLine0256.kernSpacing = -0.0;
    drawTextLine0256.origin = CGPointMake(2569, 2897);
    [station0122.nameEnglishTextPrimitives addObject:drawTextLine0256];

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

    MWDrawLine *drawLine0242 = [[MWDrawLine alloc] init];
    drawLine0242.startPoint = CGPointMake(2754, 3008);
    drawLine0242.endPoint = CGPointMake(2165.5, 3008);
    drawLine0242.width = 21.5;
    drawLine0242.color = line0007.color;
    [haul0117.drawPrimitives addObject:drawLine0242];

    // Добавляем станцию "Пушкинская"
    MWStation *station0123 = [[MWStation alloc] init];
    station0123.identifier = @"station0123";
    [edge0047.elements addObject:station0123];
    
    station0123.nameOriginal = @"Пушкинская";
    station0123.nameEnglish = @"Pushkinskaya";
    station0123.mapLocation = CGPointMake(2165.5, 3008);
    station0123.geoLocation = CGPointMake(55.764956, 37.605908);

    MWDrawFillCircle *fillCircle0127 = [[MWDrawFillCircle alloc] init];
    fillCircle0127.center = station0123.mapLocation;
    fillCircle0127.radius = 31.5;
    fillCircle0127.fillColor = line0007.color;
    [station0123.drawPrimitives addObject:fillCircle0127];
    
    MWDrawFillCircle *fillCircle0128 = [[MWDrawFillCircle alloc] init];
    fillCircle0128.center = station0123.mapLocation;
    fillCircle0128.radius = 14;
    fillCircle0128.fillColor = [UIColor whiteColor];
    [station0123.drawPrimitives addObject:fillCircle0128];

    MWDrawTextLine *drawTextLine0257 = [[MWDrawTextLine alloc] init];
    drawTextLine0257.text = station0123.nameOriginal;
    drawTextLine0257.fontName = @"HelveticaNeue";
    drawTextLine0257.fontColor = [UIColor blackColor];
    drawTextLine0257.fontSize = 42;
    drawTextLine0257.origin = CGPointMake(2043.5, 2924);
    drawTextLine0257.kernSpacing = 0.4;
    [station0123.nameOriginalTextPrimitives addObject:drawTextLine0257];

    MWDrawTextLine *drawTextLine0258 = [[MWDrawTextLine alloc] init];
    drawTextLine0258.text = station0123.nameEnglish;
    drawTextLine0258.fontName = @"HelveticaNeue";
    drawTextLine0258.fontColor = stationNamesEnglishColor;
    drawTextLine0258.fontSize = 28;
    drawTextLine0258.kernSpacing = -0.6;
    drawTextLine0258.origin = CGPointMake(2082, 2897);
    [station0123.nameEnglishTextPrimitives addObject:drawTextLine0258];

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
    
    MWDrawLine *drawLine0243 = [[MWDrawLine alloc] init];
    drawLine0243.startPoint = CGPointMake(2166, 3008);
    drawLine0243.endPoint = CGPointMake(1632.5, 3008);
    drawLine0243.width = 21.5;
    drawLine0243.color = line0007.color;
    [haul0118.drawPrimitives addObject:drawLine0243];

    // Добавляем станцию "Баррикадная"
    MWStation *station0124 = [[MWStation alloc] init];
    station0124.identifier = @"station0124";
    [edge0048.elements addObject:station0124];
    
    station0124.nameOriginal = @"Баррикадная";
    station0124.nameEnglish = @"Barrikadnaya";
    station0124.mapLocation = CGPointMake(1632.5, 3008);
    station0124.geoLocation = CGPointMake(55.760707, 37.581250);

    MWDrawFillCircle *fillCircle0129 = [[MWDrawFillCircle alloc] init];
    fillCircle0129.center = station0124.mapLocation;
    fillCircle0129.radius = 31.5;
    fillCircle0129.fillColor = line0007.color;
    [station0124.drawPrimitives addObject:fillCircle0129];
    
    MWDrawFillCircle *fillCircle0130 = [[MWDrawFillCircle alloc] init];
    fillCircle0130.center = station0124.mapLocation;
    fillCircle0130.radius = 14;
    fillCircle0130.fillColor = [UIColor whiteColor];
    [station0124.drawPrimitives addObject:fillCircle0130];

    MWDrawTextLine *drawTextLine0259 = [[MWDrawTextLine alloc] init];
    drawTextLine0259.text = station0124.nameOriginal;
    drawTextLine0259.fontName = @"HelveticaNeue";
    drawTextLine0259.fontColor = [UIColor blackColor];
    drawTextLine0259.fontSize = 42;
    drawTextLine0259.origin = CGPointMake(1649, 2924);
    drawTextLine0259.kernSpacing = 0.0;
    [station0124.nameOriginalTextPrimitives addObject:drawTextLine0259];

    MWDrawTextLine *drawTextLine0260 = [[MWDrawTextLine alloc] init];
    drawTextLine0260.text = station0124.nameEnglish;
    drawTextLine0260.fontName = @"HelveticaNeue";
    drawTextLine0260.fontColor = stationNamesEnglishColor;
    drawTextLine0260.fontSize = 28;
    drawTextLine0260.kernSpacing = 0.0;
    drawTextLine0260.origin = CGPointMake(1647, 2897);
    [station0124.nameEnglishTextPrimitives addObject:drawTextLine0260];

    // Добавляем вершину
    edge0048.finishVertex = vertex0025;
    
    // Создаем участок линии Баррикадная - Полежаевская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0049 = [[MWEdge alloc] init];
    edge0049.identifier = @"edge0049";
    edge0049.developmentName = @"Ребро: Баррикадная - Полежаевская";
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
    
    MWDrawLine *drawLine0244 = [[MWDrawLine alloc] init];
    drawLine0244.startPoint = CGPointMake(1633, 3008);
    drawLine0244.endPoint = CGPointMake(1365.5, 3008);
    drawLine0244.width = 21.5;
    drawLine0244.color = line0007.color;
    [haul0119.drawPrimitives addObject:drawLine0244];

    MWDrawArc *drawArc0043 = [[MWDrawArc alloc] init];
    drawArc0043.center = CGPointMake(1366, 2858);
    drawArc0043.startDegrees = 90;
    drawArc0043.endDegrees = 135;
    drawArc0043.radius = 150;
    drawArc0043.width = 21.5;
    drawArc0043.color = line0007.color;
    [haul0119.drawPrimitives addObject:drawArc0043];

    MWDrawLine *drawLine0245 = [[MWDrawLine alloc] init];
    drawLine0245.startPoint = CGPointMake(1260.5, 2964.5);
    drawLine0245.endPoint = CGPointMake(1230, 2934);
    drawLine0245.width = 21.5;
    drawLine0245.color = line0007.color;
    [haul0119.drawPrimitives addObject:drawLine0245];

    // Добавляем станцию "Улица 1905 года"
    MWStation *station0125 = [[MWStation alloc] init];
    station0125.identifier = @"station0125";
    [edge0049.elements addObject:station0125];
    
    station0125.nameOriginal = @"Улица 1905 года";
    station0125.nameEnglish = @"Ulitsa 1905 Goda";
    station0125.mapLocation = CGPointMake(1230, 2934);
    station0125.geoLocation = CGPointMake(55.764702, 37.561448);
    
    MWDrawLine *drawLine0246 = [[MWDrawLine alloc] init];
    drawLine0246.startPoint = CGPointMake(1230, 2934);
    drawLine0246.endPoint = CGPointMake(1253, 2911);
    drawLine0246.width = 21.5;
    drawLine0246.color = line0007.color;
    [station0125.drawPrimitives addObject:drawLine0246];

    MWDrawTextLine *drawTextLine0261 = [[MWDrawTextLine alloc] init];
    drawTextLine0261.text = station0125.nameOriginal;
    drawTextLine0261.fontName = @"HelveticaNeue";
    drawTextLine0261.fontColor = [UIColor blackColor];
    drawTextLine0261.fontSize = 42;
    drawTextLine0261.origin = CGPointMake(1257, 2866);
    drawTextLine0261.kernSpacing = -0.2;
    [station0125.nameOriginalTextPrimitives addObject:drawTextLine0261];

    MWDrawTextLine *drawTextLine0262 = [[MWDrawTextLine alloc] init];
    drawTextLine0262.text = station0125.nameEnglish;
    drawTextLine0262.fontName = @"HelveticaNeue";
    drawTextLine0262.fontColor = stationNamesEnglishColor;
    drawTextLine0262.fontSize = 28;
    drawTextLine0262.kernSpacing = -0.2;
    drawTextLine0262.origin = CGPointMake(1257, 2839);
    [station0125.nameEnglishTextPrimitives addObject:drawTextLine0262];

    // Добавляем перегон
    MWHaul *haul0120 = [[MWHaul alloc] init];
    haul0120.identifier = @"haul0120";
    haul0120.length = 1430;
    [edge0049.elements addObject:haul0120];

    MWDrawLine *drawLine0247 = [[MWDrawLine alloc] init];
    drawLine0247.startPoint = CGPointMake(1230.5, 2934.5);
    drawLine0247.endPoint = CGPointMake(1172, 2876);
    drawLine0247.width = 21.5;
    drawLine0247.color = line0007.color;
    [haul0120.drawPrimitives addObject:drawLine0247];

    // Добавляем станцию "Беговая"
    MWStation *station0126 = [[MWStation alloc] init];
    station0126.identifier = @"station0126";
    [edge0049.elements addObject:station0126];
    
    station0126.nameOriginal = @"Беговая";
    station0126.nameEnglish = @"Begovaya";
    station0126.mapLocation = CGPointMake(1172, 2876);
    station0126.geoLocation = CGPointMake(55.773662, 37.546757);

    MWDrawLine *drawLine0248 = [[MWDrawLine alloc] init];
    drawLine0248.startPoint = CGPointMake(1172, 2876);
    drawLine0248.endPoint = CGPointMake(1149, 2899);
    drawLine0248.width = 21.5;
    drawLine0248.color = line0007.color;
    [station0126.drawPrimitives addObject:drawLine0248];

    MWDrawTextLine *drawTextLine0263 = [[MWDrawTextLine alloc] init];
    drawTextLine0263.text = station0126.nameOriginal;
    drawTextLine0263.fontName = @"HelveticaNeue";
    drawTextLine0263.fontColor = [UIColor blackColor];
    drawTextLine0263.fontSize = 42;
    drawTextLine0263.origin = CGPointMake(988, 2893);
    drawTextLine0263.kernSpacing = -0.2;
    [station0126.nameOriginalTextPrimitives addObject:drawTextLine0263];

    MWDrawTextLine *drawTextLine0264 = [[MWDrawTextLine alloc] init];
    drawTextLine0264.text = station0126.nameEnglish;
    drawTextLine0264.fontName = @"HelveticaNeue";
    drawTextLine0264.fontColor = stationNamesEnglishColor;
    drawTextLine0264.fontSize = 28;
    drawTextLine0264.kernSpacing = -1.0;
    drawTextLine0264.origin = CGPointMake(1028, 2937);
    [station0126.nameEnglishTextPrimitives addObject:drawTextLine0264];

    // Добавляем перегон
    MWHaul *haul0121 = [[MWHaul alloc] init];
    haul0121.identifier = @"haul0121";
    haul0121.length = 1810;
    [edge0049.elements addObject:haul0121];
    
    MWDrawLine *drawLine0249 = [[MWDrawLine alloc] init];
    drawLine0249.startPoint = CGPointMake(1172.5, 2876.5);
    drawLine0249.endPoint = CGPointMake(1030.5, 2734.5);
    drawLine0249.width = 21.5;
    drawLine0249.color = line0007.color;
    [haul0121.drawPrimitives addObject:drawLine0249];

    // Добавляем станцию "Полежаевская"
    MWStation *station0127 = [[MWStation alloc] init];
    station0127.identifier = @"station0127";
    [edge0049.elements addObject:station0127];
    
    station0127.nameOriginal = @"Полежаевская";
    station0127.nameEnglish = @"Polejayevskaya";
    station0127.mapLocation = CGPointMake(1030.5, 2734.5);
    station0127.geoLocation = CGPointMake(55.777523, 37.519503);
    
    MWDrawFillCircle *fillCircle0131 = [[MWDrawFillCircle alloc] init];
    fillCircle0131.center = station0127.mapLocation;
    fillCircle0131.radius = 31.5;
    fillCircle0131.fillColor = line0007.color;
    [station0127.drawPrimitives addObject:fillCircle0131];

    MWDrawFillCircle *fillCircle0132 = [[MWDrawFillCircle alloc] init];
    fillCircle0132.center = station0127.mapLocation;
    fillCircle0132.radius = 14;
    fillCircle0132.fillColor = [UIColor whiteColor];
    [station0127.drawPrimitives addObject:fillCircle0132];

    MWDrawTextLine *drawTextLine0265 = [[MWDrawTextLine alloc] init];
    drawTextLine0265.text = station0127.nameOriginal;
    drawTextLine0265.fontName = @"HelveticaNeue";
    drawTextLine0265.fontColor = [UIColor blackColor];
    drawTextLine0265.fontSize = 42;
    drawTextLine0265.origin = CGPointMake(1015, 2649);
    drawTextLine0265.kernSpacing = 0.3;
    [station0127.nameOriginalTextPrimitives addObject:drawTextLine0265];

    MWDrawTextLine *drawTextLine0266 = [[MWDrawTextLine alloc] init];
    drawTextLine0266.text = station0127.nameEnglish;
    drawTextLine0266.fontName = @"HelveticaNeue";
    drawTextLine0266.fontColor = stationNamesEnglishColor;
    drawTextLine0266.fontSize = 28;
    drawTextLine0266.kernSpacing = -0.5;
    drawTextLine0266.origin = CGPointMake(1015, 2621);
    [station0127.nameEnglishTextPrimitives addObject:drawTextLine0266];

    // Добавляем вершину
    edge0049.finishVertex = vertex0055;
    
    // Создаем участок линии Полежаевская - Октябрьское поле
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0082 = [[MWEdge alloc] init];
    edge0082.identifier = @"edge0082";
    edge0082.developmentName = @"Ребро: Полежаевская - Октябрьское поле";
    [self.edges addObject:edge0082];
    
    // Добавляем линию
    edge0082.line = line0007;
    
    // Добавляем вершину
    edge0082.startVertex = vertex0055;
    
    // Добавляем станцию "Полежаевская"
    [edge0082.elements addObject:station0127];

    // Добавляем перегон
    MWHaul *haul0122 = [[MWHaul alloc] init];
    haul0122.identifier = @"haul0122";
    haul0122.length = 2490;
    [edge0082.elements addObject:haul0122];

    MWDrawLine *drawLine0250 = [[MWDrawLine alloc] init];
    drawLine0250.startPoint = CGPointMake(1031, 2735);
    drawLine0250.endPoint = CGPointMake(799.5, 2503.5);
    drawLine0250.width = 21.5;
    drawLine0250.color = line0007.color;
    [haul0122.drawPrimitives addObject:drawLine0250];

    MWDrawArc *drawArc0044 = [[MWDrawArc alloc] init];
    drawArc0044.center = CGPointMake(906, 2398);
    drawArc0044.startDegrees = 135;
    drawArc0044.endDegrees = 178;
    drawArc0044.radius = 150;
    drawArc0044.width = 21.5;
    drawArc0044.color = line0007.color;
    [haul0122.drawPrimitives addObject:drawArc0044];
    
    // Добавляем станцию "Октябрьское поле"
    MWStation *station0128 = [[MWStation alloc] init];
    station0128.identifier = @"station0128";
    [edge0082.elements addObject:station0128];
    
    station0128.nameOriginal = @"Октябрьское поле";
    station0128.nameEnglish = @"Oktyabrskoye Pole";
    station0128.mapLocation = CGPointMake(756, 2405.5);
    station0128.geoLocation = CGPointMake(55.793520, 37.493537);

    MWDrawFillCircle *fillCircle0133 = [[MWDrawFillCircle alloc] init];
    fillCircle0133.center = station0128.mapLocation;
    fillCircle0133.radius = 31.5;
    fillCircle0133.fillColor = line0007.color;
    [station0128.drawPrimitives addObject:fillCircle0133];
    
    MWDrawFillCircle *fillCircle0134 = [[MWDrawFillCircle alloc] init];
    fillCircle0134.center = station0128.mapLocation;
    fillCircle0134.radius = 14;
    fillCircle0134.fillColor = [UIColor whiteColor];
    [station0128.drawPrimitives addObject:fillCircle0134];

    // Подложка
    MWDrawLine *drawLine0251 = [[MWDrawLine alloc] init];
    drawLine0251.startPoint = CGPointMake(970, 2331);
    drawLine0251.endPoint = CGPointMake(1070, 2331);
    drawLine0251.width = 33;
    drawLine0251.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0128.nameOriginalTextPrimitives addObject:drawLine0251];

    MWDrawTextLine *drawTextLine0267 = [[MWDrawTextLine alloc] init];
    drawTextLine0267.text = @"Октябрьское";
    drawTextLine0267.fontName = @"HelveticaNeue";
    drawTextLine0267.fontColor = [UIColor blackColor];
    drawTextLine0267.fontSize = 42;
    drawTextLine0267.origin = CGPointMake(797, 2302);
    drawTextLine0267.kernSpacing = 0.4;
    [station0128.nameOriginalTextPrimitives addObject:drawTextLine0267];

    MWDrawTextLine *drawTextLine0268 = [[MWDrawTextLine alloc] init];
    drawTextLine0268.text = @"Поле";
    drawTextLine0268.fontName = @"HelveticaNeue";
    drawTextLine0268.fontColor = [UIColor blackColor];
    drawTextLine0268.fontSize = 42;
    drawTextLine0268.origin = CGPointMake(797, 2342);
    drawTextLine0268.kernSpacing = 1.2;
    [station0128.nameOriginalTextPrimitives addObject:drawTextLine0268];

    // Подложка
    MWDrawLine *drawLine0252 = [[MWDrawLine alloc] init];
    drawLine0252.startPoint = CGPointMake(1000, 2294);
    drawLine0252.endPoint = CGPointMake(1100, 2294);
    drawLine0252.width = 24;
    drawLine0252.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0128.nameEnglishTextPrimitives addObject:drawLine0252];

    MWDrawTextLine *drawTextLine0269 = [[MWDrawTextLine alloc] init];
    drawTextLine0269.text = station0128.nameEnglish;
    drawTextLine0269.fontName = @"HelveticaNeue";
    drawTextLine0269.fontColor = stationNamesEnglishColor;
    drawTextLine0269.fontSize = 28;
    drawTextLine0269.kernSpacing = -0.1;
    drawTextLine0269.origin = CGPointMake(799, 2275);
    [station0128.nameEnglishTextPrimitives addObject:drawTextLine0269];

    // Добавляем вершину
    edge0082.finishVertex = vertex0056;
    
    // Создаем участок линии Октябрьское поле - Планерная
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0083 = [[MWEdge alloc] init];
    edge0083.identifier = @"edge0083";
    edge0083.developmentName = @"Ребро: Октябрьское поле - Планерная";
    [self.edges addObject:edge0083];
    
    // Добавляем линию
    edge0083.line = line0007;
    
    // Добавляем вершину
    edge0083.startVertex = vertex0056;

    // Добавляем станцию "Октябрьское поле"
    [edge0083.elements addObject:station0128];

    // Добавляем перегон
    MWHaul *haul0123 = [[MWHaul alloc] init];
    haul0123.identifier = @"haul0123";
    haul0123.length = 2520;
    [edge0083.elements addObject:haul0123];
    
    MWDrawArc *drawArc0045 = [[MWDrawArc alloc] init];
    drawArc0045.center = CGPointMake(906, 2398);
    drawArc0045.startDegrees = 177.5;
    drawArc0045.endDegrees = 180;
    drawArc0045.radius = 150;
    drawArc0045.width = 21.5;
    drawArc0045.color = line0007.color;
    [haul0123.drawPrimitives addObject:drawArc0045];

    MWDrawLine *drawLine0253 = [[MWDrawLine alloc] init];
    drawLine0253.startPoint = CGPointMake(756, 2398.5);
    drawLine0253.endPoint = CGPointMake(756, 1903);
    drawLine0253.width = 21.5;
    drawLine0253.color = line0007.color;
    [haul0122.drawPrimitives addObject:drawLine0253];

    // Добавляем станцию "Щукинская"
    MWStation *station0129 = [[MWStation alloc] init];
    station0129.identifier = @"station0129";
    [edge0083.elements addObject:station0129];
    
    station0129.nameOriginal = @"Щукинская";
    station0129.nameEnglish = @"Schukinskaya";
    station0129.mapLocation = CGPointMake(756, 1905);
    station0129.geoLocation = CGPointMake(55.808519, 37.464391);

    MWDrawLine *drawLine0254 = [[MWDrawLine alloc] init];
    drawLine0254.startPoint = CGPointMake(756, 1905);
    drawLine0254.endPoint = CGPointMake(787, 1905);
    drawLine0254.width = 21.5;
    drawLine0254.color = line0007.color;
    [station0129.drawPrimitives addObject:drawLine0254];

    MWDrawTextLine *drawTextLine0270 = [[MWDrawTextLine alloc] init];
    drawTextLine0270.text = station0129.nameOriginal;
    drawTextLine0270.fontName = @"HelveticaNeue";
    drawTextLine0270.fontColor = [UIColor blackColor];
    drawTextLine0270.fontSize = 42;
    drawTextLine0270.origin = CGPointMake(797, 1877);
    drawTextLine0270.kernSpacing = 0.0;
    [station0129.nameOriginalTextPrimitives addObject:drawTextLine0270];

    MWDrawTextLine *drawTextLine0271 = [[MWDrawTextLine alloc] init];
    drawTextLine0271.text = station0129.nameEnglish;
    drawTextLine0271.fontName = @"HelveticaNeue";
    drawTextLine0271.fontColor = stationNamesEnglishColor;
    drawTextLine0271.fontSize = 28;
    drawTextLine0271.kernSpacing = -0.6;
    drawTextLine0271.origin = CGPointMake(796, 1921);
    [station0129.nameEnglishTextPrimitives addObject:drawTextLine0271];

    // Добавляем перегон
    MWHaul *haul0124 = [[MWHaul alloc] init];
    haul0124.identifier = @"haul0124";
    haul0124.length = 2640;
    [edge0083.elements addObject:haul0124];
    
    MWDrawLine *drawLine0255 = [[MWDrawLine alloc] init];
    drawLine0255.startPoint = CGPointMake(756, 1903.5);
    drawLine0255.endPoint = CGPointMake(756, 1753.5);
    drawLine0255.width = 21.5;
    drawLine0255.color = line0007.color;
    [haul0124.drawPrimitives addObject:drawLine0255];

    // Добавляем станцию "Спартак"
    MWStation *station0195 = [[MWStation alloc] init];
    station0195.identifier = @"station0195";
    [edge0083.elements addObject:station0195];
    
    station0195.nameOriginal = @"Спартак";
    station0195.nameEnglish = @"Spartak";
    station0195.mapLocation = CGPointMake(756, 1753.5);
    station0195.geoLocation = CGPointMake(55.8182, 37.4352);
    
    MWDrawLine *drawLine0256 = [[MWDrawLine alloc] init];
    drawLine0256.startPoint = CGPointMake(756, 1753.5);
    drawLine0256.endPoint = CGPointMake(787, 1753.5);
    drawLine0256.width = 21.5;
    drawLine0256.color = line0007.color;
    [station0195.drawPrimitives addObject:drawLine0256];

    MWDrawTextLine *drawTextLine0272 = [[MWDrawTextLine alloc] init];
    drawTextLine0272.text = station0195.nameOriginal;
    drawTextLine0272.fontName = @"HelveticaNeue";
    drawTextLine0272.fontColor = [UIColor blackColor];
    drawTextLine0272.fontSize = 42;
    drawTextLine0272.origin = CGPointMake(797, 1723.5);
    drawTextLine0272.kernSpacing = 0.2;
    [station0195.nameOriginalTextPrimitives addObject:drawTextLine0272];
    
    MWDrawTextLine *drawTextLine0273 = [[MWDrawTextLine alloc] init];
    drawTextLine0273.text = station0195.nameEnglish;
    drawTextLine0273.fontName = @"HelveticaNeue";
    drawTextLine0273.fontColor = stationNamesEnglishColor;
    drawTextLine0273.fontSize = 28;
    drawTextLine0273.kernSpacing = 0.0;
    drawTextLine0273.origin = CGPointMake(796, 1768);
    [station0195.nameEnglishTextPrimitives addObject:drawTextLine0273];

    // Добавляем перегон
    MWHaul *haul0183 = [[MWHaul alloc] init];
    haul0183.identifier = @"haul0183";
    haul0183.length = 2640;
    [edge0083.elements addObject:haul0183];
    
    MWDrawLine *drawLine0257 = [[MWDrawLine alloc] init];
    drawLine0257.startPoint = CGPointMake(756, 1754);
    drawLine0257.endPoint = CGPointMake(756, 1615);
    drawLine0257.width = 21.5;
    drawLine0257.color = line0007.color;
    [haul0183.drawPrimitives addObject:drawLine0257];

    // Добавляем станцию "Тушинская"
    MWStation *station0130 = [[MWStation alloc] init];
    station0130.identifier = @"station0130";
    [edge0083.elements addObject:station0130];
    
    station0130.nameOriginal = @"Тушинская";
    station0130.nameEnglish = @"Tushinskaya";
    station0130.mapLocation = CGPointMake(756, 1615);
    station0130.geoLocation = CGPointMake(55.826508, 37.437055);
    
    MWDrawLine *drawLine0258 = [[MWDrawLine alloc] init];
    drawLine0258.startPoint = CGPointMake(756, 1615);
    drawLine0258.endPoint = CGPointMake(787, 1615);
    drawLine0258.width = 21.5;
    drawLine0258.color = line0007.color;
    [station0130.drawPrimitives addObject:drawLine0258];

    MWDrawTextLine *drawTextLine0274 = [[MWDrawTextLine alloc] init];
    drawTextLine0274.text = station0130.nameOriginal;
    drawTextLine0274.fontName = @"HelveticaNeue";
    drawTextLine0274.fontColor = [UIColor blackColor];
    drawTextLine0274.fontSize = 42;
    drawTextLine0274.origin = CGPointMake(794, 1585);
    drawTextLine0274.kernSpacing = 0.0;
    [station0130.nameOriginalTextPrimitives addObject:drawTextLine0274];

    MWDrawTextLine *drawTextLine0275 = [[MWDrawTextLine alloc] init];
    drawTextLine0275.text = station0130.nameEnglish;
    drawTextLine0275.fontName = @"HelveticaNeue";
    drawTextLine0275.fontColor = stationNamesEnglishColor;
    drawTextLine0275.fontSize = 28;
    drawTextLine0275.kernSpacing = -0.6;
    drawTextLine0275.origin = CGPointMake(793, 1557.5);
    [station0130.nameEnglishTextPrimitives addObject:drawTextLine0275];

    // Добавляем перегон
    MWHaul *haul0125 = [[MWHaul alloc] init];
    haul0125.identifier = @"haul0125";
    haul0125.length = 2660;
    [edge0083.elements addObject:haul0125];
    
    MWDrawLine *drawLine0259 = [[MWDrawLine alloc] init];
    drawLine0259.startPoint = CGPointMake(756, 1615.5);
    drawLine0259.endPoint = CGPointMake(756, 1477);
    drawLine0259.width = 21.5;
    drawLine0259.color = line0007.color;
    [haul0125.drawPrimitives addObject:drawLine0259];

    // Добавляем станцию "Сходненская"
    MWStation *station0131 = [[MWStation alloc] init];
    station0131.identifier = @"station0131";
    [edge0083.elements addObject:station0131];
    
    station0131.nameOriginal = @"Сходненская";
    station0131.nameEnglish = @"Skhodnenskaya";
    station0131.mapLocation = CGPointMake(756, 1477);
    station0131.geoLocation = CGPointMake(55.850644, 37.439859);

    MWDrawLine *drawLine0260 = [[MWDrawLine alloc] init];
    drawLine0260.startPoint = CGPointMake(756, 1477);
    drawLine0260.endPoint = CGPointMake(787, 1477);
    drawLine0260.width = 21.5;
    drawLine0260.color = line0007.color;
    [station0131.drawPrimitives addObject:drawLine0260];
    
    MWDrawTextLine *drawTextLine0276 = [[MWDrawTextLine alloc] init];
    drawTextLine0276.text = station0131.nameOriginal;
    drawTextLine0276.fontName = @"HelveticaNeue";
    drawTextLine0276.fontColor = [UIColor blackColor];
    drawTextLine0276.fontSize = 42;
    drawTextLine0276.origin = CGPointMake(797, 1447);
    drawTextLine0276.kernSpacing = 0.0;
    [station0131.nameOriginalTextPrimitives addObject:drawTextLine0276];
    
    MWDrawTextLine *drawTextLine0277 = [[MWDrawTextLine alloc] init];
    drawTextLine0277.text = station0131.nameEnglish;
    drawTextLine0277.fontName = @"HelveticaNeue";
    drawTextLine0277.fontColor = stationNamesEnglishColor;
    drawTextLine0277.fontSize = 28;
    drawTextLine0277.kernSpacing = -0.3;
    drawTextLine0277.origin = CGPointMake(795, 1492);
    [station0131.nameEnglishTextPrimitives addObject:drawTextLine0277];
    
    // Добавляем перегон
    MWHaul *haul0126 = [[MWHaul alloc] init];
    haul0126.identifier = @"haul0126";
    haul0126.length = 1160;
    [edge0083.elements addObject:haul0126];
    
    MWDrawLine *drawLine0261 = [[MWDrawLine alloc] init];
    drawLine0261.startPoint = CGPointMake(756, 1477.5);
    drawLine0261.endPoint = CGPointMake(756, 1339);
    drawLine0261.width = 21.5;
    drawLine0261.color = line0007.color;
    [haul0126.drawPrimitives addObject:drawLine0261];

    // Добавляем станцию "Планерная"
    MWStation *station0132 = [[MWStation alloc] init];
    station0132.identifier = @"station0132";
    [edge0083.elements addObject:station0132];
    
    station0132.nameOriginal = @"Планерная";
    station0132.nameEnglish = @"Planernaya";
    station0132.mapLocation = CGPointMake(756, 1339);
    station0132.geoLocation = CGPointMake(55.860729, 37.436459);

    MWDrawLine *drawLine0262 = [[MWDrawLine alloc] init];
    drawLine0262.startPoint = CGPointMake(725, 1339);
    drawLine0262.endPoint = CGPointMake(787, 1339);
    drawLine0262.width = 21.5;
    drawLine0262.color = line0007.color;
    [station0132.drawPrimitives addObject:drawLine0262];

    MWDrawTextLine *drawTextLine0278 = [[MWDrawTextLine alloc] init];
    drawTextLine0278.text = station0132.nameOriginal;
    drawTextLine0278.fontName = @"HelveticaNeue";
    drawTextLine0278.fontColor = [UIColor blackColor];
    drawTextLine0278.fontSize = 42;
    drawTextLine0278.origin = CGPointMake(797, 1309);
    drawTextLine0278.kernSpacing = 0.5;
    [station0132.nameOriginalTextPrimitives addObject:drawTextLine0278];
    
    MWDrawTextLine *drawTextLine0279 = [[MWDrawTextLine alloc] init];
    drawTextLine0279.text = station0132.nameEnglish;
    drawTextLine0279.fontName = @"HelveticaNeue";
    drawTextLine0279.fontColor = stationNamesEnglishColor;
    drawTextLine0279.fontSize = 28;
    drawTextLine0279.kernSpacing = -0.2;
    drawTextLine0279.origin = CGPointMake(798, 1354);
    [station0132.nameEnglishTextPrimitives addObject:drawTextLine0279];

    MWDrawFillCircle *fillCircle0135 = [[MWDrawFillCircle alloc] init];
    fillCircle0135.center = CGPointMake(756, 1276.5);
    fillCircle0135.radius = 32;
    fillCircle0135.fillColor = line0007.color;
    [station0132.drawPrimitives addObject:fillCircle0135];
    
    MWDrawTextLine *drawTextLine0280 = [[MWDrawTextLine alloc] init];
    drawTextLine0280.text = @"7";
    drawTextLine0280.fontName = @"Georgia-Bold";
    drawTextLine0280.fontColor = [UIColor whiteColor];
    drawTextLine0280.fontSize = 56;
    drawTextLine0280.origin = CGPointMake(740, 1236);
    [station0132.drawPrimitives addObject:drawTextLine0280];

    // Добавляем вершину
    edge0083.finishVertex = vertex0034;
    
    ////////////////////////////////////////////////////////////////
    // 8 - Калининская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Новокосино - Шоссе Энтузиастов
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0050 = [[MWEdge alloc] init];
    edge0050.identifier = @"edge0050";
    edge0050.developmentName = @"Ребро: Новокосино - Шоссе Энтузиастов";
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
    station0133.mapLocation = CGPointMake(4582, 2756);
    station0133.geoLocation = CGPointMake(55.745108, 37.864013);
    
    MWDrawFillCircle *fillCircle0136 = [[MWDrawFillCircle alloc] init];
    fillCircle0136.center = CGPointMake(4625.5, 2711.5);//(756, 1276.5);
    fillCircle0136.radius = 32;
    fillCircle0136.fillColor = line0008.color;
    [station0133.drawPrimitives addObject:fillCircle0136];
    
    MWDrawTextLine *drawTextLine0281 = [[MWDrawTextLine alloc] init];
    drawTextLine0281.text = @"8";
    drawTextLine0281.fontName = @"Georgia-Bold";
    drawTextLine0281.fontColor = [UIColor blackColor];
    drawTextLine0281.fontSize = 56;
    drawTextLine0281.origin = CGPointMake(4607.5, 2679);
    [station0133.drawPrimitives addObject:drawTextLine0281];

    MWDrawLine *drawLine0263 = [[MWDrawLine alloc] init];
    drawLine0263.startPoint = CGPointMake(4558, 2732);
    drawLine0263.endPoint = CGPointMake(4606, 2780);
    drawLine0263.width = 21.5;
    drawLine0263.color = line0008.color;
    [station0133.drawPrimitives addObject:drawLine0263];

    MWDrawTextLine *drawTextLine0282 = [[MWDrawTextLine alloc] init];
    drawTextLine0282.text = station0133.nameOriginal;
    drawTextLine0282.fontName = @"HelveticaNeue";
    drawTextLine0282.fontColor = [UIColor blackColor];
    drawTextLine0282.fontSize = 42;
    drawTextLine0282.origin = CGPointMake(4608, 2780);
    drawTextLine0282.kernSpacing = -0.1;
    [station0133.nameOriginalTextPrimitives addObject:drawTextLine0282];
    
    MWDrawTextLine *drawTextLine0283 = [[MWDrawTextLine alloc] init];
    drawTextLine0283.text = station0133.nameEnglish;
    drawTextLine0283.fontName = @"HelveticaNeue";
    drawTextLine0283.fontColor = stationNamesEnglishColor;
    drawTextLine0283.fontSize = 28;
    drawTextLine0283.kernSpacing = -0.2;
    drawTextLine0283.origin = CGPointMake(4608, 2825);
    [station0133.nameEnglishTextPrimitives addObject:drawTextLine0283];
    
    // Добавляем перегон
    MWHaul *haul0127 = [[MWHaul alloc] init];
    haul0127.identifier = @"haul0127";
    haul0127.length = 3170;
    [edge0050.elements addObject:haul0127];
    
    MWDrawLine *drawLine0264 = [[MWDrawLine alloc] init];
    drawLine0264.startPoint = CGPointMake(4582, 2756);
    drawLine0264.endPoint = CGPointMake(4479, 2859.5);
    drawLine0264.width = 21.5;
    drawLine0264.color = line0008.color;
    [haul0127.drawPrimitives addObject:drawLine0264];

    // Добавляем станцию "Новогиреево"
    MWStation *station0134 = [[MWStation alloc] init];
    station0134.identifier = @"station0134";
    [edge0050.elements addObject:station0134];
    
    station0134.nameOriginal = @"Новогиреево";
    station0134.nameEnglish = @"Novogireyevo";
    station0134.mapLocation = CGPointMake(4479, 2859.5);
    station0134.geoLocation = CGPointMake(55.751700, 37.816644);

    MWDrawLine *drawLine0265 = [[MWDrawLine alloc] init];
    drawLine0265.startPoint = CGPointMake(4479, 2859.5);
    drawLine0265.endPoint = CGPointMake(4503, 2883.5);
    drawLine0265.width = 21.5;
    drawLine0265.color = line0008.color;
    [station0134.drawPrimitives addObject:drawLine0265];

    MWDrawTextLine *drawTextLine0284 = [[MWDrawTextLine alloc] init];
    drawTextLine0284.text = station0134.nameOriginal;
    drawTextLine0284.fontName = @"HelveticaNeue";
    drawTextLine0284.fontColor = [UIColor blackColor];
    drawTextLine0284.fontSize = 42;
    drawTextLine0284.origin = CGPointMake(4506, 2880);
    drawTextLine0284.kernSpacing = 0.4;
    [station0134.nameOriginalTextPrimitives addObject:drawTextLine0284];
    
    MWDrawTextLine *drawTextLine0285 = [[MWDrawTextLine alloc] init];
    drawTextLine0285.text = station0134.nameEnglish;
    drawTextLine0285.fontName = @"HelveticaNeue";
    drawTextLine0285.fontColor = stationNamesEnglishColor;
    drawTextLine0285.fontSize = 28;
    drawTextLine0285.kernSpacing = -0.0;
    drawTextLine0285.origin = CGPointMake(4505, 2925);
    [station0134.nameEnglishTextPrimitives addObject:drawTextLine0285];

    // Добавляем перегон
    MWHaul *haul0128 = [[MWHaul alloc] init];
    haul0128.identifier = @"haul0128";
    haul0128.length = 1950;
    [edge0050.elements addObject:haul0128];
    
    MWDrawLine *drawLine0266 = [[MWDrawLine alloc] init];
    drawLine0266.startPoint = CGPointMake(4479.5, 2859);
    drawLine0266.endPoint = CGPointMake(4380, 2958.5);
    drawLine0266.width = 21.5;
    drawLine0266.color = line0008.color;
    [haul0128.drawPrimitives addObject:drawLine0266];

    // Добавляем станцию "Перово"
    MWStation *station0135 = [[MWStation alloc] init];
    station0135.identifier = @"station0135";
    [edge0050.elements addObject:station0135];
    
    station0135.nameOriginal = @"Перово";
    station0135.nameEnglish = @"Perovo";
    station0135.mapLocation = CGPointMake(4380, 2958.5);
    station0135.geoLocation = CGPointMake(55.751190, 37.786652);

    MWDrawLine *drawLine0267 = [[MWDrawLine alloc] init];
    drawLine0267.startPoint = CGPointMake(4380, 2958.5);
    drawLine0267.endPoint = CGPointMake(4404, 2982.5);
    drawLine0267.width = 21.5;
    drawLine0267.color = line0008.color;
    [station0135.drawPrimitives addObject:drawLine0267];

    MWDrawTextLine *drawTextLine0286 = [[MWDrawTextLine alloc] init];
    drawTextLine0286.text = station0135.nameOriginal;
    drawTextLine0286.fontName = @"HelveticaNeue";
    drawTextLine0286.fontColor = [UIColor blackColor];
    drawTextLine0286.fontSize = 42;
    drawTextLine0286.origin = CGPointMake(4407, 2979.5);
    drawTextLine0286.kernSpacing = 1.4;
    [station0135.nameOriginalTextPrimitives addObject:drawTextLine0286];
    
    MWDrawTextLine *drawTextLine0287 = [[MWDrawTextLine alloc] init];
    drawTextLine0287.text = station0135.nameEnglish;
    drawTextLine0287.fontName = @"HelveticaNeue";
    drawTextLine0287.fontColor = stationNamesEnglishColor;
    drawTextLine0287.fontSize = 28;
    drawTextLine0287.kernSpacing = -0.2;
    drawTextLine0287.origin = CGPointMake(4406, 3023);
    [station0135.nameEnglishTextPrimitives addObject:drawTextLine0287];

    // Добавляем перегон
    MWHaul *haul0129 = [[MWHaul alloc] init];
    haul0129.identifier = @"haul0129";
    haul0129.length = 2470;
    [edge0050.elements addObject:haul0129];
    
    MWDrawLine *drawLine0268 = [[MWDrawLine alloc] init];
    drawLine0268.startPoint = CGPointMake(4380.5, 2958);
    drawLine0268.endPoint = CGPointMake(4167, 3171.5);
    drawLine0268.width = 21.5;
    drawLine0268.color = line0008.color;
    [haul0129.drawPrimitives addObject:drawLine0268];

    // Добавляем станцию "Шоссе Энтузиастов"
    MWStation *station0136 = [[MWStation alloc] init];
    station0136.identifier = @"station0136";
    [edge0050.elements addObject:station0136];
    
    station0136.nameOriginal = @"Шоссе Энтузиастов";
    station0136.nameEnglish = @"Shosse Entuziastov";
    station0136.mapLocation = CGPointMake(4167, 3171.5);
    station0136.geoLocation = CGPointMake(55.758304, 37.751520);
    
    MWDrawFillCircle *fillCircle0137 = [[MWDrawFillCircle alloc] init];
    fillCircle0137.center = station0136.mapLocation;
    fillCircle0137.radius = 31.5;
    fillCircle0137.fillColor = line0008.color;
    [station0136.drawPrimitives addObject:fillCircle0137];

    MWDrawFillCircle *fillCircle0138 = [[MWDrawFillCircle alloc] init];
    fillCircle0138.center = station0136.mapLocation;
    fillCircle0138.radius = 14;
    fillCircle0138.fillColor = [UIColor whiteColor];
    [station0136.drawPrimitives addObject:fillCircle0138];

    // Подложка
    MWDrawLine *drawLine0269 = [[MWDrawLine alloc] init];
    drawLine0269.startPoint = CGPointMake(4250, 3235);
    drawLine0269.endPoint = CGPointMake(4350, 3235);
    drawLine0269.width = 40;
    drawLine0269.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0136.nameOriginalTextPrimitives addObject:drawLine0269];

    MWDrawTextLine *drawTextLine0288 = [[MWDrawTextLine alloc] init];
    drawTextLine0288.text = station0136.nameOriginal;
    drawTextLine0288.fontName = @"HelveticaNeue";
    drawTextLine0288.fontColor = [UIColor blackColor];
    drawTextLine0288.fontSize = 42;
    drawTextLine0288.origin = CGPointMake(4150, 3208);
    drawTextLine0288.kernSpacing = -0.4;
    [station0136.nameOriginalTextPrimitives addObject:drawTextLine0288];

    // Подложка
    MWDrawLine *drawLine0270 = [[MWDrawLine alloc] init];
    drawLine0270.startPoint = CGPointMake(4250, 3272);
    drawLine0270.endPoint = CGPointMake(4350, 3272);
    drawLine0270.width = 24;
    drawLine0270.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0136.nameEnglishTextPrimitives addObject:drawLine0270];

    MWDrawTextLine *drawTextLine0289 = [[MWDrawTextLine alloc] init];
    drawTextLine0289.text = station0136.nameEnglish;
    drawTextLine0289.fontName = @"HelveticaNeue";
    drawTextLine0289.fontColor = stationNamesEnglishColor;
    drawTextLine0289.fontSize = 28;
    drawTextLine0289.kernSpacing = -0.4;
    drawTextLine0289.origin = CGPointMake(4149, 3253);
    [station0136.nameEnglishTextPrimitives addObject:drawTextLine0289];

    // Добавляем вершину
    edge0050.finishVertex = vertex0049;
    
    // Создаем участок линии Шоссе Энтузиастов - Площадь Ильича
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0076 = [[MWEdge alloc] init];
    edge0076.identifier = @"edge0076";
    edge0076.developmentName = @"Ребро: Шоссе Энтузиастов - Площадь Ильича";
    [self.edges addObject:edge0076];
    
    // Добавляем линию
    edge0076.line = line0008;
    
    // Добавляем вершину
    edge0076.startVertex = vertex0049;

    // Добавляем станцию "Шоссе Энтузиастов"
    [edge0076.elements addObject:station0136];

    // Добавляем перегон
    MWHaul *haul0130 = [[MWHaul alloc] init];
    haul0130.identifier = @"haul0130";
    haul0130.length = 2330;
    [edge0076.elements addObject:haul0130];
    
    MWDrawLine *drawLine0271 = [[MWDrawLine alloc] init];
    drawLine0271.startPoint = CGPointMake(4167.5, 3171);
    drawLine0271.endPoint = CGPointMake(4053, 3285.5);
    drawLine0271.width = 21.5;
    drawLine0271.color = line0008.color;
    [haul0130.drawPrimitives addObject:drawLine0271];

    // Добавляем станцию "Авиамоторная"
    MWStation *station0137 = [[MWStation alloc] init];
    station0137.identifier = @"station0137";
    [edge0076.elements addObject:station0137];
    
    station0137.nameOriginal = @"Авиамоторная";
    station0137.nameEnglish = @"Aviamotornaya";
    station0137.mapLocation = CGPointMake(4053, 3285.5);
    station0137.geoLocation = CGPointMake(55.751620, 37.717218);

    MWDrawLine *drawLine0272 = [[MWDrawLine alloc] init];
    drawLine0272.startPoint = CGPointMake(4053, 3285.5);
    drawLine0272.endPoint = CGPointMake(4077, 3309.5);
    drawLine0272.width = 21.5;
    drawLine0272.color = line0008.color;
    [station0137.drawPrimitives addObject:drawLine0272];

    // Подложка
    MWDrawLine *drawLine0273 = [[MWDrawLine alloc] init];
    drawLine0273.startPoint = CGPointMake(4250, 3333);
    drawLine0273.endPoint = CGPointMake(4350, 3333);
    drawLine0273.width = 33;
    drawLine0273.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0137.nameOriginalTextPrimitives addObject:drawLine0273];

    MWDrawTextLine *drawTextLine0290 = [[MWDrawTextLine alloc] init];
    drawTextLine0290.text = station0137.nameOriginal;
    drawTextLine0290.fontName = @"HelveticaNeue";
    drawTextLine0290.fontColor = [UIColor blackColor];
    drawTextLine0290.fontSize = 42;
    drawTextLine0290.origin = CGPointMake(4072, 3304);
    drawTextLine0290.kernSpacing = 0.8;
    [station0137.nameOriginalTextPrimitives addObject:drawTextLine0290];

    MWDrawTextLine *drawTextLine0291 = [[MWDrawTextLine alloc] init];
    drawTextLine0291.text = station0137.nameEnglish;
    drawTextLine0291.fontName = @"HelveticaNeue";
    drawTextLine0291.fontColor = stationNamesEnglishColor;
    drawTextLine0291.fontSize = 28;
    drawTextLine0291.kernSpacing = -0.2;
    drawTextLine0291.origin = CGPointMake(4072, 3353);
    [station0137.nameEnglishTextPrimitives addObject:drawTextLine0291];

    // Добавляем перегон
    MWHaul *haul0131 = [[MWHaul alloc] init];
    haul0131.identifier = @"haul0131";
    haul0131.length = 2310;
    [edge0076.elements addObject:haul0131];
    
    MWDrawLine *drawLine0274 = [[MWDrawLine alloc] init];
    drawLine0274.startPoint = CGPointMake(4053.5, 3285);
    drawLine0274.endPoint = CGPointMake(3868, 3468);
    drawLine0274.width = 21.5;
    drawLine0274.color = line0008.color;
    [haul0131.drawPrimitives addObject:drawLine0274];

    // Добавляем станцию "Площадь Ильича"
    MWStation *station0138 = [[MWStation alloc] init];
    station0138.identifier = @"station0138";
    [edge0076.elements addObject:station0138];
    
    station0138.nameOriginal = @"Площадь Ильича";
    station0138.nameEnglish = @"Ploschad Ilyicha";
    station0138.mapLocation = CGPointMake(3868, 3468);
    station0138.geoLocation = CGPointMake(55.746823, 37.680966);
    
    MWDrawFillCircle *fillCircle0139 = [[MWDrawFillCircle alloc] init];
    fillCircle0139.center = station0138.mapLocation;
    fillCircle0139.radius = 31.5;
    fillCircle0139.fillColor = line0008.color;
    [station0138.drawPrimitives addObject:fillCircle0139];
    
    MWDrawFillCircle *fillCircle0140 = [[MWDrawFillCircle alloc] init];
    fillCircle0140.center = station0138.mapLocation;
    fillCircle0140.radius = 14;
    fillCircle0140.fillColor = [UIColor whiteColor];
    [station0138.drawPrimitives addObject:fillCircle0140];

    // Подложка
    MWDrawLine *drawLine0275 = [[MWDrawLine alloc] init];
    drawLine0275.startPoint = CGPointMake(3848, 3550);
    drawLine0275.endPoint = CGPointMake(3908, 3550);
    drawLine0275.width = 80;
    drawLine0275.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0138.nameOriginalTextPrimitives addObject:drawLine0275];

    MWDrawTextLine *drawTextLine0292 = [[MWDrawTextLine alloc] init];
    drawTextLine0292.text = @"Площадь";
    drawTextLine0292.fontName = @"HelveticaNeue";
    drawTextLine0292.fontColor = [UIColor blackColor];
    drawTextLine0292.fontSize = 42;
    drawTextLine0292.origin = CGPointMake(3854.5, 3505);
    drawTextLine0292.kernSpacing = 0.0;
    [station0138.nameOriginalTextPrimitives addObject:drawTextLine0292];

    MWDrawTextLine *drawTextLine0293 = [[MWDrawTextLine alloc] init];
    drawTextLine0293.text = @"Ильича";
    drawTextLine0293.fontName = @"HelveticaNeue";
    drawTextLine0293.fontColor = [UIColor blackColor];
    drawTextLine0293.fontSize = 42;
    drawTextLine0293.origin = CGPointMake(3854.5, 3545);
    drawTextLine0293.kernSpacing = 0.3;
    [station0138.nameOriginalTextPrimitives addObject:drawTextLine0293];

    // Подложка
    MWDrawLine *drawLine0276 = [[MWDrawLine alloc] init];
    drawLine0276.startPoint = CGPointMake(3858, 3625);
    drawLine0276.endPoint = CGPointMake(3918, 3625);
    drawLine0276.width = 62;
    drawLine0276.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0138.nameOriginalTextPrimitives addObject:drawLine0276];

    MWDrawTextLine *drawTextLine0294 = [[MWDrawTextLine alloc] init];
    drawTextLine0294.text = @"Ploschad";
    drawTextLine0294.fontName = @"HelveticaNeue";
    drawTextLine0294.fontColor = stationNamesEnglishColor;
    drawTextLine0294.fontSize = 28;
    drawTextLine0294.kernSpacing = -0.7;
    drawTextLine0294.origin = CGPointMake(3854.5, 3590);
    [station0138.nameEnglishTextPrimitives addObject:drawTextLine0294];

    MWDrawTextLine *drawTextLine0295 = [[MWDrawTextLine alloc] init];
    drawTextLine0295.text = @"Ilyicha";
    drawTextLine0295.fontName = @"HelveticaNeue";
    drawTextLine0295.fontColor = stationNamesEnglishColor;
    drawTextLine0295.fontSize = 28;
    drawTextLine0295.kernSpacing = 0.8;
    drawTextLine0295.origin = CGPointMake(3854.5, 3621);
    [station0138.nameEnglishTextPrimitives addObject:drawTextLine0295];

    // Добавляем вершину
    edge0076.finishVertex = vertex0036;
    
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

    MWDrawLine *drawLine0277 = [[MWDrawLine alloc] init];
    drawLine0277.startPoint = CGPointMake(3868.5, 3467.5);
    drawLine0277.endPoint = CGPointMake(3736, 3600);
    drawLine0277.width = 21.5;
    drawLine0277.color = line0008.color;
    [haul0132.drawPrimitives addObject:drawLine0277];

    MWDrawArc *drawArc0046 = [[MWDrawArc alloc] init];
    drawArc0046.center = CGPointMake(3631, 3493);
    drawArc0046.startDegrees = 45;
    drawArc0046.endDegrees = 90;
    drawArc0046.radius = 150;
    drawArc0046.width = 21.5;
    drawArc0046.color = line0008.color;
    [haul0132.drawPrimitives addObject:drawArc0046];

    MWDrawLine *drawLine0278 = [[MWDrawLine alloc] init];
    drawLine0278.startPoint = CGPointMake(3631.5, 3643);
    drawLine0278.endPoint = CGPointMake(3526, 3643);
    drawLine0278.width = 21.5;
    drawLine0278.color = line0008.color;
    [haul0132.drawPrimitives addObject:drawLine0278];

    // Добавляем станцию "Марксистская"
    MWStation *station0139 = [[MWStation alloc] init];
    station0139.identifier = @"station0139";
    [edge0051.elements addObject:station0139];
    
    station0139.nameOriginal = @"Марксистская";
    station0139.nameEnglish = @"Marksistskaya";
    station0139.mapLocation = CGPointMake(3526, 3643);
    station0139.geoLocation = CGPointMake(55.740882, 37.656518);
    
    MWDrawFillCircle *fillCircle0141 = [[MWDrawFillCircle alloc] init];
    fillCircle0141.center = station0139.mapLocation;
    fillCircle0141.radius = 31.5;
    fillCircle0141.fillColor = line0008.color;
    [station0139.drawPrimitives addObject:fillCircle0141];

    MWDrawFillCircle *fillCircle0142 = [[MWDrawFillCircle alloc] init];
    fillCircle0142.center = station0139.mapLocation;
    fillCircle0142.radius = 14;
    fillCircle0142.fillColor = [UIColor whiteColor];
    [station0139.drawPrimitives addObject:fillCircle0142];

    // Подложка
    MWDrawLine *drawLine0279 = [[MWDrawLine alloc] init];
    drawLine0279.startPoint = CGPointMake(3590, 3705);
    drawLine0279.endPoint = CGPointMake(3690, 3705);
    drawLine0279.width = 33;
    drawLine0279.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0139.nameOriginalTextPrimitives addObject:drawLine0279];

    MWDrawTextLine *drawTextLine0296 = [[MWDrawTextLine alloc] init];
    drawTextLine0296.text = station0139.nameOriginal;
    drawTextLine0296.fontName = @"HelveticaNeue";
    drawTextLine0296.fontColor = [UIColor blackColor];
    drawTextLine0296.fontSize = 42;
    drawTextLine0296.origin = CGPointMake(3506, 3676);
    drawTextLine0296.kernSpacing = 0.8;
    [station0139.nameOriginalTextPrimitives addObject:drawTextLine0296];

    // Подложка
    MWDrawLine *drawLine0280 = [[MWDrawLine alloc] init];
    drawLine0280.startPoint = CGPointMake(3620, 3740);
    drawLine0280.endPoint = CGPointMake(3720, 3740);
    drawLine0280.width = 24;
    drawLine0280.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0139.nameOriginalTextPrimitives addObject:drawLine0280];

    MWDrawTextLine *drawTextLine0297 = [[MWDrawTextLine alloc] init];
    drawTextLine0297.text = station0139.nameEnglish;
    drawTextLine0297.fontName = @"HelveticaNeue";
    drawTextLine0297.fontColor = stationNamesEnglishColor;
    drawTextLine0297.fontSize = 28;
    drawTextLine0297.kernSpacing = 0.4;
    drawTextLine0297.origin = CGPointMake(3506, 3721);
    [station0139.nameEnglishTextPrimitives addObject:drawTextLine0297];

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
    
    MWDrawLine *drawLine0281 = [[MWDrawLine alloc] init];
    drawLine0281.startPoint = CGPointMake(3526.5, 3643);
    drawLine0281.endPoint = CGPointMake(3207.5, 3643);
    drawLine0281.width = 21.5;
    drawLine0281.color = line0008.color;
    [haul0133.drawPrimitives addObject:drawLine0281];

    MWDrawArc *drawArc0047 = [[MWDrawArc alloc] init];
    drawArc0047.center = CGPointMake(3208, 3793);
    drawArc0047.startDegrees = 225;
    drawArc0047.endDegrees = 270;
    drawArc0047.radius = 150;
    drawArc0047.width = 21.5;
    drawArc0047.color = line0008.color;
    [haul0133.drawPrimitives addObject:drawArc0047];

    MWDrawLine *drawLine0282 = [[MWDrawLine alloc] init];
    drawLine0282.startPoint = CGPointMake(3102.5, 3686.5);
    drawLine0282.endPoint = CGPointMake(2894, 3895);
    drawLine0282.width = 21.5;
    drawLine0282.color = line0008.color;
    [haul0133.drawPrimitives addObject:drawLine0282];

    // Добавляем станцию "Третьяковская"
    MWStation *station0140 = [[MWStation alloc] init];
    station0140.identifier = @"station0140";
    [edge0052.elements addObject:station0140];
    
    station0140.nameOriginal = @"Третьяковская";
    station0140.nameEnglish = @"Tretyakovskaya";
    station0140.mapLocation = CGPointMake(2894, 3895);
    station0140.geoLocation = CGPointMake(55.740729, 37.625592);
    
    MWDrawFillCircle *fillCircle0143 = [[MWDrawFillCircle alloc] init];
    fillCircle0143.center = station0140.mapLocation;
    fillCircle0143.radius = 31.5;
    fillCircle0143.fillColor = line0008.color;
    [station0140.drawPrimitives addObject:fillCircle0143];
    
    MWDrawFillCircle *fillCircle0144 = [[MWDrawFillCircle alloc] init];
    fillCircle0144.center = station0140.mapLocation;
    fillCircle0144.radius = 14;
    fillCircle0144.fillColor = [UIColor whiteColor];
    [station0140.drawPrimitives addObject:fillCircle0144];

    station0140.showNameOnMap = false;
    [station0140.nameOriginalTextPrimitives addObject:drawLine0193];
    [station0140.nameOriginalTextPrimitives addObject:drawTextLine0209];
    [station0140.nameEnglishTextPrimitives addObject:drawLine0194];
    [station0140.nameEnglishTextPrimitives addObject:drawTextLine0210];

    // Добавляем вершину
    edge0052.finishVertex = vertex0013;
    
    ////////////////////////////////////////////////////////////////
    // 8А - Солнцевская линия
    ////////////////////////////////////////////////////////////////

    // Создаем участок линии от "Делового центра" до "Парк Победы"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0070 = [[MWEdge alloc] init];
    edge0070.identifier = @"edge0070";
    edge0070.developmentName = @"Ребро: Деловой центр - Парк Победы";
    [self.edges addObject:(edge0070)];
    
    // Добавляем линию
    edge0070.line = line0013;
    
    // Добавляем вершину
    edge0070.startVertex = vertex0044;
    
    // Добавляем станцию "Деловой центр"
    MWStation *station0191 = [[MWStation alloc] init];
    station0191.identifier = @"station0191";
    [edge0070.elements addObject:station0191];
    
    station0191.nameOriginal = @"Деловой центр";
    station0191.nameEnglish = @"Delovoy Centr";
    station0191.mapLocation = CGPointMake(1002.5, 3418);
    station0191.geoLocation = CGPointMake(55.752415, 37.541699);
    
    MWDrawFillCircle *fillCircle0145 = [[MWDrawFillCircle alloc] init];
    fillCircle0145.center = station0191.mapLocation;
    fillCircle0145.radius = 31.5;
    fillCircle0145.fillColor = line0013.color;
    [station0191.drawPrimitives addObject:fillCircle0145];
    
    MWDrawFillCircle *fillCircle0146 = [[MWDrawFillCircle alloc] init];
    fillCircle0146.center = station0191.mapLocation;
    fillCircle0146.radius = 14;
    fillCircle0146.fillColor = [UIColor whiteColor];
    [station0191.drawPrimitives addObject:fillCircle0146];

    // Подложка
    MWDrawLine *drawLine0283 = [[MWDrawLine alloc] init];
    drawLine0283.startPoint = CGPointMake(880, 3493);
    drawLine0283.endPoint = CGPointMake(1000, 3493);
    drawLine0283.width = 80;
    drawLine0283.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0191.nameOriginalTextPrimitives addObject:drawLine0283];

    MWDrawTextLine *drawTextLine0298 = [[MWDrawTextLine alloc] init];
    drawTextLine0298.text = @"Деловой";
    drawTextLine0298.fontName = @"HelveticaNeue";
    drawTextLine0298.fontColor = [UIColor blackColor];
    drawTextLine0298.fontSize = 42;
    drawTextLine0298.origin = CGPointMake(814, 3443.5);
    drawTextLine0298.kernSpacing = 0.6;
    [station0191.nameOriginalTextPrimitives addObject:drawTextLine0298];

    MWDrawTextLine *drawTextLine0299 = [[MWDrawTextLine alloc] init];
    drawTextLine0299.text = @"центр";
    drawTextLine0299.fontName = @"HelveticaNeue";
    drawTextLine0299.fontColor = [UIColor blackColor];
    drawTextLine0299.fontSize = 42;
    drawTextLine0299.origin = CGPointMake(872, 3484);
    drawTextLine0299.kernSpacing = 0.6;
    [station0191.nameOriginalTextPrimitives addObject:drawTextLine0299];

    // Подложка
    MWDrawLine *drawLine0284 = [[MWDrawLine alloc] init];
    drawLine0284.startPoint = CGPointMake(865, 3549);
    drawLine0284.endPoint = CGPointMake(960, 3549);
    drawLine0284.width = 33;
    drawLine0284.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0191.nameOriginalTextPrimitives addObject:drawLine0284];

    MWDrawTextLine *drawTextLine0300 = [[MWDrawTextLine alloc] init];
    drawTextLine0300.text = @"Delovoy";
    drawTextLine0300.fontName = @"HelveticaNeue";
    drawTextLine0300.fontColor = stationNamesEnglishColor;
    drawTextLine0300.fontSize = 28;
    drawTextLine0300.kernSpacing = -0.2;
    drawTextLine0300.origin = CGPointMake(890, 3528.5);
    [station0191.nameEnglishTextPrimitives addObject:drawTextLine0300];

    MWDrawTextLine *drawTextLine0301 = [[MWDrawTextLine alloc] init];
    drawTextLine0301.text = @"Tsentr";
    drawTextLine0301.fontName = @"HelveticaNeue";
    drawTextLine0301.fontColor = stationNamesEnglishColor;
    drawTextLine0301.fontSize = 28;
    drawTextLine0301.kernSpacing = -0.0;
    drawTextLine0301.origin = CGPointMake(913, 3560);
    [station0191.nameEnglishTextPrimitives addObject:drawTextLine0301];

    // Добавляем перегон
    MWHaul *haul0180 = [[MWHaul alloc] init];
    haul0180.identifier = @"haul0180";
    haul0180.length = 2390;
    [edge0070.elements addObject:haul0180];
    
    MWDrawArc *drawArc0048 = [[MWDrawArc alloc] init];
    drawArc0048.center = CGPointMake(641, 3248);
    drawArc0048.startDegrees = 25;
    drawArc0048.endDegrees = 45;
    drawArc0048.radius = 400;
    drawArc0048.width = 21.5;
    drawArc0048.color = line0013.color;
    [haul0180.drawPrimitives addObject:drawArc0048];

    MWDrawLine *drawLine0285 = [[MWDrawLine alloc] init];
    drawLine0285.startPoint = CGPointMake(924.5, 3530.5);
    drawLine0285.endPoint = CGPointMake(618.5, 3836.5);
    drawLine0285.width = 21.5;
    drawLine0285.color = line0013.color;
    [haul0180.drawPrimitives addObject:drawLine0285];

    // Добавляем станцию "Парк Победы"
    MWStation *station0192 = [[MWStation alloc] init];
    station0192.identifier = @"station0192";
    [edge0070.elements addObject:station0192];
    
    station0192.nameOriginal = @"Парк Победы";
    station0192.nameEnglish = @"Park Pobedy";
    station0192.mapLocation = CGPointMake(618.5, 3836.5);
    station0192.geoLocation = CGPointMake(55.736227, 37.516832);
    
    MWDrawFillCircle *fillCircle0147 = [[MWDrawFillCircle alloc] init];
    fillCircle0147.center = station0192.mapLocation;
    fillCircle0147.radius = 31.5;
    fillCircle0147.fillColor = line0013.color;
    [station0192.drawPrimitives addObject:fillCircle0147];

    MWDrawFillCircle *fillCircle0148 = [[MWDrawFillCircle alloc] init];
    fillCircle0148.center = station0192.mapLocation;
    fillCircle0148.radius = 14;
    fillCircle0148.fillColor = [UIColor whiteColor];
    [station0192.drawPrimitives addObject:fillCircle0148];

    station0192.showNameOnMap = false;
    [station0192.nameOriginalTextPrimitives addObject:drawLine0108];
    [station0192.nameOriginalTextPrimitives addObject:drawTextLine0120];
    [station0192.nameOriginalTextPrimitives addObject:drawTextLine0121];
    [station0192.nameEnglishTextPrimitives addObject:drawTextLine0122];
    
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
    station0141.mapLocation = CGPointMake(2328, 6312);
    station0141.geoLocation = CGPointMake(55.569498, 37.576439);
    
    MWDrawFillCircle *fillCircle0149 = [[MWDrawFillCircle alloc] init];
    fillCircle0149.center = CGPointMake(2327.5, 6397.5);//(192, 1618.5);
    fillCircle0149.radius = 32;
    fillCircle0149.fillColor = line0009.color;
    [station0141.drawPrimitives addObject:fillCircle0149];
    
    MWDrawTextLine *drawTextLine0302 = [[MWDrawTextLine alloc] init];
    drawTextLine0302.text = @"9";
    drawTextLine0302.fontName = @"Georgia-Bold";
    drawTextLine0302.fontColor = [UIColor whiteColor];
    drawTextLine0302.fontSize = 56;
    drawTextLine0302.origin = CGPointMake(2311.5, 6356);
    [station0141.drawPrimitives addObject:drawTextLine0302];

    MWDrawFillCircle *fillCircle0150 = [[MWDrawFillCircle alloc] init];
    fillCircle0150.center = station0141.mapLocation;
    fillCircle0150.radius = 31.5;
    fillCircle0150.fillColor = line0009.color;
    [station0141.drawPrimitives addObject:fillCircle0150];
    
    MWDrawFillCircle *fillCircle0151 = [[MWDrawFillCircle alloc] init];
    fillCircle0151.center = station0141.mapLocation;
    fillCircle0151.radius = 14;
    fillCircle0151.fillColor = [UIColor whiteColor];
    [station0141.drawPrimitives addObject:fillCircle0151];

    MWDrawTextLine *drawTextLine0303 = [[MWDrawTextLine alloc] init];
    drawTextLine0303.text = @"Бульвар Дмитрия";
    drawTextLine0303.fontName = @"HelveticaNeue";
    drawTextLine0303.fontColor = [UIColor blackColor];
    drawTextLine0303.fontSize = 42;
    drawTextLine0303.origin = CGPointMake(2371, 6286);
    drawTextLine0303.kernSpacing = -0.1;
    [station0141.nameOriginalTextPrimitives addObject:drawTextLine0303];

    MWDrawTextLine *drawTextLine0304 = [[MWDrawTextLine alloc] init];
    drawTextLine0304.text = @"Донского";
    drawTextLine0304.fontName = @"HelveticaNeue";
    drawTextLine0304.fontColor = [UIColor blackColor];
    drawTextLine0304.fontSize = 42;
    drawTextLine0304.origin = CGPointMake(2371, 6326);
    drawTextLine0304.kernSpacing = 0.4;
    [station0141.nameOriginalTextPrimitives addObject:drawTextLine0304];

    MWDrawTextLine *drawTextLine0305 = [[MWDrawTextLine alloc] init];
    drawTextLine0305.text = station0141.nameEnglish;
    drawTextLine0305.fontName = @"HelveticaNeue";
    drawTextLine0305.fontColor = stationNamesEnglishColor;
    drawTextLine0305.fontSize = 28;
    drawTextLine0305.kernSpacing = -0.1;
    drawTextLine0305.origin = CGPointMake(2371, 6370);
    [station0141.nameEnglishTextPrimitives addObject:drawTextLine0305];

    // Добавляем перегон
    MWHaul *haul0134 = [[MWHaul alloc] init];
    haul0134.identifier = @"haul0134";
    haul0134.length = 1990;
    [edge0053.elements addObject:haul0134];
    
    MWDrawLine *drawLine0286 = [[MWDrawLine alloc] init];
    drawLine0286.startPoint = CGPointMake(2328, 6312);
    drawLine0286.endPoint = CGPointMake(2328, 6208);
    drawLine0286.width = 21.5;
    drawLine0286.color = line0009.color;
    [haul0134.drawPrimitives addObject:drawLine0286];

    // Добавляем станцию "Аннино"
    MWStation *station0142 = [[MWStation alloc] init];
    station0142.identifier = @"station0142";
    [edge0053.elements addObject:station0142];
    
    station0142.nameOriginal = @"Аннино";
    station0142.nameEnglish = @"Annino";
    station0142.mapLocation = CGPointMake(2328, 6208);
    station0142.geoLocation = CGPointMake(55.583643, 37.596827);
    
    MWDrawLine *drawLine0287 = [[MWDrawLine alloc] init];
    drawLine0287.startPoint = CGPointMake(2328, 6208);
    drawLine0287.endPoint = CGPointMake(2359, 6208);
    drawLine0287.width = 21.5;
    drawLine0287.color = line0009.color;
    [station0142.drawPrimitives addObject:drawLine0287];

    MWDrawTextLine *drawTextLine0306 = [[MWDrawTextLine alloc] init];
    drawTextLine0306.text = station0142.nameOriginal;
    drawTextLine0306.fontName = @"HelveticaNeue";
    drawTextLine0306.fontColor = [UIColor blackColor];
    drawTextLine0306.fontSize = 42;
    drawTextLine0306.origin = CGPointMake(2369, 6178.5);
    drawTextLine0306.kernSpacing = 0.7;
    [station0142.nameOriginalTextPrimitives addObject:drawTextLine0306];
    
    MWDrawTextLine *drawTextLine0307 = [[MWDrawTextLine alloc] init];
    drawTextLine0307.text = station0142.nameEnglish;
    drawTextLine0307.fontName = @"HelveticaNeue";
    drawTextLine0307.fontColor = stationNamesEnglishColor;
    drawTextLine0307.fontSize = 28;
    drawTextLine0307.kernSpacing = 0.2;
    drawTextLine0307.origin = CGPointMake(2369, 6223);
    [station0142.nameEnglishTextPrimitives addObject:drawTextLine0307];

    // Добавляем перегон
    MWHaul *haul0135 = [[MWHaul alloc] init];
    haul0135.identifier = @"haul0135";
    haul0135.length = 1440;
    [edge0053.elements addObject:haul0135];
    
    MWDrawLine *drawLine0288 = [[MWDrawLine alloc] init];
    drawLine0288.startPoint = CGPointMake(2328, 6208.5);
    drawLine0288.endPoint = CGPointMake(2328, 6061);
    drawLine0288.width = 21.5;
    drawLine0288.color = line0009.color;
    [haul0135.drawPrimitives addObject:drawLine0288];

    // Добавляем станцию "Улица Академика Янгеля"
    MWStation *station0143 = [[MWStation alloc] init];
    station0143.identifier = @"station0143";
    [edge0053.elements addObject:station0143];
    
    station0143.nameOriginal = @"Улица Академика Янгеля";
    station0143.nameEnglish = @"Ulitsa Akademika Yangelya";
    station0143.mapLocation = CGPointMake(2328, 6061);
    station0143.geoLocation = CGPointMake(55.595156, 37.601372);

    MWDrawLine *drawLine0289 = [[MWDrawLine alloc] init];
    drawLine0289.startPoint = CGPointMake(2328, 6061);
    drawLine0289.endPoint = CGPointMake(2359, 6061);
    drawLine0289.width = 21.5;
    drawLine0289.color = line0009.color;
    [station0143.drawPrimitives addObject:drawLine0289];

    MWDrawTextLine *drawTextLine0308 = [[MWDrawTextLine alloc] init];
    drawTextLine0308.text = @"Улица Академика";
    drawTextLine0308.fontName = @"HelveticaNeue";
    drawTextLine0308.fontColor = [UIColor blackColor];
    drawTextLine0308.fontSize = 42;
    drawTextLine0308.origin = CGPointMake(2369, 6031);
    drawTextLine0308.kernSpacing = 0.6;
    [station0143.nameOriginalTextPrimitives addObject:drawTextLine0308];

    MWDrawTextLine *drawTextLine0309 = [[MWDrawTextLine alloc] init];
    drawTextLine0309.text = @"Янгеля";
    drawTextLine0309.fontName = @"HelveticaNeue";
    drawTextLine0309.fontColor = [UIColor blackColor];
    drawTextLine0309.fontSize = 42;
    drawTextLine0309.origin = CGPointMake(2369, 6071);
    drawTextLine0309.kernSpacing = -0.2;
    [station0143.nameOriginalTextPrimitives addObject:drawTextLine0309];

    MWDrawTextLine *drawTextLine0310 = [[MWDrawTextLine alloc] init];
    drawTextLine0310.text = station0143.nameEnglish;
    drawTextLine0310.fontName = @"HelveticaNeue";
    drawTextLine0310.fontColor = stationNamesEnglishColor;
    drawTextLine0310.fontSize = 28;
    drawTextLine0310.kernSpacing = -0.1;
    drawTextLine0310.origin = CGPointMake(2367, 6116);
    [station0143.nameEnglishTextPrimitives addObject:drawTextLine0310];

    // Добавляем перегон
    MWHaul *haul0136 = [[MWHaul alloc] init];
    haul0136.identifier = @"haul0136";
    haul0136.length = 1810;
    [edge0053.elements addObject:haul0136];

    MWDrawLine *drawLine0290 = [[MWDrawLine alloc] init];
    drawLine0290.startPoint = CGPointMake(2328, 6061.5);
    drawLine0290.endPoint = CGPointMake(2328, 5952.5);
    drawLine0290.width = 21.5;
    drawLine0290.color = line0009.color;
    [haul0136.drawPrimitives addObject:drawLine0290];

    // Добавляем станцию "Пражская"
    MWStation *station0144 = [[MWStation alloc] init];
    station0144.identifier = @"station0144";
    [edge0053.elements addObject:station0144];
    
    station0144.nameOriginal = @"Пражская";
    station0144.nameEnglish = @"Prajskaya";
    station0144.mapLocation = CGPointMake(2328, 5952.5);
    station0144.geoLocation = CGPointMake(55.612322, 37.604173);

    MWDrawLine *drawLine0291 = [[MWDrawLine alloc] init];
    drawLine0291.startPoint = CGPointMake(2328, 5952.5);
    drawLine0291.endPoint = CGPointMake(2359, 5952.5);
    drawLine0291.width = 21.5;
    drawLine0291.color = line0009.color;
    [station0144.drawPrimitives addObject:drawLine0291];

    MWDrawTextLine *drawTextLine0311 = [[MWDrawTextLine alloc] init];
    drawTextLine0311.text = station0144.nameOriginal;
    drawTextLine0311.fontName = @"HelveticaNeue";
    drawTextLine0311.fontColor = [UIColor blackColor];
    drawTextLine0311.fontSize = 42;
    drawTextLine0311.origin = CGPointMake(2369, 5922.5);
    drawTextLine0311.kernSpacing = 0.1;
    [station0144.nameOriginalTextPrimitives addObject:drawTextLine0311];
    
    MWDrawTextLine *drawTextLine0312 = [[MWDrawTextLine alloc] init];
    drawTextLine0312.text = station0144.nameEnglish;
    drawTextLine0312.fontName = @"HelveticaNeue";
    drawTextLine0312.fontColor = stationNamesEnglishColor;
    drawTextLine0312.fontSize = 28;
    drawTextLine0312.kernSpacing = -0.3;
    drawTextLine0312.origin = CGPointMake(2370, 5968);
    [station0144.nameEnglishTextPrimitives addObject:drawTextLine0312];

    // Добавляем перегон
    MWHaul *haul0137 = [[MWHaul alloc] init];
    haul0137.identifier = @"haul0137";
    haul0137.length = 1240;
    [edge0053.elements addObject:haul0137];
    
    MWDrawLine *drawLine0292 = [[MWDrawLine alloc] init];
    drawLine0292.startPoint = CGPointMake(2328, 5953);
    drawLine0292.endPoint = CGPointMake(2328, 5845);
    drawLine0292.width = 21.5;
    drawLine0292.color = line0009.color;
    [haul0137.drawPrimitives addObject:drawLine0292];

    // Добавляем станцию "Южная"
    MWStation *station0145 = [[MWStation alloc] init];
    station0145.identifier = @"station0145";
    [edge0053.elements addObject:station0145];
    
    station0145.nameOriginal = @"Южная";
    station0145.nameEnglish = @"Yujnaya";
    station0145.mapLocation = CGPointMake(2328, 5845);
    station0145.geoLocation = CGPointMake(55.622450, 37.608709);

    MWDrawLine *drawLine0293 = [[MWDrawLine alloc] init];
    drawLine0293.startPoint = CGPointMake(2328, 5845);
    drawLine0293.endPoint = CGPointMake(2359, 5845);
    drawLine0293.width = 21.5;
    drawLine0293.color = line0009.color;
    [station0145.drawPrimitives addObject:drawLine0293];
    
    MWDrawTextLine *drawTextLine0313 = [[MWDrawTextLine alloc] init];
    drawTextLine0313.text = station0145.nameOriginal;
    drawTextLine0313.fontName = @"HelveticaNeue";
    drawTextLine0313.fontColor = [UIColor blackColor];
    drawTextLine0313.fontSize = 42;
    drawTextLine0313.origin = CGPointMake(2369, 5815);
    drawTextLine0313.kernSpacing = 0.1;
    [station0145.nameOriginalTextPrimitives addObject:drawTextLine0313];
    
    MWDrawTextLine *drawTextLine0314 = [[MWDrawTextLine alloc] init];
    drawTextLine0314.text = station0145.nameEnglish;
    drawTextLine0314.fontName = @"HelveticaNeue";
    drawTextLine0314.fontColor = stationNamesEnglishColor;
    drawTextLine0314.fontSize = 28;
    drawTextLine0314.kernSpacing = -0.3;
    drawTextLine0314.origin = CGPointMake(2367, 5860);
    [station0145.nameEnglishTextPrimitives addObject:drawTextLine0314];

    // Добавляем перегон
    MWHaul *haul0138 = [[MWHaul alloc] init];
    haul0138.identifier = @"haul0138";
    haul0138.length = 2070;
    [edge0053.elements addObject:haul0138];
    
    MWDrawLine *drawLine0294 = [[MWDrawLine alloc] init];
    drawLine0294.startPoint = CGPointMake(2328, 5845.5);
    drawLine0294.endPoint = CGPointMake(2328, 5737.5);
    drawLine0294.width = 21.5;
    drawLine0294.color = line0009.color;
    [haul0138.drawPrimitives addObject:drawLine0294];

    // Добавляем станцию "Чертановская"
    MWStation *station0146 = [[MWStation alloc] init];
    station0146.identifier = @"station0146";
    [edge0053.elements addObject:station0146];
    
    station0146.nameOriginal = @"Чертановская";
    station0146.nameEnglish = @"Chertanovskaya";
    station0146.mapLocation = CGPointMake(2328, 5737.5);
    station0146.geoLocation = CGPointMake(55.640834, 37.606229);
    
    MWDrawLine *drawLine0295 = [[MWDrawLine alloc] init];
    drawLine0295.startPoint = CGPointMake(2328, 5737.5);
    drawLine0295.endPoint = CGPointMake(2359, 5737.5);
    drawLine0295.width = 21.5;
    drawLine0295.color = line0009.color;
    [station0146.drawPrimitives addObject:drawLine0295];
    
    MWDrawTextLine *drawTextLine0315 = [[MWDrawTextLine alloc] init];
    drawTextLine0315.text = station0146.nameOriginal;
    drawTextLine0315.fontName = @"HelveticaNeue";
    drawTextLine0315.fontColor = [UIColor blackColor];
    drawTextLine0315.fontSize = 42;
    drawTextLine0315.origin = CGPointMake(2370, 5708);
    drawTextLine0315.kernSpacing = 0.3;
    [station0146.nameOriginalTextPrimitives addObject:drawTextLine0315];
    
    MWDrawTextLine *drawTextLine0316 = [[MWDrawTextLine alloc] init];
    drawTextLine0316.text = station0146.nameEnglish;
    drawTextLine0316.fontName = @"HelveticaNeue";
    drawTextLine0316.fontColor = stationNamesEnglishColor;
    drawTextLine0316.fontSize = 28;
    drawTextLine0316.kernSpacing = -0.3;
    drawTextLine0316.origin = CGPointMake(2367, 5753);
    [station0146.nameEnglishTextPrimitives addObject:drawTextLine0316];

    // Добавляем перегон
    MWHaul *haul0139 = [[MWHaul alloc] init];
    haul0139.identifier = @"haul0139";
    haul0139.length = 1330;
    [edge0053.elements addObject:haul0139];
    
    MWDrawLine *drawLine0296 = [[MWDrawLine alloc] init];
    drawLine0296.startPoint = CGPointMake(2328, 5738);
    drawLine0296.endPoint = CGPointMake(2328, 5589.5);
    drawLine0296.width = 21.5;
    drawLine0296.color = line0009.color;
    [haul0139.drawPrimitives addObject:drawLine0296];

    // Добавляем станцию "Севастопольская"
    MWStation *station0147 = [[MWStation alloc] init];
    station0147.identifier = @"station0147";
    [edge0053.elements addObject:station0147];
    
    station0147.nameOriginal = @"Севастопольская";
    station0147.nameEnglish = @"Sevastopolskaya";
    station0147.mapLocation = CGPointMake(2328, 5589.5);
    station0147.geoLocation = CGPointMake(55.651317, 37.598340);
    
    MWDrawFillCircle *fillCircle0152 = [[MWDrawFillCircle alloc] init];
    fillCircle0152.center = station0147.mapLocation;
    fillCircle0152.radius = 31.5;
    fillCircle0152.fillColor = line0009.color;
    [station0147.drawPrimitives addObject:fillCircle0152];
    
    MWDrawFillCircle *fillCircle0153 = [[MWDrawFillCircle alloc] init];
    fillCircle0153.center = station0147.mapLocation;
    fillCircle0153.radius = 14;
    fillCircle0153.fillColor = [UIColor whiteColor];
    [station0147.drawPrimitives addObject:fillCircle0153];

    MWDrawTextLine *drawTextLine0317 = [[MWDrawTextLine alloc] init];
    drawTextLine0317.text = station0147.nameOriginal;
    drawTextLine0317.fontName = @"HelveticaNeue";
    drawTextLine0317.fontColor = [UIColor blackColor];
    drawTextLine0317.fontSize = 42;
    drawTextLine0317.origin = CGPointMake(2356, 5605);
    drawTextLine0317.kernSpacing = -0.4;
    [station0147.nameOriginalTextPrimitives addObject:drawTextLine0317];

    MWDrawTextLine *drawTextLine0318 = [[MWDrawTextLine alloc] init];
    drawTextLine0318.text = station0147.nameEnglish;
    drawTextLine0318.fontName = @"HelveticaNeue";
    drawTextLine0318.fontColor = stationNamesEnglishColor;
    drawTextLine0318.fontSize = 28;
    drawTextLine0318.kernSpacing = -0.7;
    drawTextLine0318.origin = CGPointMake(2354, 5649.5);
    [station0147.nameEnglishTextPrimitives addObject:drawTextLine0318];

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
    
    MWDrawLine *drawLine0297 = [[MWDrawLine alloc] init];
    drawLine0297.startPoint = CGPointMake(2328, 5590);
    drawLine0297.endPoint = CGPointMake(2328, 5294);
    drawLine0297.width = 21.5;
    drawLine0297.color = line0009.color;
    [haul0140.drawPrimitives addObject:drawLine0297];

    // Добавляем станцию "Нахимовский проспект"
    MWStation *station0148 = [[MWStation alloc] init];
    station0148.identifier = @"station0148";
    [edge0054.elements addObject:station0148];
    
    station0148.nameOriginal = @"Нахимовский проспект";
    station0148.nameEnglish = @"Nakhimovsky Prospekt";
    station0148.mapLocation = CGPointMake(2328, 5294);
    station0148.geoLocation = CGPointMake(55.662595, 37.605322);
    
    MWDrawLine *drawLine0298 = [[MWDrawLine alloc] init];
    drawLine0298.startPoint = CGPointMake(2328, 5294);
    drawLine0298.endPoint = CGPointMake(2359, 5294);
    drawLine0298.width = 21.5;
    drawLine0298.color = line0009.color;
    [station0148.drawPrimitives addObject:drawLine0298];

    MWDrawTextLine *drawTextLine0319 = [[MWDrawTextLine alloc] init];
    drawTextLine0319.text = @"Нахимовский";
    drawTextLine0319.fontName = @"HelveticaNeue";
    drawTextLine0319.fontColor = [UIColor blackColor];
    drawTextLine0319.fontSize = 42;
    drawTextLine0319.origin = CGPointMake(2369, 5264.5);
    drawTextLine0319.kernSpacing = 0.8;
    [station0148.nameOriginalTextPrimitives addObject:drawTextLine0319];

    MWDrawTextLine *drawTextLine0320 = [[MWDrawTextLine alloc] init];
    drawTextLine0320.text = @"проспект";
    drawTextLine0320.fontName = @"HelveticaNeue";
    drawTextLine0320.fontColor = [UIColor blackColor];
    drawTextLine0320.fontSize = 42;
    drawTextLine0320.origin = CGPointMake(2369, 5305);
    drawTextLine0320.kernSpacing = 0.6;
    [station0148.nameOriginalTextPrimitives addObject:drawTextLine0320];

    MWDrawTextLine *drawTextLine0321 = [[MWDrawTextLine alloc] init];
    drawTextLine0321.text = station0148.nameEnglish;
    drawTextLine0321.fontName = @"HelveticaNeue";
    drawTextLine0321.fontColor = stationNamesEnglishColor;
    drawTextLine0321.fontSize = 28;
    drawTextLine0321.kernSpacing = -0.1;
    drawTextLine0321.origin = CGPointMake(2370, 5349.5);
    [station0148.nameEnglishTextPrimitives addObject:drawTextLine0321];

    // Добавляем перегон
    MWHaul *haul0141 = [[MWHaul alloc] init];
    haul0141.identifier = @"haul0141";
    haul0141.length = 1220;
    [edge0054.elements addObject:haul0141];
    
    MWDrawLine *drawLine0299 = [[MWDrawLine alloc] init];
    drawLine0299.startPoint = CGPointMake(2328, 5294.5);
    drawLine0299.endPoint = CGPointMake(2328, 5200);
    drawLine0299.width = 21.5;
    drawLine0299.color = line0009.color;
    [haul0141.drawPrimitives addObject:drawLine0299];

    // Добавляем станцию "Нагорная"
    MWStation *station0149 = [[MWStation alloc] init];
    station0149.identifier = @"station0149";
    [edge0054.elements addObject:station0149];
    
    station0149.nameOriginal = @"Нагорная";
    station0149.nameEnglish = @"Nagornaya";
    station0149.mapLocation = CGPointMake(2328, 5200);
    station0149.geoLocation = CGPointMake(55.672997, 37.610834);
    
    MWDrawLine *drawLine0300 = [[MWDrawLine alloc] init];
    drawLine0300.startPoint = CGPointMake(2328, 5200);
    drawLine0300.endPoint = CGPointMake(2359, 5200);
    drawLine0300.width = 21.5;
    drawLine0300.color = line0009.color;
    [station0149.drawPrimitives addObject:drawLine0300];

    MWDrawTextLine *drawTextLine0322 = [[MWDrawTextLine alloc] init];
    drawTextLine0322.text = station0149.nameOriginal;
    drawTextLine0322.fontName = @"HelveticaNeue";
    drawTextLine0322.fontColor = [UIColor blackColor];
    drawTextLine0322.fontSize = 42;
    drawTextLine0322.origin = CGPointMake(2369, 5170);
    drawTextLine0322.kernSpacing = 0.6;
    [station0149.nameOriginalTextPrimitives addObject:drawTextLine0322];

    MWDrawTextLine *drawTextLine0323 = [[MWDrawTextLine alloc] init];
    drawTextLine0323.text = station0149.nameEnglish;
    drawTextLine0323.fontName = @"HelveticaNeue";
    drawTextLine0323.fontColor = stationNamesEnglishColor;
    drawTextLine0323.fontSize = 28;
    drawTextLine0323.kernSpacing = -0.3;
    drawTextLine0323.origin = CGPointMake(2370, 5215);
    [station0149.nameEnglishTextPrimitives addObject:drawTextLine0323];

    // Добавляем перегон
    MWHaul *haul0142 = [[MWHaul alloc] init];
    haul0142.identifier = @"haul0142";
    haul0142.length = 1420;
    [edge0054.elements addObject:haul0142];
    
    MWDrawLine *drawLine0301 = [[MWDrawLine alloc] init];
    drawLine0301.startPoint = CGPointMake(2328, 5200.5);
    drawLine0301.endPoint = CGPointMake(2328, 5105);
    drawLine0301.width = 21.5;
    drawLine0301.color = line0009.color;
    [haul0142.drawPrimitives addObject:drawLine0301];

    // Добавляем станцию "Нагатинская"
    MWStation *station0150 = [[MWStation alloc] init];
    station0150.identifier = @"station0150";
    [edge0054.elements addObject:station0150];
    
    station0150.nameOriginal = @"Нагатинская";
    station0150.nameEnglish = @"Nagatinskaya";
    station0150.mapLocation = CGPointMake(2328, 5105);
    station0150.geoLocation = CGPointMake(55.683003, 37.621756);
    
    MWDrawLine *drawLine0302 = [[MWDrawLine alloc] init];
    drawLine0302.startPoint = CGPointMake(2328, 5105);
    drawLine0302.endPoint = CGPointMake(2359, 5105);
    drawLine0302.width = 21.5;
    drawLine0302.color = line0009.color;
    [station0150.drawPrimitives addObject:drawLine0302];

    MWDrawTextLine *drawTextLine0324 = [[MWDrawTextLine alloc] init];
    drawTextLine0324.text = station0150.nameOriginal;
    drawTextLine0324.fontName = @"HelveticaNeue";
    drawTextLine0324.fontColor = [UIColor blackColor];
    drawTextLine0324.fontSize = 42;
    drawTextLine0324.origin = CGPointMake(2369, 5075.5);
    drawTextLine0324.kernSpacing = 0.0;
    [station0150.nameOriginalTextPrimitives addObject:drawTextLine0324];

    MWDrawTextLine *drawTextLine0325 = [[MWDrawTextLine alloc] init];
    drawTextLine0325.text = station0150.nameEnglish;
    drawTextLine0325.fontName = @"HelveticaNeue";
    drawTextLine0325.fontColor = stationNamesEnglishColor;
    drawTextLine0325.fontSize = 28;
    drawTextLine0325.kernSpacing = -0.2;
    drawTextLine0325.origin = CGPointMake(2370, 5120);
    [station0150.nameEnglishTextPrimitives addObject:drawTextLine0325];

    // Добавляем перегон
    MWHaul *haul0143 = [[MWHaul alloc] init];
    haul0143.identifier = @"haul0143";
    haul0143.length = 2820;
    [edge0054.elements addObject:haul0143];
    
    MWDrawLine *drawLine0303 = [[MWDrawLine alloc] init];
    drawLine0303.startPoint = CGPointMake(2328, 5105.5);
    drawLine0303.endPoint = CGPointMake(2328, 4625.5);
    drawLine0303.width = 21.5;
    drawLine0303.color = line0009.color;
    [haul0143.drawPrimitives addObject:drawLine0303];

    // Добавляем станцию "Тульская"
    MWStation *station0151 = [[MWStation alloc] init];
    station0151.identifier = @"station0151";
    [edge0054.elements addObject:station0151];
    
    station0151.nameOriginal = @"Тульская";
    station0151.nameEnglish = @"Tulskaya";
    station0151.mapLocation = CGPointMake(2328, 4625.5);
    station0151.geoLocation = CGPointMake(55.708677, 37.622425);
    
    MWDrawLine *drawLine0304 = [[MWDrawLine alloc] init];
    drawLine0304.startPoint = CGPointMake(2328, 4625.5);
    drawLine0304.endPoint = CGPointMake(2359, 4625.5);
    drawLine0304.width = 21.5;
    drawLine0304.color = line0009.color;
    [station0151.drawPrimitives addObject:drawLine0304];
    
    MWDrawTextLine *drawTextLine0326 = [[MWDrawTextLine alloc] init];
    drawTextLine0326.text = station0151.nameOriginal;
    drawTextLine0326.fontName = @"HelveticaNeue";
    drawTextLine0326.fontColor = [UIColor blackColor];
    drawTextLine0326.fontSize = 42;
    drawTextLine0326.origin = CGPointMake(2367, 4599);
    drawTextLine0326.kernSpacing = -0.4;
    [station0151.nameOriginalTextPrimitives addObject:drawTextLine0326];
    
    MWDrawTextLine *drawTextLine0327 = [[MWDrawTextLine alloc] init];
    drawTextLine0327.text = station0151.nameEnglish;
    drawTextLine0327.fontName = @"HelveticaNeue";
    drawTextLine0327.fontColor = stationNamesEnglishColor;
    drawTextLine0327.fontSize = 28;
    drawTextLine0327.kernSpacing = -0.5;
    drawTextLine0327.origin = CGPointMake(2369, 4643);
    [station0151.nameEnglishTextPrimitives addObject:drawTextLine0327];

    // Добавляем перегон
    MWHaul *haul0144 = [[MWHaul alloc] init];
    haul0144.identifier = @"haul0144";
    haul0144.length = 2100;
    [edge0054.elements addObject:haul0144];
    
    MWDrawLine *drawLine0305 = [[MWDrawLine alloc] init];
    drawLine0305.startPoint = CGPointMake(2328, 4626);
    drawLine0305.endPoint = CGPointMake(2328, 4234.5);
    drawLine0305.width = 21.5;
    drawLine0305.color = line0009.color;
    [haul0144.drawPrimitives addObject:drawLine0305];

    // Добавляем станцию "Серпуховская"
    MWStation *station0152 = [[MWStation alloc] init];
    station0152.identifier = @"station0152";
    [edge0054.elements addObject:station0152];
    
    station0152.nameOriginal = @"Серпуховская";
    station0152.nameEnglish = @"Serpukhovskaya";
    station0152.mapLocation = CGPointMake(2328, 4234.5);
    station0152.geoLocation = CGPointMake(55.726800, 37.625285);
    
    MWDrawFillCircle *fillCircle0154 = [[MWDrawFillCircle alloc] init];
    fillCircle0154.center = station0152.mapLocation;
    fillCircle0154.radius = 31.5;
    fillCircle0154.fillColor = line0009.color;
    [station0152.drawPrimitives addObject:fillCircle0154];
    
    MWDrawFillCircle *fillCircle0155 = [[MWDrawFillCircle alloc] init];
    fillCircle0155.center = station0152.mapLocation;
    fillCircle0155.radius = 14;
    fillCircle0155.fillColor = [UIColor whiteColor];
    [station0152.drawPrimitives addObject:fillCircle0155];

    MWDrawTextLine *drawTextLine0328 = [[MWDrawTextLine alloc] init];
    drawTextLine0328.text = station0152.nameOriginal;
    drawTextLine0328.fontName = @"HelveticaNeue";
    drawTextLine0328.fontColor = [UIColor blackColor];
    drawTextLine0328.fontSize = 42;
    drawTextLine0328.origin = CGPointMake(2354, 4251);
    drawTextLine0328.kernSpacing = 0.1;
    [station0152.nameOriginalTextPrimitives addObject:drawTextLine0328];
    
    MWDrawTextLine *drawTextLine0329 = [[MWDrawTextLine alloc] init];
    drawTextLine0329.text = station0152.nameEnglish;
    drawTextLine0329.fontName = @"HelveticaNeue";
    drawTextLine0329.fontColor = stationNamesEnglishColor;
    drawTextLine0329.fontSize = 28;
    drawTextLine0329.kernSpacing = -0.3;
    drawTextLine0329.origin = CGPointMake(2355, 4296);
    [station0152.nameEnglishTextPrimitives addObject:drawTextLine0329];

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
    
    MWDrawLine *drawLine0306 = [[MWDrawLine alloc] init];
    drawLine0306.startPoint = CGPointMake(2328, 4235);
    drawLine0306.endPoint = CGPointMake(2328, 4099);
    drawLine0306.width = 21.5;
    drawLine0306.color = line0009.color;
    [haul0145.drawPrimitives addObject:drawLine0306];
    
    // Добавляем станцию "Полянка"
    MWStation *station0153 = [[MWStation alloc] init];
    station0153.identifier = @"station0153";
    [edge0055.elements addObject:station0153];
    
    station0153.nameOriginal = @"Полянка";
    station0153.nameEnglish = @"Polyanka";
    station0153.mapLocation = CGPointMake(2328, 4099);
    station0153.geoLocation = CGPointMake(55.736801, 37.618577);
    
    MWDrawLine *drawLine0307 = [[MWDrawLine alloc] init];
    drawLine0307.startPoint = CGPointMake(2328, 4099);
    drawLine0307.endPoint = CGPointMake(2359, 4099);
    drawLine0307.width = 21.5;
    drawLine0307.color = line0009.color;
    [station0153.drawPrimitives addObject:drawLine0307];
    
    MWDrawTextLine *drawTextLine0330 = [[MWDrawTextLine alloc] init];
    drawTextLine0330.text = station0153.nameOriginal;
    drawTextLine0330.fontName = @"HelveticaNeue";
    drawTextLine0330.fontColor = [UIColor blackColor];
    drawTextLine0330.fontSize = 42;
    drawTextLine0330.origin = CGPointMake(2369, 4069.5);
    drawTextLine0330.kernSpacing = 0.4;
    [station0153.nameOriginalTextPrimitives addObject:drawTextLine0330];
    
    MWDrawTextLine *drawTextLine0331 = [[MWDrawTextLine alloc] init];
    drawTextLine0331.text = station0153.nameEnglish;
    drawTextLine0331.fontName = @"HelveticaNeue";
    drawTextLine0331.fontColor = stationNamesEnglishColor;
    drawTextLine0331.fontSize = 28;
    drawTextLine0331.kernSpacing = -0.4;
    drawTextLine0331.origin = CGPointMake(2371, 4114.5);
    [station0153.nameEnglishTextPrimitives addObject:drawTextLine0331];

    // Добавляем перегон
    MWHaul *haul0146 = [[MWHaul alloc] init];
    haul0146.identifier = @"haul0146";
    haul0146.length = 1660;
    [edge0055.elements addObject:haul0146];
    
    MWDrawLine *drawLine0308 = [[MWDrawLine alloc] init];
    drawLine0308.startPoint = CGPointMake(2328, 4099.5);
    drawLine0308.endPoint = CGPointMake(2328, 3947);
    drawLine0308.width = 21.5;
    drawLine0308.color = line0009.color;
    [haul0146.drawPrimitives addObject:drawLine0308];

    MWDrawArc *drawArc0049 = [[MWDrawArc alloc] init];
    drawArc0049.center = CGPointMake(2178, 3947.5);
    drawArc0049.startDegrees = 315;
    drawArc0049.endDegrees = 0;
    drawArc0049.radius = 150;
    drawArc0049.width = 21.5;
    drawArc0049.color = line0009.color;
    [haul0146.drawPrimitives addObject:drawArc0049];

    MWDrawLine *drawLine0309 = [[MWDrawLine alloc] init];
    drawLine0309.startPoint = CGPointMake(2284.5, 3842);
    drawLine0309.endPoint = CGPointMake(2065, 3622.5);
    drawLine0309.width = 21.5;
    drawLine0309.color = line0009.color;
    [haul0146.drawPrimitives addObject:drawLine0309];

    // Добавляем станцию "Боровицкая"
    MWStation *station0154 = [[MWStation alloc] init];
    station0154.identifier = @"station0154";
    [edge0055.elements addObject:station0154];
    
    station0154.nameOriginal = @"Боровицкая";
    station0154.nameEnglish = @"Borovitskaya";
    station0154.mapLocation = CGPointMake(2065, 3622.5);
    station0154.geoLocation = CGPointMake(55.750509, 37.609153);
    
    MWDrawFillCircle *fillCircle0156 = [[MWDrawFillCircle alloc] init];
    fillCircle0156.center = station0154.mapLocation;
    fillCircle0156.radius = 31.5;
    fillCircle0156.fillColor = line0009.color;
    [station0154.drawPrimitives addObject:fillCircle0156];
    
    MWDrawFillCircle *fillCircle0157 = [[MWDrawFillCircle alloc] init];
    fillCircle0157.center = station0154.mapLocation;
    fillCircle0157.radius = 14;
    fillCircle0157.fillColor = [UIColor whiteColor];
    [station0154.drawPrimitives addObject:fillCircle0157];

    MWDrawTextLine *drawTextLine0332 = [[MWDrawTextLine alloc] init];
    drawTextLine0332.text = station0154.nameOriginal;
    drawTextLine0332.fontName = @"HelveticaNeue";
    drawTextLine0332.fontColor = [UIColor blackColor];
    drawTextLine0332.fontSize = 42;
    drawTextLine0332.origin = CGPointMake(1800, 3635);
    drawTextLine0332.kernSpacing = 0.3;
    [station0154.nameOriginalTextPrimitives addObject:drawTextLine0332];

    MWDrawTextLine *drawTextLine0333 = [[MWDrawTextLine alloc] init];
    drawTextLine0333.text = station0154.nameEnglish;
    drawTextLine0333.fontName = @"HelveticaNeue";
    drawTextLine0333.fontColor = stationNamesEnglishColor;
    drawTextLine0333.fontSize = 28;
    drawTextLine0333.kernSpacing = -0.3;
    drawTextLine0333.origin = CGPointMake(1880, 3680);
    [station0154.nameEnglishTextPrimitives addObject:drawTextLine0333];

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
    
    MWDrawArc *drawArc0050 = [[MWDrawArc alloc] init];
    drawArc0050.center = CGPointMake(2184.5, 3531.5);
    drawArc0050.startDegrees = 142;
    drawArc0050.endDegrees = 180;
    drawArc0050.radius = 150;
    drawArc0050.width = 21.5;
    drawArc0050.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawArc0050];

    MWDrawLine *drawLine0310 = [[MWDrawLine alloc] init];
    drawLine0310.startPoint = CGPointMake(2034.5, 3532);
    drawLine0310.endPoint = CGPointMake(2034.5, 3325);
    drawLine0310.width = 21.5;
    drawLine0310.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawLine0310];

    MWDrawArc *drawArc0051 = [[MWDrawArc alloc] init];
    drawArc0051.center = CGPointMake(2184.5, 3325.5);
    drawArc0051.startDegrees = 180;
    drawArc0051.endDegrees = 225;
    drawArc0051.radius = 150;
    drawArc0051.width = 21.5;
    drawArc0051.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawArc0051];

    MWDrawLine *drawLine0311 = [[MWDrawLine alloc] init];
    drawLine0311.startPoint = CGPointMake(2078, 3219.5);
    drawLine0311.endPoint = CGPointMake(2211, 3086.5);
    drawLine0311.width = 21.5;
    drawLine0311.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawLine0311];

    // Добавляем станцию "Чеховская"
    MWStation *station0155 = [[MWStation alloc] init];
    station0155.identifier = @"station0155";
    [edge0056.elements addObject:station0155];
    
    station0155.nameOriginal = @"Чеховская";
    station0155.nameEnglish = @"Chekhovskaya";
    station0155.mapLocation = CGPointMake(2211, 3086.5);
    station0155.geoLocation = CGPointMake(55.765892, 37.608306);
    
    MWDrawFillCircle *fillCircle0158 = [[MWDrawFillCircle alloc] init];
    fillCircle0158.center = station0155.mapLocation;
    fillCircle0158.radius = 31.5;
    fillCircle0158.fillColor = line0009.color;
    [station0155.drawPrimitives addObject:fillCircle0158];
    
    MWDrawFillCircle *fillCircle0159 = [[MWDrawFillCircle alloc] init];
    fillCircle0159.center = station0155.mapLocation;
    fillCircle0159.radius = 14;
    fillCircle0159.fillColor = [UIColor whiteColor];
    [station0155.drawPrimitives addObject:fillCircle0159];

    MWDrawTextLine *drawTextLine0334 = [[MWDrawTextLine alloc] init];
    drawTextLine0334.text = station0155.nameOriginal;
    drawTextLine0334.fontName = @"HelveticaNeue";
    drawTextLine0334.fontColor = [UIColor blackColor];
    drawTextLine0334.fontSize = 42;
    drawTextLine0334.origin = CGPointMake(2245, 3093);
    drawTextLine0334.kernSpacing = 0.3;
    [station0155.nameOriginalTextPrimitives addObject:drawTextLine0334];
    
    MWDrawTextLine *drawTextLine0335 = [[MWDrawTextLine alloc] init];
    drawTextLine0335.text = station0155.nameEnglish;
    drawTextLine0335.fontName = @"HelveticaNeue";
    drawTextLine0335.fontColor = stationNamesEnglishColor;
    drawTextLine0335.fontSize = 28;
    drawTextLine0335.kernSpacing = -0.6;
    drawTextLine0335.origin = CGPointMake(2245, 3138);
    [station0155.nameEnglishTextPrimitives addObject:drawTextLine0335];

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
    
    MWDrawLine *drawLine0312 = [[MWDrawLine alloc] init];
    drawLine0312.startPoint = CGPointMake(2210.5, 3087);
    drawLine0312.endPoint = CGPointMake(2369.5, 2928);
    drawLine0312.width = 21.5;
    drawLine0312.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawLine0312];
    
    MWDrawArc *drawArc0052 = [[MWDrawArc alloc] init];
    drawArc0052.center = CGPointMake(2263, 2822.5);
    drawArc0052.startDegrees = 0;
    drawArc0052.endDegrees = 45;
    drawArc0052.radius = 150;
    drawArc0052.width = 21.5;
    drawArc0052.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawArc0052];

    MWDrawLine *drawLine0313 = [[MWDrawLine alloc] init];
    drawLine0313.startPoint = CGPointMake(2413, 2823);
    drawLine0313.endPoint = CGPointMake(2413, 2715.5);
    drawLine0313.width = 21.5;
    drawLine0313.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawLine0313];

    MWDrawArc *drawArc0053 = [[MWDrawArc alloc] init];
    drawArc0053.center = CGPointMake(2263, 2716);
    drawArc0053.startDegrees = 319;
    drawArc0053.endDegrees = 0;
    drawArc0053.radius = 150;
    drawArc0053.width = 21.5;
    drawArc0053.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawArc0053];

    // Добавляем станцию "Цветной бульвар"
    MWStation *station0156 = [[MWStation alloc] init];
    station0156.identifier = @"station0156";
    [edge0057.elements addObject:station0156];
    
    station0156.nameOriginal = @"Цветной бульвар";
    station0156.nameEnglish = @"Tsvetnoy Bulvar";
    station0156.mapLocation = CGPointMake(2376.5, 2619);
    station0156.geoLocation = CGPointMake(55.771680, 37.620683);
    
    MWDrawFillCircle *fillCircle0160 = [[MWDrawFillCircle alloc] init];
    fillCircle0160.center = station0156.mapLocation;
    fillCircle0160.radius = 31.5;
    fillCircle0160.fillColor = line0009.color;
    [station0156.drawPrimitives addObject:fillCircle0160];
    
    MWDrawFillCircle *fillCircle0161 = [[MWDrawFillCircle alloc] init];
    fillCircle0161.center = station0156.mapLocation;
    fillCircle0161.radius = 14;
    fillCircle0161.fillColor = [UIColor whiteColor];
    [station0156.drawPrimitives addObject:fillCircle0161];

    MWDrawTextLine *drawTextLine0336 = [[MWDrawTextLine alloc] init];
    drawTextLine0336.text = @"Цветной";
    drawTextLine0336.fontName = @"HelveticaNeue";
    drawTextLine0336.fontColor = [UIColor blackColor];
    drawTextLine0336.fontSize = 42;
    drawTextLine0336.origin = CGPointMake(2173, 2625);
    drawTextLine0336.kernSpacing = 0.8;
    [station0156.nameOriginalTextPrimitives addObject:drawTextLine0336];

    MWDrawTextLine *drawTextLine0337 = [[MWDrawTextLine alloc] init];
    drawTextLine0337.text = @"бульвар";
    drawTextLine0337.fontName = @"HelveticaNeue";
    drawTextLine0337.fontColor = [UIColor blackColor];
    drawTextLine0337.fontSize = 42;
    drawTextLine0337.origin = CGPointMake(2183, 2665);
    drawTextLine0337.kernSpacing = 0.0;
    [station0156.nameOriginalTextPrimitives addObject:drawTextLine0337];

    MWDrawTextLine *drawTextLine0338 = [[MWDrawTextLine alloc] init];
    drawTextLine0338.text = @"Tsvetnoy";
    drawTextLine0338.fontName = @"HelveticaNeue";
    drawTextLine0338.fontColor = stationNamesEnglishColor;
    drawTextLine0338.fontSize = 28;
    drawTextLine0338.kernSpacing = -0.4;
    drawTextLine0338.origin = CGPointMake(2237, 2709);
    [station0156.nameEnglishTextPrimitives addObject:drawTextLine0338];

    MWDrawTextLine *drawTextLine0339 = [[MWDrawTextLine alloc] init];
    drawTextLine0339.text = @"Bulvar";
    drawTextLine0339.fontName = @"HelveticaNeue";
    drawTextLine0339.fontColor = stationNamesEnglishColor;
    drawTextLine0339.fontSize = 28;
    drawTextLine0339.kernSpacing = -0.4;
    drawTextLine0339.origin = CGPointMake(2263, 2741);
    [station0156.nameEnglishTextPrimitives addObject:drawTextLine0339];

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
    
    MWDrawLine *drawLine0314 = [[MWDrawLine alloc] init];
    drawLine0314.startPoint = CGPointMake(2377, 2619.5);
    drawLine0314.endPoint = CGPointMake(2063.5, 2303);
    drawLine0314.width = 21.5;
    drawLine0314.color = line0009.color;
    [haul0149.drawPrimitives addObject:drawLine0314];

    // Добавляем станцию "Менделеевская"
    MWStation *station0157 = [[MWStation alloc] init];
    station0157.identifier = @"station0157";
    [edge0058.elements addObject:station0157];
    
    station0157.nameOriginal = @"Менделеевская";
    station0157.nameEnglish = @"Mendeleyevskaya";
    station0157.mapLocation = CGPointMake(2063.5, 2303);
    station0157.geoLocation = CGPointMake(55.781803, 37.599058);
    
    MWDrawFillCircle *fillCircle0162 = [[MWDrawFillCircle alloc] init];
    fillCircle0162.center = station0157.mapLocation;
    fillCircle0162.radius = 31.5;
    fillCircle0162.fillColor = line0009.color;
    [station0157.drawPrimitives addObject:fillCircle0162];
    
    MWDrawFillCircle *fillCircle0163 = [[MWDrawFillCircle alloc] init];
    fillCircle0163.center = station0157.mapLocation;
    fillCircle0163.radius = 14;
    fillCircle0163.fillColor = [UIColor whiteColor];
    [station0157.drawPrimitives addObject:fillCircle0163];

    MWDrawTextLine *drawTextLine0340 = [[MWDrawTextLine alloc] init];
    drawTextLine0340.text = station0157.nameOriginal;
    drawTextLine0340.fontName = @"HelveticaNeue";
    drawTextLine0340.fontColor = [UIColor blackColor];
    drawTextLine0340.fontSize = 42;
    drawTextLine0340.origin = CGPointMake(2042, 2215);
    drawTextLine0340.kernSpacing = 0.8;
    [station0157.nameOriginalTextPrimitives addObject:drawTextLine0340];

    MWDrawTextLine *drawTextLine0341 = [[MWDrawTextLine alloc] init];
    drawTextLine0341.text = station0157.nameEnglish;
    drawTextLine0341.fontName = @"HelveticaNeue";
    drawTextLine0341.fontColor = stationNamesEnglishColor;
    drawTextLine0341.fontSize = 28;
    drawTextLine0341.kernSpacing = -0.2;
    drawTextLine0341.origin = CGPointMake(2042, 2188);
    [station0157.nameEnglishTextPrimitives addObject:drawTextLine0341];

    // Добавляем вершину
    edge0058.finishVertex = vertex0026;
    
    // Создаем участок линии от "Менделеевская" до "Петровско-Разумовская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0059 = [[MWEdge alloc] init];
    edge0059.identifier = @"edge0059";
    edge0059.developmentName = @"Ребро: Менделеевская - Петровско-Разумовская";
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
    
    MWDrawLine *drawLine0315 = [[MWDrawLine alloc] init];
    drawLine0315.startPoint = CGPointMake(2064, 2303.5);
    drawLine0315.endPoint = CGPointMake(1956.5, 2197.5);
    drawLine0315.width = 21.5;
    drawLine0315.color = line0009.color;
    [haul0150.drawPrimitives addObject:drawLine0315];

    // Добавляем станцию "Савеловская"
    MWStation *station0158 = [[MWStation alloc] init];
    station0158.identifier = @"station0158";
    [edge0059.elements addObject:station0158];
    
    station0158.nameOriginal = @"Савёловская";
    station0158.nameEnglish = @"Savyolovskaya";
    station0158.mapLocation = CGPointMake(1956.5, 2197.5);
    station0158.geoLocation = CGPointMake(55.794162, 37.588146);

    MWDrawLine *drawLine0316 = [[MWDrawLine alloc] init];
    drawLine0316.startPoint = CGPointMake(1956.5, 2197.5);
    drawLine0316.endPoint = CGPointMake(1979, 2175);
    drawLine0316.width = 21.5;
    drawLine0316.color = line0009.color;
    [station0158.drawPrimitives addObject:drawLine0316];

    MWDrawTextLine *drawTextLine0342 = [[MWDrawTextLine alloc] init];
    drawTextLine0342.text = station0158.nameOriginal;
    drawTextLine0342.fontName = @"HelveticaNeue";
    drawTextLine0342.fontColor = [UIColor blackColor];
    drawTextLine0342.fontSize = 42;
    drawTextLine0342.origin = CGPointMake(1978.5, 2130);
    drawTextLine0342.kernSpacing = -0.3;
    [station0158.nameOriginalTextPrimitives addObject:drawTextLine0342];

    MWDrawTextLine *drawTextLine0343 = [[MWDrawTextLine alloc] init];
    drawTextLine0343.text = station0158.nameEnglish;
    drawTextLine0343.fontName = @"HelveticaNeue";
    drawTextLine0343.fontColor = stationNamesEnglishColor;
    drawTextLine0343.fontSize = 28;
    drawTextLine0343.kernSpacing = -0.7;
    drawTextLine0343.origin = CGPointMake(1983, 2103);
    [station0158.nameEnglishTextPrimitives addObject:drawTextLine0343];

    // Добавляем перегон
    MWHaul *haul0151 = [[MWHaul alloc] init];
    haul0151.identifier = @"haul0151";
    haul0151.length = 1700;
    [edge0059.elements addObject:haul0151];
    
    MWDrawLine *drawLine0317 = [[MWDrawLine alloc] init];
    drawLine0317.startPoint = CGPointMake(1957, 2198);
    drawLine0317.endPoint = CGPointMake(1927.5, 2168.5);
    drawLine0317.width = 21.5;
    drawLine0317.color = line0009.color;
    [haul0151.drawPrimitives addObject:drawLine0317];

    MWDrawArc *drawArc0054 = [[MWDrawArc alloc] init];
    drawArc0054.center = CGPointMake(2034, 2063);
    drawArc0054.startDegrees = 135;
    drawArc0054.endDegrees = 180;
    drawArc0054.radius = 150;
    drawArc0054.width = 21.5;
    drawArc0054.color = line0009.color;
    [haul0151.drawPrimitives addObject:drawArc0054];

    MWDrawLine *drawLine0318 = [[MWDrawLine alloc] init];
    drawLine0318.startPoint = CGPointMake(1884, 2063.5);
    drawLine0318.endPoint = CGPointMake(1884, 2029.5);
    drawLine0318.width = 21.5;
    drawLine0318.color = line0009.color;
    [haul0151.drawPrimitives addObject:drawLine0318];

    // Добавляем станцию "Дмитровская"
    MWStation *station0159 = [[MWStation alloc] init];
    station0159.identifier = @"station0159";
    [edge0059.elements addObject:station0159];
    
    station0159.nameOriginal = @"Дмитровская";
    station0159.nameEnglish = @"Dmitrovskaya";
    station0159.mapLocation = CGPointMake(1884, 2029.5);
    station0159.geoLocation = CGPointMake(55.807992, 37.581177);
    
    MWDrawLine *drawLine0319 = [[MWDrawLine alloc] init];
    drawLine0319.startPoint = CGPointMake(1884, 2029.5);
    drawLine0319.endPoint = CGPointMake(1915, 2029.5);
    drawLine0319.width = 21.5;
    drawLine0319.color = line0009.color;
    [station0159.drawPrimitives addObject:drawLine0319];

    MWDrawTextLine *drawTextLine0344 = [[MWDrawTextLine alloc] init];
    drawTextLine0344.text = station0159.nameOriginal;
    drawTextLine0344.fontName = @"HelveticaNeue";
    drawTextLine0344.fontColor = [UIColor blackColor];
    drawTextLine0344.fontSize = 42;
    drawTextLine0344.origin = CGPointMake(1921, 2005);
    drawTextLine0344.kernSpacing = 0.7;
    [station0159.nameOriginalTextPrimitives addObject:drawTextLine0344];

    MWDrawTextLine *drawTextLine0345 = [[MWDrawTextLine alloc] init];
    drawTextLine0345.text = station0159.nameEnglish;
    drawTextLine0345.fontName = @"HelveticaNeue";
    drawTextLine0345.fontColor = stationNamesEnglishColor;
    drawTextLine0345.fontSize = 28;
    drawTextLine0345.kernSpacing = -0.1;
    drawTextLine0345.origin = CGPointMake(1922, 1978);
    [station0159.nameEnglishTextPrimitives addObject:drawTextLine0345];

    // Добавляем перегон
    MWHaul *haul0152 = [[MWHaul alloc] init];
    haul0152.identifier = @"haul0152";
    haul0152.length = 1270;
    [edge0059.elements addObject:haul0152];
    
    MWDrawLine *drawLine0320 = [[MWDrawLine alloc] init];
    drawLine0320.startPoint = CGPointMake(1884, 2030);
    drawLine0320.endPoint = CGPointMake(1884, 1898.5);
    drawLine0320.width = 21.5;
    drawLine0320.color = line0009.color;
    [haul0152.drawPrimitives addObject:drawLine0320];

    // Добавляем станцию "Тимирязевская"
    MWStation *station0160 = [[MWStation alloc] init];
    station0160.identifier = @"station0160";
    [edge0059.elements addObject:station0160];
    
    station0160.nameOriginal = @"Тимирязевская";
    station0160.nameEnglish = @"Timiryazevskaya";
    station0160.mapLocation = CGPointMake(1884, 1898.5);
    station0160.geoLocation = CGPointMake(55.819010, 37.578896);
    
    MWDrawFillCircle *fillCircle0164 = [[MWDrawFillCircle alloc] init];
    fillCircle0164.center = station0160.mapLocation;
    fillCircle0164.radius = 31.5;
    fillCircle0164.fillColor = line0009.color;
    [station0160.drawPrimitives addObject:fillCircle0164];

    MWDrawFillCircle *fillCircle0165 = [[MWDrawFillCircle alloc] init];
    fillCircle0165.center = station0160.mapLocation;
    fillCircle0165.radius = 14;
    fillCircle0165.fillColor = [UIColor whiteColor];
    [station0160.drawPrimitives addObject:fillCircle0165];

    MWDrawTextLine *drawTextLine0346 = [[MWDrawTextLine alloc] init];
    drawTextLine0346.text = station0160.nameOriginal;
    drawTextLine0346.fontName = @"HelveticaNeue";
    drawTextLine0346.fontColor = [UIColor blackColor];
    drawTextLine0346.fontSize = 42;
    drawTextLine0346.origin = CGPointMake(1926, 1867);
    drawTextLine0346.kernSpacing = 0.3;
    [station0160.nameOriginalTextPrimitives addObject:drawTextLine0346];

    MWDrawTextLine *drawTextLine0347 = [[MWDrawTextLine alloc] init];
    drawTextLine0347.text = station0160.nameEnglish;
    drawTextLine0347.fontName = @"HelveticaNeue";
    drawTextLine0347.fontColor = stationNamesEnglishColor;
    drawTextLine0347.fontSize = 28;
    drawTextLine0347.kernSpacing = -0.0;
    drawTextLine0347.origin = CGPointMake(1926, 1912);
    [station0160.nameEnglishTextPrimitives addObject:drawTextLine0347];

    // Добавляем перегон
    MWHaul *haul0153 = [[MWHaul alloc] init];
    haul0153.identifier = @"haul0153";
    haul0153.length = 2000;
    [edge0059.elements addObject:haul0153];
    
    MWDrawLine *drawLine0321 = [[MWDrawLine alloc] init];
    drawLine0321.startPoint = CGPointMake(1884, 1899);
    drawLine0321.endPoint = CGPointMake(1884, 1853.5);
    drawLine0321.width = 21.5;
    drawLine0321.color = line0009.color;
    [haul0153.drawPrimitives addObject:drawLine0321];

    MWDrawArc *drawArc0055 = [[MWDrawArc alloc] init];
    drawArc0055.center = CGPointMake(2034, 1854);
    drawArc0055.startDegrees = 180;
    drawArc0055.endDegrees = 225;
    drawArc0055.radius = 150;
    drawArc0055.width = 21.5;
    drawArc0055.color = line0009.color;
    [haul0153.drawPrimitives addObject:drawArc0055];

    MWDrawLine *drawLine0322 = [[MWDrawLine alloc] init];
    drawLine0322.startPoint = CGPointMake(1927.5, 1748.5);
    drawLine0322.endPoint = CGPointMake(2091.5, 1584.5);
    drawLine0322.width = 21.5;
    drawLine0322.color = line0009.color;
    [haul0153.drawPrimitives addObject:drawLine0322];

    // Добавляем станцию "Петровско-Разумовская"
    MWStation *station0161 = [[MWStation alloc] init];
    station0161.identifier = @"station0161";
    [edge0059.elements addObject:station0161];
    
    station0161.nameOriginal = @"Петровско-Разумовская";
    station0161.nameEnglish = @"Petrovsko-Razumovskaya";
    station0161.mapLocation = CGPointMake(2091.5, 1584.5);
    station0161.geoLocation = CGPointMake(55.836663, 37.575353);
    
    MWDrawFillCircle *fillCircle0166 = [[MWDrawFillCircle alloc] init];
    fillCircle0166.center = station0161.mapLocation;
    fillCircle0166.radius = 31.5;
    fillCircle0166.fillColor = line0009.color;
    [station0161.drawPrimitives addObject:fillCircle0166];
    
    MWDrawFillCircle *fillCircle0167 = [[MWDrawFillCircle alloc] init];
    fillCircle0167.center = station0161.mapLocation;
    fillCircle0167.radius = 14;
    fillCircle0167.fillColor = [UIColor whiteColor];
    [station0161.drawPrimitives addObject:fillCircle0167];

    MWDrawTextLine *drawTextLine0348 = [[MWDrawTextLine alloc] init];
    drawTextLine0348.text = station0161.nameOriginal;
    drawTextLine0348.fontName = @"HelveticaNeue";
    drawTextLine0348.fontColor = [UIColor blackColor];
    drawTextLine0348.fontSize = 42;
    drawTextLine0348.origin = CGPointMake(2122, 1596);
    drawTextLine0348.kernSpacing = -0.5;
    [station0161.nameOriginalTextPrimitives addObject:drawTextLine0348];

    MWDrawTextLine *drawTextLine0349 = [[MWDrawTextLine alloc] init];
    drawTextLine0349.text = station0161.nameEnglish;
    drawTextLine0349.fontName = @"HelveticaNeue";
    drawTextLine0349.fontColor = stationNamesEnglishColor;
    drawTextLine0349.fontSize = 28;
    drawTextLine0349.kernSpacing = -0.4;
    drawTextLine0349.origin = CGPointMake(2137, 1569);
    [station0161.nameEnglishTextPrimitives addObject:drawTextLine0349];

    // Добавляем вершину
    edge0059.finishVertex = vertex0041;
    
    // Создаем участок линии от Петровско-Разумовская - Владыкино
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0100 = [[MWEdge alloc] init];
    edge0100.identifier = @"edge0100";
    edge0100.developmentName = @"Ребро: Петровско-Разумовская - Владыкино";
    [self.edges addObject:edge0100];
    
    // Добавляем линию
    edge0100.line = line0009;
    
    // Добавляем вершину
    edge0100.startVertex = vertex0041;

    // Добавляем станцию "Петровско-Разумовская"
    [edge0100.elements addObject:station0161];

    // Добавляем перегон
    MWHaul *haul0154 = [[MWHaul alloc] init];
    haul0154.identifier = @"haul0154";
    haul0154.length = 1640;
    [edge0100.elements addObject:haul0154];
    
    MWDrawLine *drawLine0323 = [[MWDrawLine alloc] init];
    drawLine0323.startPoint = CGPointMake(2091, 1585);
    drawLine0323.endPoint = CGPointMake(2123, 1553);
    drawLine0323.width = 21.5;
    drawLine0323.color = line0009.color;
    [haul0154.drawPrimitives addObject:drawLine0323];

    MWDrawArc *drawArc0056 = [[MWDrawArc alloc] init];
    drawArc0056.center = CGPointMake(2016.5, 1447.5);
    drawArc0056.startDegrees = 0;
    drawArc0056.endDegrees = 45;
    drawArc0056.radius = 150;
    drawArc0056.width = 21.5;
    drawArc0056.color = line0009.color;
    [haul0154.drawPrimitives addObject:drawArc0056];

    // Добавляем станцию "Владыкино"
    MWStation *station0162 = [[MWStation alloc] init];
    station0162.identifier = @"station0162";
    [edge0100.elements addObject:station0162];
    
    station0162.nameOriginal = @"Владыкино";
    station0162.nameEnglish = @"Vladykino";
    station0162.mapLocation = CGPointMake(2166.5, 1447.5);
    station0162.geoLocation = CGPointMake(55.847249, 37.589849);
    
    MWDrawFillCircle *fillCircle0168 = [[MWDrawFillCircle alloc] init];
    fillCircle0168.center = station0162.mapLocation;
    fillCircle0168.radius = 31.5;
    fillCircle0168.fillColor = line0009.color;
    [station0162.drawPrimitives addObject:fillCircle0168];
    
    MWDrawFillCircle *fillCircle0169 = [[MWDrawFillCircle alloc] init];
    fillCircle0169.center = station0162.mapLocation;
    fillCircle0169.radius = 14;
    fillCircle0169.fillColor = [UIColor whiteColor];
    [station0162.drawPrimitives addObject:fillCircle0169];

    MWDrawTextLine *drawTextLine0350 = [[MWDrawTextLine alloc] init];
    drawTextLine0350.text = station0162.nameOriginal;
    drawTextLine0350.fontName = @"HelveticaNeue";
    drawTextLine0350.fontColor = [UIColor blackColor];
    drawTextLine0350.fontSize = 42;
    drawTextLine0350.origin = CGPointMake(2207, 1416);
    drawTextLine0350.kernSpacing = -0.0;
    [station0162.nameOriginalTextPrimitives addObject:drawTextLine0350];

    MWDrawTextLine *drawTextLine0351 = [[MWDrawTextLine alloc] init];
    drawTextLine0351.text = station0162.nameEnglish;
    drawTextLine0351.fontName = @"HelveticaNeue";
    drawTextLine0351.fontColor = stationNamesEnglishColor;
    drawTextLine0351.fontSize = 28;
    drawTextLine0351.kernSpacing = -0.2;
    drawTextLine0351.origin = CGPointMake(2209, 1389);
    [station0162.nameEnglishTextPrimitives addObject:drawTextLine0351];

    // Добавляем вершину
    edge0100.finishVertex = vertex0045;
    
    // Создаем участок линии от Владыкино до Алтуфьево
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0072 = [[MWEdge alloc] init];
    edge0072.identifier = @"edge0072";
    edge0072.developmentName = @"Ребро: Владыкино - Алтуфьево";
    [self.edges addObject:edge0072];
    
    // Добавляем линию
    edge0072.line = line0009;
    
    // Добавляем вершину
    edge0072.startVertex = vertex0045;

    // Добавляем станцию "Владыкино"
    [edge0072.elements addObject:station0162];
    
    // Добавляем перегон
    MWHaul *haul0155 = [[MWHaul alloc] init];
    haul0155.identifier = @"haul0155";
    haul0155.length = 1960;
    [edge0072.elements addObject:haul0155];
    
    MWDrawLine *drawLine0324 = [[MWDrawLine alloc] init];
    drawLine0324.startPoint = CGPointMake(2166.5, 1448);
    drawLine0324.endPoint = CGPointMake(2166.5, 1286);
    drawLine0324.width = 21.5;
    drawLine0324.color = line0009.color;
    [haul0155.drawPrimitives addObject:drawLine0324];

    // Добавляем станцию "Отрадное"
    MWStation *station0163 = [[MWStation alloc] init];
    station0163.identifier = @"station0163";
    [edge0072.elements addObject:station0163];
    
    station0163.nameOriginal = @"Отрадное";
    station0163.nameEnglish = @"Otradnoye";
    station0163.mapLocation = CGPointMake(2166.5, 1286);
    station0163.geoLocation = CGPointMake(55.863398, 37.604620);
    
    MWDrawLine *drawLine0325 = [[MWDrawLine alloc] init];
    drawLine0325.startPoint = CGPointMake(2166.5, 1286);
    drawLine0325.endPoint = CGPointMake(2198, 1286);
    drawLine0325.width = 21.5;
    drawLine0325.color = line0009.color;
    [station0163.drawPrimitives addObject:drawLine0325];

    MWDrawTextLine *drawTextLine0352 = [[MWDrawTextLine alloc] init];
    drawTextLine0352.text = station0163.nameOriginal;
    drawTextLine0352.fontName = @"HelveticaNeue";
    drawTextLine0352.fontColor = [UIColor blackColor];
    drawTextLine0352.fontSize = 42;
    drawTextLine0352.origin = CGPointMake(2207, 1256.5);
    drawTextLine0352.kernSpacing = 0.8;
    [station0163.nameOriginalTextPrimitives addObject:drawTextLine0352];

    MWDrawTextLine *drawTextLine0353 = [[MWDrawTextLine alloc] init];
    drawTextLine0353.text = station0163.nameEnglish;
    drawTextLine0353.fontName = @"HelveticaNeue";
    drawTextLine0353.fontColor = stationNamesEnglishColor;
    drawTextLine0353.fontSize = 28;
    drawTextLine0353.kernSpacing = -0.0;
    drawTextLine0353.origin = CGPointMake(2207, 1301);
    [station0163.nameEnglishTextPrimitives addObject:drawTextLine0353];

    // Добавляем перегон
    MWHaul *haul0156 = [[MWHaul alloc] init];
    haul0156.identifier = @"haul0156";
    haul0156.length = 2290;
    [edge0072.elements addObject:haul0156];
    
    MWDrawLine *drawLine0326 = [[MWDrawLine alloc] init];
    drawLine0326.startPoint = CGPointMake(2166.5, 1286.5);
    drawLine0326.endPoint = CGPointMake(2166.5, 1129);
    drawLine0326.width = 21.5;
    drawLine0326.color = line0009.color;
    [haul0156.drawPrimitives addObject:drawLine0326];

    // Добавляем станцию "Бибирево"
    MWStation *station0164 = [[MWStation alloc] init];
    station0164.identifier = @"station0164";
    [edge0072.elements addObject:station0164];
    
    station0164.nameOriginal = @"Бибирево";
    station0164.nameEnglish = @"Bibirevo";
    station0164.mapLocation = CGPointMake(2166.5, 1129);
    station0164.geoLocation = CGPointMake(55.883990, 37.603605);
    
    MWDrawLine *drawLine0327 = [[MWDrawLine alloc] init];
    drawLine0327.startPoint = CGPointMake(2166.5, 1129);
    drawLine0327.endPoint = CGPointMake(2198, 1129);
    drawLine0327.width = 21.5;
    drawLine0327.color = line0009.color;
    [station0164.drawPrimitives addObject:drawLine0327];

    MWDrawTextLine *drawTextLine0354 = [[MWDrawTextLine alloc] init];
    drawTextLine0354.text = station0164.nameOriginal;
    drawTextLine0354.fontName = @"HelveticaNeue";
    drawTextLine0354.fontColor = [UIColor blackColor];
    drawTextLine0354.fontSize = 42;
    drawTextLine0354.origin = CGPointMake(2207, 1099);
    drawTextLine0354.kernSpacing = 0.8;
    [station0164.nameOriginalTextPrimitives addObject:drawTextLine0354];

    MWDrawTextLine *drawTextLine0355 = [[MWDrawTextLine alloc] init];
    drawTextLine0355.text = station0164.nameEnglish;
    drawTextLine0355.fontName = @"HelveticaNeue";
    drawTextLine0355.fontColor = stationNamesEnglishColor;
    drawTextLine0355.fontSize = 28;
    drawTextLine0355.kernSpacing = 0.4;
    drawTextLine0355.origin = CGPointMake(2207, 1144);
    [station0164.nameEnglishTextPrimitives addObject:drawTextLine0355];

    // Добавляем перегон
    MWHaul *haul0157 = [[MWHaul alloc] init];
    haul0157.identifier = @"haul0157";
    haul0157.length = 1920;
    [edge0072.elements addObject:haul0157];
    
    MWDrawLine *drawLine0328 = [[MWDrawLine alloc] init];
    drawLine0328.startPoint = CGPointMake(2166.5, 1129.5);
    drawLine0328.endPoint = CGPointMake(2166.5, 974);
    drawLine0328.width = 21.5;
    drawLine0328.color = line0009.color;
    [haul0157.drawPrimitives addObject:drawLine0328];

    // Добавляем станцию "Алтуфьево"
    MWStation *station0165 = [[MWStation alloc] init];
    station0165.identifier = @"station0165";
    [edge0072.elements addObject:station0165];
    
    station0165.nameOriginal = @"Алтуфьево";
    station0165.nameEnglish = @"Altufyevo";
    station0165.mapLocation = CGPointMake(2166.5, 974);
    station0165.geoLocation = CGPointMake(55.897863, 37.587083);
    
    MWDrawLine *drawLine0329 = [[MWDrawLine alloc] init];
    drawLine0329.startPoint = CGPointMake(2135, 974);
    drawLine0329.endPoint = CGPointMake(2198, 974);
    drawLine0329.width = 21.5;
    drawLine0329.color = line0009.color;
    [station0165.drawPrimitives addObject:drawLine0329];

    MWDrawTextLine *drawTextLine0356 = [[MWDrawTextLine alloc] init];
    drawTextLine0356.text = station0165.nameOriginal;
    drawTextLine0356.fontName = @"HelveticaNeue";
    drawTextLine0356.fontColor = [UIColor blackColor];
    drawTextLine0356.fontSize = 42;
    drawTextLine0356.origin = CGPointMake(2209, 944);
    drawTextLine0356.kernSpacing = -0.4;
    [station0165.nameOriginalTextPrimitives addObject:drawTextLine0356];

    MWDrawTextLine *drawTextLine0357 = [[MWDrawTextLine alloc] init];
    drawTextLine0357.text = station0165.nameEnglish;
    drawTextLine0357.fontName = @"HelveticaNeue";
    drawTextLine0357.fontColor = stationNamesEnglishColor;
    drawTextLine0357.fontSize = 28;
    drawTextLine0357.kernSpacing = 0.2;
    drawTextLine0357.origin = CGPointMake(2207, 989);
    [station0165.nameEnglishTextPrimitives addObject:drawTextLine0357];

    MWDrawFillCircle *fillCircle0170 = [[MWDrawFillCircle alloc] init];
    fillCircle0170.center = CGPointMake(2166.5, 911.5);//(2327.5, 6397.5)
    fillCircle0170.radius = 32;
    fillCircle0170.fillColor = line0009.color;
    [station0165.drawPrimitives addObject:fillCircle0170];
    
    MWDrawTextLine *drawTextLine0358 = [[MWDrawTextLine alloc] init];
    drawTextLine0358.text = @"9";
    drawTextLine0358.fontName = @"Georgia-Bold";
    drawTextLine0358.fontColor = [UIColor whiteColor];
    drawTextLine0358.fontSize = 56;
    drawTextLine0358.origin = CGPointMake(2150.5, 869);
    [station0165.drawPrimitives addObject:drawTextLine0358];

    // Добавляем вершину
    edge0072.finishVertex = vertex0040 ;
    
    ////////////////////////////////////////////////////////////////
    // 10 - Люблинская линия
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Зябликово - Дубровка
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0060 = [[MWEdge alloc] init];
    edge0060.identifier = @"edge0060";
    edge0060.developmentName = @"Ребро: Зябликово - Дубровка";
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
    station0166.mapLocation = CGPointMake(3536, 6061);
    station0166.geoLocation = CGPointMake(55.612030, 37.744947);
    
    MWDrawFillCircle *fillCircle0171 = [[MWDrawFillCircle alloc] init];
    fillCircle0171.center = CGPointMake(3476.5, 6002);
    fillCircle0171.radius = 32;
    fillCircle0171.fillColor = line0010.color;
    [station0166.drawPrimitives addObject:fillCircle0171];
    
    MWDrawTextLine *drawTextLine0359 = [[MWDrawTextLine alloc] init];
    drawTextLine0359.text = @"10";
    drawTextLine0359.fontName = @"Georgia-Bold";
    drawTextLine0359.fontColor = [UIColor whiteColor];
    drawTextLine0359.fontSize = 56;
    drawTextLine0359.kernSpacing = -6.0;
    drawTextLine0359.origin = CGPointMake(3447.5, 5964);
    [station0166.drawPrimitives addObject:drawTextLine0359];

    MWDrawFillCircle *fillCircle0172 = [[MWDrawFillCircle alloc] init];
    fillCircle0172.center = station0166.mapLocation;
    fillCircle0172.radius = 31.5;
    fillCircle0172.fillColor = line0010.color;
    [station0166.drawPrimitives addObject:fillCircle0172];
    
    MWDrawFillCircle *fillCircle0173 = [[MWDrawFillCircle alloc] init];
    fillCircle0173.center = station0166.mapLocation;
    fillCircle0173.radius = 14;
    fillCircle0173.fillColor = [UIColor whiteColor];
    [station0166.drawPrimitives addObject:fillCircle0173];

    MWDrawTextLine *drawTextLine0360 = [[MWDrawTextLine alloc] init];
    drawTextLine0360.text = station0166.nameOriginal;
    drawTextLine0360.fontName = @"HelveticaNeue";
    drawTextLine0360.fontColor = [UIColor blackColor];
    drawTextLine0360.fontSize = 42;
    drawTextLine0360.origin = CGPointMake(3565, 6000.5);
    drawTextLine0360.kernSpacing = 0.2;
    [station0166.nameOriginalTextPrimitives addObject:drawTextLine0360];

    MWDrawTextLine *drawTextLine0361 = [[MWDrawTextLine alloc] init];
    drawTextLine0361.text = station0166.nameEnglish;
    drawTextLine0361.fontName = @"HelveticaNeue";
    drawTextLine0361.fontColor = stationNamesEnglishColor;
    drawTextLine0361.fontSize = 28;
    drawTextLine0361.kernSpacing = 0.0;
    drawTextLine0361.origin = CGPointMake(3569, 5973);
    [station0166.nameEnglishTextPrimitives addObject:drawTextLine0361];

    // Добавляем перегон
    MWHaul *haul0158 = [[MWHaul alloc] init];
    haul0158.identifier = @"haul0158";
    haul0158.length = 957;
    [edge0060.elements addObject:haul0158];
    
    MWDrawLine *drawLine0330 = [[MWDrawLine alloc] init];
    drawLine0330.startPoint = CGPointMake(3536, 6061);
    drawLine0330.endPoint = CGPointMake(3536, 5873);
    drawLine0330.width = 21.5;
    drawLine0330.color = line0010.color;
    [haul0158.drawPrimitives addObject:drawLine0330];

    // Добавляем станцию "Шипиловская"
    MWStation *station0167 = [[MWStation alloc] init];
    station0167.identifier = @"station0167";
    [edge0060.elements addObject:station0167];
    
    station0167.nameOriginal = @"Шипиловская";
    station0167.nameEnglish = @"Shipilovskaya";
    station0167.mapLocation = CGPointMake(3536, 5873);
    station0167.geoLocation = CGPointMake(55.621005, 37.743598);
    
    MWDrawLine *drawLine0331 = [[MWDrawLine alloc] init];
    drawLine0331.startPoint = CGPointMake(3536, 5873);
    drawLine0331.endPoint = CGPointMake(3567.5, 5873);
    drawLine0331.width = 21.5;
    drawLine0331.color = line0010.color;
    [station0167.drawPrimitives addObject:drawLine0331];

    MWDrawTextLine *drawTextLine0362 = [[MWDrawTextLine alloc] init];
    drawTextLine0362.text = station0167.nameOriginal;
    drawTextLine0362.fontName = @"HelveticaNeue";
    drawTextLine0362.fontColor = [UIColor blackColor];
    drawTextLine0362.fontSize = 42;
    drawTextLine0362.origin = CGPointMake(3575, 5843.5);
    drawTextLine0362.kernSpacing = 0.0;
    [station0167.nameOriginalTextPrimitives addObject:drawTextLine0362];

    MWDrawTextLine *drawTextLine0363 = [[MWDrawTextLine alloc] init];
    drawTextLine0363.text = station0167.nameEnglish;
    drawTextLine0363.fontName = @"HelveticaNeue";
    drawTextLine0363.fontColor = stationNamesEnglishColor;
    drawTextLine0363.fontSize = 28;
    drawTextLine0363.kernSpacing = -0.3;
    drawTextLine0363.origin = CGPointMake(3575, 5888.5);
    [station0167.nameEnglishTextPrimitives addObject:drawTextLine0363];

    // Добавляем перегон
    MWHaul *haul0159 = [[MWHaul alloc] init];
    haul0159.identifier = @"haul0159";
    haul0159.length = 1420;
    [edge0060.elements addObject:haul0159];
    
    MWDrawLine *drawLine0332 = [[MWDrawLine alloc] init];
    drawLine0332.startPoint = CGPointMake(3536, 5873.5);
    drawLine0332.endPoint = CGPointMake(3536, 5716.5);
    drawLine0332.width = 21.5;
    drawLine0332.color = line0010.color;
    [haul0159.drawPrimitives addObject:drawLine0332];

    // Добавляем станцию "Борисово"
    MWStation *station0168 = [[MWStation alloc] init];
    station0168.identifier = @"station0168";
    [edge0060.elements addObject:station0168];
    
    station0168.nameOriginal = @"Борисово";
    station0168.nameEnglish = @"Borisovo";
    station0168.mapLocation = CGPointMake(3536, 5716.5);
    station0168.geoLocation = CGPointMake(55.633463, 37.744071);
    
    MWDrawLine *drawLine0333 = [[MWDrawLine alloc] init];
    drawLine0333.startPoint = CGPointMake(3536, 5716.5);
    drawLine0333.endPoint = CGPointMake(3567.5, 5716.5);
    drawLine0333.width = 21.5;
    drawLine0333.color = line0010.color;
    [station0168.drawPrimitives addObject:drawLine0333];

    MWDrawTextLine *drawTextLine0364 = [[MWDrawTextLine alloc] init];
    drawTextLine0364.text = station0168.nameOriginal;
    drawTextLine0364.fontName = @"HelveticaNeue";
    drawTextLine0364.fontColor = [UIColor blackColor];
    drawTextLine0364.fontSize = 42;
    drawTextLine0364.origin = CGPointMake(3577, 5686.5);
    drawTextLine0364.kernSpacing = 0.0;
    [station0168.nameOriginalTextPrimitives addObject:drawTextLine0364];

    MWDrawTextLine *drawTextLine0365 = [[MWDrawTextLine alloc] init];
    drawTextLine0365.text = station0168.nameEnglish;
    drawTextLine0365.fontName = @"HelveticaNeue";
    drawTextLine0365.fontColor = stationNamesEnglishColor;
    drawTextLine0365.fontSize = 28;
    drawTextLine0365.kernSpacing = -0.3;
    drawTextLine0365.origin = CGPointMake(3579, 5731.5);
    [station0168.nameEnglishTextPrimitives addObject:drawTextLine0365];

    // Добавляем перегон
    MWHaul *haul0160 = [[MWHaul alloc] init];
    haul0160.identifier = @"haul0160";
    haul0160.length = 1760;
    [edge0060.elements addObject:haul0160];
    
    MWDrawLine *drawLine0334 = [[MWDrawLine alloc] init];
    drawLine0334.startPoint = CGPointMake(3536, 5717);
    drawLine0334.endPoint = CGPointMake(3536, 5560);
    drawLine0334.width = 21.5;
    drawLine0334.color = line0010.color;
    [haul0160.drawPrimitives addObject:drawLine0334];

    // Добавляем станцию "Марьино"
    MWStation *station0169 = [[MWStation alloc] init];
    station0169.identifier = @"station0169";
    [edge0060.elements addObject:station0169];
    
    station0169.nameOriginal = @"Марьино";
    station0169.nameEnglish = @"Mariino";
    station0169.mapLocation = CGPointMake(3536, 5560);
    station0169.geoLocation = CGPointMake(55.650168, 37.743736);
    
    MWDrawLine *drawLine0335 = [[MWDrawLine alloc] init];
    drawLine0335.startPoint = CGPointMake(3536, 5560);
    drawLine0335.endPoint = CGPointMake(3567.5, 5560);
    drawLine0335.width = 21.5;
    drawLine0335.color = line0010.color;
    [station0169.drawPrimitives addObject:drawLine0335];

    MWDrawTextLine *drawTextLine0366 = [[MWDrawTextLine alloc] init];
    drawTextLine0366.text = station0169.nameOriginal;
    drawTextLine0366.fontName = @"HelveticaNeue";
    drawTextLine0366.fontColor = [UIColor blackColor];
    drawTextLine0366.fontSize = 42;
    drawTextLine0366.origin = CGPointMake(3577, 5530);
    drawTextLine0366.kernSpacing = 1.6;
    [station0169.nameOriginalTextPrimitives addObject:drawTextLine0366];

    MWDrawTextLine *drawTextLine0367 = [[MWDrawTextLine alloc] init];
    drawTextLine0367.text = station0169.nameEnglish;
    drawTextLine0367.fontName = @"HelveticaNeue";
    drawTextLine0367.fontColor = stationNamesEnglishColor;
    drawTextLine0367.fontSize = 28;
    drawTextLine0367.kernSpacing = 0.6;
    drawTextLine0367.origin = CGPointMake(3579, 5575);
    [station0169.nameEnglishTextPrimitives addObject:drawTextLine0367];

    // Добавляем перегон
    MWHaul *haul0161 = [[MWHaul alloc] init];
    haul0161.identifier = @"haul0161";
    haul0161.length = 1210;
    [edge0060.elements addObject:haul0161];
    
    MWDrawLine *drawLine0336 = [[MWDrawLine alloc] init];
    drawLine0336.startPoint = CGPointMake(3536, 5560.5);
    drawLine0336.endPoint = CGPointMake(3536, 5403);
    drawLine0336.width = 21.5;
    drawLine0336.color = line0010.color;
    [haul0161.drawPrimitives addObject:drawLine0336];

    // Добавляем станцию "Братиславская"
    MWStation *station0170 = [[MWStation alloc] init];
    station0170.identifier = @"station0170";
    [edge0060.elements addObject:station0170];
    
    station0170.nameOriginal = @"Братиславская";
    station0170.nameEnglish = @"Bratislavskaya";
    station0170.mapLocation = CGPointMake(3536, 5403);
    station0170.geoLocation = CGPointMake(55.659529, 37.750613);
    
    MWDrawLine *drawLine0337 = [[MWDrawLine alloc] init];
    drawLine0337.startPoint = CGPointMake(3536, 5403);
    drawLine0337.endPoint = CGPointMake(3567.5, 5403);
    drawLine0337.width = 21.5;
    drawLine0337.color = line0010.color;
    [station0170.drawPrimitives addObject:drawLine0337];

    MWDrawTextLine *drawTextLine0368 = [[MWDrawTextLine alloc] init];
    drawTextLine0368.text = station0170.nameOriginal;
    drawTextLine0368.fontName = @"HelveticaNeue";
    drawTextLine0368.fontColor = [UIColor blackColor];
    drawTextLine0368.fontSize = 42;
    drawTextLine0368.origin = CGPointMake(3577, 5373.5);
    drawTextLine0368.kernSpacing = -0.4;
    [station0170.nameOriginalTextPrimitives addObject:drawTextLine0368];

    MWDrawTextLine *drawTextLine0369 = [[MWDrawTextLine alloc] init];
    drawTextLine0369.text = station0170.nameEnglish;
    drawTextLine0369.fontName = @"HelveticaNeue";
    drawTextLine0369.fontColor = stationNamesEnglishColor;
    drawTextLine0369.fontSize = 28;
    drawTextLine0369.kernSpacing = -0.5;
    drawTextLine0369.origin = CGPointMake(3579, 5418.5);
    [station0170.nameEnglishTextPrimitives addObject:drawTextLine0369];

    // Добавляем перегон
    MWHaul *haul0162 = [[MWHaul alloc] init];
    haul0162.identifier = @"haul0162";
    haul0162.length = 2000;
    [edge0060.elements addObject:haul0162];
    
    MWDrawLine *drawLine0338 = [[MWDrawLine alloc] init];
    drawLine0338.startPoint = CGPointMake(3536, 5403.5);
    drawLine0338.endPoint = CGPointMake(3536, 5247);
    drawLine0338.width = 21.5;
    drawLine0338.color = line0010.color;
    [haul0162.drawPrimitives addObject:drawLine0338];

    // Добавляем станцию "Люблино"
    MWStation *station0171 = [[MWStation alloc] init];
    station0171.identifier = @"station0171";
    [edge0060.elements addObject:station0171];
    
    station0171.nameOriginal = @"Люблино";
    station0171.nameEnglish = @"Lyublino";
    station0171.mapLocation = CGPointMake(3536, 5247);
    station0171.geoLocation = CGPointMake(55.675683, 37.761760);
    
    MWDrawLine *drawLine0339 = [[MWDrawLine alloc] init];
    drawLine0339.startPoint = CGPointMake(3536, 5247);
    drawLine0339.endPoint = CGPointMake(3567.5, 5247);
    drawLine0339.width = 21.5;
    drawLine0339.color = line0010.color;
    [station0171.drawPrimitives addObject:drawLine0339];

    MWDrawTextLine *drawTextLine0370 = [[MWDrawTextLine alloc] init];
    drawTextLine0370.text = station0171.nameOriginal;
    drawTextLine0370.fontName = @"HelveticaNeue";
    drawTextLine0370.fontColor = [UIColor blackColor];
    drawTextLine0370.fontSize = 42;
    drawTextLine0370.origin = CGPointMake(3572, 5217);
    drawTextLine0370.kernSpacing = 0.8;
    [station0171.nameOriginalTextPrimitives addObject:drawTextLine0370];

    MWDrawTextLine *drawTextLine0371 = [[MWDrawTextLine alloc] init];
    drawTextLine0371.text = station0171.nameEnglish;
    drawTextLine0371.fontName = @"HelveticaNeue";
    drawTextLine0371.fontColor = stationNamesEnglishColor;
    drawTextLine0371.fontSize = 28;
    drawTextLine0371.kernSpacing = 0.4;
    drawTextLine0371.origin = CGPointMake(3572, 5262);
    [station0171.nameEnglishTextPrimitives addObject:drawTextLine0371];

    // Добавляем перегон
    MWHaul *haul0163 = [[MWHaul alloc] init];
    haul0163.identifier = @"haul0163";
    haul0163.length = 1720;
    [edge0060.elements addObject:haul0163];
    
    MWDrawLine *drawLine0340 = [[MWDrawLine alloc] init];
    drawLine0340.startPoint = CGPointMake(3536, 5247.5);
    drawLine0340.endPoint = CGPointMake(3536, 5090);
    drawLine0340.width = 21.5;
    drawLine0340.color = line0010.color;
    [haul0163.drawPrimitives addObject:drawLine0340];

    // Добавляем станцию "Волжская"
    MWStation *station0172 = [[MWStation alloc] init];
    station0172.identifier = @"station0172";
    [[edge0060 elements] addObject:station0172];
    
    station0172.nameOriginal = @"Волжская";
    station0172.nameEnglish = @"Voljskaya";
    station0172.mapLocation = CGPointMake(3536, 5090);
    station0172.geoLocation = CGPointMake(55.690906, 37.753321);
    
    MWDrawLine *drawLine0341 = [[MWDrawLine alloc] init];
    drawLine0341.startPoint = CGPointMake(3536, 5090);
    drawLine0341.endPoint = CGPointMake(3567.5, 5090);
    drawLine0341.width = 21.5;
    drawLine0341.color = line0010.color;
    [station0172.drawPrimitives addObject:drawLine0341];

    MWDrawTextLine *drawTextLine0372 = [[MWDrawTextLine alloc] init];
    drawTextLine0372.text = station0172.nameOriginal;
    drawTextLine0372.fontName = @"HelveticaNeue";
    drawTextLine0372.fontColor = [UIColor blackColor];
    drawTextLine0372.fontSize = 42;
    drawTextLine0372.origin = CGPointMake(3576, 5060);
    drawTextLine0372.kernSpacing = -0.2;
    [station0172.nameOriginalTextPrimitives addObject:drawTextLine0372];

    MWDrawTextLine *drawTextLine0373 = [[MWDrawTextLine alloc] init];
    drawTextLine0373.text = station0172.nameEnglish;
    drawTextLine0373.fontName = @"HelveticaNeue";
    drawTextLine0373.fontColor = stationNamesEnglishColor;
    drawTextLine0373.fontSize = 28;
    drawTextLine0373.kernSpacing = -0.4;
    drawTextLine0373.origin = CGPointMake(3576, 5105);
    [station0172.nameEnglishTextPrimitives addObject:drawTextLine0373];

    // Добавляем перегон
    MWHaul *haul0164 = [[MWHaul alloc] init];
    haul0164.identifier = @"haul164";
    haul0164.length = 1670;
    [edge0060.elements addObject:haul0164];
    
    MWDrawLine *drawLine0342 = [[MWDrawLine alloc] init];
    drawLine0342.startPoint = CGPointMake(3536, 5090.5);
    drawLine0342.endPoint = CGPointMake(3536, 4933.5);
    drawLine0342.width = 21.5;
    drawLine0342.color = line0010.color;
    [haul0164.drawPrimitives addObject:drawLine0342];

    // Добавляем станцию "Печатники"
    MWStation *station0173 = [[MWStation alloc] init];
    station0173.identifier = @"station0173";
    [edge0060.elements addObject:station0173];
    
    station0173.nameOriginal = @"Печатники";
    station0173.nameEnglish = @"Pechatniki";
    station0173.mapLocation = CGPointMake(3536, 4933.5);
    station0173.geoLocation = CGPointMake(55.693162, 37.726901);
    
    MWDrawLine *drawLine0343 = [[MWDrawLine alloc] init];
    drawLine0343.startPoint = CGPointMake(3536, 4933.5);
    drawLine0343.endPoint = CGPointMake(3567.5, 4933.5);
    drawLine0343.width = 21.5;
    drawLine0343.color = line0010.color;
    [station0173.drawPrimitives addObject:drawLine0343];

    MWDrawTextLine *drawTextLine0374 = [[MWDrawTextLine alloc] init];
    drawTextLine0374.text = station0173.nameOriginal;
    drawTextLine0374.fontName = @"HelveticaNeue";
    drawTextLine0374.fontColor = [UIColor blackColor];
    drawTextLine0374.fontSize = 42;
    drawTextLine0374.origin = CGPointMake(3577, 4903.5);
    drawTextLine0374.kernSpacing = 0.9;
    [station0173.nameOriginalTextPrimitives addObject:drawTextLine0374];

    MWDrawTextLine *drawTextLine0375 = [[MWDrawTextLine alloc] init];
    drawTextLine0375.text = station0173.nameEnglish;
    drawTextLine0375.fontName = @"HelveticaNeue";
    drawTextLine0375.fontColor = stationNamesEnglishColor;
    drawTextLine0375.fontSize = 28;
    drawTextLine0375.kernSpacing = 0.1;
    drawTextLine0375.origin = CGPointMake(3579, 4948);
    [station0173.nameEnglishTextPrimitives addObject:drawTextLine0375];

    // Добавляем перегон
    MWHaul *haul0165 = [[MWHaul alloc] init];
    haul0165.identifier = @"haul0165";
    haul0165.length = 2980;
    [edge0060.elements addObject:haul0165];
    
    MWDrawLine *drawLine0344 = [[MWDrawLine alloc] init];
    drawLine0344.startPoint = CGPointMake(3536, 4934);
    drawLine0344.endPoint = CGPointMake(3536, 4777);
    drawLine0344.width = 21.5;
    drawLine0344.color = line0010.color;
    [haul0165.drawPrimitives addObject:drawLine0344];

    // Добавляем станцию "Кожуховская"
    MWStation *station0174 = [[MWStation alloc] init];
    station0174.identifier = @"station0174";
    [edge0060.elements addObject:station0174];
    
    station0174.nameOriginal = @"Кожуховская";
    station0174.nameEnglish = @"Kojukhovskaya";
    station0174.mapLocation = CGPointMake(3536, 4777);
    station0174.geoLocation = CGPointMake(55.706289, 37.685596);

    MWDrawLine *drawLine0345 = [[MWDrawLine alloc] init];
    drawLine0345.startPoint = CGPointMake(3536, 4777);
    drawLine0345.endPoint = CGPointMake(3567.5, 4777);
    drawLine0345.width = 21.5;
    drawLine0345.color = line0010.color;
    [station0174.drawPrimitives addObject:drawLine0345];

    MWDrawTextLine *drawTextLine0376 = [[MWDrawTextLine alloc] init];
    drawTextLine0376.text = station0174.nameOriginal;
    drawTextLine0376.fontName = @"HelveticaNeue";
    drawTextLine0376.fontColor = [UIColor blackColor];
    drawTextLine0376.fontSize = 42;
    drawTextLine0376.origin = CGPointMake(3577, 4747);
    drawTextLine0376.kernSpacing = 0.2;
    [station0174.nameOriginalTextPrimitives addObject:drawTextLine0376];

    MWDrawTextLine *drawTextLine0377 = [[MWDrawTextLine alloc] init];
    drawTextLine0377.text = station0174.nameEnglish;
    drawTextLine0377.fontName = @"HelveticaNeue";
    drawTextLine0377.fontColor = stationNamesEnglishColor;
    drawTextLine0377.fontSize = 28;
    drawTextLine0377.kernSpacing = -0.5;
    drawTextLine0377.origin = CGPointMake(3579, 4792);
    [station0174.nameEnglishTextPrimitives addObject:drawTextLine0377];

    // Добавляем перегон
    MWHaul *haul0166 = [[MWHaul alloc] init];
    haul0166.identifier = @"haul0166";
    haul0166.length = 1440;
    [edge0060.elements addObject:haul0166];
    
    MWDrawLine *drawLine0346 = [[MWDrawLine alloc] init];
    drawLine0346.startPoint = CGPointMake(3536, 4777.5);
    drawLine0346.endPoint = CGPointMake(3536, 4555.5);
    drawLine0346.width = 21.5;
    drawLine0346.color = line0010.color;
    [haul0166.drawPrimitives addObject:drawLine0346];

    // Добавляем станцию "Дубровка"
    MWStation *station0175 = [[MWStation alloc] init];
    station0175.identifier = @"station0175";
    [edge0060.elements addObject:station0175];
    
    station0175.nameOriginal = @"Дубровка";
    station0175.nameEnglish = @"Dubrovka";
    station0175.mapLocation = CGPointMake(3536, 4555.5);
    station0175.geoLocation = CGPointMake(55.717874, 37.676548);

    MWDrawFillCircle *fillCircle0174 = [[MWDrawFillCircle alloc] init];
    fillCircle0174.center = station0175.mapLocation;
    fillCircle0174.radius = 31.5;
    fillCircle0174.fillColor = line0010.color;
    [station0175.drawPrimitives addObject:fillCircle0174];

    MWDrawFillCircle *fillCircle0175 = [[MWDrawFillCircle alloc] init];
    fillCircle0175.center = station0175.mapLocation;
    fillCircle0175.radius = 14;
    fillCircle0175.fillColor = [UIColor whiteColor];
    [station0175.drawPrimitives addObject:fillCircle0175];
    
    MWDrawTextLine *drawTextLine0378 = [[MWDrawTextLine alloc] init];
    drawTextLine0378.text = station0175.nameOriginal;
    drawTextLine0378.fontName = @"HelveticaNeue";
    drawTextLine0378.fontColor = [UIColor blackColor];
    drawTextLine0378.fontSize = 42;
    drawTextLine0378.origin = CGPointMake(3309, 4490);
    drawTextLine0378.kernSpacing = 0.7;
    [station0175.nameOriginalTextPrimitives addObject:drawTextLine0378];

    MWDrawTextLine *drawTextLine0379 = [[MWDrawTextLine alloc] init];
    drawTextLine0379.text = station0175.nameEnglish;
    drawTextLine0379.fontName = @"HelveticaNeue";
    drawTextLine0379.fontColor = stationNamesEnglishColor;
    drawTextLine0379.fontSize = 28;
    drawTextLine0379.kernSpacing = 0.2;
    drawTextLine0379.origin = CGPointMake(3385, 4464);
    [station0175.nameEnglishTextPrimitives addObject:drawTextLine0379];

    // Добавляем вершину
    edge0060.finishVertex = vertex0050 ;
    
    // Создаем участок линии Дубровка - Крестьянская Застава
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0077 = [[MWEdge alloc] init];
    edge0077.identifier = @"edge0077";
    edge0077.developmentName = @"Ребро: Дубровка - Крестьянская Застава";
    [self.edges addObject:edge0077];
    
    // Добавляем линию
    edge0077.line = line0010;
    
    // Добавляем вершину
    edge0077.startVertex = vertex0050;

    // Добавляем станцию "Дубровка"
    [edge0077.elements addObject:station0175];

    // Добавляем перегон
    MWHaul *haul0167 = [[MWHaul alloc] init];
    haul0167.identifier = @"haul0167";
    haul0167.length = 1750;
    [edge0077.elements addObject:haul0167];
    
    MWDrawLine *drawLine0347 = [[MWDrawLine alloc] init];
    drawLine0347.startPoint = CGPointMake(3536, 4556);
    drawLine0347.endPoint = CGPointMake(3536, 4546.5);
    drawLine0347.width = 21.5;
    drawLine0347.color = line0010.color;
    [haul0167.drawPrimitives addObject:drawLine0347];

    MWDrawArc *drawArc0057 = [[MWDrawArc alloc] init];
    drawArc0057.center = CGPointMake(3686, 4547);
    drawArc0057.startDegrees = 180;
    drawArc0057.endDegrees = 225;
    drawArc0057.radius = 150;
    drawArc0057.width = 21.5;
    drawArc0057.color = line0010.color;
    [haul0167.drawPrimitives addObject:drawArc0057];

    MWDrawLine *drawLine0348 = [[MWDrawLine alloc] init];
    drawLine0348.startPoint = CGPointMake(3579, 4442);
    drawLine0348.endPoint = CGPointMake(3849, 4172);
    drawLine0348.width = 21.5;
    drawLine0348.color = line0010.color;
    [haul0167.drawPrimitives addObject:drawLine0348];

    MWDrawArc *drawArc0058 = [[MWDrawArc alloc] init];
    drawArc0058.center = CGPointMake(3742.5, 4066.5);
    drawArc0058.startDegrees = 0;
    drawArc0058.endDegrees = 45;
    drawArc0058.radius = 150;
    drawArc0058.width = 21.5;
    drawArc0058.color = line0010.color;
    [haul0167.drawPrimitives addObject:drawArc0058];

    MWDrawLine *drawLine0349 = [[MWDrawLine alloc] init];
    drawLine0349.startPoint = CGPointMake(3892.5, 4067);
    drawLine0349.endPoint = CGPointMake(3892.5, 4058.5);
    drawLine0349.width = 21.5;
    drawLine0349.color = line0010.color;
    [haul0167.drawPrimitives addObject:drawLine0349];

    // Добавляем станцию "Крестьянская Застава"
    MWStation *station0176 = [[MWStation alloc] init];
    station0176.identifier = @"station0176";
    [edge0077.elements addObject:station0176];
    
    station0176.nameOriginal = @"Крестьянская Застава";
    station0176.nameEnglish = @"Krestyanskaya Zastava";
    station0176.mapLocation = CGPointMake(3892.5, 4058.5);
    station0176.geoLocation = CGPointMake(55.732275,  37.665523);
    
    MWDrawFillCircle *fillCircle0176 = [[MWDrawFillCircle alloc] init];
    fillCircle0176.center = station0176.mapLocation;
    fillCircle0176.radius = 31.5;
    fillCircle0176.fillColor = line0010.color;
    [station0176.drawPrimitives addObject:fillCircle0176];

    MWDrawFillCircle *fillCircle0177 = [[MWDrawFillCircle alloc] init];
    fillCircle0177.center = station0176.mapLocation;
    fillCircle0177.radius = 14;
    fillCircle0177.fillColor = [UIColor whiteColor];
    [station0176.drawPrimitives addObject:fillCircle0177];
    
    MWDrawTextLine *drawTextLine0380 = [[MWDrawTextLine alloc] init];
    drawTextLine0380.text = @"Крестьянская";
    drawTextLine0380.fontName = @"HelveticaNeue";
    drawTextLine0380.fontColor = [UIColor blackColor];
    drawTextLine0380.fontSize = 42;
    drawTextLine0380.origin = CGPointMake(3578, 4030);
    drawTextLine0380.kernSpacing = -0.2;
    [station0176.nameOriginalTextPrimitives addObject:drawTextLine0380];

    MWDrawTextLine *drawTextLine0381 = [[MWDrawTextLine alloc] init];
    drawTextLine0381.text = @"Застава";
    drawTextLine0381.fontName = @"HelveticaNeue";
    drawTextLine0381.fontColor = [UIColor blackColor];
    drawTextLine0381.fontSize = 42;
    drawTextLine0381.origin = CGPointMake(3695, 4070);
    drawTextLine0381.kernSpacing = -0.4;
    [station0176.nameOriginalTextPrimitives addObject:drawTextLine0381];

    MWDrawTextLine *drawTextLine0382 = [[MWDrawTextLine alloc] init];
    drawTextLine0382.text = station0176.nameEnglish;
    drawTextLine0382.fontName = @"HelveticaNeue";
    drawTextLine0382.fontColor = stationNamesEnglishColor;
    drawTextLine0382.fontSize = 28;
    drawTextLine0382.kernSpacing = -0.3;
    drawTextLine0382.origin = CGPointMake(3570, 4115);
    [station0176.nameEnglishTextPrimitives addObject:drawTextLine0382];

    // Добавляем вершину
    edge0077.finishVertex = vertex0033;
    
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
    
    MWDrawLine *drawLine0350 = [[MWDrawLine alloc] init];
    drawLine0350.startPoint = CGPointMake(3892.5, 4059);
    drawLine0350.endPoint = CGPointMake(3892.5, 3633.5);
    drawLine0350.width = 21.5;
    drawLine0350.color = line0010.color;
    [haul0168.drawPrimitives addObject:drawLine0350];

    MWDrawArc *drawArc0059 = [[MWDrawArc alloc] init];
    drawArc0059.center = CGPointMake(3742.5, 3634);
    drawArc0059.startDegrees = 315;
    drawArc0059.endDegrees = 0;
    drawArc0059.radius = 150;
    drawArc0059.width = 21.5;
    drawArc0059.color = line0010.color;
    [haul0168.drawPrimitives addObject:drawArc0059];

    MWDrawLine *drawLine0351 = [[MWDrawLine alloc] init];
    drawLine0351.startPoint = CGPointMake(3849, 3528.5);
    drawLine0351.endPoint = CGPointMake(3790.5, 3470);
    drawLine0351.width = 21.5;
    drawLine0351.color = line0010.color;
    [haul0168.drawPrimitives addObject:drawLine0351];

    // Добавляем станцию "Римская"
    MWStation *station0177 = [[MWStation alloc] init];
    station0177.identifier = @"station0177";
    [edge0061.elements addObject:station0177];
    
    station0177.nameOriginal = @"Римская";
    station0177.nameEnglish = @"Rimskaya";
    station0177.mapLocation = CGPointMake(3790.5, 3470);
    station0177.geoLocation = CGPointMake(55.746689, 37.679514);
    
    MWDrawFillCircle *fillCircle0178 = [[MWDrawFillCircle alloc] init];
    fillCircle0178.center = station0177.mapLocation;
    fillCircle0178.radius = 31.5;
    fillCircle0178.fillColor = line0010.color;
    [station0177.drawPrimitives addObject:fillCircle0178];

    MWDrawFillCircle *fillCircle0179 = [[MWDrawFillCircle alloc] init];
    fillCircle0179.center = station0177.mapLocation;
    fillCircle0179.radius = 14;
    fillCircle0179.fillColor = [UIColor whiteColor];
    [station0177.drawPrimitives addObject:fillCircle0179];

    MWDrawLine *drawLine0352 = [[MWDrawLine alloc] init];
    drawLine0352.startPoint = CGPointMake(3690, 3415);
    drawLine0352.endPoint = CGPointMake(3790, 3415);
    drawLine0352.width = 40;
    drawLine0352.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0177.nameOriginalTextPrimitives addObject:drawLine0352];

    MWDrawTextLine *drawTextLine0383 = [[MWDrawTextLine alloc] init];
    drawTextLine0383.text = station0177.nameOriginal;
    drawTextLine0383.fontName = @"HelveticaNeue";
    drawTextLine0383.fontColor = [UIColor blackColor];
    drawTextLine0383.fontSize = 42;
    drawTextLine0383.origin = CGPointMake(3635, 3386.5);
    drawTextLine0383.kernSpacing = -0.9;
    [station0177.nameOriginalTextPrimitives addObject:drawTextLine0383];

    MWDrawLine *drawLine0353 = [[MWDrawLine alloc] init];
    drawLine0353.startPoint = CGPointMake(3675, 3375);
    drawLine0353.endPoint = CGPointMake(3775, 3375);
    drawLine0353.width = 40;
    drawLine0353.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0177.nameEnglishTextPrimitives addObject:drawLine0353];

    MWDrawTextLine *drawTextLine0384 = [[MWDrawTextLine alloc] init];
    drawTextLine0384.text = station0177.nameEnglish;
    drawTextLine0384.fontName = @"HelveticaNeue";
    drawTextLine0384.fontColor = stationNamesEnglishColor;
    drawTextLine0384.fontSize = 28;
    drawTextLine0384.kernSpacing = -0.6;
    drawTextLine0384.origin = CGPointMake(3681, 3359);
    [station0177.nameEnglishTextPrimitives addObject:drawTextLine0384];

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
    
    MWDrawLine *drawLine0354 = [[MWDrawLine alloc] init];
    drawLine0354.startPoint = CGPointMake(3791, 3470.5);
    drawLine0354.endPoint = CGPointMake(3396.5, 3078);
    drawLine0354.width = 21.5;
    drawLine0354.color = line0010.color;
    [haul0169.drawPrimitives addObject:drawLine0354];

    // Добавляем станцию "Чкаловская"
    MWStation *station0178 = [[MWStation alloc] init];
    station0178.identifier = @"station0178";
    [edge0062.elements addObject:station0178];
    
    station0178.nameOriginal = @"Чкаловская";
    station0178.nameEnglish = @"Chkalovskaya";
    station0178.mapLocation = CGPointMake(3396.5, 3078);
    station0178.geoLocation = CGPointMake(55.756027, 37.659394);
    
    MWDrawFillCircle *fillCircle0180 = [[MWDrawFillCircle alloc] init];
    fillCircle0180.center = station0178.mapLocation;
    fillCircle0180.radius = 31.5;
    fillCircle0180.fillColor = line0010.color;
    [station0178.drawPrimitives addObject:fillCircle0180];
    
    MWDrawFillCircle *fillCircle0181 = [[MWDrawFillCircle alloc] init];
    fillCircle0181.center = station0178.mapLocation;
    fillCircle0181.radius = 14;
    fillCircle0181.fillColor = [UIColor whiteColor];
    [station0178.drawPrimitives addObject:fillCircle0181];

    MWDrawTextLine *drawTextLine0385 = [[MWDrawTextLine alloc] init];
    drawTextLine0385.text = station0178.nameOriginal;
    drawTextLine0385.fontName = @"HelveticaNeue";
    drawTextLine0385.fontColor = [UIColor blackColor];
    drawTextLine0385.fontSize = 42;
    drawTextLine0385.origin = CGPointMake(3138, 3057);
    drawTextLine0385.kernSpacing = -1.4;
    [station0178.nameOriginalTextPrimitives addObject:drawTextLine0385];

    MWDrawTextLine *drawTextLine0386 = [[MWDrawTextLine alloc] init];
    drawTextLine0386.text = station0178.nameEnglish;
    drawTextLine0386.fontName = @"HelveticaNeue";
    drawTextLine0386.fontColor = stationNamesEnglishColor;
    drawTextLine0386.fontSize = 28;
    drawTextLine0386.kernSpacing = -0.6;
    drawTextLine0386.origin = CGPointMake(3191, 3102);
    [station0178.nameEnglishTextPrimitives addObject:drawTextLine0386];

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
    
    MWDrawLine *drawLine0355 = [[MWDrawLine alloc] init];
    drawLine0355.startPoint = CGPointMake(3397, 3078.5);
    drawLine0355.endPoint = CGPointMake(3131, 2812.5);
    drawLine0355.width = 21.5;
    drawLine0355.color = line0010.color;
    [haul0170.drawPrimitives addObject:drawLine0355];
    
    MWDrawArc *drawArc0060 = [[MWDrawArc alloc] init];
    drawArc0060.center = CGPointMake(3025.5, 2919);
    drawArc0060.startDegrees = 270;
    drawArc0060.endDegrees = 315;
    drawArc0060.radius = 150;
    drawArc0060.width = 21.5;
    drawArc0060.color = line0010.color;
    [haul0170.drawPrimitives addObject:drawArc0060];

    MWDrawLine *drawLine0356 = [[MWDrawLine alloc] init];
    drawLine0356.startPoint = CGPointMake(3026, 2769);
    drawLine0356.endPoint = CGPointMake(2970, 2769);
    drawLine0356.width = 21.5;
    drawLine0356.color = line0010.color;
    [haul0170.drawPrimitives addObject:drawLine0356];

    // Добавляем станцию "Сретенский бульвар"
    MWStation *station0179 = [[MWStation alloc] init];
    station0179.identifier = @"station0179";
    [edge0063.elements addObject:station0179];
    
    station0179.nameOriginal = @"Сретенский бульвар";
    station0179.nameEnglish = @"Sretensky Bulvar";
    station0179.mapLocation = CGPointMake(2970, 2769);
    station0179.geoLocation = CGPointMake(55.765801, 37.639253);

    MWDrawFillCircle *fillCircle0182 = [[MWDrawFillCircle alloc] init];
    fillCircle0182.center = station0179.mapLocation;
    fillCircle0182.radius = 31.5;
    fillCircle0182.fillColor = line0010.color;
    [station0179.drawPrimitives addObject:fillCircle0182];
    
    MWDrawFillCircle *fillCircle0183 = [[MWDrawFillCircle alloc] init];
    fillCircle0183.center = station0179.mapLocation;
    fillCircle0183.radius = 14;
    fillCircle0183.fillColor = [UIColor whiteColor];
    [station0179.drawPrimitives addObject:fillCircle0183];

    MWDrawTextLine *drawTextLine0387 = [[MWDrawTextLine alloc] init];
    drawTextLine0387.text = @"Сретенский";
    drawTextLine0387.fontName = @"HelveticaNeue";
    drawTextLine0387.fontColor = [UIColor blackColor];
    drawTextLine0387.fontSize = 42;
    drawTextLine0387.origin = CGPointMake(2813, 2644.5);
    drawTextLine0387.kernSpacing = 0.4;
    [station0179.nameOriginalTextPrimitives addObject:drawTextLine0387];

    MWDrawTextLine *drawTextLine0388 = [[MWDrawTextLine alloc] init];
    drawTextLine0388.text = @"бульвар";
    drawTextLine0388.fontName = @"HelveticaNeue";
    drawTextLine0388.fontColor = [UIColor blackColor];
    drawTextLine0388.fontSize = 42;
    drawTextLine0388.origin = CGPointMake(2891, 2685);
    drawTextLine0388.kernSpacing = -0.2;
    [station0179.nameOriginalTextPrimitives addObject:drawTextLine0388];

    MWDrawTextLine *drawTextLine0389 = [[MWDrawTextLine alloc] init];
    drawTextLine0389.text = station0179.nameEnglish;
    drawTextLine0389.fontName = @"HelveticaNeue";
    drawTextLine0389.fontColor = stationNamesEnglishColor;
    drawTextLine0389.fontSize = 28;
    drawTextLine0389.kernSpacing = -0.2;
    drawTextLine0389.origin = CGPointMake(2843, 2618);
    [station0179.nameEnglishTextPrimitives addObject:drawTextLine0389];

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
    
    MWDrawLine *drawLine0357 = [[MWDrawLine alloc] init];
    drawLine0357.startPoint = CGPointMake(2970.5, 2769);
    drawLine0357.endPoint = CGPointMake(2628, 2769);
    drawLine0357.width = 21.5;
    drawLine0357.color = line0010.color;
    [haul0171.drawPrimitives addObject:drawLine0357];

    MWDrawArc *drawArc0061 = [[MWDrawArc alloc] init];
    drawArc0061.center = CGPointMake(2628.5, 2619);
    drawArc0061.startDegrees = 90;
    drawArc0061.endDegrees = 135;
    drawArc0061.radius = 150;
    drawArc0061.width = 21.5;
    drawArc0061.color = line0010.color;
    [haul0171.drawPrimitives addObject:drawArc0061];

    MWDrawLine *drawLine0358 = [[MWDrawLine alloc] init];
    drawLine0358.startPoint = CGPointMake(2492, 2694.5);
    drawLine0358.endPoint = CGPointMake(2523, 2725.5);
    drawLine0358.width = 21.5;
    drawLine0358.color = line0010.color;
    [haul0171.drawPrimitives addObject:drawLine0358];

    MWDrawArc *drawArc0062 = [[MWDrawArc alloc] init];
    drawArc0062.center = CGPointMake(2598.5, 2589);
    drawArc0062.startDegrees = 135;
    drawArc0062.endDegrees = 180;
    drawArc0062.radius = 150;
    drawArc0062.width = 21.5;
    drawArc0062.color = line0010.color;
    [haul0171.drawPrimitives addObject:drawArc0062];

    // Добавляем станцию "Трубная"
    MWStation *station0180 = [[MWStation alloc] init];
    station0180.identifier = @"station0180";
    [edge0064.elements addObject:station0180];
    
    station0180.nameOriginal = @"Трубная";
    station0180.nameEnglish = @"Trubnaya";
    station0180.mapLocation = CGPointMake(2448.5, 2589);
    station0180.geoLocation = CGPointMake(55.767800, 37.621908);
    
    MWDrawFillCircle *fillCircle0184 = [[MWDrawFillCircle alloc] init];
    fillCircle0184.center = station0180.mapLocation;
    fillCircle0184.radius = 31.5;
    fillCircle0184.fillColor = line0010.color;
    [station0180.drawPrimitives addObject:fillCircle0184];
    
    MWDrawFillCircle *fillCircle0185 = [[MWDrawFillCircle alloc] init];
    fillCircle0185.center = station0180.mapLocation;
    fillCircle0185.radius = 14;
    fillCircle0185.fillColor = [UIColor whiteColor];
    [station0180.drawPrimitives addObject:fillCircle0185];

    MWDrawTextLine *drawTextLine0390 = [[MWDrawTextLine alloc] init];
    drawTextLine0390.text = station0180.nameOriginal;
    drawTextLine0390.fontName = @"HelveticaNeue";
    drawTextLine0390.fontColor = [UIColor blackColor];
    drawTextLine0390.fontSize = 42;
    drawTextLine0390.origin = CGPointMake(2480, 2533);
    drawTextLine0390.kernSpacing = 0.4;
    [station0180.nameOriginalTextPrimitives addObject:drawTextLine0390];

    MWDrawTextLine *drawTextLine0391 = [[MWDrawTextLine alloc] init];
    drawTextLine0391.text = station0180.nameEnglish;
    drawTextLine0391.fontName = @"HelveticaNeue";
    drawTextLine0391.fontColor = stationNamesEnglishColor;
    drawTextLine0391.fontSize = 28;
    drawTextLine0391.kernSpacing = -0.4;
    drawTextLine0391.origin = CGPointMake(2479, 2506);
    [station0180.nameEnglishTextPrimitives addObject:drawTextLine0391];

    // Добавляем вершину
    edge0064.finishVertex = vertex0039;
    
    // Создаем участок линии от "Трубная" до "Петровско-Разумовская"
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0065 = [[MWEdge alloc] init];
    edge0065.identifier = @"edge0065";
    edge0065.developmentName = @"Ребро: Трубная - Петровско-Разумовская";
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
    
    MWDrawLine *drawLine0359 = [[MWDrawLine alloc] init];
    drawLine0359.startPoint = CGPointMake(2448.5, 2589.5);
    drawLine0359.endPoint = CGPointMake(2448.5, 2196);
    drawLine0359.width = 21.5;
    drawLine0359.color = line0010.color;
    [haul0172.drawPrimitives addObject:drawLine0359];

    // Добавляем станцию "Достоевская"
    MWStation *station0181 = [[MWStation alloc] init];
    station0181.identifier = @"station0181";
    [edge0065.elements addObject:station0181];
    
    station0181.nameOriginal = @"Достоевская";
    station0181.nameEnglish = @"Dostoyevskaya";
    station0181.mapLocation = CGPointMake(2448.5, 2196);
    station0181.geoLocation = CGPointMake(55.781314, 37.613786);
    
    MWDrawLine *drawLine0360 = [[MWDrawLine alloc] init];
    drawLine0360.startPoint = CGPointMake(2448.5, 2196);
    drawLine0360.endPoint = CGPointMake(2480, 2196);
    drawLine0360.width = 21.5;
    drawLine0360.color = line0010.color;
    [station0181.drawPrimitives addObject:drawLine0360];

    MWDrawTextLine *drawTextLine0392 = [[MWDrawTextLine alloc] init];
    drawTextLine0392.text = station0181.nameOriginal;
    drawTextLine0392.fontName = @"HelveticaNeue";
    drawTextLine0392.fontColor = [UIColor blackColor];
    drawTextLine0392.fontSize = 42;
    drawTextLine0392.origin = CGPointMake(2487, 2167);
    drawTextLine0392.kernSpacing = 0.0;
    [station0181.nameOriginalTextPrimitives addObject:drawTextLine0392];

    MWDrawTextLine *drawTextLine0393 = [[MWDrawTextLine alloc] init];
    drawTextLine0393.text = station0181.nameEnglish;
    drawTextLine0393.fontName = @"HelveticaNeue";
    drawTextLine0393.fontColor = stationNamesEnglishColor;
    drawTextLine0393.fontSize = 28;
    drawTextLine0393.kernSpacing = -0.8;
    drawTextLine0393.origin = CGPointMake(2492, 2139);
    [station0181.nameEnglishTextPrimitives addObject:drawTextLine0393];

    // Добавляем перегон
    MWHaul *haul0173 = [[MWHaul alloc] init];
    haul0173.identifier = @"haul0173";
    haul0173.length = 1360;
    [edge0065.elements addObject:haul0173];
    
    MWDrawLine *drawLine0361 = [[MWDrawLine alloc] init];
    drawLine0361.startPoint = CGPointMake(2448.5, 2196.5);
    drawLine0361.endPoint = CGPointMake(2448.5, 2053);
    drawLine0361.width = 21.5;
    drawLine0361.color = line0010.color;
    [haul0173.drawPrimitives addObject:drawLine0361];

    // Добавляем станцию "Марьина Роща"
    MWStation *station0182 = [[MWStation alloc] init];
    station0182.identifier = @"station0182";
    [edge0065.elements addObject:station0182];
    
    station0182.nameOriginal = @"Марьина Роща";
    station0182.nameEnglish = @"Mariina Roscha";
    station0182.mapLocation = CGPointMake(2448.5, 2053);
    station0182.geoLocation = CGPointMake(55.793573, 37.616328);

    MWDrawLine *drawLine0362 = [[MWDrawLine alloc] init];
    drawLine0362.startPoint = CGPointMake(2448.5, 2053);
    drawLine0362.endPoint = CGPointMake(2480, 2053);
    drawLine0362.width = 21.5;
    drawLine0362.color = line0010.color;
    [station0182.drawPrimitives addObject:drawLine0362];

    MWDrawTextLine *drawTextLine0394 = [[MWDrawTextLine alloc] init];
    drawTextLine0394.text = station0182.nameOriginal;
    drawTextLine0394.fontName = @"HelveticaNeue";
    drawTextLine0394.fontColor = [UIColor blackColor];
    drawTextLine0394.fontSize = 42;
    drawTextLine0394.origin = CGPointMake(2487, 2023.5);
    drawTextLine0394.kernSpacing = 0.6;
    [station0182.nameOriginalTextPrimitives addObject:drawTextLine0394];
    
    MWDrawTextLine *drawTextLine0395 = [[MWDrawTextLine alloc] init];
    drawTextLine0395.text = station0182.nameEnglish;
    drawTextLine0395.fontName = @"HelveticaNeue";
    drawTextLine0395.fontColor = stationNamesEnglishColor;
    drawTextLine0395.fontSize = 28;
    drawTextLine0395.kernSpacing = 0.2;
    drawTextLine0395.origin = CGPointMake(2493, 1996);
    [station0182.nameEnglishTextPrimitives addObject:drawTextLine0395];

    // Добавляем перегон
    MWHaul *haul0220 = [[MWHaul alloc] init];
    haul0220.identifier = @"haul0220";
    haul0220.length = 2550;
    [edge0065.elements addObject:haul0220];

    MWDrawLine *drawLine0363 = [[MWDrawLine alloc] init];
    drawLine0363.startPoint = CGPointMake(2448.5, 2053.5);
    drawLine0363.endPoint = CGPointMake(2448.5, 1968);
    drawLine0363.width = 21.5;
    drawLine0363.color = line0010.color;
    [haul0220.drawPrimitives addObject:drawLine0363];

    // Добавляем станцию "Бутырская"
    MWStation *station0232 = [[MWStation alloc] init];
    station0232.identifier = @"station0232";
    [edge0065.elements addObject:station0232];
    
    station0232.nameOriginal = @"Бутырская";
    station0232.nameEnglish = @"Butyrskaya";
    station0232.mapLocation = CGPointMake(2448.5, 1968);
    station0232.geoLocation = CGPointMake(55.813333, 37.602778);

    MWDrawLine *drawLine0364 = [[MWDrawLine alloc] init];
    drawLine0364.startPoint = CGPointMake(2448.5, 1968);
    drawLine0364.endPoint = CGPointMake(2480, 1968);
    drawLine0364.width = 21.5;
    drawLine0364.color = line0010.color;
    [station0232.drawPrimitives addObject:drawLine0364];

    MWDrawTextLine *drawTextLine0396 = [[MWDrawTextLine alloc] init];
    drawTextLine0396.text = station0232.nameOriginal;
    drawTextLine0396.fontName = @"HelveticaNeue";
    drawTextLine0396.fontColor = [UIColor blackColor];
    drawTextLine0396.fontSize = 42;
    drawTextLine0396.origin = CGPointMake(2488, 1938);
    drawTextLine0396.kernSpacing = -0.2;
    [station0232.nameOriginalTextPrimitives addObject:drawTextLine0396];
    
    MWDrawTextLine *drawTextLine0397 = [[MWDrawTextLine alloc] init];
    drawTextLine0397.text = station0232.nameEnglish;
    drawTextLine0397.fontName = @"HelveticaNeue";
    drawTextLine0397.fontColor = stationNamesEnglishColor;
    drawTextLine0397.fontSize = 28;
    drawTextLine0397.kernSpacing = -0.4;
    drawTextLine0397.origin = CGPointMake(2489, 1911);
    [station0232.nameEnglishTextPrimitives addObject:drawTextLine0397];

    MWDrawFillCircle *fillCircle0186 = [[MWDrawFillCircle alloc] init];
    fillCircle0186.center = CGPointMake(2380.5, 1964);
    fillCircle0186.radius = 32;
    fillCircle0186.fillColor = line0010.color;
    [station0232.drawPrimitives addObject:fillCircle0186];
    
    MWDrawTextLine *drawTextLine0398 = [[MWDrawTextLine alloc] init];
    drawTextLine0398.text = @"10";
    drawTextLine0398.fontName = @"Georgia-Bold";
    drawTextLine0398.fontColor = [UIColor whiteColor];
    drawTextLine0398.fontSize = 56;
    drawTextLine0398.kernSpacing = -6.0;
    drawTextLine0398.origin = CGPointMake(2351.5, 1926);
    [station0232.drawPrimitives addObject:drawTextLine0398];

    // Добавляем перегон
    MWHaul *haul0221 = [[MWHaul alloc] init];
    haul0221.identifier = @"haul0221";
    haul0221.length = 1410;
    [edge0065.elements addObject:haul0221];

    MWDrawLine *drawLine0365 = [[MWDrawLine alloc] init];
    drawLine0365.startPoint = CGPointMake(2448.5, 1968.5);
    drawLine0365.endPoint = CGPointMake(2448.5, 1896.5);
    drawLine0365.width = 21.5;
    drawLine0365.color = line0010.color;
    [haul0221.drawPrimitives addObject:drawLine0365];

    MWDrawArc *drawArc0063 = [[MWDrawArc alloc] init];
    drawArc0063.center = CGPointMake(2298.5, 1897);
    drawArc0063.startDegrees = 315;
    drawArc0063.endDegrees = 0;
    drawArc0063.radius = 150;
    drawArc0063.width = 21.5;
    drawArc0063.color = line0010.color;
    [haul0221.drawPrimitives addObject:drawArc0063];

    MWDrawLine *drawLine0366 = [[MWDrawLine alloc] init];
    drawLine0366.startPoint = CGPointMake(2405, 1791.5);
    drawLine0366.endPoint = CGPointMake(2391, 1777.5);
    drawLine0366.width = 21.5;
    drawLine0366.color = line0010.color;
    [haul0221.drawPrimitives addObject:drawLine0366];

    // Добавляем станцию "Фонвизинская"
    MWStation *station0233 = [[MWStation alloc] init];
    station0233.identifier = @"station0233";
    [edge0065.elements addObject:station0233];
    
    station0233.nameOriginal = @"Фонвизинская";
    station0233.nameEnglish = @"Fonvizinskaya";
    station0233.mapLocation = CGPointMake(2391, 1777.5);
    station0233.geoLocation = CGPointMake(55.822778, 37.588056);

    MWDrawFillCircle *fillCircle0187 = [[MWDrawFillCircle alloc] init];
    fillCircle0187.center = station0233.mapLocation;
    fillCircle0187.radius = 31.5;
    fillCircle0187.fillColor = line0010.color;
    [station0233.drawPrimitives addObject:fillCircle0187];
    
    MWDrawFillCircle *fillCircle0188 = [[MWDrawFillCircle alloc] init];
    fillCircle0188.center = station0233.mapLocation;
    fillCircle0188.radius = 14;
    fillCircle0188.fillColor = [UIColor whiteColor];
    [station0233.drawPrimitives addObject:fillCircle0188];

    MWDrawTextLine *drawTextLine0399 = [[MWDrawTextLine alloc] init];
    drawTextLine0399.text = station0233.nameOriginal;
    drawTextLine0399.fontName = @"HelveticaNeue";
    drawTextLine0399.fontColor = [UIColor blackColor];
    drawTextLine0399.fontSize = 42;
    drawTextLine0399.origin = CGPointMake(2416.5, 1710);
    drawTextLine0399.kernSpacing = -0.1;
    [station0233.nameOriginalTextPrimitives addObject:drawTextLine0399];

    MWDrawTextLine *drawTextLine0400 = [[MWDrawTextLine alloc] init];
    drawTextLine0400.text = station0233.nameEnglish;
    drawTextLine0400.fontName = @"HelveticaNeue";
    drawTextLine0400.fontColor = stationNamesEnglishColor;
    drawTextLine0400.fontSize = 28;
    drawTextLine0400.kernSpacing = -0.3;
    drawTextLine0400.origin = CGPointMake(2414, 1683);
    [station0233.nameEnglishTextPrimitives addObject:drawTextLine0400];

    // Добавляем перегон
    MWHaul *haul0222 = [[MWHaul alloc] init];
    haul0222.identifier = @"haul0222";
    haul0222.length = 1670;
    [edge0065.elements addObject:haul0222];

    MWDrawLine *drawLine0367 = [[MWDrawLine alloc] init];
    drawLine0367.startPoint = CGPointMake(2391.5, 1778);
    drawLine0367.endPoint = CGPointMake(2320, 1706.5);
    drawLine0367.width = 21.5;
    drawLine0367.color = line0010.color;
    [haul0222.drawPrimitives addObject:drawLine0367];

    MWDrawArc *drawArc0064 = [[MWDrawArc alloc] init];
    drawArc0064.center = CGPointMake(2214.5, 1813);
    drawArc0064.startDegrees = 270;
    drawArc0064.endDegrees = 315;
    drawArc0064.radius = 150;
    drawArc0064.width = 21.5;
    drawArc0064.color = line0010.color;
    [haul0222.drawPrimitives addObject:drawArc0064];

    MWDrawLine *drawLine0368 = [[MWDrawLine alloc] init];
    drawLine0368.startPoint = CGPointMake(2215, 1663);
    drawLine0368.endPoint = CGPointMake(2091.5, 1663);
    drawLine0368.width = 21.5;
    drawLine0368.color = line0010.color;
    [haul0222.drawPrimitives addObject:drawLine0368];

    // Добавляем станцию "Петровско-Разумовская"
    MWStation *station0234 = [[MWStation alloc] init];
    station0234.identifier = @"station0234";
    [edge0065.elements addObject:station0234];
    
    station0234.nameOriginal = @"Петровско-Разумовская";
    station0234.nameEnglish = @"Petrovsko-Razumovskaya";
    station0234.mapLocation = CGPointMake(2091.5, 1663);
    station0234.geoLocation = CGPointMake(55.836944, 37.574444);

    MWDrawFillCircle *fillCircle0189 = [[MWDrawFillCircle alloc] init];
    fillCircle0189.center = station0234.mapLocation;
    fillCircle0189.radius = 31.5;
    fillCircle0189.fillColor = line0010.color;
    [station0234.drawPrimitives addObject:fillCircle0189];
    
    MWDrawFillCircle *fillCircle0190 = [[MWDrawFillCircle alloc] init];
    fillCircle0190.center = station0234.mapLocation;
    fillCircle0190.radius = 14;
    fillCircle0190.fillColor = [UIColor whiteColor];
    [station0234.drawPrimitives addObject:fillCircle0190];

    station0234.showNameOnMap = false;
    [station0234.nameOriginalTextPrimitives addObject:drawTextLine0348];
    [station0234.nameEnglishTextPrimitives addObject:drawTextLine0349];
    
    // Добавляем вершину
    edge0065.finishVertex = vertex0041;
    
    ////////////////////////////////////////////////////////////////
    // 11A - Каховская линия
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
    station0183.nameEnglish = @"Kakhovskaya";
    station0183.mapLocation = CGPointMake(2272.5, 5534);
    station0183.geoLocation = CGPointMake(55.653075, 37.598478);
    
    MWDrawFillCircle *fillCircle0191 = [[MWDrawFillCircle alloc] init];
    fillCircle0191.center = CGPointMake(2214, 5475.5);
    fillCircle0191.radius = 32;
    fillCircle0191.fillColor = line0011.color;
    [station0183.drawPrimitives addObject:fillCircle0191];
    
    MWDrawTextLine *drawTextLine0401 = [[MWDrawTextLine alloc] init];
    drawTextLine0401.text = @"11A";
    drawTextLine0401.fontName = @"Georgia-Bold";
    drawTextLine0401.fontColor = [UIColor whiteColor];
    drawTextLine0401.fontSize = 32;
//    drawTextLine0401.kernSpacing = -6.0;
    drawTextLine0401.origin = CGPointMake(2185, 5454);
    [station0183.drawPrimitives addObject:drawTextLine0401];

    MWDrawFillCircle *fillCircle0192 = [[MWDrawFillCircle alloc] init];
    fillCircle0192.center = station0183.mapLocation;
    fillCircle0192.radius = 31.5;
    fillCircle0192.fillColor = line0011.color;
    [station0183.drawPrimitives addObject:fillCircle0192];
    
    MWDrawFillCircle *fillCircle0193 = [[MWDrawFillCircle alloc] init];
    fillCircle0193.center = station0183.mapLocation;
    fillCircle0193.radius = 14;
    fillCircle0193.fillColor = [UIColor whiteColor];
    [station0183.drawPrimitives addObject:fillCircle0193];

    MWDrawTextLine *drawTextLine0402 = [[MWDrawTextLine alloc] init];
    drawTextLine0402.text = station0183.nameOriginal;
    drawTextLine0402.fontName = @"HelveticaNeue";
    drawTextLine0402.fontColor = [UIColor blackColor];
    drawTextLine0402.fontSize = 42;
    drawTextLine0402.origin = CGPointMake(2021, 5525);
    drawTextLine0402.kernSpacing = -0.0;
    [station0183.nameOriginalTextPrimitives addObject:drawTextLine0402];
    
    MWDrawTextLine *drawTextLine0403 = [[MWDrawTextLine alloc] init];
    drawTextLine0403.text = station0183.nameEnglish;
    drawTextLine0403.fontName = @"HelveticaNeue";
    drawTextLine0403.fontColor = stationNamesEnglishColor;
    drawTextLine0403.fontSize = 28;
    drawTextLine0403.kernSpacing = -0.4;
    drawTextLine0403.origin = CGPointMake(2066, 5570);
    [station0183.nameEnglishTextPrimitives addObject:drawTextLine0403];

    // Добавляем перегон
    MWHaul *haul0174 = [[MWHaul alloc] init];
    haul0174.identifier = @"haul0174";
    haul0174.length = 1340;
    [edge0066.elements addObject:haul0174];
    
    MWDrawLine *drawLine0369 = [[MWDrawLine alloc] init];
    drawLine0369.startPoint = CGPointMake(2272.5, 5534);
    drawLine0369.endPoint = CGPointMake(2617, 5534);
    drawLine0369.width = 21.5;
    drawLine0369.color = line0011.color;
    [haul0174.drawPrimitives addObject:drawLine0369];

    // Добавляем станцию "Варшавская"
    MWStation *station0184 = [[MWStation alloc] init];
    station0184.identifier = @"station0184";
    [edge0066.elements addObject:station0184];
    
    station0184.nameOriginal = @"Варшавская";
    station0184.nameEnglish = @"Varshavskaya";
    station0184.mapLocation = CGPointMake(2617, 5534);
    station0184.geoLocation = CGPointMake(55.653342, 37.619966);
    
    MWDrawLine *drawLine0370 = [[MWDrawLine alloc] init];
    drawLine0370.startPoint = CGPointMake(2617, 5534);
    drawLine0370.endPoint = CGPointMake(2617, 5502);
    drawLine0370.width = 21.5;
    drawLine0370.color = line0011.color;
    [station0184.drawPrimitives addObject:drawLine0370];

    MWDrawTextLine *drawTextLine0404 = [[MWDrawTextLine alloc] init];
    drawTextLine0404.text = station0184.nameOriginal;
    drawTextLine0404.fontName = @"HelveticaNeue";
    drawTextLine0404.fontColor = [UIColor blackColor];
    drawTextLine0404.fontSize = 42;
    drawTextLine0404.origin = CGPointMake(2497, 5453);
    drawTextLine0404.kernSpacing = -0.2;
    [station0184.nameOriginalTextPrimitives addObject:drawTextLine0404];

    MWDrawTextLine *drawTextLine0405 = [[MWDrawTextLine alloc] init];
    drawTextLine0405.text = station0184.nameEnglish;
    drawTextLine0405.fontName = @"HelveticaNeue";
    drawTextLine0405.fontColor = stationNamesEnglishColor;
    drawTextLine0405.fontSize = 28;
    drawTextLine0405.kernSpacing = -0.6;
    drawTextLine0405.origin = CGPointMake(2536, 5426);
    [station0184.nameEnglishTextPrimitives addObject:drawTextLine0405];

    // Добавляем перегон
    MWHaul *haul0175 = [[MWHaul alloc] init];
    haul0175.identifier = @"haul0175";
    haul0175.length = 1830;
    [edge0066.elements addObject:haul0175];
    
    MWDrawLine *drawLine0371 = [[MWDrawLine alloc] init];
    drawLine0371.startPoint = CGPointMake(2616.5, 5534);
    drawLine0371.endPoint = CGPointMake(2839.5, 5534);
    drawLine0371.width = 21.5;
    drawLine0371.color = line0011.color;
    [haul0175.drawPrimitives addObject:drawLine0371];

    MWDrawArc *drawArc0065 = [[MWDrawArc alloc] init];
    drawArc0065.center = CGPointMake(2839, 5384);
    drawArc0065.startDegrees = 45;
    drawArc0065.endDegrees = 90;
    drawArc0065.radius = 150;
    drawArc0065.width = 21.5;
    drawArc0065.color = line0011.color;
    [haul0175.drawPrimitives addObject:drawArc0065];

    MWDrawLine *drawLine0372 = [[MWDrawLine alloc] init];
    drawLine0372.startPoint = CGPointMake(2944.5, 5490.5);
    drawLine0372.endPoint = CGPointMake(2990, 5445);
    drawLine0372.width = 21.5;
    drawLine0372.color = line0011.color;
    [haul0175.drawPrimitives addObject:drawLine0372];

    // Добавляем станцию "Каширская"
    MWStation *station0185 = [[MWStation alloc] init];
    station0185.identifier = @"station0185";
    [edge0066.elements addObject:station0185];
    
    station0185.nameOriginal = @"Каширская";
    station0185.nameEnglish = @"Kashirskaya";
    station0185.mapLocation = CGPointMake(2990, 5445);
    station0185.geoLocation = CGPointMake(55.655134, 37.648840);
    
    MWDrawFillCircle *fillCircle0194 = [[MWDrawFillCircle alloc] init];
    fillCircle0194.center = station0185.mapLocation;
    fillCircle0194.radius = 31.5;
    fillCircle0194.fillColor = line0011.color;
    [station0185.drawPrimitives addObject:fillCircle0194];
    
    MWDrawFillCircle *fillCircle0195 = [[MWDrawFillCircle alloc] init];
    fillCircle0195.center = station0185.mapLocation;
    fillCircle0195.radius = 14;
    fillCircle0195.fillColor = [UIColor whiteColor];
    [station0185.drawPrimitives addObject:fillCircle0195];

    station0185.showNameOnMap = false;
    [station0185.nameOriginalTextPrimitives addObject:drawTextLine0066];
    [station0185.nameEnglishTextPrimitives addObject:drawTextLine0067];
    
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
    station0186.mapLocation = CGPointMake(879, 6432);
    station0186.geoLocation = CGPointMake(55.537949, 37.515379);

    MWDrawFillCircle *fillCircle0196 = [[MWDrawFillCircle alloc] init];
    fillCircle0196.center = CGPointMake(815.5, 6432);
    fillCircle0196.radius = 32;
    fillCircle0196.fillColor = line0012.color;
    [station0186.drawPrimitives addObject:fillCircle0196];
    
    MWDrawTextLine *drawTextLine0406 = [[MWDrawTextLine alloc] init];
    drawTextLine0406.text = @"12";
    drawTextLine0406.fontName = @"Georgia-Bold";
    drawTextLine0406.fontColor = [UIColor whiteColor];
    drawTextLine0406.fontSize = 56;
    drawTextLine0406.kernSpacing = -6.0;
    drawTextLine0406.origin = CGPointMake(786.5, 6394);
    [station0186.drawPrimitives addObject:drawTextLine0406];

    MWDrawLine *drawLine0373 = [[MWDrawLine alloc] init];
    drawLine0373.startPoint = CGPointMake(879, 6400);
    drawLine0373.endPoint = CGPointMake(879, 6464);
    drawLine0373.width = 21.5;
    drawLine0373.color = line0012.color;
    [station0186.drawPrimitives addObject:drawLine0373];

    MWDrawTextLine *drawTextLine0407 = [[MWDrawTextLine alloc] init];
    drawTextLine0407.text = @"Бунинская";
    drawTextLine0407.fontName = @"HelveticaNeue";
    drawTextLine0407.fontColor = [UIColor blackColor];
    drawTextLine0407.fontSize = 42;
    drawTextLine0407.origin = CGPointMake(842, 6456);
    drawTextLine0407.kernSpacing = -0.4;
    [station0186.nameOriginalTextPrimitives addObject:drawTextLine0407];

    MWDrawTextLine *drawTextLine0408 = [[MWDrawTextLine alloc] init];
    drawTextLine0408.text = @"аллея";
    drawTextLine0408.fontName = @"HelveticaNeue";
    drawTextLine0408.fontColor = [UIColor blackColor];
    drawTextLine0408.fontSize = 42;
    drawTextLine0408.origin = CGPointMake(840, 6496);
    drawTextLine0408.kernSpacing = -0.2;
    [station0186.nameOriginalTextPrimitives addObject:drawTextLine0408];

    MWDrawTextLine *drawTextLine0409 = [[MWDrawTextLine alloc] init];
    drawTextLine0409.text = station0186.nameEnglish;
    drawTextLine0409.fontName = @"HelveticaNeue";
    drawTextLine0409.fontColor = stationNamesEnglishColor;
    drawTextLine0409.fontSize = 28;
    drawTextLine0409.kernSpacing = -0.2;
    drawTextLine0409.origin = CGPointMake(840, 6545);
    [station0186.nameEnglishTextPrimitives addObject:drawTextLine0409];

    // Добавляем перегон
    MWHaul *haul0176 = [[MWHaul alloc] init];
    haul0176.identifier = @"haul0176";
    haul0176.length = 1060;
    [edge0067.elements addObject:haul0176];
    
    MWDrawLine *drawLine0374 = [[MWDrawLine alloc] init];
    drawLine0374.startPoint = CGPointMake(879, 6432);
    drawLine0374.endPoint = CGPointMake(1246, 6432);
    drawLine0374.width = 21.5;
    drawLine0374.color = line0012.color;
    [haul0176.drawPrimitives addObject:drawLine0374];

    // Добавляем станцию "Улица Горчакова"
    MWStation *station0187 = [[MWStation alloc] init];
    station0187.identifier = @"station0187";
    [edge0067.elements addObject:station0187];
    
    station0187.nameOriginal = @"Улица Горчакова";
    station0187.nameEnglish = @"Ulitsa Gorchakova";
    station0187.mapLocation = CGPointMake(1246, 6432);
    station0187.geoLocation = CGPointMake(55.542107, 37.531717);

    MWDrawLine *drawLine0375 = [[MWDrawLine alloc] init];
    drawLine0375.startPoint = CGPointMake(1246, 6432);
    drawLine0375.endPoint = CGPointMake(1246, 6464);
    drawLine0375.width = 21.5;
    drawLine0375.color = line0012.color;
    [station0187.drawPrimitives addObject:drawLine0375];

    MWDrawTextLine *drawTextLine0410 = [[MWDrawTextLine alloc] init];
    drawTextLine0410.text = @"Улица";
    drawTextLine0410.fontName = @"HelveticaNeue";
    drawTextLine0410.fontColor = [UIColor blackColor];
    drawTextLine0410.fontSize = 42;
    drawTextLine0410.origin = CGPointMake(1206, 6457.5);
    drawTextLine0410.kernSpacing = 0.4;
    [station0187.nameOriginalTextPrimitives addObject:drawTextLine0410];
    
    MWDrawTextLine *drawTextLine0411 = [[MWDrawTextLine alloc] init];
    drawTextLine0411.text = @"Горчакова";
    drawTextLine0411.fontName = @"HelveticaNeue";
    drawTextLine0411.fontColor = [UIColor blackColor];
    drawTextLine0411.fontSize = 42;
    drawTextLine0411.origin = CGPointMake(1205.5, 6497.5);
    drawTextLine0411.kernSpacing = 0.5;
    [station0187.nameOriginalTextPrimitives addObject:drawTextLine0411];
    
    MWDrawTextLine *drawTextLine0412 = [[MWDrawTextLine alloc] init];
    drawTextLine0412.text = station0187.nameEnglish;
    drawTextLine0412.fontName = @"HelveticaNeue";
    drawTextLine0412.fontColor = stationNamesEnglishColor;
    drawTextLine0412.fontSize = 28;
    drawTextLine0412.kernSpacing = -0.2;
    drawTextLine0412.origin = CGPointMake(1205, 6542);
    [station0187.nameEnglishTextPrimitives addObject:drawTextLine0412];

    // Добавляем перегон
    MWHaul *haul0177 = [[MWHaul alloc] init];
    haul0177.identifier = @"haul0177";
    haul0177.length = 795;
    [edge0067.elements addObject:haul0177];
    
    MWDrawLine *drawLine0376 = [[MWDrawLine alloc] init];
    drawLine0376.startPoint = CGPointMake(1245.5, 6432);
    drawLine0376.endPoint = CGPointMake(1611, 6432);
    drawLine0376.width = 21.5;
    drawLine0376.color = line0012.color;
    [haul0177.drawPrimitives addObject:drawLine0376];

    // Добавляем станцию "Бульвар Адмирала Ушакова"
    MWStation *station0188 = [[MWStation alloc] init];
    station0188.identifier = @"station0188";
    [edge0067.elements addObject:station0188];
    
    station0188.nameOriginal = @"Бульвар Адмирала Ушакова";
    station0188.nameEnglish = @"Bulvar Admirala Ushakova";
    station0188.mapLocation = CGPointMake(1611, 6432);
    station0188.geoLocation = CGPointMake(55.545169, 37.542289);
    
    MWDrawLine *drawLine0377 = [[MWDrawLine alloc] init];
    drawLine0377.startPoint = CGPointMake(1611, 6432);
    drawLine0377.endPoint = CGPointMake(1611, 6464);
    drawLine0377.width = 21.5;
    drawLine0377.color = line0012.color;
    [station0188.drawPrimitives addObject:drawLine0377];
    
    MWDrawTextLine *drawTextLine0413 = [[MWDrawTextLine alloc] init];
    drawTextLine0413.text = @"Бульвар";
    drawTextLine0413.fontName = @"HelveticaNeue";
    drawTextLine0413.fontColor = [UIColor blackColor];
    drawTextLine0413.fontSize = 42;
    drawTextLine0413.origin = CGPointMake(1575.5, 6457);
    drawTextLine0413.kernSpacing = -0.6;
    [station0188.nameOriginalTextPrimitives addObject:drawTextLine0413];

    MWDrawTextLine *drawTextLine0414 = [[MWDrawTextLine alloc] init];
    drawTextLine0414.text = @"Адмирала";
    drawTextLine0414.fontName = @"HelveticaNeue";
    drawTextLine0414.fontColor = [UIColor blackColor];
    drawTextLine0414.fontSize = 42;
    drawTextLine0414.origin = CGPointMake(1576, 6497.5);
    drawTextLine0414.kernSpacing = 1.2;
    [station0188.nameOriginalTextPrimitives addObject:drawTextLine0414];

    MWDrawTextLine *drawTextLine0415 = [[MWDrawTextLine alloc] init];
    drawTextLine0415.text = @"Ушакова";
    drawTextLine0415.fontName = @"HelveticaNeue";
    drawTextLine0415.fontColor = [UIColor blackColor];
    drawTextLine0415.fontSize = 42;
    drawTextLine0415.origin = CGPointMake(1575, 6537);
    drawTextLine0415.kernSpacing = 0.6;
    [station0188.nameOriginalTextPrimitives addObject:drawTextLine0415];

    MWDrawTextLine *drawTextLine0416 = [[MWDrawTextLine alloc] init];
    drawTextLine0416.text = @"Bulvar Admirala";
    drawTextLine0416.fontName = @"HelveticaNeue";
    drawTextLine0416.fontColor = stationNamesEnglishColor;
    drawTextLine0416.fontSize = 28;
    drawTextLine0416.kernSpacing = -0.0;
    drawTextLine0416.origin = CGPointMake(1575, 6582);
    [station0188.nameEnglishTextPrimitives addObject:drawTextLine0416];

    MWDrawTextLine *drawTextLine0417 = [[MWDrawTextLine alloc] init];
    drawTextLine0417.text = @"Ushakova";
    drawTextLine0417.fontName = @"HelveticaNeue";
    drawTextLine0417.fontColor = stationNamesEnglishColor;
    drawTextLine0417.fontSize = 28;
    drawTextLine0417.kernSpacing = -0.6;
    drawTextLine0417.origin = CGPointMake(1574.5, 6613);
    [station0188.nameEnglishTextPrimitives addObject:drawTextLine0417];

    // Добавляем перегон
    MWHaul *haul0178 = [[MWHaul alloc] init];
    haul0178.identifier = @"haul0178";
    haul0178.length = 838;
    [edge0067.elements addObject:haul0178];
    
    MWDrawLine *drawLine0378 = [[MWDrawLine alloc] init];
    drawLine0378.startPoint = CGPointMake(1610.5, 6432);
    drawLine0378.endPoint = CGPointMake(1984, 6432);
    drawLine0378.width = 21.5;
    drawLine0378.color = line0012.color;
    [haul0178.drawPrimitives addObject:drawLine0378];

    // Добавляем станцию "Улица Скобелевская"
    MWStation *station0189 = [[MWStation alloc] init];
    station0189.identifier = @"station0189";
    [edge0067.elements addObject:station0189];
    
    station0189.nameOriginal = @"Улица Скобелевская";
    station0189.nameEnglish = @"Ulitsa Skobelevskaya";
    station0189.mapLocation = CGPointMake(1984, 6432);
    station0189.geoLocation = CGPointMake(55.548142, 37.554662);

    MWDrawLine *drawLine0379 = [[MWDrawLine alloc] init];
    drawLine0379.startPoint = CGPointMake(1984, 6432);
    drawLine0379.endPoint = CGPointMake(1984, 6464);
    drawLine0379.width = 21.5;
    drawLine0379.color = line0012.color;
    [station0189.drawPrimitives addObject:drawLine0379];

    MWDrawTextLine *drawTextLine0418 = [[MWDrawTextLine alloc] init];
    drawTextLine0418.text = @"Улица";
    drawTextLine0418.fontName = @"HelveticaNeue";
    drawTextLine0418.fontColor = [UIColor blackColor];
    drawTextLine0418.fontSize = 42;
    drawTextLine0418.origin = CGPointMake(1943, 6457);
    drawTextLine0418.kernSpacing = -0.0;
    [station0189.nameOriginalTextPrimitives addObject:drawTextLine0418];

    MWDrawTextLine *drawTextLine0419 = [[MWDrawTextLine alloc] init];
    drawTextLine0419.text = @"Скобелевская";
    drawTextLine0419.fontName = @"HelveticaNeue";
    drawTextLine0419.fontColor = [UIColor blackColor];
    drawTextLine0419.fontSize = 42;
    drawTextLine0419.origin = CGPointMake(1943, 6497.5);
    drawTextLine0419.kernSpacing = 0.2;
    [station0189.nameOriginalTextPrimitives addObject:drawTextLine0419];

    MWDrawTextLine *drawTextLine0420 = [[MWDrawTextLine alloc] init];
    drawTextLine0420.text = station0189.nameEnglish;
    drawTextLine0420.fontName = @"HelveticaNeue";
    drawTextLine0420.fontColor = stationNamesEnglishColor;
    drawTextLine0420.fontSize = 28;
    drawTextLine0420.kernSpacing = -0.4;
    drawTextLine0420.origin = CGPointMake(1942, 6542);
    [station0189.nameEnglishTextPrimitives addObject:drawTextLine0420];

    // Добавляем перегон
    MWHaul *haul0179 = [[MWHaul alloc] init];
    haul0179.identifier = @"haul0179";
    haul0179.length = 2870;
    [edge0067.elements addObject:haul0179];
    
    MWDrawLine *drawLine0380 = [[MWDrawLine alloc] init];
    drawLine0380.startPoint = CGPointMake(1983.5, 6432);
    drawLine0380.endPoint = CGPointMake(2170.5, 6432);
    drawLine0380.width = 21.5;
    drawLine0380.color = line0012.color;
    [haul0179.drawPrimitives addObject:drawLine0380];

    MWDrawArc *drawArc0066 = [[MWDrawArc alloc] init];
    drawArc0066.center = CGPointMake(2170, 6352);
    drawArc0066.startDegrees = 0;
    drawArc0066.endDegrees = 90;
    drawArc0066.radius = 80;
    drawArc0066.width = 21.5;
    drawArc0066.color = line0012.color;
    [haul0179.drawPrimitives addObject:drawArc0066];

    MWDrawLine *drawLine0381 = [[MWDrawLine alloc] init];
    drawLine0381.startPoint = CGPointMake(2250, 6352.5);
    drawLine0381.endPoint = CGPointMake(2250, 6312);
    drawLine0381.width = 21.5;
    drawLine0381.color = line0012.color;
    [haul0179.drawPrimitives addObject:drawLine0381];

    // Добавляем станцию "Улица Старокачаловская"
    MWStation *station0190 = [[MWStation alloc] init];
    station0190.identifier = @"station0190";
    [edge0067.elements addObject:station0190];
    
    station0190.nameOriginal = @"Улица Старокачаловская";
    station0190.nameEnglish = @"Ulitsa Starokachalovskaya";
    station0190.mapLocation = CGPointMake(2250, 6312);
    station0190.geoLocation = CGPointMake(55.569340, 37.576513);
    
    MWDrawFillCircle *fillCircle0197 = [[MWDrawFillCircle alloc] init];
    fillCircle0197.center = station0190.mapLocation;
    fillCircle0197.radius = 31.5;
    fillCircle0197.fillColor = line0012.color;
    [station0190.drawPrimitives addObject:fillCircle0197];
    
    MWDrawFillCircle *fillCircle0198 = [[MWDrawFillCircle alloc] init];
    fillCircle0198.center = station0190.mapLocation;
    fillCircle0198.radius = 14;
    fillCircle0198.fillColor = [UIColor whiteColor];
    [station0190.drawPrimitives addObject:fillCircle0198];

    MWDrawTextLine *drawTextLine0421 = [[MWDrawTextLine alloc] init];
    drawTextLine0421.text = station0190.nameOriginal;
    drawTextLine0421.fontName = @"HelveticaNeue";
    drawTextLine0421.fontColor = [UIColor blackColor];
    drawTextLine0421.fontSize = 42;
    drawTextLine0421.origin = CGPointMake(1710, 6283);
    drawTextLine0421.kernSpacing = -0.1;
    [station0190.nameOriginalTextPrimitives addObject:drawTextLine0421];

    MWDrawTextLine *drawTextLine0422 = [[MWDrawTextLine alloc] init];
    drawTextLine0422.text = station0190.nameEnglish;
    drawTextLine0422.fontName = @"HelveticaNeue";
    drawTextLine0422.fontColor = stationNamesEnglishColor;
    drawTextLine0422.fontSize = 28;
    drawTextLine0422.kernSpacing = -0.3;
    drawTextLine0422.origin = CGPointMake(1886, 6328);
    [station0190.nameEnglishTextPrimitives addObject:drawTextLine0422];

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
    station0193.nameEnglish = @"Bitsevsky Park";
    station0193.mapLocation = CGPointMake(1789.5, 6060.5);
    station0193.geoLocation = CGPointMake(55.600478, 37.555521);

    MWDrawFillCircle *fillCircle0199 = [[MWDrawFillCircle alloc] init];
    fillCircle0199.center = station0193.mapLocation;
    fillCircle0199.radius = 31.5;
    fillCircle0199.fillColor = line0012.color;
    [station0193.drawPrimitives addObject:fillCircle0199];
    
    MWDrawFillCircle *fillCircle0200 = [[MWDrawFillCircle alloc] init];
    fillCircle0200.center = station0193.mapLocation;
    fillCircle0200.radius = 14;
    fillCircle0200.fillColor = [UIColor whiteColor];
    [station0193.drawPrimitives addObject:fillCircle0200];

    MWDrawTextLine *drawTextLine0423 = [[MWDrawTextLine alloc] init];
    drawTextLine0423.text = station0193.nameOriginal;
    drawTextLine0423.fontName = @"HelveticaNeue";
    drawTextLine0423.fontColor = [UIColor blackColor];
    drawTextLine0423.fontSize = 42;
    drawTextLine0423.origin = CGPointMake(1468.5, 6087);
    drawTextLine0423.kernSpacing = -0.0;
    [station0193.nameOriginalTextPrimitives addObject:drawTextLine0423];

    MWDrawTextLine *drawTextLine0424 = [[MWDrawTextLine alloc] init];
    drawTextLine0424.text = station0193.nameEnglish;
    drawTextLine0424.fontName = @"HelveticaNeue";
    drawTextLine0424.fontColor = stationNamesEnglishColor;
    drawTextLine0424.fontSize = 28;
    drawTextLine0424.kernSpacing = -0.4;
    drawTextLine0424.origin = CGPointMake(1625, 6132);
    [station0193.nameEnglishTextPrimitives addObject:drawTextLine0424];

    // Добавляем перегон
    MWHaul *haul0181 = [[MWHaul alloc] init];
    haul0181.identifier = @"haul0181";
    haul0181.length = 2490;
    [edge0071.elements addObject:haul0181];
    
    MWDrawLine *drawLine0382 = [[MWDrawLine alloc] init];
    drawLine0382.startPoint = CGPointMake(1789.5, 6060.5);
    drawLine0382.endPoint = CGPointMake(1994, 6060.5);
    drawLine0382.width = 21.5;
    drawLine0382.color = line0012.color;
    [haul0181.drawPrimitives addObject:drawLine0382];

    // Добавляем станцию "Лесопарковая"
    MWStation *station0194 = [[MWStation alloc] init];
    station0194.identifier = @"station0194";
    [edge0071.elements addObject:station0194];
    
    station0194.nameOriginal = @"Лесопарковая";
    station0194.nameEnglish = @"Lesoparkovaya";
    station0194.mapLocation = CGPointMake(1994, 6060.5);
    station0194.geoLocation = CGPointMake(55.582022, 37.577054);

    MWDrawLine *drawLine0383 = [[MWDrawLine alloc] init];
    drawLine0383.startPoint = CGPointMake(1994, 6060.5);
    drawLine0383.endPoint = CGPointMake(1994, 6092);
    drawLine0383.width = 21.5;
    drawLine0383.color = line0012.color;
    [station0194.drawPrimitives addObject:drawLine0383];

    MWDrawTextLine *drawTextLine0425 = [[MWDrawTextLine alloc] init];
    drawTextLine0425.text = station0194.nameOriginal;
    drawTextLine0425.fontName = @"HelveticaNeue";
    drawTextLine0425.fontColor = [UIColor blackColor];
    drawTextLine0425.fontSize = 42;
    drawTextLine0425.origin = CGPointMake(1859, 6087.5);
    drawTextLine0425.kernSpacing = 0.4;
    [station0194.nameOriginalTextPrimitives addObject:drawTextLine0425];
    
    MWDrawTextLine *drawTextLine0426 = [[MWDrawTextLine alloc] init];
    drawTextLine0426.text = station0194.nameEnglish;
    drawTextLine0426.fontName = @"HelveticaNeue";
    drawTextLine0426.fontColor = stationNamesEnglishColor;
    drawTextLine0426.fontSize = 28;
    drawTextLine0426.kernSpacing = -0.2;
    drawTextLine0426.origin = CGPointMake(1911, 6132);
    [station0194.nameEnglishTextPrimitives addObject:drawTextLine0426];

    // Добавляем перегон
    MWHaul *haul0182 = [[MWHaul alloc] init];
    haul0182.identifier = @"haul0182";
    haul0182.length = 1380;
    [edge0071.elements addObject:haul0182];
    
    MWDrawLine *drawLine0384 = [[MWDrawLine alloc] init];
    drawLine0384.startPoint = CGPointMake(1993.5, 6060.5);
    drawLine0384.endPoint = CGPointMake(2170.5, 6060.5);
    drawLine0384.width = 21.5;
    drawLine0384.color = line0012.color;
    [haul0182.drawPrimitives addObject:drawLine0384];

    MWDrawArc *drawArc0067 = [[MWDrawArc alloc] init];
    drawArc0067.center = CGPointMake(2170, 6140.5);
    drawArc0067.startDegrees = 270;
    drawArc0067.endDegrees = 0;
    drawArc0067.radius = 80;
    drawArc0067.width = 21.5;
    drawArc0067.color = line0012.color;
    [haul0182.drawPrimitives addObject:drawArc0067];

    MWDrawLine *drawLine0385 = [[MWDrawLine alloc] init];
    drawLine0385.startPoint = CGPointMake(2250, 6140);
    drawLine0385.endPoint = CGPointMake(2250, 6312);
    drawLine0385.width = 21.5;
    drawLine0385.color = line0012.color;
    [haul0182.drawPrimitives addObject:drawLine0385];

    // Добавляем станцию "Улица Старокачаловская"
    [edge0071.elements addObject:station0190];
    
    // Добавляем вершину
    edge0071.finishVertex = vertex0037;

    ////////////////////////////////////////////////////////////////
    // 14 - Московское центральное кольцо
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Владыкино - Ботанический сад
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0085 = [[MWEdge alloc] init];
    edge0085.identifier = @"edge0085";
    edge0085.developmentName = @"Ребро: Владыкино - Ботанический сад";
    [self.edges addObject:edge0085];
    
    // Добавляем линию
    edge0085.line = line0014;
    
    // Добавляем вершину
    edge0085.startVertex = vertex0045;
    
    // Добавляем станцию Владыкино
    MWStation *station0201 = [[MWStation alloc] init];
    station0201.identifier = @"station0201";
    [edge0085.elements addObject:station0201];
    
    station0201.nameOriginal = @"Владыкино";
    station0201.nameEnglish = @"Vladikino";
    station0201.mapLocation = CGPointMake(2221.5, 1502.5);
    station0201.geoLocation = CGPointMake(55.847222, 37.591944);

    MWDrawFillCircle *fillCircle0201 = [[MWDrawFillCircle alloc] init];
    fillCircle0201.center = station0201.mapLocation;
    fillCircle0201.radius = 31.5;
    fillCircle0201.fillColor = line0014.color;
    [station0201.drawPrimitives addObject:fillCircle0201];
    
    MWDrawFillCircle *fillCircle0202 = [[MWDrawFillCircle alloc] init];
    fillCircle0202.center = station0201.mapLocation;
    fillCircle0202.radius = 27;
    fillCircle0202.fillColor = [UIColor whiteColor];
    [station0201.drawPrimitives addObject:fillCircle0202];

    MWDrawArc *drawArc0076 = [[MWDrawArc alloc] init];
    drawArc0076.center = CGPointMake(2533, 3241);
    drawArc0076.startDegrees = 258.7;
    drawArc0076.endDegrees = 260.9;
    drawArc0076.radius = 1764.5;
    drawArc0076.width = 21.5;
    drawArc0076.color = [UIColor whiteColor];
    [station0201.drawPrimitives addObject:drawArc0076];

    MWDrawFillCircle *fillCircle0203 = [[MWDrawFillCircle alloc] init];
    fillCircle0203.center = station0201.mapLocation;
    fillCircle0203.radius = 14.5;
    fillCircle0203.fillColor = line0014.color;
    [station0201.drawPrimitives addObject:fillCircle0203];
    
    MWDrawFillCircle *fillCircle0204 = [[MWDrawFillCircle alloc] init];
    fillCircle0204.center = station0201.mapLocation;
    fillCircle0204.radius = 11.5;
    fillCircle0204.fillColor = [UIColor whiteColor];
    [station0201.drawPrimitives addObject:fillCircle0204];

    station0201.showNameOnMap = false;
    [station0201.nameOriginalTextPrimitives addObject:drawTextLine0350];
    [station0201.nameEnglishTextPrimitives addObject:drawTextLine0351];
    
    // Добавляем перегон
    MWHaul *haul0189 = [[MWHaul alloc] init];
    haul0189.identifier = @"haul0189";
    haul0189.length = 3090;
    [edge0085.elements addObject:haul0189];

    MWDrawArc *drawArc0068 = [[MWDrawArc alloc] init];
    drawArc0068.center = CGPointMake(2533, 3241);
    drawArc0068.startDegrees = 259.8;
    drawArc0068.endDegrees = 288.9;
    drawArc0068.radius = 1764.5;
    drawArc0068.width = 33;
    drawArc0068.color = line0014.color;
    [haul0189.drawPrimitives addObject:drawArc0068];

    MWDrawArc *drawArc0069 = [[MWDrawArc alloc] init];
    drawArc0069.center = CGPointMake(2533, 3241);
    drawArc0069.startDegrees = 259.8;
    drawArc0069.endDegrees = 288.9;
    drawArc0069.radius = 1764.5;
    drawArc0069.width = 21.5;
    drawArc0069.color = [UIColor whiteColor];
    [haul0189.drawPrimitives addObject:drawArc0069];

    MWDrawFillCircle *fillCircle0205 = [[MWDrawFillCircle alloc] init];
    fillCircle0205.center = CGPointMake(2663.5, 1410);
    fillCircle0205.radius = 32;
    fillCircle0205.fillColor = line0014.color;
    [haul0189.drawPrimitives addObject:fillCircle0205];

    MWDrawFillCircle *fillCircle0206 = [[MWDrawFillCircle alloc] init];
    fillCircle0206.center = CGPointMake(2663.5, 1410);
    fillCircle0206.radius = 28.5;
    fillCircle0206.fillColor = [UIColor whiteColor];
    [haul0189.drawPrimitives addObject:fillCircle0206];

    MWDrawFillCircle *fillCircle0207 = [[MWDrawFillCircle alloc] init];
    fillCircle0207.center = CGPointMake(2663.5, 1410);
    fillCircle0207.radius = 25.5;
    fillCircle0207.fillColor = line0014.color;
    [haul0189.drawPrimitives addObject:fillCircle0207];

    MWDrawFillCircle *fillCircle0208 = [[MWDrawFillCircle alloc] init];
    fillCircle0208.center = CGPointMake(2663.5, 1410);
    fillCircle0208.radius = 21.5;
    fillCircle0208.fillColor = [UIColor whiteColor];
    [haul0189.drawPrimitives addObject:fillCircle0208];

    MWDrawTextLine *drawTextLine0427 = [[MWDrawTextLine alloc] init];
    drawTextLine0427.text = @"14";
    drawTextLine0427.fontName = @"Georgia-Bold";
    drawTextLine0427.fontColor = [UIColor blackColor];
    drawTextLine0427.fontSize = 40;
    drawTextLine0427.kernSpacing = -6.0;
    drawTextLine0427.origin = CGPointMake(2644, 1381);
    [haul0189.drawPrimitives addObject:drawTextLine0427];

    // Добавляем станцию Ботанический сад
    MWStation *station0202 = [[MWStation alloc] init];
    station0202.identifier = @"station0202";
    [edge0085.elements addObject:station0202];
    
    station0202.nameOriginal = @"Ботанический сад";
    station0202.nameEnglish = @"Botanichesky Sad";
    station0202.mapLocation = CGPointMake(3104, 1570.5);
    station0202.geoLocation = CGPointMake(55.845556, 37.640278);

    MWDrawFillCircle *fillCircle0209 = [[MWDrawFillCircle alloc] init];
    fillCircle0209.center = station0202.mapLocation;
    fillCircle0209.radius = 31.5;
    fillCircle0209.fillColor = line0014.color;
    [station0202.drawPrimitives addObject:fillCircle0209];
    
    MWDrawFillCircle *fillCircle0210 = [[MWDrawFillCircle alloc] init];
    fillCircle0210.center = station0202.mapLocation;
    fillCircle0210.radius = 27;
    fillCircle0210.fillColor = [UIColor whiteColor];
    [station0202.drawPrimitives addObject:fillCircle0210];

    MWDrawArc *drawArc0077 = [[MWDrawArc alloc] init];
    drawArc0077.center = CGPointMake(2533, 3241);
    drawArc0077.startDegrees = 287.7;
    drawArc0077.endDegrees = 289.9;
    drawArc0077.radius = 1764.5;
    drawArc0077.width = 21.5;
    drawArc0077.color = [UIColor whiteColor];
    [station0202.drawPrimitives addObject:drawArc0077];

    MWDrawFillCircle *fillCircle0211 = [[MWDrawFillCircle alloc] init];
    fillCircle0211.center = station0202.mapLocation;
    fillCircle0211.radius = 14.5;
    fillCircle0211.fillColor = line0014.color;
    [station0202.drawPrimitives addObject:fillCircle0211];
    
    MWDrawFillCircle *fillCircle0212 = [[MWDrawFillCircle alloc] init];
    fillCircle0212.center = station0202.mapLocation;
    fillCircle0212.radius = 11.5;
    fillCircle0212.fillColor = [UIColor whiteColor];
    [station0202.drawPrimitives addObject:fillCircle0212];

    station0202.showNameOnMap = false;
    [station0202.nameOriginalTextPrimitives addObject:drawTextLine0223];
    [station0202.nameOriginalTextPrimitives addObject:drawTextLine0224];
    [station0202.nameEnglishTextPrimitives addObject:drawTextLine0225];
    
    // Добавляем вершину
    edge0085.finishVertex = vertex0046;

    // Создаем участок линии Ботанический сад - Открытое шоссе
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0086 = [[MWEdge alloc] init];
    edge0086.identifier = @"edge0086";
    edge0086.developmentName = @"Ребро: Ботанический сад - Открытое шоссе";
    [self.edges addObject:edge0086];
    
    // Добавляем линию
    edge0086.line = line0014;
    
    // Добавляем вершину
    edge0086.startVertex = vertex0046;

    // Добавляем станцию Ботанический сад
    [edge0086.elements addObject:station0202];

    // Добавляем перегон
    MWHaul *haul0190 = [[MWHaul alloc] init];
    haul0190.identifier = @"haul0190";
    haul0190.length = 1940;
    [edge0086.elements addObject:haul0190];

    MWDrawArc *drawArc0070 = [[MWDrawArc alloc] init];
    drawArc0070.center = CGPointMake(2533, 3241);
    drawArc0070.startDegrees = 288.8;
    drawArc0070.endDegrees = 292.65;
    drawArc0070.radius = 1764.5;
    drawArc0070.width = 33;
    drawArc0070.color = line0014.color;
    [haul0190.drawPrimitives addObject:drawArc0070];
    
    MWDrawArc *drawArc0071 = [[MWDrawArc alloc] init];
    drawArc0071.center = CGPointMake(2533, 3241);
    drawArc0071.startDegrees = 288.8;
    drawArc0071.endDegrees = 292.65;
    drawArc0071.radius = 1764.5;
    drawArc0071.width = 21.5;
    drawArc0071.color = [UIColor whiteColor];
    [haul0190.drawPrimitives addObject:drawArc0071];

    // Добавляем станцию Ростокино
    MWStation *station0203 = [[MWStation alloc] init];
    station0203.identifier = @"station0203";
    [edge0086.elements addObject:station0203];
    
    station0203.nameOriginal = @"Ростокино";
    station0203.nameEnglish = @"Rostokino";
    station0203.mapLocation = CGPointMake(3205.5, 1606.5);
    station0203.geoLocation = CGPointMake(55.839444, 37.667778);

    MWDrawLine *drawLine0386 = [[MWDrawLine alloc] init];
    drawLine0386.startPoint = CGPointMake(3209.5, 1599.5);
    drawLine0386.endPoint = CGPointMake(3219, 1576);
    drawLine0386.width = 33;
    drawLine0386.color = line0014.color;
    [station0203.drawPrimitives addObject:drawLine0386];

    MWDrawLine *drawLine0387 = [[MWDrawLine alloc] init];
    drawLine0387.startPoint = CGPointMake(3209.25, 1600.5);
    drawLine0387.endPoint = CGPointMake(3216.5, 1581);
    drawLine0387.width = 21.5;
    drawLine0387.color = [UIColor whiteColor];
    [station0203.drawPrimitives addObject:drawLine0387];

    MWDrawTextLine *drawTextLine0428 = [[MWDrawTextLine alloc] init];
    drawTextLine0428.text = station0203.nameOriginal;
    drawTextLine0428.fontName = @"HelveticaNeue";
    drawTextLine0428.fontColor = [UIColor blackColor];
    drawTextLine0428.fontSize = 42;
    drawTextLine0428.origin = CGPointMake(3225, 1538);
    drawTextLine0428.kernSpacing = 0.2;
    [station0203.nameOriginalTextPrimitives addObject:drawTextLine0428];
    
    MWDrawTextLine *drawTextLine0429 = [[MWDrawTextLine alloc] init];
    drawTextLine0429.text = station0203.nameEnglish;
    drawTextLine0429.fontName = @"HelveticaNeue";
    drawTextLine0429.fontColor = stationNamesEnglishColor;
    drawTextLine0429.fontSize = 28;
    drawTextLine0429.kernSpacing = -0.4;
    drawTextLine0429.origin = CGPointMake(3225, 1511);
    [station0203.nameEnglishTextPrimitives addObject:drawTextLine0429];

    // Добавляем перегон
    MWHaul *haul0191 = [[MWHaul alloc] init];
    haul0191.identifier = @"haul0191";
    haul0191.length = 2380;
    [edge0086.elements addObject:haul0191];

    MWDrawArc *drawArc0072 = [[MWDrawArc alloc] init];
    drawArc0072.center = CGPointMake(2533, 3241);
    drawArc0072.startDegrees = 292.6;
    drawArc0072.endDegrees = 298.1;
    drawArc0072.radius = 1764.5;
    drawArc0072.width = 33;
    drawArc0072.color = line0014.color;
    [haul0191.drawPrimitives addObject:drawArc0072];
    
    MWDrawArc *drawArc0073 = [[MWDrawArc alloc] init];
    drawArc0073.center = CGPointMake(2533, 3241);
    drawArc0073.startDegrees = 292.5;
    drawArc0073.endDegrees = 298.1;
    drawArc0073.radius = 1764.5;
    drawArc0073.width = 21.5;
    drawArc0073.color = [UIColor whiteColor];
    [haul0191.drawPrimitives addObject:drawArc0073];

    // Добавляем станцию Белокаменная
    MWStation *station0204 = [[MWStation alloc] init];
    station0204.identifier = @"station0204";
    [edge0086.elements addObject:station0204];
    
    station0204.nameOriginal = @"Белокаменная";
    station0204.nameEnglish = @"Belokamennaya";
    station0204.mapLocation = CGPointMake(3369.5, 1686.5);
    station0204.geoLocation = CGPointMake(55.83, 37.700556);

    MWDrawLine *drawLine0388 = [[MWDrawLine alloc] init];
    drawLine0388.startPoint = CGPointMake(3364, 1696.75);
    drawLine0388.endPoint = CGPointMake(3354, 1715);
    drawLine0388.width = 33;
    drawLine0388.color = line0014.color;
    [station0204.drawPrimitives addObject:drawLine0388];
    
    MWDrawLine *drawLine0389 = [[MWDrawLine alloc] init];
    drawLine0389.startPoint = CGPointMake(3364, 1695.75);
    drawLine0389.endPoint = CGPointMake(3356, 1711);
    drawLine0389.width = 21.5;
    drawLine0389.color = [UIColor whiteColor];
    [station0204.drawPrimitives addObject:drawLine0389];

    MWDrawTextLine *drawTextLine0430 = [[MWDrawTextLine alloc] init];
    drawTextLine0430.text = station0204.nameOriginal;
    drawTextLine0430.fontName = @"HelveticaNeue";
    drawTextLine0430.fontColor = [UIColor blackColor];
    drawTextLine0430.fontSize = 42;
    drawTextLine0430.origin = CGPointMake(3060, 1696);
    drawTextLine0430.kernSpacing = 0.2;
    [station0204.nameOriginalTextPrimitives addObject:drawTextLine0430];
    
    MWDrawTextLine *drawTextLine0431 = [[MWDrawTextLine alloc] init];
    drawTextLine0431.text = station0204.nameEnglish;
    drawTextLine0431.fontName = @"HelveticaNeue";
    drawTextLine0431.fontColor = stationNamesEnglishColor;
    drawTextLine0431.fontSize = 28;
    drawTextLine0431.kernSpacing = -0.2;
    drawTextLine0431.origin = CGPointMake(3153, 1740);
    [station0204.nameEnglishTextPrimitives addObject:drawTextLine0431];

    // Добавляем перегон
    MWHaul *haul0192 = [[MWHaul alloc] init];
    haul0192.identifier = @"haul0192";
    haul0192.length = 2690;
    [edge0086.elements addObject:haul0192];
    
    MWDrawArc *drawArc0074 = [[MWDrawArc alloc] init];
    drawArc0074.center = CGPointMake(2533, 3241);
    drawArc0074.startDegrees = 298.0;
    drawArc0074.endDegrees = 301.25;
    drawArc0074.radius = 1764.5;
    drawArc0074.width = 33;
    drawArc0074.color = line0014.color;
    [haul0192.drawPrimitives addObject:drawArc0074];
    
    MWDrawArc *drawArc0075 = [[MWDrawArc alloc] init];
    drawArc0075.center = CGPointMake(2533, 3241);
    drawArc0075.startDegrees = 297.9;
    drawArc0075.endDegrees = 301.25;
    drawArc0075.radius = 1764.5;
    drawArc0075.width = 21.5;
    drawArc0075.color = [UIColor whiteColor];
    [haul0192.drawPrimitives addObject:drawArc0075];

    // Добавляем станцию Бульвар Рокоссовского
    MWStation *station0205 = [[MWStation alloc] init];
    station0205.identifier = @"station0205";
    [edge0086.elements addObject:station0205];
    
    station0205.nameOriginal = @"Бульвар Рокоссовского";
    station0205.nameEnglish = @"Bulvar Rokossovskogo";
    station0205.mapLocation = CGPointMake(3447.5, 1731.5);
    station0205.geoLocation = CGPointMake(55.817222, 37.736944);

    MWDrawFillCircle *fillCircle0213 = [[MWDrawFillCircle alloc] init];
    fillCircle0213.center = station0205.mapLocation;
    fillCircle0213.radius = 31.5;
    fillCircle0213.fillColor = line0014.color;
    [station0205.drawPrimitives addObject:fillCircle0213];
    
    MWDrawFillCircle *fillCircle0214 = [[MWDrawFillCircle alloc] init];
    fillCircle0214.center = station0205.mapLocation;
    fillCircle0214.radius = 27;
    fillCircle0214.fillColor = [UIColor whiteColor];
    [station0205.drawPrimitives addObject:fillCircle0214];

    MWDrawArc *drawArc0078 = [[MWDrawArc alloc] init];
    drawArc0078.center = CGPointMake(2533, 3241);
    drawArc0078.startDegrees = 300.15;
    drawArc0078.endDegrees = 302.35;
    drawArc0078.radius = 1764.5;
    drawArc0078.width = 21.5;
    drawArc0078.color = [UIColor whiteColor];
    [station0205.drawPrimitives addObject:drawArc0078];

    MWDrawFillCircle *fillCircle0215 = [[MWDrawFillCircle alloc] init];
    fillCircle0215.center = station0205.mapLocation;
    fillCircle0215.radius = 14.5;
    fillCircle0215.fillColor = line0014.color;
    [station0205.drawPrimitives addObject:fillCircle0215];

    MWDrawFillCircle *fillCircle0216 = [[MWDrawFillCircle alloc] init];
    fillCircle0216.center = station0205.mapLocation;
    fillCircle0216.radius = 11.5;
    fillCircle0216.fillColor = [UIColor whiteColor];
    [station0205.drawPrimitives addObject:fillCircle0216];

    station0205.showNameOnMap = false;
    [station0205.nameOriginalTextPrimitives addObject:drawTextLine0050];
    [station0205.nameEnglishTextPrimitives addObject:drawTextLine0051];

    // Добавляем вершину
    edge0086.finishVertex = vertex0008;

    // Создаем участок линии Бульвар Рокоссовского - Локомотив
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0087 = [[MWEdge alloc] init];
    edge0087.identifier = @"edge0087";
    edge0087.developmentName = @"Ребро: Бульвар Рокоссовского - Локомотив";
    [self.edges addObject:edge0087];
    
    // Добавляем линию
    edge0087.line = line0014;
    
    // Добавляем вершину
    edge0087.startVertex = vertex0008;

    // Добавляем станцию Открытое шоссе
    [edge0087.elements addObject:station0205];

    // Добавляем перегон
    MWHaul *haul0193 = [[MWHaul alloc] init];
    haul0193.identifier = @"haul0193";
    haul0193.length = 1640;
    [edge0087.elements addObject:haul0193];

    MWDrawArc *drawArc0079 = [[MWDrawArc alloc] init];
    drawArc0079.center = CGPointMake(2533, 3241);
    drawArc0079.startDegrees = 301.2;
    drawArc0079.endDegrees = 308.5;
    drawArc0079.radius = 1764.5;
    drawArc0079.width = 33;
    drawArc0079.color = line0014.color;
    [haul0193.drawPrimitives addObject:drawArc0079];
    
    MWDrawArc *drawArc0080 = [[MWDrawArc alloc] init];
    drawArc0080.center = CGPointMake(2533, 3241);
    drawArc0080.startDegrees = 301.2;
    drawArc0080.endDegrees = 308.5;
    drawArc0080.radius = 1764.5;
    drawArc0080.width = 21.5;
    drawArc0080.color = [UIColor whiteColor];
    [haul0193.drawPrimitives addObject:drawArc0080];

    // Добавляем станцию Локомотив
    MWStation *station0206 = [[MWStation alloc] init];
    station0206.identifier = @"station0206";
    [edge0087.elements addObject:station0206];
    
    station0206.nameOriginal = @"Локомотив";
    station0206.nameEnglish = @"Lokomotiv";
    station0206.mapLocation = CGPointMake(3632, 1860);
    station0206.geoLocation = CGPointMake(55.8039, 37.7459);

    MWDrawFillCircle *fillCircle0217 = [[MWDrawFillCircle alloc] init];
    fillCircle0217.center = station0206.mapLocation;
    fillCircle0217.radius = 31.5;
    fillCircle0217.fillColor = line0014.color;
    [station0206.drawPrimitives addObject:fillCircle0217];
    
    MWDrawFillCircle *fillCircle0218 = [[MWDrawFillCircle alloc] init];
    fillCircle0218.center = station0206.mapLocation;
    fillCircle0218.radius = 27;
    fillCircle0218.fillColor = [UIColor whiteColor];
    [station0206.drawPrimitives addObject:fillCircle0218];

    MWDrawArc *drawArc0081 = [[MWDrawArc alloc] init];
    drawArc0081.center = CGPointMake(2533, 3241);
    drawArc0081.startDegrees = 307.4;
    drawArc0081.endDegrees = 309.6;
    drawArc0081.radius = 1764.5;
    drawArc0081.width = 21.5;
    drawArc0081.color = [UIColor whiteColor];
    [station0206.drawPrimitives addObject:drawArc0081];

    MWDrawFillCircle *fillCircle0219 = [[MWDrawFillCircle alloc] init];
    fillCircle0219.center = station0206.mapLocation;
    fillCircle0219.radius = 14.5;
    fillCircle0219.fillColor = line0014.color;
    [station0206.drawPrimitives addObject:fillCircle0219];
    
    MWDrawFillCircle *fillCircle0220 = [[MWDrawFillCircle alloc] init];
    fillCircle0220.center = station0206.mapLocation;
    fillCircle0220.radius = 11.5;
    fillCircle0220.fillColor = [UIColor whiteColor];
    [station0206.drawPrimitives addObject:fillCircle0220];

    MWDrawTextLine *drawTextLine0432 = [[MWDrawTextLine alloc] init];
    drawTextLine0432.text = station0206.nameOriginal;
    drawTextLine0432.fontName = @"HelveticaNeue";
    drawTextLine0432.fontColor = [UIColor blackColor];
    drawTextLine0432.fontSize = 42;
    drawTextLine0432.origin = CGPointMake(3670, 1803);
    drawTextLine0432.kernSpacing = 1.4;
    [station0206.nameOriginalTextPrimitives addObject:drawTextLine0432];
    
    MWDrawTextLine *drawTextLine0433 = [[MWDrawTextLine alloc] init];
    drawTextLine0433.text = station0206.nameEnglish;
    drawTextLine0433.fontName = @"HelveticaNeue";
    drawTextLine0433.fontColor = stationNamesEnglishColor;
    drawTextLine0433.fontSize = 28;
    drawTextLine0433.kernSpacing = 0.4;
    drawTextLine0433.origin = CGPointMake(3670, 1776);
    [station0206.nameEnglishTextPrimitives addObject:drawTextLine0433];

    // Добавляем вершину
    edge0087.finishVertex = vertex0047;

    // Создаем участок линии Локомотив - Измайлово
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0088 = [[MWEdge alloc] init];
    edge0088.identifier = @"edge0088";
    edge0088.developmentName = @"Ребро: Локомотив - Измайлово";
    [self.edges addObject:edge0088];
    
    // Добавляем линию
    edge0088.line = line0014;
    
    // Добавляем вершину
    edge0088.startVertex = vertex0047;

    // Добавляем станцию Локомотив
    [edge0088.elements addObject:station0206];

    // Добавляем перегон
    MWHaul *haul0194 = [[MWHaul alloc] init];
    haul0194.identifier = @"haul0194";
    haul0194.length = 1660;
    [edge0088.elements addObject:haul0194];

    MWDrawArc *drawArc0082 = [[MWDrawArc alloc] init];
    drawArc0082.center = CGPointMake(2533, 3241);
    drawArc0082.startDegrees = 308.4;
    drawArc0082.endDegrees = 329.3;
    drawArc0082.radius = 1764.5;
    drawArc0082.width = 33;
    drawArc0082.color = line0014.color;
    [haul0194.drawPrimitives addObject:drawArc0082];

    MWDrawArc *drawArc0083 = [[MWDrawArc alloc] init];
    drawArc0083.center = CGPointMake(2533, 3241);
    drawArc0083.startDegrees = 308.4;
    drawArc0083.endDegrees = 329.3;
    drawArc0083.radius = 1764.5;
    drawArc0083.width = 21.5;
    drawArc0083.color = [UIColor whiteColor];
    [haul0194.drawPrimitives addObject:drawArc0083];

    // Добавляем станцию Измайловский парк
    MWStation *station0207 = [[MWStation alloc] init];
    station0207.identifier = @"station0207";
    [edge0088.elements addObject:station0207];

    station0207.nameOriginal = @"Измайлово";
    station0207.nameEnglish = @"Izmaylovо";
    station0207.mapLocation = CGPointMake(4050, 2339);
    station0207.geoLocation = CGPointMake(55.788611, 37.742778);
    
    MWDrawFillCircle *fillCircle0221 = [[MWDrawFillCircle alloc] init];
    fillCircle0221.center = station0207.mapLocation;
    fillCircle0221.radius = 31.5;
    fillCircle0221.fillColor = line0014.color;
    [station0207.drawPrimitives addObject:fillCircle0221];

    MWDrawFillCircle *fillCircle0222 = [[MWDrawFillCircle alloc] init];
    fillCircle0222.center = station0207.mapLocation;
    fillCircle0222.radius = 27;
    fillCircle0222.fillColor = [UIColor whiteColor];
    [station0207.drawPrimitives addObject:fillCircle0222];
    
    MWDrawArc *drawArc0084 = [[MWDrawArc alloc] init];
    drawArc0084.center = CGPointMake(2533, 3241);
    drawArc0084.startDegrees = 328.2;
    drawArc0084.endDegrees = 330.3;
    drawArc0084.radius = 1764.5;
    drawArc0084.width = 21.5;
    drawArc0084.color = [UIColor whiteColor];
    [station0207.drawPrimitives addObject:drawArc0084];

    MWDrawFillCircle *fillCircle0223 = [[MWDrawFillCircle alloc] init];
    fillCircle0223.center = station0207.mapLocation;
    fillCircle0223.radius = 14.5;
    fillCircle0223.fillColor = line0014.color;
    [station0207.drawPrimitives addObject:fillCircle0223];

    MWDrawFillCircle *fillCircle0224 = [[MWDrawFillCircle alloc] init];
    fillCircle0224.center = station0207.mapLocation;
    fillCircle0224.radius = 11.5;
    fillCircle0224.fillColor = [UIColor whiteColor];
    [station0207.drawPrimitives addObject:fillCircle0224];

    MWDrawTextLine *drawTextLine0434 = [[MWDrawTextLine alloc] init];
    drawTextLine0434.text = station0207.nameOriginal;
    drawTextLine0434.fontName = @"HelveticaNeue";
    drawTextLine0434.fontColor = [UIColor blackColor];
    drawTextLine0434.fontSize = 42;
    drawTextLine0434.origin = CGPointMake(3778, 2319);
    drawTextLine0434.kernSpacing = 0.8;
    [station0207.nameOriginalTextPrimitives addObject:drawTextLine0434];

    MWDrawTextLine *drawTextLine0435 = [[MWDrawTextLine alloc] init];
    drawTextLine0435.text = station0207.nameEnglish;
    drawTextLine0435.fontName = @"HelveticaNeue";
    drawTextLine0435.fontColor = stationNamesEnglishColor;
    drawTextLine0435.fontSize = 28;
    drawTextLine0435.kernSpacing = 0.0;
    drawTextLine0435.origin = CGPointMake(3883, 2367);
    [station0207.nameEnglishTextPrimitives addObject:drawTextLine0435];

    // Добавляем вершину
    edge0088.finishVertex = vertex0048;

    // Создаем участок линии Измайлово - Шоссе Энтузиастов
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0089 = [[MWEdge alloc] init];
    edge0089.identifier = @"edge0089";
    edge0089.developmentName = @"Ребро: Измайлово - Шоссе Энтузиастов";
    [self.edges addObject:edge0089];
    
    // Добавляем линию
    edge0089.line = line0014;
    
    // Добавляем вершину
    edge0089.startVertex = vertex0048;

    // Добавляем станцию Измайлово
    [edge0089.elements addObject:station0207];

    // Добавляем перегон
    MWHaul *haul0195 = [[MWHaul alloc] init];
    haul0195.identifier = @"haul0195";
    haul0195.length = 2070;
    [edge0089.elements addObject:haul0195];

    MWDrawArc *drawArc0085 = [[MWDrawArc alloc] init];
    drawArc0085.center = CGPointMake(2533, 3241);
    drawArc0085.startDegrees = 329.2;
    drawArc0085.endDegrees = 348.2;
    drawArc0085.radius = 1764.5;
    drawArc0085.width = 33;
    drawArc0085.color = line0014.color;
    [haul0195.drawPrimitives addObject:drawArc0085];
    
    MWDrawArc *drawArc0086 = [[MWDrawArc alloc] init];
    drawArc0086.center = CGPointMake(2533, 3241);
    drawArc0086.startDegrees = 329.2;
    drawArc0086.endDegrees = 348.2;
    drawArc0086.radius = 1764.5;
    drawArc0086.width = 21.5;
    drawArc0086.color = [UIColor whiteColor];
    [haul0195.drawPrimitives addObject:drawArc0086];

    // Добавляем станцию Соколиная Гора
    MWStation *station0208 = [[MWStation alloc] init];
    station0208.identifier = @"station0208";
    [edge0089.elements addObject:station0208];
    
    station0208.nameOriginal = @"Соколиная Гора";
    station0208.nameEnglish = @"Sokolinaya Gora";
    station0208.mapLocation = CGPointMake(4260.5, 2878.5);
    station0208.geoLocation = CGPointMake(55.77, 37.745278);

    MWDrawLine *drawLine0390 = [[MWDrawLine alloc] init];
    drawLine0390.startPoint = CGPointMake(4249, 2880.5);
    drawLine0390.endPoint = CGPointMake(4229, 2884.5);
    drawLine0390.width = 33;
    drawLine0390.color = line0014.color;
    [station0208.drawPrimitives addObject:drawLine0390];
    
    MWDrawLine *drawLine0391 = [[MWDrawLine alloc] init];
    drawLine0391.startPoint = CGPointMake(4251, 2880.5);
    drawLine0391.endPoint = CGPointMake(4234, 2884);
    drawLine0391.width = 21.5;
    drawLine0391.color = [UIColor whiteColor];
    [station0208.drawPrimitives addObject:drawLine0391];

    MWDrawTextLine *drawTextLine0436 = [[MWDrawTextLine alloc] init];
    drawTextLine0436.text = @"Соколиная";
    drawTextLine0436.fontName = @"HelveticaNeue";
    drawTextLine0436.fontColor = [UIColor blackColor];
    drawTextLine0436.fontSize = 42;
    drawTextLine0436.origin = CGPointMake(4004, 2861);
    drawTextLine0436.kernSpacing = 0.0;
    [station0208.nameOriginalTextPrimitives addObject:drawTextLine0436];

    MWDrawTextLine *drawTextLine0437 = [[MWDrawTextLine alloc] init];
    drawTextLine0437.text = @"Гора";
    drawTextLine0437.fontName = @"HelveticaNeue";
    drawTextLine0437.fontColor = [UIColor blackColor];
    drawTextLine0437.fontSize = 42;
    drawTextLine0437.origin = CGPointMake(4124, 2901);
    drawTextLine0437.kernSpacing = 1.0;
    [station0208.nameOriginalTextPrimitives addObject:drawTextLine0437];

    MWDrawTextLine *drawTextLine0438 = [[MWDrawTextLine alloc] init];
    drawTextLine0438.text = @"Sokolinaya";
    drawTextLine0438.fontName = @"HelveticaNeue";
    drawTextLine0438.fontColor = stationNamesEnglishColor;
    drawTextLine0438.fontSize = 28;
    drawTextLine0438.kernSpacing = -0.3;
    drawTextLine0438.origin = CGPointMake(4087.5, 2949);
    [station0208.nameEnglishTextPrimitives addObject:drawTextLine0438];

    MWDrawTextLine *drawTextLine0439 = [[MWDrawTextLine alloc] init];
    drawTextLine0439.text = @"Gora";
    drawTextLine0439.fontName = @"HelveticaNeue";
    drawTextLine0439.fontColor = stationNamesEnglishColor;
    drawTextLine0439.fontSize = 28;
    drawTextLine0439.kernSpacing = -0.0;
    drawTextLine0439.origin = CGPointMake(4160, 2981);
    [station0208.nameEnglishTextPrimitives addObject:drawTextLine0439];

    // Добавляем перегон
    MWHaul *haul0196 = [[MWHaul alloc] init];
    haul0196.identifier = @"haul0196";
    haul0196.length = 1230;
    [edge0089.elements addObject:haul0196];

    MWDrawArc *drawArc0087 = [[MWDrawArc alloc] init];
    drawArc0087.center = CGPointMake(2533, 3241);
    drawArc0087.startDegrees = 348.1;
    drawArc0087.endDegrees = 357.8;
    drawArc0087.radius = 1764.5;
    drawArc0087.width = 33;
    drawArc0087.color = line0014.color;
    [haul0196.drawPrimitives addObject:drawArc0087];
    
    MWDrawArc *drawArc0088 = [[MWDrawArc alloc] init];
    drawArc0088.center = CGPointMake(2533, 3241);
    drawArc0088.startDegrees = 348.1;
    drawArc0088.endDegrees = 357.8;
    drawArc0088.radius = 1764.5;
    drawArc0088.width = 21.5;
    drawArc0088.color = [UIColor whiteColor];
    [haul0196.drawPrimitives addObject:drawArc0088];

    // Добавляем станцию Шоссе Энтузиастов
    MWStation *station0209 = [[MWStation alloc] init];
    station0209.identifier = @"station0209";
    [edge0089.elements addObject:station0209];
    
    station0209.nameOriginal = @"Шоссе Энтузиастов";
    station0209.nameEnglish = @"Shosse Entuziastov";
    station0209.mapLocation = CGPointMake(4296, 3171.5);
    station0209.geoLocation = CGPointMake(55.7589, 37.7463);

    MWDrawFillCircle *fillCircle0225 = [[MWDrawFillCircle alloc] init];
    fillCircle0225.center = station0209.mapLocation;
    fillCircle0225.radius = 31.5;
    fillCircle0225.fillColor = line0014.color;
    [station0209.drawPrimitives addObject:fillCircle0225];
    
    MWDrawFillCircle *fillCircle0226 = [[MWDrawFillCircle alloc] init];
    fillCircle0226.center = station0209.mapLocation;
    fillCircle0226.radius = 27;
    fillCircle0226.fillColor = [UIColor whiteColor];
    [station0209.drawPrimitives addObject:fillCircle0226];
    
    MWDrawArc *drawArc0089 = [[MWDrawArc alloc] init];
    drawArc0089.center = CGPointMake(2533, 3241);
    drawArc0089.startDegrees = 356.7;
    drawArc0089.endDegrees = 358.9;
    drawArc0089.radius = 1764.5;
    drawArc0089.width = 21.5;
    drawArc0089.color = [UIColor whiteColor];
    [station0209.drawPrimitives addObject:drawArc0089];
    
    MWDrawFillCircle *fillCircle0227 = [[MWDrawFillCircle alloc] init];
    fillCircle0227.center = station0209.mapLocation;
    fillCircle0227.radius = 14.5;
    fillCircle0227.fillColor = line0014.color;
    [station0209.drawPrimitives addObject:fillCircle0227];
    
    MWDrawFillCircle *fillCircle0228 = [[MWDrawFillCircle alloc] init];
    fillCircle0228.center = station0209.mapLocation;
    fillCircle0228.radius = 11.5;
    fillCircle0228.fillColor = [UIColor whiteColor];
    [station0209.drawPrimitives addObject:fillCircle0228];
    
    station0209.showNameOnMap = false;
    [station0209.nameOriginalTextPrimitives addObject:drawLine0269];
    [station0209.nameOriginalTextPrimitives addObject:drawTextLine0288];
    [station0209.nameEnglishTextPrimitives addObject:drawLine0270];
    [station0209.nameEnglishTextPrimitives addObject:drawTextLine0289];

    // Добавляем вершину
    edge0089.finishVertex = vertex0049;

    // Создаем участок линии Шоссе Энтузиастов - Дубровка
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0090 = [[MWEdge alloc] init];
    edge0090.identifier = @"edge0090";
    edge0090.developmentName = @"Ребро: Шоссе Энтузиастов - Дубровка";
    [self.edges addObject:edge0090];
    
    // Добавляем линию
    edge0090.line = line0014;
    
    // Добавляем вершину
    edge0090.startVertex = vertex0049;

    // Добавляем станцию Шоссе Энтузиастов
    [edge0090.elements addObject:station0209];

    // Добавляем перегон
    MWHaul *haul0197 = [[MWHaul alloc] init];
    haul0197.identifier = @"haul0197";
    haul0197.length = 1610;
    [edge0090.elements addObject:haul0197];

    MWDrawArc *drawArc0090 = [[MWDrawArc alloc] init];
    drawArc0090.center = CGPointMake(2533, 3241);
    drawArc0090.startDegrees = 357.7;
    drawArc0090.endDegrees = 5.7;
    drawArc0090.radius = 1764.5;
    drawArc0090.width = 33;
    drawArc0090.color = line0014.color;
    [haul0197.drawPrimitives addObject:drawArc0090];
    
    MWDrawArc *drawArc0091 = [[MWDrawArc alloc] init];
    drawArc0091.center = CGPointMake(2533, 3241);
    drawArc0091.startDegrees = 347.1;
    drawArc0091.endDegrees = 5.7;
    drawArc0091.radius = 1764.5;
    drawArc0091.width = 21.5;
    drawArc0091.color = [UIColor whiteColor];
    [haul0197.drawPrimitives addObject:drawArc0091];

    // Добавляем станцию Андроновка
    MWStation *station0210 = [[MWStation alloc] init];
    station0210.identifier = @"station0210";
    [edge0090.elements addObject:station0210];
    
    station0210.nameOriginal = @"Андроновка";
    station0210.nameEnglish = @"Andronovka";
    station0210.mapLocation = CGPointMake(4290, 3414.5);
    station0210.geoLocation = CGPointMake(55.741111, 37.734444);

    MWDrawLine *drawLine0392 = [[MWDrawLine alloc] init];
    drawLine0392.startPoint = CGPointMake(4300, 3415.5);
    drawLine0392.endPoint = CGPointMake(4323, 3418);
    drawLine0392.width = 33;
    drawLine0392.color = line0014.color;
    [station0210.drawPrimitives addObject:drawLine0392];

    MWDrawLine *drawLine0393 = [[MWDrawLine alloc] init];
    drawLine0393.startPoint = CGPointMake(4298, 3415);
    drawLine0393.endPoint = CGPointMake(4318, 3417);
    drawLine0393.width = 21.5;
    drawLine0393.color = [UIColor whiteColor];
    [station0210.drawPrimitives addObject:drawLine0393];
    
    MWDrawTextLine *drawTextLine0440 = [[MWDrawTextLine alloc] init];
    drawTextLine0440.text = station0210.nameOriginal;
    drawTextLine0440.fontName = @"HelveticaNeue";
    drawTextLine0440.fontColor = [UIColor blackColor];
    drawTextLine0440.fontSize = 42;
    drawTextLine0440.origin = CGPointMake(4330, 3390);
    drawTextLine0440.kernSpacing = 0.5;
    [station0210.nameOriginalTextPrimitives addObject:drawTextLine0440];

    MWDrawTextLine *drawTextLine0441 = [[MWDrawTextLine alloc] init];
    drawTextLine0441.text = station0210.nameEnglish;
    drawTextLine0441.fontName = @"HelveticaNeue";
    drawTextLine0441.fontColor = stationNamesEnglishColor;
    drawTextLine0441.fontSize = 28;
    drawTextLine0441.kernSpacing = -0.0;
    drawTextLine0441.origin = CGPointMake(4335, 3363);
    [station0210.nameEnglishTextPrimitives addObject:drawTextLine0441];

    // Добавляем перегон
    MWHaul *haul0198 = [[MWHaul alloc] init];
    haul0198.identifier = @"haul0198";
    haul0198.length = 1710;
    [edge0090.elements addObject:haul0198];

    MWDrawArc *drawArc0092 = [[MWDrawArc alloc] init];
    drawArc0092.center = CGPointMake(2533, 3241);
    drawArc0092.startDegrees = 5.6;
    drawArc0092.endDegrees = 14.8;
    drawArc0092.radius = 1764.5;
    drawArc0092.width = 33;
    drawArc0092.color = line0014.color;
    [haul0198.drawPrimitives addObject:drawArc0092];

    MWDrawArc *drawArc0093 = [[MWDrawArc alloc] init];
    drawArc0093.center = CGPointMake(2533, 3241);
    drawArc0093.startDegrees = 5.5;
    drawArc0093.endDegrees = 14.8;
    drawArc0093.radius = 1764.5;
    drawArc0093.width = 21.5;
    drawArc0093.color = [UIColor whiteColor];
    [haul0198.drawPrimitives addObject:drawArc0093];

    // Добавляем станцию Нижегородская
    MWStation *station0211 = [[MWStation alloc] init];
    station0211.identifier = @"station0211";
    [edge0090.elements addObject:station0211];
    
    station0211.nameOriginal = @"Нижегородская";
    station0211.nameEnglish = @"Nijegorodskaya";
    station0211.mapLocation = CGPointMake(4240, 3690);
    station0211.geoLocation = CGPointMake(55.732222, 37.72825);

    MWDrawLine *drawLine0394 = [[MWDrawLine alloc] init];
    drawLine0394.startPoint = CGPointMake(4249.5, 3693);
    drawLine0394.endPoint = CGPointMake(4270, 3698.5);
    drawLine0394.width = 33;
    drawLine0394.color = line0014.color;
    [station0211.drawPrimitives addObject:drawLine0394];
    
    MWDrawLine *drawLine0395 = [[MWDrawLine alloc] init];
    drawLine0395.startPoint = CGPointMake(4247.5, 3692.5);
    drawLine0395.endPoint = CGPointMake(4265.5, 3697.5);
    drawLine0395.width = 21.5;
    drawLine0395.color = [UIColor whiteColor];
    [station0211.drawPrimitives addObject:drawLine0395];

    MWDrawTextLine *drawTextLine0442 = [[MWDrawTextLine alloc] init];
    drawTextLine0442.text = station0211.nameOriginal;
    drawTextLine0442.fontName = @"HelveticaNeue";
    drawTextLine0442.fontColor = [UIColor blackColor];
    drawTextLine0442.fontSize = 42;
    drawTextLine0442.origin = CGPointMake(4275, 3680);
    drawTextLine0442.kernSpacing = 0.5;
    [station0211.nameOriginalTextPrimitives addObject:drawTextLine0442];

    MWDrawTextLine *drawTextLine0443 = [[MWDrawTextLine alloc] init];
    drawTextLine0443.text = station0211.nameEnglish;
    drawTextLine0443.fontName = @"HelveticaNeue";
    drawTextLine0443.fontColor = stationNamesEnglishColor;
    drawTextLine0443.fontSize = 28;
    drawTextLine0443.kernSpacing = 0.1;
    drawTextLine0443.origin = CGPointMake(4275, 3725);
    [station0211.nameEnglishTextPrimitives addObject:drawTextLine0443];

    // Добавляем перегон
    MWHaul *haul0199 = [[MWHaul alloc] init];
    haul0199.identifier = @"haul0199";
    haul0199.length = 1130;
    [edge0090.elements addObject:haul0199];

    MWDrawArc *drawArc0094 = [[MWDrawArc alloc] init];
    drawArc0094.center = CGPointMake(2533, 3241);
    drawArc0094.startDegrees = 14.7;
    drawArc0094.endDegrees = 20.5;
    drawArc0094.radius = 1764.5;
    drawArc0094.width = 33;
    drawArc0094.color = line0014.color;
    [haul0199.drawPrimitives addObject:drawArc0094];
   
    MWDrawArc *drawArc0095 = [[MWDrawArc alloc] init];
    drawArc0095.center = CGPointMake(2533, 3241);
    drawArc0095.startDegrees = 14.6;
    drawArc0095.endDegrees = 20.5;
    drawArc0095.radius = 1764.5;
    drawArc0095.width = 21.5;
    drawArc0095.color = [UIColor whiteColor];
    [haul0199.drawPrimitives addObject:drawArc0095];

    // Добавляем станцию Новохохловская
    MWStation *station0212 = [[MWStation alloc] init];
    station0212.identifier = @"station0212";
    [edge0090.elements addObject:station0212];
    
    station0212.nameOriginal = @"Новохохловская";
    station0212.nameEnglish = @"Novokhokhlovskaya";
    station0212.mapLocation = CGPointMake(4187.5, 3856.5);
    station0212.geoLocation = CGPointMake(55.723889, 37.716111);

    MWDrawLine *drawLine0396 = [[MWDrawLine alloc] init];
    drawLine0396.startPoint = CGPointMake(4197.5, 3861.5);
    drawLine0396.endPoint = CGPointMake(4219, 3869);
    drawLine0396.width = 33;
    drawLine0396.color = line0014.color;
    [station0212.drawPrimitives addObject:drawLine0396];
    
    MWDrawLine *drawLine0397 = [[MWDrawLine alloc] init];
    drawLine0397.startPoint = CGPointMake(4195, 3860.5);
    drawLine0397.endPoint = CGPointMake(4214, 3867.5);
    drawLine0397.width = 21.5;
    drawLine0397.color = [UIColor whiteColor];
    [station0212.drawPrimitives addObject:drawLine0397];

    MWDrawTextLine *drawTextLine0444 = [[MWDrawTextLine alloc] init];
    drawTextLine0444.text = station0212.nameOriginal;
    drawTextLine0444.fontName = @"HelveticaNeue";
    drawTextLine0444.fontColor = [UIColor blackColor];
    drawTextLine0444.fontSize = 42;
    drawTextLine0444.origin = CGPointMake(4223, 3848);
    drawTextLine0444.kernSpacing = 0.2;
    [station0212.nameOriginalTextPrimitives addObject:drawTextLine0444];
    
    MWDrawTextLine *drawTextLine0445 = [[MWDrawTextLine alloc] init];
    drawTextLine0445.text = station0212.nameEnglish;
    drawTextLine0445.fontName = @"HelveticaNeue";
    drawTextLine0445.fontColor = stationNamesEnglishColor;
    drawTextLine0445.fontSize = 28;
    drawTextLine0445.kernSpacing = -0.3;
    drawTextLine0445.origin = CGPointMake(4223, 3893);
    [station0212.nameEnglishTextPrimitives addObject:drawTextLine0445];

    // Добавляем перегон
    MWHaul *haul0200 = [[MWHaul alloc] init];
    haul0200.identifier = @"haul0200";
    haul0200.length = 1580;
    [edge0090.elements addObject:haul0200];

    MWDrawArc *drawArc0096 = [[MWDrawArc alloc] init];
    drawArc0096.center = CGPointMake(2533, 3241);
    drawArc0096.startDegrees = 20.3;
    drawArc0096.endDegrees = 46.5;
    drawArc0096.radius = 1764.5;
    drawArc0096.width = 33;
    drawArc0096.color = line0014.color;
    [haul0200.drawPrimitives addObject:drawArc0096];
    
    MWDrawArc *drawArc0097 = [[MWDrawArc alloc] init];
    drawArc0097.center = CGPointMake(2533, 3241);
    drawArc0097.startDegrees = 20.2;
    drawArc0097.endDegrees = 46.5;
    drawArc0097.radius = 1764.5;
    drawArc0097.width = 21.5;
    drawArc0097.color = [UIColor whiteColor];
    [haul0200.drawPrimitives addObject:drawArc0097];

    MWDrawFillCircle *fillCircle0229 = [[MWDrawFillCircle alloc] init];
    fillCircle0229.center = CGPointMake(3843, 4333.5);
    fillCircle0229.radius = 32;
    fillCircle0229.fillColor = line0014.color;
    [haul0200.drawPrimitives addObject:fillCircle0229];
    
    MWDrawFillCircle *fillCircle0230 = [[MWDrawFillCircle alloc] init];
    fillCircle0230.center = CGPointMake(3843, 4333.5);
    fillCircle0230.radius = 28.5;
    fillCircle0230.fillColor = [UIColor whiteColor];
    [haul0200.drawPrimitives addObject:fillCircle0230];
    
    MWDrawFillCircle *fillCircle0231 = [[MWDrawFillCircle alloc] init];
    fillCircle0231.center = CGPointMake(3843, 4333.5);
    fillCircle0231.radius = 25.5;
    fillCircle0231.fillColor = line0014.color;
    [haul0200.drawPrimitives addObject:fillCircle0231];
    
    MWDrawFillCircle *fillCircle0232 = [[MWDrawFillCircle alloc] init];
    fillCircle0232.center = CGPointMake(3843, 4333.5);
    fillCircle0232.radius = 21.5;
    fillCircle0232.fillColor = [UIColor whiteColor];
    [haul0200.drawPrimitives addObject:fillCircle0232];
    
    MWDrawTextLine *drawTextLine0446 = [[MWDrawTextLine alloc] init];
    drawTextLine0446.text = @"14";
    drawTextLine0446.fontName = @"Georgia-Bold";
    drawTextLine0446.fontColor = [UIColor blackColor];
    drawTextLine0446.fontSize = 40;
    drawTextLine0446.kernSpacing = -6.0;
    drawTextLine0446.origin = CGPointMake(3822.5, 4303.5);
    [haul0200.drawPrimitives addObject:drawTextLine0446];

    // Добавляем станцию Волгоградская
    MWStation *station0213 = [[MWStation alloc] init];
    station0213.identifier = @"station0213";
    [edge0090.elements addObject:station0213];
    
    station0213.nameOriginal = @"Угрешская";
    station0213.nameEnglish = @"Ugreshskaya";
    station0213.mapLocation = CGPointMake(3751, 4518.5);
    station0213.geoLocation = CGPointMake(55.718333, 37.697778);

    MWDrawLine *drawLine0398 = [[MWDrawLine alloc] init];
    drawLine0398.startPoint = CGPointMake(3757, 4526.5);
    drawLine0398.endPoint = CGPointMake(3773, 4543.5);
    drawLine0398.width = 33;
    drawLine0398.color = line0014.color;
    [station0213.drawPrimitives addObject:drawLine0398];
    
    MWDrawLine *drawLine0399 = [[MWDrawLine alloc] init];
    drawLine0399.startPoint = CGPointMake(3756.5, 4526);
    drawLine0399.endPoint = CGPointMake(3769, 4539.5);
    drawLine0399.width = 21.5;
    drawLine0399.color = [UIColor whiteColor];
    [station0213.drawPrimitives addObject:drawLine0399];
    
    MWDrawTextLine *drawTextLine0447 = [[MWDrawTextLine alloc] init];
    drawTextLine0447.text = station0213.nameOriginal;
    drawTextLine0447.fontName = @"HelveticaNeue";
    drawTextLine0447.fontColor = [UIColor blackColor];
    drawTextLine0447.fontSize = 42;
    drawTextLine0447.origin = CGPointMake(3775, 4536);
    drawTextLine0447.kernSpacing = 0.4;
    [station0213.nameOriginalTextPrimitives addObject:drawTextLine0447];
    
    MWDrawTextLine *drawTextLine0448 = [[MWDrawTextLine alloc] init];
    drawTextLine0448.text = station0213.nameEnglish;
    drawTextLine0448.fontName = @"HelveticaNeue";
    drawTextLine0448.fontColor = stationNamesEnglishColor;
    drawTextLine0448.fontSize = 28;
    drawTextLine0448.kernSpacing = -0.6;
    drawTextLine0448.origin = CGPointMake(3775, 4585);
    [station0213.nameEnglishTextPrimitives addObject:drawTextLine0448];
    
    // Добавляем перегон
    MWHaul *haul0201 = [[MWHaul alloc] init];
    haul0201.identifier = @"haul0201";
    haul0201.length = 1350;
    [edge0090.elements addObject:haul0201];

    MWDrawArc *drawArc0098 = [[MWDrawArc alloc] init];
    drawArc0098.center = CGPointMake(2533, 3241);
    drawArc0098.startDegrees = 46.4;
    drawArc0098.endDegrees = 58.5;
    drawArc0098.radius = 1764.5;
    drawArc0098.width = 33;
    drawArc0098.color = line0014.color;
    [haul0201.drawPrimitives addObject:drawArc0098];
    
    MWDrawArc *drawArc0099 = [[MWDrawArc alloc] init];
    drawArc0099.center = CGPointMake(2533, 3241);
    drawArc0099.startDegrees = 46.3;
    drawArc0099.endDegrees = 58.5;
    drawArc0099.radius = 1764.5;
    drawArc0099.width = 21.5;
    drawArc0099.color = [UIColor whiteColor];
    [haul0201.drawPrimitives addObject:drawArc0099];

    // Добавляем станцию Дубровка
    MWStation *station0214 = [[MWStation alloc] init];
    station0214.identifier = @"station0214";
    [edge0090.elements addObject:station0214];

    station0214.nameOriginal = @"Дубровка";
    station0214.nameEnglish = @"Dubrovka";
    station0214.mapLocation = CGPointMake(3457.5, 4744.5);
    station0214.geoLocation = CGPointMake(55.71268, 37.677775);

    MWDrawFillCircle *fillCircle0233 = [[MWDrawFillCircle alloc] init];
    fillCircle0233.center = station0214.mapLocation;
    fillCircle0233.radius = 31.5;
    fillCircle0233.fillColor = line0014.color;
    [station0214.drawPrimitives addObject:fillCircle0233];
    
    MWDrawFillCircle *fillCircle0234 = [[MWDrawFillCircle alloc] init];
    fillCircle0234.center = station0214.mapLocation;
    fillCircle0234.radius = 27;
    fillCircle0234.fillColor = [UIColor whiteColor];
    [station0214.drawPrimitives addObject:fillCircle0234];
    
    MWDrawArc *drawArc0100 = [[MWDrawArc alloc] init];
    drawArc0100.center = CGPointMake(2533, 3241);
    drawArc0100.startDegrees = 57.3;
    drawArc0100.endDegrees = 59.5;
    drawArc0100.radius = 1764.5;
    drawArc0100.width = 21.5;
    drawArc0100.color = [UIColor whiteColor];
    [station0214.drawPrimitives addObject:drawArc0100];
    
    MWDrawFillCircle *fillCircle0235 = [[MWDrawFillCircle alloc] init];
    fillCircle0235.center = station0214.mapLocation;
    fillCircle0235.radius = 14.5;
    fillCircle0235.fillColor = line0014.color;
    [station0214.drawPrimitives addObject:fillCircle0235];
    
    MWDrawFillCircle *fillCircle0236 = [[MWDrawFillCircle alloc] init];
    fillCircle0236.center = station0214.mapLocation;
    fillCircle0236.radius = 11.5;
    fillCircle0236.fillColor = [UIColor whiteColor];
    [station0214.drawPrimitives addObject:fillCircle0236];

    MWDrawTextLine *drawTextLine0449 = [[MWDrawTextLine alloc] init];
    drawTextLine0449.text = station0214.nameOriginal;
    drawTextLine0449.fontName = @"HelveticaNeue";
    drawTextLine0449.fontColor = [UIColor blackColor];
    drawTextLine0449.fontSize = 42;
    drawTextLine0449.origin = CGPointMake(3219, 4694);
    drawTextLine0449.kernSpacing = 0.6;
    [station0214.nameOriginalTextPrimitives addObject:drawTextLine0449];

    MWDrawTextLine *drawTextLine0450 = [[MWDrawTextLine alloc] init];
    drawTextLine0450.text = station0214.nameEnglish;
    drawTextLine0450.fontName = @"HelveticaNeue";
    drawTextLine0450.fontColor = stationNamesEnglishColor;
    drawTextLine0450.fontSize = 28;
    drawTextLine0450.kernSpacing = 0.1;
    drawTextLine0450.origin = CGPointMake(3296, 4667);
    [station0214.nameEnglishTextPrimitives addObject:drawTextLine0450];

    // Добавляем вершину
    edge0090.finishVertex = vertex0050;
    
    // Создаем участок линии Дубровка - Автозаводская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0091 = [[MWEdge alloc] init];
    edge0091.identifier = @"edge0091";
    edge0091.developmentName = @"Ребро: Дубровка - Автозаводская";
    [self.edges addObject:edge0091];
    
    // Добавляем линию
    edge0091.line = line0014;
    
    // Добавляем вершину
    edge0091.startVertex = vertex0050;

    // Добавляем станцию Дубровка
    [edge0091.elements addObject:station0214];

    // Добавляем перегон
    MWHaul *haul0202 = [[MWHaul alloc] init];
    haul0202.identifier = @"haul0202";
    haul0202.length = 1220;
    [edge0091.elements addObject:haul0202];
    
    MWDrawArc *drawArc0101 = [[MWDrawArc alloc] init];
    drawArc0101.center = CGPointMake(2533, 3241);
    drawArc0101.startDegrees = 58.4;
    drawArc0101.endDegrees = 74.0;
    drawArc0101.radius = 1764.5;
    drawArc0101.width = 33;
    drawArc0101.color = line0014.color;
    [haul0202.drawPrimitives addObject:drawArc0101];
    
    MWDrawArc *drawArc0102 = [[MWDrawArc alloc] init];
    drawArc0102.center = CGPointMake(2533, 3241);
    drawArc0102.startDegrees = 58.3;
    drawArc0102.endDegrees = 74.0;
    drawArc0102.radius = 1764.5;
    drawArc0102.width = 21.5;
    drawArc0102.color = [UIColor whiteColor];
    [haul0202.drawPrimitives addObject:drawArc0102];

    // Добавляем станцию Автозаводская
    MWStation *station0215 = [[MWStation alloc] init];
    station0215.identifier = @"station0215";
    [edge0091.elements addObject:station0215];
    
    station0215.nameOriginal = @"Автозаводская";
    station0215.nameEnglish = @"Avtozavodskaya";
    station0215.mapLocation = CGPointMake(3022.5, 4936);
    station0215.geoLocation = CGPointMake(55.70631, 37.66314);

    MWDrawFillCircle *fillCircle0237 = [[MWDrawFillCircle alloc] init];
    fillCircle0237.center = station0215.mapLocation;
    fillCircle0237.radius = 31.5;
    fillCircle0237.fillColor = line0014.color;
    [station0215.drawPrimitives addObject:fillCircle0237];
    
    MWDrawFillCircle *fillCircle0238 = [[MWDrawFillCircle alloc] init];
    fillCircle0238.center = station0215.mapLocation;
    fillCircle0238.radius = 27;
    fillCircle0238.fillColor = [UIColor whiteColor];
    [station0215.drawPrimitives addObject:fillCircle0238];
    
    MWDrawArc *drawArc0103 = [[MWDrawArc alloc] init];
    drawArc0103.center = CGPointMake(2533, 3241);
    drawArc0103.startDegrees = 72.8;
    drawArc0103.endDegrees = 75.0;
    drawArc0103.radius = 1764.5;
    drawArc0103.width = 21.5;
    drawArc0103.color = [UIColor whiteColor];
    [station0215.drawPrimitives addObject:drawArc0103];
    
    MWDrawFillCircle *fillCircle0239 = [[MWDrawFillCircle alloc] init];
    fillCircle0239.center = station0215.mapLocation;
    fillCircle0239.radius = 14.5;
    fillCircle0239.fillColor = line0014.color;
    [station0215.drawPrimitives addObject:fillCircle0239];
    
    MWDrawFillCircle *fillCircle0240 = [[MWDrawFillCircle alloc] init];
    fillCircle0240.center = station0215.mapLocation;
    fillCircle0240.radius = 11.5;
    fillCircle0240.fillColor = [UIColor whiteColor];
    [station0215.drawPrimitives addObject:fillCircle0240];

    station0215.showNameOnMap = false;
    [station0215.nameOriginalTextPrimitives addObject:drawLine0063];
    [station0215.nameOriginalTextPrimitives addObject:drawTextLine0072];
    [station0215.nameEnglishTextPrimitives addObject:drawTextLine0073];

    // Добавляем вершину
    edge0091.finishVertex = vertex0051;

    // Создаем участок линии Автозаводская - Площадь Гагарина
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0092 = [[MWEdge alloc] init];
    edge0092.identifier = @"edge0092";
    edge0092.developmentName = @"Ребро: Автозаводская - Площадь Гагарина";
    [self.edges addObject:edge0092];
    
    // Добавляем линию
    edge0092.line = line0014;
    
    // Добавляем вершину
    edge0092.startVertex = vertex0051;

    // Добавляем станцию Автозаводская
    [edge0092.elements addObject:station0215];

    // Добавляем перегон
    MWHaul *haul0203 = [[MWHaul alloc] init];
    haul0203.identifier = @"haul0203";
    haul0203.length = 1080;
    [edge0092.elements addObject:haul0203];

    MWDrawArc *drawArc0104 = [[MWDrawArc alloc] init];
    drawArc0104.center = CGPointMake(2533, 3241);
    drawArc0104.startDegrees = 73.9;
    drawArc0104.endDegrees = 81.25;
    drawArc0104.radius = 1764.5;
    drawArc0104.width = 33;
    drawArc0104.color = line0014.color;
    [haul0203.drawPrimitives addObject:drawArc0104];
    
    MWDrawArc *drawArc0105 = [[MWDrawArc alloc] init];
    drawArc0105.center = CGPointMake(2533, 3241);
    drawArc0105.startDegrees = 73.8;
    drawArc0105.endDegrees = 81.25;
    drawArc0105.radius = 1764.5;
    drawArc0105.width = 21.5;
    drawArc0105.color = [UIColor whiteColor];
    [haul0203.drawPrimitives addObject:drawArc0105];

    // Добавляем станцию ЗИЛ (Парк легенд)
    MWStation *station0216 = [[MWStation alloc] init];
    station0216.identifier = @"station0216";
    [edge0092.elements addObject:station0216];
    
    station0216.nameOriginal = @"ЗИЛ";
    station0216.nameEnglish = @"ZIL";
    station0216.mapLocation = CGPointMake(2803, 4982.5);
    station0216.geoLocation = CGPointMake(55.698333, 37.648333);

    MWDrawLine *drawLine0400 = [[MWDrawLine alloc] init];
    drawLine0400.startPoint = CGPointMake(2800.5, 4973.5);
    drawLine0400.endPoint = CGPointMake(2797.5, 4953.5);
    drawLine0400.width = 33;
    drawLine0400.color = line0014.color;
    [station0216.drawPrimitives addObject:drawLine0400];
    
    MWDrawLine *drawLine0401 = [[MWDrawLine alloc] init];
    drawLine0401.startPoint = CGPointMake(2801.5, 4975.5);
    drawLine0401.endPoint = CGPointMake(2798.5, 4958.5);
    drawLine0401.width = 21.5;
    drawLine0401.color = [UIColor whiteColor];
    [station0216.drawPrimitives addObject:drawLine0401];

    MWDrawTextLine *drawTextLine0451 = [[MWDrawTextLine alloc] init];
    drawTextLine0451.text = station0216.nameOriginal;
    drawTextLine0451.fontName = @"HelveticaNeue";
    drawTextLine0451.fontColor = [UIColor blackColor];
    drawTextLine0451.fontSize = 42;
    drawTextLine0451.origin = CGPointMake(2711, 4907);
    drawTextLine0451.kernSpacing = 2.0;
    [station0216.nameOriginalTextPrimitives addObject:drawTextLine0451];
    
    MWDrawTextLine *drawTextLine0452 = [[MWDrawTextLine alloc] init];
    drawTextLine0452.text = station0216.nameEnglish;
    drawTextLine0452.fontName = @"HelveticaNeue";
    drawTextLine0452.fontColor = stationNamesEnglishColor;
    drawTextLine0452.fontSize = 28;
    drawTextLine0452.kernSpacing = 3.6;
    drawTextLine0452.origin = CGPointMake(2754, 4875);
    [station0216.nameEnglishTextPrimitives addObject:drawTextLine0452];
    
    // Добавляем перегон
    MWHaul *haul0204 = [[MWHaul alloc] init];
    haul0204.identifier = @"haul0204";
    haul0204.length = 2240;
    [edge0092.elements addObject:haul0204];

    MWDrawArc *drawArc0106 = [[MWDrawArc alloc] init];
    drawArc0106.center = CGPointMake(2533, 3241);
    drawArc0106.startDegrees = 81.2;
    drawArc0106.endDegrees = 91.6;
    drawArc0106.radius = 1764.5;
    drawArc0106.width = 33;
    drawArc0106.color = line0014.color;
    [haul0204.drawPrimitives addObject:drawArc0106];
    
    MWDrawArc *drawArc0107 = [[MWDrawArc alloc] init];
    drawArc0107.center = CGPointMake(2533, 3241);
    drawArc0107.startDegrees = 81.1;
    drawArc0107.endDegrees = 91.6;
    drawArc0107.radius = 1764.5;
    drawArc0107.width = 21.5;
    drawArc0107.color = [UIColor whiteColor];
    [haul0204.drawPrimitives addObject:drawArc0107];

    // Добавляем станцию Верхние Котлы
    MWStation *station0217 = [[MWStation alloc] init];
    station0217.identifier = @"station0217";
    [edge0092.elements addObject:station0217];
    
    station0217.nameOriginal = @"Верхние Котлы";
    station0217.nameEnglish = @"Verkhniye Kotly";
    station0217.mapLocation = CGPointMake(2484, 5003.5);
    station0217.geoLocation = CGPointMake(55.69, 37.618889);

    MWDrawLine *drawLine0402 = [[MWDrawLine alloc] init];
    drawLine0402.startPoint = CGPointMake(2484.5, 4993.5);
    drawLine0402.endPoint = CGPointMake(2484.5, 4973.5);
    drawLine0402.width = 33;
    drawLine0402.color = line0014.color;
    [station0217.drawPrimitives addObject:drawLine0402];

    MWDrawLine *drawLine0403 = [[MWDrawLine alloc] init];
    drawLine0403.startPoint = CGPointMake(2484.5, 4995.5);
    drawLine0403.endPoint = CGPointMake(2484.5, 4978.5);
    drawLine0403.width = 21.5;
    drawLine0403.color = [UIColor whiteColor];
    [station0217.drawPrimitives addObject:drawLine0403];

    MWDrawTextLine *drawTextLine0453 = [[MWDrawTextLine alloc] init];
    drawTextLine0453.text = @"Верхние";
    drawTextLine0453.fontName = @"HelveticaNeue";
    drawTextLine0453.fontColor = [UIColor blackColor];
    drawTextLine0453.fontSize = 42;
    drawTextLine0453.origin = CGPointMake(2395.5, 4887);
    drawTextLine0453.kernSpacing = 0.8;
    [station0217.nameOriginalTextPrimitives addObject:drawTextLine0453];

    MWDrawTextLine *drawTextLine0454 = [[MWDrawTextLine alloc] init];
    drawTextLine0454.text = @"Котлы";
    drawTextLine0454.fontName = @"HelveticaNeue";
    drawTextLine0454.fontColor = [UIColor blackColor];
    drawTextLine0454.fontSize = 42;
    drawTextLine0454.origin = CGPointMake(2421, 4927);
    drawTextLine0454.kernSpacing = 0.0;
    [station0217.nameOriginalTextPrimitives addObject:drawTextLine0454];

    MWDrawTextLine *drawTextLine0455 = [[MWDrawTextLine alloc] init];
    drawTextLine0455.text = station0217.nameEnglish;
    drawTextLine0455.fontName = @"HelveticaNeue";
    drawTextLine0455.fontColor = stationNamesEnglishColor;
    drawTextLine0455.fontSize = 28;
    drawTextLine0455.kernSpacing = 0.2;
    drawTextLine0455.origin = CGPointMake(2384, 4860);
    [station0217.nameEnglishTextPrimitives addObject:drawTextLine0455];

    // Добавляем перегон
    MWHaul *haul0205 = [[MWHaul alloc] init];
    haul0205.identifier = @"haul0205";
    haul0205.length = 872;
    [edge0092.elements addObject:haul0205];

    MWDrawArc *drawArc0108 = [[MWDrawArc alloc] init];
    drawArc0108.center = CGPointMake(2533, 3241);
    drawArc0108.startDegrees = 91.5;
    drawArc0108.endDegrees = 108.6;
    drawArc0108.radius = 1764.5;
    drawArc0108.width = 33;
    drawArc0108.color = line0014.color;
    [haul0205.drawPrimitives addObject:drawArc0108];
    
    MWDrawArc *drawArc0109 = [[MWDrawArc alloc] init];
    drawArc0109.center = CGPointMake(2533, 3241);
    drawArc0109.startDegrees = 91.4;
    drawArc0109.endDegrees = 108.6;
    drawArc0109.radius = 1764.5;
    drawArc0109.width = 21.5;
    drawArc0109.color = [UIColor whiteColor];
    [haul0205.drawPrimitives addObject:drawArc0109];

    // Добавляем станцию Крымская
    MWStation *station0218 = [[MWStation alloc] init];
    station0218.identifier = @"station0218";
    [edge0092.elements addObject:station0218];

    station0218.nameOriginal = @"Крымская";
    station0218.nameEnglish = @"Krymskaya";
    station0218.mapLocation = CGPointMake(1972, 4912);
    station0218.geoLocation = CGPointMake(55.690038, 37.605);
    
    MWDrawLine *drawLine0404 = [[MWDrawLine alloc] init];
    drawLine0404.startPoint = CGPointMake(1974.5, 4903.5);
    drawLine0404.endPoint = CGPointMake(1981, 4883.5);
    drawLine0404.width = 33;
    drawLine0404.color = line0014.color;
    [station0218.drawPrimitives addObject:drawLine0404];
    
    MWDrawLine *drawLine0405 = [[MWDrawLine alloc] init];
    drawLine0405.startPoint = CGPointMake(1973.5, 4906.5);
    drawLine0405.endPoint = CGPointMake(1979.5, 4888.5);
    drawLine0405.width = 21.5;
    drawLine0405.color = [UIColor whiteColor];
    [station0218.drawPrimitives addObject:drawLine0405];

    MWDrawTextLine *drawTextLine0456 = [[MWDrawTextLine alloc] init];
    drawTextLine0456.text = station0218.nameOriginal;
    drawTextLine0456.fontName = @"HelveticaNeue";
    drawTextLine0456.fontColor = [UIColor blackColor];
    drawTextLine0456.fontSize = 42;
    drawTextLine0456.origin = CGPointMake(1981, 4839);
    drawTextLine0456.kernSpacing = 0.7;
    [station0218.nameOriginalTextPrimitives addObject:drawTextLine0456];

    MWDrawTextLine *drawTextLine0457 = [[MWDrawTextLine alloc] init];
    drawTextLine0457.text = station0218.nameEnglish;
    drawTextLine0457.fontName = @"HelveticaNeue";
    drawTextLine0457.fontColor = stationNamesEnglishColor;
    drawTextLine0457.fontSize = 28;
    drawTextLine0457.kernSpacing = -0.4;
    drawTextLine0457.origin = CGPointMake(1980, 4812);
    [station0218.nameEnglishTextPrimitives addObject:drawTextLine0457];

    // Добавляем перегон
    MWHaul *haul0206 = [[MWHaul alloc] init];
    haul0206.identifier = @"haul0206";
    haul0206.length = 2290;
    [edge0092.elements addObject:haul0206];

    MWDrawArc *drawArc0110 = [[MWDrawArc alloc] init];
    drawArc0110.center = CGPointMake(2533, 3241);
    drawArc0110.startDegrees = 108.5;
    drawArc0110.endDegrees = 119.5;
    drawArc0110.radius = 1764.5;
    drawArc0110.width = 33;
    drawArc0110.color = line0014.color;
    [haul0206.drawPrimitives addObject:drawArc0110];

    MWDrawArc *drawArc0111 = [[MWDrawArc alloc] init];
    drawArc0111.center = CGPointMake(2533, 3241);
    drawArc0111.startDegrees = 108.4;
    drawArc0111.endDegrees = 119.5;
    drawArc0111.radius = 1764.5;
    drawArc0111.width = 21.5;
    drawArc0111.color = [UIColor whiteColor];
    [haul0206.drawPrimitives addObject:drawArc0111];

    // Добавляем станцию Площадь Гагарина
    MWStation *station0219 = [[MWStation alloc] init];
    station0219.identifier = @"station0219";
    [edge0092.elements addObject:station0219];

    station0219.nameOriginal = @"Площадь Гагарина";
    station0219.nameEnglish = @"Ploschad Gagarina";
    station0219.mapLocation = CGPointMake(1666, 4778.5);
    station0219.geoLocation = CGPointMake(55.706944, 37.585833);

    MWDrawFillCircle *fillCircle0241 = [[MWDrawFillCircle alloc] init];
    fillCircle0241.center = station0219.mapLocation;
    fillCircle0241.radius = 31.5;
    fillCircle0241.fillColor = line0014.color;
    [station0219.drawPrimitives addObject:fillCircle0241];
    
    MWDrawFillCircle *fillCircle0242 = [[MWDrawFillCircle alloc] init];
    fillCircle0242.center = station0219.mapLocation;
    fillCircle0242.radius = 27;
    fillCircle0242.fillColor = [UIColor whiteColor];
    [station0219.drawPrimitives addObject:fillCircle0242];
    
    MWDrawArc *drawArc0112 = [[MWDrawArc alloc] init];
    drawArc0112.center = CGPointMake(2533, 3241);
    drawArc0112.startDegrees = 118.3;
    drawArc0112.endDegrees = 120.6;
    drawArc0112.radius = 1764.5;
    drawArc0112.width = 21.5;
    drawArc0112.color = [UIColor whiteColor];
    [station0219.drawPrimitives addObject:drawArc0112];
    
    MWDrawFillCircle *fillCircle0243 = [[MWDrawFillCircle alloc] init];
    fillCircle0243.center = station0219.mapLocation;
    fillCircle0243.radius = 14.5;
    fillCircle0243.fillColor = line0014.color;
    [station0219.drawPrimitives addObject:fillCircle0243];
    
    MWDrawFillCircle *fillCircle0244 = [[MWDrawFillCircle alloc] init];
    fillCircle0244.center = station0219.mapLocation;
    fillCircle0244.radius = 11.5;
    fillCircle0244.fillColor = [UIColor whiteColor];
    [station0219.drawPrimitives addObject:fillCircle0244];
    
    MWDrawTextLine *drawTextLine0458 = [[MWDrawTextLine alloc] init];
    drawTextLine0458.text = @"Площадь";
    drawTextLine0458.fontName = @"HelveticaNeue";
    drawTextLine0458.fontColor = [UIColor blackColor];
    drawTextLine0458.fontSize = 42;
    drawTextLine0458.origin = CGPointMake(1457, 4788);
    drawTextLine0458.kernSpacing = -0.2;
    [station0219.nameOriginalTextPrimitives addObject:drawTextLine0458];

    MWDrawTextLine *drawTextLine0459 = [[MWDrawTextLine alloc] init];
    drawTextLine0459.text = @"Гагарина";
    drawTextLine0459.fontName = @"HelveticaNeue";
    drawTextLine0459.fontColor = [UIColor blackColor];
    drawTextLine0459.fontSize = 42;
    drawTextLine0459.origin = CGPointMake(1455, 4828);
    drawTextLine0459.kernSpacing = 0.2;
    [station0219.nameOriginalTextPrimitives addObject:drawTextLine0459];

    MWDrawTextLine *drawTextLine0460 = [[MWDrawTextLine alloc] init];
    drawTextLine0460.text = @"Ploschad";
    drawTextLine0460.fontName = @"HelveticaNeue";
    drawTextLine0460.fontColor = stationNamesEnglishColor;
    drawTextLine0460.fontSize = 28;
    drawTextLine0460.kernSpacing = -0.6;
    drawTextLine0460.origin = CGPointMake(1525, 4878);
    [station0219.nameEnglishTextPrimitives addObject:drawTextLine0460];

    MWDrawTextLine *drawTextLine0461 = [[MWDrawTextLine alloc] init];
    drawTextLine0461.text = @"Gagarina";
    drawTextLine0461.fontName = @"HelveticaNeue";
    drawTextLine0461.fontColor = stationNamesEnglishColor;
    drawTextLine0461.fontSize = 28;
    drawTextLine0461.kernSpacing = -0.0;
    drawTextLine0461.origin = CGPointMake(1524, 4910);
    [station0219.nameEnglishTextPrimitives addObject:drawTextLine0461];

    // Добавляем вершину
    edge0092.finishVertex = vertex0052;

    // Создаем участок линии Площадь Гагарина - Лужники
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0093 = [[MWEdge alloc] init];
    edge0093.identifier = @"edge0093";
    edge0093.developmentName = @"Ребро: Площадь Гагарина - Лужники";
    [self.edges addObject:edge0093];
    
    // Добавляем линию
    edge0093.line = line0014;
    
    // Добавляем вершину
    edge0093.startVertex = vertex0052;

    // Добавляем станцию Площадь Гагарина
    [edge0093.elements addObject:station0219];

    // Добавляем перегон
    MWHaul *haul0207 = [[MWHaul alloc] init];
    haul0207.identifier = @"haul0207";
    haul0207.length = 2280;
    [edge0093.elements addObject:haul0207];
    
    MWDrawArc *drawArc0113 = [[MWDrawArc alloc] init];
    drawArc0113.center = CGPointMake(2533, 3241);
    drawArc0113.startDegrees = 119.4;
    drawArc0113.endDegrees = 138.7;
    drawArc0113.radius = 1764.5;
    drawArc0113.width = 33;
    drawArc0113.color = line0014.color;
    [haul0207.drawPrimitives addObject:drawArc0113];
    
    MWDrawArc *drawArc0114 = [[MWDrawArc alloc] init];
    drawArc0114.center = CGPointMake(2533, 3241);
    drawArc0114.startDegrees = 119.4;
    drawArc0114.endDegrees = 138.7;
    drawArc0114.radius = 1764.5;
    drawArc0114.width = 21.5;
    drawArc0114.color = [UIColor whiteColor];
    [haul0207.drawPrimitives addObject:drawArc0114];

    // Добавляем станцию Лужники
    MWStation *station0220 = [[MWStation alloc] init];
    station0220.identifier = @"station0220";
    [edge0093.elements addObject:station0220];
    
    station0220.nameOriginal = @"Лужники";
    station0220.nameEnglish = @"Lujniki";
    station0220.mapLocation = CGPointMake(1208.5, 4407);
    station0220.geoLocation = CGPointMake(55.720278, 37.563056);
    
    MWDrawFillCircle *fillCircle0245 = [[MWDrawFillCircle alloc] init];
    fillCircle0245.center = station0220.mapLocation;
    fillCircle0245.radius = 31.5;
    fillCircle0245.fillColor = line0014.color;
    [station0220.drawPrimitives addObject:fillCircle0245];
    
    MWDrawFillCircle *fillCircle0246 = [[MWDrawFillCircle alloc] init];
    fillCircle0246.center = station0220.mapLocation;
    fillCircle0246.radius = 27;
    fillCircle0246.fillColor = [UIColor whiteColor];
    [station0220.drawPrimitives addObject:fillCircle0246];
    
    MWDrawArc *drawArc0115 = [[MWDrawArc alloc] init];
    drawArc0115.center = CGPointMake(2533, 3241);
    drawArc0115.startDegrees = 137.5;
    drawArc0115.endDegrees = 139.9;
    drawArc0115.radius = 1764.5;
    drawArc0115.width = 21.5;
    drawArc0115.color = [UIColor whiteColor];
    [station0220.drawPrimitives addObject:drawArc0115];
    
    MWDrawFillCircle *fillCircle0247 = [[MWDrawFillCircle alloc] init];
    fillCircle0247.center = station0220.mapLocation;
    fillCircle0247.radius = 14.5;
    fillCircle0247.fillColor = line0014.color;
    [station0220.drawPrimitives addObject:fillCircle0247];
    
    MWDrawFillCircle *fillCircle0248 = [[MWDrawFillCircle alloc] init];
    fillCircle0248.center = station0220.mapLocation;
    fillCircle0248.radius = 11.5;
    fillCircle0248.fillColor = [UIColor whiteColor];
    [station0220.drawPrimitives addObject:fillCircle0248];

    MWDrawTextLine *drawTextLine0462 = [[MWDrawTextLine alloc] init];
    drawTextLine0462.text = station0220.nameOriginal;
    drawTextLine0462.fontName = @"HelveticaNeue";
    drawTextLine0462.fontColor = [UIColor blackColor];
    drawTextLine0462.fontSize = 42;
    drawTextLine0462.origin = CGPointMake(1238, 4327);
    drawTextLine0462.kernSpacing = 1.1;
    [station0220.nameOriginalTextPrimitives addObject:drawTextLine0462];

    MWDrawTextLine *drawTextLine0463 = [[MWDrawTextLine alloc] init];
    drawTextLine0463.text = station0220.nameEnglish;
    drawTextLine0463.fontName = @"HelveticaNeue";
    drawTextLine0463.fontColor = stationNamesEnglishColor;
    drawTextLine0463.fontSize = 28;
    drawTextLine0463.kernSpacing = 0.8;
    drawTextLine0463.origin = CGPointMake(1239, 4299);
    [station0220.nameEnglishTextPrimitives addObject:drawTextLine0463];

    // Добавляем вершину
    edge0093.finishVertex = vertex0053;

    // Создаем участок линии Лужники - Кутузовская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0094 = [[MWEdge alloc] init];
    edge0094.identifier = @"edge0094";
    edge0094.developmentName = @"Ребро: Лужники - Кутузовская";
    [self.edges addObject:edge0094];
    
    // Добавляем линию
    edge0094.line = line0014;
    
    // Добавляем вершину
    edge0094.startVertex = vertex0053;

    // Добавляем станцию Лужники
    [edge0094.elements addObject:station0220];

    // Добавляем перегон
    MWHaul *haul0208 = [[MWHaul alloc] init];
    haul0208.identifier = @"haul0208";
    haul0208.length = 2710;
    [edge0094.elements addObject:haul0208];
    
    MWDrawArc *drawArc0116 = [[MWDrawArc alloc] init];
    drawArc0116.center = CGPointMake(2533, 3241);
    drawArc0116.startDegrees = 138.6;
    drawArc0116.endDegrees = 169.5;
    drawArc0116.radius = 1764.5;
    drawArc0116.width = 33;
    drawArc0116.color = line0014.color;
    [haul0208.drawPrimitives addObject:drawArc0116];
    
    MWDrawArc *drawArc0117 = [[MWDrawArc alloc] init];
    drawArc0117.center = CGPointMake(2533, 3241);
    drawArc0117.startDegrees = 138.6;
    drawArc0117.endDegrees = 169.5;
    drawArc0117.radius = 1764.5;
    drawArc0117.width = 21.5;
    drawArc0117.color = [UIColor whiteColor];
    [haul0208.drawPrimitives addObject:drawArc0117];

    // Добавляем станцию Кутузовская
    MWStation *station0221 = [[MWStation alloc] init];
    station0221.identifier = @"station0221";
    [edge0094.elements addObject:station0221];
    
    station0221.nameOriginal = @"Кутузовская";
    station0221.nameEnglish = @"Kutuzovskaya";
    station0221.mapLocation = CGPointMake(797.5, 3563.5);
    station0221.geoLocation = CGPointMake(55.740833, 37.533333);
    
    MWDrawFillCircle *fillCircle0249 = [[MWDrawFillCircle alloc] init];
    fillCircle0249.center = station0221.mapLocation;
    fillCircle0249.radius = 31.5;
    fillCircle0249.fillColor = line0014.color;
    [station0221.drawPrimitives addObject:fillCircle0249];
    
    MWDrawFillCircle *fillCircle0250 = [[MWDrawFillCircle alloc] init];
    fillCircle0250.center = station0221.mapLocation;
    fillCircle0250.radius = 27;
    fillCircle0250.fillColor = [UIColor whiteColor];
    [station0221.drawPrimitives addObject:fillCircle0250];
    
    MWDrawArc *drawArc0118 = [[MWDrawArc alloc] init];
    drawArc0118.center = CGPointMake(2533, 3241);
    drawArc0118.startDegrees = 168.3;
    drawArc0118.endDegrees = 170.7;
    drawArc0118.radius = 1764.5;
    drawArc0118.width = 21.5;
    drawArc0118.color = [UIColor whiteColor];
    [station0221.drawPrimitives addObject:drawArc0118];
    
    MWDrawFillCircle *fillCircle0251 = [[MWDrawFillCircle alloc] init];
    fillCircle0251.center = station0221.mapLocation;
    fillCircle0251.radius = 14.5;
    fillCircle0251.fillColor = line0014.color;
    [station0221.drawPrimitives addObject:fillCircle0251];
    
    MWDrawFillCircle *fillCircle0252 = [[MWDrawFillCircle alloc] init];
    fillCircle0252.center = station0221.mapLocation;
    fillCircle0252.radius = 11.5;
    fillCircle0252.fillColor = [UIColor whiteColor];
    [station0221.drawPrimitives addObject:fillCircle0252];

    station0221.showNameOnMap = false;
    [station0221.nameOriginalTextPrimitives addObject:drawTextLine0157];
    [station0221.nameEnglishTextPrimitives addObject:drawTextLine0158];
    
    // Добавляем вершину
    edge0094.finishVertex = vertex0054;

    // Создаем участок линии Кутузовская - Деловой центр (МЦК)
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0095 = [[MWEdge alloc] init];
    edge0095.identifier = @"edge0095";
    edge0095.developmentName = @"Ребро: Кутузовская - Деловой центр (МЦК)";
    [self.edges addObject:edge0095];
    
    // Добавляем линию
    edge0095.line = line0014;
    
    // Добавляем вершину
    edge0095.startVertex = vertex0054;

    // Добавляем станцию Кутузовская
    [edge0095.elements addObject:station0221];

    // Добавляем перегон
    MWHaul *haul0209 = [[MWHaul alloc] init];
    haul0209.identifier = @"haul0209";
    haul0209.length = 932;
    [edge0095.elements addObject:haul0209];
    
    MWDrawArc *drawArc0119 = [[MWDrawArc alloc] init];
    drawArc0119.center = CGPointMake(2533, 3241);
    drawArc0119.startDegrees = 169.4;
    drawArc0119.endDegrees = 175.4;
    drawArc0119.radius = 1764.5;
    drawArc0119.width = 33;
    drawArc0119.color = line0014.color;
    [haul0209.drawPrimitives addObject:drawArc0119];
    
    MWDrawArc *drawArc0120 = [[MWDrawArc alloc] init];
    drawArc0120.center = CGPointMake(2533, 3241);
    drawArc0120.startDegrees = 169.4;
    drawArc0120.endDegrees = 175.4;
    drawArc0120.radius = 1764.5;
    drawArc0120.width = 21.5;
    drawArc0120.color = [UIColor whiteColor];
    [haul0209.drawPrimitives addObject:drawArc0120];

    // Добавляем станцию Деловой центр (МЦК)
    MWStation *station0222 = [[MWStation alloc] init];
    station0222.identifier = @"station0222";
    [edge0095.elements addObject:station0222];
    
    station0222.nameOriginal = @"Деловой центр (МЦК)";
    station0222.nameEnglish = @"Delovoy Tsentr (MCC)";
    station0222.mapLocation = CGPointMake(773.5, 3383.5);
    station0222.geoLocation = CGPointMake(55.747222, 37.532222);
    
    MWDrawFillCircle *fillCircle0253 = [[MWDrawFillCircle alloc] init];
    fillCircle0253.center = station0222.mapLocation;
    fillCircle0253.radius = 31.5;
    fillCircle0253.fillColor = line0014.color;
    [station0222.drawPrimitives addObject:fillCircle0253];
    
    MWDrawFillCircle *fillCircle0254 = [[MWDrawFillCircle alloc] init];
    fillCircle0254.center = station0222.mapLocation;
    fillCircle0254.radius = 27;
    fillCircle0254.fillColor = [UIColor whiteColor];
    [station0222.drawPrimitives addObject:fillCircle0254];
    
    MWDrawArc *drawArc0121 = [[MWDrawArc alloc] init];
    drawArc0121.center = CGPointMake(2533, 3241);
    drawArc0121.startDegrees = 174.2;
    drawArc0121.endDegrees = 176.6;
    drawArc0121.radius = 1764.5;
    drawArc0121.width = 21.5;
    drawArc0121.color = [UIColor whiteColor];
    [station0222.drawPrimitives addObject:drawArc0121];
    
    MWDrawFillCircle *fillCircle0255 = [[MWDrawFillCircle alloc] init];
    fillCircle0255.center = station0222.mapLocation;
    fillCircle0255.radius = 14.5;
    fillCircle0255.fillColor = line0014.color;
    [station0222.drawPrimitives addObject:fillCircle0255];
    
    MWDrawFillCircle *fillCircle0256 = [[MWDrawFillCircle alloc] init];
    fillCircle0256.center = station0222.mapLocation;
    fillCircle0256.radius = 11.5;
    fillCircle0256.fillColor = [UIColor whiteColor];
    [station0222.drawPrimitives addObject:fillCircle0256];

    MWDrawTextLine *drawTextLine0464 = [[MWDrawTextLine alloc] init];
    drawTextLine0464.text = @"Деловой";
    drawTextLine0464.fontName = @"HelveticaNeue";
    drawTextLine0464.fontColor = [UIColor blackColor];
    drawTextLine0464.fontSize = 42;
    drawTextLine0464.origin = CGPointMake(558, 3375);
    drawTextLine0464.kernSpacing = 0.8;
    [station0222.nameOriginalTextPrimitives addObject:drawTextLine0464];

    MWDrawTextLine *drawTextLine0465 = [[MWDrawTextLine alloc] init];
    drawTextLine0465.text = @"центр (МЦК)";
    drawTextLine0465.fontName = @"HelveticaNeue";
    drawTextLine0465.fontColor = [UIColor blackColor];
    drawTextLine0465.fontSize = 42;
    drawTextLine0465.origin = CGPointMake(474, 3415);
    drawTextLine0465.kernSpacing = 1.8;
    [station0222.nameOriginalTextPrimitives addObject:drawTextLine0465];

    MWDrawTextLine *drawTextLine0466 = [[MWDrawTextLine alloc] init];
    drawTextLine0466.text = station0222.nameEnglish;
    drawTextLine0466.fontName = @"HelveticaNeue";
    drawTextLine0466.fontColor = stationNamesEnglishColor;
    drawTextLine0466.fontSize = 28;
    drawTextLine0466.kernSpacing = 0.1;
    drawTextLine0466.origin = CGPointMake(462, 3460);
    [station0222.nameEnglishTextPrimitives addObject:drawTextLine0466];

    // Добавляем вершину
    edge0095.finishVertex = vertex0022;

    // Создаем участок линии Деловой центр (МЦК) - Хорошёво
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0096 = [[MWEdge alloc] init];
    edge0096.identifier = @"edge0096";
    edge0096.developmentName = @"Ребро: Деловой центр (МЦК) - Хорошёво";
    [self.edges addObject:edge0096];
    
    // Добавляем линию
    edge0096.line = line0014;
    
    // Добавляем вершину
    edge0096.startVertex = vertex0022;

    // Добавляем станцию Деловой центр (МЦК)
    [edge0096.elements addObject:station0222];

    // Добавляем перегон
    MWHaul *haul0210 = [[MWHaul alloc] init];
    haul0210.identifier = @"haul0210";
    haul0210.length = 1080;
    [edge0096.elements addObject:haul0210];
    
    MWDrawArc *drawArc0122 = [[MWDrawArc alloc] init];
    drawArc0122.center = CGPointMake(2533, 3241);
    drawArc0122.startDegrees = 175.3;
    drawArc0122.endDegrees = 181.7;
    drawArc0122.radius = 1764.5;
    drawArc0122.width = 33;
    drawArc0122.color = line0014.color;
    [haul0210.drawPrimitives addObject:drawArc0122];
    
    MWDrawArc *drawArc0123 = [[MWDrawArc alloc] init];
    drawArc0123.center = CGPointMake(2533, 3241);
    drawArc0123.startDegrees = 175.3;
    drawArc0123.endDegrees = 181.7;
    drawArc0123.radius = 1764.5;
    drawArc0123.width = 21.5;
    drawArc0123.color = [UIColor whiteColor];
    [haul0210.drawPrimitives addObject:drawArc0123];

    // Шелепиха
    MWStation *station0223 = [[MWStation alloc] init];
    station0223.identifier = @"station0223";
    [edge0096.elements addObject:station0223];

    station0223.nameOriginal = @"Шелепиха";
    station0223.nameEnglish = @"Shelepikha";
    station0223.mapLocation = CGPointMake(769, 3189);
    station0223.geoLocation = CGPointMake(55.7575, 37.525556);

    MWDrawFillCircle *fillCircle0257 = [[MWDrawFillCircle alloc] init];
    fillCircle0257.center = station0223.mapLocation;
    fillCircle0257.radius = 31.5;
    fillCircle0257.fillColor = line0014.color;
    [station0223.drawPrimitives addObject:fillCircle0257];
    
    MWDrawFillCircle *fillCircle0258 = [[MWDrawFillCircle alloc] init];
    fillCircle0258.center = station0223.mapLocation;
    fillCircle0258.radius = 27;
    fillCircle0258.fillColor = [UIColor whiteColor];
    [station0223.drawPrimitives addObject:fillCircle0258];
    
    MWDrawArc *drawArc0124 = [[MWDrawArc alloc] init];
    drawArc0124.center = CGPointMake(2533, 3241);
    drawArc0124.startDegrees = 180.5;
    drawArc0124.endDegrees = 182.9;
    drawArc0124.radius = 1764.5;
    drawArc0124.width = 21.5;
    drawArc0124.color = [UIColor whiteColor];
    [station0223.drawPrimitives addObject:drawArc0124];
    
    MWDrawFillCircle *fillCircle0259 = [[MWDrawFillCircle alloc] init];
    fillCircle0259.center = station0223.mapLocation;
    fillCircle0259.radius = 14.5;
    fillCircle0259.fillColor = line0014.color;
    [station0223.drawPrimitives addObject:fillCircle0259];
    
    MWDrawFillCircle *fillCircle0260 = [[MWDrawFillCircle alloc] init];
    fillCircle0260.center = station0223.mapLocation;
    fillCircle0260.radius = 11.5;
    fillCircle0260.fillColor = [UIColor whiteColor];
    [station0223.drawPrimitives addObject:fillCircle0260];

    // Подложка
    MWDrawLine *drawLine0406 = [[MWDrawLine alloc] init];
    drawLine0406.startPoint = CGPointMake(800, 3141);
    drawLine0406.endPoint = CGPointMake(900, 3141);
    drawLine0406.width = 33;
    drawLine0406.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0223.nameOriginalTextPrimitives addObject:drawLine0406];

    // Подложка
    MWDrawLine *drawLine0407 = [[MWDrawLine alloc] init];
    drawLine0407.startPoint = CGPointMake(800, 3105);
    drawLine0407.endPoint = CGPointMake(900, 3105);
    drawLine0407.width = 24;
    drawLine0407.color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [station0223.nameOriginalTextPrimitives addObject:drawLine0407];

    MWDrawTextLine *drawTextLine0467 = [[MWDrawTextLine alloc] init];
    drawTextLine0467.text = station0223.nameOriginal;
    drawTextLine0467.fontName = @"HelveticaNeue";
    drawTextLine0467.fontColor = [UIColor blackColor];
    drawTextLine0467.fontSize = 42;
    drawTextLine0467.origin = CGPointMake(795, 3112);
    drawTextLine0467.kernSpacing = 0.6;
    [station0223.nameOriginalTextPrimitives addObject:drawTextLine0467];
    
    MWDrawTextLine *drawTextLine0468 = [[MWDrawTextLine alloc] init];
    drawTextLine0468.text = station0223.nameEnglish;
    drawTextLine0468.fontName = @"HelveticaNeue";
    drawTextLine0468.fontColor = stationNamesEnglishColor;
    drawTextLine0468.fontSize = 28;
    drawTextLine0468.kernSpacing = 0.2;
    drawTextLine0468.origin = CGPointMake(796, 3085);
    [station0223.nameEnglishTextPrimitives addObject:drawTextLine0468];

    // Добавляем перегон
    MWHaul *haul0211 = [[MWHaul alloc] init];
    haul0211.identifier = @"haul0211";
    haul0211.length = 2510;
    [edge0096.elements addObject:haul0211];
    
    MWDrawArc *drawArc0125 = [[MWDrawArc alloc] init];
    drawArc0125.center = CGPointMake(2533, 3241);
    drawArc0125.startDegrees = 181.6;
    drawArc0125.endDegrees = 195.4;
    drawArc0125.radius = 1764.5;
    drawArc0125.width = 33;
    drawArc0125.color = line0014.color;
    [haul0211.drawPrimitives addObject:drawArc0125];

    MWDrawArc *drawArc0126 = [[MWDrawArc alloc] init];
    drawArc0126.center = CGPointMake(2533, 3241);
    drawArc0126.startDegrees = 181.6;
    drawArc0126.endDegrees = 195.4;
    drawArc0126.radius = 1764.5;
    drawArc0126.width = 21.5;
    drawArc0126.color = [UIColor whiteColor];
    [haul0211.drawPrimitives addObject:drawArc0126];

    // Добавляем станцию Хорошёво
    MWStation *station0224 = [[MWStation alloc] init];
    station0224.identifier = @"station0224";
    [edge0096.elements addObject:station0224];
    
    station0224.nameOriginal = @"Хорошёво";
    station0224.nameEnglish = @"Khoroshyovo";
    station0224.mapLocation = CGPointMake(830, 2774.5);
    station0224.geoLocation = CGPointMake(55.777222, 37.507222);
    
    MWDrawFillCircle *fillCircle0261 = [[MWDrawFillCircle alloc] init];
    fillCircle0261.center = station0224.mapLocation;
    fillCircle0261.radius = 31.5;
    fillCircle0261.fillColor = line0014.color;
    [station0224.drawPrimitives addObject:fillCircle0261];
    
    MWDrawFillCircle *fillCircle0262 = [[MWDrawFillCircle alloc] init];
    fillCircle0262.center = station0224.mapLocation;
    fillCircle0262.radius = 27;
    fillCircle0262.fillColor = [UIColor whiteColor];
    [station0224.drawPrimitives addObject:fillCircle0262];

    MWDrawArc *drawArc0127 = [[MWDrawArc alloc] init];
    drawArc0127.center = CGPointMake(2533, 3241);
    drawArc0127.startDegrees = 194.2;
    drawArc0127.endDegrees = 196.6;
    drawArc0127.radius = 1764.5;
    drawArc0127.width = 21.5;
    drawArc0127.color = [UIColor whiteColor];
    [station0224.drawPrimitives addObject:drawArc0127];

    MWDrawFillCircle *fillCircle0263 = [[MWDrawFillCircle alloc] init];
    fillCircle0263.center = station0224.mapLocation;
    fillCircle0263.radius = 14.5;
    fillCircle0263.fillColor = line0014.color;
    [station0224.drawPrimitives addObject:fillCircle0263];

    MWDrawFillCircle *fillCircle0264 = [[MWDrawFillCircle alloc] init];
    fillCircle0264.center = station0224.mapLocation;
    fillCircle0264.radius = 11.5;
    fillCircle0264.fillColor = [UIColor whiteColor];
    [station0224.drawPrimitives addObject:fillCircle0264];

    MWDrawTextLine *drawTextLine0469 = [[MWDrawTextLine alloc] init];
    drawTextLine0469.text = station0224.nameOriginal;
    drawTextLine0469.fontName = @"HelveticaNeue";
    drawTextLine0469.fontColor = [UIColor blackColor];
    drawTextLine0469.fontSize = 42;
    drawTextLine0469.origin = CGPointMake(577, 2736);
    drawTextLine0469.kernSpacing = 1.2;
    [station0224.nameOriginalTextPrimitives addObject:drawTextLine0469];

    MWDrawTextLine *drawTextLine0470 = [[MWDrawTextLine alloc] init];
    drawTextLine0470.text = station0224.nameEnglish;
    drawTextLine0470.fontName = @"HelveticaNeue";
    drawTextLine0470.fontColor = stationNamesEnglishColor;
    drawTextLine0470.fontSize = 28;
    drawTextLine0470.kernSpacing = -0.2;
    drawTextLine0470.origin = CGPointMake(621, 2709);
    [station0224.nameEnglishTextPrimitives addObject:drawTextLine0470];

    // Добавляем вершину
    edge0096.finishVertex = vertex0055;

    // Создаем участок линии Хорошёво - Панфиловская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0097 = [[MWEdge alloc] init];
    edge0097.identifier = @"edge0097";
    edge0097.developmentName = @"Ребро: Хорошёво - Панфиловская";
    [self.edges addObject:edge0097];
    
    // Добавляем линию
    edge0097.line = line0014;
    
    // Добавляем вершину
    edge0097.startVertex = vertex0055;

    // Добавляем станцию Хорошёво
    [edge0097.elements addObject:station0224];

    // Добавляем перегон
    MWHaul *haul0212 = [[MWHaul alloc] init];
    haul0212.identifier = @"haul0212";
    haul0212.length = 1380;
    [edge0097.elements addObject:haul0212];
    
    MWDrawArc *drawArc0128 = [[MWDrawArc alloc] init];
    drawArc0128.center = CGPointMake(2533, 3241);
    drawArc0128.startDegrees = 195.3;
    drawArc0128.endDegrees = 199.4;
    drawArc0128.radius = 1764.5;
    drawArc0128.width = 33;
    drawArc0128.color = line0014.color;
    [haul0212.drawPrimitives addObject:drawArc0128];

    MWDrawArc *drawArc0129 = [[MWDrawArc alloc] init];
    drawArc0129.center = CGPointMake(2533, 3241);
    drawArc0129.startDegrees = 195.3;
    drawArc0129.endDegrees = 199.4;
    drawArc0129.radius = 1764.5;
    drawArc0129.width = 21.5;
    drawArc0129.color = [UIColor whiteColor];
    [haul0212.drawPrimitives addObject:drawArc0129];

    // Добавляем станцию Зорге
    MWStation *station0225 = [[MWStation alloc] init];
    station0225.identifier = @"station0225";
    [edge0097.elements addObject:station0225];
    
    station0225.nameOriginal = @"Зорге";
    station0225.nameEnglish = @"Zorge";
    station0225.mapLocation = CGPointMake(867.5, 2654.5);
    station0225.geoLocation = CGPointMake(55.787778, 37.504444);

    MWDrawLine *drawLine0408 = [[MWDrawLine alloc] init];
    drawLine0408.startPoint = CGPointMake(858, 2651.5);
    drawLine0408.endPoint = CGPointMake(837.5, 2644.5);
    drawLine0408.width = 33;
    drawLine0408.color = line0014.color;
    [station0225.drawPrimitives addObject:drawLine0408];
    
    MWDrawLine *drawLine0409 = [[MWDrawLine alloc] init];
    drawLine0409.startPoint = CGPointMake(860, 2652.5);
    drawLine0409.endPoint = CGPointMake(842.5, 2646);
    drawLine0409.width = 21.5;
    drawLine0409.color = [UIColor whiteColor];
    [station0225.drawPrimitives addObject:drawLine0409];

    MWDrawTextLine *drawTextLine0471 = [[MWDrawTextLine alloc] init];
    drawTextLine0471.text = station0225.nameOriginal;
    drawTextLine0471.fontName = @"HelveticaNeue";
    drawTextLine0471.fontColor = [UIColor blackColor];
    drawTextLine0471.fontSize = 42;
    drawTextLine0471.origin = CGPointMake(710, 2609);
    drawTextLine0471.kernSpacing = 1.0;
    [station0225.nameOriginalTextPrimitives addObject:drawTextLine0471];

    MWDrawTextLine *drawTextLine0472 = [[MWDrawTextLine alloc] init];
    drawTextLine0472.text = station0225.nameEnglish;
    drawTextLine0472.fontName = @"HelveticaNeue";
    drawTextLine0472.fontColor = stationNamesEnglishColor;
    drawTextLine0472.fontSize = 28;
    drawTextLine0472.kernSpacing = 0.2;
    drawTextLine0472.origin = CGPointMake(756, 2581.5);
    [station0225.nameEnglishTextPrimitives addObject:drawTextLine0472];

    // Добавляем перегон
    MWHaul *haul0213 = [[MWHaul alloc] init];
    haul0213.identifier = @"haul0213";
    haul0213.length = 1030;
    [edge0097.elements addObject:haul0213];
    
    MWDrawArc *drawArc0130 = [[MWDrawArc alloc] init];
    drawArc0130.center = CGPointMake(2533, 3241);
    drawArc0130.startDegrees = 199.3;
    drawArc0130.endDegrees = 206.8;
    drawArc0130.radius = 1764.5;
    drawArc0130.width = 33;
    drawArc0130.color = line0014.color;
    [haul0213.drawPrimitives addObject:drawArc0130];
    
    MWDrawArc *drawArc0131 = [[MWDrawArc alloc] init];
    drawArc0131.center = CGPointMake(2533, 3241);
    drawArc0131.startDegrees = 199.3;
    drawArc0131.endDegrees = 206.8;
    drawArc0131.radius = 1764.5;
    drawArc0131.width = 21.5;
    drawArc0131.color = [UIColor whiteColor];
    [haul0213.drawPrimitives addObject:drawArc0131];

    // Добавляем станцию Панфиловская
    MWStation *station0226 = [[MWStation alloc] init];
    station0226.identifier = @"station0226";
    [edge0097.elements addObject:station0226];

    station0226.nameOriginal = @"Панфиловская";
    station0226.nameEnglish = @"Panfilovskaya";
    station0226.mapLocation = CGPointMake(956.5, 2445.5);
    station0226.geoLocation = CGPointMake(55.799167, 37.498889);
    
    MWDrawFillCircle *fillCircle0265 = [[MWDrawFillCircle alloc] init];
    fillCircle0265.center = station0226.mapLocation;
    fillCircle0265.radius = 31.5;
    fillCircle0265.fillColor = line0014.color;
    [station0226.drawPrimitives addObject:fillCircle0265];
    
    MWDrawFillCircle *fillCircle0266 = [[MWDrawFillCircle alloc] init];
    fillCircle0266.center = station0226.mapLocation;
    fillCircle0266.radius = 27;
    fillCircle0266.fillColor = [UIColor whiteColor];
    [station0226.drawPrimitives addObject:fillCircle0266];
    
    MWDrawArc *drawArc0132 = [[MWDrawArc alloc] init];
    drawArc0132.center = CGPointMake(2533, 3241);
    drawArc0132.startDegrees = 205.6;
    drawArc0132.endDegrees = 208.0;
    drawArc0132.radius = 1764.5;
    drawArc0132.width = 21.5;
    drawArc0132.color = [UIColor whiteColor];
    [station0226.drawPrimitives addObject:drawArc0132];
    
    MWDrawFillCircle *fillCircle0267 = [[MWDrawFillCircle alloc] init];
    fillCircle0267.center = station0226.mapLocation;
    fillCircle0267.radius = 14.5;
    fillCircle0267.fillColor = line0014.color;
    [station0226.drawPrimitives addObject:fillCircle0267];
    
    MWDrawFillCircle *fillCircle0268 = [[MWDrawFillCircle alloc] init];
    fillCircle0268.center = station0226.mapLocation;
    fillCircle0268.radius = 11.5;
    fillCircle0268.fillColor = [UIColor whiteColor];
    [station0226.drawPrimitives addObject:fillCircle0268];

    MWDrawTextLine *drawTextLine0473 = [[MWDrawTextLine alloc] init];
    drawTextLine0473.text = station0226.nameOriginal;
    drawTextLine0473.fontName = @"HelveticaNeue";
    drawTextLine0473.fontColor = [UIColor blackColor];
    drawTextLine0473.fontSize = 42;
    drawTextLine0473.origin = CGPointMake(997.5, 2430.5);
    drawTextLine0473.kernSpacing = -0.3;
    [station0226.nameOriginalTextPrimitives addObject:drawTextLine0473];

    MWDrawTextLine *drawTextLine0474 = [[MWDrawTextLine alloc] init];
    drawTextLine0474.text = station0226.nameEnglish;
    drawTextLine0474.fontName = @"HelveticaNeue";
    drawTextLine0474.fontColor = stationNamesEnglishColor;
    drawTextLine0474.fontSize = 28;
    drawTextLine0474.kernSpacing = -0.4;
    drawTextLine0474.origin = CGPointMake(997.5, 2475);
    [station0226.nameEnglishTextPrimitives addObject:drawTextLine0474];

    // Добавляем вершину
    edge0097.finishVertex = vertex0056;

    // Создаем участок линии Панфиловская - Балтийская
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0098 = [[MWEdge alloc] init];
    edge0098.identifier = @"edge0098";
    edge0098.developmentName = @"Ребро: Панфиловская - Балтийская";
    [self.edges addObject:edge0098];
    
    // Добавляем линию
    edge0098.line = line0014;
    
    // Добавляем вершину
    edge0098.startVertex = vertex0056;

    // Добавляем станцию Панфиловская
    [edge0098.elements addObject:station0226];

    // Добавляем перегон
    MWHaul *haul0214 = [[MWHaul alloc] init];
    haul0214.identifier = @"haul0214";
    haul0214.length = 1800;
    [edge0098.elements addObject:haul0214];
    
    MWDrawArc *drawArc0133 = [[MWDrawArc alloc] init];
    drawArc0133.center = CGPointMake(2533, 3241);
    drawArc0133.startDegrees = 206.7;
    drawArc0133.endDegrees = 217.5;
    drawArc0133.radius = 1764.5;
    drawArc0133.width = 33;
    drawArc0133.color = line0014.color;
    [haul0214.drawPrimitives addObject:drawArc0133];

    MWDrawArc *drawArc0134 = [[MWDrawArc alloc] init];
    drawArc0134.center = CGPointMake(2533, 3241);
    drawArc0134.startDegrees = 206.7;
    drawArc0134.endDegrees = 217.5;
    drawArc0134.radius = 1764.5;
    drawArc0134.width = 21.5;
    drawArc0134.color = [UIColor whiteColor];
    [haul0214.drawPrimitives addObject:drawArc0134];

    // Добавляем станцию Стрешнево
    MWStation *station0227 = [[MWStation alloc] init];
    station0227.identifier = @"station0227";
    [edge0098.elements addObject:station0227];
    
    station0227.nameOriginal = @"Стрешнево";
    station0227.nameEnglish = @"Streshnevo";
    station0227.mapLocation = CGPointMake(1132, 2165);
    station0227.geoLocation = CGPointMake(55.813611, 37.486944);

    MWDrawLine *drawLine0410 = [[MWDrawLine alloc] init];
    drawLine0410.startPoint = CGPointMake(1123, 2159);
    drawLine0410.endPoint = CGPointMake(1108, 2147);
    drawLine0410.width = 33;
    drawLine0410.color = line0014.color;
    [station0227.drawPrimitives addObject:drawLine0410];
    
    MWDrawLine *drawLine0411 = [[MWDrawLine alloc] init];
    drawLine0411.startPoint = CGPointMake(1125.5, 2161.5);
    drawLine0411.endPoint = CGPointMake(1112, 2150.5);
    drawLine0411.width = 21.5;
    drawLine0411.color = [UIColor whiteColor];
    [station0227.drawPrimitives addObject:drawLine0411];
    
    MWDrawTextLine *drawTextLine0475 = [[MWDrawTextLine alloc] init];
    drawTextLine0475.text = station0227.nameOriginal;
    drawTextLine0475.fontName = @"HelveticaNeue";
    drawTextLine0475.fontColor = [UIColor blackColor];
    drawTextLine0475.fontSize = 42;
    drawTextLine0475.origin = CGPointMake(878, 2109);
    drawTextLine0475.kernSpacing = 0.6;
    [station0227.nameOriginalTextPrimitives addObject:drawTextLine0475];

    MWDrawTextLine *drawTextLine0476 = [[MWDrawTextLine alloc] init];
    drawTextLine0476.text = station0227.nameEnglish;
    drawTextLine0476.fontName = @"HelveticaNeue";
    drawTextLine0476.fontColor = stationNamesEnglishColor;
    drawTextLine0476.fontSize = 28;
    drawTextLine0476.kernSpacing = -0.4;
    drawTextLine0476.origin = CGPointMake(968, 2082);
    [station0227.nameEnglishTextPrimitives addObject:drawTextLine0476];

    // Добавляем перегон
    MWHaul *haul0215 = [[MWHaul alloc] init];
    haul0215.identifier = @"haul0215";
    haul0215.length = 1590;
    [edge0098.elements addObject:haul0215];
    
    MWDrawArc *drawArc0135 = [[MWDrawArc alloc] init];
    drawArc0135.center = CGPointMake(2533, 3241);
    drawArc0135.startDegrees = 217.4;
    drawArc0135.endDegrees = 223.1;
    drawArc0135.radius = 1764.5;
    drawArc0135.width = 33;
    drawArc0135.color = line0014.color;
    [haul0215.drawPrimitives addObject:drawArc0135];
    
    MWDrawArc *drawArc0136 = [[MWDrawArc alloc] init];
    drawArc0136.center = CGPointMake(2533, 3241);
    drawArc0136.startDegrees = 217.3;
    drawArc0136.endDegrees = 223.1;
    drawArc0136.radius = 1764.5;
    drawArc0136.width = 21.5;
    drawArc0136.color = [UIColor whiteColor];
    [haul0215.drawPrimitives addObject:drawArc0136];

    // Добавляем станцию Балтийская
    MWStation *station0228 = [[MWStation alloc] init];
    station0228.identifier = @"station0228";
    [edge0098.elements addObject:station0228];

    station0228.nameOriginal = @"Балтийская";
    station0228.nameEnglish = @"Baltiyskaya";
    station0228.mapLocation = CGPointMake(1242, 2037);
    station0228.geoLocation = CGPointMake(55.825833, 37.496111);

    MWDrawFillCircle *fillCircle0269 = [[MWDrawFillCircle alloc] init];
    fillCircle0269.center = station0228.mapLocation;
    fillCircle0269.radius = 31.5;
    fillCircle0269.fillColor = line0014.color;
    [station0228.drawPrimitives addObject:fillCircle0269];
    
    MWDrawFillCircle *fillCircle0270 = [[MWDrawFillCircle alloc] init];
    fillCircle0270.center = station0228.mapLocation;
    fillCircle0270.radius = 27;
    fillCircle0270.fillColor = [UIColor whiteColor];
    [station0228.drawPrimitives addObject:fillCircle0270];
    
    MWDrawArc *drawArc0137 = [[MWDrawArc alloc] init];
    drawArc0137.center = CGPointMake(2533, 3241);
    drawArc0137.startDegrees = 221.9;
    drawArc0137.endDegrees = 224.3;
    drawArc0137.radius = 1764.5;
    drawArc0137.width = 21.5;
    drawArc0137.color = [UIColor whiteColor];
    [station0228.drawPrimitives addObject:drawArc0137];
    
    MWDrawFillCircle *fillCircle0271 = [[MWDrawFillCircle alloc] init];
    fillCircle0271.center = station0228.mapLocation;
    fillCircle0271.radius = 14.5;
    fillCircle0271.fillColor = line0014.color;
    [station0228.drawPrimitives addObject:fillCircle0271];
    
    MWDrawFillCircle *fillCircle0272 = [[MWDrawFillCircle alloc] init];
    fillCircle0272.center = station0228.mapLocation;
    fillCircle0272.radius = 11.5;
    fillCircle0272.fillColor = [UIColor whiteColor];
    [station0228.drawPrimitives addObject:fillCircle0272];

    MWDrawTextLine *drawTextLine0477 = [[MWDrawTextLine alloc] init];
    drawTextLine0477.text = station0228.nameOriginal;
    drawTextLine0477.fontName = @"HelveticaNeue";
    drawTextLine0477.fontColor = [UIColor blackColor];
    drawTextLine0477.fontSize = 42;
    drawTextLine0477.origin = CGPointMake(975.5, 1982);
    drawTextLine0477.kernSpacing = -0.4;
    [station0228.nameOriginalTextPrimitives addObject:drawTextLine0477];
    
    MWDrawTextLine *drawTextLine0478 = [[MWDrawTextLine alloc] init];
    drawTextLine0478.text = station0228.nameEnglish;
    drawTextLine0478.fontName = @"HelveticaNeue";
    drawTextLine0478.fontColor = stationNamesEnglishColor;
    drawTextLine0478.fontSize = 28;
    drawTextLine0478.kernSpacing = -0.4;
    drawTextLine0478.origin = CGPointMake(1065, 1955);
    [station0228.nameEnglishTextPrimitives addObject:drawTextLine0478];

    // Добавляем вершину
    edge0098.finishVertex = vertex0057;

    // Создаем участок линии Балтийская - Владыкино
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0099 = [[MWEdge alloc] init];
    edge0099.identifier = @"edge0099";
    edge0099.developmentName = @"Ребро: Балтийская - Владыкино";
    [self.edges addObject:edge0099];
    
    // Добавляем линию
    edge0099.line = line0014;
    
    // Добавляем вершину
    edge0099.startVertex = vertex0057;

    // Добавляем станцию Балтийская
    [edge0099.elements addObject:station0228];

    // Добавляем перегон
    MWHaul *haul0216 = [[MWHaul alloc] init];
    haul0216.identifier = @"haul0216";
    haul0216.length = 2390;
    [edge0099.elements addObject:haul0216];

    MWDrawArc *drawArc0138 = [[MWDrawArc alloc] init];
    drawArc0138.center = CGPointMake(2533, 3241);
    drawArc0138.startDegrees = 223.0;
    drawArc0138.endDegrees = 238.5;
    drawArc0138.radius = 1764.5;
    drawArc0138.width = 33;
    drawArc0138.color = line0014.color;
    [haul0216.drawPrimitives addObject:drawArc0138];
    
    MWDrawArc *drawArc0139 = [[MWDrawArc alloc] init];
    drawArc0139.center = CGPointMake(2533, 3241);
    drawArc0139.startDegrees = 223.0;
    drawArc0139.endDegrees = 238.5;
    drawArc0139.radius = 1764.5;
    drawArc0139.width = 21.5;
    drawArc0139.color = [UIColor whiteColor];
    [haul0216.drawPrimitives addObject:drawArc0139];

    // Добавляем станцию Коптево
    MWStation *station0229 = [[MWStation alloc] init];
    station0229.identifier = @"station0229";
    [edge0099.elements addObject:station0229];
    
    station0229.nameOriginal = @"Коптево";
    station0229.nameEnglish = @"Koptevo";
    station0229.mapLocation = CGPointMake(1611, 1735.5);
    station0229.geoLocation = CGPointMake(55.839637, 37.520037);

    MWDrawLine *drawLine0412 = [[MWDrawLine alloc] init];
    drawLine0412.startPoint = CGPointMake(1614.5, 1750.5);
    drawLine0412.endPoint = CGPointMake(1626.5, 1768.5);
    drawLine0412.width = 33;
    drawLine0412.color = line0014.color;
    [station0229.drawPrimitives addObject:drawLine0412];
    
    MWDrawLine *drawLine0413 = [[MWDrawLine alloc] init];
    drawLine0413.startPoint = CGPointMake(1612, 1747);
    drawLine0413.endPoint = CGPointMake(1623, 1764);
    drawLine0413.width = 21.5;
    drawLine0413.color = [UIColor whiteColor];
    [station0229.drawPrimitives addObject:drawLine0413];

    MWDrawTextLine *drawTextLine0479 = [[MWDrawTextLine alloc] init];
    drawTextLine0479.text = station0229.nameOriginal;
    drawTextLine0479.fontName = @"HelveticaNeue";
    drawTextLine0479.fontColor = [UIColor blackColor];
    drawTextLine0479.fontSize = 42;
    drawTextLine0479.origin = CGPointMake(1623, 1763);
    drawTextLine0479.kernSpacing = 0.6;
    [station0229.nameOriginalTextPrimitives addObject:drawTextLine0479];
    
    MWDrawTextLine *drawTextLine0480 = [[MWDrawTextLine alloc] init];
    drawTextLine0480.text = station0229.nameEnglish;
    drawTextLine0480.fontName = @"HelveticaNeue";
    drawTextLine0480.fontColor = stationNamesEnglishColor;
    drawTextLine0480.fontSize = 28;
    drawTextLine0480.kernSpacing = -0.4;
    drawTextLine0480.origin = CGPointMake(1623, 1807);
    [station0229.nameEnglishTextPrimitives addObject:drawTextLine0480];

    // Добавляем перегон
    MWHaul *haul0217 = [[MWHaul alloc] init];
    haul0217.identifier = @"haul0217";
    haul0217.length = 2170;
    [edge0099.elements addObject:haul0217];

    MWDrawArc *drawArc0140 = [[MWDrawArc alloc] init];
    drawArc0140.center = CGPointMake(2533, 3241);
    drawArc0140.startDegrees = 238.4;
    drawArc0140.endDegrees = 242.8;
    drawArc0140.radius = 1764.5;
    drawArc0140.width = 33;
    drawArc0140.color = line0014.color;
    [haul0217.drawPrimitives addObject:drawArc0140];
    
    MWDrawArc *drawArc0141 = [[MWDrawArc alloc] init];
    drawArc0141.center = CGPointMake(2533, 3241);
    drawArc0141.startDegrees = 238.2;
    drawArc0141.endDegrees = 242.8;
    drawArc0141.radius = 1764.5;
    drawArc0141.width = 21.5;
    drawArc0141.color = [UIColor whiteColor];
    [haul0217.drawPrimitives addObject:drawArc0141];

    // Добавляем станцию Лихоборы
    MWStation *station0230 = [[MWStation alloc] init];
    station0230.identifier = @"station0230";
    [edge0099.elements addObject:station0230];

    station0230.nameOriginal = @"Лихоборы";
    station0230.nameEnglish = @"Likhobory";
    station0230.mapLocation = CGPointMake(1725.5, 1670);
    station0230.geoLocation = CGPointMake(55.847222, 37.551389);

    MWDrawLine *drawLine0414 = [[MWDrawLine alloc] init];
    drawLine0414.startPoint = CGPointMake(1720.5, 1662.5);
    drawLine0414.endPoint = CGPointMake(1710.5, 1644.5);
    drawLine0414.width = 33;
    drawLine0414.color = line0014.color;
    [station0230.drawPrimitives addObject:drawLine0414];
    
    MWDrawLine *drawLine0415 = [[MWDrawLine alloc] init];
    drawLine0415.startPoint = CGPointMake(1721.5, 1663.5);
    drawLine0415.endPoint = CGPointMake(1713.5, 1649.5);
    drawLine0415.width = 21.5;
    drawLine0415.color = [UIColor whiteColor];
    [station0230.drawPrimitives addObject:drawLine0415];

    MWDrawTextLine *drawTextLine0481 = [[MWDrawTextLine alloc] init];
    drawTextLine0481.text = station0230.nameOriginal;
    drawTextLine0481.fontName = @"HelveticaNeue";
    drawTextLine0481.fontColor = [UIColor blackColor];
    drawTextLine0481.fontSize = 42;
    drawTextLine0481.origin = CGPointMake(1501, 1599);
    drawTextLine0481.kernSpacing = 0.9;
    [station0230.nameOriginalTextPrimitives addObject:drawTextLine0481];
    
    MWDrawTextLine *drawTextLine0482 = [[MWDrawTextLine alloc] init];
    drawTextLine0482.text = station0230.nameEnglish;
    drawTextLine0482.fontName = @"HelveticaNeue";
    drawTextLine0482.fontColor = stationNamesEnglishColor;
    drawTextLine0482.fontSize = 28;
    drawTextLine0482.kernSpacing = 0.4;
    drawTextLine0482.origin = CGPointMake(1501, 1647);
    [station0230.nameEnglishTextPrimitives addObject:drawTextLine0482];

    // Добавляем перегон
    MWHaul *haul0218 = [[MWHaul alloc] init];
    haul0218.identifier = @"haul0218";
    haul0218.length = 1260;
    [edge0099.elements addObject:haul0218];

    MWDrawArc *drawArc0142 = [[MWDrawArc alloc] init];
    drawArc0142.center = CGPointMake(2533, 3241);
    drawArc0142.startDegrees = 242.7;
    drawArc0142.endDegrees = 252.4;
    drawArc0142.radius = 1764.5;
    drawArc0142.width = 34;
    drawArc0142.color = line0014.color;
    [haul0218.drawPrimitives addObject:drawArc0142];
    
    MWDrawArc *drawArc0143 = [[MWDrawArc alloc] init];
    drawArc0143.center = CGPointMake(2533, 3241);
    drawArc0143.startDegrees = 242.6;
    drawArc0143.endDegrees = 252.4;
    drawArc0143.radius = 1764.5;
    drawArc0143.width = 21.5;
    drawArc0143.color = [UIColor whiteColor];
    [haul0218.drawPrimitives addObject:drawArc0143];

    // Добавляем станцию Окружная
    MWStation *station0231 = [[MWStation alloc] init];
    station0231.identifier = @"station0231";
    [edge0099.elements addObject:station0231];

    station0231.nameOriginal = @"Окружная";
    station0231.nameEnglish = @"Okrujnaya";
    station0231.mapLocation = CGPointMake(1999.5, 1556.5);
    station0231.geoLocation = CGPointMake(55.848889, 37.571111);

    MWDrawLine *drawLine0416 = [[MWDrawLine alloc] init];
    drawLine0416.startPoint = CGPointMake(1995.5, 1547.5);
    drawLine0416.endPoint = CGPointMake(1989.5, 1527.5);
    drawLine0416.width = 33;
    drawLine0416.color = line0014.color;
    [station0231.drawPrimitives addObject:drawLine0416];
    
    MWDrawLine *drawLine0417 = [[MWDrawLine alloc] init];
    drawLine0417.startPoint = CGPointMake(1996.5, 1550.5);
    drawLine0417.endPoint = CGPointMake(1991, 1532.5);
    drawLine0417.width = 21.5;
    drawLine0417.color = [UIColor whiteColor];
    [station0231.drawPrimitives addObject:drawLine0417];

    MWDrawTextLine *drawTextLine0483 = [[MWDrawTextLine alloc] init];
    drawTextLine0483.text = station0231.nameOriginal;
    drawTextLine0483.fontName = @"HelveticaNeue";
    drawTextLine0483.fontColor = [UIColor blackColor];
    drawTextLine0483.fontSize = 42;
    drawTextLine0483.origin = CGPointMake(1785, 1483);
    drawTextLine0483.kernSpacing = 0.6;
    [station0231.nameOriginalTextPrimitives addObject:drawTextLine0483];
    
    MWDrawTextLine *drawTextLine0484 = [[MWDrawTextLine alloc] init];
    drawTextLine0484.text = station0231.nameEnglish;
    drawTextLine0484.fontName = @"HelveticaNeue";
    drawTextLine0484.fontColor = stationNamesEnglishColor;
    drawTextLine0484.fontSize = 28;
    drawTextLine0484.kernSpacing = 0.0;
    drawTextLine0484.origin = CGPointMake(1864, 1456);
    [station0231.nameEnglishTextPrimitives addObject:drawTextLine0484];

    // Добавляем перегон
    MWHaul *haul0219 = [[MWHaul alloc] init];
    haul0219.identifier = @"haul0219";
    haul0219.length = 1140;
    [edge0099.elements addObject:haul0219];

    MWDrawArc *drawArc0144 = [[MWDrawArc alloc] init];
    drawArc0144.center = CGPointMake(2533, 3241);
    drawArc0144.startDegrees = 252.3;
    drawArc0144.endDegrees = 259.0;
    drawArc0144.radius = 1764.5;
    drawArc0144.width = 33;
    drawArc0144.color = line0014.color;
    [haul0219.drawPrimitives addObject:drawArc0144];
    
    MWDrawArc *drawArc0145 = [[MWDrawArc alloc] init];
    drawArc0145.center = CGPointMake(2533, 3241);
    drawArc0145.startDegrees = 252.2;
    drawArc0145.endDegrees = 258.9;
    drawArc0145.radius = 1764.5;
    drawArc0145.width = 21.5;
    drawArc0145.color = [UIColor whiteColor];
    [haul0219.drawPrimitives addObject:drawArc0145];

    // Добавляем станцию Владыкино
    [edge0099.elements addObject:station0201];

    // Добавляем вершину
    edge0099.finishVertex = vertex0045;

    ///////////////////////////////////////////////////////////////////
    // Добавляем станции, связанные узлом, но без возможности перехода
    ///////////////////////////////////////////////////////////////////
    
    [self.stationsWithoutTransfer addObject:station0154]; // Боровицкая
    [self.stationsWithoutTransfer addObject:station0075]; // Александровский сад
    
    [self.stationsWithoutTransfer addObject:station0075]; // Александровский сад
    [self.stationsWithoutTransfer addObject:station0154]; // Боровицкая

    [self.stationsWithoutTransfer addObject:station0010]; // Охотный ряд
    [self.stationsWithoutTransfer addObject:station0054]; // Площадь революции

    ///////////////////////////////////////////////////////////////////
    // Добавляем переходы, время которых отличается от среднего
    ///////////////////////////////////////////////////////////////////

    MWTransfer *transfer0001 = [[MWTransfer alloc] init];
    transfer0001.station1Identifier = @"station0108"; // Ботанический сад
    transfer0001.station2Identifier = @"station0202"; // Ботанический сад
    transfer0001.time = 6;
    [self.transfers addObject:transfer0001];

    MWTransfer *transfer0002 = [[MWTransfer alloc] init];
    transfer0002.station1Identifier = @"station0019"; // Бульвар Рокоссовского
    transfer0002.station2Identifier = @"station0205"; // Бульвар Рокоссовского
    transfer0002.time = 8;
    [self.transfers addObject:transfer0002];

    MWTransfer *transfer0003 = [[MWTransfer alloc] init];
    transfer0003.station1Identifier = @"station0059"; // Партизанская
    transfer0003.station2Identifier = @"station0207"; // Измайлово
    transfer0003.time = 5;
    [self.transfers addObject:transfer0003];

    MWTransfer *transfer0004 = [[MWTransfer alloc] init];
    transfer0004.station1Identifier = @"station0089"; // Шоссе энтузиастов
    transfer0004.station2Identifier = @"station0209"; // Шоссе энтузиастов
    transfer0004.time = 5;
    [self.transfers addObject:transfer0004];

    MWTransfer *transfer0005 = [[MWTransfer alloc] init];
    transfer0005.station1Identifier = @"station0175"; // Дубровка
    transfer0005.station2Identifier = @"station0214"; // Дубровка
    transfer0005.time = 11;
    [self.transfers addObject:transfer0005];

    MWTransfer *transfer0006 = [[MWTransfer alloc] init];
    transfer0006.station1Identifier = @"station0028"; // Автозаводская
    transfer0006.station2Identifier = @"station0215"; // Автозаводская
    transfer0006.time = 11;
    [self.transfers addObject:transfer0006];

    MWTransfer *transfer0007 = [[MWTransfer alloc] init];
    transfer0007.station1Identifier = @"station0005"; // Спортивная
    transfer0007.station2Identifier = @"station0220"; // Лужники
    transfer0007.time = 5;
    [self.transfers addObject:transfer0007];

    MWTransfer *transfer0008 = [[MWTransfer alloc] init];
    transfer0008.station1Identifier = @"station0127"; // Полежаевская
    transfer0008.station2Identifier = @"station0224"; // Хорошёво
    transfer0008.time = 10;
    [self.transfers addObject:transfer0008];

    MWTransfer *transfer0009 = [[MWTransfer alloc] init];
    transfer0009.station1Identifier = @"station0128"; // Октябрьское поле
    transfer0009.station2Identifier = @"station0226"; // Панфиловская
    transfer0009.time = 13;
    [self.transfers addObject:transfer0009];

    MWTransfer *transfer0010 = [[MWTransfer alloc] init];
    transfer0010.station1Identifier = @"station0038"; // Войковская
    transfer0010.station2Identifier = @"station0228"; // Балтийская
    transfer0010.time = 13;
    [self.transfers addObject:transfer0010];

    /////////////
    
    MWDrawTextLine *drawTextLine0505 = [[MWDrawTextLine alloc] init];
    drawTextLine0505.text = @"Leningradskoye rail line";
    drawTextLine0505.fontName = @"HelveticaNeue";
    drawTextLine0505.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0505.fontSize = 24;
    drawTextLine0505.origin = CGPointMake(353, 700);
    drawTextLine0505.kernSpacing = 0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0505];

    MWDrawTextLine *drawTextLine0506 = [[MWDrawTextLine alloc] init];
    drawTextLine0506.text = @"Sheremetyevo airport";
    drawTextLine0506.fontName = @"HelveticaNeue";
    drawTextLine0506.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0506.fontSize = 25;
    drawTextLine0506.origin = CGPointMake(850, 820.5);
    drawTextLine0506.kernSpacing = 1.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0506];

    MWDrawTextLine *drawTextLine0507 = [[MWDrawTextLine alloc] init];
    drawTextLine0507.text = @"Levoberejye";
    drawTextLine0507.fontName = @"HelveticaNeue";
    drawTextLine0507.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0507.fontSize = 24;
    drawTextLine0507.origin = CGPointMake(1350, 996);
    drawTextLine0507.kernSpacing = -1.5;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0507];

    MWDrawTextLine *drawTextLine0508 = [[MWDrawTextLine alloc] init];
    drawTextLine0508.text = @"Khovrino";
    drawTextLine0508.fontName = @"HelveticaNeue";
    drawTextLine0508.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0508.fontSize = 24;
    drawTextLine0508.origin = CGPointMake(1607, 1234);
    drawTextLine0508.kernSpacing = -1.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0508];

    MWDrawTextLine *drawTextLine0509 = [[MWDrawTextLine alloc] init];
    drawTextLine0509.text = @"Mosselmash";
    drawTextLine0509.fontName = @"HelveticaNeue";
    drawTextLine0509.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0509.fontSize = 22;
    drawTextLine0509.origin = CGPointMake(1604, 1393);
    drawTextLine0509.kernSpacing = -1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0509];

    MWDrawTextLine *drawTextLine0510 = [[MWDrawTextLine alloc] init];
    drawTextLine0510.text = @"NATI";
    drawTextLine0510.fontName = @"HelveticaNeue";
    drawTextLine0510.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0510.fontSize = 21;
    drawTextLine0510.origin = CGPointMake(1762, 1546);
    drawTextLine0510.kernSpacing = 1.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0510];

    MWDrawTextLine *drawTextLine0511 = [[MWDrawTextLine alloc] init];
    drawTextLine0511.text = @"SEVERNOYE TUSHINO";
    drawTextLine0511.fontName = @"HelveticaNeue-Bold";
    drawTextLine0511.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0511.fontSize = 10;
    drawTextLine0511.origin = CGPointMake(973, 1413);
    drawTextLine0511.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0511];

    MWDrawTextLine *drawTextLine0512 = [[MWDrawTextLine alloc] init];
    drawTextLine0512.text = @"PARK";
    drawTextLine0512.fontName = @"HelveticaNeue-Bold";
    drawTextLine0512.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0512.fontSize = 10;
    drawTextLine0512.origin = CGPointMake(1069, 1427);
    drawTextLine0512.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0512];

    MWDrawTextLine *drawTextLine0513 = [[MWDrawTextLine alloc] init];
    drawTextLine0513.text = @"POKROVSKOYE-STRESHNEVO";
    drawTextLine0513.fontName = @"HelveticaNeue-Bold";
    drawTextLine0513.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0513.fontSize = 10;
    drawTextLine0513.origin = CGPointMake(1069, 1602);
    drawTextLine0513.kernSpacing = 0.9;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0513];

    MWDrawTextLine *drawTextLine0514 = [[MWDrawTextLine alloc] init];
    drawTextLine0514.text = @"PARK";
    drawTextLine0514.fontName = @"HelveticaNeue-Bold";
    drawTextLine0514.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0514.fontSize = 10;
    drawTextLine0514.origin = CGPointMake(1069, 1616);
    drawTextLine0514.kernSpacing = 0.9;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0514];

    MWDrawTextLine *drawTextLine0515 = [[MWDrawTextLine alloc] init];
    drawTextLine0515.text = @"OTKRITIE ARENA STADIUM";
    drawTextLine0515.fontName = @"HelveticaNeue-Bold";
    drawTextLine0515.fontColor = [UIColor colorWithRed:(194/255.0) green:(169/255.0) blue:(123/255.0) alpha:1];
    drawTextLine0515.fontSize = 10;
    drawTextLine0515.origin = CGPointMake(898, 1712);
    drawTextLine0515.kernSpacing = 1.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0515];

    MWDrawTextLine *drawTextLine0516 = [[MWDrawTextLine alloc] init];
    drawTextLine0516.text = @"Savyolovskoye rail line";
    drawTextLine0516.fontName = @"HelveticaNeue";
    drawTextLine0516.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0516.fontSize = 24;
    drawTextLine0516.origin = CGPointMake(2066, 700.5);
    drawTextLine0516.kernSpacing = -0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0516];

    MWDrawTextLine *drawTextLine0517 = [[MWDrawTextLine alloc] init];
    drawTextLine0517.text = @"Mark";
    drawTextLine0517.fontName = @"HelveticaNeue";
    drawTextLine0517.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0517.fontSize = 24;
    drawTextLine0517.origin = CGPointMake(1969, 784);
    drawTextLine0517.kernSpacing = -1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0517];

    MWDrawTextLine *drawTextLine0518 = [[MWDrawTextLine alloc] init];
    drawTextLine0518.text = @"Lianozovo";
    drawTextLine0518.fontName = @"HelveticaNeue";
    drawTextLine0518.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0518.fontSize = 24;
    drawTextLine0518.origin = CGPointMake(1923.5, 941);
    drawTextLine0518.kernSpacing = -1.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0518];

    MWDrawTextLine *drawTextLine0519 = [[MWDrawTextLine alloc] init];
    drawTextLine0519.text = @"Beskudnikovo";
    drawTextLine0519.fontName = @"HelveticaNeue";
    drawTextLine0519.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0519.fontSize = 22;
    drawTextLine0519.origin = CGPointMake(1888, 1097);
    drawTextLine0519.kernSpacing = -0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0519];

    MWDrawTextLine *drawTextLine0520 = [[MWDrawTextLine alloc] init];
    drawTextLine0520.text = @"Degunino";
    drawTextLine0520.fontName = @"HelveticaNeue";
    drawTextLine0520.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0520.fontSize = 22;
    drawTextLine0520.origin = CGPointMake(1928, 1266);
    drawTextLine0520.kernSpacing = -0.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0520];

    MWDrawTextLine *drawTextLine0521 = [[MWDrawTextLine alloc] init];
    drawTextLine0521.text = @"Trikotajnaya";
    drawTextLine0521.fontName = @"HelveticaNeue";
    drawTextLine0521.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0521.fontSize = 20;
    drawTextLine0521.origin = CGPointMake(515, 1848);
    drawTextLine0521.kernSpacing = 0.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0521];

    MWDrawTextLine *drawTextLine0522 = [[MWDrawTextLine alloc] init];
    drawTextLine0522.text = @"Rijskoye rail line";
    drawTextLine0522.fontName = @"HelveticaNeue";
    drawTextLine0522.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0522.fontSize = 24;
    drawTextLine0522.origin = CGPointMake(89.5, 2018.5);
    drawTextLine0522.degrees = 270;
    drawTextLine0522.kernSpacing = 0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0522];

    MWDrawTextLine *drawTextLine0523 = [[MWDrawTextLine alloc] init];
    drawTextLine0523.text = @"Tushino";
    drawTextLine0523.fontName = @"HelveticaNeue";
    drawTextLine0523.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0523.fontSize = 20;
    drawTextLine0523.origin = CGPointMake(634, 1597);
    drawTextLine0523.kernSpacing = 0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0523];

    MWDrawTextLine *drawTextLine0524 = [[MWDrawTextLine alloc] init];
    drawTextLine0524.text = @"SEREBRYANY BOR PARK";
    drawTextLine0524.fontName = @"HelveticaNeue-Bold";
    drawTextLine0524.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0524.fontSize = 10;
    drawTextLine0524.origin = CGPointMake(470, 2262);
    drawTextLine0524.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0524];

    MWDrawTextLine *drawTextLine0525 = [[MWDrawTextLine alloc] init];
    drawTextLine0525.text = @"JIVOPISNY BRIDGE";
    drawTextLine0525.fontName = @"HelveticaNeue-Bold";
    drawTextLine0525.fontColor = [UIColor colorWithRed:(194/255.0) green:(169/255.0) blue:(123/255.0) alpha:1];
    drawTextLine0525.fontSize = 10;
    drawTextLine0525.origin = CGPointMake(449, 2402);
    drawTextLine0525.kernSpacing = 1.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0525];

    MWDrawTextLine *drawTextLine0526 = [[MWDrawTextLine alloc] init];
    drawTextLine0526.text = @"KRILATSKIYE KHOLMY PARK";
    drawTextLine0526.fontName = @"HelveticaNeue-Bold";
    drawTextLine0526.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0526.fontSize = 10;
    drawTextLine0526.origin = CGPointMake(448, 2509);
    drawTextLine0526.kernSpacing = 1.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0526];

    MWDrawTextLine *drawTextLine0527 = [[MWDrawTextLine alloc] init];
    drawTextLine0527.text = @"Rabochy";
    drawTextLine0527.fontName = @"HelveticaNeue";
    drawTextLine0527.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0527.fontSize = 20;
    drawTextLine0527.origin = CGPointMake(71, 2424);
    drawTextLine0527.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0527];

    MWDrawTextLine *drawTextLine0528 = [[MWDrawTextLine alloc] init];
    drawTextLine0528.text = @"Posyolok";
    drawTextLine0528.fontName = @"HelveticaNeue";
    drawTextLine0528.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0528.fontSize = 20;
    drawTextLine0528.origin = CGPointMake(71, 2445);
    drawTextLine0528.kernSpacing = 0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0528];

    MWDrawTextLine *drawTextLine0529 = [[MWDrawTextLine alloc] init];
    drawTextLine0529.text = @"Kuntsevo";
    drawTextLine0529.fontName = @"HelveticaNeue";
    drawTextLine0529.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0529.fontSize = 20;
    drawTextLine0529.origin = CGPointMake(85, 2702);
    drawTextLine0529.kernSpacing = 0.1;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0529];

    MWDrawTextLine *drawTextLine0530 = [[MWDrawTextLine alloc] init];
    drawTextLine0530.text = @"TRIUMPHAL ARCH";
    drawTextLine0530.fontName = @"HelveticaNeue-Bold";
    drawTextLine0530.fontColor = [UIColor colorWithRed:(194/255.0) green:(169/255.0) blue:(123/255.0) alpha:1];
    drawTextLine0530.fontSize = 10;
    drawTextLine0530.origin = CGPointMake(538, 3704);
    drawTextLine0530.kernSpacing = 1.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0530];

    MWDrawTextLine *drawTextLine0531 = [[MWDrawTextLine alloc] init];
    drawTextLine0531.text = @"PARK POBEDY";
    drawTextLine0531.fontName = @"HelveticaNeue-Bold";
    drawTextLine0531.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0531.fontSize = 10;
    drawTextLine0531.origin = CGPointMake(436, 3846);
    drawTextLine0531.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0531];

    MWDrawTextLine *drawTextLine0532 = [[MWDrawTextLine alloc] init];
    drawTextLine0532.text = @"MATVEYEVSKY FOREST";
    drawTextLine0532.fontName = @"HelveticaNeue-Bold";
    drawTextLine0532.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0532.fontSize = 10;
    drawTextLine0532.origin = CGPointMake(183, 4011);
    drawTextLine0532.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0532];

    MWDrawTextLine *drawTextLine0533 = [[MWDrawTextLine alloc] init];
    drawTextLine0533.text = @"Matveyevskaya";
    drawTextLine0533.fontName = @"HelveticaNeue";
    drawTextLine0533.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0533.fontSize = 20;
    drawTextLine0533.origin = CGPointMake(223, 4092);
    drawTextLine0533.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0533];

    MWDrawTextLine *drawTextLine0534 = [[MWDrawTextLine alloc] init];
    drawTextLine0534.text = @"Setun";
    drawTextLine0534.fontName = @"HelveticaNeue";
    drawTextLine0534.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0534.fontSize = 20;
    drawTextLine0534.origin = CGPointMake(107, 4370);
    drawTextLine0534.kernSpacing = 0.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0534];

    MWDrawTextLine *drawTextLine0535 = [[MWDrawTextLine alloc] init];
    drawTextLine0535.text = @"Belorusskoye rail line";
    drawTextLine0535.fontName = @"HelveticaNeue";
    drawTextLine0535.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0535.fontSize = 24;
    drawTextLine0535.origin = CGPointMake(66, 4541);
    drawTextLine0535.kernSpacing = 0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0535];

    MWDrawTextLine *drawTextLine0536 = [[MWDrawTextLine alloc] init];
    drawTextLine0536.text = @"Ramenki";
    drawTextLine0536.fontName = @"HelveticaNeue";
    drawTextLine0536.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0536.fontSize = 24;
    drawTextLine0536.origin = CGPointMake(567, 4327);
    drawTextLine0536.kernSpacing = 0.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0536];

    MWDrawTextLine *drawTextLine0537 = [[MWDrawTextLine alloc] init];
    drawTextLine0537.text = @"Lomonosovsky Prospekt";
    drawTextLine0537.fontName = @"HelveticaNeue";
    drawTextLine0537.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0537.fontSize = 24;
    drawTextLine0537.origin = CGPointMake(566, 4221.5);
    drawTextLine0537.kernSpacing = 0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0537];

    MWDrawTextLine *drawTextLine0538 = [[MWDrawTextLine alloc] init];
    drawTextLine0538.text = @"Minskaya";
    drawTextLine0538.fontName = @"HelveticaNeue";
    drawTextLine0538.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0538.fontSize = 24;
    drawTextLine0538.origin = CGPointMake(566, 4085);
    drawTextLine0538.kernSpacing = 0.7;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0538];

    MWDrawTextLine *drawTextLine0539 = [[MWDrawTextLine alloc] init];
    drawTextLine0539.text = @"Moskva-";
    drawTextLine0539.fontName = @"HelveticaNeue";
    drawTextLine0539.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0539.fontSize = 20;
    drawTextLine0539.origin = CGPointMake(694, 4001);
    drawTextLine0539.kernSpacing = 0.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0539];

    MWDrawTextLine *drawTextLine0540 = [[MWDrawTextLine alloc] init];
    drawTextLine0540.text = @"Sortirovochnaya";
    drawTextLine0540.fontName = @"HelveticaNeue";
    drawTextLine0540.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0540.fontSize = 20;
    drawTextLine0540.origin = CGPointMake(694, 4022);
    drawTextLine0540.kernSpacing = 0.5;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0540];

    MWDrawTextLine *drawTextLine0541 = [[MWDrawTextLine alloc] init];
    drawTextLine0541.text = @"LUJNIKI STADIUM";
    drawTextLine0541.fontName = @"HelveticaNeue-Bold";
    drawTextLine0541.fontColor = [UIColor colorWithRed:(194/255.0) green:(169/255.0) blue:(123/255.0) alpha:1];
    drawTextLine0541.fontSize = 10;
    drawTextLine0541.origin = CGPointMake(952, 4422);
    drawTextLine0541.kernSpacing = 1.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0541];

    MWDrawTextLine *drawTextLine0542 = [[MWDrawTextLine alloc] init];
    drawTextLine0542.text = @"VOROBYOVY GORY PARK";
    drawTextLine0542.fontName = @"HelveticaNeue-Bold";
    drawTextLine0542.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0542.fontSize = 10;
    drawTextLine0542.origin = CGPointMake(836, 4689);
    drawTextLine0542.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0542];

    MWDrawTextLine *drawTextLine0543 = [[MWDrawTextLine alloc] init];
    drawTextLine0543.text = @"MAIN BUILDING";
    drawTextLine0543.fontName = @"HelveticaNeue-Bold";
    drawTextLine0543.fontColor = [UIColor colorWithRed:(194/255.0) green:(169/255.0) blue:(123/255.0) alpha:1];
    drawTextLine0543.fontSize = 10;
    drawTextLine0543.origin = CGPointMake(891, 4795);
    drawTextLine0543.kernSpacing = 1.7;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0543];

    MWDrawTextLine *drawTextLine0544 = [[MWDrawTextLine alloc] init];
    drawTextLine0544.text = @"OF MOSCOW";
    drawTextLine0544.fontName = @"HelveticaNeue-Bold";
    drawTextLine0544.fontColor = [UIColor colorWithRed:(194/255.0) green:(169/255.0) blue:(123/255.0) alpha:1];
    drawTextLine0544.fontSize = 10;
    drawTextLine0544.origin = CGPointMake(916, 4808);
    drawTextLine0544.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0544];

    MWDrawTextLine *drawTextLine0545 = [[MWDrawTextLine alloc] init];
    drawTextLine0545.text = @"STATE UNIVERSITY";
    drawTextLine0545.fontName = @"HelveticaNeue-Bold";
    drawTextLine0545.fontColor = [UIColor colorWithRed:(194/255.0) green:(169/255.0) blue:(123/255.0) alpha:1];
    drawTextLine0545.fontSize = 10;
    drawTextLine0545.origin = CGPointMake(881, 4822);
    drawTextLine0545.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0545];

    MWDrawTextLine *drawTextLine0546 = [[MWDrawTextLine alloc] init];
    drawTextLine0546.text = @"50 LET OKTYABRYA PARK";
    drawTextLine0546.fontName = @"HelveticaNeue-Bold";
    drawTextLine0546.fontColor = [UIColor colorWithRed:(118/255.0) green:(172/255.0) blue:(134/255.0) alpha:1];
    drawTextLine0546.fontSize = 10;
    drawTextLine0546.origin = CGPointMake(923, 5019);
    drawTextLine0546.kernSpacing = 0.9;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0546];

    MWDrawTextLine *drawTextLine0547 = [[MWDrawTextLine alloc] init];
    drawTextLine0547.text = @"Ochakovo";
    drawTextLine0547.fontName = @"HelveticaNeue";
    drawTextLine0547.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0547.fontSize = 20;
    drawTextLine0547.origin = CGPointMake(650, 5289);
    drawTextLine0547.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0547];

    MWDrawTextLine *drawTextLine0548 = [[MWDrawTextLine alloc] init];
    drawTextLine0548.text = @"Skolkovo";
    drawTextLine0548.fontName = @"HelveticaNeue";
    drawTextLine0548.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0548.fontSize = 20;
    drawTextLine0548.origin = CGPointMake(660, 5525);
    drawTextLine0548.kernSpacing = 0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0548];

    MWDrawTextLine *drawTextLine0549 = [[MWDrawTextLine alloc] init];
    drawTextLine0549.text = @"Solnechnaya";
    drawTextLine0549.fontName = @"HelveticaNeue";
    drawTextLine0549.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0549.fontSize = 20;
    drawTextLine0549.origin = CGPointMake(626, 5761);
    drawTextLine0549.kernSpacing = 0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0549];

    MWDrawTextLine *drawTextLine0550 = [[MWDrawTextLine alloc] init];
    drawTextLine0550.text = @"Peredelkino";
    drawTextLine0550.fontName = @"HelveticaNeue";
    drawTextLine0550.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0550.fontSize = 20;
    drawTextLine0550.origin = CGPointMake(630, 5997);
    drawTextLine0550.kernSpacing = 0.7;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0550];

    MWDrawTextLine *drawTextLine0551 = [[MWDrawTextLine alloc] init];
    drawTextLine0551.text = @"Michurinets";
    drawTextLine0551.fontName = @"HelveticaNeue";
    drawTextLine0551.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0551.fontSize = 20;
    drawTextLine0551.origin = CGPointMake(633, 6234);
    drawTextLine0551.kernSpacing = 0.7;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0551];

    MWDrawTextLine *drawTextLine0552 = [[MWDrawTextLine alloc] init];
    drawTextLine0552.text = @"Kiyevskoye rail line";
    drawTextLine0552.fontName = @"HelveticaNeue";
    drawTextLine0552.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0552.fontSize = 24;
    drawTextLine0552.origin = CGPointMake(797, 6616);
    drawTextLine0552.kernSpacing = -0.1;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0552];

    MWDrawTextLine *drawTextLine0553 = [[MWDrawTextLine alloc] init];
    drawTextLine0553.text = @"Red";
    drawTextLine0553.fontName = @"HelveticaNeue-Bold";
    drawTextLine0553.fontColor = line0001.color;
    drawTextLine0553.fontSize = 19;
    drawTextLine0553.origin = CGPointMake(97, 6968);
    drawTextLine0553.kernSpacing = -0.1;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0553];

    MWDrawTextLine *drawTextLine0554 = [[MWDrawTextLine alloc] init];
    drawTextLine0554.text = @"Green";
    drawTextLine0554.fontName = @"HelveticaNeue-Bold";
    drawTextLine0554.fontColor = line0002.color;
    drawTextLine0554.fontSize = 19;
    drawTextLine0554.origin = CGPointMake(97, 7061);
    drawTextLine0554.kernSpacing = 0.5;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0554];

    MWDrawTextLine *drawTextLine0555 = [[MWDrawTextLine alloc] init];
    drawTextLine0555.text = @"Blue";
    drawTextLine0555.fontName = @"HelveticaNeue-Bold";
    drawTextLine0555.fontColor = line0003.color;
    drawTextLine0555.fontSize = 19;
    drawTextLine0555.origin = CGPointMake(97, 7155);
    drawTextLine0555.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0555];

    MWDrawTextLine *drawTextLine0556 = [[MWDrawTextLine alloc] init];
    drawTextLine0556.text = @"Light blue";
    drawTextLine0556.fontName = @"HelveticaNeue-Bold";
    drawTextLine0556.fontColor = line0003.color;
    drawTextLine0556.fontSize = 19;
    drawTextLine0556.origin = CGPointMake(97, 7248);
    drawTextLine0556.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0556];

    MWDrawTextLine *drawTextLine0557 = [[MWDrawTextLine alloc] init];
    drawTextLine0557.text = @"Orange";
    drawTextLine0557.fontName = @"HelveticaNeue-Bold";
    drawTextLine0557.fontColor = line0006.color;
    drawTextLine0557.fontSize = 19;
    drawTextLine0557.origin = CGPointMake(97, 7449);
    drawTextLine0557.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0557];

    MWDrawTextLine *drawTextLine0558 = [[MWDrawTextLine alloc] init];
    drawTextLine0558.text = @"Purple";
    drawTextLine0558.fontName = @"HelveticaNeue-Bold";
    drawTextLine0558.fontColor = line0007.color;
    drawTextLine0558.fontSize = 19;
    drawTextLine0558.origin = CGPointMake(906.5, 6967.5);
    drawTextLine0558.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0558];

    MWDrawTextLine *drawTextLine0559 = [[MWDrawTextLine alloc] init];
    drawTextLine0559.text = @"Yellow";
    drawTextLine0559.fontName = @"HelveticaNeue-Bold";
    drawTextLine0559.fontColor = [UIColor blackColor];
    drawTextLine0559.fontSize = 19;
    drawTextLine0559.origin = CGPointMake(906, 7094.5);
    drawTextLine0559.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0559];

    MWDrawTextLine *drawTextLine0560 = [[MWDrawTextLine alloc] init];
    drawTextLine0560.text = @"Yellow";
    drawTextLine0560.fontName = @"HelveticaNeue-Bold";
    drawTextLine0560.fontColor = [UIColor blackColor];
    drawTextLine0560.fontSize = 19;
    drawTextLine0560.origin = CGPointMake(906, 7188);
    drawTextLine0560.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0560];

    MWDrawTextLine *drawTextLine0561 = [[MWDrawTextLine alloc] init];
    drawTextLine0561.text = @"Gray";
    drawTextLine0561.fontName = @"HelveticaNeue-Bold";
    drawTextLine0561.fontColor = line0009.color;
    drawTextLine0561.fontSize = 19;
    drawTextLine0561.origin = CGPointMake(906, 7282);
    drawTextLine0561.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0561];

    MWDrawTextLine *drawTextLine0562 = [[MWDrawTextLine alloc] init];
    drawTextLine0562.text = @"Lime";
    drawTextLine0562.fontName = @"HelveticaNeue-Bold";
    drawTextLine0562.fontColor = line0010.color;
    drawTextLine0562.fontSize = 19;
    drawTextLine0562.origin = CGPointMake(906, 7409);
    drawTextLine0562.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0562];

    MWDrawTextLine *drawTextLine0563 = [[MWDrawTextLine alloc] init];
    drawTextLine0563.text = @"Black";
    drawTextLine0563.fontName = @"HelveticaNeue-Bold";
    drawTextLine0563.fontColor = [UIColor blackColor];
    drawTextLine0563.fontSize = 19;
    drawTextLine0563.origin = CGPointMake(906, 7540);
    drawTextLine0563.kernSpacing = 0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0563];

    MWDrawTextLine *drawTextLine0564 = [[MWDrawTextLine alloc] init];
    drawTextLine0564.text = @"Teal";
    drawTextLine0564.fontName = @"HelveticaNeue-Bold";
    drawTextLine0564.fontColor = line0011.color;
    drawTextLine0564.fontSize = 19;
    drawTextLine0564.origin = CGPointMake(1744, 6967);
    drawTextLine0564.kernSpacing = 0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0564];

    MWDrawTextLine *drawTextLine0565 = [[MWDrawTextLine alloc] init];
    drawTextLine0565.text = @"Gray-blue";
    drawTextLine0565.fontName = @"HelveticaNeue-Bold";
    drawTextLine0565.fontColor = line0012.color;
    drawTextLine0565.fontSize = 19;
    drawTextLine0565.origin = CGPointMake(1744, 7061);
    drawTextLine0565.kernSpacing = 0.3;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0565];

    MWDrawTextLine *drawTextLine0566 = [[MWDrawTextLine alloc] init];
    drawTextLine0566.text = @"Sokolnicheskaya";
    drawTextLine0566.fontName = @"HelveticaNeue";
    drawTextLine0566.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0566.fontSize = 29;
    drawTextLine0566.origin = CGPointMake(269, 6952);
    drawTextLine0566.kernSpacing = 0.5;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0566];

    MWDrawTextLine *drawTextLine0567 = [[MWDrawTextLine alloc] init];
    drawTextLine0567.text = @"Zamoskvoretskaya";
    drawTextLine0567.fontName = @"HelveticaNeue";
    drawTextLine0567.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0567.fontSize = 29;
    drawTextLine0567.origin = CGPointMake(269, 7046);
    drawTextLine0567.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0567];

    MWDrawTextLine *drawTextLine0568 = [[MWDrawTextLine alloc] init];
    drawTextLine0568.text = @"Arbatsko-Pokrovskaya";
    drawTextLine0568.fontName = @"HelveticaNeue";
    drawTextLine0568.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0568.fontSize = 29;
    drawTextLine0568.origin = CGPointMake(268, 7139);
    drawTextLine0568.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0568];

    MWDrawTextLine *drawTextLine0569 = [[MWDrawTextLine alloc] init];
    drawTextLine0569.text = @"Filyovskaya";
    drawTextLine0569.fontName = @"HelveticaNeue";
    drawTextLine0569.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0569.fontSize = 29;
    drawTextLine0569.origin = CGPointMake(268, 7232);
    drawTextLine0569.kernSpacing = 0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0569];

    MWDrawTextLine *drawTextLine0570 = [[MWDrawTextLine alloc] init];
    drawTextLine0570.text = @"Koltsevaya (circle line)";
    drawTextLine0570.fontName = @"HelveticaNeue";
    drawTextLine0570.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0570.fontSize = 29;
    drawTextLine0570.origin = CGPointMake(268, 7326);
    drawTextLine0570.kernSpacing = 0.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0570];

    MWDrawTextLine *drawTextLine0571 = [[MWDrawTextLine alloc] init];
    drawTextLine0571.text = @"Kalujsko-Rijskaya";
    drawTextLine0571.fontName = @"HelveticaNeue";
    drawTextLine0571.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0571.fontSize = 29;
    drawTextLine0571.origin = CGPointMake(269, 7420);
    drawTextLine0571.kernSpacing = 0.7;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0571];

    MWDrawTextLine *drawTextLine0572 = [[MWDrawTextLine alloc] init];
    drawTextLine0572.text = @"Tagansko-Krasnopresnenskaya";
    drawTextLine0572.fontName = @"HelveticaNeue";
    drawTextLine0572.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0572.fontSize = 29;
    drawTextLine0572.origin = CGPointMake(1078, 6986);
    drawTextLine0572.kernSpacing = 0.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0572];

    MWDrawTextLine *drawTextLine0573 = [[MWDrawTextLine alloc] init];
    drawTextLine0573.text = @"Kalininskaya";
    drawTextLine0573.fontName = @"HelveticaNeue";
    drawTextLine0573.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0573.fontSize = 29;
    drawTextLine0573.origin = CGPointMake(1078, 7080);
    drawTextLine0573.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0573];

    MWDrawTextLine *drawTextLine0574 = [[MWDrawTextLine alloc] init];
    drawTextLine0574.text = @"Solntsevskaya";
    drawTextLine0574.fontName = @"HelveticaNeue";
    drawTextLine0574.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0574.fontSize = 29;
    drawTextLine0574.origin = CGPointMake(1078, 7173);
    drawTextLine0574.kernSpacing = 0.3;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0574];

    MWDrawTextLine *drawTextLine0575 = [[MWDrawTextLine alloc] init];
    drawTextLine0575.text = @"Serpukhovsko-Timiryazevskaya";
    drawTextLine0575.fontName = @"HelveticaNeue";
    drawTextLine0575.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0575.fontSize = 29;
    drawTextLine0575.origin = CGPointMake(1078, 7300.5);
    drawTextLine0575.kernSpacing = 0.65;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0575];

    MWDrawTextLine *drawTextLine0576 = [[MWDrawTextLine alloc] init];
    drawTextLine0576.text = @"Lyublinsko-Dmitrovskaya";
    drawTextLine0576.fontName = @"HelveticaNeue";
    drawTextLine0576.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0576.fontSize = 29;
    drawTextLine0576.origin = CGPointMake(1078, 7428);
    drawTextLine0576.kernSpacing = 0.9;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0576];

    MWDrawTextLine *drawTextLine0577 = [[MWDrawTextLine alloc] init];
    drawTextLine0577.text = @"Third TransferContour";
    drawTextLine0577.fontName = @"HelveticaNeue";
    drawTextLine0577.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0577.fontSize = 29;
    drawTextLine0577.origin = CGPointMake(1078, 7555);
    drawTextLine0577.kernSpacing = 1.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0577];

    MWDrawTextLine *drawTextLine0578 = [[MWDrawTextLine alloc] init];
    drawTextLine0578.text = @"Kakhovskaya";
    drawTextLine0578.fontName = @"HelveticaNeue";
    drawTextLine0578.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0578.fontSize = 29;
    drawTextLine0578.origin = CGPointMake(1917, 6952);
    drawTextLine0578.kernSpacing = 0.5;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0578];

    MWDrawTextLine *drawTextLine0579 = [[MWDrawTextLine alloc] init];
    drawTextLine0579.text = @"Butovskaya";
    drawTextLine0579.fontName = @"HelveticaNeue";
    drawTextLine0579.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0579.fontSize = 29;
    drawTextLine0579.origin = CGPointMake(1917, 7046);
    drawTextLine0579.kernSpacing = 0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0579];

    MWDrawTextLine *drawTextLine0580 = [[MWDrawTextLine alloc] init];
    drawTextLine0580.text = @"Timiryazevskaya-";
    drawTextLine0580.fontName = @"HelveticaNeue";
    drawTextLine0580.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0580.fontSize = 29;
    drawTextLine0580.origin = CGPointMake(1916, 7207);
    drawTextLine0580.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0580];

    MWDrawTextLine *drawTextLine0581 = [[MWDrawTextLine alloc] init];
    drawTextLine0581.text = @"Ulitsa Sergeya Eizenshteina";
    drawTextLine0581.fontName = @"HelveticaNeue";
    drawTextLine0581.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0581.fontSize = 29;
    drawTextLine0581.origin = CGPointMake(1916, 7236);
    drawTextLine0581.kernSpacing = 0.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0581];

    MWDrawTextLine *drawTextLine0582 = [[MWDrawTextLine alloc] init];
    drawTextLine0582.text = @"(monorail)";
    drawTextLine0582.fontName = @"HelveticaNeue";
    drawTextLine0582.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0582.fontSize = 29;
    drawTextLine0582.origin = CGPointMake(1916, 7266);
    drawTextLine0582.kernSpacing = 1.5;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0582];

    MWDrawTextLine *drawTextLine0583 = [[MWDrawTextLine alloc] init];
    drawTextLine0583.text = @"Moscow Central Circle";
    drawTextLine0583.fontName = @"HelveticaNeue";
    drawTextLine0583.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0583.fontSize = 29;
    drawTextLine0583.origin = CGPointMake(1916, 7393);
    drawTextLine0583.kernSpacing = 0.7;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0583];

    MWDrawTextLine *drawTextLine0584 = [[MWDrawTextLine alloc] init];
    drawTextLine0584.text = @"Under construction";
    drawTextLine0584.fontName = @"HelveticaNeue";
    drawTextLine0584.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0584.fontSize = 29;
    drawTextLine0584.origin = CGPointMake(1916, 7487);
    drawTextLine0584.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0584];

    MWDrawTextLine *drawTextLine0585 = [[MWDrawTextLine alloc] init];
    drawTextLine0585.text = @"12 min";
    drawTextLine0585.fontName = @"HelveticaNeue";
    drawTextLine0585.fontColor = [UIColor colorWithRed:(123/255.0) green:(138/255.0) blue:(129/255.0) alpha:1];
    drawTextLine0585.fontSize = 26;
    drawTextLine0585.origin = CGPointMake(2495, 7268);
    drawTextLine0585.kernSpacing = 0.5;
    [vertex0056.drawPrimitives addObject:drawTextLine0585];

    MWDrawTextLine *drawTextLine0586 = [[MWDrawTextLine alloc] init];
    drawTextLine0586.text = @"Transfer stations";
    drawTextLine0586.fontName = @"HelveticaNeue";
    drawTextLine0586.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0586.fontSize = 29;
    drawTextLine0586.origin = CGPointMake(2649, 6952);
    drawTextLine0586.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0586];

    MWDrawTextLine *drawTextLine0587 = [[MWDrawTextLine alloc] init];
    drawTextLine0587.text = @"Cross-platform transfers";
    drawTextLine0587.fontName = @"HelveticaNeue";
    drawTextLine0587.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0587.fontSize = 29;
    drawTextLine0587.origin = CGPointMake(2649, 7080);
    drawTextLine0587.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0587];

    MWDrawTextLine *drawTextLine0588 = [[MWDrawTextLine alloc] init];
    drawTextLine0588.text = @"Ground transfers";
    drawTextLine0588.fontName = @"HelveticaNeue";
    drawTextLine0588.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0588.fontSize = 29;
    drawTextLine0588.origin = CGPointMake(2649, 7173);
    drawTextLine0588.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0588];

    MWDrawTextLine *drawTextLine0589 = [[MWDrawTextLine alloc] init];
    drawTextLine0589.text = @"Transfer time";
    drawTextLine0589.fontName = @"HelveticaNeue";
    drawTextLine0589.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0589.fontSize = 29;
    drawTextLine0589.origin = CGPointMake(2649, 7267);
    drawTextLine0589.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0589];

    MWDrawTextLine *drawTextLine0590 = [[MWDrawTextLine alloc] init];
    drawTextLine0590.text = @"Covered transfers between";
    drawTextLine0590.fontName = @"HelveticaNeue";
    drawTextLine0590.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0590.fontSize = 29;
    drawTextLine0590.origin = CGPointMake(2649, 7432.5);
    drawTextLine0590.kernSpacing = 0.9;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0590];

    MWDrawTextLine *drawTextLine0591 = [[MWDrawTextLine alloc] init];
    drawTextLine0591.text = @"Metro and MCC stations";
    drawTextLine0591.fontName = @"HelveticaNeue";
    drawTextLine0591.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0591.fontSize = 29;
    drawTextLine0591.origin = CGPointMake(2649, 7462);
    drawTextLine0591.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0591];
    
    MWDrawTextLine *drawTextLine0592 = [[MWDrawTextLine alloc] init];
    drawTextLine0592.text = @"Park and ride";
    drawTextLine0592.fontName = @"HelveticaNeue";
    drawTextLine0592.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0592.fontSize = 29;
    drawTextLine0592.origin = CGPointMake(3382, 6986);
    drawTextLine0592.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0592];

    MWDrawTextLine *drawTextLine0593 = [[MWDrawTextLine alloc] init];
    drawTextLine0593.text = @"Wheelchair-accessible stations";
    drawTextLine0593.fontName = @"HelveticaNeue";
    drawTextLine0593.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0593.fontSize = 29;
    drawTextLine0593.origin = CGPointMake(3383, 7147);
    drawTextLine0593.kernSpacing = 0.9;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0593];

    MWDrawTextLine *drawTextLine0594 = [[MWDrawTextLine alloc] init];
    drawTextLine0594.text = @"Airports";
    drawTextLine0594.fontName = @"HelveticaNeue";
    drawTextLine0594.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0594.fontSize = 29;
    drawTextLine0594.origin = CGPointMake(3382, 7240);
    drawTextLine0594.kernSpacing = 1.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0594];

    MWDrawTextLine *drawTextLine0595 = [[MWDrawTextLine alloc] init];
    drawTextLine0595.text = @"Bus terminals and stations";
    drawTextLine0595.fontName = @"HelveticaNeue";
    drawTextLine0595.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0595.fontSize = 29;
    drawTextLine0595.origin = CGPointMake(4143, 6986);
    drawTextLine0595.kernSpacing = 0.5;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0595];

    MWDrawTextLine *drawTextLine0596 = [[MWDrawTextLine alloc] init];
    drawTextLine0596.text = @"Bus transportation to airports";
    drawTextLine0596.fontName = @"HelveticaNeue";
    drawTextLine0596.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0596.fontSize = 29;
    drawTextLine0596.origin = CGPointMake(4143, 7113);
    drawTextLine0596.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0596];

    MWDrawTextLine *drawTextLine0597 = [[MWDrawTextLine alloc] init];
    drawTextLine0597.text = @"Aeroexpress trains to airports";
    drawTextLine0597.fontName = @"HelveticaNeue";
    drawTextLine0597.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0597.fontSize = 29;
    drawTextLine0597.origin = CGPointMake(4144, 7207);
    drawTextLine0597.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0597];

    MWDrawTextLine *drawTextLine0598 = [[MWDrawTextLine alloc] init];
    drawTextLine0598.text = @"Rail terminals";
    drawTextLine0598.fontName = @"HelveticaNeue";
    drawTextLine0598.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0598.fontSize = 29;
    drawTextLine0598.origin = CGPointMake(4143, 7300);
    drawTextLine0598.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0598];

    MWDrawTextLine *drawTextLine0599 = [[MWDrawTextLine alloc] init];
    drawTextLine0599.text = @"Railway stations";
    drawTextLine0599.fontName = @"HelveticaNeue";
    drawTextLine0599.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0599.fontSize = 29;
    drawTextLine0599.origin = CGPointMake(4143, 7428);
    drawTextLine0599.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0599];

    MWDrawTextLine *drawTextLine0600 = [[MWDrawTextLine alloc] init];
    drawTextLine0600.text = @"MCC stations";
    drawTextLine0600.fontName = @"HelveticaNeue";
    drawTextLine0600.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0600.fontSize = 29;
    drawTextLine0600.origin = CGPointMake(4143, 7522);
    drawTextLine0600.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0600];

    MWDrawTextLine *drawTextLine0601 = [[MWDrawTextLine alloc] init];
    drawTextLine0601.text = @"Yujnye Vorota bus terminal";
    drawTextLine0601.fontName = @"HelveticaNeue";
    drawTextLine0601.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0601.fontSize = 24;
    drawTextLine0601.origin = CGPointMake(4288, 6428);
    drawTextLine0601.kernSpacing = 0.5;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0601];

    MWDrawTextLine *drawTextLine0602 = [[MWDrawTextLine alloc] init];
    drawTextLine0602.text = @"Jukovsky airport";
    drawTextLine0602.fontName = @"HelveticaNeue";
    drawTextLine0602.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0602.fontSize = 24;
    drawTextLine0602.origin = CGPointMake(4515, 6086);
    drawTextLine0602.kernSpacing = 2.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0602];

    MWDrawTextLine *drawTextLine0603 = [[MWDrawTextLine alloc] init];
    drawTextLine0603.text = @"Paveletskoye rail line";
    drawTextLine0603.fontName = @"HelveticaNeue";
    drawTextLine0603.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0603.fontSize = 24;
    drawTextLine0603.origin = CGPointMake(3245, 6616);
    drawTextLine0603.kernSpacing = -0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0603];

    MWDrawTextLine *drawTextLine0604 = [[MWDrawTextLine alloc] init];
    drawTextLine0604.text = @"Domodedovo airport";
    drawTextLine0604.fontName = @"HelveticaNeue";
    drawTextLine0604.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0604.fontSize = 24;
    drawTextLine0604.origin = CGPointMake(3596, 6403);
    drawTextLine0604.kernSpacing = 2.35;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0604];

    MWDrawTextLine *drawTextLine0605 = [[MWDrawTextLine alloc] init];
    drawTextLine0605.text = @"Birulyovo-Passajirskoye";
    drawTextLine0605.fontName = @"HelveticaNeue";
    drawTextLine0605.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0605.fontSize = 21;
    drawTextLine0605.origin = CGPointMake(2834.5, 6605);
    drawTextLine0605.kernSpacing = -0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0605];

    MWDrawTextLine *drawTextLine0606 = [[MWDrawTextLine alloc] init];
    drawTextLine0606.text = @"Birulyovo-Tovarnoye";
    drawTextLine0606.fontName = @"HelveticaNeue";
    drawTextLine0606.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0606.fontSize = 21;
    drawTextLine0606.origin = CGPointMake(2764, 6503);
    drawTextLine0606.kernSpacing = -0.3;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0606];

    MWDrawTextLine *drawTextLine0607 = [[MWDrawTextLine alloc] init];
    drawTextLine0607.text = @"Kurskoye rail line";
    drawTextLine0607.fontName = @"HelveticaNeue";
    drawTextLine0607.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0607.fontSize = 24;
    drawTextLine0607.origin = CGPointMake(2218.5, 6617.5);
    drawTextLine0607.kernSpacing = -0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0607];

    MWDrawTextLine *drawTextLine0608 = [[MWDrawTextLine alloc] init];
    drawTextLine0608.text = @"Butovo";
    drawTextLine0608.fontName = @"HelveticaNeue";
    drawTextLine0608.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0608.fontSize = 21;
    drawTextLine0608.origin = CGPointMake(2526.5, 6637.5);
    drawTextLine0608.kernSpacing = -0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0608];

    MWDrawTextLine *drawTextLine0609 = [[MWDrawTextLine alloc] init];
    drawTextLine0609.text = @"Bitsa";
    drawTextLine0609.fontName = @"HelveticaNeue";
    drawTextLine0609.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0609.fontSize = 21;
    drawTextLine0609.origin = CGPointMake(2631, 6531);
    drawTextLine0609.kernSpacing = -0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0609];

    MWDrawTextLine *drawTextLine0610 = [[MWDrawTextLine alloc] init];
    drawTextLine0610.text = @"Krasny Stroitel";
    drawTextLine0610.fontName = @"HelveticaNeue";
    drawTextLine0610.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0610.fontSize = 21;
    drawTextLine0610.origin = CGPointMake(2614, 6238);
    drawTextLine0610.kernSpacing = -0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0610];

    MWDrawTextLine *drawTextLine0611 = [[MWDrawTextLine alloc] init];
    drawTextLine0611.text = @"Pokrovskaya";
    drawTextLine0611.fontName = @"HelveticaNeue";
    drawTextLine0611.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0611.fontSize = 21;
    drawTextLine0611.origin = CGPointMake(2633, 5858);
    drawTextLine0611.kernSpacing = -0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0611];

    MWDrawTextLine *drawTextLine0612 = [[MWDrawTextLine alloc] init];
    drawTextLine0612.text = @"Chertanovo";
    drawTextLine0612.fontName = @"HelveticaNeue";
    drawTextLine0612.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0612.fontSize = 21;
    drawTextLine0612.origin = CGPointMake(2682, 5691);
    drawTextLine0612.kernSpacing = -0.3;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0612];

    MWDrawTextLine *drawTextLine0613 = [[MWDrawTextLine alloc] init];
    drawTextLine0613.text = @"Kolomenskoye";
    drawTextLine0613.fontName = @"HelveticaNeue";
    drawTextLine0613.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0613.fontSize = 21;
    drawTextLine0613.origin = CGPointMake(2449, 5591);
    drawTextLine0613.kernSpacing = -0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0613];

    MWDrawTextLine *drawTextLine0614 = [[MWDrawTextLine alloc] init];
    drawTextLine0614.text = @"Nijniye Kotly";
    drawTextLine0614.fontName = @"HelveticaNeue";
    drawTextLine0614.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0614.fontSize = 21;
    drawTextLine0614.origin = CGPointMake(2133, 5141.5);
    drawTextLine0614.kernSpacing = -0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0614];

    MWDrawTextLine *drawTextLine0615 = [[MWDrawTextLine alloc] init];
    drawTextLine0615.text = @"ZIL";
    drawTextLine0615.fontName = @"HelveticaNeue";
    drawTextLine0615.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0615.fontSize = 21;
    drawTextLine0615.origin = CGPointMake(2214, 4642);
    drawTextLine0615.kernSpacing = 2.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0615];

    MWDrawTextLine *drawTextLine0616 = [[MWDrawTextLine alloc] init];
    drawTextLine0616.text = @"Moskva-Tovarnaya";
    drawTextLine0616.fontName = @"HelveticaNeue";
    drawTextLine0616.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0616.fontSize = 21;
    drawTextLine0616.origin = CGPointMake(2513, 4483);
    drawTextLine0616.kernSpacing = -0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0616];

    MWDrawTextLine *drawTextLine0617 = [[MWDrawTextLine alloc] init];
    drawTextLine0617.text = @"Paveletsky rail terminal,";
    drawTextLine0617.fontName = @"HelveticaNeue";
    drawTextLine0617.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0617.fontSize = 21;
    drawTextLine0617.origin = CGPointMake(3021, 4253.5);
    drawTextLine0617.kernSpacing = 1.7;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0617];

    MWDrawTextLine *drawTextLine0618 = [[MWDrawTextLine alloc] init];
    drawTextLine0618.text = @"Aeroexpress train to DME airport";
    drawTextLine0618.fontName = @"HelveticaNeue";
    drawTextLine0618.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0618.fontSize = 21;
    drawTextLine0618.origin = CGPointMake(3021, 4278.5);
    drawTextLine0618.kernSpacing = 2.1;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0618];

    MWDrawTextLine *drawTextLine0619 = [[MWDrawTextLine alloc] init];
    drawTextLine0619.text = @"Moskvorechye";
    drawTextLine0619.fontName = @"HelveticaNeue";
    drawTextLine0619.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0619.fontSize = 21;
    drawTextLine0619.origin = CGPointMake(3126, 5472);
    drawTextLine0619.kernSpacing = -0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0619];

    MWDrawTextLine *drawTextLine0620 = [[MWDrawTextLine alloc] init];
    drawTextLine0620.text = @"Pererva";
    drawTextLine0620.fontName = @"HelveticaNeue";
    drawTextLine0620.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0620.fontSize = 21;
    drawTextLine0620.origin = CGPointMake(3341.5, 5257.5);
    drawTextLine0620.kernSpacing = -0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0620];

    MWDrawTextLine *drawTextLine0621 = [[MWDrawTextLine alloc] init];
    drawTextLine0621.text = @"Depo";
    drawTextLine0621.fontName = @"HelveticaNeue";
    drawTextLine0621.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0621.fontSize = 21;
    drawTextLine0621.origin = CGPointMake(3410, 5191);
    drawTextLine0621.kernSpacing = -0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0621];

    MWDrawTextLine *drawTextLine0622 = [[MWDrawTextLine alloc] init];
    drawTextLine0622.text = @"Lyublino";
    drawTextLine0622.fontName = @"HelveticaNeue";
    drawTextLine0622.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0622.fontSize = 21;
    drawTextLine0622.origin = CGPointMake(3357, 5025);
    drawTextLine0622.kernSpacing = -0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0622];

    MWDrawTextLine *drawTextLine0623 = [[MWDrawTextLine alloc] init];
    drawTextLine0623.text = @"Kalitniki";
    drawTextLine0623.fontName = @"HelveticaNeue";
    drawTextLine0623.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0623.fontSize = 21;
    drawTextLine0623.origin = CGPointMake(3979.5, 3659.5);
    drawTextLine0623.kernSpacing = 0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0623];

    MWDrawTextLine *drawTextLine0624 = [[MWDrawTextLine alloc] init];
    drawTextLine0624.text = @"Moskva-";
    drawTextLine0624.fontName = @"HelveticaNeue";
    drawTextLine0624.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0624.fontSize = 21;
    drawTextLine0624.origin = CGPointMake(3604, 3509);
    drawTextLine0624.kernSpacing = 0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0624];

    MWDrawTextLine *drawTextLine0625 = [[MWDrawTextLine alloc] init];
    drawTextLine0625.text = @"Tovarnaya";
    drawTextLine0625.fontName = @"HelveticaNeue";
    drawTextLine0625.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0625.fontSize = 21;
    drawTextLine0625.origin = CGPointMake(3593, 3530);
    drawTextLine0625.kernSpacing = -0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0625];

    MWDrawTextLine *drawTextLine0626 = [[MWDrawTextLine alloc] init];
    drawTextLine0626.text = @"Moskva-Kalanchyovskaya";
    drawTextLine0626.fontName = @"HelveticaNeue";
    drawTextLine0626.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0626.fontSize = 21;
    drawTextLine0626.origin = CGPointMake(3041, 2331);
    drawTextLine0626.kernSpacing = -0.3;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0626];

    MWDrawTextLine *drawTextLine0627 = [[MWDrawTextLine alloc] init];
    drawTextLine0627.text = @"Rjevskaya";
    drawTextLine0627.fontName = @"HelveticaNeue";
    drawTextLine0627.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0627.fontSize = 21;
    drawTextLine0627.origin = CGPointMake(3018, 2212);
    drawTextLine0627.kernSpacing = -0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0627];

    MWDrawTextLine *drawTextLine0628 = [[MWDrawTextLine alloc] init];
    drawTextLine0628.text = @"Rijsky rail terminal";
    drawTextLine0628.fontName = @"HelveticaNeue";
    drawTextLine0628.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0628.fontSize = 22;
    drawTextLine0628.origin = CGPointMake(3100.5, 2145);
    drawTextLine0628.kernSpacing = 1.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0628];

    MWDrawTextLine *drawTextLine0629 = [[MWDrawTextLine alloc] init];
    drawTextLine0629.text = @"Stankolit";
    drawTextLine0629.fontName = @"HelveticaNeue";
    drawTextLine0629.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0629.fontSize = 21;
    drawTextLine0629.origin = CGPointMake(2294, 2141);
    drawTextLine0629.kernSpacing = -0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0629];

    MWDrawTextLine *drawTextLine0630 = [[MWDrawTextLine alloc] init];
    drawTextLine0630.text = @"Savyolovsky rail terminal";
    drawTextLine0630.fontName = @"HelveticaNeue";
    drawTextLine0630.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0630.fontSize = 22;
    drawTextLine0630.origin = CGPointMake(1596, 2216.5);
    drawTextLine0630.kernSpacing = 1.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0630];

    MWDrawTextLine *drawTextLine0631 = [[MWDrawTextLine alloc] init];
    drawTextLine0631.text = @"Belorussky rail terminal,";
    drawTextLine0631.fontName = @"HelveticaNeue";
    drawTextLine0631.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0631.fontSize = 22;
    drawTextLine0631.origin = CGPointMake(1304.5, 2769.5);
    drawTextLine0631.kernSpacing = 1.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0631];

    MWDrawTextLine *drawTextLine0632 = [[MWDrawTextLine alloc] init];
    drawTextLine0632.text = @"Aeroexpress train t0 SVO airport";
    drawTextLine0632.fontName = @"HelveticaNeue";
    drawTextLine0632.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0632.fontSize = 22;
    drawTextLine0632.origin = CGPointMake(1198, 2795);
    drawTextLine0632.kernSpacing = 1.55;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0632];

    MWDrawTextLine *drawTextLine0633 = [[MWDrawTextLine alloc] init];
    drawTextLine0633.text = @"Kazanskoye rail line";
    drawTextLine0633.fontName = @"HelveticaNeue";
    drawTextLine0633.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0633.fontSize = 22;
    drawTextLine0633.origin = CGPointMake(4689, 5305);
    drawTextLine0633.kernSpacing = 0.8;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0633];

    MWDrawTextLine *drawTextLine0634 = [[MWDrawTextLine alloc] init];
    drawTextLine0634.text = @"Vikhino";
    drawTextLine0634.fontName = @"HelveticaNeue";
    drawTextLine0634.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0634.fontSize = 21;
    drawTextLine0634.origin = CGPointMake(3991, 5057);
    drawTextLine0634.kernSpacing = 0.6;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0634];

    MWDrawTextLine *drawTextLine0635 = [[MWDrawTextLine alloc] init];
    drawTextLine0635.text = @"Pluschevo";
    drawTextLine0635.fontName = @"HelveticaNeue";
    drawTextLine0635.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0635.fontSize = 21;
    drawTextLine0635.origin = CGPointMake(4657, 3764);
    drawTextLine0635.kernSpacing = -0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0635];

    MWDrawTextLine *drawTextLine0636 = [[MWDrawTextLine alloc] init];
    drawTextLine0636.text = @"Chukhlinka";
    drawTextLine0636.fontName = @"HelveticaNeue";
    drawTextLine0636.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0636.fontSize = 21;
    drawTextLine0636.origin = CGPointMake(4614, 3584);
    drawTextLine0636.kernSpacing = -0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0636];

    MWDrawTextLine *drawTextLine0637 = [[MWDrawTextLine alloc] init];
    drawTextLine0637.text = @"Frezer";
    drawTextLine0637.fontName = @"HelveticaNeue";
    drawTextLine0637.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0637.fontSize = 21;
    drawTextLine0637.origin = CGPointMake(4360, 3531);
    drawTextLine0637.kernSpacing = 0.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0637];

    MWDrawTextLine *drawTextLine0638 = [[MWDrawTextLine alloc] init];
    drawTextLine0638.text = @"Novaya";
    drawTextLine0638.fontName = @"HelveticaNeue";
    drawTextLine0638.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0638.fontSize = 21;
    drawTextLine0638.origin = CGPointMake(3903, 3295.5);
    drawTextLine0638.kernSpacing = -0.4;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0638];

    MWDrawTextLine *drawTextLine0639 = [[MWDrawTextLine alloc] init];
    drawTextLine0639.text = @"Sortirovochnaya";
    drawTextLine0639.fontName = @"HelveticaNeue";
    drawTextLine0639.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0639.fontSize = 21;
    drawTextLine0639.origin = CGPointMake(3893, 3105.5);
    drawTextLine0639.kernSpacing = -0.15;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0639];

    MWDrawTextLine *drawTextLine0640 = [[MWDrawTextLine alloc] init];
    drawTextLine0640.text = @"Leningradsky,";
    drawTextLine0640.fontName = @"HelveticaNeue";
    drawTextLine0640.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0640.fontSize = 22;
    drawTextLine0640.origin = CGPointMake(3493, 2703.5);
    drawTextLine0640.kernSpacing = 1.55;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0640];

    MWDrawTextLine *drawTextLine0641 = [[MWDrawTextLine alloc] init];
    drawTextLine0641.text = @"Yaroslavsky";
    drawTextLine0641.fontName = @"HelveticaNeue";
    drawTextLine0641.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0641.fontSize = 22;
    drawTextLine0641.origin = CGPointMake(3506, 2729);
    drawTextLine0641.kernSpacing = 1.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0641];

    MWDrawTextLine *drawTextLine0642 = [[MWDrawTextLine alloc] init];
    drawTextLine0642.text = @"and Kazansky";
    drawTextLine0642.fontName = @"HelveticaNeue";
    drawTextLine0642.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0642.fontSize = 22;
    drawTextLine0642.origin = CGPointMake(3519.5, 2754);
    drawTextLine0642.kernSpacing = 1.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0642];

    MWDrawTextLine *drawTextLine0643 = [[MWDrawTextLine alloc] init];
    drawTextLine0643.text = @"rail terminals";
    drawTextLine0643.fontName = @"HelveticaNeue";
    drawTextLine0643.fontColor = [UIColor colorWithRed:(149/255.0) green:(163/255.0) blue:(171/255.0) alpha:1];
    drawTextLine0643.fontSize = 22;
    drawTextLine0643.origin = CGPointMake(3534, 2779);
    drawTextLine0643.kernSpacing = 1.2;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0643];

    MWDrawTextLine *drawTextLine0644 = [[MWDrawTextLine alloc] init];
    drawTextLine0644.text = @"Yaroslavskoye rail line";
    drawTextLine0644.fontName = @"HelveticaNeue";
    drawTextLine0644.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0644.fontSize = 22;
    drawTextLine0644.origin = CGPointMake(3484, 701);
    drawTextLine0644.kernSpacing = 0.7;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0644];

    MWDrawTextLine *drawTextLine0645 = [[MWDrawTextLine alloc] init];
    drawTextLine0645.text = @"Los";
    drawTextLine0645.fontName = @"HelveticaNeue";
    drawTextLine0645.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0645.fontSize = 21;
    drawTextLine0645.origin = CGPointMake(3478.5, 899);
    drawTextLine0645.kernSpacing = 0.0;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0645];

    MWDrawTextLine *drawTextLine0646 = [[MWDrawTextLine alloc] init];
    drawTextLine0646.text = @"Losinoostrovskaya";
    drawTextLine0646.fontName = @"HelveticaNeue";
    drawTextLine0646.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0646.fontSize = 21;
    drawTextLine0646.origin = CGPointMake(3478.5, 1115.5);
    drawTextLine0646.kernSpacing = -0.3;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0646];

    MWDrawTextLine *drawTextLine0647 = [[MWDrawTextLine alloc] init];
    drawTextLine0647.text = @"Severyanin";
    drawTextLine0647.fontName = @"HelveticaNeue";
    drawTextLine0647.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0647.fontSize = 21;
    drawTextLine0647.origin = CGPointMake(3447, 1593.5);
    drawTextLine0647.kernSpacing = -0.1;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0647];

    MWDrawTextLine *drawTextLine0648 = [[MWDrawTextLine alloc] init];
    drawTextLine0648.text = @"Yauza";
    drawTextLine0648.fontName = @"HelveticaNeue";
    drawTextLine0648.fontColor = [UIColor colorWithRed:(192/255.0) green:(191/255.0) blue:(192/255.0) alpha:1];
    drawTextLine0648.fontSize = 21;
    drawTextLine0648.origin = CGPointMake(3360, 1897);
    drawTextLine0648.kernSpacing = -0.1;
    [self.additionalEnglishTextPrimitives addObject:drawTextLine0648];

    return self;
}
@end
